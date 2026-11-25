# D40 route X (the equality s* = s₀ of tetintet_n02): shared parts. Arithmetic in the quintic field K = Q(c) (c is the real root 0.6538… of Q5),
# the exact centre R₁* (a quaternion over K), s₀ ∈ K, the coefficients of κ ∈ K, and the rational bounds handed to the far region.
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# Design: plan/D40_tetintet_n02_local.md §3.2 ("only change the coefficient ring of the route Y tools") and §10 (record of this round) (working notes, Japanese).
# d40_common of route Y is only imported, never changed.
#
# An element of K is a polynomial in c of degree at most 4 (rational coefficients). c is defined as "the root of Q5 that is the only one in the interval [lo, hi]":
#   Q5(lo) and Q5(hi) have opposite signs, and Q5′ ≠ 0 on the interval (checked by interval arithmetic). Since lo > 0, the interval of c^j is [lo^j, hi^j].
# Sign test: an element that is 0 as a polynomial is 0. Otherwise refine the interval of c until the interval of the value excludes 0 (K is a field and c is a root
#   of Q5, so a nonzero element has a nonzero value and this always stops; if it does not stop by 4000 bits, an exception is raised).
import math, itertools
from fractions import Fraction as Fr
import numpy as np
import d40_common as C

Q5 = C.Q5                                      # highest degree first (8, 81, 188, −156, −264, 171)
Q5_LOW = tuple(Fr(t) for t in reversed(Q5))    # lowest degree first
import sympy as _sp   # A10f H3: irreducibility of Q5 (the termination of sign and the meaning of == rely on it)
_t = _sp.Symbol('t')
assert _sp.Poly(sum(_sp.Rational(c.numerator, c.denominator) * _t ** j for j, c in enumerate(Q5_LOW)), _t).is_irreducible, 'Q5 is not irreducible'
DEG = 5


def _reduce(co):
    """A list of coefficients (lowest degree first, any length) → its remainder modulo Q5 (length 5)."""
    co = [Fr(x) for x in co]
    lead = Q5_LOW[DEG]
    for d in range(len(co) - 1, DEG - 1, -1):
        t = co[d]
        if t:
            f = t / lead
            for j in range(DEG + 1):
                co[d - DEG + j] -= f * Q5_LOW[j]
        co[d] = Fr(0)
    co = co[:DEG] + [Fr(0)] * max(0, DEG - len(co))
    return tuple(co[:DEG])


# ---------- interval of c ----------
_BR = {}


def _q5_interval(lo, hi, coefs_low):
    """Interval of the value of a polynomial on an interval with lo > 0 (coefficients lowest degree first)."""
    a = b = Fr(0)
    for j, cf in enumerate(coefs_low):
        if cf == 0:
            continue
        pl, ph = lo ** j, hi ** j
        if cf > 0:
            a += cf * pl; b += cf * ph
        else:
            a += cf * ph; b += cf * pl
    return a, b


def bracket(bits):
    """An interval [lo, hi] containing c (denominator 2^bits). Q5 changes sign, and Q5′ ≠ 0 on the interval (exactly one root)."""
    if bits in _BR:
        return _BR[bits]
    import mpmath as mp
    mp.mp.dps = int(bits * 0.31) + 30
    c = C.c_root(mp.mp.dps)
    D = 2 ** bits
    lo = Fr(int(mp.floor(c * D)), D); hi = lo + Fr(1, D)
    f = lambda x: sum(cf * x ** j for j, cf in enumerate(Q5_LOW))
    assert lo > 0 and f(lo) * f(hi) < 0, "Q5 does not change sign on the interval of c"
    dq = [j * Q5_LOW[j] for j in range(1, DEG + 1)]
    a, b = _q5_interval(lo, hi, dq)
    assert a > 0 or b < 0, "Q5′ contains 0 on the interval of c"
    if bits > 64:   # A10f H2: lying inside the 64-bit interval (checked against the approximation) = the same root
        l64, h64 = bracket(64)
        assert l64 <= lo and hi <= h64, "the interval of c is not inside the 64-bit interval of the root"
    _BR[bits] = (lo, hi)
    return lo, hi


# Once at the start, check that the interval of c is the root of the recorded configuration (0.6538775…)
_lo0, _hi0 = bracket(64)
assert abs(float(_lo0) - C.C_ROOT_APPROX) < 1e-15


class KE:
    """An element of K = Q(c). co = coefficients of c⁰..c⁴ (Fraction)."""
    __slots__ = ("co",)

    def __init__(self, co):
        self.co = _reduce(co) if len(co) != DEG or not all(isinstance(x, Fr) for x in co) else tuple(co)

    @staticmethod
    def of(x):
        if isinstance(x, KE):
            return x
        return KE((Fr(x),) + (Fr(0),) * (DEG - 1))

    # ---- arithmetic ----
    def __add__(self, o):
        if not isinstance(o, KE):
            o = Fr(o); return KE((self.co[0] + o,) + self.co[1:])
        return KE(tuple(a + b for a, b in zip(self.co, o.co)))
    __radd__ = __add__

    def __neg__(self):
        return KE(tuple(-a for a in self.co))

    def __sub__(self, o):
        return self + (-o if isinstance(o, KE) else -Fr(o))

    def __rsub__(self, o):
        return (-self) + o

    def __mul__(self, o):
        if not isinstance(o, KE):
            o = Fr(o); return KE(tuple(a * o for a in self.co))
        p = [Fr(0)] * (2 * DEG - 1)
        for i, a in enumerate(self.co):
            if a:
                for j, b in enumerate(o.co):
                    if b:
                        p[i + j] += a * b
        return KE(_reduce(p))
    __rmul__ = __mul__

    def inv(self):
        import sympy as sp
        x = sp.Symbol("x")
        f = sum(sp.Rational(a.numerator, a.denominator) * x ** j for j, a in enumerate(self.co))
        g = sum(sp.Rational(int(a.numerator), int(a.denominator)) * x ** j for j, a in enumerate(Q5_LOW))
        assert not self.is_zero(), "inverse of 0"
        r = sp.Poly(sp.invert(f, g, x), x, domain="QQ")
        co = [Fr(0)] * DEG
        for (e,), cf in r.terms():
            co[e] = Fr(int(cf.p), int(cf.q))
        out = KE(tuple(co))
        assert (out * self).is_one(), "check of the inverse"
        return out

    def __truediv__(self, o):
        if not isinstance(o, KE):
            return KE(tuple(a / Fr(o) for a in self.co))
        return self * o.inv()

    def __rtruediv__(self, o):
        return self.inv() * Fr(o)

    def __pow__(self, e):
        assert e >= 0   # A10f m2
        out = KE.of(1)
        for _ in range(e):
            out = out * self
        return out

    # ---- tests ----
    def is_zero(self):
        return all(a == 0 for a in self.co)

    def is_one(self):
        return self.co[0] == 1 and all(a == 0 for a in self.co[1:])

    def is_rational(self):
        return all(a == 0 for a in self.co[1:])

    def interval(self, bits=64):
        lo, hi = bracket(bits)
        return _q5_interval(lo, hi, self.co)

    def sign(self):
        if self.is_zero():
            return 0
        bits = 64
        while bits <= 4000:
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
        if not isinstance(o, KE):
            try:
                o = KE.of(o)
            except Exception:
                return NotImplemented
        return self.co == o.co

    def __hash__(self):
        return hash(self.co)

    def __abs__(self):
        return -self if self.sign() < 0 else self

    def __float__(self):
        a, b = self.interval(80)
        return float((a + b) / 2)

    def outer(self, den_bits=100, bits=None):
        """Rational outer bounds (lo, hi), denominator 2^den_bits (lo ≤ value ≤ hi, exact)."""
        a, b = self.interval(bits or den_bits + 40)
        D = 2 ** den_bits
        return Fr(math.floor(a * D), D), Fr(math.ceil(b * D), D)

    def __repr__(self):
        return f"KE({float(self):.20g})"

    def to_str(self):
        return [str(a) for a in self.co]


CC = KE((Fr(0), Fr(1), Fr(0), Fr(0), Fr(0)))     # c itself


def kpoly(coefs_high):
    """A polynomial in c (rational coefficients, highest degree first) → an element of K."""
    out = KE.of(0)
    for cf in coefs_high:
        out = out * CC + Fr(cf)
    return out


# ---------- exact centres ----------
def qstar_rec_K():
    """q* = (1, a(c), b(c), c) ∈ K⁴ in record coordinates (not normalized)."""
    return (KE.of(1), kpoly(C.A_OF_C), kpoly(C.B_OF_C), CC)


def qstar_D_K():
    return tuple(KE.of(t) for t in C.qmul(tuple(KE.of(x) for x in C.QG0), qstar_rec_K()))


def rot_K(q):
    Q = sum((t * t for t in q), KE.of(0))
    Qi = Q.inv()
    return [[KE.of(e) * Qi for e in row] for row in C.Mq(*q)]


def rot_float(q):
    return np.array([[float(x) for x in row] for row in C.Mq(*[KE.of(t) for t in q])], float) / float(sum((KE.of(t) * KE.of(t) for t in q), KE.of(0)))


_CX = {}


def centers_K():
    """The 7 local centres (the same names, the same order and the same integer products as d40_common.centers), with the exact q* (over K) in place of R̂.
    Returns [(name, side, quaternion over K, kind)]. Checks that each centre agrees projectively with the route Y centre (rational) to within 1e−18."""
    if "cen" in _CX:
        return _CX["cen"]
    qs = qstar_D_K()
    P = [[0, 1, 0], [1, 0, 0], [0, 0, 1]]
    order = [(0, 1, 2), (1, 0, 2), (0, 2, 1), (2, 1, 0), (1, 2, 0), (2, 0, 1)]
    names = ["T_S", "T_S'", "P_23", "P_13", "P_cyc1", "P_cyc2"]
    yc = {nm: q for nm, side, q, kind in C.centers()}
    out = []
    for nm, p in zip(names, order):
        g = C.perm_mat(p)
        if C.det3(g) == 1:
            q = C.qmul(tuple(KE.of(x) for x in C.mat_to_q_int(g)), qs)
        else:
            mg = [[-e for e in row] for row in g]; mk = [[-e for e in row] for row in P]
            q = C.qmul(C.qmul(tuple(KE.of(x) for x in C.mat_to_q_int(mg)), qs), tuple(KE.of(x) for x in C.mat_to_q_int(mk)))
        # Representative: the piece rotation k with the largest tr(R k) (exactly; checks that it is strictly larger than the others)
        R = rot_K(q)
        trs = [(sum((R[i][j] * k[j][i] for i in range(3) for j in range(3)), KE.of(0)), k) for k in C.PROT]
        best = max(trs, key=lambda t: float(t[0]))
        assert all(best[0] > t[0] for t in trs if t[1] is not best[1]), "the maximum of tr is not unique"
        k = best[1]
        if k != [[1, 0, 0], [0, 1, 0], [0, 0, 1]]:
            q = C.qmul(q, tuple(KE.of(x) for x in C.mat_to_q_int(k)))
        q = tuple(KE.of(t) for t in q)
        # Agrees projectively with the route Y centre (signs matched too)
        qf = np.array([float(t) for t in q]); qy = np.array([float(t) for t in yc[nm]])
        qf /= np.linalg.norm(qf); qy /= np.linalg.norm(qy)
        assert np.abs(qf - qy).max() < 1e-15, (nm, qf, qy)
        out.append((nm, "A", q, "tube" if nm in ("T_S", "T_S'") else "point"))
    out.append(("T_C", "B", tuple(KE.of(t) for t in C.Q_I), "tube"))
    _CX["cen"] = out
    return out


# ---------- s₀ and κ ----------
def s0_K():
    """s₀ ∈ K: s₁ = Σ_f H̃_f / 2 of the stopped piece R₁* (the same in record coordinates and in D_n coordinates). Checks that its minimal polynomial is S0_MINPOLY."""
    if "s0" in _CX:
        return _CX["s0"]
    R = rot_K(qstar_rec_K())
    VT = [[Fr(x, 2) for x in v] for v in C.VT]
    H = []
    for b in C.BS:
        vals = [sum((R[i][j] * VT[v][j] * b[i] for i in range(3) for j in range(3)), KE.of(0)) for v in range(4)]
        H.append(max(vals, key=float))
        # max is chosen in floating point, and ≥ the others is checked exactly
        assert all(H[-1] >= x for x in vals)
    s = sum(H, KE.of(0)) / 2
    mp_ = KE.of(0)
    for cf in C.S0_MINPOLY:
        mp_ = mp_ * s + cf
    assert mp_.is_zero(), "s₀ is not a root of the minimal polynomial"
    assert abs(float(s) - 1.9535642445615807029) < 1e-15
    _CX["s0"] = s
    return s


def kappa_coefs_K():
    """κ̃₁(h, k′) = a0 + a1·h + β·k′, a0, a1 ∈ K (built as in d40_common.kappa_coefs, with R₁* and s₀ in place of R̂ and s̄).
    Also checks that the degree-0 sum on the arc is exactly 0 in K."""
    if "kap" in _CX:
        return _CX["kap"]
    cen = centers_K()
    RS = rot_K(cen[0][2])
    I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    s = s0_K()

    def best_cand(R, n):
        Rf = np.array([[float(x) for x in r] for r in R])
        X = C.VTF @ Rf.T
        nf = np.array([float(x) for x in n])
        return tuple([int(np.argmax(X @ nf))] + [int(np.argmax(X @ C.BF[f])) for f in range(4)])
    vals = {}
    for side, R in (("A", RS), ("B", I3)):
        for hh in (Fr(0), Fr(1, 10), Fr(1, 4)):
            n = [Fr(x) for x in (C.n_A(hh, 0) if side == "A" else C.n_B(hh, 0))]
            vals[(side, hh)] = KE.of(C.gtilde_cand_exact(n, R, s, 0, best_cand(R, n)))
    d0 = (vals[("A", Fr(0))] - vals[("B", Fr(0))]) / 2
    d1 = (vals[("A", Fr(1, 10))] - vals[("B", Fr(1, 10))]) / 2
    a0 = d0; a1 = (d1 - d0) * 10
    for hh in (Fr(0), Fr(1, 10), Fr(1, 4)):
        assert (vals[("A", hh)] + vals[("B", hh)]).is_zero(), f"the degree-0 sum on the arc is not 0 (h = {hh})"
    # The same linear function also at h = 1/4 (the candidate formula is linear in h and agrees at 3 points)
    assert (vals[("A", Fr(1, 4))] - vals[("B", Fr(1, 4))]) / 2 == a0 + a1 * Fr(1, 4)
    _CX["kap"] = (a0, a1, C.BETA)
    return _CX["kap"]


# ---------- rational bounds handed to the far region ----------
FAR_DEN_BITS = 100


def far_bounds():
    """s_hi ≥ s₀, upper bounds of κ (a0_hi, a1_hi) and lower bounds (a0_lo, a1_lo) (κ_lo ≤ κ̃₁ ≤ κ_hi for h ≥ 0). All with denominator 2^100."""
    if "fb" in _CX:
        return _CX["fb"]
    s = s0_K(); a0, a1, beta = kappa_coefs_K()
    s_lo, s_hi = s.outer(FAR_DEN_BITS)
    a0l, a0h = a0.outer(FAR_DEN_BITS); a1l, a1h = a1.outer(FAR_DEN_BITS)
    assert s_hi > s_lo and KE.of(s_hi) > s and KE.of(a0h) >= a0 and KE.of(a0l) <= a0 and KE.of(a1h) >= a1 and KE.of(a1l) <= a1
    _CX["fb"] = dict(s_hi=s_hi, a0_hi=a0h, a1_hi=a1h, a0_lo=a0l, a1_lo=a1l, beta=beta)
    return _CX["fb"]


def center_intervals(den_bits=100):
    """Rational intervals of the components of the centre quaternions (for the L test in the far region). [(name, side, ((lo, hi) × 4), kind)]."""
    key = ("ci", den_bits)
    if key in _CX:
        return _CX[key]
    out = [(nm, side, tuple(t.outer(den_bits) for t in q), kind) for nm, side, q, kind in centers_K()]
    _CX[key] = out
    return out
