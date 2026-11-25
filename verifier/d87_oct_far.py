# -*- coding: utf-8 -*-
"""D48 stages O2 and O3 (L4'', octincub_n09): the far region. --prob II (stage O2), III and IV (stage O3, added 11/15; see the ■ (III), (IV) part below).
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Acceptance decisions use integers and rationals only. Floating point is used only to choose candidates and to prepare L (which rotation of the piece to try).
The structure is copied from d86_far.py (tree over n x tree over R, types A / D / L, replay). d31_common (RBox, quad_lb, vcomb, discard_lb, ROT_NONID) is only imported.

■ What is shown ((II) of D48 3.2): for every m >= 0 (m != 0) and every rotation R,
    F(m, R) := max_k |m·r_k| + Σ_i m_i (e_i(R) − 1) ≥ 0, where e_i(R) = max_k |R_ik|.
  (This is G(n, R) − n·w_Q written with n = −m. Units as in d87_cub_common: piece K̂ = {|x|+|y|+|z| ≤ 1}, container [−4/3, 4/3]³.)
■ Reduction by symmetry [argument; floating-point cross-check in check]:
  (a) Permutation of coordinates P: F(Pm, R) = F(m, PᵀR). If PᵀR is a reflection (det −1), use −PᵀR (F is unchanged under R → −R: it is written with |·| only).
      Hence it suffices to take m in the chamber {m1 ≥ m2 ≥ m3 ≥ 0}.
  (b) Rotation g of the piece (signed permutation with det 1, 24 of them): F(m, Rg) = F(m, R) (reordering and signs of columns). With this, type D restricts R to "the copy with the largest tr(R)".
■ Map of m: T = {a, b ≥ 0, a + b ≤ 1}, 6m = (6 − 3a − 4b, 3a + 2b, 2b) (positive multiples of the vertices (1,0,0), (1/2,1/2,0), (1/3,1/3,1/3)).
  F is positively homogeneous of degree 1 in m, so a representative of each positive multiple suffices. The equality point is (a, b) = (0, 1) (m ∝ (1,1,1), R = R* g).
■ Candidate (type A): a column k and sign s for the top term, and for each axis i a column k_i and sign s_i:
    F ≥ F_c := s·m·r_k + Σ_i m_i (s_i R_{i,k_i} − 1) (since m_i ≥ 0, the substitution e_i ≥ s_i R_{i,k_i} is allowed).
  |q|²·F_c is linear in M(q) (the quaternion numerator) and |q|², and linear in m (with R fixed). Hence if, at each vertex of the polygon (n box ∩ T),
  the lower bound over the R box (quad_lb of d31) is ≥ 0, then F ≥ 0 on the whole box.
■ Type D: a rotation k of the piece with tr(Rk) > tr(R) (discard_lb of d31). R and Rk have the same F, and the copy with the largest tr is accepted in another leaf.
  (A copy with the largest tr always exists: a finite set of 24. Only R that lose strictly on the whole box are discarded, so a box holding the largest copy is never discarded.)
■ Type L (handed to the local P2): for some rotation g of the piece, R′ := R·(−g) lies in the region assigned to P2 for every (m, R) of the box.
  (R′ = R*·M(1, p)/|q|² of P2 is a reflection (R* has det −1). Since F(m, −Rg) = F(m, R), we match with R′ = −Rg.)
  Coordinates of P2 (d87_oct_local.coords_of): ν = R′ᵀ m, z1 = 3(ν1 − ν2)/(2Σν), z2 = (Σν − 3ν3)/(2Σν),
  A := R*ᵀ R′, p = (A32 − A23, A13 − A31, A21 − A12)/(1 + tr A) (v/w of the quaternion (w, v), branch w > 0). The assigned region is |z_i| ≤ r_max, |p_i| ≤ r_max.
  Exact decision: every condition is a sign condition on a linear form in the entries of M(q) (and |q|²):
    Σν > 0, 2r_max·Σν ∓ 3(ν1 − ν2) ≥ 0, 2r_max·Σν ∓ (Σν − 3ν3) ≥ 0 (L_conds below), 3(1 + tr A) > 0, r_max·3(1 + tr A) ∓ 3·skew_i ≥ 0 (L_conds_R). ν = R′ᵀ m is linear in m, so
    the conditions on m are checked at the polygon vertices and those on R with quad_lb (each as "≥ 0 (or > 0) on the whole box").
  That the P2 record can be re-checked by the current code is seen at the end of replay by calling d87_oct_local.py replay P2.
■ (III), (IV) (stage O3): G(n, R) − n·w_A ≥ 0, w_A = (5/18, 5/18, 2/9).
  (III) n = (a, b, −c), (IV) n = (−a, −b, c) (a, b, c ≥ 0). The x ↔ y copy (F(Pn, R) = F(n, −PR); w_A is symmetric in x, y) restricts to a ≥ b.
  Map: n_III = (2 − A − 2B, A, −2B) (in ND units), T = {A, B ≥ 0, A + B ≤ 1}, and (IV) uses n = −n_III. A point of the chamber {a ≥ b ≥ 0, c ≥ 0}
  is scaled to sum 2, giving A = 2b/S, B = c/S. The equality point d′ ∝ (1, 1, −1) is (A, B) = (2/3, 1/3) (on the hypotenuse).
  Candidate: F_c = s·n·r_k + Σ_{wall axes i}(n_i)₋ (s_i R_{i,k_i} − 4/3) − n·w_A. The wall axes are z for (III) and x, y for (IV) (on the range (n_i)₋ = −n_i, linear in n);
  on the other axes (n_i)₋ = 0 on the range. 18·|q|²·F_c is linear in M(q), |q|² and linear in n → quad_lb at each polygon vertex.
  Type L: (III) goes to J3, (IV) to J4. R′ := R g (g a rotation of the piece, det 1; R_III has det +1, so −g is not needed). Every condition is linear in M(q), |q|²:
    J3: M″ := |q|²R′R_IIIᵀ, σ·|q|² = row 3 of M″ (σ = R″ᵀe_z). 1 + σ_z > 0, s = (−σ_y − σ_x)/(2(1+σ_z)) ∈ [S0, S1],
        y = (σ_x − σ_y)/(2(1+σ_z)) ∈ ±Y, u = z″/w″ (the quaternion of R″ = Rz(u)B is ∝ (1, −α+uβ, −β−uα, u)), with
        w″²·4 = |q|² + tr M″ > 0, z″²·4 = |q|² − M″00 − M″11 + M″22, |u| ≤ U1 ⇔ U1²(|q|² + tr M″) − (…) ≥ 0 (U0 = −U1).
    J4: A := |q|²R_IIIᵀR′; 4 times the products of the quaternion (W, V): WW = |q|² + tr A, WV_x = A21 − A12 …, V_iV_j (diagonal |q|² ± …).
        p = V/W, τ = p·d/|d|², l1 = p·e1/|e1|² − ca·τ², l2 = p·e2/|e2|² − cb·τ² (φ(τ) = τd + τ²(ca e1 + cb e2), e1 ⊥ e2 ⊥ d).
        W² > 0, |τ| ≤ T1 ⇔ T1²|d|⁴·WW − Σ d_i d_j V_iV_j ≥ 0, |l1| ≤ L1 ⇔ L1·WW ∓ (Σ e1_i WV_i/|e1|² − ca Σ d_i d_j V_iV_j/|d|⁴) ≥ 0, and the same for l2.
    The z conditions use the same formulas as (II) with ν = R′ᵀv (v = n for (III), v = −n for (IV)).
Usage: python -X utf8 d87_oct_far.py check [--prob III] | run --prob II|III|IV [--procs 12] [--sample 16] [--name …] | replay --prob … [--name …]
"""
import sys, os, json, gzip, time, math, argparse, itertools, subprocess
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d87_cub_common as C
import d31_common as D31                       # only imported: RBox, quad_lb, vcomb, discard_lb, ROT, ROT_NONID
from d31_common import DEN

ND = 2 ** 30
NF = ((6, -3, -4), (0, 3, 2), (0, 0, 2))      # 6m_l = c0 + ca·a + cb·b (a, b in units of 1)
ROT = D31.ROT                                  # the 24 rotations of the piece (integer matrices)
ROT_NONID = D31.ROT_NONID
ROTF = np.array(ROT_NONID, float)
GL = [[[-x for x in r] for r in g] for g in ROT]      # the copies −g for type L (R* is a reflection (det −1), so we match with R′ = R·(−g))
GF = np.array(GL, float)
RS = C.R_STAR                                  # rational (denominator 3)
RS3 = [[int(3 * RS[i][j]) for j in range(3)] for i in range(3)]
RSF = np.array([[float(x) for x in r] for r in RS])
BREAK = {}                                     # for tests: noL, shift (subtract δ·Σm from F_c), wQ (replace w_A of (III), (IV) by w_Q, stage O4)
LOC = {}
PROB = ["II"]                                  # the current problem (also passed to workers in task)
NF3 = ((2, -1, -2), (0, 1, 0), (0, 0, -2))     # n_III = (2 − A − 2B, A, −2B) (in ND units)
SGN = {"III": 1, "IV": -1}
WALLS = {"III": (2,), "IV": (0, 1)}
LOCAL_OF = {"II": "P2", "III": "J3", "IV": "J4"}
R3 = C.R_III                                   # rational (denominator 3), det +1
R3F = np.array([[float(x) for x in r] for r in R3])
GR = [g for g in ROT]                          # the copies for type L of (III), (IV) (kept with det 1)
GRF = np.array(GR, float)


def prob():
    return PROB[0]


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def set_local(name):
    with gzip.open(os.path.join(HERE, f"{name}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        hd = json.loads(f.readline())
    kind = LOCAL_OF[prob()]
    need(hd["region"] == kind and hd.get("opts", []) == [], f"the local record is not {kind}, or is a test copy")
    if kind == "P2":
        need(hd["base"] == [] and all(Fr(x) == 1 for x in hd["sc"]), "shape of the region assigned to P2 (sc = 1)")
        LOC.update(name=name, rmax=Fr(hd["rmax"]), zmax=Fr(hd["rmax"]))
        return
    rmax = Fr(hd["rmax"]); sc = [Fr(x) for x in hd["sc"]]; base = [(Fr(a), Fr(b)) for a, b in hd["base"]]
    need([Fr(x) for x in hd["W_A"]] == [Fr(5, 18), Fr(5, 18), Fr(2, 9)], "w_A of the local record")
    if kind == "J3":
        need(len(base) == 2 and len(sc) == 3 and base[0][0] == -base[0][1], "shape of the region assigned to J3 (u symmetric)")
        LOC.update(name=name, rmax=rmax, U1=base[0][1], S0=base[1][0], S1=base[1][1], Y=sc[0] * rmax,
                   zmax=sc[1] * rmax)
        need(sc[1] == sc[2], "z scale factors of J3")
    else:
        need(len(base) == 1 and len(sc) == 4 and base[0][0] == -base[0][1] and sc[2] == sc[3], "shape of the region assigned to J4")
        need(hd["ORD"] == 2, "φ of J4 is quadratic")
        d = [Fr(x) for x in hd["d"]]; e1 = [Fr(x) for x in hd["e1"]]; e2 = [Fr(x) for x in hd["e2"]]
        need(dot(d, e1) == 0 and dot(d, e2) == 0 and dot(e1, e2) == 0, "d, e1, e2 of J4 are orthogonal")
        # φ = τ d + τ² c2 from the strings (of the form "18*tau**2 + tau"), read with sympy
        import sympy as sp
        tau = sp.Symbol("tau")
        ph = [sp.Poly(sp.sympify(s), tau) for s in hd["phi"]]
        c1 = [Fr(str(p.coeff_monomial(tau))) for p in ph]; c2 = [Fr(str(p.coeff_monomial(tau ** 2))) for p in ph]
        need(c1 == d and all(p.degree() <= 2 and p.coeff_monomial(1) == 0 for p in ph), "the linear part of φ of J4 is d")
        need(dot(c2, d) == 0, "the quadratic part of φ of J4 is orthogonal to d")
        ca = dot(c2, e1) / dot(e1, e1); cb = dot(c2, e2) / dot(e2, e2)
        need([ca * x + cb * y for x, y in zip(e1, e2)] == c2, "the quadratic part of φ of J4 is a combination of e1, e2")
        LOC.update(name=name, rmax=rmax, T1=base[0][1], L1=sc[0] * rmax, L2=sc[1] * rmax, zmax=sc[2] * rmax,
                   d=d, e1=e1, e2=e2, ca=ca, cb=cb)
    LOC["Rconds"] = [Rconds_int(g) for g in GR]
    LOC["RcF"] = Rconds_float_arrays(LOC["Rconds"])


# ---------------- n box ∩ T (exact) ----------------
def poly_T(lo, hi):
    pts = [(a, b) for a in (lo[0], hi[0]) for b in (lo[1], hi[1]) if a + b <= ND]
    for a in (lo[0], hi[0]):
        b = ND - a
        if lo[1] < b < hi[1]:
            pts.append((a, b))
    for b in (lo[1], hi[1]):
        a = ND - b
        if lo[0] < a < hi[0]:
            pts.append((a, b))
    return pts


def mval(a, b):
    """(II): ND·6m; (III), (IV): ND·n (the representative of n with |sum| = 2; integers)."""
    if prob() == "II":
        return tuple(f[0] * ND + f[1] * a + f[2] * b for f in NF)
    s = SGN[prob()]
    return tuple(s * (f[0] * ND + f[1] * a + f[2] * b) for f in NF3)


def nvec_f(ac, bc):
    """Floating-point vector of the map point (a, b) (in units of 1) ((II): 6m; (III), (IV): n)."""
    if prob() == "II":
        return np.array([f[0] + f[1] * ac + f[2] * bc for f in NF], float)
    return SGN[prob()] * np.array([f[0] + f[1] * ac + f[2] * bc for f in NF3], float)


_PC = {}


def poly_m(lo, hi):
    key = (prob(), tuple(lo), tuple(hi))     # the map differs per problem (11/15 stage O4: switching problems in the same process used stale values)
    r = _PC.get(key)
    if r is None:
        if len(_PC) > 5000:
            _PC.clear()
        r = _PC[key] = [mval(a, b) for a, b in poly_T(lo, hi)]
    return r


# ---------------- candidate formulas ----------------
def cand_poly(m, rb, cand):
    """|q|²·DEN²·F_c as a quadratic form (m an integer vector, a positive multiple). cand = (k, s, ((k_i, s_i))_i).
    For (III), (IV), m is n (times ND), the form is 18·|q|²·DEN²·F_c, and ax is in the order of the wall axes (WALLS)."""
    if prob() != "II":
        return cand_poly3(m, rb, cand)
    k, s, ax = cand
    terms = [(s * m[i], rb.M[i][k]) for i in range(3)]
    for i in range(3):
        ki, si = ax[i]
        terms.append((si * m[i], rb.M[i][ki]))
        terms.append((-m[i], rb.Q))
    if BREAK.get("shift"):
        d = BREAK["shift"]
        terms = [(c * d.denominator, v) for c, v in terms] + [(-d.numerator * sum(m), rb.Q)]
    return D31.vcomb(terms)


def box_lb(lo, hi, rb, cand):
    best = None
    for m in poly_m(lo, hi):
        v = D31.quad_lb(cand_poly(m, rb, cand))
        best = v if best is None else min(best, v)
    return best


def cand_poly3(n, rb, cand):
    """(III), (IV): 18·F_c = 18 s Σ_i n_i R_ik + Σ_{wall i} 18(−n_i) s_i R_{i,k_i} + (24 Σ_{wall} n_i − 5n_x − 5n_y − 4n_z) (times |q|²).
    That n_i ≤ 0 on the wall axes ((n_i)₋ = −n_i) and n_i ≥ 0 on the other axes ((n_i)₋ = 0) over the range is checked at the vertices in check_map."""
    k, s, ax = cand
    W = WALLS[prob()]
    terms = [(18 * s * n[i], rb.M[i][k]) for i in range(3)]
    for i, (ki, si) in zip(W, ax):
        terms.append((-18 * n[i] * si, rb.M[i][ki]))
    qc = 24 * sum(n[i] for i in W) - 5 * n[0] - 5 * n[1] - 4 * n[2]
    if BREAK.get("wQ"):                                  # for tests (stage O4): replace w_A by w_Q = (1/3)(1, 1, 1) (18 w_Q = (6, 6, 6))
        qc = 24 * sum(n[i] for i in W) - 6 * (n[0] + n[1] + n[2])
    if BREAK.get("shift"):
        d = BREAK["shift"]
        l1 = abs(n[0]) + abs(n[1]) + abs(n[2])          # the signs are fixed on the range (the 1-norm of n is linear in n)
        terms = [(c * d.denominator, v) for c, v in terms]
        qc = qc * d.denominator - 18 * d.numerator * l1
    terms.append((qc, rb.Q))
    return D31.vcomb(terms)


def valid_cand(c):
    k, s, ax = c
    na = 3 if prob() == "II" else len(WALLS[prob()])
    return k in range(3) and s in (1, -1) and len(ax) == na and all(ki in range(3) and si in (1, -1) for ki, si in ax)


# ---------------- type L (the region assigned to P2) ----------------
def L_conds(m, rb, g):
    """Return the conditions of the region assigned to P2 as a list of "quadratic form ≥ 0" (with a strict flag). R′ = R g, ν = R′ᵀ m, A = R*ᵀ R′ (all times |q|²·DEN²)."""
    rinv = LOC["zmax"]
    a_, b_ = rinv.numerator, rinv.denominator          # upper limit of z = a_/b_ (r_max for P2, sc_z·r_max for J3, J4)
    # ν_j = Σ_i m_i (R g)_{ij} = Σ_i Σ_l m_i M_il g_lj
    nu = [D31.vcomb([(m[i] * g[l][j], rb.M[i][l]) for i in range(3) for l in range(3)]) for j in range(3)]
    S = D31.vcomb([(1, nu[0]), (1, nu[1]), (1, nu[2])])
    out = [(S, True)]
    # |3(ν1 − ν2)| ≤ 2 r Σν  ⇔ 2a_Σν ∓ 3b_(ν1 − ν2) ≥ 0
    d12 = D31.vcomb([(1, nu[0]), (-1, nu[1])])
    d3 = D31.vcomb([(1, S), (-3, nu[2])])
    for sg in (1, -1):
        out.append((D31.vcomb([(2 * a_, S), (-3 * b_ * sg, d12)]), False))
        out.append((D31.vcomb([(2 * a_, S), (-b_ * sg, d3)]), False))   # |Σν − 3ν3| ≤ 2 r Σν
    return out


def L_conds_R(rb, g):
    """Conditions on p (independent of m). 3A = RS3ᵀ M g (times |q|²·DEN²). 1 + tr A > 0, |skew_i| ≤ r (1 + tr A)."""
    a_, b_ = LOC["rmax"].numerator, LOC["rmax"].denominator
    A = [[D31.vcomb([(RS3[l][i] * g[t][j], rb.M[l][t]) for l in range(3) for t in range(3)]) for j in range(3)] for i in range(3)]
    one = D31.vcomb([(3, rb.Q), (1, A[0][0]), (1, A[1][1]), (1, A[2][2])])     # 3(1 + tr A)
    out = [(one, True)]
    for (i, j) in ((2, 1), (0, 2), (1, 0)):
        sk = D31.vcomb([(1, A[i][j]), (-1, A[j][i])])                              # 3·skew
        for sg in (1, -1):
            out.append((D31.vcomb([(a_, one), (-b_ * sg, sk)]), False))
    return out


# ---- type L of (III), (IV): build the R conditions as "linear forms in |q|² and M" (rational coefficients) ----
def _lf(cQ=0, cM=None):
    return [Fr(cQ), [[Fr(0)] * 3 for _ in range(3)] if cM is None else cM]


def _ladd(*ts):
    out = _lf()
    for c, f in ts:
        out[0] += c * f[0]
        for i in range(3):
            for j in range(3):
                out[1][i][j] += c * f[1][i][j]
    return out


def _lM(i, j):
    f = _lf(); f[1][i][j] = Fr(1); return f


def Rconds_forms(g):
    """Conditions on the local coordinates for R′ = R g (the part independent of m) as [(linear form, strict)]. A linear form is (c_Q, c_M) with value c_Q|q|² + Σ c_M,ij M_ij."""
    Qf = _lf(1)
    if prob() == "III":
        # M″_ab = Σ_{l,t} M_al g_lt R3_bt
        Mpp = [[_ladd(*[(Fr(g[l][t]) * R3[b][t], _lM(a, l)) for l in range(3) for t in range(3)]) for b in range(3)] for a in range(3)]
        one = _ladd((1, Qf), (1, Mpp[2][2]))
        sx, sy = Mpp[2][0], Mpp[2][1]
        S0, S1, Y, U1 = LOC["S0"], LOC["S1"], LOC["Y"], LOC["U1"]
        ww = _ladd((1, Qf), (1, Mpp[0][0]), (1, Mpp[1][1]), (1, Mpp[2][2]))
        zz = _ladd((1, Qf), (-1, Mpp[0][0]), (-1, Mpp[1][1]), (1, Mpp[2][2]))
        return [(one, True),
                (_ladd((-1, sy), (-1, sx), (-2 * S0, one)), False),     # s ≥ S0
                (_ladd((1, sy), (1, sx), (2 * S1, one)), False),        # s ≤ S1
                (_ladd((2 * Y, one), (-1, sx), (1, sy)), False),        # y ≤ Y
                (_ladd((2 * Y, one), (1, sx), (-1, sy)), False),        # y ≥ −Y
                (ww, True),
                (_ladd((U1 * U1, ww), (-1, zz)), False)]                # |u| ≤ U1
    # (IV): A_ab = Σ_{l,t} R3_la M_lt g_tb
    A = [[_ladd(*[(R3[l][a] * g[t][b], _lM(l, t)) for l in range(3) for t in range(3)]) for b in range(3)] for a in range(3)]
    WW = _ladd((1, Qf), (1, A[0][0]), (1, A[1][1]), (1, A[2][2]))
    WV = [_ladd((1, A[2][1]), (-1, A[1][2])), _ladd((1, A[0][2]), (-1, A[2][0])), _ladd((1, A[1][0]), (-1, A[0][1]))]
    VV = [[None] * 3 for _ in range(3)]
    VV[0][0] = _ladd((1, Qf), (1, A[0][0]), (-1, A[1][1]), (-1, A[2][2]))
    VV[1][1] = _ladd((1, Qf), (-1, A[0][0]), (1, A[1][1]), (-1, A[2][2]))
    VV[2][2] = _ladd((1, Qf), (-1, A[0][0]), (-1, A[1][1]), (1, A[2][2]))
    VV[0][1] = VV[1][0] = _ladd((1, A[0][1]), (1, A[1][0]))
    VV[0][2] = VV[2][0] = _ladd((1, A[0][2]), (1, A[2][0]))
    VV[1][2] = VV[2][1] = _ladd((1, A[1][2]), (1, A[2][1]))
    d, e1, e2, ca, cb = LOC["d"], LOC["e1"], LOC["e2"], LOC["ca"], LOC["cb"]
    dd = _ladd(*[(d[i] * d[j], VV[i][j]) for i in range(3) for j in range(3)])
    d4 = dot(d, d) ** 2
    T1, L1, L2 = LOC["T1"], LOC["L1"], LOC["L2"]
    X1 = _ladd(*([(e1[i] / dot(e1, e1), WV[i]) for i in range(3)] + [(-ca / d4, dd)]))
    X2 = _ladd(*([(e2[i] / dot(e2, e2), WV[i]) for i in range(3)] + [(-cb / d4, dd)]))
    return [(WW, True),
            (_ladd((T1 * T1 * d4, WW), (-1, dd)), False),               # |τ| ≤ T1
            (_ladd((L1, WW), (-1, X1)), False), (_ladd((L1, WW), (1, X1)), False),
            (_ladd((L2, WW), (-1, X2)), False), (_ladd((L2, WW), (1, X2)), False)]


def Rconds_int(g):
    """Multiply by a positive number to get integer coefficients (the sign does not change)."""
    out = []
    for f, strict in Rconds_forms(g):
        vals = [f[0]] + [x for r in f[1] for x in r]
        den = 1
        for v in vals:
            den = den * v.denominator // math.gcd(den, v.denominator)
        out.append((int(f[0] * den), [[int(x * den) for x in r] for r in f[1]], strict))
    return out


def Rconds_float_arrays(rc):
    cq = np.array([[c[0] for c in conds] for conds in rc], float)               # (24, nc)
    cm = np.array([[c[1] for c in conds] for conds in rc], float)               # (24, nc, 3, 3)
    sc = np.abs(cm).sum(axis=(2, 3)) + np.abs(cq)
    return cq / sc, cm / sc[:, :, None, None]


def L_ok3(lo, hi, rb, gi):
    g = GR[gi]
    for cq, cm, strict in LOC["Rconds"][gi]:
        lb = D31.quad_lb(D31.vcomb([(cq, rb.Q)] + [(cm[i][j], rb.M[i][j]) for i in range(3) for j in range(3)]))
        if lb < 0 or (strict and lb == 0):
            return False
    s = SGN[prob()]
    for n in poly_m(lo, hi):
        v = tuple(s * x for x in n)                     # v = n for (III), v = −n for (IV)
        for p, strict in L_conds(v, rb, g):
            lb = D31.quad_lb(p)
            if lb < 0 or (strict and lb == 0):
                return False
    return True


def z_ok_f(vf, Rp):
    nu = Rp.T @ vf
    S = nu.sum()
    if S <= 0:
        return False
    zb = float(LOC["zmax"])
    return abs(3 * (nu[0] - nu[1]) / (2 * S)) <= zb and abs((S - 3 * nu[2]) / (2 * S)) <= zb


def L_guess3(vf, Rf):
    """In floating point: the g for which the R conditions and the z conditions hold at the box center (with a small margin)."""
    cq, cm = LOC["RcF"]
    val = cq + np.einsum("gcij,ij->gc", cm, Rf)                 # (24, nc)
    mins = val.min(axis=1)
    for gi in np.argsort(-mins):
        if mins[gi] <= 0:
            return None
        if z_ok_f(vf, Rf @ GRF[gi]):
            return int(gi)
    return None


def L_ok_idx(lo, hi, rb, gi):
    """Decide type L with the recorded index gi (−g for (II), g for (III), (IV))."""
    if prob() == "II":
        return 0 <= gi < len(GL) and L_ok(lo, hi, rb, GL[gi])
    return 0 <= gi < len(GR) and L_ok3(lo, hi, rb, gi)


def L_ok(lo, hi, rb, g):
    for v, strict in L_conds_R(rb, g):
        lb = D31.quad_lb(v)
        if lb < 0 or (strict and lb == 0):
            return False
    for m in poly_m(lo, hi):
        for v, strict in L_conds(m, rb, g):
            lb = D31.quad_lb(v)
            if lb < 0 or (strict and lb == 0):
                return False
    return True


def coords_f(m, R):
    """Coordinates of P2 (floating point, the same formulas as P2 in d87_oct_local.coords_of)."""
    nu = R.T @ m
    nu = 3 * nu / nu.sum()
    z1, z2 = (nu[0] - nu[1]) / 2, (1 - nu[2]) / 2
    A = RSF.T @ R
    tr = 1 + np.trace(A)
    p = np.array([A[2, 1] - A[1, 2], A[0, 2] - A[2, 0], A[1, 0] - A[0, 1]]) / tr
    return np.array([z1, z2, *p]), tr


def L_guess(mf, Rf):
    """In floating point: the g with R g closest to R* (largest tr(R*ᵀ R g)). Its index if it is likely to lie in the assigned region, otherwise None."""
    tr = np.einsum("ij,gjk,ik->g", Rf, GF, RSF)            # tr(R*ᵀ R g) = Σ R_ij g_jk R*_ik
    gi = int(np.argmax(tr))
    z, t = coords_f(mf, Rf @ GF[gi])
    if t > 0 and np.abs(z).max() <= float(LOC["rmax"]):
        return gi
    return None


# ---------------- floating point (candidate selection only) ----------------
def cands_f3(nf, Rf, cap=6):
    v = nf @ Rf
    order = np.argsort(-np.abs(v))
    tops = [int(order[0])]
    if abs(abs(v[order[0]]) - abs(v[order[1]])) < 0.08 * abs(v[order[0]]) + 1e-12:
        tops.append(int(order[1]))
    axs = []
    for i in WALLS[prob()]:
        o = np.argsort(-np.abs(Rf[i]))
        opts = [int(o[0])]
        if abs(abs(Rf[i, o[0]]) - abs(Rf[i, o[1]])) < 0.08:
            opts.append(int(o[1]))
        axs.append([(k, 1 if Rf[i, k] >= 0 else -1) for k in opts])
    out = []
    for k in tops:
        s = 1 if v[k] >= 0 else -1
        for ax in itertools.product(*axs):
            out.append((k, s, tuple(ax)))
            if len(out) >= cap:
                return out
    return out


def cands_f(mf, Rf):
    """Up to 4 promising candidates."""
    if prob() != "II":
        return cands_f3(mf, Rf)
    v = mf @ Rf
    order = np.argsort(-np.abs(v))
    tops = [int(order[0])]
    if abs(abs(v[order[0]]) - abs(v[order[1]])) < 0.05 * abs(v[order[0]]) + 1e-12:
        tops.append(int(order[1]))
    axs = []
    for i in range(3):
        o = np.argsort(-np.abs(Rf[i]))
        opts = [int(o[0])]
        if abs(abs(Rf[i, o[0]]) - abs(Rf[i, o[1]])) < 0.05:
            opts.append(int(o[1]))
        axs.append([(k, 1 if Rf[i, k] >= 0 else -1) for k in opts])
    out = []
    for k in tops:
        s = 1 if v[k] >= 0 else -1
        for ax in itertools.product(*axs):
            out.append((k, s, tuple(ax)))
            if len(out) >= 4:
                return out
    return out


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", ROTF, Rf) - np.trace(Rf)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if D31.discard_lb(rb, ROT_NONID[o]) > 0:
            return int(o)
    return None


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


def q_center(ch, lo, hi):
    q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
    q = np.array(q)
    w, x, y, z = q
    M = np.array([[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
                  [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
                  [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]])
    return M / (q @ q)


def rtree(nlo, nhi, budget, wmin_exp, allowL):
    leaves = []; ev = 0
    ac = (nlo[0] + nhi[0]) / 2 / ND; bc = (nlo[1] + nhi[1]) / 2 / ND
    if ac + bc > 1:
        ac, bc = ac / (ac + bc), bc / (ac + bc)
    mf = nvec_f(ac, bc)
    vf = SGN.get(prob(), 1) * mf
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            ev += 1
            if ev > budget:
                return None, ev
            Rf = q_center(ch, lo, hi)
            rb = D31.RBox(ch, lo, hi)
            m = discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            if allowL:
                gi = L_guess(mf, Rf) if prob() == "II" else L_guess3(vf, Rf)
                if gi is not None and L_ok_idx(nlo, nhi, rb, gi):
                    leaves.append([ch, lo, hi, "L", gi]); continue
            done = False
            for c in cands_f(mf, Rf):
                if box_lb(nlo, nhi, rb, c) >= 0:
                    leaves.append([ch, lo, hi, "A", [c[0], c[1], [list(t) for t in c[2]]]]); done = True; break
            if done:
                continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a_, b_ in split3(lo, hi):
                nxt.append((ch, a_, b_))
        cur = nxt
    return leaves, ev


def near_eq(lo, hi):
    """n boxes on which L is tried (preparation; does not affect correctness): near the equality point (for (III), (IV) tried everywhere, narrowed by a floating-point preview)."""
    if prob() != "II":
        return True
    return hi[1] >= ND - (ND >> 2) and lo[0] <= (ND >> 2)


def task(args):
    lo, hi, budget, wmin_exp, local, brk, pr = args
    PROB[0] = pr
    if not LOC:
        set_local(local)
    BREAK.clear(); BREAK.update(brk)
    t0 = time.time()
    allowL = (not BREAK.get("noL")) and near_eq(lo, hi)
    leaves, ev = rtree(lo, hi, budget, wmin_exp, allowL)
    if leaves is None:
        return dict(kind="fail", lo=lo, hi=hi, ev=ev, sec=time.time() - t0)
    return dict(kind="ok", lo=lo, hi=hi, leaves=leaves, ev=ev, sec=time.time() - t0)


def is_out(lo, hi):
    # a box with a + b ≥ 1 holds only one point of T, its corner (on a + b = 1), and that point is held by the neighbouring box on the left (boundary included) (as in d86_far).
    return lo[0] + lo[1] >= ND


def header():
    if prob() == "II":
        hd = dict(kind="root", prob="II", ND=ND, DEN=DEN, NF=[list(f) for f in NF], local=LOC["name"], rmax=str(LOC["rmax"]),
                  R_STAR=[[str(x) for x in r] for r in RS])
    else:
        hd = dict(kind="root", prob=prob(), ND=ND, DEN=DEN, NF3=[list(f) for f in NF3], sign=SGN[prob()], walls=list(WALLS[prob()]),
                  W_A=["5/18", "5/18", "2/9"], local=LOC["name"], R_III=[[str(x) for x in r] for r in R3],
                  local_box={k: (str(v) if isinstance(v, Fr) else [str(x) for x in v]) for k, v in LOC.items()
                             if k not in ("name", "Rconds", "RcF")})
    if BREAK:
        hd["brk"] = {k: str(v) for k, v in BREAK.items()}
    return hd


def run(name, local, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=3):
    from multiprocessing import Pool
    set_local(local)
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    cur = [([0, 0], [ND, ND])]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    rng = np.random.default_rng(0)
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                continue
            if max(h - l for l, h in zip(lo, hi)) > forced:
                nxt.extend(split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp, local, dict(BREAK), prob()))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample and "sample_of" not in stats:
            stats["sample_of"] = len(todo)
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.imap_unordered(task, todo, chunksize=1) if pool else (task(t) for t in todo)
        res = list(res)
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for lf in r["leaves"]:
                    stats["leaves"][lf[3]] += 1
                if out:
                    out.write(json.dumps(dict(kind="ok", lo=r["lo"], hi=r["hi"], leaves=r["leaves"])) + "\n")
            else:
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin):
                    stats["n_X"] += 1
                    stats["X_boxes"].append([[v / ND for v in r["lo"]], [v / ND for v in r["hi"]], r["ev"]])
                    if out:
                        out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend(split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r.get("sec", 0) for r in res]
        nok = sum(1 for r in res if r["kind"] == "ok")
        stats["levels"].append([level, len(cur), len(todo), nok])
        print(f"n level {level}: boxes {len(cur)}, tried {len(todo)}, passed {nok}, at limit {stats['n_X']}, "
              f"evaluations so far {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:     # sampled boxes (including their split children) are run to the end. Estimate = evaluations so far × sample_of / sample
            stats.setdefault("sample_results", []).extend(
                dict(lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]], kind=r["kind"], ev=r.get("ev"),
                     sec=round(r.get("sec", 0), 2), leaves={t: sum(1 for lf in r.get("leaves", []) if lf[3] == t) for t in "ADL"})
                for r in res)
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            stats["open_boxes"] = [[[v / ND for v in lo], [v / ND for v in hi]] for lo, hi in cur[:400]]
            break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    if sample:
        stats["estimate_evals"] = int(stats["evaluated"] * stats["sample_of"] / min(sample, stats["sample_of"]))
    stats["passed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp, local=local,
                           brk={k: str(v) for k, v in BREAK.items()})
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: passed {stats['passed']}, n boxes ok {stats['n_ok']}, out {stats['n_out']}, at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, evaluations {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def _replay_box(r):
    lo, hi = r["lo"], r["hi"]
    rl = set(); bad = 0; cnt = dict(A=0, D=0, L=0)
    for lf in r["leaves"]:
        ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
        kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box appears twice"); rl.add(kk)
        rb = D31.RBox(ch, rlo, rhi)
        if kind == "A":
            c = (lf[4][0], lf[4][1], tuple(tuple(t) for t in lf[4][2]))
            ok = valid_cand(c) and box_lb(lo, hi, rb, c) >= 0
        elif kind == "D":
            ok = 0 <= lf[4] < len(ROT_NONID) and D31.discard_lb(rb, ROT_NONID[lf[4]]) > 0
        elif kind == "L":
            ok = L_ok_idx(lo, hi, rb, lf[4])
        else:
            ok = False
        cnt[kind] = cnt.get(kind, 0) + 1; bad += (not ok)
    dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(rl) - seen, "hole in the cover (a box without a leaf)")
        need(depth <= dmax, "a branch that does not reach an R leaf"); depth += 1
        nxt = []
        for ch, a, b in cur:
            if (ch, tuple(a), tuple(b)) in rl:
                seen += 1; continue
            nxt.extend((ch, p, q) for p, q in split3(a, b))
        cur = nxt
    need(seen == len(rl), "cover by the R tree")
    return cnt, bad


def _replay_task(args):
    r, local, pr = args
    PROB[0] = pr
    if not LOC:
        set_local(local)
    return _replay_box(r)


def replay(name, procs=1, write=True):
    """Re-check from the record alone (no floating point): the cover trees of n and R, the type A / D / L decisions, the map premises, and the local P2 record.
    With write=False (--no-write), {name}.replay.json is not written (the entry point d87_oct_replay_all.py calls it this way; FD_d48_oct_review item 1)."""
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    set_local(lines[0]["local"])
    need("brk" not in lines[0] and not BREAK, "the record contains no test-only breakage")
    need(lines[0] == json.loads(json.dumps(header())), "premises of the record")
    check_map()
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box appears twice"); nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "boxes at the split limit remain")
    for r in nleaves.values():
        if r["kind"] == "out":
            need(is_out(r["lo"], r["hi"]), "out box")
    oks = [(r, LOC["name"], prob()) for r in nleaves.values() if r["kind"] == "ok"]
    if procs > 1:
        from multiprocessing import Pool
        with Pool(procs) as pool:
            res = pool.map(_replay_task, oks, chunksize=4)
    else:
        res = [_replay_task(x) for x in oks]
    for c, b in res:
        for k, v in c.items():
            cnt[k] += v
        cnt["bad"] += b
    need(cnt["bad"] == 0, f"failed {cnt['bad']}")
    mine = set(nleaves)
    dmax = max(sum(round(math.log2(ND / (h - l))) for l, h in zip(lo, hi)) for lo, hi in mine)
    cur = [([0, 0], [ND, ND])]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(mine) - seen, "hole in the cover (a box without a leaf)")
        need(depth <= dmax, "a branch that does not reach an n leaf"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in mine:
                seen += 1; continue
            nxt.extend(split2(lo, hi))
        cur = nxt
    need(seen == len(mine), "cover by the n tree")
    msg = (f"re-check {name}: n boxes ok {cnt['ok']}, out {cnt['out']}; R leaves accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}; "
           f"failed 0, cover trees OK, {time.time()-t0:.0f} s")
    print(msg, flush=True)
    rr = subprocess.run([sys.executable, "-X", "utf8", os.path.join(HERE, "d87_oct_local.py"), "replay", LOCAL_OF[prob()], "--name", LOC["name"]],
                        cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    need(rr.returncode == 0, "re-check of the local record failed: " + rr.stdout[-400:] + rr.stderr[-400:])
    loc = rr.stdout.strip().splitlines()[-1]
    print("local: " + loc, flush=True)
    rep = dict(name=name, counts=cnt, seconds=round(time.time() - t0, 1), local=loc, passed=True,
               when=time.strftime("%Y-%m-%d %H:%M"))
    if write:
        json.dump(rep, open(f"{name}.replay.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    return cnt


def check_map():
    """Map premises (exact): (1) every point of the chamber {m1 ≥ m2 ≥ m3 ≥ 0} is a positive multiple of an image point of T, (2) the image lies in the chamber, (3) the 24 rotations of the piece have the form that leaves F unchanged."""
    if prob() != "II":
        return check_map3()
    for a, b in ((0, 0), (ND, 0), (0, ND)):
        m = mval(a, b)
        need(m[0] >= m[1] >= m[2] >= 0 and sum(m) > 0, "a map vertex lies outside the chamber")
    rng = np.random.default_rng(2)
    for _ in range(300):
        v = sorted((Fr(int(t), 97) for t in rng.integers(0, 98, 3)), reverse=True)
        if v == [0, 0, 0]:
            continue
        s = sum(v)
        x, y, z = (t / s for t in v)            # sum 1; the sum of 6m = (6 − 3a − 4b, 3a + 2b, 2b) is 6
        b = 3 * z; a = (6 * y - 2 * b) / 3
        need(a >= 0 and b >= 0 and a + b <= 1, "the inverse map falls outside T")
        need(tuple(Fr(f[0]) + f[1] * a + f[2] * b for f in NF) == (6 * x, 6 * y, 6 * z), "inverse map")
    need(D31.det3i(RS3) == -27, "R* is a reflection (det −1): type L matches with −g")
    for g in ROT:
        need(sorted(abs(x) for r in g for x in r) == [0] * 6 + [1] * 3 and D31.det3i(g) == 1, "rotations of the piece")
    return True


def check_map3():
    """Map premises of (III), (IV) (exact): (1) the image of T lies in the chamber {a ≥ b ≥ 0, c ≥ 0}, with n_i ≤ 0 on the wall axes and n_i ≥ 0 on the others
    (linear, so the vertices suffice; this is the premise for how (n_i)₋ is placed in the candidate formulas), (2) every chamber point is a positive multiple of an image point of T, (3) R_III has det +1 and the rotations of the piece have det 1."""
    s = SGN[prob()]; W = WALLS[prob()]
    for a, b in ((0, 0), (ND, 0), (0, ND)):
        n = mval(a, b)
        abc = (s * n[0], s * n[1], -s * n[2])
        need(abc[0] >= abc[1] >= 0 and abc[2] >= 0 and sum(abc) > 0, "a map vertex lies outside the chamber")
        need(all((n[i] <= 0) if i in W else (n[i] >= 0) for i in range(3)), "signs on the wall axes")
    rng = np.random.default_rng(2)
    for _ in range(300):
        a_, b_ = sorted((Fr(int(t), 97) for t in rng.integers(0, 98, 2)), reverse=True)
        c_ = Fr(int(rng.integers(0, 98)), 97)
        S = a_ + b_ + c_
        if S == 0:
            continue
        A = 2 * b_ / S; B = c_ / S
        need(A >= 0 and B >= 0 and A + B <= 1, "the inverse map falls outside T")
        img = tuple(s * (f[0] + f[1] * A + f[2] * B) for f in NF3)
        need(img == tuple(2 * x / S for x in (s * a_, s * b_, -s * c_)), "inverse map")
    R33 = [[int(3 * x) for x in r] for r in R3]
    need(D31.det3i(R33) == 27, "R_III has det +1")
    for g in ROT:
        need(sorted(abs(x) for r in g for x in r) == [0] * 6 + [1] * 3 and D31.det3i(g) == 1, "rotations of the piece")
    return True


def F_true3(n, R):
    return C.np_G(np.asarray(n, float), np.asarray(R, float)) - np.asarray(n, float) @ np.array([5 / 18, 5 / 18, 2 / 9])


def check3():
    """Floating-point cross-check for (III), (IV): the x ↔ y copy, candidate ≤ true F and the gap of the best one, and agreement of the L decision with the local coordinates (coords_of)."""
    import d87_oct_local as LL
    kind = LOCAL_OF[prob()]
    set_local("d87_oct_local_" + kind)
    check_map(); print("map premises OK")
    rng = np.random.default_rng(1)
    s = SGN[prob()]
    Pxy = np.array([[0, 1, 0], [1, 0, 0], [0, 0, 1]], float)
    worst = 0
    for _ in range(500):
        abc = rng.random(3); n = s * np.array([abc[0], abc[1], -abc[2]])
        R = C.np_quat_batch(rng.normal(size=4)[None])[0]
        worst = max(worst, abs(F_true3(Pxy @ n, R) - F_true3(n, -Pxy @ R)))
        g = GRF[int(rng.integers(24))]
        worst = max(worst, abs(F_true3(n, R @ g) - F_true3(n, R)))
    print(f"symmetry (x ↔ y, rotations of the piece) deviation {worst:.1e}")
    w_le = -1e9; w_eq = 0
    for _ in range(2000):
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        A_, B_ = int(a * ND) & ~1, int(b * ND) & ~1
        ch = int(rng.integers(4)); qc = [int(x) & ~1 for x in rng.integers(-DEN + 2, DEN - 2, 3)]
        lo = qc; hi = [x + 2 for x in qc]
        rb = D31.RBox(ch, lo, hi)
        Rf = q_center(ch, lo, hi)
        n = mval(A_, B_); nf = np.array(n, float) / ND
        Ft = F_true3(nf, Rf)
        best = -1e9
        for c in cands_f(nf, Rf):
            v = cand_poly(n, rb, c)
            val = v[0] / rb.Q[0] / ND / 18
            best = max(best, val); w_le = max(w_le, val - Ft)
        w_eq = max(w_eq, abs(best - Ft))
    print(f"candidate − true F: max {w_le:.1e} (a lower bound if ≤ 1e−9), gap of the chosen best {w_eq:.1e}")
    # L: make inside / outside points in the local coordinates and check agreement with L_ok on small R boxes mapped by rotations of the piece
    sp_ = LL.SPEC[kind]
    agree = dis = skip = n_in = 0; g_used = set()
    for _ in range(600):
        b = [float(rng.uniform(x0 * 1.3, x1 * 1.3)) for x0, x1 in sp_["base"]]
        l = [float(rng.uniform(-1.3, 1.3) * sc * sp_["rmax"]) for sc in sp_["sc"]]
        n, Rp = LL.config_of(kind, b, l)
        abc = s * np.array([n[0], n[1], -n[2]])
        if (abc < 0).any():
            skip += 1; continue
        gi0 = int(rng.integers(24))
        Rfar = Rp @ GRF[gi0].T
        if abc[0] < abc[1]:                                   # x ↔ y to get a ≥ b (R → −P R)
            n = Pxy @ n; Rfar = -Pxy @ Rfar; abc = abc[[1, 0, 2]]
        q = C.rot_to_quat(Rfar)
        ch = int(np.argmax(np.abs(q))); q = q / q[ch]
        rest = [q[i] for i in range(4) if i != ch]
        lo = [int(x * DEN) & ~1 for x in rest]; hi = [x + 2 for x in lo]
        rb = D31.RBox(ch, lo, hi)
        S = abc.sum(); A_ = int(2 * abc[1] / S * ND) & ~1; B_ = int(abc[2] / S * ND) & ~1
        nlo, nhi = [A_, B_], [A_ + 2, B_ + 2]
        # inside / outside the assigned region (floating point, the one of the 24 piece rotations closest to the inside; only points away from the boundary are counted)
        mx = 1e9; Rc = q_center(ch, lo, hi)
        for gg in GRF:
            try:
                bb, ll = LL.coords_of(kind, n, Rc @ gg)
            except Exception:
                continue
            rel = [abs(2 * (x - float(x0)) / float(x1 - x0) - 1) for x, (x0, x1) in zip(bb, sp_["base"])]
            rel += [abs(x) / float(sc * sp_["rmax"]) for x, sc in zip(ll, sp_["sc"])]
            if np.all(np.isfinite(rel)):
                mx = min(mx, max(rel))
        vf = s * nvec_f(A_ / ND, B_ / ND)
        gi = L_guess3(vf, q_center(ch, lo, hi))
        got = gi is not None and L_ok3(nlo, nhi, rb, gi)
        if gi is not None:
            g_used.add(gi)
        if (mx < 0.98 and got) or (mx > 1.02 and not got):
            agree += 1; n_in += (mx < 0.98)
        elif mx < 0.98 or mx > 1.02:
            dis += 1
            if dis <= 5:
                print("  mismatch: rel", np.round(rel, 3), "got", got, "gi", gi)
    print(f"L cross-check: agree {agree} (inside {n_in}), mismatch {dis}, skipped outside the cone {skip}, g used {sorted(g_used)}")


def F_true(m, R):
    v = m @ R
    return np.abs(v).max() + m @ (np.abs(R).max(axis=1) - 1)


def check():
    set_local("d87_oct_local_P2")
    check_map(); print("map premises OK")
    rng = np.random.default_rng(1)
    # (1) symmetry cross-check: F is unchanged under permutations P and rotations g of the piece
    worst = 0
    for _ in range(500):
        m = rng.random(3); q = rng.normal(size=4); R = C.np_quat_batch(q[None])[0]
        for p in itertools.permutations(range(3)):
            P = np.eye(3)[list(p)]
            A = P.T @ R
            if np.linalg.det(A) < 0:
                A = -A
            worst = max(worst, abs(F_true(P @ m, R) - F_true(m, A)))
        g = GF[int(rng.integers(24))]
        worst = max(worst, abs(F_true(m, R @ g) - F_true(m, R)))      # also unchanged under −g (reflection)
    print(f"symmetry (permutations, rotations of the piece) deviation {worst:.1e}")
    # (2) candidate formula ≤ true F, and the best chosen candidate equals the true F
    w_le = -1e9; w_eq = 0
    for _ in range(2000):
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        A_, B_ = int(a * ND) & ~1, int(b * ND) & ~1
        ch = int(rng.integers(4)); qc = [int(x) & ~1 for x in rng.integers(-DEN + 2, DEN - 2, 3)]
        lo = qc; hi = [x + 2 for x in qc]
        rb = D31.RBox(ch, lo, hi)
        Rf = q_center(ch, lo, hi)
        mf = np.array(mval(A_, B_), float) / ND
        m = mval(A_, B_)
        Ft = F_true(mf, Rf)
        best = -1e9
        for c in cands_f(mf, Rf):
            v = cand_poly(m, rb, c)
            val = v[0] / rb.Q[0] / ND
            best = max(best, val)
            w_le = max(w_le, val - Ft)
        w_eq = max(w_eq, abs(best - Ft))
    print(f"candidate − true F: max {w_le:.1e} (a lower bound if ≤ 1e−9), gap of the chosen best {w_eq:.1e}")
    # (3) cross-check of the L conditions: inside the assigned region in floating-point coordinates ⇔ L_ok on a small box (points away from the boundary)
    agree = dis = 0
    import d87_oct_local as LL
    for _ in range(400):
        zz = rng.uniform(-0.16, 0.16, 5)
        n, R = LL.config_of("P2", (), zz)
        m = -n
        if (m < 0).any():
            continue
        q = C.rot_to_quat(R @ GF[int(rng.integers(24))].T)   # R is a reflection and so is GF, so the product is a rotation
        ch = int(np.argmax(np.abs(q))); q = q / q[ch]
        rest = [q[i] for i in range(4) if i != ch]
        lo = [int(x * DEN) & ~1 for x in rest]; hi = [x + 2 for x in lo]
        rb = D31.RBox(ch, lo, hi)
        # m at a point of T
        s = m.sum(); x, y, z = sorted(m / s, reverse=True)
        if not np.allclose(sorted(m / s, reverse=True), m / s):
            continue
        b = 3 * z; a = (6 * y - 2 * b) / 3
        A_, B_ = int(a * ND) & ~1, int(b * ND) & ~1
        nlo, nhi = [A_, B_], [A_ + 2, B_ + 2]
        Rf = q_center(ch, lo, hi)
        gi = L_guess(np.array(mval(A_, B_), float), Rf)
        inside = np.abs(zz).max() < 0.124
        outside = np.abs(zz).max() > 0.126
        got = gi is not None and L_ok(nlo, nhi, rb, GL[gi])
        if (inside and got) or (outside and not got):
            agree += 1
        elif inside or outside:
            dis += 1
    print(f"L cross-check: agree {agree}, mismatch {dis}")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--prob", default="II"); ap.add_argument("--name", default=None)
    ap.add_argument("--local", default="d87_oct_local_P2")
    ap.add_argument("--procs", type=int, default=12); ap.add_argument("--nmin", type=int, default=16)
    ap.add_argument("--budget", type=int, default=40000); ap.add_argument("--wmin-exp", type=int, default=18)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    ap.add_argument("--forced-exp", type=int, default=3)
    ap.add_argument("--break-noL", action="store_true"); ap.add_argument("--break-shift", default=None)
    ap.add_argument("--break-wQ", action="store_true")
    ap.add_argument("--no-write", action="store_true")   # do not write the replay result to {name}.replay.json
    a = ap.parse_args()
    need(a.prob in ("II", "III", "IV"), "--prob must be II, III or IV")
    PROB[0] = a.prob
    if a.local == "d87_oct_local_P2" and a.prob != "II":
        a.local = "d87_oct_local_" + LOCAL_OF[a.prob]
    os.chdir(HERE)
    name = a.name or f"d87_oct_far_{a.prob}"
    if a.break_noL:
        BREAK["noL"] = True
    if a.break_shift:
        BREAK["shift"] = Fr(a.break_shift)
    if a.break_wQ:
        need(a.prob != "II", "--break-wQ only for (III), (IV)")
        BREAK["wQ"] = True
    if a.cmd == "run":
        st = run(name, a.local, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit, a.forced_exp)
        sys.exit(0 if st["passed"] else 2)
    elif a.cmd == "replay":
        replay(name, a.procs, write=not a.no_write)
    elif a.cmd == "check":
        check() if a.prob == "II" else check3()
