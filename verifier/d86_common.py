# -*- coding: utf-8 -*-
"""D47 (the 2-cell pigeonhole for tetintet_n03, L4′): common parts: coordinates, formulas, candidates and constants in one place.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
The existing d28_*, d31_*, d37_*, d40_* are only read (not even imported here).

Coordinates as in D47 section 1: container C = {b_f·x ≤ 1}, piece K = {b_f·x ≤ 1/2}, vertices v_i = −b_i/2, placement X = RK + t.
  b_0 = (−1,−1,−1), b_1 = (−1,1,1), b_2 = (1,−1,1), b_3 = (1,1,−1).
  H_f(R) = max_i b_f·Rv_i, corner cell A_0 = {b_0·t ≤ −k}, middle M = {b_f·t ≥ −k ∀f}.
Rotations are R = M(q)/|q|², q = (w, a, b, c) (the same formula as d37_tet_n05_common.Mq).
"""
import itertools, math
from fractions import Fraction as Fr
import numpy as np

# ---------- constants (fixed in stage 0; change them only here) ----------
K_DEF = Fr(1)          # threshold k of the cells
THETA = Fr(1, 2)       # η = (1−θ)h_K + θ h_{K∩M}
BETA = 1 - THETA / 2   # coefficient of κ_M around the corner (D47 3.2)
U_J = Fr(1, 8)         # width in u of the band J
R_J = Fr(1, 16)        # transverse width (p1, p2) of the band J
R_N = Fr(1, 16)        # band outside the edge of Δ_0 (h ≥ −r_n)

# ---------- data ----------
B = ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))
BFr = tuple(tuple(Fr(x) for x in b) for b in B)
VFr = tuple(tuple(Fr(-x, 2) for x in b) for b in B)
BF = np.array(B, float)
VF = -BF / 2
B1U = np.array(B[1], float) / math.sqrt(3)
# rational vectors orthogonal to b_1 (the transverse directions of the band J). e′ ⟂ e″ ⟂ b_1
E1 = (0, 1, -1)
E2 = (2, 1, 1)


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def Mq(w, a, b, c):
    return [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)],
            [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
            [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]


def rot_fr(q):
    q = [Fr(t) for t in q]
    Q = sum(t * t for t in q)
    return tuple(tuple(e / Q for e in row) for row in Mq(*q))


def rot_f(q):
    q = [float(t) for t in q]
    return np.array(Mq(*q), float) / sum(t * t for t in q)


def matvec(R, v):
    return tuple(sum(R[i][j] * v[j] for j in range(3)) for i in range(3))


def q_J(u, p1, p2):
    """Quaternion of the band J: q = (1, u·b_1 + p1·e′ + p2·e″)."""
    vec = tuple(u * B[1][i] + p1 * E1[i] + p2 * E2[i] for i in range(3))
    return (1,) + vec


# ---------- support functions and κ (exact) ----------
def hK(n):
    return max(dot(n, v) for v in VFr)


def kappaA(n):
    p = [dot(n, v) for v in VFr]
    return max(p) + min(p)


def hKM(n, k=K_DEF):
    """Support function of K ∩ M. t = ¼Σβ_f b_f, −k ≤ β_f ≤ 1/2, Σβ_f = 0, n·t = Σ γ_f β_f (γ_f = n·b_f/4)."""
    g = [Fr(dot(n, b), 4) for b in B]
    order = sorted(range(4), key=lambda f: -g[f])
    beta = [-k] * 4; need = 4 * k
    for f in order:
        d = min(Fr(1, 2) + k, need); beta[f] += d; need -= d
    return sum(gi * bi for gi, bi in zip(g, beta))


def kappaM(n, k=K_DEF, th=THETA):
    def eta(m):
        return (1 - th) * hK(m) + th * hKM(m, k)
    return eta(n) - eta(tuple(-x for x in n))


def H_all(R):
    RV = [matvec(R, v) for v in VFr]
    return [max(dot(b, rv) for rv in RV) for b in BFr], RV


# ---------- the LP in t (exact, enumeration of vertices; independent of the formulas) ----------
def _solve3(A, c):
    """3×3 linear system (Fraction, Cramer). None if singular."""
    def det(M):
        return (M[0][0]*(M[1][1]*M[2][2]-M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2]-M[1][2]*M[2][0])
                + M[0][2]*(M[1][0]*M[2][1]-M[1][1]*M[2][0]))
    D = det(A)
    if D == 0:
        return None
    out = []
    for j in range(3):
        Mj = [list(r) for r in A]
        for i in range(3):
            Mj[i][j] = c[i]
        out.append(det(Mj) / D)
    return tuple(out)


def lp_min(n, rows, rhs):
    """min n·t s.t. rows·t ≤ rhs (a bounded polyhedron is assumed). None if empty. Enumeration of vertices."""
    best = None
    for tri in itertools.combinations(range(len(rows)), 3):
        t = _solve3([rows[i] for i in tri], [rhs[i] for i in tri])
        if t is None:
            continue
        if all(dot(r, t) <= c for r, c in zip(rows, rhs)):
            v = dot(n, t)
            if best is None or v < best:
                best = v
    return best


def psiA_exact(n, R, k=K_DEF):
    """Minimum of h_X(n) over pieces with centroid in A_0 that fit (R fixed). None if none fits."""
    H, RV = H_all(R)
    rows = list(BFr) + [BFr[0]]
    rhs = [1 - h for h in H] + [-k]
    m = lp_min(n, rows, rhs)
    return None if m is None else max(dot(n, rv) for rv in RV) + m


def psiM_exact(n, R, k=K_DEF):
    H, RV = H_all(R)
    rows = list(BFr) + [tuple(-x for x in b) for b in BFr]
    rhs = [1 - h for h in H] + [k] * 4
    m = lp_min(n, rows, rhs)
    return None if m is None else max(dot(n, rv) for rv in RV) + m


# ---------- formulas (D47 4.1, 3.1, 3.2) ----------
def Ftil(n, R, k=K_DEF):
    """F̃(n, R) = h_K(Rᵀn) + ¼Σ(m̃ − n·b_f)H′_f − m̃, H′_0 = 1 + k. Š = H_1+H_2+H_3 − (3 − k)."""
    H, RV = H_all(R)
    Hp = [1 + k] + H[1:]
    nb = [dot(n, b) for b in BFr]; m = max(nb)
    val = max(dot(n, rv) for rv in RV) + sum((m - x) * h for x, h in zip(nb, Hp)) / 4 - m
    return val, sum(H[1:]) - (3 - k)


def n_of_hk(h, kp):
    """Coordinates of Ch: n = (1 − h − k′, −1 + k′, −1)."""
    return (1 - h - kp, -1 + kp, Fr(-1))


def GA_formula(h, kp, R):
    """The formula of D47 4.1 (k = 1). H_f − ½ and [h_K(Rᵀn) − n·v_1]."""
    n = n_of_hk(h, kp)
    H, RV = H_all(R)
    hp, hm = max(h, Fr(0)), max(-h, Fr(0))
    top = max(dot(n, rv) for rv in RV) - dot(n, VFr[1])
    return (Fr(3, 4) * hm + top + (2 - kp + hm) / 2 * (H[1] - Fr(1, 2))
            + (hp + kp) / 2 * (H[2] - Fr(1, 2)) + hp / 2 * (H[3] - Fr(1, 2)))


def Gtau(n, R, tau, k=K_DEF):
    """D47 3.1: h_K(Rᵀn) + Σ(τ + n·b_f/4)₋(H_f − 1) − kΣ(τ + n·b_f/4)₊. Lower bound by weak duality."""
    H, RV = H_all(R)
    s = max(dot(n, rv) for rv in RV)
    for f in range(4):
        x = tau + Fr(dot(n, B[f]), 4)
        if x < 0:
            s += (-x) * (H[f] - 1)
        else:
            s -= k * x
    return s


def GM_formula(x, y, R, k=K_DEF, beta=BETA):
    """D47 3.2: n = (x, y, 1), j = 1, μ = 0 (τ = −n·b_1/4), minus κ_M ≈ β·y."""
    n = (x, y, Fr(1))
    H, RV = H_all(R)
    return (max(dot(n, rv) for rv in RV) + (1 + y) / 2 * (H[0] - 1) + (1 - x) / 2 * (H[3] - 1)
            - k * (x - y) / 2 - beta * y)


# ---------- candidates of the band J (D47 4.3) ----------
# candidate c = (i1, i2, i3): the vertex of H_f (a vertex i ≠ f not on the face f). The top is fixed at v_1.
CANDS_J = [c for c in itertools.product((0, 2, 3), (0, 1, 3), (0, 1, 2))]


def Gc_float(h, kp, q, c):
    """|q|²·G_c (floating point; the max fixed by the candidate c)."""
    n = np.array([1 - h - kp, -1 + kp, -1.0])
    M = np.array(Mq(*[float(t) for t in q]), float)
    Q = float(sum(float(t) ** 2 for t in q))
    hp, hm = max(h, 0.0), max(-h, 0.0)
    RV = (M @ VF.T).T            # |q|²·Rv_i
    w = [(2 - kp + hm) / 2, (hp + kp) / 2, hp / 2]
    s = 0.75 * hm * Q + n @ RV[1] - Q * (n @ VF[1])
    for f, i, wf in zip((1, 2, 3), c, w):
        s += wf * (BF[f] @ RV[i] - 0.5 * Q)
    return s
