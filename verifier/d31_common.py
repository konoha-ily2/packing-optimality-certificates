# D31 (local lemmas of octintet_n02), shared parts: g, the polynomial |q|²G_c of a candidate c = (i, j, j1, j3), coordinates (h, k′, u, p1, p2), region constants.
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The existing d28_* modules are only imported, never changed. Formula (D31 §1):
#   g(h, k′, R) = h/2 + (N(n) − 1) + (1 − h/2)(N(b0) − 1) + (k′/2)(N(b1) − 1) + ((k′+h)/2)(N(b3) − 1),
#   N(w) = ‖Rᵀw‖∞, n = (1−h, 1−h−k′, 1). F − (√2/4)y = (√2/2)·g.
# The rotation has the same orientation as in d28_oct_step0: R = M(q)/|q|² (q = (w, a, b, c), M is the numerator of Rq in exact_part).
# Candidate indices are 0-based internally (1-based in records and printouts).
import itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp

# ---------- region constants (starting point of D31 §3; if step 0 changes them, only this block is edited) ----------
R_J = Fr(1, 32)      # transverse width of the J band (h, p1, p2)
U_J = Fr(__import__("os").environ.get("D31_U_J", "5/16"))      # changed through the environment only by test n2. Upper bound of |u| on the J band (step 0b: the largest rectangle with λ_J ≥ 0.05, on the grid. The D31 starting point was 1/8)
K_J = Fr(__import__("os").environ.get("D31_K_J", "2"))          # changed through the environment only by test n2b. Upper bound of k′ on the J band (step 0b: reached the whole edge. E is not needed)
R_C = Fr(1, 64)      # transverse width of the circle tube (h, k′, p1, p2)
U_1 = Fr(__import__("os").environ.get("D31_U_1", str(U_J / 2)))        # changed through the environment only by test n2a. Lower bound of |u| on the circle tube
U_C_MAX = Fr(3, 8)   # upper bound of |u| on the circle tube (slightly outside the fundamental domain 1/3)
R_E = Fr(1, 64)      # transverse width of the edge tube (h, a, b, c). Used only when k_J < 2

# ---------- symbols and data ----------
H, K, U, P1, P2, A, B, C = sp.symbols("h k u p1 p2 a b c", real=True)
BS = ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))     # container normals b_f (D28 2.4)
SIG_N = (1, 1, 1)          # signs of the components of n (signs at I; i = 2 is + for k′ < 1)
SIG0 = (-1, -1, -1)        # b0 = (−1,−1,−1)
SIG1 = (-1, 1, 1)          # b1 = (−1, 1, 1)
SIG3 = (1, 1, -1)          # b3 = (1, 1, −1)

CANDS_SC = list(itertools.product(range(3), repeat=4))     # family S_C: 81 candidates (i, j, j1, j3)
CANDS_SE = [c for c in CANDS_SC if c[0] != 1]               # family S_E: i ∈ {1, 3} ({0, 2} 0-based), 54 candidates


def cname(c):
    return "(" + ",".join(str(t + 1) for t in c) + ")"


def Mq(w, a, b, c):
    """Numerator of the rotation matrix (times |q|²). Same as Rq in d28_oct_step0.exact_part."""
    return sp.Matrix([[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
                      [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
                      [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]])


def n_of(h, k):
    return (1 - h, 1 - h - k, 1)


def q_J(u, p1, p2):
    """Coordinates of J and C: q = (1, u + p1, u + p2, u − p1 − p2)."""
    return (1, u + p1, u + p2, u - p1 - p2)


class Poly:
    """Given coordinates (h, k, q), builds |q|²G_c for all candidates."""

    def __init__(self, h, k, q):
        M = Mq(*q)
        self.Q = sp.expand(sum(t * t for t in q))
        Mt = M.T
        self.vn = [sp.expand(e) for e in Mt * sp.Matrix(n_of(h, k))]
        self.vb = [[sp.expand(e) for e in Mt * sp.Matrix(b)] for b in BS]
        self.h, self.k = h, k

    def P(self, c):
        """|q|²·G_c (a polynomial)."""
        i, j, j1, j3 = c
        Q, h, k = self.Q, self.h, self.k
        return sp.expand(Q * h / 2 + (SIG_N[i] * self.vn[i] - Q) + (1 - h / 2) * (SIG0[j] * self.vb[0][j] - Q)
                         + k / 2 * (SIG1[j1] * self.vb[1][j1] - Q) + (k + h) / 2 * (SIG3[j3] * self.vb[3][j3] - Q))


# ---------- g (exact and floating point) ----------
def g_exact(h, k, R):
    """R is a sympy matrix of rationals (orthogonal). h, k are rationals."""
    Rt = R.T
    N = lambda w: max(abs(e) for e in Rt * sp.Matrix(w))
    n = n_of(h, k)
    return sp.expand(sp.Rational(h) / 2 + (N(n) - 1) + (1 - sp.Rational(h) / 2) * (N(BS[0]) - 1)
                        + sp.Rational(k) / 2 * (N(BS[1]) - 1) + (sp.Rational(k) + h) / 2 * (N(BS[3]) - 1))


BF = np.array(BS, float)


def g_float(h, k, R):
    Rt = R.T
    N = lambda w: np.abs(Rt @ w).max()
    n = np.array([1 - h, 1 - h - k, 1.0])
    return h / 2 + (N(n) - 1) + (1 - h / 2) * (N(BF[0]) - 1) + k / 2 * (N(BF[1]) - 1) + (k + h) / 2 * (N(BF[3]) - 1)


# =====================================================================================
# Step 1 and later (2026-11-13 morning): parts used by the exact box checks. All integers (Python int) and rationals. Floating point only to choose candidates.
# =====================================================================================
import math

ND = 2 ** 30          # denominator of the n-box coordinates (h, k′)
DEN = 2 ** 30         # denominator of the R-box coordinates (3 components of a quaternion chart)


def det3i(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def piece_rot_group():
    """Rotation group of the octahedral piece (vertices ±e_i): the 24 signed permutations with det = 1. N_R(w) = ‖Rᵀw‖∞ is unchanged by R → Rk."""
    out = []
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]
            if det3i(M) == 1:
                out.append(M)
    assert len(out) == 24
    return out


ROT = piece_rot_group()
ROT_NONID = [k for k in ROT if k != [[1, 0, 0], [0, 1, 0], [0, 0, 1]]]

# ---------- integer polynomials of degree ≤ 2 in (s1, s2, s3) ∈ [−1, 1]³: a list of length 10 ----------
# index 0:1, 1:s1, 2:s2, 3:s3, 4:s1², 5:s2², 6:s3², 7:s1s2, 8:s1s3, 9:s2s3
_SQ = {1: 4, 2: 5, 3: 6}
_CR = {(1, 2): 7, (1, 3): 8, (2, 3): 9}


def mul_aff(x, y):
    """Affine x = [c, a1, a2, a3], y likewise → quadratic (length 10)."""
    out = [0] * 10
    out[0] = x[0] * y[0]
    for m in (1, 2, 3):
        out[m] = x[0] * y[m] + x[m] * y[0]
        out[_SQ[m]] = x[m] * y[m]
    for (a, b), idx in _CR.items():
        out[idx] = x[a] * y[b] + x[b] * y[a]
    return out


def quad_lb(v):
    """Lower bound on s ∈ [−1,1]³ (exact): constant + min(0, c) of the square terms − |c| of the odd terms."""
    return v[0] + min(0, v[4]) + min(0, v[5]) + min(0, v[6]) - abs(v[1]) - abs(v[2]) - abs(v[3]) - abs(v[7]) - abs(v[8]) - abs(v[9])


def vcomb(terms):
    out = [0] * 10
    for c, v in terms:
        if c:
            for t in range(10):
                out[t] += c * v[t]
    return out


def chart_q_aff(ch, lo, hi):
    """R box of chart ch (q_ch = 1) (lo, hi in DEN units, width a positive even number) → affine forms of the 4 components of q (times DEN)."""
    q = []
    m = 0
    for pos in range(4):
        if pos == ch:
            q.append([DEN, 0, 0, 0])
        else:
            l, h = lo[m], hi[m]
            assert (h - l) % 2 == 0 and h > l
            a = [(l + h) // 2, 0, 0, 0]; a[1 + m] = (h - l) // 2
            q.append(a); m += 1
    return q


class RBox:
    """Quadratic forms of M(q)_{ij} (times DEN²) and |q|² (times DEN²) on an R box."""
    __slots__ = ("M", "Q")

    def __init__(self, ch, lo, hi):
        q = chart_q_aff(ch, lo, hi)
        P = [[mul_aff(q[a], q[b]) for b in range(4)] for a in range(4)]
        w, x, y, z = 0, 1, 2, 3
        add = lambda *ts: vcomb(ts)
        self.Q = add((1, P[w][w]), (1, P[x][x]), (1, P[y][y]), (1, P[z][z]))
        self.M = [[add((1, P[w][w]), (1, P[x][x]), (-1, P[y][y]), (-1, P[z][z])), add((2, P[x][y]), (-2, P[w][z])), add((2, P[x][z]), (2, P[w][y]))],
                  [add((2, P[x][y]), (2, P[w][z])), add((1, P[w][w]), (-1, P[x][x]), (1, P[y][y]), (-1, P[z][z])), add((2, P[y][z]), (-2, P[w][x]))],
                  [add((2, P[x][z]), (-2, P[w][y])), add((2, P[y][z]), (2, P[w][x])), add((1, P[w][w]), (-1, P[x][x]), (-1, P[y][y]), (1, P[z][z]))]]


def discard_lb(rb, k):
    """Lower bound of tr(R k) − tr(R) (times |q|²·DEN²). If > 0, tr(Rk) > tr(R) on the whole box. (Rk)_ii = Σ_j R_ij k_ji."""
    return quad_lb(vcomb([(k[j][i] - (1 if i == j else 0), rb.M[i][j]) for i in range(3) for j in range(3)]))


# ---------- far-region candidate polynomials (affine forms in (h, k′) × entries of M) ----------
# Affine forms are (c0, ch, ck) times 2 (integers). n = (1−h, 1−h−k, 1), weights 1−h/2, k/2, (k+h)/2, coefficient of |q|² is h/2 − 2 − k.
N_FORMS = ((2, -2, 0), (2, -2, -2), (2, 0, 0))
W_FORMS = {0: (2, -1, 0), 1: (0, 0, 1), 3: (0, 1, 1)}      # 2×weight
Q_FORM = (-4, 1, -2)                                         # 2×(h/2 − 2 − k)


def far_forms(cand):
    """cand = ((i, s_n), (j, s0), (j1, s1), (j3, s3)) (i etc. 0-based, s = ±1).
    The L of 2·|q|²·G_c = Σ_{l,i} M_{l,i}·L_{l,i}(h,k) + |q|²·L_Q(h,k) (integer (c0, ch, ck), doubled).
    G_c = h/2 + (s_n(Rᵀn)_i − 1) + (1−h/2)(s0(Rᵀb0)_j − 1) + (k/2)(s1(Rᵀb1)_j1 − 1) + ((k+h)/2)(s3(Rᵀb3)_j3 − 1),
    (Rᵀw)_i = Σ_l R_{l,i} w_l, R = M/|q|²."""
    L = {}

    def addf(key, f, s):
        a = L.get(key, (0, 0, 0)); L[key] = (a[0] + s * f[0], a[1] + s * f[1], a[2] + s * f[2])
    (i, sn), (j, s0), (j1, s1), (j3, s3) = cand
    for l in range(3):
        addf((l, i), N_FORMS[l], sn)
    for f, (jj, ss) in ((0, (j, s0)), (1, (j1, s1)), (3, (j3, s3))):
        for l in range(3):
            if BS[f][l]:
                addf((l, jj), W_FORMS[f], ss * BS[f][l])
    return L


def far_cand_f(nf, Rf):
    """At the box center (floating point): for each of n, b0, b1, b3, the component of largest |Rᵀw| and its sign."""
    out = []
    for w in (nf, BF[0], BF[1], BF[3]):
        v = Rf.T @ w
        i = int(np.argmax(np.abs(v)))
        out.append((i, 1 if v[i] >= 0 else -1))
    return tuple(out)


def far_lb(nlo, nhi, rb, cand):
    """Lower bound (integer) of 2·ND·|q|²·G_c·DEN² for candidate cand on the n box [nlo, nhi] (ND units, (h, k)) × the R box rb."""
    L = far_forms(cand)
    best = None
    for hv in (nlo[0], nhi[0]):
        for kv in (nlo[1], nhi[1]):
            terms = [(f[0] * ND + f[1] * hv + f[2] * kv, rb.M[l][i]) for (l, i), f in L.items()]
            terms.append((Q_FORM[0] * ND + Q_FORM[1] * hv + Q_FORM[2] * kv, rb.Q))
            v = quad_lb(vcomb(terms))
            best = v if best is None else min(best, v)
    return best


# ---------- local region L = J ∪ C (the far and local parts use the same definition) ----------
def n_in_J(nlo, nhi):
    return nhi[0] <= R_J * ND and nhi[1] <= K_J * ND


def n_in_C(nlo, nhi):
    return nhi[0] <= R_C * ND and nhi[1] <= R_C * ND


def n_overlaps_J(nlo, nhi):
    return nlo[0] < R_J * ND and nlo[1] < K_J * ND


def n_overlaps_C(nlo, nhi):
    return nlo[0] < R_C * ND and nlo[1] < R_C * ND


def _verts(lo, hi):
    return [(a, b, c) for a in (lo[0], hi[0]) for b in (lo[1], hi[1]) for c in (lo[2], hi[2])]


def r_in_J(ch, lo, hi):
    """Whether the 8 vertices of an R box of chart 0 lie in the R range of J {|u| ≤ U_J, |p1|, |p2| ≤ R_J} (u = (a+b+c)/3, p1 = a − u, p2 = b − u)."""
    if ch != 0:
        return False
    for a, b, c in _verts(lo, hi):
        if not (abs(a + b + c) <= 3 * U_J * DEN and abs(2 * a - b - c) <= 3 * R_J * DEN and abs(2 * b - a - c) <= 3 * R_J * DEN):
            return False
    return True


def r_in_C(ch, lo, hi):
    """Whether the 8 vertices lie in one side of the R range of C {U_1 ≤ ±u ≤ U_C_MAX, |p1|, |p2| ≤ R_C}."""
    if ch != 0:
        return False
    V = _verts(lo, hi)
    for sg in (1, -1):
        if all(U_1 * 3 * DEN <= sg * (a + b + c) <= U_C_MAX * 3 * DEN and abs(2 * a - b - c) <= 3 * R_C * DEN
               and abs(2 * b - a - c) <= 3 * R_C * DEN for a, b, c in V):
            return True
    return False


def in_L(nlo, nhi, ch, lo, hi):
    """Whether (n box, R box) lies in the range of the local lemmas (J or C). Returns which one (None if neither)."""
    if n_in_J(nlo, nhi) and r_in_J(ch, lo, hi):
        return "J"
    if n_in_C(nlo, nhi) and r_in_C(ch, lo, hi):
        return "C"
    return None
