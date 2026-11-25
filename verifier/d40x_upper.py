# D40 route X, the upper bound: substitute exactly, inside K = Q(c), a configuration in which 2 pieces fit at exactly s₀ (s* ≤ s₀).
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# Built like d40_upper.py (route Y, rational R̂), with the stopped piece at the exact R₁* (T_S of d40x_common.centers_K), the corner piece at τ = I (coordinates of D_n),
# and s = s₀ ∈ K. In coordinates scaled by √2 the container is s·C̃ = {x : b_f·x ≤ s/2} and a piece has vertices Rṽ + t.
# For n on the arc (h = 1/100) check in K that the expression of ⇐ of T3, s(n) = 2[Φ̃(n, R₁*) + Φ̃(−n, I)] / (m̃(n) + m̃(−n)), equals s₀, and that s₁(R₁*) = s₀;
# build the translations from the vertices of T (intersection of 3 walls, Cramer's rule) and check exactly "inside the container" and "separated by the plane n·x = c".
# Every comparison is the sign of an element of K (zero as a polynomial, or a sign decided on intervals); no floating point is used.
# The record d40x_upper.json keeps the keys of the original record, some of them in Japanese (written with \u escapes in main):
# K_INSIDE "inside the container", K_SEP "separated by the separating plane", K_GAP0 "top end − bottom end is 0", K_WALLS "number of walls touched".
import json, os, sys
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d40_common as C
import d40x_common as X
from d40x_common import KE

BS = C.BS
V = [[Fr(x, 2) for x in v] for v in C.VT]
Z = KE.of(0)


def mv(R, v):
    return [sum((R[i][j] * v[j] for j in range(3)), Z) for i in range(3)]


def dot(a, b):
    return sum((x * y for x, y in zip(a, b)), Z)


def kmax(xs):
    m = xs[0]
    for x in xs[1:]:
        if x > m:
            m = x
    return m


def kmin(xs):
    return -kmax([-x for x in xs])


def det3(M):
    return (M[0][0] * (M[1][1] * M[2][2] - M[1][2] * M[2][1]) - M[0][1] * (M[1][0] * M[2][2] - M[1][2] * M[2][0])
            + M[0][2] * (M[1][0] * M[2][1] - M[1][1] * M[2][0]))


def solve3(A, b):
    """Cramer's rule (A has integer entries, b is in K)."""
    d = det3([[KE.of(x) for x in r] for r in A])
    out = []
    for k in range(3):
        Mk = [[(b[i] if j == k else KE.of(A[i][j])) for j in range(3)] for i in range(3)]
        out.append(det3(Mk) / d)
    return out


def H(R):
    Xs = [mv(R, v) for v in V]
    return [kmax([dot(b, x) for x in Xs]) for b in BS], Xs


def mt(n):
    return kmax([dot(n, b) for b in BS])


def Phi(n, R):
    Hs, Xs = H(R)
    m = mt(n)
    return kmax([dot(n, x) for x in Xs]) + sum(((m - dot(n, b)) * Hs[f] for f, b in enumerate(BS)), Z) / 4


def T_vertices(R, s):
    Hs, _ = H(R)
    out = []
    for drop in range(4):
        fs = [f for f in range(4) if f != drop]
        out.append(solve3([list(BS[f]) for f in fs], [s / 2 - Hs[f] for f in fs]))
    return out


def main():
    s0 = X.s0_K()
    RS = X.rot_K(X.centers_K()[0][2])
    I3 = [[KE.of(int(i == j)) for j in range(3)] for i in range(3)]
    s1 = sum(H(RS)[0], Z) / 2
    assert s1 == s0, "s₁(R₁*) ≠ s₀"
    res = dict(s1_eq_s0=True)
    sn = {}
    for hh in (Fr(1, 100), Fr(1, 10), Fr(1, 4)):
        n = [KE.of(1 - hh), KE.of(1 - hh), KE.of(1)]
        mn = [-x for x in n]
        sn[str(hh)] = (2 * (Phi(n, RS) + Phi(mn, I3)) / (mt(n) + mt(mn)) == s0)
    res["T3_s_n_eq_s0"] = sn
    assert all(sn.values()), "s(n) on the arc is not s₀"
    hh = Fr(1, 100)
    n = [KE.of(1 - hh), KE.of(1 - hh), KE.of(1)]
    t1 = None; best = None
    for t in T_vertices(RS, s0):
        v = dot(n, t)
        if best is None or v < best:
            best, t1 = v, t
    t2 = None; best = None
    for t in T_vertices(I3, s0):
        v = dot(n, t)
        if best is None or v > best:
            best, t2 = v, t
    P1 = [[a + b for a, b in zip(mv(RS, v), t1)] for v in V]
    P2 = [[a + b for a, b in zip(mv(I3, v), t2)] for v in V]
    inside = all(dot(b, x) <= s0 / 2 for b in BS for x in P1 + P2)
    top1 = kmax([dot(n, x) for x in P1]); bot2 = kmin([dot(n, x) for x in P2])
    K_INSIDE = "\u5bb9\u5668\u306b\u5165\u308b"; K_SEP = "\u5206\u3051\u308b\u5e73\u9762\u3067\u5206\u304b\u308c\u308b"; K_GAP0 = "\u4e0a\u7aef_\u4e0b\u7aef_\u306f0"; K_WALLS = "\u63a5\u3059\u308b\u58c1\u306e\u6570"
    res.update(**{K_INSIDE: inside, K_SEP: bool(top1 <= bot2), K_GAP0: (top1 - bot2).is_zero()},
               s0=s0.to_str(), s0_float=float(s0), n=[str(1 - hh), str(1 - hh), "1"],
               **{K_WALLS: sum(1 for b in BS for x in P1 + P2 if (dot(b, x) - s0 / 2).is_zero())})
    print(res)
    json.dump(res, open(os.path.join(HERE, "d40x_upper.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    assert inside and top1 <= bot2


if __name__ == "__main__":
    main()
