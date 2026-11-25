# F6 stage 3b: the local part of cubindod, n=2 (centre exactly at the optimum R*, target exactly S₀ = C0·s₀).
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#
# Uses the same candidates Φ_k as D44 stage 3b (d44_local.py, Lemma Q), with only two differences:
#   (1) The centre is not R̂ (rational) but R* (field K = Q(s₀); the configuration that f6_field_cubindod.py checked exactly in K).
#       In the coordinates of d44 (the problem with the piece rotated by R̂, R = rot_q(1, p)/N), R*_frame = R*·R̂ᵀ, and p* is its quaternion (w = 1), an element of K.
#   (2) The target is S₀ = C0·s₀ (an element of K, exact).
# Boxes: p = p* + ρθ (θ is one of the 6 faces of the cube, (ρ, a1, a2) of d16e_local.FACES), ρ ∈ [0, ρ₁], (a1, a2) ∈ [−1, 1]² is bisected.
#   Φ_k(p* + ρθ) = e_k + Σ_{i≥1} ρ^i G_{k,i}(a1, a2) (G_{k,i} has degree ≤ i in a). e_k = Φ_k(p*) exactly in K (0 for candidates made only of active rows).
#   Acceptance: for candidates with weights w ≥ 0 (A⁽ᵏ⁾ ≥ 0 on the whole box for the candidates with w_k > 0), with E := Σ w e_k and g_lo a lower bound over the box of g := Σ w Σ_{i≥1} ρ^{i−1} G_{k,i},
#   if E_lo ≥ 0 and E_lo + ρ₁′·min(g_lo, 0) ≥ 0 (ρ₁′ is the upper end of ρ of the box), then Σ w Φ_k ≥ E + ρ g ≥ 0 on the whole box.
#   The non-strict form of Lemma Q (D44 section 3.2): N(φ − S₀)·Σ w ΣA_k ≥ Σ w Φ_k ≥ 0, and ΣA_k > 0, so φ ≥ S₀.
#   E is exactly 0 if "all e_k are 0 in K". All lower bounds are compared with arb (rigorous balls).
# Cover: the leaves of the (a1, a2) trees of the 6 faces cover [−1, 1]² (verify rebuilds them from the root), and ρ₁ ≥ ρ₀ + ‖p*‖∞ with arb.
#   Hence φ ≥ S₀ on {‖p − p*‖∞ ≤ ρ₁} ⊇ L = {‖p‖∞ ≤ ρ₀} (the local box of the far region d44_far).
# Usage: python -X utf8 f6_local_cubindod.py run [--rho0 1/4096] [--name name]
#         python -X utf8 f6_local_cubindod.py verify <record.json>
import os, sys, json, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import mpmath as mp
import flint
from scipy.optimize import linprog
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
from d16e_common import need, QD
import d16e_local as L
from d16e_local import FACES, rho, a1, a2, x, y, z, qds, red
import d44_local as DL
import f6_field_cubindod as FK
from f6_field_cubindod import K, evb

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

PREC = 2000          # precision of arb (bits)
WDEN = 2 ** 40
SYM_S = sp.Symbol("S_")


def kinv(k):
    G, U, _ = k.p.xgcd(K.f)
    need(G == 1, "inverse in K")
    return K(U)


def load_field():
    """Load the elements of f6_cubindod_field.json into K and build the ball of s₀."""
    f = FK.load_f()
    K.f = f
    d = json.load(open(os.path.join(HERE, "f6", "f6_cubindod_field.json"), encoding="utf-8"))
    E = {nm: K(flint.fmpq_poly([int(v) for v in e["num_low_to_high"]], int(e["den"]))) for nm, e in d["elems"].items()}
    lo = Fr(d["lo"]); hi = Fr(d["hi"])
    need(f(flint.fmpq(lo.numerator, lo.denominator)) * f(flint.fmpq(hi.numerator, hi.denominator)) < 0, "the sign of f changes between the ends of the interval")
    flint.ctx.prec = d["interval_bits"]
    ball = flint.arb(flint.fmpq(lo.numerator, lo.denominator)).union(flint.arb(flint.fmpq(hi.numerator, hi.denominator)))
    need(not evb(f.derivative(), ball).contains(0), "f′ ≠ 0 on the interval (the root is unique)")
    need(FK.sign(E["r5"], ball) == 1 and (E["r5"] * E["r5"] - 5).iszero(), "√5")
    flint.ctx.prec = PREC
    return E, ball, d


def kval(k, ball):
    """arb ball of an element of K (substitute the ball of s₀; rigorous)."""
    return evb(k.p, ball)


def qd_to_k(v, r5):
    v = QD.c(v)
    need(len(v.v) == 2, "the field is Q(√5)")
    return K(flint.fmpq_poly([v.v[0].numerator], v.v[0].denominator)) + r5 * K(flint.fmpq_poly([v.v[1].numerator], v.v[1].denominator))


def sym_to_k(e, r5, s0):
    """A sympy number (symbol r5, polynomial in S_, rational coefficients) into K."""
    G = L.rgens()
    p = sp.Poly(sp.expand(e), *G, SYM_S)
    out = K(0)
    for ks, c in p.terms():
        c = sp.Rational(c)
        t = K(flint.fmpq_poly([int(c.p)], int(c.q)))
        for i, kk in enumerate(ks[:-1]):
            for _ in range(kk):
                t = t * r5
        for _ in range(ks[-1]):
            t = t * s0
        out = out + t
    return out


def center(P, E):
    """p* (coordinates of d44, elements of K). R*_actual = rot_q(1, a, b, c)/N, R*_frame = R*·R̂ᵀ."""
    r5 = E["r5"]
    a, b, c = E["a"], E["b"], E["c"]
    N = 1 + a * a + b * b + c * c
    Ni = kinv(N)
    Ra = [[v * Ni for v in row] for row in C.rot_q([K(1), a, b, c])]
    Rh = [[qd_to_k(P.RSTAR[i][j], r5) for j in range(3)] for i in range(3)]
    Rf = [[sum((Ra[i][k] * Rh[j][k] for k in range(3)), K(0)) for j in range(3)] for i in range(3)]
    tr1 = 1 + Rf[0][0] + Rf[1][1] + Rf[2][2]
    ti = kinv(tr1)
    p = [(Rf[2][1] - Rf[1][2]) * ti, (Rf[0][2] - Rf[2][0]) * ti, (Rf[1][0] - Rf[0][1]) * ti]
    # check: rot_q(1, p) = R*_frame·N(p) (exactly in K)
    Np = 1 + p[0] * p[0] + p[1] * p[1] + p[2] * p[2]
    Rq = C.rot_q([K(1)] + p)
    for i in range(3):
        for j in range(3):
            need((Rq[i][j] - Rf[i][j] * Np).iszero(), "quaternion of p*")
    return p


def poly_terms(e, gens):
    """sympy expression → {tuple of exponents: coefficient expression}."""
    pl = sp.Poly(sp.expand(e), *gens)
    return {m: cf for m, cf in pl.terms()}


class Ctx:
    def __init__(self, rho0, quiet=False, sshift=Fr(0)):
        t0 = time.time()
        self.P = P = C.load("d44_cubindod")
        self.E, self.ball, self.fd = load_field()
        r5 = self.E["r5"]
        self.s0 = K(flint.fmpq_poly([0, 1]))
        self.S0 = qd_to_k(P.C0, r5) * (self.s0 + Fr(sshift))   # S₀ = C0·s₀ (in K). sshift ≠ 0 only in tests with an injected error
        self.pk = center(P, self.E)
        self.pb = [kval(v, self.ball) for v in self.pk]
        self.r5b = kval(r5, self.ball)
        self.S0b = kval(self.S0, self.ball)
        self.rho0 = Fr(rho0)
        # ρ₁ = ρ₀ + 2⁻⁶⁰, and ‖p*‖∞ ≤ 2⁻⁶⁰ with arb
        self.rho1 = self.rho0 + Fr(1, 2 ** 60)
        for v in self.pb:
            need(abs(v) < flint.arb(flint.fmpq(1, 2 ** 60)), "‖p*‖∞ ≤ 2⁻⁶⁰")
        act, ties, Sf, slack = DL.near_active(P)
        self.act, self.ties = act, ties
        cand_list = []
        for J in itertools.combinations(act, 3):
            for al in itertools.product(*[ties[f] for f in J]):
                cand_list.append((list(J), list(al)))
        q = (1, x, y, z)
        Rq = sp.Matrix(C.rot_q(q))
        N = 1 + x * x + y * y + z * z
        n0 = sp.Matrix([qds(c) for c in P.N0])
        Un = Rq * n0
        self.cands = []
        self.skipped = []
        for J, al in cand_list:
            M = [[P.NORMALS[J[cc]][r] for cc in range(3)] for r in range(3)]
            if C.det3(M) == 0:
                self.skipped.append(dict(J=J, alpha=al, why="M_J singular")); continue
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
            # e = Φ(p*) (exactly in K), A(p*) (ball)
            cd["e"] = self.eval_k(Phi)
            cd["e_zero"] = cd["e"].iszero()
            cd["eb"] = flint.arb(0) if cd["e_zero"] else kval(cd["e"], self.ball)
            cd["A0b"] = [kval(self.eval_k(Aj), self.ball) for Aj in A]
            cd["faces"] = {}
            for fname, sub in FACES.items():
                cd["faces"][fname] = dict(G=self.shift(Phi, sub), A=[self.shift(Aj, sub) for Aj in A])
            self.cands.append(cd)
        self.tb = round(time.time() - t0, 1)
        if not quiet:
            print(f"candidates {len(self.cands)} (discarded {len(self.skipped)}), active faces {act}, build {self.tb} s", flush=True)
            for k, cd in enumerate(self.cands):
                print(f"  candidate {k} J {cd['J']} α {cd['alpha']} e {'0 (exactly in K)' if cd['e_zero'] else cd['eb'].mid().str(5)} "
                      f"A(p*) {[a.mid().str(4) for a in cd['A0b']]}", flush=True)

    def eval_k(self, e):
        """Value at p* (in K, exact) of a sympy polynomial (in x, y, z; coefficients are expressions in r5 and S_)."""
        out = K(0)
        for (ex, ey, ez), cf in poly_terms(e, (x, y, z)).items():
            t = sym_to_k(cf, self.E["r5"], self.S0)
            for i, kk in enumerate((ex, ey, ez)):
                for _ in range(kk):
                    t = t * self.pk[i]
            out = out + t
        return out

    def coef_b(self, cf):
        """arb ball of a coefficient expression."""
        G = L.rgens()
        p = sp.Poly(sp.expand(cf), *G, SYM_S)
        out = flint.arb(0)
        for ks, c in p.terms():
            c = sp.Rational(c)
            t = flint.arb(flint.fmpq(int(c.p), int(c.q)))
            t = t * self.r5b ** ks[0] * self.S0b ** ks[-1]
            out += t
        return out

    def shift(self, e, sub):
        """e(p* + θρ) split by powers i ≥ 1 of ρ into {(j, k): ball} (a1^j a2^k). i = 0 is dropped (e is handled exactly, separately)."""
        terms = poly_terms(e, (x, y, z))
        out = {}
        th = [sp.expand(s_ / rho) for s_ in sub]

        def thmon(i):   # θ_i → (sign, j, k)
            t = th[i]
            if t == 1: return (1, 0, 0)
            if t == -1: return (-1, 0, 0)
            if t == a1: return (1, 1, 0)
            if t == a2: return (1, 0, 1)
            raise ValueError(t)
        tm = [thmon(i) for i in range(3)]
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

    # ----- acceptance test (rigorous arb bounds) -----
    @staticmethod
    def ab(lo, hi):
        return flint.arb(flint.fmpq(lo.numerator, lo.denominator)).union(flint.arb(flint.fmpq(hi.numerator, hi.denominator)))

    def g_lower(self, Gs, box):
        """Lower bound over the box of Σ_{i≥1} ρ^{i−1} G_i(a1, a2) (lower end of the arb ball)."""
        rb, A1, A2 = box
        R = self.ab(Fr(0), rb)
        X = self.ab(*A1); Y = self.ab(*A2)
        tot = flint.arb(0)
        for i, dd in Gs.items():
            part = flint.arb(0)
            for (j, k), v in dd.items():
                part += v * X ** j * Y ** k
            tot += part * (R ** (i - 1) if i > 1 else 1)
        return tot.lower()

    def lin_combo(self, w, fname, key):
        out = {}
        for kk, wk in w.items():
            Gs = self.cands[kk]["faces"][fname][key]
            for i, dd in Gs.items():
                o = out.setdefault(i, {})
                for m, v in dd.items():
                    o[m] = o.get(m, flint.arb(0)) + v * flint.arb(flint.fmpq(wk.numerator, wk.denominator))
        return out

    def check(self, fname, box, w):
        rb = box[0]
        w = {int(k): Fr(v) for k, v in w.items()}
        if any(v < 0 for v in w.values()) or not any(v > 0 for v in w.values()):
            return False, "w"
        w = {k: v for k, v in w.items() if v > 0}
        rbb = flint.arb(flint.fmpq(rb.numerator, rb.denominator))
        for kk in w:
            cd = self.cands[kk]
            for j in range(3):
                a0 = cd["A0b"][j].lower()
                gl = self.g_lower(cd["faces"][fname]["A"][j], box)
                lo = a0 + rbb * min(gl, flint.arb(0))
                if not (lo >= 0):
                    return False, f"A (candidate {kk}, j = {j})"
        if all(self.cands[kk]["e_zero"] for kk in w):
            El = flint.arb(0)
        else:
            El = sum((self.cands[kk]["eb"] * flint.arb(flint.fmpq(wk.numerator, wk.denominator)) for kk, wk in w.items()), flint.arb(0)).lower()
            if not (El >= 0):
                return False, "E"
        gl = self.g_lower(self.lin_combo(w, fname, "G"), box)
        val = El + rbb * min(gl, flint.arb(0))
        if not (val >= 0):
            return False, "g"
        return True, "ok"

    # ----- choosing the weights (floating point; does not enter acceptance) -----
    def fval(self, kk, fname, key, r, A1, A2, j=None):
        Gs = self.cands[kk]["faces"][fname][key] if j is None else self.cands[kk]["faces"][fname][key][j]
        v = 0.0
        for i, dd in Gs.items():
            for (jj, k), c in dd.items():
                v += float(c.mid()) * r ** (i - 1) * A1 ** jj * A2 ** k
        return v

    def choose(self, fname, box):
        rb, (l1, h1), (l2, h2) = box
        pts = [(float(rb) * t, u, v) for t in (0.0, 1.0) for u in (float(l1), float(h1), float(l1 + h1) / 2)
               for v in (float(l2), float(h2), float(l2 + h2) / 2)]
        ok = []
        vals = {}
        for kk, cd in enumerate(self.cands):
            if min(float(cd["A0b"][j].mid()) for j in range(3)) < 1e-9:
                continue
            e = 0.0 if cd["e_zero"] else float(cd["eb"].mid())
            if e < 0:
                continue
            ok.append(kk)
            vals[kk] = np.array([self.fval(kk, fname, "G", *p) + (e / max(p[0], 1e-300) if e > 0 else 0.0) for p in pts])
        tries = [{kk: Fr(1)} for kk in sorted(ok, key=lambda k: -vals[k].min())[:3]]
        if len(ok) >= 2:
            nk = len(ok)
            rows = []
            for pi in range(len(pts)):
                row = np.zeros(nk + 1)
                for i, kk in enumerate(ok):
                    row[i] = -vals[kk][pi]
                row[-1] = 1.0
                rows.append(row)
            Aeq = np.zeros((1, nk + 1)); Aeq[0, :nk] = 1
            obj = np.zeros(nk + 1); obj[-1] = -1
            r = linprog(obj, A_ub=np.array(rows), b_ub=np.zeros(len(rows)), A_eq=Aeq, b_eq=[1.0],
                        bounds=[(0, None)] * nk + [(None, None)], method="highs")
            if r.status == 0 and r.x[-1] > 0:
                w = {kk: Fr(round(r.x[i] * WDEN), WDEN) for i, kk in enumerate(ok)}
                w = {k: v for k, v in w.items() if v > 0}
                if w:
                    tries.insert(1, w)
        for w in tries:
            good, _ = self.check(fname, box, w)
            if good:
                return w
        return None


def split(box):
    """Halve the wider of (a1, a2) (a1 if equal). ρ is not split."""
    rb, (l1, h1), (l2, h2) = box
    if h1 - l1 >= h2 - l2:
        m = (l1 + h1) / 2
        return (rb, (l1, m), (l2, h2)), (rb, (m, h1), (l2, h2))
    m = (l2 + h2) / 2
    return (rb, (l1, h1), (l2, m)), (rb, (l1, h1), (m, h2))


def boxstr(b):
    return [str(b[0]), [str(b[1][0]), str(b[1][1])], [str(b[2][0]), str(b[2][1])]]


def run(rho0, name, max_depth=24):
    t0 = time.time()
    cx = Ctx(rho0)
    out = dict(pair="cubindod", rho0=str(cx.rho0), rho1=str(cx.rho1), faces={}, cert={},
               cands=[dict(J=c["J"], alpha=c["alpha"], e_zero=c["e_zero"]) for c in cx.cands],
               field_json="f6/f6_cubindod_field.json", PREC=PREC, build_seconds=cx.tb)
    ok_all = True
    for fname in FACES:
        leaves = []
        nev = 0; lim = 0
        stack = [((cx.rho1, (Fr(-1), Fr(1)), (Fr(-1), Fr(1))), 0)]
        while stack:
            box, dep = stack.pop()
            nev += 1
            w = cx.choose(fname, box)
            if w is not None:
                leaves.append(dict(box=boxstr(box), w={str(k): str(v) for k, v in w.items()}))
                continue
            if dep >= max_depth:
                lim += 1
                leaves.append(dict(box=boxstr(box), w=None))
                continue
            b1, b2 = split(box)
            stack.append((b2, dep + 1)); stack.append((b1, dep + 1))   # depth first, b1 first
        out["faces"][fname] = dict(evaluated=nev, leaves=len(leaves), limit=lim,
                                   single=sum(1 for l in leaves if l["w"] and len(l["w"]) == 1))
        out["cert"][fname] = leaves
        ok_all &= lim == 0
        print(f"face {fname}: evaluated {nev}, leaves {len(leaves)} (single {out['faces'][fname]['single']}), split limit {lim}, {time.time() - t0:.1f} s", flush=True)
    out["all_accepted"] = ok_all
    out["seconds"] = round(time.time() - t0, 1)
    json.dump(out, open(name + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== local {name}: {'all accepted' if ok_all else 'some boxes not accepted'}, {out['seconds']} s", flush=True)
    return out


def fault_test(path, sshift):
    """Test: re-judge the leaves of the record with the target s₀ + sshift (if sshift > 0, all leaves containing ρ = 0 should fail)."""
    rec = json.load(open(path, encoding="utf-8"))
    cx = Ctx(Fr(rec["rho0"]), quiet=True, sshift=Fr(sshift))
    tot = acc = 0
    for fname in FACES:
        for lf in rec["cert"][fname]:
            b = lf["box"]
            box = (Fr(b[0]), (Fr(b[1][0]), Fr(b[1][1])), (Fr(b[2][0]), Fr(b[2][1])))
            ok, why = cx.check(fname, box, lf["w"])
            tot += 1; acc += ok
    print(f"test sshift = {sshift}: leaves in the record {tot}, accepted {acc}", flush=True)
    return tot, acc


def verify(path):
    """Redo using only the leaves and weights of the record (no LP). The cover is rebuilt from the root with the same splitting, and the order of the leaves (depth first) must agree."""
    t0 = time.time()
    rec = json.load(open(path, encoding="utf-8"))
    cx = Ctx(Fr(rec["rho0"]), quiet=True)
    need(str(cx.rho1) == rec["rho1"], "ρ₁")
    need([dict(J=c["J"], alpha=c["alpha"], e_zero=c["e_zero"]) for c in cx.cands] == rec["cands"], "candidates agree with the record")
    tot = 0
    for fname in FACES:
        leaves = rec["cert"][fname]
        it = iter(leaves)
        cur = [None]

        def nxt():
            cur[0] = next(it, None)
        nxt()

        def walk(box):
            lf = cur[0]
            need(lf is not None, "too few leaves")
            if lf["box"] == boxstr(box):
                need(lf["w"] is not None, "leaf not accepted")
                ok, why = cx.check(fname, box, lf["w"])
                need(ok, f"leaf test {fname} {lf['box']} {why}")
                nxt()
                return 1
            b1, b2 = split(box)
            return walk(b1) + walk(b2)
        n = walk((cx.rho1, (Fr(-1), Fr(1)), (Fr(-1), Fr(1))))
        need(cur[0] is None, "too many leaves")
        tot += n
        print(f"verify face {fname}: leaves {n} passed", flush=True)
    print(f"verify {path}: all {tot} leaves passed, {time.time() - t0:.1f} s", flush=True)
    return tot


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd")
    ap.add_argument("path", nargs="?")
    ap.add_argument("--rho0", default="1/4096")
    ap.add_argument("--name", default=os.path.join(HERE, "f6", "f6_cubindod_local"))
    a = ap.parse_args()
    if a.cmd == "run":
        run(Fr(a.rho0), a.name)
    elif a.cmd == "fault":
        for sh in ("1/2**100", "-1/2**100"):
            fault_test(a.path, Fr(1, 2 ** 100) if sh[0] != "-" else -Fr(1, 2 ** 100))
    elif a.cmd == "verify":
        verify(a.path)
