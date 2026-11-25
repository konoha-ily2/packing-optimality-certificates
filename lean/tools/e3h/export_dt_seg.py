"""E3h（2026-11-17）：D45DT（dodintet）の遠方の組を、R の木の区間ごとの decide +kernel に書き出す（下見）。

使い方:
  python -X utf8 lean/tools/e3h/export_dt_seg.py --file 1 --pairs 0-1 --seg 20 --var 0 --out K0a
    --var 0：約分なし（segT、D45DT.Core の rchar のまま）
    --var 1：箱を約分（segTR、P2 = P）。尺度が正確に 1/g 倍になるだけなので、落ちる葉は出ない
    --var 2：箱の約分＋n の箱の約分（nd/gn）＋κ を奇数の分母 3^50 に切り上げ＋√ の括弧を 3^76 の尺度に
             （どれも主張を強める向き。落ちる葉がないかは本番の前に全部で確かめる）

元の D45DT/FarNNN.lean（String の並び）を読み、組ごとに U の木と L の木を葉 seg 個ごとに切って、
切れ目のスタックを Python でたどって書く（rchar と同じ動き。ずれていればカーネルで落ちるだけ）。
書き出し先：lean/PackLean/E3h/<out>.lean
"""
import os, re, sys, argparse
from math import gcd, isqrt

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))
DIG = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
REC = re.compile(r'⟨⟨(-?\d+), (-?\d+), (-?\d+), (-?\d+)⟩, (\d+), (-?\d+), (-?\d+),\s*"([^"]*)",\s*"([^"]*)"⟩')

DEN = 17592186044416
ND = 1073741824
KD = 1208925819614629174706176
KOFF = 16777216
KH = [-388164747324814147226668, 1210305399952762197208578, 217514432804300658799321]
KD2 = 3 ** 50
SQ2 = 3 ** 76


def records(fileno):
    s = open(os.path.join(LEAN, "PackLean", "D45DT", f"Far{fileno:03d}.lean"), encoding="utf-8").read()
    out = []
    for m in REC.finditer(s):
        l0, l1, h0, h1, mode, oU, oL = map(int, m.groups()[:7])
        out.append(dict(nb=(l0, l1, h0, h1), mode=mode, offU=oU, offL=oL, tU=m.group(8), tL=m.group(9)))
    return out


def split3(b):
    ch, lo, hi = b
    w = [h - l for l, h in zip(lo, hi)]
    if w[0] >= w[1] and w[0] >= w[2]:
        ax = 0
    elif w[1] >= w[2]:
        ax = 1
    else:
        ax = 2
    mid = (lo[ax] + hi[ax]) // 2
    h1 = list(hi); h1[ax] = mid
    l2 = list(lo); l2[ax] = mid
    return (ch, list(lo), h1), (ch, l2, list(hi))


def cut(toks, seg):
    """並びを葉 seg 個ごとに切る：[(区間の字の並び, 始めのスタック, 終わりのスタック, 葉の数 (A, D, L))]"""
    stack = [(ch, [-DEN] * 3, [DEN] * 3) for ch in range(4)]
    out = []
    cur, k0, nl, cnt = [], list(stack), 0, [0, 0, 0]
    i = 0
    while i < len(toks):
        c = toks[i]
        if c == ".":
            b = stack.pop(0); p, q = split3(b); stack = [p, q] + stack
            cur.append(c); i += 1
            continue
        if c == "L":
            n = 1; cnt[2] += 1
        elif c == "D":
            n = 2; cnt[1] += 1
        elif c == "A":
            n = 5; cnt[0] += 1
        else:
            raise ValueError(("字の読み違い", i, c))
        cur.extend(toks[i:i + n]); i += n
        stack.pop(0); nl += 1
        if nl % seg == 0:
            out.append(("".join(cur), k0, list(stack), tuple(cnt)))
            cur, k0, cnt = [], list(stack), [0, 0, 0]
    assert not stack, "並びの終わりでスタックが空でない"
    if cur:
        out.append(("".join(cur), k0, [], tuple(cnt)))
    return out


def rbox_s(b):
    ch, lo, hi = b
    return f"⟨{ch}, {lo[0]}, {lo[1]}, {lo[2]}, {hi[0]}, {hi[1]}, {hi[2]}⟩"


def stack_s(k):
    return "[" + ", ".join(rbox_s(b) for b in k) + "]"


def chars_s(t):
    return "[" + ", ".join(f"'{c}'" for c in t) + "]"


def tree_kap(form, sig, off):
    k0, k1, k2 = KH
    a = [k0, k1 if sig == 0 else -k1, k2] if form == 1 else [-k0, k1 if sig == 0 else -k1, -k2]
    return [a[0], a[1], a[2] + off * (KD // KOFF)]


def ceil_div(a, b):
    return -((-a) // b)


def var2_consts(r, side):
    l0, l1, h0, h1 = r["nb"]
    g = gcd(ND, gcd(abs(l0), gcd(abs(l1), gcd(abs(h0), abs(h1)))))
    gn = g // 2 if g % 2 == 0 else 1
    nb2 = (l0 // gn, l1 // gn, h0 // gn, h1 // gn)
    fU = 0 if r["mode"] == 2 else 1
    fL = 0 if r["mode"] == 1 else 1
    kap = tree_kap(fU, 0, r["offU"]) if side == 0 else tree_kap(fL, 1, r["offL"])
    kap2 = [ceil_div(k * KD2, KD) for k in kap]       # κ″ ≥ κ（x, y, 1 ≥ 0 なので点ごとに大きい）
    return ND // gn, nb2, kap2


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--file", type=int, default=1)
    ap.add_argument("--pairs", default="0-1")
    ap.add_argument("--seg", type=int, default=20)
    ap.add_argument("--var", type=int, default=0)
    ap.add_argument("--out", required=True)
    ap.add_argument("--prof", action="store_true")
    a = ap.parse_args()
    lo, hi = map(int, a.pairs.split("-"))
    recs = records(a.file)
    sel = list(range(lo, hi + 1))
    L = ["-- 自動で書き出したもの（lean/tools/e3h/export_dt_seg.py、E3h の下見）。手で直さない。",
         f"-- Far{a.file:03d} の組 {lo}〜{hi}、葉 {a.seg} 個ごとの区間、var {a.var}",
         "import PackLean.E3h.Seg", "", "namespace PackLean.E3h.Out", "open PackLean.D28 (RBox)",
         "open PackLean.D45DT PackLean.E3h", ""]
    if a.prof:
        L += ["set_option profiler true", "set_option profiler.threshold 1", ""]
    if a.var == 2:
        s5 = isqrt(5 * SQ2 * SQ2)
        L.append(f"def SQB2 : List (Int × Int) := [({SQ2}, {SQ2}), ({s5}, {s5 + 1})]")
        L.append("")
    tot = [0, 0, 0]; nthm = 0
    for p in sel:
        r = recs[p]
        l0, l1, h0, h1 = r["nb"]
        nb = f"(⟨{l0}, {l1}, {h0}, {h1}⟩ : NB)"
        for side, toks in ((0, r["tU"]), (1, r["tL"])):
            nm = f"p{p}{'U' if side == 0 else 'L'}"
            L.append(f"def c_{nm} : TreeCtx := ctxOf P {nb} {r['mode']} ({r['offU']}) ({r['offL']}) {side}")
            if a.var == 2:
                nd2, nb2, kap2 = var2_consts(r, side)
                L.append(f"def c2_{nm} : TreeCtx := {{ c_{nm} with nb := ⟨{nb2[0]}, {nb2[1]}, {nb2[2]}, {nb2[3]}⟩, "
                         f"kap := [{kap2[0]}, {kap2[1]}, {kap2[2]}] }}")
                L.append(f"def P2_{nm} : Prm := {{ P with nd := {nd2}, kd := {KD2}, sqb := SQB2 }}")
            for j, (t, k0, k1, cnt) in enumerate(cut(toks, a.seg)):
                for q in range(3):
                    tot[q] += cnt[q]
                nthm += 1
                L.append("set_option maxRecDepth 100000 in")
                L.append(f"-- 葉 A {cnt[0]}・D {cnt[1]}・L {cnt[2]}")
                if a.var == 0:
                    body = f"segT P c_{nm}"
                elif a.var == 1:
                    body = f"segTR P P c_{nm} c_{nm}"
                else:
                    body = f"segTR P P2_{nm} c_{nm} c2_{nm}"
                L.append(f"theorem s_{nm}_{j} : {body}\n    {stack_s(k0)}\n    {chars_s(t)}\n    {stack_s(k1)} = true := by\n  decide +kernel")
            L.append("")
    L.append("end PackLean.E3h.Out")
    path = os.path.join(LEAN, "PackLean", "E3h", a.out + ".lean")
    open(path, "w", encoding="utf-8", newline="\n").write("\n".join(L) + "\n")
    print(f"{path}: 定理 {nthm}、葉 A {tot[0]}・D {tot[1]}・L {tot[2]}（計 {sum(tot)}）、{os.path.getsize(path)} バイト")


if __name__ == "__main__":
    main()
