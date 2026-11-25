-- E3g（2026-11-17）：D30S3（octinico）の局所の表を書き出す（`lake env lean tools/e3g_gen_d30s3.lean`）。
-- `localOkT` が引く candPolys の候補と、辺ごとの sub の多項式を Core の関数で数え、値を計算して
-- PackLean/D30S3/KL/ に Lean の原文として書く（Tab・CP・SBf_s・Local）。表の値の正しさは書き出した定理が
-- カーネルで確かめるので、この道具は信頼しなくてよい（漏れても遅くなるだけ、誤れば定理が落ちる）。
import PackLean.D30S3.Local

open PackLean.D16 PackLean.D30S3
open PackLean.D28 (nth Poly FE fIsZero)

def dedup {α} [DecidableEq α] (l : List α) : List α :=
  l.foldl (fun acc x => if acc.contains x then acc else acc ++ [x]) []

def showCand (c : Cand) : String :=
  s!"\{ J := {repr c.J}, al := {repr c.al}, minv := {repr c.minv}, dm := {c.dm} }"

def showPoly (p : Poly) : String := toString (repr p)

instance : DecidableEq Cand := fun a b =>
  if h : a.J = b.J ∧ a.al = b.al ∧ a.minv = b.minv ∧ a.dm = b.dm then
    isTrue (by cases a; cases b; simp_all)
  else isFalse (by intro e; subst e; exact h ⟨rfl, rfl, rfl, rfl⟩)

def mixCands (X : S3) (cands : List Cand) (toks : List LTokT) : List Cand :=
  toks.flatMap (fun t => match t with
    | .mix al ws _ => ws.map (fun x => let cd := nth cands x.1 defCand; { cd with al := cd.J.map (alOf X al) })
    | _ => [])

/-- 辺 c で sub が引かれる多項式（Core の singleOk・mixOk・faceIdentOk と同じ順に数える）。 -/
def subKeys (Rq : List Poly) (N : Poly) (c : FCtx) (toks : List LTokT) : List Poly :=
  let k := P.nb
  let dm := (nth cands 0 defCand).dm
  let ident := cands.flatMap (fun cd =>
    let (F, AI) := candPolys P Rq N cd
    F :: AI.filter (fun a => fIsZero (constTerm k a)))
  let leaves := toks.flatMap (fun t => match t with
    | .single ci => let (F, AI) := candPolys P Rq N (nth cands ci defCand); F :: AI
    | .mix al ws cs =>
      ws.flatMap (fun x => let cd := nth cands x.1 defCand
        let (F, AI) := candPolys P Rq N { cd with al := cd.J.map (alOf X al) }; F :: AI) ++
      cs.map (fun x => liftPoly P Rq N dm x.1 (alOf X al x.1))
    | .split => [])
  let _ := c
  dedup (ident ++ leaves)

def faceArgs : List (Nat × Int) := tubeFaces

def outDir : System.FilePath := "PackLean/D30S3/KL"

def hdr (imports : List String) : String :=
  "-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。\n" ++
  String.join (imports.map (fun i => s!"import {i}\n")) ++
  "\nnamespace PackLean.D30S3.KL\nopen PackLean.D16 PackLean.D30S3\nopen PackLean.D28 (Poly)\n\n"

def shardSize : Nat := 4

def main : IO Unit := do
  IO.FS.createDirAll outDir
  let (Rq, N) := rotPoly P.ps P.nb
  let allToks := faces.flatten
  let cpKeys := dedup (cands ++ mixCands X cands allToks)
  IO.println s!"cp keys {cpKeys.length}"
  -- Tab.lean：値と表
  let mut tab := hdr ["PackLean.D30S3.KLocal", "PackLean.D30S3.Local"]
  let mut cpEntries : List String := []
  for (cd, i) in cpKeys.zipIdx do
    let (F, AI) := candPolys P Rq N cd
    tab := tab ++ s!"def cpk{i} : Cand := {showCand cd}\n"
    tab := tab ++ s!"def cpv{i} : Poly × List Poly := ({showPoly F}, {repr AI})\n"
    cpEntries := cpEntries ++ [s!"(cpk{i}, cpv{i})"]
  tab := tab ++ s!"\ndef ct : CPTab := ((rotPoly P.ps P.nb).1, (rotPoly P.ps P.nb).2,\n  [{", ".intercalate cpEntries}])\n\n"
  let mut faceEntries : List String := []
  let mut sbShards : List (Nat × Nat × List Nat) := []   -- (辺, 区切りの番号, 行)
  let mut sbCounts : List Nat := []
  for ((j, sg), toks, fi) in (List.zip faceArgs faces).zipIdx.map (fun ((a, b), i) => (a, b, i)) do
    let c : FCtx := ⟨Rq, N, faceX P.nb X j sg, kScale X⟩
    let keys := subKeys Rq N c toks
    sbCounts := sbCounts ++ [keys.length]
    let mut rows : List String := []
    for (p, i) in keys.zipIdx do
      let v := sub P c p
      tab := tab ++ s!"def sk{fi}_{i} : Poly := {showPoly p}\n"
      tab := tab ++ s!"def sv{fi}_{i} : Poly := {showPoly v}\n"
      rows := rows ++ [s!"(sk{fi}_{i}, sv{fi}_{i})"]
    let sgs := if sg < 0 then s!"({sg})" else s!"{sg}"
    tab := tab ++ s!"\ndef sxs{fi} : List Poly := faceX P.nb X {j} {sgs}\n"
    tab := tab ++ s!"def srows{fi} : List (Poly × Poly) := [{", ".intercalate rows}]\n\n"
    faceEntries := faceEntries ++ [s!"(sxs{fi}, kScale X, srows{fi})"]
    let idx := List.range keys.length
    let nsh := (keys.length + shardSize - 1) / shardSize
    for s in List.range nsh do
      sbShards := sbShards ++ [(fi, s, (idx.drop (s * shardSize)).take shardSize)]
  tab := tab ++ s!"def st : SBTab := [{", ".intercalate faceEntries}]\n\nend PackLean.D30S3.KL\n"
  IO.FS.writeFile (outDir / "Tab.lean") tab
  IO.println s!"sb keys per face {sbCounts}"
  -- CP の定理（区切りごと）
  let opts := "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n\n"
  let cpIdx := List.range cpKeys.length
  let ncp := (cpKeys.length + 2 * shardSize - 1) / (2 * shardSize)
  let mut mods : List String := []
  for s in List.range ncp do
    let mut t := hdr ["PackLean.D30S3.KL.Tab"] ++ opts
    for i in (cpIdx.drop (s * 2 * shardSize)).take (2 * shardSize) do
      t := t ++ s!"theorem cp_ok{i} : candPolys P ct.1 ct.2.1 cpk{i} = cpv{i} := by decide +kernel\n"
    IO.FS.writeFile (outDir / s!"CP{s}.lean") (t ++ "\nend PackLean.D30S3.KL\n")
    mods := mods ++ [s!"PackLean.D30S3.KL.CP{s}"]
  for (fi, s, rows) in sbShards do
    let mut t := hdr ["PackLean.D30S3.KL.Tab"] ++ opts
    for i in rows do
      t := t ++ s!"theorem sb_ok{fi}_{i} : subst P.ps sxs{fi} (homScale (kScale X) 4 sk{fi}_{i}) = sv{fi}_{i} := by decide +kernel\n"
    IO.FS.writeFile (outDir / s!"SB{fi}_{s}.lean") (t ++ "\nend PackLean.D30S3.KL\n")
    mods := mods ++ [s!"PackLean.D30S3.KL.SB{fi}_{s}"]
  -- Local.lean：つなぎと本体
  let mut l := hdr mods ++ opts
  let cpChain := cpIdx.foldr (fun i acc => s!"cpOk_cons cp_ok{i} ({acc})") "cpOk_nil _ _ _"
  l := l ++ s!"theorem ct_ok : CPOk P ct.1 ct.2.1 ct.2.2 :=\n  {cpChain}\n\n"
  let mut faceChains : List String := []
  for (fi, n) in sbCounts.zipIdx.map (fun (n, i) => (i, n)) do
    let ch := (List.range n).foldr (fun i acc => s!"sbOk1_cons sb_ok{fi}_{i} ({acc})") "sbOk1_nil _ _ _"
    l := l ++ s!"theorem st_ok{fi} : SBOk1 P sxs{fi} (kScale X) srows{fi} :=\n  {ch}\n\n"
    faceChains := faceChains ++ [s!"st_ok{fi}"]
  let stChain := faceChains.foldr (fun h acc => s!"sbOk_cons {h} ({acc})") "sbOk_nil _"
  l := l ++ s!"theorem st_ok : SBOk P st :=\n  {stChain}\n\n"
  l := l ++ "/-- 局所の全部（`D30S3.local_ok` と同じ式・同じ値）をカーネルだけで：`localOkT` を開き、`candPolys P`・`sub P` を\n" ++
    "  表引き（`cpT_eq`・`sbT_eq`）に置き換えて `decide +kernel`。 -/\n" ++
    "theorem local_okK : localOkT P X cands faces = (true, [4, 4, 4, 4], 10, 6) := by\n" ++
    "  delta localOkT lstepT singleOk mixOk candsOk faceIdentOk\n" ++
    "  rw [← cpT_eq P ct ct_ok, ← sbT_eq P st st_ok]\n" ++
    "  decide +kernel\n\nend PackLean.D30S3.KL\n"
  IO.FS.writeFile (outDir / "Local.lean") l
  IO.println s!"modules {mods.length}"

#eval main
