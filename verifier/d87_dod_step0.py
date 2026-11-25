# D48 section 7, stage D0 (dodinico_n13): formulas, windows, table of points.
# 2026-11-14, written by Claude (Opus 5.5) (L4''d). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#
#   python -X utf8 d87_dod_step0.py a        ... (a) exact checks (solids, cone, s₀, the equality of 2.5, the equality of (II), the 13 pieces of the upper bound)
#   python -X utf8 d87_dod_step0.py b        ... (b) sharpness of the point of (II) (floating point, 2 for n + 3 for rotation)
#   python -X utf8 d87_dod_step0.py c [--level L] [--procs P] ... (c) hi and lo on a grid of n → table of points → margin on another grid (floating point)
# The results go to d87_dod_step0.json (each part is added by overwriting its key) and the table to d87_dod_table.json.
# (b) and (c) are floating point and are not evidence (hi is only an upper estimate by a multi-start descent).
import argparse
import itertools
import json
import math
import os
import sys
import time
from fractions import Fraction as Fr

import numpy as np

from d87_common import (QD, S0, S0_POLY, PHI, Setup, need, dot, mmul, mvec, transpose, det3, inv3, is_orth, eye,
                        vsub, vadd, vscale, fvec, cross, rot_from_quat_f, rot_rational, rationalize_qd,
                        exact_min_t, exact_dual_bound, random_rotations, expmap_batch)

HERE = os.path.dirname(os.path.abspath(__file__))
OUT = os.path.join(HERE, "d87_dod_step0.json")
TABLE = os.path.join(HERE, "d87_dod_table.json")
REC = os.path.join(HERE, "..", "records", "dodinico", "dodinico_n13.json")


def load_out():
    if os.path.exists(OUT):
        with open(OUT, encoding="utf8") as f:
            return json.load(f)
    return {"task": "L4″d\uff08D48 \u6bb5 D0\u3001dodinico_n13\uff09", "note": "\u6d6e\u52d5\u306e\u90e8\u5206 (b)\u30fb(c) \u306f\u8a3c\u62e0\u3067\u306f\u306a\u3044"}


def save_out(d):
    with open(OUT, "w", encoding="utf8") as f:
        json.dump(d, f, ensure_ascii=False, indent=1)


# ======================================================================================
# The 13 pieces of the record, exactly
# ======================================================================================
def record_exact(S):
    with open(REC, encoding="utf8") as f:
        d = json.load(f)
    pieces = []
    for p in d["pieces"]:
        Rf = rot_from_quat_f(p[3:])
        ent = [rationalize_qd(float(x), dmax=40, tol=1e-10) for x in Rf.flatten()]
        need(all(e is not None for e in ent), "a rotation entry does not round to Q(√5)")
        R = [ent[0:3], ent[3:6], ent[6:9]]
        need(is_orth(R) and det3(R) == 1, "the rotation of the record is not an exact rotation")
        c = np.array(p[:3])
        if np.linalg.norm(c) < 1e-6:
            t, j = (QD(0), QD(0), QD(0)), None
        else:
            j = int(np.argmax(S.CVf @ c))
            t = vscale(2 * S.rho_over_v, S.CV[j])          # centroid of a corner piece = 2ρ v̂_j
            need(np.abs(fvec(t) - c).max() < 1e-6, "the centroid of the record does not match 2ρv̂")
        pieces.append({"R": R, "t": t, "vertex": j})
    return pieces


def part_a(S):
    res = {}
    t0 = time.time()
    # --- solids: the face normals are built from the vertices by machine ---
    res["container"] = {"V": 12, "F": len(S.CF), "inradius2": str(S.rC2), "faces_from_vertices": True}
    res["piece"] = {"V": 20, "F": len(S.KF), "inradius2": str(S.rho2), "rho": math.sqrt(float(S.rho2))}
    # Orientation of the dual: record that the face normals of the canonical dodecahedron are NOT aligned with the vertex directions of the canonical icosahedron (to prevent the mix-up from recurring)
    def parallel(a, b):
        return all(x == 0 for x in cross(a, b)) and dot(a, b) > 0
    canon_aligned = sum(any(parallel(f[0], u) for u in S.CV) for f in S.KF)
    res["canonical_piece_faces_toward_container_vertices"] = f"{canon_aligned}/12\uff08\u6b63\u6e96\u306e\u5411\u304d\u306e\u307e\u307e\u3067\u306f\u53cc\u5bfe\u306b\u4e26\u3070\u306a\u3044\uff09"

    # --- s₀ ---
    a, b, c = S0_POLY
    need(a * S0 * S0 + b * S0 + c == 0, "s₀ is not a root of 5x² − 25x + 19")
    with open(os.path.join(HERE, "..", "closed_forms", "dodinico_n13.json"), encoding="utf8") as f:
        cf = json.load(f)
    lo, hi = S0.bounds(400)
    s_str = cf["s"].replace(".", "")
    # compare the string of 117 digits with the first 100 digits of the value bracketed by 2^400
    from decimal import Decimal, getcontext
    getcontext().prec = 130
    s_dec = (Decimal(lo) / (Decimal(2) ** 400))
    need(str(s_dec)[:101] == cf["s"][:101], "the 100 digits of s₀ do not match closed_forms")
    res["s0"] = {"value": str(S0), "poly": list(S0_POLY), "digits_checked": 100, "float": float(S0)}

    # --- cone Q: the cone determined by the 5 neighbouring vertices = the cone of the nearest vertex (11 inequalities) ---
    G = S.G
    rays = []
    for i, j in itertools.combinations(range(5), 2):
        r = cross(G[i], G[j])
        for rr in (r, tuple(-x for x in r)):
            if all(dot(g, rr) >= 0 for g in G) and any(x != 0 for x in rr):
                rays.append(rr)
    rays = list({tuple(x for x in r): r for r in rays}.values())
    need(len(rays) == 5, f"number of generators of the cone {len(rays)}")
    for r in rays:
        need(all(dot(S.v, r) >= dot(u, r) for u in S.CV), "a generator of the cone does not lie in the cone of the nearest vertex")
    # Q ⊂ Q* (inner products of generators ≥ 0)
    need(all(dot(r1, r2) >= 0 for r1 in rays for r2 in rays), "not Q ⊂ Q*")
    # each face of the cone is spanned by 2 generators, and the generators point to the centres of container faces (= container face normals)
    face_dirs = sum(any(parallel(r, f[0]) for f in S.CF) for r in rays)
    res["cone"] = {"rays": len(rays), "rays_are_container_face_normals": f"{face_dirs}/5", "Q_in_Qstar": True,
                   "equals_voronoi_cone": True,
                   "covers": "\u6700\u5bc4\u308a\u306e\u9802\u70b9\u306e\u9310\uff08v·t ≥ v_m·t\u3001\u5168\u90e8\u306e m\uff09\u306f\u5b9a\u7fa9\u304b\u3089\u7a7a\u9593\u3092\u8986\u3046\uff08\u6700\u5927\u3092\u53d6\u308b\u9802\u70b9\u304c\u3042\u308b\uff09\u30025 \u672c\u3067\u8db3\u308a\u308b\u3053\u3068\u3092\u6bcd\u7dda\u3067\u78ba\u304b\u3081\u305f"}
    S.Qrays = rays
    # w₀
    need(dot(S.w0, S.w0) == S.rho2, "|w₀| ≠ ρ")
    res["w0"] = [str(x) for x in S.w0]

    # --- 2.5: weak duality of the best basis = the LP in t (enumerating vertices). With rational quaternions and rational n ---
    rng = np.random.default_rng(87)
    tests = []
    ns = [tuple(-x for x in S.v), S.v, (QD(1), QD(0), QD(0)), (QD(Fr(1, 3)), QD(-1), QD(Fr(1, 2))),
          (QD(-2), QD(1), QD(Fr(1, 5))), vsub(S.CV[S.nbr[0]], S.v)]
    for k, n in enumerate(ns):
        q = [Fr(int(x), 7) for x in rng.integers(-9, 10, 4)]
        if all(x == 0 for x in q):
            q[0] = Fr(1)
        R = rot_rational(q)
        (val, tmin), rows, P = exact_min_t(S, n, R)
        dual = exact_dual_bound(rows, n)
        need(dual is not None and dual[0] == val, f"the best basis of 2.5 does not match the LP value (test {k})")
        # also against the floating-point version
        Rf = np.array([[float(x) for x in row] for row in R])
        gf = S.G_batch(fvec(n), Rf[None])[0]
        hk = max(dot(n, p) for p in P)
        need(abs(gf - float(hk + val)) < 1e-9, "the floating-point G does not match the exact value")
        tests.append({"n": [str(x) for x in n], "q": [str(x) for x in q], "min_t": str(val), "float": float(val)})
    res["dual_basis_equals_lp"] = {"tests": len(tests), "detail": tests}

    # --- the 13 pieces of the record (exact) ---
    pieces = record_exact(S)
    # whether all face normals of the central piece point along vertex directions of the container (orientation of the dual)
    cen = [p for p in pieces if p["vertex"] is None]
    need(len(cen) == 1, "there is not exactly 1 central piece")
    Rc = cen[0]["R"]
    dual_ok = sum(any(parallel(mvec(Rc, f[0]), u) for u in S.CV) for f in S.KF)
    need(dual_ok == 12, "the faces of the central piece do not line up with the container vertex directions")
    need(sorted(p["vertex"] for p in pieces if p["vertex"] is not None) == list(range(12)), "there is not exactly 1 corner piece per vertex")
    # containment
    wall = 0
    for p in pieces:
        for u in S.KV:
            x = vadd(mvec(p["R"], u), p["t"])
            for a, _, _ in S.CF:
                d = dot(a, x)
                need(d <= S0, "a piece sticks out of the container")
                wall += (d == S0)
    # a separating plane for all 78 pairs (candidates: the face normals of both pieces, then cross products of edge directions)
    def verts(p):
        return [vadd(mvec(p["R"], u), p["t"]) for u in S.KV]
    def normals(p):
        return [mvec(p["R"], f[0]) for f in S.KF]
    edges_K = sorted({tuple(sorted(e)) for f in S.KF for e in itertools.combinations(f[2], 2)
                      if dot(vsub(S.KV[e[0]], S.KV[e[1]]), vsub(S.KV[e[0]], S.KV[e[1]])) == 1})
    need(len(edges_K) == 30, "number of edges of the piece")
    Vs = [verts(p) for p in pieces]
    sep_kind = {"face": 0, "edge": 0}
    touching = 0
    for i, j in itertools.combinations(range(13), 2):
        ok = None
        for nrm in normals(pieces[i]) + normals(pieces[j]):
            mi = max(dot(nrm, x) for x in Vs[i]); mj = min(dot(nrm, x) for x in Vs[j])
            if mi <= mj:
                ok = ("face", mi == mj); break
            mi = max(dot(nrm, x) for x in Vs[j]); mj = min(dot(nrm, x) for x in Vs[i])
            if mi <= mj:
                ok = ("face", mi == mj); break
        if ok is None:
            for e1 in edges_K:
                d1 = mvec(pieces[i]["R"], vsub(S.KV[e1[1]], S.KV[e1[0]]))
                for e2 in edges_K:
                    d2 = mvec(pieces[j]["R"], vsub(S.KV[e2[1]], S.KV[e2[0]]))
                    nrm = cross(d1, d2)
                    if all(x == 0 for x in nrm):
                        continue
                    for sg in (1, -1):
                        nn = vscale(sg, nrm)
                        mi = max(dot(nn, x) for x in Vs[i]); mj = min(dot(nn, x) for x in Vs[j])
                        if mi <= mj:
                            ok = ("edge", mi == mj); break
                    if ok:
                        break
                if ok:
                    break
        need(ok is not None, f"no separating plane found for the pair ({i}, {j})")
        sep_kind[ok[0]] += 1
        touching += ok[1]
    res["upper"] = {"pieces": 13, "pairs": 78, "separated": sep_kind, "pairs_touching": touching,
                    "vertex_on_wall_incidences": wall, "s": str(S0),
                    "centers": "\u539f\u70b9 1 \u500b\uff0b\u89d2\u306e\u99d2 12 \u500b\uff08\u91cd\u5fc3 2ρv̂_j = 2(1/2 + 3√5/10)v_j\uff09", "rotations": "\u8a18\u9332\u306e\u56db\u5143\u6570\u3092 Q(√5) \u306b\u4e38\u3081\u3066\u6b63\u78ba\u306a\u56de\u8ee2\u3092\u78ba\u304b\u3081\u305f"}
    # broken copy: with s₀ lowered by 1/1000 the pieces do not fit
    s_bad = S0 - Fr(1, 1000)
    bad = any(dot(a, vadd(mvec(p["R"], u), p["t"])) > s_bad for p in pieces for u in S.KV for a, _, _ in S.CF)
    need(bad, "the broken copy (s₀ − 1/1000) also fits")
    res["upper"]["broken_s0_minus_1e-3_rejected"] = True

    # --- equality of (II): n = −v, R = the orientation of the corner piece at v → min_t h_X(n) = n·w₀ ---
    pc = [p for p in pieces if p["vertex"] == S.vi][0]
    n = tuple(-x for x in S.v)
    (val, tmin), rows, P = exact_min_t(S, n, pc["R"])
    G = max(dot(n, p) for p in P) + val
    need(G == dot(n, S.w0), "the equality of (II) does not hold for the corner piece")
    need(tmin == pc["t"], "the minimising t of (II) is not the centroid of the corner piece")
    # one line of (I): for n ∈ Q*, h_X(n) ≥ ρ|n| ≥ n·w₀ (|w₀| = ρ) - checking the formula only needs the length of w₀
    res["II_equality"] = {"n": "−v", "R": "v \u306e\u89d2\u306e\u99d2\uff08\u8a18\u9332\uff09", "G": str(G), "n_dot_w0": str(dot(n, S.w0)),
                          "argmin_t_is_corner_center": True}
    res["I_one_line"] = "n ∈ Q* \u306a\u3089 h_X(n) = h_K(Rᵀn) + n·t ≥ ρ|n| ≥ n·w₀\uff08|w₀|² = ρ² \u3092\u6b63\u78ba\u306b\u78ba\u304b\u3081\u305f\uff09"
    res["pieces_exact"] = [{"vertex": p["vertex"], "R": [[str(x) for x in row] for row in p["R"]],
                            "t": [str(x) for x in p["t"]]} for p in pieces]
    res["seconds"] = round(time.time() - t0, 1)
    return res, pieces


# ======================================================================================
# hi(n) = min_X h_X(n) (floating point, multi-start)
# ======================================================================================
def hi_of(S, n, rng, m0=20000, seeds=30, rounds=45, per=64, Rwarm=None):
    n = np.asarray(n, float)
    n = n / np.linalg.norm(n)
    Y = S.dual_vertices(n)
    Rs = random_rotations(m0, rng)
    if Rwarm is not None:
        Rs = np.concatenate([Rs, Rwarm])
    g = S.G_batch(n, Rs, Y)
    order = np.argsort(g)[:seeds]
    cur = Rs[order]; cv = g[order]
    sig = 0.15
    for _ in range(rounds):
        W = rng.standard_normal((seeds * per, 3)) * sig
        E = expmap_batch(W)
        cand = np.einsum('sij,sjk->sik', np.repeat(cur, per, axis=0), E)
        gc = S.G_batch(n, cand, Y).reshape(seeds, per)
        k = gc.argmin(axis=1)
        better = gc[np.arange(seeds), k] < cv
        cur[better] = cand.reshape(seeds, per, 3, 3)[np.arange(seeds), k][better]
        cv[better] = gc[np.arange(seeds), k][better]
        sig *= 0.75
    b = int(cv.argmin())
    return float(cv[b]), cur[b]


# ======================================================================================
# (b) sharpness of the point of (II)
# ======================================================================================
def part_b(S, pieces):
    t0 = time.time()
    pc = [p for p in pieces if p["vertex"] == S.vi][0]
    Rs_ = np.array([[float(x) for x in row] for row in pc["R"]])
    nstar = -S.vhat
    u1 = np.cross(nstar, [1.0, 0, 0]); u1 /= np.linalg.norm(u1)
    u2 = np.cross(nstar, u1)
    rng = np.random.default_rng(5)
    out = {}
    for eps in (1e-3, 1e-4):
        best = (np.inf, None)
        dirs = rng.standard_normal((4000, 3)); dirs /= np.linalg.norm(dirs, axis=1, keepdims=True)
        for beta in np.linspace(0, np.pi / 2, 31):
            for gam in np.linspace(0, 2 * np.pi, 73)[:-1] if beta > 0 else [0.0]:
                a = eps * math.cos(beta)
                nd = math.cos(a) * nstar + math.sin(a) * (math.cos(gam) * u1 + math.sin(gam) * u2)
                Rb = Rs_[None] @ expmap_batch(dirs * eps * math.sin(beta))
                f = (S.G_batch(nd, Rb) - nd @ S.w0f) / eps
                k = int(f.argmin())
                if f[k] < best[0]:
                    best = (float(f[k]), (float(beta), float(gam), dirs[k].tolist()))
        out[f"eps_{eps:g}"] = {"min_slope": best[0], "at": best[1]}
    # move only n (R is the best for each n): the slope (how the window opens; cross-check with 0.43 of 4.2)
    sl = []
    for gam in np.linspace(0, 2 * np.pi, 13)[:-1]:
        a = 0.03
        nd = math.cos(a) * nstar + math.sin(a) * (math.cos(gam) * u1 + math.sin(gam) * u2)
        h, _ = hi_of(S, nd, rng)
        sl.append((h - nd @ S.w0f) / a)
    out["n_only_slope_0.03rad"] = {"min": float(min(sl)), "max": float(max(sl))}
    out["seconds"] = round(time.time() - t0, 1)
    out["unit"] = "|n| = 1\u3001\u89d2\u5ea6\u306f\u30e9\u30b8\u30a2\u30f3\uff08n \u306e 2 \u3068\u56de\u8ee2\u30d9\u30af\u30c8\u30eb 3 \u3092\u307e\u3068\u3081\u305f\u9577\u3055\uff09\u3001\u99d2\u306e\u8fba 1"
    return out


# ======================================================================================
# (c) windows and the table of points
# ======================================================================================
def mobius_base(S):
    """The cone spanned by the 3 directions v, midpoint of an edge, centre of a face (exact, Q(√5)) = a fundamental region of the symmetry of the icosahedron."""
    v = S.v
    k = S.nbr[0]
    e = vscale(Fr(1, 2), vadd(v, S.CV[k]))
    # a face containing both v and v_k
    f = [F for F in S.CF if S.vi in F[2] and k in F[2]][0]
    fc = vscale(Fr(1, 3), vadd(vadd(S.CV[f[2][0]], S.CV[f[2][1]]), S.CV[f[2][2]]))
    return [v, e, fc]


def subdivide(tri, level):
    out = [tri]
    for _ in range(level):
        nxt = []
        for a, b, c in out:
            ab, bc, ca = vadd(a, b), vadd(b, c), vadd(c, a)     # sums, not normalised (correct as a subdivision of a cone)
            # sums are halved to make lengths comparable (directions are the same)
            ab, bc, ca = vscale(Fr(1, 2), ab), vscale(Fr(1, 2), bc), vscale(Fr(1, 2), ca)
            nxt += [(a, ab, ca), (ab, b, bc), (ca, bc, c), (ab, bc, ca)]
        out = nxt
    return out


def unit(x):
    x = np.asarray(x, float)
    return x / np.linalg.norm(x)


def bary_points(Tf, L):
    a, b, c = Tf
    pts = []
    for i in range(L + 1):
        for j in range(L + 1 - i):
            k = L - i - j
            pts.append(unit((i * a + j * b + k * c) / L))
    return pts


def _worker(args):
    pts, seed = args
    S = Setup()
    rng = np.random.default_rng(seed)
    out = []
    for p in pts:
        h, R = hi_of(S, p, rng)
        out.append(h)
    return out


def canon_key(Stf, n):
    imgs = [tuple(np.round(M @ n, 9) + 0.0) for M in Stf]
    return min(imgs)


def part_c(S, level, procs, log):
    t0 = time.time()
    Gall, St = S.stabilizer()
    Gf = [np.array([[float(x) for x in r] for r in M]) for M in Gall]
    Stf = [np.array([[float(x) for x in r] for r in M]) for M in St]
    base = mobius_base(S)
    sub = subdivide(base, level)
    # all triangles (the exact directions are in Q(√5); floating point is used only to choose representatives)
    Qrays = getattr(S, "Qrays", None)
    if Qrays is None:
        Qrays = []
        for i, j in itertools.combinations(range(5), 2):
            r = cross(S.G[i], S.G[j])
            for rr in (r, tuple(-x for x in r)):
                if all(dot(g, rr) >= 0 for g in S.G):
                    Qrays.append(rr)
    Qrf = np.array([unit(fvec(r)) for r in Qrays])
    tris = []
    for gi, M in enumerate(Gall):
        for si, T in enumerate(sub):
            Tf = [Gf[gi] @ fvec(x) for x in T]
            tris.append((gi, si, Tf))
    need(len(tris) == 120 * 4 ** level, "number of triangles")
    def in_Qstar(x, sgn):
        return bool(((sgn * x) @ Qrf.T >= -1e-12).all())
    kinds = {"Qstar": 0, "minusQstar": 0, "band": 0}
    band = []
    for gi, si, Tf in tris:
        if all(in_Qstar(x, 1) for x in Tf):
            kinds["Qstar"] += 1
        elif all(in_Qstar(x, -1) for x in Tf):
            kinds["minusQstar"] += 1
        else:
            kinds["band"] += 1; band.append((gi, si, Tf))
    # Γ = representatives of the orbits of stabilizer × {±1}
    reps = {}
    for gi, si, Tf in band:
        keys = []
        for M in Stf:
            for sg in (1, -1):
                keys.append(tuple(sorted(tuple(np.round(sg * (M @ x), 7) + 0.0) for x in Tf)))
        k = min(keys)
        if k not in reps:
            reps[k] = (gi, si, Tf, 0)
        g0, s0_, T0, c = reps[k]
        reps[k] = (g0, s0_, T0, c + 1)
    reps = list(reps.values())
    log(f"triangles {len(tris)}: {kinds}, representatives of band orbits {len(reps)}")
    # points: for fitting (barycentric coordinates L=4), for checking (those of the L=7 points that are not in the fit)
    fitL, chkL = 4, 7
    need_pts = {}
    plan = []
    for gi, si, Tf, cnt in reps:
        fit = bary_points(Tf, fitL)
        chk = [p for p in bary_points(Tf, chkL) if min(np.abs(p - q).max() for q in fit) > 1e-9]
        plan.append((gi, si, Tf, cnt, fit, chk))
        for p in fit + chk:
            for sg in (1, -1):
                q = sg * p
                need_pts.setdefault(canon_key(Stf, q), q)
    # at the vertices of the triangles of Q*, n·w₀ − lo (for reference)
    qpts = []
    for gi, si, Tf in tris:
        if all(in_Qstar(x, 1) for x in Tf):
            for x in Tf:
                qpts.append(unit(x))             # normalise (fixed 11/14 22:35: the first version used lengths 0.76 to 0.95 as they were in n·w₀)
    qkeys = {}
    for x in qpts:
        qkeys.setdefault(canon_key(Stf, x), x)
    for k, x in qkeys.items():
        need_pts.setdefault(canon_key(Stf, -x), -x)
    keys = list(need_pts.keys())
    log(f"points where hi is computed {len(keys)} (those equal under the stabilizer were merged)")
    # parallel
    from multiprocessing import Pool
    chunks = [keys[i::procs * 8] for i in range(procs * 8)]
    with Pool(procs) as pool:
        res = pool.map(_worker, [([need_pts[k] for k in ch], 1000 + i) for i, ch in enumerate(chunks)])
    HI = {}
    for ch, r in zip(chunks, res):
        for k, h in zip(ch, r):
            HI[k] = h
    log(f"computation of hi {time.time() - t0:.0f} s")
    def hi(n):
        return HI[canon_key(Stf, n)]
    def lo(n):
        return -hi(-n)
    # points where the window is negative
    neg = []
    allw = []
    for gi, si, Tf, cnt, fit, chk in plan:
        for p in fit + chk:
            w = hi(p) - lo(p)
            allw.append(w)
            if w < -1e-6:
                neg.append((p.tolist(), w))
    # fit of the table
    from scipy.optimize import linprog
    table = []
    worst = (np.inf, None)
    for idx, (gi, si, Tf, cnt, fit, chk) in enumerate(plan):
        A, bb = [], []
        for p in fit:
            A.append(list(-p) + [1.0]); bb.append(-lo(p))       # −n·w + m ≤ −lo
            A.append(list(p) + [1.0]); bb.append(hi(p))         # n·w + m ≤ hi
        r = linprog([0, 0, 0, -1], A_ub=A, b_ub=bb, bounds=[(None, None)] * 4, method="highs")
        need(r.status == 0, "the LP of the table cannot be solved")
        w = r.x[:3]
        # round to rationals (denominator 1000)
        wq = [Fr(round(x * 1000), 1000) for x in w]
        wf = np.array([float(x) for x in wq])
        def marg(p):
            return min(hi(p) - p @ wf, p @ wf - lo(p))
        mfit = min(marg(p) for p in fit)
        mchk = min(marg(p) for p in chk)
        m_all = min(mfit, mchk)
        ang = [math.degrees(math.acos(max(-1, min(1, x @ S.vhat)))) for x in Tf]
        table.append({"rep": idx, "g": gi, "sub": si, "orbit": cnt, "angles_from_v_deg": [round(a, 2) for a in ang],
                      "w": [str(x) for x in wq], "lp_margin": float(r.x[3]), "margin_fit": mfit, "margin_check": mchk})
        if m_all < worst[0]:
            worst = (m_all, idx)
    # the Q* side (for reference): n·w₀ − lo
    qm = []
    for k, x in qkeys.items():
        ang = math.degrees(math.acos(max(-1, min(1, x @ S.vhat))))
        if ang > 3:
            qm.append((x @ S.w0f - lo(x), ang))
    res = {"level": level, "triangles": len(tris), "kinds": kinds, "band_reps": len(reps), "hi_points": len(keys),
           "fit_points_per_tri": len(bary_points(reps[0][2], fitL)), "check_grid_L": chkL,
           "window_min": float(min(allw)), "window_negative_points": len(neg), "negatives": neg[:10],
           "table_margin_min": worst[0], "table_margin_worst_rep": worst[1],
           "table_margin_lp_min": min(t["lp_margin"] for t in table),
           "Qstar_side_w0_minus_lo_min": (min(qm)[0] if qm else None),
           "Qstar_side_w0_minus_lo_min_angle": (min(qm)[1] if qm else None),
           "seconds": round(time.time() - t0, 1)}
    return res, table, HI


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("part", choices=["a", "b", "c"])
    ap.add_argument("--level", type=int, default=2)
    ap.add_argument("--procs", type=int, default=3)
    args = ap.parse_args()
    def log(s):
        print(time.strftime("%H:%M:%S"), s, flush=True)
    S = Setup()
    d = load_out()
    if args.part == "a":
        res, _ = part_a(S)
        d["a"] = res
        log(f"(a) passed: {json.dumps({k: res[k] for k in ['upper', 'II_equality']}, ensure_ascii=False)[:600]}")
    elif args.part == "b":
        pieces = record_exact(S)
        res = part_b(S, pieces)
        d["b"] = res
        log(f"(b) {json.dumps(res, ensure_ascii=False)}")
    else:
        res, table, HI = part_c(S, args.level, args.procs, log)
        d[f"c_level{args.level}"] = res
        with open(TABLE if args.level == 2 else TABLE.replace(".json", f"_L{args.level}.json"), "w", encoding="utf8") as f:
            json.dump({"note": "D48 4.3 \u306e\u70b9\u306e\u8868\uff08\u6d6e\u52d5\u3067\u3042\u3066\u306f\u3081\u3001w \u306f\u5206\u6bcd 1000 \u306e\u6709\u7406\u6570\uff09\u3002\u4e09\u89d2\u5f62\u306f\u6b63\u4e8c\u5341\u9762\u4f53\u306e\u5bfe\u79f0\u306e\u57fa\u672c\u9818\u57df"
                               "\uff08v\u30fb\u8fba\u306e\u4e2d\u70b9\u30fb\u9762\u306e\u4e2d\u5fc3\uff09\u3092 level \u56de 4 \u5206\u5272\u3057\u305f\u3082\u306e\u3092\u3001\u5bfe\u79f0 120 \u500b\u3067\u5199\u3057\u305f\u3082\u306e\u3002"
                               "\u4ee3\u8868\u306f v \u306e\u56fa\u5b9a\u7fa4 × {±1} \u306e\u8ecc\u9053\u3054\u3068\u3002\u8868\u306e\u51fa\u3069\u3053\u308d\u306f\u8a3c\u660e\u306b\u95a2\u4fc2\u3057\u306a\u3044\u3002",
                       "level": args.level, "base": "mobius_base(Setup())", "reps": table}, f, ensure_ascii=False, indent=1)
        log(f"(c) {json.dumps(res, ensure_ascii=False)[:1500]}")
    save_out(d)


if __name__ == "__main__":
    main()
