# D44 stage 3b: the local part with quadratic boxes (plan C, Lemma Q = D44 section 3.2). Written by Claude (Opus 5.5), 2026-11-14.
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. The existing d16e_* and d30_* are not changed (they are imported).
#
# The center is R-hat (in d44's Problem R = I, and p = 0 on map 0). L = {||p||_inf <= rho_0}, p = rho*theta (theta is one of the 6 faces of the cube, d16e_local.FACES).
# A candidate k = (J, alpha): J is 3 faces of the container (M_J = [n_j] regular), alpha is one vertex for each face of J (chosen in floating point from the faces and vertices that are active or likely to be active at R-hat;
#   the choice does not enter acceptance. The sign of A(0) is not required either: A >= 0 is checked exactly for each box). A = -M_J^-1 R_q n0 (quaternion coordinates, R_q = N R).
#   Phi_k := sum_j A_j n_j.R_q v_j + N^2 D0 - S-bar*N*sum A = N*sum A*(B_k - S-bar), B_k = sum lambda_j n_j.R v_j + mu D0 (lambda = A/sum A, mu = N/sum A).
#   If A_j >= 0 (j = 1,2,3) on the whole box, then lambda >= 0, mu > 0, sum lambda n + mu R n0 = 0, and by weak duality phi(R) >= B_k (the case of Lemma W with one term each).
# Lemma Q: for rational weights w_k >= 0 (at least one nonzero) such that for each candidate with w_k > 0 we have A^(k) >= 0 on the whole box, and sum w_k Phi_k > 0, then
#   N(phi - S-bar)*sum w_k sum A_k >= sum w_k Phi_k > 0 (sum A_k > 0 follows from A >= 0, A != 0; A != 0 because R_q n0 != 0). Hence phi > S-bar.
# Acceptance (ii): for each face Phi_k = e_k + rho g_k(theta) + rho^2 H_k(theta, rho) (an identity; the reassembly is checked with sympy).
#   e := a rational lower bound of sum w_k e_k, g := lb(sum w_k g_k), h := lb(sum w_k H_k) (over the box, exact); since rho >= 0, sum w_k Phi_k >= e + g rho + h rho^2.
#   Accept if the minimum of this quadratic over rho in [rho_a, rho_b] (the two ends, and the vertex if h > 0 and the vertex is inside) is > 0.
# Far-type boxes (kind "far", added 2026-11-14): for a box with rho > 0 where Lemma Q does not pass (e.g. a box that straddles a face lambda_f = 0 where the dual basis changes;
#   A >= 0 for each candidate cannot straddle a basis boundary), judge an axis-aligned box of map 0 that contains the local box (coordinates of p, rounded outward with even width)
#   by d16e_far.check_box (constant multipliers, E.t >= min T E.w; the same acceptance, the same T and the same S-bar as the far field). There is no new argument (it is the far-field acceptance itself).
#   The replay checks "that p-box contains the local box" in integers and then redoes check_box.
# The KKT polishing (R*, w*) is used only where R-hat is chosen (d44_problems). Candidates and weights are chosen in floating point and acceptance uses only exact numbers (viewpoint of Q98).
#
# Usage: python -X utf8 d44_local.py run <pair> [--k 9] [--sbar fraction] [--rho0 1/32] [--name name] [--time-limit seconds] [--max-eval boxes]
#                                         [--fault flipH|noA|wshift] (for tests with an injected error)
#         python -X utf8 d44_local.py verify <record.json>
import os, sys, json, time, math, argparse, itertools, hashlib
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
from scipy.optimize import linprog
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
from d16e_common import need, QD
import d16e_local as L
from d16e_local import FACES, rho, a1, a2, x, y, z, qds, red, to_int_h, HDEG, CTXH
import d44_far as DF
import d16e_far as F

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

WDEN = 2 ** 40
QLAM_EXP = 48          # denominator of the multipliers of far-type boxes (the same 2^(4k+12) as k = 9 of stage 1)
EBITS = 200
FAULTS = (None, "flipH", "noA", "wshift")


def central(lo, hi):
    need(all(h > l and (l + h) % 2 == 0 and (h - l) % 2 == 0 for l, h in zip(lo, hi)), "parity of box ends (center and half-width are integers)")
    return [(l + h) // 2 for l, h in zip(lo, hi)], [(h - l) // 2 for l, h in zip(lo, hi)]


def split_box(lo, hi):
    """The same way of splitting as d16e_local and d30_local (compare after multiplying the width of rho by 16, and halve the widest axis)."""
    w = [h - l for l, h in zip(lo, hi)]
    ws = [w[0] * 16, w[1], w[2]]
    ax = max(range(3), key=lambda k: ws[k]); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def comb_exact(terms):
    """[(rational w, (tuple of integer components, den))] -> (tuple of integer components, M), value = tuple of components / M (M > 0)."""
    terms = [(Fr(c) / den, pt) for c, (pt, den) in terms if c != 0]
    need(terms, "no terms")
    M = 1
    for c, _ in terms:
        M = M * c.denominator // math.gcd(M, c.denominator)
    nbs = len(terms[0][1])
    out = [CTXH.from_dict({}) for _ in range(nbs)]
    for c, pt in terms:
        k = c * M; need(k.denominator == 1, "integer conversion")
        k = int(k)
        for m in range(nbs):
            out[m] += k * pt[m]
    return tuple(out), M


def lb_true(pt_M, Cc, W):
    """Lower bound (rational) of a polynomial (value = tuple of components / M) over a box. lower_bound_field returns a lower bound of value*M*DEN^HDEG*2^SQ_K."""
    pt, M = pt_M
    lb = C.lower_bound_field([L.shift_h(p, Cc, W) for p in pt])
    return Fr(lb, M * C.DEN ** HDEG * 2 ** C.SQ_K)


def qd_lower(v):
    lo, hi = QD.c(v).bounds(EBITS)
    return Fr(lo, 2 ** EBITS)


def quad_min(e, g, h, ra, rb):
    """Minimum (rational, exact) of e + g rho + h rho^2 over rho in [ra, rb]."""
    vals = [e + g * ra + h * ra * ra, e + g * rb + h * rb * rb]
    if h > 0:
        r = -g / (2 * h)
        if ra < r < rb:
            vals.append(e - g * g / (4 * h))
    return min(vals)


SLACK_TOL = 0.1      # faces to include as candidates: slack at R-hat below this (active faces, and faces that become active inside rho_0)
GAP_TOL = 0.1        # vertices to include as candidates: gap from the support value of that face below this


AXIS = {"x": 0, "y": 1, "z": 2}


def pbox_of(fname, lo, hi):
    """The p-box of map 0 (integers in DEN units, width a positive even number) containing the local box (face fname, rho in [lo0, hi0], a in [lo1, hi1]x[lo2, hi2], DEN units)."""
    D = C.DEN
    k = AXIS[fname[0]]; sg = 1 if fname[2] == "+" else -1
    others = [i for i in range(3) if i != k]
    plo = [0] * 3; phi = [0] * 3
    if sg > 0:
        plo[k], phi[k] = lo[0], hi[0]
    else:
        plo[k], phi[k] = -hi[0], -lo[0]
    for j, i in enumerate(others):
        al, ah = lo[1 + j], hi[1 + j]
        cands = [lo[0] * al, lo[0] * ah, hi[0] * al, hi[0] * ah]
        plo[i] = min(cands) // D                       # floor (outward)
        phi[i] = -((-max(cands)) // D)                 # ceiling (outward)
    for i in range(3):
        if plo[i] % 2:
            plo[i] -= 1
        if phi[i] % 2:
            phi[i] += 1
        if phi[i] == plo[i]:
            phi[i] += 2
    return plo, phi


def pbox_contains(fname, lo, hi, plo, phi):
    """Check in integers that the p-box contains the local box (for rho >= 0, p_i = rho a_i is bilinear in rho and a_i, so the 4 corners suffice)."""
    D = C.DEN
    k = AXIS[fname[0]]; sg = 1 if fname[2] == "+" else -1
    others = [i for i in range(3) if i != k]
    if lo[0] < 0:
        return False
    if sg > 0:
        if not (plo[k] <= lo[0] and hi[0] <= phi[k]):
            return False
    else:
        if not (plo[k] <= -hi[0] and -lo[0] <= phi[k]):
            return False
    for j, i in enumerate(others):
        for r in (lo[0], hi[0]):
            for a in (lo[1 + j], hi[1 + j]):
                if not (plo[i] * D <= r * a <= phi[i] * D):
                    return False
    return all((h - l) % 2 == 0 and h > l for l, h in zip(plo, phi))


def near_active(P, tol=SLACK_TOL, gap=GAP_TOL):
    """Faces that are active or likely to be active at R-hat (R = I), and vertices that nearly tie (floating point. This only chooses candidates and does not enter acceptance)."""
    rows = P.rows(C.eye())
    A = np.array([[float(v) for v in r[0]] for r in rows]); b = np.array([float(r[1]) for r in rows])
    res = linprog([0, 0, 0, 1], A_ub=A, b_ub=b, bounds=[(None, None)] * 4, method="highs")
    need(res.status == 0, "LP (floating point)")
    slack = b - A @ res.x
    act = [f for f in range(P.NF) if slack[f] < tol]
    h = P.VF @ P.NCF.T
    ties = {f: [vi for vi in range(len(P.VERTS)) if h[vi, f] > h[:, f].max() - gap] for f in act}
    return act, ties, float(res.x[3]), slack


class Ctx:
    def __init__(self, P, Sbar, cand_list=None):
        t0 = time.time()
        self.P = P
        self.Sbar = Fr(Sbar)
        act, ties, Sf, slack = near_active(P)
        self.act, self.ties, self.S_float = act, ties, Sf
        if cand_list is None:
            cand_list = []
            for J in itertools.combinations(act, 3):
                for al in itertools.product(*[ties[f] for f in J]):
                    cand_list.append((list(J), list(al)))
        q = (1, x, y, z)
        Rq = sp.Matrix(C.rot_q(q))
        N = 1 + x*x + y*y + z*z
        n0 = sp.Matrix([qds(c) for c in P.N0])
        Un = Rq * n0
        Sb = sp.Rational(self.Sbar.numerator, self.Sbar.denominator)
        sq = [math.sqrt(C._mask_rad(m)) for m in range(C.nb())]
        fl = lambda comps: sp.lambdify((rho, a1, a2), sum(sq[m] * e for m, e in enumerate(comps)), "numpy")
        self.cands = []
        self.skipped = []
        for J, al in cand_list:
            M = [[P.NORMALS[J[c]][r] for c in range(3)] for r in range(3)]
            if C.det3(M) == 0:
                self.skipped.append(dict(J=J, alpha=al, why="M_J \u7279\u7570")); continue
            Mi = C.inv3(M)
            A0 = [-a for a in C.mvec(Mi, P.N0)]
            Mis = sp.Matrix([[qds(Mi[r][c]) for c in range(3)] for r in range(3)])
            A = [sp.expand(-(Mis.row(j) * Un)[0]) for j in range(3)]
            Phi = qds(P.D0) * N**2 - Sb * N * sum(A)
            for j in range(3):
                n = [qds(c) for c in P.NORMALS[J[j]]]
                v = [qds(c) for c in P.VERTS[al[j]]]
                Phi += A[j] * sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3))
            Phi = sp.expand(Phi)
            e_comps = red(Phi.subs({x: 0, y: 0, z: 0}))
            e_qd = QD(*[Fr(int(sp.Rational(c).p), int(sp.Rational(c).q)) for c in e_comps])
            cd = dict(J=list(J), alpha=list(al), A0=[C.qstr(a) for a in A0], e=e_qd, faces={})
            for fname, sub in FACES.items():
                sbs = {x: sub[0], y: sub[1], z: sub[2]}
                PS = red(sp.expand(Phi.subs(sbs, simultaneous=True)))
                gS, HS = [], []
                for m, ecomp in enumerate(PS):
                    pol = sp.Poly(ecomp, rho, a1, a2)
                    e0 = sp.Integer(0); g1 = sp.Integer(0); hh = sp.Integer(0)
                    for (i, j, k), cf in pol.terms():
                        mon = a1**j * a2**k
                        if i == 0:
                            need(j == 0 and k == 0, "the rho^0 term is constant"); e0 += cf
                        elif i == 1:
                            g1 += cf * mon
                        else:
                            hh += cf * rho**(i - 2) * mon
                    need(sp.simplify(e0 - e_comps[m]) == 0, "e does not depend on the face")
                    need(sp.expand(e0 + rho * g1 + rho**2 * hh - ecomp) == 0, "reassembly of Phi = e + rho g + rho^2 H")
                    gS.append(sp.expand(g1)); HS.append(sp.expand(hh))
                AS = [tuple(sp.expand(e) for e in red(sp.expand(A[j].subs(sbs, simultaneous=True)))) for j in range(3)]
                cd["faces"][fname] = dict(gI=to_int_h(*gS), HI=to_int_h(*HS), AI=[to_int_h(*a) for a in AS],
                                          fPhi=fl(PS), fA=[fl(a) for a in AS], fg=fl(gS), fH=fl(HS))
            self.cands.append(cd)
        need(self.cands, "no candidates")
        # Tools for far-type boxes (build a separate d16e_far P, and put S-bar in the watchdog SSTAR. It does not enter the acceptance formula: P1)
        # Note (A3d'): F.QLAM and F.P.SSTAR overwrite module values of d16e_far. If two Ctx with different S-bar are built in one process,
        #   the far-type boxes of the earlier Ctx stop at the watchdog (S-bar >= SSTAR) (the safe side).
        F.setup(P.name)
        F.QLAM = 2 ** QLAM_EXP
        F.P.SSTAR = QD(self.Sbar)
        self.T = F.P.default_T(self.Sbar)
        self.tb = round(time.time() - t0, 1)

    # ----- exact judgement -----
    def check(self, fname, lo, hi, w, fault=None, detail=False):
        """w: {candidate index: rational >= 0}. Returns (pass/fail, reason[, value]). Acceptance is only integer and rational arithmetic."""
        need(fault in FAULTS, "fault")
        Cc, W = central(lo, hi)
        w = {int(k): Fr(v) for k, v in w.items()}
        if not all(0 <= k < len(self.cands) for k in w):
            return False, "candidate index"
        if any(v < 0 for v in w.values()):
            return False, "w < 0"
        w = {k: v for k, v in w.items() if v > 0}
        if not w:
            return False, "w is all 0"
        if fault != "noA":
            for k in w:
                for j, AI in enumerate(self.cands[k]["faces"][fname]["AI"]):
                    if L.lb_h(AI[0], Cc, W) < 0:
                        return False, f"A (candidate {k}, j = {j})"
        e = qd_lower(sum((QD.c(wk) * self.cands[k]["e"] for k, wk in w.items()), QD(0)))
        g = lb_true(comb_exact([(wk, self.cands[k]["faces"][fname]["gI"]) for k, wk in w.items()]), Cc, W)
        h = lb_true(comb_exact([(wk, self.cands[k]["faces"][fname]["HI"]) for k, wk in w.items()]), Cc, W)
        if fault == "flipH":
            h = -h
        ra, rb = Fr(lo[0], C.DEN), Fr(hi[0], C.DEN)
        need(ra >= 0, "ρ ≥ 0")
        mn = quad_min(e, g, h, ra, rb)
        if mn <= 0:
            return (False, "quadratic", dict(e=float(e), g=float(g), h=float(h), min=float(mn))) if detail else (False, "quadratic")
        return (True, "ok", dict(e=float(e), g=float(g), h=float(h), min=float(mn))) if detail else (True, "ok")

    def check_far(self, fname, lo, hi, plo, phi, L_, M_, verts):
        """Far-type box: the p-box contains the local box and d16e_far.check_box accepts it."""
        if not pbox_contains(fname, lo, hi, plo, phi):
            return False, "the p-box does not contain the local box"
        ok, _ = F.check_box(0, plo, phi, L_, M_, verts, self.Sbar, self.T)
        return ok, ("ok" if ok else "far acceptance")

    def try_far(self, fname, lo, hi):
        if lo[0] == 0:
            return None
        plo, phi = pbox_of(fname, lo, hi)
        c = np.array([(l + h) / 2 / C.DEN for l, h in zip(plo, phi)])
        r = F.lp_f(C.rot_f(np.concatenate([[1.0], c])))
        if r is None:
            return None
        v, lam, mu, verts = r
        if v < float(self.Sbar):
            return None
        L_, M_ = F.round_mult(lam, mu)
        ok, _ = self.check_far(fname, lo, hi, plo, phi, L_, M_, verts)
        return dict(plo=plo, phi=phi, L=L_, M=M_, v=verts) if ok else None

    # ----- choose the weights (floating point, does not enter acceptance) -----
    def pts(self, lo, hi):
        D = C.DEN
        rs = [lo[0] / D, (lo[0] + hi[0]) / 2 / D, hi[0] / D]
        rs[0] = max(rs[0], rs[2] / 64)
        g1 = [lo[1] / D, (lo[1] + hi[1]) / 2 / D, hi[1] / D]; g2 = [lo[2] / D, (lo[2] + hi[2]) / 2 / D, hi[2] / D]
        return np.array(list(itertools.product(rs, g1, g2)))

    def choose(self, fname, lo, hi, fault=None):
        Pt = self.pts(lo, hi)
        ev = lambda f: np.broadcast_to(np.asarray(f(Pt[:, 0], Pt[:, 1], Pt[:, 2]), float), (len(Pt),))
        ok = []
        vals = {}
        for k, cd in enumerate(self.cands):
            fc = cd["faces"][fname]
            if min(ev(fa).min() for fa in fc["fA"]) < -1e-12:
                continue
            ok.append(k); vals[k] = ev(fc["fPhi"])
        tries = []
        sc = sorted(ok, key=lambda k: -vals[k].min())
        for k in sc[:3]:
            tries.append({k: Fr(1)})
        if len(ok) >= 2:
            r2 = Pt[:, 0] ** 2
            nk = len(ok)
            rows = []
            for p in range(len(Pt)):
                row = np.zeros(nk + 1)
                for i, k in enumerate(ok):
                    row[i] = -vals[k][p] / r2[p]
                row[-1] = 1.0; rows.append(row)
            Aeq = np.zeros((1, nk + 1)); Aeq[0, :nk] = 1
            obj = np.zeros(nk + 1); obj[-1] = -1
            r = linprog(obj, A_ub=np.array(rows), b_ub=np.zeros(len(rows)), A_eq=Aeq, b_eq=[1.0],
                        bounds=[(0, None)] * nk + [(None, None)], method="highs",
                        options=dict(primal_feasibility_tolerance=1e-10, dual_feasibility_tolerance=1e-10))
            if r.status == 0:
                w = {k: Fr(round(r.x[i] * WDEN), WDEN) for i, k in enumerate(ok)}
                w = {k: v for k, v in w.items() if v > 0}
                if w:
                    tries.insert(0, w)
        for w in tries:
            if fault == "wshift":
                w = {k: v * (1 + Fr(1, 1000) * (1 if i % 2 == 0 else -1)) for i, (k, v) in enumerate(w.items())}
            good, why = self.check(fname, lo, hi, w, fault=fault)
            if good:
                return w
        return None


def version_info():
    # Note (A3d'): the sha256 of a record is only a reference mark and verify does not compare it (soundness is seen by redoing the contents of the record)
    sha = {}
    for fn in ("d44_local.py", "d44_problems.py", "d16e_common.py", "d16e_local.py"):
        with open(os.path.join(HERE, fn), "rb") as fh:
            sha[fn] = hashlib.sha256(fh.read()).hexdigest()
    return sha


def setup(pair, sbar):
    P = C.load("d44_" + pair)
    S = DF.S_of_sbar(P, sbar)
    return P, S


def run(pair, sbar, rho0, name, time_limit=3 * 3600, max_eval=20000, wmin_exp=30, fault=None, quiet=False):
    t0 = time.time()
    P, S = setup(pair, sbar)
    cx = Ctx(P, S)
    D = C.DEN
    r0 = Fr(rho0) * D; need(r0.denominator == 1, "rho_0 is in DEN units"); r0 = int(r0)
    rh = json.load(open(DP.RHAT_JSON, encoding="utf-8"))[pair]
    stats = dict(pair=pair, sbar=str(sbar), Sbar=str(S), rho0=str(rho0), fault=fault,
                 cands=[dict(J=c["J"], alpha=c["alpha"], A0=c["A0"], e_float=float(c["e"])) for c in cx.cands],
                 skipped=cx.skipped, act=cx.act, ties={str(k): v for k, v in cx.ties.items()}, S_float_at_Rhat=cx.S_float,
                 q_num=rh["q_num"], q_den_exp=rh["q_den_exp"], build_seconds=cx.tb, faces={}, cert={})
    if not quiet:
        print(f"{pair}: s-bar = {sbar} ({float(sbar):.12f}), rho_0 = {rho0}, candidates {len(cx.cands)} (discarded {len(cx.skipped)}), "
              f"active faces {cx.act}, setup {cx.tb} s", flush=True)
        for c in stats["cands"]:
            print("  candidate", c["J"], c["alpha"], "e =", c["e_float"], flush=True)
    total = 0; closed = True
    for fname in FACES:
        cur = [([0, -D, -D], [r0, D, D])]
        ev_ = acc = 0; lim = []; boxes = []; nsingle = 0; nfar = 0
        while cur:
            nxt = []
            for lo, hi in cur:
                if time.time() - t0 > time_limit or total >= max_eval:
                    stats["stopped"] = dict(face=fname, reason="\u6642\u9593" if time.time() - t0 > time_limit else "\u7bb1\u306e\u6570", total=total)
                    stats["closed"] = False
                    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
                    print("stopped early", stats["stopped"], flush=True)
                    return stats
                ev_ += 1; total += 1
                w = cx.choose(fname, lo, hi, fault=fault)
                if w is not None:
                    acc += 1; nsingle += (len(w) == 1)
                    boxes.append(dict(lo=lo, hi=hi, w={str(k): str(v) for k, v in w.items()}))
                    continue
                fb = cx.try_far(fname, lo, hi) if fault is None else None
                if fb is not None:
                    acc += 1; nfar += 1
                    boxes.append(dict(lo=lo, hi=hi, far=fb))
                    continue
                ww = [h - l for l, h in zip(lo, hi)]
                if max(ww) <= (D >> wmin_exp):
                    _, _, info = cx.check(fname, lo, hi, {0: 1}, detail=True)
                    lim.append(dict(lo=[v / D for v in lo], hi=[v / D for v in hi], single0=info)); continue
                nxt += list(split_box(lo, hi))
            cur = nxt
        stats["faces"][fname] = dict(evaluated=ev_, accepted=acc, single=nsingle, mixed=acc - nsingle - nfar, far=nfar, limit=len(lim), limit_boxes=lim[:10])
        stats["cert"][fname] = boxes
        closed &= not lim
        if not quiet:
            print(f"face {fname}: evaluated {ev_}, accepted {acc} (single {nsingle}, weighted {acc - nsingle - nfar}, far-type {nfar}), split limit {len(lim)}, {time.time() - t0:.1f} s", flush=True)
    stats["closed"] = closed
    stats["evaluated"] = total
    stats["seconds"] = round(time.time() - t0, 1)
    stats["params"] = dict(DEN_exp=C.KDEN, WDEN=WDEN, wmin_exp=wmin_exp, EBITS=EBITS, QLAM=2 ** QLAM_EXP, T=str(cx.T),
                           SLACK_TOL=SLACK_TOL, GAP_TOL=GAP_TOL, sha256=version_info())
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    if not quiet:
        print(f"== local {name}: boxes not accepted {'none' if closed else 'some'}, evaluated {total}, {stats['seconds']} s", flush=True)
    return stats


def verify(path, quiet=False):
    """Redo all boxes from the candidates (J, alpha) and weights of the record only (no LP). Covering is the leaves of the binary tree plus the sum of volumes. R-hat is required to equal the record's q."""
    import d30_local as D30
    DP.install()          # the import of d30_local replaces C.load, so restore the loading of the d44 pairs
    t0 = time.time()
    st = json.load(open(path, encoding="utf-8"))
    need(st.get("fault") in (None, "None"), "records of versions with an injected error are not checked")
    need(st["params"]["DEN_exp"] == C.KDEN, "DEN")
    pair = st["pair"]
    rh = json.load(open(DP.RHAT_JSON, encoding="utf-8"))[pair]
    need(rh["q_num"] == st["q_num"] and rh["q_den_exp"] == st["q_den_exp"], "R-hat equals the record (P7)")
    sbar = Fr(st["sbar"])
    P, S = setup(pair, sbar)
    need(S == Fr(st["Sbar"]), "S-bar equals the one rebuilt from s-bar")
    cx = Ctx(P, S, cand_list=[(c["J"], c["alpha"]) for c in st["cands"]])
    need(len(cx.cands) == len(st["cands"]), "all candidates of the record are M_J regular")
    need(st["params"]["QLAM"] == F.QLAM and Fr(st["params"]["T"]) == cx.T, "QLAM and T of the far-type boxes equal the record")
    D = C.DEN
    r0 = Fr(st["rho0"]) * D; need(r0.denominator == 1, "ρ₀"); r0 = int(r0)
    out = dict(record=path, pair=pair, faces={}, bad=[])
    for fname in FACES:
        boxes = st["cert"][fname]
        leaves = {}
        for b in boxes:
            k = (tuple(b["lo"]), tuple(b["hi"]))
            need(k not in leaves, "the same box twice")
            leaves[k] = b
        anc = D30.ancestors(([0, -D, -D], [r0, D, D]), leaves, split_box)
        seen = 0
        cur = [([0, -D, -D], [r0, D, D])]
        while cur:
            nxt = []
            for lo, hi in cur:
                if (tuple(lo), tuple(hi)) in leaves:
                    seen += 1; continue
                need((tuple(lo), tuple(hi)) in anc, "a branch that does not reach a leaf (hole in the covering)")
                nxt += list(split_box(lo, hi))
            cur = nxt
        need(seen == len(leaves), "number of leaves")
        vol = sum((b["hi"][0] - b["lo"][0]) * (b["hi"][1] - b["lo"][1]) * (b["hi"][2] - b["lo"][2]) for b in boxes)
        need(vol == r0 * (2 * D) * (2 * D), "sum of volumes")
        nok = 0
        for b in boxes:
            if "far" in b:
                fb = b["far"]
                ok, why = cx.check_far(fname, b["lo"], b["hi"], fb["plo"], fb["phi"], fb["L"], fb["M"], fb["v"])
            else:
                ok, why = cx.check(fname, b["lo"], b["hi"], b["w"])
            nok += ok
            if not ok:
                out["bad"].append(dict(face=fname, lo=b["lo"], hi=b["hi"], why=why))
        out["faces"][fname] = dict(boxes=len(boxes), passed=nok)
        if not quiet:
            print(f"re-check face {fname}: boxes {len(boxes)}, passed {nok}, covering OK", flush=True)
    out["all_passed"] = not out["bad"]
    out["seconds"] = round(time.time() - t0, 1)
    if not quiet:
        print(f"== re-check {path}: all passed {out['all_passed']}, {out['seconds']} s", flush=True)
    return out


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("arg")
    ap.add_argument("--k", type=int, default=9); ap.add_argument("--sbar", default=None)
    ap.add_argument("--rho0", default="1/32"); ap.add_argument("--name", default=None)
    ap.add_argument("--time-limit", type=float, default=3 * 3600); ap.add_argument("--max-eval", type=int, default=20000)
    ap.add_argument("--fault", default=None, choices=[f for f in FAULTS if f])
    a = ap.parse_args()
    if a.cmd == "verify":
        r = verify(a.arg)
        json.dump(r, open(a.arg.replace(".json", "_verify.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
        return 0 if r["all_passed"] else 2
    pair = a.arg
    sbar = Fr(a.sbar) if a.sbar else DF.sbar_of_k(pair, a.k)
    name = a.name or f"d44_{pair}_local_k{a.k}"
    st = run(pair, sbar, Fr(a.rho0), name, time_limit=a.time_limit, max_eval=a.max_eval, fault=a.fault)
    return 0 if st["closed"] else 2


if __name__ == "__main__":
    sys.exit(main())
