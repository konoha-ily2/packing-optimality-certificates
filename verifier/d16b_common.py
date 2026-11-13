# D16 §11 (other n=2 cases): shared parts for pairs of Platonic solids (floating point only). 2026-11-12, written by Claude; no third-party review.
#
# Written independently of d16_cover_*: the support function is a maximum over vertices, container faces use unit normals n_f, and s is a direct variable.
#   φ(R) = min s  s.t.  n_f·t + max_v n_f·R v ≤ s·r_C (container face f), (R n0)·t ≤ −d_K (origin outside the piece face n0)
# The piece is K0 = (unit-edge Platonic solid with n0 turned to e_x); the container is oriented with "corner A of the fundamental triangle at e_x".
import itertools
import numpy as np
from scipy.optimize import linprog
from scipy.spatial import ConvexHull

PHI = (1 + 5 ** 0.5) / 2


def _cyc(v):
    return [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]


def solid_vertices(name):
    """Vertices of a unit-edge Platonic solid (centred at the origin)."""
    if name == "cub":
        V = list(itertools.product([-0.5, 0.5], repeat=3))
    elif name == "oct":
        V = [tuple(s * (2 ** -0.5) * (i == k) for i in range(3)) for k in range(3) for s in (1, -1)]
    elif name == "ico":
        V = [w for a in (1, -1) for b in (1, -1) for w in _cyc((0.0, a * 0.5, b * PHI / 2))]
    elif name == "dod":
        V = [tuple(PHI / 2 * x for x in p) for p in itertools.product([-1, 1], repeat=3)]
        V += [tuple(PHI / 2 * x for x in w) for a in (1, -1) for b in (1, -1) for w in _cyc((0.0, a / PHI, b * PHI))]
    else:
        raise ValueError(name)
    V = np.array(V, float)
    e = min(np.linalg.norm(V[i] - V[j]) for i in range(len(V)) for j in range(i))
    assert abs(e - 1) < 1e-12, (name, e)
    return V


def face_normals(V):
    """Unit face normals (without duplicates) and the inradius."""
    eq = ConvexHull(V).equations
    N = []
    for row in eq:
        n = row[:3] / np.linalg.norm(row[:3])
        if not any(np.linalg.norm(n - m) < 1e-8 for m in N):
            N.append(n)
    N = np.array(N)
    d = (N @ V.T).max(axis=1)
    assert np.ptp(d) < 1e-12
    return N, float(d[0])


def sym_group(V):
    """All orthogonal matrices preserving the vertex set (reflections included)."""
    idx = None
    for tri in itertools.combinations(range(len(V)), 3):
        if abs(np.linalg.det(V[list(tri)])) > 1e-6:
            idx = list(tri); break
    B = V[idx]; G0 = B @ B.T; Binv = np.linalg.inv(B.T)      # M B^T = W^T
    out = []
    for tri in itertools.permutations(range(len(V)), 3):
        W = V[list(tri)]
        if np.abs(W @ W.T - G0).max() > 1e-9:
            continue
        M = W.T @ Binv
        if np.abs(M @ M.T - np.eye(3)).max() > 1e-9:
            continue
        Z = V @ M.T
        if all(np.abs(V - z).sum(axis=1).min() < 1e-8 for z in Z):
            out.append(M)
    return out


def rot_to(a, b):
    """Rotation taking unit vector a to b (shortest)."""
    a = a / np.linalg.norm(a); b = b / np.linalg.norm(b)
    v = np.cross(a, b); c = float(a @ b)
    if np.linalg.norm(v) < 1e-12:
        if c > 0:
            return np.eye(3)
        p = np.cross(a, [1, 0, 0]) if abs(a[0]) < 0.9 else np.cross(a, [0, 1, 0])
        p /= np.linalg.norm(p)
        return 2 * np.outer(p, p) - np.eye(3)
    K = np.array([[0, -v[2], v[1]], [v[2], 0, -v[0]], [-v[1], v[0], 0]])
    return np.eye(3) + K + K @ K / (1 + c)


def rotvec(w):
    th = np.linalg.norm(w)
    if th < 1e-15:
        return np.eye(3)
    k = w / th
    K = np.array([[0, -k[2], k[1]], [k[2], 0, -k[0]], [-k[1], k[0], 0]])
    return np.eye(3) + np.sin(th) * K + (1 - np.cos(th)) * K @ K


def rot_angle(R):
    return float(np.arccos(np.clip((np.trace(R) - 1) / 2, -1, 1)))


FACE_ORDER = {"cub": 4, "oct": 3, "dod": 5, "ico": 3}


class Pair:
    """Piece K (face normal n0 turned to e_x) and container C (corner A of the fundamental triangle turned to e_x)."""

    def __init__(self, piece, cont):
        self.name = f"{piece}in{cont}"
        self.piece, self.cont = piece, cont
        VK = solid_vertices(piece)
        NK, self.d = face_normals(VK)
        self.VK = VK @ rot_to(NK[0], np.array([1.0, 0, 0])).T          # face n0 → e_x
        self.rhoK = float(np.linalg.norm(self.VK[0]))
        self.m = FACE_ORDER[piece]
        VC = solid_vertices(cont)
        NC, self.rC = face_normals(VC)
        # fundamental triangle of the full symmetry group of the container: 3 rotation axes (A of maximal order, adjacent 2-fold axis B, remaining adjacent axis C)
        GC = sym_group(VC)
        A, B, Cc = self._triangle(VC, NC)
        F = self._frame(A, B)                                          # A → e_x, B → xy plane (y > 0)
        if (F @ Cc)[2] < 0:                                            # make z of C positive (the container is mirror-symmetric, so the orientation may be flipped)
            F = np.diag([1.0, 1.0, -1.0]) @ F
        self.VC = VC @ F.T; self.NC = NC @ F.T
        self.A, self.B, self.C = F @ A, F @ B, F @ Cc
        self.GC = [F @ g @ F.T for g in GC]
        self.GK = sym_group(self.VK)
        self.StabK = [k for k in self.GK if np.abs(k[:, 0] - np.array([1.0, 0, 0])).max() < 1e-9]
        assert len(self.StabK) == 2 * self.m, (len(self.StabK), self.m)
        # inward normals of the mirror planes of the triangle
        tri = [self.A, self.B, self.C]
        self.M = []
        for i in range(3):
            a, b, c = tri[i], tri[(i + 1) % 3], tri[(i + 2) % 3]
            n = np.cross(a, b); n /= np.linalg.norm(n)
            self.M.append(n if n @ c > 0 else -n)
        self.M = np.array(self.M)
        # mirror-plane check (the reflection in normal n is in the group) and triangle area = 4π/|G|
        for n in self.M:
            Rf = np.eye(3) - 2 * np.outer(n, n)
            assert any(np.abs(Rf - g).max() < 1e-8 for g in self.GC), "a triangle edge is not a mirror plane"
        ang = lambda p, q, r: np.arccos(np.clip((np.cross(p, q) / np.linalg.norm(np.cross(p, q))) @ (np.cross(p, r) / np.linalg.norm(np.cross(p, r))), -1, 1))
        area = ang(self.A, self.B, self.C) + ang(self.B, self.C, self.A) + ang(self.C, self.A, self.B) - np.pi
        assert abs(area - 4 * np.pi / len(self.GC)) < 1e-8, (area, 4 * np.pi / len(self.GC))
        # P = container with inradius 1 (used for the support function of the t range (S − d)·P)
        self.VP = self.VC / self.rC
        self.rhoP = float(np.linalg.norm(self.VP[0]))
        # symmetry pairs (g, k): det g = det k
        self.pairs = [(g, k) for g in self.GC for k in self.StabK if np.linalg.det(g) * np.linalg.det(k) > 0]

    @staticmethod
    def _triangle(VC, NC):
        unit = lambda v: v / np.linalg.norm(v)
        verts = [unit(v) for v in VC]; faces = [unit(n) for n in NC]
        nv, nf = len(VC), len(NC)
        # axis of largest order to A: face for the cube, vertex for the octahedron, face for the dodecahedron, vertex for the icosahedron
        big, small = (faces, verts) if nf < nv else (verts, faces)
        A = big[0]
        Cc = max(small, key=lambda v: v @ A)
        # 2-fold axis: midpoint of the two "big" axes adjacent to A, the one closer to Cc
        nb = sorted([v for v in big if not np.allclose(v, A)], key=lambda v: -(v @ A))
        top = [v for v in nb if abs(v @ A - nb[0] @ A) < 1e-9]
        if abs(nb[0] @ A) < 1e-9:      # cube/octahedron: adjacent axes are orthogonal; the 2-fold axis is the midpoint of A and the adjacent axis
            pass
        B = max((unit(A + v) for v in top), key=lambda b: b @ Cc)
        return A, B, Cc

    @staticmethod
    def _frame(A, B):
        ex = A / np.linalg.norm(A)
        ey = B - (B @ ex) * ex; ey /= np.linalg.norm(ey)
        ez = np.cross(ex, ey)
        return np.array([ex, ey, ez])

    # ----- LP -----
    def lp(self, R, duals=False):
        """φ(R) (in units of s). With duals=True returns (s, λ_f, μ, t, index of the maximising vertex for each face)."""
        H = self.NC @ R @ self.VK.T                    # (face, vertex)
        h = H.max(axis=1)
        nf = len(self.NC)
        A = np.zeros((nf + 1, 4)); b = np.zeros(nf + 1)
        A[:nf, :3] = self.NC; A[:nf, 3] = -self.rC; b[:nf] = -h
        A[nf, :3] = R[:, 0]; b[nf] = -self.d
        r = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs",
                    options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10))
        if r.status != 0:
            return (np.inf, None, None, None, None) if duals else np.inf
        if not duals:
            return r.fun
        mrg = -r.ineqlin.marginals
        return r.fun, mrg[:nf], mrg[nf], r.x[:3], H.argmax(axis=1)

    # ----- coordinates (D16 §3.1): q = (1, τ, −b + γτ, γ + bτ), u = R e_x = (1−b²−γ², 2γ, 2b)/(1+b²+γ²) -----
    @staticmethod
    def rot_bgt(b, g, t):
        w, x, y, z = 1.0, t, -b + g * t, g + b * t
        n = w * w + x * x + y * y + z * z
        return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)],
                         [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                         [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]) / n

    def reduce(self, R):
        """Move R by symmetries so that u = R e_x lies in the fundamental triangle and the spin in (−π/m, π/m]. Returns (b, γ, τ) and the moved R."""
        best = None
        for g, k in self.pairs:
            R2 = g @ R @ k
            u = R2[:, 0]
            if (self.M @ u).min() < -1e-9 or u[0] < -0.999999:
                continue
            b = u[2] / (1 + u[0]); gm = u[1] / (1 + u[0])
            Rp = self.rot_bgt(b, gm, 0.0)
            Rx = Rp.T @ R2
            psi = np.arctan2(Rx[2, 1], Rx[1, 1])
            if -np.pi / self.m - 1e-9 <= psi <= np.pi / self.m + 1e-9:
                cand = (b, gm, np.tan(psi / 2))
                if best is None or cand > best[0]:
                    best = (cand, R2)
        return best


PAIRS13 = ["octinoct", "icoinico", "dodindod", "dodinico", "icoindod", "cubindod", "cubinico",
           "octindod", "octinico", "dodincub", "dodinoct", "icoincub", "icoinoct"]


def make(name):
    return Pair(name[:3], name[5:])
