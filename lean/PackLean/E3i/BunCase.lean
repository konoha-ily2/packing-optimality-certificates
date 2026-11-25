import PackLean.Formal.DTCase
import PackLean.E3i.BunCore

/-!
# E3i 段 2 (b): `DTCase.dt_case` with the far part through `E3iFar.far_certR`

The same claim as `PackLean.Formal.DTCase.dt_case`, with the hypothesis on the far records
`∀ r ∈ recs, (boxRunL P r).1 = true` (the trees read in the original order by `rtreeL`) replaced by
`BunCore.RecsOk P recs` (`headOk` and the two trees checked by segments, `TreesR`).  This is the form that
`Cases/DodTet.lean` takes once the far records come from the kernel (`Bun/Final.lean`).
-/

namespace PackLean.E3i.BunCase

open PackLean.D45DT (Prm toProb FBoxL ntreeRunL tubeRunL weightsOk)
open PackLean.Formal PackLean.Formal.DTCase
open PackLean.Formal.Polytope (dodVerts)
open PackLean.Formal.TetFar (VV c0r)
open PackLean.Formal.DTBase (dtExtraOk)
open PackLean.Formal.DTCover (cornersN)

noncomputable section

variable {P : Prm}

/-- **`dt_case` with the far trees checked by segments.** -/
theorem dt_caseR (hv : P.verts = dodVerts) (hd : P.dv = 4) (h0 : dtExtraOk P = true) (hkd : 0 < P.kd)
    (hL : DTLocalPoly.dtLocOk P = true) (ht : DTLocalBox.dtTubeOk P = true)
    (hwA : weightsOk P.tA = true) (hwB : weightsOk P.tB = true)
    {cA cB : List (List ℕ)} {DA DB : ℤ} {fA fB : List (List Char)} (hDA : 0 < DA) (hDB : 0 < DB)
    (hA : (tubeRunL P P.tA cA DA fA).1 = true) (hB : (tubeRunL P P.tB cB DB fB).1 = true)
    {ntoks : List Char} {recs : List FBoxL}
    (hn : (ntreeRunL P.nd ntoks (recs.map fun r => cornersN r.nb)).1 = true)
    (hb : BunCore.RecsOk P recs)
    {a b : ℝ} (ha : a ≤ 2 * √2 * ((P.cnum : ℝ) / P.cden)) (hup : Fits dod tet 2 b) :
    EdgeBetween dod tet 2 a b := by
  have hT := DTLocalRun.hlocT_of h0 hL hkd ht hwA hwB hDA hDB hA hB
  have hB' := DTLocalBox.hlocB_of h0 ht hT
  have hcert := E3iFar.far_certR h0 hkd hB' hn hb
  rw [hv, dodVerts_length, c0r_eq] at hcert
  refine ⟨fun s hs hf => ?_, hup⟩
  have hl := dt_lower hv hd hcert hs hf
  have h2 : (0 : ℝ) ≤ √2 := Real.sqrt_nonneg 2
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  calc a ≤ 2 * √2 * ((P.cnum : ℝ) / P.cden) := ha
    _ ≤ 2 * √2 * (s * (√2 / 4)) := mul_le_mul_of_nonneg_left hl (by positivity)
    _ = s := by linear_combination (s / 2) * hsq

end

end PackLean.E3i.BunCase

#assert_std_axioms PackLean.E3i.BunCase.dt_caseR
