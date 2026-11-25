# -*- coding: utf-8 -*-
"""D48 stage O0 (octincub_n09): formulas and first order. Design: plan/D48_cube_n09_cone.md sections 3 and 7 (the table).

  python -X utf8 d87_oct_step0.py exact            # (a) exact (Fraction, sympy)
  python -X utf8 d87_oct_step0.py local            # (b) local numbers (floating point)
  python -X utf8 d87_oct_step0.py scan [--procs 3] # (c) min_R on a grid of n (floating point, a few minutes)
  python -X utf8 d87_oct_step0.py report           # collect the 3 parts into d87_oct_step0.json, with the decision

Units: |n| = 1. Lengths are given in "piece edge 1" (the original unit, = rational coordinates × 1/√2) (the _e1 fields).
The floating-point parts (b) and (c) are not evidence (a multi-start descent can miss the minimum).
Written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
"""
import sys, os, json, time, itertools, argparse, zlib
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d87_cub_common as C

OUT = {k: os.path.join(HERE, "d87_oct_step0_%s.json" % k) for k in ("exact", "local", "scan")}
FINAL = os.path.join(HERE, "d87_oct_step0.json")
E1 = C.SCALE_TO_EDGE1


def fstr(x):
    return str(x) if isinstance(x, Fr) else x


# ====================================================================== (a) exact
def sat_separated(VA, VB, RA, RB):
    """Look for a (weakly) separating plane among candidate directions: the face normals of both pieces and the cross products of edge directions (separating axis theorem)."""
    def normals(R):
        out = []
        for s in itertools.product((1, -1), repeat=3):
            out.append(tuple(sum(R[i][k] * s[k] for k in range(3)) for i in range(3)))
        return out

    def edges(R):
        c = C.cols(R)
        out = []
        for i, j in itertools.combinations(range(3), 2):
            for sg in (1, -1):
                out.append(tuple(c[i][m] + sg * c[j][m] for m in range(3)))
        return out

    cand = normals(RA) + normals(RB)
    for ea in edges(RA):
        for eb in edges(RB):
            cr = C.cross(ea, eb)
            if any(cr):
                cand.append(cr)
    for nv in cand:
        pa = [C.dot(nv, v) for v in VA]
        pb = [C.dot(nv, v) for v in VB]
        if max(pa) <= min(pb):
            return nv, max(pa)
        if max(pb) <= min(pa):
            return tuple(-x for x in nv), -min(pa)
    return None


def check_config(cfg, S):
    res = {"ok": True, "contain": [], "congruent": [], "pairs_separated": 0, "pairs_failed": []}
    for name, R, t in cfg:
        RtR = [[sum(R[k][i] * R[k][j] for k in range(3)) for j in range(3)] for i in range(3)]
        orth = all(RtR[i][j] == (1 if i == j else 0) for i in range(3) for j in range(3))
        res["congruent"].append(orth)  # the piece is centrally symmetric, so if R is orthogonal then R or −R is a rotation, and the piece is congruent
        V = C.piece_vertices(R, t)
        inside = all(abs(v[i]) <= S for v in V for i in range(3))
        res["contain"].append(inside)
        res["ok"] &= orth and inside
    for (na, RA, ta), (nb, RB, tb) in itertools.combinations(cfg, 2):
        sep = sat_separated(C.piece_vertices(RA, ta), C.piece_vertices(RB, tb), RA, RB)
        if sep is None:
            res["pairs_failed"].append([na, nb])
            res["ok"] = False
        else:
            res["pairs_separated"] += 1
    return res


def solve_wA():
    """Get the force point from the balance of the equality piece of (III) (centroid (0, 0, 2/3), orientation R_III, n = (1, 1, −1)).
    KKT of min_{R,t} max_{p∈face} n·p  s.t. vertex z ≤ 4/3, t_x ≥ 0, t_y ≥ 0:
      translation: n + (β₂+β₃) e_z − γ_x e_x − γ_y e_y = 0
      rotation: p × n + β₂ (−r₂) × e_z + β₃ (−r₃) × e_z = 0, p = Σ α_k r_k, Σα = 1
    (the forces of the cone faces act at the centroid and carry no couple). Solve for the unknowns α₁..α₃, β₂, β₃, γ over the rationals."""
    import sympy as sp
    r = [tuple(sp.Rational(x.numerator, x.denominator) for x in c) for c in C.cols(C.R_III)]
    n = sp.Matrix([1, 1, -1])
    a1, a2, a3, b2, b3, gx, gy = sp.symbols('a1 a2 a3 b2 b3 gx gy')
    ez, ex, ey = sp.Matrix([0, 0, 1]), sp.Matrix([1, 0, 0]), sp.Matrix([0, 1, 0])
    R = [sp.Matrix(c) for c in r]
    p = a1 * R[0] + a2 * R[1] + a3 * R[2]
    eqs = list(n + (b2 + b3) * ez - gx * ex - gy * ey)
    eqs += list(p.cross(n) + b2 * (-R[1]).cross(ez) + b3 * (-R[2]).cross(ez))
    eqs += [a1 + a2 + a3 - 1]
    sol = sp.solve(eqs, [a1, a2, a3, b2, b3, gx, gy], dict=True)
    assert len(sol) == 1, sol
    s = sol[0]
    t = sp.Matrix([0, 0, sp.Rational(2, 3)])
    w = t + p.subs(s)
    return {
        "alpha": [str(s[a1]), str(s[a2]), str(s[a3])],
        "beta": [str(s[b2]), str(s[b3])], "gamma": [str(s[gx]), str(s[gy])],
        "unique": all(len(sp.Matrix([s[v]]).free_symbols) == 0 for v in (a1, a2, a3, b2, b3, gx, gy)),
        "all_nonneg": all(s[v] >= 0 for v in (a1, a2, a3, b2, b3, gx, gy)),
        "w": [str(x) for x in w],
        "w_equals_W_A": [sp.nsimplify(x) for x in w] == [sp.Rational(5, 18), sp.Rational(5, 18), sp.Rational(2, 9)],
    }


def solve_IV_force():
    """Balance of the equality piece of (IV) (centroid (2/3, 2/3, 0), orientation R_III, n = (−1, −1, 1)).
    Faces −r₁, −r₂, −r₃ (n·(−r_k) = 1); vertices r₁, r₂ on the wall x = 4/3, vertices r₁, r₃ on the wall y = 4/3; cone face t_z ≥ 0.
    One unknown is left over and the force point is a segment (lo is not smooth in this direction = one direction where the first order is 0).
    Check over the rationals whether W_A lies on that segment (with all weights ≥ 0)."""
    import sympy as sp
    R = [sp.Matrix([sp.Rational(x.numerator, x.denominator) for x in c]) for c in C.cols(C.R_III)]
    n = sp.Matrix([-1, -1, 1])
    a1, a2, a3, bx1, bx2, by1, by3, gz = sp.symbols('a1 a2 a3 bx1 bx2 by1 by3 gz')
    ex, ey, ez = sp.Matrix([1, 0, 0]), sp.Matrix([0, 1, 0]), sp.Matrix([0, 0, 1])
    p = -(a1 * R[0] + a2 * R[1] + a3 * R[2])
    eqs = list(n + (bx1 + bx2) * ex + (by1 + by3) * ey - gz * ez)
    eqs += list(p.cross(n) + bx1 * R[0].cross(ex) + bx2 * R[1].cross(ex) + by1 * R[0].cross(ey) + by3 * R[2].cross(ey))
    eqs += [a1 + a2 + a3 - 1]
    t = sp.Matrix([sp.Rational(2, 3), sp.Rational(2, 3), 0])
    W = sp.Matrix([sp.Rational(5, 18), sp.Rational(5, 18), sp.Rational(2, 9)])
    # add "force point = W_A" to the conditions and solve
    eqsW = eqs + list(t + p - W)
    solW = sp.solve(eqsW, [a1, a2, a3, bx1, bx2, by1, by3, gz], dict=True)
    gen = sp.solve(eqs, [a1, a2, a3, bx1, bx2, by1, by3, gz], dict=True)
    out = {"general_solution": {str(k): str(v) for k, v in gen[0].items()} if gen else None}
    if solW:
        s = solW[0]
        vals = {str(k): s.get(k, k) for k in (a1, a2, a3, bx1, bx2, by1, by3, gz)}
        free = set().union(*[sp.sympify(v).free_symbols for v in vals.values()])
        out["with_W_A"] = {k: str(v) for k, v in vals.items()}
        out["free_after_W_A"] = [str(f) for f in free]
        if not free:
            out["all_nonneg"] = all(sp.sympify(v) >= 0 for v in vals.values())
        else:
            # if a degree of freedom is left, whether all can be made ≥ 0 is an LP (enumerating rational vertices is small enough)
            out["all_nonneg"] = None
    else:
        out["with_W_A"] = None
        out["all_nonneg"] = False
    return out


def part_exact():
    t0 = time.time()
    rep = {}
    # (1) the formula for G = the LP in t (enumeration of vertices)
    rng = np.random.default_rng(87)
    mism, ntest = 0, 0
    for _ in range(400):
        q = tuple(int(x) for x in rng.integers(-9, 10, 4))
        if all(x == 0 for x in q):
            continue
        R = C.quat_rot(q)
        n = tuple(Fr(int(x)) for x in rng.integers(-7, 8, 3))
        ntest += 1
        if C.G_formula(n, R) != C.G_lp(n, R):
            mism += 1
    # also at the orientations of the record
    for R in (C.R_STAR, C.R_III, C.quat_rot((1, 0, 0, 0))):
        for n in itertools.product((-2, -1, 0, 1, 3), repeat=3):
            n = tuple(Fr(x) for x in n)
            ntest += 1
            if C.G_formula(n, R) != C.G_lp(n, R):
                mism += 1
    rep["G_formula_vs_LP"] = {"tests": ntest, "mismatch": mism}

    # (2) the 4 equality points
    I = C.quat_rot((1, 0, 0, 0))
    eq = {}
    n = (Fr(1), Fr(1), Fr(1));     eq["I"] = C.G_formula(n, I) - C.dot(n, C.W_Q)
    n = (Fr(-1), Fr(-1), Fr(-1));  eq["II"] = C.G_formula(n, C.R_STAR) - C.dot(n, C.W_Q)
    n = (Fr(1), Fr(1), Fr(-1));    eq["III"] = C.G_formula(n, C.R_III) - C.dot(n, C.W_A)
    n = (Fr(-1), Fr(-1), Fr(1));   eq["IV"] = C.G_formula(n, C.R_III) - C.dot(n, C.W_A)
    rep["equality_values"] = {k: str(v) for k, v in eq.items()}
    rep["equality_all_zero"] = all(v == 0 for v in eq.values())
    # whether the equality t (the LP optimum) is the centroid of the piece in the record
    rep["equality_t"] = {
        "III": "t = (0, 0, 4/3 − e_z) = (0, 0, %s)" % (C.S_HALF - C.e_axis(C.R_III, 2)),
        "IV": "t = (4/3 − e_x, 4/3 − e_y, 0) = (%s, %s, 0)" % (C.S_HALF - C.e_axis(C.R_III, 0), C.S_HALF - C.e_axis(C.R_III, 1)),
        "II": "t = 4/3 − e_i = %s" % [str(C.S_HALF - C.e_axis(C.R_STAR, i)) for i in range(3)],
    }
    # (3) derivation of w_A
    rep["w_A_derivation_III"] = solve_wA()
    rep["force_IV"] = solve_IV_force()
    # (4) the one line for (I)
    rep["claim_I"] = ("n ≥ 0\uff1aG(n,R) ≥ max_k|n·r_k| = ‖Rᵀn‖∞ ≥ ‖n‖₂/√3 ≥ (n₁+n₂+n₃)/3 = n·w_Q"
                      "\uff08(n_i)₋ = 0 \u306a\u306e\u3067\u58c1\u306e\u9805\u306f\u7121\u3044\u30022 \u3064\u76ee\u306f ∞ \u30ce\u30eb\u30e0\u3068 2 \u30ce\u30eb\u30e0\u30013 \u3064\u76ee\u306f\u30b3\u30fc\u30b7\u30fc\uff1d\u30b7\u30e5\u30ef\u30eb\u30c4\uff09")
    bad = 0
    for _ in range(300):
        q = tuple(int(x) for x in rng.integers(-9, 10, 4))
        if not any(q):
            continue
        R = C.quat_rot(q)
        n = tuple(Fr(int(x)) for x in rng.integers(0, 8, 3))
        if C.G_formula(n, R) < C.dot(n, C.W_Q):
            bad += 1
    rep["claim_I_random_rational_violations"] = bad
    # (5) upper bound: the substitution of the 9 pieces
    cfg = C.record_config()
    rep["upper"] = check_config(cfg, C.S_HALF)
    rep["upper"]["s_hat"] = str(C.S0)
    rep["upper"]["s_original"] = "ŝ₀/√2 = 8/(3√2) = 4√2/3\u3001(4√2/3)² = 32/9 → 9x² − 32"
    # broken copy 1: container smaller by 1/100
    b1 = check_config(cfg, C.S_HALF - Fr(1, 200))
    # broken copy 2: centroid of the corner piece (+,+,+) moved to (3/5)(1,1,1) (it cuts into the piece at the origin)
    cfg2 = [(nm, R, (tuple(Fr(3, 5) for _ in range(3)) if nm == "corner+1+1+1" else t)) for nm, R, t in cfg]
    b2 = check_config(cfg2, C.S_HALF)
    rep["upper_broken"] = {
        "container_minus_1/100": {"ok": b1["ok"], "contain_fail": b1["contain"].count(False)},
        "corner_centroid_3/5": {"ok": b2["ok"], "pairs_failed": b2["pairs_failed"]},
    }
    rep["optimality_md"] = ("alejandrozu/platonic-packing \u306e docs/OPTIMALITY.md \u3068 optimality.json\uff0811/14 \u306b\u53d6\u5f97\uff09\u306b "
                            "octincub_n09 \u306f\u7121\u3044\uff08octincub \u306f n02 \u3068\u3001\u53f0\u5730 n = 7\u301c8 \u306e 19√2/15 \u306e\u8a18\u8ff0\u3060\u3051\uff09")
    rep["seconds"] = round(time.time() - t0, 1)
    ok = (mism == 0 and rep["equality_all_zero"] and rep["w_A_derivation_III"]["w_equals_W_A"]
          and rep["w_A_derivation_III"]["all_nonneg"] and rep["w_A_derivation_III"]["unique"]
          and bad == 0 and rep["upper"]["ok"] and not b1["ok"] and not b2["ok"]
          and len(cfg) == 9 and rep["upper"]["pairs_separated"] == 36)   # 9 pieces and 36 pairs, also by count (FD_d48_oct_review item 2)
    rep["a_ok"] = bool(ok)
    json.dump(rep, open(OUT["exact"], "w", encoding="utf8"), ensure_ascii=False, indent=1, default=str)
    print(json.dumps(rep, ensure_ascii=False, indent=1, default=str))


# ====================================================================== (b) local
def perp_basis(v):
    v = np.asarray(v, float) / np.linalg.norm(v)
    a = np.array([1.0, 0, 0]) if abs(v[0]) < 0.9 else np.array([0, 1.0, 0])
    f1 = a - (a @ v) * v; f1 /= np.linalg.norm(f1)
    f2 = np.cross(v, f1)
    return f1, f2


def num_grad(f, x0, h=1e-6):
    x0 = np.asarray(x0, float)
    g = np.zeros_like(x0)
    for i in range(len(x0)):
        e = np.zeros_like(x0); e[i] = h
        g[i] = (f(x0 + e) - f(x0 - e)) / (2 * h)
    return g


def minkowski_inradius(groups_grads, tol=1e-9):
    """F'(d) = Σ_g max_{v∈g} v·d. P = Σ_g conv(g). Returns: the inradius (distance from 0) in the subspace spanned by P,
    the directions not spanned (null space), and the value of F' there (the component of the common term)."""
    from scipy.spatial import ConvexHull
    pts = [np.sum(c, axis=0) for c in itertools.product(*groups_grads)]
    P = np.array(pts)
    dim = P.shape[1]
    diffs = P - P[0]
    U, sv, Vt = np.linalg.svd(diffs, full_matrices=True)
    rank = int(np.sum(sv > 1e-7 * max(1.0, sv[0] if len(sv) else 1)))
    span = Vt[:rank]
    null = Vt[rank:]
    null_vals = [float(P[0] @ d) for d in null]  # F'(d) in the null-space directions (the sign changes with ±d -> if not 0, negative at first order)
    Q = P @ span.T
    if rank == 0:
        return {"rank": 0, "inradius": None, "null_dirs": null.tolist(), "null_vals": null_vals}
    if rank == 1:
        lo, hi = Q.min(), Q.max()
        r = min(-lo, hi)
    else:
        hull = ConvexHull(Q)
        r = float(np.min(-hull.equations[:, -1]))  # unit outward-normal form a·x + b ≤ 0; distance of the origin is −b
    return {"rank": rank, "inradius": float(r), "null_dirs": null.tolist(), "null_vals": null_vals,
            "span": span.tolist()}


def active(vals, tol=1e-9):
    m = max(vals)
    return [i for i, v in enumerate(vals) if v > m - tol]


def local_II():
    """The point of (II): m₀ = (1,1,1)/√3, R*. Coordinates x = (α, β, ω): m̂ = normalize(m₀ + αf₁ + βf₂), R = exp(ω×)R*.
    F = max_k m̂·r_k + Σ_i m̂_i (max_j |R_ij| − 1)."""
    m0 = np.ones(3) / np.sqrt(3)
    f1, f2 = perp_basis(m0)
    R0 = np.array(C.R_STAR, float)

    def unpack(x):
        m = m0 + x[0] * f1 + x[1] * f2
        m /= np.linalg.norm(m)
        R = C.expm_so3(x[2:5]) @ R0
        return m, R

    groups = []
    m, R = unpack(np.zeros(5))
    top_act = active([m @ R[:, k] for k in range(3)])
    groups.append([(lambda k: (lambda x: (lambda m, R: m @ R[:, k])(*unpack(x))))(k) for k in top_act])
    for i in range(3):
        act = active([abs(R[i, j]) for j in range(3)])
        sg = [np.sign(R[i, j]) for j in range(3)]
        groups.append([(lambda i, j, s: (lambda x: (lambda m, R: m[i] * (s * R[i, j] - 1))(*unpack(x))))(i, j, sg[j]) for j in act])
    gg = [[num_grad(f, np.zeros(5)) for f in g] for g in groups]
    base = sum(max(f(np.zeros(5)) for f in g) for g in groups)
    res = minkowski_inradius(gg)
    res["value_at_point"] = base
    res["inradius_e1"] = res["inradius"] * E1
    res["groups"] = [len(g) for g in groups]
    # the actual growth of F (the true F, ε = 1e-4) in random directions
    rng = np.random.default_rng(2)
    ratios = []
    for _ in range(4000):
        d = rng.normal(size=5); d /= np.linalg.norm(d)
        m, R = unpack(1e-4 * d)
        val = C.np_G(-m, R) + m @ np.ones(3) / 3  # G(−m) − (−m)·w_Q
        ratios.append(val / 1e-4)
    res["sampled_min_slope"] = float(min(ratios))
    res["sampled_min_slope_e1"] = float(min(ratios)) * E1
    # slope in n alone inside the cone (R minimized): compare with the design's "0.25-0.30 per angle"
    return res


def band_III_R(u, v, w=0.0):
    """Family S: R = Rz(u) · R_III · P(v) · Q(w). P(v) is about the body axis (0,1,−1) (keeps the tie r₂z = r₃z in z),
    Q(w) is about the body axis (1,1,1) (breaks the tie, does not change n = R(1,1,1))."""
    R0 = np.array(C.R_III, float)
    Rz = C.axis_rot((0, 0, 1), u)
    return Rz @ R0 @ C.axis_rot((0, 1, -1), v) @ C.axis_rot((1, 1, 1), w)


def T_III_exact():
    """Value, gradient and Hessian at (0,0) of T(u, v) = [G − n·w_A] (n = R(1,1,1)/√3, R = Rz(u) R_III P(v)), exactly with sympy."""
    import sympy as sp
    u, v = sp.symbols('u v', real=True)

    def rot(axis, ang):
        a = sp.Matrix(axis) / sp.sqrt(sum(x**2 for x in axis))
        K = sp.Matrix([[0, -a[2], a[1]], [a[2], 0, -a[0]], [-a[1], a[0], 0]])
        return sp.eye(3) + sp.sin(ang) * K + (1 - sp.cos(ang)) * K * K

    R0 = sp.Matrix([[sp.Rational(x.numerator, x.denominator) for x in row] for row in C.R_III])
    R = rot((0, 0, 1), u) * R0 * rot((0, 1, -1), v)
    n = R * sp.Matrix([1, 1, 1])  # |n| = √3, max_k |n·r_k| = 1
    a = -R[2, 1]                   # e_z = |r₂z| = |r₃z| (on the family)
    c = -n[2]
    W = sp.Matrix([sp.Rational(5, 18), sp.Rational(5, 18), sp.Rational(2, 9)])
    T = (1 + c * (a - sp.Rational(4, 3)) - (n.T * W)[0]) / sp.sqrt(3)
    z = {u: 0, v: 0}
    val = sp.simplify(T.subs(z))
    grad = [sp.simplify(sp.diff(T, s).subs(z)) for s in (u, v)]
    H = sp.Matrix(2, 2, lambda i, j: sp.simplify(sp.diff(T, (u, v)[i], (u, v)[j]).subs(z)))
    ev = [sp.nsimplify(sp.simplify(e)) for e in H.eigenvals().keys()]
    Tf = sp.lambdify((u, v), T, "numpy")
    return {"T0": str(val), "grad": [str(g) for g in grad], "hessian": [[str(H[i, j]) for j in range(2)] for i in range(2)],
            "hessian_eig": [str(e) for e in ev], "hessian_eig_float": [float(e) for e in ev],
            "hessian_eig_e1": [float(e) * E1 for e in ev]}, Tf


def band_III_lambda(Tf):
    """On the (u, v) grid of family S, Λ = min_ζ̂ max_c ∂_ζ̂ G_c in the 3 transverse directions (w, α, β) (candidates c = top vertex k × z vertex j)."""
    W = np.array([5 / 18, 5 / 18, 2 / 9])
    rows = []
    grid = np.round(np.arange(-0.5, 0.5001, 0.05), 4)
    for u in grid:
        for v in grid:
            R = band_III_R(u, v)
            nu0 = np.ones(3) / np.sqrt(3)
            f1, f2 = perp_basis(nu0)
            n0 = R @ nu0
            b, aa = R[2, 0], -R[2, 1]
            if not (n0[0] >= 0 and n0[1] >= 0 and n0[2] <= 0 and aa > abs(b) + 1e-9):
                continue

            def unpack(x, u=u, v=v):
                Rx = band_III_R(u, v, x[0])
                nu = nu0 + x[1] * f1 + x[2] * f2
                n = Rx @ (nu / np.linalg.norm(nu))
                return n, Rx
            groups = [[(lambda k: (lambda x: (lambda n, R: n @ R[:, k])(*unpack(x))))(k) for k in range(3)],
                      [(lambda j: (lambda x: (lambda n, R: (-n[2]) * (-R[2, j]) )(*unpack(x))))(j) for j in (1, 2)],
                      [lambda x: (lambda n, R: (-n[2]) * (-4 / 3) - n @ W)(*unpack(x))]]
            gg = [[num_grad(f, np.zeros(3)) for f in g] for g in groups]
            res = minkowski_inradius(gg)
            Tv = float(Tf(u, v))
            Tchk = C.np_G(n0, R) - n0 @ W
            rows.append({"u": float(u), "v": float(v), "Lambda": res["inradius"], "rank": res["rank"],
                         "T": Tv, "T_check": float(Tchk), "n": n0.tolist()})
    return rows


def minR_local(n, kappa, R_seeds, rng, nstart=12, scale=0.15):
    """Minimization over R (local, NM from around the given orientations). Returns G(n,R) − kappa."""
    from scipy.optimize import minimize
    best = (np.inf, None)
    for R0 in R_seeds:
        for s in range(nstart):
            w0 = np.zeros(3) if s == 0 else rng.normal(size=3) * scale
            f = lambda w: C.np_G(n, C.expm_so3(w) @ R0) - kappa
            r = minimize(f, w0, method="Nelder-Mead", options={"xatol": 1e-11, "fatol": 1e-13, "maxiter": 4000})
            if r.fun < best[0]:
                best = (float(r.fun), (C.expm_so3(r.x) @ R0))
    return best


def dprime_profile(sign, rng):
    """Around d′: n̂ = cos ε d̂ + sin ε (cos θ f₁ + sin θ f₂). sign = +1 for (III), −1 for (IV).
    min_R [G − n·w_A] at ε = 0.01, 0.02, 0.05, 0.1, 0.2. A rough idea of the first- and second-order coefficients."""
    W = np.array([5 / 18, 5 / 18, 2 / 9])
    d = sign * np.array([1.0, 1, -1]) / np.sqrt(3)
    t1 = np.array([1.0, -1, 0]) / np.sqrt(2)          # θ = 0 is (1, −1, 0)
    t2 = np.cross(d, t1)
    R0 = np.array(C.R_III, float)
    out = []
    for th_deg in range(0, 360, 20):
        th = np.radians(th_deg)
        row = {"theta_deg": th_deg}
        for eps in (0.01, 0.02, 0.05, 0.1, 0.2):
            n = np.cos(eps) * d + np.sin(eps) * (np.cos(th) * t1 + np.sin(th) * t2)
            if sign > 0 and not (n[0] >= -1e-12 and n[1] >= -1e-12 and n[2] <= 1e-12):
                continue
            if sign < 0 and not (n[0] <= 1e-12 and n[1] <= 1e-12 and n[2] >= -1e-12):
                continue
            val, _ = minR_local(n, n @ W, [R0], rng, nstart=10)
            row["%.2f" % eps] = val * E1
        out.append(row)
    return out


def IV_base(rng):
    """First order in the 5 variables at the point of (IV): the null-space direction (1-dimensional base) and Λ in the 4 transverse directions."""
    W = np.array([5 / 18, 5 / 18, 2 / 9])
    n0 = np.array([-1.0, -1, 1]) / np.sqrt(3)
    f1, f2 = perp_basis(n0)
    R0 = np.array(C.R_III, float)

    def unpack(x):
        n = n0 + x[0] * f1 + x[1] * f2
        n /= np.linalg.norm(n)
        return n, C.expm_so3(x[2:5]) @ R0
    n, R = unpack(np.zeros(5))
    top = active([-n @ R[:, k] for k in range(3)])
    ax = active([abs(R[0, j]) for j in range(3)])
    ay = active([abs(R[1, j]) for j in range(3)])
    groups = [[(lambda k: (lambda x: (lambda n, R: -n @ R[:, k])(*unpack(x))))(k) for k in top],
              [(lambda j: (lambda x: (lambda n, R: (-n[0]) * abs(R[0, j]))(*unpack(x))))(j) for j in ax],
              [(lambda j: (lambda x: (lambda n, R: (-n[1]) * abs(R[1, j]))(*unpack(x))))(j) for j in ay],
              [lambda x: (lambda n, R: (-n[0] - n[1]) * (-4 / 3) - n @ W)(*unpack(x))]]
    gg = [[num_grad(f, np.zeros(5)) for f in g] for g in groups]
    res = minkowski_inradius(gg)
    res["active"] = {"top": top, "x": ax, "y": ay}
    res["inradius_e1"] = res["inradius"] * E1 if res["inradius"] is not None else None
    # split the null-space direction into n and rotation
    if res["null_dirs"]:
        d = np.array(res["null_dirs"][0])
        dn = d[0] * f1 + d[1] * f2
        res["null_n_dir"] = (dn / max(np.linalg.norm(dn), 1e-15)).tolist()
        res["null_split_n_rot"] = [float(np.linalg.norm(d[:2])), float(np.linalg.norm(d[2:]))]
        # step ε along the base direction and minimize over the 4 transverse directions (true G) -> second-order coefficient
        from scipy.optimize import minimize
        span = np.array(res["span"])
        q = []
        for eps in (0.01, 0.02, 0.05, 0.1):
            for sgn in (1, -1):
                def f(y, eps=eps, sgn=sgn):
                    n, R = unpack(sgn * eps * d + span.T @ y)
                    return C.np_G(n, R) - n @ W
                best = np.inf
                for s in range(8):
                    y0 = np.zeros(4) if s == 0 else rng.normal(size=4) * eps * 0.5
                    r = minimize(f, y0, method="Nelder-Mead", options={"xatol": 1e-12, "fatol": 1e-14, "maxiter": 6000})
                    best = min(best, r.fun)
                q.append({"eps": eps, "sign": sgn, "min": float(best) * E1, "coef": float(best) * E1 / eps**2})
        res["quadratic_along_null"] = q
    return res


def part_local():
    t0 = time.time()
    rng = np.random.default_rng(7)
    rep = {}
    rep["II_point"] = local_II()
    Tex, Tf = T_III_exact()
    rep["III_T_exact"] = Tex
    rows = band_III_lambda(Tf)
    lam = [r["Lambda"] for r in rows if r["Lambda"] is not None]
    rep["III_band_grid_points"] = len(rows)
    rep["III_band_Lambda_min_e1"] = float(min(lam)) * E1
    rep["III_band_Lambda_at0_e1"] = [r["Lambda"] * E1 for r in rows if r["u"] == 0 and r["v"] == 0]
    rep["III_band_T_min_e1"] = float(min(r["T"] for r in rows)) * E1
    rep["III_band_T_check_maxdiff"] = float(max(abs(r["T"] - r["T_check"]) for r in rows))
    rep["III_band_rows"] = [{k: (round(x, 6) if isinstance(x, float) else x) for k, x in r.items() if k != "n"} for r in rows]
    rep["IV_point"] = IV_base(rng)
    rep["dprime_III"] = dprime_profile(+1, rng)
    rep["dprime_IV"] = dprime_profile(-1, rng)
    rep["seconds"] = round(time.time() - t0, 1)
    json.dump(rep, open(OUT["local"], "w", encoding="utf8"), ensure_ascii=False, indent=1, default=float)
    short = {k: v for k, v in rep.items() if k not in ("III_band_rows",)}
    print(json.dumps(short, ensure_ascii=False, indent=1, default=float)[:20000])


# ====================================================================== (c) grid
_SEEDQ = None


def global_minR(n, kappa, seed, nrand=4000, nref=8):
    from scipy.optimize import minimize
    rng = np.random.default_rng(seed)
    Qs = rng.normal(size=(nrand, 4))
    seeds = []
    for R in (C.R_STAR, C.R_III):
        Rf = np.array(R, float)
        for s in itertools.product((1, -1), repeat=3):
            D = np.diag(s)
            M = D @ Rf @ D
            if np.linalg.det(M) < 0:
                M = -M
            seeds.append(C.rot_to_quat(M))
        for p in itertools.permutations(range(3)):
            P = np.eye(3)[list(p)]
            M = P @ Rf @ P.T
            if np.linalg.det(M) < 0:
                M = -M
            seeds.append(C.rot_to_quat(M))
    seeds.append(np.array([1.0, 0, 0, 0]))
    Qs = np.vstack([Qs, np.array(seeds)])
    vals = C.np_G_batch(n, C.np_quat_batch(Qs)) - kappa
    order = np.argsort(vals)[:nref]
    best = float(vals[order[0]])
    for i in order:
        f = lambda q: float(C.np_G_batch(n, C.np_quat_batch(q[None]))[0]) - kappa
        r = minimize(f, Qs[i], method="Nelder-Mead", options={"xatol": 1e-10, "fatol": 1e-13, "maxiter": 3000})
        best = min(best, float(r.fun))
    return best


def scan_task(item):
    reg, n, tag = item
    n = np.asarray(n, float)
    n = n / np.linalg.norm(n)
    W = np.array([1 / 3] * 3) if reg == "II" else np.array([5 / 18, 5 / 18, 2 / 9])
    val = global_minR(n, n @ W, seed=zlib.crc32((reg + tag + repr(n.round(6).tolist())).encode()))
    return {"reg": reg, "n": n.tolist(), "tag": tag, "margin": val, "margin_e1": val * E1}


def scan_items():
    N = 40
    items = []
    for i in range(N + 1):
        for j in range(N + 1 - i):
            k = N - i - j
            # (II): m = (i, j, k)/N, only m₁ ≥ m₂ ≥ m₃ by permutation
            if i >= j >= k:
                items.append(("II", (-i, -j, -k), "grid"))
            # (III), (IV): (a, b, c), only a ≥ b by x<->y
            if i >= j:
                items.append(("III", (i, j, -k), "grid"))
                items.append(("IV", (-i, -j, k), "grid"))
    # near d′: steps of 0.02 rad
    for reg, sign in (("III", 1), ("IV", -1)):
        d = sign * np.array([1.0, 1, -1]) / np.sqrt(3)
        t1 = np.array([1.0, -1, 0]) / np.sqrt(2); t2 = np.cross(d, t1)
        for eps in np.arange(0.02, 0.301, 0.02):
            for th in range(0, 360, 20):
                n = np.cos(eps) * d + np.sin(eps) * (np.cos(np.radians(th)) * t1 + np.sin(np.radians(th)) * t2)
                ok = (n[0] >= -1e-12 and n[1] >= -1e-12 and n[2] <= 1e-12) if sign > 0 else (n[0] <= 1e-12 and n[1] <= 1e-12 and n[2] >= -1e-12)
                if ok:
                    items.append((reg, tuple(n), "dprime eps=%.2f th=%d" % (eps, th)))
    # near the point of (II)
    d = -np.ones(3) / np.sqrt(3)
    t1 = np.array([1.0, -1, 0]) / np.sqrt(2); t2 = np.cross(d, t1)
    for eps in np.arange(0.02, 0.301, 0.04):
        for th in range(0, 360, 30):
            n = np.cos(eps) * d + np.sin(eps) * (np.cos(np.radians(th)) * t1 + np.sin(np.radians(th)) * t2)
            items.append(("II", tuple(n), "d eps=%.2f th=%d" % (eps, th)))
    return items


def part_scan(procs):
    from multiprocessing import Pool
    t0 = time.time()
    items = scan_items()
    print("items", len(items), flush=True)
    rows = []
    with Pool(procs) as pool:
        for i, r in enumerate(pool.imap_unordered(scan_task, items, chunksize=4)):
            rows.append(r)
            if i % 200 == 0:
                print(i, "/", len(items), round(time.time() - t0, 1), "s", flush=True)
    rep = {"items": len(items), "seconds": round(time.time() - t0, 1), "procs": procs}
    for reg in ("II", "III", "IV"):
        rr = [r for r in rows if r["reg"] == reg]
        neg = [r for r in rr if r["margin"] < -1e-7]
        rr.sort(key=lambda r: r["margin"])
        rep[reg] = {"points": len(rr), "negatives": len(neg), "min_e1": rr[0]["margin_e1"],
                    "worst": [{"n": [round(x, 5) for x in r["n"]], "tag": r["tag"], "margin_e1": r["margin_e1"]} for r in rr[:6]]}
        # minimum per angle from d′ or d
        if reg in ("III", "IV"):
            d = (1 if reg == "III" else -1) * np.array([1.0, 1, -1]) / np.sqrt(3)
        else:
            d = -np.ones(3) / np.sqrt(3)
        byang = {}
        for r in rr:
            ang = float(np.arccos(np.clip(np.dot(r["n"], d), -1, 1)))
            key = "%.2f" % (np.floor(ang / 0.1) * 0.1)
            byang[key] = min(byang.get(key, np.inf), r["margin_e1"])
        rep[reg]["min_by_angle_0.1rad_bins"] = dict(sorted(byang.items()))
    rep["rows"] = rows
    json.dump(rep, open(OUT["scan"], "w", encoding="utf8"), ensure_ascii=False, indent=1)
    print(json.dumps({k: v for k, v in rep.items() if k != "rows"}, ensure_ascii=False, indent=1))


# ====================================================================== summary
def part_report():
    ex = json.load(open(OUT["exact"], encoding="utf8"))
    lo = json.load(open(OUT["local"], encoding="utf8"))
    sc = json.load(open(OUT["scan"], encoding="utf8"))
    # range of the band: u ∈ [−1/2, 1/2], v ∈ [−1/2, 1/5] (for v > 1/5, Λ drops at first order and T ≥ 0.010, so it is handed to the far region)
    BAND = {"u": [-0.5, 0.5], "v": [-0.5, 0.2]}
    band_rows = [r for r in lo["III_band_rows"] if r["v"] <= BAND["v"][1] + 1e-9]
    lam_III = min(r["Lambda"] for r in band_rows) * E1
    T_edge = min(r["T"] for r in lo["III_band_rows"] if abs(r["v"] - 0.2) < 1e-9 or r["v"] <= -0.5 + 1e-9 or abs(abs(r["u"]) - 0.5) < 1e-9) * E1
    lam_IV = lo["IV_point"]["inradius_e1"]
    hess = lo["III_T_exact"]["hessian_eig_float"]
    qIV = min(q["coef"] for q in lo["IV_point"].get("quadratic_along_null", [{"coef": -1}]))
    crit = {
        "a_all_match": ex["a_ok"],
        "b_II_sharp>=0.1": lo["II_point"]["inradius_e1"] >= 0.1,
        "b_III_band_Lambda>=0.05": lam_III >= 0.05,
        "b_IV_Lambda>=0.05": (lam_IV or 0) >= 0.05,
        "b_III_T_hessian_pos": min(hess) > 0,
        "b_IV_quadratic_pos": qIV > 0,
        "c_negatives_0": all(sc[r]["negatives"] == 0 for r in ("II", "III", "IV")),
    }
    summary = {
        "decision": "\u7d9a\u3051\u308b\uff08O1 \u3078\uff09" if all(crit.values()) else "\u6761\u4ef6\u306b\u5408\u308f\u306a\u3044\u9805\u76ee\u3042\u308a\uff087 \u7bc0\u672b\u306e\u3084\u3081\u308b\u6761\u4ef6\u3092\u898b\u308b\uff09",
        "criteria": crit,
        "numbers_e1": {
            "II_point_sharpness": lo["II_point"]["inradius_e1"],
            "II_sampled_min_slope": lo["II_point"]["sampled_min_slope_e1"],
            "III_band": BAND, "III_band_Lambda_min": lam_III, "III_band_T_min_on_edge": T_edge,
            "III_grid_Lambda_min_incl_v0.25": lo["III_band_Lambda_min_e1"], "III_band_Lambda_at0": lo["III_band_Lambda_at0_e1"],
            "III_T_hessian_eig": lo["III_T_exact"]["hessian_eig_e1"],
            "IV_Lambda": lam_IV, "IV_quadratic_coef_min": qIV,
            "IV_null_n_dir": lo["IV_point"].get("null_n_dir"),
            "scan_min": {r: sc[r]["min_e1"] for r in ("II", "III", "IV")},
            "scan_points": sc["items"], "scan_seconds": sc["seconds"],
            "scan_min_by_angle": {r: sc[r]["min_by_angle_0.1rad_bins"] for r in ("II", "III", "IV")},
        },
    }
    out = {"summary": summary, "exact": ex, "local": lo, "scan": {k: v for k, v in sc.items() if k != "rows"}}
    json.dump(out, open(FINAL, "w", encoding="utf8"), ensure_ascii=False, indent=1, default=float)
    print(json.dumps(summary, ensure_ascii=False, indent=1, default=float))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["exact", "local", "scan", "report"])
    ap.add_argument("--procs", type=int, default=3)
    a = ap.parse_args()
    {"exact": part_exact, "local": part_local, "scan": lambda: part_scan(a.procs), "report": part_report}[a.cmd]()
