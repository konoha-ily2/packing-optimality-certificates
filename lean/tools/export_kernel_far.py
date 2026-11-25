"""E3c（11/15）：D16.Core の遠方の証明書 `far_ok : farRun P toks = (true, nA, nD, nL)` を、
native_decide なし（区間ごとの decide +kernel と KernelSegW.seg のつなぎ）で同じ命題のまま書き出す。

既にある書き出し（lean/PackLean/D16/<件>/Tok*.lean・Far.lean・Data.lean、D30 も同じ形）を読むだけで、
Python の元の証明書は使わない。区間の境の状態は、並びを Lean の wstep と同じ規則（split は split3、葉は 1 つ取り除く）で
辿り直して書く（判定の中身は辿らない。境の状態が合わなければ区間の定理が通らない）。

出力（<件>/K/）：
  FarS.lean        … 境の状態の定義だけ（軽い）
  FarNN.lean       … 区間の定理（decide +kernel）と、その束をつないだ fNN（束ごとに別々に並べてビルドできる）
  Far.lean         … 束をつないで元の far_ok と同じ命題（名前は <名前空間>.K.far_ok）

使い方（packing-lab の直下で）：
  python -X utf8 lean/tools/export_kernel_far.py --case IcoCub [--w 6] [--per 25]
"""
import argparse
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
LEAN = ROOT / "lean"
CASES = {
    "IcoCub": ("PackLean/D16/IcoCub", "PackLean.D16.IcoCub"),
    "DodIco": ("PackLean/D16/DodIco", "PackLean.D16.DodIco"),
    "IcoOct": ("PackLean/D16/IcoOct", "PackLean.D16.IcoOct"),
    "IcoDod": ("PackLean/D16/IcoDod", "PackLean.D16.IcoDod"),
    "OctDod": ("PackLean/D16/OctDod", "PackLean.D16.OctDod"),
    "D30": ("PackLean/D30", "PackLean.D30"),
    # E3c 段 3（11/16）：A9c が足した 3 件。Cubindod は定数が D44.constsQ（挟み込み）で、局所はない（L が 0）。
    "D30XCub": ("PackLean/D30X/Cub", "PackLean.D30X.Cub"),
    "D30XOct": ("PackLean/D30X/Oct", "PackLean.D30X.Oct"),
    "Cubindod": ("PackLean/D44/Cubindod", "PackLean.D44.Cubindod"),
    # E3g4（11/20）：D44 の近傍（補題 Q）のある 3 件。定数は D44.constsQ、遠方は --red（KR）、近傍は E3g2 の KL（ここでは書かない）。
    "Dodindod": ("PackLean/D44/Dodindod", "PackLean.D44.Dodindod"),
    "Icoinico": ("PackLean/D44/Icoinico", "PackLean.D44.Icoinico"),
    "Octinoct": ("PackLean/D44/Octinoct", "PackLean.D44.Octinoct"),
    # E3c（11/20）：octinico（D30S3）。遠方は farRunT P X（wstepT、L の葉は管の中）で、つなぎは D30S3.KSegT。--red・--lsplit・--direct は使わない。
    "D30S3": ("PackLean/D30S3", "PackLean.D30S3"),
}
ap = argparse.ArgumentParser()
ap.add_argument("--case", required=True, choices=list(CASES))
ap.add_argument("--w", type=float, default=6.0, help="1 区間の重さ（受理 1・捨てる 0.3・L 0.1・割る 0.02）")
ap.add_argument("--per", type=int, default=25, help="1 ファイルの区間の数")
ap.add_argument("--lsplit", type=int, default=None, help="局所を面ごとに分ける（値は面の中の 1 区間の受理の数、0 で面ごとに 1 本）")
ap.add_argument("--csplit", type=int, default=None, help="定数を部品ごとに分ける（値は対称性の組の 1 区間の数）")
ap.add_argument("--cfiles", action="store_true", help="--csplit の部品（sqb・駒・容器・境界・上界）を 1 本ずつ別のファイル K/C_<部品>.lean に（重い部品を分けて測る、11/16 E3c 段 3）")
ap.add_argument("--psplit", type=int, default=None, help="--cfiles の C_piece を、前半の条件と頂点の 3 つ組の面の確かめ（この数ずつの区間）に分ける（11/16 E3c 段 3、dodincub の駒 20 頂点で 20 GB を超えたため）")
ap.add_argument("--direct", action="store_true", help="定数・局所も元と同じ命題を 1 本の decide +kernel で（K/Consts・K/Local）")
ap.add_argument("--red", action="store_true", help="E3e（11/16）：遠方だけを wstepR（約分＋S̄″）の版で KR/ に書く（K/ は触らない）")
a = ap.parse_args()

DIR, NS0 = CASES[a.case]
D = LEAN / DIR
NS = NS0 + ".K"
MOD = NS0
# D16 の外の名前空間（D30 など）では D16 と D28 の同名（WState・rRoots など）があいまいになるので、遠方のファイルでは D28 を開かない（11/15 E3c 段 2）。
OD28 = "PackLean.D28 " if NS0.startswith("PackLean.D16.") else ""
NL = "\n"
HEADER = "-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。" + NL
OPTS = "set_option maxRecDepth 100000 in" + NL + "set_option maxHeartbeats 0 in" + NL
W = {"A": 1.0, "D": 0.3, "L": 0.1, "S": 0.02}
T = a.case == "D30S3"
if T:
    assert not (a.red or a.lsplit is not None or a.direct), "D30S3 は遠方と --csplit だけ"
FR = "farRunT P X" if T else "farRun P"      # 遠方の判定
STEP = "wstepT P X" if T else "wstep P"      # 1 歩
RUN = "runT P X" if T else "run P"           # 区間を進める
SEG, FIN = ("segT", "finT") if T else ("seg", "fin")
KIMP = "PackLean.D30S3.KSegT" if T else "PackLean.D16.KernelSegW"
KOPEN = "PackLean.D16.KSegW PackLean.D30S3.KSegT" if T else "PackLean.D16.KSegW"

far = (D / "Far.lean").read_text(encoding="utf-8")
parts = re.search(r"def toks : List Tok := (.+)", far).group(1).split(" ++ ")
m = re.search(r"theorem far_ok : " + re.escape(FR) + r" toks = \(true, (\d+), (\d+), (\d+)\)", far)
nA, nD, nL = map(int, m.groups())
rden = int(re.search(r"rden := (\d+)", (D / "Data.lean").read_text(encoding="utf-8")).group(1))

toks = []
for p in parts:
    name = p.strip()
    num = re.fullmatch(r"toks(\d+)", name).group(1)
    txt = (D / f"Tok{num}.lean").read_text(encoding="utf-8")
    body = txt.split(f"def {name} : List Tok := [", 1)[1].rsplit("]", 1)[0]
    for line in body.split(NL):
        s = line.strip().rstrip(",")
        if not s:
            continue
        if s == ".split":
            toks.append("S")
        elif s == ".L":
            toks.append("L")
        elif s.startswith("(.D "):
            toks.append("D")
        elif s.startswith("(.A "):
            assert s.endswith(")") and s.count("(") == s.count(")"), s[:80]
            toks.append("A")
        else:
            raise SystemExit(f"読めない字句: {s[:80]}")
print(f"{a.case}: 並び {len(toks)}、受理 {toks.count('A')}・捨てた {toks.count('D')}・L {toks.count('L')}")
assert (toks.count("A"), toks.count("D"), toks.count("L")) == (nA, nD, nL)


def split3(b):
    """D28.split3 と同じ（中点は (l + h) / 2。幅が偶数なので和も偶数で、丸めの違いは出ない）。"""
    ch, l0, l1, l2, h0, h1, h2 = b
    w0, w1, w2 = h0 - l0, h1 - l1, h2 - l2
    if w0 >= w1 and w0 >= w2:
        sm = l0 + h0; mm = sm // 2
        return (ch, l0, l1, l2, mm, h1, h2), (ch, mm, l1, l2, h0, h1, h2), sm
    elif w1 >= w2:
        sm = l1 + h1; mm = sm // 2
        return (ch, l0, l1, l2, h0, mm, h2), (ch, l0, mm, l2, h0, h1, h2), sm
    else:
        sm = l2 + h2; mm = sm // 2
        return (ch, l0, l1, l2, h0, h1, mm), (ch, l0, l1, mm, h0, h1, h2), sm


# 並びを辿る（スタックは Python のリストの先頭が上）
stk = [(ch, -rden, -rden, -rden, rden, rden, rden) for ch in range(4)]
c = dict(A=0, D=0, L=0)
bounds = [(0, None)]
wacc = 0.0
for k, t in enumerate(toks):
    b = stk.pop(0)
    if t == "S":
        c1, c2, sm = split3(b)
        assert sm % 2 == 0, "和が奇数の箱（丸めの違いが出うる）"
        stk = [c1, c2] + stk
    else:
        c[t] += 1
    wacc += W[t]
    j = k + 1
    if wacc >= a.w or j == len(toks):
        bounds.append((j, (list(stk), dict(c))))
        wacc = 0.0
assert not stk and (c["A"], c["D"], c["L"]) == (nA, nD, nL)
nseg = len(bounds) - 1
print(f"区間 {nseg} 本（重さ {a.w}）、ファイル {(nseg + a.per - 1) // a.per} 本（{a.per} 区間ずつ）")


def box(b):
    return "⟨" + ", ".join(str(v) for v in b) + "⟩"


def state(st):
    stk, c = st
    return f"⟨[{', '.join(box(b) for b in stk)}], true, {c['A']}, {c['D']}, {c['L']}⟩"


KD = D / "K"
KD.mkdir(exist_ok=True)
WRITTEN = set()


def wr(path, body):
    """中身が同じなら書かない（lake のビルドをやり直させない）。改行は LF。"""
    WRITTEN.add(path.name)
    if path.exists() and path.read_bytes() == body.encode("utf-8"):
        return
    path.write_bytes(body.encode("utf-8"))


def fars_body(ns):
    b = HEADER + f"""-- 遠方の並び {len(toks)} 歩の区間 {nseg} 本の境の状態（並びを Python で辿り直したもの）。
import PackLean.D16.KernelSegW
import {MOD}.Far

namespace {ns}
open {OD28}PackLean.D16 {NS0}

/-- 始めの状態（farRun と同じ）。 -/
def s_0 : WState := ⟨rRoots P.rden, true, 0, 0, 0⟩
"""
    for j, st in bounds[1:]:
        b += f"def s_{j} : WState := {state(st)}" + NL
    return b + NL + f"end {ns}" + NL


def write_red():
    """E3e（11/16）：wstepR（葉の前に箱と rden を約分、S̄ を分母が奇数の S̄″ に）の版を K/ と別の KR/ に書く。
    割る・L は wstep と同じなので境の状態は同じ。K/FarS.lean が同じ中身ならそれを使い（作り直さない）、違えば KR/FarS.lean を書く。
    S̄″ = ⌈S̄·3^64⌉/3^64（S̄ 以上、差は 3^-64 未満）。健全性は PackLean.Formal.SandwichR。"""
    from math import gcd
    dat = (D / "Data.lean").read_text(encoding="utf-8")
    sm = re.search(r"sbar := \((-?\d+), (\d+)\)", dat)
    sn, sd = int(sm.group(1)), int(sm.group(2))
    q = 3 ** 64
    rn = -((-sn * q) // sd)  # ⌈sn·q/sd⌉
    assert rn * sd >= sn * q and gcd(q, 2) == 1
    KR = D / "KR"
    KR.mkdir(exist_ok=True)
    NSR = NS0 + ".KR"
    if (KD / "FarS.lean").exists() and (KD / "FarS.lean").read_text(encoding="utf-8") == fars_body(NS):
        simp_ = f"{MOD}.K.FarS"
        opn = f"{NS0} {NS}"
        print("境の状態は K/FarS.lean をそのまま使う")
    else:
        wr(KR / "FarS.lean", fars_body(NSR))
        simp_ = f"{MOD}.KR.FarS"
        opn = f"{NS0}"
        print("境の状態を KR/FarS.lean に書いた（K/FarS.lean と区間が違う）")
    wr(KR / "FarH.lean", HEADER + f"""-- E3e：wstepR の版の共通の頭（S̄″ と境の状態）。
import PackLean.D16.KernelSegR
import {simp_}

namespace {NSR}
open {OD28}PackLean.D16 {NS0}

/-- S̄″ = ⌈S̄·3^64⌉/3^64（S̄ = ({sn}, {sd}) 以上、分母が奇数）。 -/
def sbR : Int × Nat := ({rn}, {q})

end {NSR}
""")
    hdr_open = f"open {OD28}PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR {opn} {NSR}"
    for gi, g in enumerate(groups):
        i0 = g[0][0][0]
        i1 = g[-1][1][0]
        body = HEADER + f"""-- E3e：区間 {gi * a.per}〜{gi * a.per + len(g) - 1}（歩 {i0}〜{i1}）を wstepR で decide +kernel。
import {MOD}.KR.FarH

namespace {NSR}
{hdr_open}

"""
        for (i, _), (j, _) in g:
            body += OPTS + f"theorem r_{i}_{j} : stEq (runR P sbR toks s_{i} {i} {j}) s_{j} = true := by decide +kernel" + NL
        chain = "".join(f"(segR (by decide) r_{i}_{j}).trans <| " for (i, _), (j, _) in g[:-1]) + \
            f"segR (by decide) r_{g[-1][0][0]}_{g[-1][1][0]}"
        body += f"""
set_option maxRecDepth 100000 in
/-- 歩 {i0} から歩 {i1} まで（区間 {len(g)} 本をつないだもの）。 -/
theorem f{gi:02d} : (toks.drop {i0}).foldl (wstepR P sbR) s_{i0} = (toks.drop {i1}).foldl (wstepR P sbR) s_{i1} :=
  {chain}

end {NSR}
"""
        wr(KR / f"Far{gi:02d}.lean", body)
    N_ = bounds[-1][0]
    imports = NL.join(f"import {MOD}.KR.Far{gi:02d}" for gi in range(len(groups)))
    chain = "".join(f"f{gi:02d}.trans <| " for gi in range(len(groups)))
    body = HEADER + f"""-- E3e：遠方の全部を wstepR で（native_decide なし）。健全性は PackLean.Formal.SandwichR（d16_sandwich_certR）。
{imports}

namespace {NSR}
{hdr_open}

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstepR P sbR) s_0 = s_{N_} :=
  {chain}finR (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部（wstepR、S̄″ = sbR）：受理 {nA}・捨てた {nD}・L {nL}。 -/
theorem far_okR : farRunR P sbR toks = (true, {nA}, {nD}, {nL}) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRunR
  rw [h]
  decide +kernel

end {NSR}
"""
    wr(KR / "Far.lean", body)
    for f in KR.glob("Far*.lean"):
        if f.name not in WRITTEN:
            f.unlink()
    print("書いた：", KR, f"（ファイル {len(groups)} 本、sbR = ({rn}, 3^64)）")


segs = list(zip(bounds, bounds[1:]))
groups = [segs[i:i + a.per] for i in range(0, len(segs), a.per)]
if a.red:
    write_red()
    raise SystemExit(0)

# 境の状態
body = HEADER + f"""-- 遠方の並び {len(toks)} 歩の区間 {nseg} 本の境の状態（並びを Python で辿り直したもの）。
import {KIMP}
import {MOD}.Far

namespace {NS}
open {OD28}PackLean.D16 {NS0}

/-- 始めの状態（farRun と同じ）。 -/
def s_0 : WState := ⟨rRoots P.rden, true, 0, 0, 0⟩
"""
for j, st in bounds[1:]:
    body += f"def s_{j} : WState := {state(st)}" + NL
body += NL + f"end {NS}" + NL
wr(KD / "FarS.lean", body)

segs = list(zip(bounds, bounds[1:]))
groups = [segs[i:i + a.per] for i in range(0, len(segs), a.per)]
for gi, g in enumerate(groups):
    i0 = g[0][0][0]
    i1 = g[-1][1][0]
    body = HEADER + f"""-- 区間 {gi * a.per}〜{gi * a.per + len(g) - 1}（歩 {i0}〜{i1}）を decide +kernel で。
import {MOD}.K.FarS

namespace {NS}
open {OD28}PackLean.D16 {KOPEN} {NS0}

"""
    for (i, _), (j, _) in g:
        body += OPTS + f"theorem r_{i}_{j} : stEq ({RUN} toks s_{i} {i} {j}) s_{j} = true := by decide +kernel" + NL
    chain = "".join(f"({SEG} (by decide) r_{i}_{j}).trans <| " for (i, _), (j, _) in g[:-1]) +         f"{SEG} (by decide) r_{g[-1][0][0]}_{g[-1][1][0]}"
    body += f"""
set_option maxRecDepth 100000 in
/-- 歩 {i0} から歩 {i1} まで（区間 {len(g)} 本をつないだもの）。 -/
theorem f{gi:02d} : (toks.drop {i0}).foldl ({STEP}) s_{i0} = (toks.drop {i1}).foldl ({STEP}) s_{i1} :=
  {chain}

end {NS}
"""
    wr(KD / f"Far{gi:02d}.lean", body)

N = bounds[-1][0]
imports = NL.join(f"import {MOD}.K.Far{gi:02d}" for gi in range(len(groups)))
chain = "".join(f"f{gi:02d}.trans <| " for gi in range(len(groups)))
body = HEADER + f"""-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
{imports}

namespace {NS}
open {OD28}PackLean.D16 {KOPEN} {NS0}

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl ({STEP}) s_0 = s_{N} :=
  {chain}{FIN} (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 {nA}・捨てた {nD}・L {nL}（元の {MOD}.far_ok と同じ命題）。 -/
theorem far_ok : {FR} toks = (true, {nA}, {nD}, {nL}) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold {FR.split()[0]}
  rw [h]
  decide +kernel

end {NS}
"""
wr(KD / "Far.lean", body)
for f in KD.glob("Far*.lean"):
    if f.name not in WRITTEN:
        f.unlink()
print("書いた：", KD)

if a.direct:
    loc = (D / "Local.lean").read_text(encoding="utf-8")
    nacc = int(re.search(r"theorem local_ok : localOk P cands faces = \(true, (\d+)\)", loc).group(1))
    body = HEADER + f"""-- 元の Consts.lean と同じ命題を decide +kernel で。
import {MOD}.Data

namespace {NS}
open PackLean.D16 {NS0}

{OPTS}theorem consts_ok : constsOk P = true := by decide +kernel

end {NS}
"""
    wr(KD / "Consts.lean", body)
    body = HEADER + f"""-- 元の Local.lean と同じ命題を decide +kernel で。
import {MOD}.Local

namespace {NS}
open PackLean.D16 {NS0}

{OPTS}theorem local_ok : localOk P cands faces = (true, {nacc}) := by decide +kernel

end {NS}
"""
    wr(KD / "Local.lean", body)
    print("定数・局所（1 本ずつ）も書いた")


# ---------------- 局所を面ごと（面の中は区間ごと）に分けた版（--lsplit） ----------------
def lsplit_files(lseg):
    """K/LocalS（面の木の定義と境の状態）・K/LocalI（ident）・K/LocalF<i>（面 i）・K/Local（元と同じ命題）。
    lseg：面の中の 1 区間の受理の数（0 なら面ごとに 1 本）。"""
    loc = (D / "Local.lean").read_text(encoding="utf-8")
    nacc = int(re.search(r"theorem local_ok : localOk P cands faces = \(true, (\d+)\)", loc).group(1))
    dat = (D / "Data.lean").read_text(encoding="utf-8")
    r0 = int(re.search(r"\br0 := (\d+)", dat).group(1))
    fbody = loc.split("def faces : List (List LTok) := [", 1)[1].split("\n\n", 1)[0].strip()
    assert fbody.endswith("]]")
    flines = [ln.strip().rstrip(",") for ln in fbody[:-1].split(NL) if ln.strip()]
    assert len(flines) == 6, len(flines)
    faces = []
    for ln in flines:
        assert ln.startswith("[") and ln.endswith("]")
        tk = [t.strip() for t in ln[1:-1].split(",")]
        faces.append(tk)
    sgs = [(0, "1"), (0, "(-1)"), (1, "1"), (1, "(-1)"), (2, "1"), (2, "(-1)")]

    def lsp(lo, hi):
        w = [h - l for l, h in zip(lo, hi)]
        ws = [16 * w[0], w[1], w[2]]
        mx = max(ws)
        ax = ws.index(mx)
        sm = lo[ax] + hi[ax]
        assert sm % 2 == 0
        mid = sm // 2
        h1 = list(hi); h1[ax] = mid; l2 = list(lo); l2[ax] = mid
        return (list(lo), h1), (l2, list(hi))

    def lstate(stk, n):
        bx = ", ".join(f"⟨[{', '.join(map(str, lo))}], [{', '.join(map(str, hi))}]⟩" for lo, hi in stk)
        return f"⟨[{bx}], true, {n}⟩"

    S = HEADER + f"""-- 局所の 6 面の木（元の faces と同じ）と、面の中の区間の境の状態（木を Python で辿り直したもの）。
import PackLean.D16.KernelLocal
import {MOD}.Local

namespace {NS}
open PackLean.D16 PackLean.D16.KLoc {NS0}

"""
    per_face = []
    tot = 0
    for fi, tk in enumerate(faces):
        S += f"def lf{fi} : List LTok := [{', '.join(tk)}]" + NL
        stk = [([0, -rden, -rden], [r0, rden, rden])]
        n = 0; bnds = [(0, None)]; since = 0
        for k, t in enumerate(tk):
            lo, hi = stk.pop(0)
            if t == ".split":
                c1, c2 = lsp(lo, hi)
                stk = [c1, c2] + stk
            else:
                assert t.startswith("(.acc ")
                n += 1; since += 1
            j = k + 1
            if (lseg and since >= lseg) or j == len(tk):
                bnds.append((j, (list(stk), n))); since = 0
        assert not stk
        tot += n
        for j, (stk_, n_) in bnds[1:]:
            S += f"def l{fi}_{j} : LState := {lstate(stk_, n_)}" + NL
        per_face.append((bnds, n))
    assert tot == nacc, (tot, nacc)
    S += NL + f"/-- 元の faces を 6 面に分けた形。 -/\ntheorem faces_eq : faces = [lf0, lf1, lf2, lf3, lf4, lf5] := rfl" + NL
    S += NL + f"end {NS}" + NL
    wr(KD / "LocalS.lean", S)

    I = HEADER + f"""-- 局所の ident（候補の形と F(0) = 0）を decide +kernel で。
import {MOD}.K.LocalS

namespace {NS}
open PackLean.D16 PackLean.D16.KLoc {NS0}

{OPTS}theorem lident : identOk P cands = true := by decide +kernel

end {NS}
"""
    wr(KD / "LocalI.lean", I)
    for fi, (bnds, n) in enumerate(per_face):
        i, sg = sgs[fi]
        F = HEADER + f"""-- 局所の面 {fi}（軸 {i}、符号 {sg}）の木（受理 {n}）を、区間 {len(bnds) - 1} 本の decide +kernel で。
import {MOD}.K.LocalS

namespace {NS}
open PackLean.D16 PackLean.D16.KLoc {NS0}

"""
        prev = "(lInit P)"
        names = []
        for (a_, _), (b_, _) in zip(bnds, bnds[1:]):
            src = prev
            F += OPTS + f"theorem lr{fi}_{a_}_{b_} : lstEq (lrun P cands {i} {sg} lf{fi} {src} {a_} {b_}) l{fi}_{b_} = true := by decide +kernel" + NL
            names.append(f"lr{fi}_{a_}_{b_}")
            prev = f"l{fi}_{b_}"
        chain = "".join(f"(lseg (by decide) {nm}).trans <| " for nm in names)
        last = bnds[-1][0]
        F += f"""
set_option maxRecDepth 100000 in
theorem lface{fi} : faceFold P cands {i} {sg} lf{fi} (lInit P) = l{fi}_{last} := by
  have h : faceFold P cands {i} {sg} (lf{fi}.drop 0) (lInit P) = l{fi}_{last} :=
    {chain}lfin (by decide +kernel)
  simpa using h

end {NS}
"""
        wr(KD / f"LocalF{fi}.lean", F)
    imps = NL.join([f"import {MOD}.K.LocalI"] + [f"import {MOD}.K.LocalF{fi}" for fi in range(6)])
    L = HEADER + f"""-- 元の Local.lean と同じ命題を、ident と 6 面に分けた decide +kernel で（KernelLocal.localOk_eq）。
{imps}

namespace {NS}
open PackLean.D16 PackLean.D16.KLoc {NS0}

set_option maxRecDepth 100000 in
theorem local_ok : localOk P cands faces = (true, {nacc}) := by
  rw [faces_eq, localOk_eq, lident, lface0, lface1, lface2, lface3, lface4, lface5]
  decide +kernel

end {NS}
"""
    wr(KD / "Local.lean", L)
    print(f"局所：面ごと {[len(b) - 1 for b, _ in per_face]} 区間、受理 {nacc}")


if a.lsplit is not None:
    lsplit_files(a.lsplit)


def top_len(dat, field):
    """Data.lean の `  field := [...]` の一番外の要素の数（括弧の深さで数える）。"""
    body = re.search(r"^  " + field + r" := (\[.*)$", dat, re.M).group(1)
    depth = 0; n = 0; nonempty = False
    for ch in body:
        if ch in "[(⟨":
            depth += 1
            if depth == 2:
                nonempty = True
        elif ch in "])⟩":
            depth -= 1
            if depth == 0:
                break
        elif ch == "," and depth == 1:
            n += 1
        elif depth == 1 and not ch.isspace():
            nonempty = True
    return n + 1 if nonempty else 0


def cfiles(C):
    """Consts の本文の `theorem c_<部品> …` を 1 本ずつ K/C_<部品>.lean に出し、本文からは import で引く。"""
    head, rest = C.split(f"namespace {NS}", 1)
    imps = [l for l in head.splitlines() if l.startswith("import ")]
    opens = rest.split(NL + NL, 1)[0]
    pat = re.compile(r"set_option maxRecDepth 100000 in\nset_option maxHeartbeats 0 in\ntheorem (c_\w+) : .*\n")
    names = []
    for mm in pat.finditer(C):
        nm = mm.group(1); names.append(nm)
        body = (HEADER + f"-- 定数の部品 {nm} を decide +kernel で（Consts から分けたもの）。" + NL + NL.join(imps)
                + NL + NL + f"namespace {NS}{opens}" + NL + NL + mm.group(0) + NL + f"end {NS}" + NL)
        wr(KD / f"C_{nm[2:]}.lean", body)
    C = pat.sub("", C)
    C = C.replace(imps[-1], imps[-1] + NL + NL.join(f"import {MOD}.K.C_{nm[2:]}" for nm in names), 1)
    return C


def psplit_file(pseg, dat):
    """K/C_piece.lean を、pieceOk を開いた等式（rfl）と、前半の 8 つの条件・3 つ組の面の確かめ（pseg 個ずつの区間）の decide +kernel に。"""
    nv = top_len(dat, "verts")
    ntr = nv * (nv - 1) * (nv - 2) // 6
    B = HEADER + f"""-- 定数の部品 c_piece（pieceOk、頂点 {nv}・3 つ組 {ntr}）を、開いた等式 piece_eq（rfl）と、前半の条件 8 つ・
-- 3 つ組の面の確かめ（{pseg} 個ずつの区間、KernelSegW.allSeg_trans でつなぐ）の decide +kernel で。
import {MOD}.K.ConstsG

namespace {NS}
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW {NS0}

/-- n0·v ≤ D0 の余り（pieceOk の sup と同じ）。 -/
def pSup (v : List FE) : FE := fsub (fsmul ((P.dv : Int) * P.dn0) P.d0.num) (fsmul P.d0.den (fdot P.ps P.nb P.n0 v))
/-- 3 つ組の面の確かめ（pieceOk の facetOk と同じ）。 -/
def pFacet (t : Nat × Nat × Nat) : Bool :=
  let (a, b, c) := t
  let va := nth P.verts a []
  let nr := cross P.ps (vsub (nth P.verts b []) va) (vsub (nth P.verts c []) va)
  let side := P.verts.map (fun v => fsign P.ps (fdot P.ps P.nb nr (vsub v va)))
  if fIsZero (nth nr 0 []) && fIsZero (nth nr 1 []) && fIsZero (nth nr 2 []) then true
  else if side.all (· ≤ 0) || side.all (· ≥ 0) then
    let h := fdot P.ps P.nb nr va
    let lhs := fmul P.ps (fmul P.ps (fmul P.ps h h) (fofInt P.nb ((P.d0.den : Int) * P.d0.den))) (fdot P.ps P.nb P.n0 P.n0)
    let rhs := fmul P.ps (fmul P.ps (fmul P.ps P.d0.num P.d0.num) (fofInt P.nb ((P.dn0 : Int) * P.dn0 * P.dv * P.dv))) (fdot P.ps P.nb nr nr)
    fnn P.ps (fsub lhs rhs)
  else true
/-- 辺² ≥ 1（pieceOk の 5 番目と同じ）。 -/
def pD2 (v : List FE) : Bool := P.verts.all (fun w => v == w || fnn P.ps (fsub (d2 P.ps P.nb v w) (fofInt P.nb ((P.dv : Int) * P.dv))))

set_option maxRecDepth 100000 in
theorem piece_eq : pieceOk P = (P.verts.all (fun v => v.length == 3) && P.verts.eraseDups.length == P.verts.length &&
    decide (0 < P.d0.den) && P.verts.all (fun v => P.verts.any (fun w => w == vsmul (-1) v)) &&
    P.verts.all pD2 &&
    P.verts.any (fun v => P.verts.any (fun w => d2 P.ps P.nb v w == fofInt P.nb ((P.dv : Int) * P.dv))) &&
    P.verts.all (fun v => fnn P.ps (pSup v)) && decide ((P.verts.filter (fun v => fIsZero (pSup v))).length ≥ 3) &&
    (triples P.verts.length).all pFacet) := rfl

{OPTS}theorem p1 : P.verts.all (fun v => v.length == 3) = true := by decide +kernel
{OPTS}theorem p2 : (P.verts.eraseDups.length == P.verts.length) = true := by decide +kernel
{OPTS}theorem p3 : decide (0 < P.d0.den) = true := by decide +kernel
{OPTS}theorem p4 : P.verts.all (fun v => P.verts.any (fun w => w == vsmul (-1) v)) = true := by decide +kernel
"""
    def segs_(n, name, lst, f):
        nonlocal B
        bs = list(range(0, n, pseg)) + [n]
        nm = []
        for i, j in zip(bs, bs[1:]):
            B += OPTS + f"theorem {name}_{i}_{j} : allSeg {f} {lst} {i} {j} = true := by decide +kernel" + NL
            nm.append(f"{name}_{i}_{j}")
        chain = "".join(f"allSeg_trans (by decide) {x} <| " for x in nm)
        B += f"""
set_option maxRecDepth 100000 in
theorem {name}_all : {lst}.all {f} = true := by
  have h : ({lst}.drop 0).all {f} = true := {chain}all_fin (by decide +kernel)
  simpa using h

"""
    segs_(nv, "p5", "P.verts", "pD2")
    B += OPTS + "theorem p6 : P.verts.any (fun v => P.verts.any (fun w => d2 P.ps P.nb v w == fofInt P.nb ((P.dv : Int) * P.dv))) = true := by decide +kernel" + NL
    B += OPTS + "theorem p7 : P.verts.all (fun v => fnn P.ps (pSup v)) = true := by decide +kernel" + NL
    B += OPTS + "theorem p8 : decide ((P.verts.filter (fun v => fIsZero (pSup v))).length ≥ 3) = true := by decide +kernel" + NL + NL
    segs_(ntr, "pf", "(triples P.verts.length)", "pFacet")
    B += f"""set_option maxRecDepth 100000 in
theorem c_piece : pieceOk P = true := by
  rw [piece_eq, p1, p2, p3, p4, p5_all, p6, p7, p8, pf_all]; rfl

end {NS}
"""
    wr(KD / "C_piece.lean", B)
    print(f"駒：頂点 {nv}・3 つ組 {ntr} を {pseg} 個ずつ")


# ---------------- 定数を部品ごと（対称性の組は区間ごと）に分けた版（--csplit） ----------------
def csplit_files(cseg):
    """K/ConstsG（対称性の組の 3 つの all、gs・pairs は cseg 個ずつの区間）・K/Consts（残りの部品と、元と同じ命題）。"""
    dat = (D / "Data.lean").read_text(encoding="utf-8")
    npairs = top_len(dat, "pairs")
    ngs = top_len(dat, "gs")
    q = NS0.startswith("PackLean.D44.")  # 定数は D44.constsQ（11/16 E3c 段 3、11/20 E3g4 で D44 の 4 件に）
    G = HEADER + f"""-- 定数の確かめのうち対称性の組（groupOk）を、容器の対称 {ngs}・駒の対称・組 {npairs} の 3 つの all に分け、
-- 容器の対称と組は {cseg} 個ずつの区間の decide +kernel で（KernelSegW.allSeg_trans でつなぐ）。
import PackLean.D16.KernelSegW
import {MOD}.Data

namespace {NS}
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW {NS0}

/-- 容器の対称 g：直交で、容器の法線の集合を保つ。 -/
def fG (g : List (List FE)) : Bool := orthOk P.ps P.nb (P.dg : Int) g &&
  P.normals.all (fun n => P.normals.any (fun m => matVec P.ps P.nb g n == vsmul (P.dg : Int) m))
/-- 駒の対称 k：直交で、駒の頂点の集合を保ち、n0 を固定する。 -/
def fK (kk : List (List FE)) : Bool := orthOk P.ps P.nb (P.dk : Int) kk &&
  P.verts.all (fun v => P.verts.any (fun w => matVec P.ps P.nb kk v == vsmul (P.dk : Int) w)) &&
  matVec P.ps P.nb kk P.n0 == vsmul (P.dk : Int) P.n0
/-- 組 (g, k)：番号が範囲内で det g·det k = 1。 -/
def fPr (x : Nat × Nat) : Bool :=
  decide (x.1 < P.gs.length) && decide (x.2 < P.ks.length) &&
  fmul P.ps (det3 P.ps (nth P.gs x.1 [])) (det3 P.ps (nth P.ks x.2 [])) ==
    fofInt P.nb ((P.dg : Int) * P.dg * P.dg * P.dk * P.dk * P.dk)

set_option maxRecDepth 100000 in
theorem group_eq : groupOk P = (P.gs.all fG && P.ks.all fK && P.pairs.all fPr) := rfl

"""
    def segs(n, name, lst, f):
        nonlocal G
        bs = list(range(0, n, cseg)) + [n]
        nm = []
        for i, j in zip(bs, bs[1:]):
            G += OPTS + f"theorem {name}_{i}_{j} : allSeg {f} P.{lst} {i} {j} = true := by decide +kernel" + NL
            nm.append(f"{name}_{i}_{j}")
        chain = "".join(f"allSeg_trans (by decide) {x} <| " for x in nm)
        G += f"""
set_option maxRecDepth 100000 in
theorem {name}_all : P.{lst}.all {f} = true := by
  have h : (P.{lst}.drop 0).all {f} = true := {chain}all_fin (by decide +kernel)
  simpa using h

"""
    segs(ngs, "cg", "gs", "fG")
    G += OPTS + "theorem ck_all : P.ks.all fK = true := by decide +kernel" + NL + NL
    segs(npairs, "cp", "pairs", "fPr")
    G += f"""set_option maxRecDepth 100000 in
theorem group_ok : groupOk P = true := by
  rw [group_eq, cg_all, ck_all, cp_all]; rfl

end {NS}
"""
    wr(KD / "ConstsG.lean", G)
    if q:
        C = HEADER + f"""-- 元の Consts.lean と同じ命題（D44.constsQ）を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import PackLean.D44.Core
import {MOD}.K.ConstsG

namespace {NS}
open PackLean.D16 PackLean.D44 {NS0}
open PackLean.D28 (QF)

{OPTS}theorem c_sqb : sqbOk P = true := by decide +kernel
{OPTS}theorem c_piece : pieceOk P = true := by decide +kernel
{OPTS}theorem c_cont : containerOk P = true := by decide +kernel
{OPTS}theorem c_bounds : boundsOk P = true := by decide +kernel
{OPTS}theorem c_sstar : sstarIsSbar P = true := by decide +kernel
{OPTS}theorem c_upper : upperOk {{ P with sstar := sUp }} = true := by decide +kernel
{OPTS}theorem c_claim : claimOk P sbarS sUp sUpRat = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem consts_ok : constsQ P sbarS sUp sUpRat = true := by
  rw [constsQ, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_sstar, c_upper, c_claim]
  decide +kernel

end {NS}
"""
    else:
        C = HEADER + f"""-- 元の Consts.lean と同じ命題を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import {MOD}.K.ConstsG

namespace {NS}
open PackLean.D16 {NS0}

{OPTS}theorem c_sqb : sqbOk P = true := by decide +kernel
{OPTS}theorem c_piece : pieceOk P = true := by decide +kernel
{OPTS}theorem c_cont : containerOk P = true := by decide +kernel
{OPTS}theorem c_bounds : boundsOk P = true := by decide +kernel
{OPTS}theorem c_upper : upperOk P = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem consts_ok : constsOk P = true := by
  rw [constsOk, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_upper]
  decide +kernel

end {NS}
"""
    if a.cfiles:
        C = cfiles(C)
        if a.psplit:
            psplit_file(a.psplit, dat)
    wr(KD / "Consts.lean", C)
    print(f"定数：容器の対称 {ngs}・組 {npairs} を {cseg} 個ずつ")


if a.csplit is not None:
    csplit_files(a.csplit)
