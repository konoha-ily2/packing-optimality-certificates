# -*- coding: utf-8 -*-
"""D48 section 7, stage D2 (dodinico_n13, L4''d): the far region (II). Acceptance decisions use integers and rationals only (√5 is bracketed by integers scaled by 2^60). Floating point is used only to choose candidates.
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
The structure is copied from d86_far.py (quaternion tree of R, types A, D, L, replay). d87_common, d87_dod_local, d31_common, d37_tet_n05_common and d16e_common are
only imported (not modified).

■ What is shown ((II) of D48 2.3 and 4.3): for all n ∈ −Q* (Q* = cone(g_k) is the dual cone of the cone Q) and all rotations R,
    G(n, R) := h_K(Rᵀn) + m_R(n) ≥ n·w₀,  m_R(n) := min{n·t : RK + t ⊂ s₀C, t ∈ Q}.
  (t = 0 is always feasible, so m_R is finite. The origin is a vertex of Q; the circumscribed sphere of the piece has radius 1.40 < the inscribed sphere of the container, s₀·0.756 = 3.07. Verified in check.)
■ Map of n: G and n·w₀ are both positively homogeneous of degree 1 in n, so a representative on the plane n·v = −|v|² suffices. The intersection of this plane with −Q* is
  a regular pentagon (vertices P_k = 2|v|²(v_k − v), v_k the 5 neighbours of the vertex v). The stabilizer of v (10 elements, including reflections; it preserves the container, Q and w₀)
  maps everything to the fundamental triangle T = (center −v, P_{k0}, midpoint of the edge (P_{k0} + P_{k1})/2) (check: the 10 images give 10 distinct (vertex, edge) pairs).
  Reflections σ are also allowed: σ⁻¹(RK + t) = (σ⁻¹Rτ)K + σ⁻¹t (τ is a reflection of K, σ⁻¹Rτ is a rotation), h is preserved, σ⁻¹t ∈ Q, and σ⁻¹ preserves the container.
  n = c0 + a·d1 + b·d2 ((a, b) ∈ T = {a, b ≥ 0, a + b ≤ 1}, integers in ND units). An n box is a triangle (split into 4 at the midpoints, in a fixed way).
■ Candidate (type A): for the 3 vertices n_v of an n triangle and an R box, choose a common top vertex i, for each vertex v a basis B_v (3 rows out of 25: 20 container faces, 5 cone faces) and,
  for each container face f of the basis, a vertex j_{v,f}; for each vertex put
    E_v(R) := n_v·Ru_i + Σ_{f∈B_v∩container} y_{v,f}(a_f·Ru_{j_{v,f}} − s₀) − n_v·w₀,  y_v := −A_{B_v}^{−T} n_v (≥ 0, checked exactly).
  If E_v ≥ 0 for all v (on the whole R box), then for a point n = Σλ_v n_v of the triangle (λ ≥ 0, Σλ = 1)
    G(n, R) ≥ n·Ru_i + Σλ_v m_R(n_v)   (h_K is bounded below by the single term u_i; m_R is concave in n = a min of linear functions)
           ≥ Σλ_v [n_v·Ru_i + Σ_f y_{v,f}(H_f(R) − s₀)]   (weak duality: y_v ≥ 0, A_{B_v}ᵀy_v = −n_v, the cone rows have right-hand side 0)
           ≥ Σλ_v [E_v(R) + n_v·w₀] ≥ n·w₀   (H_f ≥ a_f·Ru_j, y ≥ 0).
  |q|²·E_v is a sum of the entries of M(q) and |q|² with Q(√5) coefficients. The coefficients are split into [rational, √5] integers, and the quadratic form 2^60·(rational) + ⌊2^60√5⌋·(√5 part) is bounded
  below, plus min(0, lower bound of the √5 part) (for the fractional part δ ∈ [0, 1) of ⌊⌋), exactly from below (D31.quad_lb).
  Type D: a rotation k of the piece (60 of them, preserving the vertices of the dodecahedron) with tr(Rk) > tr(R) (R → Rk does not change RK). Type L: the 3 vertices of the triangle lie in the
  n square of the local L_P (|ξ|∞ ≤ SN), and for some k the rotation R k⁻¹ lies in the R range of L_P {R*·M(1, p)/|q|², |p|∞ ≤ SP} (at the 8 vertices of the quaternion box; a linear cone).
  The region assigned to L_P is read from the header of the record of d87_dod_local_P (stage D1).
■ --prob T (stage D3, added 11/15): for each of the 62 band representatives of the table of points d87_dod_table.json of D48 4.3, for the triangle N (the exact orientation is built in Q(√5) from
  mobius_base and subdivide(level) of d87_dod_step0 and the icosahedral symmetry Gall[g]; not normalized), both for n ∈ cone(N) and n ∈ −cone(N):
  G(n, R) ≥ n·w_N (w_N is a rational point of the table). The map is n = c0 + a·d1 + b·d2 (c0 = ±A, d1 = ±(B − A), d2 = ±(C − A), (A, B, C) the vertices of N)
  with (a, b) ∈ T. G and n·w are both positively homogeneous of degree 1 in n and a point of cone(N) is a positive multiple of a point of the triangle, so the triangle suffices.
  Types A and D are the same as in (II) (only n·w₀ in E_v is replaced by n·w_N; the concavity argument does not depend on w). The local L is not used (the window is open in the band).
  Using the same w_N for the opposite −N is the rule of D48 2.3 (the claim for n ∈ −N is the second half of (★), i.e. the side lo ≤ n·w). The image σN under the stabilizer (the point σw_N)
  reduces to the same claim, since σ preserves the container and Q and the piece is mirror-symmetric. The exact check that the 1,240 bands are exhausted by the orbits
  (stabilizer 10 × {±1}) of the 62 representatives, and that all the triangles cover the sphere, is done in D4 (here we only check that the orientation of the triangles agrees with the angles of the table in floating point).
Usage: python -X utf8 d87_dod_far.py check / run --prob II [--procs 12] [--name d87_dod_far_II] [--sample K] / replay [--name ...] [--with-local]
        run --prob T [--cids 0,1,...] [--name d87_dod_far_T] / replay --name d87_dod_far_T / check --prob T
"""
import sys, os, json, gzip, time, math, argparse, itertools, hashlib
from fractions import Fraction as Fr
import numpy as np
import flint

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from d87_common import QD, S0, PHI, Setup, need, dot, mvec, det3, inv3, transpose, vsub, vadd, vscale, fvec
from d16e_common import sym_group_exact, mmul, is_orth
import d31_common as D31                       # only imported: RBox, quad_lb, vcomb
from d31_common import DEN
import d37_tet_n05_common as D37C              # only imported: qmul

ND = 2 ** 30
SQ_K = 60
_r5 = int(flint.fmpz(5 * 4 ** SQ_K).isqrt())
need(_r5 * _r5 <= 5 * 4 ** SQ_K < (_r5 + 1) ** 2, "bracketing of √5")
P2K = 1 << SQ_K
LOCAL_NAME = "d87_dod_local_P"

G_ = {}                                         # preparation shared by a job (built in init)
BREAK = {}                                      # for tests: noL (do not use L), shift (subtract δ·|q|²·(n·(direction of −v̂)) from E_v)


# ---------------- field numbers as integer pairs ----------------
def qd_parts(x):
    x = QD.c(x)
    return x.v[0], x.v[1]


def int_coefs(cs):
    """Sequence of Q(√5) coefficients -> (rational integer, √5 integer) (common denominator cleared, a positive multiple)."""
    den = 1
    for c in cs:
        for p in qd_parts(c):
            den = den * p.denominator // math.gcd(den, p.denominator)
    return [(int(qd_parts(c)[0] * den), int(qd_parts(c)[1] * den)) for c in cs]


def lb_forms(icoefs, forms):
    """Lower bound × 2^60 of Σ (A + √5 B)·form (an integer, a positive multiple). forms are quadratic forms of length 10 of D31."""
    va = D31.vcomb([(P2K * a + _r5 * b, f) for (a, b), f in zip(icoefs, forms)])
    vb = D31.vcomb([(b, f) for (a, b), f in zip(icoefs, forms)])
    return D31.quad_lb(va) + min(0, D31.quad_lb(vb))


def rb_forms(rb):
    return [rb.M[l][m] for l in range(3) for m in range(3)] + [rb.Q]


# ---------------- preparation ----------------
def mat_to_q_qd(M):
    tr = M[0][0] + M[1][1] + M[2][2]
    cands = [(1 + tr, M[2][1] - M[1][2], M[0][2] - M[2][0], M[1][0] - M[0][1]),
             (M[2][1] - M[1][2], 1 + M[0][0] - M[1][1] - M[2][2], M[0][1] + M[1][0], M[0][2] + M[2][0]),
             (M[0][2] - M[2][0], M[0][1] + M[1][0], 1 - M[0][0] + M[1][1] - M[2][2], M[1][2] + M[2][1]),
             (M[1][0] - M[0][1], M[0][2] + M[2][0], M[1][2] + M[2][1], 1 - M[0][0] - M[1][1] + M[2][2])]
    q = max(cands, key=lambda c: max(abs(float(x)) for x in c))
    q = tuple(QD.c(x) for x in q)
    w, x, y, z = q
    n2 = w * w + x * x + y * y + z * z
    Mq = [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
          [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
          [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
    need(all(Mq[i][j] == M[i][j] * n2 for i in range(3) for j in range(3)), "quaternion of the rotation (exact)")
    return q


def qconj(q):
    return (q[0], -q[1], -q[2], -q[3])


def qmat_left_right(a, b):
    """The 4×4 matrix of q ↦ a ⊗ q ⊗ b (exact)."""
    cols = []
    for e in range(4):
        u = [QD(0)] * 4; u[e] = QD(1)
        cols.append(D37C.qmul(D37C.qmul(a, tuple(u)), b))
    return [[cols[c][r] for c in range(4)] for r in range(4)]


TABLE_NAME = "d87_dod_table.json"


def table_charts(S):
    """Triangles of the representatives of the table (exact) and the points -> map cid = 2·rep + (0: +N, 1: −N)."""
    import d87_dod_step0 as ST                  # only imported: mobius_base, subdivide
    with open(os.path.join(HERE, TABLE_NAME), encoding="utf-8") as f:
        tb = json.load(f)
    need(tb["base"] == "mobius_base(Setup())", "how the triangles of the table are built")
    Gall, _ = S.stabilizer()
    sub = ST.subdivide(ST.mobius_base(S), tb["level"])
    vf = np.array(fvec(S.v)); vf /= np.linalg.norm(vf)
    charts = {}
    for r in tb["reps"]:
        M = Gall[r["g"]]
        A, B, C = [mvec(M, x) for x in sub[r["sub"]]]
        # angles_from_v_deg of the table is acos(x·v̂) for the vertex x not normalized by d87_dod_step0 (not a true angle; used only as a marker for matching)
        ang = [math.degrees(math.acos(max(-1.0, min(1.0, float(np.dot(vf, np.array(fvec(x)))))))) for x in (A, B, C)]
        need(max(abs(a - b) for a, b in zip(ang, r["angles_from_v_deg"])) < 0.006, f"orientation of the triangle of representative {r['rep']} of the table")
        w = tuple(QD(Fr(x)) for x in r["w"])
        for sg in (1, -1):
            c0 = vscale(sg, A); d1 = vscale(sg, vsub(B, A)); d2 = vscale(sg, vsub(C, A))
            charts[2 * r["rep"] + (0 if sg == 1 else 1)] = dict(c0=c0, d1=d1, d2=d2, w=w, L=False, rep=r["rep"], sg=sg)
    return charts


def init(local=LOCAL_NAME, prob="II"):
    if G_:
        need(G_["prob"] == prob, "prob of the job differs")
        return G_
    import d87_dod_local as DL
    S = Setup()
    pt = DL.setup_point()
    Rs = pt["R"]
    v = S.v
    v2 = dot(v, v)
    # rotation group of the piece (rotations preserving the canonical vertices of the dodecahedron, 60 of them)
    KG = [M for M in sym_group_exact(S.KV) if det3(M) == 1]
    need(len(KG) == 60, f"the rotation group of the piece has {len(KG)} elements")
    I3 = [[QD(1) if i == j else QD(0) for j in range(3)] for i in range(3)]
    KG_NONID = [k for k in KG if k != I3]
    # 25 rows: container 20 (a_f·t ≤ s₀ − H_f), cone 5 (−g·t ≤ 0)
    rows = [tuple(f[0]) for f in S.CF] + [tuple(-x for x in g) for g in S.G]
    rowsf = np.array([fvec(r) for r in rows])
    trip, Tf = [], []
    for B in itertools.combinations(range(25), 3):
        Mf = rowsf[list(B)]
        if abs(np.linalg.det(Mf)) < 1e-9:
            continue
        trip.append(B); Tf.append(np.linalg.inv(Mf.T))
    # map of n
    nbr = S.nbr
    Pk = {k: vscale(2 * v2, vsub(S.CV[k], v)) for k in nbr}
    k0 = nbr[0]
    k1 = [k for k in nbr if k != k0 and dot(vsub(S.CV[k], S.CV[k0]), vsub(S.CV[k], S.CV[k0])) == 1][0]
    c0 = tuple(-x for x in v)
    V = Pk[k0]
    Mid = vscale(Fr(1, 2), vadd(Pk[k0], Pk[k1]))
    d1, d2 = vsub(V, c0), vsub(Mid, c0)
    # local L_P
    with gzip.open(os.path.join(HERE, f"{local}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        hd = json.loads(f.readline())
    need(hd["kind"] == "P" and hd["lam"] == "0" and hd["s0"] == str(S0), "the local record is a test copy")
    qs = mat_to_q_qd(Rs)
    KQ = [mat_to_q_qd(k) for k in KG]
    WL = [qmat_left_right(qconj(qs), qconj(kq)) for kq in KQ]            # q ↦ q̄*⊗q⊗k̄ (R k⁻¹ = R*·M(w))
    G_.update(S=S, pt=pt, Rs=Rs, v=v, v2=v2, KG=KG, KG_NONID=KG_NONID, rows=rows, rowsf=rowsf,
              trip=trip, Tf=np.array(Tf), Tex={}, c0=c0, d1=d1, d2=d2, Pk=Pk, k0=k0, k1=k1,
              SN=Fr(hd["SN"]), SP=Fr(hd["SP"]), local=local, local_hd=hd, qs=qs, KQ=KQ, WL=WL,
              WLf=[np.array([[float(x) for x in r] for r in W]) for W in WL],
              KGf=np.array([[[float(x) for x in r] for r in k] for k in KG_NONID]),
              KVf=S.KVf, Af=S.Af, w0=S.w0, w0f=S.w0f, s0f=float(S0),
              DISC=[int_coefs([k[j][i] - (1 if i == j else 0) for i in range(3) for j in range(3)] + [QD(0)]) for k in KG_NONID],
              VC={}, EC={}, prob=prob)
    if prob == "II":
        G_["charts"] = {0: dict(c0=c0, d1=d1, d2=d2, w=S.w0, L=True)}
    else:
        G_["charts"] = table_charts(S)
    return G_


# ---------------- vertices of n ----------------
def vdata(a, b, cid=0):
    """Exact and floating-point data of the vertices of n (map cid, integers (a, b) in ND units) (cached within a job). w is the point of the map (w₀ for (II))."""
    key = (cid, a, b)
    r = G_["VC"].get(key)
    if r is None:
        if len(G_["VC"]) > 20000:
            G_["VC"].clear(); G_["EC"].clear()
        ch = G_["charts"][cid]
        A, Bq = Fr(a, ND), Fr(b, ND)
        n = tuple(ch["c0"][i] + ch["d1"][i] * A + ch["d2"][i] * Bq for i in range(3))
        nf = fvec(n)
        Y = -np.einsum('kij,j->ki', G_["Tf"], nf)                     # y_B = −(A_Bᵀ)^{-1} n (Tf = inv(A_Bᵀ))
        ok = np.where((Y >= -1e-12).all(axis=1))[0]
        r = dict(n=n, nf=nf, fb=ok, fy=Y[ok], ex={}, w=ch["w"], nw0=float(dot(n, ch["w"])))
        G_["VC"][key] = r
    return r


def y_exact(vd, bi):
    """y (exact) for the basis bi (an index of G_['trip']). None unless ≥ 0."""
    r = vd["ex"].get(bi)
    if r is None:
        B = G_["trip"][bi]
        T = G_["Tex"].get(bi)
        if T is None:
            T = G_["Tex"][bi] = inv3(transpose([list(G_["rows"][k]) for k in B]))
        y = tuple(-x for x in mvec(T, vd["n"]))
        r = vd["ex"][bi] = (y if all(c >= 0 for c in y) else None)
    return r


def e_coefs(vd, key, bi, i, js):
    """Integer tuple of the coefficients of |q|²·E_v (the 9 entries of M and |q|²)."""
    ck = (key, bi, i, js)
    r = G_["EC"].get(ck)
    if r is None:
        S = G_["S"]; n = vd["n"]; y = y_exact(vd, bi)
        need(y is not None, "y is negative")
        B = G_["trip"][bi]
        u = S.KV[i]
        c = [[n[l] * u[m] for m in range(3)] for l in range(3)]
        cq = -dot(n, vd["w"])
        jj = 0
        for k, rw in enumerate(B):
            if rw >= 20:
                continue
            a = S.CF[rw][0]; uj = S.KV[js[jj]]; jj += 1
            for l in range(3):
                for m in range(3):
                    c[l][m] = c[l][m] + y[k] * a[l] * uj[m]
            cq = cq - y[k] * S0
        if "shift" in BREAK:
            cq = cq - BREAK["shift"]
        r = G_["EC"][ck] = int_coefs([c[l][m] for l in range(3) for m in range(3)] + [cq])
    return r


def n_cont(B):
    return sum(1 for rw in G_["trip"][B] if rw < 20)


# ---------------- floating point (candidate selection only) ----------------
def rot_f(q):
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    return np.array([[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
                     [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
                     [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]) / n


def choose(vds, Rf):
    """In floating point: candidates of the common i, and for each vertex the list of bases (in decreasing order of value) and j."""
    P = G_["KVf"] @ Rf.T                                   # 20×3 (images of the vertices of the piece)
    AP = G_["Af"] @ P.T                                    # 20 faces × 20 vertices
    H = AP.max(axis=1); J = AP.argmax(axis=1)
    b = np.concatenate([G_["s0f"] - H, np.zeros(5)])
    per = []
    tops = []
    for vd in vds:
        tri = np.array(G_["trip"])[vd["fb"]]
        val = -(vd["fy"] * b[tri]).sum(axis=1)             # = Σ y_f (H_f − s₀)
        order = np.argsort(-val)
        per.append((vd, order, val, tri))
        tops.append(P @ vd["nf"])
    ssum = sum(tops)
    icands = []
    for t in [ssum] + tops:
        i = int(np.argmax(t))
        if i not in icands:
            icands.append(i)
    return icands, per, J


def try_accept(vkeys, vds, rb, Rf):
    icands, per, J = choose(vds, Rf)
    forms = rb_forms(rb)
    out_i = None
    for i in icands[:3]:
        cert = []
        for (vd, order, val, tri), key in zip(per, vkeys):
            ok = None
            for o in order[:4]:
                bi = int(vd["fb"][o])
                if y_exact(vd, bi) is None:
                    continue
                js = tuple(int(J[rw]) for rw in G_["trip"][bi] if rw < 20)
                if lb_forms(e_coefs(vd, key, bi, i, js), forms) >= 0:
                    ok = [bi, list(js)]; break
            if ok is None:
                break
            cert.append(ok)
        if len(cert) == 3:
            return [i, cert]
    return None


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", G_["KGf"], Rf) - np.trace(Rf)
    forms = rb_forms(rb)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if lb_forms(G_["DISC"][o], forms) > 0:
            return int(o)
    return None


# ---------------- local L_P ----------------
def xi_of(n):
    E1 = (QD(1), QD(0), QD(0)); E2 = (QD(0), PHI * Fr(1, 2), QD(Fr(-1, 2)))
    m = vadd(n, G_["v"])
    need(dot(m, G_["v"]) == 0, "n is not on the plane n·v = −|v|²")
    return dot(m, E1) / dot(E1, E1), dot(m, E2) / dot(E2, E2)


def n_in_L(vds):
    SN = G_["SN"]
    for vd in vds:
        if "xi" not in vd:
            vd["xi"] = xi_of(vd["n"])
        if not all(abs(float(x)) <= float(SN) + 1e-12 for x in vd["xi"]):
            return False
    return all(-SN <= x <= SN for vd in vds for x in vd["xi"])


def _verts(ch, lo, hi):
    out = []
    for a in (lo[0], hi[0]):
        for b in (lo[1], hi[1]):
            for c in (lo[2], hi[2]):
                q = [a, b, c]; q.insert(ch, DEN)
                out.append(q)
    return out


def r_in_L_k(ch, lo, hi, ik):
    SP = G_["SP"]; W = G_["WL"][ik]
    vs = _verts(ch, lo, hi)
    ws = [[sum((W[r][c] * x for c, x in enumerate(q) if x), QD(0)) for r in range(4)] for q in vs]
    for sg in (1, -1):
        if all(sg * w[0] > 0 and all(abs(float(w[m])) <= float(SP) * sg * float(w[0]) * (1 + 1e-12) + 1e-300 for m in (1, 2, 3)) for w in ws):
            if all(sg * w[0] > 0 and all(-SP * sg * w[0] <= w[m] <= SP * sg * w[0] for m in (1, 2, 3)) for w in ws):
                return True
    return False


def r_in_L(ch, lo, hi):
    """Only the k that enter at all 8 vertices in floating point are checked exactly."""
    SP = float(G_["SP"])
    V = np.array(_verts(ch, lo, hi), float)
    for ik, Wf in enumerate(G_["WLf"]):
        w = V @ Wf.T
        for sg in (1, -1):
            w0 = sg * w[:, 0]
            if (w0 > 0).all() and (np.abs(w[:, 1:]) <= SP * w0[:, None] * (1 - 1e-9)).all():
                if r_in_L_k(ch, lo, hi, ik):
                    return ik
    return None


# ---------------- tree of R ----------------
def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda a: (w[a], -a)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def rtree(tri, budget, wmin_exp, allowL, cid=0):
    vds = [vdata(*p, cid) for p in tri]
    vkeys = [(cid,) + tuple(p) for p in tri]
    leaves = []; ev = 0
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                ik = r_in_L(ch, lo, hi)
                if ik is not None:
                    leaves.append([ch, lo, hi, "L", ik]); continue
            ev += 1
            if ev > budget:
                return None, ev
            q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
            Rf = rot_f(q)
            rb = D31.RBox(ch, lo, hi)
            m = discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            c = try_accept(vkeys, vds, rb, Rf)
            if c is not None:
                leaves.append([ch, lo, hi, "A", c]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a_, b_ in split3(lo, hi):
                nxt.append((ch, a_, b_))
        cur = nxt
    return leaves, ev


# ---------------- tree of n (triangles, split at the midpoints into 4) ----------------
ROOT_T = ((0, 0), (ND, 0), (0, ND))


def split4(t):
    a, b, c = t
    ab = ((a[0] + b[0]) // 2, (a[1] + b[1]) // 2)
    bc = ((b[0] + c[0]) // 2, (b[1] + c[1]) // 2)
    ca = ((c[0] + a[0]) // 2, (c[1] + a[1]) // 2)
    return [(a, ab, ca), (ab, b, bc), (ca, bc, c), (ab, bc, ca)]


def tri_w(t):
    return max(abs(t[i][k] - t[j][k]) for i in range(3) for j in range(3) for k in range(2))


def task(args):
    cid, tri, budget, wmin_exp, local, brk, prob = args
    init(local, prob)
    BREAK.clear(); BREAK.update(brk)
    t0 = time.time()
    tri = tuple(tuple(p) for p in tri)
    allowL = (not BREAK.get("noL")) and G_["charts"][cid]["L"] and n_in_L([vdata(*p, cid) for p in tri])
    leaves, ev = rtree(tri, budget, wmin_exp, allowL, cid)
    if leaves is None:
        return dict(kind="fail", cid=cid, tri=tri, ev=ev, sec=time.time() - t0)
    return dict(kind="ok", cid=cid, tri=tri, leaves=leaves, ev=ev, sec=time.time() - t0, allowL=allowL)


def sha_sources():
    out = {}
    for fn in ("d87_dod_far.py", "d87_dod_local.py", "d87_common.py", "d87_dod_step0.py", "d16e_common.py", "d31_common.py"):
        with open(os.path.join(HERE, fn), "rb") as f:
            out[fn] = hashlib.sha256(f.read()).hexdigest()[:16]
    return out


def header():
    hd = dict(kind="root", prob=G_["prob"], ND=ND, DEN=DEN, SQ_K=SQ_K, local=G_["local"], SN=str(G_["SN"]), SP=str(G_["SP"]),
              chart="n = c0 + a·d1 + b·d2\uff08c0 = −v\u3001d1 = P_k0 − c0\u3001d2 = (P_k0 + P_k1)/2 − c0\u3001P_k = 2|v|²(v_k − v)\uff09",
              k0=G_["k0"], k1=G_["k1"], sources=sha_sources())
    if G_["prob"] == "T":
        with open(os.path.join(HERE, TABLE_NAME), "rb") as f:
            hd["table_sha256"] = hashlib.sha256(f.read()).hexdigest()
        hd["chart"] = ("cid = 2·rep + (0: +N, 1: −N)\u3001n = c0 + a·d1 + b·d2\uff08c0 = ±A\u3001d1 = ±(B − A)\u3001d2 = ±(C − A)\u3001"
                       "(A, B, C) = Gall[g]·subdivide(mobius_base, level)[sub]\uff09\u3001\u4e3b\u5f35 G(n, R) ≥ n·w_rep")
        hd["charts"] = {str(c): dict(rep=ch["rep"], sg=ch["sg"], w=[str(x) for x in ch["w"]],
                                     c0=[str(x) for x in ch["c0"]], d1=[str(x) for x in ch["d1"]], d2=[str(x) for x in ch["d2"]])
                        for c, ch in sorted(G_["charts"].items())}
    if BREAK:
        hd["brk"] = {k: str(v) for k, v in BREAK.items()}
    return hd


def run(name, local, procs, nmin, budget, wmin_exp, sample=None, time_limit=4 * 3600, forced_exp=3, prob="II", cids=None):
    from multiprocessing import Pool
    init(local, prob)
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_split=0, n_X=0, levels=[], X_tris=[], leaves=dict(A=0, D=0, L=0), per_cid={})
    if cids is None:
        cids = sorted(G_["charts"])
    need(all(c in G_["charts"] for c in cids), "map numbers")
    stats["cids"] = list(cids)
    cur = [(c, ROOT_T) for c in cids]
    forced = ND >> forced_exp
    path = os.path.join(HERE, f"{name}.boxes.jsonl.gz")
    out = None if sample else gzip.open(path, "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header(), ensure_ascii=False) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    rng = np.random.default_rng(0)
    while cur:
        todo = []; nxt = []
        for c, t in cur:
            if tri_w(t) > forced:
                nxt.extend((c, s) for s in split4(t)); stats["n_split"] += 1; continue
            todo.append((c, t, budget, wmin_exp, local, dict(BREAK), prob))
        if not todo:
            cur = nxt; level += 1; continue
        if sample:
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.imap_unordered(task, todo, chunksize=1) if pool else map(task, todo)
        res = list(res)
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            pc = stats["per_cid"].setdefault(str(r["cid"]), dict(ev=0, ok=0, split=0, sec=0.0))
            pc["ev"] += r.get("ev", 0); pc["sec"] = round(pc["sec"] + r.get("sec", 0), 1)
            if r["kind"] == "ok":
                stats["n_ok"] += 1; pc["ok"] += 1
                for lf in r["leaves"]:
                    stats["leaves"][lf[3]] += 1
                if out:
                    out.write(json.dumps(dict(kind="ok", cid=r["cid"], tri=r["tri"], leaves=r["leaves"])) + "\n")
            else:
                if tri_w(r["tri"]) <= (ND >> nmin) or sample:
                    stats["n_X"] += 1
                    stats["X_tris"].append([r["cid"], [[c / ND for c in p] for p in r["tri"]], r["ev"]])
                    if out:
                        out.write(json.dumps(dict(kind="X", cid=r["cid"], tri=r["tri"])) + "\n")
                else:
                    nxt.extend((r["cid"], s) for s in split4(r["tri"])); stats["n_split"] += 1; pc["split"] += 1
        secs = [r.get("sec", 0) for r in res]
        nok = sum(1 for r in res if r["kind"] == "ok")
        stats["levels"].append([level, len(cur), len(todo), nok])
        print(f"n level {level}: triangles {len(cur)}, tried {len(todo)}, passed {nok}, at limit {stats['n_X']}, "
              f"evaluations so far {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(cid=r["cid"], tri=[[c / ND for c in p] for p in r["tri"]], kind=r["kind"], ev=r.get("ev"),
                                            sec=round(r.get("sec", 0), 2)) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            stats["open_tris"] = [[c, [[x / ND for x in p] for p in t]] for c, t in cur[:400]]
            break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    stats["passed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(prob=prob, ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp, local=local,
                           procs=procs, brk={k: str(v) for k, v in BREAK.items()})
    if not sample:
        json.dump(stats, open(os.path.join(HERE, f"{name}.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: passed {stats['passed']}, n triangles ok {stats['n_ok']}, at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, evaluations {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


# ---------------- re-check (no floating point) ----------------
def _replay_one(args):
    cid, tri, leaves, local, prob = args
    init(local, prob)
    tri = tuple(tuple(p) for p in tri)
    vds = [vdata(*p, cid) for p in tri]
    vkeys = [(cid,) + tuple(p) for p in tri]
    allowL = G_["charts"][cid]["L"] and n_in_L(vds)
    rl = set(); bad = 0; cnt = dict(A=0, D=0, L=0)
    for lf in leaves:
        ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
        kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box appears twice"); rl.add(kk)
        rb = D31.RBox(ch, rlo, rhi)
        ok = False
        if kind == "A":
            i, cert = lf[4]
            ok = 0 <= i < 20 and len(cert) == 3
            if ok:
                forms = rb_forms(rb)
                for (bi, js), vd, key in zip(cert, vds, vkeys):
                    js = tuple(js)
                    if not (0 <= bi < len(G_["trip"]) and y_exact(vd, bi) is not None and len(js) == n_cont(bi)
                            and all(0 <= j < 20 for j in js) and lb_forms(e_coefs(vd, key, bi, i, js), forms) >= 0):
                        ok = False; break
        elif kind == "D":
            ok = 0 <= lf[4] < len(G_["KG_NONID"]) and lb_forms(G_["DISC"][lf[4]], rb_forms(rb)) > 0
        elif kind == "L":
            ok = allowL and 0 <= lf[4] < len(G_["WL"]) and r_in_L_k(ch, rlo, rhi, lf[4])
        cnt[kind] = cnt.get(kind, 0) + 1
        bad += (not ok)
    dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(rl) - seen, "hole in the cover (a box without a leaf)")
        need(depth <= dmax, "a branch that does not reach an R leaf"); depth += 1
        nxt = []
        for ch, a, b in cur:
            if (ch, tuple(a), tuple(b)) in rl:
                seen += 1; continue
            nxt.extend((ch, p, q) for p, q in split3(a, b))
        cur = nxt
    need(seen == len(rl), "cover by the R tree")
    return cnt, bad


def replay(name, procs=1, with_local=False):
    t0 = time.time()
    with gzip.open(os.path.join(HERE, f"{name}.boxes.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need("brk" not in hd and not BREAK, "the record contains no test-only breakage")
    prob = hd["prob"]
    init(hd["local"], prob)
    now = header()
    keys = ["prob", "ND", "DEN", "SQ_K", "local", "SN", "SP", "chart", "k0", "k1"]
    if prob == "T":
        keys += ["table_sha256", "charts"]
    for k in keys:
        need(hd[k] == now[k], f"premise {k} of the record differs from the current one")
    if hd["sources"] != now["sources"]:
        print(f"note: the SHA-256 (first 16 digits) of the files at the time of creation differs from the current one: {hd['sources']} -> {now['sources']}", flush=True)
    check_map(quiet=True)
    tris = {}
    for r in lines[1:]:
        key = (r.get("cid", 0), tuple(tuple(p) for p in r["tri"]))
        need(key not in tris, "the same triangle appears twice"); tris[key] = r
        need(tri_w(key[1]) >= 2, "width of the n triangle is less than 2 (truncation at the midpoints)")
        need(r["kind"] == "ok", "a split limit remains")
    jobs = [(c, r["tri"], r["leaves"], hd["local"], prob) for (c, _), r in tris.items()]
    if procs > 1:
        from multiprocessing import Pool
        with Pool(procs) as pool:
            res = list(pool.imap_unordered(_replay_one, jobs, chunksize=1))
    else:
        res = [_replay_one(j) for j in jobs]
    tot = dict(A=0, D=0, L=0); bad = 0
    for c, b in res:
        for k in tot:
            tot[k] += c.get(k, 0)
        bad += b
    # cover by the n tree (per map; for T, all the maps 2 × 62 of the representatives of the table must be present)
    mine = set(tris)
    cids_rec = sorted(set(c for c, _ in mine))
    if prob == "T":
        need(cids_rec == sorted(G_["charts"]), f"maps are missing ({len(cids_rec)} / {len(G_['charts'])})")
    else:
        need(cids_rec == [0], "map of (II)")
    dmax = max(round(math.log2(ND / tri_w(t))) for _, t in mine)
    cur = [(c, ROOT_T) for c in cids_rec]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(mine) - seen, "hole in the cover of n")
        need(depth <= dmax, "a branch that does not reach an n leaf"); depth += 1
        nxt = []
        for c, t in cur:
            if (c, t) in mine:
                seen += 1; continue
            nxt.extend((c, s) for s in split4(t))
        cur = nxt
    need(seen == len(mine), "cover by the n tree")
    print(f"re-check {name}: maps {len(cids_rec)}, n triangles {len(mine)}, R leaves accepted {tot['A']}, discarded {tot['D']}, L {tot['L']}, "
          f"failed {bad}, cover trees OK, {time.time()-t0:.0f} s", flush=True)
    need(bad == 0, f"failed {bad}")
    out = dict(prob=prob, n_charts=len(cids_rec), n_tris=len(mine), leaves=tot, bad=bad, seconds=round(time.time() - t0, 1))
    if with_local:
        import subprocess
        rr = subprocess.run([sys.executable, "-X", "utf8", os.path.join(HERE, "d87_dod_local.py"), "replay", "--name", hd["local"]],
                            cwd=HERE, capture_output=True, text=True, encoding="utf-8")
        need(rr.returncode == 0, "re-check of the local record failed: " + rr.stdout[-400:] + rr.stderr[-400:])
        line = rr.stdout.strip().splitlines()[-1]
        print("local: " + line, flush=True)
        out["local_replay"] = line
    json.dump(out, open(os.path.join(HERE, f"{name}.replay.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    return out


# ---------------- check of the premises ----------------
def check_map(quiet=False):
    S = G_["S"]; v = G_["v"]; v2 = G_["v2"]
    info = {}
    # (1) pentagon: P_k is on the plane n·v = −|v|² and is a positive multiple of −g_k
    for k, P in G_["Pk"].items():
        need(dot(P, v) == -v2, "P_k is not on the plane")
        g = vsub(v, S.CV[k])
        c = dot(P, P) / dot(g, g)
        need(all(P[i] * P[i] == c * g[i] * g[i] for i in range(3)) and dot(P, g) < 0, "P_k is not in the direction of −g_k")
    # Q* = cone(g_k): the section of −Q* by the plane = the pentagon conv(P_k) (vertices of the convex hull). T is its fundamental triangle.
    # (2) the 10 elements of the stabilizer map the (vertex, edge midpoint) of T onto all 10 possibilities
    _, St = S.stabilizer()
    V = G_["Pk"][G_["k0"]]; Mid = vscale(Fr(1, 2), vadd(G_["Pk"][G_["k0"]], G_["Pk"][G_["k1"]]))
    flags = set()
    for M in St:
        need(mvec(M, v) == v and mvec(M, G_["w0"]) == G_["w0"], "the stabilizer does not preserve v, w₀")
        MV = mvec(M, V); MM = mvec(M, Mid)
        kv = [k for k, P in G_["Pk"].items() if P == MV]
        need(len(kv) == 1, "the image of the vertex is not a vertex of the pentagon")
        em = [(a, b) for a in G_["Pk"] for b in G_["Pk"] if a < b and vscale(Fr(1, 2), vadd(G_["Pk"][a], G_["Pk"][b])) == MM]
        need(len(em) == 1 and kv[0] in em[0], "image of the edge midpoint")
        d_ab = vsub(S.CV[em[0][0]], S.CV[em[0][1]])
        need(dot(d_ab, d_ab) == 1, "the edge midpoint is not that of an edge of the pentagon")
        flags.add((kv[0], em[0]))
        # preserves the cone Q (preserves the set of g)
        need(sorted(map(str, [mvec(M, g) for g in S.G])) == sorted(map(str, S.G)), "the stabilizer does not preserve the cone")
    need(len(flags) == 10, f"the images of the fundamental triangle number {len(flags)}")
    info["flags"] = 10
    # (3) the rotation group of the piece preserves the vertices of the piece (exact by sym_group_exact). t = 0 is always feasible: (circumscribed sphere of the piece)² < (s₀·inscribed sphere of the container)²
    R2 = max(dot(u, u) for u in S.KV)
    need(R2 < S0 * S0 * S.rC2, "the piece at the origin may not fit in the container")
    # the inscribed sphere² of a container face a_f·x ≤ 1 is 1/|a_f|² (a_f divided by b_f = 1): s₀²/|a|² > R²
    need(all(S0 * S0 > R2 * dot(f[0], f[0]) for f in S.CF), "possibility of t = 0")
    # (4) R* of the local: the rotation built from q* is R*, the point n of the map is on the plane, the local maps e₁, e₂ ⊥ v
    need(len(G_["KQ"]) == 60, "quaternions of the rotations of the piece")
    # (4') K = −K (stage D7, Fable's remark 4): when mapping by a reflection of the stabilizer, −1 times is used to turn a flipped rotation back into a rotation
    KVs = set(S.KV)
    need(all(tuple(-x for x in u) in KVs for u in S.KV), "the piece is not symmetric about the origin (K = −K)")
    # (4'') check of type L (stage D7, Fable's remark 2): for each k, with w = WL[k]·q (= q̄*⊗q⊗k̄), R(q)·k⁻¹ = R*·M(w)/|w|².
    #   The normalization-free form |q*|⁴·|k_q|²·M(q)·kᵀ = M(q*)·M(w) is an equality of quadratic forms in q, so if both sides agree at the 10 points q = e_a (4 points) and
    #   e_a + e_b (6 points), it is an identity (a quadratic form is determined by its 10 symmetric coefficients). Exact in Q(√5).
    if G_["prob"] == "II":
        def Mq_(q):
            w, x, y, z = q
            return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
                    [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
                    [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]
        def mm(A, B):
            return [[sum((A[i][l] * B[l][j] for l in range(3)), QD(0)) for j in range(3)] for i in range(3)]
        qs_ = G_["qs"]; ns2 = sum((x * x for x in qs_), QD(0)); Ms = Mq_(qs_)
        need(all(Ms[i][j] == G_["Rs"][i][j] * ns2 for i in range(3) for j in range(3)), "R* = M(q*)/|q*|²")
        pts = [tuple(QD(1) if c == a else QD(0) for c in range(4)) for a in range(4)]
        pts += [tuple(QD(1) if c in (a, b) else QD(0) for c in range(4)) for a in range(4) for b in range(a + 1, 4)]
        for ik, (k, kq) in enumerate(zip(G_["KG"], G_["KQ"])):
            nk2 = sum((x * x for x in kq), QD(0))
            kT = [[k[j][i] for j in range(3)] for i in range(3)]
            W = G_["WL"][ik]
            for q in pts:
                w = tuple(sum((W[r][c] * q[c] for c in range(4)), QD(0)) for r in range(4))
                L_ = mm(Mq_(q), kT); Rr = mm(Ms, Mq_(w))
                c_ = ns2 * ns2 * nk2
                need(all(L_[i][j] * c_ == Rr[i][j] for i in range(3) for j in range(3)), f"check of type L (k = {ik})")
        info["L_identity"] = "60 k × 10 points"
    # (5) equality point: n = −v (vertex (0, 0) of the triangle), R = R*: value of the best candidate = 0 (only for the map of (II))
    if G_["prob"] == "II":
        vd = vdata(0, 0)
        need(vd["n"] == tuple(-x for x in v), "the origin of the map is not −v")
    if not quiet:
        print("premises of the map OK", info, flush=True)
    return info


def check(prob="II"):
    init(LOCAL_NAME, prob)
    check_map()
    S = G_["S"]
    rng = np.random.default_rng(1)
    worst_le = -1e9; worst_eq = 0.0; nt = 0; gmin = 1e9
    cids = sorted(G_["charts"])
    if prob == "T":
        print(f"maps of the table: {len(cids)} (representatives {len(cids) // 2} × ±), the orientation of the triangles agrees with the angles of the table within 0.006°", flush=True)
    for _ in range(300):
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        ai, bi_ = int(a * ND), int(b * ND)
        cid = int(rng.choice(cids))
        vd = vdata(ai, bi_, cid)
        q = rng.normal(size=4); q /= np.linalg.norm(q); Rf = rot_f(q)
        Gt = S.lp_min_t(vd["nf"], Rf) - vd["nw0"]                       # the true G − n·w (scipy LP)
        gmin = min(gmin, Gt / np.linalg.norm(vd["nf"]))
        icands, per, J = choose([vd], Rf)
        vd_, order, val, tri = per[0]
        i = int(np.argmax((S.KVf @ Rf.T) @ vd["nf"]))
        bi = int(vd["fb"][order[0]])
        js = tuple(int(J[rw]) for rw in G_["trip"][bi] if rw < 20)
        y = vd["fy"][order[0]]
        P = S.KVf @ Rf.T
        E = vd["nf"] @ P[i] + sum(y[k] * (S.Af[rw] @ P[js[sum(1 for x in G_['trip'][bi][:k] if x < 20)]] - G_["s0f"])
                                  for k, rw in enumerate(G_["trip"][bi]) if rw < 20) - vd["nw0"]
        worst_eq = max(worst_eq, abs(E - Gt))
        # another basis or another i gives a lower bound
        for o in order[1:4]:
            bj = int(vd["fb"][o]); yj = vd["fy"][o]
            jj = tuple(int(J[rw]) for rw in G_["trip"][bj] if rw < 20)
            for i2 in range(0, 20, 7):
                E2 = vd["nf"] @ P[i2] + sum(yj[k] * (S.Af[rw] @ P[jj[sum(1 for x in G_['trip'][bj][:k] if x < 20)]] - G_["s0f"])
                                            for k, rw in enumerate(G_["trip"][bj]) if rw < 20) - vd["nw0"]
                worst_le = max(worst_le, E2 - Gt)
        nt += 1
    print(f"comparison of the candidate formula with the LP ({nt} points): max |E − (G − n·w)| for the best choice {worst_eq:.2e}, max of E − true value for other choices {worst_le:.2e} (a lower bound if ≤ 1e−9), "
          f"minimum of (G − n·w)/|n| at random R {gmin:.4f}")
    # comparison of the exact coefficients: the value built from e_coefs at 1 point against the floating-point value
    vd = vdata(ND // 5, ND // 7, cids[0])
    q = np.array([0.9, 0.2, -0.3, 0.1]); Rf = rot_f(q)
    icands, per, J = choose([vd], Rf)
    bi = int(vd["fb"][per[0][1][0]]); js = tuple(int(J[rw]) for rw in G_["trip"][bi] if rw < 20); i = icands[0]
    ic = e_coefs(vd, (cids[0], ND // 5, ND // 7), bi, i, js)
    M = np.array([[q[0]**2 + q[1]**2 - q[2]**2 - q[3]**2, 2*(q[1]*q[2] - q[0]*q[3]), 2*(q[1]*q[3] + q[0]*q[2])],
                  [2*(q[1]*q[2] + q[0]*q[3]), q[0]**2 - q[1]**2 + q[2]**2 - q[3]**2, 2*(q[2]*q[3] - q[0]*q[1])],
                  [2*(q[1]*q[3] - q[0]*q[2]), 2*(q[2]*q[3] + q[0]*q[1]), q[0]**2 - q[1]**2 - q[2]**2 + q[3]**2]])
    fv = M.flatten().tolist() + [float(q @ q)]
    den = None
    val_i = sum((a + math.sqrt(5) * b) * x for (a, b), x in zip(ic, fv))
    P = S.KVf @ Rf.T; y = vd["fy"][per[0][1][0]]
    E = vd["nf"] @ P[i] + sum(y[k] * (S.Af[rw] @ P[js[sum(1 for x in G_['trip'][bi][:k] if x < 20)]] - G_["s0f"])
                              for k, rw in enumerate(G_["trip"][bi]) if rw < 20) - vd["nw0"]
    ratio = val_i / (E * float(q @ q)) if abs(E) > 1e-9 else float("nan")
    print(f"value of the integer coefficients / floating-point |q|²·E = {ratio:.6g} (they agree if this is a positive constant)")
    if prob == "T":
        return
    # equality point
    vd0 = vdata(0, 0)
    Rsf = np.array([[float(x) for x in r] for r in G_["Rs"]])
    Gt0 = S.lp_min_t(vd0["nf"], Rsf) - vd0["nw0"]
    print(f"equality point n = −v, R = R*: G − n·w₀ = {Gt0:.2e}")
    # range of R of the local: the quaternion of R* itself lies in L
    qs = np.array([float(x) for x in G_["qs"]])
    print("quaternion of R*", np.round(qs / np.abs(qs).max(), 6))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["run", "replay", "check"])
    ap.add_argument("--prob", default="II", choices=["II", "T"])
    ap.add_argument("--name", default=None); ap.add_argument("--local", default=LOCAL_NAME)
    ap.add_argument("--cids", default=None, help="map numbers of T (comma-separated, cid = 2·rep + (0: +N, 1: −N))")
    ap.add_argument("--procs", type=int, default=12); ap.add_argument("--nmin", type=int, default=14)
    ap.add_argument("--budget", type=int, default=60000); ap.add_argument("--wmin-exp", type=int, default=16)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=4 * 3600)
    ap.add_argument("--forced-exp", type=int, default=3)
    ap.add_argument("--with-local", action="store_true")
    ap.add_argument("--break-noL", action="store_true"); ap.add_argument("--break-shift", default=None)
    a = ap.parse_args()
    if a.break_noL:
        BREAK["noL"] = True
    if a.break_shift:
        BREAK["shift"] = QD(Fr(a.break_shift))
    name = a.name or f"d87_dod_far_{a.prob}"
    cids = [int(x) for x in a.cids.split(",")] if a.cids else None
    if a.cmd == "run":
        st = run(name, a.local, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit, a.forced_exp, a.prob, cids)
        sys.exit(0 if st["passed"] else 2)
    elif a.cmd == "replay":
        replay(name, a.procs, a.with_local)
    elif a.cmd == "check":
        check(a.prob)
