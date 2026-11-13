# D16 cubinoct_n02: checker of the local lemma on L (exact arithmetic). 2026-11-11, written by Claude; no third-party review.
#
# Local box L = {0 ≤ b ≤ 1/16, 0 ≤ γ ≤ 1/16, 3/8 ≤ τ ≤ 7/16} (contains R* = (0, 0, τ*), τ* = √2 − 1, in its interior).
# Shows: φ ≥ S* on L, with equality only at R*.
#
# Tool: for the 4 sign vectors with σ₁ = −1, λ_σ = Λ_σ/(4m), μ = 1/u₁ (m = 1 − b² − γ², y = −2γ/m, z = −2b/m),
#   Λ_σ = m − 2σ₂γ − 2σ₃b + c·σ₂σ₃(m − 2γ − 2b), c = ±1.
# This is a dual feasible solution (Σλ = 1 and Σλσ + μu = 0 are checked as identities; Λ ≥ 0 is checked per box), so by weak duality
#   φ ≥ B_c := Σλ_σ g_σ + μ/2, and 8mN(B_c − S*) = F_c := Σ_σ Λ_σ Σ_j |P_σj| + 4N(1+b²+γ²) − 8mN·S*.
# P that do not vanish at R* use |P| ≥ ε·P (ε = sign at R*); P that vanish there (the 4 folds) are kept as |P|.
# Writing x = (b, γ, η), η = τ − τ*, as ρ·θ (ρ = ‖x‖∞, θ on one of 4 faces), the zero-order identity (checked exactly in Q(√2)) gives
#   F_c ≥ ρ·G_c(ρ, θ), G_c = H_c + Σ_f Λ_σ(f)·|Q_f| (H_c, Q_f polynomials in (ρ, θ) with coefficients in Q(√2)).
# For each box (ρ, a₁, a₂) choose c and ε_f = ±1 and show H_c + Σ Λ ε_f Q_f > 0 using the rational enclosure of √2 (integers only).
# Then F_c > 0 for ρ > 0, i.e. φ ≥ B_c > S*.
#
# Usage: python d16_cover_local.py [name=d16_local] [--Sstar-shift fraction] (for the injected-error test m1)
import sys, json, time, math, argparse
from fractions import Fraction as Fr
import sympy as sp
import flint
import d16_cover_common as C
from d16_cover_common import need

try:
    import psutil; psutil.Process().nice(psutil.IDLE_PRIORITY_CLASS)
except Exception:
    pass

RHO0 = Fr(1, 16)
L_BOX = C.L_BOX                              # defined in one place, d16_cover_common.py
HDEG = 12                                   # homogenisation degree (the actual degree is checked)
CTXH = flint.fmpz_mpoly_ctx.get(('r', 'a1', 'a2', 'd'), 'lex')
SIG4 = [(-1, s2, s3) for s2 in (1, -1) for s3 in (1, -1)]

rho, a1, a2, rr = sp.symbols('rho a1 a2 rr')      # rr stands for √2 (reduced with rr² = 2)
bS, gS, eS = sp.symbols('b g eta')

FACES = {   # (b, γ, η) = ρ·θ(a1, a2), ranges of a
    "g=1":  ((rho*a1, rho, rho*a2), (Fr(0), Fr(1)), (Fr(-1), Fr(1))),
    "b=1":  ((rho, rho*a1, rho*a2), (Fr(0), Fr(1)), (Fr(-1), Fr(1))),
    "e=+1": ((rho*a1, rho*a2, rho), (Fr(0), Fr(1)), (Fr(0), Fr(1))),
    "e=-1": ((rho*a1, rho*a2, -rho), (Fr(0), Fr(1)), (Fr(0), Fr(1))),
}


def red2(expr):
    """Reduce a polynomial in rr with rr² = 2 and split it into (rational part, coefficient of √2)."""
    p = sp.Poly(sp.expand(expr), rr)
    A = 0; B = 0
    for (k,), c in p.terms():
        if k % 2 == 0:
            A += c * 2 ** (k // 2)
        else:
            B += c * 2 ** (k // 2)
    return sp.expand(A), sp.expand(B)


def q2_sign(A, B):
    """Exact sign of A + B√2 (A, B rational)."""
    A = sp.Rational(A); B = sp.Rational(B)
    if B == 0:
        return int(sp.sign(A))
    if A == 0:
        return int(sp.sign(B))
    if (A > 0) == (B > 0):
        return int(sp.sign(A))
    # opposite signs: compare |A| with |B|√2
    return int(sp.sign(A)) if A * A > 2 * B * B else int(sp.sign(B)) if A * A < 2 * B * B else 0


def build(Sstar_shift=Fr(0)):
    """Check the identities and build the polynomial of each face (integer coefficients, homogenised). Sstar_shift ≠ 0 is for test m1 (shifts S*)."""
    tstar = rr - 1
    tau = tstar + eS
    w, x, y, z = 1, tau, -bS + gS*tau, gS + bS*tau
    Rq = sp.Matrix([[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
                    [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
                    [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]])
    N = w*w + x*x + y*y + z*z
    m = 1 - bS**2 - gS**2
    Sst = 1 + rr/2 + sp.Rational(Sstar_shift.numerator, Sstar_shift.denominator)
    U1 = Rq[0, 0]
    # u = R e1 does not depend on τ: (m, 2γ, 2b)/(1+b²+γ²); U = (1+τ²)·(m, 2γ, 2b)
    for i, v in enumerate([m, 2*gS, 2*bS]):
        need(red2(Rq[i, 0] - (1 + tau**2) * v) == (0, 0), "form of u")
    need(red2(N - (1 + tau**2) * (1 + bS**2 + gS**2)) == (0, 0), "form of N")
    info = {}
    out = {}
    for c in (1, -1):
        Lam = {s: m - 2*s[1]*gS - 2*s[2]*bS + c*s[1]*s[2]*(m - 2*gS - 2*bS) for s in SIG4}
        # dual feasibility (identities): Σλ = 1, Σλσ + μu = 0 (λ = Λ/(4m), μ u = (m, 2γ, 2b)/m)
        need(sp.expand(sum(Lam.values()) - 4*m) == 0, "Σλ = 1")
        need(sp.expand(sum(Lam[s] * s[0] for s in SIG4) + 4*m) == 0, "Σλσ₁ + μu₁ = 0")
        need(sp.expand(sum(Lam[s] * s[1] for s in SIG4) + 4*2*gS) == 0, "Σλσ₂ + μu₂ = 0")
        need(sp.expand(sum(Lam[s] * s[2] for s in SIG4) + 4*2*bS) == 0, "Σλσ₃ + μu₃ = 0")
        poly = 4*N*(1 + bS**2 + gS**2) - 8*m*N*Sst
        folds = []
        for s in SIG4:
            for j in range(3):
                P = s[0]*Rq[0, j] + s[1]*Rq[1, j] + s[2]*Rq[2, j]
                P0 = red2(P.subs({bS: 0, gS: 0, eS: 0}))
                sg = q2_sign(*P0)
                if sg == 0:
                    folds.append((s, j, P))
                else:
                    poly += Lam[s] * sg * P
        need(len(folds) == 4, f"there must be 4 fold terms ({len(folds)})")
        # zero-order identity (exact in Q(√2))
        c0 = red2(poly.subs({bS: 0, gS: 0, eS: 0}))
        info[f"c={c}: zero-order term of F"] = [str(c0[0]), str(c0[1])]
        need(c0 == (0, 0), f"zero-order identity fails (c={c}: {c0[0]} + {c0[1]}√2)")
        for fname, (sub, _, _) in FACES.items():
            sb = {bS: sub[0], gS: sub[1], eS: sub[2]}
            H = sp.expand(poly.subs(sb))
            HA, HB = red2(H)
            HA = sp.cancel(HA / rho); HB = sp.cancel(HB / rho)
            need(HA.is_polynomial(rho, a1, a2) and HB.is_polynomial(rho, a1, a2), "H is divisible by ρ")
            Qs = []
            for (s, j, P) in folds:
                QA, QB = red2(sp.expand(P.subs(sb)))
                QA = sp.cancel(QA / rho); QB = sp.cancel(QB / rho)
                need(QA.is_polynomial(rho, a1, a2) and QB.is_polynomial(rho, a1, a2), "fold terms are divisible by ρ")
                Qs.append((s, j, QA, QB, sp.expand(Lam[s].subs(sb))))
            out[(c, fname)] = (HA, HB, Qs, sp.expand(m.subs(sb)), {s: sp.expand(Lam[s].subs(sb)) for s in SIG4})
    return out, info


def to_int_h(expr, scale):
    """A polynomial in (ρ, a1, a2) with rational coefficients, times scale, as a CTXH polynomial with integer coefficients homogenised to degree HDEG."""
    p = sp.Poly(sp.expand(expr * scale), rho, a1, a2)
    dct = {}
    for (i, j, k), cf in p.terms():
        need(i + j + k <= HDEG, "degree exceeds HDEG")
        cf = sp.Rational(cf); need(cf.q == 1, "coefficient is not an integer (scale too small)")
        dct[(i, j, k, HDEG - i - j - k)] = int(cf.p)
    return CTXH.from_dict(dct)


def denom_lcm(*exprs):
    d = 1
    for e in exprs:
        if e == 0:
            continue
        for cf in sp.Poly(sp.expand(e), rho, a1, a2).coeffs():
            d = d * sp.Rational(cf).q // math.gcd(d, sp.Rational(cf).q)
    return d


def shift_h(poly, Cc, W):
    s1, s2, s3 = C.CTXS.gens()
    dd = C.CTXS.from_dict({(0, 0, 0): C.DEN})
    return poly.compose(Cc[0] + W[0]*s1, Cc[1] + W[1]*s2, Cc[2] + W[2]*s3, dd, ctx=C.CTXS)


SQ_K = 120
SQ_LO = C.S2LO * 2**SQ_K; SQ_HI = C.S2HI * 2**SQ_K
need(SQ_LO.denominator == 1 and SQ_HI.denominator == 1, "the enclosure of √2 is in units of 2^-120")
SQ_LO = int(SQ_LO); SQ_HI = int(SQ_HI)


def lower_bound_q2(QA, QB):
    """Lower bound × 2^SQ_K (integer) of Σ (a_α + √2 b_α) s^α on s ∈ [−1,1]³."""
    tA = dict((m, int(c)) for m, c in QA.terms()); tB = dict((m, int(c)) for m, c in QB.terms())
    lb = 0
    for mon in set(tA) | set(tB):
        a = tA.get(mon, 0) << SQ_K; b = tB.get(mon, 0)
        lo = a + (b * SQ_LO if b >= 0 else b * SQ_HI)
        hi = a + (b * SQ_HI if b >= 0 else b * SQ_LO)
        if mon == (0, 0, 0):
            lb += lo
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, lo)
        else:
            lb -= max(abs(lo), abs(hi))
    return lb


def prepare(Sstar_shift=Fr(0)):
    t0 = time.time()
    raw, info = build(Sstar_shift)
    prep = {}
    for key, (HA, HB, Qs, mexp, Lams) in raw.items():
        prods_A = [sp.expand(Lm * QA) for (_, _, QA, QB, Lm) in Qs]
        prods_B = [sp.expand(Lm * QB) for (_, _, QA, QB, Lm) in Qs]
        den = denom_lcm(HA, HB, *prods_A, *prods_B, mexp, *Lams.values())
        prep[key] = dict(
            HA=to_int_h(HA, den), HB=to_int_h(HB, den),
            PA=[to_int_h(e, den) for e in prods_A], PB=[to_int_h(e, den) for e in prods_B],
            Qf=[(sp.lambdify((rho, a1, a2), QA + sp.sqrt(2)*QB)) for (_, _, QA, QB, _) in Qs],
            Hf=sp.lambdify((rho, a1, a2), HA + sp.sqrt(2)*HB),
            Lf=[sp.lambdify((rho, a1, a2), Lm) for (_, _, _, _, Lm) in Qs],
            m=to_int_h(mexp, den), Lam=[to_int_h(e, den) for e in Lams.values()], den=den)
    info["setup seconds"] = round(time.time() - t0, 1)
    return prep, info


def check_box(prep, fname, lo, hi):
    """True if on the box (integers in units of 1/DEN, (ρ, a1, a2)) the lower bound of G_c is > 0 for c = +1 or c = −1."""
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "box widths must be positive and even")
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    cen = [float(Fr(v, C.DEN)) for v in Cc]
    best = None
    for c in (1, -1):
        p = prep[(c, fname)]
        # the preconditions m > 0 and Λ_σ ≥ 0 were checked once on all of L (check_lam_global)
        # ε_f is the sign of Q_f at the centre (floating point; either choice is valid)
        A = p["HA"]; B = p["HB"]
        for f in range(4):
            e = 1 if float(p["Qf"][f](*cen)) >= 0 else -1
            A = A + e * p["PA"][f]; B = B + e * p["PB"][f]
        lb = lower_bound_q2(shift_h(A, Cc, W), shift_h(B, Cc, W))
        if lb > 0:
            return True, c
        best = lb if best is None else max(best, lb)
    return False, best


def check_lam_global(Lb=L_BOX):
    """Exactly check m > 0 and Λ_σ ≥ 0 for c = ±1 on L (0 ≤ b ≤ bL, 0 ≤ γ ≤ γL).
    Since the variables are non-negative, each monomial lies in [0, h^degree]: polynomial ≥ constant term + Σ min(0, coefficient)·(upper bound of the monomial)."""
    hb, hg = sp.Rational(Lb[0].numerator, Lb[0].denominator), sp.Rational(Lb[1].numerator, Lb[1].denominator)
    def lb_nonneg(expr):
        pp = sp.Poly(sp.expand(expr), bS, gS)
        v = 0
        for (i, j), cf in pp.terms():
            if i == 0 and j == 0:
                v += cf
            else:
                v += min(0, cf) * hb**i * hg**j
        return v
    m = 1 - bS**2 - gS**2
    res = {"m": str(lb_nonneg(m))}
    need(lb_nonneg(m) > 0, "m > 0 on L")
    for c in (1, -1):
        for s in SIG4:
            Lam = m - 2*s[1]*gS - 2*s[2]*bS + c*s[1]*s[2]*(m - 2*gS - 2*bS)
            v = lb_nonneg(Lam)
            res[f"c={c} σ={s}"] = str(v)
            need(v >= 0, f"Λ ≥ 0 on L (c={c}, σ={s}: lower bound {v})")
    return res


def run(name="d16_local", Sstar_shift=Fr(0), wmin_exp=30, quiet=False, save=True):
    t0 = time.time()
    # L ⊂ {ρ ≤ 1/16} exactly: τ* − 3/8 < 1/16 ⟺ √2 < 23/16, 7/16 − τ* < 1/16 ⟺ √2 > 11/8
    need(C.S2HI < Fr(23, 16) and C.S2LO > Fr(11, 8), "L lies in ρ ≤ 1/16")
    need(L_BOX[0] <= RHO0 and L_BOX[1] <= RHO0, "b, γ of L are ≤ ρ0")
    prep, info = prepare(Sstar_shift)
    info["lower bounds of Λ ≥ 0 and m > 0 (all of L)"] = check_lam_global()
    stats = dict(info=info, faces={})
    D = C.DEN
    for fname, (_, ra1, ra2) in FACES.items():
        root = ([0, int(ra1[0]*D), int(ra2[0]*D)], [int(RHO0*D), int(ra1[1]*D), int(ra2[1]*D)])
        cur = [root]; acc = 0; ev = 0; lim = []; level = 0; used = {1: 0, -1: 0}
        while cur:
            nxt = []
            for lo, hi in cur:
                ev += 1
                ok, c = check_box(prep, fname, lo, hi)
                if ok:
                    acc += 1; used[c] += 1; continue
                w = [h - l for l, h in zip(lo, hi)]
                # ρ width about 1/16 of the a width (since ρ ≤ 1/16)
                ws = [w[0] * 16, w[1], w[2]]
                if max(w) <= (D >> wmin_exp):
                    lim.append(([float(Fr(v, D)) for v in lo], [float(Fr(v, D)) for v in hi], c)); continue
                ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
                h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
                nxt += [(list(lo), h1), (l2, list(hi))]
            cur = nxt; level += 1
        stats["faces"][fname] = dict(evaluated=ev, accepted=acc, limit=len(lim), used_c=used, limit_boxes=lim[:20], levels=level)
        if not quiet:
            print(f"face {fname}: evaluated {ev}, accepted {acc} (c=+ {used[1]}, c=− {used[-1]}), split limit {len(lim)}", flush=True)
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = all(v["limit"] == 0 for v in stats["faces"].values())
    stats["params"] = dict(RHO0=str(RHO0), L=[str(x) for x in L_BOX], Sstar_shift=str(Sstar_shift), wmin_exp=wmin_exp)
    if save:
        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    if not quiet:
        print(f"== local {name}: closed {stats['closed']}, {stats['seconds']} s", flush=True)
    return stats


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="d16_local")
    ap.add_argument("--Sstar-shift", default="0")
    a = ap.parse_args()
    run(a.name, Sstar_shift=Fr(a.Sstar_shift))
