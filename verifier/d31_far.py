# D31 step 3: far-region checker (octintet_n02, exact numbers, acceptance by integers only).
# 2026-11-13, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# Claim: g(h, k′, R) ≥ 0 for (h, k′) ∈ [0,1]×[0,2] with 2h + k′ ≤ 2 (= D_n) and all R ∈ SO(3) (D31 §0).
# κ = (√2/4)y is used on the whole domain (k_N = 0). Since κ(n) + κ(σn) = 0, no pairs of n boxes are needed.
# For each n box an R tree (the 4 quaternion charts, same coordinates as d16d):
#   A (accept): the lower bound of the candidate polynomial 2·ND·DEN²·|q|²·G_c is ≥ 0 (candidate = component and sign for each of n, b0, b1, b3; G_c ≤ g, weights ≥ 0).
#   D (discard): for a piece rotation k, tr(Rk) > tr(R) on the whole box (g(n, Rk) = g(n, R); the point of largest tr in each orbit is not in a discarded box).
#   L: (n box, R box) lies in J or C (d31_common.in_L). Handled by the local lemmas (d31_local.py).
# An n box with 2h_lo + k_lo ≥ 2 is dropped (out: it touches D_n in at most one point, which a neighbouring box covers).
# Usage: python d31_far.py run [--procs 8] [--name d31_far] [--sample K]
#        python d31_far.py replay [--name d31_far]
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

import d31_common as dc
from d31_common import ND, DEN

ROTF = np.array([np.array(k, float) for k in dc.ROT_NONID])


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def rot_f(q):
    w, x, y, z = q
    n = w*w + x*x + y*y + z*z
    return np.array([[w*w+x*x-y*y-z*z, 2*(x*y-w*z), 2*(x*z+w*y)], [2*(x*y+w*z), w*w-x*x+y*y-z*z, 2*(y*z-w*x)],
                     [2*(x*z-w*y), 2*(y*z+w*x), w*w-x*x-y*y+z*z]]) / n


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda a: (w[a], -a)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def is_out(lo, hi):
    return 2 * lo[0] + lo[1] >= 2 * ND


def discard(rb, Rf):
    gains = np.einsum("mji,ij->m", ROTF, Rf) - np.trace(Rf)
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        if dc.discard_lb(rb, dc.ROT_NONID[o]) > 0:
            return int(o)
    return None


def rtree(nlo, nhi, budget, wmin_exp):
    leaves = []; ev = 0
    hc = (nlo[0] + nhi[0]) / 2 / ND; kc = (nlo[1] + nhi[1]) / 2 / ND
    nf = np.array([1 - hc, 1 - hc - kc, 1.0])
    allowL = dc.n_in_J(nlo, nhi) or dc.n_in_C(nlo, nhi)
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL:
                Lk = dc.in_L(nlo, nhi, ch, lo, hi)
                if Lk:
                    leaves.append([ch, lo, hi, "L", Lk]); continue
            ev += 1
            if ev > budget:
                return None, ev
            q = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]; q.insert(ch, 1.0)
            Rf = rot_f(q)
            rb = dc.RBox(ch, lo, hi)
            m = discard(rb, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            cand = dc.far_cand_f(nf, Rf)
            if dc.far_lb(nlo, nhi, rb, cand) >= 0:
                leaves.append([ch, lo, hi, "A", [list(c) for c in cand]]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a, b in split3(lo, hi):
                nxt.append((ch, a, b))
        cur = nxt
    return leaves, ev


def task(args):
    lo, hi, budget, wmin_exp = args
    t0 = time.time()
    leaves, ev = rtree(lo, hi, budget, wmin_exp)
    if leaves is None:
        return dict(kind="fail", lo=lo, hi=hi, ev=ev, sec=time.time() - t0)
    return dict(kind="ok", lo=lo, hi=hi, leaves=leaves, ev=ev, sec=time.time() - t0,
                nL=sum(1 for l in leaves if l[3] == "L"))


def must_split(lo, hi, forced):
    w = max(h - l for l, h in zip(lo, hi))
    if w > forced:
        return True
    if dc.n_overlaps_J(lo, hi) and not dc.n_in_J(lo, hi):
        return True
    if dc.n_overlaps_C(lo, hi) and not dc.n_in_C(lo, hi):
        return True
    return False


def run(name, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200, forced_exp=4):
    from multiprocessing import Pool
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, levels=[], X_boxes=[], leaves=dict(A=0, D=0, L=0))
    cur = [([0, 0], [ND, 2 * ND])]
    forced = ND >> forced_exp
    out = None if sample else gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    if out:
        out.write(json.dumps(dict(kind="root", ND=ND, DEN=DEN, R_J=str(dc.R_J), U_J=str(dc.U_J), K_J=str(dc.K_J), R_C=str(dc.R_C),
                                  U_1=str(dc.U_1), U_C_MAX=str(dc.U_C_MAX))) + "\n")
    pool = Pool(procs) if procs > 1 else None
    level = 0
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            if is_out(lo, hi):
                stats["n_out"] += 1
                if out:
                    out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                continue
            if must_split(lo, hi, forced):
                nxt.extend(split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp))
        if sample and not todo:
            cur = nxt; level += 1; continue
        if sample:
            rng = np.random.default_rng(0)
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False)
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            stats["evaluated"] += r["ev"]
            if r["kind"] == "ok":
                stats["n_ok"] += 1
                for lf in r["leaves"]:
                    stats["leaves"][lf[3]] += 1
                if out:
                    out.write(json.dumps(dict(kind="ok", lo=r["lo"], hi=r["hi"], leaves=r["leaves"])) + "\n")
            else:
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (ND >> nmin) or sample:
                    stats["n_X"] += 1; stats["X_boxes"].append([[v / ND for v in r["lo"]], [v / ND for v in r["hi"]]])
                    if out:
                        out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                else:
                    nxt.extend(split2(r["lo"], r["hi"])); stats["n_split"] += 1
        secs = [r["sec"] for r in res]
        stats["levels"].append([level, len(cur), len(todo), sum(1 for r in res if r["kind"] == "ok")])
        print(f"n level {level}: boxes {len(cur)}, tried {len(todo)}, closed {sum(1 for r in res if r['kind']=='ok')}, "
              f"evaluated so far {stats['evaluated']}, longest {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(lo=[v / ND for v in r["lo"]], hi=[v / ND for v in r["hi"]], kind=r["kind"],
                                            ev=r["ev"], sec=round(r["sec"], 2)) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True; break
    if pool:
        pool.close()
    if out:
        out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample)
    stats["params"] = dict(ND=ND, DEN=DEN, nmin=nmin, budget=budget, wmin_exp=wmin_exp, forced_exp=forced_exp,
                           R_J=str(dc.R_J), U_J=str(dc.U_J), K_J=str(dc.K_J), R_C=str(dc.R_C), U_1=str(dc.U_1), U_C_MAX=str(dc.U_C_MAX))
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: closed {stats['closed']}, n boxes ok {stats['n_ok']} / out {stats['n_out']} / at limit {stats['n_X']}, "
          f"R leaves {stats['leaves']}, evaluated {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    """Re-check from the record alone (no floating point): the covering trees of n and R, and the accept / discard / L decisions."""
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    hd = lines[0]
    need(hd["kind"] == "root" and hd["ND"] == ND and hd["DEN"] == DEN and hd["U_J"] == str(dc.U_J) and hd["R_J"] == str(dc.R_J)
         and hd["K_J"] == str(dc.K_J) and hd["R_C"] == str(dc.R_C) and hd["U_1"] == str(dc.U_1) and hd["U_C_MAX"] == str(dc.U_C_MAX), "record header")
    nleaves = {}
    cnt = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box twice")
        nleaves[key] = r; cnt[r["kind"]] += 1
    need(cnt["X"] == 0, "boxes at the split limit remain")
    for key, r in nleaves.items():
        lo, hi = r["lo"], r["hi"]
        if r["kind"] == "out":
            need(is_out(lo, hi), "out box"); continue
        rl = set()
        for lf in r["leaves"]:
            ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
            kk = (ch, tuple(rlo), tuple(rhi)); need(kk not in rl, "the same R box twice"); rl.add(kk)
            if kind == "A":
                cand = tuple(tuple(c) for c in lf[4])
                ok = all(c[0] in (0, 1, 2) and c[1] in (1, -1) for c in cand) and dc.far_lb(lo, hi, dc.RBox(ch, rlo, rhi), cand) >= 0
            elif kind == "D":
                ok = 0 <= lf[4] < len(dc.ROT_NONID) and dc.discard_lb(dc.RBox(ch, rlo, rhi), dc.ROT_NONID[lf[4]]) > 0
            elif kind == "L":
                ok = dc.in_L(lo, hi, ch, rlo, rhi) == lf[4] and lf[4] in ("J", "C")
            else:
                ok = False
            cnt[kind] += 1; cnt["bad"] += (not ok)
        seen = 0
        # The split rule is fixed, so going deeper than the deepest leaf (sum of halvings) means a gap in the cover
        dmax = max(sum(round(math.log2(2 * DEN / (h - l))) for l, h in zip(k_[1], k_[2])) for k_ in rl)
        cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
        depth = 0
        while cur:
            need(depth <= dmax, "a branch that reaches no R leaf"); depth += 1
            nxt = []
            for ch, a, b in cur:
                if (ch, tuple(a), tuple(b)) in rl:
                    seen += 1; continue
                nxt.extend((ch, p, q) for p, q in split3(a, b))
            cur = nxt
        need(seen == len(rl), "cover of the R tree")
    seen = 0
    dmax = max(sum(round(math.log2(f / (h - l))) for l, h, f in zip(k_[0], k_[1], (ND, 2 * ND))) for k_ in nleaves)
    cur = [([0, 0], [ND, 2 * ND])]
    depth = 0
    while cur:
        need(depth <= dmax, "a branch that reaches no n leaf"); depth += 1
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            nxt.extend(split2(lo, hi))
        cur = nxt
    need(seen == len(nleaves), "cover of the n tree")
    print(f"replay {name}: n boxes ok {cnt['ok']} / out {cnt['out']}, R leaves accepted {cnt['A']} / discarded {cnt['D']} / L {cnt['L']}, "
          f"failed {cnt['bad']}, covering trees OK, {time.time()-t0:.0f} s", flush=True)
    need(cnt["bad"] == 0, "there are failures")
    return cnt


CONSTS = ("R_J", "U_J", "K_J", "R_C", "U_1", "U_C_MAX")


def replay_all(far="d31_far", J="d31_local_J", C="d31_local_C"):
    """FD_d31_review item 4: compare the region constants in the headers of the 3 records (far, J, C) with each other, then run the 3 replays one after another in the same environment."""
    import d31_local as LO
    heads = {}
    for nm, fn in ((far, f"{far}.boxes.jsonl.gz"), (J, f"{J}.leaves.jsonl.gz"), (C, f"{C}.leaves.jsonl.gz")):
        with gzip.open(fn, "rt", encoding="utf-8") as f:
            heads[nm] = json.loads(f.readline())
    vals = {k: {nm: h.get(k) for nm, h in heads.items()} for k in CONSTS}
    for k, v in vals.items():
        need(len(set(v.values())) == 1, f"{k} differs between the 3 records: {v}")
        need(v[far] == str(getattr(dc, k)), f"{k} = {v[far]} in the records differs from the current d31_common ({getattr(dc, k)})")
    need(heads[J].get("region") == "J" and heads[C].get("region") == "C", "region of the local records")
    print("region constants agree in the 3 records: " + ", ".join(f"{k}={vals[k][far]}" for k in CONSTS), flush=True)
    out = dict(constants={k: vals[k][far] for k in CONSTS})
    out["J"] = LO.replay("J", J)
    out["C"] = LO.replay("C", C)
    out["far"] = replay(far)
    print("replay_all: all 3 passed", flush=True)
    return out


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default="d31_far")
    ap.add_argument("--procs", type=int, default=8); ap.add_argument("--nmin", type=int, default=12)
    ap.add_argument("--budget", type=int, default=20000); ap.add_argument("--wmin-exp", type=int, default=16)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
    elif a.cmd == "replay_all":
        replay_all()
