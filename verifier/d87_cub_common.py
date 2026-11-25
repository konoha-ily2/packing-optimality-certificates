# -*- coding: utf-8 -*-
"""D48 (L4″): shared parts for the two cases with the cube container. At present only the regular octahedron (octincub_n09).

Design: plan/D48_cube_n09_cone.md, sections 2.5 and 3. Written by Claude (Opus 5.5). The arguments and code were written by Claude and have no third-party review; this is not a formal proof.

Coordinates (the piece scaled by √2, everything rational):
  piece K̂ = {|x|+|y|+|z| ≤ 1} (vertices ±e_k), container [−S, S]³, S = ŝ₀/2 = 4/3, octant Q = {t ≥ 0}.
  Placement X = R K̂ + t. The columns of R are r_k (the vertices are t ± r_k).
  h_X(n) = max_k |n·r_k| + n·t, e_i(R) = max_k |R[i,k]| (how far the piece reaches towards face i of the container).
  G(n, R) := min_t h_X(n) = max_k |n·r_k| + Σ_i (n_i)₋·(e_i(R) − S)   (the formula of section 2.5)

Exact computations use fractions.Fraction, floating-point computations use numpy. To swap the piece, replace only
the three PIECE_* parts (vertices, h_K, e_i) (for stage I0 of icoincub).
"""
from fractions import Fraction as Fr
import itertools
import numpy as np

S_HALF = Fr(4, 3)          # ŝ₀/2
S0 = 2 * S_HALF            # ŝ₀ = 8/3 (4√2/3 in the original units)
SCALE_TO_EDGE1 = 2 ** -0.5  # to the units where the piece has edge 1 (lengths ×1/√2)

W_Q = (Fr(1, 3), Fr(1, 3), Fr(1, 3))
W_A = (Fr(5, 18), Fr(5, 18), Fr(2, 9))   # the cones (+, +, −) and (−, −, +). The entry at the negative coordinate is 2/9


# ---------------------------------------------------------------- exact parts
def quat_rot(q):
    """Rational rotation matrix (list of rows) from an integer (or rational) quaternion q = (w, x, y, z)."""
    w, x, y, z = (Fr(c) for c in q)
    N = w * w + x * x + y * y + z * z
    return [
        [(w*w + x*x - y*y - z*z) / N, 2*(x*y - w*z) / N, 2*(x*z + w*y) / N],
        [2*(x*y + w*z) / N, (w*w - x*x + y*y - z*z) / N, 2*(y*z - w*x) / N],
        [2*(x*z - w*y) / N, 2*(y*z + w*x) / N, (w*w - x*x - y*y + z*z) / N],
    ]


def cols(R):
    return [tuple(R[i][k] for i in range(3)) for k in range(3)]


def from_cols(c1, c2, c3):
    return [[c1[i], c2[i], c3[i]] for i in range(3)]


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def cross(a, b):
    return (a[1]*b[2] - a[2]*b[1], a[2]*b[0] - a[0]*b[2], a[0]*b[1] - a[1]*b[0])


def piece_vertices(R, t=(0, 0, 0)):
    out = []
    for r in cols(R):
        out.append(tuple(t[i] + r[i] for i in range(3)))
        out.append(tuple(t[i] - r[i] for i in range(3)))
    return out


def hK(R, n):
    return max(abs(dot(n, r)) for r in cols(R))


def e_axis(R, i):
    return max(abs(R[i][k]) for k in range(3))


def G_formula(n, R, S=S_HALF):
    return hK(R, n) + sum(max(-n[i], 0) * (e_axis(R, i) - S) for i in range(3))


def G_lp(n, R, S=S_HALF):
    """The LP in t by enumerating vertices: the feasible set of t is the box "all vertices lie in the container" and t ≥ 0.
    min_t max_v n·(v + t) is taken over the 8 corners of the box (the objective is convex in t and the constraint set is a box, so the corners suffice)."""
    V = piece_vertices(R)
    lo = [max([Fr(0)] + [-S - v[i] for v in V]) for i in range(3)]
    hi = [min(S - v[i] for v in V) for i in range(3)]
    assert all(l <= h for l, h in zip(lo, hi)), "R cannot be placed (should not happen in the cube)"
    best = None
    for corner in itertools.product(*[(lo[i], hi[i]) for i in range(3)]):
        val = max(dot(n, tuple(v[i] + corner[i] for i in range(3))) for v in V)
        best = val if best is None or val < best else best
    return best


# ---------------------------------------------------------------- floating-point parts
def np_quat_batch(Q):
    """Array of quaternions (m, 4) → rotation matrices (m, 3, 3)."""
    Q = Q / np.linalg.norm(Q, axis=1, keepdims=True)
    w, x, y, z = Q.T
    R = np.empty((len(Q), 3, 3))
    R[:, 0, 0] = w*w + x*x - y*y - z*z
    R[:, 0, 1] = 2*(x*y - w*z)
    R[:, 0, 2] = 2*(x*z + w*y)
    R[:, 1, 0] = 2*(x*y + w*z)
    R[:, 1, 1] = w*w - x*x + y*y - z*z
    R[:, 1, 2] = 2*(y*z - w*x)
    R[:, 2, 0] = 2*(x*z - w*y)
    R[:, 2, 1] = 2*(y*z + w*x)
    R[:, 2, 2] = w*w - x*x - y*y + z*z
    return R


def np_G_batch(n, R, S=4.0 / 3.0):
    """n (3,), R (m, 3, 3) → G (m,)."""
    top = np.abs(np.einsum('i,mik->mk', n, R)).max(axis=1)
    e = np.abs(R).max(axis=2)  # (m, 3)
    neg = np.maximum(-n, 0.0)
    return top + (e - S) @ neg


def np_G(n, R, S=4.0 / 3.0):
    return float(np_G_batch(n, R[None], S)[0])


def rot_to_quat(R):
    R = np.asarray(R, float)
    tr = np.trace(R)
    if tr > 0:
        s = np.sqrt(tr + 1) * 2
        return np.array([s / 4, (R[2, 1] - R[1, 2]) / s, (R[0, 2] - R[2, 0]) / s, (R[1, 0] - R[0, 1]) / s])
    i = int(np.argmax(np.diag(R)))
    j, k = (i + 1) % 3, (i + 2) % 3
    s = np.sqrt(1 + R[i, i] - R[j, j] - R[k, k]) * 2
    q = np.empty(4)
    q[0] = (R[k, j] - R[j, k]) / s
    q[1 + i] = s / 4
    q[1 + j] = (R[j, i] + R[i, j]) / s
    q[1 + k] = (R[k, i] + R[i, k]) / s
    return q


def expm_so3(w):
    w = np.asarray(w, float)
    th = np.linalg.norm(w)
    K = np.array([[0, -w[2], w[1]], [w[2], 0, -w[0]], [-w[1], w[0], 0]])
    if th < 1e-14:
        return np.eye(3) + K
    return np.eye(3) + np.sin(th) / th * K + (1 - np.cos(th)) / th**2 * (K @ K)


def axis_rot(axis, ang):
    a = np.asarray(axis, float)
    return expm_so3(a / np.linalg.norm(a) * ang)


# ---------------------------------------------------------------- orientations of the record (rational)
R_STAR = from_cols((Fr(2, 3), Fr(2, 3), Fr(-1, 3)), (Fr(2, 3), Fr(-1, 3), Fr(2, 3)), (Fr(-1, 3), Fr(2, 3), Fr(2, 3)))
R_III = from_cols((Fr(2, 3), Fr(2, 3), Fr(1, 3)), (Fr(2, 3), Fr(-1, 3), Fr(-2, 3)), (Fr(-1, 3), Fr(2, 3), Fr(-2, 3)))
C_HAT = Fr(2, 3)  # size of the coordinates of the centroid of a corner piece


def record_config():
    """The 9 pieces of the record: the piece at the origin (R = I) + 8 corner pieces (centroids (±2/3)³, orientations D R* D)."""
    I = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    out = [("origin", I, (Fr(0),) * 3)]
    for s in itertools.product((1, -1), repeat=3):
        R = [[s[i] * R_STAR[i][j] * s[j] for j in range(3)] for i in range(3)]
        out.append(("corner%+d%+d%+d" % s, R, tuple(s[i] * C_HAT for i in range(3))))
    return out
