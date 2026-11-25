# F6 stage 3: the two-step field L = K(y), K = Q[x]/(f) (x = s₀), y² = D (D ∈ K).
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# An element is (u, v) (u + v·y, u, v ∈ K). Its sign is decided with arb by substituting the ball of s₀ and the ball of y (y = +√D; the ball of D is checked to be positive).
import os, sys, json
from fractions import Fraction as Fr
import flint
import mpmath as mp
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from f6_field_cubindod import K, evb


def kq(x):
    """A rational (Fraction, int) into K."""
    x = Fr(x)
    return K(flint.fmpq_poly([x.numerator], x.denominator))


def kinv(k):
    G, U, _ = k.p.xgcd(K.f)
    assert G == 1, "inverse in K"
    return K(U)


class L2:
    D = None        # an element of K
    sball = None    # arb ball of s₀
    yball = None    # arb ball of y = +√D

    def __init__(self, u, v=None):
        self.u = u if isinstance(u, K) else kq(u)
        self.v = K(0) if v is None else (v if isinstance(v, K) else kq(v))

    @staticmethod
    def c(o):
        return o if isinstance(o, L2) else L2(o)

    def __add__(s, o): o = L2.c(o); return L2(s.u + o.u, s.v + o.v)
    __radd__ = __add__
    def __sub__(s, o): o = L2.c(o); return L2(s.u - o.u, s.v - o.v)
    def __rsub__(s, o): return L2.c(o) - s
    def __neg__(s): return L2(-s.u, -s.v)

    def __mul__(s, o):
        o = L2.c(o)
        return L2(s.u * o.u + s.v * o.v * L2.D, s.u * o.v + s.v * o.u)
    __rmul__ = __mul__

    def iszero(s): return s.u.iszero() and s.v.iszero()

    def inv(s):
        n = s.u * s.u - s.v * s.v * L2.D        # norm (in K); nonzero if L is a field
        assert not n.iszero(), "inverse in L (norm 0)"
        ni = kinv(n)
        return L2(s.u * ni, -(s.v * ni))

    HB = None       # precision (bits) used to build balls; None means the current flint.ctx.prec

    def ball(s):
        old = flint.ctx.prec
        if L2.HB is not None:
            flint.ctx.prec = L2.HB
        try:
            b = evb(s.u.p, L2.sball)
            if not s.v.iszero():
                b = b + evb(s.v.p, L2.sball) * L2.yball
        finally:
            flint.ctx.prec = old
        return b

    def sign(s):
        if s.iszero():
            return 0
        b = s.ball()
        if b > 0: return 1
        if b < 0: return -1
        raise RuntimeError("sign not decided (raise the precision)")

    def ser(s):
        def sk(k):
            return dict(num_low_to_high=[str(int(x)) for x in k.p.numer().coeffs()], den=str(int(k.p.denom())))
        return dict(u=sk(s.u), v=sk(s.v))

    @staticmethod
    def de(d):
        def dk(e):
            return K(flint.fmpq_poly([int(v) for v in e["num_low_to_high"]], int(e["den"])))
        return L2(dk(d["u"]), dk(d["v"]))


def refine(f, lo, hi, approx, bits):
    """Re-enclose the root in a rational interval of width 2^(1−bits) inside [lo, hi] (f changes sign, exactly one root) (the signs at the ends exactly)."""
    mp.mp.dps = int(bits * 0.302) + 50
    fm = [mp.mpf(int(c)) for c in f.numer().coeffs()]
    xv = mp.mpf(approx.numerator) / approx.denominator
    for _ in range(40):
        fx = mp.polyval(fm[::-1], xv); dfx = mp.polyval([i * c for i, c in enumerate(fm)][:0:-1], xv)
        nx = xv - fx / dfx
        if abs(nx - xv) < mp.mpf(2) ** (-bits - 20):
            xv = nx; break
        xv = nx
    e = Fr(1, 2 ** bits)
    x0 = Fr(int(mp.nint(xv * mp.mpf(2) ** (bits + 8))), 2 ** (bits + 8))
    l2, h2 = x0 - e, x0 + e
    assert lo <= l2 and h2 <= hi, "the narrowed interval lies inside the original interval"
    fl = f(flint.fmpq(l2.numerator, l2.denominator)); fh = f(flint.fmpq(h2.numerator, h2.denominator))
    assert (fl < 0 < fh) or (fh < 0 < fl), "the sign changes at the ends of the narrowed interval"
    return l2, h2


def setup(f, D, sball):
    """K.f = f, L2.D = D, build the balls. The caller checks that the ball of D is positive and that L is a field (D is not a square in K)."""
    K.f = f
    L2.D = D
    L2.sball = sball
    Db = evb(D.p, sball)
    assert Db > 0, "D > 0 (on the ball of s₀)"
    L2.yball = Db.sqrt()


# That L is a field (D not a square in K) is not needed: the computation uses only the operations of the ring Q[x, y]/(f(x), y² − D(x)) and the map to the reals (balls) by the
# ring homomorphism x ↦ s₀, y ↦ +√D(s₀); "if (u, v) is 0 the value is 0", and "an inverse only when the norm ≠ 0".
