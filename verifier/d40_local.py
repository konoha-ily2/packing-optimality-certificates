# D40 step 1: the local lemma (tetintet_n02, route Y, exact rationals). 7 centres (tubes T_S, T_S′, T_C and 4 points P_g).
# 2026-11-13, written by Claude (Opus 5.5). The argument, the code and the tests were written by Claude; no third-party review; not a formal proof.
#
# Lemma (D40 3.1, order 0 in inequality form): centre q_c, transverse coordinates ζ (tube: (k′, p1, p2, p3); point: (h, k′, p1, p2, p3)), q = q_c ⊗ (1, p).
#   P_c := |q|²·(lower-bound formula of candidate c), P_c(base, rζ̂) = P_c(base, 0) + r·Λ_c(base, ζ̂, r).
#   A leaf (base range × box on a face of ζ̂ × range of r) is accepted if P_c(base, 0) ≥ 0 on the base range (linear in the base, so at the ends)
#   and Λ_c > 0 on the whole leaf. Then P_c ≥ 0 on the whole leaf, and since |q|² > 0 the candidate formula is ≥ 0.
# Candidate formulas (D40 2.1, 2.3):
#   types F, M(μ): G̃_c,μ = n·Rṽ_t + ¼Σ_f (n·(b₂ − b_f) + μ)·b_f·Rṽ_{v_f} − (s̄/2)n·b₂ − μs̄/2 ∓ κ̃₁ ≤ G̃_μ (weights ≥ 0).
#     Side A uses −κ̃₁, side B (corner piece, looks at σn) uses +κ̃₁. A leaf with μ > 0 means "G̃ ≥ G̃_c,μ ≥ 0 at points with Š ≤ 0" (Š_c ≤ Š, D40 2.1).
#   type S: Š_c = Σ_f b_f·Rṽ_{v_f} − 2s̄ ≤ Š. If > 0 on the whole leaf, s₁ > s̄ and there is nothing to show.
# Note m2 (review Q86, fix Q87): a type-S leaf is accepted with "P(base, 0) ≥ 0 at the base" and "Λ > 0", so at r = 0 it only says Š_c ≥ 0
#   (the "> 0" above holds for r > 0). Harmless: type S is never used in the local record (M12 and others suffice), and T4 only needs
#   the R with s₁ < s̄, so "discard when Š ≥ 0" is also correct.
# Note R4: the claim holds when the local replay (here), the far replay (d40_far.py) and the assert of the upper bound (d40_upper.py) all pass.
#   The entry point that runs them in a row is d40_tests.py chain.
# Acceptance uses rationals only. Floating point is used only to choose candidates.
# Usage: python -X utf8 d40_local.py run [--only T_S,...] [--name d40_local]  /  replay [--name d40_local]
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
import d40_common as C

MUS = (0, 1, 2, 3, 4, 6, 12)
Hs, Ks, P1, P2, P3 = sp.symbols("h k p1 p2 p3")
VARS = (Hs, Ks, P1, P2, P3)


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


# ---------------- polynomials (dict: exponent tuple → Fraction) ----------------
def to_dict(expr):
    P = sp.Poly(sp.expand(expr), *VARS, domain="QQ")
    return {m: Fr(int(c.p), int(c.q)) for m, c in P.terms()}


class Center:
    def __init__(self, name, side, q, kind):
        self.name, self.side, self.q, self.kind = name, side, q, kind
        qq = C.qmul(tuple(sp.Rational(t.numerator, t.denominator) for t in q), (1, P1, P2, P3))
        self.M = [[sp.expand(e) for e in row] for row in C.Mq(*qq)]
        self.Q = sp.expand(sum(t * t for t in qq))
        self.Rf = C.rot_f(q)
        n = C.n_A(Hs, Ks) if side == "A" else C.n_B(Hs, Ks)
        self.n = [sp.expand(x) for x in n]
        a0, a1, beta = C.kappa_coefs()
        kap = sp.Rational(a0.numerator, a0.denominator) + sp.Rational(a1.numerator, a1.denominator) * Hs \
            + sp.Rational(beta.numerator, beta.denominator) * Ks
        self.kap = -kap if side == "A" else kap
        self.s = sp.Rational(C.S_BAR.numerator, C.S_BAR.denominator)
        # positions of the ζ variables (in VARS)
        self.zeta = (1, 2, 3, 4) if kind == "tube" else (0, 1, 2, 3, 4)
        self.base = (0,) if kind == "tube" else ()
        self.cands = self.make_cands()

    def Mv(self, v):
        return [sum(self.M[i][j] * sp.Rational(C.VT[v][j], 2) for j in range(3)) for i in range(3)]

    def make_cands(self):
        """Candidates (choice of vertices and type) and their polynomials. Vertices: those tied at the centre (1e−6), and for top all of them."""
        X = C.VTF @ self.Rf.T
        tiesH = []
        for f in range(4):
            v = X @ C.BF[f]; tiesH.append([i for i in range(4) if v[i] >= v.max() - 1e-6])
        Mv = [self.Mv(v) for v in range(4)]
        dot = lambda a, b: sum(x * y for x, y in zip(a, b))
        bterm = {(f, v): sp.expand(dot(C.BS[f], Mv[v])) for f in range(4) for v in tiesH[f]}
        nterm = {v: sp.expand(dot(self.n, Mv[v])) for v in range(4)}
        wts = [sp.expand(dot(self.n, [C.BS[2][i] - C.BS[f][i] for i in range(3)])) for f in range(4)]
        out = []
        s = self.s
        for mu in (MUS if self.side == "A" else (0,)):
            fs = [f for f in range(4) if not (mu == 0 and f == 2)]
            for top in range(4):
                for vs in itertools.product(*[tiesH[f] if f in fs else [None] for f in range(4)]):
                    e = nterm[top] + sum((wts[f] + mu) * bterm[(f, vs[f])] for f in fs) / 4 \
                        - (s / 2 * dot(self.n, C.BS[2]) + mu * s / 2 - self.kap) * self.Q
                    out.append(dict(type="F" if mu == 0 else "M", mu=mu, top=top, vs=vs, P=to_dict(e)))
        if self.side == "A":
            for vs in itertools.product(*tiesH):
                e = sum(bterm[(f, vs[f])] for f in range(4)) - 2 * s * self.Q
                out.append(dict(type="S", mu=None, top=None, vs=vs, P=to_dict(e)))
        for c in out:
            self.split_poly(c)
        return out

    def split_poly(self, c):
        """Split P into the order-0 part (base only) and Λ (degree in ζ lowered by 1, a polynomial in r).
        Λ is indexed by (base variables, r, ζ̂ (4 or 5)): monomial h^a ζ^β → h^a r^{|β|−1} ζ̂^β."""
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


# ---------------- leaves ----------------
# Order of the leaf variables: base (h for a tube, none for a point), r, ζ̂ (4 for a tube, 5 for a point). Each variable has a range [lo, hi] (Fraction). The face coordinate has lo = hi = ±1.
def e0_ok(cen, c, lo, hi):
    """P(base, 0) ≥ 0 on the base range (linear in the base; constant for a point box)."""
    e0 = c["e0"]
    need(all(m[0] <= 1 for m in e0) if cen.kind == "tube" else all(sum(m) == 0 for m in e0), "degree of e0 in h <= 1 (constant for a point)")   # m1 (Q86)
    if cen.kind == "point":
        return sum(e0.values()) >= 0 if e0 else True
    for hv in (lo[0], hi[0]):
        v = sum(cf * hv ** m[0] for m, cf in e0.items())
        if v < 0:
            return False
    return True


def lam_lb(c, lo, hi):
    """Lower bound (exact) of Λ on the whole leaf: substitute each variable by centre + half-width·t (t ∈ [−1, 1]), expand, and take constant + Σ(min(0, ·) of terms with only even powers) − Σ|other terms|."""
    nv = len(lo)
    ctr = [(a + b) / 2 for a, b in zip(lo, hi)]
    wid = [(b - a) / 2 for a, b in zip(lo, hi)]
    # coefficients of (c + w t)^e (per power of t)
    cache = {}
    def powexp(i, e):
        key = (i, e)
        if key not in cache:
            co = [Fr(0)] * (e + 1)
            for j in range(e + 1):
                co[j] = math.comb(e, j) * ctr[i] ** (e - j) * wid[i] ** j
            cache[key] = co
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
    return min(float(sum(cf * float(hv) ** m[0] for m, cf in e0.items())) for hv in (lo[0], hi[0]))


def root_leaves(cen):
    """Root leaves, one per face."""
    out = []
    if cen.kind == "tube":
        zl = [Fr(0), Fr(-1), Fr(-1), Fr(-1)]
        nb = 1
    else:
        zl = [Fr(0), Fr(0), Fr(-1), Fr(-1), Fr(-1)]
        nb = 0
    nz = len(zl)
    for ax in range(nz):
        for sg in ((1,) if zl[ax] == 0 else (1, -1)):
            lo = []; hi = []
            if nb:
                lo.append(Fr(0)); hi.append(C.H_MAX)
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
            ws.append((b - a) / C.H_MAX)
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
            idx, n_ = try_leaf(cen, lo, hi)
            ev += 1
            if idx is not None:
                leaves.append((lo, hi, idx)); continue
            if max(norm_widths(cen, lo, hi)) <= wmin:
                nfail += 1; failed.append((lo, hi)); continue
            nxt.extend(split(cen, lo, hi))
        cur = nxt
        if not quiet:
            print(f"  {cen.name}: accepted {len(leaves)}, remaining {len(cur)}, evaluated {ev}, at limit {nfail} ({time.time()-t0:.0f} s)", flush=True)
        if ev > budget or time.time() - t0 > time_limit:
            return dict(name=cen.name, closed=False, timeout=True, leaves=leaves, ev=ev, nfail=nfail, failed=failed[:20],
                        open=len(cur), sec=time.time() - t0)
    return dict(name=cen.name, closed=(nfail == 0), leaves=leaves, ev=ev, nfail=nfail, failed=failed[:20], sec=time.time() - t0)


def build_centers(only=None):
    out = []
    for nm, side, q, kind in C.centers():
        if only and nm not in only:
            continue
        t0 = time.time()
        cen = Center(nm, side, q, kind)
        print(f"{nm}: {len(cen.cands)} candidates ({time.time()-t0:.1f} s)", flush=True)
        out.append(cen)
    return out


def header():
    a0, a1, beta = C.kappa_coefs()
    return dict(kind="root", H_MAX=str(C.H_MAX), R0=str(C.R0), BETA=str(beta), S_BAR=str(C.S_BAR), a0=str(a0), a1=str(a1),
                qhat=[str(t) for t in C.qhat()], centers=[[nm, side, [str(t) for t in q], kind] for nm, side, q, kind in C.centers()])


def cand_key(c):
    return [c["type"], c["mu"], c["top"], list(c["vs"])]


def run(name, only=None, wmin_exp=22, time_limit=3600):
    cens = build_centers(only)
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
                                              failed=[[[str(x) for x in lo], [str(x) for x in hi]] for lo, hi in r["failed"]])
            print(f"== {cen.name}: closed {r['closed']}, leaves {len(r['leaves'])}, evaluated {r['ev']}, at limit {r['nfail']}, types {types}, {r['sec']:.0f} s", flush=True)
    stats["closed"] = all(v["closed"] for v in stats["centers"].values())
    stats["header"] = hd
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print("== local: closed", stats["closed"], flush=True)
    return stats


def replay(name):
    """Re-check from the record alone: coverage from the root leaves (fixed splitting rule) and the exact test of the candidate of every leaf."""
    t0 = time.time()
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need(hd == json.loads(json.dumps(header())), "record header (constants, centres, kappa) differs from the current d40_common")
    cens = {c.name: c for c in build_centers()}
    by = {}
    for r in lines[1:]:
        by.setdefault(r["c"], {})[(tuple(r["lo"]), tuple(r["hi"]))] = r["cand"]
    cnt = dict(ok=0, bad=0)
    for nm, cen in cens.items():
        lv = by.get(nm, {})
        need(lv, f"{nm}: no leaves")
        idx = {json.dumps(cand_key(c)): i for i, c in enumerate(cen.cands)}
        dmax = 0
        for (lo, hi), ck in lv.items():
            lo_ = [Fr(x) for x in lo]; hi_ = [Fr(x) for x in hi]
            i = idx.get(json.dumps(ck))
            ok = i is not None and e0_ok(cen, cen.cands[i], lo_, hi_) and lam_lb(cen.cands[i], lo_, hi_) > 0
            cnt["ok" if ok else "bad"] += 1
        # coverage: split from the roots by the same rule until a recorded leaf is hit
        seen = 0; depth = 0
        cur = [(lo, hi) for _, lo, hi in root_leaves(cen)]
        keys = set(lv)
        while cur:
            need(depth <= 200, f"{nm}: a branch does not reach a leaf"); depth += 1
            nxt = []
            for lo, hi in cur:
                k = (tuple(str(x) for x in lo), tuple(str(x) for x in hi))
                if k in keys:
                    seen += 1; continue
                nxt.extend(split(cen, lo, hi))
            cur = nxt
        need(seen == len(lv), f"{nm}: coverage count does not match")
        print(f"replay {nm}: leaves {len(lv)}, coverage OK", flush=True)
    need(cnt["bad"] == 0, f"failed {cnt['bad']}")
    print(f"replay {name}: passed {cnt['ok']}, failed 0, {time.time()-t0:.0f} s", flush=True)
    return cnt


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d40_local")
    ap.add_argument("--only", default=None); ap.add_argument("--wmin-exp", type=int, default=22)
    ap.add_argument("--time-limit", type=int, default=3600)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.only.split(",") if a.only else None, a.wmin_exp, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
