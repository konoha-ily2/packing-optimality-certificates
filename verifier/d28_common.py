# D28: tools that close n=2 globally for a tetrahedral container. Shared parts (icointet_n02, cubintet_n02).
# 2026-11-12, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# Square-root-free form (see docs/reduction_tetrahedron.md). Container {b_f·x ≤ c}, b_f ∈ {(−1,−1,−1), (−1,1,1), (1,−1,1), (1,1,−1)} (the
# unit-edge tetrahedron is {b_f·x ≤ √2/4}, so the container with edge s has c = s/(2√2), s = 2√2·c). The piece is a unit-edge Platonic solid K (vertices V).
#   H_f(R) = max_v b_f·Rv, m(n) = max_j n·b_j,
#   F(n, R; c) = max_v n·Rv + ¼Σ_f (m(n) − n·b_f)·H_f(R) − c·m(n)
# is "the minimum over placements of the top of one piece with orientation R in container c, in direction n" (T2, with the translation eliminated by formula).
# Theorem T3: two pieces fit ⇔ ψ(n) + ψ(−n) ≤ 0 for some n, ψ(n) = min_R F(n, R) (proved in the stronger form without the side condition s₁(R) ≤ s).
# Coordinates of n: n = (x, y, 1), domain D_n = {|y| ≤ x ≤ 1} (1/24 under T_d). There m(n) = 1 + x − y, m(−n) = 1 + x + y,
# and −n is mapped by the element g0 = diag(−1, 1, −1) of T_d to σn := (x, −y, 1) (ψ(−n) = ψ(σn)).
#
# The problem is selected by the environment variable D28_PROB (icointet or cubintet, default icointet), one per process. The field is Q(√p, …) (Q(√5) for icointet,
# Q(√2, √3) for cubintet); acceptance encloses square roots between rationals of width 2^-120.
from fractions import Fraction as Fr
import itertools, math, json, os
import numpy as np
import flint
import d16d_common as C16
from d16d_common import need, CheckFailed

PROB = os.environ.get("D28_PROB", "icointet")
PRIMES = {"icointet": (5,), "cubintet": (2, 3)}[PROB]
NB = 1 << len(PRIMES)                        # number of basis elements √(Π_{i∈mask} p_i)
MASKP = [math.prod(PRIMES[i] for i in range(len(PRIMES)) if m >> i & 1) for m in range(NB)]


# ---------- the field Q(√p1, √p2, …) ----------
def _tmul(x, y):
    out = [Fr(0)] * NB
    for i, a in enumerate(x):
        if a:
            for j, b in enumerate(y):
                if b:
                    out[i ^ j] += a * b * MASKP[i & j]
    return out


def _tsign(x, k):
    """Exact sign of x (2^k coefficients over the lowest k primes)."""
    if k == 0:
        return (x[0] > 0) - (x[0] < 0)
    h = 1 << (k - 1)
    a, b = x[:h], x[h:2*h]
    sa, sb = _tsign(a, k - 1), _tsign(b, k - 1)
    if sb == 0: return sa
    if sa == 0: return sb
    if sa == sb: return sa
    p = PRIMES[k - 1]
    # a + b√p with opposite signs: decided by the sign of a² − p b²
    a2 = _tmul(a + [Fr(0)] * (NB - h), a + [Fr(0)] * (NB - h))[:h]
    b2 = _tmul(b + [Fr(0)] * (NB - h), b + [Fr(0)] * (NB - h))[:h]
    d = _tsign([u - p * v for u, v in zip(a2, b2)], k - 1)
    return sa if d > 0 else (sb if d < 0 else 0)


class FE:
    __slots__ = ("c",)

    def __init__(self, *coefs):
        if len(coefs) == 1 and isinstance(coefs[0], FE):
            self.c = list(coefs[0].c); return
        c = [Fr(v) for v in coefs] + [Fr(0)] * (NB - len(coefs))
        need(len(c) == NB, "number of coefficients")
        self.c = c

    @staticmethod
    def c_(x):
        return x if isinstance(x, FE) else FE(x)

    @staticmethod
    def sqrt_of(mask, coef=1):
        v = [Fr(0)] * NB; v[mask] = Fr(coef); return FE(*v)

    def __add__(s, o): o = FE.c_(o); return FE(*[a + b for a, b in zip(s.c, o.c)])
    __radd__ = __add__
    def __sub__(s, o): o = FE.c_(o); return FE(*[a - b for a, b in zip(s.c, o.c)])
    def __rsub__(s, o): return FE.c_(o) - s
    def __neg__(s): return FE(*[-a for a in s.c])
    def __mul__(s, o): o = FE.c_(o); return FE(*_tmul(s.c, o.c))
    __rmul__ = __mul__

    def inv(s):
        num = FE(1); den = FE(s)
        for i in range(len(PRIMES)):
            cj = FE(*[(-a if (m >> i & 1) else a) for m, a in enumerate(den.c)])
            num = num * cj; den = den * cj
        need(all(v == 0 for v in den.c[1:]) and den.c[0] != 0, "division by 0")
        return num * Fr(1) * FE(1 / den.c[0])

    def __truediv__(s, o): return s * FE.c_(o).inv()
    def __rtruediv__(s, o): return FE.c_(o) * s.inv()
    def sign(s): return _tsign(s.c, len(PRIMES))
    def __eq__(s, o): o = FE.c_(o); return s.c == o.c
    def __hash__(s): return hash(tuple(s.c))
    def __lt__(s, o): return (s - o).sign() < 0
    def __le__(s, o): return (s - o).sign() <= 0
    def __gt__(s, o): return (s - o).sign() > 0
    def __ge__(s, o): return (s - o).sign() >= 0
    def __float__(s): return sum(float(a) * math.sqrt(MASKP[m]) for m, a in enumerate(s.c))
    def is_rational(s): return all(v == 0 for v in s.c[1:])

    def __repr__(s):
        if len(PRIMES) == 1:                  # same notation as QD in d16d (to compare records)
            a, b = s.c
            return f"({a}{'+' if b >= 0 else '-'}{abs(b)}√{PRIMES[0]})"
        parts = [f"{a}" + ("" if m == 0 else f"√{MASKP[m]}") for m, a in enumerate(s.c) if a != 0 or m == 0]
        return "(" + " + ".join(parts) + ")"


QD = FE                                      # old name (for the icointet version of the code and tests)


def S(p):
    """√p (p an integer of the form of a product of PRIMES)."""
    for m in range(NB):
        if MASKP[m] == p:
            return FE.sqrt_of(m)
    raise ValueError(p)


# ---------- matrices and vectors ----------
def dot(u, v):
    return sum((x * y for x, y in zip(u, v)), FE(0))


def mmul(A, B_):
    return [[sum((A[i][k] * B_[k][j] for k in range(3)), FE(0)) for j in range(3)] for i in range(3)]


def mvec(A, v):
    return tuple(sum((A[i][k] * v[k] for k in range(3)), FE(0)) for i in range(3))


def transpose(A):
    return [[A[j][i] for j in range(3)] for i in range(3)]


def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def inv3(M):
    d = det3(M); need(d != 0, "singular matrix")
    return [[(M[(j+1) % 3][(i+1) % 3]*M[(j+2) % 3][(i+2) % 3] - M[(j+1) % 3][(i+2) % 3]*M[(j+2) % 3][(i+1) % 3]) / d
             for j in range(3)] for i in range(3)]


def trace(M):
    return M[0][0] + M[1][1] + M[2][2]


def is_orth(M):
    return all(sum((M[k][i] * M[k][j] for k in range(3)), FE(0)) == (1 if i == j else 0) for i in range(3) for j in range(3))


def eye():
    return [[FE(1 if i == j else 0) for j in range(3)] for i in range(3)]


def fmat(M):
    return np.array([[float(x) for x in row] for row in M])


def rot_q(q):
    w, x, y, z = q
    return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
            [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
            [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]


def rot_exact(q):
    q = [FE.c_(v) for v in q]
    n = sum((v * v for v in q), FE(0))
    return [[e / n for e in row] for row in rot_q(q)]


rot_f = C16.rot_f
q_of = C16.q_of


def sym_group_exact(pts):
    """Orthogonal matrices (reflections included) preserving a point set, exactly. Candidates are narrowed in floating point and checked in the field."""
    P = np.array([[float(x) for x in p] for p in pts])
    idx = None
    for tri in itertools.combinations(range(len(pts)), 3):
        if abs(np.linalg.det(P[list(tri)])) > 1e-6:
            idx = list(tri); break
    Bm = [[pts[idx[j]][i] for j in range(3)] for i in range(3)]
    Bi = inv3(Bm)
    G0_ = P[idx] @ P[idx].T
    Sset = set(pts)
    out = []
    for tri in itertools.permutations(range(len(pts)), 3):
        W = P[list(tri)]
        if np.abs(W @ W.T - G0_).max() > 1e-9:
            continue
        Mf = W.T @ np.linalg.inv(P[idx].T)
        if np.abs(Mf @ Mf.T - np.eye(3)).max() > 1e-9:
            continue
        if not all(np.abs(P - z).sum(axis=1).min() < 1e-8 for z in P @ Mf.T):
            continue
        Wm = [[pts[tri[j]][i] for j in range(3)] for i in range(3)]
        M = mmul(Wm, Bi)
        need(is_orth(M) and all(mvec(M, p) in Sset for p in pts), "symmetry matrix (exact)")
        out.append(M)
    return out


def _cyc(v):
    return [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]


def d2(p, q):
    d = tuple(a - b for a, b in zip(p, q)); return dot(d, d)


# ---------- container ----------
B = [tuple(FE(v) for v in b) for b in ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))]
BTOP = 2                                  # on D_n, m(n) = b_2·n = 1 + x − y
BBOT = 0                                  # m(−n) = b_0·(−n) = 1 + x + y
G0 = [[FE(-1), FE(0), FE(0)], [FE(0), FE(1), FE(0)], [FE(0), FE(0), FE(-1)]]   # −n ↦ σn (a 2-fold axis of T_d)


# ---------- problem ----------
def _region(ch, center, ranges, rho):
    """Local box of R: chart ch, centre coordinates center (rationals), range of each coordinate center_i + rho·[lo_i, hi_i]."""
    return dict(ch=ch, center=[v if isinstance(v, FE) else Fr(v) for v in center], ranges=[(Fr(a), Fr(b)) for a, b in ranges], rho=Fr(rho))


if PROB == "icointet":
    PHI = FE(Fr(1, 2), Fr(1, 2))
    PIECE0 = [w for a in (1, -1) for b in (1, -1) for w in _cyc((FE(0), FE(Fr(a, 2)), b * PHI / 2))]
    PIECE_NAME, PIECE_DEG = "icosahedron", 5
    # piece 2 of the record (−90° about the x axis), moved from record coordinates to D_n coordinates by GREC = [[0,−1,0],[1,0,0],[0,0,−1]] (a reflection in T_d), times −I of the piece
    RSTAR = [[FE(0), FE(0), FE(-1)], [FE(-1), FE(0), FE(0)], [FE(0), FE(1), FE(0)]]
    GREC = [[FE(0), FE(-1), FE(0)], [FE(1), FE(0), FE(0)], [FE(0), FE(0), FE(-1)]]
    C0 = 1 + FE(0, Fr(2, 5))                  # c* = 1 + 2√5/5, s* = 2√2·c* = 2√2(1 + 2/√5)
    NSTAR = (FE(Fr(3, 2), Fr(-1, 2)), FE(0), FE(1))      # x* = 1/φ² = (3 − √5)/2
    BETA = FE(Fr(1, 4), Fr(3, 20))           # β of κ = β·y (optimum of the stage-0 LP, 0.58541… = 1/4 + 3√5/20)
    LN_X = (Fr(5, 16), Fr(7, 16))            # n box handed from the far to the local stage (contains x* = 0.38197)
    LN_Y = Fr(1, 16)
    XI_RANGE = (Fr(-9, 128), Fr(9, 128))     # range of x − x* in the local lemma (contains the far L)
    RHO_P = Fr(1, 16)
    LREGIONS = [_region(0, (0, 0, 0), [(-1, 1)] * 3, RHO_P)]
    REC_KEY = "icointet_n02"
    RMIN = [[[FE(1 if i == j else 0) for j in range(3)] for i in range(3)]]
    SSTAR2 = FE(Fr(72, 5), Fr(32, 5))       # s*² = 72/5 + 32√5/5 (closed form)
elif PROB == "cubintet":
    PIECE0 = [tuple(FE(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
    PIECE_NAME, PIECE_DEG = "cube", 3
    r2, r3, r6 = S(2), S(3), S(6)
    # piece 1 of the record moved to D_n coordinates by GREC = [[0,−1,0],[−1,0,0],[0,0,1]] (a reflection in T_d), times −I of the piece (entries √6/6, √2/2, √3/3, etc.)
    RSTAR = [[r6 / 6, r2 / 2, -r3 / 3], [-r6 / 3, FE(0), -r3 / 3], [-r6 / 6, r2 / 2, r3 / 3]]
    GREC = [[FE(0), FE(-1), FE(0)], [FE(-1), FE(0), FE(0)], [FE(0), FE(0), FE(1)]]
    C0 = r2 / 2 + r3 / 4 + r6 / 6             # c* = s*/(2√2), s* = 2 + √6/2 + 2√3/3
    NSTAR = (FE(1), FE(0), FE(1))            # n* = (1, 0, 1): on the edge x = 1 of D_n (boundary of the cube face)
    BETA = FE(Fr(0))                         # determined by the stage-0 LP (overwritten below)
    LN_X = (Fr(15, 16), Fr(1))
    LN_Y = Fr(1, 16)
    XI_RANGE = (Fr(-1, 16), Fr(0))           # one-sided because x ≤ 1 on D_n
    RHO_P = Fr(1, 16)
    # at n*, because of the reflection h in T_d fixing n* (x ↔ z), the minimising rotations form 2 orbits under the piece symmetries: those of I and of −h.
    # the representative of the −h orbit kept by the far discard rule (keep only the image of maximal tr) is R2 = −h·k (tr = 1 + 4√2/3), at chart-0
    # coordinates (u_t, 0, u_t), u_t = (3√2 − 4)/2 = 0.1213 (about 14° from I). There are 2 local boxes, around I and around R2
    UT = FE(-2, Fr(3, 2))
    LREGIONS = [_region(0, (0, 0, 0), [(-1, 1)] * 3, RHO_P),
                _region(0, (UT, 0, UT), [(-1, 1)] * 3, RHO_P)]
    REC_KEY = "cubintet_n02"
    RMIN = [[[FE(1 if i == j else 0) for j in range(3)] for i in range(3)],
            [[Fr(1, 2) + r2 / 3, -r2 / 6, Fr(1, 2) - r2 / 3], [r2 / 6, 2 * r2 / 3, -r2 / 6], [Fr(1, 2) - r2 / 3, r2 / 6, Fr(1, 2) + r2 / 3]]]
    MINUS_H = [[FE(0), FE(0), FE(-1)], [FE(0), FE(-1), FE(0)], [FE(-1), FE(0), FE(0)]]
    SSTAR2 = None
else:
    raise ValueError(PROB)

_beta_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), f"d28_{PROB}_beta.json")
if PROB == "cubintet" and os.path.exists(_beta_file):
    _b = json.load(open(_beta_file, encoding="utf-8"))
    BETA = FE(Fr(_b["beta"]))

need(is_orth(RSTAR) and det3(RSTAR) == 1, "R* is a rotation")
VERTS = [mvec(RSTAR, v) for v in PIECE0]  # piece rotated by R* (the optimum is R = I)
NV = len(VERTS)


def check_piece(V):
    need(len(set(V)) == len(PIECE0), f"{len(PIECE0)} vertices")
    need(min(d2(p, q) for i, p in enumerate(V) for q in V[:i]) == 1, "unit edges")
    need(all(sum(1 for w in V if d2(v, w) == 1) == PIECE_DEG for v in V), f"{PIECE_DEG} edges at each vertex")


check_piece(VERTS)
A_STAR = NSTAR[0]
need(XI_RANGE[0] <= 0 <= XI_RANGE[1], "the local range contains x*")
need(A_STAR + XI_RANGE[0] <= LN_X[0] and LN_X[1] <= A_STAR + XI_RANGE[1], "the range of the local lemma contains the far L (x)")
need(A_STAR + XI_RANGE[0] >= LN_Y and A_STAR + XI_RANGE[1] <= 1, "the local n box lies in D_n (so the linear form of m and w_f ≥ 0 can be used)")
RHO_XI = max(-XI_RANGE[0], XI_RANGE[1])


def s_of_c(c):
    return 2 * math.sqrt(2) * float(c)


# ---------- exact F ----------
def m_exact(n):
    return max(dot(n, b) for b in B)


def F_exact(n, R, c=None):
    c = C0 if c is None else c
    RV = [mvec(R, v) for v in VERTS]
    m = m_exact(n)
    top = max(dot(n, x) for x in RV)
    H = [max(dot(b, x) for x in RV) for b in B]
    return top + sum(((m - dot(n, b)) * H[f] for f, b in enumerate(B)), FE(0)) / 4 - c * m


def translation_exact(n, R, c=None):
    """Translation attaining the minimum of F (vertex of T, c_T − (D/4) b_j*, j* = argmax n·b_j)."""
    c = C0 if c is None else c
    RV = [mvec(R, v) for v in VERTS]
    H = [max(dot(b, x) for x in RV) for b in B]
    Dd = 4 * c - sum(H, FE(0))
    cT = tuple(-sum((H[f] * B[f][i] for f in range(4)), FE(0)) / 4 for i in range(3))
    j = max(range(4), key=lambda k: float(dot(n, B[k])))
    need(all(dot(n, B[j]) >= dot(n, b) for b in B), "argmax")
    return tuple(cT[i] - Dd / 4 * B[j][i] for i in range(3)), Dd


def rot_group():
    """Rotation group (det 1) of the piece (VERTS), exactly."""
    return [g for g in sym_group_exact(VERTS) if det3(g) == 1]


def td_group():
    """Container symmetries T_d (24): coordinate permutations and an even number of sign changes."""
    out = []
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            if sg[0] * sg[1] * sg[2] != 1:
                continue
            out.append([[FE(sg[i] if p[i] == j else 0) for j in range(3)] for i in range(3)])
    need(all(set(mvec(M, b) for b in B) == set(B) for M in out), "T_d preserves b")
    return out


# ---------- floating point (candidates and previews only; never used for acceptance) ----------
VF = np.array([[float(x) for x in v] for v in VERTS])
BF = np.array([[float(x) for x in b] for b in B])
C0F = float(C0)
ASF = float(A_STAR)
NSF = np.array([float(v) for v in NSTAR])


def F_f(n, R, c=C0F):
    RV = VF @ R.T
    bn = BF @ n
    m = bn.max()
    H = (BF @ RV.T).max(1)
    return (RV @ n).max() + 0.25 * ((m - bn) * H).sum() - c * m


def F_batch(n, Rs, c=C0F):
    RV = np.einsum("kij,vj->kvi", Rs, VF)
    bn = BF @ n
    m = bn.max()
    H = np.einsum("fi,kvi->kfv", BF, RV).max(2)
    return (RV @ n).max(1) + 0.25 * (H * (m - bn)).sum(1) - c * m


def qrot(q):
    q = np.asarray(q, float)
    w, x, y, z = q / np.linalg.norm(q)
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]])


def qrot_batch(Q):
    Q = Q / np.linalg.norm(Q, axis=1, keepdims=True)
    w, x, y, z = Q.T
    return np.stack([np.stack([w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)], -1),
                     np.stack([2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)], -1),
                     np.stack([2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z], -1)], 1)


def expm_rot(w):
    th = np.linalg.norm(w)
    if th < 1e-15:
        return np.eye(3)
    k = w / th
    K = np.array([[0, -k[2], k[1]], [k[2], 0, -k[0]], [-k[1], k[0], 0]])
    return np.eye(3) + math.sin(th) * K + (1 - math.cos(th)) * K @ K


_QS = None


def psi_f(n, c=C0F, nsamp=6000, nstart=20, seed=0):
    """ψ(n) = min_R F(n, R) (floating point, random samples + nstart Nelder–Mead runs). Returns (value, minimising R)."""
    global _QS
    from scipy.optimize import minimize
    if _QS is None or len(_QS) != nsamp + 1:
        rng = np.random.default_rng(seed)
        _QS = np.concatenate([qrot_batch(rng.normal(size=(nsamp, 4))), np.eye(3)[None]])
    n = np.asarray(n, float)
    vals = F_batch(n, _QS, c)
    idx = np.argsort(vals)[:nstart]
    best = (np.inf, None)
    for i in idx:
        R0 = _QS[i]
        f = lambda w: F_f(n, expm_rot(w) @ R0, c)
        r = minimize(f, np.zeros(3), method="Nelder-Mead",
                     options=dict(xatol=1e-10, fatol=1e-13, maxiter=4000, initial_simplex=np.vstack([np.zeros(3), 0.05 * np.eye(3)])))
        if r.fun < best[0]:
            best = (float(r.fun), expm_rot(r.x) @ R0)
    return best


# ---------- alternative formulation: an 8-variable LP (for cross-checking the checker) ----------
def lp8(n, R1, R2, Vf=None):
    """LP in (t1, t2, h, c): R_i K + t_i ⊂ {b·x ≤ c}, n·(R1 v + t1) ≤ h, n·(R2 v + t2) ≥ h. Returns the minimal c."""
    from scipy.optimize import linprog
    Vf = VF if Vf is None else Vf
    rows = []; rhs = []
    for i, R in enumerate((R1, R2)):
        RV = Vf @ R.T
        for b in BF:
            for x in RV:
                r = np.zeros(8); r[3*i:3*i+3] = b; r[7] = -1; rows.append(r); rhs.append(-b @ x)
        for x in RV:
            r = np.zeros(8)
            if i == 0:
                r[0:3] = n; r[6] = -1; rhs.append(-n @ x)
            else:
                r[3:6] = -n; r[6] = 1; rhs.append(n @ x)
            rows.append(r)
    res = linprog(np.eye(8)[7], A_ub=np.array(rows), b_ub=np.array(rhs), bounds=[(None, None)] * 8, method="highs")
    need(res.status == 0, "LP8")
    return res.fun


def c_formula(n, R1, R2, Vf=None):
    """Formula in units of c: [Φ(n,R1) + Φ(−n,R2)]/(m(n) + m(−n)), Φ = F + c·m."""
    Vf = VF if Vf is None else Vf
    def Phi(n, R):
        RV = Vf @ R.T; bn = BF @ n; m = bn.max(); H = (BF @ RV.T).max(1)
        return (RV @ n).max() + 0.25 * ((m - bn) * H).sum()
    n = np.asarray(n, float)
    return (Phi(n, R1) + Phi(-n, R2)) / ((BF @ n).max() + (BF @ -n).max())


# ---------- polynomials (exact lower bounds) ----------
CTX4 = C16.CTX4                         # (u1, u2, u3, d): quaternion charts
CTX5 = flint.fmpz_mpoly_ctx.get(('sx', 'sy', 's1', 's2', 's3'), 'lex')
KDEN = C16.KDEN                         # denominator 2^44 of R box coordinates
DEN = C16.DEN
NDEN_EXP = 30
NDEN = 2 ** NDEN_EXP                    # denominator of n box coordinates (x, y)
ZERO5 = CTX5.from_dict({})
SQ_K = 120
SQB = []                                # integer enclosure [lo, hi] of √(MASKP[m]) × 2^SQ_K
for _m in range(NB):
    if _m == 0:
        SQB.append((1 << SQ_K, 1 << SQ_K))
    else:
        _r = int(flint.fmpz(MASKP[_m] * 4**SQ_K).isqrt())
        need(_r * _r < MASKP[_m] * 4**SQ_K < (_r + 1)**2, "enclosure of the square root")
        SQB.append((_r, _r + 1))


def lower_bound(parts):
    """Lower bound × 2^SQ_K (integer) of Σ_m (Σ_α c_{m,α} s^α)·√MASKP[m] on s ∈ [−1,1]^k. Monomials with only even powers use [0,1]."""
    ts = [dict((mon, int(c)) for mon, c in P.terms()) for P in parts]
    mons = set()
    for t in ts:
        mons |= set(t)
    lb = 0
    for mon in mons:
        lo = hi = 0
        for m, t in enumerate(ts):
            c = t.get(mon, 0)
            if c:
                a, b = SQB[m]
                if c > 0:
                    lo += c * a; hi += c * b
                else:
                    lo += c * b; hi += c * a
        if all(e == 0 for e in mon):
            lb += lo
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, lo)
        else:
            lb -= max(abs(lo), abs(hi))
    return lb


def lower_bound5(QA, QB):
    """Old name (two parts of Q(√5))."""
    return lower_bound([QA, QB])


class RChart:
    """Rq of chart k (entries homogeneous of degree 2 in (u, d), R = Rq/N)."""
    def __init__(self, k):
        self.k = k
        q = C16.chart_q(k)
        self.Rq = rot_q(q)
        self.N = q[0]*q[0] + q[1]*q[1] + q[2]*q[2] + q[3]*q[3]
        for i in range(3):
            for j in range(3):
                v = sum((self.Rq[l][i] * self.Rq[l][j] for l in range(3)), C16.ZERO4)
                need(v == (self.N*self.N if i == j else C16.ZERO4), "orthogonality of R(q)")


CHARTS = [RChart(k) for k in range(4)]


def rbox_polys(ch, lo, hi):
    """On the R box (chart ch, lo and hi in units of 1/DEN), Rq_ij and N as polynomials in s1..s3 ∈ [−1,1] (CTX5, ×DEN²)."""
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "R box widths must be positive and even")
    sx, sy, s1, s2, s3 = CTX5.gens()
    dd = CTX5.from_dict({(0, 0, 0, 0, 0): DEN})
    args = (Cc[0] + W[0]*s1, Cc[1] + W[1]*s2, Cc[2] + W[2]*s3, dd)
    chd = CHARTS[ch]
    Rq = [[chd.Rq[i][j].compose(*args, ctx=CTX5) for j in range(3)] for i in range(3)]
    N = chd.N.compose(*args, ctx=CTX5)
    return Rq, N


def lin(c=0, x=0, y=0):
    """Linear form c + x·X + y·Y in (x, y) (coefficients in the field)."""
    return (FE.c_(c), FE.c_(x), FE.c_(y))


def ladd(a, b):
    return tuple(p + q for p, q in zip(a, b))


def lscale(a, s):
    return tuple(p * s for p in a)


N_LIN = (lin(x=1), lin(y=1), lin(c=1))          # n = (x, y, 1)


def form_coefs(v0, vf, kN, beta, c=None):
    """Coefficients of G·N = Σ_ij coef_ij·Rq_ij + coefN·N (linear forms in (x, y)).
    G = n·Rv0 + ¼Σ_f w_f(n)·b_f·Rv_f − c·m(n) − (kN + β·y), w_f(n) = (b_top − b_f)·n ≥ 0 (on D_n)."""
    c = C0 if c is None else c
    co = [[lin() for _ in range(3)] for _ in range(3)]
    v = VERTS[v0]
    for i in range(3):
        for j in range(3):
            co[i][j] = ladd(co[i][j], lscale(N_LIN[i], v[j]))
    for f in range(4):
        if f == BTOP:
            continue
        wf = lin()
        for i in range(3):
            wf = ladd(wf, lscale(N_LIN[i], B[BTOP][i] - B[f][i]))
        vv = VERTS[vf[f]]
        for i in range(3):
            for j in range(3):
                co[i][j] = ladd(co[i][j], lscale(wf, B[f][i] * vv[j] / 4))
    mm = lin()
    for i in range(3):
        mm = ladd(mm, lscale(N_LIN[i], B[BTOP][i]))
    coN = lscale(ladd(lscale(mm, c), lin(c=kN, y=beta)), -1)
    return co, coN


def nbox_affine(nlo, nhi):
    """x = (Xc + Xw·sx)/NDEN, y = (Yc + Yw·sy)/NDEN."""
    need(all((h - l) % 2 == 0 and h > l for l, h in zip(nlo, nhi)), "n box widths must be positive and even")
    return [(l + h) // 2 for l, h in zip(nlo, nhi)], [(h - l) // 2 for l, h in zip(nlo, nhi)]


def lin_poly(form, Nc, Nw, den):
    """The linear form, multiplied by den·NDEN, as integer polynomials (per basis element, linear in sx, sy)."""
    sx, sy, _, _, _ = CTX5.gens()
    out = []
    for m in range(NB):
        c0 = form[0].c[m] * den; cx = form[1].c[m] * den; cy = form[2].c[m] * den
        for t in (c0, cx, cy):
            need(t.denominator == 1, "integrality")
        c0, cx, cy = int(c0), int(cx), int(cy)
        out.append(CTX5.from_dict({(0, 0, 0, 0, 0): c0 * NDEN + cx * Nc[0] + cy * Nc[1]}) + (cx * Nw[0]) * sx + (cy * Nw[1]) * sy)
    return out


def common_den(forms):
    den = 1
    for f in forms:
        for q in f:
            for x in q.c:
                den = den * x.denominator // math.gcd(den, x.denominator)
    return den


class NBox:
    """n box (lo, hi in units of 1/NDEN) and κ = kN + β·y. Stores the integer linear forms for each choice of vertices."""
    def __init__(self, nlo, nhi, kN, beta, c=None):
        self.nlo, self.nhi = list(nlo), list(nhi)
        self.Nc, self.Nw = nbox_affine(nlo, nhi)
        self.kN, self.beta, self.c = FE.c_(kN), FE.c_(beta), (C0 if c is None else FE.c_(c))
        self.cache = {}

    def polys(self, v0, vf):
        key = (v0, tuple(vf[f] for f in range(4) if f != BTOP))
        if key not in self.cache:
            co, coN = form_coefs(v0, vf, self.kN, self.beta, self.c)
            den = common_den([co[i][j] for i in range(3) for j in range(3)] + [coN])
            terms = []
            for i in range(3):
                for j in range(3):
                    if all(q == 0 for q in co[i][j]):
                        continue
                    terms.append((i, j, lin_poly(co[i][j], self.Nc, self.Nw, den)))
            terms.append((None, None, lin_poly(coN, self.Nc, self.Nw, den)))
            self.cache[key] = (terms, den)
        return self.cache[key]


def box_lb(nb, rpolys, v0, vf, with_scale=False):
    """Lower bound (integer) of G on n box nb × R box. G·N·scale ≥ return value (scale = 2^SQ_K·den·NDEN·DEN² > 0)."""
    terms, den = nb.polys(v0, vf)
    Rq, N = rpolys
    G = [ZERO5] * NB
    for i, j, ps in terms:
        p = N if i is None else Rq[i][j]
        for m in range(NB):
            if not ps[m].is_zero():
                G[m] = G[m] + ps[m] * p
    lb = lower_bound(G)
    if with_scale:
        return lb, (1 << SQ_K) * den * NDEN * DEN * DEN
    return lb


def discard_lb(rpolys, k):
    """Lower bound (times N, integer) of tr(R k) − tr(R). If > 0, tr(Rk) > tr(R) on the whole box."""
    Rq, N = rpolys
    terms = [((k[j][i] - (1 if i == j else 0)), Rq[i][j]) for i in range(3) for j in range(3)]
    den = 1
    for cf, _ in terms:
        for x in cf.c:
            den = den * x.denominator // math.gcd(den, x.denominator)
    G = [ZERO5] * NB
    for cf, p in terms:
        for m in range(NB):
            a = cf.c[m] * den
            need(a.denominator == 1, "integrality")
            if a:
                G[m] = G[m] + int(a) * p
    return lower_bound(G)


# ---------- local boxes (the far and local stages use the same ones: review item F3) ----------
def n_inside_L(nlo, nhi):
    x0, x1 = Fr(nlo[0], NDEN), Fr(nhi[0], NDEN); y0, y1 = Fr(nlo[1], NDEN), Fr(nhi[1], NDEN)
    return LN_X[0] <= x0 and x1 <= LN_X[1] and -LN_Y <= y0 and y1 <= LN_Y


def n_overlaps_L(nlo, nhi):
    x0, x1 = Fr(nlo[0], NDEN), Fr(nhi[0], NDEN); y0, y1 = Fr(nlo[1], NDEN), Fr(nhi[1], NDEN)
    return x0 < LN_X[1] and LN_X[0] < x1 and y0 < LN_Y and -LN_Y < y1


def r_inside_L(ch, lo, hi):
    """Whether an R box (integers in units of 1/DEN) lies in one of the local boxes (compared exactly in the field even if the centre is irrational)."""
    for rg in LREGIONS:
        if rg["ch"] != ch:
            continue
        ok = True
        for i in range(3):
            a = FE.c_(rg["center"][i]) + rg["rho"] * rg["ranges"][i][0]
            b = FE.c_(rg["center"][i]) + rg["rho"] * rg["ranges"][i][1]
            if not (a <= Fr(lo[i], DEN) and Fr(hi[i], DEN) <= b):
                ok = False; break
        if ok:
            return True
    return False


# ---------- reading records (read only) ----------
REC_DIR = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "records")
SOLID_F = {}


def solid_f(name):
    if name in SOLID_F:
        return SOLID_F[name]
    ph = (1 + math.sqrt(5)) / 2
    if name == "tetrahedron":
        V = [np.array(g) * math.sqrt(2) / 4 for g in itertools.product((1, -1), repeat=3) if g[0]*g[1]*g[2] == 1]
    elif name == "octahedron":
        V = [np.eye(3)[i] * s * math.sqrt(2) / 2 for i in range(3) for s in (1, -1)]
    elif name == "cube":
        V = [np.array(g) / 2 for g in itertools.product((1, -1), repeat=3)]
    elif name == "icosahedron":
        V = [np.array(w) for a in (1, -1) for b in (1, -1) for w in _cyc((0, a/2, b*ph/2))]
    elif name == "dodecahedron":
        V = [np.array(g) * ph / 2 for g in itertools.product((1, -1), repeat=3)]
        V += [np.array(w) for a in (1, -1) for b in (1, -1) for w in _cyc((0, a/2, b*ph*ph/2))]
    SOLID_F[name] = np.array(V, float)
    return SOLID_F[name]


def read_record(key):
    with open(os.path.join(REC_DIR, key[:-4], f"{key}.json"), encoding="utf-8") as f:
        return json.load(f)


def out_name(kind):
    return f"d28_{PROB}_{kind}"
