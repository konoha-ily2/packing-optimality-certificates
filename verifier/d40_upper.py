# D40 route Y, the upper bound s_up: substitute a rational configuration exactly (stopped piece R̂, corner piece τ = diag(−1,1,−1), coordinates of D_n).
# 2026-11-13, written by Claude (Opus 5.5). The argument, the code and the tests were written by Claude; no third-party review; not a formal proof.
# In coordinates scaled by √2 the container is s·C̃ = {x : b_f·x ≤ s/2} and a piece has vertices Rṽ + t.
# For each rational n on the arc compute s(n) = 2[Φ̃(n, R̂) + Φ̃(−n, τ)] / (m̃(n) + m̃(−n)) (⇐ of T3 in D28 2.3, the form without square roots) and s₁,
# build the translations from the smallest s(n), and check with rationals "inside the container" and "separated by the plane n·x = c".
# The record is written to d40_upper.json in the current directory. Its keys are those of the original record, some of them in Japanese
# (written below with \u escapes): K_INSIDE "inside the container", K_SEP "separated by the separating plane",
# K_GAP "top end − bottom end", K_DEN "number of digits of the denominator", K_S0 "s_up − s0" (with the minus sign U+2212).
import json, os, sys
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d40_common as C

BS = C.BS
V = [[Fr(x, 2) for x in v] for v in C.VT]
K_INSIDE = "\u5bb9\u5668\u306b\u5165\u308b"
K_SEP = "\u5206\u3051\u308b\u5e73\u9762\u3067\u5206\u304b\u308c\u308b"
K_GAP = "\u4e0a\u7aef_\u4e0b\u7aef"
K_DEN = "\u5206\u6bcd\u306e\u6841\u6570"
K_S0 = "s_up \u2212 s0"


def mv(R, v):
    return [sum(R[i][j] * v[j] for j in range(3)) for i in range(3)]


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def solve3(A, b):
    import sympy as sp
    M = sp.Matrix([[sp.Rational(x.numerator, x.denominator) for x in r] for r in A])
    x = M.LUsolve(sp.Matrix([sp.Rational(t.numerator, t.denominator) for t in b]))
    return [Fr(int(sp.fraction(e)[0]), int(sp.fraction(e)[1])) for e in x]


def H(R):
    X = [mv(R, v) for v in V]
    return [max(dot(b, x) for x in X) for b in BS], X


def mt(n):
    return max(dot(n, b) for b in BS)


def Phi(n, R):
    Hs, X = H(R)
    m = mt(n)
    return max(dot(n, x) for x in X) + sum((m - dot(n, b)) * Hs[f] for f, b in enumerate(BS)) / 4


def T_vertices(R, s):
    Hs, _ = H(R)
    out = []
    for drop in range(4):
        fs = [f for f in range(4) if f != drop]
        out.append(solve3([[Fr(x) for x in BS[f]] for f in fs], [s / 2 - Hs[f] for f in fs]))
    return out


def main():
    qh = C.qhat()
    RS = C.rot_fr(qh)
    tau = [[Fr(-1), Fr(0), Fr(0)], [Fr(0), Fr(1), Fr(0)], [Fr(0), Fr(0), Fr(-1)]]
    s1 = sum(H(RS)[0]) / 2
    best = None
    for i in range(1, 29):
        h = Fr(i, 100)
        n = [1 - h, 1 - h, Fr(1)]
        mn = [-x for x in n]
        s = 2 * (Phi(n, RS) + Phi(mn, tau)) / (mt(n) + mt(mn))
        if best is None or s < best[0]:
            best = (s, n)
    s_up = max(best[0], s1)
    n = best[1]
    # translations: the stopped piece at the vertex of T with the smallest n·t, the corner piece at the vertex of T with the largest n·t
    t1 = min(T_vertices(RS, s_up), key=lambda t: dot(n, t))
    t2 = max(T_vertices(tau, s_up), key=lambda t: dot(n, t))
    P1 = [[a + b for a, b in zip(mv(RS, v), t1)] for v in V]
    P2 = [[a + b for a, b in zip(mv(tau, v), t2)] for v in V]
    inside = all(dot(b, x) <= s_up / 2 for b in BS for x in P1 + P2)
    top1 = max(dot(n, x) for x in P1); bot2 = min(dot(n, x) for x in P2)
    res = dict(s_up=str(s_up), s_up_float=float(s_up), s1_Rhat=str(s1), n=[str(x) for x in n],
               **{K_INSIDE: inside, K_SEP: (top1 <= bot2), K_GAP: float(top1 - bot2)},
               s_up_minus_sbar=float(s_up - C.S_BAR), **{K_DEN: len(str(s_up.denominator))})
    import mpmath as mp
    mp.mp.dps = 50
    s0 = [r for r in mp.polyroots([mp.mpf(t) for t in C.S0_MINPOLY], maxsteps=200, extraprec=200) if abs(mp.im(r)) < 1e-30 and mp.re(r) > 1.9][0]
    res[K_S0] = mp.nstr(mp.mpf(s_up.numerator) / s_up.denominator - mp.re(s0), 5)
    print(res)
    json.dump(res, open("d40_upper.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    assert inside and top1 <= bot2


if __name__ == "__main__":
    main()
