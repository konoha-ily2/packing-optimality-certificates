# D30 stage 3: the far part of octinico. Uses the tools of d16e_far.py unchanged (acceptance check_box, discard check_discard, record format, replay),
# and replaces only the test for "L boxes" by "inside the tube". 2026-11-13, written by Claude (Opus 5.5).
# Arguments and code were written by Claude with no third-party review; this is not a formal proof. d16e_far.py and d30_far.py are not changed.
#
# Tube = in chart 0, {p = τ n + y1 e1 + y2 e2 : τ ∈ [TC − TW, TC + TW], |y1|, |y2| ≤ ρ0} (the same numbers as d30_s3_common and d30_s3_local).
# The tube is a convex prism in p space, so if the 8 corners of a box are inside the tube (exact rationals), the whole box is inside. Only such boxes are passed to the local part as L.
# The local part (d30_s3_local) shows φ ≥ S* on the whole tube; the far part closes every other box by acceptance (φ ≥ S̄ > S*) or discarding (symmetry).
#
# Usage:
#   python -X utf8 d30_s3_far.py run [--name name] [--max-boxes N] [--time-limit seconds]
#   python -X utf8 d30_s3_far.py replay [--name name]
#   python -X utf8 d30_s3_far.py trial [--sec seconds]
import sys, json, time, argparse, itertools
from fractions import Fraction as Fr
import d30_s3_common as T3
import d16e_common as C
from d16e_common import DEN, need
import d16e_far as F
import d30_far as DF
import d30_s3_local as SL          # the tube sizes TC, TW, RHO0 live here
T3.install()

PROB = "octinico"


def inside_tube(ch, lo, hi):
    """Whether the box is inside the tube (exact). Chart 0 only."""
    if ch != 0:
        return False
    tlo, thi = SL.TC - SL.TW, SL.TC + SL.TW
    for corner in itertools.product(*[(l, h) for l, h in zip(lo, hi)]):
        tau, y1, y2 = T3.tube_coords([Fr(v, DEN) for v in corner])
        if not (tlo <= tau <= thi and abs(y1) <= SL.RHO0 and abs(y2) <= SL.RHO0):
            return False
    return True


def install():
    T3.install()
    C.RHO0 = SL.RHO0
    F.inside_L = inside_tube
    F.P = None
    F.setup(PROB)


def run(name="d30_s3_octinico_far", max_boxes=2_000_000, time_limit=3 * 3600):
    install()
    st = F.run(PROB, name, max_boxes=max_boxes, time_limit=time_limit)
    st["tube"] = SL.tube_params()
    st["params"]["tube"] = SL.tube_params()
    json.dump(st, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    return st


def replay(name="d30_s3_octinico_far"):
    install()
    meta = json.load(open(f"{name}.json", encoding="utf-8"))
    need(meta["params"].get("tube") == SL.tube_params(), "the tube sizes in the record equal those of this file")
    n_cov = DF.cover_check(name)
    n = F.replay(PROB, name)
    return dict(cover_leaves=n_cov, **n)


def trial(sec=600):
    """sec/4 seconds per chart. Same as d30_far.trial (only the L test is the tube)."""
    install()
    return DF.trial(PROB, sec)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd", choices=["run", "replay", "trial"])
    ap.add_argument("--name", default="d30_s3_octinico_far")
    ap.add_argument("--max-boxes", type=int, default=2_000_000); ap.add_argument("--time-limit", type=int, default=3 * 3600)
    ap.add_argument("--sec", type=float, default=600)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.max_boxes, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        r = replay(a.name)
        json.dump(r, open(f"{a.name}_replay.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    else:
        r = trial(a.sec)
        json.dump(r, open("d30_s3_octinico_far_trial.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
        print(json.dumps(r, ensure_ascii=False, default=str)[:3000])
