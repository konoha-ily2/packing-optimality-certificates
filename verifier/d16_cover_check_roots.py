# D16 cubinoct_n02: check the two far records (the τ roots) and the local record together (2026-11-12, written by Claude; no third-party review).
#
# Purpose (review finding 2): replay checks one record at a time and trusts the parameters in that record's json.
# This script checks mechanically that the two roots join to [0, 1], tmax = 1, L equals the code constant, limit = 0, lp_fail = 0.
# It changes no value and no decision rule (it only adds checks). It only reads json files and takes milliseconds.
#
# Usage: python -X utf8 d16_cover_check_roots.py [name1=d16_far_t0 name2=d16_far_t1 local=d16_local]
import sys, json
from fractions import Fraction as Fr
import d16_cover_common as C
from d16_cover_common import need
import d16_cover_far as F


def load(name):
    with open(f"{name}.json", encoding="utf-8") as f:
        return json.load(f)


def check(far_names=("d16_far_t0", "d16_far_t1"), local_name="d16_local"):
    # --- far region: joining of the roots ---
    roots = []
    for nm in far_names:
        d = load(nm); p = d["params"]
        need(Fr(p["tmax"]) == 1, f"{nm}: tmax is not 1 ({p['tmax']})")
        need(tuple(Fr(x) for x in p["L"]) == C.L_BOX, f"{nm}: L differs from d16_cover_common.L_BOX")
        need(p["DEN_exp"] == C.KDEN and p["QLAM"] == F.QLAM, f"{nm}: DEN or QLAM differs from the constants")
        need(Fr(p["T1"]) == F.T1_DEFAULT and Fr(p["Sbar"]) == C.SSTAR_UP, f"{nm}: T1 or S̄ differs from the constants")
        need(Fr(p["scale"]) == 1, f"{nm}: scale is not 1")
        need(d["limit"] == 0, f"{nm}: split limit hit {d['limit']} ≠ 0")
        need(d["lp_fail"] == 0, f"{nm}: LP failures {d['lp_fail']} ≠ 0")
        roots.append((Fr(p["troot"][0]), Fr(p["troot"][1]), nm))
    roots.sort()
    need(roots[0][0] == 0, "the τ roots do not start at 0")
    need(roots[-1][1] == 1, "the τ roots do not end at 1")
    for a, b in zip(roots, roots[1:]):
        need(a[1] == b[0], f"the τ roots do not join: upper end {a[1]} of {a[2]} and lower end {b[0]} of {b[2]}")
    # --- local region ---
    ld = load(local_name)
    need(ld["closed"] is True, "the local region is not closed")
    need(tuple(Fr(x) for x in ld["params"]["L"]) == C.L_BOX, "local L differs from d16_cover_common.L_BOX")
    need(all(v["limit"] == 0 for v in ld["faces"].values()), "a local face hit the split limit")
    need(set(ld["faces"]) == {"g=1", "b=1", "e=+1", "e=-1"}, "the four local faces are not all present")
    print(f"OK: far roots {[(str(a), str(b)) for a, b, _ in roots]} join to [0, 1], tmax = 1, L matches, limit = 0, lp_fail = 0. "
          f"Local: all 4 faces closed. Evaluated {sum(load(n)['evaluated'] for n in far_names)} boxes (accepted {sum(load(n)['accepted'] for n in far_names)})")


if __name__ == "__main__":
    a = sys.argv[1:]
    if a:
        check((a[0], a[1]), a[2] if len(a) > 2 else "d16_local")
    else:
        check()
