# D28 stage 2 (icointet_n02, cubintet_n02, selected by --prob): far-region checker (exact arithmetic, acceptance by integers only).
# 2026-11-12, written by Claude. Arguments, code and tests were written by Claude with no third-party review; this is not a formal proof.
#
# Shows (corollary T4; n in D_n coordinates): for all n = (x, y, 1) (|y| ≤ x ≤ 1) and R ∈ SO(3)
#     F(n, R; c*) ≥ κ(n), κ = k_N + β·y (a constant k_N per n box N, one β overall), k_{σN} = −k_N.
# Then κ(n) + κ(σn) = 0 (σn is the T_d image of −n), and T4 gives s* ≥ 2√2·c* (together with the local lemma).
# For each n box N, a tree of R boxes (4 quaternion charts):
#   A (accept): with a choice of vertices v0, v_f the lower bound G = n·Rv0 + ¼Σ w_f(n) b_f·Rv_f − c*·m(n) − κ is ≥ 0 on the box (integer polynomial lower bound).
#   D (discard): for a piece rotation k, tr(Rk) > tr(R) on the whole box (F(n, Rk) = F(n, R); the point of maximal tr in each orbit is not in a discarded box).
#   L: N ⊂ LN (d28_common) and the R box ⊂ {chart 0, |p|∞ ≤ RHO_P}, k_N = 0. Handled by the local lemma (d28_local.py).
# n boxes disjoint from D_n (entirely y > x) are discarded (out). An n box whose R tree does not close is split into 4 (N and σN together).
#
# Usage:
#   python d28_far.py run [--procs 4] [--name d28_icointet_far] [--nmin 10] [--sample K]
#   python d28_far.py replay [--name d28_icointet_far]
import sys, os, json, gzip, time, math, argparse
from fractions import Fraction as Fr
import numpy as np
import os as _os, sys as _sys
if "--prob" in _sys.argv:
    _os.environ["D28_PROB"] = _sys.argv[_sys.argv.index("--prob") + 1]
import d28_common as C
from d28_common import QD, FE, need, DEN, NDEN

try:
    import psutil; psutil.Process().nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
except Exception:
    pass

KDENOM = 2 ** 24                       # denominator of k_N
ROT = None; ROTF = None; NONID = None
_RP = {}; _DISC = {}


def init():
    global ROT, ROTF, NONID
    if ROT is None:
        ROT = C.rot_group()
        NONID = [i for i, k in enumerate(ROT) if k != C.eye()]
        ROTF = np.array([C.fmat(k) for k in ROT])


def rpolys(ch, lo, hi):
    key = (ch, tuple(lo), tuple(hi))
    r = _RP.get(key)
    if r is None:
        if len(_RP) > 400_000:
            _RP.clear()
        r = _RP[key] = C.rbox_polys(ch, lo, hi)
    return r


def discard(ch, lo, hi, Rf):
    key = (ch, tuple(lo), tuple(hi))
    if key in _DISC:
        return _DISC[key]
    gains = np.einsum("mji,ij->m", ROTF[NONID], Rf) - np.trace(Rf)     # tr(R k) = Σ R_ij k_ji
    res = None
    for o in np.argsort(-gains)[:3]:
        if gains[o] <= 0:
            break
        m = NONID[o]
        if C.discard_lb(rpolys(ch, lo, hi), ROT[m]) > 0:
            res = m; break
    _DISC[key] = res
    return res


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


def mirror(lo, hi):
    return [lo[0], -hi[1]], [hi[0], -lo[1]]


def choose_vertices(nf, Rf):
    RV = C.VF @ Rf.T
    v0 = int((RV @ nf).argmax())
    vf = [int((C.BF[f] @ RV.T).argmax()) for f in range(4)]
    return v0, vf


def rtree(nb, allowL, budget, wmin_exp):
    """R tree for the n box nb. Returns (list of leaves, evaluations) or (None, evaluations) (not closed)."""
    init()
    leaves = []; ev = 0
    nf = np.array([(nb.nlo[0] + nb.nhi[0]) / 2 / NDEN, (nb.nlo[1] + nb.nhi[1]) / 2 / NDEN, 1.0])
    wmin = DEN >> wmin_exp
    cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    while cur:
        nxt = []
        for ch, lo, hi in cur:
            if allowL and C.r_inside_L(ch, lo, hi):
                leaves.append([ch, lo, hi, "L"]); continue
            ev += 1
            if ev > budget:
                return None, ev
            cen = [(l + h) / 2 / DEN for l, h in zip(lo, hi)]
            Rf = C.rot_f(C.q_of(ch, cen))
            m = discard(ch, lo, hi, Rf)
            if m is not None:
                leaves.append([ch, lo, hi, "D", m]); continue
            v0, vf = choose_vertices(nf, Rf)
            if C.box_lb(nb, rpolys(ch, lo, hi), v0, vf) >= 0:
                leaves.append([ch, lo, hi, "A", v0, vf]); continue
            if max(h - l for l, h in zip(lo, hi)) <= wmin:
                return None, ev
            for a, b in split3(lo, hi):
                nxt.append((ch, a, b))
        cur = nxt
    return leaves, ev


def psi_tilde(x, y):
    v, _ = C.psi_f(np.array([x, y, 1.0]), nsamp=4000, nstart=12)
    return v - float(C.BETA) * y


def task(args):
    """Pair of n boxes (N, σN) (N on the side y ≥ 0)."""
    lo, hi, budget, wmin_exp = args
    init()
    t0 = time.time()
    mlo, mhi = mirror(lo, hi)
    inL = C.n_inside_L(lo, hi)
    if inL:
        k = Fr(0); psis = None
    else:
        cx, cy = (lo[0] + hi[0]) / 2 / NDEN, (lo[1] + hi[1]) / 2 / NDEN
        p1, p2 = psi_tilde(cx, cy), psi_tilde(cx, -cy)
        k = Fr(math.floor((p1 - p2) / 2 * KDENOM), KDENOM)
        psis = (p1, p2)
        if p1 + p2 < 0:
            return dict(kind="neg", lo=lo, hi=hi, psis=psis)
    out = []; evs = 0
    for (a, b, kk) in ((lo, hi, k), (mlo, mhi, -k)):
        nb = C.NBox(a, b, kk, C.BETA)
        leaves, ev = rtree(nb, inL, budget, wmin_exp)
        evs += ev
        if leaves is None:
            return dict(kind="fail", lo=lo, hi=hi, ev=evs, psis=psis, sec=time.time() - t0)
        out.append(dict(lo=a, hi=b, k=[k.numerator * (1 if kk == k else -1), k.denominator], leaves=leaves))
    return dict(kind="ok", lo=lo, hi=hi, recs=out, ev=evs, psis=psis, sec=time.time() - t0, inL=inL)


def run(name, procs, nmin, budget, wmin_exp, sample=None, time_limit=7200):
    from multiprocessing import Pool
    t0 = time.time()
    stats = dict(evaluated=0, n_ok=0, n_out=0, n_split=0, n_X=0, n_L=0, levels=[], X_boxes=[], neg=[])
    # start from the upper half of the root [0,1]×[−1,1] split at y = 0. Split unconditionally down to width 1/16
    cur = [([0, 0], [NDEN, NDEN])]
    forced = NDEN >> 4
    out = gzip.open(f"{name}.boxes.jsonl.gz", "wt", encoding="utf-8")
    out.write(json.dumps(dict(kind="root", beta=str(C.BETA), c=str(C.C0), NDEN=NDEN, DEN=DEN)) + "\n")
    level = 0
    pool = Pool(procs) if procs > 1 else None
    while cur:
        todo = []; nxt = []
        for lo, hi in cur:
            w = max(h - l for l, h in zip(lo, hi))
            if lo[1] > hi[0]:                               # entirely y > x: outside D_n
                stats["n_out"] += 2
                out.write(json.dumps(dict(kind="out", lo=lo, hi=hi)) + "\n")
                ml, mh = mirror(lo, hi)
                out.write(json.dumps(dict(kind="out", lo=ml, hi=mh)) + "\n")
                continue
            if w > forced or (C.n_overlaps_L(lo, hi) and not C.n_inside_L(lo, hi)):
                nxt.extend(split2(lo, hi)); stats["n_split"] += 1; continue
            todo.append((lo, hi, budget, wmin_exp))
        if sample and not todo:
            cur = nxt; level += 1
            continue
        if sample:
            rng = np.random.default_rng(0)
            idx = rng.choice(len(todo), size=min(sample, len(todo)), replace=False) if todo else []
            todo = [todo[i] for i in sorted(idx)]
        res = pool.map(task, todo, chunksize=1) if pool else [task(t) for t in todo]
        for r in res:
            if r["kind"] == "ok":
                stats["n_ok"] += 2; stats["evaluated"] += r["ev"]; stats["n_L"] += 2 * int(r["inL"])
                for rec in r["recs"]:
                    out.write(json.dumps(dict(kind="ok", **rec)) + "\n")
            else:
                stats["evaluated"] += r.get("ev", 0)
                if r["kind"] == "neg":
                    stats["neg"].append([r["lo"], r["hi"], r["psis"]])
                w = max(h - l for l, h in zip(r["lo"], r["hi"]))
                if w <= (NDEN >> nmin):
                    stats["n_X"] += 2; stats["X_boxes"].append([[v / NDEN for v in r["lo"]], [v / NDEN for v in r["hi"]], r.get("psis")])
                    out.write(json.dumps(dict(kind="X", lo=r["lo"], hi=r["hi"])) + "\n")
                elif not sample:
                    nxt.extend(split2(r["lo"], r["hi"])); stats["n_split"] += 1
        stats["levels"].append([level, len(cur), len(todo), sum(1 for r in res if r["kind"] == "ok")])
        secs = [r.get("sec", 0) for r in res if r.get("sec")]
        print(f"n level {level}: boxes {len(cur)}, pairs tried {len(todo)}, pairs closed {sum(1 for r in res if r['kind']=='ok')}, "
              f"evaluated so far {stats['evaluated']}, longest pair {max(secs) if secs else 0:.1f} s ({time.time()-t0:.0f} s)", flush=True)
        if sample:
            stats["sample_results"] = [dict(lo=[v / NDEN for v in r["lo"]], hi=[v / NDEN for v in r["hi"]], kind=r["kind"],
                                            ev=r.get("ev"), sec=round(r.get("sec", 0), 2), psis=r.get("psis")) for r in res]
            break
        cur = nxt; level += 1
        if time.time() - t0 > time_limit:
            stats["timeout"] = True; break
    if pool:
        pool.close()
    out.close()
    stats["seconds"] = round(time.time() - t0, 1)
    stats["closed"] = (stats["n_X"] == 0 and not stats.get("timeout") and not sample and not stats["neg"])
    stats["params"] = dict(beta=str(C.BETA), c=str(C.C0), NDEN_exp=C.NDEN_EXP, DEN_exp=C.KDEN, KDENOM=KDENOM, nmin=nmin,
                           budget=budget, wmin_exp=wmin_exp, LN_X=[str(v) for v in C.LN_X], LN_Y=str(C.LN_Y), RHO_P=str(C.RHO_P))
    json.dump(stats, open(f"{name}.json", "w", encoding="utf-8"), ensure_ascii=False, indent=1)
    print(f"== {name}: closed {stats['closed']}, n boxes ok {stats['n_ok']} (of which L {stats['n_L']}), out {stats['n_out']}, "
          f"limit {stats['n_X']}, evaluated {stats['evaluated']}, {stats['seconds']} s", flush=True)
    return stats


def replay(name):
    """Re-check from the record only (no LP, no floating point): coverage of the n tree and R trees, k-sum 0 per pair, accept/discard/L decisions."""
    init()
    t0 = time.time()
    with gzip.open(f"{name}.boxes.jsonl.gz", "rt", encoding="utf-8") as f:
        lines = [json.loads(s) for s in f]
    need(lines[0]["kind"] == "root" and lines[0]["beta"] == str(C.BETA) and lines[0]["c"] == str(C.C0), "assumptions of the record (β, c*)")
    need(lines[0]["NDEN"] == NDEN and lines[0]["DEN"] == DEN, "assumptions of the record (denominators)")
    nleaves = {}
    n = dict(ok=0, out=0, X=0, A=0, D=0, L=0, bad=0)
    for r in lines[1:]:
        key = (tuple(r["lo"]), tuple(r["hi"]))
        need(key not in nleaves, "the same n box appears twice")
        nleaves[key] = r
        n[r["kind"]] += 1
    need(n["X"] == 0, "split limit remains")
    for key, r in nleaves.items():
        lo, hi = r["lo"], r["hi"]
        if r["kind"] == "out":
            need(lo[1] > hi[0] or hi[1] < -hi[0], "an out box is outside D_n (entirely y > x or y < −x)")
            continue
        k = Fr(r["k"][0], r["k"][1])
        ml, mh = mirror(lo, hi)
        mr = nleaves.get((tuple(ml), tuple(mh)))
        need(mr is not None and mr["kind"] == "ok" and Fr(mr["k"][0], mr["k"][1]) == -k, "k-sum of the pair (N, σN) is 0")
        inL = C.n_inside_L(lo, hi)
        nb = C.NBox(lo, hi, k, C.BETA)
        rl = {}
        for lf in r["leaves"]:
            ch, rlo, rhi, kind = lf[0], lf[1], lf[2], lf[3]
            kk = (ch, tuple(rlo), tuple(rhi))
            need(kk not in rl, "the same R box appears twice")
            rl[kk] = 1
            if kind == "A":
                ok = C.box_lb(nb, C.rbox_polys(ch, rlo, rhi), lf[4], lf[5]) >= 0
            elif kind == "D":
                ok = lf[4] in NONID and C.discard_lb(C.rbox_polys(ch, rlo, rhi), ROT[lf[4]]) > 0
            elif kind == "L":
                ok = inL and k == 0 and C.r_inside_L(ch, rlo, rhi)
            else:
                ok = False
            n[kind] = n.get(kind, 0) + 1
            n["bad"] += (not ok)
        seen = 0
        cur = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
        while cur:
            nxt = []
            for ch, a, b in cur:
                if (ch, tuple(a), tuple(b)) in rl:
                    seen += 1; continue
                need(max(h - l for l, h in zip(a, b)) > 2, "a branch that never reaches an R leaf")
                for p, q in split3(a, b):
                    nxt.append((ch, p, q))
            cur = nxt
        need(seen == len(rl), "coverage of the R tree")
    # n tree: root [0,1]×[−1,1]
    seen = 0
    cur = [([0, -NDEN], [NDEN, NDEN])]
    first = True
    while cur:
        nxt = []
        for lo, hi in cur:
            if (tuple(lo), tuple(hi)) in nleaves:
                seen += 1; continue
            need(max(h - l for l, h in zip(lo, hi)) > 2, "a branch that never reaches an n leaf")
            if first:
                nxt += [([0, 0], [NDEN, NDEN]), ([0, -NDEN], [NDEN, 0])]
            else:
                nxt.extend(split2(lo, hi))
        first = False
        cur = nxt
    need(seen == len(nleaves), f"coverage of the n tree (recorded {len(nleaves)}, appeared in the tree {seen})")
    print(f"replay {name}: n boxes ok {n['ok']}, out {n['out']}; R leaves accepted {n['A']}, discarded {n['D']}, L {n['L']}; "
          f"failed {n['bad']}, coverage trees of n and R OK, k-sum 0 per pair, {time.time()-t0:.0f} s", flush=True)
    need(n["bad"] == 0, "failures present (not closed)")
    return n


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cmd"); ap.add_argument("--name", default=C.out_name("far")); ap.add_argument("--prob", default=None)
    ap.add_argument("--procs", type=int, default=4); ap.add_argument("--nmin", type=int, default=12)
    ap.add_argument("--budget", type=int, default=6000); ap.add_argument("--wmin-exp", type=int, default=12)
    ap.add_argument("--sample", type=int, default=None); ap.add_argument("--time-limit", type=int, default=7200)
    a = ap.parse_args()
    if a.cmd == "run":
        st = run(a.name, a.procs, a.nmin, a.budget, a.wmin_exp, a.sample, a.time_limit)
        sys.exit(0 if st["closed"] else 2)
    elif a.cmd == "replay":
        replay(a.name)
