# D40 (local part of tetintet_n02, route Y): shared parts. The minimal polynomial of s₀, the rotation R₁* of the stopped piece
# and its rational approximation R̂, the coordinates on D_n, the formulas of G̃ and Š (floating point and exact), the 7 centres,
# and the constants of the local regions.
# 2026-11-13, written by Claude (Opus 5.5). The argument, the code and the tests were written by Claude; no third-party review; not a formal proof.
# The existing d28_*, d31_*, d37_* are only read, never changed. The formulas are D40 §§1-2:
#   vertices of the piece (scaled by √2) ṽ0 = (1,1,1)/2, ṽ1 = (1,−1,−1)/2, ṽ2 = (−1,1,−1)/2, ṽ3 = (−1,−1,1)/2 (order of solids).
#   container normals b_f = (−1,−1,−1), (−1,1,1), (1,−1,1), (1,1,−1) (D28 2.4). D_n = {n = (x, y, 1) : |y| ≤ x ≤ 1},
#   on D_n m̃(n) = n·b₂. h := 1 − x, k′ := x − y.
#   G̃_μ(n, R) = max_v n·Rṽ + (1/4)Σ_f (n·(b₂ − b_f) + μ)·H̃_f(R) − (s/2)·n·b₂ − μs/2 − κ̃(n),  H̃_f(R) = max_v b_f·Rṽ.
#   Š(R) = Σ_f H̃_f(R) − 2s  (s₁(R) ≤ s ⇔ Š ≤ 0).
# Rotations use the same convention as d31_common: R = M(q)/|q|², q = (w, a, b, c).
import itertools, math
from fractions import Fraction as Fr
import numpy as np

# ---------- results of step 0a (d40_step0.py re-derives them from the equations) ----------
# Gröbner basis (lex, a > b > c) of E1-E3 (D40 1.2, record coordinates) in the chart w = 1:
#   c is a root of PC(c) = c (c − 1)(c + 1)·Q5(c); a and b are polynomials in c. The recorded configuration is the real root c = 0.6538775… of Q5.
Q5 = (8, 81, 188, -156, -264, 171)                       # 8c⁵ + 81c⁴ + 188c³ − 156c² − 264c + 171 (highest degree first)
A_OF_C = (Fr(332, 12855), Fr(4857, 8570), Fr(61441, 25710), Fr(6873, 8570), Fr(-16623, 8570))   # a(c) (remainder mod Q5, from c⁴)
B_OF_C = (Fr(116, 12855), Fr(871, 8570), Fr(1333, 25710), Fr(-3071, 8570), Fr(-4569, 8570))     # b(c)
S0_MINPOLY = (576, -2112, 2528, -1296, 231, 19)          # minimal polynomial of s₀ (degree 5, highest degree first)
C_ROOT_APPROX = 0.65387750631815581774

S_BAR = Fr(1953564244, 10 ** 9)                          # s̄ of route Y (s₀ − 5.6e−10)
QHAT_DEN_EXP = 70                                        # denominator 2^70 of the quaternion of R̂

# ---------- constants of the local regions (starting point of D40 §4; if step 0b changes them, change only here) ----------
H_MAX = Fr(3, 8)          # upper end of h on the tube along the arc (beyond the lower end h₁ = 0.2835)
R0 = Fr(1, 32)            # transverse width (k′ and the quaternion part p)
BETA = Fr(-25, 32)        # coefficient of k′ in κ₁ (middle of the step-0b window [−0.977, −0.591], 11/13)

# ---------- data ----------
VT = ((1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1))        # 2·ṽ (integers)
BS = ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))
VTF = np.array(VT, float) / 2
BF = np.array(BS, float)
B2 = BF[2]
G0 = np.diag([-1.0, 1.0, -1.0])                          # record coordinates → coordinates of D_n (D40 1.3)
QG0 = (0, 0, 1, 0)                                       # quaternion of G0 (rotation by π about the y axis)


def qmul(p, q):
    w1, x1, y1, z1 = p; w2, x2, y2, z2 = q
    return (w1*w2 - x1*x2 - y1*y2 - z1*z2, w1*x2 + x1*w2 + y1*z2 - z1*y2,
            w1*y2 - x1*z2 + y1*w2 + z1*x2, w1*z2 + x1*y2 - y1*x2 + z1*w2)


def Mq(w, a, b, c):
    """Numerator of the rotation matrix (times |q|²). Same as d31_common.Mq. Works for elements of any ring."""
    return [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
            [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
            [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]


def rot_f(q):
    q = [float(t) for t in q]
    return np.array(Mq(*q), float) / sum(t * t for t in q)


def rot_fr(q):
    """Rational quaternion → rational matrix."""
    Q = sum(t * t for t in q)
    return [[Fr(e) / Q for e in row] for row in Mq(*q)]


def poly_eval(coefs, x):
    v = 0
    for c in coefs:
        v = v * x + c
    return v


def c_root(dps=60):
    """The real root of Q5 (the c of the recorded configuration), with mpmath."""
    import mpmath as mp
    mp.mp.dps = dps
    return mp.findroot(lambda t: poly_eval(Q5, t), mp.mpf(C_ROOT_APPROX))


def qstar_rec(dps=60):
    """q* = (1, a(c), b(c), c) in record coordinates (mpmath)."""
    import mpmath as mp
    c = c_root(dps)
    a = poly_eval([mp.mpf(t.numerator) / t.denominator for t in A_OF_C], c)
    b = poly_eval([mp.mpf(t.numerator) / t.denominator for t in B_OF_C], c)
    return (mp.mpf(1), a, b, c)


def qstar_D(dps=60):
    """q* = QG0 ⊗ q*_rec in the coordinates of D_n (mpmath, not normalized)."""
    return qmul(QG0, qstar_rec(dps))


def qhat():
    """Quaternion of R̂: q*_D normalized to |q| = 1 and rounded to multiples of 2^-70 (rational)."""
    import mpmath as mp
    q = qstar_D(60)
    nq = mp.sqrt(sum(t * t for t in q))
    D = 2 ** QHAT_DEN_EXP
    return tuple(Fr(int(mp.nint(t / nq * D)), D) for t in q)


# ---------- coordinates on D_n ----------
def n_A(h, k):
    """Point of side A (y ≥ 0): (h, k′) ↦ n = (1 − h, 1 − h − k′, 1)."""
    return (1 - h, 1 - h - k, 1)


def n_B(h, k):
    """Side B: σ(n) = (x, −y, 1), the point −n moved back into D_n (D40 1.3)."""
    return (1 - h, -(1 - h - k), 1)


# ---------- centres ----------
PERMS = list(itertools.permutations(range(3)))


def perm_mat(p):
    return [[1 if p[i] == j else 0 for j in range(3)] for i in range(3)]


def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def mat_to_q_int(M):
    """Rotation given by a signed permutation (det = 1) → integer quaternion (arbitrary scale). Found in floating point, rounded to integers, checked with the matrix."""
    Mf = np.array(M, float)
    from scipy.spatial.transform import Rotation as Rot
    x, y, z, w = Rot.from_matrix(Mf).as_quat()
    v = np.array([w, x, y, z])
    v = v / np.abs(v[np.abs(v) > 1e-9]).min()
    q = tuple(int(round(t)) for t in v)
    Q = sum(t * t for t in q)
    assert [[Fr(e, Q) for e in row] for row in Mq(*q)] == [[Fr(e) for e in row] for row in M], (M, q)
    return q


def centers_nB(qh):
    """The 6 images under the stabilizer S₃ of n_B (coordinate permutations): g·R̂·k (if det g = −1, (−g)·R̂·(−P), P the reflection x↔y of the piece).
    Returns [(name, permutation of g, quaternion (rational, not normalized))]. Index 0 is T_S (g = identity), index 1 is T_S′ (g = x↔y)."""
    out = []
    P = [[0, 1, 0], [1, 0, 0], [0, 0, 1]]
    order = [(0, 1, 2), (1, 0, 2), (0, 2, 1), (2, 1, 0), (1, 2, 0), (2, 0, 1)]
    names = ["T_S", "T_S'", "P_23", "P_13", "P_cyc1", "P_cyc2"]
    for nm, p in zip(names, order):
        g = perm_mat(p)
        if det3(g) == 1:
            qg = mat_to_q_int(g)
            q = qmul(qg, qh)
        else:
            mg = [[-e for e in row] for row in g]
            mk = [[-e for e in row] for row in P]
            q = qmul(qmul(mat_to_q_int(mg), qh), mat_to_q_int(mk))
        out.append((nm, p, tuple(Fr(t) for t in q)))
    return out


Q_I = (Fr(1), Fr(0), Fr(0), Fr(0))


# ---------- G̃ and Š (floating point) ----------
def parts_f(n, R):
    """(max_v n·Rṽ, the 4 values H̃_f)."""
    X = VTF @ R.T
    return (X @ n).max(), (X @ BF.T).max(0)


def Gt_f(n, R, s, mu=0.0, kappa=0.0):
    n = np.asarray(n, float)
    top, H = parts_f(n, R)
    w = n @ (B2 - BF).T + mu
    return top + 0.25 * (w * H).sum() - 0.5 * s * (n @ B2) - 0.5 * mu * s - kappa


def Sch_f(R, s):
    _, H = parts_f(np.zeros(3), R)
    return H.sum() - 2 * s


def s1_f(R):
    _, H = parts_f(np.zeros(3), R)
    return H.sum() / 2


# ---------- first-order part (floating point, for the LP of step 0b) ----------
def _cross(p, v):
    return np.array([p[1]*v[2] - p[2]*v[1], p[2]*v[0] - p[0]*v[2], p[0]*v[1] - p[1]*v[0]])


def first_order(side, h, k, Rc, s, mu, kap_dh, kap_dk, use_h, tol=1e-9, top_ref=None):
    """Shape of the directional derivative of G̃_μ at (n, R) = (n_side(h, k), Rc). Variables ζ = ([dh,] dk′, p1, p2, p3), R = Rc·R(1, p) (≈ Rc(I + 2[p]×)).
    Returns (lin, terms, base). D(ζ) = lin·ζ + Σ_t wt_t·max_{j} (L_{t,j}·ζ). base = value of G̃_μ (without κ).
    κ̃ = (constant) + kap_dh·h + kap_dk·k′ (in the coordinates of side A). On side B one looks at G̃_B + κ̃, so the caller passes the signs reversed."""
    nf = np.array(n_A(h, k) if side == "A" else n_B(h, k), float)
    sg = 1.0 if side == "A" else -1.0
    dn_dh = np.array([-1.0, -sg, 0.0]); dn_dk = np.array([0.0, -sg, 0.0])
    d = 5 if use_h else 4
    off = 1 if use_h else 0
    X = VTF @ Rc.T                                    # rotated vertices
    # derivative when vertex v moves with R = Rc R(1,p): Rc·2(p × v) → coefficient vector (in p): w·Rc·2(p×v) = 2 p·(v × Rcᵀw)
    def dRv(w, vi):
        return 2 * np.cross(VTF[vi], Rc.T @ w)
    terms = []
    lin = np.zeros(d)
    # top
    vals = X @ nf
    mx = vals.max(); tied = [i for i in range(4) if vals[i] >= mx - tol]
    if top_ref is not None:
        # candidate vertices are those whose value is ≥ that of the reference vertex (the one that fixed κ): keeps e_c ≥ 0 (beyond the lower end both vertices 0 and 2 are used)
        tied = [i for i in range(4) if vals[i] >= vals[top_ref] - tol]
    rows = []
    for vi in tied:
        L = np.zeros(d)
        if use_h:
            L[0] = dn_dh @ X[vi]
        L[off] = dn_dk @ X[vi]
        L[off + 1:] = dRv(nf, vi)
        rows.append(L)
    terms.append((1.0, rows, ("top", tied)))
    H = (X @ BF.T).max(0)
    base = mx
    for f in range(4):
        wf = nf @ (B2 - BF[f]) + mu
        # derivative of the weight × H_f
        if use_h:
            lin[0] += 0.25 * (dn_dh @ (B2 - BF[f])) * H[f]
        lin[off] += 0.25 * (dn_dk @ (B2 - BF[f])) * H[f]
        base += 0.25 * wf * H[f]
        if wf > tol:
            v = X @ BF[f]; m = v.max(); td = [i for i in range(4) if v[i] >= m - tol]
            rows = []
            for vi in td:
                L = np.zeros(d); L[off + 1:] = dRv(BF[f], vi); rows.append(L)
            terms.append((0.25 * wf, rows, ("H", f, td)))
    if use_h:
        lin[0] += -0.5 * s * (dn_dh @ B2) - kap_dh
    lin[off] += -0.5 * s * (dn_dk @ B2) - kap_dk
    base += -0.5 * s * (nf @ B2) - 0.5 * mu * s
    return lin, terms, base


def first_order_S(h, k, Rc, use_h, tol=1e-9):
    """Shape of the directional derivative of Š (independent of n)."""
    d = 5 if use_h else 4
    off = 1 if use_h else 0
    X = VTF @ Rc.T
    terms = []
    for f in range(4):
        v = X @ BF[f]; m = v.max(); td = [i for i in range(4) if v[i] >= m - tol]
        rows = []
        for vi in td:
            L = np.zeros(d); L[off + 1:] = 2 * np.cross(VTF[vi], Rc.T @ BF[f]); rows.append(L)
        terms.append((1.0, rows, ("H", f, td)))
    return np.zeros(d), terms


def sharp_lp(forms, d, face, lo):
    """min_{ζ̂ ∈ face} max_T D_T(ζ̂). forms = [(lin, terms)] (one per type). face = (coordinate, ±1). lo[i] = lower bound of ζ̂_i (0 or −1).
    Returns (value, ζ̂)."""
    from scipy.optimize import linprog
    # variables: ζ̂ (d), t, u (type × term)
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


# =====================================================================================
# Step 1 onwards: exact parts (rational numbers).
# =====================================================================================
def piece_rots():
    """Rotation group of the tetrahedral piece (12 signed permutations with det = 1 that keep the vertex set). Integer matrices."""
    out = []
    S = set(VT)
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]
            if det3(M) == 1 and all(tuple(sum(M[i][j] * v[j] for j in range(3)) for i in range(3)) in S for v in VT):
                out.append(M)
    assert len(out) == 12
    return out


PROT = piece_rots()
PROT_NONID = [k for k in PROT if k != [[1, 0, 0], [0, 1, 0], [0, 0, 1]]]


def trace_rep(q):
    """Representative of the orbit of q under the piece rotations with the largest tr(R k) (the point kept by the discard rule of the far part). Returns (q ⊗ q_k, k)."""
    best = None
    for k in PROT:
        R = rot_fr(q)
        tr = sum(sum(R[i][j] * k[j][i] for j in range(3)) for i in range(3))
        if best is None or tr > best[0]:
            best = (tr, k)
    k = best[1]
    if k == [[1, 0, 0], [0, 1, 0], [0, 0, 1]]:
        return q, k
    qk = mat_to_q_int(k)
    q2 = tuple(Fr(t) for t in qmul(q, qk))
    R1 = rot_fr(q); R2 = rot_fr(q2)
    assert all(R2[i][j] == sum(R1[i][l] * k[l][j] for l in range(3)) for i in range(3) for j in range(3))
    return q2, k


_CACHE = {}


def centers():
    """The 7 local centres: [(name, side, quaternion (rational), kind)]. kind is "tube" (h is the base parameter) or "point" (the point n_B).
    The quaternions are replaced by the representative kept by the discard rule of the far part (largest trace)."""
    if "cen" in _CACHE:
        return _CACHE["cen"]
    qh = qhat()
    out = []
    for nm, p, q in centers_nB(qh):
        q2, _ = trace_rep(q)
        out.append((nm, "A", q2, "tube" if nm in ("T_S", "T_S'") else "point"))
    out.append(("T_C", "B", Q_I, "tube"))
    _CACHE["cen"] = out
    return out


def gtilde_cand_exact(n, R, s, mu, cand):
    """G̃_c of the candidate cand = (top, v0, v1, v2, v3) (without κ, exact). Vertices of faces with weight 0 (b₂ when μ = 0) are not used."""
    X = [[sum(R[i][j] * Fr(VT[v][j], 2) for j in range(3)) for i in range(3)] for v in range(4)]
    dot = lambda a, b: sum(x * y for x, y in zip(a, b))
    val = dot(n, X[cand[0]])
    for f in range(4):
        w = dot(n, [BS[2][i] - BS[f][i] for i in range(3)]) + mu
        if w != 0:
            val += w * dot(BS[f], X[cand[1 + f]]) / 4
    return val - s / 2 * dot(n, BS[2]) - mu * s / 2


def kappa_coefs():
    """κ̃₁(h, k′) = a0 + a1·h + β·k′ (exact rationals). On the arc (L̂₁ − L̂₂)/2, where L̂₁ is the T_S candidate (0; 1, 2, ·, 0) and L̂₂ the corner piece (I) candidate (0; 1, 0, ·, 0)."""
    if "kap" in _CACHE:
        return _CACHE["kap"]
    cen = centers()
    qS = cen[0][2]
    RS = rot_fr(qS)
    I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    s = S_BAR
    # main candidate of T_S: ties of the stopped piece (step 0a): top 0, b0 {1,3}, b1 {2}, b2 {2,3}, b3 {0}. The vertex numbers of the representative may change with trace_rep, so they are chosen in floating point.
    def best_cand(R, n):
        Rf = np.array([[float(x) for x in r] for r in R])
        X = VTF @ Rf.T
        nf = np.array([float(x) for x in n])
        c = [int(np.argmax(X @ nf))] + [int(np.argmax(X @ BF[f])) for f in range(4)]
        return tuple(c)
    vals = {}
    for side, R in (("A", RS), ("B", I3)):
        for hh in (Fr(0), Fr(1, 10)):
            n = n_A(hh, 0) if side == "A" else n_B(hh, 0)
            n = [Fr(x) for x in n]
            c = best_cand(R, n)
            vals[(side, hh)] = gtilde_cand_exact(n, R, s, 0, c)
    d0 = (vals[("A", Fr(0))] - vals[("B", Fr(0))]) / 2
    d1 = (vals[("A", Fr(1, 10))] - vals[("B", Fr(1, 10))]) / 2
    a0 = d0; a1 = (d1 - d0) * 10
    _CACHE["kap"] = (a0, a1, BETA)
    return a0, a1, BETA
