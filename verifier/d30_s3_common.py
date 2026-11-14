# D30 stage 3: the problem octinico (two regular octahedra in a regular icosahedron) and the coordinates of the "tube". 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. The existing d16e_* and d30_* (stages 0-2) are not changed;
# C.load is wrapped again in the same way as d30_problems.install() (install()).
#
# Problem: the piece is the unit-edge regular octahedron ±(√2/2)e_k, piece face n0 = (1,1,1), D0 = √2/2. The container is the unit-edge regular icosahedron (same faces as cubinico),
#   face normals (±1,±1,±1) and cyclic(0, ±φ, ±(φ−1)), offset C0 = φ²/2: {n_f·x ≤ S}, S = (φ²/2)·s. The field is Q(√2, √5).
#   s* = 2√2/φ² = 3√2 − √10 (the thickness 4/√6 of two octahedra stacked face to face = the distance between opposite faces of the container), S* = C0·s* = √2.
#   In the standard orientation the piece face (1,1,1) is the separating face, and the opposite face (−1,−1,−1) lies on the container face f0 = (−1,−1,−1).
#   The minimum is an arc of spin(τ) (quaternion (1, τ(1,1,1))) about the axis n0 (D30 stage 0, F8). The standard orientation (τ = 0) is outside the arc;
#   the arc is rotation angle ψ ∈ [−0.7061, −0.6121] (τ ∈ [−0.2127, −0.1824], floating-point exploration). R* = spin(TAU0), TAU0 = −1/5 (inside the arc,
#   a rational matrix). For the piece rotated by R* the family is again p = τ n (τ = 0 is R*). φ(R*) = S* is checked by the exact substitution of stage 0.
#
# Tube coordinates (option 2 of D30 §3.2, by a linear change of the chart-0 coordinates): write the chart-0 p = (x, y, z) (quaternion (1, p)) as
#   p = τ·n + y1·e1 + y2·e2, n = (1,1,1), e1 = (1,−1,0), e2 = (1/2, 1/2, −1) (perpendicular to n, rational).
# The family is y = 0 (p = τ n is exactly the rotation about the axis n). Tube = {τ ∈ [τA, τB], |y1|, |y2| ≤ ρ0} (a prism in p space).
# Locally y = ρθ, θ runs over the boundary (4 sides) of the square, τ = τc + τw·a1 (a1 ∈ [−1,1]), a2 ∈ [−1,1] is the variable along the side, ρ ∈ [0, ρ0].
import itertools
from fractions import Fraction as Fr
import d30_problems
d30_problems.install()
import d16e_common as C
from d16e_common import QD, need

_PREV_LOAD = C.load

TAU0 = Fr(-1, 5)
NVEC = (Fr(1), Fr(1), Fr(1))
E1 = (Fr(1), Fr(-1), Fr(0))
E2 = (Fr(1, 2), Fr(1, 2), Fr(-1))


def load_s3(name):
    if name != "octinico":
        return _PREV_LOAD(name)
    C.set_field((2, 5))
    r2 = QD.sqrt(2); r5 = QD.sqrt(5)
    phi = (1 + r5) / 2
    octp = [tuple((r2 / 2 * sg if i == k else QD(0)) for i in range(3)) for k in range(3) for sg in (1, -1)]
    ico = [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), QD(Fr(a, 2)), b * phi / 2))]
    normals = [tuple(QD(x) for x in p) for p in itertools.product((1, -1), repeat=3)]
    normals += [w for a in (1, -1) for b in (1, -1) for w in C._cyc((QD(0), a * phi, b * (phi - 1)))]
    c0 = phi * phi / 2
    sstar_s = 3 * r2 - r2 * r5                      # 3√2 − √10
    need(c0 * sstar_s == r2, "S* = C0·s* = √2")
    rstar = C.rot_exact((1, TAU0, TAU0, TAU0))        # rotation about the axis n0 (a rational matrix), near the middle of the arc (d30_s3_scan)
    return C.Problem(name, (2, 5), octp, (QD(1), QD(1), QD(1)), r2 / 2, normals, c0, c0 * sstar_s, rstar, ico,
                     note="D30 stage 3 (octinico), s* = 3√2 − √10, S* = √2, R* = spin(−1/5) is one point on the family (arc)")


def install():
    if C.load is not load_s3:
        C.load = load_s3


def tube_p(tau, y1, y2):
    """Tube coordinates → chart-0 p (works with rationals, floats or sympy)."""
    return tuple(tau * NVEC[i] + y1 * E1[i] + y2 * E2[i] for i in range(3))


def tube_coords(p):
    """Chart-0 p → (τ, y1, y2) (exact, Fraction). Inverse of the basis [n e1 e2]."""
    M = [[NVEC[i], E1[i], E2[i]] for i in range(3)]
    # Cramer
    def det(A):
        return (A[0][0]*(A[1][1]*A[2][2] - A[1][2]*A[2][1]) - A[0][1]*(A[1][0]*A[2][2] - A[1][2]*A[2][0])
                + A[0][2]*(A[1][0]*A[2][1] - A[1][1]*A[2][0]))
    d = det(M)
    need(d != 0, "basis of the tube")
    out = []
    for c in range(3):
        A = [row[:] for row in M]
        for r in range(3):
            A[r][c] = Fr(p[r])
        out.append(det(A) / d)
    return tuple(out)
