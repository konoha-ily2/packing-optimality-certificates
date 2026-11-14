# D30 stage 3: re-checks the basis of the octinico claim in one program (review items H1 and W4 of FD_d30s3_review). 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. The counterpart of d30_claim.py of stage 2.
#
# What is checked (if any one fails, it stops with an exception and no pass is written):
#   1. local record: no fault, no no_lift variant, no S* shift, scale 1, DEN agrees, closed,
#      d30_s3_local.verify (tube numbers, RHO0 and candidate table agree, every box redone by check_single / check_mix, leaves of the binary trees and the sum of volumes on all 4 sides)
#   2. far record: closed, X 0, LP failures 0, d30_s3_far.replay (tube numbers agree, cover_check, accepted / discarded / tube boxes redone)
#   3. seam: the tube numbers (TC, TW, RHO0, n, e1, e2, TAU0) of both records are the same and also equal those of the current files.
#      replay redoes exactly "the 8 corners are inside the tube" for the L boxes of the far part. The local part covers the whole tube {τ ∈ [TC−TW, TC+TW], |y1|,|y2| ≤ ρ0}
#      ("sum of the volumes of the L boxes = (2ρ0)³" of stage 2 is not used, since the tube is slanted. It suffices that the L boxes are inside the tube).
#   4. W4: writes to the output whether the SHA-256 of the code that made the record equals the current files (a mismatch does not fail, since acceptance is redone with the current code).
#
# Usage: python -X utf8 d30_s3_claim.py [local record=d30_s3_octinico_local.json] [far name=d30_s3_octinico_far]
#        → d30_s3_octinico_claim.json
import sys, json, time, os, hashlib
from fractions import Fraction as Fr
import d30_s3_local as SL
import d30_s3_far as SF
import d16e_common as C
from d16e_common import need

LOCAL = sys.argv[1] if len(sys.argv) > 1 else "d30_s3_octinico_local.json"
FAR = sys.argv[2] if len(sys.argv) > 2 else "d30_s3_octinico_far"
t0 = time.time()
here = os.path.dirname(os.path.abspath(__file__))

lst = json.load(open(LOCAL, encoding="utf-8"))
fst = json.load(open(f"{FAR}.json", encoding="utf-8"))
lp, fp = lst["params"], fst["params"]

# 1. assumptions of the local record
need(lp["problem"] == "octinico" and fp["problem"] == "octinico", "problem")
need(lp.get("fault") in (None, "None"), "local: no fault")
need(lp.get("sstar") in (None, "None"), "local: no S* shift")
need(Fr(lp["scale"]) == 1 and Fr(fp["scale"]) == 1, "scale = 1")
need(lp["DEN_exp"] == C.KDEN and fp["DEN_exp"] == C.KDEN, "DEN")
need(lst["closed"] is True, "local: closed")
# 2. assumptions of the far record
need(fst["closed"] is True and fst["X"] == 0 and fst["lp_fail"] == 0, "far: closed, limit 0, LP failures 0")
# 3. tube numbers
tp = SL.tube_params()
need(lp["tube"] == tp and fp["tube"] == tp, "the tube numbers of both records equal those of the current files")
need(Fr(lp["RHO0"]) == SL.RHO0 and Fr(fp["RHO0"]) == SL.RHO0, "RHO0 of both records = ρ0 of the tube")

print("local verify ...", flush=True)
v = SL.verify(LOCAL, quiet=True)
need(v["all_passed"] and not v["bad"], "local: every box passed")
nloc = {k: dict(boxes=f["boxes"], kinds=f["kinds"]) for k, f in v["faces"].items()}
print("far replay ...", flush=True)
r = SF.replay(FAR)
need(r["bad"] == 0 and r["X"] == 0, "far: failures 0, limit 0")

# 4. version (W4)
sha_now = {}
for fn in lp.get("sha256_s3", {}):
    with open(os.path.join(here, fn), "rb") as fh:
        sha_now[fn] = hashlib.sha256(fh.read()).hexdigest()
sha_cmp = {fn: ("\u4e00\u81f4" if sha_now[fn] == h else "\u9055\u3046\uff08\u53d7\u7406\u306f\u4eca\u306e\u30b3\u30fc\u30c9\u3067\u3084\u308a\u76f4\u3057\u305f\uff09") for fn, h in lp.get("sha256_s3", {}).items()}  # values "same" / "differs (acceptance was redone with the current code)"; kept in Japanese (escaped) as in the claim record

P = C.load("octinico")
out = dict(
    problem="octinico_n02", s_star="3√2 − √10", S_star=C.qstr(P.SSTAR), R_star=lp["RSTAR_str"],
    local=dict(record=LOCAL, faces=nloc, cands_table_checked=v["cands_table_checked"], lift_used_boxes=lst["lp"]["lift_used_boxes"]),
    far=dict(record=FAR, A=r["A"], D=r["D"], L=r["L"], X=r["X"], bad=r["bad"], cover_leaves=r["cover_leaves"], Sbar=fp["Sbar"], T=fp["T"]),
    tube=tp, sha256_vs_now=sha_cmp, passed=True, seconds=round(time.time() - t0, 1),
    note="\u8b70\u8ad6\u30fb\u30b3\u30fc\u30c9\u306f Claude \u304c\u66f8\u3044\u305f\u3082\u306e\u3067\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044\u3002\u524d\u63d0\uff1a\u88dc\u984c R\u3001\u88dc\u984c W (i)(ii)\u3001d16e \u306e\u9060\u65b9\u306e\u9053\u5177\u3001python-flint\u30fbsympy\u30fbFraction")  # value "arguments and code were written by Claude, no third-party review, not a formal proof. Assumptions: Lemma R, Lemma W (i)(ii), the far tools of d16e, python-flint / sympy / Fraction"; kept in Japanese (escaped) as in the claim record
json.dump(out, open("d30_s3_octinico_claim.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
print("== passed", json.dumps({k: out[k] for k in ("local", "far", "sha256_vs_now", "seconds")}, ensure_ascii=False), flush=True)
