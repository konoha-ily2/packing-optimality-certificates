# F6 stage 3a (cases whose configuration does not lie in K = Q(s₀)): write the configuration exactly with elements of L = K(y), y² = D, and check the upper bound s* ≤ s₀ in L.
# 2026-11-15, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#   dodindod (--ext quad): a, b, c are quadratic over K (a satisfies α a² + β a + γ = 0, with α, β, γ ∈ K found by LLL; b and c are linear fractional in a; pp/global_opt/NOTES_f6.md §8.1 (working notes, Japanese)).
#     D := β² − 4αγ, y := 2αa + β (the signs of α, β, γ are chosen so that y > 0 numerically), a = (y − β)/(2α).
#   octinoct (--ext sqrt2): the field of the problem is Q(√2), and √2 ∉ K (f is irreducible over Q(√2)). D := 2, y = √2.
#     b and c are found through a linear fractional relation with a, V0 + V1 a + V2 x + V3 a x = 0 (V ∈ K, coefficients of 9 digits) (in the power basis the coefficients are too large).
#   For octinoct, a, b, c are found by LLL in the basis [basis of K, y·(basis of K)] (the basis of K is s of degree ≤ deg/2 − 1 over Q(√5), or of degree ≤ deg − 1 over Q).
# The check (exact) is the same as in f6_field.py: Rq = rot_q(1, a, b, c)·R̂ᵀ, solve t in L from the active rows, active rows = 0, other rows ≤ 0, separation ≤ 0.
# The fit is numerical, but the check does not depend on it (only arithmetic in the ring Q[x, y]/(f, y² − D), and balls of the map x ↦ s₀, y ↦ +√D).
# Usage: python -X utf8 f6_field2.py <case> --ext quad|sqrt2 [--dps 6000] [--P 5800]  → f6/f6_<case>_field.json
import os, sys, json, time, argparse, itertools
from fractions import Fraction as Fr
import numpy as np
import mpmath as mp
import flint
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
from f6_field_cubindod import K, kpoly, root_ball, evb
import f6_field as FG
from f6_tower import L2, kq, setup


def lll_vec(basis, P):
    """Integer n with Σ n_j basis_j = 0 (the shortest from LLL). Returns (n, log10 of the residual, number of digits of the coefficients)."""
    C = mp.mpf(10) ** P
    m = len(basis)
    rows = []
    for i, bb in enumerate(basis):
        r = [0] * m; r[i] = 1; r.append(int(mp.nint(C * bb))); rows.append(r)
    L = flint.fmpz_mat(rows).lll()
    best = None
    for k in range(m):
        v = [int(L[k, j]) for j in range(m)]
        if not any(v):
            continue
        res = abs(mp.fsum(v[j] * basis[j] for j in range(m)))
        lr = float(mp.log10(res)) if res > 0 else -1e9
        if best is None or lr < best[1]:
            best = (v, lr)
    v, lr = best
    return v, lr, max(len(str(abs(x))) for x in v)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name")
    ap.add_argument("--ext", required=True, choices=["quad", "sqrt2"])
    ap.add_argument("--dps", type=int, default=6000)
    ap.add_argument("--P", type=int, default=None)
    ap.add_argument("--monic", action="store_true", help="build K with a monic integer polynomial in x′ = c·s₀ (c is the leading coefficient of f), to stop the growth of coefficients under multiplication")
    A = ap.parse_args()
    name, dps = A.name, A.dps
    Pl = A.P or dps - 200
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
    abc = [q[1] / q[0], q[2] / q[0], q[3] / q[0]]
    f = FG.load_f(name)
    K.f = f
    deg = f.degree()
    r5 = FG.sqrt5_exact(f, s)
    cx = int(f.numer().coeffs()[-1]) if A.monic else 1     # x′ = cx·s
    if cx != 1:
        g = FG.monic_of(f)
        r5p = r5.p if r5 is not None else None
        K.f = g
        if r5 is not None:
            r5 = K(FG.s_to_x(r5p, cx))
    conv = (lambda p_: FG.s_to_x(p_, cx)) if cx != 1 else (lambda p_: p_)
    if r5 is not None:
        hd = deg // 2
        kb = [s ** k for k in range(hd)] + [mp.sqrt(5) * s ** k for k in range(hd)]

        def kelem(co):     # rationals of length 2hd → K
            return K(conv(kpoly(co[:hd]))) + r5 * K(conv(kpoly(co[hd:])))
    else:
        kb = [s ** k for k in range(deg)]

        def kelem(co):
            return K(conv(kpoly(co)))
    nk = len(kb)
    ball, (lo, hi) = root_ball(f, s, 4000)
    flint.ctx.prec = 4000
    ball = ball * cx                      # ball of x′ = cx·s₀
    gpath = os.path.join(HERE, "f6", f"f6_{name}_guess.json")
    guess = json.load(open(gpath, encoding="utf-8")) if os.path.exists(gpath) else {}
    guess_new = {}

    def lll_cached(key, basis_fn):
        """Store the LLL fit (an integer relation) in f6_<case>_guess.json and reuse it (the fit does not enter acceptance, so a stored relation may be used)."""
        if key in guess and guess[key]["dps"] == dps and guess[key]["P"] == Pl:
            v = [int(x) for x in guess[key]["v"]]
            bs = basis_fn()
            res = abs(mp.fsum(v[j] * bs[j] for j in range(len(bs))))
            lr = float(mp.log10(res)) if res > 0 else -1e9
            nd = max(len(str(abs(x))) for x in v)
        else:
            v, lr, nd = lll_vec(basis_fn(), Pl)
        guess_new[key] = dict(v=[str(x) for x in v], dps=dps, P=Pl)
        json.dump(dict(guess, **guess_new), open(gpath, "w", encoding="utf-8"), indent=0)
        return v, lr, nd
    info = {}
    if A.ext == "quad":
        a = abc[0]
        v, lr, nd = lll_cached("quad_a", lambda: [a * a * x for x in kb] + [a * x for x in kb] + kb)
        print(f"quadratic equation of a: residual 1e{round(lr)}, digits of coefficients {nd}", flush=True)
        assert lr < -(Pl + 50), "quadratic equation of a not found"
        al = kelem([Fr(x) for x in v[:nk]]); be = kelem([Fr(x) for x in v[nk:2 * nk]]); ga = kelem([Fr(x) for x in v[2 * nk:]])
        aln = mp.fsum(v[j] * kb[j] for j in range(nk)); ben = mp.fsum(v[nk + j] * kb[j] for j in range(nk))
        yn = 2 * aln * a + ben
        if yn < 0:
            al, be, ga = -al, -be, -ga; aln, ben, yn = -aln, -ben, -yn
        D = be * be - 4 * al * ga
        setup(K.f, D, ball)
        info = dict(ext="quad", note="α a² + β a + γ = 0\u3001D = β² − 4αγ\u3001y = 2αa + β > 0\u3001a = (y − β)/(2α)",
                    quad_digits=nd, quad_resid_log10=round(lr))
        yv = L2(K(0), K(1))
        a_L = (yv - L2(be)) * (L2(al) * 2).inv()
        targets = [("b", abc[1]), ("c", abc[2])]
        E = {"a": a_L}
    else:
        D = kq(2)
        setup(K.f, D, ball)
        yn = mp.sqrt(2)
        info = dict(ext="sqrt2", note="y = √2")
        targets = [("a", abc[0]), ("b", abc[1]), ("c", abc[2])]
        E = {}
    yb = L2.yball
    assert abs(float(yb.mid()) - float(yn)) < 1e-9, "ball of y vs numerical value"
    basis = kb + [yn * x for x in kb]
    for nm, xv in targets:
        if A.ext == "quad":
            # in the power basis b and c have large coefficients, so fit the linear fractional relation with a, V0 + V1 a + V2 x + V3 a x = 0 (V ∈ K)
            v, lr, nd = lll_cached(f"mob_{nm}", lambda: kb + [a * w for w in kb] + [xv * w for w in kb] + [a * xv * w for w in kb])
            ok = lr < -(Pl + 50)
            print(f"{nm} (linear fractional in a) residual 1e{round(lr)}, digits of coefficients {nd} {'ok' if ok else 'not found'} {time.time() - t0:.1f} s", flush=True)
            if not ok:
                raise SystemExit("fit failed: raise the precision")
            V = [L2(kelem([Fr(x) for x in v[j * nk:(j + 1) * nk]])) for j in range(4)]
            E[nm] = -(V[0] + V[1] * a_L) * (V[2] + V[3] * a_L).inv()
            info[f"{nm}_digits"] = nd
            continue
        v, lr, nd = lll_cached(f"lin_{nm}", lambda: [xv] + basis)
        ok = lr < -(Pl + 50) and v[0] != 0
        print(f"{nm} residual 1e{round(lr)}, digits of coefficients {nd} {'ok' if ok else 'not found'} {time.time() - t0:.1f} s", flush=True)
        if not ok:
            raise SystemExit("fit failed: raise the precision")
        d0 = v[0]
        co = [Fr(-x, d0) for x in v[1:]]
        E[nm] = L2(kelem(co[:nk]), kelem(co[nk:]))
    for nm, xv in zip("abc", abc):
        assert abs(float(E[nm].ball().mid()) - float(xv)) < 1e-12, f"numerical value of {nm}"
    if r5 is not None:
        E["r5"] = L2(r5)
    import d16e_common as CC
    gen = CC.QD.GENS[0]
    if gen == 5:
        assert r5 is not None
        rad = L2(r5)
    elif gen == 2:
        assert A.ext == "sqrt2"
        rad = L2(K(0), K(1))
    else:
        raise SystemExit("generator of the field")
    assert (rad * rad - gen).iszero() and rad.sign() == 1

    def qk(x):
        out = L2(kq(x.v[0]))
        if len(x.v) > 1 and x.v[1] != 0:
            out = out + rad * L2(kq(x.v[1]))
        assert all(z == 0 for z in x.v[2:])
        return out
    s0 = L2(K(flint.fmpq_poly([0, 1], cx)))      # s₀ = x′/cx
    S0 = qk(P.C0) * s0
    qa = [E["a"], E["b"], E["c"]]
    Np = 1 + qa[0] * qa[0] + qa[1] * qa[1] + qa[2] * qa[2]
    assert Np.sign() == 1
    Ra = C.rot_q([L2(1)] + qa)
    Rh = [[qk(P.RSTAR[i][j]) for j in range(3)] for i in range(3)]
    for i in range(3):
        for j in range(3):
            assert (sum((Rh[i][k] * Rh[j][k] for k in range(3)), L2(0)) - (1 if i == j else 0)).iszero()
    Rq = [[sum((Ra[i][k] * Rh[j][k] for k in range(3)), L2(0)) for j in range(3)] for i in range(3)]
    # active rows from the floating-point LP
    Rfl = np.array([[float(Rq[i][j].ball().mid()) / float(Np.ball().mid()) for j in range(3)] for i in range(3)])
    NCF = np.array([[float(x) for x in n] for n in P.NORMALS])
    VF = np.array([[float(x) for x in v] for v in P.VERTS])
    n0f = np.array([float(x) for x in P.N0]); D0f = float(P.D0)
    from scipy.optimize import linprog
    nf = P.NF
    H = NCF @ Rfl @ VF.T
    Am = np.zeros((nf + 1, 4)); bb = np.zeros(nf + 1)
    Am[:nf, :3] = NCF; Am[:nf, 3] = -1; bb[:nf] = -H.max(axis=1)
    Am[nf, :3] = Rfl @ n0f; bb[nf] = -D0f
    r = linprog([0, 0, 0, 1], A_ub=Am, b_ub=bb, bounds=[(None, None)] * 4, method="highs")
    assert r.status == 0
    tf = r.x[:3]; Sf = r.x[3]
    print("S (LP)", Sf, "C0·s", float(P.C0) * float(s), flush=True)
    act = [(fi, vi) for fi in range(nf) for vi in range(len(P.VERTS)) if abs(NCF[fi] @ (Rfl @ VF[vi] + tf) - Sf) < 1e-9]
    sep_act = abs((Rfl @ n0f) @ tf + D0f) < 1e-9
    print("active rows", act, "separation", sep_act, flush=True)
    NK = [[qk(x) for x in n] for n in P.NORMALS]
    assert set(P.NORMALS) == set(tuple(-x for x in n) for n in P.NORMALS), "the container is not centrally symmetric (B = −A is used)"
    VK = [[qk(x) for x in v] for v in P.VERTS]
    n0k = [qk(x) for x in P.N0]
    D0k = qk(P.D0)
    Rv = [[sum((Rq[i][j] * VK[vi][j] for j in range(3)), L2(0)) for i in range(3)] for vi in range(len(VK))]
    u = [sum((Rq[i][j] * n0k[j] for j in range(3)), L2(0)) for i in range(3)]

    def row_eq(fv):
        if fv == "sep":
            return u, -(Np * D0k)
        fi, vi = fv
        n = NK[fi]
        return [Np * n[i] for i in range(3)], Np * S0 - sum((n[i] * Rv[vi][i] for i in range(3)), L2(0))
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
    dM = FG.det3k(M)
    di = dM.inv()
    tk = []
    for c in range(3):
        Mc = [[(rhs[rr] if cc == c else M[rr][cc]) for cc in range(3)] for rr in range(3)]
        tk.append(FG.det3k(Mc) * di)
    for i in range(3):
        assert abs(float(tk[i].ball().mid()) - tf[i]) < 1e-6, "fit of t"
    nzero = nneg = 0
    for fi in range(nf):
        n = NK[fi]
        nt = sum((n[i] * tk[i] for i in range(3)), L2(0))
        for vi in range(len(VK)):
            val = sum((n[i] * Rv[vi][i] for i in range(3)), L2(0)) + Np * nt - Np * S0
            sg = val.sign()
            if (fi, vi) in act:
                assert sg == 0, f"active row {fi},{vi} is not 0"
            assert sg <= 0, f"face {fi} vertex {vi} sticks out"
            nzero += sg == 0; nneg += sg < 0
    sepv = sum((u[i] * tk[i] for i in range(3)), L2(0)) + Np * D0k
    ss = sepv.sign()
    assert ss <= 0, "separation"
    if sep_act:
        assert ss == 0
    E["t0"], E["t1"], E["t2"] = tk
    out = dict(name=name, coords="d44\uff08\u99d2\u306f R̂ \u3067\u56de\u3057\u3066\u3042\u308b\u3001R = rot_q(1, a, b, c)·R̂ᵀ/N\u3001S = C0·s\uff09",
               field=f"L = K[y]/(y² − D)\u3001K = Q[x]/(f)\u3001f = f6_{name}_poly.json\u3001x = s₀\uff08\u533a\u9593 [lo, hi] \u306e f \u306e\u6839\uff09\u3001y = +√D(s₀)",
               lo=f"{lo.numerator}/{lo.denominator}", hi=f"{hi.numerator}/{hi.denominator}", interval_bits=4000, xscale=str(cx),
               sqrt5=r5 is not None, ext=info,
               D=dict(num_low_to_high=[str(int(x)) for x in D.p.numer().coeffs()], den=str(int(D.p.denom()))),
               elems={nm: E[nm].ser() for nm in E},
               checks=dict(active=[list(a) for a in act], separation_active=bool(sep_act), solved_from=[str(eqs[k]) for k in tri],
                           rows_zero=nzero, rows_neg=nneg, separation_sign=ss),
               sec=round(time.time() - t0, 1),
               note="F6 \u6bb5 3a\u3001Opus 5.5\u3002\u5f53\u3066\u306f LLL\uff08\u6570\u5024\uff09\u3001\u78ba\u304b\u3081\u306f L \u306e\u4e2d\u3067\u6b63\u78ba\uff08\u7b26\u53f7\u306f arb \u306e\u53b3\u5bc6\u306a\u7403\uff09\u3002\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")
    json.dump(out, open(os.path.join(HERE, "f6", f"f6_{name}_field.json"), "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== upper bound s* ≤ s₀ in L: rows = 0: {nzero}, negative rows: {nneg}, separation {ss}, {time.time() - t0:.1f} s", flush=True)


if __name__ == "__main__":
    main()
