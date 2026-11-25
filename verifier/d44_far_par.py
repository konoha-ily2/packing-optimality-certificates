# D44 stage 1: the parallel version of d44_far. Written by Claude (Opus 5.5), 2026-11-13.
# The arguments, code and tests were written by Claude and have no third-party review; this is not a formal proof. d16e_far and d44_far are not changed.
#
# The root boxes of the 4 maps are split, without judging them, DEPTH times each by d16e_far.split into small boxes (inner nodes of the split tree),
# and for each small box the same judgement as d16e_far.run (discard -> LP -> check_box -> split, limit at width 2^-wmin) is run in a separate process.
# The leaves are collected in one .boxes.jsonl.gz in the same form as d16e_far.run, and params are written in the same form, so d16e_far.replay and d44_far replay can
# check them again (the covering tree is rebuilt from the root by split; the inner nodes that were not judged simply do not appear among the leaves).
# The replay is also parallel: acceptance, discarding and the L judgement of the leaves are divided into pieces and run in separate processes, and the parent builds the covering tree by the same procedure as d16e_far.replay.
#
# Usage:
#   python -X utf8 d44_far_par.py run <pair> --k K --procs 6 [--depth 6] [--name name] [--wmin-exp 30] [--max-boxes N] [--time-limit seconds]
#   python -X utf8 d44_far_par.py replay <pair> --name name --procs 6
import os, sys, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import multiprocessing as mpc
import numpy as np
HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import d44_far as DF
import d16e_common as C
from d16e_common import DEN, need
import d16e_far as F

_G = {}


def _init(pair, sbar, qlam_exp):
    try:
        import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
    except Exception:
        pass
    P, S = DF.prepare(pair, Fr(sbar), qlam_exp)
    _G.update(P=P, S=S, T=P.default_T(S), pair=pair)


def _work(args):
    """From a bundle of boxes, the same judgement as the inner loop of d16e_far.run. If the evaluations exceed the budget, return the remaining boxes and the parent redistributes them.
    Returns (statistics, list of leaf rows, limit boxes, remaining boxes)."""
    ch, boxes, wmin_exp, deadline, budget = args
    P, Sbar, T = _G["P"], _G["S"], _G["T"]
    nonid = P.NONID; PAIRMF = P.PAIRMF[nonid]
    wmin = DEN >> wmin_exp
    st = dict(evaluated=0, A=0, D=0, L=0, X=0, lp_fail=0)
    lines = []; Xs = []
    cur = list(boxes)
    while cur:
        nxt = []
        for i, (lo, hi) in enumerate(cur):
            if time.time() > deadline:
                return dict(st, timeout=True), lines, Xs, []
            if st["evaluated"] >= budget:
                return st, lines, Xs, cur[i:] + nxt
            if F.inside_L(ch, lo, hi):
                st["L"] += 1; lines.append(json.dumps(dict(c=ch, k="L", lo=lo, hi=hi))); continue
            st["evaluated"] += 1
            cen = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
            R = C.rot_f(C.q_of(ch, cen))
            gains = np.einsum("mij,ij->m", PAIRMF, R) - np.trace(R)
            done = False
            for o in np.argsort(-gains)[:3]:
                if gains[o] <= 0:
                    break
                m = nonid[o]
                if F.check_discard(ch, lo, hi, m):
                    st["D"] += 1; done = True
                    lines.append(json.dumps(dict(c=ch, k="D", lo=lo, hi=hi, m=m))); break
            if done:
                continue
            cand = F.lp_f(R)
            if cand is None:
                st["lp_fail"] += 1
            else:
                v, lam, mu, verts = cand
                L, M = F.round_mult(lam, mu)
                ok, _ = F.check_box(ch, lo, hi, L, M, verts, Sbar, T)
                if ok:
                    st["A"] += 1; lines.append(json.dumps(dict(c=ch, k="A", lo=lo, hi=hi, lam=L, mu=M, v=verts))); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                st["X"] += 1; lines.append(json.dumps(dict(c=ch, k="X", lo=lo, hi=hi)))
                Xs.append(dict(c=ch, lo=[l / DEN for l in lo], hi=[h / DEN for h in hi], phi_center=(cand[0] if cand else None)))
                continue
            nxt.extend(F.split(lo, hi))
        cur = nxt
    return st, lines, Xs, []


def frontier(depth):
    out = []
    for ch in range(4):
        cur = [([-DEN] * 3, [DEN] * 3)]
        for _ in range(depth if ch == 0 else max(0, depth - 3)):
            cur = [b for lo, hi in cur for b in F.split(lo, hi)]
        out += [(ch, lo, hi) for lo, hi in cur]
    return out


def run_par(pair, k, sbar, name, procs, depth, wmin_exp, max_boxes, time_limit):
    qlam_exp = max(24, 4 * (k or 6) + 12)
    P, S = DF.prepare(pair, sbar, qlam_exp)
    T = P.default_T(S)
    tasks = frontier(depth)
    print(f"{pair}: k = {k}, s-bar = {sbar} ({float(sbar):.12f}), S-bar = {float(S):.15f}, QLAM = 2^{qlam_exp}, "
          f"small boxes {len(tasks)}, {procs} parallel", flush=True)
    t0 = time.time(); deadline = t0 + time_limit
    tot = dict(evaluated=0, A=0, D=0, L=0, X=0, lp_fail=0)
    Xs = []; bad = None
    out = gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    BUDGET = 3000
    pending = [(ch, [(lo, hi)]) for ch, lo, hi in tasks]
    nres = 0
    with mpc.Pool(procs, initializer=_init, initargs=(pair, str(sbar), qlam_exp)) as pool:
        inflight = []
        while pending or inflight:
            while pending and len(inflight) < 2 * procs:
                ch, bx = pending.pop()
                inflight.append((pool.apply_async(_work, ((ch, bx, wmin_exp, deadline, BUDGET),)), ch))
            time.sleep(0.05)
            still = []
            for h, hch in inflight:
                if not h.ready():
                    still.append((h, hch)); continue
                st, lines, xs, left = h.get()
                nres += 1
                for key in tot:
                    tot[key] += st[key]
                for ln in lines:
                    out.write(ln + "\n")
                Xs += xs
                if left:
                    nchunk = max(1, min(4 * procs, len(left) // 50))
                    step = math.ceil(len(left) / nchunk)
                    for j in range(0, len(left), step):
                        pending.append((hch, left[j:j + step]))
                if st.get("timeout"):
                    bad = f"\u6642\u9593\u5207\u308c\uff08{time_limit} \u79d2\uff09"
                if tot["evaluated"] > max_boxes:
                    bad = "\u7bb1\u306e\u6570\u306e\u4e0a\u9650\u3092\u8d85\u3048\u305f"
                if nres % 200 == 0:
                    print(f"  results {nres}  pending {len(pending)}  evaluated {tot['evaluated']}  limit {tot['X']}  ({time.time()-t0:.0f} s)", flush=True)
            inflight = still
            if bad:
                pool.terminate(); break
    out.close()
    stats = dict(problem=DF.prob_name(pair), **tot, levels=[], per_chart={}, seconds=round(time.time() - t0, 1), X_boxes=Xs[:50])
    stats["params"] = dict(problem=DF.prob_name(pair), charts=[0, 1, 2, 3], wmin_exp=wmin_exp, Sbar=str(S), T=str(T), scale="1",
                           RHO0=str(C.RHO0), DEN_exp=C.KDEN, QLAM=F.QLAM, use_discard=True, n_pairs_used=len(P.NONID))
    stats["closed"] = bad is None and tot["X"] == 0 and tot["lp_fail"] == 0
    stats["d44"] = dict(pair=pair, k=k, sbar=str(sbar), sbar_float=float(sbar), S_bar=str(S), qlam_exp=qlam_exp,
                        note=f"RHO0 = {C.RHO0}\uff080 \u306a\u3089\u5c40\u6240\u306a\u3057\uff09\u3001P.SSTAR := S̄\uff08\u898b\u5f35\u308a\uff09\u3001\u4e26\u5217 {procs}\u30fb\u5c0f\u7bb1\u306e\u6df1\u3055 {depth}", stopped=bad, lpfix=os.environ.get("D44_LPFIX") == "1")
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: evaluated {tot['evaluated']}, accepted {tot['A']}, discarded {tot['D']}, L {tot['L']}, split limit {tot['X']}, "
          f"LP failures {tot['lp_fail']}, {stats['seconds']} s" + (f", stopped: {bad}" if bad else ""), flush=True)
    return stats


def _check_chunk(recs):
    P, Sbar = _G["P"], _G["S"]
    meta = _G["meta"]
    T = Fr(meta["T"])
    bad = 0
    for r in recs:
        if r["k"] == "A":
            ok, _ = F.check_box(r["c"], r["lo"], r["hi"], r["lam"], r["mu"], r["v"], Sbar, T); bad += (not ok)
        elif r["k"] == "D":
            bad += (not F.check_discard(r["c"], r["lo"], r["hi"], r["m"]))
        elif r["k"] == "L":
            bad += (not F.inside_L(r["c"], r["lo"], r["hi"]))
    return bad, len(recs)


def _init_replay(pair, sbar, qlam_exp, meta):
    _init(pair, sbar, qlam_exp)
    _G["meta"] = meta


def replay_par(pair, name, procs):
    t0 = time.time()
    st = json.load(open(f"{name}.json", encoding="utf-8"))
    meta = st["params"]; ex = st["d44"]
    qlam_exp = int(math.log2(meta["QLAM"]))
    P, S = DF.prepare(pair, Fr(ex["sbar"]), qlam_exp)
    need(meta["problem"] == DF.prob_name(pair), "problem of the record")
    need(Fr(meta["Sbar"]) == S, "the S-bar of the record equals the S-bar rebuilt from s-bar")
    need(Fr(meta["scale"]) == 1 and Fr(meta["RHO0"]) == C.RHO0 and meta["DEN_exp"] == C.KDEN, "premises of the record (RHO0 equals D44_RHO0)")
    from d16e_common import QD
    need(QD(S) >= P.SSTAR, "S-bar >= SSTAR (watchdog)")
    P.check_T(Fr(meta["T"]), S)
    leaves = {}; n = dict(A=0, D=0, L=0, X=0)
    recs = []
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        for line in f:
            r = json.loads(line)
            key = (r["c"], tuple(r["lo"]), tuple(r["hi"]))
            need(key not in leaves, "the same box twice")
            leaves[key] = r["k"]; n[r["k"]] += 1
            recs.append(r)
    chunks = [recs[i:i + 2000] for i in range(0, len(recs), 2000)]
    bad = 0
    with mpc.Pool(procs, initializer=_init_replay, initargs=(pair, ex["sbar"], qlam_exp, meta)) as pool:
        for b, m in pool.imap_unordered(_check_chunk, chunks):
            bad += b
    del recs
    seen = 0
    for ch in range(4):
        cur = [([-DEN] * 3, [DEN] * 3)]
        while cur:
            nxt = []
            for lo, hi in cur:
                key = (ch, tuple(lo), tuple(hi))
                if key in leaves:
                    seen += 1; continue
                need(max(h - l for l, h in zip(lo, hi)) > 2, "a branch that does not reach a leaf")
                nxt.extend(F.split(lo, hi))
            cur = nxt
    need(seen == len(leaves), f"of the {len(leaves)} boxes of the record, {seen} appeared in the tree")
    print(f"re-check {name}: accepted {n['A']}, discarded {n['D']}, L {n['L']}, split limit {n['X']}, failed {bad}, "
          f"covering tree of the 4 maps OK, {time.time()-t0:.0f} s", flush=True)
    need(bad == 0 and n["X"] == 0, "failures or split limits exist (not closed)")
    if C.RHO0 == 0:
        need(n["L"] == 0, "no L boxes (P4)")
    else:
        print(f"L boxes {n['L']} (stage 3: handled by the local d44_local. inside_L was checked leaf by leaf)", flush=True)
    print(f"replay passed: {pair} s-bar = {ex['sbar']} ({float(Fr(ex['sbar'])):.12f}), {time.time()-t0:.0f} s", flush=True)
    return n


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("pair")
    ap.add_argument("--k", type=int, default=None); ap.add_argument("--sbar", default=None); ap.add_argument("--name", default=None)
    ap.add_argument("--procs", type=int, default=6); ap.add_argument("--depth", type=int, default=3)
    ap.add_argument("--wmin-exp", type=int, default=30)
    ap.add_argument("--max-boxes", type=int, default=30_000_000); ap.add_argument("--time-limit", type=int, default=3 * 3600)
    a = ap.parse_args()
    if a.cmd == "replay":
        replay_par(a.pair, a.name, a.procs); sys.exit(0)
    sbar = Fr(a.sbar) if a.sbar else DF.sbar_of_k(a.pair, a.k)
    name = a.name or f"d44_{a.pair}_k{a.k}"
    st = run_par(a.pair, a.k, sbar, name, a.procs, a.depth, a.wmin_exp, a.max_boxes, a.time_limit)
    sys.exit(0 if st["closed"] else 2)
