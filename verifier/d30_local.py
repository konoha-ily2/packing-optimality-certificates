# D30 stages 1 and 2: the local lemma with "a weight w and a pair lift c per box" (Lemma W of D30 §3.1) added. 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. Imports and uses the parts of d16e_local.py (candidates, faces, boxes, lower bounds);
# the existing d16e_* are not changed. Problems such as cubinico are added by d30_problems.install().
#
# Lemma W (D30 §3.1, in the form of review item W1 of FD_d30_review): fix R. Put a nonnegative number a on each term (face f, vertex v); if Σ a n_f + ν R n0 = 0 then S·Σa ≥ Σ a n_f·R v + ν D0.
# A face may carry two terms. In quaternion coordinates (Rq = N R), for terms (f, v, a) and ν' = Σw,
#   F := Σ a·(n_f·Rq v) + N² D0 ν' − S*·N·Σa ≥ 0 ⇒ φ(R) ≥ S* (if a ≥ 0 and F > 0, then Σa > 0 and φ > S* follow together).
# Certificate per box (acceptance is an integer computation only):
#   - first try the same procedure as d16e (a single candidate (J, α), the top 4) in the same order. With --no-lp this is all, and the box counts equal those of d16e.
#   - if not closed, for each choice α of vertices on the active faces, choose weights w_k ≥ 0 of the candidates k matching α and lifts c_f ≥ 0 of the active faces f
#     by a floating-point LP (G ≥ m and a_f/ρ ≥ m at 27 points of the box, maximise m − 10⁻³Σc, review item F7), round to rationals on a 2^-24 grid, and
#     check exactly with check_mix (review item F6: acceptance is check_mix only; --verify redoes every box from the record):
#       a_f = Σ_k w_k A^k_f + c_f ρ (term (f, α(f))), and c_f ρ on the term (−f, −α(f)) (pair lift; n_f + n_{−f} = 0, so E does not change),
#       G = Σ_k w_k G_{(J_k, α)} + Σ_f c_f·2(n_f·Rq α(f) − S* N) (cost of the lift; F = ρ G).
#     Lower bounds: G > 0, a_f ≥ 0 (a_f itself for faces with a_f(0) > 0 at R*, a_f/ρ for faces with a_f(0) = 0).
#     Only G_{(J, α)} whose zero-order identity has been checked are used (if the recorded α is not among the candidates it is built on the spot; failure of the identity means rejection).
#   - the lift is used only if "every container face f has a face −n_f" and "every piece vertex v has −v" (review item F1).
#
# Usage: python -X utf8 d30_local.py <problem> [--no-lp] [--no-lift] [--fault kind] [--name name] [--rho0 fraction]
#                                      [--sstar-shift fraction] [--time-limit seconds] [--max-eval boxes]
#         python -X utf8 d30_local.py --verify <record.json>
#   --fault: nolift (drop the cost of the lift), lift1 (cost coefficient 2 → 1), rho_else (c ρ on the a/ρ branch), rho_pos (c on the a branch). For injected-error tests
import sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
from scipy.optimize import linprog
import d30_problems
d30_problems.install()
import d16e_common as C
from d16e_common import need, QD
import d16e_step0 as S0
import d16e_local as L
from d16e_local import FACES, rho, a1, a2, x, y, z, qds, red, to_int_h, lb_h, CTXH, HDEG

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

WDEN = 2 ** 24
FAULTS = (None, "nolift", "lift1", "rho_else", "rho_pos")


def comb(terms):
    """[(rational coefficient, (tuple of components, den))] → tuple of integer components up to a positive constant factor (enough for sign decisions)."""
    terms = [(Fr(c) / den, pt) for c, (pt, den) in terms if c != 0]
    if not terms:
        return None
    M = 1
    for c, _ in terms:
        M = M * c.denominator // math.gcd(M, c.denominator)
    nbs = len(terms[0][1])
    out = [CTXH.from_dict({}) for _ in range(nbs)]
    for c, pt in terms:
        k = c * M; need(k.denominator == 1, "integrality")
        k = int(k)
        for m in range(nbs):
            out[m] += k * pt[m]
    return tuple(out)


def const_poly(nbs, deg_r):
    """ρ^deg_r (degree HDEG after homogenisation) as a tuple of components."""
    p = CTXH.from_dict({(deg_r, 0, 0, HDEG - deg_r): 1})
    z0 = CTXH.from_dict({})
    return (tuple([p] + [z0] * (nbs - 1)), 1)


def central(lo, hi):
    """Centre and half-width of a box (review item F2: widths and sums are even, so [Cc − W, Cc + W] is exactly the original box)."""
    need(all(h > l and (l + h) % 2 == 0 and (h - l) % 2 == 0 for l, h in zip(lo, hi)), "parity of the box ends (integer centre and half-width)")
    return [(l + h) // 2 for l, h in zip(lo, hi)], [(h - l) // 2 for l, h in zip(lo, hi)]


def split_box(lo, hi):
    """Same splitting as d16e_local (compare widths with the ρ width multiplied by 16, halve the widest axis; ties go to the lower axis index)."""
    w = [h - l for l, h in zip(lo, hi)]
    ws = [w[0] * 16, w[1], w[2]]
    ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


class Ctx:
    """Problem, candidates, per-face polynomials (integer and floating point), and the exact checks (check_single, check_mix)."""

    def __init__(self, P, scale=Fr(1), sstar=None):
        t0 = time.time()
        self.P = P
        self.scale = scale
        self.sstar = P.SSTAR if sstar is None else QD.c(sstar)
        self.an = an = S0.analyse(P)
        self.cands = cands = an["cands"]
        self.act = act = an["act"]
        self.nbs = C.nb()
        # review item F1: assumption of the pair lift (container and piece both centrally symmetric)
        NS = set(P.NORMALS); VS = set(P.VERTS)
        self.sym_ok = all(tuple(-v for v in n) in NS for n in P.NORMALS) and all(tuple(-c for c in v) in VS for v in P.VERTS)
        self.opp_f = {f: P.NORMALS.index(tuple(-v for v in P.NORMALS[f])) for f in range(P.NF)} if self.sym_ok else {}
        self.opp_v = {i: P.VERTS.index(tuple(-c for c in P.VERTS[i])) for i in range(len(P.VERTS))} if self.sym_ok else {}
        # sympy parts
        q = (1, x, y, z)
        self.Rq = sp.Matrix(C.rot_q(q))
        self.N = 1 + x*x + y*y + z*z
        self.sc = sp.Rational(scale.numerator, scale.denominator)
        n0 = sp.Matrix([qds(c) for c in P.N0])
        self.Un = self.Rq * n0
        raw, ident = L.build(P, an, scale, self.sstar)
        self.ident = ident
        self.Asym = {}
        for ci, cd in enumerate(cands):
            Mi = sp.Matrix([[qds(cd["Minv"][r][c]) for c in range(3)] for r in range(3)])
            A = [sp.expand(-(Mi.row(j) * self.Un)[0]) for j in range(3)]
            self.Asym[tuple(cd["J"])] = A
            for fname, sub in FACES.items():
                sbs = {x: sub[0], y: sub[1], z: sub[2]}
                raw[(ci, fname)]["Araw"] = [tuple(sp.expand(e) for e in red(sp.expand(A[j].subs(sbs, simultaneous=True)))) for j in range(3)]
        self.tb_build = time.time() - t0
        sq = [math.sqrt(C._mask_rad(m)) for m in range(self.nbs)]
        self.fl = lambda comps: sp.lambdify((rho, a1, a2), sum(sq[m] * e for m, e in enumerate(comps)), "numpy")
        self.prep = {}
        for key, d in raw.items():
            GI = to_int_h(*d["G"]); HI = [to_int_h(*h) for h in d["H"]]
            AI = [to_int_h(*h) for h in d["Araw"]]
            self.prep[key] = dict(G=GI[0], H=[h[0] for h in HI], zero=d["zero"], fG=self.fl(d["G"]), fH=[self.fl(h) for h in d["H"]],
                                  GI=GI, HI=HI, AI=AI, fA=[self.fl(h) for h in d["Araw"]])
        self.liftI = {}; self.liftF = {}
        for f in act:
            for vi in an["ties"][f]:
                for fname in FACES:
                    pl = self._lift_poly(f, vi, fname)
                    self.liftI[(f, vi, fname)] = to_int_h(*pl)
                    self.liftF[(f, vi, fname)] = self.fl(pl)
        self.alphas = list(itertools.product(*[an["ties"][f] for f in act]))
        self.comp = {}
        for ai, al in enumerate(self.alphas):
            amap = dict(zip(act, al))
            self.comp[ai] = [ci for ci, cd in enumerate(cands) if all(amap[f] == v for f, v in zip(cd["J"], cd["alpha"]))]
        self.bykey = {(tuple(cd["J"]), tuple(cd["alpha"])): ci for ci, cd in enumerate(cands)}
        self.extraG = {}
        self.tb = time.time() - t0

    def _lift_poly(self, f, vi, fname):
        P = self.P
        n = [qds(c) for c in P.NORMALS[f]]
        v = [qds(c) * self.sc for c in P.VERTS[vi]]
        Rq = self.Rq
        Lx = 2 * (sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3)) - qds(self.sstar) * self.N)
        sub = FACES[fname]
        return tuple(sp.expand(e) for e in red(sp.expand(sp.expand(Lx).subs({x: sub[0], y: sub[1], z: sub[2]}, simultaneous=True))))

    def lift_int(self, f, vi, fname):
        key = (f, vi, fname)
        if key not in self.liftI:
            self.liftI[key] = to_int_h(*self._lift_poly(f, vi, fname))
        return self.liftI[key]

    def g_int(self, J, al, fname):
        """G of candidate (J, α) (tuple of integer components, den). An α not in the candidate table is built on the spot; None if the zero-order identity fails."""
        ci = self.bykey.get((tuple(J), tuple(al)))
        if ci is not None:
            return self.prep[(ci, fname)]["GI"]
        key = (tuple(J), tuple(al), fname)
        if key not in self.extraG:
            P = self.P
            A = self.Asym[tuple(J)]
            F = qds(P.D0) * self.sc * self.N**2 - qds(self.sstar) * self.N * sum(A)
            for j in range(3):
                n = [qds(c) for c in P.NORMALS[J[j]]]
                v = [qds(c) * self.sc for c in P.VERTS[al[j]]]
                F += A[j] * sum(n[i] * sum(self.Rq[i, k] * v[k] for k in range(3)) for i in range(3))
            F = sp.expand(F)
            F0 = red(F.subs({x: 0, y: 0, z: 0}))
            if not all(e == 0 for e in F0):
                self.extraG[key] = None
            else:
                sub = FACES[fname]
                GS = tuple(sp.cancel(e / rho) for e in red(sp.expand(F.subs({x: sub[0], y: sub[1], z: sub[2]}, simultaneous=True))))
                need(all(e.is_polynomial(rho, a1, a2) for e in GS), "G is divisible by ρ")
                self.extraG[key] = to_int_h(*(sp.expand(e) for e in GS))
        return self.extraG[key]

    # ----- exact checks -----
    def check_single(self, fname, lo, hi, ci):
        Cc, W = central(lo, hi)
        pr = self.prep[(ci, fname)]
        if lb_h(pr["G"], Cc, W) <= 0:
            return False, "G"
        for j in range(3):
            lb = lb_h(pr["H"][j], Cc, W)
            if (j in pr["zero"] and lb < 0) or (j not in pr["zero"] and lb <= 0):
                return False, f"a{j}"
        return True, "ok"

    def check_mix(self, fname, lo, hi, alpha, w, c, fault=None, skip_g=False):
        """Acceptance decision (integers only). alpha: {face: vertex}, w: {candidate index: rational ≥ 0}, c: {face: rational ≥ 0}. Returns (pass, reason).
        skip_g is used only by test X3 (skips the G check to look at the a check; never used for acceptance).
        Review item V4 (FD_d30s2): verify and run never pass skip_g. A "pass" returned with skip_g=True is not an acceptance."""
        need(fault in FAULTS, "kind of fault")
        Cc, W = central(lo, hi)
        cands, act = self.cands, self.act
        alpha = {int(f): int(v) for f, v in alpha.items()}
        w = {int(k): Fr(v) for k, v in w.items()}
        c = {int(k): Fr(v) for k, v in c.items()}
        if sorted(alpha) != sorted(act) or not all(0 <= v < len(self.P.VERTS) for v in alpha.values()):
            return False, "α must give one vertex per active face"
        if not all(0 <= k < len(cands) for k in w):
            return False, "candidate index"
        if any(v < 0 for v in w.values()):
            return False, "w < 0"
        if any(v < 0 for v in c.values()):
            return False, "c < 0"
        if not all(f in act for f in c):
            return False, "c only on active faces"
        w = {k: v for k, v in w.items() if v > 0}
        c = {k: v for k, v in c.items() if v > 0}
        if not w:
            return False, "w is all zero"
        if c and not self.sym_ok:
            return False, "assumption of the lift (central symmetry) not met"
        # G
        gt = []
        for ci, wk in w.items():
            J = cands[ci]["J"]
            gi = self.g_int(J, [alpha[f] for f in J], fname)
            if gi is None:
                return False, "zero-order identity (G not divisible by ρ)"
            gt.append((wk, gi))
        if fault != "nolift":
            k = Fr(1, 2) if fault == "lift1" else Fr(1)
            gt += [(cf * k, self.lift_int(f, alpha[f], fname)) for f, cf in c.items()]
        Gp = comb(gt)
        if not skip_g and (Gp is None or C.lower_bound_field([L.shift_h(p, Cc, W) for p in Gp]) <= 0):
            return False, "G"
        # a
        for f in act:
            terms0 = [(ci, wk) for ci, wk in w.items() if f in cands[ci]["J"]]
            pos0 = any(cands[ci]["A0"][cands[ci]["J"].index(f)] > 0 for ci, _ in terms0)
            if pos0:
                tt = [(wk, self.prep[(ci, fname)]["AI"][cands[ci]["J"].index(f)]) for ci, wk in terms0]
                if f in c:
                    tt.append((c[f], const_poly(self.nbs, 0 if fault == "rho_pos" else 1)))
            else:
                tt = [(wk, self.prep[(ci, fname)]["HI"][cands[ci]["J"].index(f)]) for ci, wk in terms0]
                if f in c:
                    tt.append((c[f], const_poly(self.nbs, 1 if fault == "rho_else" else 0)))
            ap = comb(tt)
            if ap is None:
                continue                       # the term on this face is 0 (in Lemma W the same as having no term)
            if C.lower_bound_field([L.shift_h(p, Cc, W) for p in ap]) < 0:
                return False, f"a (face {f})"
        return True, "ok"

    # ----- choosing candidates (floating point, never used for acceptance) -----
    def try_mix(self, fname, lo, hi, D, fault=None, no_lift=False, stat=None):
        cands, act, prep = self.cands, self.act, self.prep
        rs = [lo[0] / D, (lo[0] + hi[0]) / 2 / D, hi[0] / D]
        rsa = [max(rs[0], rs[2] / 64), rs[1], rs[2]]
        g1 = [lo[1] / D, (lo[1] + hi[1]) / 2 / D, hi[1] / D]; g2 = [lo[2] / D, (lo[2] + hi[2]) / 2 / D, hi[2] / D]
        PG = np.array(list(itertools.product(rs, g1, g2))); PA = np.array(list(itertools.product(rsa, g1, g2)))
        ev = lambda f, Pt: np.broadcast_to(np.asarray(f(Pt[:, 0], Pt[:, 1], Pt[:, 2]), float), (len(Pt),))
        lift_ok = self.sym_ok and not no_lift
        lk = 0.0 if fault == "nolift" else (0.5 if fault == "lift1" else 1.0)
        results = []
        for ai, al in enumerate(self.alphas):
            K = self.comp[ai]
            if not K:
                continue
            amap = dict(zip(act, al))
            nk, nfc = len(K), len(act)
            nvar = nk + nfc + 1
            rows = []
            Gk = [ev(prep[(ci, fname)]["fG"], PG) for ci in K]
            Lf = [ev(self.liftF[(f, amap[f], fname)], PG) for f in act]
            for p in range(len(PG)):
                row = np.zeros(nvar)
                for i in range(nk): row[i] = -Gk[i][p]
                for j in range(nfc): row[nk + j] = -lk * Lf[j][p]
                row[-1] = 1.0; rows.append(row)
            for j, f in enumerate(act):
                Ak = []
                for i, ci in enumerate(K):
                    cd = cands[ci]
                    if f in cd["J"]:
                        Ak.append((i, ev(prep[(ci, fname)]["fA"][cd["J"].index(f)], PA) / PA[:, 0]))
                for p in range(len(PA)):
                    row = np.zeros(nvar)
                    for i, vals in Ak: row[i] = -vals[p]
                    row[nk + j] = -1.0; row[-1] = 1.0; rows.append(row)
            Aeq = np.zeros((1, nvar)); Aeq[0, :nk] = 1
            obj = np.zeros(nvar); obj[-1] = -1; obj[nk:nk + nfc] = 1e-3          # review item F7: at equal margin prefer the smaller c
            bnd = [(0, None)] * nk + [(0, 64 if lift_ok else 0)] * nfc + [(None, 1)]
            if stat is not None:
                stat["lp_tries"] += 1
            r = linprog(obj, A_ub=np.array(rows), b_ub=np.zeros(len(rows)), A_eq=Aeq, b_eq=[1.0], bounds=bnd, method="highs")
            if r.status == 0 and r.x[-1] > 0:
                results.append((float(r.x[-1]), ai, K, r.x))
        results.sort(key=lambda t: -t[0])
        for marg, ai, K, xs in results[:3]:
            amap = dict(zip(act, self.alphas[ai]))
            w = {ci: Fr(round(xs[i] * WDEN), WDEN) for i, ci in enumerate(K)}
            w = {ci: v for ci, v in w.items() if v > 0}
            c = {f: Fr(math.ceil(xs[len(K) + j] * WDEN - 1e-9), WDEN) for j, f in enumerate(act)}
            c = {f: v for f, v in c.items() if v > 0}
            if not w:
                continue
            # FD_d30s3 H4 (2026-11-13): the LP puts "a_f/rho >= m" on every active face, so faces that are not in J of any
            # weighted candidate also get c_f >= m (a pair with nothing to lift against). Try the version with that c
            # dropped first (acceptance is the same check_mix).
            used = set(f for ci in w for f in cands[ci]["J"])
            c_try = [c]
            if any(f not in used for f in c):
                c_try = [{f: v for f, v in c.items() if f in used}, c]
            for cc in c_try:
                ok, why = self.check_mix(fname, lo, hi, amap, w, cc, fault=fault)
                if ok:
                    return dict(alpha={str(f): v for f, v in amap.items()}, w={str(k): str(v) for k, v in w.items()},
                                c={str(k): str(v) for k, v in cc.items()}, margin=marg)
        return None

    def diag_box(self, fname, lo, hi, D):
        """Diagnosis of a stuck box (floating point): θ at the centre, G and min a of the best single candidate; the angle to the shallowest direction at R* is computed by the caller."""
        cen = [(a + b) / 2 / D for a, b in zip(lo, hi)]
        best = None
        for ci, cd in enumerate(self.cands):
            pr = self.prep[(ci, fname)]
            g = float(pr["fG"](*cen)); hm = min(float(f(*cen)) for f in pr["fH"])
            if best is None or min(g, hm) > min(best[1], best[2]):
                best = (ci, g, hm)
        return dict(rho=cen[0], a1=cen[1], a2=cen[2], best_single=dict(ci=best[0], G=best[1], a_min=best[2]))


def version_info(P):
    """Review item V3 (FD_d30s2): version of the code that made the record (SHA-256) and the strings of S* and R*."""
    import hashlib, os
    here = os.path.dirname(os.path.abspath(__file__))
    sha = {}
    for fn in ("d30_local.py", "d30_problems.py", "d16e_common.py"):
        with open(os.path.join(here, fn), "rb") as fh:
            sha[fn] = hashlib.sha256(fh.read()).hexdigest()
    return dict(SSTAR_str=C.qstr(P.SSTAR), RSTAR_str=[[C.qstr(QD.c(v)) for v in row] for row in P.RSTAR], sha256=sha)


def theta_vec(fname, a1_, a2_):
    sub = FACES[fname]
    return [float(e.subs({rho: 1, a1: a1_, a2: a2_})) for e in sub]


def run(prob, name=None, scale=Fr(1), sstar=None, use_lp=True, fault=None, no_lift=False, wmin_exp=30, quiet=False, save=True,
        time_limit=1800, max_eval=None, P=None, keep_cert=True, ctx=None, omega=None):
    t0 = time.time()
    P = P or C.load(prob)
    name = name or f"d30_{prob}_local"
    cx = ctx or Ctx(P, scale, sstar)
    cands = cx.cands
    info = {"\u5019\u88dc\u306e\u6570": len(cands), "0 \u6b21\u306e\u6052\u7b49\u5f0f": cx.ident, "\u52b9\u304f\u9762": cx.act, "\u540c\u7740": {str(f): v for f, v in cx.an["ties"].items()},  # keys "number of candidates", "zero-order identity", "active faces", "ties"; kept in Japanese (escaped) as written in the local records
            "\u6301\u3061\u4e0a\u3052\u306e\u524d\u63d0\uff08\u70b9\u5bfe\u79f0\uff09": cx.sym_ok}  # key "assumption of the lift (central symmetry)"; kept in Japanese (escaped) as in the records
    D = C.DEN
    r0 = C.RHO0 * D; need(r0.denominator == 1, "RHO0"); r0 = int(r0)
    stats = dict(info=info, faces={}, build_seconds=round(cx.tb, 1))
    cert = {}
    st = dict(lp_tries=0, lp_acc=0, lift_used=0)
    total_ev = 0
    for fname in FACES:
        cur = [([0, -D, -D], [r0, D, D])]
        ev_ = acc = 0; lim = []; used = {}; nmix = 0
        boxes = []
        while cur:
            nxt = []
            for bi, (lo, hi) in enumerate(cur):
                over_t = time.time() - t0 > time_limit
                over_n = max_eval is not None and total_ev >= max_eval
                if over_t or over_n:
                    rest = list(cur[bi:]) + list(nxt)
                    stuck = [cx.diag_box(fname, l, h, D) for l, h in rest[:10]]
                    if omega is not None:
                        om = np.array(omega) / np.linalg.norm(omega)
                        for s_ in stuck:
                            th = np.array(theta_vec(fname, s_["a1"], s_["a2"])); th /= np.linalg.norm(th)
                            s_["angle_to_omega_deg"] = float(min(np.degrees(np.arccos(np.clip(th @ om, -1, 1))),
                                                                 np.degrees(np.arccos(np.clip(-th @ om, -1, 1)))))
                    stats["faces"][fname] = dict(evaluated=ev_, accepted=acc, limit=len(lim), mixed=nmix, pending=len(rest))
                    stats["stopped"] = dict(face=fname, reason="\u6642\u9593" if over_t else "\u7bb1\u306e\u6570", total_evaluated=total_ev,  # reason "time" / "box count" (only in records of stopped runs); kept in Japanese (escaped)
                                            seconds=round(time.time() - t0, 1), stuck=stuck)
                    stats["closed"] = False
                    stats["lp"] = dict(tries=st["lp_tries"], accepted=st["lp_acc"], lift_used_boxes=st["lift_used"])
                    if save:
                        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
                    raise TimeoutError(json.dumps(stats["stopped"], ensure_ascii=False, default=str)[:3000])
                ev_ += 1; total_ev += 1
                Cc, W = central(lo, hi)
                cen = [v / D for v in Cc]
                sc_ = []
                for ci in range(len(cands)):
                    pr = cx.prep[(ci, fname)]
                    hmin = min(float(f(*cen)) for f in pr["fH"])
                    sc_.append((hmin >= -1e-12, float(pr["fG"](*cen)), ci))
                order = [ci for ok_, g, ci in sorted(sc_, key=lambda t: (not t[0], -t[1]))]
                ok = False
                for ci in order[:4]:
                    good, _ = cx.check_single(fname, lo, hi, ci)
                    if good:
                        ok = True; used[ci] = used.get(ci, 0) + 1
                        boxes.append(dict(lo=lo, hi=hi, kind="single", ci=ci)); break
                if not ok and use_lp:
                    mx = cx.try_mix(fname, lo, hi, D, fault=fault, no_lift=no_lift, stat=st)
                    if mx is not None:
                        ok = True; nmix += 1; st["lp_acc"] += 1
                        if mx["c"]:
                            st["lift_used"] += 1
                        boxes.append(dict(lo=lo, hi=hi, kind="mix", **mx))
                if ok:
                    acc += 1; continue
                w = [h - l for l, h in zip(lo, hi)]
                if max(w) <= (D >> wmin_exp):
                    lim.append([[v / D for v in lo], [v / D for v in hi]]); continue
                nxt += list(split_box(lo, hi))
            cur = nxt
        stats["faces"][fname] = dict(evaluated=ev_, accepted=acc, limit=len(lim), used_cand=used, mixed=nmix, limit_boxes=lim[:20])
        cert[fname] = boxes
        if not quiet:
            print(f"face {fname}: evaluated {ev_}, accepted {acc} (weighted {nmix}), split limit {len(lim)}, {round(time.time() - t0, 1)} s", flush=True)
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = all(v["limit"] == 0 for v in stats["faces"].values())
    stats["lp"] = dict(tries=st["lp_tries"], accepted=st["lp_acc"], lift_used_boxes=st["lift_used"])
    stats["params"] = dict(problem=prob, RHO0=str(C.RHO0), scale=str(scale), sstar=str(sstar), wmin_exp=wmin_exp, use_lp=use_lp,
                           fault=fault, no_lift=no_lift, WDEN=WDEN, DEN_exp=C.KDEN, **version_info(P))
    if keep_cert:
        stats["cert"] = cert
    if save:
        json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    if not quiet:
        print(f"== local {name}: closed {stats['closed']}, {stats['seconds']} s, LP accepted {st['lp_acc']}, boxes using the lift {st['lift_used']}", flush=True)
    return stats


def ancestors(root, leaves, split):
    """For each leaf (a set of (lo, hi) pairs), the set of boxes passed when descending from the root by split (excluding the leaf itself).
    Raises if some leaf lies in no child (not a leaf of the binary tree)."""
    anc = set()
    for k in leaves:
        lo, hi = list(k[0]), list(k[1])
        cur = (list(root[0]), list(root[1]))
        while (cur[0], cur[1]) != (lo, hi):
            anc.add((tuple(cur[0]), tuple(cur[1])))
            need(max(h - l for l, h in zip(*cur)) > 2, "a recorded box is not a leaf of the binary tree")
            kids = [c for c in split(*cur) if all(a <= l and h <= b for a, b, l, h in zip(c[0], c[1], lo, hi))]
            need(len(kids) == 1, "a recorded box is not a leaf of the binary tree")
            cur = (list(kids[0][0]), list(kids[0][1]))
    return anc


def verify(path, ctx=None, quiet=False):
    """Review item F6: re-check every box from the certificates in the record only (no LP). Also checks that the boxes are leaves of the binary tree of each face [0, ρ₀] × [−1,1]² and cover it without gaps."""
    t0 = time.time()
    st = json.load(open(path, encoding="utf-8"))
    pr = st["params"]
    need(pr.get("fault") in (None, "None") and not pr.get("fault_nolift", False), "records of injected-error versions are not verified")
    need(pr.get("DEN_exp", C.KDEN) == C.KDEN, "DEN")
    C.RHO0 = Fr(pr["RHO0"])
    P = C.load(pr["problem"])
    need(pr["sstar"] in (None, "None"), "records with shifted S* are not verified")
    need(Fr(pr["scale"]) == 1, "records with a shrunk piece are not verified (review item G1)")
    cx = ctx or Ctx(P, Fr(1), None)
    D = C.DEN
    r0 = C.RHO0 * D; need(r0.denominator == 1, "RHO0"); r0 = int(r0)
    out = dict(record=path, problem=pr["problem"], RHO0=pr["RHO0"], faces={}, bad=[])
    for fname in FACES:
        boxes = st["cert"][fname]
        leaves = {}
        for b in boxes:
            k = (tuple(b["lo"]), tuple(b["hi"]))
            need(k not in leaves, "the same box appears twice")
            leaves[k] = b
        # coverage: leaves of the binary tree, sum of volumes
        anc = ancestors(([0, -D, -D], [r0, D, D]), leaves, split_box)
        seen = 0
        cur = [([0, -D, -D], [r0, D, D])]
        while cur:
            nxt = []
            for lo, hi in cur:
                if (tuple(lo), tuple(hi)) in leaves:
                    seen += 1; continue
                # review item G5 (Q55): with a record missing one leaf, that branch kept descending to width 2 and did not finish.
                # A branch that is not an ancestor of a leaf is declared a hole on the spot (acceptance is unchanged; this only makes it stop).
                need((tuple(lo), tuple(hi)) in anc, "a branch that never reaches a leaf (hole in the coverage)")
                need(max(h - l for l, h in zip(lo, hi)) > 2, "a branch that never reaches a leaf (hole in the coverage)")
                nxt += list(split_box(lo, hi))
            cur = nxt
        need(seen == len(leaves), f"of the {len(leaves)} recorded boxes only {seen} appeared in the tree")
        vol = sum((b["hi"][0] - b["lo"][0]) * (b["hi"][1] - b["lo"][1]) * (b["hi"][2] - b["lo"][2]) for b in boxes)
        need(vol == r0 * (2 * D) * (2 * D), "sum of volumes")
        nok = 0; kinds = {}
        for b in boxes:
            if b["kind"] == "single":
                ok, why = cx.check_single(fname, b["lo"], b["hi"], b["ci"])
            else:
                ok, why = cx.check_mix(fname, b["lo"], b["hi"], b["alpha"], b["w"], b["c"])
            kinds[b["kind"]] = kinds.get(b["kind"], 0) + 1
            nok += ok
            if not ok:
                out["bad"].append(dict(face=fname, lo=b["lo"], hi=b["hi"], why=why))
        out["faces"][fname] = dict(boxes=len(boxes), passed=nok, kinds=kinds, cover="leaves of the binary tree, sum of volumes OK")
        if not quiet:
            print(f"verify face {fname}: boxes {len(boxes)}, passed {nok}, coverage OK", flush=True)
    out["all_passed"] = not out["bad"]
    out["seconds"] = round(time.time() - t0, 1)
    if not quiet:
        print(f"== verify {path}: all passed {out['all_passed']}, {out['seconds']} s", flush=True)
    return out


def r_star_weights(P, an):
    """Check of §2.2: weights of the candidates (per J) making a_f(0) > 0 on all faces active at R*. Chosen by LP, rounded and checked exactly."""
    act = an["act"]
    Js = {}
    for cd in an["cands"]:
        Js.setdefault(tuple(cd["J"]), cd["A0"])
    keys = list(Js)
    nk = len(keys)
    rows = []
    for f in act:
        row = np.zeros(nk + 1)
        for i, J in enumerate(keys):
            if f in J:
                row[i] = -float(Js[J][J.index(f)])
        row[-1] = 1; rows.append(row)
    Aeq = np.zeros((1, nk + 1)); Aeq[0, :nk] = 1
    obj = np.zeros(nk + 1); obj[-1] = -1
    r = linprog(obj, A_ub=np.array(rows), b_ub=np.zeros(len(rows)), A_eq=Aeq, b_eq=[1.0], bounds=[(0, None)] * nk + [(None, None)], method="highs")
    w = [Fr(round(v * 1024), 1024) for v in r.x[:nk]]
    a = {}
    for f in act:
        s = QD(0)
        for i, J in enumerate(keys):
            if f in J:
                s = s + w[i] * Js[J][J.index(f)]
        a[f] = s
    return dict(J=[list(J) for J in keys], A0={str(list(J)): [C.qstr(v) for v in Js[J]] for J in keys},
                w=[str(v) for v in w], a=[C.qstr(a[f]) for f in act], a_min_float=min(float(v) for v in a.values()),
                all_positive=all(v > 0 for v in a.values()), lp_margin=float(-r.fun))


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("prob", nargs="?"); ap.add_argument("--name", default=None)
    ap.add_argument("--no-lp", action="store_true"); ap.add_argument("--no-lift", action="store_true")
    ap.add_argument("--fault", default=None, choices=[f for f in FAULTS if f])
    ap.add_argument("--fault-nolift", action="store_true")
    ap.add_argument("--scale", default="1"); ap.add_argument("--sstar-shift", default="0")
    ap.add_argument("--rho0", default=None)
    ap.add_argument("--time-limit", type=float, default=1800); ap.add_argument("--max-eval", type=int, default=None)
    ap.add_argument("--omega", default=None, help="direction for measuring the angle to stuck boxes (comma separated)")
    ap.add_argument("--verify", default=None)
    a = ap.parse_args()
    if a.verify:
        r = verify(a.verify)
        json.dump(r, open(a.verify.replace(".json", "_verify.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        sys.exit(0 if r["all_passed"] else 2)
    if a.rho0:
        C.RHO0 = Fr(a.rho0)
    fault = "nolift" if a.fault_nolift else a.fault
    sh = Fr(a.sstar_shift)
    P = C.load(a.prob)
    try:
        st = run(a.prob, a.name, scale=Fr(a.scale), sstar=None if sh == 0 else P.SSTAR + sh, use_lp=not a.no_lp,
                 fault=fault, no_lift=a.no_lift, time_limit=a.time_limit, max_eval=a.max_eval, P=P,
                 omega=None if a.omega is None else [float(v) for v in a.omega.split(",")])
    except TimeoutError as e:
        print("stopped", str(e)[:3000], flush=True); sys.exit(3)
    sys.exit(0 if st["closed"] else 2)
