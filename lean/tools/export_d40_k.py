"""A9i 7e-5：D40（tetintet）の遠方と局所をカーネルだけで、木を区間に分けて書き出す（2026-11-17）。

使い方:
  python -X utf8 lean/tools/export_d40_k.py [--fseg 20] [--lseg 10] [--per 15] [--only-far | --only-local]

元の D40/FarNNN.lean・LocNN.lean（native_decide）を読み、A9h（export_d28_far_k.py）・A9j（export_d31.py --kseg/--kfar）
と同じ形で並びを葉の数ごとの区間に切る。切れ目のスタックは Python で split3・lsplit を写してたどる
（ずれていてもカーネルで落ちるだけ）。局所の候補の部品は lean/tools/d40_items_print.lean が書く
pp/logs/d40_items.txt（中心ごとの candItems の値）を、中心ごとに 1 回カーネルで等式として示して使い回す。

  K/ItemsC.lean          中心 C の ceC・itC と ceC_eq（P.cens[C]? = some ceC）・itC_eq（candItems … = itC）
  K/LocKeyCF.lean        面 (C, F) の根の箱と切れ目のスタック
  K/LocSCF_g.lean        区間（lsegOk … = true、decide +kernel）を per 個ずつ
  K/Local.lean           runCF：(faceRun P C F tabC ltCF).1 = true（Formal/TetintLocalKD でつなぐ）
  K/FarKeyNNN.lean       元のファイル NNN の n の箱・κ_N と切れ目のスタック（片側 A・B）
  K/FarSNNN_j.lean       区間（wsegOk … = true）を per 個ずつ
  K/FarNNN.lean          runXXX：片側 A・B の (nbRun …).1 = true（Formal/TetintFarKD でつなぐ）
  K/Far.lean             ntoks・nboxes・ntree_ok・far_hb
  K/items.txt            d28_kfar_pool.py の一覧（前提:対象）
"""
import os, re, sys, glob, argparse

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), ".."))
ROOT = os.path.normpath(os.path.join(LEAN, ".."))
SRC = os.path.join(LEAN, "PackLean", "D40")
DST = os.path.join(SRC, "K")
NS = "PackLean.D40.Tet"
MOD = "PackLean.D40.K"
HEAD = "-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。\n"
OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"
TAC = "decide +kernel"
FTOK = re.compile(r"\.split|\(\.[LDA] \d+\)")
LTOK = re.compile(r"\.split|\(\.acc \d+\)")


def rd(p):
    return open(p, encoding="utf-8").read()


def wr(p, s):
    os.makedirs(os.path.dirname(p), exist_ok=True)
    open(p, "w", encoding="utf-8", newline="\n").write(s)


def toks_of(s, rx):
    ts = rx.findall(s)
    n = len([x for x in s.strip()[1:-1].split(",") if x.strip()])
    assert len(ts) == n, ("並びの読み違い", len(ts), n)
    return ts


def nest(xs, f):
    """[a, b, c] → f(a, f(b, c))（右結合。鎖の証明と同じ結合）"""
    if len(xs) == 1:
        return xs[0]
    return f(xs[0], nest(xs[1:], f))


# ---- 定数（D40/Data.lean から）----
DATA = rd(os.path.join(SRC, "Data.lean"))
DEN = int(re.search(r"\n  den := (\d+)", DATA).group(1))
DU = int(re.search(r"\n  du := (\d+)", DATA).group(1))


def rat(name):
    a, b = re.search(rf"\n  {name} := \((-?\d+), (\d+)\)", DATA).groups()
    a, b = int(a), int(b)
    assert (a * DU) % b == 0
    return a * DU // b


HM, R0 = rat("hmax"), rat("r0")


# ---- 遠方 ----
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


def fcut(toks, seg):
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
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


def far(seg, per):
    items, fars, tot = [], [], [0, 0, 0]
    for path in sorted(glob.glob(os.path.join(SRC, "Far[0-9][0-9][0-9].lean"))):
        g = re.search(r"Far(\d+)\.lean$", path).group(1)
        s = rd(path)
        boxes = re.findall(r"def nb(\d+) : NBox := (⟨[^⟩]*⟩)\ndef kN\1 : RatI := (\([^)]*\))\n", s)
        assert boxes and len(boxes) == len(re.findall(r"def nb\d+ : NBox", s)), "箱の書式が想定と違う"
        key = [HEAD, f"import PackLean.D40.Data\nimport PackLean.D40.FarSeg\n\nnamespace {NS}\nopen PackLean.D40\n\n"]
        units, comb = [], []
        for i, nb, kN in boxes:
            key.append(f"def nb{i} : NBox := {nb}\n\ndef kN{i} : RatI := {kN}\n\n")
            pf = {}
            for side, sd in (("A", 0), ("B", 1)):
                m = re.search(rf"def t{i}{side} : List Tok := (\[[^\]]*\])", s)
                ts = toks_of(m.group(1), FTOK)
                segs, keys = fcut(ts, seg)
                tot[2] += sum(1 for t in ts if t != ".split")
                ks = lambda j: "(rRoots P.den)" if j == 0 else ("[]" if j == len(keys) - 1 else f"k{i}{side}_{j}")
                for j in range(1, len(keys) - 1):
                    key.append(f"{OPTS}def k{i}{side}_{j} : List RBox := [{', '.join(rbox_s(b) for b in keys[j])}]\n\n")
                for j, sg in enumerate(segs):
                    units.append(f"{OPTS}def t{i}{side}_{j} : List Tok := [{', '.join(sg)}]\n\n"
                                 f"{OPTS}theorem s{i}{side}_{j} : wsegOk P {sd} nb{i} kN{i} {ks(j)} t{i}{side}_{j} {ks(j + 1)} = true := by\n"
                                 f"  {TAC}\n\n")
                    tot[1] += 1
                tl = nest([f"t{i}{side}_{j}" for j in range(len(segs))], lambda a, b: f"{a} ++ ({b})")
                ch = nest([f"(wseg_of s{i}{side}_{j})" for j in range(len(segs))], lambda a, b: f"(wseg_append {a} {b})")
                pf[side] = (tl, ch)
            comb.append(f"{OPTS}def t{i}A : List Tok := {pf['A'][0]}\n\n{OPTS}def t{i}B : List Tok := {pf['B'][0]}\n\n"
                        f"{OPTS}/-- 遠方の n の箱 {i}：片側 A・B の R の木がカーネルだけで通る。 -/\n"
                        f"theorem run{i} : (nbRun P nb{i} 0 kN{i} t{i}A).1 = true ∧ (nbRun P nb{i} 1 kN{i} t{i}B).1 = true :=\n"
                        f"  ⟨nbRun_of (by {TAC}) {pf['A'][1]},\n   nbRun_of (by {TAC}) {pf['B'][1]}⟩\n\n")
            tot[0] += 1
        key.append(f"end {NS}\n")
        wr(os.path.join(DST, f"FarKey{g}.lean"), "".join(key))
        files = []
        for j in range(0, len(units), per):
            nm = f"FarS{g}_{j // per}"
            files.append(nm)
            wr(os.path.join(DST, f"{nm}.lean"),
               HEAD + f"import {MOD}.FarKey{g}\n\nnamespace {NS}\nopen PackLean.D40\n\n" + "".join(units[j:j + per]) + f"end {NS}\n")
        imps = "".join(f"import {MOD}.{nm}\n" for nm in files)
        wr(os.path.join(DST, f"Far{g}.lean"),
           HEAD + imps + "import PackLean.Formal.TetintFarKD\n\n" + f"namespace {NS}\nopen PackLean.D40\n"
           "open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)\n\n" + "".join(comb) + f"end {NS}\n")
        M = MOD + "."
        items += [f"{M}FarKey{g}"] + [f"{M}FarKey{g}:{M}{f}" for f in files]
        items.append(",".join(M + f for f in files) + f":{M}Far{g}")
        fars.append((g, [b[0] for b in boxes]))
    # まとめ：n の木と箱の表は元の D40/Far.lean から写す
    s = rd(os.path.join(SRC, "Far.lean"))
    ntoks = re.search(r"def ntoks : List NTok := (\[[^\]]*\])", s).group(1)
    nboxes = re.search(r"def nboxes : List \(Int × Int × Int × Int\) := (\[[^\]]*\])", s).group(1)
    allb = [i for _, bs in fars for i in bs]
    hb = "fun _ h => nomatch h"
    for i in reversed(allb):
        hb = f"List.forall_mem_cons.2 ⟨⟨nb{i}, kN{i}, t{i}A, t{i}B, rfl, run{i}.1, run{i}.2⟩, {hb}⟩"
    body = (f"{OPTS}/-- n の木（前順）。D40/Far.lean と同じ。 -/\ndef ntoks : List NTok := {ntoks}\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := {nboxes}\n\n"
            f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {TAC}\n\n"
            f"{OPTS}/-- 遠方の全部の n の箱の片側 A・B の R の木がカーネルだけで通る（`TetintCover.far_cert` の `hb` の形）。 -/\n"
            f"theorem far_hb : ∀ b ∈ nboxes, ∃ nb kN tA tB, cornersD nb = b ∧\n"
            f"    (nbRun P nb 0 kN tA).1 = true ∧ (nbRun P nb 1 kN tB).1 = true :=\n  {hb}\n\n")
    imps = "".join(f"import {MOD}.Far{g}\n" for g, _ in fars)
    wr(os.path.join(DST, "Far.lean"), HEAD + imps + "import PackLean.Formal.TetintCover\n\n"
       f"namespace {NS}\nopen PackLean.D40\nopen PackLean.Formal.TetintCover (cornersD)\n\n{body}end {NS}\n")
    items.append(",".join(f"{MOD}.Far{g}" for g, _ in fars) + f":{MOD}.Far")
    print(f"遠方：n の箱 {tot[0]}・区間 {tot[1]}・葉 {tot[2]}・モジュール {len(items)}", flush=True)
    return items


# ---- 局所 ----
def zlo(tube):
    return [0, -1, -1, -1] if tube else [0, 0, -1, -1, -1]


def face_list(tube):
    out = []
    for i, z in enumerate(zlo(tube)):
        out.append((i, 1))
        if z < 0:
            out.append((i, -1))
    return out


def root_box(tube, fi, fv):
    zl = zlo(tube)
    zL = [fv * DU if j == fi else zl[j] * DU for j in range(len(zl))]
    zH = [fv * DU if j == fi else DU for j in range(len(zl))]
    return ([0, 0] + zL, [HM, R0] + zH) if tube else ([0] + zL, [R0] + zH)


def full_w(tube):
    return [HM, R0] + [2 * DU] * 4 if tube else [R0] + [2 * DU] * 5


def lsplit(lo, hi, full):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0
    for i in range(len(w)):
        if w[i] * full[ax] > w[ax] * full[i]:
            ax = i
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def lcut(toks, lo0, hi0, full, seg):
    stack = [(lo0, hi0)]
    segs, cur, keys, nl = [], [], [None], 0
    for t in toks:
        assert stack, "スタックが空のまま並びが続く"
        lo, hi = stack.pop(0)
        cur.append(t)
        if t == ".split":
            p, q = lsplit(lo, hi, full); stack = [p, q] + stack
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


def lbox_s(b):
    return f"⟨[{', '.join(map(str, b[0]))}], [{', '.join(map(str, b[1]))}]⟩"


def local(seg, per):
    ip = os.path.join(ROOT, "pp", "logs", "d40_items.txt")
    assert os.path.exists(ip), "先に lean/ で lake env lean tools/d40_items_print.lean"
    IT = {}
    for ln in rd(ip).splitlines():
        c, tube, txt = ln.split(" ", 2)
        IT[int(c)] = (tube == "true", txt)
    items, runs, tot = [], {}, [0, 0, 0]
    for c, (tube, txt) in sorted(IT.items()):
        wr(os.path.join(DST, f"Items{c}.lean"),
           HEAD + f"import PackLean.D40.Data\nimport PackLean.D40.LocalSeg\n\nnamespace {NS}\nopen PackLean.D40\n\n"
           f"/-- 中心 {c}。 -/\ndef ce{c} : Cen := P.cens.getD {c} ⟨[], 0, true⟩\n\n"
           f"{OPTS}theorem ce{c}_eq : P.cens[{c}]? = some ce{c} := by {TAC}\n\n"
           f"{OPTS}theorem ce{c}_tube : ce{c}.tube = {'true' if tube else 'false'} := by {TAC}\n\n"
           f"{OPTS}/-- 中心 {c} の候補の部品（Lean の candItems の値を書き写したもの、tools/d40_items_print.lean）。 -/\n"
           f"def it{c} : List (Bool × Poly × Poly) := {txt}\n\n"
           f"{OPTS}theorem it{c}_eq : candItems P ce{c} tab{c} = it{c} := by {TAC}\n\nend {NS}\n")
        items.append(f"{MOD}.Items{c}")
    for path in sorted(glob.glob(os.path.join(SRC, "Loc[0-9][0-9].lean"))):
        s = rd(path)
        for mt in re.finditer(r"def lt(\d)(\d) : List LTok := (\[[^\]]*\])", s):
            c, f, toks = int(mt.group(1)), int(mt.group(2)), mt.group(3)
            tube = IT[c][0]
            fi, fv = face_list(tube)[f]
            lo0, hi0 = root_box(tube, fi, fv)
            ts = toks_of(toks, LTOK)
            segs, keys = lcut(ts, lo0, hi0, full_w(tube), seg)
            nm = f"{c}{f}"
            tot[0] += 1; tot[1] += len(segs); tot[2] += sum(1 for t in ts if t != ".split")
            ks = lambda j: f"[⟨lo{nm}, hi{nm}⟩]" if j == 0 else ("[]" if j == len(keys) - 1 else f"k{nm}_{j}")
            keyt = "".join(f"{OPTS}def k{nm}_{j} : List LBox := [{', '.join(lbox_s(b) for b in keys[j])}]\n\n"
                           for j in range(1, len(keys) - 1))
            wr(os.path.join(DST, f"LocKey{nm}.lean"),
               HEAD + f"import {MOD}.Items{c}\n\nnamespace {NS}\nopen PackLean.D40\n\n"
               f"/-- 局所：中心 {c}・面 {(fi, fv)}（faceList の {f} 番）。区間 {len(segs)}（葉 {seg} 個ごと）。 -/\n"
               f"def lo{nm} : List Int := [{', '.join(map(str, lo0))}]\n\ndef hi{nm} : List Int := [{', '.join(map(str, hi0))}]\n\n"
               + keyt + f"end {NS}\n")
            units = [f"{OPTS}def t{nm}_{j} : List LTok := [{', '.join(segs[j])}]\n\n"
                     f"{OPTS}theorem s{nm}_{j} : lsegOk P ce{c}.tube (fullW P ce{c}.tube) it{c} {ks(j)} t{nm}_{j} {ks(j + 1)} = true := by\n"
                     f"  {TAC}\n\n" for j in range(len(segs))]
            files = []
            for j in range(0, len(units), per):
                m = f"LocS{nm}_{j // per}"
                files.append(m)
                wr(os.path.join(DST, f"{m}.lean"),
                   HEAD + f"import {MOD}.LocKey{nm}\n\nnamespace {NS}\nopen PackLean.D40\n\n" + "".join(units[j:j + per]) + f"end {NS}\n")
            M = MOD + "."
            items += [f"{M}Items{c}:{M}LocKey{nm}"] + [f"{M}LocKey{nm}:{M}{x}" for x in files]
            tl = nest([f"t{nm}_{j}" for j in range(len(segs))], lambda a, b: f"{a} ++ ({b})")
            ch = nest([f"(lseg_of s{nm}_{j})" for j in range(len(segs))], lambda a, b: f"(lseg_append {a} {b})")
            runs[(c, f)] = (nm, fi, fv, tl, ch, files)
    imps = "".join(f"import {MOD}.{x}\n" for r in runs.values() for x in r[5])
    body = ""
    for (c, f), (nm, fi, fv, tl, ch, _) in sorted(runs.items()):
        body += (f"{OPTS}def lt{nm} : List LTok := {tl}\n\n"
                 f"{OPTS}/-- 局所：中心 {c}・面 {f} の木がカーネルだけで通る。 -/\n"
                 f"theorem run{nm} : (faceRun P {c} {f} tab{c} lt{nm}).1 = true :=\n"
                 f"  faceRun_of (fi := {fi}) (fv := {fv}) (lo := lo{nm}) (hi := hi{nm}) ce{c}_eq\n"
                 f"    (by {TAC}) (by {TAC}) it{c}_eq\n    {ch}\n\n")
    wr(os.path.join(DST, "Local.lean"), HEAD + imps + "import PackLean.Formal.TetintLocalKD\n\n"
       f"namespace {NS}\nopen PackLean.D40\nopen PackLean.Formal.TetintLocalKD (faceRun_of lseg_of lseg_append)\n\n{body}end {NS}\n")
    allf = [f"{MOD}.{x}" for r in runs.values() for x in r[5]]
    items.append(",".join(allf) + f":{MOD}.Local")
    print(f"局所：面 {tot[0]}・区間 {tot[1]}・葉 {tot[2]}・モジュール {len(items)}", flush=True)
    return items


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--fseg", type=int, default=20)
    ap.add_argument("--lseg", type=int, default=10)
    ap.add_argument("--per", type=int, default=15)
    ap.add_argument("--only-far", action="store_true")
    ap.add_argument("--only-local", action="store_true")
    a = ap.parse_args()
    items = []
    if not a.only_far:
        items += local(a.lseg, a.per)
    if not a.only_local:
        items += far(a.fseg, a.per)
    wr(os.path.join(DST, "items.txt"), "\n".join(items) + "\n")
