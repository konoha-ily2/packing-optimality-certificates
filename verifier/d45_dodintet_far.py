# D45 step 2: far verifier (dodintet_n02, route Y, exact over Q(√5), acceptance by integers only).
# 2026-11-14, written by Claude (Sonnet 5.5). Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
# Basis: d28_far.py (icointet; FE over Q(√5) and integer lower bounds) + d40_far.py (two trees per side and k_N per box). Existing files are only imported.
#
# What is shown (T4 of D28 2.3; n lies in D_n = {(x,y,1): |y| ≤ x ≤ 1}): for all n ∈ D_n and R ∈ SO(3), F(n,R;c̄) ≥ κ(n),
#   and κ(n) + κ(σn) ≥ 0 (σn = (x,−y,1)).
# A box N of n holds only the upper half (y ≥ 0) and is paired with σN (the lower half). For each pair there are 2 trees over R:
#   U tree (point p = n of N): F(p,R) − κ_U(n) ≥ 0,   L tree (point p = σn of σN, n in the coordinates of N): F(p,R) − κ_L(n) ≥ 0.
#   The "forms" of κ are the 2 of step 1: form B κ_B(p) = k̂·p (tube T_B), form A κ_A(p) = −k̂·σp (tube T_A).
#   Pair types (pair of forms (U, L)):  I = (B, A), II = (A, B), III = (B, B). The κ of the U tree is (form) + k, that of the L tree is (form) − k (k is a constant per pair).
#   For I and II, κ_U(n) + κ_L(n) ≡ 0 (identically). For III, 2(k̂₁x + k̂₃) ≥ 0 is checked exactly at the corners of the box (used where T_B straddles y = 0).
# A point above y = 0 belongs to both the upper box and the lower box (the box mapped by σ), and both claims (κ and −κ) hold, so κ := max ≥ 0 [my own inference].
# Local L: the parallelogram of n of tubes T_A and T_B (u in the range of the tube along the base, transverse |w| ≤ r₀) × the cube around the centre (q = q_c⊗(1,p), |p_i| ≤ r₀).
#   A leaf is L: the box of the point of that tree (N or σN) lies inside the parallelogram (exact), the box of R lies inside the cube (8 vertices, exact), and the offset of that tree is ≤ 0
#   (the local lemma gives F ≥ κ, so it also covers F ≥ κ + offset (≤ 0). For I and II, k_U = −k_L; for III both k_U and k_L can be made ≤ 0).
#   For a pair having a box of the point of a tree that meets the parallelogram, the offset of that tree is cut to ≤ 0 (F − κ vanishes at R at the centre of the tube, so > 0 would be false).
# Usage: python -X utf8 d45_dodintet_far.py run [--procs 8] [--name d45_dodintet_far] [--forced-exp 6]
#         ... sample [--k 16] [--region all|valley|tube] [--tcap 300]   /  replay [--name ...]
import sys, os, json, gzip, time, math, argparse, itertools, random
os.environ.setdefault("D28_PROB", "icointet")
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d28_common as C28                       # only general tools (FE, polynomials in a box of R, integer lower bounds) are used (not the problem)
from d28_common import FE, CTX5, NB, NDEN, DEN, ZERO5, lin, ladd, lscale, nbox_affine, lin_poly, common_den, lower_bound, rbox_polys, need
need(C28.PRIMES == (5,), "D28_PROB is not icointet (the meaning of FE would change)")
import d45_dodintet_common as C
from d45_dodintet_upper import Q5, V, BN

KDENOM = 2 ** 24
PRUNE = float(os.environ.get('D45_PRUNE', '0.6'))
B2 = 2


def fe(x):
    if isinstance(x, Q5):
        return FE(x.a, x.b)
    return FE(Fr(x))


# ---------------- constants ----------------
VFE = [tuple(fe(c) for c in v) for v in V]
BFE = [tuple(FE(b) for b in bn) for bn in BN]
CB = FE(C.CBAR)
KH = tuple(C.kappa()["k"])                       # k̂ (3 rationals)
SG = (1, -1, 1)
ROTS = C.dod_rotations()
ROTFE = [[[fe(e) for e in row] for row in M] for M in ROTS]
ROTF = np.array([C.fmat(M) for M in ROTS])
NONID = [i for i in range(60) if np.abs(ROTF[i] - np.eye(3)).max() > 1e-9]
assert len(NONID) == 59
VF = C.VF; BF = C.BF; CBF = float(C.CBAR)
_RP = {}
_DISC = {}


class Par:
    """The parallelogram of n of a tube (on the chart (x, y)) and the cube around the centre."""
    def __init__(self, name):
        sp = C.tube_spec(name)
        self.name, self.side = name, sp["side"]
        self.ulo, self.uhi, self.r0, self.ws = sp["ulo"], sp["uhi"], sp["r0"], sp["ws"]
        self.P0, self.d, self.wv = sp["P0"], sp["d"], sp["w"]
        d, w, ws = self.d, self.wv, self.ws
        self.det = d[0] * ws * w[1] - ws * w[0] * d[1]
        Rc, qc = C.tube_center(self.side)
        self.qc = qc
        self.qbar = (qc[0], -qc[1], -qc[2], -qc[3])
        self.qbar_f = np.array([float(x) for x in self.qbar])
        self.dF = (float(d[0]), float(d[1])); self.wF = (float(w[0]) * float(ws), float(w[1]) * float(ws))
        self.detF = float(self.det); self.P0F = (float(self.P0[0]), float(self.P0[1]))

    def uw(self, px, py):
        """Point (Fraction) → (u, w) (exact)."""
        r0, r1 = px - self.P0[0], py - self.P0[1]
        d, w, ws = self.d, self.wv, self.ws
        u = (r0 * ws * w[1] - ws * w[0] * r1) / self.det
        wc = (d[0] * r1 - d[1] * r0) / self.det
        return u, wc

    def inside(self, xs, ys):
        for px in xs:
            for py in ys:
                u, wc = self.uw(px, py)
                if not (self.ulo <= u <= self.uhi and -self.r0 <= wc <= self.r0):
                    return False
        return True

    def overlaps(self, xs, ys, tol=1e-9):
        """The parallelogram and a box meet (conservative: True if in doubt). Floating-point SAT."""
        pts = []
        for px in xs:
            for py in ys:
                r0, r1 = float(px) - self.P0F[0], float(py) - self.P0F[1]
                u = (r0 * self.wF[1] - self.wF[0] * r1) / self.detF
                wc = (self.dF[0] * r1 - self.dF[1] * r0) / self.detF / float(self.ws)
                pts.append((u, wc))
        ul, uh, rr = float(self.ulo), float(self.uhi), float(self.r0)
        rect = [(ul, -rr), (ul, rr), (uh, -rr), (uh, rr)]
        axes = [(1.0, 0.0), (0.0, 1.0)]
        for e in ((pts[2][0] - pts[0][0], pts[2][1] - pts[0][1]), (pts[1][0] - pts[0][0], pts[1][1] - pts[0][1])):
            axes.append((-e[1], e[0]))
        for ax in axes:
            a = [ax[0] * p[0] + ax[1] * p[1] for p in pts]; b = [ax[0] * p[0] + ax[1] * p[1] for p in rect]
            nrm = math.hypot(*ax) or 1.0
            if max(a) < min(b) - tol * nrm or max(b) < min(a) - tol * nrm:
                return False
        return True


PAR = {"A": Par("T_A"), "B": Par("T_B")}


def r_in_cube(par, ch, lo, hi):
    """For the 8 vertices q of a box of R, w = q̄_c⊗q satisfies |w_i| ≤ r₀|w₀| (all w₀ of the same sign, ≠ 0). Drop what is clearly outside in floating point, then exactly."""
    r0 = par.r0; r0f = float(r0)
    verts = []
    for a in (lo[0], hi[0]):
        for b in (lo[1], hi[1]):
            for c in (lo[2], hi[2]):
                q = [a, b, c]; q.insert(ch, DEN)
                verts.append(q)
    qb = par.qbar_f
    fw = []
    for q in verts:
        qf = [x / DEN for x in q]
        fw.append(C.qmul(tuple(qb), tuple(qf)))
    for sg in (1, -1):
        if all(sg * w[0] > 0 and all(abs(w[i]) <= r0f * sg * w[0] * (1 + 1e-7) + 1e-12 for i in (1, 2, 3)) for w in fw):
            break
    else:
        return False
    for sg in (1, -1):
        ok = True
        for q in verts:
            w = C.qmul(par.qbar, tuple(Fr(x) for x in q))
            w0 = w[0] * sg
            if w0.sign() <= 0:
                ok = False; break
            for i in (1, 2, 3):
                if (w0 * r0 - w[i]).sign() < 0 or (w0 * r0 + w[i]).sign() < 0:
                    ok = False; break
            if not ok:
                break
        if ok:
            return True
    return False


# ---------------- pair types and tree specifications ----------------
MODES = {"I": ("B", "A"), "II": ("A", "B"), "III": ("B", "B")}


def kap_n(form, sig):
    """κ0 of the form `form` as a linear form in the coordinates (x, y, 1) of n (3 coefficients, rational). The point is p = σ^sig n.
    Form B: κ_B(p) = k̂·p, form A: κ_A(p) = −k̂·σp."""
    if form == "B":
        return tuple(KH[i] * (SG[i] ** sig) for i in range(3))
    return tuple(-KH[i] * (SG[i] ** (sig + 1)) for i in range(3))


def tree_kap(mode, kU, kL):
    """κ of the U tree and the L tree (3 coefficients of a linear form in the coordinates of n, including the offsets kU and kL). For I and II kL = −kU, for III free (the sum is checked by pair_sum_ok)."""
    fU, fL = MODES[mode]
    a = list(kap_n(fU, 0)); a[2] += kU
    b = list(kap_n(fL, 1)); b[2] += kL
    return tuple(a), tuple(b)


def pair_sum_ok(mode, kU, kL, lo, hi):
    """κ_U(n) + κ_L(n) ≥ 0 at the 4 corners of N, exactly (linear form)."""
    a, b = tree_kap(mode, kU, kL)
    S = [a[i] + b[i] for i in range(3)]
    for xv in (lo[0], hi[0]):
        for yv in (lo[1], hi[1]):
            if S[0] * Fr(xv, NDEN) + S[1] * Fr(yv, NDEN) + S[2] < 0:
                return False
    return True


# ---------------- formulas ----------------
_FORMS = {}


def form_co(sig, v0, vf):
    """The co of G·N = Σ co_ij·Rq_ij + coN·N (the part without k and κ). A linear form in the coordinates (x, y) of n."""
    key = (sig, v0, vf)
    r = _FORMS.get(key)
    if r is None:
        if len(_FORMS) > 200000:
            _FORMS.clear()
        P = (lin(x=1), lin(y=(1 if sig == 0 else -1)), lin(c=1))
        co = [[lin() for _ in range(3)] for _ in range(3)]
        v = VFE[v0]
        for i in range(3):
            for j in range(3):
                co[i][j] = ladd(co[i][j], lscale(P[i], v[j]))
        for f in range(4):
            if f == B2:
                continue
            wf = lin()
            for i in range(3):
                wf = ladd(wf, lscale(P[i], BN[B2][i] - BN[f][i]))
            vv = VFE[vf[f]]
            for i in range(3):
                for j in range(3):
                    co[i][j] = ladd(co[i][j], lscale(wf, BFE[f][i] * vv[j] * FE(Fr(1, 4))))
        mm = lin()
        for i in range(3):
            mm = ladd(mm, lscale(P[i], BN[B2][i]))
        r = _FORMS[key] = (co, lscale(mm, CB))
    return r


class TBox:
    """One tree (direction sig of the point, linear form kap of κ) and the box of n. Collects the integer polynomial of each candidate."""
    def __init__(self, sig, kap, lo, hi):
        self.sig, self.kap = sig, kap
        self.Nc, self.Nw = nbox_affine(lo, hi)
        self.cache = {}

    def polys(self, v0, vf):
        key = (v0, vf)
        r = self.cache.get(key)
        if r is None:
            co, mc = form_co(self.sig, v0, vf)
            coN = lscale(ladd(mc, lin(c=self.kap[2], x=self.kap[0], y=self.kap[1])), -1)
            flat = [co[i][j] for i in range(3) for j in range(3)] + [coN]
            den = common_den(flat)
            terms = []
            for i in range(3):
                for j in range(3):
                    if all(q == 0 for q in co[i][j]):
                        continue
                    terms.append((i, j, lin_poly(co[i][j], self.Nc, self.Nw, den)))
            terms.append((None, None, lin_poly(coN, self.Nc, self.Nw, den)))
            r = self.cache[key] = (terms, den)
        return r


def box_lb(tb, rp, v0, vf):
    terms, den = tb.polys(v0, vf)
    Rq, N = rp
    G = [ZERO5] * NB
    for i, j, ps in terms:
        p = N if i is None else Rq[i][j]
        for m in range(NB):
            if not ps[m].is_zero():
                G[m] = G[m] + ps[m] * p
    return lower_bound(G)


def rpolys(ch, lo, hi):
    key = (ch, tuple(lo), tuple(hi))
    r = _RP.get(key)
    if r is None:
        if len(_RP) > 300_000:
            _RP.clear()
        r = _RP[key] = rbox_polys(ch, lo, hi)
    return r


def discard_lb(rp, kfe):
    Rq, N = rp
    terms = [((kfe[j][i] - (1 if i == j else 0)), Rq[i][j]) for i in range(3) for j in range(3)]
    den = 1
    for cf, _ in terms:
        for x in cf.c:
            den = den * x.denominator // math.gcd(den, x.denominator)
    G = [ZERO5] * NB
    for cf, p in terms:
        for m in range(NB):
            a = cf.c[m] * den
            need(a.denominator == 1, "integerization")
            if a:
                G[m] = G[m] + int(a) * p
    return lower_bound(G)


def discard(ch, lo, hi, Rf):
    key = (ch, tuple(lo), tuple(hi))
    if key in _DISC:
        return _DISC[key]
    gains = np.einsum("mji,ij->m", ROTF[NONID], Rf) - np.trace(Rf)
    res = None
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        m = NONID[o]
        if discard_lb(rpolys(ch, lo, hi), ROTFE[m]) > 0:
            res = m; break
    if len(_DISC) > 300_000:
        _DISC.clear()
    _DISC[key] = res
    return res


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


def mirror(lo, hi):
    return [lo[0], -hi[1]], [hi[0], -lo[1]]


def rot_f(q):
    return C28.rot_f(q)


def choose(pc, Rf):
    X = VF @ Rf.T
    v0 = int((X @ pc).argmax())
    vf = tuple(None if f == B2 else int((X @ BF[f]).argmax()) for f in range(4))
    return v0, vf


def rtree(tree, nlo, nhi, allowL, par, budget, wmin_exp):
    """tree = (sig, kap). Returns (leaf, number of evaluations) or (None, number of evaluations)."""
    sig, kap = tree
    tb = TBox(sig, kap, nlo, nhi)
    xc = (nlo[0] + nhi[0]) / 2 / NDEN; yc = (nlo[1] + nhi[1]) / 2 / NDEN
    pc = np.array([xc, yc if sig == 0 else -yc, 1.0])
    wmin = DEN >> wmin_exp
    leaves = []; ev = 0
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL and r_in_cube(par, ch, lo, hi):
                leaves.append([ch, lo, hi, "L"]); continue
            ev += 1
            if ev > budget:
                return None, ev
            cen = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
            Rf = rot_f(C28.q_of(ch, cen))
            m = discard(ch, lo, hi, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            v0, vf = choose(pc, Rf)
            if box_lb(tb, rpolys(ch, lo, hi), v0, vf) >= 0:
                leaves.append([ch, lo, hi, "A", v0, list(vf)]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a, b in split3(lo, hi):
                nxt.append((ch, a, b))
        cur = nxt
    return leaves, ev


# ---------------- ψ (floating point; only for the choice of k) ----------------
_QS = None


def F_batch(p, Rs, c=CBF):
    RV = np.einsum("kij,vj->kvi", Rs, VF)
    bn = BF @ p
    m = bn.max()
    H = np.einsum("fi,kvi->kfv", BF, RV).max(2)
    return (RV @ p).max(1) + 0.25 * (H * (m - bn)).sum(1) - c * m


def psi(p, nsamp=3000, nstart=8, seed=0):
    global _QS
    from scipy.optimize import minimize
    if _QS is None:
        rng = np.random.default_rng(seed)
        Rc = [C.fmat(C.tube_center(s)[0]) for s in "AB"]
        _QS = np.concatenate([C28.qrot_batch(rng.normal(size=(nsamp, 4))), np.array(Rc), np.eye(3)[None]])
    p = np.asarray(p, float)
    vals = F_batch(p, _QS)
    idx = np.argsort(vals)[:nstart]
    best = np.inf
    for i in idx:
        R0 = _QS[i]
        f = lambda w: C.F_f(p, C28.expm_rot(w) @ R0, CBF)
        r = minimize(f, np.zeros(3), method="Nelder-Mead",
                     options=dict(xatol=1e-9, fatol=1e-12, maxiter=1500, initial_simplex=np.vstack([np.zeros(3), 0.03 * np.eye(3)])))
        best = min(best, float(r.fun))
    return best


# ---------------- pairs ----------------
def flags(lo, hi):
    """For each (sig, form), (inside, meets). Box of the point of the tree: sig = 0 is N, sig = 1 is σN."""
    out = {}
    for sig in (0, 1):
        l, h = (lo, hi) if sig == 0 else mirror(lo, hi)
        xs = (Fr(l[0], NDEN), Fr(h[0], NDEN)); ys = (Fr(l[1], NDEN), Fr(h[1], NDEN))
        for form in "AB":
            par = PAR[form]
            ov = par.overlaps(xs, ys)
            ins = ov and par.inside(xs, ys)
            out[sig, form] = (ins, ov)
    return out


def choose_mode(fl, lo, hi):
    ovBU, ovAU, ovBL, ovAL = fl[0, "B"][1], fl[0, "A"][1], fl[1, "B"][1], fl[1, "A"][1]
    if ovBU and ovBL:
        want = "III"
    elif ovBL or ovAU:
        want = "II"
    else:
        want = "I"
    feas = {"I": not ovAU and not ovBL, "II": not ovBU and not ovAL, "III": not ovAU and not ovAL}
    if not feas[want]:
        return None
    return want


def try_pair(lo, hi, budget, wmin_exp):
    t0 = time.time()
    fl = flags(lo, hi)
    mode = choose_mode(fl, lo, hi)
    if mode is None:
        return dict(kind="split", why="mode", lo=lo, hi=hi, ev=0, sec=0)
    fU0, fL0 = MODES[mode]
    ovU = fl[0, fU0][1]; ovL = fl[1, fL0][1]
    anyov = any(v[1] for v in fl.values())
    xc = (lo[0] + hi[0]) / 2 / NDEN; yc = (lo[1] + hi[1]) / 2 / NDEN
    kU0, kL0 = tree_kap(mode, Fr(0), Fr(0))
    # The margin is measured as the minimum inside the box (for a box meeting the tube, also at the 4 corners). For a tree whose F − κ vanishes at the centre R (meeting the tube), the offset is ≤ 0 [my own inference]
    pts = [(xc, yc)]
    if anyov:
        pts += [(a_ / NDEN, b_ / NDEN) for a_ in (lo[0], hi[0]) for b_ in (lo[1], hi[1])]
    resU = resL = 1e9
    for (px, py) in pts:
        resU = min(resU, psi(np.array([px, py, 1.0])) - (float(kU0[0]) * px + float(kU0[1]) * py + float(kU0[2])))
        resL = min(resL, psi(np.array([px, -py, 1.0])) - (float(kL0[0]) * px + float(kL0[1]) * py + float(kL0[2])))
    kd = Fr(1, KDENOM)
    if mode == "III":
        # remainder S of the sum = (linear form in x of κ_U + κ_L), its minimum inside the box (on the side of larger x)
        Sf = [float(kU0[i] + kL0[i]) for i in range(3)]
        Smin = min(Sf[0] * (xv / NDEN) + Sf[1] * (yv / NDEN) + Sf[2] for xv in lo[:1] + hi[:1] for yv in (lo[1], hi[1]))
        t = (resU + resL + Smin) / 2
        margin = 0.9 * t
        if t <= 0:
            return dict(kind="neg", lo=lo, hi=hi, ev=0, sec=time.time() - t0, margin=t)
        kU = Fr(math.floor((resU - 0.9 * t) * KDENOM), KDENOM); kL = Fr(math.floor((resL - 0.9 * t) * KDENOM), KDENOM)
        if ovU: kU = min(kU, Fr(0))
        if ovL: kL = min(kL, Fr(0))
    else:
        margin = (resU + resL) / 2
        if resU + resL <= 0:
            return dict(kind="neg", lo=lo, hi=hi, ev=0, sec=time.time() - t0, margin=margin)
        k = Fr(math.floor((resU - resL) / 2 * KDENOM), KDENOM)
        if ovU: k = min(k, Fr(0))
        if ovL: k = max(k, Fr(0))
        kU, kL = k, -k
    need(pair_sum_ok(mode, kU, kL, lo, hi), "sum of the pair")
    wbox = max(hi[0] - lo[0], hi[1] - lo[1]) / NDEN
    if margin is not None and not (ovU and ovL) and margin < PRUNE * wbox:       # the margin is thinner than the box width: split without trying (the variation of n inside the box eats the margin)
        return dict(kind="fail", lo=lo, hi=hi, ev=0, sec=time.time() - t0, margin=margin, mode=mode, why="thin")
    kU_, kL_ = tree_kap(mode, kU, kL)
    fU, fL = MODES[mode]
    evs = 0
    recs = []
    for sig, kap, form, off in ((0, kU_, fU, kU), (1, kL_, fL, kL)):
        allowL = fl[sig, form][0] and off <= 0
        leaves, ev = rtree((sig, kap), lo, hi, allowL, PAR[form], budget, wmin_exp)
        evs += ev
        if leaves is None:
            return dict(kind="fail", lo=lo, hi=hi, ev=evs, sec=time.time() - t0, margin=margin, mode=mode)
        recs.append(leaves)
    return dict(kind="ok", lo=lo, hi=hi, mode=mode, kU=[kU.numerator, kU.denominator], kL=[kL.numerator, kL.denominator], U=recs[0], L=recs[1], ev=evs,
                sec=time.time() - t0, margin=margin)


def is_out(lo, hi):
    return lo[1] > hi[0]


def solve_region(args):
    """Solve one upper box, if it fails split into 4 ... down to the end inside the tree (up to the time limit)."""
    lo0, hi0, budget, wmin_exp, nmin, tcap = args
    t0 = time.time()
    recs = []; ev = 0; nX = 0; xs = []; nneg = 0
    stack = [(lo0, hi0)]
    timeout = False
    while stack:
        if tcap and time.time() - t0 > tcap:
            timeout = True; break
        lo, hi = stack.pop()
        if is_out(lo, hi):
            recs.append(dict(kind="out", lo=lo, hi=hi)); continue
        r = try_pair(lo, hi, budget, wmin_exp)
        ev += r.get("ev", 0)
        if r["kind"] == "ok":
            recs.append(r); continue
        if r["kind"] == "neg":
            nneg += 1
        w = max(h - l for l, h in zip(lo, hi))
        if w <= (NDEN >> nmin):
            nX += 1; xs.append([[v / NDEN for v in lo], [v / NDEN for v in hi], r["kind"], r.get("margin"), r.get("why")])
            recs.append(dict(kind="X", lo=lo, hi=hi)); continue
        a, b = split2(lo, hi)
        stack.append(b); stack.append(a)
    return dict(lo=lo0, hi=hi0, recs=recs, ev=ev, nX=nX, X=xs[:20], nneg=nneg, sec=time.time() - t0, timeout=timeout,
                open=len(stack))


def top_tasks(forced_exp, budget, wmin_exp, nmin, tcap):
    forced = NDEN >> forced_exp
    cur = [([0, 0], [NDEN, NDEN])]
    tasks = []
    while cur:
        nxt = []
        for lo, hi in cur:
            if max(h - l for l, h in zip(lo, hi)) > forced:
                nxt.extend(split2(lo, hi))
            else:
                tasks.append((lo, hi, budget, wmin_exp, nmin, tcap))
        cur = nxt
    return tasks


def in_valley(lo, hi, dist=0.06):
    """The box is near the valley of line B (u ∈ [−0.7, −7/16 + 1/16]) or near its image under σ."""
    LB = C.geometry()["line_B"]
    P0 = (float(LB["P0"][0]), float(LB["P0"][1])); d = (float(LB["d"][0]), float(LB["d"][1]))
    cx = (lo[0] + hi[0]) / 2 / NDEN; cy = (lo[1] + hi[1]) / 2 / NDEN
    for yy in (cy, -cy):
        t = (cx - P0[0]) * d[0] + (yy - P0[1]) * d[1]
        dx = cx - (P0[0] + t * d[0]); dy = yy - (P0[1] + t * d[1])
        if -0.7 <= t <= -7 / 16 + 1 / 16 and math.hypot(dx, dy) < dist:
            return True
    return False


def run(name, procs, forced_exp, budget, wmin_exp, nmin, tcap, time_limit, sample=None, region="all", seed=0, part=0):
    from multiprocessing import Pool
    t0 = time.time()
    tasks = [t for t in top_tasks(forced_exp, budget, wmin_exp, nmin, tcap)]
    ntasks = len(tasks)
    live = [t for t in tasks if not is_out(t[0], t[1])]
    if region == "valley":
        live = [t for t in live if in_valley(t[0], t[1])]
    elif region == "tube":
        live = [t for t in live if any(fl[1] for fl in flags(t[0], t[1]).values())]
    if sample:
        random.Random(seed).shuffle(live)
        live = live[:sample]
    if part:                                    # continuation: skip the regions appearing in the previous records (main part and part1...)
        wreg = NDEN >> forced_exp
        done_cells = set()
        for fn in part_files(name):
            with gzip.open(fn, "rt", encoding="utf-8") as f:
                for s_ in f:
                    r_ = json.loads(s_)
                    if r_["kind"] != "root":
                        done_cells.add((r_["lo"][0] // wreg, r_["lo"][1] // wreg))
        live = [t for t in live if (t[0][0] // wreg, t[0][1] // wreg) not in done_cells]
        print(f"continuation part{part}: remaining {len(live)} regions", flush=True)
    stats = dict(n_tasks=ntasks, n_live=len(live), evaluated=0, n_ok=0, n_out=0, n_X=0, n_neg=0, X_boxes=[], timeouts=0, secs=[], evs=[])
    out = None if sample else gzip.open(os.path.join(".", f"{name}.boxes.jsonl.gz" if not part else f"{name}.part{part}.boxes.jsonl.gz"), "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(header()) + "\n")
    pool = Pool(procs) if procs > 1 else None
    it = pool.imap_unordered(solve_region, live, chunksize=1) if pool else map(solve_region, live)
    done = 0
    for r in it:
        done += 1
        stats["evaluated"] += r["ev"]; stats["n_X"] += r["nX"]; stats["n_neg"] += r["nneg"]
        stats["timeouts"] += int(r["timeout"]); stats["secs"].append(round(r["sec"], 1)); stats["evs"].append(r["ev"])
        stats["X_boxes"].extend(r["X"])
        for rec in r["recs"]:
            if rec["kind"] == "ok":
                stats["n_ok"] += 1
            elif rec["kind"] == "out":
                stats["n_out"] += 1
            if out:
                rec = dict(rec); rec.pop("margin", None); rec.pop("sec", None); rec.pop("ev", None)
                out.write(json.dumps(rec) + "\n")
        if done % 10 == 0 or done == len(live):
            print(f"  {done}/{len(live)} regions, evaluations {stats['evaluated']}, n boxes ok {stats['n_ok']}, limit {stats['n_X']}, "
                  f"({time.time()-t0:.0f} s)", flush=True)
        if time.time() - t0 > time_limit:
            stats["timeout"] = True
            if pool:
                pool.terminate()
            break
    else:
        if pool:
            pool.close()
    if out:
        out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    if sample:
        evs = stats["evs"]
        stats["mean_ev"] = sum(evs) / max(1, len(evs)); stats["max_ev"] = max(evs) if evs else 0
        stats["extrapolated_ev_all"] = stats["mean_ev"] * len(live) if False else stats["mean_ev"] * (len(tasks) - sum(1 for t in tasks if is_out(t[0], t[1])))
    stats["closed"] = (stats["n_X"] == 0 and not stats.get("timeout") and stats["timeouts"] == 0 and not sample and done == len(live))
    stats["params"] = dict(forced_exp=forced_exp, budget=budget, wmin_exp=wmin_exp, nmin=nmin, tcap=tcap, KDENOM=KDENOM, NDEN_exp=30, DEN_exp=44)
    jn = os.path.join(".", f"{name}{'_sample' if sample else ''}.json")
    json.dump(stats, open(jn, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: passed {stats['closed']}, regions {done}/{len(live)}, n boxes ok {stats['n_ok']}, out {stats['n_out']}, limit {stats['n_X']}, "
          f"evaluations {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def part_files(name):
    fs = [os.path.join(".", f"{name}.boxes.jsonl.gz")]
    i = 1
    while os.path.exists(os.path.join(".", f"{name}.part{i}.boxes.jsonl.gz")):
        fs.append(os.path.join(".", f"{name}.part{i}.boxes.jsonl.gz")); i += 1
    return [f for f in fs if os.path.exists(f)]


def header():
    return dict(kind="root", cbar=str(C.CBAR), k=[str(x) for x in KH], NDEN=NDEN, DEN=DEN, KDENOM=KDENOM,
                tubes={nm: [str(v) if not isinstance(v, tuple) else [str(x) for x in v] for v in C.tube_spec(nm).values()] for nm in C.TUBES},
                qc={s: [C.q5str(x) for x in PAR[s].qc] for s in "AB"})


def check_box(r):
    """Check of one box of n (a part of replay). Returns the counts per kind of leaf and the number of failures."""
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    lo, hi = r["lo"], r["hi"]
    if r["kind"] == "out":
        need(is_out(lo, hi), "a box marked out is outside D_n"); return cnt
    mode = r["mode"]; need(mode in MODES, "type")
    okU = Fr(r["kU"][0], r["kU"][1]); okL = Fr(r["kL"][0], r["kL"][1])
    need(pair_sum_ok(mode, okU, okL, lo, hi), "sum of κ of the pair ≥ 0")
    if mode != "III":
        need(okU + okL == 0, "for I and II, kL = −kU")
    kU, kL = tree_kap(mode, okU, okL)
    fU, fL = MODES[mode]
    for sig, kap, form, leaves, off in ((0, kU, fU, r["U"], okU), (1, kL, fL, r["L"], okL)):
        allowL = False
        if True:
            # exact "inside" decision (the inside of flags is redone exactly here, independent of the floating point of overlaps)
            l, h = (lo, hi) if sig == 0 else mirror(lo, hi)
            xs = (Fr(l[0], NDEN), Fr(h[0], NDEN)); ys = (Fr(l[1], NDEN), Fr(h[1], NDEN))
            allowL = PAR[form].inside(xs, ys) and off <= 0
        tb = TBox(sig, kap, lo, hi)
        rl = {}
        for lf in leaves:
            ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
            kk = (ch, tuple(rlo), tuple(rhi))
            need(kk not in rl, "the same box of R twice"); rl[kk] = 1
            if kind == "A":
                vf = tuple(lf[5])
                okc = all(v in range(20) for v in [lf[4]] + [x for x in vf if x is not None]) and vf[B2] is None and \
                    all((x is not None) for i, x in enumerate(vf) if i != B2)
                ok = okc and box_lb(tb, rbox_polys(ch, rlo, rhi), lf[4], vf) >= 0
            elif kind == "D":
                ok = lf[4] in NONID and discard_lb(rbox_polys(ch, rlo, rhi), ROTFE[lf[4]]) > 0
            elif kind == "L":
                ok = allowL and r_in_cube(PAR[form], ch, rlo, rhi)
            else:
                ok = False
            cnt[kind] += 1; cnt["bad"] += (not ok)
        dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(kk_[1], kk_[2])) for kk_ in rl)
        cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
        seen = 0; depth = 0
        while cur:
            need(depth <= dmax, "a branch that does not reach a leaf of R"); depth += 1
            nxt = []
            for ch, a, b in cur:
                if (ch, tuple(a), tuple(b)) in rl:
                    seen += 1; continue
                for p, q in split3(a, b):
                    nxt.append((ch, p, q))
            cur = nxt
        need(seen == len(rl), "covering of the tree of R")
    return cnt


def replay(name, procs=4):
    """Re-check from the records alone (no LP, no floating point): covering of the trees of n and R, the sum of κ of the pairs, the decisions accept / discard / L."""
    t0 = time.time()
    lines = []
    for fi, fn in enumerate(part_files(name)):
        with gzip.open(fn, "rt", encoding="utf-8") as f:
            ls = [json.loads(s) for s in f]
        need(ls[0] == json.loads(json.dumps(header())), "the premises of the record (c̄, k̂, tubes, centres) differ from the current constants")
        lines += ls if fi == 0 else ls[1:]
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same box of n twice")
        nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "splitting limits remain")
    from multiprocessing import Pool
    items = [r for r in nleaves.values()]
    pool = Pool(procs)
    for c in pool.imap_unordered(check_box, items, chunksize=8):
        for kk_, v in c.items():
            cnt[kk_] = cnt.get(kk_, 0) + v
    pool.close()
    dmax = max(sum(round(math.log2(NDEN / (h - l))) for l, h in zip(k_[0], k_[1])) for k_ in nleaves)
    cur = [([0, 0], [NDEN, NDEN])]
    seen = 0; depth = 0
    while cur:
        need(depth <= dmax, "a branch that does not reach a leaf of n"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            if is_out(lo, hi):                       # a box outside D_n need not be in the record (exactly outside)
                continue
            nxt.extend(split2(lo, hi))
        cur = nxt
    need(seen == len(nleaves), f"covering of the tree of n (record {len(nleaves)}, appeared in the tree {seen})")
    print(f"re-check {name}: n boxes ok {cnt['ok']}, out {cnt['out']}, R leaves accepted {cnt['A']}, discarded {cnt['D']}, L {cnt['L']}, "
          f"failed {cnt['bad']}, trees covering n and R OK, sum of κ of pairs OK, {time.time()-t0:.0f} s", flush=True)
    need(cnt["bad"] == 0, "there are failures (not passed)")
    return cnt


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d45_dodintet_far")
    ap.add_argument("--procs", type=int, default=4); ap.add_argument("--forced-exp", type=int, default=6)
    ap.add_argument("--nmin", type=int, default=14); ap.add_argument("--budget", type=int, default=20000)
    ap.add_argument("--wmin-exp", type=int, default=16); ap.add_argument("--tcap", type=int, default=0)
    ap.add_argument("--time-limit", type=int, default=7200); ap.add_argument("--k", type=int, default=16)
    ap.add_argument("--region", default="all"); ap.add_argument("--seed", type=int, default=0); ap.add_argument("--part", type=int, default=0)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.procs, a.forced_exp, a.budget, a.wmin_exp, a.nmin, a.tcap, a.time_limit, part=a.part)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "sample":
        run(a.name, a.procs, a.forced_exp, a.budget, a.wmin_exp, a.nmin, a.tcap or 300, a.time_limit, sample=a.k, region=a.region, seed=a.seed)
    elif a.cmd == "replay":
        replay(a.name, a.procs)
