/-
E3g3（2026-11-18）：D45DT の局所（`tubeRunL`）をカーネルだけで確かめるための表・区間を書き出す。
使い方（lean/ で）：`lake env lean tools/e3g3_gen_d45dt.lean`（設定は下の SEG・GRP・TUBES・ONLY）。
PackLean/D45DT/KL/ に、管 X（A・B）ごとに
  TabX（候補の分割 kX_i・spX・ctxX・根の箱）、BrX（String との橋）、RowX（sp_okX：候補 → splitE0 (candPoly (locParts P t) cd)、decide +kernel）、
  TokX（区間の字句 tX_f_j・面 fX_f・facesXL・鍵 yX_f_j）、SegX_k（区間の定理 G 本ずつ）、FaceX（面ごとのつなぎ）、
  LocalX（本体）を書く。値の正しさは書き出した定理がカーネルで確かめるので、この道具は信頼しなくてよい。
-/
import PackLean.D45DT.Local
import PackLean.D45DT.KSegL
open PackLean.D45DT PackLean.D28

/-- 区間の葉の数、1 ファイルの区間の数、書き出す管 -/
def SEG : Nat := 10
def GRP : Nat := 4
def TUBES : List String := ["B", "A"]
/-- 区間を書き出す面（none = 全部）。試作では一部だけ。 -/
def ONLY : Option (List (String × Nat)) := none

def outDir : System.FilePath := "PackLean/D45DT/KL"

def showLB (b : LB) : String := s!"⟨{repr b.lo}, {repr b.hi}⟩"
def showKey (st : List LB) (n : Nat) (p : Bool) : String :=
  s!"([{", ".intercalate (st.map showLB)}], {n}, {p})"
def showToks (l : List Char) : String := "[" ++ ", ".intercalate (l.map (fun c => s!"'{c}'")) ++ "]"

def hdr (imports : List String) : String :=
  "-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。\n" ++
  String.join (imports.map (fun i => s!"import {i}\n")) ++
  "\nnamespace PackLean.D45DT.KL\nopen PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg\n\n" ++
  "set_option maxRecDepth 100000\nset_option maxHeartbeats 0\n\n"
def ftr : String := "\nend PackLean.D45DT.KL\n"
def M (s : String) : String := s!"PackLean.D45DT.KL.{s}"

def runTube (nm : String) (t : Tube) (tn : String) (cands : List (List Nat)) (cn : String) (D : Int)
    (faces : List String) (fn : String) : IO Unit := do
  let L := locParts P t
  let sp := cands.map (fun cd => splitE0 (candPoly L cd))
  let cs := sp.map (fun o => o.getD (fz, fz, []))
  let some ulo := toD D t.ulo | throw (IO.userError "ulo")
  let some uhi := toD D t.uhi | throw (IO.userError "uhi")
  let some r0 := toD D t.r0 | throw (IO.userError "r0")
  let U : List Int := [uhi - ulo, r0, 2 * D, 2 * D, 2 * D, 2 * D]
  let ctx : LCtx := ⟨D, U, cs⟩
  let roots := lroots D ulo uhi r0
  -- Tab
  let mut tab := hdr ["PackLean.D45DT.KSegL", "PackLean.D45DT.Local"]
  for (o, i) in sp.zipIdx do
    match o with
    | some v => tab := tab ++ s!"def k{nm}_{i} : FE × FE × Poly := {repr v}\n"
    | none => throw (IO.userError s!"splitE0 none {i}")
  tab := tab ++ s!"\ndef sp{nm} : List (Option (FE × FE × Poly)) := [{", ".intercalate ((List.range cands.length).map (fun i => s!"some k{nm}_{i}"))}]\n"
  tab := tab ++ s!"def ctx{nm} : LCtx := ⟨{D}, [{uhi} - {ulo}, {r0}, 2 * {D}, 2 * {D}, 2 * {D}, 2 * {D}], sp{nm}.map (fun o => o.getD (fz, fz, []))⟩\n"
  tab := tab ++ s!"def roots{nm} : List LB := [{", ".intercalate (roots.map showLB)}]\n"
  IO.FS.writeFile (outDir / s!"Tab{nm}.lean") (tab ++ ftr)
  -- Row
  let row := hdr [M s!"Tab{nm}"] ++
    s!"theorem sp_ok{nm} : {cn}.map (fun cd => splitE0 (candPoly (locParts P {tn}) cd)) = sp{nm} := by decide +kernel\n"
  IO.FS.writeFile (outDir / s!"Row{nm}.lean") (row ++ ftr)
  -- cuts
  let mut tok := hdr [M s!"Tab{nm}"]
  let mut br := hdr [M s!"Tok{nm}"]
  let mut segs : Array String := #[]     -- segment theorems
  let mut faceThms : Array String := #[]
  let mut nleaf : List Nat := []
  for ((root, fs), f) in (List.zip roots faces).zipIdx do
    let ch := fs.toList
    let mut st : LS := ⟨[root], true, 0, false⟩
    let mut lv := 0
    let mut cur : Array Char := #[]
    let mut parts : Array (List Char × String × String) := #[]
    let mut k0 := showKey [root] 0 false
    for c in ch do
      st := lchar P ctx st c
      cur := cur.push c
      if !st.pend && c != '.' && c != 'a' then lv := lv + 1
      if lv ≥ SEG && !st.pend && !st.stack.isEmpty then
        let k1 := showKey st.stack st.nAcc st.pend
        parts := parts.push (cur.toList, k0, k1); k0 := k1; cur := #[]; lv := 0
    if !(st.ok && st.stack.isEmpty && !st.pend) then throw (IO.userError s!"face {f} fails")
    parts := parts.push (cur.toList, k0, showKey st.stack st.nAcc st.pend)
    nleaf := nleaf ++ [st.nAcc]
    let np := parts.size
    for ((ts, a, b), j) in parts.toList.zipIdx do
      tok := tok ++ s!"def t{nm}_{f}_{j} : List Char := {showToks ts}\n"
      tok := tok ++ s!"def y{nm}_{f}_{j} : LKey := {b}\n"
      let a' := if j == 0 then a else s!"y{nm}_{f}_{j - 1}"
      let want := match ONLY with
        | none => true
        | some l => l.contains (nm, f)
      if want then
        segs := segs.push s!"theorem s{nm}_{f}_{j} : segChk P ctx{nm} {a'} t{nm}_{f}_{j} y{nm}_{f}_{j} = true := by decide +kernel\n"
    let app := (List.range np).foldr (fun j acc => if j + 1 == np then s!"t{nm}_{f}_{j}" else s!"t{nm}_{f}_{j} ++ ({acc})") ""
    tok := tok ++ s!"def f{nm}_{f} : List Char := {app}\n\n"
    br := br ++ s!"def w{nm}_{f} : List Char := {showToks ch}\n"
    br := br ++ s!"theorem g{nm}_{f} : w{nm}_{f} = f{nm}_{f} := by decide +kernel\n"
    br := br ++ s!"theorem e{nm}_{f} : ({fn}.getD {f} \"\").toList = w{nm}_{f} := (String.toList_ofList (l := w{nm}_{f}) : _)\n\n"
    let chain := (List.range np).foldr (fun j acc =>
      if j + 1 == np then s!"segOk_of s{nm}_{f}_{j}" else s!"seg_append (segOk_of s{nm}_{f}_{j}) ({acc})") ""
    faceThms := faceThms.push s!"theorem face{nm}_{f} : faceRunL P ctx{nm} {showLB root} f{nm}_{f} = (true, {st.nAcc}) :=\n  faceRunL_of ({chain})\n"
    IO.println s!"{nm} face {f}: leaves {st.nAcc}, segments {np}"
  tok := tok ++ s!"def faces{nm}L : List (List Char) := [{", ".intercalate ((List.range 8).map (fun f => s!"f{nm}_{f}"))}]\n"
  let gs := (List.range 8).map (fun f => s!"g{nm}_{f}")
  let es := (List.range 8).map (fun f => s!"e{nm}_{f}")
  IO.FS.writeFile (outDir / s!"Tok{nm}.lean") (tok ++ ftr)
  br := br ++ s!"theorem facesL_eq{nm} : {fn}.map String.toList = faces{nm}L := by\n" ++
    s!"  have h : {fn} = [{", ".intercalate ((List.range 8).map (fun f => s!"{fn}.getD {f} \"\""))}] := rfl\n" ++
    s!"  rw [h]\n  simp only [List.map_cons, List.map_nil, {", ".intercalate (es ++ gs)}]\n  rfl\n"
  IO.FS.writeFile (outDir / s!"Br{nm}.lean") (br ++ ftr)
  let ng := (segs.size + GRP - 1) / GRP
  let mut mods : List String := []
  for g in List.range ng do
    let body := String.join ((segs.toList.drop (g * GRP)).take GRP)
    IO.FS.writeFile (outDir / s!"Seg{nm}_{g}.lean") (hdr [M s!"Tok{nm}"] ++ body ++ ftr)
    mods := mods ++ [M s!"Seg{nm}_{g}"]
  IO.FS.writeFile (outDir / s!"Face{nm}.lean") (hdr mods ++ String.join faceThms.toList ++ ftr)
  let loc := hdr [M s!"Face{nm}", M s!"Row{nm}", M s!"Br{nm}"] ++
    s!"/-- the local lemma on T_{nm} (`tubeRunL`, faces as `List Char`) in the kernel only -/\n" ++
    s!"theorem local{nm}_okK : tubeRunL P {tn} {cn} {D} faces{nm}L = (true, {repr nleaf}) := by\n" ++
    s!"  rw [tubeRunL_eq, sp_ok{nm}]\n" ++
    s!"  exact tubeRunLS_eight (ulo := {ulo}) (uhi := {uhi}) (r0 := {r0}) (by decide +kernel) (by decide +kernel)\n" ++
    s!"    (by decide +kernel) rfl (by decide +kernel) (by decide +kernel)\n" ++
    s!"    {" ".intercalate ((List.range 8).map (fun f => s!"face{nm}_{f}"))}\n\n" ++
    s!"/-- the same in the `String` form of `Local.lean` (`local{nm}_ok` there, by native_decide) -/\n" ++
    s!"theorem local{nm}_okS : tubeRun P {tn} {cn} {D} {fn} = (true, {repr nleaf}) := by\n" ++
    s!"  rw [tubeRun_eq, facesL_eq{nm}]\n  exact local{nm}_okK\n"
  IO.FS.writeFile (outDir / s!"Local{nm}.lean") (loc ++ ftr)
  IO.println s!"{nm}: cands {cands.length}, leaves {nleaf}, segment theorems {segs.size}, files {ng}"

def main : IO Unit := do
  IO.FS.createDirAll outDir
  for nm in TUBES do
    if nm == "B" then runTube "B" P.tB "P.tB" candsB "candsB" 512 facesB "facesB"
    else runTube "A" P.tA "P.tA" candsA "candsA" 1024 facesA "facesA"

#eval main
