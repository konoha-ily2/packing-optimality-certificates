# -*- coding: utf-8 -*-
"""D47 stage 2 (L4′): far region A ((★A) on the whole chamber). Acceptance uses only integers and rationals. Floating point is used only to choose the candidates.
2026-11-14 (night), written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Based on d37_tet_n05_far.py (the tree of R, types F, M, S, D, L). d31_common (RBox, quad_lb, vcomb, discard_lb) and d37_tet_n05_common
(qmul, mat_to_q) are only imported. Differences: κ_A is a formula, so there is no k_N and no matching of pairs, and there is one tree of R per n.

■ What is shown (D47 2.2 (★A), the cell A_0, k = 1): for all n in the chamber {x ≥ y ≥ z} and all R with Š(R) < 0,
    G_A(n, R) := F̃(n, R) − κ_A(n) ≥ 0, F̃ = max_i n·Rv_i + ¼Σ_f (m̃ − n·b_f)H′_f − m̃, H′_0 = 1 + k, H′_f = H_f(R) (f ≠ 0),
    Š = H_1 + H_2 + H_3 − (3 − k), κ_A(n) = max_i n·v_i + min_i n·v_i.
  The chamber suffices: κ_A, A_0 and the container are invariant under C3v (permutations of coordinates) (D47 2.2 and 4.1; T_d invariance was checked in stage 0 (a)).
■ The map of n (the chamber by 2 triangles, T = {a, b ≥ 0, a + b ≤ 1}):
    side P (y ≥ 0): n = (1 − b, 1 − a − b, 1 − a − 2b) (the plane n·b_3 = 1. Vertices (1,1,1), (1,0,0), (0,0,−1))
    side Q (y ≤ 0): n = (a + 2b − 1, a + b − 1, b − 1) (the plane n·(−b_1) = 1. Vertices b_0, (0,0,−1), (1,0,0). Ch = {2a + 3b ≤ 2})
  G is positively homogeneous of degree 1 in n, so representatives up to positive multiples suffice. Every chamber point is a positive multiple of a point of one of the 2 triangles (x − y = b ≥ 0 etc., checked in check).
■ Candidates (types F, M): choose a face j, μ ≥ 0, a top t, vertices vs_f of H_f (f = 1..3), a vertex i of κ (the max side) and jm (the min side);
    G_c = n·Rv_t + ¼Σ_f (n·(b_j − b_f) + μ)·L_f − (n·b_j + μ) − n·v_i − n·v_jm, L_0 = 1 + k, L_f = b_f·Rv_{vs_f}.
  Correctness [reasoning, the same form as d37]: if D_j := max_f n·(b_f − b_j) ≤ μ on (n box ∩ T), then the weights are ≥ 0, 0 ≤ m̃ − n·b_j ≤ μ, and
    F̃ − [the expression with μ] = (m̃ − n·b_j − μ)·Š/4 ≥ 0 (Š ≤ 0). μ = 0 means j is the face of m̃ (independent of the sign of Š).
    It also follows without using the sign of Š (FD_d47_review2 W4): α_f := (n·b_j + μ − n·b_f)/4 is ≥ 0 if D_j ≤ μ, and Σ_f α_f b_f = −n,
    so the expression with μ is itself a weak-duality lower bound. Type M does not depend on the assumption of a "placeable R" (Š < 0).
    κ_A(n) ≤ n·v_{i*(n)} + n·v_jm (min ≤ any vertex). i*(n) is the max vertex at n, and G_c ≥ 0 is required for all of I_box, the set of i that can be the max in the box
    (all i except those that lose strictly to one other vertex at all vertices of the polygon; linear, so a correct superset).
  The expression is linear in n (with R fixed), so the minimum over the vertices of the (n box ∩ T) polygon of the lower bounds on the R box is a lower bound.
  Type S: Σ_{f=1..3} L_f − (3 − k) > 0 (Š > 0, an R not needed for configurations with s < 2, D47 2.3). Type D: for a rotation k of the piece, tr(Rk) > tr(R) (R → Rk does not change RK).
  Type L: n box ∩ T lies in the n range of J {x + y + r_n·z ≤ 0} (= Ch ∪ the band outside its edge, checked in check), and for some rotation k of the piece R k⁻¹ lies in
    the R range of J {q = (1, u·b_1 + p_1e′ + p_2e″), |u| ≤ u_J, |p_i| ≤ r_J} (at the 8 vertices of the quaternion box; a linear cone, so the vertices suffice).
    The ranges and widths of J are read from the header of the record d86_local_J* (--local), and replay also checks that this record is re-checked by the current code.
Usage: python -X utf8 d86_far.py run [--local d86_local_J_wide] [--procs 12] [--name d86_far_A] [--sample K] / replay [--name …] / check
"""
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d86_common as C
K = C.K_DEF                     # threshold k of the cell (H′_0 = 1 + k, Š = H_1 + H_2 + H_3 − (3 − k). The hard-coded 2 was removed in FD_d47_review2 G1)
import d31_common as D31                       # only imported: RBox, quad_lb, vcomb, discard_lb
from d31_common import DEN
import d37_tet_n05_common as D37C              # only imported: qmul, mat_to_q

ND = 2 ** 30
MUS = (1, 2, 3, 4, 6, 12)
MUD = 64
VT2 = tuple(tuple(-x for x in b) for b in C.B)          # 2·v_i (integers)
B = C.B
NF = {"P": ((1, 0, -1), (1, -1, -1), (1, -1, -2)), "Q": ((-1, 1, 2), (-1, 1, 1), (-1, 0, 1))}   # n_l = c0 + ca·a + cb·b
FACES = {"P": (3,), "Q": (0, 3)}
SIDES = ("P", "Q")


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def dot(a, b):
    return sum(x * y for x, y in zip(a, b))


# ---------------- rotation group of the piece (12 elements, integer matrices) ----------------
def piece_rots():
    out = []
    for p in itertools.permutations(range(3)):
        for sg in itertools.product((1, -1), repeat=3):
            M = [[sg[i] if p[i] == j else 0 for j in range(3)] for i in range(3)]
            if D31.det3i(M) != 1:
                continue
            img = sorted(tuple(sum(M[i][j] * v[j] for j in range(3)) for i in range(3)) for v in VT2)
            if img == sorted(VT2):
                out.append(M)
    need(len(out) == 12, "the rotation group of the piece does not have 12 elements")
    return out


PROT = piece_rots()
I3 = [[1, 0, 0], [0, 1, 0], [0, 0, 1]]
PROT_NONID = [k for k in PROT if k != I3]
ROTF = np.array(PROT_NONID, float)
KQBAR = []
for _k in PROT:
    _q = D37C.mat_to_q(_k)
    KQBAR.append((Fr(_q[0]), -Fr(_q[1]), -Fr(_q[2]), -Fr(_q[3])))

# ---------------- ranges of local J (from the header of the record) ----------------
LOC = {}
BREAK = {}                      # test-only breakages: noL (do not use L), shift (subtract δ·(the linear form of the map plane = 1) from G_c)


def set_local(name):
    with gzip.open(os.path.join(HERE, f"{name}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        hd = json.loads(f.readline())
    need(hd["region"] == "J" and hd.get("opts", []) == [], "the local record is not J, or is a test copy")
    need(hd["K"] == str(C.K_DEF) and hd["E1"] == list(C.E1) and hd["E2"] == list(C.E2), "premises of the local record")
    LOC.update(name=name, r_J=Fr(hd["scale"]), r_n=Fr(hd["R_N"]), u_J=Fr(hd["U_J"]))


# ---------------- n box ∩ T (exact) ----------------
def poly_T(lo, hi):
    pts = [(Fr(a), Fr(b)) for a in (lo[0], hi[0]) for b in (lo[1], hi[1]) if a + b <= ND]
    for a in (lo[0], hi[0]):
        b = ND - a
        if lo[1] < b < hi[1]:
            pts.append((Fr(a), Fr(b)))
    for b in (lo[1], hi[1]):
        a = ND - b
        if lo[0] < a < hi[0]:
            pts.append((Fr(a), Fr(b)))
    return pts


def nval(side, a, b):
    a = Fr(a) / ND; b = Fr(b) / ND
    return tuple(Fr(f[0]) + f[1] * a + f[2] * b for f in NF[side])


_PC = {}


def poly_n(side, lo, hi):
    key = (side, tuple(lo), tuple(hi))
    r = _PC.get(key)
    if r is None:
        if len(_PC) > 5000:
            _PC.clear()
        pts = poly_T(lo, hi)
        r = _PC[key] = (pts, [nval(side, a, b) for a, b in pts])
    return r


def D_face(side, j, lo, hi):
    pts, ns = poly_n(side, lo, hi)
    return max(max(dot(n, [B[f][l] - B[j][l] for l in range(3)]) for f in range(4)) for n in ns) if ns else None


def face_opts(side, lo, hi):
    out = []
    for j in FACES[side]:
        D = D_face(side, j, lo, hi)
        if D is None:
            continue
        mus = [Fr(0)] if D <= 0 else []
        mus += [Fr(m) for m in MUS if m >= D]
        if D > 0:
            md = Fr(math.ceil(D * MUD), MUD)
            if md not in mus:
                mus.append(md)
        out.extend((j, m) for m in mus)
    return out


def valid_opt(side, lo, hi, j, mu):
    if j not in FACES[side] or mu < 0:
        return False
    D = D_face(side, j, lo, hi)
    return D is not None and D <= mu


def I_box(side, lo, hi):
    """The i that can be max_i n·v_i in the box (a superset)."""
    pts, ns = poly_n(side, lo, hi)
    out = []
    for i in range(4):
        beaten = any(all(dot(n, VT2[l]) > dot(n, VT2[i]) for n in ns) for l in range(4) if l != i)
        if not beaten:
            out.append(i)
    return out


# ---------------- candidate expressions ----------------
def cand_forms(side, cand):
    """The L (rational (c0, ca, cb)) of |q|²·G_c = Σ M_{l,m}·L_{l,m}(a,b) + |q|²·L_Q(a,b).
    cand = ("F"/"M", j, μ, top, vs, i, jm) or ("S", vs). vs = (vs_1, vs_2, vs_3)."""
    n = [tuple(Fr(x) for x in f) for f in NF[side]]
    L = {}
    one = (Fr(1), Fr(0), Fr(0))

    def add(key, f, s):
        a = L.get(key, (Fr(0),) * 3); L[key] = tuple(a[t] + s * f[t] for t in range(3))

    def lin_dot(w):
        return tuple(sum(n[l][t] * w[l] for l in range(3)) for t in range(3))

    def add_bRv(wf, bvec, vi, s):          # wf(n)·(b·R v_vi)·|q|² = Σ_{l,m} b_l M_{l,m} v_m
        for l in range(3):
            for m in range(3):
                c = Fr(bvec[l] * VT2[vi][m], 2)
                if c:
                    add((l, m), wf, s * c)
    if cand[0] == "S":
        vs = cand[1]
        for f in (1, 2, 3):
            add_bRv(one, B[f], vs[f - 1], Fr(1))
        add("Q", one, -(3 - K))
        return L
    typ, j, mu, top, vs, i, jm = cand
    mu = Fr(mu)
    for l in range(3):
        for m in range(3):
            c = Fr(VT2[top][m], 2)
            if c:
                add((l, m), n[l], c)
    for f in range(4):
        w = lin_dot([B[j][t] - B[f][t] for t in range(3)])
        w = (w[0] + mu, w[1], w[2])
        if w == (0, 0, 0):
            continue
        if f == 0:
            add("Q", w, (1 + K) / 4)
        else:
            add_bRv(w, B[f], vs[f - 1], Fr(1, 4))
    nbj = lin_dot(B[j])
    nvi = lin_dot([Fr(x, 2) for x in VT2[i]])
    nvj = lin_dot([Fr(x, 2) for x in VT2[jm]])
    qf = tuple(-nbj[t] - nvi[t] - nvj[t] - (mu if t == 0 else 0) - (BREAK.get("shift", 0) if t == 0 else 0) for t in range(3))
    add("Q", qf, 1)
    return L


def int_forms(L):
    den = 1
    for v in L.values():
        for x in v:
            den = den * x.denominator // math.gcd(den, x.denominator)
    return {k: tuple(int(x * den) for x in v) for k, v in L.items()}


_FC = {}


def forms_cached(side, cand):
    key = (side, cand)
    r = _FC.get(key)
    if r is None:
        if len(_FC) > 50000:
            _FC.clear()
        r = _FC[key] = int_forms(cand_forms(side, cand))
    return r


def box_lb(side, nlo, nhi, rb, cand):
    """A lower bound (an integer; of a positive multiple) of the candidate expression on (n box ∩ T) × R box. Linear in n, so the minimum over the vertices of the polygon."""
    L = forms_cached(side, cand)
    pts, _ = poly_n(side, nlo, nhi)
    if cand[0] == "S":
        pts = pts[:1]
    best = None
    for av, bv in pts:
        need(av.denominator == 1 and bv.denominator == 1, "polygon vertices are integers in units of ND")
        terms = []
        for key, f in L.items():
            c = f[0] * ND + f[1] * int(av) + f[2] * int(bv)
            terms.append((c, rb.Q if key == "Q" else rb.M[key[0]][key[1]]))
        v = D31.quad_lb(D31.vcomb(terms))
        best = v if best is None else min(best, v)
    return best


# ---------------- region L of local J ----------------
def jfun(n):
    return n[0] + n[1] + LOC["r_n"] * n[2]


def n_in_J(side, lo, hi):
    _, ns = poly_n(side, lo, hi)
    return bool(ns) and all(jfun(n) <= 0 for n in ns)


def n_overlaps_J(side, lo, hi):
    _, ns = poly_n(side, lo, hi)
    return bool(ns) and min(jfun(n) for n in ns) < 0


def _verts(ch, lo, hi):
    out = []
    for a in (lo[0], hi[0]):
        for b in (lo[1], hi[1]):
            for c in (lo[2], hi[2]):
                q = [a, b, c]; q.insert(ch, DEN)
                out.append(q)
    return out


def r_in_J(ch, lo, hi, qkbar):
    """At the 8 vertices q, w = q ⊗ q̄_k (the quaternion of R k⁻¹) has the form w₀·(1, u·b_1 + p_1e′ + p_2e″) with |u| ≤ u_J, |p_i| ≤ r_J (all w₀ of the same sign).
    b_1, e′, e″ are orthogonal, so u = w⃗·b_1/(3w₀), p_1 = w⃗·e′/(2w₀), p_2 = w⃗·e″/(6w₀)."""
    uJ, rJ = LOC["u_J"], LOC["r_J"]
    for sg in (1, -1):
        ok = True
        for q in _verts(ch, lo, hi):
            w = D37C.qmul(tuple(Fr(x) for x in q), qkbar)
            w0 = sg * w[0]
            if w0 <= 0:
                ok = False; break
            wv = [sg * w[1], sg * w[2], sg * w[3]]
            if not (abs(dot(wv, B[1])) <= 3 * uJ * w0 and abs(dot(wv, C.E1)) <= 2 * rJ * w0 and abs(dot(wv, C.E2)) <= 6 * rJ * w0):
                ok = False; break
        if ok:
            return True
    return False


def in_L(side, nlo, nhi, ch, lo, hi):
    if BREAK.get("noL") or not n_in_J(side, nlo, nhi):
        return None
    for ik, qkb in enumerate(KQBAR):
        if r_in_J(ch, lo, hi, qkb):
            return ik
    return None


# ---------------- floating point (only for choosing the candidates) ----------------
BF = C.BF; VF = C.VF


def nfloat(side, a, b):
    return np.array([f[0] + f[1] * a + f[2] * b for f in NF[side]], float)


def gval_f(nf, X, j, mu, kap):
    H = (X @ BF.T).max(0); H[0] = float(1 + K)
    w = nf @ (BF[j] - BF).T + mu
    return (X @ nf).max() + 0.25 * (w * H).sum() - (nf @ BF[j]) - mu - kap


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", ROTF, Rf) - np.trace(Rf)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if D31.discard_lb(rb, PROT_NONID[o]) > 0:
            return int(o)
    return None


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda a: (w[a], -a)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def accept_box(side, nlo, nhi, rb, Rf, nf, opts, Ib, jm):
    """Return the acceptable candidates (type S, or F/M for all of I_box)."""
    X = VF @ Rf.T
    top = int(np.argmax(X @ nf))
    vs = tuple(int(np.argmax(X @ BF[f])) for f in (1, 2, 3))
    if (X @ BF.T).max(0)[1:].sum() - float(3 - K) > 0:
        cand = ("S", vs)
        if box_lb(side, nlo, nhi, rb, cand) > 0:
            return ["S", list(vs)]
    pv = VF @ nf
    kap = pv.max() + pv[jm]
    vals = sorted(((gval_f(nf, X, j, float(mu), kap), j, mu) for j, mu in opts), key=lambda t: -t[0])
    for v, j, mu in vals[:3]:
        typ = "F" if mu == 0 else "M"
        if all(box_lb(side, nlo, nhi, rb, (typ, j, mu, top, vs, i, jm)) >= 0 for i in Ib):
            return [typ, j, [mu.numerator, mu.denominator], top, list(vs), jm]
    return None


def rtree(side, nlo, nhi, budget, wmin_exp, allowL):
    leaves = []; ev = 0
    ac = (nlo[0] + nhi[0]) / 2 / ND; bc = (nlo[1] + nhi[1]) / 2 / ND
    if ac + bc > 1:
        ac, bc = ac / (ac + bc), bc / (ac + bc)
    nf = nfloat(side, ac, bc)
    opts = face_opts(side, nlo, nhi)
    Ib = I_box(side, nlo, nhi)
    jm = int(np.argmin(VF @ nf))
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                Lk = in_L(side, nlo, nhi, ch, lo, hi)
                if Lk is not None:
                    leaves.append([ch, lo, hi, "L", Lk]); continue
            ev += 1
            if ev > budget:
                return None, ev
            q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
            Rf = C.rot_f(q)
            rb = D31.RBox(ch, lo, hi)
            m = discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            c = accept_box(side, nlo, nhi, rb, Rf, nf, opts, Ib, jm)
            if c is not None:
                leaves.append([ch, lo, hi, "A", c]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a_, b_ in split3(lo, hi):
                nxt.append((ch, a_, b_))
        cur = nxt
    return leaves, ev


def task(args):
    side, lo, hi, budget, wmin_exp, local, brk = args
    if not LOC:
        set_local(local)
    BREAK.clear(); BREAK.update(brk)
    t0 = time.time()
    allowL = n_in_J(side, lo, hi)
    leaves, ev = rtree(side, lo, hi, budget, wmin_exp, allowL)
    if leaves is None:
        return dict(kind="fail", side=side, lo=lo, hi=hi, ev=ev, sec=time.time() - t0)
    return dict(kind="ok", side=side, lo=lo, hi=hi, leaves=leaves, Ib=I_box(side, lo, hi), ev=ev, sec=time.time() - t0)


def is_out(lo, hi):
    # A box with a + b ≥ 1 holds only 1 point of T (a corner on a + b = 1), and that point is held by the left neighbouring box (boxes include their boundary) (FD_d47_review2 W2).
    return lo[0] + lo[1] >= ND


JSPLIT_EXP = 8          # boxes crossing the boundary of the J range (an oblique line) are split down to width 1/2⁸, beyond that tried without L (margin ≈ (3/4)r_n at the boundary)


def must_split(side, lo, hi, forced):
    w = max(h - l for l, h in zip(lo, hi))
    if w > forced:
        return True
    if w > (ND >> JSPLIT_EXP) and n_overlaps_J(side, lo, hi) and not n_in_J(side, lo, hi):
        return True
    return False


def header():
    hd = dict(kind="root", prob="A", ND=ND, DEN=DEN, K=str(C.K_DEF), local=LOC["name"], r_J=str(LOC["r_J"]),
                r_n=str(LOC["r_n"]), u_J=str(LOC["u_J"]), NF={k: [list(f) for f in v] for k, v in NF.items()})
    if BREAK:
        hd["brk"] = {k: str(v) for k, v in BREAK.items()}
    return hd


def run(name, local, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=4, njmin=None):
    from multiprocessing import Pool
    set_local(local)
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    types = {}
    cur = [(s, [0, 0], [ND, ND]) for s in SIDES]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    rng = np.random.default_rng(0)
    while cur:
        todo = []; nxt = []
        for side, lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", side=side, lo=lo, hi=hi)) + "\n")
                continue
            if must_split(side, lo, hi, forced):
                nxt.extend((side, a_, b_) for a_, b_ in split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((side, lo, hi, budget, wmin_exp, local, dict(BREAK)))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample:
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for lf in r["leaves"]:
                    stats["leaves"][lf[3]] = stats["leaves"].get(lf[3], 0) + 1
                    if lf[3] == "A":
                        c = lf[4]
                        t = c[0] + ("" if c[0] == "S" else f"{c[1]}" + ("" if c[2][0] == 0 else "μ"))
                        types[t] = types.get(t, 0) + 1
                if out:
                    out.write(json.dumps(dict(kind="ok", side=r["side"], lo=r["lo"], hi=r["hi"], leaves=r["leaves"])) + "\n")
            else:
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin) or sample:
                    stats["n_X"] += 1
                    stats["X_boxes"].append([r["side"], [v / ND for v in r["lo"]], [v / ND for v in r["hi"]], r["ev"]])
                    if out:
                        out.write(json.dumps(dict(kind="X", side=r["side"], lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend((r["side"], a_, b_) for a_, b_ in split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r.get("sec", 0) for r in res]
        nok = sum(1 for r in res if r["kind"] == "ok")
        stats["levels"].append([level, len(cur), len(todo), nok])
        print(f"n level {level}: boxes {len(cur)}, tried {len(todo)}, passed {nok}, at limit {stats['n_X']}, "
              f"evaluated in total {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(side=r["side"], lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]],
                                            kind=r["kind"], ev=r.get("ev"), sec=round(r.get("sec", 0), 2)) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            stats["open_boxes"] = [[s, [v / ND for v in lo], [v / ND for v in hi]] for s, lo, hi in cur[:400]]
            break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["types"] = types
    stats["seconds"] = round(time.time() - t0, 1)
    stats["passed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp, local=local)
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: passed {stats['passed']}, n boxes ok {stats['n_ok']}, out {stats['n_out']}, at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, types {types}, evaluated {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    """Re-check from the record only (no floating point): the covering trees of n and R, the judgements of accept, S, discard and L, the correctness of the faces, μ and I_box, the premises of the local record."""
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    set_local(lines[0]["local"])
    need("brk" not in lines[0] and not BREAK, "the record must not contain test-only breakages")
    need(lines[0] == json.loads(json.dumps(header())), "premises of the record")
    check_map()
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (r["side"], tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box twice"); nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "boxes at the split limit remain")
    for key, r in nleaves.items():
        side, lo, hi = r["side"], r["lo"], r["hi"]
        if r["kind"] == "out":
            need(is_out(lo, hi), "out box"); continue
        allowL = n_in_J(side, lo, hi)
        Ib = I_box(side, lo, hi)
        vcache = {}; rl = set()
        for lf in r["leaves"]:
            ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
            kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box twice"); rl.add(kk)
            rb = D31.RBox(ch, rlo, rhi)
            if kind == "A":
                c = lf[4]
                if c[0] == "S":
                    vs = tuple(c[1])
                    ok = len(vs) == 3 and all(v in range(4) for v in vs) and box_lb(side, lo, hi, rb, ("S", vs)) > 0
                else:
                    typ, j, mu, top, vs, jm = c[0], c[1], Fr(c[2][0], c[2][1]), c[3], tuple(c[4]), c[5]
                    vk = (j, mu)
                    if vk not in vcache:
                        vcache[vk] = valid_opt(side, lo, hi, j, mu)
                    ok = (typ in ("F", "M") and (typ == "F") == (mu == 0) and vcache[vk] and top in range(4) and jm in range(4)
                          and len(vs) == 3 and all(v in range(4) for v in vs)
                          and all(box_lb(side, lo, hi, rb, (typ, j, mu, top, vs, i, jm)) >= 0 for i in Ib))
            elif kind == "D":
                ok = 0 <= lf[4] < len(PROT_NONID) and D31.discard_lb(rb, PROT_NONID[lf[4]]) > 0
            elif kind == "L":
                ok = allowL and 0 <= lf[4] < len(KQBAR) and r_in_J(ch, rlo, rhi, KQBAR[lf[4]])
            else:
                ok = False
            cnt[kind] += 1; cnt["bad"] += (not ok)
        dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
        cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
        while cur:
            need(len(cur) <= len(rl) - seen, "hole in the covering (a box without leaves)")   # in a correct tree, each box of each stage contains at least 1 leaf not yet seen
            need(depth <= dmax, "a branch that does not reach the R leaves"); depth += 1
            nxt = []
            for ch, a, b in cur:
                if (ch, tuple(a), tuple(b)) in rl:
                    seen += 1; continue
                nxt.extend((ch, p, q) for p, q in split3(a, b))
            cur = nxt
        need(seen == len(rl), "covering of the R tree")
    need(cnt["bad"] == 0, f"failed {cnt['bad']}")
    for side in SIDES:
        mine = {(k[1], k[2]) for k in nleaves if k[0] == side}
        dmax = max(sum(round(math.log2(ND / (h - l))) for l, h in zip(lo, hi)) for lo, hi in mine)
        cur = [([0, 0], [ND, ND])]; seen = 0; depth = 0
        while cur:
            need(len(cur) <= len(mine) - seen, "hole in the covering (a box without leaves)")   # in a correct tree, each box of each stage contains at least 1 leaf not yet seen
            need(depth <= dmax, "a branch that does not reach the n leaves"); depth += 1
            nxt = []
            for lo, hi in cur:
                if (tuple(lo), tuple(hi)) in mine:
                    seen += 1; continue
                nxt.extend(split2(lo, hi))
            cur = nxt
        need(seen == len(mine), f"covering of the n tree (side {side})")
    print(f"re-check {name}: n boxes ok {cnt['ok']}, out {cnt['out']}; R leaves accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}; "
          f"failed 0, covering tree OK, {time.time()-t0:.0f} s", flush=True)
    # also re-check the local record (with the same widths)
    import subprocess
    env = dict(os.environ); env["D86_R_N"] = str(LOC["r_n"]); env["D86_U_J"] = str(LOC["u_J"])
    rr = subprocess.run([sys.executable, "-X", "utf8", os.path.join(HERE, "d86_local.py"), "replay", "J", "--name", LOC["name"]],
                        cwd=HERE, env=env, capture_output=True, text=True, encoding="utf-8")
    need(rr.returncode == 0, "re-check of the local record failed: " + rr.stdout[-400:] + rr.stderr[-400:])
    print("local: " + rr.stdout.strip().splitlines()[-1], flush=True)
    return cnt


def check_map():
    """Premises of the map (exact): (1) every chamber point is a positive multiple of a point of side P or Q, (2) on side P m̃ = n·b_3, (3) the formula of the n range of J, (4) the 12 rotations of the piece."""
    # (1) side P: n·b_3 = 1, y = 1 − a − b ≥ 0, x − y = a ≥ 0, y − z = b ≥ 0. Side Q: n·(−b_1) = 1, y ≤ 0, x − y = b, y − z = a.
    for side, w, sy in (("P", B[3], 1), ("Q", tuple(-x for x in B[1]), -1)):
        for a, b in ((0, 0), (ND, 0), (0, ND)):
            n = nval(side, a, b)
            need(dot(n, w) == 1, "plane of the map")
            need(n[0] >= n[1] >= n[2] and sy * n[1] >= 0, "a vertex of the map is outside the half of the chamber")
    # Conversely: a point n of chamber ∩ {y ≥ 0} has n·b_3 > 0, and n/(n·b_3) lies in T of side P (x + y − z ≥ x − z ≥ 0, with = 0 only for n = 0).
    #   Solving n/(n·b_3) = (1 − b, 1 − a − b, 1 − a − 2b) gives b = 1 − x′, a = x′ − y′ (x′ = x/(n·b_3) …), with a, b ≥ 0 and a + b = 1 − y′ ≤ 1.
    #   The same for chamber ∩ {y ≤ 0} (n·(−b_1) = x − y − z > 0). Checked at random rational points.
    rng = np.random.default_rng(2)
    for _ in range(300):
        v = sorted((Fr(int(t), 97) for t in rng.integers(-97, 98, 3)), reverse=True)
        if v == [0, 0, 0]:
            continue
        side, w = ("P", B[3]) if v[1] >= 0 else ("Q", tuple(-x for x in B[1]))
        s = dot(v, w); need(s > 0, "scale factor of a chamber point")
        x, y, z = (t / s for t in v)
        if side == "P":
            b = 1 - x; a = x - y
        else:
            b = x - y; a = y - z
        need(a >= 0 and b >= 0 and a + b <= 1, "the inverse map is outside T")
        need(nval(side, a * ND, b * ND) == (x, y, z), "inverse map")
    # (2) m̃ of side P: n·b_3 = 1 ≥ n·b_f at the vertices of T (linear)
    for a, b in ((0, 0), (ND, 0), (0, ND)):
        n = nval("P", a, b)
        need(all(dot(n, B[3]) >= dot(n, B[f]) for f in range(4)), "m̃ of side P")
    # (3) range of J: x + y + r_n z ≤ 0 and in the chamber ⇔ (h, k′) = the image in the plane z = −1 has h ≥ −r_n, k′ ≥ 0, h + 2k′ ≤ 2 (the range of d86_local)
    for _ in range(300):
        v = sorted((Fr(int(t), 97) for t in rng.integers(-97, 98, 3)), reverse=True)
        if jfun(v) > 0 or v == [0, 0, 0]:
            continue
        need(v[2] < 0, "z < 0 on the range of J")
        x, y = v[0] / -v[2], v[1] / -v[2]
        kp = 1 + y; h = 1 - kp - x
        need(h >= -LOC["r_n"] and kp >= 0 and h + 2 * kp <= 2, "image of the range of J")
        need(h >= 0 and kp <= 1 or (h <= 0 and kp <= 1 + LOC["r_n"] / 2), "lies in a root box of J")
    return True


def check():
    set_local("d86_local_J_wide" if os.path.exists(os.path.join(HERE, "d86_local_J_wide.leaves.jsonl.gz")) else "d86_local_J")
    check_map()
    print("premises of the map OK")
    rng = np.random.default_rng(1)
    # compare the candidate expressions with floating F̃ − κ_A (equality when the true vertex and face are chosen, ≤ for every candidate)
    worst_eq = 0; worst_le = -1e9
    for _ in range(400):
        side = SIDES[int(rng.integers(2))]
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        lo = [int(a * ND) & ~1, int(b * ND) & ~1]; hi = [lo[0] + 2, lo[1] + 2]
        nf = nfloat(side, lo[0] / ND, lo[1] / ND)
        q = rng.normal(size=4); q /= np.linalg.norm(q); Rf = C.rot_f(q)
        X = VF @ Rf.T
        H = (X @ BF.T).max(0)
        if H[1:].sum() - float(3 - K) > 0:
            continue
        nb = BF @ nf; m = nb.max(); Hp = H.copy(); Hp[0] = float(1 + K)
        Ft = (X @ nf).max() + ((m - nb) * Hp).sum() / 4 - m
        pv = VF @ nf; G = Ft - pv.max() - pv.min()
        top = int(np.argmax(X @ nf)); vs = tuple(int(np.argmax(X @ BF[f])) for f in (1, 2, 3))
        i = int(np.argmax(pv)); jm = int(np.argmin(pv))
        j = int(np.argmax(nb)) if side == "Q" else 3
        for jj, mu in face_opts(side, lo, hi):
            Lf = cand_forms(side, ("F" if mu == 0 else "M", jj, mu, top, vs, i, jm))
            M = np.array(C.Mq(*q)); Q = 1.0
            val = sum((float(f[0]) + float(f[1]) * lo[0] / ND + float(f[2]) * lo[1] / ND) * (Q if k == "Q" else M[k[0]][k[1]])
                      for k, f in Lf.items())
            worst_le = max(worst_le, val - G)
            if jj == j and mu == 0:
                worst_eq = max(worst_eq, abs(val - G))
    print(f"candidate expression − true value: deviation in the equality cases {worst_eq:.2e}, maximum {worst_le:.2e} (a lower bound if ≤ 1e−9)")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d86_far_A"); ap.add_argument("--local", default="d86_local_J_wide")
    ap.add_argument("--procs", type=int, default=12); ap.add_argument("--nmin", type=int, default=14)
    ap.add_argument("--budget", type=int, default=40000); ap.add_argument("--wmin-exp", type=int, default=18)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    ap.add_argument("--forced-exp", type=int, default=4)
    ap.add_argument("--break-noL", action="store_true"); ap.add_argument("--break-shift", default=None)
    a = ap.parse_args()
    if a.break_noL:
        BREAK["noL"] = True
    if a.break_shift:
        BREAK["shift"] = Fr(a.break_shift)
    if a.cmd == "run":
        st = run(a.name, a.local, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit, a.forced_exp)
        sys.exit(0 if st["passed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
    elif a.cmd == "check":
        check()
