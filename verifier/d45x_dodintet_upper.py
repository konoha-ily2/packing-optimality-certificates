# D45 route X, upper bound: checks exactly in the octic field K that two regular dodecahedra fit in a configuration at exactly s₀ (c₀ = s₀/(2√2) ∈ K) (s* ≤ s₀).
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# The configuration is the same as in step 0a (d45_dodintet_step0.py): R₀ (solution of the equations of 2 faces + 1 edge), R₁ = g·R₀·k, and the translations t₀, t₁ and c₀
# solve the linear equations of the 6 touching walls and the 1 edge-edge contact (d45x_dodintet_common.config).
# What is checked (all exactly, by signs of elements of K): (1) b_f·x ≤ c₀ at all 40 vertices (container {b_f·x ≤ c}, c = s/(2√2) for a piece of unit edge),
# (2) on the plane nc·x = h containing edge {3,15} (piece 0) and edge {4,16} (piece 1), the vertices of piece 0 are ≤ h and those of piece 1 are ≥ h (or the reverse).
# Pieces and container are convex, so by (1) the pieces lie in the container, and by (2) the interiors of the 2 pieces do not meet. The piece vertices are V of d45_dodintet_upper (edge length 1 is checked below).
import os, sys, json, math, itertools
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d45x_dodintet_common as C

KF, Z = C.KF, C.Z


def main():
    cf = C.config()
    c0 = cf["c0"]
    P = []
    for R, T in ((cf["R0"], cf["T0"]), (cf["R1"], cf["T1"])):
        P.append([[a + b for a, b in zip(C.mv(R, v), T)] for v in C.VK])
    # edge length: the smallest squared distance between vertices is 1 (on the vertex set of the piece itself)
    d2 = sorted(set(float(C.dot(C.sub(u, v), C.sub(u, v))) for u, v in itertools.combinations(C.VK, 2)))
    e2 = [C.dot(C.sub(u, v), C.sub(u, v)) for u, v in itertools.combinations(C.VK, 2)]
    emin = min(e2, key=float)
    assert (emin - 1).is_zero() and all(x >= emin for x in e2), "edge length is not 1"
    wall = []
    ntouch = 0
    for i in range(2):
        for x in P[i]:
            for f, b in enumerate(C.BK):
                v = C.dot(b, x) - c0
                sg = v.sign()
                wall.append(sg <= 0)
                ntouch += (sg == 0)
    inside = all(wall)
    nc = cf["nc"]
    h = C.dot(nc, P[0][cf["TOP0"][0]])
    assert (C.dot(nc, P[1][cf["TOP1"][0]]) - h).is_zero() and (C.dot(nc, P[0][cf["TOP0"][1]]) - h).is_zero() and (C.dot(nc, P[1][cf["TOP1"][1]]) - h).is_zero()
    s0v = [(C.dot(nc, x) - h).sign() for x in P[0]]
    s1v = [(C.dot(nc, x) - h).sign() for x in P[1]]
    assert s0v.count(0) < 20   # A10f m1: the normal of the separating plane is not 0
    sep = (all(t <= 0 for t in s0v) and all(t >= 0 for t in s1v)) or (all(t >= 0 for t in s0v) and all(t <= 0 for t in s1v))
    res = dict(**{"\u5bb9\u5668\u306b\u5165\u308b": inside, "\u58c1\u306b\u63a5\u3059\u308b\u9802\u70b9": ntouch, "\u5206\u3051\u308b\u5e73\u9762\u3067\u5206\u304b\u308c\u308b": sep, "\u5e73\u9762\u306b\u4e57\u308b\u9802\u70b9": [s0v.count(0), s1v.count(0)]},
               c0=c0.to_str(), field=[str(x) for x in KF.f], s0_float=2 * math.sqrt(2) * float(c0))
    print(res)
    json.dump(res, open(os.path.join(HERE, "d45x_dodintet_upper.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    assert inside and sep


if __name__ == "__main__":
    main()
