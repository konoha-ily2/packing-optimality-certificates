# D45 route X (dodintet_n02, equality): tests. 2026-11-14, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#   R3X  the local polynomials (P8: 8 fmpq_mpoly for the coefficients of γ) evaluated at random rational points = the direct formula |q|²·F_c (exactly in K). All candidates, 4 points each.
#   E0X  at 9 points u on the base (w = 0, p = 0), F − κ of the main candidates of both sides is exactly 0 in K.
#   tX1  replacing c₀ by c₀ + 2^−100 makes the leaves of the local record that touch the base (leaves with r = 0) fail at e₀ ≥ 0 (a check that the equality is used).
#   tX2  not shown: that without adding ETA to the far k_r the acceptance lower bound becomes negative on some recorded leaf (the margin is large and ETA is 1e−30).
#        Instead, the direction of ETA: the maximum of |(k − k_r)·p| when k is replaced by k_r, computed at the 4 corners of D_n, is at most ETA.
#   chain the local replay (d45x_dodintet_local), the far replay_y (d45x_dodintet_far, the route Y record with the route X constants) and the assert of the upper bound.
# Usage: python -X utf8 d45x_dodintet_tests.py [--only R3X,E0X,tX1,tX2,chain]
import sys, os, json, time, random, argparse, gzip, subprocess
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import flint
import d45x_dodintet_common as C
from kfield import KE
KF = C.KF


def build_with_raw(name):
    import d45x_dodintet_local as L
    orig = L.Tube.split

    def split_keep(self, c, P):
        c["Praw"] = P
        return orig(self, c, P)
    L.Tube.split = split_keep
    try:
        tb = L.Tube(name)
    finally:
        L.Tube.split = orig
    return tb


def ev_p8(P, pt):
    vals = [P.P[j](*[flint.fmpq(x.numerator, x.denominator) for x in pt]) for j in range(8)]
    return KE(KF, tuple(Fr(int(v.p), int(v.q)) for v in vals))


def direct(tb, cand, pt):
    u, w, p1, p2, p3 = pt
    n = [KF(0) + tb.P0[0] + u * tb.d[0] + tb.ws * w * tb.wv[0], KF(0) + tb.P0[1] + u * tb.d[1] + tb.ws * w * tb.wv[1], KF(1)]
    q = tuple(C.k_of(t) for t in C.qmul(tb.qc, (KF(1), KF(p1), KF(p2), KF(p3))))
    Q = sum((t * t for t in q), KF(0))
    M = C.Mq(*q)
    X = [[sum((M[i][j] * v[j] for j in range(3)), KF(0)) for i in range(3)] for v in C.VK]      # |q|²·R v
    val = sum((n[i] * X[cand["top"]][i] for i in range(3)), KF(0))
    for f in range(4):
        if f == C.B2:
            continue
        wf = sum((n[i] * (C.BN[C.B2][i] - C.BN[f][i]) for i in range(3)), KF(0))
        val = val + wf * sum((X[cand["vs"][f]][i] * C.BN[f][i] for i in range(3)), KF(0)) / 4
    m = sum((n[i] * C.BN[C.B2][i] for i in range(3)), KF(0))
    kap = sum((n[i] * tb.kap[i] for i in range(3)), KF(0))
    return val - (m * C.c0() + kap) * Q


def t_R3X(npts=4):
    rng = random.Random(11)
    out = {}
    for nm in C.TUBES:
        tb = build_with_raw(nm)
        nbad = ntot = 0
        for c in tb.cands:
            for _ in range(npts):
                pt = (Fr(rng.randint(-64, 64), 512), Fr(rng.randint(-16, 16), 512), Fr(rng.randint(-16, 16), 512),
                      Fr(rng.randint(-16, 16), 512), Fr(rng.randint(-16, 16), 512))
                a = ev_p8(c["Praw"], pt); b = direct(tb, c, pt)
                ntot += 1; nbad += (a != b)
        out[nm] = dict(points=ntot, mismatch=nbad)
        print("R3X", nm, out[nm], flush=True)
        assert nbad == 0
    return out


def t_E0X():
    out = {}
    for nm in C.TUBES:
        tb = build_with_raw(nm)
        kp = C.kappa()
        cand = kp["candA"] if tb.side == "A" else kp["candB"]
        c = dict(top=cand[0], vs=cand[1])
        zs = []
        for i in range(9):
            u = tb.ulo + (tb.uhi - tb.ulo) * Fr(i, 8)
            zs.append(direct(tb, c, (u, Fr(0), Fr(0), Fr(0), Fr(0))).is_zero())
        out[nm] = dict(points=len(zs), exact_zero=sum(zs))
        print("E0X", nm, out[nm], flush=True)
        assert all(zs)
    return out


def t_X1():
    import d45x_dodintet_local as L
    with gzip.open(os.path.join(HERE, "d45x_dodintet_local.leaves.jsonl.gz"), "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f][1:]
    eps = Fr(1, 2 ** 100)
    out = {}
    for nm in C.TUBES:
        tb = L.Tube(nm)
        idx = {json.dumps(L.cand_key(c)): c for c in tb.cands}
        Qc = sum((t * t for t in tb.qc), KF(0))
        nt = nf = 0
        for r in lines:
            if r["c"] != nm or Fr(r["lo"][1]) != 0:
                continue
            c = idx[json.dumps(r["cand"])]
            lo = [Fr(x) for x in r["lo"]]; hi = [Fr(x) for x in r["hi"]]
            bad = False
            for uv in (lo[0], hi[0]):
                e = c["e0"][0] + c["e0"][1] * uv
                n = (KF(0) + tb.P0[0] + uv * tb.d[0], KF(0) + tb.P0[1] + uv * tb.d[1], KF(1))
                m = sum((n[i] * C.BN[C.B2][i] for i in range(3)), KF(0))
                if (e - m * eps * Qc).sign() < 0:
                    bad = True
            nt += 1; nf += bad
            if nt >= 300:
                break
        out[nm] = dict(tested=nt, fail_with_c0_plus_eps=nf)
        print("tX1", nm, out[nm], flush=True)
        assert nf > 0
    return out


def t_X2():
    k = C.kappa()["k"]; fc = C.far_consts()
    worst = KF(0)
    for x in (Fr(0), Fr(1)):
        for y in (Fr(-1), Fr(1)):
            v = abs((k[0] - fc["kr"][0]) * x + (k[1] - fc["kr"][1]) * y + (k[2] - fc["kr"][2]))
            worst = v if v > worst else worst
    res = dict(worst=float(worst), ETA=float(fc["ETA"]), ok=bool(worst <= fc["ETA"]))
    print("tX2", res, flush=True)
    assert res["ok"]
    return res


def t_chain():
    t0 = time.time()
    out = {}
    for nm, cmd in (("local", ["d45x_dodintet_local.py", "replay"]), ("far", ["d45x_dodintet_far.py", "replay_y", "--procs", "3"]),
                    ("upper", ["d45x_dodintet_upper.py"])):
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
    fn = os.path.join(HERE, "d45x_dodintet_tests.json")
    res = json.load(open(fn, encoding="utf-8")) if os.path.exists(fn) else {}
    for t in a.only.split(","):
        res[t] = dict(R3X=t_R3X, E0X=t_E0X, tX1=t_X1, tX2=t_X2, chain=t_chain)[t]()
        json.dump(res, open(fn, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
