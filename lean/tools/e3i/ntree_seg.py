"""E3i3：D45DT の n の木を区間に切って decide +kernel の形で書き出す（plan/A9k_dodintet_design.md 5.3 節）。

n の木（D45DT/Data.lean の ntoks、11,181 字）を Python で nchar のとおりにたどり、箱（Bun/Recs.lean の
recsAll の nb の四隅、5,477 個）を G 個ずつ使い切ったところで区間を切る。区間 j は
  theorem s_j : nseg stk_j bx_j tk_j stk_{j+1} = true := by decide +kernel
（NTSeg.nseg、stk は区間の境のスタック、bx はその区間で使う箱、tk は字の List Char）。

使い方：
  python -X utf8 lean/tools/e3i/ntree_seg.py --count            葉・区間の数とスタックの深さだけ
  python -X utf8 lean/tools/e3i/ntree_seg.py --group G [--out NT] [--first K] [--per F]
      PackLean/E3i/<out>/S{i}.lean（区間 F 個ずつ）と <out>/All.lean（鎖と hn）を書く。
      --first K：最初の K 区間だけ（試し、All は書かない）。
  python -X utf8 lean/tools/e3i/ntree_seg.py --whole [--out NT]
      区間に切らない形（本命、5.3 節）：<out>/NTree.lean（字を List Char の字面にして n の木 1 つを
      decide +kernel）、<out>/Final.lean（dodintet_ofL：ntoks を一般の List Char にした dodintet_of）、
      <out>/All.lean（Bun/All.lean の okAll を写し、NTree.hn とつなぐ）。
      31 GB に膨らんだのは String.toList（v4.36 の String は ByteArray）をカーネルで開いたため【数字】。
"""
import argparse, os, re, sys

LEAN = os.path.normpath(os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", ".."))
REC = re.compile(r"^def r(\d{3})_(\d+) : FBoxL := ⟨⟨(-?\d+), (-?\d+), (-?\d+), (-?\d+)⟩")


def load():
    src = open(os.path.join(LEAN, "PackLean/D45DT/Data.lean"), encoding="utf-8").read()
    toks = re.search(r'def ntoks : String := "([^"]*)"', src).group(1)
    nd = int(re.search(r"nd := (\d+)", src).group(1))
    rec, order = {}, []
    for ln in open(os.path.join(LEAN, "PackLean/E3i/Bun/Recs.lean"), encoding="utf-8"):
        m = REC.match(ln)
        if m:
            rec[(m.group(1), int(m.group(2)))] = tuple(int(m.group(i)) for i in range(3, 7))
        elif ln.startswith("def recs") and not ln.startswith("def recsAll"):
            f = ln[8:11]
            order += [(f, int(x)) for x in re.findall(r"r\d{3}_(\d+)", ln.split(":=", 1)[1])]
        elif ln.startswith("def recsAll"):
            fs = re.findall(r"recs(\d{3})", ln.split(":=", 1)[1])
            assert fs == sorted(fs)
    return toks, nd, [rec[k] for k in order]


def run(toks, nd, boxes, group):
    """nchar をたどり、区間の境（字の位置・スタック・使った箱の数）を返す。"""
    st = [(0, 0, nd, nd)]  # 末尾が頂上
    used, cuts, maxd = 0, [(0, list(st), 0)], 1
    for i, ch in enumerate(toks):
        b = st.pop()
        if ch == ".":
            l0, l1, h0, h1 = b
            assert h0 - l0 > 2 or h1 - l1 > 2
            if h0 - l0 >= h1 - l1:
                m = (l0 + h0) // 2; c1, c2 = (l0, l1, m, h1), (m, l1, h0, h1)
            else:
                m = (l1 + h1) // 2; c1, c2 = (l0, l1, h0, m), (l0, m, h0, h1)
            st += [c2, c1]
        elif ch == "x":
            assert b[1] > b[2]
        elif ch == "o":
            assert boxes[used] == b, (i, used)
            used += 1
            if used % group == 0 and used < len(boxes):
                cuts.append((i + 1, list(st), used))
        else:
            raise ValueError(ch)
        maxd = max(maxd, len(st))
    assert not st and used == len(boxes)
    cuts.append((len(toks), [], used))
    return cuts, maxd


def lit_q(q):
    return "(" + ", ".join(str(x) for x in q) + ")"


def lit_stk(st):  # Python は末尾が頂上、Lean は先頭が頂上
    return "[" + ", ".join(lit_q(q) for q in reversed(st)) + "]"


def lit_chars(s):
    return "[" + ", ".join(f"'{c}'" for c in s) + "]"


HEAD = ["-- 自動で書き出したもの（lean/tools/e3i/ntree_seg.py、E3i3）。手で直さない。git に入れない。"]


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--count", action="store_true")
    ap.add_argument("--group", type=int, default=100)
    ap.add_argument("--out", default="NT")
    ap.add_argument("--first", type=int, default=0)
    ap.add_argument("--per", type=int, default=20)
    ap.add_argument("--whole", action="store_true")
    a = ap.parse_args()
    toks, nd, boxes = load()
    if a.whole:
        run(toks, nd, boxes, len(boxes))  # Python で一度たどって確かめる
        write_whole(a.out, toks)
        return
    print(f"字 {len(toks)}（. {toks.count('.')}・o {toks.count('o')}・x {toks.count('x')}）、箱 {len(boxes)}、nd {nd}")
    if a.count:
        for g in (25, 50, 100, 200, 500, 1000, 5477):
            cuts, maxd = run(toks, nd, boxes, g)
            mx = max(len(c[1]) for c in cuts)
            print(f"  G={g}: 区間 {len(cuts) - 1}、スタックの深さの最大 {maxd}（境で {mx}）")
        return
    cuts, maxd = run(toks, nd, boxes, a.group)
    nseg = len(cuts) - 1
    if a.first:
        nseg = min(nseg, a.first)
    d = os.path.join(LEAN, "PackLean/E3i", a.out)
    os.makedirs(d, exist_ok=True)
    nfile = (nseg + a.per - 1) // a.per
    for fi in range(nfile):
        L = HEAD + ["import PackLean.E3i.NTSeg", "", f"namespace PackLean.E3i.{a.out}",
                    "open PackLean.E3i.NTSeg", "", "set_option maxHeartbeats 0", "set_option maxRecDepth 100000", ""]
        for j in range(fi * a.per, min(nseg, (fi + 1) * a.per)):
            (i0, st0, u0), (i1, st1, u1) = cuts[j], cuts[j + 1]
            if j == 0 or j == fi * a.per:
                L.append(f"def k{j:04d} : List Q := {lit_stk(st0)}")
            L.append(f"def k{j + 1:04d} : List Q := {lit_stk(st1)}")
            L.append(f"def b{j:04d} : List Q := [" + ", ".join(lit_q(q) for q in boxes[u0:u1]) + "]")
            L.append(f"def t{j:04d} : List Char := {lit_chars(toks[i0:i1])}")
            L.append(f"theorem s{j:04d} : nseg k{j:04d} b{j:04d} t{j:04d} k{j + 1:04d} = true := by decide +kernel")
            L.append("")
        L += [f"end PackLean.E3i.{a.out}"]
        open(os.path.join(d, f"S{fi:03d}.lean"), "w", encoding="utf-8", newline="\n").write("\n".join(L) + "\n")
    print(f"区間 {nseg}（G={a.group}）、ファイル {nfile}、{d}")
    if a.first:
        return
    # 鎖：右に入れ子（a ++ (b ++ …)）
    L = HEAD + [f"import PackLean.E3i.{a.out}.S{fi:03d}" for fi in range(nfile)] + [
        "import PackLean.E3i.Bun.Recs", "", f"namespace PackLean.E3i.{a.out}.All",
        f"open PackLean.E3i.NTSeg PackLean.E3i.{a.out} PackLean.D45DT", "",
        "set_option maxHeartbeats 0", "set_option maxRecDepth 100000", "",
        "def toksAll : List Char := " + " ++ ".join(f"t{j:04d}" for j in range(nseg)),
        "def bxAll : List Q := " + " ++ ".join(f"b{j:04d}" for j in range(nseg)), "",
        "theorem chain : nseg k0000 bxAll toksAll [] = true :="]
    expr = f"s{nseg - 1:04d}"
    for j in range(nseg - 2, -1, -1):
        expr = f"nseg_append s{j:04d} ({expr})"
    L += ["  " + expr, "",
          "theorem bx_eq : PackLean.E3i.Bun.Recs.recsAll.map (fun r => PackLean.Formal.DTCover.cornersN r.nb) = bxAll := by",
          "  decide +kernel", "",
          "theorem hn : (ntreeRunL P.nd toksAll",
          "    (PackLean.E3i.Bun.Recs.recsAll.map fun r => PackLean.Formal.DTCover.cornersN r.nb)).1 = true := by",
          "  rw [bx_eq]; exact ntree_of_nseg chain", "",
          f"end PackLean.E3i.{a.out}.All", "",
          f"#assert_std_axioms PackLean.E3i.{a.out}.All.hn"]
    open(os.path.join(d, "All.lean"), "w", encoding="utf-8", newline="\n").write("\n".join(L) + "\n")


REC_MAP = "(PackLean.E3i.Bun.Recs.recsAll.map fun r => PackLean.Formal.DTCover.cornersN r.nb)"


def write_whole(out, toks):
    d = os.path.join(LEAN, "PackLean/E3i", out)
    os.makedirs(d, exist_ok=True)
    def put(name, L):
        open(os.path.join(d, name + ".lean"), "w", encoding="utf-8", newline="\n").write("\n".join(L) + "\n")
    put("NTree", HEAD + [
        "-- n の木：字を List Char の字面で（String.toList をカーネルで開かない）、recsAll の箱に順に一致",
        "import PackLean.E3i.Bun.Recs", "", f"namespace PackLean.E3i.{out}.NTree", "open PackLean.D45DT", "",
        "set_option maxHeartbeats 0", "set_option maxRecDepth 100000", "",
        f"def toksL : List Char := {lit_chars(toks)}", "",
        f"theorem hn : (ntreeRunL P.nd toksL {REC_MAP}).1 = true := by", "  decide +kernel", "",
        f"end PackLean.E3i.{out}.NTree", "", f"#assert_std_axioms PackLean.E3i.{out}.NTree.hn"])
    put("Final", HEAD + [
        "-- Bun/Final.lean の dodintet_of の ntoks を一般の List Char にしたもの（証明は同じ）",
        "import PackLean.E3i.Bun.Final", "", f"namespace PackLean.E3i.{out}.Final",
        "open PackLean.D45DT PackLean.E3i.Bun.Final", "",
        "theorem dodintet_ofL {ntoks : List Char}",
        f"    (hn : (ntreeRunL P.nd ntoks {REC_MAP}).1 = true)",
        "    (hb : PackLean.E3i.BunCore.RecsOk P PackLean.E3i.Bun.Recs.recsAll) : Formal.dodintet_n02 := by",
        "  have hup := Formal.DTCase.dt_fit verts_eq dv_eq Formal.DTUpper.dt_upper",
        "  rw [cnum_eq, cden_eq] at hup",
        "  refine PackLean.E3i.BunCase.dt_caseR verts_eq dv_eq Formal.DTBase.dt_extra_ok kd_pos",
        "    Formal.DTLocalPoly.dt_loc_ok Formal.DTLocalPoly.dt_tube_ok wA wB (by norm_num) (by norm_num)",
        "    hA hB hn hb ?_ ?_",
        "  · rw [cnum_eq, cden_eq]; norm_num",
        "  · convert hup using 2; norm_num", "",
        f"end PackLean.E3i.{out}.Final", "", f"#assert_std_axioms PackLean.E3i.{out}.Final.dodintet_ofL"])
    src = os.path.join(LEAN, "PackLean/E3i/Bun/All.lean")
    if not os.path.exists(src):
        print("Bun/All.lean がない（先に bundle.py）。All は書かない"); return
    A = open(src, encoding="utf-8").read()
    A = A.replace("import PackLean.E3i.Bun.Final\nimport PackLean.E3i.Bun.NTree\n",
                  f"import PackLean.E3i.{out}.Final\nimport PackLean.E3i.{out}.NTree\n")
    # Bun.All の中では R000.ok が親の名前空間 PackLean.E3i.Bun から見えていた。{out}.All へ移すと見えなくなるので完全な名前に（11/19 の異常終了の原因）
    A = re.sub(r"(?<![\w.])(R\d{3})\.ok\b", r"PackLean.E3i.Bun.\1.ok", A)
    A = A.replace("namespace PackLean.E3i.Bun.All", f"namespace PackLean.E3i.{out}.All")
    A = A.replace("end PackLean.E3i.Bun.All", f"end PackLean.E3i.{out}.All")
    A = A.replace("Bun.Final.dodintet_of Bun.NTree.hn okAll",
                  f"PackLean.E3i.{out}.Final.dodintet_ofL PackLean.E3i.{out}.NTree.hn okAll")
    A = A.replace("#assert_std_axioms PackLean.E3i.Bun.All.okAll PackLean.E3i.Bun.All.dodintet_n02_proofK",
                  f"#assert_std_axioms PackLean.E3i.{out}.All.okAll PackLean.E3i.{out}.All.dodintet_n02_proofK")
    A = A.replace("-- 自動で書き出したもの（lean/tools/e3i/bundle.py", "-- 自動で書き出したもの（lean/tools/e3i/ntree_seg.py が bundle.py の出力を写した")
    assert "Bun.NTree" not in A and f"{out}.Final.dodintet_ofL" in A
    put("All", [A.rstrip("\n")])
    print(f"書いた：{d} の NTree.lean・Final.lean・All.lean")


if __name__ == "__main__":
    main()
