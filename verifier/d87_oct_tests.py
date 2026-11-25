# -*- coding: utf-8 -*-
"""Tests for D48 stage O4 (L4″, octincub_n09): the formulas agree with the true values, the records are not vacuous, and broken copies are not accepted.
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
The structure was copied from d86_tests.py (D47 stage 4) (it is not imported). All true values are computed exactly (Fraction) from
d87_cub_common.G_formula (the formula, checked against the LP in t in step0). Floating point is used only as preparation for finding the
"points where the value is negative" of the broken copies (a point found is converted to rationals and checked exactly).

  X  : the formulas of the far candidates (the quadratic forms of d87_oct_far.cand_poly and cand_poly3, evaluated exactly at the coordinates
       of a rational point in its R box) and the formulas of the local candidates (d87_oct_local.P_poly at rational coordinates) are
       compared with the true value G − n·w. Every candidate is ≤; in the far region the max over all candidates is an equality, in the
       local region the max is an equality near the equality points. Sensitivity: if the side of the true value is mixed up (point w_A → w_Q,
       sign of (n_i)₋, index of the axis of e_i), there are points where ≤ or the equality fails.
  W  : records are broken (candidate, type, rotation number, L number, deleting a leaf or a box, kind of box, local name or width in the
       header) and fed to replay, which must reject them. The unbroken copy passes (a check of the read/write tools).
  P  : at special points (the 3 equality points, the edges of the bands and points just outside, the boundaries of the cones, the mirror
       edges of the chambers) × several R: the true value ≥ 0, and a leaf of the record containing the point is found (type A: the value
       of the candidate evaluated exactly at the point is ≥ 0; type D: followed through the rotation of the piece; type L: followed down to
       the local leaf, the value of the local candidate is ≥ 0 and the local and far true values are the same).
  B  : 4 broken copies (table O4 in D48 section 7).
       B1 w_A → w_Q: a rational point with G − n·w_Q < 0 in (III) (exact); build of local J3 and J4 rejects; the far (III) n box
          (containing that point) fails.
       B2 ŝ₀ → 8/3 + 1/1000 (half-edge 4/3 + 1/2000): G − n·w < 0 at the 3 equality points (exact); build of local P2, J3, J4 rejects.
       B3 band width 1/4 (narrowing the regions assigned to local P2, J3, J4 to 1/4): re-judging the type L leaves of the far records gives
          failures (the widening direction still passes for J3 and is not a broken copy; the same type as Xu of D86).
       B4 removing the quadratic treatment of (IV): local J4 without the treatment of T_c = τ²A_c does not pass (limit of subdivision);
          far (IV) without local (noL) fails the n box of d′.
Usage: python -X utf8 d87_oct_tests.py [--only X,W,P,B] [--scratch DIR]   -> d87_oct_tests.json (when all are run)
"""
import sys, os, json, gzip, time, argparse, random, subprocess, math, itertools, tempfile
from fractions import Fraction as Fr
import numpy as np
import sympy as sp

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
os.chdir(HERE)
import d87_cub_common as C
import d87_oct_local as L
import d87_oct_far as FA
import d31_common as D31
import d37_tet_n05_common as D37C

DEN = D31.DEN; ND = FA.ND; DU = L.DU
WQ = C.W_Q; WA = C.W_A
OUT = {}
FAIL = []
LOCAL_REC = {"P2": "d87_oct_local_P2", "J3": "d87_oct_local_J3", "J4": "d87_oct_local_J4"}
FAR_REC = {"II": "d87_oct_far_II", "III": "d87_oct_far_III", "IV": "d87_oct_far_IV"}
KIND_OF = {"II": "P2", "III": "J3", "IV": "J4"}


def log(s):
    print(s, flush=True)


def check(name, ok, detail=""):
    OUT.setdefault("checks", []).append(dict(name=name, ok=bool(ok), detail=str(detail)))
    log(f"  [{'OK' if ok else 'NG'}] {name} {detail}")
    if not ok:
        FAIL.append(name)


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


def matmul(A, B):
    return [[sum(A[i][k] * B[k][j] for k in range(3)) for j in range(3)] for i in range(3)]


def T_(A):
    return [[A[j][i] for j in range(3)] for i in range(3)]


def mv(A, v):
    return tuple(sum(A[i][k] * v[k] for k in range(3)) for i in range(3))


def neg(A):
    return [[-x for x in r] for r in A]


def det(A):
    return (A[0][0] * (A[1][1] * A[2][2] - A[1][2] * A[2][1]) - A[0][1] * (A[1][0] * A[2][2] - A[1][2] * A[2][0])
            + A[0][2] * (A[1][0] * A[2][1] - A[1][1] * A[2][0]))


def frm(A):
    return [[Fr(x) for x in r] for r in A]


def W_OF(pr):
    return WQ if pr == "II" else WA


def truth(pr, n, R, S=C.S_HALF, w=None):
    """Left side − right side of (★) (exact): G(n, R) − n·w."""
    return C.G_formula(n, R, S) - dot(n, W_OF(pr) if w is None else w)


def in_cone(pr, n):
    if pr == "II":
        return all(x <= 0 for x in n)
    if pr == "III":
        return n[0] >= 0 and n[1] >= 0 and n[2] <= 0
    return n[0] <= 0 and n[1] <= 0 and n[2] >= 0


def rand_rot(rnd, den=12, near=None, base=None):
    """A rational rotation matrix (from an integer quaternion). With near, base·R(1, small p)."""
    if near is None:
        while True:
            q = [rnd.randint(-den, den) for _ in range(4)]
            if any(q):
                return C.quat_rot(q)
    q = (den,) + tuple(int(round(rnd.uniform(-1, 1) * near * den)) for _ in range(3))
    R = C.quat_rot(q)
    return matmul(base, R) if base is not None else R


def load(path):
    with gzip.open(path, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


def save(lines, path):
    with gzip.open(path, "wt", encoding="utf-8") as f:
        for r in lines:
            f.write(json.dumps(r) + "\n")


# ======================= evaluate the formulas of the far candidates at a point =======================
def chart_point(R):
    """Rotation R → [(ch, coordinates c in the map (DEN times, rational))]. The map with the largest |q_ch| (all of them on ties)."""
    q = [Fr(x) for x in D37C.mat_to_q(R)]
    m = max(abs(x) for x in q)
    out = []
    for ch in range(4):
        if abs(q[ch]) == m:
            s = 1 if q[ch] > 0 else -1
            out.append((ch, [s * q[i] / abs(q[ch]) * DEN for i in range(4) if i != ch]))
    return out


def rb_at(ch, c):
    """The R box of width 2 (RBox) containing point c, and the coordinates s ∈ [−1, 1]³ of the point inside that box."""
    lo = [math.floor(x) - 1 for x in c]; hi = [l + 2 for l in lo]
    s = [x - (l + 1) for x, l in zip(c, lo)]
    return D31.RBox(ch, lo, hi), s


def evq(v, s):
    """Evaluate a quadratic form of D31 (length 10) at s (exact)."""
    s1, s2, s3 = s
    return (v[0] + v[1] * s1 + v[2] * s2 + v[3] * s3 + v[4] * s1 * s1 + v[5] * s2 * s2 + v[6] * s3 * s3
            + v[7] * s1 * s2 + v[8] * s1 * s3 + v[9] * s2 * s3)


def far_ctx(R):
    ch, c = chart_point(R)[0]
    rb, s = rb_at(ch, c)
    return rb, s, evq(rb.Q, s)


def far_cand_value(pr, mvec, R, cand, ctx=None):
    """Value of the far candidate F_c (in the same units as the true value: F(m) for (II), G − n·w_A for (III) and (IV)). mvec is the integer/rational vector of the far map.
    The quadratic form of the candidate (d87_oct_far.cand_poly) is evaluated exactly at the coordinates of the point inside the R box of width 2 containing R."""
    FA.PROB[0] = pr
    rb, s, q = ctx or far_ctx(R)
    v = evq(FA.cand_poly(mvec, rb, cand), s)
    return v / q if pr == "II" else v / (18 * q)


def all_cands(pr):
    na = 3 if pr == "II" else len(FA.WALLS[pr])
    ax1 = [(k, s) for k in range(3) for s in (1, -1)]
    return [(k, s, ax) for k in range(3) for s in (1, -1) for ax in itertools.product(ax1, repeat=na)]


def F_far_true(pr, mvec, R, S=C.S_HALF, wsel=None, flip=False, perm=None):
    """True value in far units. (II): F(m, R) = G(−m) + m·w_Q. (III), (IV): G(n) − n·w_A. Arguments for mix-ups, for the sensitivity tests."""
    if pr == "II":
        n = tuple(-x for x in mvec)
    else:
        n = tuple(mvec)
    w = W_OF(pr) if wsel is None else wsel
    Rp = R if perm is None else [R[perm[i]] for i in range(3)]       # mix up the index of the axis of e_i
    if flip:
        val = C.hK(R, n) + sum(max(n[i], 0) * (C.e_axis(Rp, i) - S) for i in range(3)) - dot(n, w)
    else:
        val = C.hK(R, n) + sum(max(-n[i], 0) * (C.e_axis(Rp, i) - S) for i in range(3)) - dot(n, w)
    return val


def test_X(seed=7):
    rnd = random.Random(seed)
    res = {}
    for pr in ("II", "III", "IV"):
        FA.PROB[0] = pr
        cands = all_cands(pr)
        nle = 0; neq = 0; npts = 0; worst = None
        sens = dict(w=0, sign=0, axis=0)
        eqR = neg(C.R_STAR) if pr == "II" else C.R_III
        pts = []
        for i in range(36):
            a = Fr(rnd.randint(0, 64), 64); b = Fr(rnd.randint(0, 64), 64)
            if a + b > 1:
                a, b = 1 - a, 1 - b
            if i < 12:
                R = rand_rot(rnd, 24, near=Fr(1, 6), base=eqR)
                a, b = ((Fr(0), Fr(1)) if pr == "II" else (Fr(2, 3), Fr(1, 3)))
                a += Fr(rnd.randint(-4, 0), 64); b += Fr(rnd.randint(-4, 0), 64)
                a = max(a, Fr(0)); b = max(b, Fr(0))
            else:
                R = rand_rot(rnd, 12)
            pts.append((a, b, R))
        for a, b, R in pts:
            mvec = FA.mval(a * ND, b * ND)
            tv = F_far_true(pr, mvec, R)
            ctx = far_ctx(R)
            vals = [far_cand_value(pr, mvec, R, c, ctx) for c in cands]
            mx = max(vals)
            npts += 1
            nle += all(v <= tv for v in vals)
            neq += (mx == tv)
            worst = mx - tv if worst is None else max(worst, mx - tv)
            # sensitivity: mix up the side of the true value
            alt_w = WA if pr == "II" else WQ
            if mx != F_far_true(pr, mvec, R, wsel=alt_w):
                sens["w"] += 1
            if mx != F_far_true(pr, mvec, R, flip=True):
                sens["sign"] += 1
            if mx != F_far_true(pr, mvec, R, perm=(1, 2, 0)):
                sens["axis"] += 1
        check(f"X far ({pr}): all {len(cands)} candidates ≤ true value, max = true value", nle == npts and neq == npts,
              f"points {npts}, ≤ {nle}, equality {neq}, largest max − true {worst}")
        check(f"X far ({pr}): mixing up the side of the true value gives points that do not agree (point, sign, axis)", all(v > 0 for v in sens.values()),
              f"{sens} (out of {npts} points)")
        res[pr] = dict(points=npts, le=nle, eq=neq, sens=sens)
    # local
    for kind in ("P2", "J3", "J4"):
        pr = {"P2": "II", "J3": "III", "J4": "IV"}[kind]
        polys = {c: lambda_poly(kind, c) for c in L.cands(kind)}
        sp_ = L.SPEC[kind]
        nle = 0; neq = 0; npts = 0; nout = 0; near_pts = 0; sens = 0
        for i in range(60):
            small = i < 20
            r = sp_["rmax"] / (16 if small else 1)
            base = [Fr(rnd.randint(-8, 8), 8) * (hi - lo) / 2 + (hi + lo) / 2 for lo, hi in sp_["base"]]
            if small:
                base = [x / 16 for x in base]
                base = [min(max(x, lo), hi) for x, (lo, hi) in zip(base, sp_["base"])]
            lat = [Fr(rnd.randint(-8, 8), 8) * s * r for s in sp_["sc"]]
            n, R, fac = config_exact(kind, base, lat)
            if not in_cone(pr, n):
                nout += 1; continue
            tv = truth(pr, n, R)
            vals = [eval_poly(polys[c], kind, base, lat) / fac for c in L.cands(kind)]
            npts += 1
            nle += all(v <= tv for v in vals)
            if small:
                near_pts += 1; neq += (max(vals) == tv)
            if max(vals) != truth(pr, n, R, w=(WA if pr == "II" else WQ)):
                sens += 1
        check(f"X local {kind}: all {len(L.cands(kind))} candidates ≤ true value, max = true value near the equality point",
              nle == npts and neq == near_pts and near_pts > 0,
              f"points {npts} (excluded outside the cone {nout}), ≤ {nle}, of {near_pts} nearby points equality {neq}")
        check(f"X local {kind}: mixing up the point w gives disagreement", sens > 0, f"{sens}/{npts}")
        res[kind] = dict(points=npts, le=nle, near=near_pts, eq=neq, out_of_cone=nout, sens_w=sens)
    OUT["X"] = res


# ======================= local coordinates (exact) =======================
_PP = {}


def lambda_poly(kind, c, od=None):
    key = (kind, tuple(c), None if od is None else tuple(sorted(od.items())))
    if key not in _PP:
        P = L.P_poly(kind, c, od)
        base, lat = L.vars_of(kind)
        _PP[key] = sp.Poly(P, *(list(base) + list(lat)))
    return _PP[key]


def eval_poly(poly, kind, base, lat):
    vals = [Fr(x) for x in list(base) + list(lat)]
    tot = Fr(0)
    for mon, cf in poly.terms():
        t = Fr(int(sp.Rational(cf).p), int(sp.Rational(cf).q))
        for v, e in zip(vals, mon):
            if e:
                t *= v ** e
        tot += t
    return tot


def J4_data():
    cv = L.J4_curve_cache()
    d = [L.fr(x) for x in cv["d"]]; e1 = [L.fr(x) for x in cv["e1"]]; e2 = [L.fr(x) for x in cv["e2"]]
    c2 = [L.fr(sp.Poly(x, L.TAU).coeff_monomial(L.TAU ** 2)) for x in cv["phi"]]
    c1 = [L.fr(sp.Poly(x, L.TAU).coeff_monomial(L.TAU)) for x in cv["phi"]]
    assert c1 == d
    return d, e1, e2, c2


def Mq_fr(w, x, y, z):
    return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
            [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
            [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]


def config_exact(kind, base, lat):
    """Coordinates → (n, R, multiplier of the candidate polynomials) (exact; the rational version of d87_oct_local.config_of)."""
    base = [Fr(x) for x in base]; lat = [Fr(x) for x in lat]
    if kind == "P2":
        z1, z2, p1, p2, p3 = lat
        Q = 1 + p1 * p1 + p2 * p2 + p3 * p3
        R = matmul(C.R_STAR, [[x / Q for x in r] for r in Mq_fr(Fr(1), p1, p2, p3)])
        sgn = -1; fac = Q * Q
    elif kind == "J3":
        u, s = base; y, z1, z2 = lat; al, be = s + y, y - s
        QB = 1 + al * al + be * be
        Rz = [[x / (1 + u * u) for x in r] for r in Mq_fr(Fr(1), Fr(0), Fr(0), u)]
        B = [[x / QB for x in r] for r in Mq_fr(Fr(1), -al, -be, Fr(0))]
        R = matmul(matmul(Rz, B), C.R_III)
        sgn = 1; fac = (1 + u * u) * QB * QB
    else:
        d, e1, e2, c2 = J4_data()
        tau, = base; l1, l2, z1, z2 = lat
        p = [tau * d[i] + tau * tau * c2[i] + l1 * e1[i] + l2 * e2[i] for i in range(3)]
        Q = 1 + dot(p, p)
        R = matmul(C.R_III, [[x / Q for x in r] for r in Mq_fr(Fr(1), *p)])
        sgn = -1; fac = Q * Q
    nu = (1 + z1 + z2, 1 - z1 + z2, 1 - 2 * z2)
    n = tuple(sgn * x for x in mv(R, nu))
    return n, R, fac


def coords_exact(kind, n, R):
    """(n, R) → (base, lateral) (exact; the rational version of d87_oct_local.coords_of). None: a denominator of the formula is ≤ 0 (outside the assigned region)."""
    v = tuple(-x for x in n) if kind in ("P2", "J4") else tuple(n)
    nu = mv(T_(R), v)
    S = sum(nu)
    if S <= 0:
        return None
    nh = [3 * x / S for x in nu]
    z1, z2 = (nh[0] - nh[1]) / 2, (1 - nh[2]) / 2
    if kind == "P2":
        A = matmul(T_(C.R_STAR), R)
        t = 1 + A[0][0] + A[1][1] + A[2][2]
        if t <= 0:
            return None
        p = [(A[2][1] - A[1][2]) / t, (A[0][2] - A[2][0]) / t, (A[1][0] - A[0][1]) / t]
        return [], [z1, z2] + p
    if kind == "J3":
        sig = mv(C.R_III, tuple(R[2]))
        if 1 + sig[2] <= 0:
            return None
        be, al = sig[0] / (1 + sig[2]), -sig[1] / (1 + sig[2])
        QB = 1 + al * al + be * be
        B = [[x / QB for x in r] for r in Mq_fr(Fr(1), -al, -be, Fr(0))]
        Rz = matmul(matmul(R, T_(C.R_III)), T_(B))
        if 1 + Rz[0][0] <= 0:
            return None
        u = Rz[1][0] / (1 + Rz[0][0])
        return [u, (al - be) / 2], [(al + be) / 2, z1, z2]
    d, e1, e2, c2 = J4_data()
    A = matmul(T_(C.R_III), R)
    t = 1 + A[0][0] + A[1][1] + A[2][2]
    if t <= 0:
        return None
    p = [(A[2][1] - A[1][2]) / t, (A[0][2] - A[2][0]) / t, (A[1][0] - A[0][1]) / t]
    tau = dot(p, d) / dot(d, d)
    rest = [p[i] - tau * d[i] - tau * tau * c2[i] for i in range(3)]
    return [tau], [dot(rest, e1) / dot(e1, e1), dot(rest, e2) / dot(e2, e2), z1, z2]


class LocalIndex:
    def __init__(self, kind, name=None):
        self.kind = kind
        lines = load(os.path.join(HERE, f"{name or LOCAL_REC[kind]}.leaves.jsonl.gz"))
        self.hd = lines[0]
        self.by = {}
        for r in lines[1:]:
            self.by.setdefault(tuple(r["face"]), []).append(r)
        self.sc = [Fr(x) for x in self.hd["sc"]]; self.rmax = Fr(self.hd["rmax"])
        self.base = [(Fr(a), Fr(b)) for a, b in self.hd["base"]]

    def find(self, base, lat):
        """Leaves containing the point in coordinates (per face). Returns: (inside the assigned region?, list of leaves)."""
        r = max(abs(x) / s for x, s in zip(lat, self.sc))
        inside = r <= self.rmax and all(lo <= b <= hi for b, (lo, hi) in zip(base, self.base))
        found = []
        for fi in range(len(self.sc)):
            for fv in (1, -1):
                if r != 0 and lat[fi] != fv * self.sc[fi] * r:
                    continue
                t = [Fr(0)] * (len(self.sc) - 1) if r == 0 else [lat[j] / (self.sc[j] * r) for j in range(len(self.sc)) if j != fi]
                X = [r * DU] + [x * DU for x in t] + [b * DU for b in base]
                for lf in self.by.get((fi, fv), []):
                    if all(lo <= x <= hi for lo, x, hi in zip(lf["lo"], X, lf["hi"])):
                        found.append(lf)
        return inside, found


# ======================= P: follow special points down to the leaves of the records =======================
class FarIndex:
    def __init__(self, pr):
        self.pr = pr
        lines = load(os.path.join(HERE, f"{FAR_REC[pr]}.boxes.jsonl.gz"))
        self.hd = lines[0]
        self.boxes = lines[1:]

    def n_boxes(self, A, B):
        x, y = A * ND, B * ND
        return [r for r in self.boxes if r["lo"][0] <= x <= r["hi"][0] and r["lo"][1] <= y <= r["hi"][1]]


PERMS = [list(p) for p in itertools.permutations(range(3))]


def reduce_far(pr, n, R):
    """(n, R) (n in the cone) → [(A, B, n_s, R_s)]: coordinates in the far map and the representative in the chamber. Checks F(n, R) = F(n_s, R_s) exactly."""
    out = []
    if pr == "II":
        m = tuple(-x for x in n)
        for p in PERMS:
            ms = tuple(m[p[i]] for i in range(3))                 # m_s = Pᵀ m (column i of P is e_{p[i]})
            if not (ms[0] >= ms[1] >= ms[2] >= 0):
                continue
            Pt = [[Fr(int(j == p[i])) for j in range(3)] for i in range(3)]   # (Pᵀ)_{i,j} = [j = p[i]]
            Rs = matmul(Pt, R)
            if det(Rs) < 0:
                Rs = neg(Rs)
            S = sum(ms)
            b = 3 * ms[2] / S; a = 2 * (ms[1] - ms[2]) / S
            out.append((a, b, tuple(-x for x in ms), Rs))      # n_s = −m_s (n in the cone)
        return out
    s = FA.SGN[pr]
    a_, b_, c_ = s * n[0], s * n[1], -s * n[2]
    opts = []
    if a_ >= b_:
        opts.append((tuple(n), R))
    if b_ >= a_:
        Pm = [[Fr(0), Fr(1), Fr(0)], [Fr(1), Fr(0), Fr(0)], [Fr(0), Fr(0), Fr(1)]]
        opts.append(((n[1], n[0], n[2]), neg(matmul(Pm, R))))
    for ns, Rs in opts:
        a2, b2, c2 = s * ns[0], s * ns[1], -s * ns[2]
        S = a2 + b2 + c2
        out.append((2 * b2 / S, c2 / S, ns, Rs))
    return out


def follow(IX, LI, pr, A, B, ns, Rs, depth=0):
    """Follow in the far record. Returns: the list of types (D is followed by rotating, L down to the local leaf).
    The returned strings are kept in Japanese: test_P searches them for substrings, and they are written into the test result."""
    FA.PROB[0] = pr
    nb = [r for r in IX.n_boxes(A, B) if r["kind"] == "ok"]
    if not nb:
        return ["n \u306e\u7bb1\u306a\u3057"]
    mvec = FA.mval(A * ND, B * ND)
    if pr == "II":
        m = tuple(-x for x in ns)
        need_prop = all(x * sum(m) == y * sum(mvec) for x, y in zip(mvec, m))
    else:
        need_prop = all(x * sum(abs(t) for t in ns) == y * sum(abs(t) for t in mvec) for x, y in zip(mvec, ns))
    if not need_prop:
        return ["\u5730\u56f3\u306e\u70b9\u304c\u5408\u308f\u306a\u3044"]
    out = []
    for r in nb:
        lfs = []
        for ch, c in chart_point(Rs):
            for lf in r["leaves"]:
                if lf[0] == ch and all(lo <= x <= hi for lo, x, hi in zip(lf[1], c, lf[2])):
                    lfs.append(lf)
        if not lfs:
            out.append("R \u306e\u8449\u306a\u3057"); continue
        for lf in lfs[:2]:
            t = lf[3]
            if t == "A":
                cand = (lf[4][0], lf[4][1], tuple(tuple(x) for x in lf[4][2]))
                v = far_cand_value(pr, mvec, Rs, cand)
                tv = F_far_true(pr, mvec, Rs)
                out.append("A" if 0 <= v <= tv else f"A \u306e\u5024\u304c\u5408\u308f\u306a\u3044\uff08{v}, {tv}\uff09")
            elif t == "D":
                if depth >= 12:
                    out.append("D \u6df1\u3059\u304e"); continue
                k = frm(FA.ROT_NONID[lf[4]])
                Rk = matmul(Rs, k)
                if F_far_true(pr, mvec, Rk) != F_far_true(pr, mvec, Rs):
                    out.append("D \u3067\u5024\u304c\u5909\u308f\u308b"); continue
                sub = follow(IX, LI, pr, A, B, ns, Rk, depth + 1)
                out.append("D→" + ",".join(sub))
            elif t == "L":
                g = frm(FA.GL[lf[4]] if pr == "II" else FA.GR[lf[4]])
                Rp = matmul(Rs, g)
                kind = KIND_OF[pr]
                n_loc = tuple(ns)
                co = coords_exact(kind, n_loc, Rp)
                if co is None:
                    out.append("L→\u5c40\u6240\u306e\u5ea7\u6a19\u304c\u7121\u3044"); continue
                inside, lls = LI.find(*co)
                same = truth(pr, n_loc, Rp) == truth(pr, n_loc, Rs)
                if not inside or not lls:
                    out.append("L→\u5c40\u6240\u306e\u8449\u306a\u3057" + ("\uff08\u53d7\u3051\u6301\u3061\u306e\u5916\uff09" if not inside else "")); continue
                lf2 = lls[0]
                c2 = tuple(lf2["c"])
                n2, R2, fac = config_exact(kind, *co)
                pv = eval_poly(lambda_poly(kind, c2), kind, *co)
                ok2 = pv >= 0 and R2 == Rp and all(x * sum(abs(t) for t in n_loc) == y * sum(abs(t) for t in n2) for x, y in zip(n2, n_loc))
                out.append(f"L→\u5c40\u6240 {lf2['t']}" + ("" if same else "\uff08\u771f\u306e\u5024\u304c\u5408\u308f\u306a\u3044\uff09") + ("" if ok2 else "\uff08\u5c40\u6240\u306e\u5024\u30fb\u5f80\u5fa9\u304c\u5408\u308f\u306a\u3044\uff09"))
            else:
                out.append("\u578b\u304c\u4e0d\u660e")
    return out


def special_points():
    """(prob, name, n, [name of R and R])."""
    rnd = random.Random(31)
    Rst = neg(C.R_STAR)                     # direction of the equality of (II) (made a rotation)
    pts = []

    def Rs_common(eqR, kind, edges):
        Rs = [("equality direction", eqR)]
        Rs += [(f"near equality {i}", rand_rot(rnd, 32, near=Fr(1, 10), base=eqR)) for i in range(3)]
        Rs += [(f"general {i}", rand_rot(rnd, 9)) for i in range(3)]
        Rs += [("equality direction, rotation of the piece", matmul(eqR, frm(FA.ROT_NONID[4])))]
        return Rs

    # (II)
    RsII = Rs_common(Rst, "P2", None)
    for nm, m in (("equality m = (1,1,1)", (1, 1, 1)), ("cone boundary m3 = 0: m = (1,1,0)", (1, 1, 0)), ("cone corner m = (1,0,0)", (1, 0, 0)),
                  ("mirror edge m2 = m3: m = (2,1,1)", (2, 1, 1)), ("mirror edge m1 = m2: m = (1,1,1/2)", (2, 2, 1)),
                  ("general m = (3,2,1)", (3, 2, 1)), ("cone boundary m = (1,0,1)", (1, 0, 1))):
        pts.append(("II", nm, tuple(Fr(-x) for x in m), RsII))
    # edges of the band of (II) (P2) and points just outside: (n, R) from coordinates
    rP = L.SPEC["P2"]["rmax"]
    for nm, lat in (("P2 edge z1 = r", [rP, 0, 0, 0, 0]), ("P2 edge p1 = r", [0, 0, rP, 0, 0]),
                    ("P2 edge p3 = −r, z2 = r/2", [0, rP / 2, 0, 0, -rP]), ("P2 just outside p2 = r + 1/64", [0, 0, 0, rP + Fr(1, 64), 0]),
                    ("P2 corner all r", [rP] * 5)):
        n, R, _ = config_exact("P2", [], lat)
        pts.append(("II", nm, n, [("that direction (reflection made a rotation by −1)", neg(R))]))
    # (III)
    RsIII = Rs_common(C.R_III, "J3", None)
    for nm, n in (("equality n = (1,1,−1)", (1, 1, -1)), ("cone boundary c = 0: n = (1,1,0)", (1, 1, 0)), ("cone boundary b = 0: n = (1,0,−1)", (1, 0, -1)),
                  ("cone corner n = (0,0,−1)", (0, 0, -1)), ("mirror edge a = b: n = (1,1,−3)", (1, 1, -3)), ("general n = (5,4,−3)", (5, 4, -3)),
                  ("x ↔ y copy n = (1,2,−1)", (1, 2, -1))):
        pts.append(("III", nm, tuple(Fr(x) for x in n), RsIII))
    sp3 = L.SPEC["J3"]; r3 = sp3["rmax"]
    for nm, b, l in (("J3 base edge u = 1/4", [Fr(1, 4), 0], [0, 0, 0]), ("J3 base edge s = −1/8", [0, Fr(-1, 8)], [0, 0, 0]),
                     ("J3 base edge s = 1/4", [0, Fr(1, 4)], [0, 0, 0]), ("J3 lateral edge y = 1/32", [0, 0], [r3 / 4, 0, 0]),
                     ("J3 lateral edge z1 = 1/8", [Fr(1, 8), Fr(1, 16)], [0, r3, 0]),
                     ("J3 just outside the base s = 1/4 + 1/64", [0, Fr(1, 4) + Fr(1, 64)], [0, 0, 0]),
                     ("J3 just outside laterally y = 1/32 + 1/256", [0, 0], [r3 / 4 + Fr(1, 256), 0, 0])):
        n, R, _ = config_exact("J3", b, l)
        pts.append(("III", nm, n, [("that direction", R)]))
    # (IV)
    RsIV = Rs_common(C.R_III, "J4", None)
    for nm, n in (("equality n = (−1,−1,1)", (-1, -1, 1)), ("cone boundary c = 0: n = (−1,−1,0)", (-1, -1, 0)), ("cone boundary b = 0: n = (−1,0,1)", (-1, 0, 1)),
                  ("cone corner n = (0,0,1)", (0, 0, 1)), ("mirror edge a = b: n = (−1,−1,3)", (-1, -1, 3)), ("general n = (−5,−3,4)", (-5, -3, 4)),
                  ("x ↔ y copy n = (−1,−2,1)", (-1, -2, 1))):
        pts.append(("IV", nm, tuple(Fr(x) for x in n), RsIV))
    sp4 = L.SPEC["J4"]; r4 = sp4["rmax"]
    for nm, b, l in (("J4 base edge τ = 3/64", [Fr(3, 64)], [0, 0, 0, 0]), ("J4 base edge τ = −3/64", [Fr(-3, 64)], [0, 0, 0, 0]),
                     ("J4 lateral edge l1 = 1/16", [0], [r4, 0, 0, 0]), ("J4 lateral edge l2 = −1/80", [Fr(1, 64)], [0, -r4 / 5, 0, 0]),
                     ("J4 lateral edge z2 = 1/8", [0], [0, 0, 0, 2 * r4]),
                     ("J4 just outside the base τ = 3/64 + 1/128", [Fr(3, 64) + Fr(1, 128)], [0, 0, 0, 0]),
                     ("J4 just outside laterally l1 = 1/16 + 1/128", [0], [r4 + Fr(1, 128), 0, 0, 0])):
        n, R, _ = config_exact("J4", b, l)
        pts.append(("IV", nm, n, [("that direction", R)]))
    return pts


def test_P():
    IX = {pr: FarIndex(pr) for pr in ("II", "III", "IV")}
    LI = {k: LocalIndex(k) for k in ("P2", "J3", "J4")}
    for pr in IX:
        FA.PROB[0] = pr; FA.LOC.clear(); FA.set_local(LOCAL_REC[KIND_OF[pr]])
        check(f"P preparation ({pr}): local in the far header = the local record", IX[pr].hd["local"] == LOCAL_REC[KIND_OF[pr]])
    res = []; bad = 0; nL = 0; neq0 = 0; nsym = 0; badsym = 0
    for pr, nm, n, Rs in special_points():
        for rn, R in Rs:
            if not in_cone(pr, n):
                res.append(dict(prob=pr, n=nm, R=rn, skip="outside the cone")); continue
            tv = truth(pr, n, R)
            neq0 += (tv == 0)
            types = []
            for A, B, ns, Rr in reduce_far(pr, n, R):
                nsym += 1
                if truth(pr, ns, Rr) * (sum(abs(x) for x in n)) != tv * sum(abs(x) for x in ns):
                    badsym += 1
                FA.PROB[0] = pr; FA.LOC.clear(); FA.set_local(LOCAL_REC[KIND_OF[pr]])
                types += follow(IX[pr], LI[KIND_OF[pr]], pr, A, B, ns, Rr)
            okv = tv >= 0
            okc = bool(types) and not any(("\u306a\u3057" in t) or ("\u5408\u308f\u306a\u3044" in t) or ("\u6df1\u3059\u304e" in t) or ("\u5909\u308f\u308b" in t)
                                          or ("\u4e0d\u660e" in t) or ("\u7121\u3044" in t) for t in types)
            nL += sum("L→" in t for t in types)
            bad += not (okv and okc)
            res.append(dict(prob=pr, n=nm, R=rn, G=str(tv), types=types))
            if not (okv and okc):
                log(f"    ({pr}) {nm} × {rn}: G − n·w = {tv}, {types}")
    check("P: special points × R give true value ≥ 0 and a leaf of the record is found (A: value of the candidate at the point, D: followed, L: down to the local leaf)", bad == 0,
          f"{len([r for r in res if 'skip' not in r])} pairs, failures {bad}, followed down to local {nL}, pairs with true value 0 {neq0}")
    check("P: the copy into the chamber (permutation, x ↔ y, reflection) does not change the true value", badsym == 0 and nsym > 0, f"{nsym} cases")
    check("P: some pairs were followed down to type L (the hand-over test is not vacuous)", nL > 0, f"{nL}")
    OUT["P"] = dict(results=res, bad=bad, L=nL, eq0=neq0)


# ======================= W: replay rejects broken records =======================
def run_replay(args):
    r = subprocess.run([sys.executable, "-X", "utf8"] + args, cwd=HERE, capture_output=True, text=True, encoding="utf-8")
    msg = (r.stdout + r.stderr).strip().splitlines()
    return r.returncode, (msg[-1] if msg else "")


def tampers_local(kind, Ls):
    B = L.build_cache(kind)
    T = {}
    T["\u5199\u3057\uff08\u58ca\u3057\u3066\u3044\u306a\u3044\uff09"] = lambda x: None          # key kept in Japanese: test_W detects the unbroken copy by nm.startswith("\u5199\u3057")
    # candidate of a type F leaf → another candidate not accepted on that box
    hit = None
    for idx, r in enumerate(Ls[1:], 1):
        if r["t"] != "F":
            continue
        F = L.Face(B, r["face"])
        for c in L.cands(kind):
            if list(c) == r["c"]:
                continue
            it = F.byc[tuple(L.ckey(c))]
            if not F.accept_F(it, r["lo"], r["hi"]) and not F.accept_D(it, r["lo"], r["hi"]):
                hit = (idx, L.ckey(c)); break
        if hit:
            break
    if hit:
        T[f"candidate changed to one not accepted (leaf {hit[0]})"] = lambda x, h=hit: x[h[0]].__setitem__("c", h[1])
    # type F → D (a leaf that fails the D check)
    hitD = None
    for idx, r in enumerate(Ls[1:], 1):
        if r["t"] == "F":
            F = L.Face(B, r["face"])
            if not F.accept_D(F.byc[tuple(r["c"])], r["lo"], r["hi"]):
                hitD = idx; break
    if hitD:
        T[f"type F changed to D (leaf {hitD})"] = lambda x, h=hitD: x[h].__setitem__("t", "D")
    T["delete 1 leaf"] = lambda x: x.pop(len(x) // 2)
    T["shift the box of a leaf (the cover breaks)"] = lambda x: x[3].__setitem__("hi", [h + (2 if i == 0 else 0) for i, h in enumerate(x[3]["hi"])])
    T["double the upper limit of r in the header"] = lambda x: x[0].__setitem__("rmax", str(2 * Fr(x[0]["rmax"])))
    T["test breakage option in the header"] = lambda x: x[0].__setitem__("opts", [["lam", "1/100"]])
    T["type changed to an unknown one"] = lambda x: x[5].__setitem__("t", "Z")
    return T


def tampers_far(pr, Ls):
    FA.PROB[0] = pr; FA.LOC.clear(); FA.set_local(LOCAL_REC[KIND_OF[pr]])
    T = {"\u5199\u3057\uff08\u58ca\u3057\u3066\u3044\u306a\u3044\uff09": lambda x: None}          # key kept in Japanese (see tampers_local)
    # candidate of a type A leaf → one with lower bound < 0 on that box
    hitA = hitD = hitL = None
    for bi, r in enumerate(Ls[1:], 1):
        if r["kind"] != "ok":
            continue
        for li, lf in enumerate(r["leaves"]):
            rb = D31.RBox(lf[0], lf[1], lf[2])
            if lf[3] == "A" and hitA is None:
                for c in all_cands(pr):
                    if FA.box_lb(r["lo"], r["hi"], rb, c) < 0:
                        hitA = (bi, li, [c[0], c[1], [list(t) for t in c[2]]]); break
            if lf[3] == "D" and hitD is None:
                for k in range(len(FA.ROT_NONID)):
                    if D31.discard_lb(rb, FA.ROT_NONID[k]) <= 0:
                        hitD = (bi, li, k); break
            if lf[3] == "L" and hitL is None:
                for gi in range(24):
                    if gi != lf[4] and not FA.L_ok_idx(r["lo"], r["hi"], rb, gi):
                        hitL = (bi, li, gi); break
        if hitA and hitD and hitL:
            break

    def set_leaf(h, pos):
        return lambda x: x[h[0]]["leaves"][h[1]].__setitem__(pos, h[2])
    if hitA:
        T["candidate of type A changed to one with lower bound < 0"] = set_leaf(hitA, 4)
    if hitD:
        T["rotation of type D changed to one under which tr does not increase"] = set_leaf(hitD, 4)
    if hitL:
        T["rotation of the piece of type L changed to one not in the assigned region"] = set_leaf(hitL, 4)
    okb = [i for i, r in enumerate(Ls[1:], 1) if r["kind"] == "ok"]
    T["delete 1 n box"] = lambda x: x.pop(okb[len(okb) // 2])
    T["delete 1 R leaf"] = lambda x: x[okb[0]]["leaves"].pop(0)
    T["kind of an n box changed to out"] = lambda x: x[okb[1]].__setitem__("kind", "out")
    T["local name in the header changed to another lemma"] = lambda x: x[0].__setitem__(
        "local", LOCAL_REC["J3" if pr == "II" else "P2"])
    if pr != "II":
        T["double the assigned region of the local lemma in the header"] = lambda x: x[0]["local_box"].__setitem__("rmax", str(2 * Fr(x[0]["local_box"]["rmax"])))
        T["w_A in the header changed to w_Q"] = lambda x: x[0].__setitem__("W_A", ["1/3", "1/3", "1/3"])
    else:
        T["R* in the header changed to another direction"] = lambda x: x[0]["R_STAR"].__setitem__(0, ["2/3", "-1/3", "2/3"])
    return T


def test_W(scratch):
    res = {}
    jobs = [(f"local {k}", "d87_oct_local.py", LOCAL_REC[k], "leaves", (lambda Ls, k=k: tampers_local(k, Ls)), ["replay", k])
            for k in ("P2", "J3", "J4")]
    jobs += [(f"far ({pr})", "d87_oct_far.py", FAR_REC[pr], "boxes", (lambda Ls, pr=pr: tampers_far(pr, Ls)), ["replay", "--prob", pr, "--procs", "2"])
             for pr in ("II", "III", "IV")]
    for label, script, rec, ext, mk, args in jobs:
        L0 = load(os.path.join(HERE, f"{rec}.{ext}.jsonl.gz"))
        T = mk(L0)
        for k, (nm, fn) in enumerate(T.items()):
            x = json.loads(json.dumps(L0))
            fn(x)
            base = os.path.join(scratch, f"w_{rec}_{k}")
            save(x, f"{base}.{ext}.jsonl.gz")
            t0 = time.time()
            rc, msg = run_replay([script] + args + ["--name", base])
            for ext2 in (f".{ext}.jsonl.gz", ".replay.json"):
                if os.path.exists(base + ext2):
                    os.remove(base + ext2)
            copy = nm.startswith("\u5199\u3057")          # kept in Japanese: matches the key of the unbroken copy in tampers_local / tampers_far
            want = (rc == 0) if copy else (rc != 0)
            res[f"{label}: {nm}"] = dict(returncode=rc, msg=msg[-300:], sec=round(time.time() - t0))
            check(f"W {label}: {nm} → {'passes' if copy else 'rejected'}", want, f"[{rc}] {msg[-140:]} ({time.time()-t0:.0f} s)")
    OUT["W"] = res


# ======================= B: 4 broken copies =======================
def build_rejects(kind, opts):
    try:
        L.build(kind, tuple(opts))
        return False, "build passed"
    except RuntimeError as e:
        return True, str(e)


def rationalize_R(Rf, den=4096):
    q = C.rot_to_quat(Rf)
    return C.quat_rot([int(round(x * den)) for x in q])


def search_neg(fun, rng, n_start=40):
    """Search the minimum of fun(n, R) in floating point (preparation). Returns: (value, n, R)."""
    from scipy.optimize import minimize
    best = (np.inf, None, None)
    for _ in range(n_start):
        x0 = np.concatenate([rng.normal(size=2) * 0.3, rng.normal(size=3) * 0.6])

        def f(x):
            return fun(x)[0]
        r = minimize(f, x0, method="Nelder-Mead", options=dict(maxiter=3000, xatol=1e-10, fatol=1e-12))
        v, n, R = fun(r.x)
        if v < best[0]:
            best = (v, n, R)
    return best


def faces_until_fail(kind, opts, wmin, tlim, budget=2 * 10 ** 5):
    """Run the local faces in order and stop at the first face that does not pass (limit of subdivision or timeout)."""
    t0 = time.time(); done = []
    for f in L.faces(kind):
        r = L.run_face((kind, f, wmin, tlim, budget, tuple(opts)))
        done.append(dict(face=list(f), ev=r["ev"], leaves=len(r["leaves"]), lim=len(r["lim"]), timeout=r["timeout"], sec=r["sec"]))
        if r["lim"] or r["timeout"]:
            return dict(failed_face=list(f), faces=done, sec=round(time.time() - t0))
    return dict(failed_face=None, faces=done, sec=round(time.time() - t0))


def test_B(scratch, quick=False):
    res = {}
    rng = np.random.default_rng(87)
    # ---------- B1: w_A → w_Q ----------
    # search the minimum of G − n·w_Q of (III) near d′ in floating point → convert to rationals and check exactly
    dprime = np.array([1.0, 1.0, -1.0]) / np.sqrt(3)
    R3f = np.array([[float(x) for x in r] for r in C.R_III])

    def fIII(x):
        n = np.array([np.cos(x[0]) * np.cos(x[1]), np.sin(x[0]) * np.cos(x[1]), -abs(np.sin(x[1]))])
        n = np.array([abs(n[0]), abs(n[1]), n[2]])
        R = R3f @ C.expm_so3(x[2:5])
        return C.np_G(n, R) - n @ np.array([1 / 3] * 3), n, R
    v, nf, Rf = search_neg(fIII, rng, 30)
    nq = tuple(Fr(int(round(x * 2 ** 12)), 2 ** 12) for x in nf)
    Rq = rationalize_R(Rf)
    ex = truth("III", nq, Rq, w=WQ)
    check("B1 w_A → w_Q: the cone of (III) has a rational point with G − n·w_Q < 0 (exact)", in_cone("III", nq) and ex < 0,
          f"floating minimum {v:.4g}, exact value {float(ex):.4g} (|n|₁ = {float(sum(abs(x) for x in nq)):.3f}), n ∝ {[round(float(x), 3) for x in nq]}")
    ok_w = truth("III", nq, Rq) >= 0
    check("B1: at the same point, with w_A it is ≥ 0 (the correct version is not violated)", ok_w, f"{float(truth('III', nq, Rq)):.4g}")
    rj, msg = build_rejects("J3", [("w", "Q")])
    check("B1: building local J3 with w_Q is rejected by the identity check in build", rj, msg)
    # J4 ((IV)) need not be rejected (in table O4 of D48 section 7 only (III) needs a rejection): the base of J4 is in the direction (−1, 1, 0) of n,
    # which is orthogonal to w_A − w_Q ∝ (1, 1, 2), so the difference does not appear at first order on the base (only recorded)
    rj4, msg4 = build_rejects("J4", [("w", "Q")])
    res["B1_J4_wQ_build"] = dict(rejected=rj4, msg=msg4)
    log(f"    (record) build of local J4 with w_Q: {'rejected' if rj4 else 'passes'} ({msg4})")
    # far (III) with w_Q and without local, on the n box (1/32) containing that point
    FA.PROB[0] = "III"; FA.LOC.clear(); FA.set_local(LOCAL_REC["J3"])
    (A, B, ns, Rs), = [t for t in reduce_far("III", nq, Rq)][:1]
    w = ND >> 5
    lo = [int(A * ND) // w * w, int(B * ND) // w * w]; hi = [lo[0] + w, lo[1] + w]
    t0 = time.time()
    r = FA.task((lo, hi, 20000 if quick else 40000, 18, LOCAL_REC["J3"], {"wQ": True, "noL": True}, "III"))
    check("B1: with far (III) on w_Q (without local), the n box of that point fails", r["kind"] == "fail",
          f"box {[x / ND for x in lo]} to {[x / ND for x in hi]}, evaluations {r['ev']}, {time.time()-t0:.0f} s")
    r2 = FA.task((lo, hi, 40000, 18, LOCAL_REC["J3"], {}, "III"))
    check("B1: the same box passes with the correct version", r2["kind"] == "ok", f"evaluations {r2['ev']}")
    res["B1"] = dict(float_min=v, exact=str(ex), n=[str(x) for x in nq], R=[[str(x) for x in rr] for rr in Rq], box=[lo, hi],
                     far_ev=r["ev"])

    # ---------- B2: ŝ₀ → 8/3 + 1/1000 ----------
    S2 = C.S_HALF + Fr(1, 2000)
    eqs = [("II", (Fr(-1),) * 3, neg(C.R_STAR)), ("III", (Fr(1), Fr(1), Fr(-1)), C.R_III), ("IV", (Fr(-1), Fr(-1), Fr(1)), C.R_III)]
    vals = {pr: truth(pr, n, R, S=S2) for pr, n, R in eqs}
    vals0 = {pr: truth(pr, n, R) for pr, n, R in eqs}
    check("B2 ŝ₀ + 1/1000: G − n·w < 0 at the 3 equality points (exact), 0 with the original ŝ₀", all(v < 0 for v in vals.values()) and all(v == 0 for v in vals0.values()),
          {k: str(v) for k, v in vals.items()})
    for kd in ("P2", "J3", "J4"):
        rj, msg = build_rejects(kd, [("S", "1/2000")])
        check(f"B2: building local {kd} with ŝ₀ + 1/1000 is rejected by the identity check in build", rj, msg)
    # upper-bound side: the 9 pieces of the record do not fit if the container is shrunk by 1/1000 (ŝ₀ is the record itself, s* ≤ ŝ₀)
    import d87_oct_step0 as S0
    b = S0.check_config(C.record_config(), C.S_HALF - Fr(1, 2000))
    check("B2 (upper-bound side): with container 8/3 − 1/1000 the 9 pieces of the record do not fit", not b["ok"], f"pieces with a vertex outside {b['contain'].count(False)}")
    res["B2"] = {k: str(v) for k, v in vals.items()}

    # ---------- B3: band width 1/4 ----------
    # narrowing the local bands (assigned regions) to 1/4 (base and lateral, by a factor 1/4 around the centre 0) and re-judging the type L leaves of the far records gives failures
    # (the far records really rely on the band of the current width = the hand-over is not vacuous). The widening direction (upper limit of r set to 1/4) still passes for J3
    # (preview of 11/15: all 6 faces accepted in 32 s), so it is not a broken copy. The same type as Xu of D86 (narrowing J breaks the hand-over).
    for pr in ("II", "III", "IV"):
        kd = KIND_OF[pr]
        FA.PROB[0] = pr; FA.LOC.clear(); FA.set_local(LOCAL_REC[kd])
        lines = load(os.path.join(HERE, f"{FAR_REC[pr]}.boxes.jsonl.gz"))
        Ls = [(r, lf) for r in lines[1:] if r["kind"] == "ok" for lf in r["leaves"] if lf[3] == "L"]
        def judge():
            return sum(1 for r, lf in Ls if not FA.L_ok_idx(r["lo"], r["hi"], D31.RBox(lf[0], lf[1], lf[2]), lf[4]))
        bad0 = judge()
        q = Fr(1, 4)
        for k in ("rmax", "zmax", "U1", "S0", "S1", "Y", "T1", "L1", "L2"):
            if k in FA.LOC:
                FA.LOC[k] = FA.LOC[k] * q
        if pr != "II":
            FA.LOC["Rconds"] = [FA.Rconds_int(g) for g in FA.GR]
            FA.LOC["RcF"] = FA.Rconds_float_arrays(FA.LOC["Rconds"])
        bad1 = judge()
        check(f"B3 band width 1/4: re-judging the type L leaves of the far ({pr}) record with the region assigned to local {kd} narrowed to 1/4 gives failures"
              f" (0 with the current width)", bad0 == 0 and bad1 > 0, f"type L leaves {len(Ls)}, failures with the current width {bad0}, failures with 1/4 {bad1}")
        res[f"B3_{pr}"] = dict(L_leaves=len(Ls), bad_now=bad0, bad_quarter=bad1)
        FA.LOC.clear()

    # ---------- B4: removing the quadratic treatment of (IV) ----------
    st = faces_until_fail("J4", (("noquad", 1),), 10, 90 if quick else 180)
    check("B4 removing the quadratic treatment of (IV): local J4 without the treatment of T_c = τ²A_c has a face that does not pass", st["failed_face"] is not None, st)
    FA.PROB[0] = "IV"; FA.LOC.clear(); FA.set_local(LOCAL_REC["J4"])
    w = ND >> 5
    A, B = Fr(2, 3), Fr(1, 3)
    boxes = [([int(A * ND) // w * w - dx, int(B * ND) // w * w - dy], None) for dx in (0, w) for dy in (0, w)]
    nfail = 0; evs = []
    for lo, _ in boxes:
        hi = [lo[0] + w, lo[1] + w]
        if lo[0] + lo[1] >= ND or not (lo[0] <= A * ND <= hi[0] and lo[1] <= B * ND <= hi[1]):
            continue
        r = FA.task((lo, hi, 20000 if quick else 40000, 18, LOCAL_REC["J4"], {"noL": True}, "IV"))
        nfail += r["kind"] == "fail"; evs.append(r["ev"])
    check("B4: with far (IV) without local (noL), an n box containing d′ fails", nfail > 0, f"failures {nfail}, evaluations {evs}")
    res["B4"] = dict(local=st, far_fail=nfail)
    FA.BREAK.clear()
    OUT["B"] = res


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="X,W,P,B")
    ap.add_argument("--scratch", default=os.path.join(tempfile.gettempdir(), "d87_oct_tests"))
    ap.add_argument("--quick", action="store_true")
    a = ap.parse_args()
    os.makedirs(a.scratch, exist_ok=True)
    only = set(a.only.split(","))
    log(f"d87_oct_tests  {time.strftime('%Y-%m-%d %H:%M:%S')}  only={sorted(only)}")
    t0 = time.time()
    for nm, fn in (("X", test_X), ("P", test_P), ("B", lambda: test_B(a.scratch, a.quick)), ("W", lambda: test_W(a.scratch))):
        if nm in only:
            t1 = time.time(); log(f"== {nm}")
            fn()
            OUT.setdefault("sec", {})[nm] = round(time.time() - t1)
    OUT["fail"] = FAIL; OUT["only"] = sorted(only); OUT["total_sec"] = round(time.time() - t0)
    OUT["when"] = time.strftime("%Y-%m-%d %H:%M")
    import hashlib
    OUT["code_sha256"] = {}
    for p in ("d87_cub_common.py", "d87_oct_step0.py", "d87_oct_local.py", "d87_oct_far.py", "d87_oct_tests.py", "d31_common.py",
              "d37_tet_n05_common.py"):
        with open(os.path.join(HERE, p), "rb") as f:          # line ends converted to LF (same as d87_oct_replay_all.sha)
            OUT["code_sha256"][p] = hashlib.sha256(f.read().replace(b"\r\n", b"\n")).hexdigest()
    full = only == {"X", "W", "P", "B"} and not a.quick
    path = os.path.join(HERE, "d87_oct_tests.json" if full else "d87_oct_tests_partial.json")
    json.dump(OUT, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    log(f"done ({time.time() - t0:.0f} s), failures {FAIL} → {os.path.basename(path)}")
    sys.exit(1 if FAIL else 0)
