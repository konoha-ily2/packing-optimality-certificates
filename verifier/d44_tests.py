# Tests for D44 stage 1 (floating point, not used for acceptance). 2026-11-13, written by Claude (Opus 5.5).
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
#   W: (points with rho < 1e-6 use the exact phi_exact. A3d') 300 random points (100 uniform on the sphere, 100 each with |p| = 1e-2 and 1e-3 around R-hat): floating-point phi(R) >= S-bar (the largest closed k of the record).
#   Check of R-hat: the difference of floating-point phi(I) (with the rotated piece) from s_up and the KKT s*.
#   rev (J1, 2026-11-14): a test of points in the reverse direction. With s-bar' := s_up + 10^-k (k = the largest closed k of the record), boxes containing R-hat (the origin of map 0) must be rejected.
#     (a) Of the accepted boxes of the record, those containing the origin (boundary included) (the 8 smallest) are run through check_box again with s-bar' and all must be False (control: True with s-bar).
#     (b) Boxes centered at the origin with half-widths 2^-34 and 2^-38 (DEN units), with the LP multipliers: True with s-bar (control), False with s-bar'.
#     Since phi(R-hat) <= s_up < s-bar', a check_box that accepted a box containing R-hat with s-bar' would be a hole in soundness. Faster than a run over all boxes (seconds), and independent of timeouts.
# Usage: python -X utf8 d44_tests.py <pair>   -> appended to d44_tests.json (both W and rev. A separate process for each pair)
import os, sys, json, math
from fractions import Fraction as Fr
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
import d16e_far as F


def testW(pair, npts=300, seed=20261114):
    P = F.setup("d44_" + pair)
    bj = json.load(open(os.path.join(".", f"d44_{pair}_batch.json"), encoding="utf-8"))
    ks = [int(k) for k, v in bj["runs"].items() if v.get("closed") and v.get("replay_ok")]
    k = max(ks)
    st = json.load(open(os.path.join(".", f"d44_{pair}_k{k}.json"), encoding="utf-8"))
    Sbar = float(Fr(st["d44"]["S_bar"]))
    rng = np.random.default_rng(seed)
    out = dict(pair=pair, k=k, sbar=st["d44"]["sbar"], groups={})
    phiI = F.lp_f(np.eye(3))[0]
    out["phi_I_float_s"] = phiI / float(P.C0)
    for lab, n, scale in (("uniform", npts // 3, None), ("p=1e-2", npts // 3, 1e-2), ("p=1e-3", npts - 2 * (npts // 3), 1e-3)):
        viol = 0; mn = math.inf
        for _ in range(n):
            if scale is None:
                q = rng.normal(size=4)
            else:
                d = rng.normal(size=3); d /= np.linalg.norm(d)
                q = np.concatenate([[1.0], scale * d])
            R = C.rot_f(q)
            if np.linalg.norm(q[1:]) < 1e-6 * abs(q[0]):   # for small rho (< 1e-6) the tolerance of HiGHS matters, so use the exact phi_exact (A3d')
                v = float(P.phi_exact(C.rot_exact([Fr(float(x)) for x in q]))[0])
            else:
                v = F.lp_f(R)[0]
            mn = min(mn, v - Sbar)
            viol += v < Sbar - 1e-12
        out["groups"][lab] = dict(n=n, violations=int(viol), min_phi_minus_Sbar=mn)
    return out


def testRev(pair):
    import gzip
    import d44_far as DF
    bj = json.load(open(os.path.join(".", f"d44_{pair}_batch.json"), encoding="utf-8"))
    k = max(int(k) for k, v in bj["runs"].items() if v.get("closed") and v.get("replay_ok"))
    st = json.load(open(os.path.join(".", f"d44_{pair}_k{k}.json"), encoding="utf-8"))
    ex = st["d44"]
    if ex.get("lpfix"):
        os.environ["D44_LPFIX"] = "1"
    up = json.load(open(os.path.join(".", "d44_upper.json"), encoding="utf-8"))[pair]
    sbar = Fr(ex["sbar"]); sbar2 = Fr(up["s_up_rat"]) + Fr(1, 10 ** k)
    qexp = ex["qlam_exp"]; T = Fr(st["params"]["T"])
    P, S = DF.prepare(pair, sbar, qexp)
    need_ = C.need
    need_(Fr(st["params"]["Sbar"]) == S, "S-bar of the record")
    boxes = []
    with gzip.open(os.path.join(".", f"d44_{pair}_k{k}.boxes.jsonl.gz"), "rt", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            if r["k"] == "A" and r["c"] == 0 and all(l <= 0 <= h for l, h in zip(r["lo"], r["hi"])):
                boxes.append(r)
    boxes.sort(key=lambda r: r["hi"][0] - r["lo"][0])
    boxes = boxes[:8]
    ctrl_a = [F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], S, T)[0] for r in boxes]
    fresh = []
    for e in (34, 38):
        w = C.DEN >> e
        lo, hi = [-w] * 3, [w] * 3
        v, lam, mu, verts = F.lp_f(np.eye(3))
        L, M = F.round_mult(lam, mu)
        fresh.append(dict(half_width_exp=-e, lo=lo, hi=hi, L=L, M=M, verts=verts,
                          accept_sbar=F.check_box(0, lo, hi, L, M, verts, S, T)[0]))
    P, S2 = DF.prepare(pair, sbar2, qexp)
    T2 = P.default_T(S2)
    rev_a = [F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], S2, T2)[0] for r in boxes]
    for fb in fresh:
        fb["accept_sbar_prime"] = F.check_box(0, fb["lo"], fb["hi"], fb["L"], fb["M"], fb["verts"], S2, T2)[0]
    out = dict(pair=pair, k=k, sbar=str(sbar), sbar_prime=str(sbar2), sbar_prime_float=float(sbar2),
               a_n_boxes=len(boxes), a_widths_exp=[round(math.log2((r["hi"][0] - r["lo"][0]) / C.DEN), 1) for r in boxes],
               a_accept_sbar=ctrl_a, a_accept_sbar_prime=rev_a,
               b=[dict(half_width_exp=fb["half_width_exp"], accept_sbar=fb["accept_sbar"], accept_sbar_prime=fb["accept_sbar_prime"]) for fb in fresh])
    out["ok"] = (len(boxes) == 8 and all(ctrl_a) and not any(rev_a)
                 and all(fb["accept_sbar"] and not fb["accept_sbar_prime"] for fb in fresh))
    return out


if __name__ == "__main__":
    pair = sys.argv[1]
    path = os.path.join(".", "d44_tests.json")
    res = json.load(open(path, encoding="utf-8")) if os.path.exists(path) else {}
    res[pair] = testW(pair)
    res[pair]["rev"] = testRev(pair)
    print(json.dumps(res[pair], ensure_ascii=False, indent=1))
    if not res[pair]["rev"]["ok"]:
        print("the test of reverse-direction points is not as expected"); json.dump(res, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1); sys.exit(1)
    json.dump(res, open(path, "w", encoding="utf-8"), ensure_ascii=False, indent=1)
