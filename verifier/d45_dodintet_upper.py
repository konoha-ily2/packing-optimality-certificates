# D45 upper bound (dodintet_n02): piece 0 rotated by a rational quaternion q̂₀ and piece 1, the T_d image g·R̂₀·k of it, are put into the container with exact numbers of Q(√5)
# and separated by a plane, which gives s_up (the counterpart of d40_upper.py of D40; the right-hand side "s̄ ≤ s* ≤ s_up" of route Y).
# 2026-11-13, written by Claude (Opus 5.5). Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# Numbers are elements a + b√5 of Q(√5) (a, b rational). The container is the regular tetrahedron of unit edge scaled by s: b_f·x ≤ u (u := s/(2√2), b_f in the order of D28 2.4).
# s_up = 2√2·u_up (u_up ∈ Q(√5)). √2 only comes outside u, so the claim is of the form: check exactly that "for u ≤ u_up the 2 pieces fit".
# Procedure: (1) R̂₀ = M(q̂)/|q̂|² (q̂ is the quaternion of the record re-solved to 40 digits and rounded to denominator 2^70), R̂₁ = g·R̂₀·k (both exact orthogonal matrices),
# (2) piece i is pressed against the 3 walls f it touched in the record: b_f·t_i = u − H_f(R̂_i) (3 linear equations, t_i is linear in u),
# (3) with the normal n̂ = (edge {3,15} of piece 0) × (edge {4,16} of piece 1) (exact), gap(u) := min_w n̂·(R̂₁w + t₁) − max_v n̂·(R̂₀v + t₀) is linear in u
#     (the top and bottom vertices are determined near that u; all vertices are re-checked below). Take u_up with gap(u_up) = 0.
# (4) At u = u_up, check exactly the containment of all 40 vertices × 4 walls and the separation by the plane n̂·x = c (c = top of piece 0).
# Usage: python -X utf8 d45_dodintet_upper.py [--write] (by default it only reads the json and checks that q̂ and u_up agree with the json; --write rewrites the json)
import sys, os, json, itertools
from fractions import Fraction as Fr
import mpmath as mp

HERE = os.path.dirname(os.path.abspath(__file__))
WRITE = "--write" in sys.argv


class Q5:
    """a + b√5 (a, b are Fractions)."""
    __slots__ = ("a", "b")

    def __init__(s, a=0, b=0):
        s.a = Fr(a); s.b = Fr(b)

    @staticmethod
    def of(o): return o if isinstance(o, Q5) else Q5(o, 0)
    def __add__(s, o): o = Q5.of(o); return Q5(s.a + o.a, s.b + o.b)
    __radd__ = __add__
    def __sub__(s, o): o = Q5.of(o); return Q5(s.a - o.a, s.b - o.b)
    def __rsub__(s, o): return Q5.of(o) - s
    def __neg__(s): return Q5(-s.a, -s.b)
    def __mul__(s, o): o = Q5.of(o); return Q5(s.a * o.a + 5 * s.b * o.b, s.a * o.b + s.b * o.a)
    __rmul__ = __mul__

    def inv(s):
        d = s.a * s.a - 5 * s.b * s.b; assert d != 0; return Q5(s.a / d, -s.b / d)

    def __truediv__(s, o): return s * Q5.of(o).inv()

    def sign(s):
        """Exact sign."""
        a, b = s.a, s.b
        if b == 0: return (a > 0) - (a < 0)
        if a == 0: return (b > 0) - (b < 0)
        if (a > 0) == (b > 0): return 1 if a > 0 else -1
        # signs differ: compare |a| and |b|√5
        d = a * a - 5 * b * b
        if d == 0: return 0
        return (1 if a > 0 else -1) if d > 0 else (1 if b > 0 else -1)

    def __float__(s): return float(s.a) + float(s.b) * 5 ** .5

    def mpf(s): return mp.mpf(s.a.numerator) / s.a.denominator + mp.mpf(s.b.numerator) / s.b.denominator * mp.sqrt(5)


ZERO = Q5(0); ONE = Q5(1)
PHI = Q5(Fr(1, 2), Fr(1, 2))


def cyc(v): return [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]


V = [[g[0] * PHI * Fr(1, 2), g[1] * PHI * Fr(1, 2), g[2] * PHI * Fr(1, 2)] for g in itertools.product((1, -1), repeat=3)]
for s1 in (1, -1):
    for s2 in (1, -1):
        for w in cyc((ZERO, Q5(Fr(s1, 2)), s2 * PHI * PHI * Fr(1, 2))):
            V.append(list(w))


def _check_piece():
    """V is a regular dodecahedron of unit edge: 20 vertices, the shortest distance is exactly 1 (exact), 3 edges at each vertex, centrally symmetric."""
    assert len(V) == 20
    d2 = lambda a, b: sum(((x - y) * (x - y) for x, y in zip(a, b)), ZERO)
    cnt = [0] * 20
    for i in range(20):
        for j in range(i + 1, 20):
            e = d2(V[i], V[j]) - 1
            assert e.sign() >= 0, "there is a pair of vertices at distance shorter than 1"
            if e.sign() == 0: cnt[i] += 1; cnt[j] += 1
    assert all(c == 3 for c in cnt), "there is a vertex whose number of edges is not 3"
    for v in V:
        assert any(all((x + y).sign() == 0 for x, y in zip(v, w)) for w in V), "not centrally symmetric"


_check_piece()
BN = [(-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1)]


def dot(u, v): return sum((Q5.of(x) * y for x, y in zip(u, v)), ZERO)
def mv(M, v): return [dot(M[i], v) for i in range(3)]
def mm(X, Y): return [[sum((Q5.of(X[i][l]) * Y[l][j] for l in range(3)), ZERO) for j in range(3)] for i in range(3)]
def sub(u, v): return [x - y for x, y in zip(u, v)]
def cross(u, v): return [u[1]*v[2] - u[2]*v[1], u[2]*v[0] - u[0]*v[2], u[0]*v[1] - u[1]*v[0]]
def solve3(A, y):
    M = [list(A[i]) + [y[i]] for i in range(3)]
    for col in range(3):
        piv = [i for i in range(col, 3) if M[i][col].sign() != 0][0]
        M[col], M[piv] = M[piv], M[col]
        iv = M[col][col].inv(); M[col] = [x * iv for x in M[col]]
        for i in range(3):
            if i != col and M[i][col].sign() != 0:
                f = M[i][col]; M[i] = [x - f * z for x, z in zip(M[i], M[col])]
    return [M[i][3] for i in range(3)]


def qhat():
    """Re-solve the quaternion of the record to 40 digits by the contact equations (face on face 2, edge on wall 0), and round to denominator 2^70."""
    mp.mp.dps = 50
    rec = json.load(open(os.path.join(".", "dodintet_n02.json"), encoding="utf-8"))
    q0 = [mp.mpf(x) for x in rec["pieces"][0][3:]]; q0 = [x / q0[0] for x in q0]
    ph = (1 + mp.sqrt(5)) / 2
    Vm = [[float(0)] * 3 for _ in range(20)]
    Vm = [[x.mpf() for x in v] for v in V]
    A = [[mp.mpf(x) for x in b] for b in BN]

    def Mq(w, a, b, c):
        n = w*w + a*a + b*b + c*c
        return [[(w*w+a*a-b*b-c*c)/n, 2*(a*b-w*c)/n, 2*(a*c+w*b)/n], [2*(a*b+w*c)/n, (w*w-a*a+b*b-c*c)/n, 2*(b*c-w*a)/n],
                [2*(a*c-w*b)/n, 2*(b*c+w*a)/n, (w*w-a*a-b*b+c*c)/n]]

    def mvm(M, v): return [sum(M[i][j] * v[j] for j in range(3)) for i in range(3)]

    def eqs(a, b, c):
        M = Mq(1, a, b, c)
        d = lambda f, i, j: sum(A[f][k] * (mvm(M, Vm[i])[k] - mvm(M, Vm[j])[k]) for k in range(3))
        return [d(2, 5, 11), d(2, 5, 16), d(0, 12, 18)]
    sol = mp.findroot(eqs, q0[1:])
    q = [mp.mpf(1)] + list(sol)
    nq = mp.sqrt(sum(x * x for x in q)); q = [x / nq for x in q]
    D = 2 ** 70
    return [Fr(int(mp.nint(x * D)), D) for x in q]


def rot(q):
    w, a, b, c = q; n = w*w + a*a + b*b + c*c
    M = [[w*w + a*a - b*b - c*c, 2*(a*b - w*c), 2*(a*c + w*b)], [2*(a*b + w*c), w*w - a*a + b*b - c*c, 2*(b*c - w*a)],
         [2*(a*c - w*b), 2*(b*c + w*a), w*w - a*a - b*b + c*c]]
    return [[Q5(x / n) for x in row] for row in M]


def main():
    q = qhat()
    old = json.load(open(os.path.join(".", "d45_dodintet_upper.json"), encoding="utf-8")) if os.path.exists(os.path.join(".", "d45_dodintet_upper.json")) else None
    if old is not None and not WRITE:     # a verification run does not write: q̂ must agree with the fixed value in the json, otherwise stop
        assert old["q_hat"] == [str(x) for x in q], "q̂ differs from d45_dodintet_upper.json (rewriting with --write makes replay stop at the check of the head of the record)"
    R0 = rot(q)
    g = [[Q5(x) for x in row] for row in [[0, 0, -1], [0, -1, 0], [1, 0, 0]]]
    h = Q5(Fr(1, 2)); P = PHI * Fr(1, 2); Qm = (PHI - 1) * Fr(1, 2)
    k = [[-P, Qm, -h], [Qm, -h, -P], [h, P, -Qm]]
    R1 = mm(mm(g, R0), k)
    for R in (R0, R1):     # exactly orthogonal, determinant +1
        RtR = mm([[R[j][i] for j in range(3)] for i in range(3)], R)
        assert all((RtR[i][j] - (1 if i == j else 0)).sign() == 0 for i in range(3) for j in range(3))
    walls = [(2, 0, 3), (1, 3, 2)]
    RS = [R0, R1]
    W = [[mv(R, v) for v in V] for R in RS]
    # t_i = t_i0 + u·t_i1: b_f·t = u − H_f
    T = []
    for i in range(2):
        A = [[Q5(x) for x in BN[f]] for f in walls[i]]
        H = []
        for f in walls[i]:
            vals = [dot(BN[f], w) for w in W[i]]
            m = vals[0]
            for x in vals[1:]:
                if (x - m).sign() > 0: m = x
            H.append(m)
        t0 = solve3(A, [-x for x in H]); t1 = solve3(A, [ONE] * 3)
        T.append((t0, t1))
    nh = cross(sub(W[0][3], W[0][15]), sub(W[1][4], W[1][16]))
    if float(dot(nh, [Q5(x) for x in (-0.27, 0.79, 0.54)])) < 0: nh = [-x for x in nh]
    # gap(u) = min_w n·(R1 w + t1(u)) − max_v n·(R0 v + t0(u)): choose the top and bottom vertices numerically and make it 0 by a linear equation in u
    top0 = max(range(20), key=lambda v: float(dot(nh, W[0][v])))
    bot1 = min(range(20), key=lambda v: float(dot(nh, W[1][v])))
    c0 = dot(nh, W[1][bot1]) + dot(nh, T[1][0]) - dot(nh, W[0][top0]) - dot(nh, T[0][0])
    c1 = dot(nh, T[1][1]) - dot(nh, T[0][1])
    u_up = -c0 / c1
    tt = [[a + u_up * b for a, b in zip(*T[i])] for i in range(2)]
    # (4) exact check
    nin = 0
    for i in range(2):
        for w in W[i]:
            x = [a + b for a, b in zip(w, tt[i])]
            for f in range(4):
                assert (u_up - dot(BN[f], x)).sign() >= 0, "does not fit in the container"
                nin += 1
    cpl = dot(nh, W[0][top0]) + dot(nh, tt[0])
    for w in W[0]:
        assert (cpl - dot(nh, [a + b for a, b in zip(w, tt[0])])).sign() >= 0, "piece 0 sticks out above the plane"
    for w in W[1]:
        assert (dot(nh, [a + b for a, b in zip(w, tt[1])]) - cpl).sign() >= 0, "piece 1 sticks out below the plane"
    mp.mp.dps = 60
    s_up = 2 * mp.sqrt(2) * u_up.mpf()
    S0 = mp.mpf("8.47778973610387924805914836176893831079684905892206588118012090921946198145097176112843668155972392286")
    out = dict(q_hat=[str(x) for x in q], u_up_a=str(u_up.a), u_up_b=str(u_up.b), s_up=mp.nstr(s_up, 40),
               s_up_minus_s0=mp.nstr(s_up - S0, 5), containment_checks=nin, separation_checks=40,
               u_up_den_digits=[len(str(u_up.a.denominator)), len(str(u_up.b.denominator))],
               note="s_up = 2√2·(u_up_a + u_up_b·√5)\u3002\u5305\u542b\u3068\u5206\u96e2\u306f Q(√5) \u3067\u6b63\u78ba\u306b\u78ba\u304b\u3081\u305f")
    if old is not None and not WRITE:
        for key in ("u_up_a", "u_up_b", "containment_checks", "separation_checks"):
            assert old[key] == out[key], f"{key} differs from the json"
    else:
        json.dump(out, open(os.path.join(".", "d45_dodintet_upper.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print("s_up =", mp.nstr(s_up, 30), " s_up − s0 =", mp.nstr(s_up - S0, 5), " containment", nin, "separation 40, all passed exactly")


if __name__ == "__main__":
    main()
