# D16 cubinoct_n02: shared part of the checker (2026-11-11, written by Claude; no third-party review)
#
# Problem (see docs/reduction_symmetric.md): an LP for each rotation R
#   φ(R) = min S  s.t.  σ·t + g_σ(R) ≤ S (σ ∈ {±1}³), u·t ≤ −½, u = R e1, g_σ(R) = ½ Σ_j |σ·R e_j|
# Rotation coordinates: q = (1, τ, −b + γτ, γ + bτ), R = R(q)/N, N = |q|² = (1+τ²)(1+b²+γ²).
# Domain (corrected): 0 ≤ b ≤ γ, b² + (γ+1)² ≤ 2, 0 ≤ τ ≤ 1 (the original τ ≤ √2−1 covers only half).
#
# Exactness conventions: polynomials have integer coefficients (python-flint fmpz_mpoly), box coordinates are integer multiples of 1/DEN, acceptance uses integers only.
# Floating point is used only for candidate LP multipliers, the choice of signs inside absolute values, and the split direction (none affects the correctness of an acceptance).
from fractions import Fraction as Fr
import itertools
import flint

SIGMAS = list(itertools.product([-1, 1], repeat=3))          # 8 sign vectors
CTX4 = flint.fmpz_mpoly_ctx.get(('b', 'g', 't', 'd'), 'lex')  # d is the homogenising variable
CTXS = flint.fmpz_mpoly_ctx.get(('s1', 's2', 's3'), 'lex')    # coordinates [−1,1]³ inside a box

# Local box L (b ≤ 1/16, γ ≤ 1/16, 3/8 ≤ τ ≤ 7/16). The far, local and check scripts all use the value defined here (single place)
L_BOX = (Fr(1, 16), Fr(1, 16), Fr(3, 8), Fr(7, 16))

KDEN = 44
DEN = 2 ** KDEN                  # denominator of box coordinates (much finer than the minimum box width 2^-40)


class CheckFailed(Exception):
    """Raised when a correctness precondition fails (assert is not used because python -O removes it)."""


def need(cond, msg):
    if not cond:
        raise CheckFailed(msg)


# ---------- polynomials (integer coefficients, degree ≤ 4 in b, g, t, homogenised to degree 4 with d) ----------
def _build():
    b, g, t, d = CTX4.gens()
    w = d * d; x = t * d; y = -b * d + g * t; z = g * d + b * t      # q homogenised with d (each component of degree 2)
    Rq = [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
          [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
          [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
    N = w*w + x*x + y*y + z*z
    need(N == (d*d + t*t) * (d*d + b*b + g*g), "factorisation of N")
    P = {}
    for s in SIGMAS:
        for j in range(3):
            P[(s, j)] = s[0]*Rq[0][j] + s[1]*Rq[1][j] + s[2]*Rq[2][j]
    U = [Rq[i][0] for i in range(3)]
    # rotation check: R(q)ᵀR(q) = N² I (homogenised identity)
    for i in range(3):
        for k in range(3):
            v = Rq[0][i]*Rq[0][k] + Rq[1][i]*Rq[1][k] + Rq[2][i]*Rq[2][k]
            need(v == (N*N if i == k else 0 * N), "orthogonality of R(q)")
    return Rq, N, P, U


RQ, NPOLY, PPOLY, UPOLY = _build()


def eval_rot_exact(b, g, t):
    """Exact R (3×3 of Fraction) for rational (b, γ, τ)."""
    w, x, y, z = Fr(1), Fr(t), -Fr(b) + Fr(g)*Fr(t), Fr(g) + Fr(b)*Fr(t)
    n = w*w + x*x + y*y + z*z
    R = [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
         [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
         [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
    return [[e / n for e in row] for row in R]


def gsig_exact(R, scale=Fr(1)):
    """g_σ(R) = scale·½Σ_j|σ·R e_j| (scale is the piece scale factor, used by the injected-error test m2)."""
    out = {}
    for s in SIGMAS:
        out[s] = scale * Fr(1, 2) * sum(abs(s[0]*R[0][j] + s[1]*R[1][j] + s[2]*R[2][j]) for j in range(3))
    return out


def phi_exact(R, scale=Fr(1)):
    """Exact rational φ(R): an LP with 4 variables and 9 constraints, solved by enumerating vertices (4 constraints tight)."""
    g = gsig_exact(R, scale)
    u = [R[0][0], R[1][0], R[2][0]]
    rows = [([Fr(s[0]), Fr(s[1]), Fr(s[2]), Fr(-1)], -g[s]) for s in SIGMAS]   # A x ≤ c, x = (t1,t2,t3,S)
    rows.append(([u[0], u[1], u[2], Fr(0)], -scale * Fr(1, 2)))
    best = None
    for idx in itertools.combinations(range(9), 4):
        A = [list(rows[i][0]) + [rows[i][1]] for i in idx]
        sol = _solve4(A)
        if sol is None:
            continue
        if all(sum(a*x for a, x in zip(r[0], sol)) <= r[1] for r in rows):
            if best is None or sol[3] < best[3]:
                best = sol
    need(best is not None, "no vertex of φ found")
    return best[3], best


def _solve4(A):
    M = [row[:] for row in A]
    n = 4
    for c in range(n):
        p = next((r for r in range(c, n) if M[r][c] != 0), None)
        if p is None:
            return None
        M[c], M[p] = M[p], M[c]
        for r in range(n):
            if r != c and M[r][c] != 0:
                f = M[r][c] / M[c][c]
                M[r] = [a - f*bb for a, bb in zip(M[r], M[c])]
    return [M[i][n] / M[i][i] for i in range(n)]


# ---------- rational enclosure of √2 and upper bound for S* ----------
def sqrt2_bounds(k=120):
    """lo < √2 < hi (rationals of width 2^-k) via the integer square root."""
    r = flint.fmpz(2 * 4**k).isqrt()
    lo, hi = Fr(int(r), 2**k), Fr(int(r) + 1, 2**k)
    need(lo*lo < 2 < hi*hi, "enclosure of √2")
    return lo, hi


S2LO, S2HI = sqrt2_bounds()
SSTAR_UP = 1 + S2HI / 2          # S̄ ≥ S* = 1 + √2/2 (checked as 2(S̄−1)² > 1)
need(2 * (SSTAR_UP - 1)**2 > 1 and SSTAR_UP > 1, "S̄ is an upper bound of S*")


def check_T1(T1, Sbar, scale=Fr(1)):
    """Exactly check T1 ≥ S̄ − scale·√3/2 (used as ‖t‖₁ ≤ S − scale·√3/2 < S̄ − scale·√3/2 ≤ T1).
    g_σ = scale·½‖Rᵀσ‖₁ ≥ scale·½‖Rᵀσ‖₂ = scale·√3/2; the constraint with σ = sign(t) gives ‖t‖₁ + g_σ ≤ S."""
    a = Sbar - T1
    need(a <= 0 or a * a <= Fr(3, 4) * scale * scale, f"T1 = {T1} is smaller than S̄ − √3/2")


# ---------- lower bound of a polynomial on a box (integers only) ----------
def shift(poly, C, W):
    """D^4·P(c + w·s) (c = C/DEN, w = W/DEN, s ∈ [−1,1]³) as an integer polynomial in s."""
    s1, s2, s3 = CTXS.gens()
    dd = CTXS.from_dict({(0, 0, 0): DEN})
    return poly.compose(C[0] + W[0]*s1, C[1] + W[1]*s2, C[2] + W[2]*s3, dd, ctx=CTXS)


def lower_bound(Q):
    """Integer lower bound of Q(s) on s ∈ [−1,1]³. Terms with all exponents even use [0,1]; all others use ±1."""
    lb = 0
    for mon, c in Q.terms():
        c = int(c)
        if mon == (0, 0, 0):
            lb += c
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, c)
        else:
            lb -= abs(c)
    return lb


def upper_bound(Q):
    return -lower_bound(-Q)
