"""E3i 段 2 (b)（2026-11-19）：D45DT の遠方のカーネル版の束ね（Bun）を書き出す。

使い方:
  python -X utf8 lean/tools/e3i/bundle.py
      本番：PackLean/E3i/Bun/ に
        Recs.lean    全 51 ファイル・5,477 組の記録（nb・mode・offU・offL だけ、木は []）と recsAll
        NTree.lean   n の木（ntreeRunL を recsAll の箱で decide +kernel）
        Final.lean   `dodintet_of : n の木 → RecsOk P recsAll → dodintet_n02`（局所・上界は済みの形、Gen も NTree も要らない）
        F{f}_{k}.lean  Gen/F{f}_{k} を import して木ごとの `t_<木> : TreeR P c_<木>`（区間の定理の鎖）
        R{f}.lean    Far{f} の記録ごとに headOk（decide +kernel）と 2 本の木 → `ok : RecsOk P recs{f}`
        All.lean     `okAll : RecsOk P recsAll` と `dodintet_n02_proofK : dodintet_n02`
      木の一覧（Gen のどのファイルにどの木が何区間）は lean/tools/e3i/export_meta_kernel.json から。
  python -X utf8 lean/tools/e3i/bundle.py --test 1 --pairs 1-2
      試し：export.py --mode kernel と同じ形の小さい Gen を PackLean/E3i/TGen/ に（Far001 の組 1〜2 だけ）、
      その束ねを PackLean/E3i/TBun/ に（F・Recs・R・All、All は okAll まで）。
生成物は git に入れない（Gen と同じ）。設計は plan/A9k_dodintet_design.md 5.2 節、Lean の共通部分は
PackLean/E3i/BunCore.lean（RecsOk・rec_ok・rRoots_eq）と PackLean/E3i/BunCase.lean（dt_caseR）。
"""
import os, sys, json, argparse, types
from collections import defaultdict

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
import export as E  # noqa: E402
X = E.X
NFILES = E.NFILES
HEAD = "-- 自動で書き出したもの（lean/tools/e3i/bundle.py、E3i 段 2 (b)）。手で直さない。git に入れない。"
OPTS = ["set_option maxHeartbeats 0", "set_option maxRecDepth 100000", ""]
OPENS = ["open PackLean.D28 (RBox rRoots)",
         "open PackLean.D45DT PackLean.E3h PackLean.E3f PackLean.D45DT.LN PackLean.E3i"]


def out_path(bun, name):
    d = os.path.join(X.LEAN, "PackLean", "E3i", bun)
    os.makedirs(d, exist_ok=True)
    return os.path.join(d, name + ".lean")


def put(bun, name, L):
    p = out_path(bun, name)
    open(p, "wb").write(("\n".join(L) + "\n").encode("utf-8"))
    print(f"{os.path.relpath(p, X.LEAN)}: {len(L)} 行", flush=True)


def rec_lit(r):
    l0, l1, h0, h1 = r["nb"]
    return f"⟨⟨{l0}, {l1}, {h0}, {h1}⟩, {r['mode']}, {r['offU']}, {r['offL']}, [], []⟩"


def write_recs(bun, recs_by_f):
    L = [HEAD, "-- 遠方の記録（D45DT/FarNNN.lean の FBox から nb・mode・offU・offL だけ、木は []）",
         "import PackLean.E3i.BunCore", "", f"namespace PackLean.E3i.{bun}.Recs",
         "open PackLean.D45DT", ""] + OPTS
    for f, recs in recs_by_f.items():
        for p, r in enumerate(recs):
            L.append(f"def r{f:03d}_{p} : FBoxL := {rec_lit(r)}")
        L.append(f"def recs{f:03d} : List FBoxL := [" + ", ".join(f"r{f:03d}_{p}" for p in range(len(recs))) + "]")
        L.append("")
    L.append("def recsAll : List FBoxL := " + " ++ ".join(f"recs{f:03d}" for f in recs_by_f))
    L.append(f"end PackLean.E3i.{bun}.Recs")
    put(bun, "Recs", L)


def chain_of(nm, nseg):
    st = "hw PackLean.Formal.E3iFar.sqOk_SQB2 (by decide) rfl"
    ch = "(PackLean.Formal.E3iFar.covers_nil _ _ _ _)"
    for j in reversed(range(nseg)):
        ch = f"(PackLean.Formal.E3iFar.seg_stepN {st} s_{nm}_{j}\n      {ch})"
    return ch


def write_chunk(gen, bun, f, k, trees, recs):
    mod = f"F{f:03d}_{k:03d}"
    L = [HEAD, f"-- Gen/{mod} の木ごとの TreeR（区間の定理の鎖）",
         f"import PackLean.E3i.{gen}.{mod}", "import PackLean.E3i.BunCore", "",
         f"namespace PackLean.E3i.{bun}.{mod}"] + OPENS + [f"open PackLean.E3i.{gen}.{mod}", ""] + OPTS
    dk = "by decide +kernel"
    for nm, nseg in trees:
        p, side = int(nm[1:-1]), "UL".index(nm[-1])
        nd2, _, kap2 = X.var2_consts(recs[p], side)
        L += [f"theorem t_{nm} : PackLean.Formal.E3iFar.TreeR P c_{nm} := by",
              f"  have hw : PackLean.Formal.TetFar.WF (toProb (P2of {nd2})) := PackLean.Formal.TetFar.wf_of_ok ({dk})",
              f"  have hc : PackLean.Formal.E3iFar.Covers P (P2of {nd2}) c_{nm} c2_{nm} (rRoots P.den) := by",
              f"    rw [PackLean.E3i.BunCore.rRoots_eq]; exact {chain_of(nm, nseg)}",
              f"  exact ⟨{nd2}, c2_{nm}, {kap2[0]}, {kap2[1]}, {kap2[2]}, {dk}, rfl, {dk}, {dk}, {dk}, rfl, {dk},",
              f"    {dk}, {dk}, {dk}, {dk}, hc⟩", ""]
    L.append(f"end PackLean.E3i.{bun}.{mod}")
    put(bun, mod, L)


def write_rfile(bun, f, chunks, where, pairs):
    """where[木の名前] = Bun のモジュール名（F{f}_{k}）"""
    L = [HEAD, f"-- Far{f:03d} の記録ごとの headOk ∧ TreesR",
         f"import PackLean.E3i.{bun}.Recs"] + [f"import PackLean.E3i.{bun}.{m}" for m in chunks] + [
         "", f"namespace PackLean.E3i.{bun}.R{f:03d}", "open PackLean.D45DT PackLean.E3i.BunCore",
         f"open PackLean.E3i.{bun}.Recs", ""] + OPTS
    body = "recsOk_nil"
    for p in reversed(pairs):
        u, l = f"p{p}U", f"p{p}L"
        body = (f"recsOk_cons (rec_ok (r := r{f:03d}_{p}) (by decide +kernel)\n"
                f"      PackLean.E3i.{bun}.{where[u]}.t_{u} PackLean.E3i.{bun}.{where[l]}.t_{l})\n"
                f"    ({body})")
    L += [f"theorem ok : RecsOk P recs{f:03d} :=", f"  {body}", "", f"end PackLean.E3i.{bun}.R{f:03d}"]
    put(bun, f"R{f:03d}", L)


def write_ntree(bun):
    L = [HEAD, "-- n の木：その対の葉は recsAll の箱（cornersN）に順に一致する（DodTet の ntree_ok のカーネル版）",
         f"import PackLean.E3i.{bun}.Recs", "", f"namespace PackLean.E3i.{bun}.NTree",
         "open PackLean.D45DT", f"open PackLean.E3i.{bun}.Recs", ""] + OPTS + [
         "theorem hn : (ntreeRunL P.nd ntoks.toList",
         "    (recsAll.map fun r => PackLean.Formal.DTCover.cornersN r.nb)).1 = true := by",
         "  decide +kernel", "", f"end PackLean.E3i.{bun}.NTree", "",
         f"#assert_std_axioms PackLean.E3i.{bun}.NTree.hn"]
    put(bun, "NTree", L)


def write_final(bun):
    L = [HEAD, "-- dodintet_n02 の組み立て（Cases/DodTet.lean の遠方を far_certR に替えた形）。遠方の記録の仮定だけ残す",
         "import PackLean.E3i.BunCase", f"import PackLean.E3i.{bun}.Recs", "import PackLean.Formal.DTUpperOk",
         "import PackLean.Formal.DTLocalOk", "import PackLean.D45DT.Local", "import PackLean.D45DT.KL.LocalA",
         "import PackLean.D45DT.KL.LocalB", "", f"namespace PackLean.E3i.{bun}.Final", "",
         "open PackLean.D45DT", "",
         "theorem hA : (tubeRunL P P.tA candsA 1024 (facesA.map String.toList)).1 = true := by",
         "  rw [← tubeRun_eq, KL.localA_okS]", "",
         "theorem hB : (tubeRunL P P.tB candsB 512 (facesB.map String.toList)).1 = true := by",
         "  rw [← tubeRun_eq, KL.localB_okS]", "",
         "theorem verts_eq : P.verts = Formal.Polytope.dodVerts := by decide +kernel",
         "theorem dv_eq : P.dv = 4 := by decide +kernel",
         "theorem kd_pos : 0 < P.kd := by decide +kernel",
         "theorem wA : weightsOk P.tA = true := by decide +kernel",
         "theorem wB : weightsOk P.tB = true := by decide +kernel",
         "theorem cnum_eq : P.cnum = 14986756529 := by decide +kernel",
         "theorem cden_eq : P.cden = 5000000000 := by decide +kernel", "",
         "/-- `dodintet_n02` from the n tree and the far records checked by segments (`Bun/All.lean` gives both). -/",
         "theorem dodintet_of (hn : (ntreeRunL P.nd ntoks.toList",
         f"      ({bun}.Recs.recsAll.map fun r => PackLean.Formal.DTCover.cornersN r.nb)).1 = true)",
         f"    (hb : PackLean.E3i.BunCore.RecsOk P {bun}.Recs.recsAll) : Formal.dodintet_n02 := by",
         "  have hup := Formal.DTCase.dt_fit verts_eq dv_eq Formal.DTUpper.dt_upper",
         "  rw [cnum_eq, cden_eq] at hup",
         "  refine PackLean.E3i.BunCase.dt_caseR verts_eq dv_eq Formal.DTBase.dt_extra_ok kd_pos",
         "    Formal.DTLocalPoly.dt_loc_ok Formal.DTLocalPoly.dt_tube_ok wA wB (by norm_num) (by norm_num)",
         "    hA hB hn hb ?_ ?_",
         "  · rw [cnum_eq, cden_eq]; norm_num",
         "  · convert hup using 2; norm_num", "",
         f"end PackLean.E3i.{bun}.Final", "",
         f"#assert_std_axioms PackLean.E3i.{bun}.Final.dodintet_of"]
    put(bun, "Final", L)


def write_all(bun, fs, final):
    L = [HEAD, "-- 遠方の記録すべて（RecsOk P recsAll）" + ("と dodintet_n02" if final else ""),
         f"import PackLean.E3i.{bun}.Recs"] + ([f"import PackLean.E3i.{bun}.Final", f"import PackLean.E3i.{bun}.NTree"] if final else []) + [
         f"import PackLean.E3i.{bun}.R{f:03d}" for f in fs] + [
         "", f"namespace PackLean.E3i.{bun}.All", "open PackLean.D45DT PackLean.E3i.BunCore",
         f"open PackLean.E3i.{bun}.Recs", ""] + OPTS
    t = f"R{fs[0]:03d}.ok"
    for f in fs[1:]:   # recsAll = recs000 ++ recs001 ++ …（左結合）
        t = f"recsOk_append ({t}) R{f:03d}.ok"
    L += ["theorem okAll : RecsOk P recsAll :=", f"  {t}", ""]
    names = [f"PackLean.E3i.{bun}.All.okAll"]
    if final:
        L += ["/-- **`dodintet_n02`** with the far records in the kernel (no `native_decide`). -/",
              "theorem dodintet_n02_proofK : PackLean.Formal.dodintet_n02 :=",
              f"  {bun}.Final.dodintet_of {bun}.NTree.hn okAll", ""]
        names.append(f"PackLean.E3i.{bun}.All.dodintet_n02_proofK")
    L += [f"end PackLean.E3i.{bun}.All", "", "#assert_std_axioms " + " ".join(names)]
    put(bun, "All", L)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--test", type=int, default=None, help="試し：このファイル番号の小さい Gen を TGen/ に")
    ap.add_argument("--pairs", default="1-2")
    a = ap.parse_args()
    if a.test is None:
        gen, bun = "Gen", "Bun"
        meta = json.load(open(os.path.join(HERE, "export_meta_kernel.json"), encoding="utf-8"))
        gfiles = [(m["path"], m["trees"]) for m in meta["files"]]
        fs = list(range(NFILES))
        recs_by_f = {f: X.records(f) for f in fs}
        pairs_by_f = {f: list(range(len(recs_by_f[f]))) for f in fs}
    else:
        gen, bun = "TGen", "TBun"
        f = a.test
        lo, hi = map(int, a.pairs.split("-"))
        E.SUB["kernel"] = gen
        E.COARSE = True
        out = []
        E.export_file(f, types.SimpleNamespace(mode="kernel", pairs=(lo, hi), seg=40, chunk=1000), out)
        gfiles = [(m["path"], m["trees"]) for m in out]
        fs = [f]
        allr = X.records(f)
        recs_by_f = {f: allr[lo:hi + 1]}
        pairs_by_f = {f: list(range(lo, hi + 1))}
    # 木 → Bun のモジュール、ファイル番号 → Bun のモジュールの並び
    where, chunks = {}, defaultdict(list)
    for path, trees in gfiles:
        mod = os.path.splitext(os.path.basename(path))[0]
        f, k = int(mod[1:4]), int(mod[5:8])
        allr = X.records(f)
        write_chunk(gen, bun, f, k, trees, allr)
        chunks[f].append(mod)
        for nm, _ in trees:
            where[(f, nm)] = mod
    if a.test is None:
        write_recs(bun, recs_by_f)
    else:   # 試しの記録は組 lo〜hi だけ、名前は本番と同じ r{f}_{p}
        f = a.test
        L = [HEAD, "-- 試しの記録", "import PackLean.E3i.BunCore", "", f"namespace PackLean.E3i.{bun}.Recs",
             "open PackLean.D45DT", ""] + OPTS
        for p in pairs_by_f[f]:
            L.append(f"def r{f:03d}_{p} : FBoxL := {rec_lit(X.records(f)[p])}")
        L.append(f"def recs{f:03d} : List FBoxL := [" + ", ".join(f"r{f:03d}_{p}" for p in pairs_by_f[f]) + "]")
        L += [f"def recsAll : List FBoxL := recs{f:03d}", f"end PackLean.E3i.{bun}.Recs"]
        put(bun, "Recs", L)
    for f in fs:
        write_rfile(bun, f, chunks[f], {nm: m for (ff, nm), m in where.items() if ff == f}, pairs_by_f[f])
    if a.test is None:
        write_ntree(bun)
        write_final(bun)
    write_all(bun, fs, final=a.test is None)


if __name__ == "__main__":
    main()
