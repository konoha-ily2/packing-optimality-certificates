# -*- coding: utf-8 -*-
"""Q61: a preview of the degeneracy of s₁ for tetintet (D28 2.5, 4.3). n=2 (B4) and n=5 (D36 stage 2, σ=2). Floating point. A "preview", not "evidence".
2026-11-13, written by Claude (Opus). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.

What it does
  A (n=2): polish the record with SLSQP, count the contact and tied vertices, and measure with an LP the sharpness of the first-order part of (K) of D28 (8 variables: δn 2, ω₁ 3, ω₂ 3).
            Compare with and without the s₁ constraint (the tangent cone Ds₁(ω) ≤ 0 of s₁(R) ≤ s₀). A map of σ(n) = g(n) + g(−n) around n*.
  B (n=5): collect the minimizers of the σ problem of D36 (the centres of the 2 pieces in the same cone) with the d36 tools, and look at the shape of the set of minimizers (a curve or a point).
Usage: python -X utf8 d37_tet_preview.py [--part A|B|AB] [--out d37_tet_preview.json]
"""
import argparse, json, math, os, sys, time
import numpy as np
from scipy.optimize import linprog, minimize

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d36_cellpair_preview as D36           # only read and imported

SOL = json.load(open(os.path.join(HERE, "..", "src", "solids.json"), encoding="utf-8"))
TV = np.array(SOL["tetrahedron"]["V"], float)              # regular tetrahedron of unit edge (centroid at the origin)
A = np.array(SOL["tetrahedron"]["normals"], float)
A = A / np.linalg.norm(A, axis=1, keepdims=True)           # outward unit normals a_f of the container
R_IN = 1 / (2 * math.sqrt(6))                              # radius r of the inscribed ball
TOL = 1e-6                                                 # tolerance for ties


def rotq(q):
    return D36.rotq(np.asarray(q, float) / np.linalg.norm(q))


def hf(R):
    return (A @ (TV @ R.T).T).max(1)                       # h_f(R)


def s1(R):
    return hf(R).sum() / (4 * R_IN)


def mfun(n):
    return (A @ n).max()


def Phi(n, R):
    X = TV @ R.T
    return (X @ n).max() + 0.75 * ((mfun(n) - A @ n) * hf(R)).sum()


def Fk(n, R, s0):
    return Phi(n, R) - 3 * R_IN * s0 * mfun(n)


def s_formula(n, R1, R2):
    return (Phi(n, R1) + Phi(-n, R2)) / (3 * R_IN * (mfun(n) + mfun(-n)))


# ---------------- polishing: smooth form with 2 pieces and no cells (Smooth of d36 with cell=False) ----------------
def polish_n2(rec):
    P = D36.Problem("tetrahedron", "tetrahedron", cell=False)
    S = D36.Smooth(P)
    p = rec["pieces"]
    z = np.zeros(S.NZ)
    z[S.IT1] = p[0][:3]; z[S.IQ1] = p[0][3:]
    z[S.IT2] = p[1][:3]; z[S.IQ2] = p[1][3:]
    X1 = TV @ rotq(p[0][3:]).T + p[0][:3]; X2 = TV @ rotq(p[1][3:]).T + p[1][:3]
    # initial n: the plane separating the 2 pieces of the record (near the value of D28 1.2), from the LP formula
    best = None
    for n0 in np.random.default_rng(0).normal(size=(400, 3)):
        n0 /= np.linalg.norm(n0)
        v = s_formula(n0, rotq(p[0][3:]), rotq(p[1][3:]))
        if best is None or v < best[0]:
            best = (v, n0)
    r = minimize(lambda n: s_formula(n / np.linalg.norm(n), rotq(p[0][3:]), rotq(p[1][3:])), best[1],
                 method="Nelder-Mead", options=dict(xatol=1e-13, fatol=1e-15, maxiter=20000))
    n0 = r.x / np.linalg.norm(r.x)
    z[S.IN] = n0
    z[S.IH] = 0.5 * ((X1 @ n0).max() + (X2 @ n0).min())
    z[S.IS] = rec["s_tight"]
    for _ in range(4):
        rr = minimize(lambda z: z[S.IS], z, jac=lambda z: np.eye(S.NZ)[S.IS], method="SLSQP",
                      constraints=[dict(type="ineq", fun=S.ineq, jac=S.ineq_jac),
                                   dict(type="eq", fun=S.eq, jac=S.eq_jac)],
                      options=dict(maxiter=2000, ftol=1e-16))
        z = rr.x
    n = z[S.IN] / np.linalg.norm(z[S.IN])
    R1 = rotq(z[S.IQ1]); R2 = rotq(z[S.IQ2])
    # re-polish n with the formula (R fixed)
    r = minimize(lambda m: s_formula(m / np.linalg.norm(m), R1, R2), n, method="Nelder-Mead",
                 options=dict(xatol=1e-14, fatol=1e-16, maxiter=20000))
    n = r.x / np.linalg.norm(r.x)
    return dict(n=n, R1=R1, R2=R2, t1=z[S.IT1], t2=z[S.IT2], s_slsqp=float(z[S.IS]),
                s_form=float(s_formula(n, R1, R2)), s_lp=float(P.lp(n, R1, R2)),
                ineq_min=float(S.ineq(z).min()))


# ---------------- contacts and ties ----------------
def ties(vals, tol=TOL):
    m = vals.max()
    return [int(i) for i in np.nonzero(vals > m - tol)[0]]


def contact_report(n, R, t, side, s0):
    """side = +1: the side n·x ≤ h (its top end is the plane), −1: the side n·x ≥ h."""
    X = TV @ R.T
    out = dict(s1=float(s1(R)), hf=[float(v) for v in hf(R)])
    out["face_ties"] = [ties(A[f] @ X.T) for f in range(4)]          # vertices attaining h_f
    out["plane_ties"] = ties(side * (X @ n))                          # vertices touching the separating plane
    sl = s0 * R_IN - (A @ (X + t).T).max(1)                          # gap to the walls (per face)
    out["wall_gap"] = [float(v) for v in sl]
    out["m_ties"] = ties(A @ (side * n))
    return out


# ---------------- the first-order part (A and B of D28 4.2) and the LP of the sharpness ----------------
def lin_terms(n, R, s0, sigma, basis):
    """Write the first-order part of F(σn, R) as a "convex piecewise-linear expression". Variables d = (2 components of δn, 3 components of ω).
    Returns: const (5 first-order coefficients for δn·), groups (sum of maxes [(weight, [rows of linear forms...])]), and the groups of s₁."""
    N = sigma * n
    W = TV @ R.T
    mt = ties(A @ N)
    jstar = mt[0]
    groups = []
    h0 = hf(R)
    mcoef = 0.75 * h0.sum() - 3 * R_IN * s0            # = 3r(s₁(R) − s₀): the coefficient of m
    if len(mt) > 1:
        # m is tied: if the coefficient is 0 it vanishes at first order. If positive, a convex max term; if negative, concave (not an LP)
        assert mcoef > -1e-9, ("m \u304c\u540c\u7740\u3067\u4fc2\u6570\u304c\u8ca0", mt, mcoef)
        if mcoef > 1e-9:
            groups.append((float(mcoef), [np.concatenate([sigma * (basis @ A[j]), np.zeros(3)]) for j in mt]))
        mcoef_lin = 0.0
    else:
        mcoef_lin = mcoef
    # top end max_v N·Rv: δ(σn)·w_v + N·(ω×w_v) = σ δn·w_v + ω·(w_v×N)
    rows = []
    for v in ties(W @ N):
        w = W[v]
        rows.append(np.concatenate([sigma * (basis @ w), np.cross(w, N)]))
    groups.append((1.0, rows))
    # (3/4) Σ_f (m − N·a_f) Dh_f
    coef = 0.75 * (mfun(N) - A @ N)
    s1groups = []
    for f in range(4):
        rows = []
        for v in ties(A[f] @ W.T):
            w = W[v]
            rows.append(np.concatenate([np.zeros(len(basis)), np.cross(w, A[f])]))   # a_f·(ω×w) = ω·(w×a_f)
        groups.append((float(coef[f]), rows))
        s1groups.append((1 / (4 * R_IN), rows))
    # first order in δn: Dm·(3/4 Σh − 3 r s0) − (3/4) Σ σδn·a_f h_f
    h = hf(R)
    c = sigma * basis @ (A[jstar] * mcoef_lin - 0.75 * (A * h[:, None]).sum(0))
    const = np.concatenate([np.atleast_1d(c), np.zeros(3)])
    return const, groups, s1groups


def sharp_lp(parts, use_s1, nvar=8, vbounds=None):
    """parts = [(const, groups, s1groups, positions of the variables idx (array of length 5), whether to add the s₁ constraint)].
    min Σ (const·d + Σ weight·max row·d) over the 16 faces of ‖d‖∞ ≤ 1. Returns: (minimum, face, d)."""
    best = (math.inf, None, None)
    res_all = []
    for k in range(nvar):
        for sg in (1, -1):
            # variables: d (nvar), epi (number of groups)
            cols = nvar
            epi_idx = []
            c_obj = np.zeros(nvar)
            Aub, bub = [], []
            for const, groups, s1groups, idx, s1on in parts:
                c_obj[idx] += const
                for wgt, rows in groups:
                    epi_idx.append((cols, wgt, rows, idx)); cols += 1
            nE = cols - nvar
            obj = np.concatenate([c_obj, np.zeros(nE)])
            for (e, wgt, rows, idx) in epi_idx:
                obj[e] = wgt
                for row in rows:
                    a = np.zeros(cols); a[idx] += row; a[e] = -1; Aub.append(a); bub.append(0.0)
            if use_s1:
                for const, groups, s1groups, idx, s1on in parts:
                    if not s1on:
                        continue
                    # Σ_f max_v row·d ≤ 0: auxiliary variables u_f ≥ max, Σu_f ≤ 0
                    base = cols
                    extra = len(s1groups)
                    obj = np.concatenate([obj, np.zeros(extra)])
                    Aub = [np.concatenate([a, np.zeros(extra)]) for a in Aub]
                    cols += extra
                    for j, (wgt, rows) in enumerate(s1groups):
                        for row in rows:
                            a = np.zeros(cols); a[idx] += row; a[base + j] = -1; Aub.append(a); bub.append(0.0)
                    a = np.zeros(cols); a[base:base + extra] = 1; Aub.append(a); bub.append(0.0)
            bounds = (list(vbounds) if vbounds else [(-1, 1)] * nvar) + [(None, None)] * (cols - nvar)
            if not (bounds[k][0] <= sg <= bounds[k][1]):
                continue
            bounds[k] = (sg, sg)
            r = linprog(obj, A_ub=np.array(Aub), b_ub=np.array(bub), bounds=bounds, method="highs")
            if r.status != 0:
                res_all.append((k, sg, None)); continue
            res_all.append((k, sg, float(r.fun)))
            if r.fun < best[0]:
                best = (float(r.fun), (k, sg), r.x[:nvar])
    return best, res_all


def tangent_basis(n):
    e = np.eye(3)[np.argmin(abs(n))]
    b1 = np.cross(n, e); b1 /= np.linalg.norm(b1)
    b2 = np.cross(n, b1)
    return np.array([b1, b2])


# ---------------- g(n, s): place 1 piece in sC and minimize its top end in the direction n (smooth form, multiple starts) ----------------
def g_val(n, s0, starts, rng, cone=None, warm=None):
    """min_{R,t} max_v n·(Rv+t)  s.t. a_f·(Rv+t) ≤ s0·r (and G t ≤ 0 if cone is given). Variables (t 3, q 4, z)."""
    def ineq(x):
        t, q, z = x[:3], x[3:7], x[7]
        X = TV @ rotq(q).T + t
        out = [(s0 * R_IN - A @ X.T).ravel(), z - X @ n]
        if cone is not None:
            out.append(-(cone @ t))
        return np.concatenate(out)
    best = math.inf; bx = None
    inits = []
    if warm is not None:
        inits.append(warm)
    for _ in range(starts):
        q = rng.normal(size=4); q /= np.linalg.norm(q)
        inits.append(np.concatenate([np.zeros(3), q, [1.0]]))
    for x0 in inits:
        r = minimize(lambda x: x[7], x0, method="SLSQP",
                     constraints=[dict(type="ineq", fun=ineq), dict(type="eq", fun=lambda x: [x[3:7] @ x[3:7] - 1])],
                     options=dict(maxiter=500, ftol=1e-14))
        if r.success and ineq(r.x).min() > -1e-9 and r.x[7] < best:
            best, bx = float(r.x[7]), r.x
    return best, bx


def part_A(out, mapgrid, mapstarts):
    rec = json.load(open(os.path.join(HERE, "..", "records", "tetintet", "tetintet_n02.json"), encoding="utf-8"))
    t0 = time.time()
    P = polish_n2(rec)
    n, R1, R2 = P["n"], P["R1"], P["R2"]
    s0 = P["s_form"]
    print(f"[A] polish: s_slsqp {P['s_slsqp']:.13f}  formula {s0:.13f}  LP {P['s_lp']:.13f}  min of the constraints {P['ineq_min']:.2e}", flush=True)
    print(f"[A] n* = {np.round(n, 6)}  s₁(R1) = {s1(R1):.12f}  s₁(R2) = {s1(R2):.12f}", flush=True)
    rep1 = contact_report(n, R1, P["t1"], +1, s0)
    rep2 = contact_report(n, R2, P["t2"], -1, s0)
    for nm, rp in (("piece 1", rep1), ("piece 2", rep2)):
        print(f"[A] {nm}: s₁ {rp['s1']:.10f}  ties of h_f {rp['face_ties']}  ties at the plane {rp['plane_ties']}  walls {np.round(rp['wall_gap'], 9)}  ties of m {rp['m_ties']}", flush=True)
    X1 = TV @ R1.T + P["t1"]; X2 = TV @ R2.T + P["t2"]
    pair = []
    for i in rep1["plane_ties"]:
        for j in rep2["plane_ties"]:
            pair.append(("piece 1 vertex", i, "piece 2 vertex", j, float(np.linalg.norm(X1[i] - X2[j]))))
        if len(rep2["plane_ties"]) == 2:
            a_, b_ = X2[rep2["plane_ties"]]
            u = (X1[i] - a_) @ (b_ - a_) / ((b_ - a_) @ (b_ - a_))
            pair.append(("piece 1 vertex", i, "line of the piece 2 edge", rep2["plane_ties"], float(np.linalg.norm(X1[i] - a_ - u * (b_ - a_))), float(u)))
    print(f"[A] contacts of the 2 pieces: {pair}", flush=True)
    F1 = Fk(n, R1, s0); F2 = Fk(-n, R2, s0)
    print(f"[A] F(n*,R1) = {F1:.3e}, F(−n*,R2) = {F2:.3e}, sum {F1 + F2:.2e}", flush=True)
    # sharpness of the first-order part
    B = tangent_basis(n)
    c1, g1, sg1 = lin_terms(n, R1, s0, +1, B)
    c2, g2, sg2 = lin_terms(n, R2, s0, -1, B)
    idx1 = np.array([0, 1, 2, 3, 4]); idx2 = np.array([0, 1, 5, 6, 7])
    s1on1 = abs(s1(R1) - s0) < 1e-6; s1on2 = abs(s1(R2) - s0) < 1e-6
    resA = {}
    for use in (False, True):
        best, allr = sharp_lp([(c1, g1, sg1, idx1, s1on1), (c2, g2, sg2, idx2, s1on2)], use)
        resA["with_s1" if use else "no_s1"] = dict(min=best[0], face=best[1], d=None if best[2] is None else [float(x) for x in best[2]],
                                                    faces=[(k, sg, v) for k, sg, v in allr])
        print(f"[A] sharpness in 8 variables ({'with' if use else 'without'} the tangent cone of s₁): {best[0]:.6f}  face {best[1]}  d {None if best[2] is None else np.round(best[2], 4)}", flush=True)
    # one side at a time (δn = 0): sharpness in the direction of R of each piece (the labels "\u99d21"/"\u99d22" = piece 1/2 are kept: they become keys of the json record)
    for nm, (c, g, sg, on) in (("\u99d21", (c1, g1, sg1, s1on1)), ("\u99d22", (c2, g2, sg2, s1on2))):
        for use in (False, True):
            best, _ = sharp_lp([(c[2:], [(w, [r[2:] for r in rows]) for w, rows in g], [(w, [r[2:] for r in rows]) for w, rows in sg],
                                np.arange(3), on)], use, nvar=3)
            print(f"[A] {nm} sharpness in R only (δn=0, {'with' if use else 'without'} s₁): {best[0]:.6f}  d {None if best[2] is None else np.round(best[2], 4)}", flush=True)
            resA[f"{nm}_R_only_{'s1' if use else 'nos1'}"] = best[0]
    out["A"] = dict(n=list(map(float, n)), s0=s0, s_slsqp=P["s_slsqp"], s_lp=P["s_lp"],
                    R1=R1.tolist(), R2=R2.tolist(), t1=list(map(float, P["t1"])), t2=list(map(float, P["t2"])),
                    piece1=rep1, piece2=rep2, F1=F1, F2=F2, sharp=resA)
    # map of σ(n) (around n*, coordinates of the tangent plane)
    if mapgrid > 0:
        rng = np.random.default_rng(1)
        grid = []
        rad = [0.0, 0.005, 0.02, 0.05, 0.1, 0.2]
        dirs = [(math.cos(2 * math.pi * k / 12), math.sin(2 * math.pi * k / 12)) for k in range(12)]
        pts = [(0.0, 0.0)] + [(r * a, r * b) for r in rad[1:] for a, b in dirs]
        for (u, v) in pts[:mapgrid]:
            m = n + u * B[0] + v * B[1]; m /= np.linalg.norm(m)
            ga, _ = g_val(m, s0, mapstarts, rng)
            gb, _ = g_val(-m, s0, mapstarts, rng)
            sig = ga + gb
            grid.append(dict(u=u, v=v, rad=math.hypot(u, v), sigma=sig))
            print(f"[A] map ({u:+.3f},{v:+.3f})  σ = {sig:.3e}", flush=True)
        out["A"]["map"] = grid
    print(f"[A] {time.time() - t0:.0f} s", flush=True)


# ---------------- A2: the arc of separating planes (a vertex of piece 1 on the line of an edge of piece 2 → the plane can turn around the edge) ----------------
def rodrigues(e, phi):
    return D36.expm_rot(phi * e / np.linalg.norm(e))


def sharp_at(n, R1, R2, s0, basis, use_s1=True, vbounds=None):
    k = len(basis)
    c1, g1, sg1 = lin_terms(n, R1, s0, +1, basis)
    c2, g2, sg2 = lin_terms(n, R2, s0, -1, basis)
    idx1 = np.concatenate([np.arange(k), k + np.arange(3)]); idx2 = np.concatenate([np.arange(k), k + 3 + np.arange(3)])
    on1 = abs(s1(R1) - s0) < 1e-6; on2 = abs(s1(R2) - s0) < 1e-6
    best, allr = sharp_lp([(c1, g1, sg1, idx1, on1), (c2, g2, sg2, idx2, on2)], use_s1, nvar=k + 6, vbounds=vbounds)
    return best, allr


def part_A2(out):
    A_ = out["A"]; n = np.array(A_["n"]); R1 = np.array(A_["R1"]); R2 = np.array(A_["R2"])
    t1 = np.array(A_["t1"]); t2 = np.array(A_["t2"]); s0 = A_["s0"]
    X1 = TV @ R1.T + t1; X2 = TV @ R2.T + t2
    e = X2[3] - X2[0]; e /= np.linalg.norm(e)
    tang = np.cross(e, n); tang /= np.linalg.norm(tang)
    B = tangent_basis(n)
    dz = A_["sharp"]["with_s1"]["d"]
    dzn = dz[0] * B[0] + dz[1] * B[1]
    print(f"[A2] edge direction e = {np.round(e, 6)}  n*·e = {n @ e:.2e}  cosine of the angle between the zero direction of the LP (δn) and the tangent of the arc {abs(dzn @ tang) / np.linalg.norm(dzn):.9f}", flush=True)
    rows = []
    phis = np.linspace(-1.2, 1.2, 241)
    for phi in phis:
        m = rodrigues(e, phi) @ n
        gap = (X2 @ m).min() - (X1 @ m).max()                  # separable with the placement fixed (≥ 0)
        sf = s_formula(m, R1, R2)
        S = Fk(m, R1, s0) + Fk(-m, R2, s0)
        rows.append((float(phi), float(gap), float(sf), float(S)))
    ok = [r for r in rows if r[1] > -1e-12]
    lo, hi = ok[0][0], ok[-1][0]
    # the ends by bisection
    def sep(phi):
        m = rodrigues(e, phi) @ n
        return (X2 @ m).min() - (X1 @ m).max()
    def bis(a, b):
        for _ in range(80):
            c = 0.5 * (a + b)
            if sep(c) > -1e-13: a = c
            else: b = c
        return a
    phi_lo = -bis(0.0, -1.2) if False else None
    # positive side and negative side
    a, b = 0.0, 1.2
    for _ in range(80):
        c = 0.5 * (a + b); (a, b) = (c, b) if sep(c) > -1e-13 else (a, c)
    phi_hi = a
    a, b = 0.0, -1.2
    for _ in range(80):
        c = 0.5 * (a + b); (a, b) = (c, b) if sep(c) > -1e-13 else (a, c)
    phi_lo = a
    print(f"[A2] angles through which the plane can be turned around the edge with the placement fixed: [{phi_lo:.9f}, {phi_hi:.9f}] ({math.degrees(phi_hi - phi_lo):.4f}°)", flush=True)
    print(f"[A2] largest absolute value of F₁+F₂ (at s₀) on the arc {max(abs(r[3]) for r in rows if phi_lo - 1e-12 <= r[0] <= phi_hi + 1e-12):.2e}, minimum of s of the formula {min(r[2] for r in rows if phi_lo <= r[0] <= phi_hi):.12f}", flush=True)
    # at points on the arc: transverse sharpness (one δn perpendicular to the arc), ties of m, contacts at the ends
    arc = []
    for frac in (0.0, 0.02, 0.1, 0.25, 0.5, 0.75, 0.9, 0.98, 1.0):
        phi = phi_lo + frac * (phi_hi - phi_lo)
        m = rodrigues(e, phi) @ n
        tg = np.cross(e, m); tg /= np.linalg.norm(tg)
        nb = np.cross(m, tg)                                     # perpendicular to the arc in the tangent plane
        row = dict(frac=frac, phi=float(phi), n=m.tolist(), m_ties=ties(A @ m), mm_ties=ties(A @ -m),
                   plane1=ties(X1 @ m), plane2=ties(-(X2 @ m)))
        try:
            b1, _ = sharp_at(m, R1, R2, s0, np.array([nb]))
            row["transverse_sharp"] = b1[0]; row["transverse_d"] = None if b1[2] is None else [float(x) for x in b1[2]]
            b2, _ = sharp_at(m, R1, R2, s0, np.array([tg, nb]))
            row["full_sharp"] = b2[0]
            b3, _ = sharp_at(m, R1, R2, s0, np.array([nb]), use_s1=False)
            row["transverse_sharp_nos1"] = b3[0]
        except AssertionError as ex:
            row["err"] = str(ex)
        arc.append(row)
        print(f"[A2] arc {frac:.2f} (φ={phi:+.5f}): ties of m {row['m_ties']}/{row['mm_ties']}  plane vertices {row['plane1']}/{row['plane2']}  "
              f"transverse sharpness {row.get('transverse_sharp', float('nan')):.5f} (without s₁ {row.get('transverse_sharp_nos1', float('nan')):.5f})  8 variables {row.get('full_sharp', float('nan')):.5f} {row.get('err', '')}", flush=True)
    out["A2"] = dict(edge=e.tolist(), phi_lo=phi_lo, phi_hi=phi_hi, arc_deg=math.degrees(phi_hi - phi_lo), arc=arc)

    # multiplier of s₁: the range of λ for which the transverse sharpness of the first-order part of F₁ + λ(s₁(R) − s₀) (no constraint) is positive (3 points of the arc)
    lam_rows = []
    for frac in (0.0, 0.5, 1.0):
        phi = phi_lo + frac * (phi_hi - phi_lo)
        m = rodrigues(e, phi) @ n
        tg = np.cross(e, m); tg /= np.linalg.norm(tg); nb = np.cross(m, tg)
        basis = np.array([nb])
        c1, g1, sg1 = lin_terms(m, R1, s0, +1, basis)
        c2, g2, sg2 = lin_terms(m, R2, s0, -1, basis)
        idx1 = np.array([0, 1, 2, 3]); idx2 = np.array([0, 4, 5, 6])
        vals = []
        for lam in (0.0, 0.1, 0.3, 0.5, 0.6, 0.65, 0.7, 0.72, 0.74, 0.76, 0.78, 0.8, 0.85, 0.9, 1.0, 2.0):
            g1l = g1 + [(lam * w, rows) for w, rows in sg1]
            b, _ = sharp_lp([(c1, g1l, sg1, idx1, False), (c2, g2, sg2, idx2, False)], False, nvar=7)
            vals.append((lam, b[0]))
        good = [l for l, v in vals if v > 0]
        lam_rows.append(dict(frac=frac, vals=vals, good=good))
        print(f"[A2] multiplier λ (arc {frac:.1f}): " + "  ".join(f"{l}:{v:+.4f}" for l, v in vals), flush=True)
    out["A2"]["lambda_scan"] = lam_rows
    # at the end points: whether more faces touch the plane (whether a face of a piece is parallel to the plane). "\u4e0b\u7aef"/"\u4e0a\u7aef" (bottom end/top end) are kept: keys of the json record
    for nm, phi in (("\u4e0b\u7aef", phi_lo), ("\u4e0a\u7aef", phi_hi)):
        m = rodrigues(e, phi) @ n
        par = [int(f) for f in range(4) if abs(abs((R2 @ (-np.array(SOL['tetrahedron']['normals'][f]) / math.sqrt(3))) @ m) - 1) < 1e-6]
        par1 = [int(f) for f in range(4) if abs(abs((R1 @ (np.array(SOL['tetrahedron']['normals'][f]) / math.sqrt(3))) @ m) - 1) < 1e-6]
        cf = [int(j) for j in range(4) if abs(abs(A[j] @ m) - 1) < 1e-6]
        print(f"[A2] {nm}: n = {np.round(m, 6)}  parallel to faces of piece 1 {par1}  parallel to faces of piece 2 {par}  container face normals {cf}", flush=True)
        tg = np.cross(e, m); tg /= np.linalg.norm(tg); nb = np.cross(m, tg)
        outward = tg if nm == "\u4e0a\u7aef" else -tg                      # the direction of increasing φ around e = the tangent tg
        vb = [(0, 1)] + [(-1, 1)] * 7
        b, allr = sharp_at(m, R1, R2, s0, np.array([outward, nb]), vbounds=vb)
        print(f"[A2] {nm}: sharpness in 8 variables on the half leaving the arc (arc component of δn ≥ 0) {b[0]:.5f}  d {None if b[2] is None else np.round(b[2], 4)}", flush=True)
        # sharpness in R only for each piece (at the n of the end)
        out["A2"][nm] = dict(n=m.tolist(), par1=par1, par2=par, cont=cf, out_sharp=b[0])


# ---------------- M: map of σ(n) = g(n) + g(−n) on D_n (n=2, at s₀). Looks for signs of another minimum ----------------
TD = None
def td_elems():
    """T_d (the 24 symmetries of the container): permutations of the coordinates × an even number of sign changes."""
    import itertools
    out = []
    for perm in itertools.permutations(range(3)):
        P_ = np.eye(3)[list(perm)]
        for sg in itertools.product((1, -1), repeat=3):
            if np.prod(sg) == 1:
                out.append(np.diag(sg) @ P_)
    return out


def to_Dn(n):
    """Bring n back by T_d into D_n = {(x, y, 1)·c : |y| ≤ x ≤ 1}."""
    for g in td_elems():
        m = g @ n
        if m[2] > 0 and m[2] >= abs(m[0]) - 1e-12 and m[2] >= abs(m[1]) - 1e-12:
            x, y = m[0] / m[2], m[1] / m[2]
            if abs(y) <= x + 1e-12:
                return (float(x), float(y))
    return None


def part_M(out, step, starts, n5pts=300):
    s0 = out["A"]["s0"] if "A" in out else 1.9535642445616
    rng = np.random.default_rng(5)
    pts = []
    K = int(round(1 / step))
    for i in range(K + 1):
        x = i * step
        for j in range(-i, i + 1):
            pts.append((x, j * step))
    t0 = time.time()
    rows = []
    for (x, y) in pts:
        m = np.array([x, y, 1.0]); m /= np.linalg.norm(m)
        ga, _ = g_val(m, s0, starts, rng); gb, _ = g_val(-m, s0, starts, rng)
        rows.append((x, y, ga + gb))
    small = sorted(rows, key=lambda r: r[2])[:15]
    print(f"[M] {len(rows)} points, {time.time() - t0:.0f} s. Smallest σ first: " + "  ".join(f"({x:.3f},{y:+.3f}):{v:.4f}" for x, y, v in small), flush=True)
    arc = out.get("A2", {})
    img = []
    if arc:
        n = np.array(out["A"]["n"]); e = np.array(arc["edge"])
        for frac in np.linspace(0, 1, 6):
            phi = arc["phi_lo"] + frac * (arc["phi_hi"] - arc["phi_lo"])
            img.append(to_Dn(rodrigues(e, phi) @ n))
        print(f"[M] image of the arc in D_n (from end to end): {[tuple(round(c, 4) for c in p) if p else None for p in img]}", flush=True)
    out["M"] = dict(step=step, starts=starts, n_pts=len(rows), rows=rows, smallest=small, arc_image=img)
    # n=5 (half-space cell, s₀ = 2): random points on the sphere (the cell reduces the symmetry to C3v, so D_n is not used)
    P = halfspace_problem()
    G5 = P.G
    rows5 = []
    t0 = time.time()
    for k in range(n5pts):
        m = rng.normal(size=3); m /= np.linalg.norm(m)
        ga, _ = g_val(m, 2.0, starts, rng, cone=G5); gb, _ = g_val(-m, 2.0, starts, rng, cone=G5)
        rows5.append((m.tolist(), ga + gb))
    small5 = sorted(rows5, key=lambda r: r[1])[:12]
    print(f"[M5] {len(rows5)} points, {time.time() - t0:.0f} s. Smallest σ first: " + "  ".join(f"{np.round(m, 3).tolist()}:{v:.4f}" for m, v in small5), flush=True)
    out["M"]["n5"] = dict(n_pts=len(rows5), smallest=small5, rows=rows5)


# ---------------- C: n=5 with the cell replaced by "a similar regular tetrahedron (half-space a·t ≤ 0, 3/4 of the corner)"; the set of minimizers with the same tools as n=2 ----------------
def halfspace_problem():
    P = D36.Problem("tetrahedron", "tetrahedron", cell=True)
    P.G = -P.CV[0:1] / np.linalg.norm(P.CV[0])               # a·t ≤ 0 (a is the normal of the face opposite vertex 0)
    rows = list(P.Aub[:P.sep_row + 1])
    for i in range(2):
        for g in P.G:
            r = np.zeros(7); r[3 * i:3 * i + 3] = g; rows.append(r)
    P.Aub = np.array(rows); P.nrows = len(rows)
    return P


def arc_dirs(n, X1, X2, tol=1e-7):
    """With the placement fixed, look for axes around which the separating plane can be turned. X1 is the side n·x ≤ h. Candidate axes come from pairs of vertices touching the plane."""
    t1 = ties(X1 @ n, tol); t2 = ties(-(X2 @ n), tol)
    P_ = [X1[i] for i in t1] + [X2[j] for j in t2]
    found = []
    for a in range(len(P_)):
        for b in range(a + 1, len(P_)):
            e = P_[b] - P_[a]
            if np.linalg.norm(e) < 1e-9 or abs(e @ n) > 1e-6 * np.linalg.norm(e):
                continue
            e = e / np.linalg.norm(e)
            ok = []
            for sg in (1, -1):
                m = rodrigues(e, sg * 1e-4) @ n
                ok.append((X2 @ m).min() - (X1 @ m).max() > -1e-12)
            if any(ok) and not any(abs(abs(e @ f) - 1) < 1e-9 for f, _ in found):
                found.append((e, ok))
    return t1, t2, found


def arc_range(n, X1, X2, e):
    def sep(phi):
        m = rodrigues(e, phi) @ n
        return (X2 @ m).min() - (X1 @ m).max()
    ends = []
    for lim in (math.pi / 2, -math.pi / 2):
        a, b = 0.0, lim
        if sep(1e-6 * np.sign(lim)) < -1e-12:
            ends.append(0.0); continue
        for _ in range(80):
            c = 0.5 * (a + b); (a, b) = (c, b) if sep(c) > -1e-13 else (a, c)
        ends.append(a)
    return min(ends), max(ends)


def analyze_conf(label, n, R1, R2, t1, t2, s0, out):
    """With piece 1 put on the side n·x ≤ h: s₁, contacts with the plane, arcs, transverse sharpness (with the tangent cone of s₁), ends."""
    X1 = TV @ R1.T + t1; X2 = TV @ R2.T + t2
    if (X1 @ n).max() > (X2 @ n).min() + 1e-9:
        n = -n
    row = dict(label=label, n=n.tolist(), s1=[float(s1(R1)), float(s1(R2))], hf1=sorted(map(float, hf(R1))), hf2=sorted(map(float, hf(R2))))
    tt1, tt2, dirs = arc_dirs(n, X1, X2)
    row["plane_ties"] = [tt1, tt2]
    B = tangent_basis(n)
    try:
        b8, _ = sharp_at(n, R1, R2, s0, B)
        row["sharp8"] = b8[0]
    except AssertionError as ex:
        row["sharp8"] = None; row["err"] = str(ex)
    row["arcs"] = []
    for e, ok in dirs:
        lo, hi = arc_range(n, X1, X2, e)
        ar = dict(axis=e.tolist(), lo=lo, hi=hi, deg=math.degrees(hi - lo))
        tr = []
        for frac in (0.0, 0.5, 1.0):
            phi = lo + frac * (hi - lo)
            m = rodrigues(e, phi) @ n
            tg = np.cross(e, m); tg /= np.linalg.norm(tg); nb = np.cross(m, tg)
            try:
                b, _ = sharp_at(m, R1, R2, s0, np.array([nb]))
                bn, _ = sharp_at(m, R1, R2, s0, np.array([nb]), use_s1=False)
                tr.append(dict(frac=frac, n=m.tolist(), m_ties=ties(A @ m), mm_ties=ties(-A @ m), sharp=b[0], sharp_nos1=bn[0],
                               cont_normal=[int(j) for j in range(4) if abs(abs(A[j] @ m) - 1) < 1e-6]))
            except AssertionError as ex:
                tr.append(dict(frac=frac, err=str(ex)))
        ar["pts"] = tr
        row["arcs"].append(ar)
    print(f"[C] {label}: s₁ {row['s1'][0]:.6f}/{row['s1'][1]:.6f}  h_f {np.round(row['hf1'], 4)}  plane vertices {tt1}/{tt2}  sharpness in 8 variables {row['sharp8']}", flush=True)
    for ar in row["arcs"]:
        print(f"[C]    arc {ar['deg']:.4f}° (axis {np.round(ar['axis'], 4)}): " + "  ".join(
            f"[{p['frac']}] transverse {p.get('sharp', float('nan')):.4f} (without s₁ {p.get('sharp_nos1', float('nan')):.4f}) container normals {p.get('cont_normal')} m ties {p.get('m_ties')}/{p.get('mm_ties')} {p.get('err', '')}" for p in ar["pts"]), flush=True)
    out.setdefault("C", {}).setdefault("confs", []).append(row)
    return row


def part_C(out, nstart):
    t0 = time.time()
    # the n=2 configuration with the same function too (cross-check). The labels below are kept in Japanese: they go into the json record
    if "A" in out:
        A_ = out["A"]
        analyze_conf("n=2 \u8a18\u9332\uff08\u78e8\u304d\uff09", np.array(A_["n"]), np.array(A_["R1"]), np.array(A_["R2"]), np.array(A_["t1"]), np.array(A_["t2"]), A_["s0"], out)
    P = halfspace_problem()
    S = D36.Smooth(P)
    rng = np.random.default_rng(21)
    vals = []; kinds = {}
    for k in range(nstart):
        v, n, R1, R2, _ = S.solve(rng)
        vals.append(v)
        if abs(v - 2) > 1e-7:
            continue
        res = P.lp(n, R1, R2, full=True)[1]
        t1, t2 = res.x[0:3], res.x[3:6]
        # make piece 1 the piece with s₁ = 2 (the stopped piece)
        if s1(R1) < s1(R2):
            R1, R2, t1, t2 = R2, R1, t2, t1
        key = (round(float(s1(R1)), 6), tuple(np.round(sorted(hf(R1)), 5)), tuple(np.round(sorted(hf(R2)), 5)))
        kinds.setdefault(key, []).append((n, R1, R2, t1, t2))
    print(f"[C] half-space cell: starts {nstart}, minimum {min(vals):.12f}, types with σ=2 {len(kinds)} ({time.time() - t0:.0f} s)", flush=True)
    out["C"]["halfspace_min"] = float(min(vals))
    out["C"]["kinds"] = [dict(key=[k[0], list(k[1]), list(k[2])], count=len(v)) for k, v in kinds.items()]
    for key, lst in kinds.items():
        print(f"[C] type {key}: {len(lst)} cases", flush=True)
        for j, (n, R1, R2, t1, t2) in enumerate(lst[:3]):
            # whether the cell constraint is active
            act = [float(-(P.G @ t1)[0]), float(-(P.G @ t2)[0])]
            r = analyze_conf(f"n=5 \u578b {key[1]} #{j}", n, R1, R2, t1, t2, 2.0, out)
            r["halfspace_slack"] = act
            print(f"[C]    slack of the cell (sign of a·t reversed) {np.round(act, 5)}", flush=True)
    # the type that appeared often only with the cone cells (D36) (an inverted piece touching face to face, n a container face normal), with the same tools
    Pc = D36.Problem("tetrahedron", "tetrahedron", cell=True); Sc = D36.Smooth(Pc)
    rng = np.random.default_rng(11); got = 0
    for k in range(200):
        v, n, R1, R2, _ = Sc.solve(rng)
        if abs(v - 2) > 1e-7:
            continue
        res = Pc.lp(n, R1, R2, full=True)[1]; t1, t2 = res.x[0:3], res.x[3:6]
        if s1(R1) < s1(R2):
            R1, R2, t1, t2 = R2, R1, t2, t1
        if abs(sorted(hf(R1))[-1] - 0.612372) < 1e-5:
            r = analyze_conf("n=5 \u578b P2\uff08\u5012\u7acb\u3001\u9762\u3068\u9762\uff09", n, R1, R2, t1, t2, 2.0, out)
            # whether it can also be placed with the half-space cell (centres with a·t ≤ 0)
            r["halfspace_slack"] = [float(-(P.G @ t1)[0]), float(-(P.G @ t2)[0])]
            # at the same n, whether a path moving R towards the orientation of P1 stays at 0: sharpness in R of piece 1 only (with the tangent cone of s₁)
            c1, g1, sg1 = lin_terms(r["n"] and np.array(r["n"]), R1, 2.0, +1, np.zeros((0, 3)))
            b, _ = sharp_lp([(c1, g1, sg1, np.arange(3), True)], True, nvar=3)
            r["R1_only_sharp_s1"] = b[0]
            print(f"[C]    slack of the cell {np.round(r['halfspace_slack'], 5)}  sharpness in R of the stopped piece only (with the tangent cone of s₁) {b[0]:.4f}", flush=True)
            got += 1
            if got >= 2:
                break
    print(f"[C] {time.time() - t0:.0f} s", flush=True)


# ---------------- B: the σ problem for n=5 ----------------
def part_B(out, nstart):
    P = D36.Problem("tetrahedron", "tetrahedron", cell=True)
    rng = np.random.default_rng(11)
    S = D36.Smooth(P)
    mins = []
    t0 = time.time()
    for k in range(nstart):
        v, n, R1, R2, _ = S.solve(rng)
        if abs(v - 2) < 1e-7:
            res = P.lp(n, R1, R2, full=True)[1]
            t1, t2 = res.x[0:3], res.x[3:6]
            mins.append(dict(n=n, R1=R1, R2=R2, t1=t1, t2=t2))
    print(f"[B] starts {nstart}, reached σ=2: {len(mins)} ({time.time() - t0:.0f} s)", flush=True)
    # classification of the minimizers: direction of n, s₁ of each piece, whether it fits the corner, position of the centres
    rows = []
    for M in mins:
        n = M["n"]
        r = dict(n=np.round(n, 4).tolist(), m_n=float(mfun(n)), m_mn=float(mfun(-n)),
                 s1_1=float(s1(M["R1"])), s1_2=float(s1(M["R2"])),
                 cell1=D36.where(P, M["t1"]), cell2=D36.where(P, M["t2"]))
        rows.append(r)
    for r in rows[:12]:
        print(f"[B]  n {r['n']}  m(n) {r['m_n']:.4f} m(−n) {r['m_mn']:.4f}  s₁ {r['s1_1']:.4f} / {r['s1_2']:.4f}  boundary {r['cell1']['active']} / {r['cell2']['active']}", flush=True)
    out["B"] = dict(nstart=nstart, n_at_min=len(mins), mins=rows)
    if not mins:
        return
    # at a representative point (the point of the D36 record), look for families: (1) turn R2 around n, (2) move n, (3) general directions. The family names below are kept in Japanese: keys of the json record
    d = json.load(open(os.path.join(HERE, "d36_runs", "tetintet_n05_1000.json"), encoding="utf-8"))
    n0 = np.array(d["n"]); R10 = np.array(d["R1"]); R20 = np.array(d["R2"])
    base = P.lp(n0, R10, R20)
    print(f"[B] representative point LP {base:.12f}  s₁(R1) {s1(R10):.6f}  s₁(R2) {s1(R20):.6f}  m(n) {mfun(n0):.4f}  m(−n) {mfun(-n0):.4f}", flush=True)
    fam = {}
    for nm, fn in (("R2 \u3092 n \u306e\u307e\u308f\u308a\u306b θ", lambda th: P.lp(n0, R10, D36.expm_rot(th * n0) @ R20)),
                   ("R1 \u3092 n \u306e\u307e\u308f\u308a\u306b θ", lambda th: P.lp(n0, D36.expm_rot(th * n0) @ R10, R20))):
        vals = [(th, float(fn(th))) for th in (1e-4, 1e-3, 1e-2, 0.05, 0.1, 0.2, 0.3, 0.5, -1e-3, -1e-2, -0.1)]
        fam[nm] = vals
        print(f"[B] {nm}: " + "  ".join(f"{th:+.4f}:{v - 2:+.2e}" for th, v in vals), flush=True)
    # slopes in general directions (8 variables: tangent plane of n 2, ω1 3, ω2 3). Minimum of (σ(d·ε) − 2)/ε by Nelder–Mead
    B_ = tangent_basis(n0)
    def sval(dv, eps):
        m = n0 + eps * (dv[0] * B_[0] + dv[1] * B_[1]); m /= np.linalg.norm(m)
        return P.lp(m, D36.expm_rot(eps * dv[2:5]) @ R10, D36.expm_rot(eps * dv[5:8]) @ R20)
    slopes = []
    for eps in (1e-3, 1e-4):
        best = (math.inf, None)
        for k in range(60):
            dv = rng.normal(size=8); dv /= abs(dv).max()
            f = lambda x: (sval(x / max(abs(x).max(), 1e-12), eps) - base) / eps
            r = minimize(f, dv, method="Nelder-Mead", options=dict(maxiter=400, xatol=1e-6, fatol=1e-9))
            if r.fun < best[0]:
                best = (float(r.fun), (r.x / abs(r.x).max()).tolist())
        slopes.append(dict(eps=eps, min_slope=best[0], d=best[1]))
        print(f"[B] minimum slope (ε={eps}): {best[0]:.3e}  direction {np.round(best[1], 3)}", flush=True)
    # dimension of the zero directions: collect the directions with slope ≤ 1e-6 and take singular values
    zero = []
    for k in range(200):
        dv = rng.normal(size=8); dv /= abs(dv).max()
        f = lambda x: abs((sval(x / max(abs(x).max(), 1e-12), 1e-4) - base) / 1e-4)
        r = minimize(f, dv, method="Nelder-Mead", options=dict(maxiter=300, xatol=1e-7, fatol=1e-10))
        if r.fun < 1e-5:
            zero.append(r.x / np.linalg.norm(r.x))
    if zero:
        sv = np.linalg.svd(np.array(zero), compute_uv=False)
        print(f"[B] {len(zero)} directions with slope 0, singular values {np.round(sv, 4)}", flush=True)
    out["B"].update(rep=dict(n=n0.tolist(), lp=base, s1_R1=float(s1(R10)), s1_R2=float(s1(R20))), families=fam, slopes=slopes,
                    zero_dirs=len(zero), zero_sv=[] if not zero else [float(x) for x in np.linalg.svd(np.array(zero), compute_uv=False)])
    print(f"[B] {time.time() - t0:.0f} s", flush=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--part", default="AB")
    ap.add_argument("--map", type=int, default=61)
    ap.add_argument("--mapstarts", type=int, default=12)
    ap.add_argument("--mstep", type=float, default=0.05)
    ap.add_argument("--bstarts", type=int, default=60)
    ap.add_argument("--out", default=os.path.join(HERE, "d37_tet_preview.json"))
    a = ap.parse_args()
    out = {}
    if "A" in a.part:
        part_A(out, a.map, a.mapstarts)
        part_A2(out)
    if "M" in a.part:
        part_M(out, a.mstep, a.mapstarts)
    if "C" in a.part:
        part_C(out, a.bstarts)
    if "B" in a.part:
        part_B(out, a.bstarts)
    def conv(o):
        if isinstance(o, np.ndarray): return o.tolist()
        if isinstance(o, (np.floating,)): return float(o)
        if isinstance(o, (np.integer,)): return int(o)
        if isinstance(o, (np.bool_,)): return bool(o)
        raise TypeError(type(o))
    json.dump(out, open(a.out, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=conv)


if __name__ == "__main__":
    main()
