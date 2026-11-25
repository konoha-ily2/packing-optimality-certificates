import PackLean.D45DT.Core

/-! A9k stage 7c-0: the `List Char` form of the D45DT (dodintet_n02) checks, and the bridge to the `String` form.

The kernel cannot evaluate `String.foldl` (it gets stuck on the UTF-8 byte array), so the soundness proofs of
stage 7c are written for the checks of this file, whose token strings are `List Char`.  The leaf functions
(`farLbT`, `discLbT`, `rInCube`, `inside`, `treeKap`, `locParts`, `splitE0`, `lamLb`, `lsplitT`) and the one
character steps (`rchar`, `nchar`, `lchar`) are those of `D45DT.Core`, unchanged; only the outer folds over the
token strings are restated with `List.foldl`.  The bridges (`rtreeT_eq`, `boxRun_eq`, `ntreeRun_eq`,
`tubeRun_eq`) are proved from `String.foldl_eq_foldl_toList` (Init), without evaluation.

`toProb P` is the `D28.Prob` whose far leaves are those of `P` (`discLbT P = discLb (toProb P)` and the tail
of `farLbT P` is `lbOf (toProb P)`, by `rfl`, in `Formal/DTBase.lean`).  No Mathlib.
-/

namespace PackLean.D45DT
open PackLean.D28

/-! ## far -/

/-- one R tree (as `rtreeT`), tokens as a list -/
def rtreeL (P : Prm) (c : TreeCtx) (toks : List Char) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (rchar P c) ⟨rRoots P.den, true, 0, 0, 0, 0, 0, []⟩
  (s.ok && s.stack.isEmpty && s.pend == 0, s.nA, s.nD, s.nL)

/-- the record of one upper n box (as `FBox`), tokens as lists -/
structure FBoxL where
  nb : NB
  mode : Nat
  offU : Int
  offL : Int
  tU : List Char
  tL : List Char

def FBox.toL (r : FBox) : FBoxL := ⟨r.nb, r.mode, r.offU, r.offL, r.tU.toList, r.tL.toList⟩

/-- one pair box (as `boxRun`) -/
def boxRunL (P : Prm) (r : FBoxL) : Bool × List Nat :=
  let b := r.nb
  let fU : Nat := if r.mode == 2 then 0 else 1
  let fL : Nat := if r.mode == 1 then 0 else 1
  let modeOk := decide (1 ≤ r.mode ∧ r.mode ≤ 3) && (r.mode == 3 || r.offU + r.offL == 0)
  let kU := treeKap P fU 0 r.offU
  let kL := treeKap P fL 1 r.offL
  let S := List.zipWith (· + ·) kU kL
  let sumOk := [b.l0, b.h0].all (fun x => [b.l1, b.h1].all (fun y =>
    decide (nth S 0 0 * x + nth S 1 0 * y + nth S 2 0 * P.nd ≥ 0)))
  let tU := tubeOf P fU; let tL := tubeOf P fL
  let aU := inside P tU [b.l0, b.h0] [b.l1, b.h1] && decide (r.offU ≤ 0)
  let aL := inside P tL [b.l0, b.h0] [-b.h1, -b.l1] && decide (r.offL ≤ 0)
  let (okU, a1, d1, l1) := rtreeL P ⟨0, b, kU, aU, tU⟩ r.tU
  let (okL, a2, d2, l2) := rtreeL P ⟨1, b, kL, aL, tL⟩ r.tL
  (nbWf b && modeOk && sumOk && decide (P.kd % P.koff = 0) && okU && okL, [a1, d1, l1, a2, d2, l2])

/-- the n tree (as `ntreeRun`) -/
def ntreeRunL (nd : Int) (toks : List Char) (boxes : List (Int × Int × Int × Int)) : Bool × Nat × Nat :=
  let s := toks.foldl nchar ⟨[⟨0, 0, nd, nd⟩], boxes, true, 0, 0⟩
  (s.ok && s.stack.isEmpty && s.boxes.isEmpty, s.nOk, s.nOut)

/-! ## local -/

/-- one root face of a tube (the fold of `tubeRun`) -/
def faceRunL (P : Prm) (ctx : LCtx) (root : LB) (toks : List Char) : Bool × Nat :=
  let s := toks.foldl (lchar P ctx) ⟨[root], true, 0, false⟩
  (s.ok && s.stack.isEmpty && !s.pend, s.nAcc)

/-- one tube (as `tubeRun`), the face strings as lists -/
def tubeRunL (P : Prm) (t : Tube) (cands : List (List Nat)) (D : Int) (faces : List (List Char)) :
    Bool × List Nat :=
  let L := locParts P t
  let sp := cands.map (fun cd => splitE0 (candPoly L cd))
  let spOk := sp.all Option.isSome && cands.all (fun cd => cd.length == 4 && cd.all (· < P.verts.length))
  let cs := sp.map (fun o => o.getD (fz, fz, []))
  match toD D t.ulo, toD D t.uhi, toD D t.r0 with
  | some ulo, some uhi, some r0 =>
    let U : List Int := [uhi - ulo, r0, 2 * D, 2 * D, 2 * D, 2 * D]
    let roots := lroots D ulo uhi r0
    let ctx : LCtx := ⟨D, U, cs⟩
    let res := (List.zip roots faces).map (fun (x : LB × List Char) => faceRunL P ctx x.1 x.2)
    (spOk && decide (ulo < uhi) && decide (0 < r0) && faces.length == 8 && res.all (·.1), res.map (·.2))
  | _, _, _ => (false, [])

/-! ## the bridges to the `String` form (no evaluation) -/

theorem rtreeT_eq (P : Prm) (c : TreeCtx) (s : String) : rtreeT P c s = rtreeL P c s.toList := by
  simp only [rtreeT, rtreeL, String.foldl_eq_foldl_toList]

theorem boxRun_eq (P : Prm) (r : FBox) : boxRun P r = boxRunL P r.toL := by
  simp only [boxRun, rtreeT_eq]
  rfl

theorem map_boxRun (P : Prm) (l : List FBox) : l.map (boxRun P) = (l.map FBox.toL).map (boxRunL P) := by
  rw [List.map_map]
  exact List.map_congr_left (fun r _ => boxRun_eq P r)

theorem ntreeRun_eq (nd : Int) (s : String) (boxes : List (Int × Int × Int × Int)) :
    ntreeRun nd s boxes = ntreeRunL nd s.toList boxes := by
  simp only [ntreeRun, ntreeRunL, String.foldl_eq_foldl_toList]

theorem tubeRun_eq (P : Prm) (t : Tube) (cands : List (List Nat)) (D : Int) (faces : List String) :
    tubeRun P t cands D faces = tubeRunL P t cands D (faces.map String.toList) := by
  simp only [tubeRun, String.foldl_eq_foldl_toList]
  unfold tubeRunL faceRunL
  cases toD D t.ulo <;> cases toD D t.uhi <;> cases toD D t.r0 <;>
    simp [List.zip_map_right, List.map_map, Function.comp_def]

/-! ## the D28 problem of the far leaves -/

/-- The `D28.Prob` of the far leaves: field Q(√5) (`ps = [5]`, `nb = 2`), the √ brackets, the piece, the
  container normals, `c0 = c̄ = cnum/cden`, the n and R denominators and the rotations.  `beta = 0` and the
  regions and local ranges (not used by `farLb`, `discLb`, `rotsOk`) are empty. -/
def toProb (P : Prm) : Prob where
  ps := PS
  nb := 2
  sqb := P.sqb
  maskp := [1, 5]
  sqk := P.sqk
  verts := P.verts
  dv := P.dv
  bvec := BV
  btop := BTOP
  c0 := ⟨fI P.cnum, P.cden⟩
  beta := ⟨fI 0, 1⟩
  nden := P.nd
  rden := P.den
  rots := P.rots
  dk := P.dk
  regions := []
  lnx0 := (0, 1)
  lnx1 := (0, 1)
  lny := (0, 1)
  astar := ⟨fI 0, 1⟩
  xi0 := (0, 1)
  xi1 := (0, 1)

end PackLean.D45DT
