# D30 (review item G2 of FD_d30s2): single entry point that checks the global-optimality claim. 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. d16e_* are not changed.
#
# local verify (d30_local.verify, writes nothing) → far replay (d16e_far.replay) → cross-checks:
#   problem, RHO0 and DEN_exp agree between local and far, scale = 1 (both), the local record has no fault, no S* shift, and is closed,
#   far closed = True, and the volumes of the L boxes (chart 0) sum to (2ρ₀)³ (replay has already checked that the L boxes are non-overlapping leaves inside the cube,
#   so their union equals [−ρ₀, ρ₀]³). The result goes to d30_<problem>_claim.json.
# Usage: python -X utf8 d30_claim.py <problem> [local record=d30_<problem>_local_r16.json] [far name=d30_<problem>_far] [--out output]
import sys, json, gzip, time, argparse
from fractions import Fraction as Fr
import d30_problems
d30_problems.install()
import d16e_common as C
from d16e_common import need, DEN
import d16e_far as F
import d30_local as DL
import d30_far as DF


def claim(prob, local=None, far=None, out=None):
    t0 = time.time()
    local = local or f"d30_{prob}_local_r16.json"
    far = far or f"d30_{prob}_far"
    lp = json.load(open(local, encoding="utf-8"))
    lpar = lp["params"]
    fst = json.load(open(f"{far}.json", encoding="utf-8"))
    fpar = fst["params"]
    # cross-checks (assumptions of the records)
    need(lpar["problem"] == prob and fpar["problem"] == prob, "problem agrees")
    need(Fr(lpar["RHO0"]) == Fr(fpar["RHO0"]), "ρ₀ agrees between local and far")
    need(lpar.get("DEN_exp") == C.KDEN and fpar.get("DEN_exp") == C.KDEN, "DEN_exp agrees")
    need(Fr(lpar["scale"]) == 1 and Fr(fpar["scale"]) == 1, "scale = 1 (both)")
    need(lpar.get("fault") in (None, "None") and not lpar.get("fault_nolift", False), "the local record is not an injected-error version")
    need(lpar.get("sstar") in (None, "None"), "the local record does not shift S*")
    need(lp.get("closed") is True, "the local record is closed")
    need(fst.get("closed") is True, "the far record is closed")
    rho0 = Fr(fpar["RHO0"])
    # local verify (writes nothing)
    C.RHO0 = rho0
    t1 = time.time()
    v = DL.verify(local, quiet=True)
    need(v["all_passed"], f"local verify failed: {v['bad'][:3]}")
    need(Fr(v["RHO0"]) == rho0, "ρ₀ of verify")
    kinds = {}
    nbox = 0
    for fn, r in v["faces"].items():
        nbox += r["boxes"]
        for k, c in r["kinds"].items():
            kinds[k] = kinds.get(k, 0) + c
    t_local = round(time.time() - t1, 1)
    # far replay
    C.RHO0 = rho0
    t2 = time.time()
    DF.cover_check(far)
    n = F.replay(prob, far)
    t_far = round(time.time() - t2, 1)
    # sum of the volumes of the L boxes
    r = rho0 * DEN; need(r.denominator == 1, "RHO0 is in units of 1/DEN"); r = int(r)
    volL = 0; nL = 0
    with gzip.open(f"{far}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        for line in f:
            b = json.loads(line)
            if b["k"] != "L":
                continue
            need(b["c"] == 0 and F.inside_L(0, b["lo"], b["hi"]), "L boxes lie in the cube of chart 0")
            nL += 1
            volL += (b["hi"][0] - b["lo"][0]) * (b["hi"][1] - b["lo"][1]) * (b["hi"][2] - b["lo"][2])
    need(volL == (2 * r) ** 3, "union of the L boxes is [−ρ₀, ρ₀]³ (sum of volumes)")
    res = dict(problem=prob, local=local, far=far, RHO0=str(rho0), DEN_exp=C.KDEN,
               local_boxes=nbox, local_kinds=kinds, local_faces={k: dict(boxes=x["boxes"], kinds=x["kinds"]) for k, x in v["faces"].items()},
               far_counts=n, far_L_boxes=nL, far_L_volume_ok=True,
               local_params_version={k: lpar.get(k) for k in ("SSTAR_str", "sha256") if k in lpar},
               seconds=dict(local_verify=t_local, far_replay=t_far, total=round(time.time() - t0, 1)),
               passed=True,
               note="Claude \u304c\u66f8\u3044\u305f\u78ba\u304b\u3081\u3002\u7b2c\u4e09\u8005\u306e\u70b9\u691c\u306a\u3057\u3001\u5f62\u5f0f\u8a3c\u660e\u3067\u306f\u306a\u3044")  # value "checks written by Claude; no third-party review, not a formal proof"; kept in Japanese (escaped) as in the claim record
    out = out or f"d30_{prob}_claim.json"
    json.dump(res, open(out, "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    print(f"== claim check {prob}: passed. local {nbox} boxes {kinds}, far {n}, L {nL} boxes, {res['seconds']} s → {out}", flush=True)
    return res


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("prob"); ap.add_argument("local", nargs="?"); ap.add_argument("far", nargs="?")
    ap.add_argument("--out", default=None)
    a = ap.parse_args()
    try:
        claim(a.prob, a.local, a.far, a.out)
    except C.CheckFailed as e:
        print("FAILED:", e, flush=True); sys.exit(2)
