# -*- coding: utf-8 -*-
"""D48 section 7, stage D1 (dodinico_n13, L4″d): the local lemma at the point (II). Acceptance uses only integers and rationals (√5 is sandwiched between integers).
2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
Modelled on d28_local.py (split Q(√5) into 2 parts, boxes in r·θ, flint compose) and d86_local.py (tree with a fixed split rule, replay).
d87_common and d87_dod_step0 are only imported (not modified).

■ Claim (the local lemma L_P)
  Notation follows D48 sections 2 and 4 and d87_common: the container s₀C = {a_f·x ≤ s₀} (a_f is the normal divided so that b_f = 1, 20 faces), the piece K (regular dodecahedron, edge 1),
  the cone Q (the cone of the container vertex v nearest to the piece), w₀ = ρv̂. The orientation of the corner piece is R* (the exact rotation obtained by rounding the quaternion of the record to Q(√5), d87_dod_step0).
  Chart: n = −v + ξ₁e₁ + ξ₂e₂ (e₁ = (1, 0, 0), e₂ = (0, φ/2, −1/2), both orthogonal to v), R = R*·M(q)/|q|², q = (1, p₁, p₂, p₃).
  Region L_P := {|ξ_i| ≤ SN, |p_j| ≤ SP} (default SN = 1/4, SP = 1/8).
  > On all of L_P, G(n, R) := h_K(Rᵀn) + min{n·t : RK + t ⊂ s₀C, t ∈ Q} ≥ n·w₀. Equality only at ξ = p = 0 (the corner piece).
  (Both G and n·w₀ are positively homogeneous in n, so the length of n does not matter. L_P is a cone of n × a neighbourhood of R.)
■ Candidate for the lower bound c = (B, i, (j_f)_{f∈B})
  B: a basis of 3 of the 5 container faces that are active at the equality point (around v). y_B(n) := −A_B^{−T} n (A_B has the a_f of the 3 faces as rows).
     If y_B ≥ 0, by weak duality (dropping the 5 cone faces only enlarges the set of t, so the bound stays a lower bound)
     min_t n·t ≥ Σ_{f∈B} y_f (H_f(R) − s₀), H_f(R) = max_u a_f·Ru ≥ a_f·R u_{j_f}.
  i: h_K(Rᵀn) ≥ n·R u_i (one of the 5 top vertices tied at the equality point). j_f: one of the 2 tied vertices of face f.
  P_c := |q|²·[n·R u_i + Σ_f y_f (a_f·R u_{j_f} − s₀) − n·w₀] (a cubic polynomial in ξ, p with coefficients in Q(√5)).
  Then |q|²·(G − n·w₀) ≥ P_c (where y_B ≥ 0). There are 5 × 5 × 2³ = 200 candidates. P_c(0) = 0 is checked exactly for all of them.
■ Boxes
  z = (ξ₁/SN, ξ₂/SN, p₁/SP, p₂/SP, p₃/SP) = r·θ, ‖θ‖∞ = 1 (10 faces of the 5-dimensional cube), r ∈ [0, 1]. P_c = r·Λ_c.
  For each box (r and the 4 free components of θ), some candidate c has "lower bound of Λ_c > 0" and "lower bounds of the 3 components of y_B ≥ 0" (linear in ξ, exact by the products of the corners of the box).
  Lower bound of Λ_c: move to s ∈ [−1, 1]⁵ and go monomial by monomial (a constant stays, only even powers get min(0, c), the others get −|c|), the √5 part by an integer sandwich.
  If all boxes are accepted, max_c P_c > 0 on L_P \ {0}, so G > n·w₀; at z = 0, G = n·w₀ (checked exactly in (a) of d87_dod_step0).
Usage: python -X utf8 d87_dod_local.py run [--procs 2] [--name d87_dod_local_P] [--sn 1/4] [--sp 1/8]
        python -X utf8 d87_dod_local.py replay [--name d87_dod_local_P]
        python -X utf8 d87_dod_local.py check                    (only the identity of order 0 and the direction of y_B)
        Tests (broken copies, which must not be accepted): --s0-shift 1/1000 (fails at order 0), --lam fraction (subtract fraction·|q|² from Λ_c)
"""
import sys, os, json, gzip, time, math, argparse, itertools, hashlib
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import flint

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from d87_common import QD, S0, PHI, Setup, need, dot, mvec, det3, inv3, transpose
import d87_dod_step0 as D0

HDEG = 5                                    # upper bound of the degree of Λ_c in (r, t) (P_c is cubic in z -> degree 6 in r·t -> divide by r -> 5)
D = 2 ** 40                                 # unit of the box coordinates
SQ_K = 60                                   # digits of the √5 sandwich (multiplied by 2^SQ_K)
_r5 = int(flint.fmpz(5 * 4 ** SQ_K).isqrt())
SQB = [(1 << SQ_K, 1 << SQ_K), (_r5, _r5 + 1)]   # integer sandwich of [1, √5] × 2^SQ_K
need(_r5 * _r5 <= 5 * 4 ** SQ_K < (_r5 + 1) ** 2, "√5 sandwich")
CTXH = flint.fmpz_mpoly_ctx.get(('r', 't1', 't2', 't3', 't4', 'd'), 'lex')
CTX5 = flint.fmpz_mpoly_ctx.get(('s0', 's1', 's2', 's3', 's4'), 'lex')
RT = sp.Symbol("rt5")
X1, X2, P1, P2, P3 = sp.symbols("xi1 xi2 p1 p2 p3")
ZV = (X1, X2, P1, P2, P3)
RS = sp.Symbol("r"); TS = sp.symbols("t1 t2 t3 t4")
E1 = (QD(1), QD(0), QD(0))
E2 = (QD(0), PHI * Fr(1, 2), QD(Fr(-1, 2)))


def qs(x):
    """QD -> sympy (a + b·rt5)."""
    x = QD(x) if not isinstance(x, QD) else x
    a, b = x.v
    return sp.Rational(a.numerator, a.denominator) + sp.Rational(b.numerator, b.denominator) * RT


def red(expr):
    """Simplify with rt5² = 5 to [rational part, part of the coefficient of √5]."""
    p = sp.Poly(sp.expand(expr), RT)
    parts = [sp.Integer(0), sp.Integer(0)]
    for (e,), c in p.terms():
        parts[e % 2] += c * 5 ** (e // 2)
    return [sp.expand(t) for t in parts]


def Mq(q):
    w, x, y, z = q
    return [[w*w + x*x - y*y - z*z, 2*(x*y - w*z), 2*(x*z + w*y)],
            [2*(x*y + w*z), w*w - x*x + y*y - z*z, 2*(y*z - w*x)],
            [2*(x*z - w*y), 2*(y*z + w*x), w*w - x*x - y*y + z*z]]


# ---------------- ties at the equality point (exact) ----------------
def setup_point(s0=S0):
    S = Setup()
    pieces = D0.record_exact(S)
    pc = [p for p in pieces if p["vertex"] == S.vi][0]
    R, t = pc["R"], pc["t"]
    n = tuple(-x for x in S.v)
    need(dot(E1, S.v) == 0 and dot(E2, S.v) == 0, "e₁ and e₂ are not orthogonal to v")
    P = [mvec(R, u) for u in S.KV]
    top = max(dot(n, p) for p in P)
    tops = [i for i, p in enumerate(P) if dot(n, p) == top]
    act, Hties = [], {}
    for f, (a, _, _) in enumerate(S.CF):
        H = max(dot(a, p) for p in P)
        if dot(a, t) == s0 - H:
            act.append(f)
            Hties[f] = [i for i, p in enumerate(P) if dot(a, p) == H]
    # the cone faces are not active at the equality point (t = 2w₀ is in the interior of the cone)
    need(all(dot(g, t) > 0 for g in S.G), "t at the equality point is on the boundary of the cone")
    bases = []
    for B in itertools.combinations(act, 3):
        M = [list(S.CF[f][0]) for f in B]
        if det3(M) == 0:
            continue
        y = mvec(inv3(transpose(M)), tuple(-x for x in n))
        if all(c > 0 for c in y):
            bases.append(B)
    return dict(S=S, R=R, t=t, tops=tops, act=act, Hties=Hties, bases=bases)


def y_lin(S, B):
    """y_B(n) = −A_B^{−T} n at n = −v + ξ₁e₁ + ξ₂e₂ as (constant, coefficient of ξ₁, coefficient of ξ₂) (3 components each, QD)."""
    M = [list(S.CF[f][0]) for f in B]
    T = inv3(transpose(M))
    y0 = mvec(T, tuple(x for x in S.v))
    y1 = mvec(T, tuple(-x for x in E1))
    y2 = mvec(T, tuple(-x for x in E2))
    return y0, y1, y2


# ---------------- polynomials of the candidates ----------------
def components(pt, sn, sp_, s0=S0, lam=Fr(0)):
    """sympy expressions per part (polynomials in z): ('top', i), ('H', B, f, j), ('C', B). The P_c of a candidate = top + Σ_f H + C."""
    S, R = pt["S"], pt["R"]
    q = (sp.Integer(1), P1, P2, P3)
    M = Mq(q)
    Q = sp.expand(1 + P1 ** 2 + P2 ** 2 + P3 ** 2)
    Rs = [[qs(x) for x in row] for row in R]
    RM = [[sp.expand(sum(Rs[i][k] * M[k][j] for k in range(3))) for j in range(3)] for i in range(3)]
    n = [sp.expand(-qs(S.v[i]) + X1 * qs(E1[i]) + X2 * qs(E2[i])) for i in range(3)]

    def RMu(u):
        uu = [qs(x) for x in u]
        return [sp.expand(sum(RM[i][j] * uu[j] for j in range(3))) for i in range(3)]

    comp = {}
    for i in pt["tops"]:
        comp[("top", i)] = sp.expand(sum(n[k] * RMu(S.KV[i])[k] for k in range(3)))
    w0 = [qs(x) for x in S.w0]
    nw0 = sp.expand(sum(n[k] * w0[k] for k in range(3)))
    s0s = qs(s0)
    for B in pt["bases"]:
        y0, y1, y2 = y_lin(S, B)
        ys = [sp.expand(qs(y0[k]) + X1 * qs(y1[k]) + X2 * qs(y2[k])) for k in range(3)]
        for k, f in enumerate(B):
            a = [qs(x) for x in S.CF[f][0]]
            for j in pt["Hties"][f]:
                comp[("H", B, f, j)] = sp.expand(ys[k] * sum(a[m] * RMu(S.KV[j])[m] for m in range(3)))
        comp[("C", B)] = sp.expand(-(s0s * sum(ys) + nw0) * Q)
    cands = []
    for B in pt["bases"]:
        for i in pt["tops"]:
            for js in itertools.product(*[pt["Hties"][f] for f in B]):
                cands.append((B, i, js))
    # identity of order 0 (all candidates)
    z0 = {z: 0 for z in ZV}
    v0 = {k: red(e.subs(z0)) for k, e in comp.items()}
    for B, i, js in cands:
        keys = cand_keys(B, i, js)
        tot = [sum(v0[k][m] for k in keys) for m in range(2)]
        if any(sp.expand(x) != 0 for x in tot):
            raise RuntimeError(f"the identity of order 0 does not hold (candidate {(B, i, js)}: {tot})")
    # for tests: subtract lam·|q|² from Λ_c (lam·r·|q|² from P_c; on a face r = ‖z‖∞ is r). Put it into 'C' (it enters every candidate exactly once)
    return comp, cands, Q, v0


def cand_keys(B, i, js):
    return [("top", i)] + [("H", B, f, j) for f, j in zip(B, js)] + [("C", B)]


def faces5():
    out = []
    for fi in range(5):
        for sg in (1, -1):
            out.append((fi, sg))
    return out


def face_polys(comp, Q, face, sn, sp_, lam=Fr(0)):
    """On the face (fi, sg) put z_fi = sg·r and the others r·t_k, and divide by r. For each part, integer CTXH polynomials of [rational, √5] (common denominator L)."""
    fi, sg = face
    scl = [sp.Rational(sn.numerator, sn.denominator)] * 2 + [sp.Rational(sp_.numerator, sp_.denominator)] * 3
    sub = {}; k = 0
    for i in range(5):
        if i == fi:
            sub[ZV[i]] = scl[i] * sg * RS
        else:
            sub[ZV[i]] = scl[i] * RS * TS[k]; k += 1
    parts = {}
    for key, e in comp.items():
        e0 = e.subs({z: 0 for z in ZV})
        ee = sp.expand((e - e0).subs(sub, simultaneous=True))
        if key[0] == "C" and lam != 0:
            ee = sp.expand(ee - sp.Rational(lam.numerator, lam.denominator) * RS * Q.subs(sub, simultaneous=True))
        pr = red(ee)
        outp = []
        for p in pr:
            p = sp.cancel(p / RS)
            need(p.is_polynomial(RS, *TS), "not divisible by r")
            outp.append(sp.expand(p))
        parts[key] = outp
    den = 1
    for pr in parts.values():
        for p in pr:
            if p != 0:
                for cf in sp.Poly(p, RS, *TS).coeffs():
                    q = int(sp.Rational(cf).q); den = den * q // math.gcd(den, q)
    out = {}
    for key, pr in parts.items():
        lst = []
        for p in pr:
            dct = {}
            if p != 0:
                for mon, cf in sp.Poly(sp.expand(p * den), RS, *TS).terms():
                    need(sum(mon) <= HDEG, "the degree exceeded HDEG")
                    cf = sp.Rational(cf); need(cf.q == 1, "integer conversion")
                    dct[tuple(mon) + (HDEG - sum(mon),)] = int(cf.p)
            lst.append(CTXH.from_dict(dct))
        fl = sp.lambdify((RS, *TS), pr[0] + pr[1] * sp.sqrt(5), "math")
        out[key] = (lst, fl)
    return out, den


def lower_bound(parts):
    """Lower bound of Σ_m (Σ_α c_{m,α} s^α)·√(1, 5)[m] on s ∈ [−1, 1]⁵ × 2^SQ_K (an integer). A monomial with only even powers is on [0, 1]."""
    ts = [dict((mon, int(c)) for mon, c in P.terms()) for P in parts]
    mons = set(ts[0]) | set(ts[1])
    lb = 0
    for mon in mons:
        lo = hi = 0
        for m, t in enumerate(ts):
            c = t.get(mon, 0)
            if c:
                a, b = SQB[m]
                if c > 0:
                    lo += c * a; hi += c * b
                else:
                    lo += c * b; hi += c * a
        if all(e == 0 for e in mon):
            lb += lo
        elif all(e % 2 == 0 for e in mon):
            lb += min(0, lo)
        else:
            lb -= max(abs(lo), abs(hi))
    return lb


def shift_h(poly, lo, hi):
    Cc = [(l + h) // 2 for l, h in zip(lo, hi)]; W = [(h - l) // 2 for l, h in zip(lo, hi)]
    s = CTX5.gens()
    dd = CTX5.from_dict({(0,) * 5: D})
    return poly.compose(*[Cc[i] + W[i] * s[i] for i in range(5)], dd, ctx=CTX5)


def y_ok(ylin, face, lo, hi, sn):
    """y_B's 3 components ≥ 0 on the box (exact). ξ_i = SN·r·θ_i. On the face, θ is ±1 at fi and t elsewhere."""
    fi, sg = face
    r = (Fr(lo[0], D), Fr(hi[0], D))
    th = []; k = 1
    for i in range(2):
        if i == fi:
            th.append((Fr(sg), Fr(sg)))
        else:
            th.append((Fr(lo[k], D), Fr(hi[k], D)))
        if i != fi:
            k += 1
    xr = []
    for i in range(2):
        prods = [a * b for a in r for b in th[i]]
        xr.append((sn * min(prods), sn * max(prods)))
    y0, y1, y2 = ylin
    for m in range(3):
        val = y0[m]
        for c, (a, b) in ((y1[m], xr[0]), (y2[m], xr[1])):
            val = val + min(c * a, c * b)
        if not val >= 0:
            return False
    return True


def split(lo, hi):
    """Fixed split rule: count the width of r twice (r is in [0, 1], t in [−1, 1]) and halve the widest axis (ties go to the smaller index)."""
    w = [h - l for l, h in zip(lo, hi)]
    ws = [w[0] * 2] + w[1:]
    ax = max(range(5), key=lambda k: (ws[k], -k))
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


ROOT = ([0, -D, -D, -D, -D], [D, D, D, D, D])


class FaceRun:
    def __init__(self, pt, comp, cands, Q, face, sn, sp_, lam):
        self.face = face; self.sn = sn
        self.fp, self.den = face_polys(comp, Q, face, sn, sp_, lam)
        self.cands = cands
        self.ylin = {B: y_lin(pt["S"], B) for B in pt["bases"]}
        self.keys = [cand_keys(*c) for c in cands]

    def check_leaf(self, lo, hi, ci, cache=None):
        # stage D7 (Fable's point 3): the centre and half-width of shift_h are not truncated (the width is a positive even number)
        need(all((h - l) % 2 == 0 and h > l for l, h in zip(lo, hi)), "the width of a local box is not a positive even number")
        B = self.cands[ci][0]
        if not y_ok(self.ylin[B], self.face, lo, hi, self.sn):
            return False
        if cache is None:
            cache = {}
        G = None
        for k in self.keys[ci]:
            if k not in cache:
                cache[k] = [shift_h(p, lo, hi) for p in self.fp[k][0]]
            G = list(cache[k]) if G is None else [a + b for a, b in zip(G, cache[k])]
        return lower_bound(G) > 0

    def run(self, wmin_exp=22, time_limit=3600, t0=None, log=None):
        t0 = t0 or time.time()
        cur = [ROOT]; ev = acc = 0; lim = []; used = {}; leaves = []
        while cur:
            nxt = []
            for lo, hi in cur:
                if time.time() - t0 > time_limit:
                    raise RuntimeError("time limit exceeded")
                ev += 1
                cen = [(l + h) / 2 / D for l, h in zip(lo, hi)]
                fv = {k: v[1](*cen) for k, v in self.fp.items()}
                yv = {B: y_ok(yl, self.face, lo, hi, self.sn) for B, yl in self.ylin.items()}
                sc = sorted(((sum(fv[k] for k in ks), ci) for ci, ks in enumerate(self.keys)
                             if yv[self.cands[ci][0]]), reverse=True)
                cache = {}; ok = None
                for v, ci in sc[:6]:
                    if self.check_leaf(lo, hi, ci, cache):
                        ok = ci; break
                if ok is not None:
                    acc += 1; used[ok] = used.get(ok, 0) + 1
                    leaves.append((lo, hi, ok)); continue
                w = [h - l for l, h in zip(lo, hi)]
                if max(w[1:] + [2 * w[0]]) <= (2 * D >> wmin_exp):
                    lim.append([[v / D for v in lo], [v / D for v in hi]]); continue
                nxt.extend(split(lo, hi))
            cur = nxt
        return dict(face=list(self.face), evaluated=ev, accepted=acc, limit=len(lim), limit_boxes=lim[:20],
                    used_cand={str(self.cands[k]): v for k, v in sorted(used.items(), key=lambda t: -t[1])[:10]},
                    n_cand_used=len(used), seconds=round(time.time() - t0, 1)), leaves


def header(sn, sp_, s0, lam):
    return dict(kind="P", SN=str(sn), SP=str(sp_), s0=str(s0), lam=str(lam), HDEG=HDEG, D=D, SQ_K=SQ_K,
                chart="n = −v + ξ₁(1,0,0) + ξ₂(0,φ/2,−1/2)\u3001R = R*·M(1,p)/|q|²\u3001|ξ|∞ ≤ SN\u30fb|p|∞ ≤ SP",
                sources=sha_sources())


def sha_sources():
    out = {}
    for fn in ("d87_dod_local.py", "d87_common.py", "d87_dod_step0.py", "d16e_common.py"):
        with open(os.path.join(HERE, fn), "rb") as f:
            out[fn] = hashlib.sha256(f.read()).hexdigest()[:16]
    return out


_PT = {}


def _face_worker(args):
    face, sn, sp_, s0, lam, wmin_exp, time_limit = args
    t0 = time.time()
    pt = setup_point()
    comp, cands, Q, _ = components(pt, sn, sp_, s0, lam)
    fr_ = FaceRun(pt, comp, cands, Q, tuple(face), sn, sp_, lam)
    st, leaves = fr_.run(wmin_exp, time_limit, t0)
    return st, [(lo, hi, ci) for lo, hi, ci in leaves]


def do_check(sn, sp_, s0=S0):
    t0 = time.time()
    pt = setup_point()
    comp, cands, Q, _ = components(pt, sn, sp_, s0)
    S = pt["S"]
    # range of y_B ≥ 0 (at the corners of the square |ξ|∞ ≤ SN, per basis)
    yinfo = {}
    for B in pt["bases"]:
        y0, y1, y2 = y_lin(S, B)
        corners = [(a, b) for a in (-sn, sn) for b in (-sn, sn)]
        mins = [min(float(y0[m] + y1[m] * a + y2[m] * b) for a, b in corners) for m in range(3)]
        yinfo[str(B)] = [round(x, 4) for x in mins]
    info = dict(tops=pt["tops"], active_faces=pt["act"], H_ties={str(k): v for k, v in pt["Hties"].items()},
                bases=[list(B) for B in pt["bases"]], n_cand=len(cands),
                zero_order="\u5168\u5019\u88dc\u3067 P_c(0) = 0\uff08Q(√5) \u3067\u6b63\u78ba\uff09", y_min_on_square_corners=yinfo,
                seconds=round(time.time() - t0, 1))
    return info


def do_run(name, sn, sp_, procs, s0=S0, lam=Fr(0), wmin_exp=22, time_limit=3600, save=True):
    t0 = time.time()
    info = do_check(sn, sp_, s0)
    print(f"premises: {json.dumps(info, ensure_ascii=False)}", flush=True)
    jobs = [(f, sn, sp_, s0, lam, wmin_exp, time_limit) for f in faces5()]
    if procs > 1:
        import multiprocessing as mp
        with mp.Pool(procs) as pool:
            res = []
            for st, lv in pool.imap_unordered(_face_worker, jobs):
                print(f"  face {st['face']}: evaluated {st['evaluated']}, accepted {st['accepted']}, split limit {st['limit']}, "
                      f"candidates used {st['n_cand_used']} ({st['seconds']} s)", flush=True)
                res.append((st, lv))
    else:
        res = []
        for j in jobs:
            st, lv = _face_worker(j)
            print(f"  face {st['face']}: evaluated {st['evaluated']}, accepted {st['accepted']}, split limit {st['limit']} ({st['seconds']} s)", flush=True)
            res.append((st, lv))
    res.sort(key=lambda t: faces5().index(tuple(t[0]["face"])))
    stats = dict(task="L4″d \u6bb5 D1\uff08D48 7 \u7bc0\u306e\u8868 D1\uff09\uff1adodinico_n13 \u306e (II) \u306e\u70b9\u306e\u5c40\u6240", header=header(sn, sp_, s0, lam),
                 premises=info, faces=[st for st, _ in res], leaves=sum(len(lv) for _, lv in res),
                 evaluated=sum(st["evaluated"] for st, _ in res),
                 closed=all(st["limit"] == 0 for st, _ in res), seconds=round(time.time() - t0, 1),
                 note="\u53d7\u7406\u306f\u6574\u6570\u30fb\u6709\u7406\u6570\u3060\u3051\uff08√5 \u306f 2^60 \u500d\u306e\u6574\u6570\u3067\u631f\u3080\uff09\u3002\u6d6e\u52d5\u306f\u5019\u88dc\u306e\u9078\u3073\u65b9\u3060\u3051\u306b\u4f7f\u3046\u3002\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")
    if save:
        with open(os.path.join(HERE, f"{name}.json"), "w", encoding="utf-8") as f:
            json.dump(stats, f, ensure_ascii=False, indent=1)
        with gzip.open(os.path.join(HERE, f"{name}.leaves.jsonl.gz"), "wt", encoding="utf-8") as f:
            f.write(json.dumps(stats["header"], ensure_ascii=False) + "\n")
            for st, lv in res:
                for lo, hi, ci in lv:
                    f.write(json.dumps(dict(face=st["face"], lo=lo, hi=hi, c=ci)) + "\n")
    print(f"== local {name}: all trees accepted {stats['closed']}, leaves {stats['leaves']}, evaluated {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def _replay_face(args):
    face, sn, sp_, s0, lam, lv = args
    pt = setup_point()
    comp, cands, Q, _ = components(pt, sn, sp_, s0, lam)
    fr_ = FaceRun(pt, comp, cands, Q, tuple(face), sn, sp_, lam)
    bad = sum(0 if fr_.check_leaf(list(lo), list(hi), ci) else 1 for (lo, hi), ci in lv.items())
    # covering: split from the root by the fixed rule; every branch must end at a leaf of the record
    cur = [ROOT]; seen = 0; depth = 0
    while cur:
        need(len(cur) <= len(lv) - seen, "hole in the cover (a box without a leaf)")
        need(depth <= 5 * 40, "branch that does not reach a leaf"); depth += 1   # widths are even (≥ 2): r goes 2^40 -> halve 39 times, t goes 2^41 -> halve 40 times
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in lv:
                seen += 1; continue
            nxt.extend(split(lo, hi))
        cur = nxt
    need(seen == len(lv), f"covering tree (face {face})")
    return list(face), len(lv), bad


def do_replay(name, procs=1):
    t0 = time.time()
    with gzip.open(os.path.join(HERE, f"{name}.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    sn, sp_, s0, lam = Fr(hd["SN"]), Fr(hd["SP"]), S0 if hd["s0"] == str(S0) else None, Fr(hd["lam"])
    need(s0 is not None and lam == 0, "the record is not a broken copy")
    hd_now = header(sn, sp_, S0, lam)
    for k in ("SN", "SP", "s0", "lam", "HDEG", "D", "SQ_K", "chart"):
        need(hd[k] == hd_now[k], f"premise {k} of the record differs from now")
    if hd["sources"] != hd_now["sources"]:
        print(f"note: the SHA-256 (first 16 digits) of the files at creation differs from now: {hd['sources']} -> {hd_now['sources']}", flush=True)
    info = do_check(sn, sp_, S0)
    print(f"premises OK: candidates {info['n_cand']}, identity of order 0", flush=True)
    by = {}
    for r in lines[1:]:
        by.setdefault(tuple(r["face"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = r["c"]
    need(set(by) == set(faces5()), "the leaves of the faces are incomplete")
    jobs = [(f, sn, sp_, S0, lam, by[f]) for f in faces5()]
    if procs > 1:
        import multiprocessing as mp
        with mp.Pool(procs) as pool:
            out = list(pool.imap_unordered(_replay_face, jobs))
    else:
        out = [_replay_face(j) for j in jobs]
    n = sum(o[1] for o in out); bad = sum(o[2] for o in out)
    print(f"re-check local P {name}: leaves {n}, failed {bad}, covering tree OK (10 faces), {time.time() - t0:.0f} s", flush=True)
    need(bad == 0, "some leaves failed")
    return dict(leaves=n, bad=bad, seconds=round(time.time() - t0, 1), per_face=sorted(out))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["run", "replay", "check"])
    ap.add_argument("--name", default="d87_dod_local_P")
    ap.add_argument("--procs", type=int, default=2)
    ap.add_argument("--sn", default="1/4"); ap.add_argument("--sp", default="1/8")
    ap.add_argument("--s0-shift", default="0"); ap.add_argument("--lam", default="0")
    ap.add_argument("--wmin-exp", type=int, default=22)
    ap.add_argument("--time-limit", type=int, default=3600)
    ap.add_argument("--no-save", action="store_true")
    a = ap.parse_args()
    sn, sp_ = Fr(a.sn), Fr(a.sp)
    s0 = S0 + Fr(a.s0_shift)
    if a.cmd == "check":
        print(json.dumps(do_check(sn, sp_, s0), ensure_ascii=False, indent=1))
    elif a.cmd == "run":
        st = do_run(a.name, sn, sp_, a.procs, s0, Fr(a.lam), a.wmin_exp, a.time_limit, save=not a.no_save)
        sys.exit(0 if st["closed"] else 2)
    else:
        r = do_replay(a.name, a.procs)
        with open(os.path.join(HERE, f"{a.name}.replay.json"), "w", encoding="utf-8") as f:
            json.dump(r, f, ensure_ascii=False, indent=1)
