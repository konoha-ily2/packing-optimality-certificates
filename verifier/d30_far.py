# D30 stage 2-3: far region. A wrapper that keeps the tools of d16e_far.py (the accept / discard / L decisions, the record format and replay are the same) and adds the d30_problems cases and ρ₀.
# 2026-11-13, written by Claude (Opus 5.5). Arguments and code were written by Claude with no third-party review; this is not a formal proof. d16e_far.py is not changed.
#
# Usage:
#   python -X utf8 d30_far.py run <problem> --rho0 1/16 [--name name] [--max-boxes N] [--time-limit seconds]   → <name>.json, .boxes.jsonl.gz
#   python -X utf8 d30_far.py replay <problem> [--name name]     re-check with the RHO0 of the record
#   python -X utf8 d30_far.py trial <problem> --rho0 1/16 [--sec 600]  trial run: sec/4 seconds per chart, estimate the total from the box counts per level (writes no record)
import sys, json, time, argparse
from fractions import Fraction as Fr
import numpy as np
import d30_problems
d30_problems.install()
import d16e_common as C
from d16e_common import DEN
import d16e_far as F


def cover_check(name):
    """Review item G5 (FD_d30s2): check the coverage of a far record, declaring on the spot a hole at any branch that is not an ancestor of a leaf (d16e_far.replay
    keeps descending a branch with a missing leaf down to width 2 and does not finish, so run this before replay). d16e_far is not changed."""
    import gzip
    import d30_local as DL
    from d16e_common import need
    leaves = {}
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            key = (r["c"], tuple(r["lo"]), tuple(r["hi"]))
            need(key not in leaves, "the same box appears twice")
            leaves[key] = r["k"]
    seen = 0
    for ch in range(4):
        lv = {(k[1], k[2]) for k in leaves if k[0] == ch}
        root = ([-DEN] * 3, [DEN] * 3)
        anc = DL.ancestors(root, lv, F.split)
        cur = [root]
        while cur:
            nxt = []
            for lo, hi in cur:
                key = (tuple(lo), tuple(hi))
                if key in lv:
                    seen += 1; continue
                need(key in anc, "a branch that never reaches a leaf (hole in the coverage)")
                nxt.extend(F.split(lo, hi))
            cur = nxt
    need(seen == len(leaves), f"of the {len(leaves)} recorded boxes only {seen} appeared in the tree")
    return seen


def trial(prob, sec=600):
    """Run the same decisions as d16e_far.run with a time budget per chart (acceptance uses the same check_box and check_discard)."""
    P = F.setup(prob)
    Sbar = P.sstar_upper(); T = P.default_T(Sbar)
    out = dict(problem=prob, RHO0=str(C.RHO0), sec_per_chart=sec / 4, charts={})
    wmin = DEN >> 30
    for ch in range(4):
        t0 = time.time()
        cur = [([-DEN] * 3, [DEN] * 3)]
        levels = []; ev = 0; A = Dd = Lb = X = fail = 0; finished = True
        while cur:
            nxt = []; done_here = 0
            for lo, hi in cur:
                if time.time() - t0 > sec / 4:
                    finished = False; break
                done_here += 1
                if F.inside_L(ch, lo, hi):
                    Lb += 1; continue
                ev += 1
                cen = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
                R = C.rot_f(C.q_of(ch, cen))
                gains = np.einsum("mij,ij->m", P.PAIRMF[P.NONID], R) - np.trace(R)
                done = False
                for o in np.argsort(-gains)[:3]:
                    if gains[o] <= 0:
                        break
                    if F.check_discard(ch, lo, hi, P.NONID[o]):
                        Dd += 1; done = True; break
                if done:
                    continue
                cand = F.lp_f(R)
                if cand is None:
                    fail += 1
                else:
                    Lm, M = F.round_mult(cand[1], cand[2])
                    ok, _ = F.check_box(ch, lo, hi, Lm, M, cand[3], Sbar, T)
                    if ok:
                        A += 1; continue
                if max(h - l for l, h in zip(lo, hi)) <= wmin:
                    X += 1; continue
                nxt.extend(F.split(lo, hi))
            levels.append([len(cur), done_here, len(nxt)])
            if not finished:
                break
            cur = nxt
        el = time.time() - t0
        out["charts"][ch] = dict(finished=finished, evaluated=ev, A=A, D=Dd, L=Lb, X=X, lp_fail=fail, levels=levels, sec=round(el, 1),
                                 rate=round(ev / max(el, 1e-9), 1))
        print(f"chart {ch}: finished {finished}, evaluated {ev}, accepted {A}, discarded {Dd}, L {Lb}, limit {X}, LP failures {fail}, {el:.0f} s, "
              f"levels [boxes, processed, next] {levels[-6:]}", flush=True)
    # estimate: for an unfinished chart, use the growth ratio r (next/boxes) of the last 3 completed levels; geometric sum if r < 1, "cannot estimate" if r ≥ 1
    est = 0; note = []
    for ch, c in out["charts"].items():
        if c["finished"]:
            est += c["evaluated"]; continue
        lv = [l for l in c["levels"] if l[1] == l[0]]
        if len(lv) < 3:
            note.append(f"chart {ch}: too few completed levels to estimate"); est = None; break
        rs = [l[2] / max(l[0], 1) for l in lv[-3:]]
        r = max(rs)
        pend = c["levels"][-1][0] - c["levels"][-1][1] + c["levels"][-1][2]
        if r >= 1:
            # upper estimate when the count keeps growing: not down to the split limit, but 6 levels ahead with ratio r
            tail = sum(pend * r**k for k in range(6))
            note.append(f"chart {ch}: growth r = {r:.2f} (≥ 1, {tail:.0f} up to 6 levels ahead)")
        else:
            tail = pend / (1 - r)
            note.append(f"chart {ch}: growth r = {r:.2f}, remaining ≈ {tail:.0f}")
        est += c["evaluated"] + tail
    out["estimate_boxes"] = est; out["notes"] = note
    rate = np.mean([c["rate"] for c in out["charts"].values()])
    out["rate_per_sec"] = round(float(rate), 1)
    out["estimate_hours"] = None if est is None else round(est / rate / 3600, 2)
    print("estimate", json.dumps({k: out[k] for k in ("estimate_boxes", "estimate_hours", "rate_per_sec", "notes")}, ensure_ascii=False), flush=True)
    return out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("prob"); ap.add_argument("--name", default=None)
    ap.add_argument("--rho0", default=None); ap.add_argument("--sec", type=float, default=600)
    ap.add_argument("--max-boxes", type=int, default=2_000_000); ap.add_argument("--time-limit", type=int, default=3 * 3600)
    a = ap.parse_args()
    name = a.name or f"d30_{a.prob}_far"
    if a.cmd == "replay":
        meta = json.load(open(f"{name}.json", encoding="utf-8"))["params"]
        C.RHO0 = Fr(meta["RHO0"])
        cover_check(name)
        F.replay(a.prob, name)
        sys.exit(0)
    if a.rho0:
        C.RHO0 = Fr(a.rho0)
    if a.cmd == "trial":
        r = trial(a.prob, a.sec)
        json.dump(r, open(f"{name}_trial.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1, default=str)
    elif a.cmd == "run":
        try:
            st = F.run(a.prob, name, max_boxes=a.max_boxes, time_limit=a.time_limit)
        except RuntimeError as e:
            print("stopped:", e, flush=True); sys.exit(3)
        sys.exit(0 if st["closed"] else 2)
