# Q70 (tetintet_n05 step (3)) common parts: coordinates, centres, the formulas for G̃ and Š (floating point and exact), constants of the local region.
# 2026-11-13 night, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The base is the form of d40_common (tetintet_n02). The existing d28_*, d31_*, d37_tet_n05_exact and d40_* are not changed.
#
# The coordinates are the same as d37_tet_n05_exact (D28 2.4, times √2):
#   piece vertices ṽ = (±1,±1,±1)/2 (an even number of −, in the order of solids), container normals b_f = (1,1,−1), (1,−1,1), (−1,1,1), (−1,−1,−1),
#   container 2C̃ = {b_f·x ≤ 1}, s₀ = 2. Cell R_3 = {b_3·x ≤ 0} (NOTES_d37 6.1). H̃'_3 := max(H̃_3, s₀/2) = max(H̃_3, 1), the others H̃'_f = H̃_f.
#   F̃(N, R) = max_v N·Rṽ + ¼Σ_f (m̃(N) − N·b_f)·H̃'_f(R) − (s₀/2)·m̃(N), m̃(N) = max_f N·b_f. Š(R) := Σ_f H̃'_f − 2s₀ (s̃₁ ≤ s₀ ⇔ Š ≤ 0).
#   Multiplier (the form of D40 2.1): G̃_μ = F̃ + (μ/4)·Š ∓ κ̃ = the same with the weight of m̃ replaced by m̃ + μ (μ ≥ 0, the weights stay nonnegative).
#
# Map of n [my own reasoning]: the symmetry of the problem with the cell is C3v (permutations of the coordinates that swap b_0..b_2 and keep b_3 and the cell). The chamber is {y ≥ x ≥ z}.
#   The map that brings −n back into the chamber is σ(x, y, z) := (−x, −z, −y) (a 180° rotation about (0,1,−1), σ² = 1). Half of the chamber A = {y ≥ x ≥ z, x ≥ 0} and
#   the other half B = σ(A) = {x ≤ 0}. A is a spherical triangle (vertices (1,1,1), (0,1,0), (0,0,−1)), which can be written as the triangle on the plane N·b_0 = 1
#   n_A(a, b) := (1 − a − b, 1 − b, 1 − a − 2b), T = {a ≥ 0, b ≥ 0, a + b ≤ 1} (vertices (0,0)→(1,1,1), (1,0)→(0,1,0), (0,1)→(0,0,−1)).
#   On A, m̃(n_A) = n_A·b_0 = 1 (the difference from b_1 is 2a + 2b, from b_2 is 2b, from b_3 is 4 − 2a − 4b, all ≥ 0).
#   Side B: n_B(a, b) := σ(n_A(a, b)) = (a + b − 1, a + 2b − 1, b − 1). m̃(n_B) = n_B·b_3 = 3 − 2a − 4b (when 2a + 3b ≤ 2; the local range is inside this).
#   The arc (P1) is b = 0, a ∈ [0, 4/5] (n_A(a, 0) = (1−a)·(1, 1/(1−a), 1); the arc of d37 is (1, 1+4u, 1), with 1 + 4u = 1/(1 − a)). a = 0 is (1,1,1) (the fixed point of C3v, the corner of D_n),
#   a = 4/5 is the end (1,5,1) (edge to edge). The side a = 0 is the mirror x = y, the side b = 0 is the mirror x = z (the arc lies on it), a + b = 1 is x = 0 (the boundary of σ).
# The rotation has the same orientation as d31_common and d40_common: R = M(q)/|q|², q = (w, a, b, c).
import itertools, math, os
from fractions import Fraction as Fr
import numpy as np

S0 = Fr(2)
JCELL = 3
MF = {"A": 0, "B": 3}       # the face whose m̃ is taken on each side (in the local range)

# ---------- constants of the local region (if decided in step 0b, only here) ----------
A_MAX = Fr(7, 8)            # upper limit of a for the tube of the arc (0.075 beyond the end a = 4/5 of the arc)
R0 = Fr(os.environ.get("D37_R0", "1/32"))   # lateral width (b and the quaternion p). The record of Q70 uses 1/32. In Q99 it can be changed by the environment variable D37_R0 to leave room in the far band (11/14)
BETA = Fr(-7, 4)            # coefficient of b in κ̃ (step 0b: window (−2, −3/2), with β = −7/4 both T_S and T_C give 0.25, 11/13)

# ---------- data ----------
VT = ((1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1))          # 2·ṽ (integers)
BS = ((1, 1, -1), (1, -1, 1), (-1, 1, 1), (-1, -1, -1))
VTF = np.array(VT, float) / 2
BF = np.array(BS, float)

R1STAR = ((Fr(-2, 3), Fr(-2, 3), Fr(1, 3)), (Fr(-1, 3), Fr(2, 3), Fr(2, 3)), (Fr(-2, 3), Fr(1, 3), Fr(-2, 3)))   # the stopped piece of P1 (d37 6.2)
RP2 = ((Fr(-2, 3), Fr(-2, 3), Fr(1, 3)), (Fr(-2, 3), Fr(1, 3), Fr(-2, 3)), (Fr(1, 3), Fr(-2, 3), Fr(-2, 3)))      # the stopped piece of P2 (upside down)
I3 = ((Fr(1), Fr(0), Fr(0)), (Fr(0), Fr(1), Fr(0)), (Fr(0), Fr(0), Fr(1)))


def qmul(p, q):
    w1, x1, y1, z1 = p; w2, x2, y2, z2 = q
    return (w1*w2 - x1*x2 - y1*y2 - z1*z2, w1*x2 + x1*w2 + y1*z2 - z1*y2,
            w1*y2 - x1*z2 + y1*w2 + z1*x2, w1*z2 + x1*y2 - y1*x2 + z1*w2)


def Mq(w, a, b, c):
    """Numerator of the rotation matrix (|q|² times it). The same as d31_common.Mq."""
    return [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
            [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
            [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]


def rot_f(q):
    q = [float(t) for t in q]
    return np.array(Mq(*q), float) / sum(t * t for t in q)


def rot_fr(q):
    Q = sum(Fr(t) * Fr(t) for t in q)
    return tuple(tuple(Fr(e) / Q for e in row) for row in Mq(*[Fr(t) for t in q]))


def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def matmul(A, B):
    return tuple(tuple(sum(A[i][l] * B[l][j] for l in range(3)) for j in range(3)) for i in range(3))


def transpose(A):
    return tuple(tuple(A[j][i] for j in range(3)) for i in range(3))


def mat_to_q(M):
    """Rational rotation matrix -> rational quaternion (not normalised, turned into integers). Converted back to a matrix and checked exactly."""
    M = [[Fr(x) for x in r] for r in M]
    tr = M[0][0] + M[1][1] + M[2][2]
    cands = [(1 + tr, M[2][1] - M[1][2], M[0][2] - M[2][0], M[1][0] - M[0][1]),
             (M[2][1] - M[1][2], 1 + M[0][0] - M[1][1] - M[2][2], M[0][1] + M[1][0], M[0][2] + M[2][0]),
             (M[0][2] - M[2][0], M[0][1] + M[1][0], 1 - M[0][0] + M[1][1] - M[2][2], M[1][2] + M[2][1]),
             (M[1][0] - M[0][1], M[0][2] + M[2][0], M[1][2] + M[2][1], 1 - M[0][0] - M[1][1] + M[2][2])]
    q = max(cands, key=lambda c: max(abs(x) for x in c))      # all four are proportional to q (use one that is not 0)
    L = 1
    for x in q:
        L = L * x.denominator // math.gcd(L, x.denominator)
    q = [int(x * L) for x in q]
    g = 0
    for x in q:
        g = math.gcd(g, x)
    q = tuple(Fr(x // g) for x in q)
    assert rot_fr(q) == tuple(tuple(r) for r in M), (M, q)
    return q


# ---------- map of n ----------
def n_A(a, b):
    return (1 - a - b, 1 - b, 1 - a - 2 * b)


def n_B(a, b):
    return (a + b - 1, a + 2 * b - 1, b - 1)


def sigma(n):
    return (-n[0], -n[2], -n[1])


# ---------- rotation group of the piece, representatives ----------
def piece_rots():
    out = []
    S = set(VT)
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]
            if det3(M) == 1 and all(tuple(sum(M[i][j] * v[j] for j in range(3)) for i in range(3)) in S for v in VT):
                out.append(tuple(tuple(Fr(x) for x in r) for r in M))
    assert len(out) == 12
    return out


PROT = piece_rots()


def same_placement(R1, R2):
    """Whether R1 and R2 are the same placement (R1⁻¹R2 lies in the rotation group of the piece)."""
    return matmul(transpose(R1), R2) in PROT


def trace_rep(R):
    """The representative of the orbit {R k} of piece rotations with the largest tr(R k) (the same rule as d40, matching the discarding rule of the far part)."""
    best = None
    for k in PROT:
        Rk = matmul(R, k)
        tr = Rk[0][0] + Rk[1][1] + Rk[2][2]
        if best is None or tr > best[0]:
            best = (tr, Rk)
    return best[1]


def perm_mats():
    out = []
    for p in itertools.permutations(range(3)):
        out.append((p, tuple(tuple(Fr(1) if p[i] == j else Fr(0) for j in range(3)) for i in range(3))))
    return out


def conj(g, R):
    """g R g⁻¹ (g is a permutation. The set of piece vertices is preserved by permutations of the coordinates, so this is the placement RK mapped by g)."""
    return matmul(matmul(g, R), transpose(g))


_CACHE = {}


def centers():
    """Local centres: [(name, side, quaternion, kind)]. kind is "tube" (a is the base parameter) or "point" (n is near the corner (1,1,1)).
    The stopped piece (P1) is classified by dividing its 6 images g R₁* g⁻¹ under C3v by the piece rotations: those mapped to each other by the arc's mirror x↔z and the identity form the tube, the rest are points.
    The same for P2 (if the placement is invariant under C3v there is 1). The corner piece is the tube of I (side B)."""
    if "cen" in _CACHE:
        return _CACHE["cen"]
    out = []
    pm = perm_mats()
    for base, R0_, kind_fn in (("P1", R1STAR, None), ("P2", RP2, None)):
        reps = []
        for p, g in pm:
            Rg = conj(g, R0_)
            if any(same_placement(Rg, r) for _, r in reps):
                continue
            reps.append((p, Rg))
        for i, (p, Rg) in enumerate(reps):
            if base == "P1":
                # the permutations that keep the arc (on the mirror x = z, y maximal) are the identity and x↔z
                kind = "tube" if same_placement(Rg, R1STAR) or same_placement(Rg, conj(pm_swap_xz(), R1STAR)) else "point"
                nm = "T_S" if (kind == "tube" and same_placement(Rg, R1STAR)) else ("T_S'" if kind == "tube" else f"P1_g{''.join(map(str, p))}")
            else:
                kind = "point"; nm = "P2" if len(reps) == 1 else f"P2_g{''.join(map(str, p))}"
            out.append((nm, "A", mat_to_q(trace_rep(Rg)), kind))
    out.append(("T_C", "B", (Fr(1), Fr(0), Fr(0), Fr(0)), "tube"))
    _CACHE["cen"] = out
    return out


def pm_swap_xz():
    return ((Fr(0), Fr(0), Fr(1)), (Fr(0), Fr(1), Fr(0)), (Fr(1), Fr(0), Fr(0)))


def kappa_coefs():
    """κ̃(a, b) = a0 + a1·a + β·b (in the coordinates of side A). On the arc F̃(n_A(a, 0), R₁*) = 1 − a (the scale of n_A for F̃₁ ≡ 1 of d37 6.2).
    Here it is redone by exact substitution."""
    if "kap" in _CACHE:
        return _CACHE["kap"]
    v0 = Ft_exact(n_A(Fr(0), Fr(0)), R1STAR)
    v1 = Ft_exact(n_A(Fr(1, 2), Fr(0)), R1STAR)
    a0 = v0; a1 = (v1 - v0) * 2
    _CACHE["kap"] = (a0, a1, BETA)
    return a0, a1, BETA


# ---------- exact F̃ (true m̃, true maximum). For cross-checking ----------
def Hp_exact(R):
    X = [tuple(sum(R[i][j] * Fr(VT[v][j], 2) for j in range(3)) for i in range(3)) for v in range(4)]
    H = [max(sum(b[i] * x[i] for i in range(3)) for x in X) for b in BS]
    H[JCELL] = max(H[JCELL], S0 / 2)
    return H, X


def Ft_exact(N, R, s=S0):
    N = [Fr(x) for x in N]
    H, X = Hp_exact(R)
    dot = lambda u, w: sum(p * q for p, q in zip(u, w))
    m = max(dot(N, b) for b in BS)
    return max(dot(N, x) for x in X) + sum((m - dot(N, b)) * h for b, h in zip(BS, H)) / 4 - s / 2 * m


def Sch_exact(R, s=S0):
    H, _ = Hp_exact(R)
    return sum(H) - 2 * s


# ---------- floating point ----------
def parts_f(n, R):
    X = VTF @ R.T
    H = (X @ BF.T).max(0)
    H[JCELL] = max(H[JCELL], float(S0) / 2)
    return (X @ n).max(), H


def Ft_f(n, R, s=2.0):
    """F̃ with the true m̃ (floating point)."""
    n = np.asarray(n, float)
    top, H = parts_f(n, R)
    m = (BF @ n).max()
    return top + 0.25 * ((m - BF @ n) * H).sum() - 0.5 * s * m


def Sch_f(R, s=2.0):
    _, H = parts_f(np.zeros(3), R)
    return H.sum() - 2 * s


def first_order(side, a, b, Rc, mu, kap_da, kap_db, use_a, tol=1e-9, top_ref=None, s=2.0):
    """The form of the directional derivative of G̃_μ at (n, R) = (n_side(a, b), Rc) (κ is subtracted on side A and added on side B: kap_* are passed with their signs).
    Variable ζ = ([da,] db, p1, p2, p3), R = Rc·R(1, p) (≈ Rc(I + 2[p]×)). Returns (lin, terms, base): D(ζ) = lin·ζ + Σ wt·max_j L_j·ζ."""
    nf = np.array(n_A(a, b) if side == "A" else n_B(a, b), float)
    if side == "A":
        dn_da = np.array([-1.0, 0.0, -1.0]); dn_db = np.array([-1.0, -1.0, -2.0])
    else:
        dn_da = np.array([1.0, 1.0, 0.0]); dn_db = np.array([1.0, 2.0, 1.0])
    mf = MF[side]
    Bm = BF[mf]
    d = 5 if use_a else 4
    off = 1 if use_a else 0
    X = VTF @ Rc.T

    def dRv(w, vi):
        return 2 * np.cross(VTF[vi], Rc.T @ w)
    terms = []
    lin = np.zeros(d)
    vals = X @ nf
    mx = vals.max()
    tied = [i for i in range(4) if vals[i] >= mx - tol]
    if top_ref is not None:
        tied = [i for i in range(4) if vals[i] >= vals[top_ref] - tol]
    rows = []
    for vi in tied:
        L = np.zeros(d)
        if use_a:
            L[0] = dn_da @ X[vi]
        L[off] = dn_db @ X[vi]
        L[off + 1:] = dRv(nf, vi)
        rows.append(L)
    terms.append((1.0, rows, ("top", tied)))
    Hraw = (X @ BF.T).max(0)
    H = Hraw.copy(); H[JCELL] = max(H[JCELL], 1.0)
    base = mx
    for f in range(4):
        wf = nf @ (Bm - BF[f]) + mu
        if use_a:
            lin[0] += 0.25 * (dn_da @ (Bm - BF[f])) * H[f]
        lin[off] += 0.25 * (dn_db @ (Bm - BF[f])) * H[f]
        base += 0.25 * wf * H[f]
        if wf > tol:
            v = X @ BF[f]; m = v.max()
            td = [i for i in range(4) if v[i] >= m - tol]
            rows = []
            if f == JCELL and m < 1.0 - tol:
                continue                                   # H̃'_3 = 1 (constant)
            for vi in td:
                L = np.zeros(d); L[off + 1:] = dRv(BF[f], vi); rows.append(L)
            if f == JCELL and abs(m - 1.0) <= tol:
                rows.append(np.zeros(d))                   # max(DH̃_3, 0)
            terms.append((0.25 * wf, rows, ("H", f, td)))
    if use_a:
        lin[0] += -0.5 * s * (dn_da @ Bm) - kap_da
    lin[off] += -0.5 * s * (dn_db @ Bm) - kap_db
    base += -0.5 * s * (nf @ Bm) - 0.5 * mu * s
    return lin, terms, base


def first_order_S(Rc, use_a, tol=1e-9):
    """The form of the directional derivative of Š (independent of n)."""
    d = 5 if use_a else 4
    off = 1 if use_a else 0
    X = VTF @ Rc.T
    terms = []
    for f in range(4):
        v = X @ BF[f]; m = v.max(); td = [i for i in range(4) if v[i] >= m - tol]
        if f == JCELL and m < 1.0 - tol:
            continue
        rows = []
        for vi in td:
            L = np.zeros(d); L[off + 1:] = 2 * np.cross(VTF[vi], Rc.T @ BF[f]); rows.append(L)
        if f == JCELL and abs(m - 1.0) <= tol:
            rows.append(np.zeros(d))
        terms.append((1.0, rows, ("H", f, td)))
    return np.zeros(d), terms


def sharp_lp(forms, d, face, lo):
    """min_{ζ̂ ∈ face} max_T D_T(ζ̂) (the same as d40_common.sharp_lp)."""
    from scipy.optimize import linprog
    nu = sum(len(tm) for _, tm in forms)
    nv = d + 1 + nu
    A = []; b = []
    ui = d + 1
    for lin, terms in forms:
        row = np.zeros(nv); row[:d] = lin; row[d] = -1.0
        for wt, rows, _ in terms:
            row[ui] = wt
            for L in rows:
                r2 = np.zeros(nv); r2[:d] = L; r2[ui] = -1.0; A.append(r2); b.append(0.0)
            ui += 1
        A.append(row); b.append(0.0)
    bounds = [(lo[i], 1.0) for i in range(d)] + [(None, None)] + [(None, None)] * nu
    ax, sgn = face
    bounds[ax] = (float(sgn), float(sgn))
    cobj = np.zeros(nv); cobj[d] = 1.0
    res = linprog(cobj, A_ub=np.array(A), b_ub=np.array(b), bounds=bounds, method="highs")
    if res.status != 0:
        return None, None
    return res.fun, res.x[:d]


def faces_of(d, lo):
    out = []
    for i in range(d):
        out.append((i, 1))
        if lo[i] < 0:
            out.append((i, -1))
    return out
