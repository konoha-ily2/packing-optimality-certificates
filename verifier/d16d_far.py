# D16 §14 stage 1 (generalised): checker of the far-region boxes (exact arithmetic, acceptance by integers only). d16c_far.py with the problem as an argument.
# 2026-11-12, written by Claude. Arguments and code were written by Claude with no third-party review; this is not a formal proof.
#
# SO(3) is covered by 4 quaternion charts; each box is closed by one of the following (the piece is pre-rotated so that R* = I).
#  L: chart 0 with |x|,|y|,|z| ≤ RHO0 (handled by the local lemma, d16d_local.py).
#  D (discard): for a symmetry pair (g, k) (g a container symmetry, k a piece symmetry fixing the piece face n0, det g·det k = 1), on the whole box
#     tr(gRk) > tr(R). φ is constant on orbits, so only the point of maximal tr in each orbit is needed, and that point is not in a D box.
#  A (accept): with multipliers λ_f ≥ 0 (all container faces, Σλ = 1), μ ≥ 0 and a vertex v_f per face, any solution (t, S) with S < S* has
#     S ≥ Σλ_f n_f·R v_f + μ D0 + E·t, E = Σλ_f n_f + μ R n0, and t ∈ T·P (P = {n_f·x ≤ 1}, check_T), so
#     E·t ≥ min_w T E·w (w over the vertices of P). If "Σλ_f n_f·Rq v_f + N(μD0 − S̄) + T(Σλ_f n_f·w)N + Tμ(Rq n0)·w ≥ 0" (multiplied by N)
#     holds on the box for every w, then S ≥ S̄ ≥ S*, a contradiction. On an accepted box φ ≥ S̄ > S*.
#
# Usage:
#   python d16d_far.py run <problem> [--name name] [--T fraction] [--wmin-exp 30]
#   python d16d_far.py replay <problem> [--name name]   re-check from the record only (no LP, no floating point) and rebuild the coverage tree
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import linprog
import d16d_common as C
from d16d_common import need, DEN, QD

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

QLAM = 2 ** 24
P = None
_PAIR_POLY = {}


def setup(name):
    global P
    if P is None or P.name != name:
        P = C.load(name)
        _PAIR_POLY.clear()
    return P


# ---------- floating point (candidates only) ----------
def lp_f(R, scale=1.0):
    """LP for φ(R) (floating point). Returns (value, λ[NF], μ, vertex[NF])."""
    H = P.NCF @ R @ P.VF.T                            # (face, vertex)
    h = scale * H.max(axis=1)
    nf = P.NF
    A = np.zeros((nf + 1, 4)); b = np.zeros(nf + 1)
    A[:nf, :3] = P.NCF; A[:nf, 3] = -1; b[:nf] = -h
    A[nf, :3] = R @ P.N0F; b[nf] = -scale * P.D0F
    r = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs")
    if r.status != 0:
        return None
    m = -r.ineqlin.marginals
    return r.fun, m[:nf], m[nf], [int(v) for v in H.argmax(axis=1)]


def round_mult(lam, mu):
    nf = len(lam)
    L = [max(0, int(round(float(v) * QLAM))) for v in lam]
    s = sum(L)
    if s == 0:
        L = [QLAM // nf] * nf; s = sum(L)
    L = [v * QLAM // s for v in L]
    k = max(range(nf), key=lambda i: L[i]); L[k] += QLAM - sum(L)
    return L, max(0, int(round(float(mu) * QLAM)))


# ---------- exact decision ----------
def pair_poly(ch, m):
    key = (ch, m)
    if key not in _PAIR_POLY:
        M = P.PAIR_M[m]
        _PAIR_POLY[key] = C.lin_rq(P.chart(ch)["Rq"], [[M[i][j] - (1 if i == j else 0) for j in range(3)] for i in range(3)])
    return _PAIR_POLY[key]


def check_discard(ch, lo, hi, m):
    need(m in P.NONID, "the pair must not be the identity")
    A, B, den = pair_poly(ch, m)
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    return C.lower_bound_qd(C.shift(A, Cc, W), C.shift(B, Cc, W)) > 0


def check_box(ch, lo, hi, L, M, verts, Sbar, T, scale=Fr(1)):
    """Acceptance decision (integers only). L: NF numerators of λ (denominator QLAM), M: numerator of μ, verts: vertex index per face."""
    nf = P.NF
    need(len(L) == nf and all(isinstance(v, int) and v >= 0 for v in L), "λ ≥ 0 (integer numerators)")
    need(sum(L) == QLAM, "Σλ = 1")
    need(isinstance(M, int) and M >= 0, "μ ≥ 0")
    need(len(verts) == nf and all(0 <= v < len(P.VERTS) for v in verts), "vertex indices")
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "box widths must be positive and even")
    need(QD(Fr(Sbar)) >= P.SSTAR * QD(Fr(scale)), "S̄ ≥ S* (with the piece scale)")
    P.check_T(T, Sbar, scale)
    chd = P.chart(ch)
    lam = [Fr(v, QLAM) for v in L]; mu = Fr(M, QLAM)
    sc = Fr(scale)
    base = []
    for f in range(nf):
        if L[f]:
            A_, B_, den = chd["RV"][(verts[f], f)]
            base.append((QD(sc * lam[f] / den), (A_, B_)))
    base.append((sc * mu * P.D0 - Fr(Sbar), (chd["N"], C.ZERO4)))
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    worst = None
    for wi, w in enumerate(P.PV):
        cN = sum((lam[f] * C.dot(P.NORMALS[f], w) for f in range(nf) if L[f]), QD(0)) * T
        A_, B_, den = chd["UW"][wi]
        terms = base + [(cN, (chd["N"], C.ZERO4))]
        if M:
            terms.append((QD(mu * T / den), (A_, B_)))
        SA, SB, _ = C.int_comb(terms)
        lb = C.lower_bound_qd(C.shift(SA, Cc, W), C.shift(SB, Cc, W))
        worst = lb if worst is None else min(worst, lb)
        if lb < 0:
            return False, worst
    return True, worst


def inside_L(ch, lo, hi):
    r = C.RHO0 * DEN
    need(r.denominator == 1, "RHO0 is in units of 1/DEN")
    r = int(r)
    return ch == 0 and all(-r <= l and h <= r for l, h in zip(lo, hi))


def split(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda a: (w[a], -a)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


# ---------- run ----------
def run(prob, name=None, charts=(0, 1, 2, 3), wmin_exp=30, Sbar=None, T=None, scale=Fr(1), max_boxes=3_000_000,
        time_limit=1800, quiet=False, save=True, use_discard=True, nonid=None):
    setup(prob)
    name = name or f"d16d_{prob}_far"
    Sbar = P.sstar_upper() if Sbar is None else Sbar
    T = P.default_T(Sbar) if T is None else T
    nonid = P.NONID if nonid is None else nonid
    t0 = time.time()
    wmin = DEN >> wmin_exp
    stats = dict(problem=prob, evaluated=0, A=0, D=0, L=0, X=0, lp_fail=0, levels=[], per_chart={})
    out = gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8") if save else None
    Xs = []
    PAIRMF = P.PAIRMF[nonid]
    for ch in charts:
        cur = [([-DEN] * 3, [DEN] * 3)]
        level = 0; cst = dict(A=0, D=0, L=0, X=0)
        while cur:
            nxt = []
            for lo, hi in cur:
                if time.time() - t0 > time_limit:
                    raise RuntimeError(f"time limit reached ({time_limit} s)")
                if inside_L(ch, lo, hi):
                    stats["L"] += 1; cst["L"] += 1
                    if out: out.write(json.dumps(dict(c=ch, k="L", lo=lo, hi=hi)) + "\n")
                    continue
                stats["evaluated"] += 1
                if stats["evaluated"] > max_boxes:
                    raise RuntimeError("box count limit exceeded")
                cen = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
                R = C.rot_f(C.q_of(ch, cen))
                done = False
                if use_discard:
                    gains = np.einsum("mij,ij->m", PAIRMF, R) - np.trace(R)
                    order = np.argsort(-gains)[:3]
                    for o in order:
                        if gains[o] <= 0:
                            break
                        m = nonid[o]
                        if check_discard(ch, lo, hi, m):
                            stats["D"] += 1; cst["D"] += 1; done = True
                            if out: out.write(json.dumps(dict(c=ch, k="D", lo=lo, hi=hi, m=m)) + "\n")
                            break
                if done:
                    continue
                cand = lp_f(R, float(scale))
                if cand is None:
                    stats["lp_fail"] += 1
                else:
                    v, lam, mu, verts = cand
                    L, M = round_mult(lam, mu)
                    ok, _ = check_box(ch, lo, hi, L, M, verts, Sbar, T, scale)
                    if ok:
                        stats["A"] += 1; cst["A"] += 1
                        if out: out.write(json.dumps(dict(c=ch, k="A", lo=lo, hi=hi, lam=L, mu=M, v=verts)) + "\n")
                        continue
                w = [h - l for l, h in zip(lo, hi)]
                if max(w) <= wmin:
                    stats["X"] += 1; cst["X"] += 1
                    Xs.append(dict(c=ch, lo=[l / DEN for l in lo], hi=[h / DEN for h in hi],
                                   phi_center=(v if cand is not None else None)))
                    if out: out.write(json.dumps(dict(c=ch, k="X", lo=lo, hi=hi)) + "\n")
                    continue
                nxt.extend(split(lo, hi))
            stats["levels"].append([ch, level, len(cur)])
            if not quiet:
                print(f"chart {ch} level {level:2d}: boxes {len(cur):7d} next {len(nxt):7d}  evaluated so far {stats['evaluated']}  ({time.time()-t0:.0f} s)", flush=True)
            cur = nxt; level += 1
        stats["per_chart"][ch] = cst
    if out: out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    stats["X_boxes"] = Xs[:50]
    stats["params"] = dict(problem=prob, charts=list(charts), wmin_exp=wmin_exp, Sbar=str(Sbar), T=str(T), scale=str(scale),
                           RHO0=str(C.RHO0), DEN_exp=C.KDEN, QLAM=QLAM, use_discard=use_discard, n_pairs_used=len(nonid))
    stats["closed"] = stats["X"] == 0 and stats["lp_fail"] == 0 and sorted(charts) == [0, 1, 2, 3]
    if save:
        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    if not quiet:
        print(f"== {name}: evaluated {stats['evaluated']}, accepted {stats['A']}, discarded {stats['D']}, L {stats['L']}, "
              f"split limit {stats['X']}, LP failures {stats['lp_fail']}, {stats['seconds']} s", flush=True)
    return stats


def replay(prob, name=None):
    """Re-check from the record only (review items F1, F2: an exception on any failure, split limit, or missing chart)."""
    setup(prob)
    name = name or f"d16d_{prob}_far"
    t0 = time.time()
    meta = json.load(open(f"{name}.json", encoding="utf-8"))["params"]
    need(meta["problem"] == prob, "problem of the record")
    Sbar = Fr(meta["Sbar"]); T = Fr(meta["T"])
    need(Fr(meta["scale"]) == 1 and Fr(meta["RHO0"]) == C.RHO0 and meta["DEN_exp"] == C.KDEN and meta["QLAM"] == QLAM, "assumptions of the record")
    need(QD(Sbar) >= P.SSTAR, "S̄ ≥ S*")
    leaves = {}
    n = dict(A=0, D=0, L=0, X=0, bad=0)
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            key = (r["c"], tuple(r["lo"]), tuple(r["hi"]))
            need(key not in leaves, "the same box appears twice")
            leaves[key] = r["k"]; n[r["k"]] += 1
            if r["k"] == "A":
                ok, _ = check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], Sbar, T)
                n["bad"] += (not ok)
            elif r["k"] == "D":
                n["bad"] += (not check_discard(r["c"], r["lo"], r["hi"], r["m"]))
            elif r["k"] == "L":
                n["bad"] += (not inside_L(r["c"], r["lo"], r["hi"]))
    seen = 0
    for ch in range(4):
        cur = [([-DEN] * 3, [DEN] * 3)]
        while cur:
            nxt = []
            for lo, hi in cur:
                key = (ch, tuple(lo), tuple(hi))
                if key in leaves:
                    seen += 1; continue
                need(max(h - l for l, h in zip(lo, hi)) > 2, "a branch that never reaches a leaf")
                nxt.extend(split(lo, hi))
            cur = nxt
    need(seen == len(leaves), f"of the {len(leaves)} recorded boxes only {seen} appeared in the tree")
    print(f"replay {name}: accepted {n['A']}, discarded {n['D']}, L {n['L']}, split limit {n['X']}, failed {n['bad']}, "
          f"coverage tree of the 4 charts OK, {time.time()-t0:.0f} s", flush=True)
    need(n["bad"] == 0 and n["X"] == 0, "failures or split limit present (not closed)")
    return n


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("prob"); ap.add_argument("--name", default=None)
    ap.add_argument("--charts", default="0,1,2,3"); ap.add_argument("--wmin-exp", type=int, default=30)
    ap.add_argument("--T", default=None)
    ap.add_argument("--max-boxes", type=int, default=3_000_000); ap.add_argument("--time-limit", type=int, default=1800)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.prob, a.name, charts=tuple(int(x) for x in a.charts.split(",")), wmin_exp=a.wmin_exp,
                 T=None if a.T is None else Fr(a.T), max_boxes=a.max_boxes, time_limit=a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.prob, a.name)
