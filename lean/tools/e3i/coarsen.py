"""E3i（2026-11-18）：D45DT の遠方の R の木で、兄弟の葉 2 つを親 1 つにまとめた並びを作る（所要時間の短縮）。

E3h の下見（lean/tools/e3h/coarsen_probe.py、無作為 200 組で葉 24.7% 減・秒の重みで 26.7% 減）の本番。
健全性の形（Formal/E3iFar.lean の TreeR）は「何らかの木で 4 枚の地図を覆えた」ことだけを使うので、
元の記録（D45DT/FarNNN.lean）の並びと一致させる必要はない（n の箱・κ・形は記録のまま）。

判定は pp/global_opt/d45_dodintet_far.py の box_lb・discard_lb（正確）で、κ は Lean と同じ κ″（分母 3^50 に
切り上げたもの）。√ の括弧（3^76）と箱の約分は Python では見ないので、書き出した後に Lean の #eval で全部を
下見し、落ちた木は元の並びに戻す（export.py --coarse の --fallback）。

使い方: python -X utf8 lean/tools/e3i/coarsen.py [--files 0-50] [--procs 8]
  出力：lean/PackLean/E3i/Coarse/F{f}.json.gz（git に入れない）：[{"p": 組, "tU": 並び, "tL": 並び}, …]
  まとめ：pp/logs/e3i_coarsen.txt に 1 ファイル 1 行
"""
import os, sys, gzip, json, time, argparse, itertools
from fractions import Fraction as Fr

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "e3h"))
import export_dt_seg as X  # noqa: E402

GO = os.path.normpath(os.path.join(HERE, "..", "..", "..", "pp", "global_opt"))
OUTD = os.path.join(X.LEAN, "PackLean", "E3i", "Coarse")
LOGF = os.path.normpath(os.path.join(X.LEAN, "..", "pp", "logs", "e3i_coarsen.txt"))
F = None
np = None


def init():
    global F, np
    sys.path.insert(0, GO)
    os.chdir(GO)
    import numpy
    import d45_dodintet_far as mod
    F, np = mod, numpy


def parse(toks, i, b):
    """並び toks の i 番目から箱 b = (ch, lo, hi) の部分木を読む → (節, 次の位置)。
    節 = (b, 葉 or None, [子 2 つ] or None)、葉 = ("L",) / ("D", m) / ("A", v0, (f0, f1, None, f3))"""
    c = toks[i]
    if c == ".":
        p, q = X.split3(b)
        n1, i = parse(toks, i + 1, p)
        n2, i = parse(toks, i, q)
        return (b, None, [n1, n2]), i
    if c == "L":
        return (b, ("L",), None), i + 1
    if c == "D":
        return (b, ("D", X.DIG.index(toks[i + 1])), None), i + 2
    if c == "A":
        v0, f0, f1, f3 = (X.DIG.index(toks[i + k]) for k in range(1, 5))
        return (b, ("A", v0, (f0, f1, None, f3)), None), i + 5
    raise ValueError(("字の読み違い", i, c))


def ser(node, out):
    b, leaf, kids = node
    if kids is not None:
        out.append(".")
        ser(kids[0], out); ser(kids[1], out)
    elif leaf[0] == "L":
        out.append("L")
    elif leaf[0] == "D":
        out.append("D" + X.DIG[leaf[1]])
    else:
        _, v0, vf = leaf
        out.append("A" + X.DIG[v0] + X.DIG[vf[0]] + X.DIG[vf[1]] + X.DIG[vf[3]])


def try_leaf(tb, b, kids, pc):
    ch, lo, hi = b
    rp = F.rbox_polys(ch, lo, hi)
    for k in kids:
        if k[0] == "D" and F.discard_lb(rp, F.ROTFE[k[1]]) > 0:
            return ("D", k[1])
    cen = [(l + h) / 2 / X.DEN for l, h in zip(lo, hi)]
    Rf = F.rot_f(F.C28.q_of(ch, cen))
    args = [(k[1], tuple(k[2])) for k in kids if k[0] == "A"]
    c0 = F.choose(pc, Rf)
    args.append((int(c0[0]), tuple(c0[1])))
    Xv = F.VF @ Rf.T
    v0s = [int(i) for i in np.argsort(-(Xv @ pc))[:3]]
    fs = [[None] if f == F.B2 else [int(i) for i in np.argsort(-(Xv @ F.BF[f]))[:2]] for f in range(4)]
    for v0 in v0s:
        for vf in itertools.product(*fs):
            args.append((v0, tuple(vf)))
    seen = set()
    for v0, vf in args:
        if (v0, vf) in seen:
            continue
        seen.add((v0, vf))
        if F.box_lb(tb, rp, v0, vf) >= 0:
            return ("A", v0, (vf[0], vf[1], None, vf[3]))
    m = F.discard(ch, lo, hi, Rf)
    if m is not None:
        return ("D", m)
    return None


def coarsen(node, tb, pc, st):
    b, leaf, kids = node
    if kids is None:
        return node
    k1 = coarsen(kids[0], tb, pc, st)
    k2 = coarsen(kids[1], tb, pc, st)
    node = (b, None, [k1, k2])
    if k1[2] is not None or k2[2] is not None or k1[1][0] == "L" or k2[1][0] == "L":
        return node
    r = try_leaf(tb, b, [k1[1], k2[1]], pc)
    if r is None:
        return node
    st["merged"] += 1
    return (b, r, None)


def nleaves(node):
    return 1 if node[2] is None else nleaves(node[2][0]) + nleaves(node[2][1])


def one(task):
    f, p, r = task
    l0, l1, h0, h1 = r["nb"]
    out = {"p": p}
    st = {"merged": 0, "before": 0}
    for side, key in ((0, "tU"), (1, "tL")):
        _, _, kap2 = X.var2_consts(r, side)
        tb = F.TBox(side, tuple(Fr(k, X.KD2) for k in kap2), [l0, l1], [h0, h1])
        xc = (l0 + h0) / 2 / X.ND; yc = (l1 + h1) / 2 / X.ND
        pc = np.array([xc, yc if side == 0 else -yc, 1.0])
        toks = r[key]
        i = 0
        res = []
        for ch in range(4):
            node, i = parse(toks, i, (ch, [-X.DEN] * 3, [X.DEN] * 3))
            st["before"] += nleaves(node)
            node = coarsen(node, tb, pc, st)
            ser(node, res)
        assert i == len(toks)
        out[key] = "".join(res)
    return f, out, st


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--files", default="0-50")
    ap.add_argument("--procs", type=int, default=8)
    a = ap.parse_args()
    lo, hi = map(int, a.files.split("-")) if "-" in a.files else (int(a.files), int(a.files))
    os.makedirs(OUTD, exist_ok=True)
    from multiprocessing import Pool
    t0 = time.time()
    with Pool(a.procs, initializer=init) as pool:
        for f in range(lo, hi + 1):
            path = os.path.join(OUTD, f"F{f:03d}.json.gz")
            if os.path.exists(path):
                continue
            recs = X.records(f)
            tasks = [(f, p, r) for p, r in enumerate(recs)]
            outs = [None] * len(recs)
            tot = {"merged": 0, "before": 0}
            for _, o, st in pool.imap_unordered(one, tasks, chunksize=2):
                outs[o["p"]] = o
                for k in tot:
                    tot[k] += st[k]
            with gzip.open(path + ".tmp", "wt", encoding="utf-8") as g:
                json.dump(outs, g)
            os.replace(path + ".tmp", path)
            line = (f"F{f:03d}: 組 {len(recs)}、葉 {tot['before']} → {tot['before'] - tot['merged']}"
                    f"（{tot['merged'] / max(1, tot['before']):.1%} 減）、経過 {time.time() - t0:.0f} 秒")
            os.makedirs(os.path.dirname(LOGF), exist_ok=True)   # 新しい写しには pp/logs が無い（11/23 E3i4 で exit 1）
            open(LOGF, "a", encoding="utf-8").write(line + "\n")
            print(line, flush=True)
    print(f"== 終わり：{time.time() - t0:.0f} 秒", flush=True)


if __name__ == "__main__":
    main()
