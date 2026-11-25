import PackLean.Formal.DTCover
import PackLean.Formal.DTLocalRun
import PackLean.Formal.DTUpper
import PackLean.Formal.PolytopeSolids

/-!
# A9k stage 7c-5 (frame): from the checks of `D45DT` to `EdgeBetween dod tet 2 a b` (dodintet)

Design: `plan/A9k_dodintet_design.md` §3 (row 7c-5).  This file has no data; `Cases/DodTet.lean`
gives the hypotheses.

* **The piece.**  When `P.verts = dodVerts` and `P.dv = 4`, the vertices `VV (toProb P) l` (`l < 20`)
  are those of `Polytope.dodCert` (`VV_eq`), so `VV (toProb P) '' {l < 20} = dodV` (`VV_image`,
  through `Polytope.dod_Vs`) and the hull is Spec's `dod` (`hull_eq`).
* **The mirror** `km = −I` (`det = −1`): the dodecahedron is centrally symmetric (`VV_neg`).
* `dt_lower`: `TetCert (VV (toProb P)) 20 cb` and two copies in `s • tet` ⇒ `cb ≤ s·√2/4`
  (`TetReduction.tet_lower_hull`).
* **`dt_case`**: the far trees (`far_certT`), the local tubes (`hlocT_of` → `hlocB_of`) and the fit
  ⇒ `EdgeBetween dod tet 2 a b` for every `a ≤ 2√2 · cnum/cden`.
-/

namespace PackLean.Formal.DTCase

open PackLean.D28 (nth)
open PackLean.D45DT (Prm toProb PS FBoxL boxRunL ntreeRunL tubeRunL weightsOk)
open PackLean.Formal PackLean.Formal.PolyLP
open PackLean.Formal.Polytope (dot dodCert dodVerts dod_Vs dod_interior dodCert_verts dodCert_ps
  dodCert_dv eq_of_coords fval_five)
open PackLean.Formal.TetFar (VV c0r)
open PackLean.Formal.TetReduction (TetCert)
open PackLean.Formal.DTBase (dtExtraOk)
open PackLean.Formal.DTCover (cornersN far_certT)
open scoped Matrix

-- The vertex-by-vertex case analysis uses one simp set for all cases.
set_option linter.unusedSimpArgs false
set_option linter.unusedTactic false
set_option linter.unnecessarySeqFocus false

noncomputable section

variable {P : Prm}

/-! ## 1. The piece -/

theorem dodVerts_length : dodVerts.length = 20 := rfl

theorem VV_eq (hv : P.verts = dodVerts) (hd : P.dv = 4) {l : ℕ} (hl : l < 20) :
    VV (toProb P) l = dodCert.V l := by
  change FarAccept.vec PS 2 P.dv (nth P.verts l []) = dodCert.V l
  rw [hv, hd]
  interval_cases l <;> (ext i; fin_cases i <;> rfl)

theorem VV_image (hv : P.verts = dodVerts) (hd : P.dv = 4) :
    VV (toProb P) '' {l | l < 20} = dodV := by
  rw [← dod_Vs]
  ext x
  constructor
  · rintro ⟨l, hl, rfl⟩
    exact ⟨l, by rw [dodCert_verts, dodVerts_length]; exact hl, VV_eq hv hd hl⟩
  · rintro ⟨l, hl, rfl⟩
    rw [dodCert_verts, dodVerts_length] at hl
    exact ⟨l, hl, VV_eq hv hd hl⟩

theorem hull_eq (hv : P.verts = dodVerts) (hd : P.dv = 4) :
    convexHull ℝ (VV (toProb P) '' {l | l < P.verts.length}) = dod := by
  rw [hv, dodVerts_length, VV_image hv hd]; rfl

theorem dod_interior_ne : (interior dod).Nonempty :=
  ⟨0, dod_interior fun f _ => by
    have : dot (dodCert.N f) 0 = 0 := by simp [dot]
    rw [this, Polytope.Cert.D, dodCert_ps, show dodCert.off = [25, 11] from rfl,
      show dodCert.doff = 8 from rfl, fval_five]
    positivity⟩

/-! ## 2. The mirror `−I` -/

theorem mv_neg_one (x : E3) : mv (-1) x = -x := by
  ext i
  fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, Matrix.one_apply]

/-- The antipode of the vertex `l` of `dodVerts`. -/
def negIdx (l : ℕ) : ℕ := [7, 6, 5, 4, 3, 2, 1, 0, 17, 18, 19, 14, 15, 16, 11, 12, 13, 8, 9, 10].getD l 0

theorem dodCert_neg {l : ℕ} (hl : l < 20) : -dodCert.V l = dodCert.V (negIdx l) := by
  interval_cases l <;>
    (refine eq_of_coords ?_ ?_ ?_ <;>
      simp [negIdx, Polytope.Cert.V, Polytope.Cert.vert, dodCert_verts, dodCert_ps, dodCert_dv, dodVerts,
        Polytope.vec_apply, Polytope.ent, fval_five] <;> ring)

theorem negIdx_lt {l : ℕ} (hl : l < 20) : negIdx l < 20 := by
  interval_cases l <;> decide

theorem VV_neg (hv : P.verts = dodVerts) (hd : P.dv = 4) {l : ℕ} (hl : l < 20) :
    ∃ l' < 20, mv (-1) (VV (toProb P) l) = VV (toProb P) l' :=
  ⟨negIdx l, negIdx_lt hl, by
    rw [mv_neg_one, VV_eq hv hd hl, VV_eq hv hd (negIdx_lt hl), dodCert_neg hl]⟩

/-! ## 3. The lower bound and the fit -/

/-- **The lower bound**: `TetCert (VV (toProb P)) 20 cb` and two copies of `dod` in `s • tet`
give `cb ≤ s · √2/4`. -/
theorem dt_lower (hv : P.verts = dodVerts) (hd : P.dv = 4) {cb : ℝ}
    (hcert : TetCert (VV (toProb P)) 20 cb) {s : ℝ} (hs : 0 ≤ s) (hfit : Fits dod tet 2 s) :
    cb ≤ s * (√2 / 4) := by
  have hkm : (-1 : M3)ᵀ * (-1) = 1 := by simp
  have hkd : (-1 : M3).det = -1 := by simp [Matrix.det_neg]; norm_num
  exact TetReduction.tet_lower_hull (K := dod) (KV := dodV) rfl dod_interior_ne
    (fun l hl => by rw [← VV_image hv hd]; exact ⟨l, hl, rfl⟩) hkm hkd
    (fun l hl => VV_neg hv hd hl) hcert hs hfit

theorem c0r_eq : c0r (toProb P) = (P.cnum : ℝ) / P.cden := by
  change FieldSem.fval PS [P.cnum, 0] / ((P.cden : ℕ) : ℝ) = _
  rw [show PS = [5] from rfl, fval_five]
  simp

/-- The fit of `upper_fitsT` as a fit of Spec's `dod`. -/
theorem dt_fit (hv : P.verts = dodVerts) (hd : P.dv = 4) {b : ℝ}
    (hU : Fits (convexHull ℝ (VV (toProb P) '' {l | l < P.verts.length})) tet 2 b) :
    Fits dod tet 2 b := by
  rwa [hull_eq hv hd] at hU

/-! ## 4. The claim -/

/-- **From the checks of `D45DT` to `EdgeBetween dod tet 2 a b`.** -/
theorem dt_case (hv : P.verts = dodVerts) (hd : P.dv = 4) (h0 : dtExtraOk P = true) (hkd : 0 < P.kd)
    (hL : DTLocalPoly.dtLocOk P = true) (ht : DTLocalBox.dtTubeOk P = true)
    (hwA : weightsOk P.tA = true) (hwB : weightsOk P.tB = true)
    {cA cB : List (List ℕ)} {DA DB : ℤ} {fA fB : List (List Char)} (hDA : 0 < DA) (hDB : 0 < DB)
    (hA : (tubeRunL P P.tA cA DA fA).1 = true) (hB : (tubeRunL P P.tB cB DB fB).1 = true)
    {ntoks : List Char} {recs : List FBoxL}
    (hn : (ntreeRunL P.nd ntoks (recs.map fun r => cornersN r.nb)).1 = true)
    (hb : ∀ r ∈ recs, (boxRunL P r).1 = true)
    {a b : ℝ} (ha : a ≤ 2 * √2 * ((P.cnum : ℝ) / P.cden)) (hup : Fits dod tet 2 b) :
    EdgeBetween dod tet 2 a b := by
  have hT := DTLocalRun.hlocT_of h0 hL hkd ht hwA hwB hDA hDB hA hB
  have hB' := DTLocalBox.hlocB_of h0 ht hT
  have hcert := far_certT h0 hkd hB' hn hb
  rw [hv, dodVerts_length, c0r_eq] at hcert
  refine ⟨fun s hs hf => ?_, hup⟩
  have hl := dt_lower hv hd hcert hs hf
  have h2 : (0 : ℝ) ≤ √2 := Real.sqrt_nonneg 2
  have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  calc a ≤ 2 * √2 * ((P.cnum : ℝ) / P.cden) := ha
    _ ≤ 2 * √2 * (s * (√2 / 4)) := mul_le_mul_of_nonneg_left hl (by positivity)
    _ = s := by linear_combination (s / 2) * hsq

end

#assert_std_axioms PackLean.Formal.DTCase.dt_case PackLean.Formal.DTCase.dt_fit
  PackLean.Formal.DTCase.dt_lower

end PackLean.Formal.DTCase
