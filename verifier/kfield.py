# Exact arithmetic in the number field K = Q(γ) (γ is the real root of the irreducible polynomial f that is the only root in the rational interval [lo, hi]).
# 2026-11-14, written by Claude (Opus 5.5) (for D40 route X and D45 route X; d40x_common.KE made so that it can be built for each field).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#
# An element is its coefficients of γ⁰..γ^{d−1} (Fraction). A product is the remainder modulo f. The inverse is sympy's invert (with a check).
# Sign: 0 if it is 0 as a polynomial. Otherwise refine the interval of γ and use interval arithmetic until the value no longer contains 0 (K is a field, so a nonzero element has a nonzero value).
# Correctness of the interval of γ: f(lo)·f(hi) < 0 and f′ does not contain 0 on the interval (a single root), checked exactly. The interval must not contain 0.
import math
from fractions import Fraction as Fr


def _ival_poly(lo, hi, co):
    """Interval of the values of a polynomial (coefficients from the lowest degree) on an interval [lo, hi] not containing 0. The interval of γ^j is given by the smaller and larger of the powers of the ends."""
    assert lo > 0 or hi < 0
    a = b = Fr(0)
    pl = ph = Fr(1)
    for j, cf in enumerate(co):
        if j:
            pl *= lo; ph *= hi
        if cf == 0:
            continue
        l_, h_ = (pl, ph) if pl <= ph else (ph, pl)
        if cf > 0:
            a += cf * l_; b += cf * h_
        else:
            a += cf * h_; b += cf * l_
    return a, b


class Field:
    def __init__(self, name, f_low, approx, mp_root=None):
        """f_low: coefficients of the minimal polynomial (from the lowest degree, rational). approx: an approximation of the root (floating point)."""
        self.name = name
        self.f = tuple(Fr(x) for x in f_low)
        self.d = len(self.f) - 1
        self.approx = approx
        self._br = {}
        self._mp_root = mp_root
        import sympy   # A10f H3: irreducibility of the minimal polynomial (the termination of sign and the meaning of == rest on it)
        _t = sympy.Symbol("t")
        assert sympy.Poly(sum(sympy.Rational(c.numerator, c.denominator) * _t ** j for j, c in enumerate(self.f)), _t).is_irreducible, f"{name}: the minimal polynomial is not irreducible"
        lo, hi = self.bracket(64)
        assert abs(float(lo) - approx) < 1e-12, "the interval of the root does not agree with the approximation"

    def _root_mp(self, dps):
        import mpmath as mp
        mp.mp.dps = dps
        fh = [mp.mpf(x.numerator) / x.denominator for x in reversed(self.f)]
        return mp.findroot(lambda t: mp.polyval(fh, t), mp.mpf(self.approx))

    def bracket(self, bits):
        if bits in self._br:
            return self._br[bits]
        import mpmath as mp
        c = self._root_mp(int(bits * 0.31) + 40)
        D = 2 ** bits
        lo = Fr(int(mp.floor(c * D)), D); hi = lo + Fr(1, D)
        fv = lambda x: sum(cf * x ** j for j, cf in enumerate(self.f))
        assert fv(lo) * fv(hi) < 0, f"{self.name}: f does not change sign on the interval"
        df = [j * self.f[j] for j in range(1, self.d + 1)]
        a, b = _ival_poly(lo, hi, df)
        assert a > 0 or b < 0, f"{self.name}: f′ contains 0 on the interval"
        if bits > 64:   # A10f H2: the interval for any other number of bits also lies in the 64-bit interval (checked against the approximation) = the same root
            l64, h64 = self.bracket(64)
            assert l64 <= lo and hi <= h64, f"{self.name}: the interval does not lie in the 64-bit interval of the root"
        self._br[bits] = (lo, hi)
        return lo, hi

    def reduce(self, co):
        co = [Fr(x) for x in co]
        d = self.d; lead = self.f[d]
        for k in range(len(co) - 1, d - 1, -1):
            t = co[k]
            if t:
                fac = t / lead
                for j in range(d + 1):
                    co[k - d + j] -= fac * self.f[j]
            co[k] = Fr(0)
        co = co[:d] + [Fr(0)] * max(0, d - len(co))
        return tuple(co[:d])

    def __call__(self, x):
        return KE.of(self, x)

    def gen(self):
        return KE(self, (Fr(0), Fr(1)) + (Fr(0),) * (self.d - 2))

    def poly(self, coefs_low):
        """Polynomial in γ (from the lowest degree) → element."""
        return KE(self, self.reduce(coefs_low))


class KE:
    __slots__ = ("F", "co")

    def __init__(self, F, co):
        self.F = F
        self.co = co if (len(co) == F.d and all(isinstance(x, Fr) for x in co)) else F.reduce(co)

    @staticmethod
    def of(F, x):
        if isinstance(x, KE):
            assert x.F is F
            return x
        return KE(F, (Fr(x),) + (Fr(0),) * (F.d - 1))

    def _o(self, o):
        return o if isinstance(o, KE) else KE.of(self.F, o)

    def __add__(self, o):
        if not isinstance(o, KE):
            return KE(self.F, (self.co[0] + Fr(o),) + self.co[1:])
        return KE(self.F, tuple(a + b for a, b in zip(self.co, o.co)))
    __radd__ = __add__

    def __neg__(self):
        return KE(self.F, tuple(-a for a in self.co))

    def __sub__(self, o):
        return self + (-self._o(o))

    def __rsub__(self, o):
        return (-self) + o

    def __mul__(self, o):
        if not isinstance(o, KE):
            o = Fr(o)
            return KE(self.F, tuple(a * o for a in self.co))
        d = self.F.d
        p = [Fr(0)] * (2 * d - 1)
        for i, a in enumerate(self.co):
            if a:
                for j, b in enumerate(o.co):
                    if b:
                        p[i + j] += a * b
        return KE(self.F, self.F.reduce(p))
    __rmul__ = __mul__

    def inv(self):
        assert not self.is_zero(), "inverse of 0"
        import sympy as sp
        x = sp.Symbol("x")
        f = sum(sp.Rational(a.numerator, a.denominator) * x ** j for j, a in enumerate(self.co))
        g = sum(sp.Rational(a.numerator, a.denominator) * x ** j for j, a in enumerate(self.F.f))
        r = sp.Poly(sp.invert(f, g, x), x, domain="QQ")
        co = [Fr(0)] * self.F.d
        for (e,), cf in r.terms():
            co[e] = Fr(int(cf.p), int(cf.q))
        out = KE(self.F, tuple(co))
        assert (out * self).is_one(), "check of the inverse"
        return out

    def __truediv__(self, o):
        if not isinstance(o, KE):
            return KE(self.F, tuple(a / Fr(o) for a in self.co))
        return self * o.inv()

    def __rtruediv__(self, o):
        return self.inv() * Fr(o)

    def __pow__(self, e):
        assert e >= 0   # A10f m2
        out = KE.of(self.F, 1)
        for _ in range(e):
            out = out * self
        return out

    def is_zero(self):
        return all(a == 0 for a in self.co)

    def is_one(self):
        return self.co[0] == 1 and all(a == 0 for a in self.co[1:])

    def interval(self, bits=64):
        lo, hi = self.F.bracket(bits)
        return _ival_poly(lo, hi, self.co)

    def sign(self):
        if self.is_zero():
            return 0
        bits = 64
        while bits <= 8000:
            a, b = self.interval(bits)
            if a > 0:
                return 1
            if b < 0:
                return -1
            bits *= 2
        raise RuntimeError("the sign is not decided")

    def _cmp(self, o):
        return (self - o).sign()

    def __lt__(self, o): return self._cmp(o) < 0
    def __le__(self, o): return self._cmp(o) <= 0
    def __gt__(self, o): return self._cmp(o) > 0
    def __ge__(self, o): return self._cmp(o) >= 0

    def __eq__(self, o):
        try:
            o = self._o(o)
        except Exception:
            return NotImplemented
        return self.co == o.co

    def __hash__(self):
        return hash(self.co)

    def __abs__(self):
        return -self if self.sign() < 0 else self

    def __float__(self):
        bits = 80
        while True:
            a, b = self.interval(bits)
            m = (a + b) / 2
            if m == 0 or abs(b - a) <= abs(m) * Fr(1, 2 ** 60) or bits > 2000:
                return float(m)
            bits *= 2

    def outer(self, den_bits=100):
        """Rational outer bounds (denominator 2^den_bits)."""
        bits = den_bits + 40
        while True:
            a, b = self.interval(bits)
            if b - a < Fr(1, 2 ** (den_bits + 2)) or bits > 8000:
                break
            bits *= 2
        D = 2 ** den_bits
        return Fr(math.floor(a * D), D), Fr(math.ceil(b * D), D)

    def nearest(self, den_bits=100):
        """The nearest rational with denominator 2^den_bits (error ≤ 2^−den_bits−1 + the width of the interval)."""
        a, b = self.outer(den_bits + 8)
        D = 2 ** den_bits
        return Fr(round((a + b) / 2 * D), D)

    def __repr__(self):
        return f"KE[{self.F.name}]({float(self):.20g})"

    def to_str(self):
        return [str(a) for a in self.co]
