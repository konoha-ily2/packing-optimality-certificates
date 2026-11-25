# F6 stage 3a (general pairs): write the optimal n = 2 configuration exactly with elements of the field K = Q(s₀), and check the upper bound s* ≤ s₀ in K.
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# The same idea as f6_field_cubindod.py, carried out in the D44 coordinates (problem P of d44_problems; the piece is rotated by R̂ beforehand):
#   1. Guess a, b, c of the quaternion (1, a, b, c) in the original coordinates (R* = rot_q/N) by LLL (p* has large coefficients at about 1e-22 and is not found) (basis: powers of s
#      of degree ≤ deg/2 − 1 over Q(√5); for pairs that do not use √5, powers of s of degree ≤ deg − 1 over Q). The values are the high-precision KKT of f6_<pair>_hpx<dps>.json.
#   2. Check exactly (K = Q[x]/(f)): Rq = rot_q(1, a, b, c)·R̂ᵀ (= N·R*_frame); from the active rows (slack < 1e-9 in the floating-point LP)
#      solve for t* in K; the active rows are exactly 0 and the remaining rows (all container faces × all piece vertices, separation (R n0)·t ≤ −D0) are ≤ 0.
#      S = S₀ := C0·s₀ (cedge2 = 1). B = −A is the same by the point symmetry of the container (as in d44_upper; lemma R is not used).
#      Signs are decided with arb by substituting the ball of s₀. s₀ is "the unique real root of f in the rational interval [lo, hi]".
#   Hence 2 pieces fit in the container of edge s₀, and s* ≤ s₀. The guess is numerical, but the check does not depend on the guess.
# Usage: python -X utf8 f6_field.py <pair> [dps=6000] [P=5800]  → f6/f6_<pair>_field.json
import os, sys, json, time
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp
import flint
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import f6_field_cubindod as FK
from f6_field_cubindod import K, kpoly, lll_rel, root_ball, sign, evb


def load_f(name):
    if name == "cubindod":
        return FK.load_f()
    d = json.load(open(os.path.join(HERE, "f6", f"f6_{name}_poly.json"), encoding="utf-8"))
    return flint.fmpq_poly([int(x) for x in d["coeffs_low_to_high"]])


def monic_of(f):
    """From f (integer coefficients, leading coefficient c): g(x′) = c^(d−1)·f(x′/c) (monic, integer coefficients). x′ = c·x."""
    co = [int(v) for v in f.numer().coeffs()]
    d = len(co) - 1
    c = co[-1]
    g = flint.fmpq_poly([co[i] * c ** (d - 1 - i) for i in range(d)] + [1])
    return g


def s_to_x(p, c):
    """The polynomial p(s) in s → the polynomial p(x′/c) in x′ = c·s."""
    num = [int(v) for v in p.numer().coeffs()]
    den = int(p.denom())
    if not num:
        return flint.fmpq_poly([])
    n = len(num) - 1
    return flint.fmpq_poly([num[i] * c ** (n - i) for i in range(n + 1)], den * c ** n)


def sqrt5_exact(f, s):
    """Factor f over Q(√5) and, from the factor A + √5 B vanishing at s₀, √5 = −A/B mod f (exact). None if f does not split."""
    import sympy as sp
    x = sp.symbols("x"); r = sp.sqrt(5)
    fx = sum(int(c) * x ** i for i, c in enumerate(f.numer().coeffs()))
    fl = sp.factor_list(fx, extension=r)
    if len(fl[1]) == 1:
        return None
    assert len(fl[1]) == 2

    def fq(p):
        P = sp.Poly(p, x); cs = P.all_coeffs()[::-1]
        den = sp.ilcm(*[sp.fraction(c)[1] for c in cs])
        return flint.fmpq_poly([int(c * den) for c in cs], int(den))
    out = []
    for g, e in fl[1]:
        g = sp.expand(g); A = sp.expand(g.subs(r, 0)); B = sp.expand((g - A) / r)
        G, U, _ = fq(B).xgcd(f)
        assert G == 1
        out.append(K(-fq(A) * U))
    vals = [float(mp.fsum(mp.mpf(int(c)) * s ** i for i, c in enumerate(k.p.numer().coeffs())) / int(k.p.denom())) for k in out]
    k = out[0] if vals[0] > 0 else out[1]
    assert abs(max(vals) - 5 ** 0.5) < 1e-9 and abs(min(vals) + 5 ** 0.5) < 1e-9
    return k


def qd_mp(v):
    """A QD number (Q(√5) or Q) to mp."""
    if len(v.v) == 1:
        return mp.mpf(v.v[0].numerator) / v.v[0].denominator
    return mp.mpf(v.v[0].numerator) / v.v[0].denominator + mp.sqrt(5) * mp.mpf(v.v[1].numerator) / v.v[1].denominator


def qd_k(v, r5):
    out = K(flint.fmpq_poly([v.v[0].numerator], v.v[0].denominator))
    if len(v.v) > 1 and v.v[1] != 0:
        out = out + r5 * K(flint.fmpq_poly([v.v[1].numerator], v.v[1].denominator))
    for x in v.v[2:]:
        assert x == 0
    return out


def kinv(k):
    G, U, _ = k.p.xgcd(K.f)
    assert G == 1
    return K(U)


def det3k(M):
    return (M[0][0] * (M[1][1] * M[2][2] - M[1][2] * M[2][1]) - M[0][1] * (M[1][0] * M[2][2] - M[1][2] * M[2][0])
            + M[0][2] * (M[1][0] * M[2][1] - M[1][1] * M[2][0]))


def main(name, dps, P_lll):
    t0 = time.time()
    import d44_problems as DP
    DP.install()
    import d16e_common as C
    P = C.load("d44_" + name)
    assert P.CEDGE2 == 1
    h = json.load(open(os.path.join(HERE, "f6", f"f6_{name}_hpx{dps}.json"), encoding="utf-8"))
    mp.mp.dps = dps
    s = mp.mpf(h["s"])
    q = [mp.mpf(x) for x in h["quat"]]
    a_, b_, c_ = q[1] / q[0], q[2] / q[0], q[3] / q[0]
    N_ = 1 + a_ ** 2 + b_ ** 2 + c_ ** 2
    Ra = mp.matrix(C.rot_q([mp.mpf(1), a_, b_, c_])) / N_
    Rh = mp.matrix([[qd_mp(P.RSTAR[i][j]) for j in range(3)] for i in range(3)])
    Rf = Ra * Rh.T
    tr1 = 1 + Rf[0, 0] + Rf[1, 1] + Rf[2, 2]
    pn = [(Rf[2, 1] - Rf[1, 2]) / tr1, (Rf[0, 2] - Rf[2, 0]) / tr1, (Rf[1, 0] - Rf[0, 1]) / tr1]
    print("p* (numerical)", [mp.nstr(v, 8) for v in pn], flush=True)
    f = load_f(name)
    K.f = f
    deg = f.degree()
    r5 = sqrt5_exact(f, s)
    if r5 is not None:
        hd = deg // 2
        pows = [s ** k for k in range(hd)] + [mp.sqrt(5) * s ** k for k in range(hd)]
        print("√5 ∈ K (f is degree", hd, "× 2 over Q(√5))", flush=True)
    else:
        pows = [s ** k for k in range(deg)]
        print("√5 not used (f is irreducible over Q(√5))", flush=True)
    E = {}
    found = {}
    for i, xv in enumerate((a_, b_, c_)):
        co, lr, nd = lll_rel(xv, pows, P_lll)
        ok = lr < -(P_lll + 50)
        print(f"{'abc'[i]} residual 1e{round(lr)} coefficient digits {nd} {'ok' if ok else 'not found'} {time.time() - t0:.1f} s", flush=True)
        if not ok:
            raise SystemExit("guess failed: raise the precision")
        found["abc"[i]] = co
        if r5 is not None:
            E["abc"[i]] = K(kpoly(co[:hd])) + r5 * K(kpoly(co[hd:]))
        else:
            E["abc"[i]] = K(kpoly(co))
    if r5 is not None:
        E["r5"] = r5
        assert (r5 * r5 - 5).iszero()
    rk = r5 if r5 is not None else None

    def qk(v):
        if len(v.v) > 1 and v.v[1] != 0:
            assert rk is not None
        return qd_k(v, rk)
    s0 = K(flint.fmpq_poly([0, 1]))
    S0 = qk(P.C0) * s0
    qk3 = [E["a"], E["b"], E["c"]]      # quaternion (1, a, b, c) in the original coordinates
    Np = 1 + qk3[0] * qk3[0] + qk3[1] * qk3[1] + qk3[2] * qk3[2]
    Ra_k = C.rot_q([K(1)] + qk3)          # = Np·R*
    Rh_k = [[qk(P.RSTAR[i][j]) for j in range(3)] for i in range(3)]
    Rq = [[sum((Ra_k[i][k] * Rh_k[j][k] for k in range(3)), K(0)) for j in range(3)] for i in range(3)]   # = Np·R*_frame
    # R̂ is orthogonal (exactly in K)
    for i in range(3):
        for j in range(3):
            assert (sum((Rh_k[i][k] * Rh_k[j][k] for k in range(3)), K(0)) - (1 if i == j else 0)).iszero()
    ball, (lo, hi) = root_ball(f, s, 4000)
    if rk is not None:
        assert sign(rk, ball) == 1
    assert sign(Np, ball) == 1
    # active rows by the floating-point LP
    Rfl = np.array([[float(Rf[i, j]) for j in range(3)] for i in range(3)])
    NCF = np.array([[float(x) for x in n] for n in P.NORMALS])
    VF = np.array([[float(x) for x in v] for v in P.VERTS])
    n0f = np.array([float(x) for x in P.N0]); D0f = float(P.D0)
    H = NCF @ Rfl @ VF.T
    from scipy.optimize import linprog
    nf = P.NF
    A = np.zeros((nf + 1, 4)); bb = np.zeros(nf + 1)
    A[:nf, :3] = NCF; A[:nf, 3] = -1; bb[:nf] = -H.max(axis=1)
    A[nf, :3] = Rfl @ n0f; bb[nf] = -D0f
    r = linprog([0, 0, 0, 1], A_ub=A, b_ub=bb, bounds=[(None, None)] * 4, method="highs")
    assert r.status == 0
    tf = r.x[:3]; Sf = r.x[3]
    print("S (LP)", Sf, "C0·s", float(P.C0) * float(s), flush=True)
    act = [(fi, vi) for fi in range(nf) for vi in range(len(P.VERTS)) if abs(NCF[fi] @ (Rfl @ VF[vi] + tf) - Sf) < 1e-9]
    sep_act = abs((Rfl @ n0f) @ tf + D0f) < 1e-9
    print("active rows", act, "separation", sep_act, flush=True)
    # linear form of a row: L·t = rhs (times Np). Container (f, v): n_f·(Rq v) + Np n_f·t − Np S0; separation: (Rq n0)·t + Np D0
    NK = [[qk(x) for x in n] for n in P.NORMALS]
    VK = [[qk(x) for x in v] for v in P.VERTS]
    n0k = [qk(x) for x in P.N0]
    D0k = qk(P.D0)
    Rv = [[sum((Rq[i][j] * VK[vi][j] for j in range(3)), K(0)) for i in range(3)] for vi in range(len(VK))]
    u = [sum((Rq[i][j] * n0k[j] for j in range(3)), K(0)) for i in range(3)]

    def row_eq(fv):
        if fv == "sep":
            return u, -(Np * D0k)          # u·t = −Np D0
        fi, vi = fv
        n = NK[fi]
        return [Np * n[i] for i in range(3)], Np * S0 - sum((n[i] * Rv[vi][i] for i in range(3)), K(0))
    eqs = list(act) + (["sep"] if sep_act else [])
    # choose 3 independent rows and solve (chosen by the numerical determinant, solved exactly in K)
    import itertools
    best = None
    for tri in itertools.combinations(range(len(eqs)), 3):
        M = []
        for k in tri:
            fv = eqs[k]
            M.append(list(Rfl @ n0f) if fv == "sep" else list(NCF[fv[0]]))
        d = abs(np.linalg.det(np.array(M)))
        if best is None or d > best[0]:
            best = (d, tri)
    tri = best[1]
    rows3 = [row_eq(eqs[k]) for k in tri]
    M = [rw[0] for rw in rows3]; rhs = [rw[1] for rw in rows3]
    dM = det3k(M)
    assert sign(dM, ball) != 0
    di = kinv(dM)
    tk = []
    for c in range(3):
        Mc = [[(rhs[rr] if cc == c else M[rr][cc]) for cc in range(3)] for rr in range(3)]
        tk.append(det3k(Mc) * di)
    for i in range(3):
        assert abs(float(evb(tk[i].p, ball).mid()) - tf[i]) < 1e-6, "guess of t"
    # check all rows
    nzero = nneg = 0
    for fi in range(nf):
        n = NK[fi]
        nt = sum((n[i] * tk[i] for i in range(3)), K(0))
        for vi in range(len(VK)):
            val = sum((n[i] * Rv[vi][i] for i in range(3)), K(0)) + Np * nt - Np * S0
            sg = sign(val, ball)
            if (fi, vi) in act:
                assert sg == 0, f"active row {fi},{vi} is not 0"
            assert sg <= 0, f"face {fi} vertex {vi} sticks out"
            nzero += sg == 0; nneg += sg < 0
    sepv = sum((u[i] * tk[i] for i in range(3)), K(0)) + Np * D0k
    ss = sign(sepv, ball)
    assert ss <= 0, "separation"
    if sep_act:
        assert ss == 0
    E["t0"], E["t1"], E["t2"] = tk

    def ser(k):
        return dict(num_low_to_high=[str(int(x)) for x in k.p.numer().coeffs()], den=str(int(k.p.denom())))
    out = dict(name=name, coords="d44\uff08\u99d2\u306f R̂ \u3067\u56de\u3057\u3066\u3042\u308b\u3001R = rot_q(1, p)/N\u3001S = C0·s\uff09",
               field=f"Q[x]/(f)\u3001f = {'f6_cubindod_minpoly.json' if name == 'cubindod' else f'f6_{name}_poly.json'}\u3001x = s₀\uff08\u533a\u9593 [lo, hi] \u306e f \u306e\u6839\uff09",
               lo=f"{lo.numerator}/{lo.denominator}", hi=f"{hi.numerator}/{hi.denominator}", interval_bits=4000,
               sqrt5=r5 is not None,
               elems={nm: ser(E[nm]) for nm in E},
               checks=dict(active=[list(a) for a in act], separation_active=bool(sep_act), solved_from=[str(eqs[k]) for k in tri],
                           rows_zero=nzero, rows_neg=nneg, separation_sign=ss),
               coeff_digits={nm: max(len(str(abs(x.numerator))) + len(str(x.denominator)) for x in found[nm]) for nm in found},
               sec=round(time.time() - t0, 1),
               note="F6 \u6bb5 3a\u3001Opus 5.5\u3002\u5f53\u3066\u306f LLL\uff08\u6570\u5024\uff09\u3001\u78ba\u304b\u3081\u306f K \u306e\u4e2d\u3067\u6b63\u78ba\uff08\u7b26\u53f7\u306f arb \u306e\u53b3\u5bc6\u306a\u7403\uff09\u3002\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")
    json.dump(out, open(os.path.join(HERE, "f6", f"f6_{name}_field.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== upper bound s* ≤ s₀ in K: zero rows {nzero}, negative rows {nneg}, separation {ss}, {time.time() - t0:.1f} s", flush=True)


if __name__ == "__main__":
    nm = sys.argv[1]
    if nm == "cubindod":
        # f6/f6_cubindod_field.json is the output of f6_field_cubindod.py (original coordinates, keys T0..T2), and f6_local_cubindod.py relies on it.
        # Refuse here so that this tool (d44 coordinates, keys t0..t2) does not overwrite it (F6f, 11/15).
        raise SystemExit("cubindod: use f6_field_cubindod.py (do not overwrite the same json in a different form)")
    dps = int(sys.argv[2]) if len(sys.argv) > 2 else 6000
    Pl = int(sys.argv[3]) if len(sys.argv) > 3 else dps - 200
    main(nm, dps, Pl)
