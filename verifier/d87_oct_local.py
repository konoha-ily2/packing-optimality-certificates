# -*- coding: utf-8 -*-
"""D48 stage O1 (L4″, octincub_n09): the three local lemmas. Point P2 ((II)), band J3 ((III), 2-dimensional base), band J4 ((IV), 1-dimensional base).
2026-11-14 (late night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Acceptance uses only integers and rationals (integer polynomials of flint, Fraction). Floating point is used only to order the candidates.
Based on d86_local.py (move to the box and bound each monomial from below, the structure of split and replay). Nothing from d86_* is imported (only the structure was copied).

■ Coordinates (the same as d87_cub_common: piece K̂ = {|x|+|y|+|z| ≤ 1}, container [−4/3, 4/3]³, columns r_k of the rotation R).
  Every lemma writes n in "body coordinates" ν: n = R ν. Then max_k |n·r_k| = max_k |ν_k|, and a tie of top vertices becomes a tie of components of ν.
  ν⁺ := (1 + z1 + z2, 1 − z1 + z2, 1 − 2 z2) (the components sum to 3. G is homogeneous of degree 1 in n, so this normalization suffices).
  Candidate k for the top vertex: |ν_k| ≥ σ_k ν_k = ν⁺_k. Candidate j for the reach towards a wall: e_i(R) = max_j |R_ij| ≥ R_ij (only the entries whose sign is + at the equality point are used).
  The coefficient of (n_i)₋ is ≥ 0 on the region (cone) of every lemma, so each candidate expression satisfies G_c ≤ G (substitution from below). Points outside the cone are not part of the claim of the lemma (see the note below).

■ P2 ((II), n = −m, m ≥ 0): R = R* · M(1, p)/|q|² (on the body side), ν = −ν⁺, m = R ν⁺.
    G_c = ν⁺_k + Σ_i m_i (R_{i, j_i} − 1), k ∈ {0,1,2}, j_x ∈ {0,1}, j_y ∈ {0,2}, j_z ∈ {1,2} (24 candidates).
  The 5 variables (z1, z2, p1, p2, p3) are written ζ = r·ζ̂ (‖ζ̂‖∞ = 1, 10 faces). P_c := |q|⁴ G_c; build checks P_c(0) ≡ 0, and P_c = r·Λ_c.
  Acceptance of a leaf (type F): for some c the lower bound of Λ_c is > 0.

■ J3 ((III), n = (a, b, −c), a, b, c ≥ 0): R = Rz(u) · B(α, β) · R_III, Rz(u) = M(1,0,0,u)/(1+u²), B = M(1, −α, −β, 0)/(1+α²+β²),
  α = s + y, β = y − s, ν = ν⁺. The z row of R is Rᵀe_z = R_IIIᵀ σ(α, β) (σ is the inverse of the stereographic projection from the pole −e_z; it does not depend on u), and
  the z tie R_z1 = R_z2 ⇔ σ_x = σ_y ⇔ y = 0 (it is a straight line because R_III(e₂ − e₃) = (1, −1, 0) spans a great circle through the pole).
  Hence the family S (on which all ties of top vertices and the z tie are kept) is **exactly {y = 0, z1 = z2 = 0}**, base (u, s), transverse (y, z1, z2).
    G_c = ν⁺_k + c (−R_{z, j} − 4/3) − n·w_A, k ∈ {0,1,2}, j ∈ {1,2} (6 candidates), c = −n_z.
  P_c := (1+u²)(1+α²+β²)² G_c (rational before conversion to integer coefficients). On the family all candidates have the same value T(u, s) (checked by build).
  Acceptance of a leaf (type F): T ≥ 0 on the base box (the T check below), and for some c the lower bound of Λ_c is > 0. Then P_c = T + rΛ_c ≥ 0.
  The T check: write T = u²·A + u s·B + s²·C (A, B, C are polynomials; the monomials are assigned by a fixed rule), and on the box, if
    lower bound of A > 0, lower bound of C > 0 and (upper bound of |B|)² ≤ 4·(lower bound of A)·(lower bound of C), then T ≥ 0 (a positive definite 2×2). Or the lower bound of T itself is ≥ 0.

■ J4 ((IV), n = (−a, −b, c)): R = R_III · M(1, p)/|q|², ν = −ν⁺.
    G_c = ν⁺_k + a (R_{x, jx} − 4/3) + b (R_{y, jy} − 4/3) − n·w_A, a = −n_x, b = −n_y, k ∈ {0,1,2}, jx ∈ {0,1}, jy ∈ {0,2} (12 candidates).
  The x and y ties (R_x0 = R_x1, R_y0 = R_y2) are two quadratic equations in p, and their zero curve C (1-dimensional) is the base.
  C is approximated by a polynomial in τ, φ(τ) = τ d + Σ_{j=2..ORD} τ^j c_j (c_j ⊥ d, rational, solved degree by degree so that the tie equations are O(τ^{ORD+1})), and
  p = φ(τ) + l1 e1 + l2 e2 (e1, e2 are rational directions orthogonal to d). Transverse (l1, l2, z1, z2).
  φ may be an approximation (the proof uses only "P_c ≥ 0 in these coordinates"). T_c(τ) := P_c(τ, transverse 0) differs between candidates (the differences are of order τ^{ORD+1}).
  Acceptance of a leaf (type F): for some c, "T_c ≥ 0 on the τ interval (T_c = τ²·A_c with lower bound of A_c ≥ 0, or lower bound of T_c ≥ 0)" and the lower bound of Λ_c is > 0.

■ Note (outside the cone): the claim of a lemma is "for the points of the region whose n lies in the cone (−Q\* for P2, (+,+,−) for J3, (−,−,+) for J4), G ≥ the right-hand side of (★)".
  A box may contain points outside the cone (showing P_c ≥ 0 there does no harm). The region is the "assigned region" below (recorded in the header).
■ Assigned region (handed over to the far region): the set of (n, R) on which each lemma shows G ≥ 0 is the coordinate box
    P2: |z_i| ≤ RZ, |p_i| ≤ RP (RZ = r_max·SC_z, RP = r_max·SC_p)
    J3: u ∈ [U0, U1], s ∈ [S0, S1], |y| ≤ r_max·SC_y, |z_i| ≤ r_max·SC_z
    J4: τ ∈ [T0, T1], |l_i| ≤ r_max·SC_l, |z_i| ≤ r_max·SC_z
  The coordinates are recovered from (n, R) by rational operations only (a floating-point version in `coords_of`, the formulas in the comments of each function). Images under the 24 rotations of the piece and x ↔ y are handled on the far side.

Usage: python -X utf8 d87_oct_local.py check            (identities of build, ties on the family, the degree-0 and degree-1 parts of T are 0)
        python -X utf8 d87_oct_local.py explore KIND     (floating-point preview: Λ and T)
        python -X utf8 d87_oct_local.py run KIND [--procs 2] [--name NAME]
        python -X utf8 d87_oct_local.py replay KIND [--name NAME]
"""
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
import d87_cub_common as C

Z1, Z2, P1, P2s, P3, Us, Ss, Ys, TAU, L1, L2 = sp.symbols("z1 z2 p1 p2 p3 u s y tau l1 l2")
RS = sp.Symbol("r"); TS = sp.symbols("t1 t2 t3 t4")
WA = [sp.Rational(5, 18), sp.Rational(5, 18), sp.Rational(2, 9)]
WQ = [sp.Rational(1, 3)] * 3            # used instead of WA by the test-only error ("w", "Q") (stage O4)
ORD_J4 = 2

# Keys of the summary .json written by run() and of the dict returned by replay(). They are kept as in the records (Japanese
# words, written here as escapes) so that a re-run writes the same keys (d87_oct_replay_all.py reads them). Meaning in the comment.
K_EV = "\u8a55\u4fa1"  # evaluated
K_ACC = "\u53d7\u7406"  # accepted
K_LIM = "\u5206\u5272\u306e\u9650\u754c"  # at the split limit
K_TIMEOUT = "\u6642\u9593\u5207\u308c"  # timed out
K_TYPE = "\u578b"  # types (counts of leaf types)
K_LIMBOX = "\u9650\u754c\u306e\u7bb1"  # boxes at the limit
K_SEC = "\u79d2"  # seconds
K_LEAF = "\u8449"  # leaves
K_FAIL = "\u4e0d\u5408\u683c"  # failed


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def rat(x):
    x = Fr(x)
    return sp.Rational(x.numerator, x.denominator)


def fr(e):
    e = sp.Rational(e)
    return Fr(int(e.p), int(e.q))


def smat(R):
    return sp.Matrix([[rat(x) for x in row] for row in R])


def Mq(w, x, y, z):
    """|q|² R(q) (the rotation matrix without normalization)."""
    return sp.Matrix([
        [w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
        [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
        [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]])


def nu_plus():
    return sp.Matrix([1 + Z1 + Z2, 1 - Z1 + Z2, 1 - 2 * Z2])


R_STAR = smat(C.R_STAR)
R_III = smat(C.R_III)


# ---------------- candidate polynomials ----------------
def cands(kind):
    if kind == "P2":
        return [(k, jx, jy, jz) for k in range(3) for jx in (0, 1) for jy in (0, 2) for jz in (1, 2)]
    if kind == "J3":
        return [(k, j) for k in range(3) for j in (1, 2)]
    if kind == "J4":
        return [(k, jx, jy) for k in range(3) for jx in (0, 1) for jy in (0, 2)]
    raise ValueError(kind)


def J4_curve():
    """Polynomial approximation φ(τ) in τ of C (the zero set of the x and y ties), and the transverse directions e1, e2 (rational)."""
    p = sp.Matrix([P1, P2s, P3])
    Mf = R_III * Mq(1, P1, P2s, P3)
    f = [sp.expand(Mf[0, 0] - Mf[0, 1]), sp.expand(Mf[1, 0] - Mf[1, 2])]
    J = sp.Matrix([[sp.diff(fi, v).subs({P1: 0, P2s: 0, P3: 0}) for v in (P1, P2s, P3)] for fi in f])
    ns = J.nullspace()
    need(len(ns) == 1, "J4: the null space of the linear part of the ties is not 1-dimensional")
    d = ns[0]
    d = d / sp.gcd(list(d)) if all(x.is_integer for x in d) else d
    den = sp.ilcm(*[sp.fraction(x)[1] for x in d]); d = d * den
    g = sp.igcd(*[int(x) for x in d]); d = d / g
    # a rational basis of d ⊥
    e1 = d.cross(sp.Matrix([1, 0, 0])) if d.cross(sp.Matrix([1, 0, 0])).norm() != 0 else d.cross(sp.Matrix([0, 1, 0]))
    e2 = d.cross(e1)
    e1 = e1 / sp.igcd(*[int(x) for x in e1]); e2 = e2 / sp.igcd(*[int(x) for x in e2])
    phi = TAU * d
    cs = []
    for j in range(2, ORD_J4 + 1):
        a, b = sp.symbols("ca cb")
        trial = phi + TAU ** j * (a * e1 + b * e2)
        sub = {P1: trial[0], P2s: trial[1], P3: trial[2]}
        eqs = [sp.expand(fi.subs(sub, simultaneous=True)).coeff(TAU, j) for fi in f]
        sol = sp.solve(eqs, [a, b], dict=True)
        need(len(sol) == 1, f"J4: degree {j} of φ cannot be solved")
        phi = sp.expand(phi + TAU ** j * (sol[0][a] * e1 + sol[0][b] * e2))
        cs.append([sol[0][a], sol[0][b]])
    sub = {P1: phi[0], P2s: phi[1], P3: phi[2]}
    for fi in f:
        e = sp.Poly(sp.expand(fi.subs(sub, simultaneous=True)), TAU)
        need(all(m[0] > ORD_J4 for m, c in e.terms() if c != 0), "J4: the remainder of the ties under φ contains low degrees")
    return dict(d=d, e1=e1, e2=e2, phi=phi, cs=cs, f=f)


def P_poly(kind, c, od=None):
    """P_c of candidate c (a sympy polynomial; the variables depend on kind).
    od is a test-only error (stage O4): ("S", δ) changes the container half-edge 4/3 to 4/3 + δ (and the constant 1 = 4/3 − 1/3 of P2 to 1 + δ),
    ("w", "Q") changes w_A to w_Q. Both must be rejected (they fail at a need on the identities of build)."""
    od = od or {}
    ds = rat(od.get("S", 0))
    S43 = sp.Rational(4, 3) + ds
    wv = WQ if od.get("w") == "Q" else WA
    nu = nu_plus()
    if kind == "P2":
        Q = 1 + P1**2 + P2s**2 + P3**2
        Mf = R_STAR * Mq(1, P1, P2s, P3)
        m = Mf * nu
        k, jx, jy, jz = c
        e = nu[k] * Q**2
        for i, j in zip(range(3), (jx, jy, jz)):
            e += m[i] * (Mf[i, j] - (1 + ds) * Q)
        return sp.expand(e)
    if kind == "J3":
        al, be = Ss + Ys, Ys - Ss
        QB = 1 + al**2 + be**2
        MB = Mq(1, -al, -be, 0)
        Mz = Mq(1, 0, 0, Us)
        MBR = MB * R_III
        Mf = Mz * MBR
        k, j = c
        cz = -(MBR * nu)[2]                       # c·QB
        nw = sum((Mf * nu)[i] * wv[i] for i in range(3))   # (n·w_A)·(1+u²)QB
        e = nu[k] * (1 + Us**2) * QB**2 + cz * (-MBR[2, j] - S43 * QB) * (1 + Us**2) - nw * QB
        return sp.expand(e)
    if kind == "J4":
        cv = J4_curve_cache()
        p = cv["phi"] + L1 * cv["e1"] + L2 * cv["e2"]
        Q = sp.expand(1 + p[0]**2 + p[1]**2 + p[2]**2)
        Mf = R_III * Mq(1, p[0], p[1], p[2])
        Rn = Mf * nu                               # (R ν⁺)·Q = −n·Q
        k, jx, jy = c
        e = nu[k] * Q**2 + Rn[0] * (Mf[0, jx] - S43 * Q) + Rn[1] * (Mf[1, jy] - S43 * Q) \
            + sum(Rn[i] * wv[i] for i in range(3)) * Q
        return sp.expand(e)
    raise ValueError(kind)


_CV = {}


def J4_curve_cache():
    if "c" not in _CV:
        _CV["c"] = J4_curve()
    return _CV["c"]


def vars_of(kind):
    """(base variables, transverse variables)."""
    if kind == "P2":
        return (), (Z1, Z2, P1, P2s, P3)
    if kind == "J3":
        return (Us, Ss), (Ys, Z1, Z2)
    return (TAU,), (L1, L2, Z1, Z2)


# ---------------- region settings ----------------
DU = 2 ** 30
SPEC = {
    # base: range of the base, sc: scale of each transverse coordinate, rmax: upper bound of r. Transverse coordinate = sc_i · r · ζ̂_i, ‖ζ̂‖∞ = 1
    "P2": dict(base=[], sc=[Fr(1), Fr(1), Fr(1), Fr(1), Fr(1)], rmax=Fr(1, 8)),
    "J3": dict(base=[(Fr(-1, 4), Fr(1, 4)), (Fr(-1, 8), Fr(1, 4))], sc=[Fr(1, 4), Fr(1), Fr(1)], rmax=Fr(1, 8)),
    "J4": dict(base=[(Fr(-3, 64), Fr(3, 64))], sc=[Fr(1), Fr(1, 5), Fr(2), Fr(2)], rmax=Fr(1, 16)),
}


def faces(kind):
    return [(i, fv) for i in range(len(SPEC[kind]["sc"])) for fv in (1, -1)]


def lcm_den(vals):
    den = 1
    for v in vals:
        q = int(sp.Rational(v).q)
        den = den * q // math.gcd(den, q)
    return den


def to_int(dct):
    den = lcm_den(dct.values())
    return {tuple(m): int(sp.Rational(v) * den) for m, v in dct.items()}


def build(kind, opts=()):
    """For each candidate T_c (base only); for each face Λ_c and P_c (the 5 box variables r, t…, base…).
    opts are test-only errors: ('lam', δ) subtracts δ from the constant term of Λ_c (must be rejected). Added in stage O4:
    ('S', δ) and ('w', 'Q') are described in P_poly, ('rmax', r) sets the upper bound of the transverse width to r (root_box), ('noquad', 1) removes
    the (quadratic) treatment T_c = τ²A_c of J4 and keeps only lower bound of T_c ≥ 0 (TCheck)."""
    od = dict(opts)
    sp_ = SPEC[kind]
    base, lat = vars_of(kind)
    L_ = len(lat)
    bvars = (RS,) + TS[:L_ - 1] + base
    need(len(bvars) == 5, "the box has 5 variables")
    Ts = {}; lam = {}; Pf = {}
    for c in cands(kind):
        P = P_poly(kind, c, od)
        T = sp.expand(P.subs({v: 0 for v in lat}))
        Ts[c] = T
        Dp = sp.expand(P - T)
        Tterms = sp.Poly(T, *bvars).terms() if T != 0 else []
        for fi, fv in faces(kind):
            sub = {}; k_ = 0
            for j, v in enumerate(lat):
                sub[v] = rat(sp_["sc"][j]) * RS * (fv if j == fi else TS[k_])
                if j != fi:
                    k_ += 1
            e = sp.Poly(sp.expand(Dp.subs(sub, simultaneous=True)), *bvars)
            ld = {}
            for mon, cf in e.terms():
                need(mon[0] >= 1, "not divisible by r")
                ld[(mon[0] - 1,) + tuple(mon[1:])] = sp.Rational(cf)
            if "lam" in od:
                ld[(0,) * 5] = ld.get((0,) * 5, 0) - rat(od["lam"])
            pd = {(m[0] + 1,) + m[1:]: v for m, v in ld.items()}
            for mon, cf in Tterms:
                pd[tuple(mon)] = pd.get(tuple(mon), 0) + sp.Rational(cf)
            lam[(fi, fv, c)] = to_int({m: v for m, v in ld.items() if v != 0})
            Pf[(fi, fv, c)] = to_int({m: v for m, v in pd.items() if v != 0})
    out = dict(kind=kind, lam=lam, Pf=Pf, noquad=bool(od.get("noquad")), rmax=Fr(od["rmax"]) if "rmax" in od else sp_["rmax"])
    if kind == "P2":
        need(all(T == 0 for T in Ts.values()), "P2: T ≢ 0")
    elif kind == "J3":
        vals = list(Ts.values())
        need(all(sp.expand(v - vals[0]) == 0 for v in vals), "J3: the candidates do not have the same value on the family")
        A = {}; Bq = {}; Cc = {}; Td = {}
        for (i, j), cf in sp.Poly(vals[0], Us, Ss).terms():
            cf = sp.Rational(cf)
            need(i + j >= 2, "J3: T has terms of degree 0 or 1")
            Td[(i, j)] = cf
            if i >= 2:
                A[(i - 2, j)] = A.get((i - 2, j), 0) + cf
            elif j >= 2:
                Cc[(i, j - 2)] = Cc.get((i, j - 2), 0) + cf
            else:
                Bq[(0, 0)] = Bq.get((0, 0), 0) + cf
        den = lcm_den(list(A.values()) + list(Bq.values()) + list(Cc.values()))   # A, B, C with the same denominator
        out["T"] = dict(T=to_int(Td), A={m: int(v * den) for m, v in A.items()},
                        B={m: int(v * den) for m, v in Bq.items()} or {(0, 0): 0}, C={m: int(v * den) for m, v in Cc.items()})
        out["T_sym"] = vals[0]
    else:
        out["T"] = {}
        for c, T in Ts.items():
            Td = {}; Ad = {}
            for (i,), cf in sp.Poly(T, TAU).terms():
                cf = sp.Rational(cf)
                need(i >= 2, f"J4: T_c has terms of degree 0 or 1 ({c})")
                Td[(i,)] = cf; Ad[(i - 2,)] = cf
            out["T"][c] = dict(T=to_int(Td), A=to_int(Ad))
    return out


_BC = {}


def build_cache(kind, opts=()):
    key = (kind, tuple(opts))
    if key not in _BC:
        _BC[key] = build(kind, opts)
    return _BC[key]


# ---------------- lower bounds (integers) ----------------
import flint
_CTX = {}


def ctxs(k):
    if k not in _CTX:
        _CTX[k] = (flint.fmpz_mpoly_ctx.get(tuple(f"x{i}" for i in range(k)) + ("d",), 'lex'),
                   flint.fmpz_mpoly_ctx.get(tuple(f"s{i}" for i in range(k)), 'lex'))
    return _CTX[k]


def homog(dct, k):
    """Integer dict (k variables) → (homogenized flint polynomial, degree h)."""
    h = max(sum(m) for m in dct) if dct else 0
    CH, _ = ctxs(k)
    return CH.from_dict({tuple(m) + (h - sum(m),): v for m, v in dct.items()}), h


def lb_box(Ph, k, lo, hi):
    """Lower bound of DU^h·P(x/DU) on the integer box [lo, hi] (DU units), monomial by monomial (constant + even powers give min(0, c), the others −|c|)."""
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "box widths are positive even numbers")
    _, CS = ctxs(k)
    s = CS.gens()
    args = [(l + h) // 2 + ((h - l) // 2) * s[i] for i, (l, h) in enumerate(zip(lo, hi))]
    G = Ph.compose(*args, CS.from_dict({(0,) * k: DU}), ctx=CS)
    lb = 0
    for mon, c in G.terms():
        c = int(c)
        if all(e == 0 for e in mon):
            lb += c
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, c)
        else:
            lb -= abs(c)
    return lb


class TCheck:
    """Checks T ≥ 0 on the base box (J3: 2 variables, J4: 1 variable per candidate). Results are cached per box.
    J3: lower bound of T ≥ 0, or T = u²A + us·B + s²C (B constant) with lower bound of A > 0, lower bound of C > 0, B² ≤ 4·(lower bound of A)·(lower bound of C).
    J4: lower bound of T_c ≥ 0, or T_c = τ²A_c with lower bound of A_c ≥ 0."""

    def __init__(self, B):
        self.kind = B["kind"]; self.cache = {}; self.noquad = B.get("noquad", False)
        if self.kind == "J3":
            d = B["T"]
            self.T = homog(d["T"], 2); self.A = homog(d["A"], 2); self.C = homog(d["C"], 2)
            need(set(d["B"]) <= {(0, 0)}, "B is a constant")
            self.Bc = d["B"].get((0, 0), 0)
        elif self.kind == "J4":
            self.T = {c: (homog(v["T"], 1), homog(v["A"], 1)) for c, v in B["T"].items()}

    def ok(self, lo, hi, c=None):
        key = (tuple(lo), tuple(hi), None if c is None else tuple(c))
        if key not in self.cache:
            self.cache[key] = self._ok(lo, hi, c)
        return self.cache[key]

    def _ok(self, lo, hi, c):
        if self.kind == "P2":
            return True
        if self.kind == "J3":
            Th, h = self.T
            if lb_box(Th, 2, lo, hi) >= 0:
                return True
            (Ah, hA), (Ch, hC) = self.A, self.C
            a = lb_box(Ah, 2, lo, hi); cc = lb_box(Ch, 2, lo, hi)
            if a <= 0 or cc <= 0:
                return False
            # A_true ≥ a/DU^hA, C_true ≥ cc/DU^hC (A, B, C are integer multiples with the same denominator). 4·A·C ≥ B² ⇐ 4·a·cc ≥ B²·DU^{hA+hC}
            return 4 * a * cc >= self.Bc * self.Bc * DU ** (hA + hC)
        (Th, h), (Ah, hA) = self.T[tuple(c)]
        if lb_box(Th, 1, lo, hi) >= 0:
            return True
        if self.noquad:
            return False
        return lb_box(Ah, 1, lo, hi) >= 0


# ---------------- boxes ----------------
def root_box(kind, rmax=None):
    sp_ = SPEC[kind]
    L_ = len(sp_["sc"])
    rmax = sp_["rmax"] if rmax is None else Fr(rmax)
    need((rmax * DU).denominator == 1, "the upper bound of r is in DU units")
    lo = [0] + [-DU] * (L_ - 1); hi = [int(rmax * DU)] + [DU] * (L_ - 1)
    for a, b in sp_["base"]:
        need((a * DU).denominator == 1 and (b * DU).denominator == 1, "the range is in DU units")
        lo.append(int(a * DU)); hi.append(int(b * DU))
    return lo, hi


def split(lo, hi, full):
    rel = [Fr(h - l, f) for l, h, f in zip(lo, hi, full)]
    ax = max(range(5), key=lambda i: (rel[i], -i))
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def ckey(c):
    return [int(x) for x in c]


class Face:
    def __init__(self, B, face):
        self.kind = B["kind"]; self.face = tuple(face); self.nb = len(SPEC[self.kind]["base"])
        self.tc = TCheck(B)
        self.items = []
        for c in cands(self.kind):
            ld = B["lam"][self.face + (c,)]; pd = B["Pf"][self.face + (c,)]
            Lh, _ = homog(ld, 5); Ph, _ = homog(pd, 5)
            ml = np.array(list(ld.keys()), float); cl = np.array([float(v) for v in ld.values()])
            mp = np.array(list(pd.keys()), float); cp = np.array([float(v) for v in pd.values()])
            self.items.append((c, Lh, Ph, (ml, cl / np.abs(cl).max()), (mp, cp / np.abs(cp).max())))
        self.byc = {tuple(ckey(it[0])): it for it in self.items}

    def t_ok(self, c, lo, hi):
        if self.kind == "P2":
            return True
        return self.tc.ok(lo[5 - self.nb:], hi[5 - self.nb:], None if self.kind == "J3" else c)

    def accept_F(self, it, lo, hi):
        return self.t_ok(it[0], lo, hi) and lb_box(it[1], 5, lo, hi) > 0

    def accept_D(self, it, lo, hi):
        return lb_box(it[2], 5, lo, hi) >= 0

    def try_box(self, lo, hi, ntry=3):
        cen = np.array([(l + h) / 2 / DU for l, h in zip(lo, hi)])

        def val(mc):
            m, cf = mc
            return float((cf * np.prod(cen[None, :] ** m, axis=1)).sum())
        scl = sorted(((val(it[3]), i) for i, it in enumerate(self.items)), reverse=True)
        for v, i in scl[:ntry]:
            if self.accept_F(self.items[i], lo, hi):
                return ("F", self.items[i][0])
        if self.kind != "P2":
            scp = sorted(((val(it[4]), i) for i, it in enumerate(self.items)), reverse=True)
            for v, i in scp[:2]:
                if v <= 0:
                    break
                if self.accept_D(self.items[i], lo, hi):
                    return ("D", self.items[i][0])
        return None


def run_face(args):
    kind, face, wmin, time_limit, budget, opts = args
    t0 = time.time()
    B = build_cache(kind, opts)
    F = Face(B, face)
    rlo, rhi = root_box(kind, B["rmax"])
    full = [h - l for l, h in zip(rlo, rhi)]
    cur = [(rlo, rhi)]; leaves = []; lim = []; ev = 0; used = {}
    while cur:
        nxt = []
        for lo, hi in cur:
            if time.time() - t0 > time_limit or ev > budget:
                return dict(face=face, timeout=True, ev=ev, leaves=leaves, lim=lim, used=used,
                            open=len(cur) + len(nxt), sec=round(time.time() - t0, 1))
            ev += 1
            r = F.try_box(lo, hi)
            if r is not None:
                leaves.append([lo, hi, r[0], ckey(r[1])]); used[r[0]] = used.get(r[0], 0) + 1; continue
            if max(Fr(h - l, f) for l, h, f in zip(lo, hi, full)) <= Fr(1, 2 ** wmin):
                lim.append([lo, hi]); continue
            nxt.extend(split(lo, hi, full))
        cur = nxt
    return dict(face=face, timeout=False, ev=ev, leaves=leaves, lim=lim, used=used, sec=round(time.time() - t0, 1))


def header(kind):
    sp_ = SPEC[kind]
    hd = dict(kind="root", region=kind, DU=DU, base=[[str(a), str(b)] for a, b in sp_["base"]],
              sc=[str(x) for x in sp_["sc"]], rmax=str(sp_["rmax"]), cands=[ckey(c) for c in cands(kind)],
              W_A=[str(x) for x in WA])
    if kind == "J4":
        cv = J4_curve_cache()
        hd.update(ORD=ORD_J4, d=[str(x) for x in cv["d"]], e1=[str(x) for x in cv["e1"]], e2=[str(x) for x in cv["e2"]],
                  phi=[str(x) for x in cv["phi"]])
    return hd


def run(kind, name, procs, wmin, time_limit, budget, opts=()):
    from multiprocessing import Pool
    t0 = time.time()
    B = build_cache(kind, opts)
    tb = time.time() - t0
    print(f"{kind}: {len(cands(kind))} candidates, {len(faces(kind))} faces, build {tb:.0f} s", flush=True)
    tasks = [(kind, f, wmin, time_limit, budget, tuple(opts)) for f in faces(kind)]
    with Pool(min(procs, len(tasks))) as pool:
        res = pool.map(run_face, tasks, chunksize=1)
    hd = header(kind); hd["opts"] = [list(o) for o in opts]
    out = gzip.open(f"{name}.leaves.jsonl.gz", "wt", encoding="utf-8")
    out.write(json.dumps(hd) + "\n")
    st = dict(region=kind, header=hd, faces=[], build_sec=round(tb, 1))
    for r in res:
        for lf in r["leaves"]:
            out.write(json.dumps(dict(face=list(r["face"]), lo=lf[0], hi=lf[1], t=lf[2], c=lf[3])) + "\n")
        st["faces"].append(dict(face=list(r["face"]), **{K_EV: r["ev"], K_ACC: len(r["leaves"]), K_LIM: len(r["lim"]),
                                K_TIMEOUT: r["timeout"], K_TYPE: r.get("used"), K_LIMBOX: r["lim"][:10], K_SEC: r["sec"]}))
        print(f"  face {r['face']}: evaluated {r['ev']}, accepted {len(r['leaves'])}, at limit {len(r['lim'])}, "
              f"timed out {r['timeout']}, types {r.get('used')}, {r['sec']} s", flush=True)
    out.close()
    st[K_EV] = sum(f[K_EV] for f in st["faces"]); st[K_LIM] = sum(f[K_LIM] for f in st["faces"])
    st["closed"] = all(f[K_LIM] == 0 and not f[K_TIMEOUT] for f in st["faces"])
    st[K_SEC] = round(time.time() - t0, 1)
    st["params"] = dict(wmin=wmin, budget=budget, time_limit=time_limit)
    json.dump(st, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== local {kind} {name}: passed {st['closed']}, evaluated {st[K_EV]}, at limit {st[K_LIM]}, {st[K_SEC]} s", flush=True)
    return st


def replay(kind, name):
    """Re-check from the recorded leaves alone: the test of each leaf (types F and D), and the cover by the fixed way of splitting from the root."""
    t0 = time.time()
    with gzip.open(f"{name}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need(hd.pop("opts", None) == [], "the record contains no test-only error")
    need(hd == json.loads(json.dumps(header(kind))), "the premises of the record differ from the present code")
    B = build_cache(kind)
    by = {}
    for r in lines[1:]:
        by.setdefault(tuple(r["face"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = (r["t"], r["c"])
    bad = 0; n = 0; types = {}
    rlo, rhi = root_box(kind)
    full = [h - l for l, h in zip(rlo, rhi)]
    for f in faces(kind):
        lv = by.get(tuple(f), {})
        need(lv, f"no leaves for face {f}")
        F = Face(B, f)
        for (lo, hi), (t, c) in lv.items():
            n += 1; types[t] = types.get(t, 0) + 1
            it = F.byc.get(tuple(c))
            if it is None:
                ok = False
            elif t == "F":
                ok = F.accept_F(it, list(lo), list(hi))
            elif t == "D":
                ok = F.accept_D(it, list(lo), list(hi))
            else:
                ok = False
            bad += (not ok)
        cur = [(rlo, rhi)]; seen = 0; depth = 0
        while cur:
            need(len(cur) <= len(lv) - seen, "a gap in the cover (a box without a leaf)")
            need(depth <= 5 * 40, "a branch that reaches no leaf"); depth += 1
            nxt = []
            for lo, hi in cur:
                if (tuple(lo), tuple(hi)) in lv:
                    seen += 1; continue
                nxt.extend(split(lo, hi, full))
            cur = nxt
        need(seen == len(lv), f"cover tree (face {f})")
    # The last line is copied into the "local" field of d87_oct_far_*.replay.json by d87_oct_far.py, so it is kept in Japanese
    # (meaning: "re-check of local {kind} {name}: {n} leaves (types ...), {bad} failed, cover tree OK, ... s").
    print(f"\u78ba\u304b\u3081\u76f4\u3057 \u5c40\u6240 {kind} {name}: \u8449 {n}\uff08\u578b {types}\uff09\u3001\u4e0d\u5408\u683c {bad}\u3001\u88ab\u8986\u306e\u6728 OK\u3001{time.time()-t0:.0f} \u79d2", flush=True)
    need(bad == 0, "some leaves failed")
    return {K_LEAF: n, K_TYPE: types, K_FAIL: bad, K_SEC: round(time.time() - t0, 1)}


# ---------------- inverse map of the coordinates (handed over to the far region, floating-point version) ----------------
def _quat_of(R):
    q = C.rot_to_quat(R)
    return q if q[0] > 0 else -q


def _num(M):
    return np.array(M.tolist(), dtype=float)


def coords_of(kind, n, R):
    """(n, R) → the coordinates of this lemma (base, transverse). All are rational expressions in the entries of R and n (for the quaternion, the branch w > 0 with p = vec/w).
    The assigned region is "base ∈ range and |transverse_i| ≤ sc_i·rmax"."""
    n = np.asarray(n, float); R = np.asarray(R, float)
    nu = R.T @ n
    nu = 3 * nu / nu.sum()
    z1, z2 = (nu[0] - nu[1]) / 2, (1 - nu[2]) / 2
    if kind == "P2":
        q = _quat_of(_num(R_STAR).T @ R)
        p = q[1:] / q[0]
        return (), (z1, z2, p[0], p[1], p[2])
    if kind == "J3":
        R3 = _num(R_III)
        sig = R3 @ R[2, :]
        be, al = sig[0] / (1 + sig[2]), -sig[1] / (1 + sig[2])
        Bm = _num(Mq(1, -al, -be, 0)) / (1 + al * al + be * be)
        Rz = R @ R3.T @ Bm.T
        u = Rz[1, 0] / (1 + Rz[0, 0])
        return (u, (al - be) / 2), ((al + be) / 2, z1, z2)
    if kind == "J4":
        cv = J4_curve_cache()
        q = _quat_of(_num(R_III).T @ R)
        p = q[1:] / q[0]
        d = _num(cv["d"]).ravel(); e1 = _num(cv["e1"]).ravel(); e2 = _num(cv["e2"]).ravel()
        tau = p @ d / (d @ d)
        ph = np.array([float(x.subs(TAU, tau)) for x in cv["phi"]])
        rest = p - ph
        return (tau,), (rest @ e1 / (e1 @ e1), rest @ e2 / (e2 @ e2), z1, z2)
    raise ValueError(kind)


def config_of(kind, b, l):
    """Coordinates → (n, R) (floating point, the inverse of coords_of. For tests)."""
    if kind == "P2":
        z1, z2, p1, p2, p3 = l
        R = _num(R_STAR) @ (_num(Mq(1, p1, p2, p3)) / (1 + p1*p1 + p2*p2 + p3*p3))
        sgn = -1
    elif kind == "J3":
        u, s = b; y, z1, z2 = l; al, be = s + y, y - s
        R = (_num(Mq(1, 0, 0, u)) / (1 + u * u)) @ (_num(Mq(1, -al, -be, 0)) / (1 + al * al + be * be)) @ _num(R_III)
        sgn = 1
    else:
        cv = J4_curve_cache()
        tau, = b; l1, l2, z1, z2 = l
        p = np.array([float(x.subs(TAU, tau)) for x in cv["phi"]]) + l1 * _num(cv["e1"]).ravel() + l2 * _num(cv["e2"]).ravel()
        R = _num(R_III) @ (_num(Mq(1, p[0], p[1], p[2])) / (1 + p @ p))
        sgn = -1
    nu = np.array([1 + z1 + z2, 1 - z1 + z2, 1 - 2 * z2])
    return sgn * (R @ nu), R


def G_float(kind, n, R):
    """Left-hand side − right-hand side of (★) (floating point, the true G): for P2 G(n) − n·w_Q, for J3 and J4 G(n) − n·w_A."""
    w = np.array([1 / 3] * 3) if kind == "P2" else np.array([5 / 18, 5 / 18, 2 / 9])
    return C.np_G(np.asarray(n, float), np.asarray(R, float)) - np.asarray(n, float) @ w


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("kind", nargs="?")
    ap.add_argument("--name", default=None); ap.add_argument("--procs", type=int, default=2)
    ap.add_argument("--wmin", type=int, default=20); ap.add_argument("--time-limit", type=int, default=3000)
    ap.add_argument("--budget", type=int, default=2 * 10 ** 6)
    ap.add_argument("--break-lam", default=None)
    ap.add_argument("--break-S", default=None); ap.add_argument("--break-wQ", action="store_true")
    ap.add_argument("--break-rmax", default=None); ap.add_argument("--break-noquad", action="store_true")
    a = ap.parse_args()
    if a.cmd == "check":
        rng = np.random.default_rng(1)
        for kd in ("P2", "J3", "J4"):
            t0 = time.time()
            B = build_cache(kd)
            print(f"{kd}: identities of build OK (P_c(0) = 0, divisible by r, degree-0 and degree-1 parts of T = 0"
                  f"{', candidates tie on the family' if kd == 'J3' else ''}), {time.time()-t0:.0f} s")
            if kd == "J3":
                print("   degree-2 part of T:", [(m, c) for m, c in sp.Poly(B["T_sym"], Us, Ss).terms() if sum(m) == 2])
            if kd == "J4":
                cv = J4_curve_cache(); print("   φ(τ) =", list(cv["phi"]), " e1 =", list(cv["e1"]), " e2 =", list(cv["e2"]))
            # round trip of the coordinates, and max of the candidates ≤ true G (floating point)
            sp_ = SPEC[kd]; err = 0; worst = 0
            for _ in range(200):
                b = [float(rng.uniform(x, y)) for x, y in sp_["base"]]
                l = [float(rng.uniform(-1, 1) * s * sp_["rmax"]) for s in sp_["sc"]]
                n, R = config_of(kd, b, l)
                b2, l2 = coords_of(kd, n, R)
                err = max(err, max([abs(x - y) for x, y in zip(list(b) + l, list(b2) + list(l2))]))
                worst = min(worst, G_float(kd, n, R))
            print(f"   round-trip error of the coordinates {err:.1e}, minimum of the (★) difference over 200 random points {worst:.2e} (if negative, check whether the point is outside the cone)")
        sys.exit(0)
    name = a.name or f"d87_oct_local_{a.kind}"
    if a.cmd == "run":
        op = [("lam", a.break_lam)] if a.break_lam else []
        op += [("S", a.break_S)] if a.break_S else []
        op += [("w", "Q")] if a.break_wQ else []
        op += [("rmax", a.break_rmax)] if a.break_rmax else []
        op += [("noquad", 1)] if a.break_noquad else []
        st = run(a.kind, name, a.procs, a.wmin, a.time_limit, a.budget, tuple(op))
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.kind, name)
