# -*- coding: utf-8 -*-
"""Q49, end of the plateau: check the lower bound L >= 20 r / sqrt(6) for n >= 5 in exact arithmetic.

Idea (see the notes on the end of the plateau)
  The inscribed balls of the pieces (radius r) lie inside the pieces, so they do not overlap and the centres are at distance >= 2r.
  The balls fit in the container (regular tetrahedron with edge L), so the centres lie in the regular tetrahedron T' with edge L' = L - 2*sqrt(6)*r.
  Split T' into 4 cells by "which vertex is nearest". With 5 points, by pigeonhole two points are in the same cell.
  The diameter of a cell = (sqrt(6)/4) L' (from a vertex to the centroid), so 2r <= (sqrt(6)/4) L'.
  Hence L >= 2 sqrt(6) r + 8 r / sqrt(6) = 20 r / sqrt(6).
Checked exactly here:
  (1) the vertices of each cell are enumerated as rationals from the intersection of half-spaces, and diameter^2 / edge^2 = 3/8
  (2) for each case 20 r / sqrt(6) > the plateau value (by sign decisions in the rationals and Q(sqrt5))
  (3) versions with injected errors fail
Note: r² (1/6 for octintet, (7+3√5)/24 for icointet) is a hand-written number. Python alone does not detect an error in the input r.
Deriving r from the pieces is done by inrad_*_ok in Lean and by the floating-point comparison in the notes (FD_plateau_end_review fixable 4).
"""
from fractions import Fraction as F
from itertools import combinations
import sys

# regular tetrahedron (edge 2*sqrt2, edge^2 = 8) with rational coordinates
V = [(1, 1, 1), (1, -1, -1), (-1, 1, -1), (-1, -1, 1)]
V = [tuple(F(c) for c in v) for v in V]
EDGE2 = F(8)

def sub(a, b): return tuple(x - y for x, y in zip(a, b))
def dot(a, b): return sum(x * y for x, y in zip(a, b))
def d2(a, b): return dot(sub(a, b), sub(a, b))

def halfspaces(k, drop_bisector=None):
    """Cell of vertex k: inside the 4 faces of the container + the k side of the perpendicular bisector planes with the other vertices. Returned as n.x <= c."""
    hs = []
    # face i (opposite vertex i): x . v_i >= -1  <=>  -v_i . x <= 1
    for v in V:
        hs.append((tuple(-c for c in v), F(1)))
    for j in range(4):
        if j == k or j == drop_bisector:
            continue
        # |x-vk|^2 <= |x-vj|^2  <=>  2 (vj - vk).x <= |vj|^2 - |vk|^2 = 0
        n = tuple(2 * (a - b) for a, b in zip(V[j], V[k]))
        hs.append((n, F(0)))
    return hs

def solve3(rows):
    (a, b, c) = [r[0] for r in rows]; rhs = [r[1] for r in rows]
    M = [list(a), list(b), list(c)]
    det = (M[0][0]*(M[1][1]*M[2][2]-M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2]-M[1][2]*M[2][0])
           + M[0][2]*(M[1][0]*M[2][1]-M[1][1]*M[2][0]))
    if det == 0:
        return None
    sol = []
    for col in range(3):
        Mc = [row[:] for row in M]
        for i in range(3):
            Mc[i][col] = rhs[i]
        dc = (Mc[0][0]*(Mc[1][1]*Mc[2][2]-Mc[1][2]*Mc[2][1]) - Mc[0][1]*(Mc[1][0]*Mc[2][2]-Mc[1][2]*Mc[2][0])
              + Mc[0][2]*(Mc[1][0]*Mc[2][1]-Mc[1][1]*Mc[2][0]))
        sol.append(dc / det)
    return tuple(sol)

def cell_vertices(k, drop_bisector=None):
    hs = halfspaces(k, drop_bisector)
    verts = set()
    for tri in combinations(hs, 3):
        p = solve3(tri)
        if p is None:
            continue
        if all(dot(n, p) <= c for n, c in hs):
            verts.add(p)
    return sorted(verts)

def diam2_ratio(k, drop_bisector=None):
    vs = cell_vertices(k, drop_bisector)
    m = max(d2(p, q) for p, q in combinations(vs, 2))
    return m / EDGE2, vs

# ---- sign of a number a + b sqrt5 of Q(sqrt5) (a, b rational) ----
def sign_q5(a, b):
    a, b = F(a), F(b)
    if b == 0: return (a > 0) - (a < 0)
    if a == 0: return (b > 0) - (b < 0)
    if a > 0 and b > 0: return 1
    if a < 0 and b < 0: return -1
    # opposite signs: compare |a| with |b| sqrt5 after squaring
    s = (a * a > 5 * b * b) - (a * a < 5 * b * b)
    return s if a > 0 else -s

def check(label, r2, plateau2_a, plateau2_b, ratio):
    """bound^2 = (L'_coef)... : lower bound L_b = 2 sqrt6 r + 2r / sqrt(ratio).
    When ratio = 3/8, L_b = 20 r / sqrt6 and L_b^2 = 400 r^2 / 6.
    For a general ratio L_b^2 is r^2 (2 sqrt6 + 2/sqrt(ratio))^2, but here only the closed form for ratio=3/8 is accepted.
    r2 = r^2 is a number (a,b) of Q(sqrt5). The square of the plateau value is also (a,b). Decides L_b^2 - plateau^2 > 0."""
    if ratio != F(3, 8):
        print(f"[{label}] cell diameter^2/edge^2 = {ratio} ≠ 3/8 → the closed form cannot be used: rejected")
        return False
    lb2 = (F(400, 6) * F(r2[0]), F(400, 6) * F(r2[1]))
    s = sign_q5(lb2[0] - F(plateau2_a), lb2[1] - F(plateau2_b))
    ok = s > 0
    print(f"[{label}] L_b^2 = {lb2[0]} + {lb2[1]}√5  vs plateau^2 = {plateau2_a} + {plateau2_b}√5  → {'accepted' if ok else 'rejected'}")
    return ok

def main():
    ok_all = True
    # (1) cells
    ratios = []
    for k in range(4):
        ratio, vs = diam2_ratio(k)
        ratios.append(ratio)
        print(f"cell of vertex {k}: {len(vs)} vertices, diameter^2/edge^2 = {ratio}")
    ratio = max(ratios)
    # (2) the 2 cases
    # octintet: r = 1/sqrt6 → r^2 = 1/6. plateau 3 → 9
    ok_oct = check("octintet n>=5", (F(1, 6), 0), 9, 0, ratio)
    # icointet: r = phi^2 / (2 sqrt3), phi^2 = (3+sqrt5)/2 → r^2 = phi^4/12 = (7+3sqrt5)/24
    # plateau s*^2 = 72/5 + 32 sqrt5 / 5
    ok_ico = check("icointet n>=5", (F(7, 24), F(3, 24)), F(72, 5), F(32, 5), ratio)
    ok_all = ok_oct and ok_ico
    # consistency with the records (lower bound <= record), only looked at in floating point
    import math
    print("reference: octintet lower bound 10/3 =", 10 / 3, " record 3.3333339865315")
    lb_ico = 20 * ((3 + 5 ** .5) / 2) / (2 * 3 ** .5) / 6 ** .5
    print("reference: icointet lower bound =", lb_ico, " record 6.1707659427042  candidate 5√(3√5+7)/3 =", 5 * math.sqrt(3 * 5 ** .5 + 7) / 3)

    # (3) versions with injected errors
    print("--- versions with injected errors (each should be rejected) ---")
    bad = []
    r_, _ = diam2_ratio(0, drop_bisector=1)
    print(f"cell with one bisector plane dropped: diameter^2/edge^2 = {r_}")
    bad.append(check("error 1 drop a face of the cell (oct)", (F(1, 6), 0), 9, 0, r_))
    bad.append(check("error 2 plateau mistaken for 10/3 (oct)", (F(1, 6), 0), F(100, 9), 0, ratio))
    bad.append(check("error 3 r times 0.8 (oct)", (F(16, 25) * F(1, 6), 0), 9, 0, ratio))
    bad.append(check("error 4 wrong sign of the √5 coefficient of r^2 for ico", (F(7, 24), F(-3, 24)), F(72, 5), F(32, 5), ratio))
    bad.append(check("error 5 plateau above the record 6.1708^2 (ico)", (F(7, 24), F(3, 24)), F(3808, 100), 0, ratio))
    mut_ok = not any(bad)
    print("all injected errors were rejected" if mut_ok else "an injected error passed: investigate")
    print("overall:", "accepted" if (ok_all and mut_ok) else "rejected")
    return 0 if (ok_all and mut_ok) else 1

if __name__ == "__main__":
    sys.exit(main())
