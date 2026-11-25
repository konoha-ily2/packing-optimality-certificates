# D44 stages 0-1: a wrapper that runs the far-field tool (d16e_far) "without a local box (RHO0 = 0), with a target S-bar (rational, in units of S) given as an argument".
# Written by Claude (Opus 5.5), 2026-11-13. The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof.
# d16e_far.py, d16e_common.py and d30_far.py are not changed (the module values C.RHO0, F.QLAM and P.SSTAR are set from outside).
#
# What acceptance shows (P1): phi(R) >= S-bar on the whole box of A. The proof does not use what S-bar is (if S-bar > S* the run just does not close).
#   The need "S-bar >= S*" in d16e_far.check_box is a watchdog, so P.SSTAR := S-bar is put in to let it pass (SSTAR does not appear in the acceptance formula).
# T (P2): default_T(S-bar) and check_T(T, S-bar) depend only on S-bar and the radius of the inscribed sphere (S* is not used).
# Discarded boxes (P3): only the symmetry pair (g, k) and the comparison of tr (the position of R* is not used).
# L (P4): with RHO0 = 0, inside_L is always false (-0 <= lo and hi <= 0 does not happen for a box of positive width). The replay also requires L = 0.
#
# s-bar <-> S-bar: S = C0*s/sqrt(cedge2) (cedge2 = 1 for these 6 pairs). s-bar is a rational (k digits), S-bar := ceil(C0*s-bar*2^80)/2^80 (rational),
#   and S-bar >= C0*s-bar is checked exactly in QD. So if everything closes, S* >= S-bar >= C0*s-bar, i.e. s* >= s-bar.
#
# Usage:
#   python -X utf8 d44_far.py run <pair> --k 3 [--sbar fraction] [--wmin-exp 30] [--qlam-exp 24] [--max-boxes N] [--time-limit seconds] [--name name]
#   python -X utf8 d44_far.py replay <pair> --name name
#   <pair> is icoindod or cubinico (calibration), or cubindod, icoinico, dodindod, octinoct of d44 (d44_ is prepended inside)
import os, sys, json, time, math, argparse
from fractions import Fraction as Fr
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_problems as DP
DP.install()
import d16e_common as C
from d16e_common import QD, need
import d16e_far as F


def prob_name(pair):
    return "d44_" + pair if pair in DP.NEW else pair


def s_ref(pair):
    """Reference for truncating to k digits: for the calibration pairs the exact s*, for the d44 pairs s_up of d44_upper.json (a rational upper bound)."""
    if pair in DP.CALIB:
        P = F.setup(prob_name(pair))
        return Fr(0), P.SSTAR / P.C0          # (the rational reference is not used, QD)
    up = json.load(open(os.path.join(".", "d44_upper.json"), encoding="utf-8"))[pair]
    return Fr(up["s_up_rat"]), None


def sbar_of_k(pair, k):
    """s-bar := (the reference truncated at the 10^-k place) - 10^-k (rational)."""
    r, sq = s_ref(pair)
    if sq is not None:
        lo, hi = sq.bounds(200)
        x = Fr(lo, 2 ** 200)
    else:
        x = r
    return Fr(math.floor(x * 10 ** k), 10 ** k) - Fr(1, 10 ** k)


def S_of_sbar(P, sbar):
    need(P.CEDGE2 == 1, "only pairs with cedge2 = 1")
    X = P.C0 * QD(Fr(sbar))
    lo, hi = X.bounds(80)
    S = Fr(hi, 2 ** 80)
    need(QD(S) >= X, "S̄ ≥ C0·s̄")
    return S


def prepare(pair, sbar, qlam_exp):
    P = F.setup(prob_name(pair))
    C.RHO0 = Fr(os.environ.get("D44_RHO0", "0"))   # stage 3 (2026-11-14): only when the local box L is used, rho_0 is passed by the environment variable (default 0 = no local)
    F.QLAM = 2 ** qlam_exp
    S = S_of_sbar(P, sbar)
    P.SSTAR = QD(S)            # to pass the watchdog need (S-bar >= SSTAR). It does not enter the acceptance formula (P1)
    if os.environ.get("D44_LPFIX") == "1":       # for k >= 8: make the choice of multiplier candidates precise (d44_lpfix.py; acceptance is unchanged)
        import d44_lpfix; d44_lpfix.install()
    return P, S


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("pair")
    ap.add_argument("--k", type=int, default=None); ap.add_argument("--sbar", default=None)
    ap.add_argument("--name", default=None)
    ap.add_argument("--wmin-exp", type=int, default=30); ap.add_argument("--qlam-exp", type=int, default=None)
    ap.add_argument("--max-boxes", type=int, default=30_000_000); ap.add_argument("--time-limit", type=int, default=3 * 3600)
    a = ap.parse_args()
    if a.cmd == "replay":
        meta = json.load(open(f"{a.name}.json", encoding="utf-8"))
        prm = meta["params"]; ex = meta["d44"]
        P, S = prepare(a.pair, Fr(ex["sbar"]), int(math.log2(prm["QLAM"])))
        need(Fr(prm["Sbar"]) == S, "the S-bar of the record equals the S-bar rebuilt from s-bar")
        need(Fr(prm["RHO0"]) == 0, "RHO0 = 0 (no local)")
        t0 = time.time()
        n = F.replay(prob_name(a.pair), a.name)
        need(n["L"] == 0, "no L boxes (P4)")
        print(f"replay passed: {a.pair} s-bar = {ex['sbar']} ({float(Fr(ex['sbar'])):.12f}), {time.time()-t0:.0f} s", flush=True)
        return 0
    if a.sbar is not None:
        sbar = Fr(a.sbar); k = a.k
    else:
        need(a.k is not None, "--k or --sbar")
        sbar = sbar_of_k(a.pair, a.k); k = a.k
    qlam_exp = a.qlam_exp or max(24, 4 * (k or 6) + 12)
    P, S = prepare(a.pair, sbar, qlam_exp)
    name = a.name or f"d44_{a.pair}_k{k}"
    print(f"{a.pair}: k = {k}, s-bar = {sbar} ({float(sbar):.12f}), S-bar = {float(S):.15f}, QLAM = 2^{qlam_exp}, wmin = 2^-{a.wmin_exp}", flush=True)
    try:
        st = F.run(prob_name(a.pair), name, wmin_exp=a.wmin_exp, Sbar=S, max_boxes=a.max_boxes, time_limit=a.time_limit)
    except RuntimeError as e:
        print("stopped:", e, flush=True)
        json.dump(dict(pair=a.pair, k=k, sbar=str(sbar), stopped=str(e)), open(f"{name}.stopped.json", "w", encoding="utf-8"), ensure_ascii=False)
        return 3
    meta = json.load(open(f"{name}.json", encoding="utf-8"))
    meta["d44"] = dict(pair=a.pair, k=k, sbar=str(sbar), sbar_float=float(sbar), S_bar=str(S), qlam_exp=qlam_exp,
                       note="RHO0 = 0\uff08\u5c40\u6240\u306a\u3057\u3002\u76f4\u5217\u306e run \u3092 D44_RHO0 \u3064\u304d\u3067\u56de\u3057\u3066\u3082\u6ce8\u306f\u56fa\u5b9a\u3067\u3001\u5b9f\u969b\u306e\u5024\u306f params \u306e RHO0 \u304c\u6b63\uff09\u3001P.SSTAR := S̄\uff08\u898b\u5f35\u308a\uff09", lpfix=os.environ.get("D44_LPFIX") == "1")
    json.dump(meta, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    return 0 if st["closed"] else 2


if __name__ == "__main__":
    sys.exit(main())
