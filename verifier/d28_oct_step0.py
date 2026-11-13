# Step 0 of D28 4.3 and §6 (octintet_n02, with θ): exact placement, edge and circle identities, first-order sharpness per θ (LP), map of ψ.
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Does not import or change the existing d28_common.py (the basis of icointet and cubintet). Exact parts in sympy (field Q(√2)), LP and map in floating point.
# Usage: python d28_oct_step0.py [--grid 20] [--procs 4] [--skip-map]   → d28_octintet_step0.json
#
# Form (as in D28 2.4): container {b_f·x ≤ c}, c = s/(2√2), the piece is the unit-edge octahedron (vertices ±e_i·√2/2, orientation of solids.py).
#   F(n, R; c) = max_v n·Rv + ¼Σ_f (m(n) − n·b_f)·H_f(R) − c·m(n), n = (x, y, 1) ∈ D_n = {|y| ≤ x ≤ 1}, m(n) = b_2·n.
# If s* = 3 then c* = 3/(2√2) = 3√2/4.
import sys, json, time, math, argparse
import numpy as np
from scipy.optimize import linprog, minimize
import sympy as sp

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

R2 = sp.sqrt(2)
VS = [tuple(sp.Integer(1 if j == i else 0) * s * R2 / 2 for j in range(3)) for i in range(3) for s in (1, -1)]
BS = [tuple(sp.Integer(v) for v in b) for b in ((-1, -1, -1), (-1, 1, 1), (1, -1, 1), (1, 1, -1))]
CS = 3 * R2 / 4
BETA_S = R2 / 4
J = 2                                           # on D_n, m(n) = b_2·n
G0 = sp.Matrix([[-1, 0, 0], [0, 1, 0], [0, 0, -1]])

VF = np.array([[float(x) for x in v] for v in VS])
BF = np.array([[float(x) for x in b] for b in BS])
CF = 3 / (2 * math.sqrt(2))
NA = np.array([1., -1., 1.]); NB = np.array([1., 1., 1.])


def sdot(u, v):
    return sp.nsimplify(sum(a * b for a, b in zip(u, v)))


def F_sym(n, R, c=CS):
    """Exact F (sympy; R is a sympy matrix)."""
    RV = [tuple(R * sp.Matrix(v)) for v in VS]
    m = max((sp.simplify(sdot(n, b)) for b in BS), key=lambda e: float(e))
    top = max((sp.simplify(sdot(n, x)) for x in RV), key=lambda e: float(e))
    H = [max((sp.simplify(sdot(b, x)) for x in RV), key=lambda e: float(e)) for b in BS]
    return sp.simplify(top + sum((m - sdot(n, b)) * H[f] for f, b in enumerate(BS)) / 4 - c * m)


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


# ---------- exact placement (upper bound) and identities ----------
def exact_part():
    out = {}
    I = sp.eye(3)
    nA = (1, -1, 1); nB = (1, 1, 1)
    # the affine form of m (equals the max of the 4 at the 3 vertices of D_n)
    for x, y in ((0, 0), (1, 1), (1, -1)):
        n = (x, y, 1)
        need(all(sdot(n, b) <= sdot(n, BS[J]) for b in BS) and sdot(n, BS[J]) == 1 + x - y, "m(n) = b_2·n")
    FA = F_sym(nA, I); FB = F_sym(nB, I)
    need(sp.simplify(FA + R2 / 4) == 0 and sp.simplify(FB - R2 / 4) == 0, "F(n_A, I) = −√2/4, F(n_B, I) = √2/4")
    out["F(n_A,I)"] = str(FA); out["F(n_B,I)"] = str(FB)
    # upper-bound placement: piece 1 is the minimal translation for (n_A, I), piece 2 the −n_A side via g0 (F(−n, R) = F(g0(−n), g0 R), g0(−n_A) = n_B)
    def trans(n, R):
        RV = [R * sp.Matrix(v) for v in VS]
        H = [max((sdot(b, x) for x in RV), key=lambda e: float(e)) for b in BS]
        D = 4 * CS - sum(H)
        cT = [-sum(H[f] * BS[f][i] for f in range(4)) / 4 for i in range(3)]
        j = max(range(4), key=lambda k: float(sdot(n, BS[k])))
        return [sp.simplify(cT[i] - D / 4 * BS[j][i]) for i in range(3)], RV
    t1, RV1 = trans(nA, I)
    mnA = tuple(-v for v in nA)
    # at −n_A three values of m tie (a slab). Any point on the face of T is minimal. Here the vertex of b_0 is used
    t2, RV2 = trans(mnA, G0)
    P1 = [sp.Matrix(t1) + v for v in RV1]; P2 = [sp.Matrix(t2) + v for v in RV2]
    cnt = 0
    for P in (P1, P2):
        for p in P:
            for b in BS:
                need(sp.simplify(sdot(b, p) - CS) <= 0, "inside the container"); cnt += 1
    h = max((sdot(nA, p) for p in P1), key=lambda e: float(e))
    need(all(sp.simplify(sdot(nA, p) - h) >= 0 for p in P2), "separating plane")
    contacts = sum(1 for P in (P1, P2) for p in P for b in BS if sp.simplify(sdot(b, p) - CS) == 0)
    out["upper_bound_placement"] = dict(t1=[str(v) for v in t1], t2=[str(v) for v in t2], containment_checks=cnt, contacts=contacts,
                           s=str(sp.simplify(2 * R2 * CS)), separating_plane_height=str(h))
    # edge x = 1: F((1, y, 1), I) = (√2/4)·y (y ∈ [−1, 1], affine in y. On the edge m = b_2·n, top = 1/√2, H_f = 1/√2 do not depend on y)
    ys = sp.Symbol("y")
    n = (1, ys, 1)
    RV = [tuple(sp.Matrix(v)) for v in VS]
    tops = [sdot(n, x) for x in RV]                      # ±1/√2, ±y/√2
    need(all(sp.simplify(t - R2 / 2) <= 0 for t in tops if t.free_symbols == set()), "top")
    Hs = [max((sdot(b, x) for x in RV), key=lambda e: float(e)) for b in BS]
    need(all(sp.simplify(hh - R2 / 2) == 0 for hh in Hs), "H_f(I) = 1/√2")
    Fy = R2 / 2 + sum(((1 - ys + 1) - sdot(n, b)) * Hs[f] for f, b in enumerate(BS)) / 4 - CS * (2 - ys)
    need(sp.simplify(Fy - R2 / 4 * ys) == 0, "edge identity")
    for yv in (sp.Integer(-1), sp.Rational(-1, 2), sp.Integer(0), sp.Rational(1, 3), sp.Integer(1)):
        need(sp.simplify(F_sym((1, yv, 1), I) - R2 / 4 * yv) == 0, f"edge point y={yv}")
    out["edge_identity"] = ("F((1,y,1), I) = (√2/4)·y (y ∈ [−1,1], checked as a formula, and F directly at y = −1, −1/2, 0, 1/3, 1). "
                     "With κ = βy, β = √2/4: F(n, I) + F(σn, I) = 0 on the whole edge x = 1, so the margin ψ(n)+ψ(σn) is ≤ 0 on the whole edge (equality if s* = 3)")
    # circle: with R(u) = rotation (1, u, u, u) (about n_B, u = tan(θ/2)/√3), F(n_B, R(u)) = √2/4 does not depend on u
    u = sp.Symbol("u", real=True)
    q = (1, u, u, u)
    w, a, b_, c_ = q
    Rq = sp.Matrix([[w*w + a*a - b_*b_ - c_*c_, 2*(a*b_ - w*c_), 2*(a*c_ + w*b_)],
                    [2*(a*b_ + w*c_), w*w - a*a + b_*b_ - c_*c_, 2*(b_*c_ - w*a)],
                    [2*(a*c_ - w*b_), 2*(b_*c_ + w*a), w*w - a*a - b_*b_ + c_*c_]]) / (1 + 3*u*u)
    RVu = [Rq * sp.Matrix(v) for v in VS]
    topu = [sp.simplify(sdot(nB, x)) for x in RVu]
    H0u = [sp.simplify(sdot(BS[0], x)) for x in RVu]
    need(sorted(topu, key=lambda e: float(e)) == sorted([sdot(nB, v) for v in VS], key=lambda e: float(e)), "n_B·Rv does not depend on u")
    need(sorted(H0u, key=lambda e: float(e)) == sorted([sdot(BS[0], v) for v in VS], key=lambda e: float(e)), "b_0·Rv does not depend on u")
    # at n_B, w_1 = w_3 = 0 (tie of m), w_0 = 4: F = max n_B·Rv + H_0(R) − c* = 1/√2 + 1/√2 − 3√2/4
    out["circle_identity"] = ("The multisets of values n_B·R(u)v and b_0·R(u)v, as rational functions of u, do not depend on u (sympy). At n_B, w_1 = w_3 = 0, so "
                     "F(n_B, R(u)) = 1/√2 + 1/√2 − 3√2/4 = √2/4 (for all u)")
    return out


# ---------- first-order part (LP, floating point) ----------
def qrot(q):
    q = np.asarray(q, float); w, x, y, z = q / np.linalg.norm(q)
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)], [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]])


def F_f(n, R, c=CF):
    RV = VF @ R.T; bn = BF @ n; m = bn.max(); H = (BF @ RV.T).max(1)
    return (RV @ n).max() + 0.25 * ((m - bn) * H).sum() - c * m


def terms(n, R, tol=1e-9):
    """First-order part: L(δ, ω) = lin·δ + Σ_groups max_{(d, w)} [d·δ + w·ω] (δ = change of n, ω = rotation vector, R → exp(ω)R)."""
    RV = VF @ R.T; bn = BF @ n; m = bn.max(); need(abs(m - BF[J] @ n) < 1e-12, "m = b_2·n")
    top = (RV @ n).max(); T0 = [i for i in range(len(RV)) if RV[i] @ n > top - tol]
    H = (BF @ RV.T).max(1)
    lin = -CF * BF[J]
    groups = [[(RV[i], np.cross(RV[i], n)) for i in T0]]
    for f in range(4):
        if f == J:
            continue
        lin = lin + 0.25 * H[f] * (BF[J] - BF[f])
        wf = (BF[J] - BF[f]) @ n
        if wf > 1e-12:
            Tf = [i for i in range(len(RV)) if BF[f] @ RV[i] > H[f] - tol]
            groups.append([(np.zeros(3), 0.25 * wf * np.cross(RV[i], BF[f])) for i in Tf])
    return lin, groups


NRM = math.sqrt(3)                       # δ = |n*|·(εx, εy, 0) (ε is the change of the D_n coordinates divided by |n*|)
TO_S = 2 * math.sqrt(2) / 4              # unit of s: 2√2/(m(n_A) + m(−n_A))
CONE = [np.array([1., 0.]), np.array([-1., -1.])]     # wedge at n_A: εx ≤ 0, εx + εy ≥ 0


def lp(pieces, nvar, beta=0., gam=0.):
    """pieces: (lin, groups, sign of εy, position of ω, basis of ω, sign of κ). min of L − (first order of κ) over ‖(ε, ω)‖∞ = 1, ε in the wedge."""
    ngr = sum(len(p[1]) for p in pieces); nx = nvar + ngr
    cost = np.zeros(nx); A = []; b = []; gi = nvar
    for lin, groups, sy, wpos, Wb, ls in pieces:
        E = NRM * np.array([[1, 0], [0, sy], [0, 0]], float)
        cost[0:2] += E.T @ lin
        cost[0] -= ls * gam * NRM; cost[1] -= ls * beta * NRM
        k = Wb.shape[1]
        for g in groups:
            cost[gi] = 1
            for dco, wco in g:
                r = np.zeros(nx); r[0:2] = E.T @ dco; r[wpos:wpos+k] = Wb.T @ wco; r[gi] = -1; A.append(r); b.append(0.)
            gi += 1
    for row in CONE:
        r = np.zeros(nx); r[0:2] = row; A.append(r); b.append(0.)
    best = (np.inf, None)
    for kk in range(nvar):
        for s in (1, -1):
            bnds = [(-1, 1)] * nvar + [(None, None)] * ngr; bnds[kk] = (s, s)
            res = linprog(cost, A_ub=np.array(A), b_ub=np.array(b), bounds=bnds, method="highs")
            if res.status == 2:
                continue
            need(res.status == 0, "LP")
            if res.fun < best[0]:
                best = (float(res.fun), [round(v, 4) for v in res.x[:nvar]])
    return best


def first_order(nth=61):
    I3 = np.eye(3)
    P = np.array([[1, -1, 0], [1, 1, -2]], float).T; P /= np.linalg.norm(P, axis=0)     # ω perpendicular to n_B (transverse tilt)
    lA, gA = terms(NA, I3)
    ths = np.linspace(-math.pi / 3, math.pi / 3, nth)                                   # ±60° about the 3-fold axis of the piece is a fundamental domain
    rows = []
    for th in ths:
        uu = math.tan(th / 2) / math.sqrt(3)
        lB, gB = terms(NB, qrot([1, uu, uu, uu]))
        v2, d2 = lp([(lA, gA, 1, 2, I3, 0), (lB, gB, -1, 5, P, 0)], 7)
        vA, _ = lp([(lA, gA, 1, 2, I3, 1)], 5, math.sqrt(2) / 4)
        vB, dB = lp([(lB, gB, -1, 2, P, -1)], 4, math.sqrt(2) / 4)
        rows.append(dict(theta_deg=round(math.degrees(th), 2), two_piece_sharpness_s=round(v2 * TO_S, 6), min_direction=d2,
                         one_piece_A_beta_r2q=round(vA * TO_S, 6), one_piece_B_beta_r2q=round(vB * TO_S, 6), B_min_direction=dB))
    # at interior points of the edge (n = (1, y, 1), both R = I): transverse sharpness without the direction along the edge (εy free)
    side = []
    for yv in (-0.75, -0.5, 0.0, 0.5, 0.75):
        n1 = np.array([1, yv, 1.]); n2 = np.array([1, -yv, 1.])
        l1, g1 = terms(n1, I3); l2, g2 = terms(n2, I3)
        ngr = len(g1) + len(g2); nx = 8 + ngr
        cost = np.zeros(nx); A = []; b = []; gi = 8
        for lin, groups, sy, wpos in ((l1, g1, 1, 2), (l2, g2, -1, 5)):
            E = np.array([[1, 0], [0, sy], [0, 0]], float)
            cost[0:2] += E.T @ lin
            for g in groups:
                cost[gi] = 1
                for dco, wco in g:
                    r = np.zeros(nx); r[0:2] = E.T @ dco; r[wpos:wpos+3] = wco; r[gi] = -1; A.append(r); b.append(0.)
                gi += 1
        r = np.zeros(nx); r[0] = 1; A.append(r); b.append(0.)          # the x ≤ 1 side
        best = np.inf
        for kk in [0] + list(range(2, 8)):
            for s in (1, -1):
                bnds = [(-1, 1), (-10, 10)] + [(-1, 1)] * 6 + [(None, None)] * ngr; bnds[kk] = (s, s)
                res = linprog(cost, A_ub=np.array(A), b_ub=np.array(b), bounds=bnds, method="highs")
                if res.status == 0:
                    best = min(best, res.fun)
        side.append(dict(y=yv, transverse_sharpness_s=round(best * 2 * math.sqrt(2) / 4, 6)))
    v2s = [r["two_piece_sharpness_s"] for r in rows]
    return dict(per_theta=rows, two_piece_sharpness_min=min(v2s), two_piece_sharpness_min_theta=rows[int(np.argmin(v2s))]["theta_deg"],
                edge_interior_transverse_sharpness=side,
                units="units of s. r2q means β = √2/4. ε is the change of the D_n coordinates ÷ |n*| (√3), ω is the rotation vector (radians), ‖(ε, ω)‖∞ = 1. ω of piece 2 has the 2 components perpendicular to n_B (the spinning direction is excluded)")


# ---------- map of ψ (floating point) ----------
_QS = None


def psi_f(n, nsamp=6000, nstart=12):
    global _QS
    if _QS is None:
        rng = np.random.default_rng(0)
        _QS = [qrot(q) for q in rng.normal(size=(nsamp, 4))] + [np.eye(3)]
    vals = np.array([F_f(n, R) for R in _QS]); best = np.inf
    for i in np.argsort(vals)[:nstart]:
        R0 = _QS[i]
        r = minimize(lambda q: F_f(n, qrot(q) @ R0), [1, 0, 0, 0], method="Nelder-Mead",
                     options=dict(xatol=1e-11, fatol=1e-14, maxiter=4000))
        best = min(best, r.fun)
    return best


def _w(pt):
    x, y = pt
    return (x, y, psi_f(np.array([x, y, 1.0])))


def psi_map(grid, procs):
    from multiprocessing import Pool
    pts = [(i / grid, j / grid) for i in range(grid + 1) for j in range(-i, i + 1)]
    with Pool(procs) as pool:
        res = pool.map(_w, pts, chunksize=4)
    P = {(round(x * grid), round(y * grid)): v for x, y, v in res}
    rows = []
    for (i, j), v in P.items():
        x, y = i / grid, j / grid
        sig = 2 * math.sqrt(2) * (v + P[(i, -j)]) / (2 + 2 * x)
        dA = max(abs(x - 1), abs(y + 1)); dB = max(abs(x - 1), abs(y - 1))
        rows.append((x, y, v, sig, min(dA, dB)))
    far = [r for r in rows if r[4] > 0.05]
    mn = min(far, key=lambda r: r[3])
    small = sorted([[r[0], r[1], round(r[3], 6)] for r in far if r[3] < 0.005])
    return dict(n_points=len(rows), margin_min_beyond_0_05_from_n_A_n_B=dict(x=mn[0], y=mn[1], margin_s=mn[3]),
                n_points_margin_below_0_005=len(small), points_margin_below_0_005=small,
                margin_min_for_x_below_1=min(r[3] for r in rows if r[0] < 1 - 1e-9),
                table=[[r[0], r[1], round(r[2], 9), round(r[3], 9)] for r in sorted(rows)])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--grid", type=int, default=20); ap.add_argument("--procs", type=int, default=4)
    ap.add_argument("--skip-map", action="store_true")
    a = ap.parse_args()
    t0 = time.time()
    out = {"note": "Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof"}
    out["exact"] = exact_part(); print("exact part OK", json.dumps(out["exact"], ensure_ascii=False), flush=True)
    out["first_order"] = fo = first_order(); print(json.dumps({k: v for k, v in fo.items() if k != "per_theta"}, ensure_ascii=False), flush=True)
    if not a.skip_map:
        out["psi_map"] = psi_map(a.grid, a.procs)
        print(json.dumps({k: v for k, v in out["psi_map"].items() if k != "table"}, ensure_ascii=False), flush=True)
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open("d28_octintet_step0.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print("seconds", out["seconds"], flush=True)


if __name__ == "__main__":
    main()
