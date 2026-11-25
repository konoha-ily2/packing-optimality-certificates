# F6 stage 3 (icoinico): check the upper bound s* ≤ s₀ without using inverses. 2026-11-16, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. The idea is plan 1 of pp/global_opt/NOTES_f6.md §8.6 (working notes, Japanese).
#   f6_field2.py (which computes with elements of K = Q[x]/(f) and takes inverses, e.g. in a = (y − β)/(2α)) did not finish for icoinico,
#   because the leading coefficient of f is large (74 bits) and the denominators grow at every reduction mod f. Here:
#   - Numbers are elements (u0 + r·u1) + y·(v0 + r·v1) of the ring R = Q[x, r, y]/(r² − 5, y² − D) (u and v are polynomials in Q[x]; no reduction mod f).
#     D = β² − 4αγ (α, β, γ are polynomials in s of degree ≤ 23 over Q(√5), coefficients of 9 digits, the fit stored in f6_icoinico_guess.json).
#   - The quaternion is kept homogeneous: q = (2α·d_b·d_c, (y − β)·d_b·d_c, −2α·n_b·d_c, −2α·n_c·d_b)
#     (b = −n_b/d_b, n_b = 2αV₀ + V₁(y − β), d_b = 2αV₂ + V₃(y − β), and the same for c). Rq = rot_q(q)·R̂ᵀ, Np = |q|².
#   - t is kept as the Cramer numerators T_i and det M. Value of a row × det M = n·Rv·dM + Np·(n·T) − Np·S₀·dM.
#   The map φ: x ↦ s₀ (the root of f, the only one in a rational interval), r ↦ +√5, y ↦ +√(D(s₀)). φ is a ring homomorphism.
#   Zero test (a sufficient condition): for u0 + r u1, let g = A + √5 B be the factor of f over Q(√5) with g(s₀) = 0 (A² − 5B² = λ f exactly,
#     the conjugate A − √5 B does not contain 0 on the ball of s₀, B(s₀) ≠ 0 on the ball); then φ(u0 + r u1) = (B u0 − A u1)(s₀)/B(s₀).
#     If f | (B u0 − A u1) (exact remainder in Q[x]) then φ = 0. The same for the y part (if u and v are both 0 then φ = 0).
#   The signs of nonzero values are decided with arb balls of s₀ (width 2^−HB), √5 and √D. No inverse is ever taken.
# Usage: python -X utf8 f6/f6_field3.py [icoinico] [--hb 16000]  → f6/f6_<case>_field3.json
import os, sys, json, time, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp
import flint
F6 = os.path.dirname(os.path.abspath(__file__))
HERE = os.path.dirname(F6)
sys.path.insert(0, HERE)
from f6_field_cubindod import root_ball
import f6_field as FG
from f6_tower import refine

ZP = flint.fmpq_poly([])


def P(c):
    return flint.fmpq_poly(c) if isinstance(c, list) else flint.fmpq_poly([c])


class Q5:
    """Q[x] ⊕ r·Q[x] (r² = 5; no reduction mod f)."""
    __slots__ = ("a", "b")

    def __init__(s, a, b=None):
        s.a = a if isinstance(a, flint.fmpq_poly) else qpoly(a)
        s.b = ZP if b is None else (b if isinstance(b, flint.fmpq_poly) else qpoly(b))

    def __add__(s, o): return Q5(s.a + o.a, s.b + o.b)
    def __sub__(s, o): return Q5(s.a - o.a, s.b - o.b)
    def __neg__(s): return Q5(-s.a, -s.b)
    def __mul__(s, o): return Q5(s.a * o.a + 5 * (s.b * o.b), s.a * o.b + s.b * o.a)
    def scale(s, k): return Q5(s.a * k, s.b * k)


def qpoly(x):
    x = Fr(x)
    return flint.fmpq_poly([x.numerator], x.denominator)


class LE:
    """(u) + y·(v), u, v ∈ Q5, y² = D (D ∈ Q5)."""
    __slots__ = ("u", "v")
    D = None

    def __init__(s, u, v=None):
        s.u = u
        s.v = Q5(ZP) if v is None else v

    @staticmethod
    def c(o):
        return o if isinstance(o, LE) else LE(Q5(qpoly(o)))

    def __add__(s, o): o = LE.c(o); return LE(s.u + o.u, s.v + o.v)
    __radd__ = __add__
    def __sub__(s, o): o = LE.c(o); return LE(s.u - o.u, s.v - o.v)
    def __rsub__(s, o): return LE.c(o) - s
    def __neg__(s): return LE(-s.u, -s.v)

    def __mul__(s, o):
        if not isinstance(o, LE):
            k = qpoly(o)
            return LE(s.u.scale(k), s.v.scale(k))
        return LE(s.u * o.u + LE.D * (s.v * o.v), s.u * o.v + s.v * o.u)
    __rmul__ = __mul__

    def deg(s):
        return max(p.degree() for p in (s.u.a, s.u.b, s.v.a, s.v.b))


class Ev:
    """Balls of the map φ, and the zero test."""
    f = None; A = None; B = None
    sb = r5b = yb = None
    HB = 16000
    how = None

    @staticmethod
    def pb(p):
        if p.degree() < 0:
            return flint.arb(0)
        v = flint.arb(0)
        sb = Ev.sb
        for co in reversed(p.numer().coeffs()):
            v = v * sb + int(co)
        return v / int(p.denom())

    @staticmethod
    def q5b(q):
        return Ev.pb(q.a) + Ev.r5b * Ev.pb(q.b)

    @staticmethod
    def ball(e):
        old = flint.ctx.prec; flint.ctx.prec = Ev.HB
        try:
            return Ev.q5b(e.u) + Ev.yb * Ev.q5b(e.v)
        finally:
            flint.ctx.prec = old

    @staticmethod
    def q5zero(q):
        w = Ev.B * q.a - Ev.A * q.b
        return w.degree() < 0 or (w % Ev.f).degree() < 0

    @staticmethod
    def zero(e):
        """A sufficient condition for φ(e) = 0. (i) u and v are both 0, or (ii) the norm u² − D v² is 0 (φ(u + yv)·φ(u − yv) = 0) and
        the ball of the conjugate φ(u − yv) does not contain 0. (ii) also works when D is a square in K (y ∈ K)."""
        if Ev.q5zero(e.u) and Ev.q5zero(e.v):
            Ev.how = "uv"
            return True
        if Ev.q5zero(e.u * e.u - LE.D * (e.v * e.v)):
            old = flint.ctx.prec; flint.ctx.prec = Ev.HB
            try:
                cb = Ev.q5b(e.u) - Ev.yb * Ev.q5b(e.v)
            finally:
                flint.ctx.prec = old
            if not cb.contains(0):
                Ev.how = "norm"
                return True
        return False

    @staticmethod
    def sign(e):
        b = Ev.ball(e)
        if b > 0: return 1
        if b < 0: return -1
        if Ev.zero(e): return 0
        raise RuntimeError("sign not decided (raise HB)")


def det3(M):
    return (M[0][0] * (M[1][1] * M[2][2] - M[1][2] * M[2][1]) - M[0][1] * (M[1][0] * M[2][2] - M[1][2] * M[2][0])
            + M[0][2] * (M[1][0] * M[2][1] - M[1][1] * M[2][0]))


def sqrt5_factor(name, f):
    """f = λ·(A² − 5B²), g = A + √5 B (a factor over Q(√5)). The sympy factorization is stored in f6/f6_<case>_sqrt5.json (acceptance uses the exact check below)."""
    path = os.path.join(F6, f"f6_{name}_sqrt5.json")
    if os.path.exists(path):
        d = json.load(open(path, encoding="utf-8"))
        out = [(flint.fmpq_poly([int(x) for x in g["A"]], int(g["Ad"])), flint.fmpq_poly([int(x) for x in g["B"]], int(g["Bd"]))) for g in d["factors"]]
        return out
    import sympy as sp
    x = sp.symbols("x"); r = sp.sqrt(5)
    fx = sum(int(c) * x ** i for i, c in enumerate(f.numer().coeffs()))
    t0 = time.time()
    fl = sp.factor_list(fx, extension=r)
    print(f"factorization over Q(√5) {time.time() - t0:.1f} s, factors {len(fl[1])}", flush=True)
    assert len(fl[1]) == 2

    def fq(p):
        Pp = sp.Poly(p, x); cs = Pp.all_coeffs()[::-1]
        den = sp.ilcm(*[sp.fraction(c)[1] for c in cs])
        return [str(int(c * den)) for c in cs], str(int(den))
    fac = []
    for g, e in fl[1]:
        g = sp.expand(g); A = sp.expand(g.subs(r, 0)); B = sp.expand((g - A) / r)
        (Ac, Ad), (Bc, Bd) = fq(A), fq(B)
        fac.append(dict(A=Ac, Ad=Ad, B=Bc, Bd=Bd))
    json.dump(dict(name=name, factors=fac, note="f \u306e Q(√5) \u4e0a\u306e\u56e0\u5b50 A + √5 B\uff08sympy\uff09\u3002\u53d7\u7406\u306b\u306f f6_field3.py \u306e\u6b63\u78ba\u306a\u78ba\u304b\u3081\u3092\u4f7f\u3046"),
              open(path, "w", encoding="utf-8"), indent=0)
    return sqrt5_factor(name, f)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="icoinico")
    ap.add_argument("--dps", type=int, default=10000)
    ap.add_argument("--hb", type=int, default=16000)
    ap.add_argument("--shift", type=int, default=0, help="test: set S₀ to C0·(s₀ ± 2^−|shift|) (making it smaller makes the separation stick out)")
    ap.add_argument("--qfault", type=int, default=0, help="test: multiply q₁ by (1 + 2^−qfault) (the active rows should no longer be 0)")
    A_ = ap.parse_args()
    name, dps = A_.name, A_.dps
    Ev.HB = A_.hb
    t0 = time.time()
    import d44_problems as DP
    DP.install()
    import d16e_common as C
    Pq = C.load("d44_" + name)
    assert Pq.CEDGE2 == 1
    assert C.QD.GENS[0] == 5
    h = json.load(open(os.path.join(F6, f"f6_{name}_hpx{dps}.json"), encoding="utf-8"))
    mp.mp.dps = 60
    s = mp.mpf(h["s"][:200])
    q = [mp.mpf(x[:200]) for x in h["quat"]]
    abc = [q[1] / q[0], q[2] / q[0], q[3] / q[0]]
    f = FG.load_f(name)
    deg = f.degree(); hd = deg // 2
    Ev.f = f
    # interval of s₀: first a unique root (f' ≠ 0) with 4000 bits, then narrowed inside it to width 2^−HB (signs at the ends exactly)
    mp.mp.dps = 1300
    s_hi = mp.mpf(h["s"][:1300])
    _, (lo, hi) = root_ball(f, s_hi, 4000)
    l2, h2 = refine(f, lo, hi, Fr(h["s"][:3000]), Ev.HB + 64)
    flint.ctx.prec = Ev.HB + 64
    Ev.sb = flint.arb(flint.fmpq(l2.numerator, l2.denominator)).union(flint.arb(flint.fmpq(h2.numerator, h2.denominator)))
    Ev.r5b = flint.arb(5).sqrt()
    print(f"interval of s₀ {time.time() - t0:.1f} s", flush=True)
    # relation for √5
    facs = sqrt5_factor(name, f)
    pick = None
    for Af, Bf in facs:
        N = Af * Af - 5 * (Bf * Bf)
        lam = N.coeffs()[-1] / f.coeffs()[-1]
        assert N == f * lam, "A² − 5B² = λ f"
        old = flint.ctx.prec; flint.ctx.prec = Ev.HB
        gb = Ev.pb(Af) + Ev.r5b * Ev.pb(Bf); gcb = Ev.pb(Af) - Ev.r5b * Ev.pb(Bf); bb = Ev.pb(Bf)
        flint.ctx.prec = old
        if gb.contains(0) and not gcb.contains(0):
            assert not bb.contains(0)
            pick = (Af, Bf)
    assert pick is not None, "factor vanishing at s₀"
    Ev.A, Ev.B = pick
    print(f"relation for √5 (exact) {time.time() - t0:.1f} s", flush=True)
    # the fit (integer relations, stored by f6_field2.py)
    guess = json.load(open(os.path.join(F6, f"f6_{name}_guess.json"), encoding="utf-8"))

    def kel(v):     # integers of length 2hd → Q5 (basis of s: [s^k, √5 s^k])
        return Q5(flint.fmpq_poly([int(x) for x in v[:hd]]), flint.fmpq_poly([int(x) for x in v[hd:]]))
    nk = 2 * hd
    vq = guess["quad_a"]["v"]
    al, be, ga = kel(vq[:nk]), kel(vq[nk:2 * nk]), kel(vq[2 * nk:])
    mp.mp.dps = 60
    s5 = mp.sqrt(5)

    def q5n(qq):
        return mp.polyval([mp.mpf(int(c)) for c in qq.a.numer().coeffs()][::-1] or [0], s) / int(qq.a.denom()) + \
            s5 * mp.polyval([mp.mpf(int(c)) for c in qq.b.numer().coeffs()][::-1] or [0], s) / int(qq.b.denom())
    a = abc[0]
    yn = 2 * q5n(al) * a + q5n(be)
    if yn < 0:
        al, be, ga = -al, -be, -ga; yn = -yn
    D = be * be - (al * ga).scale(qpoly(4))
    LE.D = D
    old = flint.ctx.prec; flint.ctx.prec = Ev.HB
    Db = Ev.q5b(D)
    assert Db > 0
    Ev.yb = Db.sqrt()
    flint.ctx.prec = old
    assert abs(float(Ev.yb.mid()) - float(yn)) < 1e-9 * max(1, abs(float(yn))), "ball of y vs numerical value"
    print(f"degree of D {D.a.degree()}, y = {float(yn):.6g}", flush=True)
    yv = LE(Q5(ZP), Q5(qpoly(1)))
    ALm = LE(al); BEm = LE(be)
    ym_b = yv - BEm                    # y − β = 2α a
    two_al = ALm * 2

    def mob(key):
        v = guess[key]["v"]
        V = [LE(kel(v[j * nk:(j + 1) * nk])) for j in range(4)]
        return two_al * V[0] + V[1] * ym_b, two_al * V[2] + V[3] * ym_b     # n, d (x = −n/d)
    nb, db = mob("mob_b")
    nc, dc = mob("mob_c")
    qh = [two_al * db * dc, ym_b * db * dc, -(two_al * nb * dc), -(two_al * nc * db)]
    if A_.qfault:
        qh[1] = qh[1] * (1 + Fr(1, 2 ** A_.qfault))      # test: move the configuration slightly (the zeros of the active rows should break)
        A_.shift = A_.shift or 1j
    print(f"homogeneous quaternion: degrees {[e.deg() for e in qh]} {time.time() - t0:.1f} s", flush=True)
    qb = [Ev.ball(e) for e in qh]
    for i in range(3):
        rat = float((qb[i + 1] / qb[0]).mid())
        assert abs(rat - float(abc[i])) < 1e-12, f"quaternion ratio {i}: {rat} vs {float(abc[i])}"

    def qk(x):
        out = LE(Q5(qpoly(x.v[0])))
        if len(x.v) > 1 and x.v[1] != 0:
            out = out + LE(Q5(ZP, qpoly(x.v[1])))
        assert all(z == 0 for z in x.v[2:])
        return out
    s0 = LE(Q5(flint.fmpq_poly([0, 1])))
    if A_.shift and A_.shift != 1j:
        s0 = s0 +(Fr(1, 2 ** A_.shift) if A_.shift > 0 else -Fr(1, 2 ** -A_.shift))
    S0 = qk(Pq.C0) * s0
    Np = qh[0] * qh[0] + qh[1] * qh[1] + qh[2] * qh[2] + qh[3] * qh[3]
    assert Ev.sign(Np) == 1
    Ra = C.rot_q(qh)
    Rh = [[qk(Pq.RSTAR[i][j]) for j in range(3)] for i in range(3)]
    for i in range(3):
        for j in range(3):
            assert Ev.zero(sum((Rh[i][k] * Rh[j][k] for k in range(3)), LE.c(0)) - (1 if i == j else 0))
    Rq = [[sum((Ra[i][k] * Rh[j][k] for k in range(3)), LE.c(0)) for j in range(3)] for i in range(3)]
    print(f"Rq: degree {max(e.deg() for row in Rq for e in row)} {time.time() - t0:.1f} s", flush=True)
    Npf = float(Ev.ball(Np).mid())
    Rfl = np.array([[float(Ev.ball(Rq[i][j]).mid()) / Npf for j in range(3)] for i in range(3)])
    NCF = np.array([[float(x) for x in n] for n in Pq.NORMALS])
    VF = np.array([[float(x) for x in v] for v in Pq.VERTS])
    n0f = np.array([float(x) for x in Pq.N0]); D0f = float(Pq.D0)
    from scipy.optimize import linprog
    nf = Pq.NF
    H = NCF @ Rfl @ VF.T
    Am = np.zeros((nf + 1, 4)); bb = np.zeros(nf + 1)
    Am[:nf, :3] = NCF; Am[:nf, 3] = -1; bb[:nf] = -H.max(axis=1)
    Am[nf, :3] = Rfl @ n0f; bb[nf] = -D0f
    r = linprog([0, 0, 0, 1], A_ub=Am, b_ub=bb, bounds=[(None, None)] * 4, method="highs")
    assert r.status == 0
    tf = r.x[:3]; Sf = r.x[3]
    print("S (LP)", Sf, "C0·s", float(Pq.C0) * float(s), flush=True)
    act = [(fi, vi) for fi in range(nf) for vi in range(len(Pq.VERTS)) if abs(NCF[fi] @ (Rfl @ VF[vi] + tf) - Sf) < 1e-9]
    sep_act = abs((Rfl @ n0f) @ tf + D0f) < 1e-9
    print("active rows", act, "separation", sep_act, flush=True)
    NK = [[qk(x) for x in n] for n in Pq.NORMALS]
    VK = [[qk(x) for x in v] for v in Pq.VERTS]
    n0k = [qk(x) for x in Pq.N0]
    D0k = qk(Pq.D0)
    Rv = [[sum((Rq[i][j] * VK[vi][j] for j in range(3)), LE.c(0)) for i in range(3)] for vi in range(len(VK))]
    u = [sum((Rq[i][j] * n0k[j] for j in range(3)), LE.c(0)) for i in range(3)]

    def row_eq(fv):
        if fv == "sep":
            return u, -(Np * D0k)
        fi, vi = fv
        n = NK[fi]
        return [Np * n[i] for i in range(3)], Np * S0 - sum((n[i] * Rv[vi][i] for i in range(3)), LE.c(0))
    eqs = list(act) + (["sep"] if sep_act else [])
    best = None
    for tri in itertools.combinations(range(len(eqs)), 3):
        M = [list(Rfl @ n0f) if eqs[k] == "sep" else list(NCF[eqs[k][0]]) for k in tri]
        d = abs(np.linalg.det(np.array(M)))
        if best is None or d > best[0]:
            best = (d, tri)
    tri = best[1]
    rows3 = [row_eq(eqs[k]) for k in tri]
    M = [rw[0] for rw in rows3]; rhs = [rw[1] for rw in rows3]
    dM = det3(M)
    sdM = Ev.sign(dM)
    assert sdM != 0
    T = []
    for c in range(3):
        Mc = [[(rhs[rr] if cc == c else M[rr][cc]) for cc in range(3)] for rr in range(3)]
        T.append(det3(Mc))
    dMb = Ev.ball(dM)
    for i in range(3):
        assert abs(float((Ev.ball(T[i]) / dMb).mid()) - tf[i]) < 1e-6, "fit of t"
    print(f"t: degree {max(e.deg() for e in T)}, sign of det M {sdM} {time.time() - t0:.1f} s", flush=True)
    nzero = nneg = 0
    maxdeg = 0
    zhow = {}
    for fi in range(nf):
        n = NK[fi]
        nT = sum((n[i] * T[i] for i in range(3)), LE.c(0))
        NnT = Np * nT
        for vi in range(len(VK)):
            val = sum((n[i] * Rv[vi][i] for i in range(3)), LE.c(0)) * dM + NnT - Np * S0 * dM     # = value of the row × det M
            maxdeg = max(maxdeg, val.deg())
            try:
                sg = Ev.sign(val) * sdM
            except RuntimeError:
                b = Ev.ball(val)
                print(f"face {fi} vertex {vi} (active row {(fi, vi) in act}): ball {b.mid().str(5)} ± {b.rad().str(3)}, degree {val.deg()}, "
                      f"u is 0 {Ev.q5zero(val.u)}, v is 0 {Ev.q5zero(val.v)}", flush=True)
                raise
            if A_.shift and sg != 0 and (fi, vi) in act:
                print(f"  test: sign of active row {fi},{vi}: {sg}", flush=True)
                if sg > 0:
                    raise SystemExit(f"test: sticks out (as expected, shift {A_.shift})")
                continue
            if (fi, vi) in act:
                assert sg == 0, f"active row {fi},{vi} is not 0"
            assert sg <= 0, f"face {fi} vertex {vi} sticks out"
            nzero += sg == 0; nneg += sg < 0
            if sg == 0:
                zhow[f"{fi},{vi}"] = Ev.how
        print(f"  up to face {fi}: rows = 0: {nzero}, negative rows: {nneg}, {time.time() - t0:.1f} s", flush=True)
    sepv = sum((u[i] * T[i] for i in range(3)), LE.c(0)) + Np * D0k * dM
    ss = Ev.sign(sepv) * sdM
    assert ss <= 0, "separation"
    if sep_act:
        assert ss == 0

    def sp(p):
        return dict(num_low_to_high=[str(int(x)) for x in p.numer().coeffs()], den=str(int(p.denom())))

    def se(e):
        return dict(u=sp(e.u.a), ur5=sp(e.u.b), v=sp(e.v.a), vr5=sp(e.v.b))
    out = dict(name=name, method="f6_field3\uff08\u9006\u5143\u306a\u3057\uff09\uff1a\u74b0 Q[x, r, y]/(r² − 5, y² − D) \u306e\u5143\u3001mod f \u306f\u53d6\u3089\u306a\u3044\u30020 \u306f f | (B u0 − A u1) \u3067\u3001\u7b26\u53f7\u306f\u7403\u3067",
               coords="d44\uff08\u99d2\u306f R̂ \u3067\u56de\u3057\u3066\u3042\u308b\u3001R = rot_q(q)·R̂ᵀ/|q|²\u3001t = T/det M\u3001S = C0·s\uff09",
               lo=f"{l2.numerator}/{l2.denominator}", hi=f"{h2.numerator}/{h2.denominator}", interval_bits=Ev.HB + 64,
               D=dict(a=sp(D.a), r5=sp(D.b)), sqrt5_factor=dict(A=sp(Ev.A), B=sp(Ev.B)),
               elems=dict(q0=se(qh[0]), q1=se(qh[1]), q2=se(qh[2]), q3=se(qh[3]), T0=se(T[0]), T1=se(T[1]), T2=se(T[2]), detM=se(dM)),
               checks=dict(active=[list(a) for a in act], separation_active=bool(sep_act), solved_from=[str(eqs[k]) for k in tri],
                           rows_zero=nzero, rows_neg=nneg, separation_sign=ss, zero_by=zhow, sep_zero_by=Ev.how if ss == 0 else None, det_sign=sdM, max_row_degree=maxdeg),
               sec=round(time.time() - t0, 1),
               note="F6 \u6bb5 3\uff08icoinico\uff09\u3001Opus 5.5\u30012026-11-16\u3002\u5f53\u3066\u306f LLL\uff08\u6570\u5024\u3001f6_icoinico_guess.json\uff09\u3001\u78ba\u304b\u3081\u306f\u74b0\u306e\u4e2d\u3067\u6b63\u78ba\uff080 \u306f\u5270\u4f59\u3001\u7b26\u53f7\u306f arb \u306e\u53b3\u5bc6\u306a\u7403\uff09\u3002\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")
    if A_.shift:
        print("test run, so nothing is saved")
        return
    json.dump(out, open(os.path.join(F6, f"f6_{name}_field3.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=0)
    print(f"routes of the zero test: {zhow}, separation {Ev.how}", flush=True)
    print(f"== upper bound s* ≤ s₀ (no inverses): rows = 0: {nzero}, negative rows: {nneg}, separation {ss}, {time.time() - t0:.1f} s", flush=True)


if __name__ == "__main__":
    main()
