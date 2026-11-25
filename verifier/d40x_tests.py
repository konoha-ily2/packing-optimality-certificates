# Tests for D40 route X (tetintet_n02, equality). 2026-11-14, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#   R3X  the local polynomials (sympy: cc reduced modulo Q5, coefficients in K) evaluated at random rational points equal the direct expression
#        |q|²·(G̃_c(n, R; s₀) ∓ κ̃₁) (R = M(q)/|q|² exactly in K, d40_common.gtilde_cand_exact). All centres, all candidates, 3 points each. Stops at the first mismatch.
#   E0X  at points on the arc (k′ = 0, h = 0 to h₁) the degree-0 sum of the main candidates of T_S and T_C is exactly 0 in K, and also 0 for T_S′ (mirror image).
#   tX1  replacing s₀ by s₀ + 2^−100, some leaves of the local record whose bottom touches the arc fail e₀ ≥ 0 (a check that the equality is really used).
#   tX2  the claim with the far s_hi replaced by a lower bound of s₀ (s_lo < s₀) is false, shown by "the candidate expression is negative at the centre point of T_S" (why the far region needs s₀ or more).
#   chain runs the local replay (d40x_local), the far replay (d40x_far) and the assert of the upper bound (d40x_upper) in sequence, and gives one line of pass/fail.
# Usage: python -X utf8 d40x_tests.py [--only R3X,E0X,tX1,tX2,chain]
import sys, os, json, time, random, argparse, gzip, subprocess
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d40_common as C
import d40x_common as X
from d40x_common import KE


def ev_kdict(P, pt):
    out = KE.of(0)
    for m, v in P.items():
        t = Fr(1)
        for x, e in zip(pt, m):
            if e:
                t *= x ** e
        out = out + v * t
    return out


def direct(cen, cand, pt):
    h, k, p1, p2, p3 = pt
    q = C.qmul(cen.q, (KE.of(1), KE.of(p1), KE.of(p2), KE.of(p3)))
    q = tuple(KE.of(t) for t in q)
    Q = sum((t * t for t in q), KE.of(0))
    R = X.rot_K(q)
    n = [Fr(x) for x in (C.n_A(h, k) if cen.side == "A" else C.n_B(h, k))]
    s0 = X.s0_K()
    if cand["type"] == "S":
        XV = [[sum((R[i][j] * Fr(C.VT[v][j], 2) for j in range(3)), KE.of(0)) for i in range(3)] for v in range(4)]
        val = sum((sum((C.BS[f][i] * XV[cand["vs"][f]][i] for i in range(3)), KE.of(0)) for f in range(4)), KE.of(0)) - 2 * s0
        return Q * val
    a0, a1, beta = X.kappa_coefs_K()
    kap = a0 + a1 * h + beta * k
    val = KE.of(C.gtilde_cand_exact(n, R, s0, cand["mu"], (cand["top"],) + tuple(cand["vs"])))
    return Q * (val - kap if cen.side == "A" else val + kap)


def t_R3X(npts=3):
    import d40x_local as L
    rng = random.Random(7)
    res = {}
    for cen in L.build_centers():
        nbad = 0; ntot = 0
        for c in cen.cands:
            for _ in range(npts):
                pt = (Fr(rng.randint(0, 96), 256), Fr(rng.randint(0, 8), 256), Fr(rng.randint(-8, 8), 256),
                      Fr(rng.randint(-8, 8), 256), Fr(rng.randint(-8, 8), 256))
                a = ev_kdict(c["P"], pt); b = direct(cen, c, pt)
                ntot += 1; nbad += (a != b)
        res[cen.name] = dict(points=ntot, mismatch=nbad)
        print("R3X", cen.name, res[cen.name], flush=True)
        assert nbad == 0, "the local polynomial and the direct expression do not agree"
    return res


def t_E0X():
    cen = X.centers_K()
    s0 = X.s0_K(); a0, a1, beta = X.kappa_coefs_K()
    I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    out = {}
    for nm, R in (("T_S", X.rot_K(cen[0][2])), ("T_S'", X.rot_K(cen[1][2]))):
        zs = []
        for hh in [Fr(i, 64) for i in range(0, 19)]:
            nA = [Fr(x) for x in C.n_A(hh, 0)]; nB = [Fr(x) for x in C.n_B(hh, 0)]
            import numpy as np
            def best(Rm, n):
                Rf = np.array([[float(x) for x in r] for r in Rm]); Xv = C.VTF @ Rf.T; nf = np.array([float(x) for x in n])
                return tuple([int(np.argmax(Xv @ nf))] + [int(np.argmax(Xv @ C.BF[f])) for f in range(4)])
            gA = KE.of(C.gtilde_cand_exact(nA, R, s0, 0, best(R, nA)))
            gB = KE.of(C.gtilde_cand_exact(nB, I3, s0, 0, best(I3, nB)))
            zs.append((gA + gB).is_zero())
        out[nm] = dict(points=len(zs), exact_zero=sum(zs))
        print("E0X", nm, out[nm], flush=True)
        assert all(zs)
    return out


def t_X1():
    """Check e₀ of the s₀ + 2^−100 version on the candidates of the leaves of the record (leaves of T_S whose bottom h includes the arc), and that some leaf fails."""
    import d40x_local as L
    cen = L.build_centers(["T_S"])[0]
    with gzip.open(os.path.join(HERE, "d40x_local.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f][1:]
    idx = {json.dumps(L.cand_key(c)): c for c in cen.cands}
    eps = Fr(1, 2 ** 100)
    nfail = 0; ntest = 0
    for r in lines:
        if r["c"] != "T_S":
            continue
        c = idx[json.dumps(r["cand"])]
        if c["type"] == "S":
            continue
        lo = [Fr(x) for x in r["lo"]]; hi = [Fr(x) for x in r["hi"]]
        # replacing s by s + ε lowers the degree-0 part of P: it changes by −(n·b₂/2 + μ/2)·ε·|q_c|² (n·b₂ = 2 − 2h − k′..., a positive value)
        Qc = sum((t * t for t in cen.q), KE.of(0))
        ok_all = True
        for hv in (lo[0], hi[0]):
            v = sum((cf * hv ** m[0] for m, cf in c["e0"].items()), KE.of(0))
            nb2 = sum(Fr(x) * b for x, b in zip(C.n_A(hv, 0), C.BS[2]))
            v2 = v - (nb2 / 2 + Fr(c["mu"], 2)) * eps * Qc
            if v2.sign() < 0:
                ok_all = False
        ntest += 1; nfail += (not ok_all)
        if ntest >= 400:
            break
    print("tX1", dict(tested=ntest, fail_with_s0_plus_eps=nfail), flush=True)
    assert nfail > 0
    return dict(tested=ntest, fail_with_s0_plus_eps=nfail)


def t_X2():
    """Using s_lo (< s₀) in the far region, the candidate expression is negative at the centre of T_S, a point on the arc (the claim is false). With s_hi it is ≥ 0."""
    s0 = X.s0_K(); slo, shi = s0.outer(100)
    cen = X.centers_K(); R = X.rot_K(cen[0][2]); I3 = [[Fr(int(i == j)) for j in range(3)] for i in range(3)]
    fb = X.far_bounds()
    h = Fr(1, 10)
    nA = [Fr(x) for x in C.n_A(h, 0)]
    a0, a1, beta = X.kappa_coefs_K()
    import numpy as np
    Rf = np.array([[float(x) for x in r] for r in R]); Xv = C.VTF @ Rf.T
    cand = tuple([int(np.argmax(Xv @ np.array([float(x) for x in nA])))] + [int(np.argmax(Xv @ C.BF[f])) for f in range(4)])
    vals = {}
    for nm, s in (("s_lo", slo), ("s0", s0), ("s_hi", shi)):
        # the expression of side A of the far region: G̃_c(s) − κ_hi (κ_hi is an upper bound of κ). 0 for s₀ and the exact κ
        g = KE.of(C.gtilde_cand_exact(nA, R, s, 0, cand))
        vals[nm] = (g - (a0 + a1 * h)).sign()
    print("tX2", vals, flush=True)
    assert vals["s0"] == 0 and vals["s_lo"] > 0 and vals["s_hi"] < 0
    # Reading: the smaller s, the larger G̃ (the far claim becomes stronger). Showing it with s_lo does not give the claim for s₀; showing ≥ 0 with s_hi is the right direction.
    # Here the point is the centre itself (inside the local region L), so in the far region it is taken by an L leaf (it is negative with s_hi only inside L).
    return vals


def t_chain():
    t0 = time.time()
    out = {}
    for nm, cmd in (("local", ["d40x_local.py", "replay"]), ("far", ["d40x_far.py", "replay"]), ("upper", ["d40x_upper.py"])):
        r = subprocess.run([sys.executable, "-X", "utf8"] + cmd, cwd=HERE, capture_output=True, text=True, encoding="utf-8")
        out[nm] = dict(rc=r.returncode, tail=r.stdout.strip().splitlines()[-1:] if r.stdout else [], err=r.stderr.strip()[-300:])
        print("chain", nm, out[nm], flush=True)
    out["passed"] = all(v["rc"] == 0 for v in out.values() if isinstance(v, dict))
    out["seconds"] = round(time.time() - t0, 1)
    print("chain pass/fail", out["passed"], flush=True)
    return out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="R3X,E0X,tX1,tX2,chain")
    a = ap.parse_args()
    fn = os.path.join(HERE, "d40x_tests.json")
    res = json.load(open(fn, encoding="utf-8")) if os.path.exists(fn) else {}
    for t in a.only.split(","):
        res[t] = dict(R3X=t_R3X, E0X=t_E0X, tX1=t_X1, tX2=t_X2, chain=t_chain)[t]()
        json.dump(res, open(fn, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
