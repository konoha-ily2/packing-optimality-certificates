# D40 step 3: tests (tetintet_n02, route Y).
# 2026-11-13, written by Claude (Opus 5.5). The argument, the code and the tests were written by Claude; no third-party review; not a formal proof.
#   W  : random points in the 7 local regions (R with s₁ ≤ s̄): G̃ ∓ κ ≥ 0 (floating point). The minimum of the ratio (G̃ ∓ κ)/r is recorded too.
#   t1 : with the sign of μ reversed (weights n·(b₂−b_f) − μ), "candidate formula ≤ G̃" fails at random points with Š ≤ 0 (with +μ it does not).
#   t2 : without the proviso on s₁, (K) fails: near T_S every point with G̃ − κ < 0 has s₁ > s̄. Discarding the points with s̄ − 1/100 ≤ s₁ by type S would be wrong (negative points remain).
#   t3 : with T_S′ removed from L, the far R tree does not close on an n box inside N₁.
#   t4 : with one P_g removed, it does not close on an n box near n_B.
#   t5 : with s̄ replaced by s₀ + 10⁻⁶, the order-0 part of T_S (e_c ≥ 0) fails for every candidate.
#   t6 : if k_N of a box meeting N₁ is made nonzero in the far record, the replay fails.
#   L1 : the centre (n, q) of every sampled L leaf of the far record lies in some leaf of the local record (exact).
#   R3 : (fix of review Q86, Q87) compare, with Fraction, the local c["P"] (sympy expansion) = |q|²·(gtilde_cand_exact + signed κ term) = far cand_forms (k_N = 0)
#        at random rational points, for all centres and all candidates (F, M, S). If a single point differs it stops with "needs a decision: R3 mismatch".
#   chain: (fix R4 of review Q86, Q87) run the local replay → the far replay → the assert of the upper bound in a row and print one pass/fail line (replays about 3 min in all).
#        The claim holds when all 3 pass. The record json files are not rewritten.
# Run it in the directory that holds the records (d40_local.*, d40_far.*, d40_upper.json); d40_tests.json and the temporary file of t6 are written there.
# Usage: python -X utf8 d40_tests.py [--only W,t1,...,R3,chain] (default W..L1; R3 and chain only with --only)
import sys, os, json, gzip, time, math, argparse, itertools
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d40_common as C

RES = {}


def rot_near(qc, p):
    q = C.qmul(tuple(float(t) for t in qc), (1.0, *p))
    return C.rot_f(q)


def kap(h, k):
    a0, a1, b = C.kappa_coefs()
    return float(a0) + float(a1) * h + float(b) * k


def test_W(npts=4000, seed=0):
    rng = np.random.default_rng(seed)
    s = float(C.S_BAR)
    out = {}
    for nm, side, q, kind in C.centers():
        neg = 0; mn = 1e9; mnr = 1e9; cnt = 0
        for _ in range(npts):
            r = rng.uniform(0, float(C.R0)) * rng.choice([1.0, 0.1, 0.01])
            p = rng.uniform(-r, r, 3)
            if kind == "tube":
                h = rng.uniform(0, float(C.H_MAX)); k = rng.uniform(0, r)
            else:
                h = rng.uniform(0, r); k = rng.uniform(0, r)
            R = rot_near(q, p)
            if C.Sch_f(R, s) > 0:
                continue
            cnt += 1
            n = C.n_A(h, k) if side == "A" else C.n_B(h, k)
            g = C.Gt_f(n, R, s) + (-kap(h, k) if side == "A" else kap(h, k))
            rr = max(abs(k), *np.abs(p), h if kind == "point" else 0)
            mn = min(mn, g); mnr = min(mnr, g / max(rr, 1e-300))
            neg += g < -1e-12
        out[nm] = dict(points=cnt, negative=int(neg), min=mn, min_ratio=mnr)
        print("W", nm, out[nm], flush=True)
    RES["W"] = out


def cand_expr(n, R, s, mu_signed):
    """Candidate (the largest vertices at the centre) with weights n·(b₂−b_f) + mu_signed."""
    X = C.VTF @ R.T
    top = (X @ n).max()
    H = (X @ C.BF.T).max(0)
    w = n @ (C.B2 - C.BF).T + mu_signed
    return top + 0.25 * (w * H).sum() - 0.5 * s * (n @ C.B2) - 0.5 * mu_signed * s


def test_t1(npts=20000, seed=1):
    rng = np.random.default_rng(seed)
    s = float(C.S_BAR)
    qS = C.centers()[0][2]
    viol = {+1: 0, -1: 0}; cnt = 0
    for _ in range(npts):
        p = rng.uniform(-0.05, 0.05, 3); R = rot_near(qS, p)
        if C.Sch_f(R, s) > 0:
            continue
        cnt += 1
        h = rng.uniform(0, 0.375); k = rng.uniform(0, 0.05)
        n = np.array(C.n_A(h, k))
        g = C.Gt_f(n, R, s)
        for sg in (1, -1):
            if cand_expr(n, R, s, sg * 12.0) > g + 1e-12:
                viol[sg] += 1
    RES["t1"] = dict(points=cnt, violations_correct_sign=viol[1], violations_reversed_sign=viol[-1], expected="correct 0, reversed > 0",
                     passed=(viol[1] == 0 and viol[-1] > 0))
    print("t1", RES["t1"], flush=True)


def test_t2(npts=40000, seed=2):
    rng = np.random.default_rng(seed)
    s = float(C.S_BAR)
    qS = C.centers()[0][2]
    neg_ok = 0; neg_bad = 0; neg_window = 0
    for _ in range(npts):
        p = rng.uniform(-0.03, 0.03, 3); R = rot_near(qS, p)
        h = rng.uniform(0, 0.375); k = rng.uniform(0, 0.03)
        g = C.Gt_f(C.n_A(h, k), R, s) - kap(h, k)
        if g < -1e-12:
            s1 = C.s1_f(R)
            if s1 <= s:
                neg_bad += 1
            else:
                neg_ok += 1
                if s1 <= s + 0.01:
                    neg_window += 1
    RES["t2"] = dict(negative_points_s1_le_sbar=neg_bad, negative_points_s1_gt_sbar=neg_ok, of_which_s1_within_0_01_of_sbar=neg_window,
                     expected="no negative point with s1 <= sbar, some negative points with s1 in (sbar, sbar+0.01] (= the rule 'discard above sbar - 1/100' would hide failures of (K))",
                     passed=(neg_bad == 0 and neg_window > 0))
    print("t2", RES["t2"], flush=True)


def test_t5():
    import mpmath as mp
    import d40_local as LO
    s_bad = C.S_BAR  # for the record
    cen = [c for c in C.centers() if c[0] == "T_S"][0]
    # replace s by s₀ + 1e−6 and evaluate the order-0 part of the T_S candidates (h = 0.1)
    s0 = 1.9535642445615807029 + 1e-6
    R = C.rot_f(cen[2])
    vals = []
    X = C.VTF @ R.T
    tiesH = [[i for i in range(4) if (X @ C.BF[f])[i] >= (X @ C.BF[f]).max() - 1e-6] for f in range(4)]
    for top in range(4):
        for vs in itertools.product(*tiesH):
            n = np.array(C.n_A(0.1, 0.0))
            val = n @ X[top] + 0.25 * sum((n @ (C.B2 - C.BF[f])) * (C.BF[f] @ X[vs[f]]) for f in range(4) if f != 2) \
                - 0.5 * s0 * (n @ C.B2) - kap(0.1, 0.0)
            vals.append(val)
    # κ was fixed with s̄. What happens to the order-0 part when s changes (if κ is also refitted with s, the sum of the 2 is −δ'·(m̃+m̃σ)/2 < 0)
    eB = C.Gt_f(C.n_B(0.1, 0.0), np.eye(3), s0) + kap(0.1, 0.0)
    best = max(vals)
    RES["t5"] = dict(T_S_max_order0_of_candidates=best, T_C_order0=eB, sum=best + eB, expected="sum < 0 (one side is negative however kappa is split)", passed=(best + eB < 0))
    print("t5", RES["t5"], flush=True)


def far_box_test(side, nlo, nhi, drop, budget=60000):
    import d40_far as F
    K = F.consts()
    full = list(K["cen"])
    K["cen"] = [c for c in full if c[0] not in drop]
    try:
        leaves, ev = F.rtree(side, nlo, nhi, Fr(0), budget, 18, True)
    finally:
        K["cen"] = full
    return leaves is not None, ev


def test_t3_t4():
    import d40_far as F
    ND = F.ND
    out = {}
    nb = ([ND // 8, 0], [ND // 8 + ND // 64, ND // 64])                      # h ∈ [1/8, 9/64], k′ ∈ [0, 1/64] ⊂ N₁
    ok_full, ev_full = far_box_test("A", *nb, drop=())
    ok_drop, ev_drop = far_box_test("A", *nb, drop=("T_S'",))
    out["t3"] = dict(box=[[x / ND for x in nb[0]], [x / ND for x in nb[1]]], closed_with_all=ok_full, evaluated=ev_full, closed_without_T_S2=ok_drop, evaluated_without=ev_drop,
                     passed=(ok_full and not ok_drop))
    print("t3", out["t3"], flush=True)
    nb2 = ([0, 0], [ND // 64, ND // 64])
    ok_full, ev_full = far_box_test("A", *nb2, drop=())
    res4 = {}
    for g in ("P_23", "P_13", "P_cyc1", "P_cyc2"):
        okd, evd = far_box_test("A", *nb2, drop=(g,))
        res4[g] = dict(closed=okd, evaluated=evd)
        print("t4", g, res4[g], flush=True)
    out["t4"] = dict(box=[[0, 0], [1 / 64, 1 / 64]], closed_with_all=ok_full, evaluated=ev_full, when_dropped=res4,
                     passed=(ok_full and not any(v["closed"] for v in res4.values())))
    print("t4", out["t4"], flush=True)
    RES.update(out)


def test_t6(name="d40_far"):
    import d40_far as F
    fn = f"{name}.boxes.jsonl.gz"
    with gzip.open(fn, "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    # pick one ok box meeting N₁ and replay a record in which its k_N is set to −1/2^10
    for r in lines[1:]:
        if r["kind"] == "ok" and F.n_overlaps_N1(r["lo"], r["hi"]):
            r["kN"] = [-1, 1024]; tgt = (r["lo"], r["hi"]); break
    bad = os.path.join(".", "d40_test_t6")
    with gzip.open(bad + ".boxes.jsonl.gz", "wt", encoding="utf-8") as f:
        for r in lines:
            f.write(json.dumps(r) + "\n")
    try:
        F.replay(bad); res = "passed (opposite of expected)"; ok = False
    except RuntimeError as e:
        res = f"failed: {e}"; ok = True
    os.remove(bad + ".boxes.jsonl.gz")
    RES["t6"] = dict(modified_box=tgt, result=res, passed=ok)
    print("t6", RES["t6"], flush=True)


def test_L1(far="d40_far", loc="d40_local", nsamp=400, seed=3):
    """Whether the centres of the L leaves of the far record lie in leaves of the local record (exact)."""
    import d40_far as F
    rng = np.random.default_rng(seed)
    with gzip.open(f"{loc}.leaves.jsonl.gz", "rt", encoding="utf-8") as f:
        ll = [json.loads(s) for s in f][1:]
    byc = {}
    for r in ll:
        byc.setdefault(r["c"], []).append(([Fr(x) for x in r["lo"]], [Fr(x) for x in r["hi"]]))
    Ls = []
    with gzip.open(f"{far}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        f.readline()
        for s in f:
            r = json.loads(s)
            if r["kind"] != "ok":
                continue
            for rc in r["recs"]:
                for lf in rc["leaves"]:
                    if lf[3] == "L":
                        Ls.append((r["lo"], r["hi"], rc["side"], lf))
    idx = rng.choice(len(Ls), size=min(nsamp, len(Ls)), replace=False)
    cen = {c[0]: c for c in C.centers()}
    found = 0; miss = []
    for i in idx:
        nlo, nhi, side, lf = Ls[i]
        h = Fr(nlo[0] + nhi[0], 2 * F.ND); k = Fr(nlo[1] + nhi[1], 2 * F.ND)
        ch, lo, hi, _, nm = lf
        q = [Fr(a + b, 2) for a, b in zip(lo, hi)]; q.insert(ch, Fr(F.DEN))
        qc = cen[nm][2]
        w = C.qmul((qc[0], -qc[1], -qc[2], -qc[3]), tuple(q))
        p = [w[i_] / w[0] for i_ in (1, 2, 3)]
        if cen[nm][3] == "tube":
            z = [k] + p; base = [h]
        else:
            z = [h, k] + p; base = []
        r_ = max(abs(x) for x in z)
        zh = [x / r_ for x in z]
        pt = base + [r_] + zh
        ok = any(all(a <= v <= b for a, v, b in zip(lo_, pt, hi_)) for lo_, hi_ in byc[nm])
        found += ok
        if not ok:
            miss.append(nm)
    RES["L1"] = dict(L_leaves=len(Ls), checked=len(idx), inside_local_leaves=found, not_inside=miss[:10], passed=(found == len(idx)))
    print("L1", RES["L1"], flush=True)


def test_R3(npts=8, seed=5):
    """Compare the local c["P"] = the exact formula = the far cand_forms at rational points, with Fraction."""
    import random
    import d40_local as LO
    import d40_far as F
    rnd = random.Random(seed)
    s = C.S_BAR
    a0, a1, beta = C.kappa_coefs()
    ngrid = 64
    rfr = lambda lo, hi: Fr(rnd.randint(int(lo * ngrid), int(hi * ngrid)), ngrid)
    total = 0; nbad = 0; first = None
    per = {}
    for nm, side, qc, kind in C.centers():
        cen = LO.Center(nm, side, qc, kind)
        cnt = 0
        for _ in range(npts):
            h = rfr(0, 1); k = rfr(0, 1)
            p = [Fr(rnd.randint(-8, 8), 32) for _ in range(3)]
            q = C.qmul(tuple(qc), (Fr(1), *p))
            Q = sum(t * t for t in q)
            R = C.rot_fr(q)
            n = C.n_A(h, k) if side == "A" else C.n_B(h, k)
            kapt = a0 + a1 * h + beta * k
            sg = -1 if side == "A" else 1
            M = C.Mq(*q)
            X = [[sum(R[i][j] * Fr(C.VT[v][j], 2) for j in range(3)) for i in range(3)] for v in range(4)]
            dot = lambda a, b: sum(x * y for x, y in zip(a, b))
            hkp = (h, k, *p)
            for c in cen.cands:
                vs = tuple(0 if v is None else v for v in c["vs"])
                # local
                loc = Fr(0)
                for m, cf in c["P"].items():
                    t = cf
                    for x, e in zip(hkp, m):
                        if e:
                            t *= x ** e
                    loc += t
                # exact formula
                if c["type"] == "S":
                    ex = Q * (sum(dot(C.BS[f], X[vs[f]]) for f in range(4)) - 2 * s)
                    fc = ("S", None, None, vs)
                else:
                    ex = Q * (C.gtilde_cand_exact(n, R, s, c["mu"], (c["top"],) + vs) + sg * kapt)
                    fc = (c["type"], c["mu"], c["top"], vs)
                # far (k_N = 0)
                L = F.cand_forms(side, fc, Fr(0))
                far = Fr(0)
                for key, f in L.items():
                    cof = f[0] + f[1] * h + f[2] * k
                    far += cof * (Q if key == "Q" else M[key[0]][key[1]])
                total += 1; cnt += 1
                if not (loc == ex == far):
                    nbad += 1
                    if first is None:
                        first = dict(center=nm, side=side, candidate=[c["type"], c["mu"], c["top"], list(c["vs"])], point=[str(x) for x in hkp],
                                     local=str(loc), exact=str(ex), far=str(far), local_float=float(loc), exact_float=float(ex), far_float=float(far))
        per[nm] = cnt
        print("R3", nm, "candidates", len(cen.cands), "points", npts, "compared", cnt, "mismatches so far", nbad, flush=True)
    RES["R3"] = dict(compared=total, mismatches=nbad, per_center=per, first_mismatch=first, passed=(nbad == 0))
    if nbad:
        print("needs a decision: R3 mismatch", first, flush=True)
        raise SystemExit(3)
    print(f"R3 passed: {total} pairs (local = exact = far, Fraction)", flush=True)


def test_chain():
    """Run the local replay → the far replay → the assert of the upper bound in a row; one pass/fail line."""
    import d40_local as LO
    import d40_far as F
    import d40_upper as U
    # the replays use file names relative to the current directory (the directory that holds the records)
    t0 = time.time(); steps = []
    try:
        LO.replay("d40_local"); steps.append(("local replay", round(time.time() - t0)))
        t1 = time.time(); F.replay("d40_far"); steps.append(("far replay", round(time.time() - t1)))
        t2 = time.time()
        up = os.path.join(".", "d40_upper.json"); keep = open(up, "rb").read()
        try:
            U.main()                    # rewrites d40_upper.json (the record), so the original bytes are put back afterwards
        finally:
            open(up, "wb").write(keep)
        steps.append(("upper-bound assert", round(time.time() - t2)))
        ok = True; why = ""
    except Exception as e:             # AssertionError, RuntimeError
        ok = False; why = f"{type(e).__name__}: {e}"
    line = ("chain passed: " if ok else "chain FAILED: ") + ", ".join(f"{a} done ({b} s)" for a, b in steps) + (why and ", " + why) + f", total {time.time()-t0:.0f} s"
    RES["chain"] = dict(passed=ok, steps=steps, reason=why)
    print(line, flush=True)
    if not ok:
        raise SystemExit(4)


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("--only", default="W,t1,t2,t3,t4,t5,t6,L1")   # R3 and chain only with --only
    a = ap.parse_args()
    t0 = time.time()
    todo = a.only.split(",")
    if "W" in todo: test_W()
    if "t1" in todo: test_t1()
    if "t2" in todo: test_t2()
    if "t5" in todo: test_t5()
    if "t3" in todo or "t4" in todo: test_t3_t4()
    if "t6" in todo: test_t6()
    if "L1" in todo: test_L1()
    if "R3" in todo: test_R3()
    if "chain" in todo: test_chain()
    RES["seconds"] = round(time.time() - t0, 1)
    if not (set(todo) & {"W", "t1", "t2", "t3", "t4", "t5", "t6", "L1"}):
        print("the older tests were not run, so d40_tests.json (the record) is not rewritten", RES); sys.exit(0)
    fn = os.path.join(".", "d40_tests.json")
    old = json.load(open(fn, encoding="utf-8")) if os.path.exists(fn) else {}
    old.update(RES)
    json.dump(old, open(fn, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print("wrote", fn)
