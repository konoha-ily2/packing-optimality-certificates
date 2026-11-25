# F6 stage 3 (icoinico): the local part in the same ring as f6_field3 (no inverses, no reduction mod f). 2026-11-16, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. The acceptance test (boxes, weights, quadratic terms) is the one of f6_local.py, used as is;
# only the places that need "exact elements of the field L" are replaced (pp/global_opt/NOTES_f6.md §9.4 (working notes, Japanese)):
#   - The ring R = Q[x, r, y]/(r² − 5, y² − D) (LE of f6_field3), the map φ: x ↦ s₀, r ↦ √5, y ↦ +√D(s₀). Zero tests and signs by f6_field3.Ev.
#   - Centre: from the homogeneous quaternion q of f6_field3 (Rq = rot_q(q)·R̂ᵀ = |q|²·R) and the quaternion q̂ of R̂ (in Q(√5), from R̂ via (1 + tr, …)),
#     r = q ⊗ conj(q̂). rot_q(r)·|q|² = Rq·|r|² is checked to be 0 in R. p* = (r₁, r₂, r₃)/r₀ (r₀ ≠ 0 on the ball).
#   - The value at p* of a polynomial g (degree ≤ d in x, y, z) is g^h(r)/r₀^d, with g^h(r) = r₀^d g(r₁/r₀, …) ∈ R.
#     The zero test is done on g^h(r) (equivalent, since r₀ ≠ 0), and the ball is φ(g^h)/φ(r₀)^d.
#   - The gradient c_k is the numerator r₀³ c_k of ∇Φ_k (homogenized with degree 3). Even a common multiple that is not positive does not change the solution w of Σ w c = 0, Σ w = 1.
#   - Multipliers W: Σ_{k∈S} w_k c_k = 0, Σ w = 1 by Cramer's rule (w_j = Δ_j/Δ, Δ ∈ R). The remaining equations Σ_j (row)_j Δ_j − (right-hand side) Δ = 0 are checked to be 0 in R,
#     and w_j > 0 is checked as φ(Δ_j)·φ(Δ) > 0 (balls).
# Usage: python -X utf8 f6/f6_local3.py run|verify|fault|analyze|sample icoinico|<record.json> [--rho0 1/32]
import os, sys, json, time, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import sympy as sp
import flint
F6 = os.path.dirname(os.path.abspath(__file__))
HERE = os.path.dirname(F6)
sys.path.insert(0, HERE); sys.path.insert(0, F6)
import f6_local as FL
from f6_local import need, FACES, x, y, z, poly_terms, SYM_S, fq
import d16e_common as C
from d16e_common import QD
import d16e_local as L
import d44_local as DL
import f6_field as FG
from f6_field3 import Q5, LE, Ev, ZP, qpoly
from f6_tower import refine

PREC = FL.PREC


def de_poly(d):
    return flint.fmpq_poly([int(v) for v in d["num_low_to_high"]], int(d["den"]))


def sp_poly(p):
    return dict(num_low_to_high=[str(int(v)) for v in p.numer().coeffs()], den=str(int(p.denom())))


def de_le(d):
    return LE(Q5(de_poly(d["u"]), de_poly(d["ur5"])), Q5(de_poly(d["v"]), de_poly(d["vr5"])))


def ser_le(e):
    return dict(u=sp_poly(e.u.a), ur5=sp_poly(e.u.b), v=sp_poly(e.v.a), vr5=sp_poly(e.v.b))


def le_zero(e):
    return Ev.zero(e)


class Frac:
    """φ(n)/φ(d) (n, d ∈ R, φ(d) ≠ 0). Replaces the weights of W in f6_local (only .ball() is used)."""
    def __init__(s, n, d):
        s.n, s.d = n, d

    def ball(s):
        return Ev.ball(s.n) / Ev.ball(s.d)

    def ser(s):
        return dict(n=ser_le(s.n), d=ser_le(s.d))


class HV:
    """Value at p*: φ(num)/φ(r₀)^d."""
    def __init__(s, num, d, r0b):
        s.num, s.d, s.r0b = num, d, r0b

    def iszero(s):
        return Ev.zero(s.num)

    def ball(s):
        return Ev.ball(s.num) / s.r0b ** s.d

    def sign(s):
        sg = Ev.sign(s.num)
        return sg if s.d % 2 == 0 or s.r0b > 0 else -sg


def qmul(a, b):
    a0, a1, a2, a3 = a; b0, b1, b2, b3 = b
    return [a0 * b0 - a1 * b1 - a2 * b2 - a3 * b3,
            a0 * b1 + a1 * b0 + a2 * b3 - a3 * b2,
            a0 * b2 - a1 * b3 + a2 * b0 + a3 * b1,
            a0 * b3 + a1 * b2 - a2 * b1 + a3 * b0]


def load_ring(pair):
    """Rebuild the ring and the map from f6_<case>_field3.json (re-checking the signs at the ends of the interval, the factor for √5 and the sign of D)."""
    d = json.load(open(os.path.join(F6, f"f6_{pair}_field3.json"), encoding="utf-8"))
    f = FG.load_f(pair)
    Ev.f = f
    lo = Fr(d["lo"]); hi = Fr(d["hi"])
    need(f(fq(lo)) * f(fq(hi)) < 0, "the sign of f changes between the ends of the interval")
    flint.ctx.prec = d["interval_bits"]
    Ev.sb = flint.arb(fq(lo)).union(flint.arb(fq(hi)))
    need(not FL.evb(f.derivative(), Ev.sb).contains(0), "f′ ≠ 0 on the interval (the root is unique)")
    Ev.HB = d["interval_bits"] - 64
    Ev.r5b = flint.arb(5).sqrt()
    A = de_poly(d["sqrt5_factor"]["A"]); B = de_poly(d["sqrt5_factor"]["B"])
    N = A * A - 5 * (B * B)
    lam = N.coeffs()[-1] / f.coeffs()[-1]
    need(N == f * lam, "A² − 5B² = λ f")
    flint.ctx.prec = Ev.HB
    need(not (Ev.pb(A) - Ev.r5b * Ev.pb(B)).contains(0) and not Ev.pb(B).contains(0), "conjugate A − √5 B ≠ 0 and B ≠ 0 (at s₀)")
    Ev.A, Ev.B = A, B
    LE.D = Q5(de_poly(d["D"]["a"]), de_poly(d["D"]["r5"]))
    Db = Ev.q5b(LE.D)
    need(Db > 0, "D(s₀) > 0")
    Ev.yb = Db.sqrt()
    q = [de_le(d["elems"][f"q{i}"]) for i in range(4)]
    flint.ctx.prec = PREC
    return q, d


def qk(v):
    v = QD.c(v)
    out = LE(Q5(qpoly(v.v[0])))
    if len(v.v) > 1 and v.v[1] != 0:
        out = out + LE(Q5(ZP, qpoly(v.v[1])))
    need(all(z_ == 0 for z_ in v.v[2:]), "the field is quadratic")
    return out


_BASE = FL.Ctx


class Ctx3(_BASE):
    def __init__(self, pair, rho0, quiet=False, sshift=Fr(0), W_given=None, flipQ=False, flipA=False):
        t0 = time.time()
        self.pair = pair
        self.flipQ, self.flipA = flipQ, flipA
        self.P = P = C.load("d44_" + pair)
        need(QD.GENS[0] == 5, "√5")
        self.qh, self.fd = load_ring(pair)
        self.rad = LE(Q5(ZP, qpoly(1)))
        self.radb = flint.arb(5).sqrt()
        s0 = LE(Q5(flint.fmpq_poly([0, 1])))
        self.S0 = qk(P.C0) * (s0 + Fr(sshift))
        self.S0b = Ev.ball(self.S0)
        self.center()
        self.pb = [Ev.ball(v) / self.r0b for v in self.r[1:]]
        self.rho0 = Fr(rho0)
        self.rho1 = self.rho0 + Fr(1, 2 ** 60)
        for v in self.pb:
            need(abs(v) < flint.arb(fq(Fr(1, 2 ** 60))), "‖p*‖∞ ≤ 2⁻⁶⁰")
        act, ties, Sf, slack = DL.near_active(P)
        self.act, self.ties = act, ties
        q = (1, x, y, z)
        Rq = sp.Matrix(C.rot_q(q))
        N = 1 + x * x + y * y + z * z
        n0 = sp.Matrix([FL.qds(c) for c in P.N0])
        Un = Rq * n0
        self.cands = []
        self.skipped = []
        for J in itertools.combinations(act, 3):
            for al in itertools.product(*[ties[f] for f in J]):
                M = [[P.NORMALS[J[cc]][r] for cc in range(3)] for r in range(3)]
                if C.det3(M) == 0:
                    self.skipped.append(dict(J=list(J), alpha=list(al), why="M_J singular")); continue
                Mi = C.inv3(M)
                Mis = sp.Matrix([[FL.qds(Mi[r][cc]) for cc in range(3)] for r in range(3)])
                A = [sp.expand(-(Mis.row(j) * Un)[0]) for j in range(3)]
                Phi = FL.qds(P.D0) * N ** 2 - SYM_S * N * sum(A)
                for j in range(3):
                    n = [FL.qds(cc) for cc in P.NORMALS[J[j]]]
                    v = [FL.qds(cc) for cc in P.VERTS[al[j]]]
                    Phi += A[j] * sum(n[i] * sum(Rq[i, k] * v[k] for k in range(3)) for i in range(3))
                Phi = sp.expand(Phi)
                cd = dict(J=list(J), alpha=list(al))
                cd["e"] = self.eval_h(Phi, 4)
                cd["e_zero"] = cd["e"].iszero()
                cd["eb"] = flint.arb(0) if cd["e_zero"] else cd["e"].ball()
                cd["A0b"] = [self.eval_h(Aj, 2).ball() for Aj in A]
                cd["grad"] = [self.eval_h(sp.diff(Phi, vv), 3) for vv in (x, y, z)] if (cd["e_zero"] or W_given is not None) else None
                cd["Phi"] = Phi
                cd["faces"] = {fn: dict(G=self.shift(Phi, sub), A=[self.shift(Aj, sub) for Aj in A]) for fn, sub in FACES.items()}
                self.cands.append(cd)
        self.find_W(quiet, W_given)
        self.tb = round(time.time() - t0, 1)
        if not quiet:
            print(f"candidates {len(self.cands)} (discarded {len(self.skipped)}), candidates with e = 0: {sum(c['e_zero'] for c in self.cands)}, active faces {act}, "
                  f"vertices of W {len(self.W)}, build {self.tb} s", flush=True)

    # ----- centre -----
    def center(self):
        P = self.P
        qh = self.qh
        Rh = [[qk(P.RSTAR[i][j]) for j in range(3)] for i in range(3)]
        for i in range(3):
            for j in range(3):
                need(Ev.zero(sum((Rh[i][k] * Rh[j][k] for k in range(3)), LE.c(0)) - (1 if i == j else 0)), "R̂ is orthogonal")
        tr = Rh[0][0] + Rh[1][1] + Rh[2][2]
        qhat = [tr + 1, Rh[2][1] - Rh[1][2], Rh[0][2] - Rh[2][0], Rh[1][0] - Rh[0][1]]
        need(Ev.sign(qhat[0]) != 0, "1 + tr R̂ ≠ 0")
        nqh = sum((e * e for e in qhat), LE.c(0))
        Rqh = C.rot_q(qhat)
        for i in range(3):
            for j in range(3):
                need(Ev.zero(Rqh[i][j] - Rh[i][j] * nqh), "rot_q(q̂) = |q̂|² R̂")
        Np = sum((e * e for e in qh), LE.c(0))
        Ra = C.rot_q(qh)
        Rq = [[sum((Ra[i][k] * Rh[j][k] for k in range(3)), LE.c(0)) for j in range(3)] for i in range(3)]   # = rot_q(q)·R̂ᵀ
        r = qmul(qh, [qhat[0], -qhat[1], -qhat[2], -qhat[3]])
        nr = sum((e * e for e in r), LE.c(0))
        Rr = C.rot_q(r)
        for i in range(3):
            for j in range(3):
                need(Ev.zero(Rr[i][j] * Np - Rq[i][j] * nr), "rot_q(r)·|q|² = Rq·|r|² (r = q ⊗ conj(q̂))")
        self.r = r
        self.r0b = Ev.ball(r[0])
        need(not self.r0b.contains(0), "r₀ ≠ 0")
        # precompute the homogeneous monomials r^m for each degree
        self.rmon = {}

    def rpow(self, ex, d):
        key = (ex, d)
        if key not in self.rmon:
            t = LE.c(1)
            for i, kk in enumerate((d - sum(ex),) + tuple(ex)):
                for _ in range(kk):
                    t = t * self.r[i]
            self.rmon[key] = t
        return self.rmon[key]

    def sym_le(self, e):
        G = L.rgens()
        p = sp.Poly(sp.expand(e), *G, SYM_S)
        out = LE.c(0)
        for ks, c in p.terms():
            c = sp.Rational(c)
            t = LE.c(Fr(int(c.p), int(c.q)))
            for _ in range(ks[0]):
                t = t * self.rad
            for _ in range(ks[-1]):
                t = t * self.S0
            out = out + t
        return out

    def eval_h(self, e, d):
        out = LE.c(0)
        for ex, cf in poly_terms(e, (x, y, z)).items():
            need(sum(ex) <= d, "degree of the homogenization")
            out = out + self.sym_le(cf) * self.rpow(ex, d)
        return HV(out, d, self.r0b)

    def eval_l(self, e):        # for analyze (numerical only)
        dd = max([sum(m) for m in poly_terms(e, (x, y, z))] or [0])
        return self.eval_h(e, dd)

    # ----- exact multipliers W (Cramer) -----
    def find_W(self, quiet, W_given=None):
        if W_given is not None:
            self.elig = []; self.cfl = {}
            verts = [dict(S=list(v["S"]), w=[Frac(de_le(e["n"]), de_le(e["d"])) for e in v["w"]]) for v in W_given]
            for v in verts:
                v["wf"] = [float(e.ball().mid()) for e in v["w"]]
            self.W = verts
            self._W_faces()
            return
        _BASE.find_W(self, quiet, None)

    def solve_exact(self, S, Mx):
        r = len(S)
        rowsL = [[self.cands[k]["grad"][i].num for k in S] for i in range(3)] + [[LE.c(1)] * r]
        rhsL = [LE.c(0)] * 3 + [LE.c(1)]
        best = None
        for R in itertools.combinations(range(4), r):
            if 3 not in R:
                continue
            dd = abs(np.linalg.det(Mx[list(R), :]))
            if best is None or dd > best[0]:
                best = (dd, R)
        if best is None or best[0] < 1e-12:
            return None
        R = best[1]
        Am = [[rowsL[i][j] for j in range(r)] for i in R]
        bm = [rhsL[i] for i in R]
        Dl = det(Am)
        sD = Ev.sign(Dl)
        if sD == 0:
            return None
        Dj = [det([[(bm[ii] if jj == j else Am[ii][jj]) for jj in range(r)] for ii in range(r)]) for j in range(r)]
        for i in range(4):
            tot = sum((rowsL[i][j] * Dj[j] for j in range(r)), LE.c(0)) - rhsL[i] * Dl
            if not Ev.zero(tot):
                return None
        if any(Ev.sign(v) * sD <= 0 for v in Dj):
            return None
        return [Frac(v, Dl) for v in Dj]


def det(M):
    n = len(M)
    if n == 1:
        return M[0][0]
    if n == 2:
        return M[0][0] * M[1][1] - M[0][1] * M[1][0]
    out = LE.c(0)
    for j in range(n):
        minor = [row[:j] + row[j + 1:] for row in M[1:]]
        t = M[0][j] * det(minor)
        out = out + t if j % 2 == 0 else out - t
    return out


class _L2shim:
    """Replacement for the place where f6_local.verify compares the weights of W with the record ((a − L2.de(b)).iszero())."""
    @staticmethod
    def de(b):
        return Frac(de_le(b["n"]), de_le(b["d"]))


def _frac_sub(a, b):
    class Z:
        def iszero(_):
            return Ev.zero(a.n * b.d - b.n * a.d)
    return Z()


Frac.__sub__ = _frac_sub
FL.Ctx = Ctx3
FL.L2 = _L2shim


def sample(pair, rho0, n=400, seed=1):
    from scipy.optimize import linprog
    P = C.load("d44_" + pair)
    cx = Ctx3(pair, rho0, quiet=True)
    pst = np.array([float(v.mid()) for v in cx.pb])
    S0 = float(cx.S0b.mid())
    NCF = np.array([[float(v) for v in n_] for n_ in P.NORMALS]); VF = np.array([[float(v) for v in v_] for v_ in P.VERTS])
    n0f = np.array([float(v) for v in P.N0]); D0f = float(P.D0); nf = P.NF
    rng = np.random.default_rng(seed)
    worst = []
    for it in range(n):
        r_ = float(rho0) * rng.random() ** 2
        th = rng.uniform(-1, 1, 3); th /= np.abs(th).max()
        p = pst + r_ * th
        Nq = 1 + p @ p
        R = np.array(C.rot_q([1.0, *p]), dtype=float) / Nq
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
    ap.add_argument("cmd"); ap.add_argument("arg")
    ap.add_argument("--rho0", default="1/32"); ap.add_argument("--name", default=None)
    a = ap.parse_args()
    if a.cmd == "analyze":
        FL.analyze(a.arg)
    elif a.cmd == "run":
        nm = a.name or os.path.join(F6, f"f6_{a.arg}_local")
        out = FL.run(a.arg, Fr(a.rho0), nm)
        out["field_json"] = f"f6/f6_{a.arg}_field3.json"; out["tool"] = "f6/f6_local3.py"
        json.dump(out, open(nm + ".json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    elif a.cmd == "verify":
        FL.verify(a.arg)
    elif a.cmd == "fault":
        FL.verify(a.arg, sshift=Fr(1, 2 ** 100), count_only=True)
        FL.verify(a.arg, sshift=-Fr(1, 2 ** 100), count_only=True)
        FL.verify(a.arg, flipQ=True, count_only=True)
    elif a.cmd == "sample":
        sample(a.arg, Fr(a.rho0))
