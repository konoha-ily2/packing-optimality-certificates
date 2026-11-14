# Q70 step (3) tests: that the local lemma (d37_tet_n05_local) is not vacuous and that the formulas are correct.
# 2026-11-13 night, written by Claude (Opus 5.5). The arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#   W   : at random points of the 5 local regions (on side A only points with Š ≤ 0), the true F̃ ∓ κ̃ (floating point) is not negative.
#   R3  : for all centres and all candidates, the candidate polynomial P_c/|q|² is at most "the true G̃_μ (F̃ + (μ/4)Š ∓ κ̃, for type S it is Š)" (random rational points, exact).
#   tb  : if β is put outside the window (−1, −9/4), T_S or T_C does not close.
#   ts  : if s₀ is put at 2 + 1/1000, T_S does not close (the order 0 is negative).
# Usage: python -X utf8 d37_tet_n05_tests.py [--only W,R3,tb,ts]
import sys, os, json, time, argparse, random
from fractions import Fraction as Fr
import numpy as np

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d37_tet_n05_common as C
import d37_tet_n05_local as L


def rand_point(cen, rnd, exact=False):
    """A point (a, b, p) of the local region. Tube: a ∈ [0, A_MAX], b ∈ [0, r₀], |p_i| ≤ r₀. Point: a, b ∈ [0, r₀]."""
    if exact:
        u = lambda lo, hi: lo + (hi - lo) * Fr(rnd.randint(0, 10 ** 6), 10 ** 6)
        r0 = C.R0; amax = C.A_MAX
    else:
        u = lambda lo, hi: lo + (hi - lo) * rnd.random()
        r0 = float(C.R0); amax = float(C.A_MAX)
    a = u(0, amax) if cen.kind == "tube" else u(0, r0)
    b = u(0, r0)
    p = [u(-r0, r0) for _ in range(3)]
    if rnd.random() < 0.2:       # the rotation stays at the centre (a point with Š = 0. P2 is the V-shaped minimum of s₁, and rotating makes Š almost > 0)
        p = [0 * x for x in p]
    if rnd.random() < 0.3:       # more points where the lateral part is small
        sc = (Fr(1, 64) if exact else 1 / 64)
        b = b * sc; p = [x * sc for x in p]
        if cen.kind == "point":
            a = a * sc
    return a, b, p


def true_parts(cen, a, b, p):
    q = C.qmul(tuple(cen.q), (1, p[0], p[1], p[2]))
    n = C.n_A(a, b) if cen.side == "A" else C.n_B(a, b)
    return q, n


def test_W(cens, nper=20000, seed=1):
    rnd = random.Random(seed)
    a0, a1, beta = [float(x) for x in C.kappa_coefs()]
    out = {}
    for cen in cens:
        neg = 0; used = 0; worst = None
        for _ in range(nper):
            a, b, p = rand_point(cen, rnd)
            q, n = true_parts(cen, a, b, p)
            R = C.rot_f(q)
            if cen.side == "A" and C.Sch_f(R) > 0:
                continue
            used += 1
            kap = a0 + a1 * a + beta * b
            g = C.Ft_f(n, R) + (-kap if cen.side == "A" else kap)
            r = max(abs(b), max(abs(x) for x in p), abs(a) if cen.kind == "point" else 0)
            if g < -1e-12:
                neg += 1
            if r > 1e-6:
                ratio = g / r
                if worst is None or ratio < worst:
                    worst = ratio
        out[cen.name] = dict(points=used, negative=neg, min_ratio=worst)
        print(f"[W] {cen.name}: points {used}, negative {neg}, minimum of (G̃ ∓ κ)/r {worst}", flush=True)
    return out


def poly_val(P, x):
    v = Fr(0)
    for m, cf in P.items():
        t = cf
        for xi, e in zip(x, m):
            if e:
                t *= xi ** e
        v += t
    return v


def test_R3(cens, nper=60, seed=2):
    """Candidate formula ≤ true value (exact). True value: for types F, M it is F̃ + (μ/4)Š ∓ κ̃ (Š from H̃'), for type S it is Š."""
    rnd = random.Random(seed)
    a0, a1, beta = C.kappa_coefs()
    out = {}
    for cen in cens:
        bad = 0; cnt = 0
        for _ in range(nper):
            a, b, p = rand_point(cen, rnd, exact=True)
            q, n = true_parts(cen, a, b, p)
            Q = sum(t * t for t in q)
            R = C.rot_fr(q)
            Ft = C.Ft_exact(n, R)
            S = C.Sch_exact(R)
            kap = a0 + a1 * a + beta * b
            x = (a, b, p[0], p[1], p[2])
            for c in cen.cands:
                v = poly_val(c["P"], x) / Q
                if c["type"] == "S":
                    tv = S
                else:
                    tv = Ft + Fr(c["mu"], 4) * S + (-kap if cen.side == "A" else kap)
                cnt += 1
                if v > tv:
                    bad += 1
        out[cen.name] = dict(checks=cnt, violations=bad)
        print(f"[R3] {cen.name}: numbers compared {cnt}, candidate formula > true value {bad}", flush=True)
    return out


def test_tb():
    out = {}
    for beta, nm in ((Fr(-1), "T_S"), (Fr(-9, 4), "T_C")):
        old = C.BETA
        C.BETA = beta; C._CACHE.pop("kap", None)
        cen = [c for c in L.build_centers([nm])][0]
        r = L.run_center(cen, wmin=Fr(1, 2 ** 12), time_limit=240, quiet=True)
        out[f"{nm} β={beta}"] = dict(closed=r["closed"], nfail=r["nfail"], timeout=r.get("timeout", False), ev=r["ev"])
        print(f"[tb] β = {beta}, {nm}: closed {r['closed']}, limit {r['nfail']}, timeout {r.get('timeout', False)}, evaluations {r['ev']}", flush=True)
        C.BETA = old; C._CACHE.pop("kap", None)
    return out


def test_ts():
    old = C.S0
    C.S0 = Fr(2) + Fr(1, 1000)
    cen = L.build_centers(["T_S"])[0]
    r = L.run_center(cen, wmin=Fr(1, 2 ** 12), time_limit=240, quiet=True)
    C.S0 = old
    print(f"[ts] s₀ = 2 + 1/1000, T_S: closed {r['closed']}, limit {r['nfail']}, timeout {r.get('timeout', False)}, evaluations {r['ev']}", flush=True)
    return dict(closed=r["closed"], nfail=r["nfail"], timeout=r.get("timeout", False), ev=r["ev"])


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--only", default="W,R3,tb,ts")
    ap.add_argument("--out", default=os.path.join(".", "d37_tet_n05_tests.json"))
    a = ap.parse_args()
    only = a.only.split(",")
    t0 = time.time()
    res = {}
    if "W" in only or "R3" in only:
        cens = L.build_centers()
        if "W" in only:
            res["W"] = test_W(cens)
        if "R3" in only:
            res["R3"] = test_R3(cens)
    if "tb" in only:
        res["tb"] = test_tb()
    if "ts" in only:
        res["ts"] = test_ts()
    res["sec"] = time.time() - t0
    json.dump(res, open(a.out, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"[end] {res['sec']:.0f} s")
