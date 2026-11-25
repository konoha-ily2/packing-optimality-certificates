# F6 stage 3a: write the optimal configuration of cubindod, n=2, exactly with elements of the field K = Q(s*) (degree 32), and check the upper bound s* ≤ s₀ in K.
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# Steps:
#   1. √5 is obtained exactly by factoring f over Q(√5). a, b, c (q = (1, a, b, c)) and T = 2t are found by LLL as polynomials in s of degree ≤ 15
#      with Q(√5) coefficients (from the 6000-digit values f6_cubindod_hpx6000.json; coefficients of about 70 digits).
#      The fit is numerical, but step 2 checks it exactly, so the result does not depend on the fit.
#   2. Check exactly (K = Q[x]/(f), f is the degree-32 polynomial in f6_cubindod_minpoly.json):
#      (i) (√5)² = 5, (ii) the 7 active rows are exactly 0 in K, (iii) the other faces and vertices (A and B = −A) are ≤ 0 in K,
#      (iv) s N − S' = 0 (S' is the coefficient of s in the face expression). Signs are decided with arb (intervals, rigorous bounds) by substituting the ball of s*.
#      s* is "the real root of f that is the only one in the rational interval [lo, hi]" (f(lo)·f(hi) < 0 and f' ≠ 0 on the interval, with arb).
# Usage: python -X utf8 f6_field_cubindod.py  → f6/f6_cubindod_field.json
import os, sys, json, time
from fractions import Fraction as Fr
import mpmath as mp
import flint
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
PHI_F = (1 + 5 ** 0.5) / 2


def load_f():
    d = json.load(open(os.path.join(HERE, "f6", "f6_cubindod_minpoly.json"), encoding="utf-8"))
    return flint.fmpq_poly([int(x) for x in d["coeffs_low_to_high"]])


def lll_rel(x, pows, P):
    """Look for x = Σ c_k s^k (c_k rational). Lattice basis [x, s^0, …, s^31]. Integers (D, n) with D·x − Σ n_k s^k = 0."""
    basis = [x] + pows
    m = len(basis)
    C = mp.mpf(10) ** P
    rows = []
    for i, bb in enumerate(basis):
        r = [0] * m
        r[i] = 1
        r.append(int(mp.nint(C * bb)))
        rows.append(r)
    L = flint.fmpz_mat(rows).lll()
    best = None
    for k in range(m):
        a = [int(L[k, j]) for j in range(m)]
        if a[0] == 0:
            continue
        res = abs(mp.fsum(a[j] * basis[j] for j in range(m)))
        lr = float(mp.log10(res)) if res > 0 else -1e9
        if best is None or lr < best[1]:
            best = (a, lr)
    a, lr = best
    D = a[0]
    coeffs = [Fr(-a[j + 1], D) for j in range(m - 1)]
    nd = max(len(str(abs(a[j]))) for j in range(m))
    return coeffs, lr, nd


def kpoly(coeffs):
    from math import lcm
    den = 1
    for c in coeffs:
        den = lcm(den, c.denominator)
    return flint.fmpq_poly([int(c * den) for c in coeffs], den)


class K:
    """An element of K = Q[x]/(f)."""
    f = None

    def __init__(self, p):
        self.p = flint.fmpq_poly(p) % K.f

    def __add__(s, o): return K(s.p + _p(o))
    __radd__ = __add__
    def __sub__(s, o): return K(s.p - _p(o))
    def __rsub__(s, o): return K(_p(o) - s.p)
    def __mul__(s, o): return K(s.p * _p(o))
    __rmul__ = __mul__
    def __neg__(s): return K(-s.p)
    def iszero(s): return s.p.degree() < 0


def _p(o):
    if isinstance(o, K):
        return o.p
    if isinstance(o, Fr):
        return flint.fmpq_poly([o.numerator], o.denominator)
    return flint.fmpq_poly([o])


def sqrt5_exact(f, s):
    """Factor f over Q(√5) (sympy); from the factor g = A + √5 B that vanishes at s*, √5 = −A(x)/B(x) mod f (exact)."""
    import sympy as sp
    x = sp.symbols("x"); r = sp.sqrt(5)
    fx = sum(int(c) * x ** i for i, c in enumerate(f.numer().coeffs()))
    fl = sp.factor_list(fx, extension=r)
    assert len(fl[1]) == 2 and all(sp.degree(g, x) == 16 for g, e in fl[1])

    def fq(p):
        P = sp.Poly(p, x); cs = P.all_coeffs()[::-1]
        den = sp.ilcm(*[sp.fraction(c)[1] for c in cs])
        return flint.fmpq_poly([int(c * den) for c in cs], int(den))
    out = []
    for g, e in fl[1]:
        g = sp.expand(g); A = sp.expand(g.subs(r, 0)); B = sp.expand((g - A) / r)
        G, U, _ = fq(B).xgcd(f)
        assert G == 1   # flint's xgcd returns the monic gcd
        R5 = K(-fq(A) * U)
        out.append(R5)
    # the one with √5 > 0 at s* (the other is −√5)
    vals = [float(mp.fsum(mp.mpf(int(c)) * s ** i for i, c in enumerate(k.p.numer().coeffs())) / int(k.p.denom())) for k in out]
    k = out[0] if vals[0] > 0 else out[1]
    assert abs(max(vals) - 5 ** 0.5) < 1e-9 and abs(min(vals) + 5 ** 0.5) < 1e-9
    return k


def root_ball(f, approx, prec_bits):
    """Enclose a real root of f in a rational interval, check rigorously that it is the only root there, and return the arb ball."""
    flint.ctx.prec = prec_bits
    e = Fr(1, 2 ** (prec_bits - 40))
    x0 = Fr(mp.nstr(approx, int(prec_bits * 0.301) + 20, strip_zeros=False))
    lo, hi = x0 - e, x0 + e
    flo, fhi = f(flint.fmpq(lo.numerator, lo.denominator)), f(flint.fmpq(hi.numerator, hi.denominator))   # exact
    assert (flo < 0 and fhi > 0) or (flo > 0 and fhi < 0), "no sign change"
    ball = flint.arb(flint.fmpq(lo.numerator, lo.denominator)).union(flint.arb(flint.fmpq(hi.numerator, hi.denominator)))
    d = evb(f.derivative(), ball)
    assert not (d.contains(0)), "f' contains 0 on the interval"
    return ball, (lo, hi)


def evb(p, ball):
    """Rational polynomial p evaluated on an arb ball (Horner, rigorous bounds)."""
    v = flint.arb(0)
    for co in reversed(p.numer().coeffs()):
        v = v * ball + flint.arb(int(co))
    return v / flint.arb(int(p.denom()))


def sign(k, ball):
    if k.iszero():
        return 0
    v = evb(k.p, ball)
    if v > 0:
        return 1
    if v < 0:
        return -1
    raise RuntimeError("sign not decided (raise the precision)")


def main():
    t0 = time.time()
    import d30_diag as D
    sv = {e["name"]: e for e in json.load(open(os.path.join(HERE, "d16b_n2_survey.json"), encoding="utf-8"))}
    Pb = D.Prob("cubindod", sv["cubindod"])
    h = json.load(open(os.path.join(HERE, "f6", "f6_cubindod_hpx6000.json"), encoding="utf-8"))
    mp.mp.dps = 6000
    s = mp.mpf(h["s"])
    q = [mp.mpf(x) for x in h["quat"]]
    tt = [mp.mpf(x) for x in h["t"]]
    a_, b_, c_ = q[1] / q[0], q[2] / q[0], q[3] / q[0]
    N_ = 1 + a_ ** 2 + b_ ** 2 + c_ ** 2
    T_ = [2 * x for x in tt]
    # the fitting basis is s of degree ≤ 15 over Q(√5) (in the basis s^0..s^31 over Q the coefficients of √5 alone have 120 digits, and the fit would need more than 8000 digits)
    pows = [s ** k for k in range(16)] + [mp.sqrt(5) * s ** k for k in range(16)]
    f = load_f()
    K.f = f
    r5 = sqrt5_exact(f, s)
    P = 5800
    targets = [("a", a_), ("b", b_), ("c", c_)] + [(f"T{i}", T_[i]) for i in range(3)]
    found = {}
    for nm, x in targets:
        co, lr, nd = lll_rel(x, pows, P)
        ok = lr < -(P + 50)
        print(nm, "residual 1e", round(lr), "digits of coefficients", nd, "ok" if ok else "not found", round(time.time() - t0, 1), "s", flush=True)
        if not ok:
            raise SystemExit("fit failed: raise the precision")
        found[nm] = co
    E = {nm: K(kpoly(co[:16])) + r5 * K(kpoly(co[16:])) for nm, co in found.items()}
    E["r5"] = r5
    S = K(flint.fmpq_poly([0, 1]))
    # (i)
    assert (r5 * r5 - 5).iszero(), "the square of √5 is not 5"
    phi = (1 + r5) * Fr(1, 2)
    sc = (1 + PHI_F ** 2) ** 0.5

    def exact_of(x):
        y = x * sc
        for val, e in ((0, K(0)), (1, K(1)), (-1, K(-1)), (PHI_F, phi), (-PHI_F, -phi)):
            if abs(y - val) < 1e-9:
                return e
        raise ValueError(y)
    NC = [[exact_of(float(x)) for x in n] for n in Pb.NC]
    V = [[int(round(2 * float(x))) for x in v] for v in Pb.V]
    n0 = [int(round(float(x))) for x in Pb.n0]
    assert abs(2 * float(Pb.d) - 1) < 1e-12 and abs(2 * float(Pb.rC) * sc - (2 + 5 ** 0.5)) < 1e-12
    rp = 2 + r5
    a, b, c = E["a"], E["b"], E["c"]
    N = 1 + a * a + b * b + c * c
    w = 1
    M = [[w*w+a*a-b*b-c*c, 2*(a*b-w*c), 2*(a*c+w*b)],
         [2*(a*b+w*c), w*w-a*a+b*b-c*c, 2*(b*c-w*a)],
         [2*(a*c-w*b), 2*(b*c+w*a), w*w-a*a-b*b+c*c]]
    Tp = [E[f"T{i}"] * N for i in range(3)]    # T' = N T
    Sp = S * N                                  # S' = N s
    # ball
    ball, (lo, hi) = root_ball(f, s, 4000)
    # the numerical fit and the ball agree (as a precaution)
    print("ball of s", ball.mid().str(30), flush=True)
    assert sign(r5, ball) == 1, "orientation of √5"
    nrow = Pb.nf * Pb.nv
    active = set(h["rows"])
    nzero = nneg = 0
    worst = None
    for fi in range(Pb.nf):
        n = NC[fi]
        for vi in range(Pb.nv):
            v = V[vi]
            for sgn in (1, -1):     # A and B = −A
                Mv = [sum(M[i][j] * v[j] for j in range(3)) for i in range(3)]
                val = sum(n[i] * (sgn * Mv[i] + sgn * Tp[i]) for i in range(3)) - rp * Sp   # N·(n·x − s r')
                sg = sign(val, ball)
                if sgn == 1 and (fi * Pb.nv + vi) in active:
                    assert sg == 0, f"active row {fi},{vi} is not 0"
                assert sg <= 0, f"face {fi} vertex {vi} sign {sgn} sticks out"
                if sg == 0:
                    nzero += 1
                else:
                    nneg += 1
    # separation: u = M n0 (times N), A satisfies u·x ≤ 0: u·(Mv + T') = N(n0·v) + u·T' ≤ N + u·T' = 0, in K
    u = [sum(M[i][j] * n0[j] for j in range(3)) for i in range(3)]
    sep = sum(u[i] * Tp[i] for i in range(3)) + N * N
    assert nrow in active
    assert sep.iszero(), "the separation row is not 0"
    for vi in range(Pb.nv):
        v = V[vi]
        assert sum(n0[j] * v[j] for j in range(3)) <= 1
    # N > 0 (on the ball)
    assert sign(N, ball) == 1
    # output
    def ser(k):
        num = [int(x) for x in k.p.numer().coeffs()]
        return dict(num_low_to_high=[str(x) for x in num], den=str(int(k.p.denom())))
    out = dict(name="cubindod", field="Q[x]/(f)\u3001f = f6_cubindod_minpoly.json\u3001x = s*\uff08f \u306e\u5b9f\u6839\u3067\u533a\u9593 [lo, hi] \u306b\u305f\u3060 1 \u3064\uff09",
               lo=f"{lo.numerator}/{lo.denominator}", hi=f"{hi.numerator}/{hi.denominator}",
               elems={nm: ser(E[nm]) for nm in E},
               checks=dict(sqrt5_sq=True, active_zero=sorted(active), faces_zero=nzero, faces_neg=nneg, separation_zero=True),
               coeff_digits={nm: max(len(str(abs(x.numerator))) + len(str(x.denominator)) for x in found[nm]) for nm in found},
               sec=round(time.time() - t0, 1),
               note="F6 \u6bb5 3a\u30012026-11-15\u3001Opus 5.5\u3002\u5f53\u3066\u306f LLL\uff08\u6570\u5024\uff09\u3001\u78ba\u304b\u3081\u306f K \u306e\u4e2d\u3067\u6b63\u78ba\uff08\u7b26\u53f7\u306f arb \u306e\u53b3\u5bc6\u306a\u7403\uff09\u3002\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")
    out["interval_bits"] = 4000
    json.dump(out, open(os.path.join(HERE, "f6", "f6_cubindod_field.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print("upper bound s* ≤ s₀ in K: rows = 0:", nzero, "negative rows:", nneg, "separation 0,", round(time.time() - t0, 1), "s", flush=True)


if __name__ == "__main__":
    main()
