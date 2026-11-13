# D16 §14: generalisation of the tool that closes n=2 global optimality with exact arithmetic (d16c_* with piece vertices, container faces and face stabiliser as arguments).
# 2026-11-12, written by Claude. Arguments and code were written by Claude with no third-party review; this is not a formal proof.
#
# Problem (Lemma R; see docs/reduction_symmetric.md): piece K (vertices VERTS, pre-rotated by R* so that the optimum is R = I),
# container {n_f·x ≤ S} (face normals n_f normalised to a common offset, S = C0·s), piece face n0·x ≤ D0 (a supporting plane of K).
#   φ(R) = min S  s.t.  n_f·t + h_f(R) ≤ S (all f), (R n0)·t ≤ −D0, h_f(R) = max_v n_f·R v
# The minimum over SO(3) is S*. The field is Q(√D) (D per problem: 5 for icoincub and dodinico, 2 for cubinoct).
# Rotations use 4 quaternion charts (as in d16c). Acceptance is an integer computation with √D enclosed between rationals.
from fractions import Fraction as Fr
import itertools
import math
import numpy as np
import flint


class CheckFailed(Exception):
    """Raised when a correctness precondition fails (assert is not used because python -O removes it)."""


def need(cond, msg):
    if not cond:
        raise CheckFailed(msg)


# ---------- field Q(√p1, …, √pk) (tried with k ≤ 2; generalises Q(√D) of d16d) ----------
def _mask_mult(m1, m2):
    """c in √(m1)·√(m2) = c·√(m1 xor m2) (product of the common generators)."""
    c = 1
    for i, p in enumerate(QD.GENS):
        if (m1 >> i) & 1 and (m2 >> i) & 1:
            c *= p
    return c


def _mask_rad(m):
    """The radicand of √(m) (product of generators)."""
    c = 1
    for i, p in enumerate(QD.GENS):
        if (m >> i) & 1:
            c *= p
    return c


class QD:
    """Σ_m v_m √(m) (m is a bit mask of a subset of the generators, √(0) = 1). The generators QD.GENS are fixed once, when the problem is loaded.
    For k = 1 this is the same as a + b√D of d16d (QD(a, b))."""
    __slots__ = ("v",)
    GENS = None

    def __init__(self, *cs):
        n = 1 << len(QD.GENS)
        need(len(cs) <= n, "too many components")
        self.v = tuple(Fr(x) for x in cs) + (Fr(0),) * (n - len(cs))

    @staticmethod
    def c(x):
        return x if isinstance(x, QD) else QD(x)

    @staticmethod
    def sqrt(p):
        i = QD.GENS.index(p)
        cs = [0] * (1 << len(QD.GENS)); cs[1 << i] = 1
        return QD(*cs)

    def __add__(s, o): o = QD.c(o); return QD(*(x + y for x, y in zip(s.v, o.v)))
    __radd__ = __add__
    def __sub__(s, o): o = QD.c(o); return QD(*(x - y for x, y in zip(s.v, o.v)))
    def __rsub__(s, o): return QD.c(o) - s
    def __neg__(s): return QD(*(-x for x in s.v))

    def __mul__(s, o):
        o = QD.c(o); n = len(s.v); out = [Fr(0)] * n
        for m1, x in enumerate(s.v):
            if x:
                for m2, y in enumerate(o.v):
                    if y:
                        out[m1 ^ m2] += x * y * _mask_mult(m1, m2)
        return QD(*out)
    __rmul__ = __mul__

    def conj(s, i):
        """√p_i → −√p_i."""
        return QD(*(-x if (m >> i) & 1 else x for m, x in enumerate(s.v)))

    def __truediv__(s, o):
        o = QD.c(o)
        need(any(o.v), "division by zero in the field")
        num, den = s, o
        for i in range(len(QD.GENS)):                 # multiply by the conjugates in turn to make the denominator rational
            cj = den.conj(i); num = num * cj; den = den * cj
        need(all(x == 0 for x in den.v[1:]) and den.v[0] != 0, "rationalising the denominator")
        q = QD(*(x / den.v[0] for x in num.v))
        need(q * o == s, "check of the division")
        return q

    def __rtruediv__(s, o): return QD.c(o) / s

    def bounds(s, k):
        """(lo, hi): integers with lo ≤ s·2^k ≤ hi (each √ enclosed by isqrt in units of 2^k)."""
        lo = hi = 0
        for m, x in enumerate(s.v):
            if not x:
                continue
            if m == 0:
                y = x * 2**k
                lo += math.floor(y); hi += math.ceil(y); continue
            r = int(flint.fmpz(_mask_rad(m) * 4**k).isqrt())
            v0, v1 = x * r, x * (r + 1)
            lo += math.floor(min(v0, v1)); hi += math.ceil(max(v0, v1))
        return lo, hi

    def sign(s):
        if not any(s.v):
            return 0
        k = 64
        while True:                                    # a nonzero algebraic number, so the sign is decided at some precision
            lo, hi = s.bounds(k)
            if lo > 0: return 1
            if hi < 0: return -1
            k *= 2
            need(k <= 1 << 16, "sign cannot be decided")

    def __eq__(s, o): o = QD.c(o); return s.v == o.v
    def __hash__(s): return hash(s.v)
    def __lt__(s, o): return (s - o).sign() < 0
    def __le__(s, o): return (s - o).sign() <= 0
    def __gt__(s, o): return (s - o).sign() > 0
    def __ge__(s, o): return (s - o).sign() >= 0
    def __float__(s): return sum(float(x) * math.sqrt(_mask_rad(m)) for m, x in enumerate(s.v))

    def __repr__(s):
        if len(QD.GENS) == 1:
            a, b = s.v
            return f"({a}{'+' if b >= 0 else '-'}{abs(b)}√{QD.GENS[0]})"
        out = [str(s.v[0])]
        for m, x in enumerate(s.v[1:], 1):
            if x:
                out.append(f"{'+' if x >= 0 else '-'}{abs(x)}√{_mask_rad(m)}")
        return "(" + "".join(out) + ")"


def qstr(x):
    return str(QD.c(x))


# ---------- matrices and vectors ----------
def dot(u, v):
    return sum((x * y for x, y in zip(u, v)), QD(0))


def mmul(A, B):
    return [[sum((A[i][k] * B[k][j] for k in range(3)), QD(0)) for j in range(3)] for i in range(3)]


def mvec(A, v):
    return tuple(sum((A[i][k] * v[k] for k in range(3)), QD(0)) for i in range(3))


def transpose(A):
    return [[A[j][i] for j in range(3)] for i in range(3)]


def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def inv3(M):
    d = det3(M); need(d != 0, "singular matrix")
    Mi = [[(M[(j+1) % 3][(i+1) % 3]*M[(j+2) % 3][(i+2) % 3] - M[(j+1) % 3][(i+2) % 3]*M[(j+2) % 3][(i+1) % 3]) / d
           for j in range(3)] for i in range(3)]
    need(mmul(M, Mi) == eye(), "check of the inverse matrix")
    return Mi


def trace(M):
    return M[0][0] + M[1][1] + M[2][2]


def is_orth(M):
    return all(sum((M[k][i] * M[k][j] for k in range(3)), QD(0)) == (1 if i == j else 0) for i in range(3) for j in range(3))


def eye():
    return [[QD(1 if i == j else 0) for j in range(3)] for i in range(3)]


def fmat(M):
    return np.array([[float(x) for x in row] for row in M])


def sym_group_exact(pts):
    """Orthogonal matrices (reflections included) preserving a point set, exactly. Candidates are narrowed in floating point and checked in Q(√D)."""
    P = np.array([[float(x) for x in p] for p in pts])
    idx = None
    for tri in itertools.combinations(range(len(pts)), 3):
        if abs(np.linalg.det(P[list(tri)])) > 1e-6:
            idx = list(tri); break
    Bm = [[pts[idx[j]][i] for j in range(3)] for i in range(3)]          # columns are points
    Bi = inv3(Bm)
    G0 = P[idx] @ P[idx].T
    S = set(pts)
    out = []
    for tri in itertools.permutations(range(len(pts)), 3):
        W = P[list(tri)]
        if np.abs(W @ W.T - G0).max() > 1e-9:
            continue
        Mf = W.T @ np.linalg.inv(P[idx].T)
        if np.abs(Mf @ Mf.T - np.eye(3)).max() > 1e-9:
            continue
        if not all(np.abs(P - z).sum(axis=1).min() < 1e-8 for z in P @ Mf.T):
            continue
        Wm = [[pts[tri[j]][i] for j in range(3)] for i in range(3)]
        M = mmul(Wm, Bi)
        need(is_orth(M) and all(mvec(M, p) in S for p in pts), "symmetry matrix (exact)")
        out.append(M)
    return out


def _hull_faces(V):
    """Number of faces of the convex hull of a point set (3-vectors of QD), exactly: planes through 3 points with all points on one side, counted by the set of points on the plane."""
    faces = set()
    for a, b, c in itertools.combinations(range(len(V)), 3):
        u = tuple(x - y for x, y in zip(V[b], V[a])); w = tuple(x - y for x, y in zip(V[c], V[a]))
        nrm = (u[1]*w[2] - u[2]*w[1], u[2]*w[0] - u[0]*w[2], u[0]*w[1] - u[1]*w[0])
        if all(x == 0 for x in nrm):
            continue
        d0 = dot(nrm, V[a])
        vals = [dot(nrm, v) - d0 for v in V]
        if all(x <= 0 for x in vals) or all(x >= 0 for x in vals):
            faces.add(frozenset(i for i, x in enumerate(vals) if x == 0))
    return faces


def polytope_vertices(normals):
    """Vertices of {n_f·x ≤ 1} (exact)."""
    out = set()
    for a, b, c in itertools.combinations(range(len(normals)), 3):
        M = [list(normals[a]), list(normals[b]), list(normals[c])]
        if det3(M) == 0:
            continue
        Mi = inv3(M)
        x = mvec(Mi, (QD(1), QD(1), QD(1)))
        if all(dot(n, x) <= 1 for n in normals):
            out.add(x)
    return sorted(out, key=lambda v: tuple(float(t) for t in v))


# ---------- rotations (quaternions) ----------
def rot_q(q):
    w, x, y, z = q
    return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
            [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
            [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]


def rot_exact(q):
    q = [v if isinstance(v, QD) else QD(Fr(v)) for v in q]
    n = sum((v * v for v in q), QD(0))
    return [[e / n for e in row] for row in rot_q(q)]


def rot_f(q):
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                     [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]) / n


def q_of(k, u):
    q = list(u); q.insert(k, 1.0); return q


def quat_chart(R):
    """From a rotation matrix (QD), the chart index k and the coordinates (the other 3 components with q_k = 1, QD), exactly (as in d16c)."""
    d = [1 + trace(R), 1 + R[0][0] - R[1][1] - R[2][2], 1 - R[0][0] + R[1][1] - R[2][2], 1 - R[0][0] - R[1][1] + R[2][2]]
    k = max(range(4), key=lambda i: (float(d[i]), -i))
    for i in range(4):
        if d[i] > d[k]:
            k = i
    for i in range(4):
        need(d[k] >= d[i], "largest component")
    P = {(0, 1): R[2][1] - R[1][2], (0, 2): R[0][2] - R[2][0], (0, 3): R[1][0] - R[0][1],
         (1, 2): R[0][1] + R[1][0], (1, 3): R[0][2] + R[2][0], (2, 3): R[1][2] + R[2][1]}
    return k, [P[(min(i, k), max(i, k))] / d[k] for i in range(4) if i != k]


# ---------- polynomials ----------
CTX4 = flint.fmpz_mpoly_ctx.get(('u1', 'u2', 'u3', 'd'), 'lex')
CTXS = flint.fmpz_mpoly_ctx.get(('s1', 's2', 's3'), 'lex')
KDEN = 44
DEN = 2 ** KDEN
ZERO4 = CTX4.from_dict({})
SQ_K = 120
SQ_BR = None          # SQ_BR[m] = (lo, hi): integers with lo < √(m)·2^SQ_K < hi (m ≥ 1)


def set_field(gens):
    """Fix the field Q(√p1, …) and build the enclosures of the square roots (once per process)."""
    global SQ_BR
    gens = tuple(gens)
    need(QD.GENS is None or QD.GENS == gens, "one field per process")
    QD.GENS = gens
    SQ_BR = [None]
    for m in range(1, 1 << len(gens)):
        D = _mask_rad(m)
        r = int(flint.fmpz(D * 4**SQ_K).isqrt())
        need(r * r < D * 4**SQ_K < (r + 1)**2, "enclosure of √ (not a perfect square)")
        SQ_BR.append((r, r + 1))


def nb():
    return 1 << len(QD.GENS)


def chart_q(k):
    u1, u2, u3, d = CTX4.gens()
    q = [u1, u2, u3]; q.insert(k, d)
    return q


def embed(p):
    """Polynomial with rational coefficients → polynomial over the field (tuple of components)."""
    return (p,) + (ZERO4,) * (nb() - 1)


def int_comb(terms):
    """Sum of [(QD coefficient, field polynomial = tuple of components)], multiplied by a common denominator den, as integer coefficients (tuple of components, den)."""
    den = 1
    for c, _ in terms:
        for x in QD.c(c).v:
            den = den * x.denominator // math.gcd(den, x.denominator)
    out = [ZERO4] * nb()
    for c, pt in terms:
        c = QD.c(c)
        for m1, x in enumerate(c.v):
            if not x:
                continue
            xi = x * den
            need(xi.denominator == 1, "made integral (review item F4)")
            xi = int(xi)
            for m2, p in enumerate(pt):
                if p != ZERO4:
                    out[m1 ^ m2] += (xi * _mask_mult(m1, m2)) * p
    return tuple(out), den


def lin_rq(Rq, Cm):
    """Σ_ij Cm_ij Rq_ij (Cm is a 3×3 of QD) as (tuple of components, den)."""
    return int_comb([(Cm[i][j], embed(Rq[i][j])) for i in range(3) for j in range(3) if Cm[i][j] != 0])


def shift(poly, Cc, W):
    s1, s2, s3 = CTXS.gens()
    dd = CTXS.from_dict({(0, 0, 0): DEN})
    return poly.compose(Cc[0] + W[0]*s1, Cc[1] + W[1]*s2, Cc[2] + W[2]*s3, dd, ctx=CTXS)


def lower_bound_field(Qs):
    """Lower bound × 2^SQ_K (integer) of Σ_α (Σ_m c_{α,m} √(m)) s^α (Qs: one polynomial per component) over s ∈ [−1,1]³."""
    ts = [dict((mon, int(c)) for mon, c in Q.terms()) for Q in Qs]
    mons = set()
    for t in ts:
        mons |= set(t)
    lb = 0
    for mon in mons:
        lo = hi = ts[0].get(mon, 0) << SQ_K
        for m in range(1, len(ts)):
            b = ts[m].get(mon, 0)
            if b:
                rl, rh = SQ_BR[m]
                lo += b * rl if b >= 0 else b * rh
                hi += b * rh if b >= 0 else b * rl
        if all(e == 0 for e in mon):
            lb += lo
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, lo)
        else:
            lb -= max(abs(lo), abs(hi))
    return lb


def lb_shift(pt, Cc, W, sh=None):
    """Lower bound of the field polynomial pt moved to the box (centre Cc, half-width W)."""
    sh = sh or shift
    return lower_bound_field([sh(p, Cc, W) for p in pt])


# Local box L (chart 0, |x|,|y|,|z| ≤ RHO0). The far and local stages use the same one (review item F3)
RHO0 = Fr(1, 16)


# ---------- problem ----------
class Problem:
    def __init__(self, name, D, verts, n0, D0, normals, C0, sstar, rstar, cverts, note="", cedge2=1):
        """verts and n0 are in the standard orientation of the piece, rstar is the optimal rotation (3×3 of QD). Internally the piece rotated by R* is used, so the optimum is R = I."""
        set_field(D if isinstance(D, tuple) else (D,))
        self.name, self.D, self.note = name, D, note
        need(is_orth(rstar) and det3(rstar) == 1, "R* is a rotation")
        self.RSTAR = rstar
        self.VERTS0 = list(verts)
        self.VERTS = [mvec(rstar, v) for v in verts]
        self.N0 = mvec(rstar, n0)
        self.D0 = QD.c(D0)
        self.NORMALS = list(normals)
        self.C0 = QD.c(C0)
        self.SSTAR = QD.c(sstar)
        V = self.VERTS
        need(len(set(V)) == len(V), "duplicate vertices")
        need(min(dot(tuple(a - b for a, b in zip(V[i], V[j])), tuple(a - b for a, b in zip(V[i], V[j])))
                 for i in range(len(V)) for j in range(i)) == 1, "edge length 1")
        need(all(dot(self.N0, v) <= self.D0 for v in V), "n0·x ≤ D0 is a supporting plane")
        need(sum(1 for v in V if dot(self.N0, v) == self.D0) >= 3, "at least 3 vertices on face n0")
        need(set(V) == set(tuple(-x for x in v) for v in V), "the piece is centrally symmetric (assumption of Lemma R)")
        need(set(self.NORMALS) == set(tuple(-x for x in n) for n in self.NORMALS), "the container is centrally symmetric (assumption of Lemma R)")
        self.NF = len(self.NORMALS)
        # the container is the solid with edge² = cedge2 (vertices cverts) scaled by s/√cedge2: max_v n_f·v = C0 on each face, at least 3 vertices on each face.
        # hence s = √cedge2 · S / C0 (for icoinoct the octahedron is given by vertices ±e_k, cedge2 = 2)
        self.CEDGE2 = Fr(cedge2)
        need(min(dot(tuple(a - b for a, b in zip(p, q)), tuple(a - b for a, b in zip(p, q)))
                 for i, p in enumerate(cverts) for q in cverts[:i]) == self.CEDGE2, "container edge²")
        for n in self.NORMALS:
            need(max(dot(n, v) for v in cverts) == self.C0, "container face offset is C0")
            need(sum(1 for v in cverts if dot(n, v) == self.C0) >= 3, "container face")
        need(len(polytope_vertices([tuple(x / self.C0 for x in n) for n in self.NORMALS])) == len(cverts), "all container faces are present")
        self.N02 = dot(self.N0, self.N0)
        self.RIN2 = self.D0 * self.D0 / self.N02                  # inradius² of the piece (checked to be the same for all faces)
        # symmetries
        self.GC = sym_group_exact(self.NORMALS)
        GK = sym_group_exact(V)
        self.GK = GK
        self.STAB = [k for k in GK if mvec(k, self.N0) == self.N0]
        # the piece faces form one orbit (where the lemma reduces to a single n0); the inradius is the same for all faces
        orbit = set(mvec(k, self.N0) for k in GK)
        for n in orbit:
            need(max(dot(n, v) for v in V) == self.D0, "same support value along the face orbit")
        self.N_PIECE_FACES = len(orbit)
        # assumption "reduce to one face" of Lemma R: number of images of n0 under det = +1 symmetries = number of faces of the convex hull of the piece (counted separately from the hull)
        orbit_rot = set(mvec(k, self.N0) for k in GK if det3(k) == 1)
        need(len(orbit_rot) == len(_hull_faces(V)), "piece faces form one orbit under rotational symmetries (face count vs orbit size)")
        need(all(max(dot(n, v) for v in V) == self.D0 for n in orbit_rot), "support value D0 along the rotation orbit")
        self.PAIRS = [(g, k) for g in self.GC for k in self.STAB if det3(g) * det3(k) == 1]
        self.PAIR_M = [transpose(mmul(k, g)) for g, k in self.PAIRS]      # tr(gRk) = Σ M_ij R_ij
        self.ID_PAIRS = [i for i, M in enumerate(self.PAIR_M) if M == eye()]
        self.NONID = [i for i in range(len(self.PAIRS)) if i not in self.ID_PAIRS]
        # range of t: vertices of P = {n_f·x ≤ 1} instead of a norm
        self.PV = polytope_vertices(self.NORMALS)
        self.NN2 = [dot(n, n) for n in self.NORMALS]
        # floating point (candidates only)
        self.VF = np.array([[float(x) for x in v] for v in V])
        self.NCF = np.array([[float(x) for x in n] for n in self.NORMALS])
        self.N0F = np.array([float(x) for x in self.N0])
        self.D0F = float(self.D0)
        self.PAIRMF = np.array([fmat(M) for M in self.PAIR_M])
        self.charts = [None] * 4

    # ----- polynomials per chart (lazy) -----
    def chart(self, k):
        if self.charts[k] is None:
            q = chart_q(k)
            Rq = rot_q(q)
            N = q[0]*q[0] + q[1]*q[1] + q[2]*q[2] + q[3]*q[3]
            for i in range(3):
                for j in range(3):
                    v = sum((Rq[l][i] * Rq[l][j] for l in range(3)), ZERO4)
                    need(v == (N*N if i == j else ZERO4), "orthogonality of R(q)")
            outer = lambda a, b: [[QD.c(a[i]) * b[j] for j in range(3)] for i in range(3)]
            RV = {}
            for vi, v in enumerate(self.VERTS):
                for f, n in enumerate(self.NORMALS):
                    RV[(vi, f)] = lin_rq(Rq, outer(n, v))                   # n_f·Rq v
            UW = [lin_rq(Rq, outer(w, self.N0)) for w in self.PV]          # (Rq n0)·w
            U = [lin_rq(Rq, [[QD(1 if i == r else 0) * self.N0[j] for j in range(3)] for i in range(3)]) for r in range(3)]
            self.charts[k] = dict(Rq=Rq, N=N, RV=RV, UW=UW, U=U)
        return self.charts[k]

    def s_of(self, S):
        """Container edge s (floating point) from a value in units of S."""
        return float(S) / float(self.C0) * math.sqrt(self.CEDGE2)

    def s2_exact(self, S):
        """s² = cedge2·(S/C0)² (QD)."""
        return (QD.c(S) / self.C0) * (QD.c(S) / self.C0) * self.CEDGE2

    # ----- exact φ(R) -----
    def hvals(self, R, scale=Fr(1)):
        RV = [mvec(R, v) for v in self.VERTS]
        return [max(dot(n, x) for x in RV) * scale for n in self.NORMALS]

    def rows(self, R, scale=Fr(1)):
        h = self.hvals(R, scale)
        u = mvec(R, self.N0)
        rows = [([n[0], n[1], n[2], QD(-1)], -h[f]) for f, n in enumerate(self.NORMALS)]
        rows.append(([u[0], u[1], u[2], QD(0)], -self.D0 * scale))
        return rows

    def phi_exact(self, R, scale=Fr(1)):
        """φ(R) (units of S) in QD. Choose the active rows with a floating-point LP, solve exactly, and check primal and dual feasibility exactly.
        Returns (S, x = (t1, t2, t3, S), y = duals of the active rows)."""
        from scipy.optimize import linprog
        rows = self.rows(R, scale)
        A = np.array([[float(x) for x in r[0]] for r in rows]); b = np.array([float(r[1]) for r in rows])
        res = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs")
        need(res.status == 0, "LP (floating point)")
        slack = b - A @ res.x
        y = -res.ineqlin.marginals
        order = sorted(range(len(rows)), key=lambda i: (slack[i], -y[i]))
        cand = order[:min(len(rows), 8)]
        for idx in itertools.combinations(cand, 4):
            M = [list(rows[i][0]) for i in idx]
            if det3([[M[r][c] for c in range(3)] for r in range(3)]) == 0 and abs(np.linalg.det(A[list(idx)])) < 1e-12:
                continue
            sol = _solve4([list(rows[i][0]) + [rows[i][1]] for i in idx])
            if sol is None:
                continue
            if not all(dot(r[0], sol) <= r[1] for r in rows):
                continue
            # dual: (0,0,0,1) = −Σ y_i a_i, y ≥ 0
            MT = [[rows[i][0][c] for i in idx] + [QD(-1 if c == 3 else 0)] for c in range(4)]
            yy = _solve4(MT)
            if yy is None or not all(v >= 0 for v in yy):
                continue
            need(sum((yy[j] * rows[i][1] for j, i in enumerate(idx)), QD(0)) == -sol[3], "primal and dual values agree")
            return sol[3], sol, dict(zip(idx, yy))
        raise CheckFailed("no exact vertex of φ found (degenerate)")

    # ----- upper bounds S̄ and T -----
    def sstar_upper(self, k=100):
        """Rational S̄ ≥ S* (difference about < 2^-k)."""
        s = self.SSTAR
        # each √(m) from above using its enclosure in units of 2^SQ_K (for k = 1 this gives the same rational as d16d)
        up = s.v[0]
        for m in range(1, len(s.v)):
            b = s.v[m]
            if b:
                lo, hi = SQ_BR[m]
                up += b * Fr(hi if b >= 0 else lo, 2**SQ_K)
        need(QD(up) >= s, "S̄ ≥ S*")
        need(QD(up) - s <= QD(Fr(1, 2**100)), "S̄ − S* ≤ 2^-100")
        return up

    def check_T(self, T, Sbar, scale=Fr(1)):
        """Exactly check T ≥ S̄ − scale·r_in·|n_f| (all f): (S̄ − T)² ≤ scale²·r_in²·|n_f|² (when S̄ − T > 0).
        Then any solution with S < S̄ has n_f·t ≤ S − h_f ≤ S̄ − r_in|n_f| ≤ T (h_f ≥ r_in|n_f|: the piece contains its centred insphere),
        i.e. t ∈ T·P, P = {n_f·x ≤ 1}, E·t ≥ min_w E·(T w) (w over the vertices of P)."""
        a = Fr(Sbar) - Fr(T)
        need(T > 0, "T > 0")
        for nn in self.NN2:
            need(a <= 0 or QD(a * a) <= self.RIN2 * nn * scale * scale, f"T = {T} is smaller than S̄ − r_in|n_f|")

    def default_T(self, Sbar):
        m = min(math.sqrt(float(self.RIN2) * float(nn)) for nn in self.NN2)
        T = Fr(math.ceil((float(Sbar) - m) * 64) + 1, 64)
        self.check_T(T, Sbar)
        return T


def _solve4(M):
    M = [row[:] for row in M]
    n = 4
    for c in range(n):
        p = next((r for r in range(c, n) if M[r][c] != 0), None)
        if p is None:
            return None
        M[c], M[p] = M[p], M[c]
        for r in range(n):
            if r != c and M[r][c] != 0:
                f = M[r][c] / M[c][c]
                M[r] = [x - f * y for x, y in zip(M[r], M[c])]
    return [M[i][n] / M[i][i] for i in range(n)]


# ---------- problem definitions ----------
def _cyc(v):
    return [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]


def rot_pi_axis(m):
    """180° rotation about the axis m (a QD vector, not normalised): 2mmᵀ/|m|² − I."""
    n2 = dot(m, m)
    return [[2 * m[i] * m[j] / n2 - (1 if i == j else 0) for j in range(3)] for i in range(3)]


FIELDS = {"cubinoct": (2,), "octindod": (2, 5)}


def load(name):
    set_field(FIELDS.get(name, (5,)))
    if name in ("icoincub", "dodinico", "icoinoct", "icoindod", "octindod"):
        r5 = QD.sqrt(5)
        phi = (1 + r5) / 2
        ico = [w for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), QD(Fr(a, 2)), b * phi / 2))]
        dod_n = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        dod_n += [w for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * phi, b * (phi - 1)))]   # face normals of the icosahedron
        if name == "icoincub":
            # piece: icosahedron (standard orientation, R* = I), face (1,1,1)·x ≤ φ²/2. Container: cube |x_i| ≤ S, S = s/2
            normals = [tuple(QD(sg if i == j else 0) for j in range(3)) for i in range(3) for sg in (1, -1)]
            cube = [tuple(QD(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
            return Problem(name, 5, ico, (QD(1), QD(1), QD(1)), phi * phi / 2, normals, Fr(1, 2),
                           (4 * phi + 1) / 6, eye(), cube, note="regression of D16 §13 (d16c)")
        if name == "dodinico":
            # piece: unit-edge dodecahedron (φ/2)(±1,±1,±1), (φ/2)·cyclic(0, ±1/φ, ±φ). Face (0,φ,1)·x ≤ φ³/2.
            # container: unit-edge icosahedron, face normals (±1,±1,±1) and cyclic(0, ±φ, ±(φ−1)), offset φ²/2: {n_f·x ≤ S}, S = (φ²/2)·s
            # R* = (180° about the axis Rx·n0)·Rx (Rx is 90° about the x axis). Found by a floating-point pre-search
            dod = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
            dod += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * (phi - 1), b * phi))]
            n0 = (QD(0), phi, QD(1))
            Rx = [[QD(1), QD(0), QD(0)], [QD(0), QD(0), QD(-1)], [QD(0), QD(1), QD(0)]]
            rstar = mmul(rot_pi_axis(mvec(Rx, n0)), Rx)
            c0 = phi * phi / 2
            sstar = c0 * (2 + r5 * Fr(2, 5))                            # s* = 2 + 2√5/5 = (10+2√5)/5
            return Problem(name, 5, dod, n0, phi * phi * phi / 2, dod_n, c0, sstar, rstar, ico)
        if name == "icoinoct":
            # piece: icosahedron (standard orientation), face (1,1,1)·x ≤ φ²/2. Container: octahedron with vertices ±e_k (edge √2): {σ·x ≤ S},
            # s = √2·S. R* is the floating-point pre-search minimum moved by a symmetry; its entries are 0, ±1/2, ±φ/2, ±(φ−1)/2
            normals = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
            octv = [tuple(QD(sg if i == k else 0) for i in range(3)) for k in range(3) for sg in (1, -1)]
            a, b, c = (phi - 1) / 2, phi / 2, QD(Fr(1, 2))
            rstar = [[a, -b, c], [-b, -c, -a], [c, -a, -b]]
            return Problem(name, 5, ico, (QD(1), QD(1), QD(1)), phi * phi / 2, normals, 1, 1 + r5 / 2,
                           rstar, octv, cedge2=2, note="s* = √(9/2 + 2√5), S* = s*/√2 = 1 + √5/2")
        if name == "icoindod":
            # D16 §15 (2026-11-12). Piece: icosahedron (standard orientation), face (1,1,1)·x ≤ φ²/2.
            # container: unit-edge dodecahedron (same vertices as the dodinico piece), face normals cyclic(0, ±φ, ±1), offset φ³/2: {n_f·x ≤ S}, S = (φ³/2)·s.
            # R*: R* n0 points to the container vertex direction (−(φ−1), φ, 0) (3-fold axis); the spin about it is the floating-point 1-D minimum (difference 1e−16)
            # recognised in Q(√5) by PSLQ. The exact φ(I) = S* is checked in stage 0.
            dod = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
            dod += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * (phi - 1), b * phi))]
            normals = [w for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * phi, b * QD(1)))]
            rstar = [[-(1 + 2 * r5) / 6, (1 - r5) / 12, (7 - r5) / 12],
                     [(1 + r5) / 12, (2 * r5 - 1) / 6, (7 + r5) / 12],
                     [(1 - r5) / 4, (1 + r5) / 4, QD(Fr(-1, 2))]]
            c0 = phi * phi * phi / 2
            return Problem(name, 5, ico, (QD(1), QD(1), QD(1)), phi * phi / 2, normals, c0, c0 * (r5 - 1), rstar, dod,
                           note="s* = √5 − 1, S = (φ³/2)·s")
        if name == "octindod":
            # D16 §15 (2026-11-12). The field is Q(√2, √5). Piece: unit-edge octahedron ±(√2/2)e_k, face (1,1,1)·x ≤ √2/2.
            # container: the same dodecahedron as in icoindod {n_f·x ≤ S}, S = (φ³/2)·s.
            # R*: R* n0 points to the container vertex direction (1, 1, −1) (3-fold axis); the spin is the minimum of the pre-search (d16b_n2_survey) moved by a symmetry,
            # recognised in Q(√2, √5) by PSLQ (floating-point difference 1e−15). s* = (2√5 + √10 − √2 − 4)/3 (also PSLQ).
            # The exact φ(I) = S* is checked in stage 0.
            r2 = QD.sqrt(2); r10 = r2 * r5
            octp = [tuple((r2 / 2 * sg if i == k else QD(0)) for i in range(3)) for k in range(3) for sg in (1, -1)]
            dod = [tuple(phi / 2 * QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
            dod += [tuple(phi / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * (phi - 1), b * phi))]
            normals = [w for a in (1, -1) for b in (1, -1) for w in _cyc((QD(0), a * phi, b * QD(1)))]
            a_ = (2 - r10) / 6; b_ = (4 - 3 * r2 + r10) / 12; c_ = (4 + 3 * r2 + r10) / 12
            rstar = [[a_, b_, c_], [b_, c_, a_], [-c_, -a_, -b_]]
            c0 = phi * phi * phi / 2
            return Problem(name, (2, 5), octp, (QD(1), QD(1), QD(1)), r2 / 2, normals, c0,
                           c0 * (2 * r5 + r10 - r2 - 4) / 3, rstar, dod, note="s* = (2√5 + √10 − √2 − 4)/3, field Q(√2, √5)")
    if name == "cubinoct":
        cube = [tuple(QD(Fr(x, 2)) for x in p) for p in itertools.product((1, -1), repeat=3)]
        normals = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
        h = QD.sqrt(2) / 2                                                 # √2/2 = cos 45°
        rstar = [[QD(1), QD(0), QD(0)], [QD(0), h, -h], [QD(0), h, h]]      # 45° about the x axis
        octa = [tuple((h * sg if i == k else QD(0)) for i in range(3)) for k in range(3) for sg in (1, -1)]   # ±(√2/2)e_k
        return Problem(name, 2, cube, (QD(1), QD(0), QD(0)), Fr(1, 2), normals, h, 1 + h, rstar, octa,
                       note="regression of D16 §9 (d16_cover), S = s/√2")
    raise ValueError(name)
