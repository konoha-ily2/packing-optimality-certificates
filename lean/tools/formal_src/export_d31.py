"""Q57：D31（octintet_n02、s* = 3）の大域最適の証明書の**算術**を Lean に書き出す（2026-11-13）。

pp/global_opt/ の d31_* は読むだけ（変えない）。書き出すのは lean/PackLean/D31/ の下：
  Core.lean        … 手で書いた判定（このスクリプトは書かない）
  Data.lean        … 定数（d31_common の値と記録の頭の値、駒の回転 ROT_NONID）
  Consts.lean      … 定数の確かめ（回転が符号つき置換で det = 1、定数の形、局所の 0 次の恒等式）
  FarNNN.lean      … 遠方の n の箱ごとの R の木（前順の並び）と定理（受理・捨てた・L の数が Python の記録と同じ）
  Far.lean         … n の木と、遠方の全部をまとめた定理 far_all
  LocJNN.lean・LocCNN.lean … 局所の面・側ごとの木と定理（受理の数が Python の記録と同じ）
  Local.lean       … 局所の全部をまとめた定理
数字は Python の記録をそのまま書き出す（手で写さない）。判定の多項式（遠方の 2 次式・局所の多項式）は Lean が組み立てる。
局所の木は記録の葉の集合から、d31_local.split と同じ割り方で前順の並びに直す（探索は回し直さない）。

使い方（packing-lab の直下で）：
  python -X utf8 lean/tools/export_d31.py                      # 本体（native_decide）
  python -X utf8 lean/tools/export_d31.py --kernel             # カーネルの試し（Kernel/ に一部だけ、decide +kernel）
  python -X utf8 lean/tools/export_d31.py --inject <種類>      # 誤りを入れた版（Test/<種類>/ に影響する部分だけ）
  python -X utf8 lean/tools/export_d31.py --build <モジュール> ...   # 1 本ずつ lake build（BelowNormal）
"""
import argparse
import gzip
import hashlib
import json
import math
import os
import subprocess
import sys
import time
from fractions import Fraction as Fr
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
GO = ROOT / "pp" / "global_opt"
LEAN = ROOT / "lean"
OUTBASE = LEAN / "PackLean" / "D31"

INJECTS = ["farA", "farD", "farDrop", "farOut", "farL", "uJ", "uJbig", "locCandJ", "locCandC", "locE", "locDrop"]

ap = argparse.ArgumentParser()
ap.add_argument("--kernel", action="store_true")
ap.add_argument("--inject", default=None, choices=INJECTS)
ap.add_argument("--chunk", type=int, default=4000, help="1 ファイルの並びの長さの目安（遠方）")
ap.add_argument("--build", nargs="*", default=None)
ap.add_argument("--kseg", type=int, default=0, help="局所のカーネル版（K/）：1 区間の葉の数（A9j 7d-5）")
ap.add_argument("--per-file", type=int, default=6, help="--kseg・--kfar：1 ファイルの区間の数")
ap.add_argument("--kfar", type=int, default=0, help="遠方のカーネル版（K/）：1 区間の葉の数（A9j 7d-5）")
ap.add_argument("--log", default=None)
a = ap.parse_args()


def build(mods, log=None):
    """モジュールを 1 本ずつ lake build（Lean は同時に 1 本、BelowNormal）。"""
    try:
        import psutil
    except Exception:
        psutil = None
    res = []
    lf = open(log, "a", encoding="utf-8") if log else None
    for m in mods:
        t0 = time.time()
        p = subprocess.Popen(["lake", "build", m], cwd=LEAN, stdout=subprocess.PIPE, stderr=subprocess.STDOUT,
                             creationflags=getattr(subprocess, "CREATE_NO_WINDOW", 0))
        if psutil:
            try:
                psutil.Process(p.pid).nice(psutil.BELOW_NORMAL_PRIORITY_CLASS)
            except Exception:
                pass
        out, _ = p.communicate()
        dt = time.time() - t0
        txt = out.decode("utf-8", "replace")
        ok = p.returncode == 0
        line = f"{time.strftime('%H:%M:%S')} {m}: {'通った' if ok else '落ちた'}（{dt:.0f} 秒）"
        print(line, flush=True)
        tail = "\n".join(l for l in txt.splitlines() if ("error" in l.lower() or "axioms" in l or "depends on" in l
                                                           or l.startswith("  ") or "✖" in l))[-4000:]
        if lf:
            lf.write(line + "\n" + tail + "\n"); lf.flush()
        if not ok:
            print(tail[-2000:], flush=True)
        res.append((m, ok, dt))
    return res


if a.build is not None:
    r = build(a.build, a.log)
    sys.exit(0 if all(ok for _, ok, _ in r) else 1)

sys.path.insert(0, str(GO))
import d31_common as dc  # noqa: E402

ND, DEN = dc.ND, dc.DEN
DU = 2 ** 30
CONSTS = ("R_J", "U_J", "K_J", "R_C", "U_1", "U_C_MAX")
FAR_REC = GO / "d31_far.boxes.jsonl.gz"
LOC_REC = {"J": GO / "d31_local_J.leaves.jsonl.gz", "C": GO / "d31_local_C.leaves.jsonl.gz"}


def need(c, msg):
    if not c:
        raise RuntimeError(msg)


def sha(p):
    return hashlib.sha256(open(p, "rb").read()).hexdigest()


def read_gz(p):
    with gzip.open(p, "rt", encoding="utf-8") as f:
        return [json.loads(s) for s in f]


# ---------- 記録を読む・前提を照合 ----------
FAR = read_gz(FAR_REC)
LOC = {k: read_gz(p) for k, p in LOC_REC.items()}
hd = FAR[0]
need(hd["kind"] == "root" and hd["ND"] == ND and hd["DEN"] == DEN, "遠方の記録の頭")
for k in CONSTS:
    need(hd[k] == str(getattr(dc, k)), f"遠方の記録の {k}")
    for kd in ("J", "C"):
        need(LOC[kd][0][k] == hd[k], f"局所 {kd} の記録の {k}")
for kd in ("J", "C"):
    need(LOC[kd][0]["region"] == kd and LOC[kd][0]["DU"] == DU and not LOC[kd][0]["flip"] and LOC[kd][0]["c_shift"] == "0",
         f"局所 {kd} の記録の頭")
CVAL = {k: Fr(hd[k]) for k in CONSTS}
SHAS = {str(p.relative_to(ROOT)).replace("\\", "/"): sha(p) for p in [FAR_REC, *LOC_REC.values()]}

# ---------- 遠方：n の木と R の木を前順の並びに ----------


def split2(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = 0 if w[0] >= w[1] else 1; mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def split3(lo, hi):
    w = [h - l for l, h in zip(lo, hi)]
    ax = max(range(3), key=lambda x: (w[x], -x)); mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def cand_code(c):
    d = [2 * i + (1 if s == -1 else 0) for i, s in c]
    need(all(0 <= x < 6 for x in d), "候補の番号")
    return ((d[0] * 6 + d[1]) * 6 + d[2]) * 6 + d[3]


def code_cand(code):
    ds = [code // 216 % 6, code // 36 % 6, code // 6 % 6, code % 6]
    return tuple((x // 2, 1 if x % 2 == 0 else -1) for x in ds)


nrec = {}
for r in FAR[1:]:
    key = (tuple(r["lo"]), tuple(r["hi"]))
    need(key not in nrec, "同じ n の箱が 2 回")
    nrec[key] = r
need(all(r["kind"] in ("ok", "out") for r in nrec.values()), "X の箱がある")


def rtoks(leaves):
    """R の木（4 枚の地図）を前順の並びに。葉は (地図, lo, hi) → 葉の記録。"""
    lv = {(l[0], tuple(l[1]), tuple(l[2])): l for l in leaves}
    out = []; used = 0

    def rec(ch, lo, hi, depth):
        nonlocal used
        need(depth < 200, "R の木が深すぎる（被覆の欠け）")
        k = (ch, tuple(lo), tuple(hi))
        if k in lv:
            l = lv[k]; used += 1
            if l[3] == "A":
                out.append(("A", cand_code([tuple(c) for c in l[4]])))
            elif l[3] == "D":
                out.append(("D", l[4]))
            else:
                need(l[3] == "L" and l[4] in ("J", "C"), "L の葉")
                out.append(("L" + l[4], None))
            return
        out.append(("split", None))
        for p, q in split3(lo, hi):
            rec(ch, p, q, depth + 1)
    for ch in range(4):
        rec(ch, [-DEN] * 3, [DEN] * 3, 0)
    need(used == len(lv), "R の葉を使い切らない")
    return out


ntoks = []; nboxes = []


def nrecur(lo, hi, depth):
    need(depth < 100, "n の木が深すぎる")
    k = (tuple(lo), tuple(hi))
    if k in nrec:
        r = nrec[k]
        if r["kind"] == "out":
            ntoks.append("out")
        else:
            ntoks.append("ok"); nboxes.append(r)
        return
    ntoks.append("split")
    for p, q in split2(lo, hi):
        nrecur(p, q, depth + 1)


nrecur([0, 0], [ND, 2 * ND], 0)
need(len(nboxes) + ntoks.count("out") == len(nrec), "n の葉を使い切らない")
NB = []
for r in nboxes:
    toks = rtoks(r["leaves"])
    cnt = dict(A=sum(1 for l in r["leaves"] if l[3] == "A"), D=sum(1 for l in r["leaves"] if l[3] == "D"),
               L=sum(1 for l in r["leaves"] if l[3] == "L"))
    NB.append(dict(lo=r["lo"], hi=r["hi"], toks=toks, cnt=cnt))
TOT = dict(A=sum(b["cnt"]["A"] for b in NB), D=sum(b["cnt"]["D"] for b in NB), L=sum(b["cnt"]["L"] for b in NB))
print(f"遠方：n の箱 ok {len(NB)}・out {ntoks.count('out')}、R の葉 {TOT}、並び {sum(len(b['toks']) for b in NB)}", flush=True)

# ---------- 局所：面・側ごとの木 ----------
ZLO = {"J": (0, -1, -1), "C": (0, 0, -1, -1)}


def faces(kd):
    out = []
    for i, lo in enumerate(ZLO[kd]):
        out.append((i, 1))
        if lo < 0:
            out.append((i, -1))
    return out


def root_box(kd, fi, side, cv):
    lo = [0]; hi = [DU]
    for i, zl in enumerate(ZLO[kd]):
        if i == fi:
            continue
        lo.append(zl * DU); hi.append(DU)
    if kd == "J":
        lo.append(0); hi.append(int(cv["K_J"] * DU))
        us = [(-cv["U_J"], Fr(0)), (Fr(0), cv["U_J"])][side]
    else:
        us = [(-cv["U_C_MAX"], -cv["U_1"]), (cv["U_1"], cv["U_C_MAX"])][side]
    lo.append(int(us[0] * DU)); hi.append(int(us[1] * DU))
    return lo, hi


def lsplit(lo, hi, full):
    rel = [Fr(h - l, f) for l, h, f in zip(lo, hi, full)]
    ax = max(range(5), key=lambda i: (rel[i], -i))
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
    return (list(lo), h1), (l2, list(hi))


def ltoks(kd, fidx, side, leaves, cv):
    fi, fv = faces(kd)[fidx]
    lo, hi = root_box(kd, fi, side, cv)
    full = [h - l for l, h in zip(lo, hi)]
    out = []; used = 0

    def rec(lo, hi, depth):
        nonlocal used
        need(depth < 400, "局所の木が深すぎる")
        k = (tuple(lo), tuple(hi))
        if k in leaves:
            c = leaves[k]; used += 1
            out.append(("acc", 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3])); return
        out.append(("split", None))
        for p, q in lsplit(lo, hi, full):
            rec(p, q, depth + 1)
    rec(lo, hi, 0)
    need(used == len(leaves), f"局所 {kd} の葉を使い切らない（面 {fidx} 側 {side}）")
    return out


LOCF = {}
for kd in ("J", "C"):
    byf = {}
    for r in LOC[kd][1:]:
        byf.setdefault((tuple(r["face"]), r["side"]), {})[(tuple(r["lo"]), tuple(r["hi"]))] = tuple(r["c"])
    fl = faces(kd)
    need(set(byf) <= {(f, s) for f in fl for s in range(2)}, "局所の面の名前")
    LOCF[kd] = []
    for fidx, f in enumerate(fl):
        for side in range(2):
            lv = byf.get((f, side), {})
            LOCF[kd].append(dict(fidx=fidx, face=f, side=side, toks=ltoks(kd, fidx, side, lv, CVAL), n=len(lv), leaves=lv))
    print(f"局所 {kd}：面・側 {len(LOCF[kd])}、受理 {sum(x['n'] for x in LOCF[kd])}", flush=True)

# ---------- Lean の文字 ----------
HEAD = "-- 自動で書き出したもの（lean/tools/export_d31.py）。手で直さない。\n"


def rat(x):
    x = Fr(x)
    return f"({x.numerator}, {x.denominator})"


def tok_s(t):
    k, v = t
    if k == "split":
        return ".split"
    if k == "A":
        return f"(.A {v})"
    if k == "D":
        return f"(.D {v})"
    return "." + k


def ltok_s(t):
    return ".split" if t[0] == "split" else f"(.acc {t[1]})"


def write(path, text):
    path.parent.mkdir(parents=True, exist_ok=True)
    if path.exists() and path.read_text(encoding="utf-8") == text:
        return
    path.write_text(text, encoding="utf-8")


OPTS = "set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\n"


def data_text(ns, cv):
    rots = "[" + ", ".join("[" + ", ".join("[" + ", ".join(str(x) for x in row) + "]" for row in K) + "]" for K in dc.ROT_NONID) + "]"
    sh = "\n".join(f"--   {k}: {v}" for k, v in SHAS.items())
    return (HEAD + f"-- 元の記録の sha256：\n{sh}\nimport PackLean.D31.Core\n\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"/-- octintet_n02 の定数（d31_common.py と記録の頭の値）。 -/\ndef P : Prm where\n"
            f"  nd := {ND}\n  den := {DEN}\n  du := {DU}\n"
            f"  rJ := {rat(cv['R_J'])}\n  uJ := {rat(cv['U_J'])}\n  kJ := {rat(cv['K_J'])}\n"
            f"  rC := {rat(cv['R_C'])}\n  u1 := {rat(cv['U_1'])}\n  uC := {rat(cv['U_C_MAX'])}\n"
            f"  rots := {rots}\n\nend {ns}\n")


def nb_block(i, b, tac):
    toks = ", ".join(tok_s(t) for t in b["toks"])
    c = b["cnt"]
    return (f"def nb{i:03d} : NBox := ⟨{b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]}⟩\n\n"
            f"{OPTS}def t{i:03d} : List Tok := [{toks}]\n\n"
            f"{OPTS}theorem nb{i:03d}_ok : nbRun P nb{i:03d} t{i:03d} = (true, {c['A']}, {c['D']}, {c['L']}) := by {tac}\n\n")


def far_files(ns, mod, out, NBs, idxs, tac, chunk):
    """n の箱を chunk ごとにファイルへ。返り値：[(ファイルの番号, [箱の番号])]。"""
    groups = []; cur = []; size = 0
    for i in idxs:
        cur.append(i); size += len(NBs[i]["toks"])
        if size >= chunk:
            groups.append(cur); cur = []; size = 0
    if cur:
        groups.append(cur)
    for g, ids in enumerate(groups):
        body = "".join(nb_block(i, NBs[i], tac) for i in ids)
        write(out / f"Far{g:03d}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n{body}end {ns}\n")
    return groups


def far_main(ns, mod, out, NBs, ntk, groups, tac):
    imps = "".join(f"import {mod}.Far{g:03d}\n" for g in range(len(groups)))
    nt = ", ".join("." + t for t in ntk)
    bx = ", ".join(f"({b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]})" for b in NBs)
    names = [f"nb{i:03d}" for i in range(len(NBs))]
    nout = ntk.count("out")
    conj = " ∧\n    ".join(f"nbRun P {n} t{n[2:]} = (true, {NBs[i]['cnt']['A']}, {NBs[i]['cnt']['D']}, {NBs[i]['cnt']['L']})"
                           for i, n in enumerate(names))
    return (HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"{OPTS}/-- n の木（前順）。ok の葉は n の箱の表と順に照合する。 -/\ndef ntoks : List NTok := [{nt}]\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
            f"/-- n の箱の表が、各 n の箱のデータと同じ。 -/\ndef boxesOk : Bool :=\n  [{', '.join(names)}].map (fun b => (b.l0, b.l1, b.h0, b.h1)) == nboxes\n\n"
            f"{OPTS}theorem ntree_ok : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) := by {tac}\n\n"
            f"{OPTS}theorem boxes_ok : boxesOk = true := by {tac}\n\n"
            f"{OPTS}/-- 遠方の全部：n の木が閉じ（ok {len(NBs)}・out {nout}）、すべての n の箱の R の木が閉じて、すべての葉が通る。\n"
            f"  受理 {sum(b['cnt']['A'] for b in NBs)}・捨てた {sum(b['cnt']['D'] for b in NBs)}・L {sum(b['cnt']['L'] for b in NBs)}（Python の記録と同じ数）。 -/\n"
            f"theorem far_all : ntreeRun P.nd ntoks nboxes = (true, {len(NBs)}, {nout}) ∧ boxesOk = true ∧\n    {conj} :=\n"
            f"  ⟨ntree_ok, boxes_ok, {', '.join(n + '_ok' for n in names)}⟩\n\nend {ns}\n")


def loc_file(ns, mod, kd, F, tac, imp_data=True):
    toks = ", ".join(ltok_s(t) for t in F["toks"])
    nm = f"{kd}{F['fidx']}{F['side']}"
    return (f"{OPTS}/-- 局所 {kd}：面 {F['face']}（faceList の {F['fidx']} 番）、側 {F['side']}。受理 {F['n']}（Python の記録と同じ）。 -/\n"
            f"def lt{nm} : List LTok := [{toks}]\n\n"
            f"{OPTS}theorem loc{nm}_ok : faceRun P .{kd} {F['fidx']} {F['side']} lt{nm} = (true, {F['n']}) := by {tac}\n\n")


def write_local(ns, mod, out, LF, tac, kinds=("J", "C")):
    mods = []
    for kd in kinds:
        # 大きい面（受理 > 500）は 1 本ずつ、小さい面はまとめる
        big = [F for F in LF[kd] if F["n"] > 500]; small = [F for F in LF[kd] if F["n"] <= 500]
        files = [[F] for F in big] + ([small] if small else [])
        for g, Fs in enumerate(files):
            nmf = f"Loc{kd}{g:02d}"
            body = "".join(loc_file(ns, mod, kd, F, tac) for F in Fs)
            write(out / f"{nmf}.lean", HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n{body}end {ns}\n")
            mods.append(nmf)
    return mods


def local_main(ns, mod, out, LF, mods, tac):
    imps = "".join(f"import {mod}.{m}\n" for m in mods)
    parts = []
    for kd in ("J", "C"):
        fl = faces(kd)
        conj = " ∧\n    ".join(f"faceRun P .{kd} {F['fidx']} {F['side']} lt{kd}{F['fidx']}{F['side']} = (true, {F['n']})" for F in LF[kd])
        prfs = ", ".join(f"loc{kd}{F['fidx']}{F['side']}_ok" for F in LF[kd])
        fls = ", ".join(f"({i}, {v})" for i, v in fl)
        parts.append(
            f"{OPTS}theorem faces{kd}_ok : faceList .{kd} = [{fls}] := by {tac}\n\n"
            f"/-- 局所 {kd} の全部：面 {len(fl)} × 側 2 の木が閉じ、すべての葉が通る（受理 {sum(F['n'] for F in LF[kd])}）。\n"
            f"  0 次の恒等式（族の全候補）は各 faceRun の中でも見ている。 -/\n"
            f"theorem local{kd}_all : faceList .{kd} = [{fls}] ∧\n    {conj} :=\n  ⟨faces{kd}_ok, {prfs}⟩\n\n")
    return HEAD + imps + f"\nnamespace {ns}\nopen PackLean.D31\n\n" + "".join(parts) + f"end {ns}\n"


def consts_text(ns, mod, tac):
    return (HEAD + f"import {mod}.Data\n\nnamespace {ns}\nopen PackLean.D31\n\n"
            f"{OPTS}/-- 駒の回転 23 個（恒等を除く）が符号つき置換で det = 1、互いに異なる。定数の形。 -/\n"
            f"theorem consts_ok : rotsOk P = true ∧ P.rots.length = 23 ∧ prmOk P = true := by {tac}\n\n"
            f"{OPTS}/-- 局所の 0 次の恒等式：J は族 S_E の 54 候補で T = k′u(e₀ + e₁u)、C は族 S_C の 81 候補で T = 0。 -/\n"
            f"theorem ident_ok : identOk .J = true ∧ identOk .C = true ∧ (family .J).length = 54 ∧ (family .C).length = 81 := by {tac}\n\n"
            f"end {ns}\n")


# ---------- 本体・カーネルの試し・誤りを入れた版 ----------
NS = "PackLean.D31.Oct"
if a.kernel:
    out = OUTBASE / "Kernel"; mod = "PackLean.D31.Kernel"; tac = "decide +kernel"
    write(out / "Data.lean", data_text(NS, CVAL))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    # 遠方：小さい n の箱を 3 つ（並びの短い順）、局所：J と C の小さい面を 1 つずつ
    small = sorted(range(len(NB)), key=lambda i: len(NB[i]["toks"]))[:3]
    body = "".join(nb_block(i, NB[i], tac) for i in small)
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{body}end {NS}\n")
    mid = sorted(range(len(NB)), key=lambda i: len(NB[i]["toks"]))[len(NB) // 2]
    write(out / "Far001.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{nb_block(mid, NB[mid], tac)}end {NS}\n")
    fj = min((F for F in LOCF["J"] if F["n"] > 0), key=lambda F: F["n"])
    fc = min((F for F in LOCF["C"] if F["n"] > 0), key=lambda F: F["n"])
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "J", fj, tac) + loc_file(NS, mod, "C", fc, tac) + f"end {NS}\n")
    # 中くらいの面（受理 20〜300）を J・C から 1 つずつ（局所の 1 葉あたりの時間を見る）
    fj2 = min((F for F in LOCF["J"] if 20 <= F["n"] <= 300), key=lambda F: F["n"])
    fc2 = max((F for F in LOCF["C"] if 20 <= F["n"] <= 300), key=lambda F: -F["n"] if F["n"] > 200 else -10**9)
    write(out / "Loc2.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "J", fj2, tac) + f"end {NS}\n")
    write(out / "Loc3.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          + loc_file(NS, mod, "C", fc2, tac) + f"end {NS}\n")
    print("中くらいの面", (fj2["fidx"], fj2["side"], fj2["n"]), (fc2["fidx"], fc2["side"], fc2["n"]))
    print("カーネルの試し：遠方", [(i, len(NB[i]["toks"]), NB[i]["cnt"]) for i in small], "中央", (mid, len(NB[mid]["toks"]), NB[mid]["cnt"]),
          "局所", (fj["fidx"], fj["side"], fj["n"]), (fc["fidx"], fc["side"], fc["n"]))
    sys.exit(0)

def lbox_s(b):
    return f"⟨[{', '.join(map(str, b[0]))}], [{', '.join(map(str, b[1]))}]⟩"


def kseg_split(F, seg):
    """面・側の並びを葉 seg 個ごとの区間に切り、各切れ目のスタック（先頭が次に取る箱）を返す。"""
    fi, _ = faces(F["kd"])[F["fidx"]]
    lo0, hi0 = root_box(F["kd"], fi, F["side"], CVAL)
    full = [h - l for l, h in zip(lo0, hi0)]
    stack = [(lo0, hi0)]; segs = []; cur = []; keys = [list(stack)]; nacc = 0
    for t in F["toks"]:
        need(stack, "スタックが空のまま並びが続く")
        lo, hi = stack.pop(0)
        cur.append(t)
        if t[0] == "split":
            p, q = lsplit(lo, hi, full); stack = [p, q] + stack
        else:
            nacc += 1
            if nacc % seg == 0 and stack:
                segs.append(cur); cur = []; keys.append(list(stack))
    need(not stack, "並びの終わりでスタックが空でない")
    if cur:
        segs.append(cur); keys.append([])
    else:
        keys[-1] = []
    need(len(keys) == len(segs) + 1, "区間と切れ目の数")
    return (lo0, hi0), segs, keys


def rassoc(names):
    """t0 ++ (t1 ++ (… ++ tk))：鎖の証明（右から lseg_append）と同じ結合にする（左結合だと並びを展開して重い）。"""
    s = names[-1]
    for x in reversed(names[:-1]):
        s = f"{x} ++ ({s})"
    return s


def rbox_s(b):
    ch, lo, hi = b
    return f"⟨{ch}, {lo[0]}, {lo[1]}, {lo[2]}, {hi[0]}, {hi[1]}, {hi[2]}⟩"


def kfar_split(b, seg):
    """n の箱の R の木の並びを葉 seg 個ごとの区間に切り、切れ目のスタックを返す（先頭が次に取る箱）。"""
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    segs = []; cur = []; keys = [None]; nl = 0
    for t in b["toks"]:
        need(stack, "R のスタックが空のまま並びが続く")
        ch, lo, hi = stack.pop(0)
        cur.append(t)
        if t[0] == "split":
            p, q = split3(lo, hi); stack = [(ch, *p), (ch, *q)] + stack
        else:
            nl += 1
            if nl % seg == 0 and stack:
                segs.append(cur); cur = []; keys.append(list(stack))
    need(not stack, "R の並びの終わりでスタックが空でない")
    if cur:
        segs.append(cur); keys.append([])
    else:
        keys[-1] = []
    return segs, keys


if a.kfar:
    # A9j 7d-5：遠方をカーネルだけで。n の箱ごとの R の木を葉 kfar 個ごとの区間に（Formal/OctFarKD.lean でつなぐ）。
    out = OUTBASE / "K"; mod = "PackLean.D31.K"; tac = "decide +kernel"
    H = HEAD.replace("export_d31.py", "export_d31.py --kfar")
    PER = a.kfar * a.per_file   # 1 ファイルの葉の目安
    units = []   # (ファイルの名前, 本文)
    runs = []; cur = []; cur_n = 0; mods = []; nseg = 0

    def flush():
        global cur, cur_n
        if cur:
            m = f"FarK{len(mods):03d}"
            write(out / f"{m}.lean", H + f"import PackLean.D31.Data\nimport PackLean.D31.FarSeg\n\nnamespace {NS}\nopen PackLean.D31\n\n{''.join(cur)}end {NS}\n")
            mods.append(m)
        cur = []; cur_n = 0

    for i, b in enumerate(NB):
        segs, keys = kfar_split(b, a.kfar)
        nseg += len(segs)
        nm = f"F{i:03d}"
        head = (f"/-- 遠方：n の箱 {i}（受理 {b['cnt']['A']}・捨てた {b['cnt']['D']}・L {b['cnt']['L']}）、区間 {len(segs)}。 -/\n"
                f"def nb{nm} : NBox := ⟨{b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]}⟩\n\n"
                f"def k{nm}_0 : List RBox := rRoots P.den\n\n"
                + "".join(f"{OPTS}def k{nm}_{j} : List RBox := [{', '.join(rbox_s(x) for x in k)}]\n\n" for j, k in enumerate(keys) if j > 0))
        blocks = [f"{OPTS}def t{nm}_{j} : List Tok := [{', '.join(tok_s(t) for t in segs[j])}]\n\n"
                  f"{OPTS}theorem s{nm}_{j} : wsegOk P nb{nm} k{nm}_{j} t{nm}_{j} k{nm}_{j + 1} = true := by {tac}\n\n"
                  for j in range(len(segs))]
        nleaf = sum(b["cnt"].values())
        if nleaf > PER:
            # 大きい箱：鍵だけのファイルと、区間を per_file 本ずつのファイルに
            flush()
            write(out / f"FarKey{nm}.lean", H + f"import PackLean.D31.Data\nimport PackLean.D31.FarSeg\n\nnamespace {NS}\nopen PackLean.D31\n\n{head}end {NS}\n")
            for g in range(0, len(blocks), a.per_file):
                m = f"FarK{len(mods):03d}"
                write(out / f"{m}.lean", H + f"import {mod}.FarKey{nm}\n\nnamespace {NS}\nopen PackLean.D31\n\n{''.join(blocks[g:g + a.per_file])}end {NS}\n")
                mods.append(m)
        else:
            if cur_n + nleaf > PER:
                flush()
            cur.append(head + "".join(blocks)); cur_n += nleaf
        ts = rassoc([f"t{nm}_{j}" for j in range(len(segs))])
        chain = f"wseg_of s{nm}_{len(segs) - 1}"
        for j in range(len(segs) - 2, -1, -1):
            chain = f"wseg_append (wseg_of s{nm}_{j}) ({chain})"
        runs.append((i, nm, ts, chain))
    flush()
    imps = "".join(f"import {mod}.{m}\n" for m in mods)
    nt = ", ".join("." + t for t in ntoks)
    bx = ", ".join(f"({b['lo'][0]}, {b['lo'][1]}, {b['hi'][0]}, {b['hi'][1]})" for b in NB)
    body = (f"{OPTS}/-- n の木（前順）。ok の葉は n の箱の表と順に照合する。 -/\ndef ntoks : List NTok := [{nt}]\n\n"
            f"{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
            f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {tac}\n\n")
    for i, nm, ts, chain in runs:
        body += (f"{OPTS}theorem run{nm} : (nbRun P nb{nm} ({ts})).1 = true :=\n"
                 f"  nbRun_of (by {tac}) ({chain})\n\n")
    hb = "fun _ h => nomatch h"
    for i, nm, ts, chain in reversed(runs):
        hb = f"List.forall_mem_cons.2 ⟨⟨nb{nm}, _, rfl, run{nm}⟩, {hb}⟩"
    body += (f"{OPTS}/-- 遠方の全部の n の箱の R の木がカーネルだけで通る（`OctCover.far_cert` の `hb` の形）。 -/\n"
             f"theorem far_hb : ∀ b ∈ nboxes, ∃ nb toks, corners nb = b ∧ (nbRun P nb toks).1 = true :=\n  {hb}\n\n")
    write(out / "Far.lean", H + imps + "import PackLean.Formal.OctFarKD\nimport PackLean.Formal.OctCover\n\n"
          f"namespace {NS}\nopen PackLean.D31\nopen PackLean.Formal.OctFarKD (nbRun_of wseg_of wseg_append)\n"
          f"open PackLean.Formal.OctCover (corners)\n\n{body}end {NS}\n")
    write(out / "farmods.txt", "\n".join(f"{mod}.{m}" for m in mods) + "\n")
    big = sorted(((sum(b['cnt'].values()), i) for i, b in enumerate(NB)), reverse=True)[:5]
    print(f"K/：遠方の区間 {nseg}（ファイル {len(mods)}）、葉の多い箱 {big}", flush=True)
    sys.exit(0)

if a.kseg:
    # A9j 7d-5：局所をカーネルだけで。面ごとの faceData はデータ（pp/logs/d31_fd.txt、lean/tools/d31_fd_print.lean が書く）
    # を等式で 1 回示して使い回し、木は葉 kseg 個ごとの区間に切る（Formal/OctLocalKD.lean でつなぐ）。
    out = OUTBASE / "K"; mod = "PackLean.D31.K"; tac = "decide +kernel"
    fdp = ROOT / "pp" / "logs" / "d31_fd.txt"
    need(fdp.exists(), "先に lake env lean tools/d31_fd_print.lean（lean/ で）")
    FDT = {}
    for line in fdp.read_text(encoding="utf-8").splitlines():
        kd, fidx, fi, fv, txt = line.split(" ", 4)
        need((int(fi), int(fv)) == faces(kd)[int(fidx)], f"d31_fd.txt の面 {kd} {fidx}")
        FDT[(kd, int(fidx))] = (int(fi), int(fv), txt)
    H = HEAD.replace("export_d31.py", "export_d31.py --kseg")
    for (kd, fidx), (fi, fv, txt) in FDT.items():
        write(out / f"FD{kd}{fidx}.lean", H + f"import PackLean.D31.Data\nimport PackLean.D31.LocalSeg\n\nnamespace {NS}\nopen PackLean.D31\n\n"
              f"{OPTS}/-- 局所 {kd} の面 {(fi, fv)}（faceList の {fidx} 番）の候補の部品（Lean の faceData の値を書き写したもの）。 -/\n"
              f"def fd{kd}{fidx} : FaceData := {txt}\n\n"
              f"{OPTS}theorem fd{kd}{fidx}_eq : faceData P .{kd} {fi} {f'({fv})' if fv < 0 else fv} = fd{kd}{fidx} := by {tac}\n\n"
              f"{OPTS}theorem fd{kd}{fidx}_id : fd{kd}{fidx}.identOk = true := by {tac}\n\nend {NS}\n")
    seg_mods = []; runs = {"J": [], "C": []}; nseg_tot = 0
    for kd in ("J", "C"):
        for F in LOCF[kd]:
            F = dict(F, kd=kd)
            nm = f"{kd}{F['fidx']}{F['side']}"
            fi, fv = faces(kd)[F["fidx"]]
            (lo0, hi0), segs, keys = kseg_split(F, a.kseg)
            nseg_tot += len(segs)
            keyt = "".join(f"{OPTS}def k{nm}_{j} : List LBox := [{', '.join(lbox_s(b) for b in k)}]\n\n" for j, k in enumerate(keys) if j > 0)
            write(out / f"Key{nm}.lean", H + f"import {mod}.FD{kd}{F['fidx']}\n\nnamespace {NS}\nopen PackLean.D31\n\n"
                  f"/-- 局所 {kd}：面 {F['face']}（faceList の {F['fidx']} 番）、側 {F['side']}。受理 {F['n']}、区間 {len(segs)}（葉 {a.kseg} 個ごと）。 -/\n"
                  f"def lo{nm} : List Int := [{', '.join(map(str, lo0))}]\n\ndef hi{nm} : List Int := [{', '.join(map(str, hi0))}]\n\n"
                  f"def full{nm} : List Int := List.zipWith (fun l h => h - l) lo{nm} hi{nm}\n\n"
                  f"def k{nm}_0 : List LBox := [⟨lo{nm}, hi{nm}⟩]\n\n" + keyt + f"end {NS}\n")
            groups = [list(range(i, min(i + a.per_file, len(segs)))) for i in range(0, len(segs), a.per_file)]
            for g, js in enumerate(groups):
                body = "".join(
                    f"{OPTS}def t{nm}_{j} : List LTok := [{', '.join(ltok_s(t) for t in segs[j])}]\n\n"
                    f"{OPTS}theorem s{nm}_{j} : lsegOk P .{kd} full{nm} fd{kd}{F['fidx']} k{nm}_{j} t{nm}_{j} k{nm}_{j + 1} = true := by {tac}\n\n"
                    for j in js)
                m = f"Loc{nm}_{g:02d}"
                write(out / f"{m}.lean", H + f"import {mod}.Key{nm}\n\nnamespace {NS}\nopen PackLean.D31\n\n{body}end {NS}\n")
                seg_mods.append(m)
            ts = rassoc([f"t{nm}_{j}" for j in range(len(segs))])
            chain = f"lseg_of s{nm}_{len(segs) - 1}"
            for j in range(len(segs) - 2, -1, -1):
                chain = f"lseg_append (lseg_of s{nm}_{j}) ({chain})"
            runs[kd].append((F, nm, fi, fv, ts, chain))
    imps = "".join(f"import {mod}.{m}\n" for m in seg_mods)
    body = ""
    for kd in ("J", "C"):
        for F, nm, fi, fv, ts, chain in runs[kd]:
            body += (f"{OPTS}/-- 局所 {kd}：面 {F['face']}、側 {F['side']}（受理 {F['n']}）の木がカーネルだけで通る。 -/\n"
                     f"theorem run{nm} : (faceRun P .{kd} {F['fidx']} {F['side']} ({ts})).1 = true :=\n"
                     f"  faceRun_of (fi := {fi}) (fv := {fv}) (lo := lo{nm}) (hi := hi{nm}) (FD := fd{kd}{F['fidx']})\n"
                     f"    (by {tac}) (by {tac}) fd{kd}{F['fidx']}_eq fd{kd}{F['fidx']}_id (by {tac})\n    ({chain})\n\n")
        nf = len(faces(kd))
        cases = "\n".join(f"  · exact ⟨_, run{kd}{F['fidx']}{F['side']}⟩" for F, *_ in runs[kd])
        body += (f"/-- 局所 {kd} の面 {nf} × 側 2 がどれも通る（`OctLocal.hloc_of` の仮定の形）。 -/\n"
                 f"theorem local{kd}_k : ∀ fidx < {nf}, ∀ side < 2, ∃ toks, (faceRun P .{kd} fidx side toks).1 = true := by\n"
                 f"  intro fidx hf side hs\n  interval_cases fidx <;> interval_cases side\n{cases}\n\n")
    body += (f"{OPTS}theorem locConsts : LocConsts P :=\n  ⟨" + ", ".join([f"by {tac}"] * 8) + "⟩\n\n"
             f"/-- **局所の補題（D31、octintet）をカーネルだけで**：`OctCover.HLoc P`。 -/\n"
             f"theorem hloc : HLoc P := hloc_of locConsts localJ_k localC_k\n\n")
    write(out / "Local.lean", H + imps + "import PackLean.Formal.OctLocalKD\nimport PackLean.Formal.OctLocal\n\n"
          f"namespace {NS}\nopen PackLean.D31\nopen PackLean.Formal.OctLocalKD (faceRun_of lseg_of lseg_append)\n"
          f"open PackLean.Formal.OctLocal (LocConsts hloc_of)\nopen PackLean.Formal.OctCover (HLoc)\n\n{body}end {NS}\n")
    write(out / "mods.txt", "\n".join([f"{mod}.FD{kd}{i}" for kd, i in FDT] + [f"{mod}.{m}" for m in seg_mods]) + "\n")
    print(f"K/：面のデータ {len(FDT)}、区間 {nseg_tot}（ファイル {len(seg_mods)}）", flush=True)
    sys.exit(0)

if a.inject is None:
    out = OUTBASE; mod = "PackLean.D31"; tac = "native_decide"
    write(out / "Data.lean", data_text(NS, CVAL))
    write(out / "Consts.lean", consts_text(NS, mod, tac))
    groups = far_files(NS, mod, out, NB, list(range(len(NB))), tac, a.chunk)
    write(out / "Far.lean", far_main(NS, mod, out, NB, ntoks, groups, tac))
    lmods = write_local(NS, mod, out, LOCF, tac)
    write(out / "Local.lean", local_main(NS, mod, out, LOCF, lmods, tac))
    meta = dict(shas=SHAS, n_ok=len(NB), n_out=ntoks.count("out"), leaves=TOT, far_files=len(groups), local_mods=lmods,
                local={kd: [(F["fidx"], F["side"], F["n"], len(F["toks"])) for F in LOCF[kd]] for kd in ("J", "C")})
    write(out / "export_meta.json", json.dumps(meta, ensure_ascii=False, indent=1))
    print(f"書き出した：Far {len(groups)} 本、局所 {lmods}", flush=True)
    sys.exit(0)

# 誤りを入れた版：Test/<種類>/ に Data と、影響する部分だけ。Python の判定でも落ちることを確かめてから書く。
import copy  # noqa: E402
kind = a.inject
out = OUTBASE / "Test" / kind[0].upper() + kind[1:] if False else OUTBASE / "Test" / (kind[0].upper() + kind[1:])
mod = f"PackLean.D31.Test.{kind[0].upper() + kind[1:]}"
tac = "native_decide"
cv = dict(CVAL)
note = ""
mods = []


def first_nb_with(pred):
    for i, b in enumerate(NB):
        for j, t in enumerate(b["toks"]):
            if pred(t):
                return i, j
    raise RuntimeError("見つからない")


def leaf_boxes(b):
    """前順の並びの各葉の R の箱（地図, lo, hi）。"""
    res = []
    it = iter(range(len(b["toks"])))
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    for j, t in enumerate(b["toks"]):
        ch, lo, hi = stack.pop(0)
        if t[0] == "split":
            p, q = split3(lo, hi); stack = [(ch, *p), (ch, *q)] + stack
        else:
            res.append((j, ch, lo, hi))
    return res


def write_far_one(i, b):
    write(out / "Far000.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{nb_block(i, b, tac)}end {NS}\n")
    mods.append("Far000")


if kind in ("farA", "farD"):
    done = False
    for i, b in enumerate(NB):
        nlo, nhi = b["lo"], b["hi"]
        for j, ch, lo, hi in leaf_boxes(b):
            t = b["toks"][j]
            if kind == "farA" and t[0] == "A":
                rb = dc.RBox(ch, lo, hi)
                for code in range(1296):
                    cd = code_cand(code)
                    if all(x[0] < 3 for x in cd) and dc.far_lb(nlo, nhi, rb, cd) < 0:
                        b2 = copy.deepcopy(b); b2["toks"][j] = ("A", code)
                        note = f"n の箱 {i} の葉 {j}：候補 {t[1]} → {code}（Python の far_lb も < 0）"; done = True; break
            if kind == "farD" and t[0] == "D":
                rb = dc.RBox(ch, lo, hi)
                for m in range(len(dc.ROT_NONID)):
                    if m != t[1] and dc.discard_lb(rb, dc.ROT_NONID[m]) <= 0:
                        b2 = copy.deepcopy(b); b2["toks"][j] = ("D", m)
                        note = f"n の箱 {i} の葉 {j}：回転 {t[1]} → {m}（Python の discard_lb も ≤ 0）"; done = True; break
            if done:
                break
        if done:
            break
    need(done, "誤りを入れる葉が見つからない")
    write_far_one(i, b2)
elif kind == "farDrop":
    i, j = first_nb_with(lambda t: t[0] == "A")
    b2 = copy.deepcopy(NB[i]); del b2["toks"][j]; b2["cnt"]["A"] -= 1
    note = f"n の箱 {i} の R の木から受理の葉 {j} を抜く"
    write_far_one(i, b2)
elif kind == "farL":
    done = False
    for i, b in enumerate(NB):
        for j, ch, lo, hi in leaf_boxes(b):
            t = b["toks"][j]
            if t[0] == "LJ" and dc.in_L(b["lo"], b["hi"], ch, lo, hi) == "J" and not (dc.n_in_C(b["lo"], b["hi"]) and dc.r_in_C(ch, lo, hi)):
                b2 = copy.deepcopy(b); b2["toks"][j] = ("LC", None)
                note = f"n の箱 {i} の葉 {j}：L の J を C と言い張る（Python の C の判定も偽）"; done = True; break
        if done:
            break
    need(done, "誤りを入れる葉が見つからない")
    write_far_one(i, b2)
elif kind == "farOut":
    ntk2 = list(ntoks)
    k = ntk2.index("ok"); ntk2[k] = "out"
    NB2 = NB[1:]
    b = NB[0]
    need(not (2 * b["lo"][0] + b["lo"][1] >= 2 * ND), "out の条件が真の箱")
    note = f"n の木の最初の ok の箱 {b['lo']}–{b['hi']} を out と言い張る（2h_lo + k′_lo ≥ 2 が偽）"
    nt = ", ".join("." + t for t in ntk2)
    bx = ", ".join(f"({x['lo'][0]}, {x['lo'][1]}, {x['hi'][0]}, {x['hi'][1]})" for x in NB2)
    write(out / "Far.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n"
          f"{OPTS}def ntoks : List NTok := [{nt}]\n\n{OPTS}def nboxes : List (Int × Int × Int × Int) := [{bx}]\n\n"
          f"{OPTS}theorem ntree_ok : (ntreeRun P.nd ntoks nboxes).1 = true := by {tac}\n\nend {NS}\n")
    mods.append("Far")
elif kind == "uJ":
    cv["U_J"] = Fr(5, 32)
    note = "Data の U_J を 5/16 → 5/32 に（遠方の L の J と局所 J の根の箱が両方変わる）"
    i, j = first_nb_with(lambda t: t[0] == "LJ")
    # LJ の葉で、U_J = 5/32 では J に入らないものを含む箱を探す
    for ii, b in enumerate(NB):
        if any(t[0] == "LJ" for t in b["toks"]):
            for jj, ch, lo, hi in leaf_boxes(b):
                if b["toks"][jj][0] == "LJ":
                    V = [(x, y, z) for x in (lo[0], hi[0]) for y in (lo[1], hi[1]) for z in (lo[2], hi[2])]
                    if any(abs(x + y + z) > 3 * cv["U_J"] * DEN for x, y, z in V):
                        i = ii; break
            else:
                continue
            break
    write_far_one(i, NB[i])
    F = max(LOCF["J"], key=lambda F: 0 if F["n"] > 400 else F["n"])
    write(out / "LocJ.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{loc_file(NS, mod, 'J', F, tac)}end {NS}\n")
    mods.append("LocJ")
    note += f"；遠方は n の箱 {i}、局所は J の面 {F['fidx']} 側 {F['side']}（受理 {F['n']}）"
elif kind == "uJbig":
    cv["U_J"] = Fr(3, 8)
    note = "Data の U_J を 5/16 → 3/8 に（局所 J の根の箱が広がる。D31 の試験 n2c では J が閉じない）。局所 J の全部の面・側"
    for F in LOCF["J"]:
        body = loc_file(NS, mod, 'J', F, tac)
        write(out / f"LocJ{F['fidx']}{F['side']}.lean",
              HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n" + body + f"end {NS}\n")
        mods.append(f"LocJ{F['fidx']}{F['side']}")
elif kind in ("locCandJ", "locCandC", "locE", "locDrop"):
    os.chdir(GO)
    import d31_local as LO  # noqa: E402
    kd = "C" if kind == "locCandC" else "J"
    LF = [F for F in LOCF[kd] if 0 < F["n"] <= 60]
    F = max(LF, key=lambda F: F["n"])
    F2 = copy.deepcopy(F)
    if kind == "locDrop":
        j = next(j for j, t in enumerate(F2["toks"]) if t[0] == "acc")
        del F2["toks"][j]; F2["n"] -= 1
        note = f"局所 {kd} の面 {F['fidx']} 側 {F['side']} の木から受理の葉 {j} を抜く"
    else:
        B = LO.build(kd)
        Fc = LO.Face(B, F["face"])
        P_ = {it[0]: it[1] for it in Fc.items}
        # 並びの葉の箱
        lo0, hi0 = root_box(kd, F["face"][0], F["side"], CVAL)
        full = [h - l for l, h in zip(lo0, hi0)]
        stack = [(lo0, hi0)]; leafs = []
        for j, t in enumerate(F2["toks"]):
            lo, hi = stack.pop(0)
            if t[0] == "split":
                p, q = lsplit(lo, hi, full); stack = [p, q] + stack
            else:
                leafs.append((j, lo, hi, t[1]))
        done = False
        for j, lo, hi, code in leafs:
            for c in P_:
                cc = 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3]
                if cc == code:
                    continue
                eok = Fc.cand_ok(c, lo, hi)
                lbp = LO.lb_of(P_[c], Fc.hdeg, lo, hi) > 0
                if (kind == "locE" and not eok and lbp) or (kind != "locE" and eok and not lbp):
                    F2["toks"][j] = ("acc", cc)
                    note = (f"局所 {kd} の面 {F['fidx']} 側 {F['side']} の葉 {j}：候補 {code} → {cc}"
                            f"（Python：E の符号 {'合う' if eok else '合わない'}、下界 > 0 は {'真' if lbp else '偽'}）")
                    done = True; break
            if done:
                break
        if not done and kind == "locE":
            # 下界 > 0 で E が合わない候補が無ければ、E だけが合わない候補で
            for j, lo, hi, code in leafs:
                for c in P_:
                    cc = 27 * c[0] + 9 * c[1] + 3 * c[2] + c[3]
                    if cc != code and not Fc.cand_ok(c, lo, hi):
                        F2["toks"][j] = ("acc", cc)
                        note = f"局所 J の面 {F['fidx']} 側 {F['side']} の葉 {j}：候補 {code} → {cc}（E の符号が合わない。下界 > 0 の候補は無かった）"
                        done = True; break
                if done:
                    break
        need(done, "誤りを入れる葉が見つからない")
    write(out / "Loc.lean", HEAD + f"import {mod}.Data\n\nnamespace {NS}\nopen PackLean.D31\n\n{loc_file(NS, mod, kd, F2, tac)}end {NS}\n")
    mods.append("Loc")

write(out / "Data.lean", data_text(NS, cv))
write(out / "NOTE.txt", note + "\n")
print(f"誤りを入れた版 {kind}：{note}；モジュール " + " ".join(f"{mod}.{m}" for m in mods), flush=True)
