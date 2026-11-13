# D16 §14 stage 2 (generalised): local lemma (exact arithmetic). d16c_local.py with the problem as an argument and several candidate sets J of active faces.
# 2026-11-12, written by Claude. Arguments and code were written by Claude with no third-party review; this is not a formal proof.
#
# L = {‖p‖∞ ≤ RHO0} in chart 0 (w = 1), R* = I (p = 0). Candidates (J, α) are those produced by d16e_step0.analyse:
#   J = 3 container faces active at R* (M_J = [n_j] non-singular), A = −M_J⁻¹ Rq n0, λ_j = A_j/ΣA, μ = N/ΣA.
#   Σλ = 1 and Σλ_j n_j + μ R n0 = 0 are identities. λ ≥ 0 and μ > 0 are used after checking per box A_j ≥ 0 (A_j/ρ ≥ 0 for j with A_j = 0 at R*)
#   and A_j > 0 for the others. Weak duality and h_j ≥ n_j·R v_j (v_j one of the tied vertices at R*, α) give φ ≥ B_{J,α},
#   F := N·ΣA·(B − S*) = Σ_j A_j (n_j·Rq v_j) + N² D0 − S*·N·ΣA (degree 4 in p, coefficients in Q(√D)).
# Check F(0) = 0 in Q(√D); with p = ρθ (θ on the 6 faces of the cube), F = ρ G. For each box (ρ, a1, a2) choose a candidate and
# show lower bound of G > 0 and the conditions on A using the enclosure of √D (integers only). Then φ > S* on L \ {0}.
#
# Usage: python d16e_local.py <problem> [--name name] [--scale fraction] [--sstar-shift fraction] (the last two are for injected-error tests)
import sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import sympy as sp
import flint
import d16e_common as C
from d16e_common import need, QD
import d16e_step0 as S0

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HDEG = 8
CTXH = flint.fmpz_mpoly_ctx.get(('r', 'a1', 'a2', 'd'), 'lex')
x, y, z, rho, a1, a2 = sp.symbols('x y z rho a1 a2')
RG = None   # symbols for the square roots of the generators (built after the field is read)


def rgens():
    global RG
    if RG is None:
        RG = sp.symbols(' '.join(f'r{g}' for g in QD.GENS) + ' _dummy')[:len(QD.GENS)]
    return RG

FACES = {
    "x=+1": (rho, rho*a1, rho*a2), "x=-1": (-rho, rho*a1, rho*a2),
    "y=+1": (rho*a1, rho, rho*a2), "y=-1": (rho*a1, -rho, rho*a2),
    "z=+1": (rho*a1, rho*a2, rho), "z=-1": (rho*a1, rho*a2, -rho),
}


def qds(v):
    v = QD.c(v)
    G = rgens()
    out = 0
    for m, c in enumerate(v.v):
        if c:
            t = sp.Rational(c.numerator, c.denominator)
            for i in range(len(G)):
                if (m >> i) & 1:
                    t = t * G[i]
            out += t
    return out


def red(expr):
    """Reduce a polynomial in the root symbols by r_g² = g into a tuple of components m (coefficients of √(m))."""
    G = rgens()
    p = sp.Poly(sp.expand(expr), *G)
    out = [0] * (1 << len(G))
    for ks, c in p.terms():
        m = 0; f = 1
        for i, k in enumerate(ks):
            m |= (k % 2) << i; f *= QD.GENS[i] ** (k // 2)
        out[m] += c * f
    return tuple(sp.expand(e) for e in out)


def to_int_h(*GS):
    den = 1
    for e in GS:
        if e != 0:
            for cf in sp.Poly(e, rho, a1, a2).coeffs():
                q = sp.Rational(cf).q; den = den * q // math.gcd(den, q)
    res = []
    for e in GS:
        dct = {}
        if e != 0:
            for (i, j, k), cf in sp.Poly(sp.expand(e * den), rho, a1, a2).terms():
                need(i + j + k <= HDEG, "degree exceeds HDEG")
                cf = sp.Rational(cf); need(cf.q == 1, "integrality")
                dct[(i, j, k, HDEG - i - j - k)] = int(cf.p)
        res.append(CTXH.from_dict(dct))
    return tuple(res), den


def shift_h(poly, Cc, W):
    s1, s2, s3 = C.CTXS.gens()
    dd = C.CTXS.from_dict({(0, 0, 0): C.DEN})
    return poly.compose(Cc[0] + W[0]*s1, Cc[1] + W[1]*s2, Cc[2] + W[2]*s3, dd, ctx=C.CTXS)


def lb_h(pt, Cc, W):
    return C.lb_shift(pt, Cc, W, sh=shift_h)


def gsum(GS):
    """Turn a tuple of components back into a symbolic expression (Σ e_m √(m))."""
    G = rgens(); out = 0
    for m, e in enumerate(GS):
        t = e
        for i in range(len(G)):
            if (m >> i) & 1:
                t = t * G[i]
        out += t
    return out


def build(P, an, scale=Fr(1), sstar=None):
    sstar = P.SSTAR if sstar is None else QD.c(sstar)
    q = (1, x, y, z)
    Rq = sp.Matrix(C.rot_q(q))
    N = 1 + x*x + y*y + z*z
    sc = sp.Rational(scale.numerator, scale.denominator)
    n0 = sp.Matrix([qds(c) for c in P.N0])
    Un = Rq * n0
    out = {}
    nz = 0
    for ci, cd in enumerate(an["cands"]):
        Mi = sp.Matrix([[qds(cd["Minv"][r][c]) for c in range(3)] for r in range(3)])
        A = [sp.expand(-(Mi.row(j) * Un)[0]) for j in range(3)]
        F = qds(P.D0) * sc * N**2 - qds(sstar) * N * sum(A)
        for j in range(3):
            n = [qds(c) for c in P.NORMALS[cd["J"][j]]]
            v = [qds(c) * sc for c in P.VERTS[cd["alpha"][j]]]
            F += A[j] * sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3))
        F = sp.expand(F)
        F0 = red(F.subs({x: 0, y: 0, z: 0}))
        need(all(e == 0 for e in F0), f"zero-order identity fails (candidate {ci}: {F0})")
        nz += 1
        zero = [j for j in range(3) if cd["A0"][j] == 0]
        for fname, sub in FACES.items():
            sbs = {x: sub[0], y: sub[1], z: sub[2]}
            GS = tuple(sp.cancel(e / rho) for e in red(sp.expand(F.subs(sbs, simultaneous=True))))
            need(all(e.is_polynomial(rho, a1, a2) for e in GS), "G is divisible by ρ")
            Hs = []
            for j in range(3):
                HS = red(sp.expand(A[j].subs(sbs, simultaneous=True)))
                if j in zero:
                    HS = tuple(sp.cancel(e / rho) for e in HS)
                    need(all(e.is_polynomial(rho, a1, a2) for e in HS), "A_j is divisible by ρ")
                Hs.append(tuple(sp.expand(e) for e in HS))
            out[(ci, fname)] = dict(G=tuple(sp.expand(e) for e in GS), H=Hs, zero=zero)
    return out, f"{nz} \u901a\u308a\u3068\u3082 0\uff08\u5168\u6210\u5206\uff09"  # value "all {nz} are 0 (every component)"; kept in Japanese (escaped) so that the info of the local record is reproduced byte for byte


def run(prob, name=None, scale=Fr(1), sstar=None, wmin_exp=30, quiet=False, save=True, time_limit=1800, P=None):
    t0 = time.time()
    P = P or C.load(prob)
    name = name or f"d16e_{prob}_local"
    an = S0.analyse(P)
    cands = an["cands"]
    raw, ident = build(P, an, scale, sstar)
    info = {"\u5019\u88dc\u306e\u6570": len(cands), "0 \u6b21\u306e\u6052\u7b49\u5f0f": ident}  # keys "number of candidates", "zero-order identity"; kept in Japanese (escaped) as written in the local records
    # cross-check of the first-order term with the stage-0 table: G(0, θ) = 2·ΣA(0)·c·θ
    if scale == 1 and sstar is None:
        for ci, cd in enumerate(cands):
            for fname, sub in FACES.items():
                GS = raw[(ci, fname)]["G"]
                th = [s_.subs(rho, 1) for s_ in sub]
                exp_ = sum(2 * qds(cd["sA0"]) * qds(cd["c"][k]) * th[k] for k in range(3))
                need(all(e == 0 for e in red(sp.expand(gsum(GS).subs(rho, 0) - exp_))), "first-order term disagrees with the stage-0 table")
        info["\u4e00\u6b21\u306e\u9805\u3068\u6bb5 0 \u306e\u8868"] = f"{len(cands) * 6} \u7d44\u3068\u3082\u4e00\u81f4\uff08G(0,\u03b8) = 2\u03a3A(0) c\u00b7\u03b8\uff09"  # key "first-order term vs stage-0 table", value "all {6·#candidates} pairs agree (...)"; kept in Japanese (escaped) as in the records
    prep = {}
    sq = [math.sqrt(C._mask_rad(m)) for m in range(C.nb())]
    for key, d in raw.items():
        GI = to_int_h(*d["G"])
        HI = [to_int_h(*h) for h in d["H"]]
        fG = sp.lambdify((rho, a1, a2), sum(sq[m] * e for m, e in enumerate(d["G"])))
        fH = [sp.lambdify((rho, a1, a2), sum(sq[m] * e for m, e in enumerate(h))) for h in d["H"]]
        prep[key] = dict(G=GI[0], H=[h[0] for h in HI], zero=d["zero"], fG=fG, fH=fH)
    D = C.DEN
    r0 = C.RHO0 * D; need(r0.denominator == 1, "RHO0"); r0 = int(r0)
    stats = dict(info=info, faces={})
    for fname in FACES:
        cur = [([0, -D, -D], [r0, D, D])]
        ev = acc = 0; lim = []; used = {}
        while cur:
            nxt = []
            for lo, hi in cur:
                if time.time() - t0 > time_limit:
                    raise RuntimeError("time limit reached")
                ev += 1
                Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
                cen = [v / D for v in Cc]
                sc_ = []
                for ci in range(len(cands)):
                    pr = prep[(ci, fname)]
                    hmin = min(float(f(*cen)) for f in pr["fH"])
                    sc_.append((hmin >= -1e-12, float(pr["fG"](*cen)), ci))
                order = [ci for ok_, g, ci in sorted(sc_, key=lambda t: (not t[0], -t[1]))]
                ok = False
                for ci in order[:4]:
                    pr = prep[(ci, fname)]
                    if lb_h(pr["G"], Cc, W) <= 0:
                        continue
                    good = True
                    for j in range(3):
                        lb = lb_h(pr["H"][j], Cc, W)
                        if (j in pr["zero"] and lb < 0) or (j not in pr["zero"] and lb <= 0):
                            good = False; break
                    if good:
                        ok = True; used[ci] = used.get(ci, 0) + 1; break
                if ok:
                    acc += 1; continue
                w = [h - l for l, h in zip(lo, hi)]
                if max(w) <= (D >> wmin_exp):
                    lim.append([[v / D for v in lo], [v / D for v in hi]]); continue
                ws = [w[0] * 16, w[1], w[2]]
                ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                nxt += [(list(lo), h1), (l2, list(hi))]
            cur = nxt
        stats["faces"][fname] = dict(evaluated=ev, accepted=acc, limit=len(lim), used_cand=used, limit_boxes=lim[:20])
        if not quiet:
            print(f"face {fname}: evaluated {ev}, accepted {acc}, split limit {len(lim)}", flush=True)
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = all(v["limit"] == 0 for v in stats["faces"].values())
    stats["params"] = dict(problem=prob, RHO0=str(C.RHO0), scale=str(scale), sstar=str(sstar), wmin_exp=wmin_exp)
    if save:
        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    if not quiet:
        print(f"== local {name}: closed {stats['closed']}, {stats['seconds']} s", flush=True)
    return stats


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("prob"); ap.add_argument("--name", default=None)
    ap.add_argument("--scale", default="1"); ap.add_argument("--sstar-shift", default="0")
    a = ap.parse_args()
    sh = Fr(a.sstar_shift)
    P = C.load(a.prob)
    st = run(a.prob, a.name, scale=Fr(a.scale), sstar=None if sh == 0 else P.SSTAR + sh, P=P)
    sys.exit(0 if st["closed"] else 2)
