# D45 route X (the equality s* = s₀ of dodintet_n02): shared parts. The octic field K = Q(γ) (γ is the real root −3.2574… of P8 from step 0a; √5 ∈ K),
# the exact configuration (R₀, R₁, translations, c₀ = s₀/(2√2) ∈ K), the tube centres R_A, R_B (over K), the tube bases (lines A and B exactly over K), the gradient k ∈ K³ of κ.
# 2026-11-14, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# Design: plan/D40_tetintet_n02_local.md §3.2 (route X "only changes the coefficient ring of the route Y tools") (working notes, Japanese). Route Y of D45 (d45_dodintet_*) is only imported, never changed.
#
# Differences from route Y (pp/global_opt/NOTES_dodintet.md §10, working notes, Japanese):
#   c̄ (rational) → c₀ ∈ K; centre R̂ (image of a rational quaternion) → image of the exact R₀; base point P0 and direction d (rounded to denominator 2^64) → exact over K
#   (d is (e_y, −e_x) times a rational λ ≈ 1/|e|; the transverse ŵ stays the rational one of route Y: the chart only needs to be a linear bijection);
#   k̂ (rounded to 2^−80) → k ∈ K³ exactly from the 3 linear equations. The order-0 terms e_A, e_B of the two sides are exactly 0 in K.
# s₀ has degree 16, but only c₀ = s₀/(2√2) appears in the formulas, so the octic field K is enough [own reasoning; the same fact as u_minpoly (degree 8) of step 0a].
import os, sys, json, itertools, math
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from kfield import Field, KE
import d45_dodintet_common as CY                 # route Y (only reads the tube constants, g_A, g_B, the vertex numbering and the rotation group)
from d45_dodintet_upper import Q5, V, BN

P8_HIGH = (29, 153, 104, -396, -264, 387, 86, -144, 29)
GAMMA_APPROX = -3.2574275508825787566
KF = Field("K8", tuple(reversed(P8_HIGH)), GAMMA_APPROX)
G = KF.gen()
Z = KF(0)
CACHE_FILE = os.path.join(HERE, "d45x_dodintet_K.json")


def _groebner():
    """Compute a(γ), b(γ), √5(γ) by the same formulas as step 0a (d45_dodintet_step0.py) (a few seconds)."""
    import sympy as sp
    a, b, c, r = sp.symbols('a b c r')
    r5 = sp.sqrt(5); ph = (1 + r5) / 2

    def cyc(v):
        return [v, (v[2], v[0], v[1]), (v[1], v[2], v[0])]
    VS = [sp.Matrix([g[0] * ph / 2, g[1] * ph / 2, g[2] * ph / 2]) for g in itertools.product((1, -1), repeat=3)]
    for s1 in (1, -1):
        for s2 in (1, -1):
            for w in cyc((0, sp.Rational(s1, 2), s2 * ph * ph / 2)):
                VS.append(sp.Matrix(w))
    BM = [sp.Matrix(x) for x in BN]
    M = sp.Matrix([[1 + a*a - b*b - c*c, 2*(a*b - c), 2*(a*c + b)],
                   [2*(a*b + c), 1 - a*a + b*b - c*c, 2*(b*c - a)],
                   [2*(a*c - b), 2*(b*c + a), 1 - a*a - b*b + c*c]])
    FACE0 = (2, [1, 5, 10, 11, 16]); EDGE0 = (0, (12, 18))
    eqs = [sp.expand((BM[FACE0[0]].T * M * (VS[FACE0[1][k]] - VS[FACE0[1][0]]))[0]).subs(r5, r) for k in (1, 2)]
    eqs.append(sp.expand((BM[EDGE0[0]].T * M * (VS[EDGE0[1][0]] - VS[EDGE0[1][1]]))[0]).subs(r5, r))
    P8 = sum(cf * c ** (8 - i) for i, cf in enumerate(P8_HIGH))
    Gb = sp.groebner(eqs + [r**2 - 5, P8], a, b, r, c, order='lex')
    ex = Gb.exprs
    assert [sp.Poly(g, a, b, r, c).degree_list()[:3] for g in ex] == [(1, 0, 0), (0, 1, 0), (0, 0, 1), (0, 0, 0)]
    out = {}
    for nm, e, sym in (("a", ex[0], a), ("b", ex[1], b), ("r", ex[2], r)):
        p = sp.Poly(-(e - sym), c, domain='QQ')
        co = [Fr(0)] * 8
        for (k,), cf in p.terms():
            co[k] = Fr(int(cf.p), int(cf.q))
        out[nm] = [str(x) for x in co]
    return out


def _load_polys():
    if os.path.exists(CACHE_FILE):
        d = json.load(open(CACHE_FILE, encoding="utf-8"))
    else:
        d = _groebner()
        json.dump(d, open(CACHE_FILE, "w", encoding="utf-8"), indent=1)
    return {k: KF.poly([Fr(x) for x in v]) for k, v in d.items()}


_P = _load_polys()
A_, B_, R5 = _P["a"], _P["b"], _P["r"]
assert (R5 * R5 - 5).is_zero(), "the polynomial for √5 is not √5"
assert R5 > 0
PHI = (1 + R5) / 2


def k_of(x):
    """An element of Q(√5) or a rational → K."""
    if isinstance(x, KE):
        return x
    if isinstance(x, Q5):
        return KF(x.a) + R5 * x.b
    return KF(x)


def mm(X, Y): return [[sum((X[i][l] * Y[l][j] for l in range(3)), Z) for j in range(3)] for i in range(3)]
def mv(Mx, v): return [sum((Mx[i][j] * v[j] for j in range(3)), Z) for i in range(3)]
def dot(u, v): return sum((x * y for x, y in zip(u, v)), Z)
def sub(u, v): return [x - y for x, y in zip(u, v)]
def cross(u, v): return [u[1]*v[2] - u[2]*v[1], u[2]*v[0] - u[0]*v[2], u[0]*v[1] - u[1]*v[0]]


VK = [[k_of(x) for x in v] for v in V]
BK = [[KF(x) for x in b] for b in BN]
# The vertices are the same as the vertices of the step 0a formulas (written with φ)
_chk = []
for g in itertools.product((1, -1), repeat=3):
    _chk.append([PHI * g[0] / 2, PHI * g[1] / 2, PHI * g[2] / 2])
for s1 in (1, -1):
    for s2 in (1, -1):
        w = (KF(0), KF(Fr(s1, 2)), PHI * PHI * s2 / 2)
        for t in [w, (w[2], w[0], w[1]), (w[1], w[2], w[0])]:
            _chk.append(list(t))
assert all((x - y).is_zero() for u, v in zip(_chk, VK) for x, y in zip(u, v)), "order of the vertices"


def rotK(M):
    return [[k_of(e) for e in r] for r in M]


_C = {}


def config():
    """The recorded configuration exactly over K: R₀, R₁ = g·R₀·k, translations t₀, t₁, u = c₀ (the same linear system in 7 unknowns as step 0a)."""
    if "cfg" in _C:
        return _C["cfg"]
    one = KF(1)
    a, b, c = A_, B_, G
    Mn = [[one + a*a - b*b - c*c, 2*(a*b - c), 2*(a*c + b)],
          [2*(a*b + c), one - a*a + b*b - c*c, 2*(b*c - a)],
          [2*(a*c - b), 2*(b*c + a), one - a*a - b*b + c*c]]
    ninv = (one + a*a + b*b + c*c).inv()
    R0 = [[Mn[i][j] * ninv for j in range(3)] for i in range(3)]
    gT = rotK([[0, 0, -1], [0, -1, 0], [1, 0, 0]])
    h = KF(Fr(1, 2)); P = PHI / 2; Qm = (PHI - 1) / 2
    kS = [[-P, Qm, -h], [Qm, -h, -P], [h, P, -Qm]]
    R1 = mm(mm(gT, R0), kS)
    for R in (R0, R1):
        RtR = mm([[R[j][i] for j in range(3)] for i in range(3)], R)
        assert all((RtR[i][j] - (1 if i == j else 0)).is_zero() for i in range(3) for j in range(3))
    FACE0 = (2, [1, 5, 10, 11, 16]); EDGE0 = (0, (12, 18)); VERT0 = (3, 8)
    FACE1 = (1, [3, 7, 13, 17, 19]); EDGE1 = (3, (2, 9)); VERT1 = (2, 1)
    TOP0 = (3, 15); TOP1 = (4, 16)
    for (Rk, F_, E_) in ((R0, FACE0, EDGE0), (R1, FACE1, EDGE1)):
        f, fv = F_
        for x in fv[1:]:
            assert dot(BK[f], mv(Rk, sub(VK[fv[0]], VK[x]))).is_zero()
        assert dot(BK[E_[0]], mv(Rk, sub(VK[E_[1][0]], VK[E_[1][1]]))).is_zero()
    walls = [[(FACE0[0], FACE0[1][0]), (EDGE0[0], EDGE0[1][0]), VERT0], [(FACE1[0], FACE1[1][0]), (EDGE1[0], EDGE1[1][0]), VERT1]]
    RS = [R0, R1]
    X = []; Y = []
    for i in range(2):
        for f, v in walls[i]:
            row = [Z] * 7
            for j in range(3):
                row[3 * i + j] = KF(BN[f][j])
            row[6] = KF(-1); X.append(row); Y.append(-dot(BK[f], mv(RS[i], VK[v])))
    da = sub(mv(R0, VK[TOP0[0]]), mv(R0, VK[TOP0[1]])); db = sub(mv(R1, VK[TOP1[0]]), mv(R1, VK[TOP1[1]]))
    nc = cross(da, db)
    X.append([nc[0], nc[1], nc[2], -nc[0], -nc[1], -nc[2], Z])
    Y.append(-dot(nc, sub(mv(R0, VK[TOP0[0]]), mv(R1, VK[TOP1[0]]))))
    Mx = [X[i] + [Y[i]] for i in range(7)]
    for col in range(7):
        piv = [i for i in range(col, 7) if not Mx[i][col].is_zero()][0]
        Mx[col], Mx[piv] = Mx[piv], Mx[col]
        iv = Mx[col][col].inv(); Mx[col] = [x * iv for x in Mx[col]]
        for i in range(7):
            if i != col and not Mx[i][col].is_zero():
                fc = Mx[i][col]; Mx[i] = [x - fc * y for x, y in zip(Mx[i], Mx[col])]
    U = Mx[6][7]; T0 = [Mx[i][7] for i in range(3)]; T1 = [Mx[i][7] for i in range(3, 6)]
    # check with the minimal polynomial of u (u_minpoly of step 0a)
    UMP = (7340898713600, -45258428416000, -87280023552000, 469121578649600, 8374317326080, -12298477164800, -298747520080, 47781610620, -847451401)
    acc = Z
    for cf in UMP:
        acc = acc * U + cf
    assert acc.is_zero(), "c₀ is not a root of the minimal polynomial of u"
    assert abs(2 * math.sqrt(2) * float(U) - 8.4777897361038792481) < 1e-12
    _C["cfg"] = dict(R0=R0, R1=R1, T0=T0, T1=T1, c0=U, nc=nc, TOP0=TOP0, TOP1=TOP1)
    return _C["cfg"]


def c0():
    return config()["c0"]


def chart(nv):
    return (nv[0] / nv[2], nv[1] / nv[2])


def mat_to_q(R):
    """Rotation matrix over K → quaternion over K (not normalized; checks M(q)/|q|² = R)."""
    tr = R[0][0] + R[1][1] + R[2][2]
    cands = [(1 + tr, R[2][1] - R[1][2], R[0][2] - R[2][0], R[1][0] - R[0][1]),
             (R[2][1] - R[1][2], 1 + R[0][0] - R[1][1] - R[2][2], R[0][1] + R[1][0], R[0][2] + R[2][0]),
             (R[0][2] - R[2][0], R[0][1] + R[1][0], 1 - R[0][0] + R[1][1] - R[2][2], R[1][2] + R[2][1]),
             (R[1][0] - R[0][1], R[0][2] + R[2][0], R[1][2] + R[2][1], 1 - R[0][0] - R[1][1] + R[2][2])]
    q = max(cands, key=lambda c: sum(float(x) ** 2 for x in c))
    N = sum((x * x for x in q), Z)
    M = CY.Mq(*q)
    assert all((M[i][j] - N * R[i][j]).is_zero() for i in range(3) for j in range(3)), "the quaternion does not give back the matrix"
    return tuple(q)


def det3(M):
    return (M[0][0]*(M[1][1]*M[2][2] - M[1][2]*M[2][1]) - M[0][1]*(M[1][0]*M[2][2] - M[1][2]*M[2][0])
            + M[0][2]*(M[1][0]*M[2][1] - M[1][1]*M[2][0]))


def geometry():
    """The same steps as geometry() of route Y, exactly over K. The centres are the same representatives as in route Y (largest tr, exactly unique)."""
    if "geo" in _C:
        return _C["geo"]
    cf = config()
    R0, R1 = cf["R0"], cf["R1"]
    W0 = [mv(R0, v) for v in VK]; W1 = [mv(R1, v) for v in VK]
    nh = cross(sub(W0[3], W0[15]), sub(W1[4], W1[16]))
    if float(dot(nh, [KF(Fr(-27, 100)), KF(Fr(79, 100)), KF(Fr(54, 100))])) < 0:
        nh = [-x for x in nh]
    gY = CY.geometry()
    gA, gB = gY["gA"], gY["gB"]
    rots = [rotK(M) for M in CY.dod_rotations()]

    def center(gm, R):
        Rc = mm(rotK(gm), R)
        if (det3(Rc) + 1).is_zero():
            Rc = [[-e for e in r] for r in Rc]
        trs = []
        for k in rots:
            Rk = mm(Rc, k)
            trs.append((Rk[0][0] + Rk[1][1] + Rk[2][2], Rk))
        best = max(trs, key=lambda t: float(t[0]))
        assert all(best[0] > t[0] for t in trs if t is not best), "the maximum of tr is not unique"
        return best[1]
    RB = center(gB, R1); RA = center(gA, R0)
    # agrees with the route Y centres to within 1e−15
    for Rx, Ry in ((RA, gY["RA"]), (RB, gY["RB"])):
        assert max(abs(float(Rx[i][j]) - float(Ry[i][j])) for i in range(3) for j in range(3)) < 1e-15
    nB = [sum((KF(gB[i][j]) * (-nh[j]) for j in range(3)), Z) for i in range(3)]
    nA = [sum((KF(gA[i][j]) * nh[j] for j in range(3)), Z) for i in range(3)]
    PB = chart(nB); PA = chart(nA)
    assert (PA[0] - PB[0]).is_zero() and (PA[1] + PB[1]).is_zero(), "not σP̂"
    geo = dict(R0=R0, R1=R1, nhat=nh, gA=gA, gB=gB, RA=RA, RB=RB, PB=PB, PA=PA, rots=rots)
    for side, Rc, Pq in (("A", RA, PA), ("B", RB, PB)):
        n = [Pq[0], Pq[1], KF(1)]
        X = [mv(Rc, v) for v in VK]
        vals = [dot(n, x) for x in X]
        order = sorted(range(20), key=lambda i: -float(vals[i]))
        t1, t2 = order[0], order[1]
        assert (vals[t1] - vals[t2]).is_zero() and vals[t2] > vals[order[2]], "the 2 vertices of the top edge (exactly tied)"
        assert (t1, t2) == tuple(gY["line_" + side]["top"]), "the same top edge as route Y"
        e = sub(X[t1], X[t2])
        L = math.hypot(float(e[0]), float(e[1]))
        lam = Fr(round(2 ** 64 / L), 2 ** 64)
        d = (e[1] * lam, -e[0] * lam)
        if float(d[0]) < 0:
            d = (-d[0], -d[1])
        wv = gY["line_" + side]["w"]                     # the transverse direction of route Y (rational). Any linear bijection of the chart will do
        dy = gY["line_" + side]["d"]
        assert abs(float(d[0]) - float(dy[0])) < 1e-15 and abs(float(d[1]) - float(dy[1])) < 1e-15, "the base direction does not agree with route Y"
        # on the base line the top edge lies on the plane: (P0 + u d, 1)·e = 0 independently of u (d·e_xy = 0 and P·e = 0)
        assert (d[0] * e[0] + d[1] * e[1]).is_zero() and (Pq[0] * e[0] + Pq[1] * e[1] + e[2]).is_zero()
        geo["line_" + side] = dict(P0=Pq, d=d, w=(Fr(wv[0]), Fr(wv[1])), top=(t1, t2), e=e)
    _C["geo"] = geo
    return geo


def main_cand(Rc, n):
    X = [mv(Rc, v) for v in VK]

    def am(vec):
        vals = [dot(vec, X[i]) for i in range(20)]
        best = max(range(20), key=lambda i: float(vals[i]))
        assert all(vals[best] >= vals[i] for i in range(20))
        return best
    top = am(n)
    vs = tuple(None if f == CY.B2 else am(BK[f]) for f in range(4))
    return top, vs


def cand_linear(Rc, cand, c):
    top, vs = cand
    X = [mv(Rc, v) for v in VK]
    b2 = BK[CY.B2]
    ell = list(X[top])
    for f in range(4):
        if f == CY.B2:
            continue
        wf = [b2[i] - BK[f][i] for i in range(3)]
        hf = dot(BK[f], X[vs[f]])
        ell = [ell[i] + wf[i] * hf / 4 for i in range(3)]
    return [ell[i] - b2[i] * c for i in range(3)]


def solve3(A, y):
    M = [list(A[i]) + [y[i]] for i in range(3)]
    for col in range(3):
        piv = [i for i in range(col, 3) if not M[i][col].is_zero()][0]
        M[col], M[piv] = M[piv], M[col]
        iv = M[col][col].inv(); M[col] = [x * iv for x in M[col]]
        for i in range(3):
            if i != col and not M[i][col].is_zero():
                f = M[i][col]; M[i] = [x - f * z for x, z in zip(M[i], M[col])]
    return [M[i][3] for i in range(3)]


SIG = CY.SIG


def kappa():
    """The gradient k ∈ K³ of κ (solves the same 3 equations as kappa() of route Y with c₀ and the exact base; no rounding). The order-0 terms e_A, e_B of both sides are exactly 0."""
    if "kap" in _C:
        return _C["kap"]
    geo = geometry(); c = c0()
    LA, LB = geo["line_A"], geo["line_B"]
    PA = [LA["P0"][0], LA["P0"][1], KF(1)]
    PB = [LB["P0"][0], LB["P0"][1], KF(1)]
    # the candidates use the same vertices as route Y (for vertices tied at the centre, any choice gives the same base direction and value at P). Checks that they are exactly the maximum
    cA, cB = CY.kappa()["candA"], CY.kappa()["candB"]
    for Rc, P_, cnd in ((geo["RA"], PA, cA), (geo["RB"], PB, cB)):
        Xs = [mv(Rc, v) for v in VK]
        assert all(dot(P_, Xs[cnd[0]]) >= dot(P_, x) for x in Xs)
        for f in range(4):
            if f != CY.B2:
                assert all(dot(BK[f], Xs[cnd[1][f]]) >= dot(BK[f], x) for x in Xs)
    lA = cand_linear(geo["RA"], cA, c); lB = cand_linear(geo["RB"], cB, c)
    DA = [LA["d"][0], LA["d"][1], Z]
    DB = [LB["d"][0], LB["d"][1], Z]
    sDA = [DA[i] * SIG[i] for i in range(3)]
    sPA = [PA[i] * SIG[i] for i in range(3)]
    A = [DB, sDA, [PB[i] + sPA[i] for i in range(3)]]
    y = [dot(lB, DB), -dot(lA, DA), dot(lB, PB) - dot(lA, PA)]
    k = solve3(A, y)
    eB = dot([lB[i] - k[i] for i in range(3)], PB)
    eA = dot([lA[i] + k[i] * SIG[i] for i in range(3)], PA)
    assert eA.is_zero() and eB.is_zero(), "the order-0 terms of the two sides are not exactly 0"
    kY = CY.kappa()["k"]
    assert max(abs(float(k[i]) - float(kY[i])) for i in range(3)) < 1e-9, "does not agree with k̂ of route Y"
    _C["kap"] = dict(k=tuple(k), candA=cA, candB=cB, ellA=lA, ellB=lB)
    return _C["kap"]


def kappa_vec(side):
    k = kappa()["k"]
    return tuple(k) if side == "B" else tuple(-k[i] * SIG[i] for i in range(3))


def tube_center(side):
    geo = geometry()
    Rc = geo["RA"] if side == "A" else geo["RB"]
    return Rc, mat_to_q(Rc)


def tube_spec(name):
    side, (ulo, uhi), r0, ws = CY.TUBES[name]
    ln = geometry()["line_" + side]
    return dict(name=name, side=side, ulo=ulo, uhi=uhi, r0=r0, ws=ws, P0=ln["P0"], d=ln["d"], w=ln["w"])


TUBES = CY.TUBES
B2 = CY.B2
VF = CY.VF; BF = CY.BF
Mq = CY.Mq; qmul = CY.qmul
dod_rotations = CY.dod_rotations
F_f = CY.F_f


def fmat(M):
    return np.array([[float(e) for e in r] for r in M])


# ---------- rationals handed to the far region ----------
FAR_BITS = 100


def far_consts():
    """c_hi ≥ c₀ (denominator 2^100), k_r (the rational with denominator 2^100 nearest to each component of k), ETA (an upper bound of |(k − k_r)·p|, p = (x, y, 1), |x|, |y| ≤ 1)."""
    if "far" in _C:
        return _C["far"]
    c = c0()
    _, c_hi = c.outer(FAR_BITS)
    assert KF(c_hi) > c
    k = kappa()["k"]
    kr = tuple(x.nearest(FAR_BITS) for x in k)
    err = [abs(KF(kr[i]) - k[i]) for i in range(3)]
    ETA = Fr(1, 2 ** (FAR_BITS - 1))
    assert all(e <= Fr(1, 2 ** (FAR_BITS + 1)) * Fr(5, 4) for e in err)     # rounding error ≤ 2^−101 (plus a little for the interval width)
    assert sum(err, Z) <= ETA
    assert (err[0] + err[2]) * 2 <= ETA     # A10f H1: sum over a type III pair (2(err₁ + err₃) ≤ ETA)
    _C["far"] = dict(c_hi=c_hi, kr=kr, ETA=ETA)
    return _C["far"]


if __name__ == "__main__":
    import time
    t0 = time.time()
    cf = config(); geo = geometry(); kp = kappa(); fc = far_consts()
    print("c0 =", float(cf["c0"]), " s0 =", 2 * math.sqrt(2) * float(cf["c0"]))
    print("k =", [float(x) for x in kp["k"]], " k̂ of route Y =", [float(x) for x in CY.kappa()["k"]])
    print("c_hi − c0 =", float(KF(fc["c_hi"]) - cf["c0"]), " c0 − c̄ =", float(cf["c0"] - CY.CBAR))
    for s in "AB":
        ln = geo["line_" + s]
        print(s, "P0", [float(x) for x in ln["P0"]], "d", [float(x) for x in ln["d"]], "top", ln["top"])
    print(f"{time.time() - t0:.1f} s")
