# Q99: the far verifier of tetintet_n05 (exact numbers, acceptance by integers only). It reuses the form of d40_far.py (tetintet_n02, route Y) as it is.
# 2026-11-13 night, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# The existing d40_*, d31_* and d37_tet_n05_common/local are only read (not changed).
#
# Coordinates of n: (a, b) ∈ T := {a, b ≥ 0, a + b ≤ 1} of NOTES_d37 7.1. Side A has n = n_A(a, b), side B has σn = n_B(a, b) (the same coordinates).
# For each box N of n there are 2 trees of R: side A: F̃(n_A, R) ≥ κ_N, side B: F̃(n_B, R) ≥ −κ_N, κ_N(a, b) = κ̃(a, b) + k_N
#   (κ̃ = 1 − a − (7/4)b, k_N is a rational constant for each box, and 0 for the boxes meeting the range N₁ of n of the local tube).
#   Then with κ(n_A) := κ_N, κ(n_B) := −κ_N (on a + b = 1 it has the form max(κ̃(n), −κ̃(σn)), NOTES_d37 7.1) we get κ(n) + κ(σn) ≥ 0.
# Candidates (types F, M): choose a face j and μ ≥ 0, and
#   G_c = n·Rṽ_top + ¼Σ_f (n·(b_j − b_f) + μ)·L_f − (s₀/2) n·b_j − μs₀/2 ∓ κ_N, L_f = b_f·Rṽ_{v_f} (for f = 3 the constant 1 is also allowed).
#   Correctness [my own reasoning]: if D_j := max_f n·(b_f − b_j) ≤ μ on the box ∩ T, then the weights are ≥ 0 and 0 ≤ m̃ − n·b_j ≤ μ.
#   F̃ = E_j + (m̃ − n·b_j)Š/4 (an identity, E_j is the expression with m̃ replaced by n·b_j), so at a point with Š ≤ 0, F̃ ≥ E_j + (μ/4)Š ≥ G_c ± κ.
#   If μ = 0 (D_j ≤ 0, j is the face of m̃) it does not depend on the sign of Š. Side A has j = 0 (m̃ = n·b_0 on the whole of T).
#   Side B has j = 3 for 2a + 3b ≤ 2, j = 0 for ≥ 2, and a box that straddles uses type M with μ ≥ D_j (NOTES_d37 7.6 (ii)).
# Type S: Σ_f L_f − 2s₀ > 0 (Š > 0, an R that T4̃ does not need, the note of NOTES_d37 7.4). Type D: a piece rotation k with tr(Rk) > tr(R).
# Type L: (box of n, box of R) enters the region of the local lemma (around the 5 centres of d37_tet_n05_local).
# Usage: python -X utf8 d37_tet_n05_far.py run [--procs 3] [--name d37_tet_n05_far] [--sample K] / replay [--name ...] / check
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d37_tet_n05_common as C
import d31_common as D31                      # only loads RBox, quad_lb, vcomb, discard_lb
from d31_common import DEN

ND = 2 ** 30
KDEN = 2 ** 24
MUS = (1, 2, 3, 4, 6, 12)
MUD = 64                                      # denominator when rounding μ up from D_j
CONST = "c"
S0 = C.S0
PROT_NONID = [[[int(x) for x in r] for r in k] for k in C.PROT if k != C.I3]
ROTF = np.array(PROT_NONID, float)
NF = {"A": ((1, -1, -1), (1, 0, -1), (1, -1, -2)), "B": ((-1, 1, 1), (-1, 1, 2), (-1, 0, 1))}   # n_l = c0 + ca·a + cb·b
FACES = {"A": (0,), "B": (3, 0)}


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


_K = {}


def consts():
    if not _K:
        # The local side B (T_C) fixes m̃ to the face b_3. This is correct only in the range 2a + 3b ≤ 2, so check that the range of the tube lies inside it
        # (with R0 = 1/8, 2·7/8 + 3/8 > 2, and the local tests W and R3 broke on T_C. 11/14)
        need(2 * C.A_MAX + 3 * C.R0 <= 2, "the local tube sticks out of 2a + 3b ≤ 2 (R0 is too large)")
        a0, a1, beta = C.kappa_coefs()
        _K.update(a0=a0, a1=a1, beta=beta, cen=C.centers())
    return _K


# ---------------- box of n ∩ T and the choice of the face (exact) ----------------
def poly_T(lo, hi):
    """Vertices of the box [lo, hi] (in ND units) ∩ T (Fraction, in ND units)."""
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
    """n (rational, from a, b in ND units)."""
    a = Fr(a) / ND; b = Fr(b) / ND
    return tuple(Fr(f[0]) + f[1] * a + f[2] * b for f in NF[side])


def D_face(side, j, lo, hi):
    """max_f n·(b_f − b_j) over the box ∩ T (rational)."""
    best = None
    for a, b in poly_T(lo, hi):
        n = nval(side, a, b)
        v = max(sum(n[l] * (C.BS[f][l] - C.BS[j][l]) for l in range(3)) for f in range(4))
        best = v if best is None else max(best, v)
    return best


def face_opts(side, lo, hi):
    """[(j, μ)] (μ is a Fraction). μ = 0 only when D_j ≤ 0."""
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


# ---------------- formulas of the candidates ----------------
def cand_forms(side, cand, kN):
    """The L of the candidate cand's |q|²·(formula) = Σ M_{l,i}·L_{l,i}(a,b) + |q|²·L_Q(a,b) (rational (c0, ca, cb)).
    cand = ("F"/"M", j, μ, top, vs) or ("S", None, None, None, vs). vs[f] is a vertex index or "c" (the constant 1 for f = 3)."""
    K = consts()
    typ, j, mu, top, vs = cand
    n = [tuple(Fr(x) for x in f) for f in NF[side]]
    L = {}
    one = (Fr(1), Fr(0), Fr(0))

    def add(key, f, s):
        a = L.get(key, (Fr(0),) * 3); L[key] = tuple(a[t] + s * f[t] for t in range(3))

    def lin_dot(w):
        return tuple(sum(n[l][t] * w[l] for l in range(3)) for t in range(3))
    if typ == "S":
        for f in range(4):
            if vs[f] == CONST:
                need(f == C.JCELL, "the constant is only for f = 3"); add("Q", one, Fr(1)); continue
            for l in range(3):
                for i in range(3):
                    c = Fr(C.BS[f][l] * C.VT[vs[f]][i], 2)
                    if c:
                        add((l, i), one, c)
        add("Q", one, -2 * S0)
        return L
    mu = Fr(mu)
    for l in range(3):
        for i in range(3):
            c = Fr(C.VT[top][i], 2)
            if c:
                add((l, i), n[l], c)
    for f in range(4):
        w = lin_dot([C.BS[j][t] - C.BS[f][t] for t in range(3)])
        w = (w[0] + mu, w[1], w[2])
        if w == (0, 0, 0):
            continue
        if vs[f] == CONST:
            need(f == C.JCELL, "the constant is only for f = 3"); add("Q", w, Fr(1, 4)); continue
        for l in range(3):
            for i in range(3):
                c = Fr(C.BS[f][l] * C.VT[vs[f]][i], 8)
                if c:
                    add((l, i), w, c)
    nbj = lin_dot(C.BS[j])
    kap = (K["a0"] + kN, K["a1"], K["beta"])
    sg = -1 if side == "A" else 1
    qf = tuple(-S0 / 2 * nbj[t] + (-mu * S0 / 2 if t == 0 else 0) + sg * kap[t] for t in range(3))
    add("Q", qf, 1)
    return L


def int_forms(L):
    den = 1
    for v in L.values():
        for x in v:
            den = den * x.denominator // math.gcd(den, x.denominator)
    return {k: tuple(int(x * den) for x in v) for k, v in L.items()}, den


_FC = {}


def forms_cached(side, cand, kN):
    key = (side, cand, kN)
    r = _FC.get(key)
    if r is None:
        if len(_FC) > 20000:
            _FC.clear()
        r = _FC[key] = int_forms(cand_forms(side, cand, kN))[0]
    return r


def box_lb(nlo, nhi, rb, side, cand, kN):
    """A lower bound (integer) of a positive multiple of the candidate's formula over a box of n × a box of R. The formula is linear in (a, b), so take the minimum at the 4 corners of the box."""
    L = forms_cached(side, cand, kN)
    best = None
    corners = [(nlo[0], nlo[1])] if cand[0] == "S" else [(a, b) for a in (nlo[0], nhi[0]) for b in (nlo[1], nhi[1])]
    for av, bv in corners:
        terms = []
        for key, f in L.items():
            c = f[0] * ND + f[1] * av + f[2] * bv
            terms.append((c, rb.Q if key == "Q" else rb.M[key[0]][key[1]]))
        v = D31.quad_lb(D31.vcomb(terms))
        best = v if best is None else min(best, v)
    return best


# ---------------- local region L ----------------
def n_in_N1(lo, hi):
    return hi[0] <= C.A_MAX * ND and hi[1] <= C.R0 * ND


def n_in_P(lo, hi):
    return hi[0] <= C.R0 * ND and hi[1] <= C.R0 * ND


def n_overlaps_N1(lo, hi):
    return lo[0] < C.A_MAX * ND and lo[1] < C.R0 * ND


def n_overlaps_P(lo, hi):
    return lo[0] < C.R0 * ND and lo[1] < C.R0 * ND


def _verts(ch, lo, hi):
    out = []
    for a in (lo[0], hi[0]):
        for b in (lo[1], hi[1]):
            for c in (lo[2], hi[2]):
                q = [a, b, c]; q.insert(ch, DEN)
                out.append(q)
    return out


KQ = None


def piece_quats():
    """Quaternions of the rotation group of the piece (returns the conjugate q̄_k)."""
    global KQ
    if KQ is None:
        KQ = []
        for k in C.PROT:
            qk = C.mat_to_q(k)
            KQ.append((qk[0], -qk[1], -qk[2], -qk[3]))
    return KQ


def r_in_cube(ch, lo, hi, qc, qkbar=(Fr(1), Fr(0), Fr(0), Fr(0))):
    """At the 8 vertices q of the box of R, w = q̄_c ⊗ q ⊗ q̄_k satisfies |w_i| ≤ R0·w₀ (all w₀ > 0) or |w_i| ≤ −R0·w₀ (all w₀ < 0).
    That is, R k⁻¹ lies in the local cube |p_i| ≤ R0. F̃(n, R) = F̃(n, R k⁻¹), and Š too (piece rotations preserve the set of vertices), so
    the local lemma applies as it is [my own reasoning]. k runs over the 12 piece rotations (representatives of ties: the images of T_S and P1 have two with tr = 2, P2 has three with tr = 5/3.
    The rule of D cannot discard ties, so with k = 1 alone an R with equality remained on the arc. 11/14). w is linear in q, so the vertices suffice."""
    qbar = (qc[0], -qc[1], -qc[2], -qc[3])
    for sg in (1, -1):
        ok = True
        for q in _verts(ch, lo, hi):
            w = C.qmul(C.qmul(qbar, tuple(Fr(x) for x in q)), qkbar)
            w0 = sg * w[0]
            if not (w0 > 0 and all(abs(w[i]) <= C.R0 * w0 for i in (1, 2, 3))):
                ok = False; break
        if ok:
            return True
    return False


def in_L(side, nlo, nhi, ch, lo, hi):
    K = consts()
    for nm, sd, q, kind in K["cen"]:
        if sd != side:
            continue
        if kind == "tube" and not n_in_N1(nlo, nhi):
            continue
        if kind == "point" and not n_in_P(nlo, nhi):
            continue
        for ik, qkb in enumerate(piece_quats()):
            if r_in_cube(ch, lo, hi, q, qkb):
                return f"{nm}#{ik}"
    return None


# ---------------- floating point (only the choice of candidates and the estimate of k_N) ----------------
def nfloat(side, a, b):
    return np.array([f[0] + f[1] * a + f[2] * b for f in NF[side]], float)


def gval_f(nf, Rf, j, mu, kap, side):
    X = C.VTF @ Rf.T
    H = (X @ C.BF.T).max(0); H[C.JCELL] = max(H[C.JCELL], 1.0)
    w = nf @ (C.BF[j] - C.BF).T + mu
    v = (X @ nf).max() + 0.25 * (w * H).sum() - float(S0) / 2 * (nf @ C.BF[j]) - mu * float(S0) / 2
    return v - kap if side == "A" else v + kap


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", ROTF, Rf) - np.trace(Rf)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if D31.discard_lb(rb, PROT_NONID[o]) > 0:
            return int(o)
    return None


def pick(nf, Rf):
    X = C.VTF @ Rf.T
    top = int(np.argmax(X @ nf))
    vs = [int(np.argmax(X @ C.BF[f])) for f in range(4)]
    m3 = (X @ C.BF[C.JCELL]).max()
    vss = []
    if m3 < 1:
        v2 = list(vs); v2[C.JCELL] = CONST; vss.append(tuple(v2))
    vss.append(tuple(vs))
    if m3 >= 1 and m3 < 1.05:
        v2 = list(vs); v2[C.JCELL] = CONST; vss.append(tuple(v2))
    return top, vss


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


def rtree(side, nlo, nhi, kN, budget, wmin_exp, allowL):
    K = consts()
    leaves = []; ev = 0
    ac = (nlo[0] + nhi[0]) / 2 / ND; bc = (nlo[1] + nhi[1]) / 2 / ND
    nf = nfloat(side, ac, bc)
    kap = float(K["a0"] + kN) + float(K["a1"]) * ac + float(K["beta"]) * bc
    opts = face_opts(side, nlo, nhi)
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                Lk = in_L(side, nlo, nhi, ch, lo, hi)
                if Lk:
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
            top, vss = pick(nf, Rf)
            tries = []
            if C.Sch_f(Rf) > 0:
                tries.extend(("S", None, None, None, v) for v in vss)
            vals = sorted(((gval_f(nf, Rf, j, float(mu), kap, side), j, mu) for j, mu in opts), key=lambda t: -t[0])
            for v, j, mu in vals[:3]:
                for vv in vss:
                    tries.append(("F" if mu == 0 else "M", j, mu, top, vv))
            done = False
            for cand in tries:
                lb = box_lb(nlo, nhi, rb, side, cand, kN)
                if (lb > 0) if cand[0] == "S" else (lb >= 0):
                    c = list(cand); c[2] = None if c[2] is None else [c[2].numerator, c[2].denominator]
                    leaves.append([ch, lo, hi, "A", c]); done = True; break
            if done:
                continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a_, b_ in split3(lo, hi):
                nxt.append((ch, a_, b_))
        cur = nxt
    return leaves, ev


# ---- estimate of ψ(n) = min_R F̃(n, R) (Š(R) ≤ 0): min z s.t. b_f·(Rṽ + t) ≤ s₀/2, b_3·t ≤ 0, z ≥ n·(Rṽ + t) ----
def _rotq(q):
    q = q / np.linalg.norm(q)
    return C.rot_f(q)


def _warm():
    out = []
    for nm, sd, q, kind in C.centers():
        out.append(np.array([float(x) for x in q]))
    for k in C.PROT:
        pass
    return out


def psi_f(nf, starts, rng):
    from scipy.optimize import minimize
    half = float(S0) / 2

    def ineq(x):
        t, q, z = x[:3], x[3:7], x[7]
        X = C.VTF @ _rotq(q).T + t
        return np.concatenate([(half - C.BF @ X.T).ravel(), [-(C.BF[C.JCELL] @ t)], z - X @ nf])
    best = math.inf
    qs = [q / np.linalg.norm(q) for q in _warm()]
    for _ in range(starts):
        q = rng.normal(size=4); qs.append(q / np.linalg.norm(q))
    for q in qs:
        x0 = np.concatenate([np.zeros(3), q, [float((C.VTF @ _rotq(q).T @ nf).max()) + 3]])
        r = minimize(lambda x: x[7], x0, method="SLSQP", constraints=[dict(type="ineq", fun=ineq)],
                     options=dict(maxiter=400, ftol=1e-13))
        if ineq(r.x).min() > -1e-9 and r.x[7] < best:
            best = float(r.x[7])
    return best


def psi_pair(ac, bc, seed, starts=16):
    rng = np.random.default_rng(seed)
    return psi_f(nfloat("A", ac, bc), starts, rng), psi_f(nfloat("B", ac, bc), starts, rng)


def task(args):
    lo, hi, budget, wmin_exp = args
    K = consts()
    t0 = time.time()
    allowL = n_in_N1(lo, hi) or n_in_P(lo, hi)
    if n_overlaps_N1(lo, hi):
        kN = Fr(0); psis = None
    else:
        ac = (lo[0] + hi[0]) / 2 / ND; bc = (lo[1] + hi[1]) / 2 / ND
        if ac + bc > 1:                                  # the centre is outside T: estimate at a point inside T
            ac, bc = ac / (ac + bc), bc / (ac + bc)
        pA, pB = psi_pair(ac, bc, (lo[0] // 1024) * 7 + lo[1] // 1024)
        kap1 = float(K["a0"]) + float(K["a1"]) * ac + float(K["beta"]) * bc
        kN = Fr(math.floor(((pA - kap1) - (pB + kap1)) / 2 * KDEN), KDEN)
        psis = (pA, pB)
        if pA + pB < 1e-6:
            return dict(kind="neg", lo=lo, hi=hi, psis=psis, sec=time.time() - t0)
    recs = []; evs = 0
    for side in ("A", "B"):
        leaves, ev = rtree(side, lo, hi, kN, budget, wmin_exp, allowL)
        evs += ev
        if leaves is None:
            return dict(kind="fail", lo=lo, hi=hi, ev=evs, side=side, psis=psis, sec=time.time() - t0)
        recs.append(dict(side=side, leaves=leaves))
    return dict(kind="ok", lo=lo, hi=hi, kN=[kN.numerator, kN.denominator], recs=recs, ev=evs, psis=psis, sec=time.time() - t0)


def is_out(lo, hi):
    return lo[0] + lo[1] >= ND


def must_split(lo, hi, forced):
    if max(h - l for l, h in zip(lo, hi)) > forced:
        return True
    if n_overlaps_N1(lo, hi) and not n_in_N1(lo, hi):
        return True
    if n_overlaps_P(lo, hi) and not n_in_P(lo, hi):
        return True
    return False


def header():
    K = consts()
    return dict(kind="root", ND=ND, DEN=DEN, A_MAX=str(C.A_MAX), R0=str(C.R0), BETA=str(K["beta"]), S0=str(S0),
                a0=str(K["a0"]), a1=str(K["a1"]), centers=[[nm, sd, [str(t) for t in q], kind] for nm, sd, q, kind in K["cen"]])


def run(name, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=4):
    from multiprocessing import Pool
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, n_neg=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    types = {}
    cur = [([0, 0], [ND, ND])]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                continue
            if must_split(lo, hi, forced):
                nxt.extend(split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample:
            rng = np.random.default_rng(0)
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            stats["evaluated"] += r.get("ev", 0)
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for rec in r["recs"]:
                    for lf in rec["leaves"]:
                        stats["leaves"][lf[3]] = stats["leaves"].get(lf[3], 0) + 1
                        if lf[3] == "A":
                            c = lf[4]
                            t = c[0] + ("" if c[0] == "S" else f"{c[1]}" + ("" if c[2][0] == 0 else f"μ{c[2][0]}/{c[2][1]}"))
                            types[t] = types.get(t, 0) + 1
                if out:
                    out.write(json.dumps(dict(kind="ok", lo=r["lo"], hi=r["hi"], kN=r["kN"], recs=r["recs"])) + "\n")
            else:
                if r["kind"] == "neg":
                    stats["n_neg"] += 1
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin) or sample or r["kind"] == "neg":
                    stats["n_X"] += 1
                    stats["X_boxes"].append([[v / ND for v in r["lo"]], [v / ND for v in r["hi"]], r["kind"], r.get("side"), r.get("psis")])
                    if out:
                        out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend(split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r.get("sec", 0) for r in res]
        stats["levels"].append([level, len(cur), len(todo), sum(1 for r in res if r["kind"] == "ok")])
        print(f"level of n {level}: boxes {len(cur)}, tried {len(todo)}, closed {sum(1 for r in res if r['kind']=='ok')}, "
              f"limit {stats['n_X']} (neg {stats['n_neg']}), total evaluations {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]], kind=r["kind"],
                                            ev=r.get("ev"), sec=round(r.get("sec", 0), 2), side=r.get("side"), psis=r.get("psis")) for r in res]
            break
        if stats["n_neg"]:
            stats["stopped"] = "neg"; break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            stats["open_boxes"] = [[[v / ND for v in lo], [v / ND for v in hi]] for lo, hi in cur[:400]]
            break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["types"] = types
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not stats.get("stopped") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp)
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: closed {stats['closed']}, boxes of n ok {stats['n_ok']}, out {stats['n_out']}, limit {stats['n_X']}, "
          f"leaves of R {stats['leaves']}, types {types}, evaluations {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    """Re-check from the record alone (no floating point): the cover trees of n and R, the decisions of accept, S, discard and L, the correctness of faces and μ, k_N = 0 (boxes meeting N₁)."""
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    need(lines[0] == json.loads(json.dumps(header())), "premise of the record")
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same box of n twice"); nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "a splitting limit remains")
    for key, r in nleaves.items():
        lo, hi = r["lo"], r["hi"]
        if r["kind"] == "out":
            need(is_out(lo, hi), "box marked out"); continue
        kN = Fr(r["kN"][0], r["kN"][1])
        need(kN == 0 or not n_overlaps_N1(lo, hi), "k_N of a box meeting N₁")
        need([rc["side"] for rc in r["recs"]] == ["A", "B"], "number of sides")
        allowL = n_in_N1(lo, hi) or n_in_P(lo, hi)
        vcache = {}
        for rc in r["recs"]:
            side = rc["side"]; rl = set()
            for lf in rc["leaves"]:
                ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
                kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same box of R twice"); rl.add(kk)
                rb = D31.RBox(ch, rlo, rhi)
                if kind == "A":
                    c = lf[4]
                    vs = tuple(CONST if v == CONST else v for v in c[4])
                    okc = len(vs) == 4 and all(v in (0, 1, 2, 3) or (v == CONST and f == C.JCELL) for f, v in enumerate(vs))
                    if c[0] == "S":
                        cand = ("S", None, None, None, vs)
                        ok = okc and c[1] is None and c[2] is None and c[3] is None and box_lb(lo, hi, rb, side, cand, kN) > 0
                    else:
                        mu = Fr(c[2][0], c[2][1])
                        vk = (side, c[1], mu)
                        if vk not in vcache:
                            vcache[vk] = valid_opt(side, lo, hi, c[1], mu)
                        okc = okc and c[0] in ("F", "M") and (c[0] == "F") == (mu == 0) and c[3] in (0, 1, 2, 3) and vcache[vk]
                        cand = (c[0], c[1], mu, c[3], vs)
                        ok = okc and box_lb(lo, hi, rb, side, cand, kN) >= 0
                elif kind == "D":
                    ok = 0 <= lf[4] < len(PROT_NONID) and D31.discard_lb(rb, PROT_NONID[lf[4]]) > 0
                elif kind == "L":
                    ok = allowL and in_L(side, lo, hi, ch, rlo, rhi) == lf[4]
                else:
                    ok = False
                cnt[kind] += 1; cnt["bad"] += (not ok)
            dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
            cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]; seen = 0; depth = 0
            while cur:
                need(depth <= dmax, "a branch that does not reach a leaf of R"); depth += 1
                nxt = []
                for ch, a, b in cur:
                    if (ch, tuple(a), tuple(b)) in rl:
                        seen += 1; continue
                    nxt.extend((ch, p, q) for p, q in split3(a, b))
                cur = nxt
            need(seen == len(rl), "cover of the tree of R")
    need(cnt["bad"] == 0, "there are failures")
    dmax = max(sum(round(math.log2(ND / (h - l))) for l, h in zip(k_[0], k_[1])) for k_ in nleaves)
    cur = [([0, 0], [ND, ND])]; seen = 0; depth = 0
    while cur:
        need(depth <= dmax, "a branch that does not reach a leaf of n"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            nxt.extend(split2(lo, hi))
        cur = nxt
    need(seen == len(nleaves), "cover of the tree of n")
    print(f"re-check {name}: boxes of n ok {cnt['ok']}, out {cnt['out']}, leaves of R accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}, "
          f"failed {cnt['bad']}, cover trees OK, {time.time()-t0:.0f} s", flush=True)
    need(cnt["bad"] == 0, "there are failures")
    return cnt


def check():
    """Local checks: (1) compare the formula of ψ (SLSQP) with the closed form of F̃, (2) compare the formulas of the candidates with floating-point values, (3) ψ_A + ψ_B ≈ 0 on the arc."""
    rng = np.random.default_rng(1)
    K = consts()
    # (1) the LP in t with the rotation fixed, and Ft_f
    from scipy.optimize import linprog
    worst = 0
    for _ in range(200):
        side = "A" if rng.random() < 0.5 else "B"
        a, b = rng.random(), rng.random()
        if a + b > 1:
            a, b = 1 - a, 1 - b
        nf = nfloat(side, a, b)
        q = rng.normal(size=4); Rf = _rotq(q)
        if C.Sch_f(Rf) > 0:
            continue
        X = C.VTF @ Rf.T
        H = (X @ C.BF.T).max(0)
        A_ub = np.vstack([C.BF, C.BF[C.JCELL]]); b_ub = np.concatenate([1.0 - H, [0.0]])
        lp = linprog(nf, A_ub=A_ub, b_ub=b_ub, bounds=[(None, None)] * 3, method="highs")
        v = (X @ nf).max() + lp.fun
        worst = max(worst, abs(v - C.Ft_f(nf, Rf)))
    print(f"(1) discrepancy between the closed form of F̃ and the LP in t (max) {worst:.2e}")
    # (2) exact values of the candidate formulas and floating point
    worst = 0
    for _ in range(200):
        side = "A" if rng.random() < 0.5 else "B"
        lo = [int(rng.integers(0, ND // 2)), int(rng.integers(0, ND // 2))]; hi = [lo[0] + 2 ** 20, lo[1] + 2 ** 20]
        opts = face_opts(side, lo, hi)
        j, mu = opts[int(rng.integers(len(opts)))]
        q = rng.normal(size=4); Rf = _rotq(q)
        nf = nfloat(side, lo[0] / ND, lo[1] / ND)
        top, vss = pick(nf, Rf)
        vs = tuple(vss[-1])
        X = C.VTF @ Rf.T
        L = cand_forms(side, ("F" if mu == 0 else "M", j, mu, top, vs), Fr(0))
        M = np.array(C.Mq(*q)); Q = (q * q).sum()
        val = 0.0
        for key, f in L.items():
            c = float(f[0]) + float(f[1]) * lo[0] / ND + float(f[2]) * lo[1] / ND
            val += c * (Q if key == "Q" else M[key[0]][key[1]])
        kap = float(K["a0"]) + float(K["a1"]) * lo[0] / ND + float(K["beta"]) * lo[1] / ND
        H = (X @ C.BF.T).max(0)
        Lf = np.array([X[vs[f]] @ C.BF[f] if vs[f] != CONST else 1.0 for f in range(4)])
        w = nf @ (C.BF[j] - C.BF).T + float(mu)
        ref = (X[top] @ nf) + 0.25 * (w * Lf).sum() - (nf @ C.BF[j]) - float(mu) + (-kap if side == "A" else kap)
        worst = max(worst, abs(val / Q - ref))
    print(f"(2) discrepancy between the candidate formulas (rational coefficients) and floating-point values (max) {worst:.2e}")
    # (3) check of ψ
    for side_pts in ((0.0, 0.0), (0.4, 0.0), (0.8, 0.0), (0.95, 0.0), (0.3, 0.3), (0.1, 0.8), (0.5, 0.5), (0.0, 1.0)):
        a, b = side_pts
        pA, pB = psi_pair(a, b, 3, starts=24)
        k = float(K["a0"]) + float(K["a1"]) * a + float(K["beta"]) * b
        print(f"(3) (a, b) = ({a}, {b}): ψ_A {pA:.6f}, ψ_B {pB:.6f}, sum {pA + pB:.6f}, κ̃ {k:.4f} (ψ_A − κ̃ {pA - k:.4f}, ψ_B + κ̃ {pB + k:.4f})")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d37_tet_n05_far")
    ap.add_argument("--procs", type=int, default=3); ap.add_argument("--nmin", type=int, default=12)
    ap.add_argument("--budget", type=int, default=40000); ap.add_argument("--wmin-exp", type=int, default=18)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    ap.add_argument("--forced-exp", type=int, default=5)     # a box of 1/16 does not close even with 300 thousand evaluations, and with 1/32 about 4 thousand (survey of 11/13)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit, a.forced_exp)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
    elif a.cmd == "check":
        check()
