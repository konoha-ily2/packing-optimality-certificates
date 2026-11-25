# -*- coding: utf-8 -*-
"""Tests for D48 stage D4 (L4″d, dodinico_n13): the cover by triangles, the table orbits and antipodal pairing, the formulas agree with the true values,
the records are not vacuous, and broken copies are not accepted.
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
The structure was copied from d87_oct_tests.py (stage O4) (it is not imported). d87_common, d87_dod_step0, d87_dod_local, d87_dod_far, d31_common and
d16e_common are only imported (not modified). The records (the result files d87_dod_*) are only read; the tests that break them work on copies in a scratch folder.

The true value G(n, R) − n·w is computed exactly as follows: solve the LP for t in floating point to guess the basis -> build t and y of that basis exactly in Q(√5)
and check exactly that t satisfies all rows and y ≥ 0 (dual feasibility) (= a proof of optimality); if the guess is wrong, enumerate the vertices. Floating point is used
only as preparation for finding the "points where the value is negative" of the broken copies and for guessing the LP basis (a point found is converted to rationals / Q(√5) and checked exactly).

  C  : triangles and the table (exact, Q(√5)).
       C1 The 1,920 triangles (the fundamental region split into 4 twice × the 120 symmetries of the icosahedron) cover the sphere exactly once: after orienting, all have det > 0,
          each oriented edge is paired with exactly one reversed edge (an oriented surface without boundary, V − E + F = 2), and each of 3 points in general position
          lies in the interior of exactly 1 triangle (the degree of the central projection map is 1 -> surjective).
          Reason for the cover (stage D7, point 1(b) of the review by Fable): the oriented triangles have edges in exact 1-to-1 correspondence with reversed edges, so they form a 2-dimensional
          cycle without boundary. A ray from the origin in the direction of one point in general position meets them exactly once with sign + (all have det > 0), so the winding
          number around the origin is 1. If some ray hit no triangle, the cycle would lie in "space minus that ray" (contractible to a point) and have winding number 0, a contradiction.
          Hence every direction lies in the cone (boundary included) of some triangle. V − E + F = 2 and the remaining 2 points in general position
          are sentinels (not needed for the argument).
       C2 Classification: 340 with all vertices in Q*, 340 in −Q*, 1,240 in the band (Q* is the dual of the cone Q, decided exactly by the inner products with the 5 edges of Q).
       C3 The 1,240 triangles of the band are exhausted by the orbits of the 62 representatives of the table (stabilizer of order 10 × {±1}): every orbit has 20 elements, orbits are disjoint, union = band.
       C4 Antipodal pairing gives the same point: for each triangle T of the band, κ(T) = σw_r (T = s·σ·N_r) is determined uniquely, and −T is also in the band with κ(−T) = κ(T).
          The maps 2r and 2r+1 of d87_dod_far.table_charts have c0, d1, d2 with opposite signs and the same w. The stabilizer preserves v, w₀ and the cone.
  X  : formulas of the far candidates (E_v of d87_dod_far and its integer coefficients e_coefs) are compared with the true value at a rational point n and a rational quaternion R.
       With the best choice (top index i, optimal basis, maximal vertex j of each face) E = G − n·w (equality); other choices give ≤. The value of the integer coefficients is
       a positive integer multiple of |q|²·E. Sensitivity: mixing up the sign of the s₀ term or the point w breaks the equality or the ≤.
  P  : special points (the equality point n = −v, R* of (II), the vertices and edge midpoints of the pentagon, the vertices, centroids and edge midpoints of the table triangles) × several R:
       true value ≥ 0, and the leaf of the record containing the point is found (triangle of n -> box of R); for type A, E_v ≥ 0 at each vertex and Σλ_v E_v ≤ true value;
       for type D, follow R -> Rk (trace increases, same true value); for type L, the point must be in the region assigned to the local L_P.
  W  : records are broken (basis, top, j, type, deleting or duplicating a leaf or a triangle, the SHA-256 of the table or a point in the header, a test marker) and fed to replay, which must reject them.
       The unbroken copy passes. For (II), T and local P.
  B  : 5 broken copies (table D4 in D48 section 7). For each: (a) a point where the broken claim is false, exactly; (b) re-checking the record under that premise gives
       failures; (c) rebuilding the triangle of n containing that point is not accepted (a check of soundness).
       B1 move one point of the table out of the window (+N of representative 54, w + (1/20)û). B2 the table with w₀ only. B3 raise s₀ by 1/1000 (also the 0th-order identity of the local lemma).
       B4 drop one cone face (the stabilizer permutes the 5 faces, so only face 0). B5 mix up the cone with that of the neighbouring vertex v′.
       The map choices for finding negative points (112, 114, 110, 81 for B2; 115, 113, 119, 105 for B4) come from a preview (floating point, 11/15). The evidence is only the exact values.
Usage: python -X utf8 d87_dod_tests.py [--only C,X,P,W,B] [--procs 3] [--scratch DIR] [--no-write]   -> d87_dod_tests.json (when all are run)
  --no-write: do not write the result file (when the entry point d87_dod_replay_all.py runs C directly; stage D7)
"""
import sys, os, json, gzip, time, argparse, random, subprocess, math, itertools, tempfile, hashlib, shutil
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
os.chdir(HERE)
from d87_common import (QD, S0, PHI, Setup, need, dot, mvec, det3, inv3, transpose, vsub, vadd, vscale, fvec, cross,
                        rot_rational, random_rotations, rot_from_quat_f)
from d16e_common import mmul, CheckFailed
import d87_dod_step0 as D0
import d87_dod_far as FA
import d87_dod_local as DL
import d31_common as D31

DEN = D31.DEN; ND = FA.ND
OUT = {}
FAIL = []
REC = {"II": "d87_dod_far_II", "T": "d87_dod_far_T", "P": "d87_dod_local_P"}
CODES = ["d87_common.py", "d87_dod_step0.py", "d87_dod_local.py", "d87_dod_far.py", "d87_dod_tests.py", "d31_common.py",
         "d16e_common.py", "d37_tet_n05_common.py"]


def log(s):
    print(s, flush=True)


def check(name, ok, detail=""):
    OUT.setdefault("checks", []).append(dict(name=name, ok=bool(ok), detail=str(detail)))
    log(f"  [{'OK' if ok else 'NG'}] {name} {detail}")
    if not ok:
        FAIL.append(name)


def sha(p):
    h = hashlib.sha256()
    with open(os.path.join(HERE, p), "rb") as f:
        for blk in iter(lambda: f.read(1 << 20), b""):
            h.update(blk.replace(b"\r\n", b"\n"))
    return h.hexdigest()


# ======================================================================================
# Common: preparation and exact true values
# ======================================================================================
_S = {}


def setup():
    if not _S:
        S = Setup()
        Gall, St = S.stabilizer()
        _S.update(S=S, Gall=Gall, St=St, pieces=D0.record_exact(S))
        _S["Rstar"] = [p for p in _S["pieces"] if p["vertex"] == S.vi][0]["R"]
    return _S


def use_prob(p):
    """Prepare the stage of d87_dod_far for (II) or T (G_ is one per stage, so it is rebuilt when switching)."""
    if FA.G_.get("prob") != p:
        FA.G_.clear()
        FA.init(prob=p)
    return FA.G_


def vkey(x):
    return tuple(c.v for c in x)


def qd_of(t):
    return QD(*t)


def qd_t(x):
    return QD.c(x).v


def t_rows(S, R, cone, s0):
    P = [mvec(R, u) for u in S.KV]
    rows = [(a, s0 - max(dot(a, p) for p in P)) for a, _, _ in S.CF] + [(tuple(-x for x in g), QD(0)) for g in cone]
    return rows, P


def exact_G(n, R, cone=None, s0=S0):
    """G(n, R) = h_K(Rᵀn) + min{n·t : RK + t ⊂ s₀C, t ∈ Q(cone)} (exact). Returns (G, t, rows of the basis, y)."""
    S = setup()["S"]
    if cone is None:
        cone = S.G
    rows, P = t_rows(S, R, cone, s0)
    hk = max(dot(n, p) for p in P)
    from scipy.optimize import linprog
    A = np.array([fvec(a) for a, _ in rows]); b = np.array([float(c) for _, c in rows])
    r = linprog(fvec(n), A_ub=A, b_ub=b, bounds=[(None, None)] * 3, method="highs")
    first = []
    if r.status == 0:
        sl = b - A @ r.x
        act = [int(k) for k in np.argsort(sl) if sl[k] < 1e-6 * (1 + abs(b[k]))][:8]
        first = list(itertools.combinations(sorted(act), 3))
    for combos in (first, itertools.combinations(range(len(rows)), 3)):
        for BB in combos:
            M = [list(rows[k][0]) for k in BB]
            if det3(M) == 0:
                continue
            t = mvec(inv3(M), tuple(rows[k][1] for k in BB))
            if not all(dot(a, t) <= c for a, c in rows):
                continue
            y = mvec(inv3(transpose(M)), tuple(-x for x in n))
            if all(c >= 0 for c in y):
                return hk + dot(n, t), t, BB, y
    raise CheckFailed("the optimal basis of the LP for t was not found")


def counter(n, R, w, cone=None, s0=S0):
    return exact_G(n, R, cone, s0)[0] - dot(n, w)


def rat_quat(qf, den=4096):
    q = [Fr(round(float(x) * den), den) for x in qf]
    if all(x == 0 for x in q):
        q[0] = Fr(1)
    return tuple(q)


def M_of_q(q):
    w, x, y, z = q
    return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
            [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
            [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]


def R_of_q(q):
    q = [QD.c(x) for x in q]
    M = M_of_q(q); n2 = sum((x * x for x in q), QD(0))
    return [[e / n2 for e in row] for row in M]


def E_direct(n, w, R, i, bi, js, s0=S0):
    """E_v(R) of type A of d87_dod_far, directly from the formula (exact). y is built from the basis bi of G_['rows'] (None if negative)."""
    S = setup()["S"]
    B = FA.G_["trip"][bi]
    M = [list(FA.G_["rows"][k]) for k in B]
    y = tuple(-x for x in mvec(inv3(transpose(M)), n))
    if not all(c >= 0 for c in y):
        return None
    P = [mvec(R, u) for u in S.KV]
    val = dot(n, P[i]) - dot(n, w)
    jj = 0
    for k, rw in enumerate(B):
        if rw >= 20:
            continue
        val = val + y[k] * (dot(S.CF[rw][0], P[js[jj]]) - s0); jj += 1
    return val


def int_value(ic, q):
    """Evaluate the integer coefficients of e_coefs (the 9 components of M and |q|², each (rational, √5)) exactly at the quaternion q."""
    q = [QD.c(x) for x in q]
    M = M_of_q(q); n2 = sum((x * x for x in q), QD(0))
    forms = [M[l][m] for l in range(3) for m in range(3)] + [n2]
    return sum((QD(a, b) * f for (a, b), f in zip(ic, forms)), QD(0))


def chart_n(cid, a, b):
    ch = FA.G_["charts"][cid]
    return tuple(ch["c0"][k] + ch["d1"][k] * a + ch["d2"][k] * b for k in range(3))


def chart_coords(cid, n):
    """Solve n = λ(c0 + a·d1 + b·d2) (exact). Returns (λ, a, b)."""
    ch = FA.G_["charts"][cid]
    M = [[ch["c0"][k], ch["d1"][k], ch["d2"][k]] for k in range(3)]
    lam, la, lb = mvec(inv3(M), n)
    return lam, la / lam, lb / lam


def find_charts(n):
    out = []
    for cid in sorted(FA.G_["charts"]):
        lam, a, b = chart_coords(cid, n)
        if lam > 0 and a >= 0 and b >= 0 and a + b <= 1:
            out.append((cid, lam, a, b))
    return out


def rand_rot_q(rnd, den=12):
    while True:
        q = tuple(Fr(rnd.randint(-den, den), den) for _ in range(4))
        if any(q):
            return q


def search_min(fun, rng, m=600, starts=4, iters=400):
    """Floating point: search the minimum of fun over rotation quaternions (preparation)."""
    from scipy.optimize import minimize
    from scipy.spatial.transform import Rotation
    Rs = random_rotations(m, rng)
    qs = []
    for R in Rs:
        x = Rotation.from_matrix(R).as_quat(); qs.append(np.array([x[3], x[0], x[1], x[2]]))
    vals = np.array([fun(q) for q in qs])
    best = (1e9, None)
    for o in np.argsort(vals)[:starts]:
        r = minimize(fun, qs[o], method="Nelder-Mead", options=dict(maxiter=iters, xatol=1e-8, fatol=1e-10))
        if r.fun < best[0]:
            best = (float(r.fun), r.x / np.linalg.norm(r.x))
    return best


def G_float(n, R, cone, s0):
    from scipy.optimize import linprog
    S = setup()["S"]
    P = (R @ S.KVf.T).T
    H = (S.Af @ P.T).max(axis=1)
    A = np.vstack([S.Af, -np.array(cone)])
    b = np.concatenate([s0 - H, np.zeros(len(cone))])
    r = linprog(n, A_ub=A, b_ub=b, bounds=[(None, None)] * 3, method="highs")
    return float(r.fun) + float((P @ n).max()) if r.status == 0 else -1e9


def unit_f(n):
    nf = fvec(n)
    return nf / np.linalg.norm(nf)


# ======================================================================================
# C: cover by triangles, classification, orbits, antipodal pairing
# ======================================================================================
def all_triangles():
    S = setup()["S"]; Gall = setup()["Gall"]
    with open(os.path.join(HERE, FA.TABLE_NAME), encoding="utf-8") as f:
        tb = json.load(f)
    sub = D0.subdivide(D0.mobius_base(S), tb["level"])
    tris = {}
    for g, M in enumerate(Gall):
        for s, T in enumerate(sub):
            tris[(g, s)] = tuple(mvec(M, x) for x in T)
    return tris, tb


def in_cone_dual(x, rays):
    return all(dot(x, r) >= 0 for r in rays)


def test_C():
    log("C: cover by triangles, classification, orbits, antipodal pairing (exact)")
    t0 = time.time()
    st = setup(); S, St = st["S"], st["St"]
    tris, tb = all_triangles()
    check("C1 number of triangles", len(tris) == 1920, len(tris))
    orient = {}
    dets_ok = True
    for k, (A, B, C) in tris.items():
        d = det3([list(A), list(B), list(C)])
        if d == 0:
            dets_ok = False
        orient[k] = (A, B, C) if d > 0 else (A, C, B)
    check("C1 no triangle is degenerate (det ≠ 0, det > 0 after orienting)", dets_ok)
    E = {}
    for k, (A, B, C) in orient.items():
        for X, Y in ((A, B), (B, C), (C, A)):
            E.setdefault((vkey(X), vkey(Y)), []).append(k)
    paired = all(len(v) == 1 and len(E.get((b, a), [])) == 1 for (a, b), v in E.items())
    nV = len({vkey(x) for T in orient.values() for x in T}); nE = len(E) // 2
    check("C1 each oriented edge is paired with exactly one reversed edge (an oriented surface without boundary)", paired, f"edges {nE}")
    check("C1 V − E + F = 2", nV - nE + len(orient) == 2, f"V {nV}, E {nE}, F {len(orient)}")
    gen = [(QD(Fr(1, 7)), QD(Fr(2, 9)), QD(Fr(5, 11))), (QD(Fr(-3, 5)), QD(Fr(1, 13)), QD(Fr(2, 3))),
           (QD(Fr(4, 17)), QD(Fr(-7, 19)), QD(Fr(-1, 23)))]
    for p in gen:
        inside = 0; onb = 0
        for A, B, C in orient.values():
            lam = mvec(inv3(transpose([list(A), list(B), list(C)])), p)
            if all(c > 0 for c in lam):
                inside += 1
            elif all(c >= 0 for c in lam):
                onb += 1
        check(f"C1 the general point {tuple(str(x) for x in p)} is in the interior of exactly 1 triangle (0 on a boundary)", inside == 1 and onb == 0,
              f"interior {inside}, boundary {onb}")
    # C2 classification: the edges of Q (intersections of adjacent 2 faces, 5 of them). Q* = cone(g_k) = {x : x·r ≥ 0 (for all edges r)}
    rays = []
    for i, j in itertools.combinations(range(5), 2):
        c = cross(S.G[i], S.G[j])
        for rr in (c, tuple(-x for x in c)):
            if all(dot(g, rr) >= 0 for g in S.G) and sum(1 for g in S.G if dot(g, rr) == 0) == 2:
                rays.append(rr)
    check("C2 Q has 5 edges (intersections of adjacent 2 faces)", len(rays) == 5, len(rays))
    check("C2 g_k is in Q* (inner products with the edges ≥ 0)", all(in_cone_dual(g, rays) for g in S.G))
    kinds = {}
    band = {}
    for k, T in tris.items():
        if all(in_cone_dual(x, rays) for x in T):
            kinds[k] = "Q*"
        elif all(in_cone_dual(tuple(-c for c in x), rays) for x in T):
            kinds[k] = "-Q*"
        else:
            kinds[k] = "band"; band[frozenset(vkey(x) for x in T)] = k
    cnt = {s: sum(1 for v in kinds.values() if v == s) for s in ("Q*", "-Q*", "band")}
    check("C2 classification: Q* 340, −Q* 340, band 1,240", cnt == {"Q*": 340, "-Q*": 340, "band": 1240}, cnt)
    check("C2 the triangles of the band are pairwise distinct", len(band) == 1240)
    # C3 orbits
    seen = {}
    orbit_ok = True; reps_band = True
    for r in tb["reps"]:
        N = tris[(r["g"], r["sub"])]
        if kinds[(r["g"], r["sub"])] != "band":
            reps_band = False
        imgs = []
        for si, M in enumerate(St):
            for sg in (1, -1):
                imgs.append((frozenset(vkey(vscale(sg, mvec(M, x))) for x in N), si, sg))
        if len({k for k, _, _ in imgs}) != 20 or r["orbit"] != 20:
            orbit_ok = False
        for key, si, sg in imgs:
            if key not in band or key in seen:
                orbit_ok = False
            seen[key] = (r["rep"], si, sg)
    check("C3 the 62 representatives of the table are all in the band", reps_band and len(tb["reps"]) == 62 and sorted(r["rep"] for r in tb["reps"]) == list(range(62)),
          len(tb["reps"]))
    check("C3 the orbits (stabilizer of order 10 × {±1}) all have 20 elements, are disjoint, and lie in the band", orbit_ok)
    check("C3 the union of the orbits = the 1,240 triangles of the band", set(seen) == set(band), f"{len(seen)} / {len(band)}")
    # C4 antipodal pairing
    W = {r["rep"]: tuple(QD(Fr(x)) for x in r["w"]) for r in tb["reps"]}
    kap = {key: mvec(St[si], W[rep]) for key, (rep, si, sg) in seen.items()}
    anti_ok = True
    for key in band:
        neg = frozenset(tuple(tuple(-c for c in comp) for comp in x) for x in key)
        if neg not in band or kap[neg] != kap[key]:
            anti_ok = False
    check("C4 for each triangle T of the band, −T is also in the band and κ(−T) = κ(T) (all 1,240, exact)", anti_ok)
    stab_ok = all(mvec(M, S.v) == S.v and mvec(M, S.w0) == S.w0
                  and sorted(map(str, [mvec(M, g) for g in S.G])) == sorted(map(str, S.G)) for M in St)
    check("C4 the 10 elements of the stabilizer preserve v, w₀ and the cone Q", stab_ok and len(St) == 10)
    use_prob("T")
    ch = FA.G_["charts"]
    pair_ok = len(ch) == 124
    for r in tb["reps"]:
        a, b = ch[2 * r["rep"]], ch[2 * r["rep"] + 1]
        N = tris[(r["g"], r["sub"])]
        pair_ok &= (a["w"] == b["w"] == W[r["rep"]] and a["sg"] == 1 and b["sg"] == -1
                    and a["c0"] == N[0] and b["c0"] == vscale(-1, N[0])
                    and a["d1"] == vsub(N[1], N[0]) and b["d1"] == vscale(-1, vsub(N[1], N[0]))
                    and a["d2"] == vsub(N[2], N[0]) and b["d2"] == vscale(-1, vsub(N[2], N[0])))
    check("C4 the maps 2r, 2r+1 of d87_dod_far are the table triangles ±N_r with the same w (124 of them)", pair_ok)
    check("C4 premise of (I): |w₀|² = ρ² (squared radius of the inscribed sphere of the piece)", dot(S.w0, S.w0) == S.rho2, str(S.rho2))
    OUT["C"] = dict(triangles=1920, kinds=cnt, edges=nE, vertices=nV, reps=62, orbit=20, seconds=round(time.time() - t0, 1))


# ======================================================================================
# X: formulas of the candidates = true value
# ======================================================================================
def best_choice(n, w, R):
    """The true value and the far candidate (i, index of the basis, j) that gives it with equality, exactly."""
    S = setup()["S"]
    Gv, t, BB, y = exact_G(n, R)
    P = [mvec(R, u) for u in S.KV]
    i = max(range(20), key=lambda k: dot(n, P[k]))
    bi = FA.G_["trip"].index(tuple(sorted(BB)))          # the order of the rows (container 20, cone 5) is the same as d87_dod_far.G_['rows']
    js = tuple(max(range(20), key=lambda j: dot(S.CF[rw][0], P[j])) for rw in FA.G_["trip"][bi] if rw < 20)
    return Gv - dot(n, w), i, bi, js


def test_X(seed=7, nT=24, nII=8):
    log("X: formulas of the far candidates and the true value (exact, at rational points and rational quaternions)")
    t0 = time.time()
    setup()
    rnd = random.Random(seed)
    stats = dict(points=0, eq=0, le_checks=0, le_bad=0, int_ok=0, sens_s0=0, sens_s0_n=0, sens_w=0)
    for prob, m in (("II", nII), ("T", nT)):
        use_prob(prob)
        cids = sorted(FA.G_["charts"])
        for _ in range(m):
            cid = rnd.choice(cids)
            a = Fr(rnd.randint(0, 24), 24); b = Fr(rnd.randint(0, 24 - int(a * 24)), 24)
            n = chart_n(cid, a, b); w = FA.G_["charts"][cid]["w"]
            q = rand_rot_q(rnd); R = R_of_q(q)
            truth, i, bi, js = best_choice(n, w, R)
            Eb = E_direct(n, w, R, i, bi, js)
            stats["points"] += 1
            stats["eq"] += (Eb == truth)
            vd = dict(n=n, w=w, ex={})
            ic = FA.e_coefs(vd, ("X", prob, cid, str(a), str(b), str(q)), bi, i, js)
            iv = int_value(ic, q); n2 = sum((QD(x) * QD(x) for x in q), QD(0))
            if Eb == 0:
                okint = (iv == 0)
            else:
                ratio = iv / (n2 * Eb)
                okint = ratio.v[1] == 0 and ratio.v[0] > 0 and ratio.v[0].denominator == 1
            stats["int_ok"] += okint
            fb = [k for k in range(len(FA.G_["trip"])) if FA.y_exact(dict(n=n, ex={}), k) is not None]
            for _k in range(6):
                bj = rnd.choice(fb); i2 = rnd.randrange(20)
                j2 = tuple(rnd.randrange(20) for rw in FA.G_["trip"][bj] if rw < 20)
                E2 = E_direct(n, w, R, i2, bj, j2)
                stats["le_checks"] += 1; stats["le_bad"] += (E2 > truth)
            if E_direct(n, w, R, i, bi, js, s0=QD(0)) != Eb:          # only the points where a container face is in the basis (the s₀ term is nonzero)
                stats["sens_s0_n"] += 1
                stats["sens_s0"] += (E_direct(n, w, R, i, bi, js, s0=-S0) > truth)
            stats["sens_w"] += (E_direct(n, tuple(-x for x in w), R, i, bi, js) != truth)
    P_ = stats["points"]
    check("X with the best choice E = G − n·w (exact equality)", stats["eq"] == P_, f"{stats['eq']} / {P_}")
    check("X the value of the integer coefficients (e_coefs) = a positive integer multiple of |q|²·E", stats["int_ok"] == P_, f"{stats['int_ok']} / {P_}")
    check("X other choices are ≤ true value", stats["le_bad"] == 0, f"{stats['le_checks']} pairs, violations {stats['le_bad']}")
    check("X sensitivity: reversing the sign of the s₀ term gives E > true value at all points where a container face is in the basis",
          stats["sens_s0"] == stats["sens_s0_n"] > 0, f"{stats['sens_s0']} / {stats['sens_s0_n']} (the other {P_ - stats['sens_s0_n']} points have a basis of cone faces only)")
    check("X sensitivity: replacing the point by −w gives points where the equality breaks", stats["sens_w"] > 0, f"{stats['sens_w']} / {P_}")
    stats["seconds"] = round(time.time() - t0, 1)
    OUT["X"] = stats


# ======================================================================================
# P: special points -> leaves of the records
# ======================================================================================
_REC = {}


def load_far(prob):
    if prob not in _REC:
        with gzip.open(os.path.join(HERE, REC[prob] + ".boxes.jsonl.gz"), "rt", encoding="utf-8") as f:
            lines = [json.loads(s) for s in f]
        by = {}
        for r in lines[1:]:
            t = tuple(tuple(p) for p in r["tri"])
            by.setdefault(r.get("cid", 0), {})[t] = {(lf[0], tuple(lf[1]), tuple(lf[2])): lf for lf in r["leaves"]}
        _REC[prob] = (lines[0], by)
    return _REC[prob]


def bary(tri, a, b):
    (x0, y0), (x1, y1), (x2, y2) = [(Fr(p[0], ND), Fr(p[1], ND)) for p in tri]
    a, b = QD.c(a), QD.c(b)
    det = (x1 - x0) * (y2 - y0) - (x2 - x0) * (y1 - y0)
    l1 = ((a - x0) * (y2 - y0) - (x2 - x0) * (b - y0)) / det
    l2 = ((x1 - x0) * (b - y0) - (a - x0) * (y1 - y0)) / det
    return (1 - l1 - l2, l1, l2)


def find_tri(by_cid, a, b):
    cur = FA.ROOT_T
    for _ in range(40):
        if cur in by_cid:
            return cur
        nxt = [s for s in FA.split4(cur) if all(c >= 0 for c in bary(s, a, b))]
        need(nxt, "no child contains the point of n")
        cur = nxt[0]
    raise CheckFailed("the triangle of n was not found")


def q_box_coords(q):
    qf = [float(x) for x in q]
    ch = max(range(4), key=lambda k: abs(qf[k]))
    sg = 1 if qf[ch] > 0 else -1
    qq = [QD.c(x) * sg for x in q]
    return ch, [qq[k] / qq[ch] * DEN for k in range(4) if k != ch]


def find_box(leaves, q):
    ch, c = q_box_coords(q)
    lo, hi = [-DEN] * 3, [DEN] * 3
    for _ in range(200):
        k = (ch, tuple(lo), tuple(hi))
        if k in leaves:
            return leaves[k]
        nxt = [(a, b) for a, b in FA.split3(lo, hi) if all(a[m] <= c[m] <= b[m] for m in range(3))]
        need(nxt, "no child contains the point of R")
        lo, hi = nxt[0]
    raise CheckFailed("the leaf of R was not found")


def follow_point(prob, cid, a, b, q, st):
    """Follow the point (n, R) down to a leaf of the record. Returns the type of the leaf."""
    hd, by = load_far(prob)
    n = chart_n(cid, a, b); w = FA.G_["charts"][cid]["w"]
    tri = find_tri(by[cid], a, b)
    lam = bary(tri, a, b)
    vds = [FA.vdata(*p, cid) for p in tri]
    R = R_of_q(q)
    truth0 = counter(n, R, w)
    need(truth0 >= 0, f"true value is negative {truth0}")
    for step in range(12):
        lf = find_box(by[cid][tri], q)
        kind = lf[3]
        st[kind] = st.get(kind, 0) + 1
        if kind == "A":
            i, cert = lf[4]
            Es = [E_direct(vd["n"], w, R, i, bi, tuple(js)) for (bi, js), vd in zip(cert, vds)]
            need(all(e is not None and e >= 0 for e in Es), "E_v at a vertex is negative in a type A leaf")
            comb = sum((l * e for l, e in zip(lam, Es)), QD(0))
            truth = counter(n, R, w)
            need(comb <= truth, "Σλ E_v exceeds the true value")
            need(truth == truth0, "the true value changed under R -> Rk")
            return "A", truth0
        if kind == "D":
            k = FA.G_["KG_NONID"][lf[4]]
            R2 = mmul(R, k)
            need(R2[0][0] + R2[1][1] + R2[2][2] > R[0][0] + R[1][1] + R[2][2], "the trace does not increase in a type D leaf")
            R = R2; q = FA.mat_to_q_qd(R2)
            continue
        if kind == "L":
            need(FA.n_in_L(vds), "in a type L leaf the triangle of n is outside the local square")
            W = FA.G_["WL"][lf[4]]
            qq = [QD.c(x) for x in q]
            ww = [sum((W[r][c] * qq[c] for c in range(4)), QD(0)) for r in range(4)]
            sp = FA.G_["SP"]
            need(any(all(sg * ww[0] > 0 and -sp * sg * ww[0] <= ww[m] <= sp * sg * ww[0] for m in (1, 2, 3)) for sg in (1, -1)),
                 "in a type L leaf R is outside the region assigned to the local lemma")
            return "L", truth0
    raise CheckFailed("following D does not terminate")


def test_P(seed=11):
    log("P: special points down to the leaves of the records (exact)")
    t0 = time.time()
    setup(); S = _S["S"]
    rnd = random.Random(seed)
    qstar = FA.mat_to_q_qd(_S["Rstar"])
    pts = []
    for a, b in ((0, 0), (1, 0), (0, 1), (Fr(1, 2), Fr(1, 2)), (Fr(1, 8), Fr(1, 16)), (Fr(1, 3), Fr(1, 3))):
        pts.append(("II", 0, Fr(a), Fr(b)))
    reps = [54] + rnd.sample([r for r in range(62) if r != 54], 6)
    for r in reps:
        for sg in (0, 1):
            for a, b in ((0, 0), (1, 0), (0, 1), (Fr(1, 3), Fr(1, 3)), (Fr(1, 2), Fr(1, 2))):
                pts.append(("T", 2 * r + sg, Fr(a), Fr(b)))
    st = {}; n_ok = 0; n_tot = 0; zero = 0; kinds = {}
    for prob, cid, a, b in pts:
        use_prob(prob)
        Rlist = [rand_rot_q(rnd), rand_rot_q(rnd, 7)]
        if prob == "II":
            Rlist = [qstar] + Rlist
        else:
            # also include an R near the minimum of G − n·w at that point (searched in floating point, converted to rationals)
            n = chart_n(cid, a, b); nf = unit_f(n); wf = fvec(FA.G_["charts"][cid]["w"])
            v, qf = search_min(lambda q: G_float(nf, rot_from_quat_f(q), S.Gf, float(S0)) - nf @ wf,
                               np.random.default_rng(n_tot), m=200, starts=2, iters=250)
            Rlist.append(rat_quat(qf))
        for q in Rlist:
            n_tot += 1
            try:
                kind, tv = follow_point(prob, cid, a, b, q, st)
                n_ok += 1
                kinds[kind] = kinds.get(kind, 0) + 1
                zero += (tv == 0)
            except CheckFailed as e:
                log(f"    NG: {prob} map {cid} ({a}, {b}): {e}")
    check("P special points × R: the true value ≥ 0, a leaf of the record is found, and the claim of the leaf holds at that point", n_ok == n_tot,
          f"{n_ok} / {n_tot}, leaves followed {st}, leaves reached {kinds}")
    check("P the equality point n = −v, R = R* of (II) has true value exactly 0 (goes into type L)", zero >= 1, f"pairs with true value 0: {zero}")
    OUT["P"] = dict(points=n_tot, ok=n_ok, leaves_visited=st, ends=kinds, zero=zero, seconds=round(time.time() - t0, 1))


# ======================================================================================
# W: replay rejects broken records
# ======================================================================================
def run_replay(kind, path, procs):
    if kind == "P":
        args = ["d87_dod_local.py", "replay", "--name", path]
    else:
        args = ["d87_dod_far.py", "replay", "--name", path, "--procs", str(procs)]
    r = subprocess.run([sys.executable, "-X", "utf8"] + args, cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    tail = (r.stdout.strip().splitlines() or [""])[-1][:160]
    err = (r.stderr.strip().splitlines() or [""])[-1][:160]
    return r.returncode, tail, err


def read_lines(kind):
    ext = "leaves.jsonl.gz" if kind == "P" else "boxes.jsonl.gz"
    with gzip.open(os.path.join(HERE, f"{REC[kind]}.{ext}"), "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f], ext


def write_lines(lines, path, ext):
    with gzip.open(f"{path}.{ext}", "wt", encoding="utf-8") as f:
        for r in lines:
            f.write(json.dumps(r, ensure_ascii=False) + "\n")


def one_tri_bad(r, prob):
    cnt, bad = FA._replay_one((r.get("cid", 0), r["tri"], r["leaves"], FA.LOCAL_NAME, prob))
    return bad


def tampers_far(prob, rnd):
    """List of ways of breaking. For those that rewrite a leaf, first check that the re-check of that triangle alone fails, and choose such (so the test is not vacuous)."""
    lines, ext = read_lines(prob)
    out = [("copy (unbroken)", lines, True)]
    use_prob(prob)
    cands = [(li, k) for li, r in enumerate(lines[1:], 1) for k, lf in enumerate(r["leaves"]) if lf[3] == "A"]
    rnd.shuffle(cands)
    nb = len(FA.G_["trip"])
    cp = lambda: json.loads(json.dumps(lines))

    def first_bad(desc, rng_, mut):
        for li, k in rng_:
            L = cp()
            if mut(L[li]["leaves"], k) is False:
                continue
            if one_tri_bad(L[li], prob):
                out.append((desc, L, False)); return
        out.append((desc + " (no modification that fails was found)", None, False))

    def m_basis(lv, k):
        lv[k][4][1][0][0] = (lv[k][4][1][0][0] + 1) % nb

    def m_top(lv, k):
        lv[k][4][0] = (lv[k][4][0] + 7) % 20

    def m_j(lv, k):
        js = lv[k][4][1][1][1]
        if not js:
            return False
        js[0] = (js[0] + 5) % 20

    def m_type(lv, k):
        lf = lv[k]; lv[k] = [lf[0], lf[1], lf[2], "D", 0]

    first_bad("change the index of the basis of type A", cands[:30], m_basis)
    first_bad("change the top vertex i of type A", cands[30:60], m_top)
    first_bad("change the vertex j of a face of type A", cands[60:90], m_j)
    first_bad("change type A to type D (k = 0)", cands[90:120], m_type)
    li, k = cands[0]
    L = cp(); del L[li]["leaves"][k]
    out.append(("delete 1 leaf of R (a hole in the cover)", L, False))
    L = cp(); del L[1 + rnd.randrange(len(lines) - 1)]
    out.append(("delete 1 triangle of n (a hole in the cover)", L, False))
    L = cp(); L.append(L[1])
    out.append(("duplicate a triangle of n", L, False))
    L = cp(); L[0]["brk"] = {"noL": "True"}
    out.append(("test marker in the header", L, False))
    if prob == "T":
        L = cp(); L[0]["table_sha256"] = "0" * 64
        out.append(("SHA-256 of the table in the header", L, False))
        L = cp(); L[0]["charts"]["108"]["w"][0] = str(QD(Fr(L[0]["charts"]["108"]["w"][0].strip("()").split("+")[0].split("√")[0]) + Fr(1, 20)))
        need(L[0]["charts"]["108"]["w"][0] != lines[0]["charts"]["108"]["w"][0], "could not rewrite the point in the header")
        out.append(("shift the point w of map 108 in the header", L, False))
    else:
        Ls = [(li, k) for li, r in enumerate(lines[1:], 1) for k, lf in enumerate(r["leaves"]) if lf[3] == "L"]

        def m_L(lv, k):
            lv[k][4] = (lv[k][4] + 1) % 60
        first_bad("change the number of the rotation of the piece of type L", Ls, m_L)
        L = cp(); L[0]["SN"] = "1/2"
        out.append(("set the local width SN in the header to 1/2", L, False))
    return out, ext


def tampers_local(rnd):
    lines, ext = read_lines("P")
    out = [("copy (unbroken)", lines, True)]
    cp = lambda: json.loads(json.dumps(lines))
    L = cp(); i = 1 + rnd.randrange(len(lines) - 1)
    c = L[i]["c"]
    L[i]["c"] = (c + 17) % 200 if isinstance(c, int) else c
    out.append(("change the number of the candidate" if isinstance(c, int) else "change the number of the candidate (not an integer, vacuous)", L, False))
    L = cp(); del L[1 + rnd.randrange(len(lines) - 1)]
    out.append(("delete 1 leaf (a hole in the cover)", L, False))
    L = cp(); L[0]["s0"] = str(S0 + Fr(1, 1000))
    out.append(("raise s₀ in the header by 1/1000", L, False))
    return out, ext


def test_W(scratch, procs):
    log("W: replay rejects broken records (on copies in a scratch folder)")
    t0 = time.time()
    os.makedirs(scratch, exist_ok=True)
    rnd = random.Random(5)
    res = []
    for kind in ("P", "II", "T"):
        ts, ext = tampers_local(rnd) if kind == "P" else tampers_far(kind, rnd)
        for idx, (desc, L, expect_ok) in enumerate(ts):
            if L is None:
                check(f"W {kind}: {desc}", False); continue
            path = os.path.join(scratch, f"w_{kind}_{idx}")
            write_lines(L, path, ext)
            if kind == "P":
                shutil.copy(os.path.join(HERE, REC["P"] + ".json"), path + ".json")
            t1 = time.time()
            rc, tail, err = run_replay(kind, path, procs)
            ok = (rc == 0) if expect_ok else (rc != 0)
            check(f"W {kind}: {desc} -> {'passes' if expect_ok else 'rejected'}", ok, f"exit {rc}, {time.time()-t1:.0f} s: {(tail if rc == 0 else err)}")
            res.append(dict(kind=kind, desc=desc, rc=rc, ok=ok))
    OUT["W"] = dict(cases=res, seconds=round(time.time() - t0, 1))


# ======================================================================================
# B: broken copies
# ======================================================================================
def apply_patch(prob, patch):
    """Put a way of breaking into the stage of d87_dod_far (only inside this process; no file is rewritten)."""
    use_prob(prob)
    G = FA.G_
    G["VC"].clear(); G["EC"].clear()
    if "w" in patch:
        for cid, wt in patch["w"].items():
            G["charts"][int(cid)]["w"] = tuple(qd_of(x) for x in wt)
    if "w_all" in patch:
        for cid in G["charts"]:
            G["charts"][cid]["w"] = tuple(qd_of(x) for x in patch["w_all"])
    if "s0" in patch:
        FA.S0 = qd_of(patch["s0"]); G["s0f"] = float(FA.S0)
    if "cone" in patch:
        cone = [tuple(qd_of(x) for x in g) for g in patch["cone"]]
        for k, g in enumerate(cone):
            G["rows"][20 + k] = tuple(-x for x in g)
        G["rowsf"] = np.array([fvec(r) for r in G["rows"]])
        Tf = []
        for B in G["trip"]:
            Mf = G["rowsf"][list(B)]
            Tf.append(np.linalg.inv(Mf.T) if abs(np.linalg.det(Mf)) > 1e-9 else np.full((3, 3), np.nan))
        G["Tf"] = np.array(Tf); G["Tex"].clear()
    if "drop" in patch or "cone" in patch:
        if not hasattr(FA, "_y_exact_orig"):
            FA._y_exact_orig = FA.y_exact
        drop = patch.get("drop")

        def y_exact(vd, bi):
            B = FA.G_["trip"][bi]
            if drop is not None and (20 + drop) in B:
                return None
            if det3([list(FA.G_["rows"][k]) for k in B]) == 0:
                return None
            return FA._y_exact_orig(vd, bi)
        FA.y_exact = y_exact


def _rp_init(prob, patch):
    apply_patch(prob, patch)


def _rp_job(args):
    cid, tri, leaves, prob = args
    cnt, bad = FA._replay_one((cid, tri, leaves, FA.LOCAL_NAME, prob))
    return cid, bad, sum(cnt.values())


def patched_replay(prob, patch, procs, cids=None):
    """Re-check the leaves of the record under a broken premise (returns: number of failing leaves, number of leaves, maps that failed)."""
    hd, by = load_far(prob)
    jobs = [(cid, [list(p) for p in tri], list(lv.values()), prob)
            for cid, tris in by.items() if cids is None or cid in cids for tri, lv in tris.items()]
    from multiprocessing import Pool
    with Pool(procs, initializer=_rp_init, initargs=(prob, patch)) as pool:
        res = list(pool.imap_unordered(_rp_job, jobs, chunksize=4))
    bad = sum(b for _, b, _ in res); tot = sum(t for _, _, t in res)
    return bad, tot, sorted({c for c, b, _ in res if b})


def _build_job(args):
    prob, patch, cid, tri, budget = args
    apply_patch(prob, patch)
    tri = tuple(tuple(p) for p in tri)
    allowL = FA.G_["charts"][cid]["L"] and FA.n_in_L([FA.vdata(*p, cid) for p in tri])
    leaves, ev = FA.rtree(tri, budget, 16, allowL, cid)
    return cid, tri, leaves is not None, ev


def patched_builds(prob, patch, cid, a, b, procs, budget=3000, depth=2):
    """Rebuild the triangle of n of the record containing the point (a, b) and its child containing that point (depth levels) under a broken premise. None should be accepted."""
    hd, by = load_far(prob)
    tri = find_tri(by[cid], a, b)
    tris = [tri]; cur = tri
    for _ in range(depth):
        cur = [s for s in FA.split4(cur) if all(c >= 0 for c in bary(s, a, b))][0]
        tris.append(cur)
    from multiprocessing import Pool
    with Pool(min(procs, len(tris))) as pool:
        return list(pool.imap(_build_job, [(prob, patch, cid, [list(p) for p in t], budget) for t in tris]))


def worst_chart(cands, wfun, cone_f, rng):
    """Floating point: for each candidate map search the minimum of G − n·w; returns the most negative (value, cid, a, b, rational quaternion)."""
    S = setup()["S"]
    best = None
    for cid, a, b in cands:
        nf = unit_f(chart_n(cid, a, b)); wf = wfun(cid)
        v, qf = search_min(lambda q: G_float(nf, rot_from_quat_f(q), cone_f, float(S0)) - nf @ wf, rng, m=400, starts=3)
        if best is None or v < best[0]:
            best = (v, cid, a, b, rat_quat(qf))
    return best


def test_B(procs):
    log("B: 5 broken copies")
    t0 = time.time()
    setup(); S = _S["S"]
    rng = np.random.default_rng(2026)
    res = {}
    use_prob("T")
    ch = FA.G_["charts"]
    W_TRUE = {cid: ch[cid]["w"] for cid in ch}

    def builds_ok(bl):
        return all(not r[2] for r in bl), [[bool(r[2]), r[3]] for r in bl]

    # ---------- B1: move one point of the table out of the window (map 108 = +N of representative 54, where the margin 0.020 of the table is smallest) ----------
    cid = 108; a = b = Fr(1, 3)
    n = chart_n(cid, a, b); nf = fvec(n); nn = float(np.linalg.norm(nf))
    u = tuple(QD(Fr(round(x / nn * 1000), 1000)) for x in nf)
    w = W_TRUE[cid]; w2 = tuple(x + Fr(1, 20) * y for x, y in zip(w, u))
    v, cid_, a_, b_, q = worst_chart([(cid, a, b)], lambda c: fvec(w2) , S.Gf, rng)
    R = R_of_q(q)
    g_ok, g_bad = counter(n, R, w), counter(n, R, w2)
    check("B1 move one point of the table out of the window: at that point G − n·w ≥ 0, G − n·w′ < 0 (exact)", g_ok >= 0 and g_bad < 0,
          f"{float(g_ok):.5f}, {float(g_bad):.5f} (|n| = {nn:.4f})")
    patch = {"w": {str(cid): [qd_t(x) for x in w2]}}
    bad, tot, _ = patched_replay("T", patch, procs, cids=[cid])
    check("B1 re-checking the leaves of map 108 of the record with w′ gives failures", bad > 0, f"failures {bad} / {tot}")
    okb, bl = builds_ok(patched_builds("T", patch, cid, a, b, procs))
    check("B1 rebuilding the triangle of n containing that point with w′ is not accepted (3 levels)", okb, bl)
    res["B1"] = dict(cid=cid, shift="w + (1/20)û\uff08û \u306f\u91cd\u5fc3\u306e\u5411\u304d\u306e 3 \u6841\u306e\u6709\u7406\u6570\uff09", G_minus_nw=float(g_ok), G_minus_nw2=float(g_bad),
                     q=[str(x) for x in q], replay_bad=bad, replay_total=tot, builds=bl)

    # ---------- B2: the table with w₀ only ----------
    v, cid2, a2, b2, q = worst_chart([(c, Fr(1, 3), Fr(1, 3)) for c in (112, 114, 110, 81)], lambda c: S.w0f, S.Gf, rng)
    n2 = chart_n(cid2, a2, b2); R = R_of_q(q)
    g_ok, g_bad = counter(n2, R, W_TRUE[cid2]), counter(n2, R, S.w0)
    check("B2 the table with w₀ only: at that point G − n·w_N ≥ 0, G − n·w₀ < 0 (exact)", g_ok >= 0 and g_bad < 0,
          f"map {cid2}: {float(g_ok):.5f}, {float(g_bad):.5f} (|n| = {np.linalg.norm(fvec(n2)):.4f})")
    patch = {"w_all": [qd_t(x) for x in S.w0]}
    bad, tot, badc = patched_replay("T", patch, procs)
    check("B2 re-checking the leaves of all maps of the record with w₀ gives failures", bad > 0, f"failures {bad} / {tot}, maps that fail {len(badc)} / 124")
    okb, bl = builds_ok(patched_builds("T", patch, cid2, a2, b2, procs))
    check("B2 rebuilding the triangle of n containing that point with w₀ is not accepted (3 levels)", okb, bl)
    res["B2"] = dict(cid=cid2, G_minus_nwN=float(g_ok), G_minus_nw0=float(g_bad), q=[str(x) for x in q], replay_bad=bad,
                     replay_total=tot, bad_charts=len(badc), builds=bl)

    # ---------- B3: raise s₀ by 1/1000 ----------
    s1 = S0 + Fr(1, 1000)
    nII = tuple(-x for x in S.v)
    g0 = counter(nII, _S["Rstar"], S.w0); g1 = counter(nII, _S["Rstar"], S.w0, s0=s1)
    check("B3 s₀ + 1/1000: at the equality point n = −v, R*, G − n·w₀ goes from 0 to negative (exact)", g0 == 0 and g1 < 0, f"{g0} → {g1}")
    try:
        DL.do_check(Fr(1, 4), Fr(1, 8), s1)
        rej = False; msg = "it passed"
    except RuntimeError as e:
        rej = True; msg = str(e)[:80]
    check("B3 the build of the local L_P (0th-order identity) rejects s₀ + 1/1000", rej, msg)
    badII, totII, _ = patched_replay("II", {"s0": qd_t(s1)}, procs)
    log(f"    (for reference) re-checking the far (II) record with s₀ + 1/1000 gives failures {badII} / {totII} (the local lemma is responsible near the equality, so 0 is acceptable)")
    res["B3"] = dict(G0=str(g0), G1=str(g1), local_rejects=rej, local_msg=msg, far_II_replay_bad=badII, far_II_total=totII)

    # ---------- B4: drop one cone face (face 0) ----------
    kdrop = 0
    cone4 = [g for k, g in enumerate(S.G) if k != kdrop]
    cone4f = np.array([fvec(g) for g in cone4])
    use_prob("T")
    v, cid4, a4, b4, q = worst_chart([(c, a_, b_) for c in (115, 113, 119, 105) for a_, b_ in ((Fr(1), Fr(0)), (Fr(1, 3), Fr(1, 3)))],
                                     lambda c: fvec(W_TRUE[c]), cone4f, rng)
    n4 = chart_n(cid4, a4, b4); R = R_of_q(q)
    g_ok, g_bad = counter(n4, R, W_TRUE[cid4]), counter(n4, R, W_TRUE[cid4], cone=cone4)
    check("B4 drop cone face 0: at that point G − n·w ≥ 0, G′ − n·w < 0 with the face dropped (exact)", g_ok >= 0 and g_bad < 0,
          f"map {cid4} ({a4}, {b4}): {float(g_ok):.5f}, {float(g_bad):.5f}")
    patch = {"drop": kdrop}
    badT, totT, badcT = patched_replay("T", patch, procs)
    badII, totII, _ = patched_replay("II", patch, procs)
    check("B4 re-checking the record without face 0 gives failures (leaves that use that face in the basis)", badT + badII > 0,
          f"T {badT} / {totT} (maps {len(badcT)}), (II) {badII} / {totII}")
    okb, bl = builds_ok(patched_builds("T", patch, cid4, a4, b4, procs))
    check("B4 rebuilding the triangle of n containing that point without face 0 is not accepted (3 levels)", okb, bl)
    res["B4"] = dict(face=kdrop, cid=cid4, a=str(a4), b=str(b4), G_minus_nw=float(g_ok), Gdrop_minus_nw=float(g_bad),
                     q=[str(x) for x in q], replay_bad_T=badT, replay_total_T=totT, bad_charts_T=len(badcT), replay_bad_II=badII,
                     replay_total_II=totII, builds=bl,
                     note="\u5c40\u6240 L_P \u306f\u9310\u306e\u9762\u3092\u4f7f\u308f\u306a\u3044\uff08\u7b49\u53f7\u306e\u70b9\u3067 t = 2w₀ \u306f\u9310\u306e\u5185\u90e8\u3001\u5f31\u53cc\u5bfe\u306f\u9310\u306e\u9762\u3092\u843d\u3068\u3057\u3066\u3082\u4e0b\u754c\uff09\u306e\u3067\u5f71\u97ff\u306a\u3057")
    # B4b (added in the review of stage D5, 11/15): the record of (II) is only one fundamental triangle of the stabilizer of v, so "the stabilizer permutes the 5 faces,
    # so 1 face is enough" does not apply to (II) (with face 0, (II) gives 0 failures). The leaves of (II) use cone faces 2 and 3 in the basis, so drop each face and re-check.
    per = {}
    for k in range(5):
        b_, t_, _ = patched_replay("II", {"drop": k}, procs)
        per[k] = b_
    check("B4b re-checking the record of (II) without cone face k gives failures for the faces used by (II) (2 and 3) (per face)",
          per[2] > 0 and per[3] > 0, f"failures per face {per} / {t_}")
    res["B4b"] = dict(replay_bad_II_by_face={str(k): v for k, v in per.items()}, replay_total_II=t_,
                      note="(II) \u306e\u9060\u65b9\u3082\u9310\u306e\u9762\uff082\u30fb3\uff09\u3092\u57fa\u5e95\u306b\u4f7f\u3046\u3002D48 20 \u7bc0\u306e\u300c(II) \u306f\u9310\u306e\u9762\u3092\u4f7f\u308f\u306a\u3044\u300d\u306f B4 \u304c\u9762 0 \u3092\u9078\u3093\u3060\u305f\u3081\u306e\u8aa4\u308a")

    # ---------- B5: mix up the cone with that of the neighbouring vertex v′ ----------
    vp_i = S.nbr[0]; vp = S.CV[vp_i]
    nb = [i for i, x in enumerate(S.CV) if dot(vsub(vp, x), vsub(vp, x)) == 1]
    cone5 = [vsub(vp, S.CV[i]) for i in nb]
    cone5f = np.array([fvec(g) for g in cone5])
    use_prob("T")
    fc = find_charts(tuple(-x for x in vp))
    need(fc, "no map contains −v′")
    v, cid5, a5, b5, q = worst_chart([(c, a_, b_) for c, _, a_, b_ in fc], lambda c: fvec(W_TRUE[c]), cone5f, rng)
    n5 = chart_n(cid5, a5, b5); R = R_of_q(q)
    g_ok, g_bad = counter(n5, R, W_TRUE[cid5]), counter(n5, R, W_TRUE[cid5], cone=cone5)
    check("B5 mix up the cone with that of v′: in the direction n = −v′, G − n·w ≥ 0, mixed-up G′ − n·w < 0 (exact)", g_ok >= 0 and g_bad < 0,
          f"map {cid5} ({a5}, {b5}), {len(fc)} maps contain −v′: {float(g_ok):.5f}, {float(g_bad):.5f}")
    patch = {"cone": [[qd_t(x) for x in g] for g in cone5]}
    badT, totT, badcT = patched_replay("T", patch, procs)
    badII, totII, _ = patched_replay("II", patch, procs)
    check("B5 re-checking the record with the mixed-up cone gives failures", badT + badII > 0,
          f"T {badT} / {totT} (maps {len(badcT)}), (II) {badII} / {totII}")
    okb, bl = builds_ok(patched_builds("T", patch, cid5, a5, b5, procs))
    check("B5 rebuilding the triangle of n containing that point with the mixed-up cone is not accepted (3 levels)", okb, bl)
    res["B5"] = dict(vprime=vp_i, cid=cid5, a=str(a5), b=str(b5), charts_containing=len(fc), G_minus_nw=float(g_ok),
                     Gmix_minus_nw=float(g_bad), q=[str(x) for x in q], replay_bad_T=badT, replay_total_T=totT,
                     bad_charts_T=len(badcT), replay_bad_II=badII, replay_total_II=totII, builds=bl)
    res["seconds"] = round(time.time() - t0, 1)
    OUT["B"] = res


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="C,X,P,W,B")
    ap.add_argument("--procs", type=int, default=3)
    ap.add_argument("--scratch", default=os.path.join(tempfile.gettempdir(), "d87_dod_tests"))
    ap.add_argument("--no-write", action="store_true")
    a = ap.parse_args()
    only = sorted(a.only.split(","))
    t0 = time.time()
    log(f"d87_dod_tests  {time.strftime('%Y-%m-%d %H:%M:%S')}  only={only}")
    for sec, fn in (("C", test_C), ("X", test_X), ("P", test_P), ("W", lambda: test_W(a.scratch, a.procs)), ("B", lambda: test_B(a.procs))):
        if sec not in only:
            continue
        try:
            fn()
        except Exception as e:
            import traceback; traceback.print_exc()
            check(f"test {sec} stopped with an exception", False, repr(e)[:300])
    OUT.update(only=only, fail=FAIL, when=time.strftime("%Y-%m-%d %H:%M"), total_sec=round(time.time() - t0, 1),
               code_sha256={p: sha(p) for p in CODES if os.path.exists(os.path.join(HERE, p))},
               note="\u53d7\u7406\u306e\u5224\u5b9a\u306f\u6574\u6570\u30fbQ(√5) \u306e\u6709\u7406\u6570\u3060\u3051\u3002\u6d6e\u52d5\u306f\u8ca0\u306e\u70b9\u306e\u63a2\u7d22\u3068 LP \u306e\u57fa\u5e95\u306e\u5f53\u305f\u308a\u3060\u3051\u3002\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044\u3002")
    log(f"== \u8a66\u9a13 {len(OUT.get('checks', []))} \u4ef6\u3001\u4e0d\u5408\u683c {len(FAIL)}\uff1a{FAIL}\uff08{OUT['total_sec']} \u79d2\uff09")
    if a.no_write:
        pass
    elif only == ["B", "C", "P", "W", "X"]:
        json.dump(OUT, open(os.path.join(HERE, "d87_dod_tests.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    else:
        os.makedirs(a.scratch, exist_ok=True)
        p = os.path.join(a.scratch, "d87_dod_tests_partial_" + "".join(only) + ".json")
        json.dump(OUT, open(p, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        log(f"(only a part was run, so written to {p})")
    sys.exit(0 if not FAIL else 1)
