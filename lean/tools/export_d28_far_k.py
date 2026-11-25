"""A9h 7b-5（2）：D28（icointet・cubintet）の遠方をカーネルだけで、R の木を区間に分けて書き出す。

使い方:
  python -X utf8 lean/tools/export_d28_far_k.py [Ico|Cub ...] [--seg 葉の数] [--per 区間の数] [--groups 0,1]

組ごと 1 定理（export_d28_kernel.py の K/FarNNN）は上限 6 GB で全部落ちた（11/16）。
A9j の D31 遠方（export_d31.py --kfar）と同じ形で、元の D28/<件>/FarNNN.lean（native_decide）を読み、
組の 2 つの R の木（N と鏡 M）の並びを葉 seg 個ごとの区間に切り、切れ目のスタックを Python で
たどって書く（split3 を写す。ずれていてもカーネルで落ちるだけ）。

  K/FarKeyNNN.lean     元のファイル NNN の組の n の箱（nbN・nbM）と切れ目のスタック（kN・kM）
  K/FarSNNN_j.lean     区間（並び tN/tM と sN/sM : wsegOk … = true、decide +kernel）を per 個ずつ
  K/FarNNN.lean        組 pairXXX（並びは区間の ++）と pairXXX_ok（命題は元と同じ、Formal/TetFarKD でつなぐ）
K/Far.lean・K/Consts.lean は export_d28_kernel.py の書いたものをそのまま使う（名前・命題が同じ）。
"""
import os, re, sys, glob, argparse

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
HEAD = "-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
TOK = re.compile(r"\.split|\.L\b|\(\.D \d+\)|\(\.A(?: \d+)+\)")


def rd(p):
    return open(p, encoding="utf-8").read()


def wr(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    open(p, "w", encoding="utf-8", newline="\n").write(s)


def toks_of(s):
    ts = TOK.findall(s)
    n = len([x for x in s.strip()[1:-1].split(",") if x.strip()])
    assert len(ts) == n, ("並びの読み違い", len(ts), n)
    return ts


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    if w[0] >= w[1] and w[0] >= w[2]:
        ax = 0
    elif w[1] >= w[2]:
        ax = 1
    else:
        ax = 2
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def cut(toks, den, seg):
    """並びを葉 seg 個ごとに切り、区間と切れ目のスタック（keys[i] は区間 i の始め、最後は []）。"""
    stack = [(ch, [-den] * 3, [den] * 3) for ch in range(4)]
    segs, cur, keys, nl = [], [], [None], 0
    for t in toks:
        assert stack, "スタックが空のまま並びが続く"
        ch, lo, hi = stack.pop(0)
        cur.append(t)
        if t == ".split":
            p, q = split3(lo, hi); stack = [(ch, *p), (ch, *q)] + stack
        else:
            nl += 1
            if nl % seg == 0 and stack:
                segs.append(cur); cur = []; keys.append(list(stack))
    assert not stack, "並びの終わりでスタックが空でない"
    if cur:
        segs.append(cur); keys.append([])
    else:
        keys[-1] = []
    return segs, keys


def rbox_s(b):
    ch, lo, hi = b
    return f"⟨{ch}, {lo[0]}, {lo[1]}, {lo[2]}, {hi[0]}, {hi[1]}, {hi[2]}⟩"


def key_s(case, side, p, i, keys):
    if i == 0:
        return "(rRoots P.rden)"
    if i == len(keys) - 1:
        return "[]"
    return f"k{side}{p}_{i}"


def nest(xs, f):
    """[a, b, c] → f(a) ++ (f(b) ++ (f(c)))"""
    if len(xs) == 1:
        return xs[0]
    return f(xs[0], nest(xs[1:], f))


def group(case, path, den, seg, per):
    g = re.search(r"Far(\d+)\.lean$", path).group(1)
    s = rd(path)
    pairs = re.findall(r"def pair(\d+) : Pair where\n  nb := (⟨[^⟩]*⟩)\n  kmNum := (-?\d+)\n  kmDen := (\d+)\n"
                       r"  toksN := (\[[^\]]*\])\n  toksM := (\[[^\]]*\])\n", s)
    assert pairs and len(pairs) == len(re.findall(r"def pair\d+ : Pair", s)), "組の書式が想定と違う"
    ns = f"PackLean.D28.{case}"
    mod = f"PackLean.D28.{case}.K"
    dst = os.path.join(LEAN, "PackLean", "D28", case, "K")
    key = [HEAD, f"import PackLean.D28.{case}.Data\nimport PackLean.D28.FarSeg\n\nnamespace {ns}\nopen PackLean.D28\n\n"]
    units = []   # (本文) の区間ごと
    comb = []
    nseg = 0; nleaf = 0
    for p, nb, km, kd, tn, tm in pairs:
        kmS = f"({km})" if str(km).startswith("-") else km   # 負の km は括弧（11/17、無いと `nbN - (6511 8388608)` と読まれ FarKey027 などが落ちた）
        key.append(f"def nbN{p} : NBox := {nb}\n\ndef nbM{p} : NBox := mirror nbN{p} {kmS} {kd}\n\n")
        runs = {}
        for side, ts in (("N", toks_of(tn)), ("M", toks_of(tm))):
            segs, keys = cut(ts, den, seg)
            runs[side] = len(segs)
            nleaf += sum(1 for t in ts if t != ".split")
            for i in range(1, len(keys) - 1):
                key.append(f"{OPTS}def k{side}{p}_{i} : List RBox := [{', '.join(rbox_s(b) for b in keys[i])}]\n\n")
            for i, sg in enumerate(segs):
                nbs = f"nb{side}{p}"
                units.append(f"{OPTS}def t{side}{p}_{i} : List Tok := [{', '.join(sg)}]\n\n"
                             f"{OPTS}theorem s{side}{p}_{i} : wsegOk P {nbs} (nInsideL P {nbs}) "
                             f"{key_s(case, side, p, i, keys)} t{side}{p}_{i} {key_s(case, side, p, i + 1, keys)} = true := by\n"
                             f"  decide +kernel\n\n")
                nseg += 1
        tl = {sd: nest([f"t{sd}{p}_{i}" for i in range(runs[sd])], lambda a, b: f"{a} ++ ({b})") for sd in "NM"}
        pf = {sd: nest([f"(wseg_of s{sd}{p}_{i})" for i in range(runs[sd])], lambda a, b: f"(wseg_append {a} {b})")
              for sd in "NM"}
        comb.append(f"def pair{p} : Pair where\n  nb := nbN{p}\n  kmNum := {km}\n  kmDen := {kd}\n"
                    f"  toksN := {tl['N']}\n  toksM := {tl['M']}\n\n"
                    f"{OPTS}/-- 組 {p}：区間 N {runs['N']}・M {runs['M']}。 -/\n"
                    f"theorem pair{p}_ok : pairOk P pair{p} = true :=\n"
                    f"  pairOk_of (by decide +kernel)\n"
                    f"    (rtree_of (by decide +kernel) {pf['N']})\n"
                    f"    (rtree_of (by decide +kernel) {pf['M']})\n\n")
    key.append(f"end {ns}\n")
    wr(os.path.join(dst, f"FarKey{g}.lean"), "".join(key))
    files = []
    for j in range(0, len(units), per):
        nm = f"FarS{g}_{j // per}"
        files.append(nm)
        wr(os.path.join(dst, f"{nm}.lean"),
           HEAD + f"import {mod}.FarKey{g}\n\nnamespace {ns}\nopen PackLean.D28\n\n" + "".join(units[j:j + per]) + f"end {ns}\n")
    imps = "".join(f"import {mod}.{nm}\n" for nm in files)
    wr(os.path.join(dst, f"Far{g}.lean"),
       HEAD + imps + "import PackLean.Formal.TetFarKD\n\n" + f"namespace {ns}\nopen PackLean.D28\n"
       "open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)\n\n" + "".join(comb) + f"end {ns}\n")
    return g, files, len(pairs), nseg, nleaf


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("cases", nargs="*", default=["Ico", "Cub"])
    ap.add_argument("--seg", type=int, default=20)
    ap.add_argument("--per", type=int, default=6)
    ap.add_argument("--groups", default="")
    a = ap.parse_args()
    for case in a.cases:
        src = os.path.join(LEAN, "PackLean", "D28", case)
        den = int(re.search(r"rden := (\d+)", rd(os.path.join(src, "Data.lean"))).group(1))
        only = {int(x) for x in a.groups.split(",") if x} if a.groups else None
        mods = []; tot = [0, 0, 0]; items = []; fars = []
        for p in sorted(glob.glob(os.path.join(src, "Far[0-9][0-9][0-9].lean"))):
            gi = int(re.search(r"Far(\d+)\.lean$", p).group(1))
            if only is not None and gi not in only:
                continue
            g, files, npair, nseg, nleaf = group(case, p, den, a.seg, a.per)
            M = f"PackLean.D28.{case}.K."
            mods += [M + f for f in files] + [f"{M}Far{g}"]
            items += [f"{M}FarKey{g}"] + [f"{M}FarKey{g}:{M}{f}" for f in files]
            items.append(",".join(M + f for f in files) + f":{M}Far{g}")
            fars.append(f"{M}Far{g}")
            tot[0] += npair; tot[1] += nseg; tot[2] += nleaf
        wr(os.path.join(src, "K", "farmods.txt"), "\n".join(mods) + "\n")
        if only is None:
            items.append(",".join(fars) + f":PackLean.D28.{case}.K.Far")
        # d28_kfar_pool.py の一覧（前提:対象）
        wr(os.path.join(src, "K", "faritems.txt"), "\n".join(items) + "\n")
        print(f"{case}: 組 {tot[0]}・区間 {tot[1]}・葉 {tot[2]}・モジュール {len(mods)}（K/farmods.txt）")
