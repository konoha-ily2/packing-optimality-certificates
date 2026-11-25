"""E3i（2026-11-18）：D45DT の遠方の木を、Nat の組の判定器 segN（E3f 段 1）の区間に分けて書き出す（本番）。

使い方:
  python -X utf8 lean/tools/e3i/export.py --mode kernel [--files 0-50] [--seg 40] [--chunk 1000]
      PackLean/E3i/Gen/F{f}_{k}.lean に `theorem … : segN … = true := by decide +kernel` を書く（走り手が検査する）
  python -X utf8 lean/tools/e3i/export.py --mode eval [--files …]
      PackLean/E3i/Eval/F{f}_{k}.lean に同じ区間を `#eval` で並べる（全葉の下見、証明ではない）。
      落ちた区間だけ `NG 名前` を出し、最後に `DONE 区間の数` を出す
  python -X utf8 lean/tools/e3i/export.py --mode err --files 1 --pairs 0-3
      誤りの版：区間ごとに 4 通りの誤りを入れて segN を #eval（PackLean/E3i/Err/）
  --meta：書いたファイルの SHA-256・大きさ・区間と葉の数を lean/tools/e3i/export_meta_{mode}.json に

形（plan/E3f_nat_leaf.md 7.4 節）：区間は `segN P (P2of nd2) K c k0 toks k1`、K = ctxN (P2of nd2) c2.sig c2.nb c2.kap。
束ねでは区間ごとに Formal/E3fSeg.lean の segN_eq で segTR（E3h の rcharR、正本）の主張に直す。
c・c2・nd2 の作り方と区間の切り方は lean/tools/e3h/export_dt_seg.py（var 2）と同じ。
生成したデータは git に入れない（.gitignore）。並びは D45DT/FarNNN.lean の記録から一意に作り直せる。
"""
import os, sys, json, gzip, hashlib, argparse

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, os.path.join(HERE, "..", "e3h"))
import export_dt_seg as X  # noqa: E402

NFILES = 51
SUB = {"kernel": "Gen", "eval": "Eval", "err": "Err", "demo": "Demo"}


def head(mode, f, k, desc):
    L = [f"-- 自動で書き出したもの（lean/tools/e3i/export.py --mode {mode}、E3i）。手で直さない。git に入れない。",
         f"-- {desc}",
         "import PackLean.Formal.E3iFar" if mode == "demo" else "import PackLean.E3i.Consts", "",
         f"namespace PackLean.E3i.{SUB[mode]}.F{f:03d}_{k:03d}",
         "open PackLean.D28 (RBox rRoots)",
         "open PackLean.D45DT PackLean.E3h PackLean.E3f PackLean.D45DT.LN PackLean.E3i", "",
         "set_option maxHeartbeats 0", "set_option maxRecDepth 100000", ""]
    if mode in ("eval", "err"):
        L += ["def rep (nm : String) (xs : List Bool) : IO Unit := do",
              "  for (b, i) in xs.zipIdx do",
              "    if !b then IO.println s!\"NG {nm}_{i}\"", ""]
    return L


def tree_defs(nm, r, side):
    l0, l1, h0, h1 = r["nb"]
    nb = f"(⟨{l0}, {l1}, {h0}, {h1}⟩ : NB)"
    nd2, nb2, kap2 = X.var2_consts(r, side)
    return [f"def c_{nm} : TreeCtx := ctxOf P {nb} {r['mode']} ({r['offU']}) ({r['offL']}) {side}",
            f"def c2_{nm} : TreeCtx := {{ c_{nm} with nb := ⟨{nb2[0]}, {nb2[1]}, {nb2[2]}, {nb2[3]}⟩, "
            f"kap := [{kap2[0]}, {kap2[1]}, {kap2[2]}] }}",
            f"def K_{nm} : CtxN := ctxN (P2of {nd2}) c2_{nm}.sig c2_{nm}.nb c2_{nm}.kap"], nd2, kap2


def tree_thm(nm, nd2, kap2, segs):
    """束ねの形（試し）：区間の定理を E3iFar.seg_stepN で鎖にして、木 1 本の E3iFar.TreeR を示す"""
    st = "hw PackLean.Formal.E3iFar.sqOk_SQB2 (by decide) rfl"
    chain = "(PackLean.Formal.E3iFar.covers_nil _ _ _ _)"
    for j in reversed(range(len(segs))):
        chain = f"(PackLean.Formal.E3iFar.seg_stepN {st} s_{nm}_{j}\n      {chain})"
    dk = "by decide +kernel"
    return [f"theorem t_{nm} : PackLean.Formal.E3iFar.TreeR P c_{nm} := by",
            f"  have hw : PackLean.Formal.TetFar.WF (toProb (P2of {nd2})) := PackLean.Formal.TetFar.wf_of_ok ({dk})",
            f"  have e : rRoots P.den = {X.stack_s(segs[0][1])} := {dk}",
            f"  have hc : PackLean.Formal.E3iFar.Covers P (P2of {nd2}) c_{nm} c2_{nm} (rRoots P.den) := by",
            f"    rw [e]; exact {chain}",
            f"  exact ⟨{nd2}, c2_{nm}, {kap2[0]}, {kap2[1]}, {kap2[2]}, {dk}, rfl, {dk}, {dk}, {dk}, rfl, {dk},",
            f"    {dk}, {dk}, {dk}, {dk}, hc⟩"]


COARSE = None      # --coarse のとき：組 → {"tU", "tL"}（lean/tools/e3i/coarsen.py の出力）
FALLBACK = set()   # --fallback：元の並びに戻す木（"F001 p1U" の形）


def load_coarse(f):
    path = os.path.join(X.LEAN, "PackLean", "E3i", "Coarse", f"F{f:03d}.json.gz")
    if not os.path.exists(path):
        return {}
    return {o["p"]: o for o in json.load(gzip.open(path, "rt", encoding="utf-8")) if o}


def trees(f, pairs=None):
    """(名前, 記録, side, 区間の一覧) を順に。区間は (字の並び, 始めのスタック, 終わりのスタック, 葉の数)。
    --coarse なら、まとめた並び（なければ元の並び、--fallback の木も元の並び）"""
    recs = X.records(f)
    co = load_coarse(f) if COARSE else {}
    rng = range(len(recs)) if pairs is None else range(pairs[0], min(pairs[1], len(recs) - 1) + 1)
    for p in rng:
        r = recs[p]
        for side, key in ((0, "tU"), (1, "tL")):
            nm = f"p{p}{'UL'[side]}"
            toks = r[key]
            if p in co and f"F{f:03d} {nm}" not in FALLBACK:
                toks = co[p][key]
            yield nm, r, side, toks


def write(mode, f, k, L, out):
    d = os.path.join(X.LEAN, "PackLean", "E3i", SUB[mode])
    os.makedirs(d, exist_ok=True)
    path = os.path.join(d, f"F{f:03d}_{k:03d}.lean")
    data = ("\n".join(L) + "\n").encode("utf-8")
    open(path, "wb").write(data)
    out.append(dict(path=os.path.relpath(path, X.LEAN).replace("\\", "/"), bytes=len(data),
                    sha256=hashlib.sha256(data).hexdigest()))
    return out[-1]


def export_file(f, a, out):
    k = 0
    L = None
    nseg = 0
    cnt = [0, 0, 0]
    ntrees = 0
    trees_in = []

    def flush():
        nonlocal L, k, nseg, cnt, ntrees, trees_in
        if L is None:
            return
        if a.mode in ("eval", "err"):
            L.append(f"#eval IO.println \"DONE {nseg}\"")
        L.append(f"end PackLean.E3i.{SUB[a.mode]}.F{f:03d}_{k:03d}")
        m = write(a.mode, f, k, L, out)
        m.update(segs=nseg, leaves_A=cnt[0], leaves_D=cnt[1], leaves_L=cnt[2], trees=trees_in)
        print(f"{m['path']}: 区間 {nseg}、葉 A {cnt[0]}・D {cnt[1]}・L {cnt[2]}、{m['bytes']} バイト", flush=True)
        k += 1
        L, nseg, cnt, trees_in = None, 0, [0, 0, 0], []

    for nm, r, side, toks in trees(f, a.pairs):
        segs = X.cut(toks, a.seg)
        if L is not None and nseg + len(segs) > a.chunk and nseg > 0:
            flush()
        if L is None:
            L = head(a.mode, f, k, f"Far{f:03d}、葉 {a.seg} 個ごとの区間")
        defs, nd2, kap2 = tree_defs(nm, r, side)
        L += defs
        trees_in.append([nm, len(segs)])
        ev = []
        errs = {}
        for j, (t, k0, k1, c) in enumerate(segs):
            for q in range(3):
                cnt[q] += c[q]
            nseg += 1
            args = f"\n    {X.stack_s(k0)}\n    {X.chars_s(t)}\n    {X.stack_s(k1)}"
            body = f"segN P (P2of {nd2}) K_{nm} c_{nm}"
            if a.mode in ("kernel", "demo"):
                L.append(f"theorem s_{nm}_{j} : {body}{args} = true := by\n  decide +kernel")
            elif a.mode == "eval":
                ev.append(f"{body}{args}")
            else:  # err：誤りの版（どれも false になってほしいもの）
                muts = []
                ia = t.find("A")
                if ia >= 0:
                    tv = t[:ia + 1] + X.DIG[(X.DIG.index(t[ia + 1]) + 1) % 20] + t[ia + 2:]
                    muts.append(("v", f"{body}\n    {X.stack_s(k0)}\n    {X.chars_s(tv)}\n    {X.stack_s(k1)}"))
                idd = t.find("D")
                if idd >= 0:
                    td = t[:idd + 1] + X.DIG[(X.DIG.index(t[idd + 1]) + 1) % 60] + t[idd + 2:]
                    muts.append(("d", f"{body}\n    {X.stack_s(k0)}\n    {X.chars_s(td)}\n    {X.stack_s(k1)}"))
                if c[0] > 0:
                    kk = f"(ctxN (P2of {nd2}) c2_{nm}.sig c2_{nm}.nb [{kap2[0]}, {kap2[1]}, {kap2[2] + X.KD2 // 50}])"
                    muts.append(("k", f"segN P (P2of {nd2}) {kk} c_{nm}{args}"))
                b0 = k0[0]
                kb = [(b0[0], [b0[1][0] + 2] + list(b0[1][1:]), [b0[2][0] + 2] + list(b0[2][1:]))] + list(k0[1:])
                muts.append(("b", f"{body}\n    {X.stack_s(kb)}\n    {X.chars_s(t)}\n    {X.stack_s(k1)}"))
                muts.append(("e", f"{body}\n    {X.stack_s(k0)}\n    {X.chars_s(t)}\n    {X.stack_s(k1[1:] if k1 else [b0])}"))
                for kind, m in muts:   # 誤りの版が false なら !(…) が true。名前は 木_種類_何番目
                    errs.setdefault(kind, []).append((j, f"!({m})"))
        if a.mode == "demo":
            L += tree_thm(nm, nd2, kap2, segs)
        for kind, xs in errs.items():
            L.append(f"#eval rep \"{nm}_{kind}\" [\n  " + ",\n  ".join(m for _, m in xs) + "]")
            L.append(f"-- {kind} の区間の番号：{[jj for jj, _ in xs]}")
        if ev:
            L.append(f"#eval rep \"{nm}\" [\n  " + ",\n  ".join(ev) + "]")
        L.append("")
        ntrees += 1
    flush()


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--mode", default="kernel", choices=list(SUB))
    ap.add_argument("--files", default=f"0-{NFILES - 1}")
    ap.add_argument("--pairs", default=None)
    ap.add_argument("--seg", type=int, default=40)
    ap.add_argument("--chunk", type=int, default=1000)
    ap.add_argument("--meta", action="store_true")
    ap.add_argument("--coarse", action="store_true", help="まとめた並び（PackLean/E3i/Coarse/）で書く")
    ap.add_argument("--fallback", default=None, help="元の並びに戻す木の一覧のファイル（1 行 'F001 p1U'）")
    a = ap.parse_args()
    global COARSE, FALLBACK
    COARSE = a.coarse
    if a.fallback:
        FALLBACK = {l.strip() for l in open(a.fallback, encoding="utf-8") if l.strip()}
    a.pairs = tuple(map(int, a.pairs.split("-"))) if a.pairs else None
    lo, hi = map(int, a.files.split("-")) if "-" in a.files else (int(a.files), int(a.files))
    out = []
    for f in range(lo, hi + 1):
        export_file(f, a, out)
    tot = {q: sum(m[q] for m in out) for q in ("segs", "leaves_A", "leaves_D", "leaves_L", "bytes")}
    print(f"計：ファイル {len(out)}、{tot}")
    if a.meta:
        mp = os.path.join(HERE, f"export_meta_{a.mode}.json")
        head = dict(tool="lean/tools/e3i/export.py",
                    args=dict(mode=a.mode, files=a.files, seg=a.seg, chunk=a.chunk, coarse=a.coarse, fallback=a.fallback),
                    source="lean/PackLean/D45DT/Far000.lean … Far050.lean"
                           + ("、lean/PackLean/E3i/Coarse/（coarsen.py）" if a.coarse else ""), total=tot)
        with open(mp, "w", encoding="utf-8") as g:   # 1 ファイル 1 行（trees は [木の名前, 区間の数]）
            g.write("{" + json.dumps(head, ensure_ascii=False)[1:-1] + ',\n "files": [\n')
            g.write(",\n".join(json.dumps(m, ensure_ascii=False, separators=(",", ":")) for m in out))
            g.write("\n]}\n")
        print(f"一覧：{mp}")


if __name__ == "__main__":
    main()
