# Q70 step (3): the local lemma of tetintet_n05 (exact rationals, s₀ = 2 exactly). 5 centres:
#   tube T_S (the stopped piece of P1, arc b = 0, a ∈ [0, A_MAX], side A), tube T_C (the corner piece I, side B),
#   points P1_g021, P1_g102 (the images of the stopped piece under C3v that do not touch the arc), point P2 (the isolated upside-down point). The range of n for a point is the corner (a, b) ∈ [0, r₀]².
# 2026-11-13 night, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The base is d40_local.py (tetintet_n02, route Y). Differences: s₀ = 2 is rational, so s₀ itself is used instead of s̄ (the order 0 is identically 0 on the arc),
#   the cell has H̃'_3 = max(H̃_3, 1) (the constant 1 is added to the candidates), the face of m̃ is b_0 on side A and b_3 on side B, and the map of n is the (a, b) of d37_tet_n05_common.
#
# Lemma (the form of D40 3.1): centre q_c, lateral coordinates ζ (for a tube (b, p1, p2, p3), for a point (a, b, p1, p2, p3)), q = q_c ⊗ (1, p).
#   P_c := |q|²·(the lower-bound formula of candidate c), P_c(base, rζ̂) = P_c(base, 0) + r·Λ_c(base, ζ̂, r).
#   Acceptance of a leaf: P_c(base, 0) ≥ 0 over the range of the base (linear in the base, so at the ends), and the lower bound of Λ_c > 0 over the whole leaf. Then P_c ≥ 0 over the whole leaf.
# Formulas of the candidates (D40 2.1, 2.3, face mf of m̃):
#   Types F, M(μ): G̃_c,μ = n·Rṽ_t + ¼Σ_f (n·(b_mf − b_f) + μ)·L_f − (s₀/2) n·b_mf − μs₀/2 ∓ κ̃ ≤ F̃ + (μ/4)Š ∓ κ̃ (weights ≥ 0).
#     L_f is a lower bound of H̃'_f: b_f·Rṽ_{v_f} (for any f), or for f = 3 the constant 1 (H̃'_3 = max(H̃_3, 1) ≥ 1).
#     Side A has −κ̃, side B (the corner piece, looking at σn) has +κ̃. A leaf with μ > 0 means "F̃ ∓ κ̃ ≥ G̃_c,μ ≥ 0 at a point with Š ≤ 0" (Š_c ≤ Š).
#   Type S: Š_c = Σ_f L_f − 2s₀ ≤ Š. If ≥ 0 over the whole leaf, then s̃₁ ≥ s₀ on that leaf (as in note m2 of D40, at r = 0 up to ≥ 0).
#     [my own reasoning] T4̃ is needed only for R with s̃₁(R) ≤ s < s₀ (in the "shrink to make a gap" argument of 6.1, the placements that enter have s < s₀), so points with Š ≥ 0 may be discarded.
# Acceptance is decided with rationals only. Floating point is used only for choosing candidates.
# Usage: python -X utf8 d37_tet_n05_local.py run [--only T_S,...] [--name d37_tet_n05_local] / replay [--name ...]
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d37_tet_n05_common as C

MUS = (0, 1, 2, 3, 4, 6, 12)
As, Bs, P1, P2, P3 = sp.symbols("a b p1 p2 p3")
VARS = (As, Bs, P1, P2, P3)
CONST = "c"          # marker for using the constant 1 as the lower bound for f = 3


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def to_dict(expr):
    P = sp.Poly(sp.expand(expr), *VARS, domain="QQ")
    return {m: Fr(int(c.p), int(c.q)) for m, c in P.terms()}


def rat(x):
    return sp.Rational(x.numerator, x.denominator)


class Center:
    def __init__(self, name, side, q, kind):
        self.name, self.side, self.q, self.kind = name, side, q, kind
        qq = C.qmul(tuple(rat(Fr(t)) for t in q), (1, P1, P2, P3))
        self.M = [[sp.expand(e) for e in row] for row in C.Mq(*qq)]
        self.Q = sp.expand(sum(t * t for t in qq))
        self.Rf = C.rot_f(q)
        n = C.n_A(As, Bs) if side == "A" else C.n_B(As, Bs)
        self.n = [sp.expand(x) for x in n]
        self.mf = C.MF[side]
        a0, a1, beta = C.kappa_coefs()
        kap = rat(a0) + rat(a1) * As + rat(beta) * Bs
        self.kap = -kap if side == "A" else kap
        self.s = rat(C.S0)
        self.zeta = (1, 2, 3, 4) if kind == "tube" else (0, 1, 2, 3, 4)
        self.base = (0,) if kind == "tube" else ()
        self.cands = self.make_cands()

    def Mv(self, v):
        return [sum(self.M[i][j] * sp.Rational(C.VT[v][j], 2) for j in range(3)) for i in range(3)]

    def make_cands(self):
        X = C.VTF @ self.Rf.T
        opts = []
        for f in range(4):
            v = X @ C.BF[f]; m = v.max()
            o = [i for i in range(4) if v[i] >= m - 1e-6]
            if f == C.JCELL:
                if m < 1 - 1e-6:
                    o = []
                if m <= 1 + 1e-6:
                    o = o + [CONST]
            opts.append(o)
        self.opts = opts
        Mv = [self.Mv(v) for v in range(4)]
        dot = lambda a, b: sum(x * y for x, y in zip(a, b))
        bterm = {}
        for f in range(4):
            for v in opts[f]:
                bterm[(f, v)] = self.Q if v == CONST else sp.expand(dot(C.BS[f], Mv[v]))
        nterm = {v: sp.expand(dot(self.n, Mv[v])) for v in range(4)}
        bm = C.BS[self.mf]
        wts = [sp.expand(dot(self.n, [bm[i] - C.BS[f][i] for i in range(3)])) for f in range(4)]
        out = []
        s = self.s
        for mu in (MUS if self.side == "A" else (0,)):
            fs = [f for f in range(4) if not (mu == 0 and f == self.mf)]
            for top in range(4):
                for vs in itertools.product(*[opts[f] if f in fs else [None] for f in range(4)]):
                    e = nterm[top] + sum((wts[f] + mu) * bterm[(f, vs[f])] for f in fs) / 4 \
                        - (s / 2 * dot(self.n, bm) + mu * s / 2 - self.kap) * self.Q
                    out.append(dict(type="F" if mu == 0 else "M", mu=mu, top=top, vs=vs, P=to_dict(e)))
        if self.side == "A":
            for vs in itertools.product(*opts):
                e = sum(bterm[(f, vs[f])] for f in range(4)) - 2 * s * self.Q
                out.append(dict(type="S", mu=None, top=None, vs=vs, P=to_dict(e)))
        for c in out:
            self.split_poly(c)
        return out

    def split_poly(self, c):
        e0 = {}; lam = {}
        for m, cf in c["P"].items():
            dz = sum(m[i] for i in self.zeta)
            if dz == 0:
                e0[m] = cf
            else:
                key = tuple(m[i] for i in self.base) + (dz - 1,) + tuple(m[i] for i in self.zeta)
                lam[key] = lam.get(key, 0) + cf
        c["e0"] = e0; c["lam"] = lam
        keys = list(lam)
        c["lam_keys"] = np.array(keys, dtype=float) if keys else np.zeros((0, 1))
        c["lam_cf"] = np.array([float(lam[k]) for k in keys])


def e0_ok(cen, c, lo, hi):
    e0 = c["e0"]
    need(all(m[0] <= 1 for m in e0) if cen.kind == "tube" else all(sum(m) == 0 for m in e0), "degree of e₀ in a ≤ 1 (constant for a point)")
    if cen.kind == "point":
        return sum(e0.values()) >= 0 if e0 else True
    for av in (lo[0], hi[0]):
        v = sum(cf * av ** m[0] for m, cf in e0.items())
        if v < 0:
            return False
    return True


def lam_lb(c, lo, hi):
    """Lower bound of Λ over the whole leaf (exact, the same as d40_local.lam_lb)."""
    ctr = [(a + b) / 2 for a, b in zip(lo, hi)]
    wid = [(b - a) / 2 for a, b in zip(lo, hi)]
    cache = {}

    def powexp(i, e):
        key = (i, e)
        if key not in cache:
            cache[key] = [math.comb(e, j) * ctr[i] ** (e - j) * wid[i] ** j for j in range(e + 1)]
        return cache[key]
    acc = {}
    for m, cf in c["lam"].items():
        terms = [((), cf)]
        for i, e in enumerate(m):
            if e == 0:
                terms = [(t + (0,), v) for t, v in terms]; continue
            co = powexp(i, e)
            nt = []
            for t, v in terms:
                for j, cj in enumerate(co):
                    if cj:
                        nt.append((t + (j,), v * cj))
            terms = nt
        for t, v in terms:
            acc[t] = acc.get(t, 0) + v
    lb = Fr(0)
    for t, v in acc.items():
        if all(x == 0 for x in t):
            lb += v
        elif all(x % 2 == 0 for x in t):
            lb += min(0, v)
        else:
            lb -= abs(v)
    return lb


def lam_float(c, x):
    K = c["lam_keys"]
    if len(K) == 0:
        return 0.0
    return float((c["lam_cf"] * np.prod(np.power(np.asarray(x, float)[None, :], K), axis=1)).sum())


def e0_float(cen, c, lo, hi):
    e0 = c["e0"]
    if cen.kind == "point":
        return float(sum(e0.values()))
    return min(float(sum(cf * float(av) ** m[0] for m, cf in e0.items())) for av in (lo[0], hi[0]))


def root_leaves(cen):
    out = []
    if cen.kind == "tube":
        zl = [Fr(0), Fr(-1), Fr(-1), Fr(-1)]; nb = 1
    else:
        zl = [Fr(0), Fr(0), Fr(-1), Fr(-1), Fr(-1)]; nb = 0
    nz = len(zl)
    for ax in range(nz):
        for sg in ((1,) if zl[ax] == 0 else (1, -1)):
            lo = []; hi = []
            if nb:
                lo.append(Fr(0)); hi.append(C.A_MAX)
            lo.append(Fr(0)); hi.append(C.R0)
            for j in range(nz):
                if j == ax:
                    lo.append(Fr(sg)); hi.append(Fr(sg))
                else:
                    lo.append(zl[j]); hi.append(Fr(1))
            out.append((f"{ax}{'+' if sg > 0 else '-'}", lo, hi))
    return out


def norm_widths(cen, lo, hi):
    nb = 1 if cen.kind == "tube" else 0
    ws = []
    for i, (a, b) in enumerate(zip(lo, hi)):
        if nb and i == 0:
            ws.append((b - a) / C.A_MAX)
        elif i == nb:
            ws.append((b - a) / C.R0)
        else:
            ws.append((b - a) / 2)
    return ws


def split(cen, lo, hi):
    ws = norm_widths(cen, lo, hi)
    ax = max(range(len(ws)), key=lambda i: (ws[i], -i))
    mid = (lo[ax] + hi[ax]) / 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def try_leaf(cen, lo, hi, ntry=3):
    ctr = [float((a + b) / 2) for a, b in zip(lo, hi)]
    sc = []
    for idx, c in enumerate(cen.cands):
        if e0_float(cen, c, lo, hi) < -1e-12:
            continue
        sc.append((lam_float(c, ctr), idx))
    sc.sort(reverse=True)
    nev = 0
    for v, idx in sc[:ntry]:
        if v <= 0:
            break
        c = cen.cands[idx]
        if not e0_ok(cen, c, lo, hi):
            continue
        nev += 1
        if lam_lb(c, lo, hi) > 0:
            return idx, nev
    return None, nev


def run_center(cen, wmin=Fr(1, 2 ** 22), budget=10 ** 6, time_limit=3600, quiet=False):
    t0 = time.time()
    leaves = []; ev = 0; nfail = 0; failed = []
    cur = [(lo, hi) for _, lo, hi in root_leaves(cen)]
    while cur:
        nxt = []
        for lo, hi in cur:
            idx, _ = try_leaf(cen, lo, hi)
            ev += 1
            if idx is not None:
                leaves.append((lo, hi, idx)); continue
            if max(norm_widths(cen, lo, hi)) <= wmin:
                nfail += 1; failed.append((lo, hi)); continue
            nxt.extend(split(cen, lo, hi))
        cur = nxt
        if not quiet:
            print(f"  {cen.name}: accepted {len(leaves)}, remaining {len(cur)}, evaluations {ev}, limit {nfail} ({time.time()-t0:.0f} s)", flush=True)
        if ev > budget or time.time() - t0 > time_limit:
            return dict(name=cen.name, closed=False, timeout=True, leaves=leaves, ev=ev, nfail=nfail, failed=failed[:20],
                        open=len(cur), open_sample=cur[:20], sec=time.time() - t0)
    return dict(name=cen.name, closed=(nfail == 0), leaves=leaves, ev=ev, nfail=nfail, failed=failed[:20], sec=time.time() - t0)


def build_centers(only=None):
    out = []
    for nm, side, q, kind in C.centers():
        if only and nm not in only:
            continue
        t0 = time.time()
        cen = Center(nm, side, q, kind)
        print(f"{nm}: candidates {len(cen.cands)}, options per face {cen.opts} ({time.time()-t0:.1f} s)", flush=True)
        out.append(cen)
    return out


def header():
    a0, a1, beta = C.kappa_coefs()
    return dict(kind="root", A_MAX=str(C.A_MAX), R0=str(C.R0), BETA=str(beta), S0=str(C.S0), a0=str(a0), a1=str(a1),
                centers=[[nm, side, [str(t) for t in q], kind] for nm, side, q, kind in C.centers()])


def cand_key(c):
    return [c["type"], c["mu"], c["top"], [v if v is None or v == CONST else int(v) for v in c["vs"]]]


def run(name, only=None, wmin_exp=22, time_limit=3600):
    cens = build_centers(only)
    for cen in cens:
        region_check(cen)
    hd = header()
    stats = dict(centers={})
    with gzip.open(f"{name}.leaves.jsonl.gz", "wt", encoding="utf-8") as f:
        f.write(json.dumps(hd) + "\n")
        for cen in cens:
            r = run_center(cen, wmin=Fr(1, 2 ** wmin_exp), time_limit=time_limit)
            for lo, hi, idx in r["leaves"]:
                f.write(json.dumps(dict(c=cen.name, lo=[str(x) for x in lo], hi=[str(x) for x in hi], cand=cand_key(cen.cands[idx]))) + "\n")
            types = {}
            for _, _, idx in r["leaves"]:
                t = cen.cands[idx]["type"] + ("" if cen.cands[idx]["mu"] in (None, 0) else str(cen.cands[idx]["mu"]))
                types[t] = types.get(t, 0) + 1
            stats["centers"][cen.name] = dict(closed=r["closed"], leaves=len(r["leaves"]), ev=r["ev"], nfail=r["nfail"],
                                              timeout=r.get("timeout", False), sec=round(r["sec"], 1), types=types,
                                              failed=[[[str(x) for x in lo], [str(x) for x in hi]] for lo, hi in r["failed"]],
                                              open_sample=[[[str(x) for x in lo], [str(x) for x in hi]] for lo, hi in r.get("open_sample", [])])
            print(f"== {cen.name}: closed {r['closed']}, leaves {len(r['leaves'])}, evaluations {r['ev']}, limit {r['nfail']}, types {types}, {r['sec']:.0f} s", flush=True)
    stats["closed"] = all(v["closed"] for v in stats["centers"].values())
    stats["header"] = hd
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print("== local: closed", stats["closed"], flush=True)
    return stats


def region_check(cen):
    """Check with rationals the premise for the correctness of the candidates (point A1 of Q105, added 11/14): the range of n of the centre (for a tube a ∈ [0, A_MAX], b ∈ [0, R0],
    for a point [0, R0]²) lies inside T (a + b ≤ 1), and at its 4 corners the weights n·(b_mf − b_f) ≥ 0 (f = 0..3). The weights are linear in (a, b) and the range is a box, so
    the 4 corners suffice. Then m̃(n) = n·b_mf holds over the whole range, and the candidates of type F (μ = 0) are lower bounds of F̃ ∓ κ̃ (type M only adds μ ≥ 0 to the weights)."""
    amax = C.A_MAX if cen.kind == "tube" else C.R0
    for av in (Fr(0), amax):
        for bv in (Fr(0), C.R0):
            need(av + bv <= 1, f"{cen.name}: the range of n sticks out of T (a + b = {av + bv})")
            n = C.n_A(av, bv) if cen.side == "A" else C.n_B(av, bv)
            for f in range(4):
                w = sum(n[i] * (C.BS[cen.mf][i] - C.BS[f][i]) for i in range(3))
                need(w >= 0, f"{cen.name}: at (a, b) = ({av}, {bv}) the weight n·(b_{cen.mf} − b_{f}) = {w} < 0 (the fixed choice of the face of m̃ breaks down)")
    return True


def replay(name):
    """Re-check from the record alone: the cover from the root leaf (a fixed way of splitting), the exact test of the candidate of each leaf, and the premise of the candidates (region_check)."""
    t0 = time.time()
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need(hd == json.loads(json.dumps(header())), "the premise of the record (constants, centres, κ) differs from the current d37_tet_n05_common")
    cens = {c.name: c for c in build_centers()}
    for cen in cens.values():
        region_check(cen)
    print("premise of the candidates (the range of n lies inside T, weights ≥ 0 at the 4 corners): OK for all 5 centres", flush=True)
    by = {}
    for r in lines[1:]:
        by.setdefault(r["c"], {})[(tuple(r["lo"]), tuple(r["hi"]))] = r["cand"]
    cnt = dict(ok=0, bad=0)
    for nm, cen in cens.items():
        lv = by.get(nm, {})
        need(lv, f"{nm} has no leaves")
        idx = {json.dumps(cand_key(c)): i for i, c in enumerate(cen.cands)}
        for (lo, hi), ck in lv.items():
            lo_ = [Fr(x) for x in lo]; hi_ = [Fr(x) for x in hi]
            i = idx.get(json.dumps(ck))
            ok = i is not None and e0_ok(cen, cen.cands[i], lo_, hi_) and lam_lb(cen.cands[i], lo_, hi_) > 0
            cnt["ok" if ok else "bad"] += 1
        seen = 0; depth = 0
        cur = [(lo, hi) for _, lo, hi in root_leaves(cen)]
        keys = set(lv)
        while cur:
            need(depth <= 200, f"{nm}: a branch that does not reach a leaf"); depth += 1
            nxt = []
            for lo, hi in cur:
                k = (tuple(str(x) for x in lo), tuple(str(x) for x in hi))
                if k in keys:
                    seen += 1; continue
                nxt.extend(split(cen, lo, hi))
            cur = nxt
        need(seen == len(lv), f"{nm}: the cover count does not agree")
        print(f"re-check {nm}: leaves {len(lv)}, cover OK", flush=True)
    need(cnt["bad"] == 0, f"failed {cnt['bad']}")
    print(f"re-check {name}: passed {cnt['ok']}, failed 0, {time.time()-t0:.0f} s", flush=True)
    return cnt


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d37_tet_n05_local")
    ap.add_argument("--only", default=None); ap.add_argument("--wmin-exp", type=int, default=22)
    ap.add_argument("--time-limit", type=int, default=3600)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.only.split(",") if a.only else None, a.wmin_exp, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
