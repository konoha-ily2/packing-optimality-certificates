# Step 0 of D31 §5 (octintet_n02): 0a formulas (exact, sympy), 0b sharpness of J (LP), 0c sharpness of C and E (LP), 0d one-sided margin (floating-point map).
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The existing d28_oct_step0.py is only imported (F_sym, psi_f), never changed.
# Usage (in the working directory):
#   python d31_step0.py --part abc            → d31_octintet_step0.json (0a to 0c)
#   python d31_step0.py --part d --procs 4    → adds 0d to the same json
# Printed lines are also appended to d31_octintet_step0.log.
import sys, json, time, math, argparse, random, os
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
from scipy.optimize import linprog

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

import d31_common as dc
from d31_common import H, K, U, P1, P2, A, B, C

OUT = "d31_octintet_step0.json"
LOG = "d31_octintet_step0.log"


def log(*a):
    s = " ".join(str(x) for x in a)
    print(s, flush=True)
    with open(LOG, "a", encoding="utf-8") as f:
        f.write(s + "\n")


def need(c, msg):
    if not c:
        log("mismatch:", msg)
        raise RuntimeError(msg)


def load():
    if os.path.exists(OUT):
        return json.load(open(OUT, encoding="utf-8"))
    return {"note": "Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof"}


def save(out):
    cur = load(); cur.update(out); out = cur              # running 0d and 0a-0c separately does not erase either
    json.dump(out, open(OUT, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)


# ======================= 0a formulas (exact) =======================
R2 = sp.sqrt(2)
VS = [tuple(sp.Integer(1 if j == i else 0) * s * R2 / 2 for j in range(3)) for i in range(3) for s in (1, -1)]


def _xmax(vals):
    """Exact maximum (compares values in Q(√2) by the sign of the difference)."""
    m = vals[0]
    for v in vals[1:]:
        if sp.radsimp(sp.expand(v - m)) > 0:
            m = v
    return m


def F_exact(n, R, c=3 * R2 / 4):
    """Same formula as d28_oct_step0.F_sym (max_v n·Rv + ¼Σ(m − n·b_f)H_f − c·m). Does not use nsimplify."""
    dot = lambda p, w: sp.expand(sum(a_ * b_ for a_, b_ in zip(p, w)))
    RV = [tuple(R * sp.Matrix(v)) for v in VS]
    m = _xmax([dot(n, b) for b in dc.BS])
    top = _xmax([dot(n, x) for x in RV])
    Hf = [_xmax([dot(b, x) for x in RV]) for b in dc.BS]
    return sp.expand(top + sum((m - dot(n, b)) * Hf[f] for f, b in enumerate(dc.BS)) / 4 - c * m)


def step0a():
    import d28_oct_step0 as d28
    res = {}
    # (i) F_sym − (√2/4)y = (√2/2)·g at 20 random rational points
    rnd = random.Random(31)
    pts = []
    for t in range(20):
        a_ = rnd.randint(1, 97)
        x = sp.Rational(a_, 97); y = sp.Rational(rnd.randint(-a_, a_), 97)
        if t < 4:                                   # 4 points on the edge x = 1
            x = sp.Integer(1); y = sp.Rational(rnd.randint(-8, 8), 8)
        q = [rnd.randint(-4, 4) for _ in range(4)]
        if t in (4, 5):                             # 2 points with R(u) = (1, u, u, u) (circle)
            uu = sp.Rational(rnd.randint(-3, 3), 9); q = [1, uu, uu, uu]
        if t == 6:
            q = [1, 0, 0, 0]
        if all(v == 0 for v in q):
            q = [1, 0, 0, 0]
        q = [sp.nsimplify(v) for v in q]
        R = dc.Mq(*q) / sum(v * v for v in q)
        n = (x, y, sp.Integer(1))
        Fv = F_exact(n, R)
        h = 1 - x; k = x - y
        g = dc.g_exact(h, k, R)
        diff = sp.radsimp(sp.expand(Fv - sp.sqrt(2) / 4 * y - sp.sqrt(2) / 2 * g))
        need(diff == 0, f"(i) point {t}: x={x}, y={y}, q={q}, diff={diff}")
        # for reference: numeric difference from F_sym of d28 (which uses nsimplify)
        dF = float(sp.N(d28.F_sym(n, R) - Fv, 30))
        pts.append(dict(x=str(x), y=str(y), q=[str(v) for v in q], g=str(g), numeric_diff_from_F_sym=dF))
    res["(i) F − (√2/4)y = (√2/2)g"] = dict(
        n_points=len(pts), passed="all 20 points agree (the difference is exactly 0 in sympy)",
        remark="F is F_exact, the formula of d28_oct_step0.F_sym copied without nsimplify. In F_sym, nsimplify sometimes replaces a value in Q(√2) "
           "by a different, approximate closed form (a power like 2^(151/329)...) (difference 5e−20 at point 5), so it could not be used for an exact comparison",
        numeric_diff_from_F_sym_max=max(abs(p["numeric_diff_from_F_sym"]) for p in pts), points=pts)
    log("0a (i) 20 points agree")

    # (ii) zero-order identities (as polynomials)
    PJ = dc.Poly(H, K, dc.q_J(U, P1, P2))
    PC = {c: PJ.P(c) for c in dc.CANDS_SC}
    nE = nC = 0
    for c in dc.CANDS_SE:
        e1 = sp.expand(PC[c].subs({H: 0, P1: 0, P2: 0, U: 0}))     # R = I, h = 0, k′ symbolic
        e2 = sp.expand(PC[c].subs({H: 0, K: 0, P1: 0, P2: 0}))     # n_B, R(u), u symbolic
        need(e1 == 0, f"(ii) S_E {dc.cname(c)}: G_c(0,k′,I) = {e1}")
        need(e2 == 0, f"(ii) S_E {dc.cname(c)}: G_c(0,0,R(u)) = {e2}")
        nE += 1
    for c in dc.CANDS_SC:
        e2 = sp.expand(PC[c].subs({H: 0, K: 0, P1: 0, P2: 0}))
        need(e2 == 0, f"(ii) S_C {dc.cname(c)}: G_c(0,0,R(u)) = {e2}")
        nC += 1
    res["(ii) zero-order identities"] = dict(S_E=f"G_c(0,k′,I) ≡ 0 and G_c(0,0,R(u)) ≡ 0 for {nE} candidates (as polynomials times |q|²)",
                                 S_C=f"G_c(0,0,R(u)) ≡ 0 for {nC} candidates")
    log("0a (ii) S_E", nE, "S_C", nC, "agree")
    # check that the candidates with i = 2 are not 0 on the edge (the reason to leave them out of S_E)
    c2 = (1, 0, 0, 0)
    res["(ii) for reference: value on the edge for i=2"] = str(sp.factor(PC[c2].subs({H: 0, P1: 0, P2: 0, U: 0})))

    # (iii) T_c = (|q|²G_c)|_{ζ=0} = k′u(e0 + e1 u)
    tab = {}
    E = {}
    for c in dc.CANDS_SE:
        T = sp.expand(PC[c].subs({H: 0, P1: 0, P2: 0}))
        qt, rm = sp.div(sp.Poly(T, K, U), sp.Poly(K * U, K, U))
        need(rm.is_zero, f"(iii) {dc.cname(c)}: T_c is not divisible by k′u: {T}")
        Eq = sp.Poly(qt.as_expr(), K, U)
        need(Eq.degree(K) <= 0 and Eq.degree(U) <= 1, f"(iii) {dc.cname(c)}: E_c is not affine in u: {Eq}")
        e0 = Eq.as_expr().subs(U, 0); e1 = sp.diff(Eq.as_expr(), U)
        E[c] = (sp.Rational(e0), sp.Rational(e1))
        tab.setdefault((str(e0), str(e1)), []).append(dc.cname(c))
    good_p = [c for c in dc.CANDS_SE if E[c] == (6, -6)]
    bad_p = [c for c in dc.CANDS_SE if E[c] == (2, -6)]
    good_m = [c for c in dc.CANDS_SE if E[c] == (-6, -6)]
    bad_m = [c for c in dc.CANDS_SE if E[c] == (-2, -6)]
    need(len(good_p) > 0 and len(bad_p) > 0, "(iii) no candidates of the form 6k′u(1−u) or k′u(2−6u)")
    res["(iii) table of T_c"] = dict(
        form="T_c = k′·u·(e0 + e1·u) (divisible for all 54 candidates, E_c affine in u)",
        table={f"e0={k_[0]}, e1={k_[1]}": dict(count=len(v), candidates=v) for k_, v in sorted(tab.items(), key=lambda t: (-float(sp.Rational(t[0][0])), float(sp.Rational(t[0][1]))))},
        good_u_pos=[dc.cname(c) for c in good_p], bad_only_in_n_u_pos=[dc.cname(c) for c in bad_p],
        good_u_neg=[dc.cname(c) for c in good_m], bad_only_in_n_u_neg=[dc.cname(c) for c in bad_m],
        compare_with_D31_1_3_guide=None)
    # compare e0 with the first-order guide ε_i + δ1 + δ3 of D31 1.3 (may swap with the orientation)
    eps = {0: -1, 2: 1}; d1 = {0: 0, 1: 1, 2: -1}; d3 = {0: 1, 1: -1, 2: 0}
    agree = sum(1 for c in dc.CANDS_SE if E[c][0] == 2 * (eps[c[0]] + d1[c[2]] + d3[c[3]]))
    agree_m = sum(1 for c in dc.CANDS_SE if E[c][0] == -2 * (eps[c[0]] + d1[c[2]] + d3[c[3]]))
    res["(iii) table of T_c"]["compare_with_D31_1_3_guide"] = f"e0 = 2(ε_i+δ1+δ3) for {agree}/54, e0 = −2(ε_i+δ1+δ3) for {agree_m}/54 (a guide; the decision is by computing e0)"
    log("0a (iii)", {f"{k_[0]},{k_[1]}": len(v) for k_, v in tab.items()})
    log("   good(u>0):", [dc.cname(c) for c in good_p], " bad only in n(u>0):", [dc.cname(c) for c in bad_p])
    log("  ", res["(iii) table of T_c"]["compare_with_D31_1_3_guide"])
    return res, PJ, PC, E


# ======================= LP tools =======================
def faces_of(lb, ub):
    """The faces ‖ζ̂‖∞ = 1 that lie in the range [lb, ub] of ζ̂ (lb is 0 or −1)."""
    out = []
    for i in range(len(lb)):
        out.append((i, 1.0))
        if lb[i] < 0:
            out.append((i, -1.0))
    return out


def sharp_max(G, lb, ub):
    """min_{face} min_ζ̂ max_c G[c]·ζ̂ (the best candidate at each point). G: (number of candidates, d)."""
    G = np.asarray(G, float); m, d = G.shape
    best = (np.inf, None, None)
    for (fi, fv) in faces_of(lb, ub):
        cost = np.zeros(d + 1); cost[d] = 1
        Aub = np.hstack([G, -np.ones((m, 1))]); bub = np.zeros(m)
        bnds = [(lb[i], ub[i]) for i in range(d)] + [(None, None)]
        bnds[fi] = (fv, fv)
        r = linprog(cost, A_ub=Aub, b_ub=bub, bounds=bnds, method="highs")
        need(r.status == 0, "LP (max)")
        if r.fun < best[0]:
            best = (float(r.fun), (fi, fv), [round(v, 4) for v in r.x[:d]])
    return best


def sharp_avg(G, lb, ub, Econ):
    """Option 2 (a): min_{face} max_{λ ≥ 0, Σλ = 1, Econ·λ ≥ 0} min_{face vertices} Σλ_c G[c]·ζ̂."""
    G = np.asarray(G, float); m, d = G.shape
    best = np.inf
    for (fi, fv) in faces_of(lb, ub):
        free = [i for i in range(d) if i != fi]
        verts = []
        for bits in range(1 << len(free)):
            z = np.zeros(d); z[fi] = fv
            for t, i in enumerate(free):
                z[i] = ub[i] if (bits >> t) & 1 else lb[i]
            verts.append(z)
        V = np.array(verts) @ G.T                         # (vertex, candidate)
        cost = np.zeros(m + 1); cost[m] = -1               # max t
        Aub = [np.hstack([-V[v], [1.0]]) for v in range(len(V))]; bub = [0.0] * len(V)
        for row in Econ:
            Aub.append(np.hstack([-np.asarray(row, float), [0.0]])); bub.append(0.0)
        Aeq = [np.hstack([np.ones(m), [0.0]])]
        r = linprog(cost, A_ub=np.array(Aub), b_ub=np.array(bub), A_eq=np.array(Aeq), b_eq=[1.0],
                    bounds=[(0, None)] * m + [(None, None)], method="highs")
        if r.status == 2:
            return -np.inf
        need(r.status == 0, "LP (average)")
        best = min(best, -r.fun)
    return best


# ======================= 0b sharpness of J =======================
def grids():
    ks = [Fr(i, 16) for i in range(33)]
    us = [Fr(i, 32) for i in range(-12, 13)]
    return ks, us


def allowed(Ec, uv):
    """With s the sign of the u side, s·E_c ≥ 0 on the whole of [0, u] (u = 0: both sides separately)."""
    e0, e1 = Ec
    sides = []
    if uv > 0:
        sides = [(1, uv)]
    elif uv < 0:
        sides = [(-1, uv)]
    else:
        sides = [(1, Fr(1, 32)), (-1, Fr(-1, 32))]      # u = 0: both sides (up to the neighbouring grid point)
    return [(s, e0 * s >= 0 and (e0 + e1 * ue) * s >= 0) for s, ue in sides], sides


def step0b(PJ, PC, E):
    zeta = (H, P1, P2)
    sub0 = {H: 0, P1: 0, P2: 0}
    grads = {c: [sp.lambdify((K, U), sp.diff(PC[c], z).subs(sub0), "math") for z in zeta] for c in dc.CANDS_SE}
    ks, us = grids()
    lb, ub = [0.0, -1.0, -1.0], [1.0, 1.0, 1.0]
    rows = []
    for kv in ks:
        for uv in us:
            Gall = {c: [f(float(kv), float(uv)) for f in grads[c]] for c in dc.CANDS_SE}
            okl, sides = allowed((0, 0), uv)
            vals = []; vals_avg = []; info = []
            for s, ue in sides:
                cs = [c for c in dc.CANDS_SE if E[c][0] * s >= 0 and (E[c][0] + E[c][1] * ue) * s >= 0]
                if not cs:
                    vals.append(-np.inf); vals_avg.append(-np.inf); continue
                v, face, z = sharp_max([Gall[c] for c in cs], lb, ub)
                vals.append(v); info.append(dict(side=s, face=face, direction=z, n_candidates=len(cs)))
                Econ = [[float((E[c][0] + E[c][1] * ue_) * s) for c in dc.CANDS_SE] for ue_ in (Fr(0), ue)]
                vals_avg.append(sharp_avg([Gall[c] for c in dc.CANDS_SE], lb, ub, Econ))
            rows.append(dict(k=str(kv), u=str(uv), sharpness=round(min(vals), 6), avg_sharpness=round(min(vals_avg), 6), details=info))
    # rectangles [0, k_J] × [−u_J, u_J] with all points ≥ 0.05 (on the grid)
    V = {(Fr(r["k"]), Fr(r["u"])): r["sharpness"] for r in rows}
    VA = {(Fr(r["k"]), Fr(r["u"])): r["avg_sharpness"] for r in rows}

    def front(Vd, thr):
        fr = []
        for kv in ks:
            best = None
            for um in [Fr(i, 32) for i in range(0, 13)]:
                if all(Vd[(k_, u_)] >= thr for k_ in ks if k_ <= kv for u_ in us if abs(u_) <= um):
                    best = um
            fr.append((kv, best))
        return fr
    fr05 = front(V, 0.05); fr03 = front(V, 0.03); fr05a = front(VA, 0.05)
    base_ok = all(V[(k_, u_)] >= 0.05 for k_ in ks if k_ <= Fr(1, 4) for u_ in us if abs(u_) <= Fr(1, 16))
    # choice of k_J, u_J: the largest k_J keeping u_J ≥ 1/16, then the largest u_J for that k_J
    cand = [(kv, um) for kv, um in fr05 if um is not None and um >= Fr(1, 16)]
    kJ, uJ = (max(cand, key=lambda t: (t[0], t[1])) if cand else (None, None))
    # the largest u_J for the same k_J
    if kJ is not None:
        uJ = max(um for kv, um in fr05 if kv == kJ)
    fmt = lambda fr: [[str(k_), (str(u_) if u_ is not None else None)] for k_, u_ in fr]
    res = dict(
        definition="λ_J(k′,u) = min_{the 5 faces of ζ̂ (ĥ ≥ 0, ‖ζ̂‖∞ = 1)} max_{c ∈ S_E, s·E_c ≥ 0 on [0,u]} Λ_c(ζ̂; r=0), where Λ is the part of |q|²G_c linear in ζ = (h,p1,p2). At u = 0 the smaller of the two sides ([0, ±1/32])",
        grid="k′ ∈ {0, 1/16, …, 2} × u ∈ {0, ±1/32, …, ±3/8} (825 points)",
        junction_00=dict(sharpness=V[(Fr(0), Fr(0))], avg_sharpness=VA[(Fr(0), Fr(0))]),
        minimum=dict(value=min(V.values()), position=[str(t) for t in min(V, key=V.get)]),
        at_least_0_05_for_k_le_1_4_and_u_le_1_16=base_ok,
        rectangle_front_0_05=fmt(fr05), rectangle_front_0_03=fmt(fr03), avg_rectangle_front_0_05=fmt(fr05a),
        k_J=str(kJ) if kJ is not None else None, u_J=str(uJ) if uJ is not None else None,
        table=[[r["k"], r["u"], r["sharpness"], r["avg_sharpness"]] for r in rows],
        details=rows)
    return res


# ======================= 0c sharpness of C and E =======================
def step0c(PJ, PC, kJ):
    # C: family S_C, transverse (h, k′, p1, p2), base u
    zeta = (H, K, P1, P2)
    sub0 = {H: 0, K: 0, P1: 0, P2: 0}
    grads = {c: [sp.lambdify(U, sp.diff(PC[c], z).subs(sub0), "math") for z in zeta] for c in dc.CANDS_SC}
    _, us = grids()
    rowsC = []
    for uv in us:
        G = [[f(float(uv)) for f in grads[c]] for c in dc.CANDS_SC]
        v, face, z = sharp_max(G, [0.0, 0.0, -1.0, -1.0], [1.0, 1.0, 1.0, 1.0])
        rowsC.append(dict(u=str(uv), sharpness=round(v, 6), face=face, direction=z))
    # E: family S_E, transverse (h, a, b, c), base k′, q = (1, a, b, c)
    PE = dc.Poly(H, K, (1, A, B, C))
    zetaE = (H, A, B, C)
    subE = {H: 0, A: 0, B: 0, C: 0}
    ok0 = all(sp.expand(PE.P(c).subs(subE)) == 0 for c in dc.CANDS_SE)
    need(ok0, "zero-order identity of E: G_c(0, k′, I) ≡ 0")
    gradsE = {c: [sp.lambdify(K, sp.diff(PE.P(c), z).subs(subE), "math") for z in zetaE] for c in dc.CANDS_SE}
    ks, _ = grids()
    rowsE = []
    for kv in ks:
        G = [[f(float(kv)) for f in gradsE[c]] for c in dc.CANDS_SE]
        v, face, z = sharp_max(G, [0.0, -1.0, -1.0, -1.0], [1.0, 1.0, 1.0, 1.0])
        rowsE.append(dict(k=str(kv), sharpness=round(v, 6), face=face, direction=z))
    return dict(
        C=dict(definition="min_{the 6 faces of (h,k′,p1,p2) (ĥ,k̂ ≥ 0)} max_{c ∈ S_C} ∂(|q|²G_c)·ζ̂ at (0,0,R(u))", table=rowsC),
        E=dict(definition="min_{the 7 faces of (h,a,b,c) (ĥ ≥ 0)} max_{c ∈ S_E} ∂(|q|²G_c)·ζ̂ at (h=0, k′, I), q = (1,a,b,c)",
               used=("used since k_J < 2" if (kJ is not None and Fr(kJ) < 2) else "for reference only since k_J = 2 (or undecided)"),
               zero_order=f"G_c(0,k′,I) ≡ 0 for the 54 candidates of S_E (also in the coordinates q = (1,a,b,c))", table=rowsE))


# ======================= 0d one-sided margin (floating point) =======================
def _wd(pt):
    import d28_oct_step0 as d28
    i, j, grid = pt
    x, y = i / grid, j / grid
    psi = d28.psi_f(np.array([x, y, 1.0]))
    return (i, j, math.sqrt(2) * psi - y / 2)          # g = √2·F − y/2 (F − (√2/4)y = (√2/2)g)


def step0d(grid, procs):
    from multiprocessing import Pool
    pts = [(i, j, grid) for i in range(grid + 1) for j in range(-i, i + 1)]
    with Pool(procs) as pool:
        res = pool.map(_wd, pts, chunksize=4)
    rows = [(i / grid, j / grid, (grid - i) / grid, gv, i, j) for i, j, gv in res]
    # h ≤ 1/16 ⇔ grid−i ≤ grid/16, h ≥ 0.05 ⇔ (grid−i)/grid ≥ 1/20 (decided in integers)
    near = [r for r in rows if 16 * (grid - r[4]) <= grid]
    far = [r for r in rows if 20 * (grid - r[4]) >= grid]
    mn_near = min(near, key=lambda r: r[3]); mn_far = min(far, key=lambda r: r[3])
    neg_near = [[r[0], r[1], r[3]] for r in near if r[3] < -1e-9]
    bad_near = [[r[0], r[1], r[3]] for r in near if r[3] < -1e-6]
    low_far = [[r[0], r[1], r[3]] for r in far if r[3] <= 0.002]
    return dict(
        definition="min_R g(n, R) for each n = (x, y, 1) (d28_oct_step0.psi_f: 6000 sample points + Nelder–Mead from 12 points, floating point, an estimate from above)",
        n_points=len(rows),
        h_le_1_16=dict(n_points=len(near), minimum=dict(x=mn_near[0], y=mn_near[1], g=mn_near[3]),
                       below_minus_1e_9=neg_near, below_minus_1e_6=bad_near, passed=(len(neg_near) == 0)),
        h_ge_0_05=dict(n_points=len(far), minimum=dict(x=mn_far[0], y=mn_far[1], g=mn_far[3]),
                       g_le_0_002=low_far, passed=(len(low_far) == 0)),
        overall_minimum=min(r[3] for r in rows),
        table=[[r[0], r[1], round(r[3], 9)] for r in sorted(rows)])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--part", default="abc"); ap.add_argument("--grid", type=int, default=20)
    ap.add_argument("--procs", type=int, default=4)
    a = ap.parse_args()
    out = load()
    t0 = time.time()
    if "a" in a.part:
        log(f"=== step 0a-0c start {time.strftime('%Y-%m-%d %H:%M:%S')}")
        ra, PJ, PC, E = step0a()
        out["0a"] = ra; out["0a"]["seconds"] = round(time.time() - t0, 1); save(out)
        t1 = time.time()
        rb = step0b(PJ, PC, E)
        rb["seconds"] = round(time.time() - t1, 1); out["0b"] = rb; save(out)
        log("0b", json.dumps({k_: v for k_, v in rb.items() if k_ not in ("table", "details")}, ensure_ascii=False))
        t2 = time.time()
        rc = step0c(PJ, PC, rb["k_J"])
        rc["seconds"] = round(time.time() - t2, 1); out["0c"] = rc; save(out)
        log("0c C", [(r["u"], r["sharpness"]) for r in rc["C"]["table"]])
        log("0c E", [(r["k"], r["sharpness"]) for r in rc["E"]["table"]])
        log(f"0a-0c seconds {round(time.time() - t0, 1)}")
    if "d" in a.part:
        log(f"=== step 0d start {time.strftime('%Y-%m-%d %H:%M:%S')}")
        rd = step0d(a.grid, a.procs)
        rd["seconds"] = round(time.time() - t0, 1)
        out = load(); out["0d"] = rd; save(out)
        log("0d", json.dumps({k_: v for k_, v in rd.items() if k_ != "table"}, ensure_ascii=False))
    log("done", round(time.time() - t0, 1), "s")


if __name__ == "__main__":
    main()
