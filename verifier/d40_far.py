# D40 step 2: verifier of the far part (tetintet_n02, route Y, exact numbers, acceptance by integers only).
# 2026-11-13, written by Claude (Opus 5.5). The argument, the code and the tests were written by Claude; no third-party review; not a formal proof.
#
# Coordinates of n: the chart of side A, (h, k′) ∈ T := {h, k′ ≥ 0, h + k′ ≤ 1} (n = n_A(h, k′), y ≥ 0). Side B uses the same coordinates with σn = n_B(h, k′).
# σ maps a box to the box with the same coordinates, so each n box N gets 2 R trees:
#   side A: G̃(n_A, R) − κ_N ≥ 0, side B: G̃(n_B, R) + κ_N ≥ 0, κ_N(h, k′) = κ̃₁(h, k′) + k_N (k_N a rational constant per box, 0 on boxes meeting N₁).
#   Then κ(n_A) := κ_N, κ(n_B) := −κ_N (|κ_N| on y = 0, [own reasoning] NOTES_d40) gives κ(n) + κ(σn) ≥ 0, and (K) holds on all of D_n.
# Leaves of the R tree (4 quaternion charts; RBox, quad_lb, discard_lb of d31_common are imported and used):
#   A (accept, types F, M(μ)): lower bound of the candidate formula |q|²·G̃_c,μ ≥ 0 (on side A with μ > 0 the claim is only at points with Š ≤ 0, D40 2.1).
#   S (discard, side A only): lower bound of |q|²·Š_c > 0 (s₁ > s̄). On side B (corner piece) there is also nothing to show when s₁ > s̄, so it may be used.
#   D (discard): a piece rotation k with tr(Rk) > tr(R).
#   L: (n box, R box) lies in a region of the local lemma (the cubes around the 7 centres of d40_local).
# Notes (fixes R1, R4 from review Q86, Q87, 2026-11-13; the numbers of the result do not change):
#   R1 The weight n_B·(b₂ − b_f) of side B (2(2 − 2h − k) for f = 1) is negative when 2h + k > 2. The far n boxes are squares in [0,1]², and a box that
#      crosses h + k = 1 sticks out of T (h + k > 1), so on such boxes the candidate formula is not a lower bound of G̃. Why the result is not affected:
#      box_lb shows "candidate polynomial ≥ 0 (on the whole box)", which is true whatever the signs of the weights; it is read as G̃ ≥ … only
#      inside T (2h + k ≤ 1 + h ≤ 2, so all weights are ≥ 0). The weights of side A (2x + 2, 2k, 2(h + k)) are ≥ 0 on all of [0,1]².
#   R4 The claim holds when the local replay (d40_local.py replay), the far replay (this replay) and the assert of the upper bound (d40_upper.py) all pass.
#      This replay only checks that the L leaves lie in the local regions (not that the local part is closed). The entry point that runs the 3
#      in a row and prints one pass/fail line is d40_tests.py chain (`python -X utf8 d40_tests.py --only chain`).
#   R3 Cross-check of the local polynomials (sympy) against cand_forms here: d40_tests.py R3 (exact).
# Usage: python -X utf8 d40_far.py run [--procs 2] [--name d40_far] [--sample K]  /  replay [--name d40_far]
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d40_common as C
import d31_common as D31                      # RBox, quad_lb, vcomb, discard_lb, chart_q_aff are only imported and used
from d31_common import DEN

ND = 2 ** 30
KDEN = 2 ** 24
MUS = (1, 2, 3, 4, 6, 12)
ROTF = np.array([np.array(k, float) for k in C.PROT_NONID])


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


# ---------------- constants (exact) ----------------
_K = {}


def consts():
    if not _K:
        a0, a1, beta = C.kappa_coefs()
        _K.update(a0=a0, a1=a1, beta=beta, s=C.S_BAR, cen=C.centers())
        _K["cenq"] = [(nm, side, q, kind) for nm, side, q, kind in _K["cen"]]
    return _K


def n_forms(side):
    """Components of n as (c0, ch, ck) (n_l = c0 + ch·h + ck·k)."""
    if side == "A":
        return ((1, -1, 0), (1, -1, -1), (0, 0, 0)), (0, 0, 1)
    return ((1, -1, 0), (-1, 1, 1), (0, 0, 0)), (0, 0, 1)


def cand_forms(side, cand, kN):
    """For the candidate cand = (type, μ, top, vs), |q|²·(formula) = Σ_{l,i} M_{l,i}·L_{l,i}(h,k) + |q|²·L_Q(h,k); returns the L (rational (c0, ch, ck)).
    Types F/M: n·Mṽ_top + ¼Σ_f (n·(b₂−b_f) + μ)·b_f·Mṽ_{v_f} − ((s/2)n·b₂ + μs/2 ∓ κ_N)|q|². Type S: Σ_f b_f·Mṽ_{v_f} − 2s|q|²."""
    K = consts()
    typ, mu, top, vs = cand
    nf, _ = n_forms(side)
    n = [tuple(Fr(x) for x in nf[0]), tuple(Fr(x) for x in nf[1]), (Fr(1), Fr(0), Fr(0))]
    L = {}
    def add(key, f, s):
        a = L.get(key, (Fr(0),) * 3); L[key] = tuple(a[t] + s * f[t] for t in range(3))
    def lin_dot(w):            # n·w as (c0, ch, ck)
        return tuple(sum(n[l][t] * w[l] for l in range(3)) for t in range(3))
    one = (Fr(1), Fr(0), Fr(0))
    if typ == "S":
        for f in range(4):
            for l in range(3):
                for i in range(3):
                    c = Fr(C.BS[f][l] * C.VT[vs[f]][i], 2)
                    if c:
                        add((l, i), one, c)
        add("Q", one, -2 * K["s"])
        return L
    # n·Mṽ_top = Σ_{l,i} n_l M_{l,i} ṽ_i
    for l in range(3):
        for i in range(3):
            c = Fr(C.VT[top][i], 2)
            if c:
                add((l, i), n[l], c)
    for f in range(4):
        w = lin_dot([C.BS[2][j] - C.BS[f][j] for j in range(3)])
        w = (w[0] + mu, w[1], w[2])
        if w == (0, 0, 0):
            continue
        for l in range(3):
            for i in range(3):
                c = Fr(C.BS[f][l] * C.VT[vs[f]][i], 8)
                if c:
                    add((l, i), w, c)
    nb2 = lin_dot(C.BS[2])
    kap = (K["a0"] + kN, K["a1"], K["beta"])
    sg = -1 if side == "A" else 1
    qf = tuple(-K["s"] / 2 * nb2[t] + (-mu * K["s"] / 2 if t == 0 else 0) + sg * kap[t] for t in range(3))
    add("Q", qf, 1)
    return L


def int_forms(L):
    den = 1
    for v in L.values():
        for x in v:
            den = den * x.denominator // math.gcd(den, x.denominator)
    return {k: tuple(int(x * den) for x in v) for k, v in L.items()}, den


_FC = {}


def forms_cached(side, cand, kN):
    key = (side, cand, kN)
    r = _FC.get(key)
    if r is None:
        if len(_FC) > 20000:
            _FC.clear()
        r = _FC[key] = int_forms(cand_forms(side, cand, kN))[0]
    return r


def box_lb(nlo, nhi, rb, side, cand, kN):
    """Lower bound (integer) of (a positive multiple of) the candidate formula on n box × R box. The formula is linear in (h, k), so take the minimum over the 4 corners of the n box."""
    L = forms_cached(side, cand, kN)
    best = None
    corners = [(nlo[0], nlo[1])] if cand[0] == "S" else [(a, b) for a in (nlo[0], nhi[0]) for b in (nlo[1], nhi[1])]
    for hv, kv in corners:
        terms = []
        for key, f in L.items():
            c = f[0] * ND + f[1] * hv + f[2] * kv
            terms.append((c, rb.Q if key == "Q" else rb.M[key[0]][key[1]]))
        v = D31.quad_lb(D31.vcomb(terms))
        best = v if best is None else min(best, v)
    return best


# ---------------- local regions L ----------------
def n_in_N1(lo, hi):
    return hi[0] <= C.H_MAX * ND and hi[1] <= C.R0 * ND


def n_in_P(lo, hi):
    return hi[0] <= C.R0 * ND and hi[1] <= C.R0 * ND


def n_overlaps_N1(lo, hi):
    return lo[0] < C.H_MAX * ND and lo[1] < C.R0 * ND


def n_overlaps_P(lo, hi):
    return lo[0] < C.R0 * ND and lo[1] < C.R0 * ND


def _verts(ch, lo, hi):
    out = []
    for a in (lo[0], hi[0]):
        for b in (lo[1], hi[1]):
            for c in (lo[2], hi[2]):
                q = [a, b, c]; q.insert(ch, DEN)
                out.append(q)
    return out


def r_in_cube(ch, lo, hi, qc):
    """For the 8 vertices q of the R box, w = q̄_c ⊗ q satisfies |w_i| ≤ R0·w₀ (all with w₀ > 0) or |w_i| ≤ −R0·w₀ (all with w₀ < 0). w is linear in q, so the box lies in the cube (a convex cone)."""
    qbar = (qc[0], -qc[1], -qc[2], -qc[3])
    for sg in (1, -1):
        ok = True
        for q in _verts(ch, lo, hi):
            w = C.qmul(qbar, tuple(Fr(x) for x in q))
            w0 = sg * w[0]
            if not (w0 > 0 and all(abs(w[i]) <= C.R0 * w0 for i in (1, 2, 3))):
                ok = False; break
        if ok:
            return True
    return False


def in_L(side, nlo, nhi, ch, lo, hi):
    K = consts()
    for nm, sd, q, kind in K["cen"]:
        if sd != side:
            continue
        if kind == "tube" and not n_in_N1(nlo, nhi):
            continue
        if kind == "point" and not n_in_P(nlo, nhi):
            continue
        if r_in_cube(ch, lo, hi, q):
            return nm
    return None


# ---------------- R tree ----------------
def rot_f(q):
    return C.rot_f(q)


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda a: (w[a], -a)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", ROTF, Rf) - np.trace(Rf)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if D31.discard_lb(rb, C.PROT_NONID[o]) > 0:
            return int(o)
    return None


def pick(nf, Rf):
    X = C.VTF @ Rf.T
    top = int(np.argmax(X @ nf))
    vs = tuple(int(np.argmax(X @ C.BF[f])) for f in range(4))
    return top, vs


def gt_float(nf, Rf, mu, s, kap, side):
    return C.Gt_f(nf, Rf, s, mu) + (-kap if side == "A" else kap)


def rtree(side, nlo, nhi, kN, budget, wmin_exp, allowL):
    K = consts()
    s = float(K["s"])
    leaves = []; ev = 0
    hc = (nlo[0] + nhi[0]) / 2 / ND; kc = (nlo[1] + nhi[1]) / 2 / ND
    nf = np.array(C.n_A(hc, kc) if side == "A" else C.n_B(hc, kc), float)
    kap = float(K["a0"] + kN) + float(K["a1"]) * hc + float(K["beta"]) * kc
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                Lk = in_L(side, nlo, nhi, ch, lo, hi)
                if Lk:
                    leaves.append([ch, lo, hi, "L", Lk]); continue
            ev += 1
            if ev > budget:
                return None, ev
            q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
            Rf = rot_f(q)
            rb = D31.RBox(ch, lo, hi)
            m = discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            top, vs = pick(nf, Rf)
            done = False
            sch = C.Sch_f(Rf, s)
            tries = []
            if sch > 0:
                tries.append(("S", None, None, vs))
            vals = sorted(((gt_float(nf, Rf, mu, s, kap, side), mu) for mu in ((0,) + (MUS if side == "A" else ()))), reverse=True)
            f0 = gt_float(nf, Rf, 0, s, kap, side)
            tries.append(("F", 0, top, vs))
            for v, mu in vals[:2]:
                if mu:
                    tries.append(("M", mu, top, vs))
            for cand in tries:
                if cand[0] == "S":
                    ok = box_lb(nlo, nhi, rb, side, cand, kN) > 0
                else:
                    ok = box_lb(nlo, nhi, rb, side, cand, kN) >= 0
                if ok:
                    leaves.append([ch, lo, hi, "A", [cand[0], cand[1], cand[2], list(cand[3])]]); done = True; break
            if done:
                continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a, b in split3(lo, hi):
                nxt.append((ch, a, b))
        cur = nxt
    return leaves, ev


def psi_pair(hc, kc, seed):
    import d40_psi as P
    rng = np.random.default_rng(seed)
    s = float(C.S_BAR)
    nA = np.array(C.n_A(hc, kc), float); nB = np.array(C.n_B(hc, kc), float)
    gA, _ = P.g_val(nA / np.linalg.norm(nA), s, 12, rng)
    gB, _ = P.g_val(nB / np.linalg.norm(nB), s, 12, rng)
    return math.sqrt(2) * np.linalg.norm(nA) * gA, math.sqrt(2) * np.linalg.norm(nB) * gB


def task(args):
    lo, hi, budget, wmin_exp = args
    K = consts()
    t0 = time.time()
    allowL = n_in_N1(lo, hi) or n_in_P(lo, hi)
    if n_overlaps_N1(lo, hi):
        kN = Fr(0); psis = None
    else:
        hc = (lo[0] + hi[0]) / 2 / ND; kc = (lo[1] + hi[1]) / 2 / ND
        pA, pB = psi_pair(hc, kc, lo[0] * 7 + lo[1])
        kap1 = float(K["a0"]) + float(K["a1"]) * hc + float(K["beta"]) * kc
        kN = Fr(math.floor(((pA - kap1) - (pB + kap1)) / 2 * KDEN), KDEN)
        psis = (pA, pB)
        if pA + pB < 0:
            return dict(kind="neg", lo=lo, hi=hi, psis=psis)
    recs = []; evs = 0
    for side in ("A", "B"):
        leaves, ev = rtree(side, lo, hi, kN, budget, wmin_exp, allowL)
        evs += ev
        if leaves is None:
            return dict(kind="fail", lo=lo, hi=hi, ev=evs, side=side, psis=psis, sec=time.time() - t0)
        recs.append(dict(side=side, leaves=leaves))
    return dict(kind="ok", lo=lo, hi=hi, kN=[kN.numerator, kN.denominator], recs=recs, ev=evs, psis=psis, sec=time.time() - t0)


def is_out(lo, hi):
    return lo[0] + lo[1] >= ND


def must_split(lo, hi, forced):
    if max(h - l for l, h in zip(lo, hi)) > forced:
        return True
    if n_overlaps_N1(lo, hi) and not n_in_N1(lo, hi):
        return True
    if n_overlaps_P(lo, hi) and not n_in_P(lo, hi):
        return True
    return False


def header():
    K = consts()
    return dict(kind="root", ND=ND, DEN=DEN, H_MAX=str(C.H_MAX), R0=str(C.R0), BETA=str(K["beta"]), S_BAR=str(C.S_BAR),
                a0=str(K["a0"]), a1=str(K["a1"]), centers=[[nm, sd, [str(t) for t in q], kind] for nm, sd, q, kind in K["cen"]])


def run(name, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=4):
    from multiprocessing import Pool
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, n_neg=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    types = {}
    cur = [([0, 0], [ND, ND])]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                continue
            if must_split(lo, hi, forced):
                nxt.extend(split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample:
            rng = np.random.default_rng(0)
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for rec in r["recs"]:
                    for lf in rec["leaves"]:
                        k_ = lf[3] if lf[3] != "A" else "A"
                        stats["leaves"][k_] = stats["leaves"].get(k_, 0) + 1
                        if lf[3] == "A":
                            t = lf[4][0] + ("" if not lf[4][1] else str(lf[4][1]))
                            types[t] = types.get(t, 0) + 1
                if out:
                    out.write(json.dumps(dict(kind="ok", lo=r["lo"], hi=r["hi"], kN=r["kN"], recs=r["recs"])) + "\n")
            else:
                if r["kind"] == "neg":
                    stats["n_neg"] += 1
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin) or sample:
                    stats["n_X"] += 1; stats["X_boxes"].append([[v / ND for v in r["lo"]], [v / ND for v in r["hi"]], r.get("side"), r.get("psis")])
                    if out:
                        out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend(split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r.get("sec", 0) for r in res]
        stats["levels"].append([level, len(cur), len(todo), sum(1 for r in res if r["kind"] == "ok")])
        print(f"n level {level}: boxes {len(cur)}, tried {len(todo)}, closed {sum(1 for r in res if r['kind']=='ok')}, "
              f"evaluated so far {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]], kind=r["kind"],
                                            ev=r.get("ev"), sec=round(r.get("sec", 0), 2), side=r.get("side")) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True; break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["types"] = types
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp)
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: closed {stats['closed']}, n boxes ok {stats['n_ok']}, out {stats['n_out']}, at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, types {types}, evaluated {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    """Re-check from the record alone (no floating point): coverage trees of n and R, the tests of accept, S, discard and L leaves, k_N = 0 (boxes meeting N₁)."""
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    need(lines[0] == json.loads(json.dumps(header())), "record header")
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box appears twice"); nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "boxes at the splitting limit remain")
    for key, r in nleaves.items():
        lo, hi = r["lo"], r["hi"]
        if r["kind"] == "out":
            need(is_out(lo, hi), "out box"); continue
        kN = Fr(r["kN"][0], r["kN"][1])
        need(kN == 0 or not n_overlaps_N1(lo, hi), "k_N of a box meeting N1")
        need([rc["side"] for rc in r["recs"]] == ["A", "B"], "number of sides")
        allowL = n_in_N1(lo, hi) or n_in_P(lo, hi)
        for rc in r["recs"]:
            side = rc["side"]; rl = set()
            for lf in rc["leaves"]:
                ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
                kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box appears twice"); rl.add(kk)
                rb = D31.RBox(ch, rlo, rhi)
                if kind == "A":
                    c = lf[4]; cand = (c[0], c[1], c[2], tuple(c[3]))
                    okc = c[0] in ("F", "M", "S") and all(v in (0, 1, 2, 3) for v in c[3]) and (c[0] != "M" or (side == "A" and c[1] in MUS)) \
                        and (c[0] != "F" or c[1] == 0) and (c[0] == "S" or c[2] in (0, 1, 2, 3))
                    if c[0] == "S":
                        ok = okc and box_lb(lo, hi, rb, side, cand, kN) > 0
                    else:
                        ok = okc and box_lb(lo, hi, rb, side, cand, kN) >= 0
                elif kind == "D":
                    ok = 0 <= lf[4] < len(C.PROT_NONID) and D31.discard_lb(rb, C.PROT_NONID[lf[4]]) > 0
                elif kind == "L":
                    ok = allowL and in_L(side, lo, hi, ch, rlo, rhi) == lf[4]
                else:
                    ok = False
                cnt[kind] += 1; cnt["bad"] += (not ok)
            dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
            cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
            while cur:
                need(depth <= dmax, "a branch does not reach an R leaf"); depth += 1
                nxt = []
                for ch, a, b in cur:
                    if (ch, tuple(a), tuple(b)) in rl:
                        seen += 1; continue
                    nxt.extend((ch, p, q) for p, q in split3(a, b))
                cur = nxt
            need(seen == len(rl), "coverage of the R tree")
    dmax = max(sum(round(math.log2(ND / (h - l))) for l, h in zip(k_[0], k_[1])) for k_ in nleaves)
    cur = [([0, 0], [ND, ND])]; seen = 0; depth = 0
    while cur:
        need(depth <= dmax, "a branch does not reach an n leaf"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            nxt.extend(split2(lo, hi))
        cur = nxt
    need(seen == len(nleaves), "coverage of the n tree")
    print(f"replay {name}: n boxes ok {cnt['ok']}, out {cnt['out']}; R leaves accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}; "
          f"failed {cnt['bad']}, coverage trees OK, {time.time()-t0:.0f} s", flush=True)
    need(cnt["bad"] == 0, "some leaves failed")
    return cnt


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d40_far")
    ap.add_argument("--procs", type=int, default=2); ap.add_argument("--nmin", type=int, default=12)
    ap.add_argument("--budget", type=int, default=40000); ap.add_argument("--wmin-exp", type=int, default=18)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
