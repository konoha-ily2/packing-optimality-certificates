# D48 section 4 (lower bound for dodinico_n13): common parts: container (icosahedron), vertex cone Q, piece (dodecahedron), the field Q(√5), the basis for the multiplier of 2.5.
# 2026-11-14, written by Claude (Opus 5.5) (L4''d, stage D0). The arguments and code were written by Claude and have no third-party review; this is not a formal proof.
#
# Notation follows D48 section 2: container C (edge 1, centred at the origin), outward face normals a_f (not normalised, in Q(√5)) and b_f := a_f·(a vertex of the face),
# container s₀C = {a_f·x ≤ s₀ b_f}. Piece K (edge 1), placement X = RK + t. H_f(R) := max_{u∈vertices of K} a_f·Ru.
# Cell Q = cone of the points nearest to a vertex v of the container = {g_k·t ≥ 0} (g_k := v − v_k, v_k the 5 neighbours of v).
# **The face normals are built from the vertices by machine** (D48 section 9: a preliminary look mixed up the orientations of piece and container; never write normals by hand).
from fractions import Fraction as Fr
import itertools
import math
import numpy as np

from d16e_common import QD, CheckFailed, need, dot, mmul, mvec, transpose, det3, inv3, is_orth, eye, fmat

QD.GENS = (5,)
SQ5 = QD(0, 1)
PHI = QD(Fr(1, 2), Fr(1, 2))                      # (1 + √5)/2
S0 = QD(Fr(25, 10), Fr(7, 10))                    # s₀ = (25 + 7√5)/10 (closed_forms/dodinico_n13.json)
S0_POLY = (5, -25, 19)                            # 5x² − 25x + 19


def cross(u, w):
    return (u[1]*w[2] - u[2]*w[1], u[2]*w[0] - u[0]*w[2], u[0]*w[1] - u[1]*w[0])


def vsub(u, w):
    return tuple(x - y for x, y in zip(u, w))


def vadd(u, w):
    return tuple(x + y for x, y in zip(u, w))


def vscale(c, u):
    return tuple(c * x for x in u)


def fvec(u):
    return np.array([float(x) for x in u])


# ---------- the canonical solids (same placement as pp/newsolids/upstream_scripts/solids.py, edge 1) ----------
def _cyc(p):
    return [p, (p[1], p[2], p[0]), (p[2], p[0], p[1])]


def icosahedron_vertices():
    """(1/2)(0, ±1, ±φ) and its cyclic permutations."""
    h, hp = QD(Fr(1, 2)), PHI * Fr(1, 2)
    out = []
    for s1 in (1, -1):
        for s2 in (1, -1):
            out += _cyc((QD(0), h * s1, hp * s2))
    return out


def dodecahedron_vertices():
    """(φ/2)(±1, ±1, ±1) and the cyclic permutations of (φ/2)(0, ±1/φ, ±φ)."""
    hp = PHI * Fr(1, 2)
    h = QD(Fr(1, 2))
    hpp = PHI * PHI * Fr(1, 2)
    out = [(hp * a, hp * b, hp * c) for a in (1, -1) for b in (1, -1) for c in (1, -1)]
    for s1 in (1, -1):
        for s2 in (1, -1):
            out += _cyc((QD(0), h * s1, hpp * s2))
    return out


def faces_from_vertices(V):
    """Faces of the convex hull, by machine from the vertices: a list of (a, b, indices of the face's vertices). a is outward (not normalised), b = a·(a vertex of the face) > 0 (the origin is inside).
    Among the planes through 3 points, those with all points on one side are counted once each, by the set of points on the face (exact)."""
    seen = {}
    for i, j, k in itertools.combinations(range(len(V)), 3):
        a = cross(vsub(V[j], V[i]), vsub(V[k], V[i]))
        if all(x == 0 for x in a):
            continue
        d0 = dot(a, V[i])
        vals = [dot(a, v) - d0 for v in V]
        if all(x <= 0 for x in vals):
            pass
        elif all(x >= 0 for x in vals):
            a = tuple(-x for x in a); d0 = -d0
        else:
            continue
        key = frozenset(m for m, x in enumerate(vals) if x == 0)
        if key in seen:
            continue
        need(d0 > 0, "the origin is not inside")
        seen[key] = (a, d0, sorted(key))
    return list(seen.values())


def check_solid(V, F, nv, nf, k):
    need(len(V) == nv and len(F) == nf, f"vertices {len(V)}, faces {len(F)} (expected {nv}, {nf})")
    need(all(len(f[2]) == k for f in F), "number of vertices of a face")
    ne = sum(len(f[2]) for f in F) // 2
    need(nv - ne + nf == 2, "Euler formula")
    # edge length 1: the minimum distance between adjacent vertices on a face is 1
    d2 = min(dot(vsub(V[i], V[j]), vsub(V[i], V[j])) for f in F for i, j in itertools.combinations(f[2], 2))
    need(d2 == 1, "edge length is not 1")
    # regular polyhedron: the distance to the centres of all faces (inradius) is the same, i.e. b_f²/|a_f|² is the same for all
    r2 = {(f[1] * f[1] / dot(f[0], f[0])) for f in F}
    need(len(r2) == 1, "the inradii differ")
    return r2.pop()


def normalize_faces(F):
    """The face normals need not have equal length, but dividing b_f by a common value is easier to read: a_f ← a_f / b_f (b = 1)."""
    return [(tuple(x / f[1] for x in f[0]), QD(1), f[2]) for f in F]


class Setup:
    """Container, cone and piece of dodinico_n13 (exact and floating point). v is the container vertex taken as the axis of the cone (default (1/2)(0, 1, φ))."""

    def __init__(self, v_index=None):
        self.CV = icosahedron_vertices()
        CF = faces_from_vertices(self.CV)
        self.rC2 = check_solid(self.CV, CF, 12, 20, 3)          # inradius² of the container (edge 1)
        self.CF = normalize_faces(CF)                            # the container of edge 1 is a_f·x ≤ 1
        self.KV = dodecahedron_vertices()
        KF = faces_from_vertices(self.KV)
        self.rho2 = check_solid(self.KV, KF, 20, 12, 5)          # inradius² of the piece
        self.KF = normalize_faces(KF)
        if v_index is None:
            v_index = self.CV.index((QD(0), QD(Fr(1, 2)), PHI * Fr(1, 2)))
        self.vi = v_index
        self.v = self.CV[v_index]
        d2 = [dot(vsub(self.v, u), vsub(self.v, u)) for u in self.CV]
        self.nbr = [i for i, x in enumerate(d2) if x == 1]
        need(len(self.nbr) == 5, "the vertex does not have 5 neighbours")
        self.G = [vsub(self.v, self.CV[i]) for i in self.nbr]   # inward normals g_k of the cone (Q = {g_k·t ≥ 0})
        # w₀ = ρ v̂ = (ρ/|v|) v. Check that ρ/|v| is in Q(√5) ((ρ/|v|)² = ρ²/|v|²)
        v2 = dot(self.v, self.v)
        q2 = self.rho2 / v2
        self.rho_over_v = qd_sqrt(q2)
        self.w0 = vscale(self.rho_over_v, self.v)
        # floating point
        self.CVf = np.array([fvec(u) for u in self.CV])
        self.Af = np.array([fvec(f[0]) for f in self.CF])          # 20×3, a_f·x ≤ s
        self.KVf = np.array([fvec(u) for u in self.KV])            # 20×3
        self.Gf = np.array([fvec(g) for g in self.G])              # 5×3
        self.s0f = float(S0)
        self.vf = fvec(self.v); self.vhat = self.vf / np.linalg.norm(self.vf)
        self.w0f = fvec(self.w0)
        self.rhof = math.sqrt(float(self.rho2))
        # constraints on t of the cone in the form "A t ≤ b": 20 rows from the container (b = s₀ − H_f(R)), 5 rows from the cone (−g·t ≤ 0)
        self.Arows = np.vstack([self.Af, -self.Gf])                # 25×3
        self._triples = None

    # ----- stabilizer (orthogonal matrices fixing v, including reflections) -----
    def stabilizer(self):
        from d16e_common import sym_group_exact
        Gall = sym_group_exact(self.CV)
        need(len(Gall) == 120, f"number of symmetries of the icosahedron {len(Gall)}")
        St = [M for M in Gall if mvec(M, self.v) == self.v]
        need(len(St) == 10, f"number of elements of the stabilizer of v {len(St)}")
        return Gall, St

    # ----- multiplier of 2.5: fix n, and take all vertices of the dual (triples of basis rows) -----
    def triples(self):
        if self._triples is None:
            idx, inv = [], []
            for B in itertools.combinations(range(25), 3):
                M = self.Arows[list(B)]
                if abs(np.linalg.det(M)) < 1e-9:
                    continue
                idx.append(B); inv.append(np.linalg.inv(M))
            self._triples = (np.array(idx), np.array(inv))
        return self._triples

    def dual_vertices(self, n, tol=1e-12):
        """The list of vertices y (25 components) of the dual max −b·y (y ≥ 0, Aᵀy = −n) of min_t n·t s.t. A t ≤ b (floating point)."""
        idx, inv = self.triples()
        # A_Bᵀ y_B = −n → y_B = −(A_B)^{-T} n
        yB = -np.einsum('kji,j->ki', inv, n)                        # rows of (A_B^{-1})ᵀ
        ok = (yB >= -tol).all(axis=1)
        Y = np.zeros((ok.sum(), 25))
        rows = np.arange(ok.sum())[:, None]
        Y[rows, idx[ok]] = np.maximum(yB[ok], 0)
        Y = np.unique(np.round(Y, 12), axis=0)
        return Y

    def G_batch(self, n, Rs, Y=None, s0=None):
        """G(n, R) = h_K(Rᵀn) + min_t n·t (t: enters s₀C, t ∈ Q) for a batch Rs (m×3×3) of rotations (floating point).
        = max_u n·Ru + max_y Σ_f y_f (H_f(R) − s₀) (2.5, strong duality over all dual vertices y)."""
        if Y is None:
            Y = self.dual_vertices(n)
        if s0 is None:
            s0 = self.s0f
        P = np.einsum('mij,vj->mvi', Rs, self.KVf)                  # m×20×3
        hK = (P @ n).max(axis=1)
        H = np.einsum('fi,mvi->mfv', self.Af, P).max(axis=2)          # m×20
        b = np.concatenate([s0 - H, np.zeros((len(Rs), 5))], axis=1)  # m×25
        return hK + (-(b @ Y.T)).max(axis=1)

    def lp_min_t(self, n, R, s0=None):
        """min_t n·t by scipy's LP (for cross-checking)."""
        from scipy.optimize import linprog
        if s0 is None:
            s0 = self.s0f
        P = (R @ self.KVf.T).T
        H = (self.Af @ P.T).max(axis=1)
        b = np.concatenate([s0 - H, np.zeros(5)])
        r = linprog(n, A_ub=self.Arows, b_ub=b, bounds=[(None, None)] * 3, method="highs")
        need(r.status == 0, "the LP cannot be solved")
        return float(r.fun) + float((P @ n).max())


def qd_sqrt(x):
    """Return the square root of a number of Q(√5) if it lies in Q(√5) (otherwise CheckFailed). Solve (a + b√5)² = x over the rationals."""
    p, q = x.v                                          # x = p + q√5
    # a² + 5b² = p, 2ab = q. a² is a root of  t² − p t + 5q²/4 = 0 (t = a²)
    disc = p * p - 5 * q * q
    need(disc >= 0, "the square root is not real")
    sd = _fr_sqrt(disc)
    for t in ((p + sd) / 2, (p - sd) / 2):
        if t < 0:
            continue
        try:
            a = _fr_sqrt(t)
        except CheckFailed:
            continue
        for aa in (a, -a):
            if aa != 0:
                b = q / (2 * aa)
            else:
                b5 = p / 5
                b = _fr_sqrt(b5)
            r = QD(aa, b)
            if r * r == x and float(r) > 0:
                return r
    raise CheckFailed("the square root is not in Q(√5)")


def _fr_sqrt(x):
    x = Fr(x)
    need(x >= 0, "square root of a negative number")
    n, d = x.numerator, x.denominator
    rn, rd = math.isqrt(n), math.isqrt(d)
    need(rn * rn == n and rd * rd == d, "the square root of the rational is not rational")
    return Fr(rn, rd)


# ---------- rotations ----------
def rot_from_quat_f(q):
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    return np.array([[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
                     [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
                     [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]) / n


def rot_rational(q):
    """An exact rotation from a rational quaternion (all entries rational)."""
    q = [Fr(c) for c in q]
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    M = [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
         [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
         [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
    return [[QD(e / n) for e in row] for row in M]


def random_rotations(m, rng):
    q = rng.standard_normal((m, 4))
    q /= np.linalg.norm(q, axis=1, keepdims=True)
    w, x, y, z = q.T
    R = np.empty((m, 3, 3))
    R[:, 0, 0] = w*w + x*x - y*y - z*z; R[:, 0, 1] = 2*(x*y - w*z); R[:, 0, 2] = 2*(x*z + w*y)
    R[:, 1, 0] = 2*(x*y + w*z); R[:, 1, 1] = w*w - x*x + y*y - z*z; R[:, 1, 2] = 2*(y*z - w*x)
    R[:, 2, 0] = 2*(x*z - w*y); R[:, 2, 1] = 2*(y*z + w*x); R[:, 2, 2] = w*w - x*x - y*y + z*z
    return R


def expmap_batch(W):
    """A batch of rotation vectors (m×3) → rotations (m×3×3)."""
    th = np.linalg.norm(W, axis=1)
    k = np.where(th[:, None] > 1e-15, W / np.maximum(th, 1e-300)[:, None], 0.0)
    K = np.zeros((len(W), 3, 3))
    K[:, 0, 1] = -k[:, 2]; K[:, 0, 2] = k[:, 1]; K[:, 1, 0] = k[:, 2]
    K[:, 1, 2] = -k[:, 0]; K[:, 2, 0] = -k[:, 1]; K[:, 2, 1] = k[:, 0]
    s, c = np.sin(th)[:, None, None], np.cos(th)[:, None, None]
    return np.eye(3)[None] + s * K + (1 - c) * (K @ K)


def rationalize_qd(x, dmax=200, tol=1e-9):
    """A floating-point number x as a + b√5 (rationals with small denominators). None if not found."""
    s5 = math.sqrt(5)
    best = None
    for d in range(1, dmax + 1):
        for bn in range(-4 * d, 4 * d + 1):
            b = bn / d
            a = x - b * s5
            an = round(a * d)
            err = abs(an / d + b * s5 - x)
            if err < tol:
                return QD(Fr(an, d), Fr(bn, d))
    return best


# ---------- exact: the LP in t by enumerating vertices ----------
def exact_tpoly(S, R, s0=S0):
    """The inequalities (a list of a·t ≤ c, exact) for the set of t such that X = RK + t lies in s₀C and t ∈ Q."""
    P = [mvec(R, u) for u in S.KV]
    rows = []
    for a, _, _ in S.CF:
        H = max(dot(a, p) for p in P)
        rows.append((a, s0 - H))
    for g in S.G:
        rows.append((tuple(-x for x in g), QD(0)))
    return rows, P


def exact_min_t(S, n, R, s0=S0):
    """min_t n·t by enumerating vertices (exact). Returns (value, minimising vertex t)."""
    rows, P = exact_tpoly(S, R, s0)
    best = None
    for B in itertools.combinations(range(len(rows)), 3):
        M = [list(rows[i][0]) for i in B]
        if det3(M) == 0:
            continue
        t = mvec(inv3(M), tuple(rows[i][1] for i in B))
        if all(dot(a, t) <= c for a, c in rows):
            val = dot(n, t)
            if best is None or val < best[0]:
                best = (val, t)
    need(best is not None, "the set of t is empty")
    return best, rows, P


def exact_dual_bound(rows, n):
    """Weak duality of 2.5: if n = −Σ y_i a_i (y ≥ 0) for a basis B (3 rows), then min n·t ≥ −Σ y_i c_i. Returns the best over all bases (exact)."""
    best = None
    for B in itertools.combinations(range(len(rows)), 3):
        M = [list(rows[i][0]) for i in B]
        if det3(M) == 0:
            continue
        # A_Bᵀ y = −n
        y = mvec(inv3(transpose(M)), tuple(-x for x in n))
        if any(c < 0 for c in y):
            continue
        val = -sum((y[k] * rows[B[k]][1] for k in range(3)), QD(0))
        if best is None or val > best[0]:
            best = (val, B, y)
    return best
