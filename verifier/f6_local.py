# F6 stage 3b (cases whose minimum is not sharp: dodindod, octinoct, icoinico): the local part with the centre at the exact optimum p* (field L = K(y)) and the target exactly S₀ = C0·s₀.
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#
# The candidates Φ_k are the same as in d44_local and f6_local_cubindod (3 faces J of the container and vertices α, A = −M_J⁻¹ R_q n0,
#   Φ_k = Σ_j A_j n_j·R_q v_j + N² D0 − S₀·N·ΣA; Lemma W: if A⁽ᵏ⁾ ≥ 0 on the whole box then N(φ − S₀)·ΣA_k ≥ Φ_k).
# The differences from cubindod (f6_local_cubindod) are the weights and the acceptance:
#   (1) Exact multipliers w*: among the candidates with e_k = 0, solve Σ_k w*_k c_k = 0 (c_k = ∇Φ_k(p*), exactly in L), w*_k > 0 in L (vertices of W, several).
#       Then the term of Σ w*_k Φ_k linear in ρ is identically 0 (the linear term of each face is linear in c_k·θ). This linear term is not added as a ball; it is set to 0.
#   (2) Weights per box w = Σ_j λ_j w*_j + δ (λ_j, δ_k rational ≥ 0). Φ_w = Σ w_k Φ_k = E + ρ g₁(θ) + ρ² Q(θ, ρ),
#       E = Σ δ_k e_k (checked ≥ 0), g₁ = Σ δ_k G_{k,1}, Q = Σ_{i≥2} ρ^{i−2} (Σ δ_k G_{k,i} + Σ λ_j G*_{j,i}).
#       Acceptance: A⁽ᵏ⁾ ≥ 0 (on the whole box) for the candidates with w_k > 0, and E_lo + ρ·g₁_lo + ρ²·Q_lo ≥ 0 for ρ ∈ [ρa, ρb] (lower bounds from rigorous arb balls;
#       the minimum of a quadratic in ρ is taken at the two ends and the vertex). Boxes with δ = 0 (around the critical directions) are accepted with Q_lo ≥ 0 (positive quadratic term).
#   The non-strict form of Lemma Q (D44 section 3.2): N(φ − S₀)·Σ w ΣA_k ≥ Σ w Φ_k ≥ 0, and Σ w ΣA_k > 0, so φ ≥ S₀.
# Boxes: p = p* + ρθ (θ is one of the 6 faces of the cube, d16e_local.FACES), (ρ, a1, a2) ∈ [ρa, ρb] × [−1, 1]² is bisected (a first; ρ when the width in ρ is large).
# Cover: the leaves of the trees of the 6 faces cover [0, ρ₁] × [−1, 1]² (verify rebuilds them from the root), ρ₁ ≥ ρ₀ + ‖p*‖∞ (arb). L = {‖p‖∞ ≤ ρ₀} ⊆ the local cube.
# Usage: python -X utf8 f6_local.py run <case> [--rho0 1/32] [--name name]
#         python -X utf8 f6_local.py analyze <case>    (gradients, multipliers, critical directions and quadratic coefficients, numerically)
#         python -X utf8 f6_local.py verify <record.json>
#         python -X utf8 f6_local.py fault <record.json>
import os, sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import flint
from scipy.optimize import linprog
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
from d16e_common import need, QD
import d16e_local as L
from d16e_local import FACES, rho, a1, a2, x, y, z, qds
import d44_local as DL
from f6_field_cubindod import K, evb
import f6_field as FG
from f6_tower import L2, kq, setup, refine

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

PREC = 2000
HB = 12000          # precision (bits) for building the balls
WDEN = 2 ** 40
SYM_S = sp.Symbol("S_")
MAX_DEPTH = 30


def fq(v):
    v = Fr(v)
    return flint.fmpq(v.numerator, v.denominator)


def ab(lo, hi):
    return flint.arb(fq(lo)).union(flint.arb(fq(hi)))


def load_field(pair):
    d = json.load(open(os.path.join(HERE, "f6", f"f6_{pair}_field.json"), encoding="utf-8"))
    f = FG.load_f(pair)
    K.f = f
    lo = Fr(d["lo"]); hi = Fr(d["hi"])
    need(f(fq(lo)) * f(fq(hi)) < 0, "the sign of f changes between the ends of the interval")
    flint.ctx.prec = d["interval_bits"]
    ball = ab(lo, hi)
    need(not evb(f.derivative(), ball).contains(0), "f′ ≠ 0 on the interval (the root is unique)")
    # the coefficients of the field elements are large (thousands of digits), so enclose the root again in a narrow interval (width 2^(1−HB)) and build the balls with HB bits
    lo2, hi2 = refine(f, lo, hi, Fr(lo + hi) / 2, HB)
    flint.ctx.prec = HB
    ball = ab(lo2, hi2)
    L2.HB = HB
    xc = int(d.get("xscale", "1"))        # field elements are polynomials in x′ = xc·s₀ (f6_field2 --monic). If xc = 1 then x = s₀
    if xc != 1:
        ball = ball * xc
        K.f = FG.monic_of(f)
    d["_xc"] = xc
    D = K(flint.fmpq_poly([int(v) for v in d["D"]["num_low_to_high"]], int(d["D"]["den"])))
    setup(K.f, D, ball)
    E = {nm: L2.de(e) for nm, e in d["elems"].items()}
    gen = QD.GENS[0]
    if gen == 5:
        rad = E["r5"]
    elif gen == 2:
        need(d["ext"]["ext"] == "sqrt2", "√2 is y")
        rad = L2(K(0), K(1))
    else:
        raise SystemExit("field")
    need((rad * rad - gen).iszero() and rad.sign() == 1, "√gen")
    flint.ctx.prec = PREC
    return E, rad, d


def poly_terms(e, gens):
    return {m: cf for m, cf in sp.Poly(sp.expand(e), *gens).terms()}


class Ctx:
    def __init__(self, pair, rho0, quiet=False, sshift=Fr(0), W_given=None, flipQ=False, flipA=False):
        t0 = time.time()
        self.pair = pair
        self.flipA = flipA          # for tests: reverse the direction of the A ≥ 0 test (should give a rejection)
        self.flipQ = flipQ          # for tests: reverse the sign of the terms of degree ≥ 2 (should give a rejection)
        self.P = P = C.load("d44_" + pair)
        self.E, self.rad, self.fd = load_field(pair)
        self.radb = self.rad.ball()
        self.s0 = L2(K(flint.fmpq_poly([0, 1], self.fd["_xc"])))      # s₀ = x′/xc
        self.S0 = self.qk(P.C0) * (self.s0 + Fr(sshift))
        self.S0b = self.S0.ball()
        self.pk = self.center()
        self.pb = [v.ball() for v in self.pk]
        self.rho0 = Fr(rho0)
        self.rho1 = self.rho0 + Fr(1, 2 ** 60)
        for v in self.pb:
            need(abs(v) < flint.arb(fq(Fr(1, 2 ** 60))), "‖p*‖∞ ≤ 2⁻⁶⁰")
        act, ties, Sf, slack = DL.near_active(P)
        self.act, self.ties = act, ties
        q = (1, x, y, z)
        Rq = sp.Matrix(C.rot_q(q))
        N = 1 + x * x + y * y + z * z
        n0 = sp.Matrix([qds(c) for c in P.N0])
        Un = Rq * n0
        self.cands = []
        self.skipped = []
        for J in itertools.combinations(act, 3):
            for al in itertools.product(*[ties[f] for f in J]):
                M = [[P.NORMALS[J[cc]][r] for cc in range(3)] for r in range(3)]
                if C.det3(M) == 0:
                    self.skipped.append(dict(J=list(J), alpha=list(al), why="M_J singular")); continue
                Mi = C.inv3(M)
                Mis = sp.Matrix([[qds(Mi[r][cc]) for cc in range(3)] for r in range(3)])
                A = [sp.expand(-(Mis.row(j) * Un)[0]) for j in range(3)]
                Phi = qds(P.D0) * N ** 2 - SYM_S * N * sum(A)
                for j in range(3):
                    n = [qds(cc) for cc in P.NORMALS[J[j]]]
                    v = [qds(cc) for cc in P.VERTS[al[j]]]
                    Phi += A[j] * sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3))
                Phi = sp.expand(Phi)
                cd = dict(J=list(J), alpha=list(al))
                cd["e"] = self.eval_l(Phi)
                cd["e_zero"] = cd["e"].iszero()
                cd["eb"] = flint.arb(0) if cd["e_zero"] else cd["e"].ball()
                cd["A0b"] = [self.eval_l(Aj).ball() for Aj in A]
                cd["grad"] = [self.eval_l(sp.diff(Phi, vv)) for vv in (x, y, z)] if (cd["e_zero"] or W_given is not None) else None
                cd["Phi"] = Phi
                cd["faces"] = {fn: dict(G=self.shift(Phi, sub), A=[self.shift(Aj, sub) for Aj in A]) for fn, sub in FACES.items()}
                self.cands.append(cd)
        self.find_W(quiet, W_given)
        self.tb = round(time.time() - t0, 1)
        if not quiet:
            print(f"candidates {len(self.cands)} (discarded {len(self.skipped)}), active faces {act}, vertices of W {len(self.W)}, build {self.tb} s", flush=True)

    # ----- field -----
    def qk(self, v):
        v = QD.c(v)
        out = L2(kq(v.v[0]))
        if len(v.v) > 1 and v.v[1] != 0:
            out = out + self.rad * L2(kq(v.v[1]))
        need(all(z_ == 0 for z_ in v.v[2:]), "the field is quadratic")
        return out

    def center(self):
        E = self.E
        a, b, c = E["a"], E["b"], E["c"]
        Na = 1 + a * a + b * b + c * c
        Ni = Na.inv()
        Ra = [[v * Ni for v in row] for row in C.rot_q([L2(1), a, b, c])]
        Rh = [[self.qk(self.P.RSTAR[i][j]) for j in range(3)] for i in range(3)]
        Rf = [[sum((Ra[i][k] * Rh[j][k] for k in range(3)), L2(0)) for j in range(3)] for i in range(3)]
        ti = (1 + Rf[0][0] + Rf[1][1] + Rf[2][2]).inv()
        p = [(Rf[2][1] - Rf[1][2]) * ti, (Rf[0][2] - Rf[2][0]) * ti, (Rf[1][0] - Rf[0][1]) * ti]
        Np = 1 + p[0] * p[0] + p[1] * p[1] + p[2] * p[2]
        Rq = C.rot_q([L2(1)] + p)
        for i in range(3):
            for j in range(3):
                need((Rq[i][j] - Rf[i][j] * Np).iszero(), "quaternion of p*")
        return p

    def sym_l(self, e):
        G = L.rgens()
        p = sp.Poly(sp.expand(e), *G, SYM_S)
        out = L2(0)
        for ks, c in p.terms():
            c = sp.Rational(c)
            t = L2(kq(Fr(int(c.p), int(c.q))))
            for _ in range(ks[0]):
                t = t * self.rad
            for _ in range(ks[-1]):
                t = t * self.S0
            out = out + t
        return out

    def eval_l(self, e):
        out = L2(0)
        for (ex, ey, ez), cf in poly_terms(e, (x, y, z)).items():
            t = self.sym_l(cf)
            for i, kk in enumerate((ex, ey, ez)):
                for _ in range(kk):
                    t = t * self.pk[i]
            out = out + t
        return out

    def coef_b(self, cf):
        G = L.rgens()
        p = sp.Poly(sp.expand(cf), *G, SYM_S)
        out = flint.arb(0)
        for ks, c in p.terms():
            c = sp.Rational(c)
            out += flint.arb(flint.fmpq(int(c.p), int(c.q))) * self.radb ** ks[0] * self.S0b ** ks[-1]
        return out

    def shift(self, e, sub):
        """e(p* + θρ) split by powers i ≥ 1 of ρ into {(j, k): ball} (a1^j a2^k)."""
        terms = poly_terms(e, (x, y, z))
        out = {}
        th = [sp.expand(s_ / rho) for s_ in sub]

        def thmon(t):
            if t == 1: return (1, 0, 0)
            if t == -1: return (-1, 0, 0)
            if t == a1: return (1, 1, 0)
            if t == a2: return (1, 0, 1)
            raise ValueError(t)
        tm = [thmon(t) for t in th]
        for (ex, ey, ez), cf in terms.items():
            cb = self.coef_b(cf)
            for kx in range(ex + 1):
                for ky in range(ey + 1):
                    for kz in range(ez + 1):
                        i = kx + ky + kz
                        if i == 0:
                            continue
                        sg = tm[0][0] ** kx * tm[1][0] ** ky * tm[2][0] ** kz
                        j = tm[0][1] * kx + tm[1][1] * ky + tm[2][1] * kz
                        k = tm[0][2] * kx + tm[1][2] * ky + tm[2][2] * kz
                        v = cb * (math.comb(ex, kx) * math.comb(ey, ky) * math.comb(ez, kz) * sg)
                        v = v * self.pb[0] ** (ex - kx) * self.pb[1] ** (ey - ky) * self.pb[2] ** (ez - kz)
                        dd = out.setdefault(i, {})
                        dd[(j, k)] = dd.get((j, k), flint.arb(0)) + v
        return out

    # ----- exact multipliers W -----
    def find_W(self, quiet, W_given=None):
        if W_given is not None:       # for tests: use the W of the record as is (Σ w* c = 0 is not checked; the linear term stays set to 0)
            self.elig = []; self.cfl = {}
            verts = [dict(S=list(v["S"]), w=[L2.de(e) for e in v["w"]]) for v in W_given]
            for v in verts:
                v["wf"] = [float(e.ball().mid()) for e in v["w"]]
            self.W = verts
            self._W_faces()
            return
        elig = [k for k, cd in enumerate(self.cands) if cd["e_zero"] and min(float(a.mid()) for a in cd["A0b"]) > 1e-12]
        self.elig = elig
        cf = {k: np.array([float(g.ball().mid()) for g in self.cands[k]["grad"]]) for k in elig}
        self.cfl = cf
        verts = []
        seen = set()
        for r in range(2, 5):
            for S in itertools.combinations(elig, r):
                Mx = np.vstack([np.array([cf[k] for k in S]).T, np.ones(r)])
                rhs = np.array([0, 0, 0, 1.0])
                w, res, rk, sv = np.linalg.lstsq(Mx, rhs, rcond=None)
                if rk < r or np.linalg.norm(Mx @ w - rhs) > 1e-9 * (1 + np.abs(Mx).max()) or w.min() <= 1e-12:
                    continue
                if any(set(S) > set(T) for T in seen):
                    continue
                key = tuple(S)
                ws = self.solve_exact(S, Mx)
                if ws is None:
                    continue
                seen.add(key)
                verts.append(dict(S=list(S), w=ws, wf=[float(v.ball().mid()) for v in ws]))
        # keep only minimal supports
        verts = [v for v in verts if not any(set(u["S"]) < set(v["S"]) for u in verts)]
        self.W = verts
        need(len(verts) > 0, "W has no vertices")
        self._W_faces()
        if not quiet:
            for v in verts:
                print("  vertex of W, support", v["S"], "w", [round(x, 6) for x in v["wf"]], flush=True)

    def _W_faces(self):
        """Precompute the terms of degree ≥ 2 of the combinations of W (balls)."""
        for v in self.W:
            v["faces"] = {}
            for fn in FACES:
                comb = {}
                for k, wk in zip(v["S"], v["w"]):
                    wb = wk.ball()
                    for i, dd in self.cands[k]["faces"][fn]["G"].items():
                        if i == 1:
                            continue        # Σ w* c = 0 (checked exactly in L), so the linear term is identically 0
                        o = comb.setdefault(i, {})
                        for m, b in dd.items():
                            o[m] = o.get(m, flint.arb(0)) + b * wb
                v["faces"][fn] = comb

    def solve_exact(self, S, Mx):
        """Solve Σ_{k∈S} w_k c_k = 0, Σ w = 1 in L (choose |S| independent equations, solve them, and check the rest)."""
        r = len(S)
        rowsL = [[self.cands[k]["grad"][i] for k in S] for i in range(3)] + [[L2(1)] * r]
        rhsL = [L2(0)] * 3 + [L2(1)]
        best = None
        for R in itertools.combinations(range(4), r):
            if 3 not in R:
                continue
            d = abs(np.linalg.det(Mx[list(R), :]))
            if best is None or d > best[0]:
                best = (d, R)
        if best is None or best[0] < 1e-12:
            return None
        R = best[1]
        Am = [[rowsL[i][j] for j in range(r)] for i in R]
        bm = [rhsL[i] for i in R]
        w = gauss_l(Am, bm)
        for i in range(4):
            tot = sum((rowsL[i][j] * w[j] for j in range(r)), L2(0)) - rhsL[i]
            if not tot.iszero():
                return None
        if any(v.sign() <= 0 for v in w):
            return None
        return w

    # ----- acceptance test -----
    def g_parts(self, Gs, box, lam=None):
        """Lower bounds over the box of Gs ({i: {(j,k): ball}}), in two parts: g1 = the part i = 1, Q = Σ_{i≥2} ρ^{i−2} G_i."""
        (ra, rb), A1, A2 = box
        R = ab(ra, rb)
        X = ab(*A1); Y = ab(*A2)
        g1 = flint.arb(0); Q = flint.arb(0)
        for i, dd in Gs.items():
            part = flint.arb(0)
            for (j, k), v in dd.items():
                part += v * X ** j * Y ** k
            if i == 1:
                g1 += part
            else:
                Q += part * (R ** (i - 2) if i > 2 else 1)
        if self.flipQ:
            Q = -Q
        return g1, Q

    def combo(self, w, lam, fname, key="G"):
        out = {}

        def add(Gs, wb):
            for i, dd in Gs.items():
                o = out.setdefault(i, {})
                for m, v in dd.items():
                    o[m] = o.get(m, flint.arb(0)) + v * wb
        for kk, wk in w.items():
            add(self.cands[kk]["faces"][fname][key], flint.arb(fq(wk)))
        for j, lj in lam.items():
            add(self.W[j]["faces"][fname], flint.arb(fq(lj)))
        return out

    def check(self, fname, box, w, lam):
        (ra, rb), A1, A2 = box
        w = {int(k): Fr(v) for k, v in w.items()}
        lam = {int(k): Fr(v) for k, v in lam.items()}
        if any(v < 0 for v in w.values()) or any(v < 0 for v in lam.values()):
            return False, "negative weight"
        w = {k: v for k, v in w.items() if v > 0}
        lam = {k: v for k, v in lam.items() if v > 0}
        if not w and not lam:
            return False, "weight 0"
        supp = set(w) | set(k for j in lam for k in self.W[j]["S"])
        Rb = ab(ra, rb)
        for kk in supp:
            cd = self.cands[kk]
            for j in range(3):
                Gs = cd["faces"][fname]["A"][j]
                g1, Q = self.g_parts(Gs, box)
                lo = cd["A0b"][j] + Rb * (g1 + Rb * Q)
                if self.flipA:
                    lo = -lo
                if not (lo.lower() >= 0):
                    return False, f"A (candidate {kk}, j = {j})"
        if all(self.cands[kk]["e_zero"] for kk in supp):
            El = flint.arb(0)
        else:
            El = sum((self.cands[kk]["eb"] * flint.arb(fq(wk)) for kk, wk in w.items()), flint.arb(0))
            for j, lj in lam.items():
                for kk, wb in zip(self.W[j]["S"], self.W[j]["w"]):
                    El += self.cands[kk]["eb"] * wb.ball() * flint.arb(fq(lj))
            El = El.lower()
            if not (El >= 0):
                return False, "E"
        G = self.combo(w, lam, fname)
        g1, Q = self.g_parts(G, box)
        if not quad_ok(El, g1.lower(), Q.lower(), ra, rb):
            return False, "g"
        return True, "ok"

    # ----- choosing the weights (floating point; does not enter acceptance) -----
    def fpoly(self, Gs, r, u, v):
        g1 = 0.0; Q = 0.0
        for i, dd in Gs.items():
            s_ = sum(float(c.mid()) * u ** j * v ** k for (j, k), c in dd.items())
            if i == 1: g1 += s_
            else: Q += s_ * r ** (i - 2)
        return g1, Q

    def choose(self, fname, box):
        (ra, rb), (l1, h1), (l2, h2) = box
        pts = [(float(r_), u, v) for r_ in sorted({float(ra), float(rb), float(ra + rb) / 2})
               for u in (float(l1), float(h1), float(l1 + h1) / 2) for v in (float(l2), float(h2), float(l2 + h2) / 2)]
        pts = [p for p in pts if p[0] > 0] or [(float(rb) * 1e-6, *pts[0][1:])]
        ok = [kk for kk, cd in enumerate(self.cands) if min(float(a.mid()) for a in cd["A0b"]) > 1e-9
              and (cd["e_zero"] or float(cd["eb"].mid()) > 0)]
        # variables: δ_k (ok), λ_j (W). Maximize t subject to (E + ρ g1 + ρ² Q)/ρ² ≥ t at each point (Σ = 1)
        cols = []
        for kk in ok:
            cd = self.cands[kk]
            e = 0.0 if cd["e_zero"] else float(cd["eb"].mid())
            cols.append([(e + r * self.fpoly(cd["faces"][fname]["G"], r, u, v)[0] + r * r * self.fpoly(cd["faces"][fname]["G"], r, u, v)[1]) / (r * r)
                         for (r, u, v) in pts])
        for j in range(len(self.W)):
            cols.append([self.fpoly(self.W[j]["faces"][fname], r, u, v)[1] for (r, u, v) in pts])
        cols = np.array(cols)          # (nvar, npts)
        nv = cols.shape[0]
        tries = []
        if ra == 0:
            # box containing ρ = 0: the linear term needs g1 ≥ 0. Try pure W (δ = 0) first
            for j in range(len(self.W)):
                tries.append(({}, {j: Fr(1)}))
        A_ub = np.hstack([-cols.T, np.ones((cols.shape[1], 1))])
        Aeq = np.zeros((1, nv + 1)); Aeq[0, :nv] = 1
        res = linprog(np.r_[np.zeros(nv), -1.0], A_ub=A_ub, b_ub=np.zeros(cols.shape[1]), A_eq=Aeq, b_eq=[1.0],
                      bounds=[(0, None)] * nv + [(None, None)], method="highs")
        if res.status == 0:
            xs = res.x[:nv]
            w = {kk: Fr(round(xs[i] * WDEN), WDEN) for i, kk in enumerate(ok)}
            lam = {j: Fr(round(xs[len(ok) + j] * WDEN), WDEN) for j in range(len(self.W))}
            tries.append(({k: v for k, v in w.items() if v > 0}, {k: v for k, v in lam.items() if v > 0}))
        for kk in ok[:0]:
            pass
        for w, lam in tries:
            good, why = self.check(fname, box, w, lam)
            if good:
                return w, lam
        return None


def quad_ok(E, g, Q, ra, rb):
    """E + gρ + Qρ² ≥ 0 for ρ ∈ [ra, rb] (ra ≥ 0) (E, g, Q are arb lower bounds). The two ends and the vertex."""
    Ra = flint.arb(fq(ra)); Rb = flint.arb(fq(rb))

    def val(r):
        return E + g * r + Q * r * r
    if ra == 0:
        if not (E >= 0):
            return False
        if E == 0 and not (g >= 0):
            return False
    if not (val(Ra) >= 0 and val(Rb) >= 0):
        return False
    if Q > 0:
        rv = -g / (2 * Q)
        if rv.overlaps(ab(ra, rb)) or (rv > Ra and rv < Rb):
            if not (E - g * g / (4 * Q) >= 0):
                return False
    elif not (Q >= 0) and not (Q <= 0):
        # the sign of Q is not decided (callers pass Q.lower(), which has radius 0, so this is not reached). If reached, reject to be safe (F6 10.5 review, finding 3)
        return False
    return True


def gauss_l(A, b):
    n = len(A)
    M = [list(A[i]) + [b[i]] for i in range(n)]
    for c in range(n):
        piv = None
        for r in range(c, n):
            if not M[r][c].iszero():
                piv = r; break
        need(piv is not None, "the linear system in L is singular")
        M[c], M[piv] = M[piv], M[c]
        iv = M[c][c].inv()
        M[c] = [v * iv for v in M[c]]
        for r in range(n):
            if r != c and not M[r][c].iszero():
                fct = M[r][c]
                M[r] = [M[r][j] - fct * M[c][j] for j in range(n + 1)]
    return [M[i][n] for i in range(n)]


def split(box, rho1):
    """Halve the wider of (a1, a2). However,
    a box containing ρ = 0 is halved in ρ only when the width in a is ≤ 1/4 and rb > ρ₁/2⁶ (do not keep splitting towards 0),
    a box not containing ρ = 0 is halved in ρ if the relative width in ρ, (rb − ra)/rb, is wider than the width in a."""
    (ra, rb), (l1, h1), (l2, h2) = box
    wa = max(h1 - l1, h2 - l2)
    if ra == 0:
        cut = wa <= Fr(1, 4) and rb > rho1 / 64
    else:
        cut = (rb - ra) / rb > wa
    if cut:
        m = (ra + rb) / 2
        return ((ra, m), (l1, h1), (l2, h2)), ((m, rb), (l1, h1), (l2, h2))
    if h1 - l1 >= h2 - l2:
        m = (l1 + h1) / 2
        return ((ra, rb), (l1, m), (l2, h2)), ((ra, rb), (m, h1), (l2, h2))
    m = (l2 + h2) / 2
    return ((ra, rb), (l1, h1), (l2, m)), ((ra, rb), (l1, h1), (m, h2))


def boxstr(b):
    return [[str(b[0][0]), str(b[0][1])], [str(b[1][0]), str(b[1][1])], [str(b[2][0]), str(b[2][1])]]


def boxof(s):
    return ((Fr(s[0][0]), Fr(s[0][1])), (Fr(s[1][0]), Fr(s[1][1])), (Fr(s[2][0]), Fr(s[2][1])))


def analyze(pair):
    cx = Ctx(pair, Fr(1, 32))
    print("ball of p*", [v.mid().str(5) for v in cx.pb])
    for k, cd in enumerate(cx.cands):
        print(f"  candidate {k} J {cd['J']} α {cd['alpha']} e {'0' if cd['e_zero'] else cd['eb'].mid().str(4)} "
              f"A(p*) {[a.mid().str(4) for a in cd['A0b']]}" + (f" c {np.round(cx.cfl[k], 5).tolist()}" if k in cx.cfl else ""))
    Cm = np.array([cx.cfl[k] for k in cx.elig])
    u, sv, vt = np.linalg.svd(Cm)
    print("singular values of c", sv)
    for v in cx.W:
        # quadratic coefficients: Hessian of Σ w* Φ (numerical, sympy)
        Hs = np.zeros((3, 3))
        for k, wk in zip(v["S"], v["wf"]):
            Phi = cx.cands[k]["Phi"]
            for i, vi in enumerate((x, y, z)):
                for j, vj in enumerate((x, y, z)):
                    Hs[i, j] += wk * float(cx.eval_l(sp.diff(Phi, vi, vj)).ball().mid())
        null = vt[np.sum(sv > 1e-9):].T
        Hc = null.T @ Hs @ null if null.size else np.zeros((0, 0))
        print("W support", v["S"], "dimension of the critical space", null.shape[1], "eigenvalues of the quadratic coefficients (critical space)", np.linalg.eigvalsh(Hc) if null.size else "-",
              "eigenvalues of the whole", np.linalg.eigvalsh(Hs))


def run(pair, rho0, name):
    t0 = time.time()
    cx = Ctx(pair, rho0)
    out = dict(pair=pair, rho0=str(cx.rho0), rho1=str(cx.rho1), faces={}, cert={},
               cands=[dict(J=c["J"], alpha=c["alpha"], e_zero=c["e_zero"]) for c in cx.cands],
               W=[dict(S=v["S"], w=[e.ser() for e in v["w"]]) for v in cx.W],
               field_json=f"f6/f6_{pair}_field.json", PREC=PREC, build_seconds=cx.tb)
    ok_all = True
    for fname in FACES:
        leaves = []; nev = 0; lim = 0
        stack = [(((Fr(0), cx.rho1), (Fr(-1), Fr(1)), (Fr(-1), Fr(1))), 0)]
        while stack:
            box, dep = stack.pop()
            nev += 1
            wl = cx.choose(fname, box)
            if wl is not None:
                w, lam = wl
                leaves.append(dict(box=boxstr(box), w={str(k): str(v) for k, v in w.items()}, lam={str(k): str(v) for k, v in lam.items()}))
                continue
            if dep >= MAX_DEPTH:
                lim += 1
                leaves.append(dict(box=boxstr(box), w=None, lam=None))
                continue
            b1, b2 = split(box, cx.rho1)
            stack.append((b2, dep + 1)); stack.append((b1, dep + 1))
        out["faces"][fname] = dict(evaluated=nev, leaves=len(leaves), limit=lim,
                                   pureW=sum(1 for l in leaves if l["w"] is not None and not l["w"]))
        out["cert"][fname] = leaves
        ok_all &= lim == 0
        print(f"face {fname}: evaluated {nev}, leaves {len(leaves)} (W only {out['faces'][fname]['pureW']}), split limit {lim}, {time.time() - t0:.1f} s", flush=True)
    out["all_accepted"] = ok_all
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open(name + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== local {name}: {'all accepted' if ok_all else 'some boxes not accepted'}, {out['seconds']} s", flush=True)
    return out


def verify(path, sshift=Fr(0), count_only=False, flipQ=False, flipA=False):
    t0 = time.time()
    rec = json.load(open(path, encoding="utf-8"))
    fault = sshift != 0 or flipQ or flipA
    cx = Ctx(rec["pair"], Fr(rec["rho0"]), quiet=True, sshift=sshift, W_given=rec["W"] if fault else None, flipQ=flipQ, flipA=flipA)
    need(str(cx.rho1) == rec["rho1"], "ρ₁")
    if fault:
        need([dict(J=c["J"], alpha=c["alpha"]) for c in cx.cands] == [dict(J=c["J"], alpha=c["alpha"]) for c in rec["cands"]], "candidates agree with the record")
    else:
        need([dict(J=c["J"], alpha=c["alpha"], e_zero=c["e_zero"]) for c in cx.cands] == rec["cands"], "candidates agree with the record")
    need([v["S"] for v in cx.W] == [v["S"] for v in rec["W"]], "supports of W agree with the record")
    for v, rv in zip(cx.W, rec["W"]):
        need(all((a - L2.de(b)).iszero() for a, b in zip(v["w"], rv["w"])), "weights of W agree with the record")
    tot = acc = 0
    z0 = [0, 0]         # number of leaves containing ρ = 0, and how many of them are accepted
    for fname in FACES:
        leaves = rec["cert"][fname]
        it = iter(leaves); cur = [next(it, None)]

        def walk(box):
            nonlocal tot, acc
            lf = cur[0]
            need(lf is not None, "too few leaves")
            if lf["box"] == boxstr(box):
                need(lf["w"] is not None, "leaf not accepted")
                ok, why = cx.check(fname, box, lf["w"], lf["lam"])
                tot += 1; acc += ok
                if box[0][0] == 0:
                    z0[0] += 1; z0[1] += ok
                if not count_only:
                    need(ok, f"leaf test {fname} {lf['box']} {why}")
                cur[0] = next(it, None)
                return
            b1, b2 = split(box, cx.rho1)
            walk(b1); walk(b2)
        walk(((Fr(0), cx.rho1), (Fr(-1), Fr(1)), (Fr(-1), Fr(1))))
        need(cur[0] is None, "too many leaves")
        if not count_only:
            print(f"verify face {fname}: passed", flush=True)
    print(f"verify {path} (sshift {sshift}, flipQ {flipQ}, flipA {flipA}): leaves {tot}, accepted {acc} (leaves containing ρ = 0: {z0[0]}, accepted {z0[1]}), {time.time() - t0:.1f} s", flush=True)
    return tot, acc


def sample(pair, rho0, n=400, seed=1):
    """Test: at random points of the local cube, compare φ from the floating-point LP with S₀ (does not enter acceptance)."""
    import d16e_common as CC
    P = CC.load("d44_" + pair)
    d = json.load(open(os.path.join(HERE, "f6", f"f6_{pair}_field.json"), encoding="utf-8"))
    cx = Ctx(pair, rho0, quiet=True)
    pst = np.array([float(v.mid()) for v in cx.pb])
    S0 = float(cx.S0b.mid())
    NCF = np.array([[float(x) for x in n] for n in P.NORMALS]); VF = np.array([[float(x) for x in v] for v in P.VERTS])
    n0f = np.array([float(x) for x in P.N0]); D0f = float(P.D0); nf = P.NF
    rng = np.random.default_rng(seed)
    worst = []
    for it in range(n):
        r_ = float(rho0) * rng.random() ** 2
        th = rng.uniform(-1, 1, 3); th /= np.abs(th).max()
        p = pst + r_ * th
        Nq = 1 + p @ p
        R = np.array(CC.rot_q([1.0, *p]), dtype=float) / Nq
        H = NCF @ R @ VF.T
        Am = np.zeros((nf + 1, 4)); bb = np.zeros(nf + 1)
        Am[:nf, :3] = NCF; Am[:nf, 3] = -1; bb[:nf] = -H.max(axis=1)
        Am[nf, :3] = R @ n0f; bb[nf] = -D0f
        res = linprog([0, 0, 0, 1], A_ub=Am, b_ub=bb, bounds=[(None, None)] * 4, method="highs")
        worst.append((res.fun - S0, r_))
    worst.sort()
    print("the 5 points with the smallest φ − S₀ (value, ‖p − p*‖∞)", [(f"{a:.3e}", f"{b:.2e}") for a, b in worst[:5]])
    big = [a / b ** 2 for a, b in worst if b > 1e-4]
    print("minimum of (φ − S₀)/‖p − p*‖² over the points with ‖p − p*‖ > 1e-4", min(big) if big else None, "negative points", sum(1 for a, b in worst if a < 0))


if __name__ == "__main__":
    sys.setrecursionlimit(10000)
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd")
    ap.add_argument("arg")
    ap.add_argument("--rho0", default="1/32")
    ap.add_argument("--name", default=None)
    a = ap.parse_args()
    if a.cmd == "analyze":
        analyze(a.arg)
    elif a.cmd == "run":
        run(a.arg, Fr(a.rho0), a.name or os.path.join(HERE, "f6", f"f6_{a.arg}_local"))
    elif a.cmd == "verify":
        verify(a.arg)
    elif a.cmd == "fault":
        verify(a.arg, sshift=Fr(1, 2 ** 100), count_only=True)
        verify(a.arg, sshift=-Fr(1, 2 ** 100), count_only=True)
        verify(a.arg, flipQ=True, count_only=True)
        verify(a.arg, flipA=True, count_only=True)
    elif a.cmd == "sample":
        sample(a.arg, Fr(a.rho0))
