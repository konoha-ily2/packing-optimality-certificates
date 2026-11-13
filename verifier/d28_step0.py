# D28 stage 0 (icointet_n02, cubintet_n02, selected by --prob): exact substitution of the optimum, first-order sharpness (LP), ℓ (linear part of κ), map of ψ.
# 2026-11-12, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Usage: python d28_step0.py [--grid 20] [--procs 4]   → d28_icointet_step0.json
import sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
from scipy.optimize import linprog, minimize
import os as _os, sys as _sys
if "--prob" in _sys.argv:
    _os.environ["D28_PROB"] = _sys.argv[_sys.argv.index("--prob") + 1]
import d28_common as C
from d28_common import QD, FE, need, dot, mvec

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass


def qs(x):
    return str(FE.c_(x))


# ---------- first check: value of the formula on 5 records (cross-check only; needs external records, see check_records) ----------
REC = [("tetintet_n02", "tetrahedron", 1.953564245), ("octintet_n02", "octahedron", 3.000000000),
       ("dodintet_n02", "dodecahedron", 8.477789736), ("icointet_n02", "icosahedron", 5.358249253),
       ("cubintet_n02", "cube", 4.379445410)]


def check_records():
    # Cross-check only (not part of the proof): needs the external record files under ../records, which are not
    # distributed with this repository. Skipped when that directory is absent (added at packaging, 2026-11-13).
    if not _os.path.isdir(C.REC_DIR):
        return {"skipped": "external records not present (cross-check only, not used by the proof)"}
    out = {}
    for key, solid, expect in REC:
        r = C.read_record(key)
        Rs = [C.qrot(p[3:7]) for p in r["pieces"]]
        V = C.solid_f(solid)
        f = lambda u: 2 * math.sqrt(2) * C.c_formula(u, Rs[0], Rs[1], V)
        rng = np.random.default_rng(1)
        best = np.inf
        for _ in range(40):
            u0 = rng.normal(size=3)
            res = minimize(lambda u: f(u / np.linalg.norm(u)), u0, method="Nelder-Mead",
                           options=dict(xatol=1e-12, fatol=1e-14, maxiter=6000))
            best = min(best, res.fun)
        ok = abs(best - expect) < 2e-9
        out[key] = dict(formula_value=round(best, 10), expected=expect, s_tight=r["s_tight"], agree=ok)
        need(ok, f"{key}: formula value {best} ≠ {expect}")
    return out


def check_m_linear():
    """On D_n = {|y| ≤ x ≤ 1} (z = 1), m(n) = b_2·n = 1 + x − y and m(−n) = b_0·(−n) = 1 + x + y (linear, so checked exactly at the triangle vertices)."""
    tri = [(QD(0), QD(0)), (QD(1), QD(1)), (QD(1), QD(-1))]
    for x, y in tri:
        n = (x, y, QD(1))
        need(all(dot(n, b) <= dot(n, C.B[C.BTOP]) for b in C.B), "m(n) = b_2·n")
        need(all(-dot(n, b) <= -dot(n, C.B[C.BBOT]) for b in C.B), "m(−n) = −b_0·n")
        need(dot(n, C.B[C.BTOP]) == 1 + x - y and -dot(n, C.B[C.BBOT]) == 1 + x + y, "form of the expression")
    # −n ↦ σn = (x, −y, 1) is g0 ∈ T_d
    TD = C.td_group()
    need(C.G0 in TD, "g0 ∈ T_d")
    return "agrees exactly with the maximum of the 4 forms at the 3 vertices of D_n (linear, so on the whole triangle). g0 = diag(−1,1,−1) ∈ T_d"


# ---------- exact substitution ----------
def exact_point():
    I = C.eye()
    ns = C.NSTAR
    mns = tuple(-v for v in ns)
    F1 = C.F_exact(ns, I)
    F2 = C.F_exact(mns, C.G0)
    need(F1 == 0 and F2 == 0, f"zero-order equality: F(n*, I) = {F1}, F(−n*, g0) = {F2}")
    if C.PROB == "cubintet":
        G = C.rot_group()
        need(any(C.mmul(C.MINUS_H, k) == C.RMIN[1] for k in G), "R2 is in the orbit of −h")
        need(all(C.trace(C.mmul(C.MINUS_H, k)) <= C.trace(C.RMIN[1]) for k in G), "R2 has maximal tr in the orbit of −h")
    for Rm in C.RMIN:
        need(C.F_exact(ns, Rm) == 0 and C.F_exact(mns, C.mmul(C.G0, Rm)) == 0, "zero-order equality also at the other minimising rotation")
    t1, D1 = C.translation_exact(ns, I)
    t2, D2 = C.translation_exact(mns, C.G0)
    need(t2 == mvec(C.G0, t1), "the second piece is the image under g0")
    P1 = [tuple(v[i] + t1[i] for i in range(3)) for v in C.VERTS]
    P2 = [tuple(mvec(C.G0, v)[i] + t2[i] for i in range(3)) for v in C.VERTS]
    cnt = 0
    for P in (P1, P2):
        for p in P:
            for b in C.B:
                need(dot(b, p) <= C.C0, "inside the container"); cnt += 1
    h = max(dot(ns, p) for p in P1)
    need(min(dot(ns, p) for p in P2) >= h, "separated by the plane n*·x = h")
    contacts = sum(1 for P in (P1, P2) for p in P for b in C.B if dot(b, p) == C.C0)
    s2 = 8 * C.C0 * C.C0
    if C.SSTAR2 is not None:
        need(s2 == C.SSTAR2, "s*² agrees with the closed form")
    if C.PROB == "cubintet":
        need(2 * C.S(2) * C.C0 == 2 + C.S(6) / 2 + 2 * C.S(3) / 3, "s* = 2 + √6/2 + 2√3/3")
    # mapped back to record coordinates the centres can be compared with the record: record = Gᵀ·(D_n coordinates)
    Gm = C.GREC
    rec1 = mvec(C.transpose(Gm), t1); rec2 = mvec(C.transpose(Gm), t2)
    return dict(t1=[qs(v) for v in t1], t2=[qs(v) for v in t2], centres_in_record_coordinates=[[qs(v) for v in rec1], [qs(v) for v in rec2]],
                D_T=[qs(D1), qs(D2)], separating_plane_height=qs(h), vertex_face_checks=cnt, contacts=contacts,
                F_n_star_I=qs(F1), F_minus_n_star_g0=qs(F2), s_star_sq=qs(s2), c_star=qs(C.C0), s_star=C.s_of_c(C.C0))


# ---------- first-order part (LP) ----------
def ties_at(n, R):
    RV = [mvec(R, v) for v in C.VERTS]
    m = max(dot(n, b) for b in C.B)
    top = max(dot(n, x) for x in RV)
    T0 = [i for i, x in enumerate(RV) if dot(n, x) == top]
    j = [k for k in range(4) if dot(n, C.B[k]) == m]
    need(len(j) == 1, "no tie in m")
    j = j[0]
    H = [max(dot(b, x) for x in RV) for b in C.B]
    Tf = {f: [i for i, x in enumerate(RV) if dot(C.B[f], x) == H[f]] for f in range(4) if f != j}
    w = {f: m - dot(n, C.B[f]) for f in Tf}
    return dict(T0=T0, j=j, H=H, Tf=Tf, w=w, RV=RV)


def piece_terms(n, R):
    """Return the first-order part L(δ, ω) = max_{T0}[δ·Rv + ω·(Rv × n)] + ¼Σ_f [w_f(δ) H_f + w_f(n) max_{Tf} ω·(Rv × b_f)] − c·b_j·δ
    as "sum of linear terms + groups of maxima" (floating point). w_f(δ) = (b_j − b_f)·δ."""
    t = ties_at(n, R)
    nf = np.array([float(v) for v in n]); RVf = np.array([[float(x) for x in v] for v in t["RV"]])
    j = t["j"]
    lin_d = -C.C0F * C.BF[j]                         # linear in δ
    for f in t["Tf"]:
        lin_d = lin_d + 0.25 * float(t["H"][f]) * (C.BF[j] - C.BF[f])
    groups = []
    g0 = [(RVf[i], np.cross(RVf[i], nf)) for i in t["T0"]]       # (coefficient of δ, coefficient of ω)
    groups.append(g0)
    for f in t["Tf"]:
        wf = 0.25 * float(t["w"][f])
        groups.append([(np.zeros(3), wf * np.cross(RVf[i], C.BF[f])) for i in t["Tf"][f]])
    return lin_d, groups, t


def first_order(beta_scan=True):
    ns = C.NSTAR
    nsf = np.array([float(v) for v in ns]); nrm = np.linalg.norm(nsf)
    e1 = np.array([0., 1., 0.]); e2 = np.array([1., 0., -C.ASF]); e2 /= np.linalg.norm(e2)
    E = nrm * np.stack([e1, e2], 1)                     # δ = E ε (unit tangent vectors × |n*|)
    p1 = piece_terms(ns, C.eye())
    p2 = piece_terms(tuple(-v for v in ns), C.G0)
    mm = 2 * float(1 + C.A_STAR)                         # m(n*) + m(−n*)
    to_s = 2 * math.sqrt(2) / mm

    def lp_min(pieces, nvar, fixed, beta=0.0):
        """pieces: [(lin_d, groups, sign of δ, position of ω)]. Variables = ε(2), ω..., auxiliary t. min Σ t + Σ lin."""
        ngr = sum(len(p[1]) for p in pieces)
        nx = nvar + ngr
        cost = np.zeros(nx)
        A = []; b = []
        gi = nvar
        for lin_d, groups, sg, wpos in pieces:
            cost[0:2] += sg * (E.T @ lin_d)
            for g in groups:
                cost[gi] = 1
                for dco, wco in g:
                    r = np.zeros(nx)
                    r[0:2] = sg * (E.T @ dco); r[wpos:wpos+3] = wco; r[gi] = -1
                    A.append(r); b.append(0.0)
                gi += 1
        cost[0] -= beta * nrm                          # −β·δy, δy = |n*| ε1
        best = (np.inf, None)
        for k in range(nvar):
            for s in (1, -1):
                bounds = [(-1, 1)] * nvar + [(None, None)] * ngr
                bounds[k] = (s, s)
                r = linprog(cost, A_ub=np.array(A), b_ub=np.array(b), bounds=bounds, method="highs")
                need(r.status == 0, "LP")
                if r.fun < best[0]:
                    best = (r.fun, r.x[:nvar].tolist())
        return best

    pcs = [piece_terms(ns, Rm) for Rm in C.RMIN]
    pcs2 = [piece_terms(tuple(-v for v in ns), C.mmul(C.G0, Rm)) for Rm in C.RMIN]
    two = min((lp_min([(a[0], a[1], 1, 2), (b[0], b[1], -1, 5)], 8, None) for a in pcs for b in pcs2), key=lambda z: z[0])
    one0 = min((lp_min([(a[0], a[1], 1, 2)], 5, None) for a in pcs), key=lambda z: z[0])
    # choice of β: η(β) = min_{minimising rotations} min_{‖(ε,ω)‖∞=1} [L₁ − β δy] is concave in β; ternary search
    eta = lambda be: min(lp_min([(a[0], a[1], 1, 2)], 5, None, be)[0] for a in pcs)
    lo, hi = -10.0, 10.0
    for _ in range(80):
        a = lo + (hi - lo) / 3; bb = hi - (hi - lo) / 3
        if eta(a) < eta(bb):
            lo = a
        else:
            hi = bb
    beta = (lo + hi) / 2
    one = min((lp_min([(a[0], a[1], 1, 2)], 5, None, beta) for a in pcs), key=lambda z: z[0])
    beta_ex = float(C.BETA)
    if C.PROB == "cubintet":
        bq = Fr(beta).limit_denominator(64)
        json.dump(dict(beta=str(bq), note="optimal β of the stage-0 LP rounded to a rational with denominator ≤ 64"), open(f"d28_{C.PROB}_beta.json", "w", encoding="utf-8"))
        beta_ex = float(bq)
    one_ex = min((lp_min([(a[0], a[1], 1, 2)], 5, None, beta_ex) for a in pcs), key=lambda z: z[0])
    p1 = pcs[0]
    # numerical cross-check: first-order part vs differences of F (small steps)
    rng = np.random.default_rng(3)
    err = 0.0
    for _ in range(200):
        eps = rng.uniform(-1, 1, 2); w = rng.uniform(-1, 1, 3); h = 1e-7
        dn = E @ eps
        Fd = C.F_f(nsf + h * dn, C.expm_rot(h * w)) / h
        val = (E.T @ p1[0]) @ eps
        val += max(d @ dn + c_ @ w for d, c_ in p1[1][0])
        for g in p1[1][1:]:
            val += max(c_ @ w for _, c_ in g)
        err = max(err, abs(Fd - val))
    t1 = p1[2]
    return dict(
        ties=dict(top_vertices=t1["T0"], per_face={str(f): v for f, v in t1["Tf"].items()}, m_face=t1["j"],
                 weights={str(f): qs(v) for f, v in t1["w"].items()}),
        first_order_vs_differences=f"max difference over 200 points {err:.2e}",
        sharpness_two_pieces_s=two[0] * to_s, minimising_direction_two_pieces=two[1],
        margin_one_piece_beta0=one0[0] * to_s,
        beta=beta, beta_chart=beta, margin_one_piece_beta_s=one[0] * to_s, minimising_direction_one_piece=one[1],
        beta_used=beta_ex, margin_at_beta_used_s=one_ex[0] * to_s, number_of_minimising_rotations=len(C.RMIN),
        units="units of s (multiplied by 2√2/(m(n*)+m(−n*))). ε are unit tangent vectors (radians), ω rotation vectors (radians), ‖·‖∞ = 1")


# ---------- map of ψ ----------
def _psi_worker(pt):
    x, y = pt
    v, _ = C.psi_f(np.array([x, y, 1.0]))
    return (x, y, v)


def psi_map(grid, procs):
    from multiprocessing import Pool
    pts = [(i / grid, j / grid) for i in range(grid + 1) for j in range(-i, i + 1)]
    with Pool(procs) as pool:
        res = pool.map(_psi_worker, pts, chunksize=4)
    return res


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--grid", type=int, default=20); ap.add_argument("--procs", type=int, default=4)
    ap.add_argument("--skip-map", action="store_true"); ap.add_argument("--prob", default=None)
    a = ap.parse_args()
    t0 = time.time()
    out = {"note": "Arguments, code and tests were written by Claude with no third-party review; not a formal proof"}
    out["formula values on 5 records"] = check_records(); print("5 records OK", flush=True)
    out["linear form of m"] = check_m_linear()
    out["exact substitution"] = exact_point(); print("exact substitution OK", flush=True)
    out["order of the rotation group of the piece"] = len(C.rot_group())
    out["first order"] = fo = first_order(); print(json.dumps(fo, ensure_ascii=False, default=str), flush=True)
    if not a.skip_map:
        res = psi_map(a.grid, a.procs)
        P = {(round(x * a.grid), round(y * a.grid)): v for x, y, v in res}
        rows = []
        for (i, j), v in P.items():
            x, y = i / a.grid, j / a.grid
            sig = C.s_of_c((v + P[(i, -j)]) / (2 + 2 * x))
            d = max(abs(x - C.ASF), abs(y))
            rows.append((x, y, v, sig, d))
        far = [r for r in rows if r[4] > 0.05]
        mn = min(far, key=lambda r: r[3])
        out["map of psi"] = dict(points=len(rows), start=20, min_margin_outside_0_05_of_n_star=dict(x=mn[0], y=mn[1], margin_s=mn[3]),
                             min_margin_overall=min(r[3] for r in rows), min_psi=min(r[2] for r in rows),
                             points_with_margin_below_0_005=[r[:2] for r in far if r[3] < 0.005])
        out["table of psi"] = [[r[0], r[1], round(r[2], 9), round(r[3], 9)] for r in sorted(rows)]
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open(C.out_name("step0") + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print(json.dumps({k: v for k, v in out.items() if k != "table of psi"}, ensure_ascii=False, indent=1, default=str))


if __name__ == "__main__":
    main()
