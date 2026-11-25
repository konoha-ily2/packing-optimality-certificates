import PackLean.Formal.PolyLP
import PackLean.Formal.QuadSem

/-!
# D45 stage 4e: the four quaternion charts cover `SO(3)`

The far checker of `D16.Core` covers the rotations by four charts: in chart `c` the quaternion
`q` has `den` in the slot `c` and the other three components in `[-den, den]` (`rboxQ`, `chq` of
`QuadSem.lean`), and the rotation is `Rq(q) / |q|²` (`rqList`).  This file shows that **every
`R ∈ SO(3)` is reached** (`charts_cover`).

For `R ∈ SO(3)` put `a_0 = 1 + tr R`, `a_k = 1 + 2 R_{k-1,k-1} − tr R` (`k = 1, 2, 3`; `Σ a = 4`) and the
unnormalised quaternions of the charts
`v⁰ = (a_0, R₂₁ − R₁₂, R₀₂ − R₂₀, R₁₀ − R₀₁)`, `v¹ = (R₂₁ − R₁₂, a_1, R₀₁ + R₁₀, R₀₂ + R₂₀)`, …
(`v^c = 4 q_c · q` for a unit quaternion `q` of `R`).  Then `Rq(v^c) = 4 a_c R` and
`(v^c_k)² = a_c a_k`; these are linear combinations with constant coefficients of the relations
`R Rᵀ = 1`, `Rᵀ R = 1` and `adj R = Rᵀ` (`chart*_ids`, coefficients found by
`lean/tools/export_formal_charts.py`, which writes this file).  Taking `c` with `a_c` largest
(`a_c ≥ 1`), `|v^c_k| ≤ a_c`, and `q = (den / a_c) · v^c` is in the chart `c`.
-/

namespace PackLean.Formal.Charts

open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- The relations of `R ∈ SO(3)` entry by entry. -/
structure Rels (R : M3) : Prop where
  hr00 : R 0 0 * R 0 0 + R 0 1 * R 0 1 + R 0 2 * R 0 2 = 1
  hc00 : R 0 0 * R 0 0 + R 1 0 * R 1 0 + R 2 0 * R 2 0 = 1
  hr01 : R 0 0 * R 1 0 + R 0 1 * R 1 1 + R 0 2 * R 1 2 = 0
  hc01 : R 0 0 * R 0 1 + R 1 0 * R 1 1 + R 2 0 * R 2 1 = 0
  hr02 : R 0 0 * R 2 0 + R 0 1 * R 2 1 + R 0 2 * R 2 2 = 0
  hc02 : R 0 0 * R 0 2 + R 1 0 * R 1 2 + R 2 0 * R 2 2 = 0
  hr11 : R 1 0 * R 1 0 + R 1 1 * R 1 1 + R 1 2 * R 1 2 = 1
  hc11 : R 0 1 * R 0 1 + R 1 1 * R 1 1 + R 2 1 * R 2 1 = 1
  hr12 : R 1 0 * R 2 0 + R 1 1 * R 2 1 + R 1 2 * R 2 2 = 0
  hc12 : R 0 1 * R 0 2 + R 1 1 * R 1 2 + R 2 1 * R 2 2 = 0
  hr22 : R 2 0 * R 2 0 + R 2 1 * R 2 1 + R 2 2 * R 2 2 = 1
  hc22 : R 0 2 * R 0 2 + R 1 2 * R 1 2 + R 2 2 * R 2 2 = 1
  ha00 : R 0 0 = R 1 1*R 2 2 - R 1 2*R 2 1
  ha01 : R 0 1 = -R 1 0*R 2 2 + R 1 2*R 2 0
  ha02 : R 0 2 = R 1 0*R 2 1 - R 1 1*R 2 0
  ha10 : R 1 0 = -R 0 1*R 2 2 + R 0 2*R 2 1
  ha11 : R 1 1 = R 0 0*R 2 2 - R 0 2*R 2 0
  ha12 : R 1 2 = -R 0 0*R 2 1 + R 0 1*R 2 0
  ha20 : R 2 0 = R 0 1*R 1 2 - R 0 2*R 1 1
  ha21 : R 2 1 = -R 0 0*R 1 2 + R 0 2*R 1 0
  ha22 : R 2 2 = R 0 0*R 1 1 - R 0 1*R 1 0

theorem rels_of_SO {R : M3} (hR : R ∈ SO3) : Rels R := by
  rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
  have h1 : R * Rᵀ = 1 := (Matrix.mem_orthogonalGroup_iff (Fin 3) ℝ).1 hR.1
  have h2 : Rᵀ * R = 1 := (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
  have h3 : Matrix.adjugate R = Rᵀ := by
    have h := Matrix.mul_adjugate R
    rw [hR.2, one_smul] at h
    calc Matrix.adjugate R = (Rᵀ * R) * Matrix.adjugate R := by rw [h2, Matrix.one_mul]
      _ = Rᵀ := by rw [Matrix.mul_assoc, h, Matrix.mul_one]
  rw [Matrix.adjugate_fin_three] at h3
  exact ⟨(by have h := congrFun (congrFun h1 0) 0; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 0) 0; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h1 0) 1; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 0) 1; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h1 0) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 0) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h1 1) 1; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 1) 1; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h1 1) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 1) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h1 2) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h2 2) 2; simp [Matrix.mul_apply, Fin.sum_univ_three] at h; linear_combination h),
    (by have h := congrFun (congrFun h3 0) 0; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 1) 0; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 2) 0; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 0) 1; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 1) 1; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 2) 1; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 0) 2; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 1) 2; simp at h; linear_combination -h),
    (by have h := congrFun (congrFun h3 2) 2; simp at h; linear_combination -h)⟩

/-- Chart 0: the identities `Rq(v) = 4 a_0 R` and `v_k² = a_0 a_k`. -/
theorem chart0_ids {R : M3} (H : Rels R) :
    rqList (R 0 0 + R 1 1 + R 2 2 + 1) (-R 1 2 + R 2 1) (R 0 2 - R 2 0) (-R 0 1 + R 1 0) = [4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 0 0, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 0 1, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 0 2, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 1 0, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 1 1, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 1 2, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 2 0, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 2 1, 4 * (R 0 0 + R 1 1 + R 2 2 + 1) * R 2 2] ∧
    (-R 1 2 + R 2 1) ^ 2 = (R 0 0 + R 1 1 + R 2 2 + 1) * (R 0 0 - R 1 1 - R 2 2 + 1) ∧ (R 0 2 - R 2 0) ^ 2 = (R 0 0 + R 1 1 + R 2 2 + 1) * (-R 0 0 + R 1 1 - R 2 2 + 1) ∧ (-R 0 1 + R 1 0) ^ 2 = (R 0 0 + R 1 1 + R 2 2 + 1) * (-R 0 0 - R 1 1 + R 2 2 + 1) := by
  refine ⟨?_, ?_⟩
  · simp only [rqList, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · linear_combination (-1 : ℝ) * H.hr00 + (-2 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (2 : ℝ) * H.ha11 + (2 : ℝ) * H.ha22
    · linear_combination (-2 : ℝ) * H.hr01 + (-2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (-2 : ℝ) * H.hr02 + (-2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (-2 : ℝ) * H.hr01 + (-2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hr11 + (-2 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (2 : ℝ) * H.ha22
    · linear_combination (-2 : ℝ) * H.hr12 + (-2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (-2 : ℝ) * H.hr02 + (-2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (-2 : ℝ) * H.hr12 + (-2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (-1 : ℝ) * H.hr00 + (2 : ℝ) * H.hc00 + (-1 : ℝ) * H.hr11 + (2 : ℝ) * H.hc11 + (-3 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00 + (2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
  · refine ⟨?_, ?_, ?_⟩
    · linear_combination (-1 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha11
    · linear_combination (1 : ℝ) * H.hc00 + (1 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha22

/-- Chart 1: the identities `Rq(v) = 4 a_1 R` and `v_k² = a_1 a_k`. -/
theorem chart1_ids {R : M3} (H : Rels R) :
    rqList (-R 1 2 + R 2 1) (R 0 0 - R 1 1 - R 2 2 + 1) (R 0 1 + R 1 0) (R 0 2 + R 2 0) = [4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 0 0, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 0 1, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 0 2, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 1 0, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 1 1, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 1 2, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 2 0, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 2 1, 4 * (R 0 0 - R 1 1 - R 2 2 + 1) * R 2 2] ∧
    (-R 1 2 + R 2 1) ^ 2 = (R 0 0 - R 1 1 - R 2 2 + 1) * (R 0 0 + R 1 1 + R 2 2 + 1) ∧ (R 0 1 + R 1 0) ^ 2 = (R 0 0 - R 1 1 - R 2 2 + 1) * (-R 0 0 + R 1 1 - R 2 2 + 1) ∧ (R 0 2 + R 2 0) ^ 2 = (R 0 0 - R 1 1 - R 2 2 + 1) * (-R 0 0 - R 1 1 + R 2 2 + 1) := by
  refine ⟨?_, ?_⟩
  · simp only [rqList, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · linear_combination (-1 : ℝ) * H.hr00 + (-2 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
    · linear_combination (2 : ℝ) * H.hr01 + (-2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (2 : ℝ) * H.ha10
    · linear_combination (2 : ℝ) * H.hr02 + (-2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (2 : ℝ) * H.ha20
    · linear_combination (-2 : ℝ) * H.hr01 + (2 : ℝ) * H.hc01 + (2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (-1 : ℝ) * H.hr00 + (1 : ℝ) * H.hr11 + (2 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (2 : ℝ) * H.ha22
    · linear_combination (2 : ℝ) * H.hr12 + (2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (-2 : ℝ) * H.hr02 + (2 : ℝ) * H.hc02 + (2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (2 : ℝ) * H.hr12 + (2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (1 : ℝ) * H.hr00 + (-2 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (-2 : ℝ) * H.hc11 + (3 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
  · refine ⟨?_, ?_, ?_⟩
    · linear_combination (-1 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00
    · linear_combination (1 : ℝ) * H.hc00 + (1 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha22
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha11

/-- Chart 2: the identities `Rq(v) = 4 a_2 R` and `v_k² = a_2 a_k`. -/
theorem chart2_ids {R : M3} (H : Rels R) :
    rqList (R 0 2 - R 2 0) (R 0 1 + R 1 0) (-R 0 0 + R 1 1 - R 2 2 + 1) (R 1 2 + R 2 1) = [4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 0 0, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 0 1, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 0 2, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 1 0, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 1 1, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 1 2, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 2 0, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 2 1, 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) * R 2 2] ∧
    (R 0 2 - R 2 0) ^ 2 = (-R 0 0 + R 1 1 - R 2 2 + 1) * (R 0 0 + R 1 1 + R 2 2 + 1) ∧ (R 0 1 + R 1 0) ^ 2 = (-R 0 0 + R 1 1 - R 2 2 + 1) * (R 0 0 - R 1 1 - R 2 2 + 1) ∧ (R 1 2 + R 2 1) ^ 2 = (-R 0 0 + R 1 1 - R 2 2 + 1) * (-R 0 0 - R 1 1 + R 2 2 + 1) := by
  refine ⟨?_, ?_⟩
  · simp only [rqList, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · linear_combination (1 : ℝ) * H.hr00 + (2 : ℝ) * H.hc00 + (-1 : ℝ) * H.hr11 + (-1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (2 : ℝ) * H.ha22
    · linear_combination (-2 : ℝ) * H.hr01 + (2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (2 : ℝ) * H.ha10
    · linear_combination (2 : ℝ) * H.hr02 + (2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (2 : ℝ) * H.hr01 + (-2 : ℝ) * H.hc01 + (2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hr11 + (-2 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
    · linear_combination (2 : ℝ) * H.hr12 + (-2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (2 : ℝ) * H.ha21
    · linear_combination (2 : ℝ) * H.hr02 + (2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (-2 : ℝ) * H.hr12 + (2 : ℝ) * H.hc12 + (2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (1 : ℝ) * H.hr00 + (-2 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (-2 : ℝ) * H.hc11 + (3 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
  · refine ⟨?_, ?_, ?_⟩
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha11
    · linear_combination (1 : ℝ) * H.hc00 + (1 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha22
    · linear_combination (-1 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00

/-- Chart 3: the identities `Rq(v) = 4 a_3 R` and `v_k² = a_3 a_k`. -/
theorem chart3_ids {R : M3} (H : Rels R) :
    rqList (-R 0 1 + R 1 0) (R 0 2 + R 2 0) (R 1 2 + R 2 1) (-R 0 0 - R 1 1 + R 2 2 + 1) = [4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 0 0, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 0 1, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 0 2, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 1 0, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 1 1, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 1 2, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 2 0, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 2 1, 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) * R 2 2] ∧
    (-R 0 1 + R 1 0) ^ 2 = (-R 0 0 - R 1 1 + R 2 2 + 1) * (R 0 0 + R 1 1 + R 2 2 + 1) ∧ (R 0 2 + R 2 0) ^ 2 = (-R 0 0 - R 1 1 + R 2 2 + 1) * (R 0 0 - R 1 1 - R 2 2 + 1) ∧ (R 1 2 + R 2 1) ^ 2 = (-R 0 0 - R 1 1 + R 2 2 + 1) * (-R 0 0 + R 1 1 - R 2 2 + 1) := by
  refine ⟨?_, ?_⟩
  · simp only [rqList, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩
    · linear_combination (1 : ℝ) * H.hr00 + (2 : ℝ) * H.hc00 + (-1 : ℝ) * H.hr11 + (-1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
    · linear_combination (2 : ℝ) * H.hr01 + (2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (-2 : ℝ) * H.hr02 + (2 : ℝ) * H.hc02 + (-2 : ℝ) * H.ha02 + (2 : ℝ) * H.ha20
    · linear_combination (2 : ℝ) * H.hr01 + (2 : ℝ) * H.hc01 + (-2 : ℝ) * H.ha01 + (-2 : ℝ) * H.ha10
    · linear_combination (-1 : ℝ) * H.hr00 + (1 : ℝ) * H.hr11 + (2 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
    · linear_combination (-2 : ℝ) * H.hr12 + (2 : ℝ) * H.hc12 + (-2 : ℝ) * H.ha12 + (2 : ℝ) * H.ha21
    · linear_combination (2 : ℝ) * H.hr02 + (-2 : ℝ) * H.hc02 + (2 : ℝ) * H.ha02 + (-2 : ℝ) * H.ha20
    · linear_combination (2 : ℝ) * H.hr12 + (-2 : ℝ) * H.hc12 + (2 : ℝ) * H.ha12 + (-2 : ℝ) * H.ha21
    · linear_combination (-1 : ℝ) * H.hr00 + (2 : ℝ) * H.hc00 + (-1 : ℝ) * H.hr11 + (2 : ℝ) * H.hc11 + (-3 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha00 + (-2 : ℝ) * H.ha11 + (-2 : ℝ) * H.ha22
  · refine ⟨?_, ?_, ?_⟩
    · linear_combination (1 : ℝ) * H.hc00 + (1 : ℝ) * H.hc11 + (-1 : ℝ) * H.hr22 + (-2 : ℝ) * H.ha22
    · linear_combination (1 : ℝ) * H.hr00 + (-1 : ℝ) * H.hc11 + (1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha11
    · linear_combination (-1 : ℝ) * H.hc00 + (1 : ℝ) * H.hr11 + (1 : ℝ) * H.hr22 + (2 : ℝ) * H.ha00

/-! ## The scaling and the choice of the chart -/

theorem rqList_smul (k w x y z : ℝ) :
    rqList (k * w) (k * x) (k * y) (k * z) = (rqList w x y z).map (fun e => k ^ 2 * e) := by
  simp only [rqList, List.map_cons, List.map_nil, List.cons.injEq, and_true]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ring

/-- The rotation entries of a chart point, from the identities of the chart. -/
theorem core {R : M3} {w x y z A den : ℝ} (hA : 0 < A) (hden : 0 < den)
    (hrq : rqList w x y z = [4 * A * R 0 0, 4 * A * R 0 1, 4 * A * R 0 2, 4 * A * R 1 0, 4 * A * R 1 1,
      4 * A * R 1 2, 4 * A * R 2 0, 4 * A * R 2 1, 4 * A * R 2 2])
    (hN : w ^ 2 + x ^ 2 + y ^ 2 + z ^ 2 = 4 * A) :
    let k := den / A
    let N := (k * w) ^ 2 + (k * x) ^ 2 + (k * y) ^ 2 + (k * z) ^ 2
    0 < N ∧ rqList (k * w) (k * x) (k * y) (k * z) =
      [N * R 0 0, N * R 0 1, N * R 0 2, N * R 1 0, N * R 1 1, N * R 1 2, N * R 2 0, N * R 2 1, N * R 2 2] := by
  intro k N
  have hN2 : N = k ^ 2 * (4 * A) := by simp only [N]; rw [← hN]; ring
  have hk : 0 < k := div_pos hden hA
  refine ⟨by rw [hN2]; positivity, ?_⟩
  rw [rqList_smul, hrq, hN2]
  simp only [List.map_cons, List.map_nil, List.cons.injEq, and_true]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ring

/-- `v² = A a`, `a ≤ A`, `0 < A` ⇒ `-den ≤ den v / A ≤ den`. -/
theorem bound {v a A den : ℝ} (hA : 0 < A) (hden : 0 < den) (hv : v ^ 2 = A * a) (ha : a ≤ A) :
    -den ≤ den / A * v ∧ den / A * v ≤ den := by
  have h2 : v ^ 2 ≤ A ^ 2 := by rw [hv]; nlinarith
  have hlo : -A ≤ v := by nlinarith [sq_nonneg (v + A)]
  have hhi : v ≤ A := by nlinarith [sq_nonneg (v - A)]
  have e : den / A * v = den * (v / A) := by ring
  rw [e]
  have h1 : -1 ≤ v / A := by rw [le_div_iff₀ hA]; linarith
  have h1' : v / A ≤ 1 := by rw [div_le_iff₀ hA]; linarith
  constructor <;> nlinarith

/-- The quaternion of the chart `c` at the point `u`, and the rotation it gives. -/
def ChartPt (R : M3) (den : ℝ) (ch : ℕ) (u : Fin 3 → ℝ) : Prop :=
  let q := chq ch den (u 0) (u 1) (u 2)
  let N := q.getD 0 0 ^ 2 + q.getD 1 0 ^ 2 + q.getD 2 0 ^ 2 + q.getD 3 0 ^ 2
  (∀ i, -den ≤ u i ∧ u i ≤ den) ∧ 0 < N ∧
    rqList (q.getD 0 0) (q.getD 1 0) (q.getD 2 0) (q.getD 3 0) =
      [N * R 0 0, N * R 0 1, N * R 0 2, N * R 1 0, N * R 1 1, N * R 1 2, N * R 2 0, N * R 2 1, N * R 2 2]

theorem chart0_pt {R : M3} (H : Rels R) {den : ℝ} (hden : 0 < den)
    (hmax : R 0 0 - R 1 1 - R 2 2 + 1 ≤ R 0 0 + R 1 1 + R 2 2 + 1 ∧ -R 0 0 + R 1 1 - R 2 2 + 1 ≤ R 0 0 + R 1 1 + R 2 2 + 1 ∧ -R 0 0 - R 1 1 + R 2 2 + 1 ≤ R 0 0 + R 1 1 + R 2 2 + 1) :
    ∃ u, ChartPt R den 0 u := by
  obtain ⟨hrq, hs1, hs2, hs3⟩ := chart0_ids H
  obtain ⟨hm1, hm2, hm3⟩ := hmax
  have hA : 0 < R 0 0 + R 1 1 + R 2 2 + 1 := by linarith
  refine ⟨![den / (R 0 0 + R 1 1 + R 2 2 + 1) * (-R 1 2 + R 2 1), den / (R 0 0 + R 1 1 + R 2 2 + 1) * (R 0 2 - R 2 0), den / (R 0 0 + R 1 1 + R 2 2 + 1) * (-R 0 1 + R 1 0)], ?_⟩
  have hN : (R 0 0 + R 1 1 + R 2 2 + 1) ^ 2 + (-R 1 2 + R 2 1) ^ 2 + (R 0 2 - R 2 0) ^ 2 + (-R 0 1 + R 1 0) ^ 2 = 4 * (R 0 0 + R 1 1 + R 2 2 + 1) := by
    linear_combination hs1 + hs2 + hs3
  obtain ⟨hpos, hlist⟩ := core hA hden hrq hN
  have hd : den / (R 0 0 + R 1 1 + R 2 2 + 1) * (R 0 0 + R 1 1 + R 2 2 + 1) = den := by field_simp
  simp only [ChartPt, chq, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    List.getD_cons_zero, List.getD_cons_succ] at hpos hlist ⊢
  rw [hd] at hpos hlist
  refine ⟨fun i => ?_, hpos, hlist⟩
  fin_cases i
  · simpa using bound hA hden hs1 hm1
  · simpa using bound hA hden hs2 hm2
  · simpa using bound hA hden hs3 hm3

theorem chart1_pt {R : M3} (H : Rels R) {den : ℝ} (hden : 0 < den)
    (hmax : R 0 0 + R 1 1 + R 2 2 + 1 ≤ R 0 0 - R 1 1 - R 2 2 + 1 ∧ -R 0 0 + R 1 1 - R 2 2 + 1 ≤ R 0 0 - R 1 1 - R 2 2 + 1 ∧ -R 0 0 - R 1 1 + R 2 2 + 1 ≤ R 0 0 - R 1 1 - R 2 2 + 1) :
    ∃ u, ChartPt R den 1 u := by
  obtain ⟨hrq, hs0, hs2, hs3⟩ := chart1_ids H
  obtain ⟨hm0, hm2, hm3⟩ := hmax
  have hA : 0 < R 0 0 - R 1 1 - R 2 2 + 1 := by linarith
  refine ⟨![den / (R 0 0 - R 1 1 - R 2 2 + 1) * (-R 1 2 + R 2 1), den / (R 0 0 - R 1 1 - R 2 2 + 1) * (R 0 1 + R 1 0), den / (R 0 0 - R 1 1 - R 2 2 + 1) * (R 0 2 + R 2 0)], ?_⟩
  have hN : (-R 1 2 + R 2 1) ^ 2 + (R 0 0 - R 1 1 - R 2 2 + 1) ^ 2 + (R 0 1 + R 1 0) ^ 2 + (R 0 2 + R 2 0) ^ 2 = 4 * (R 0 0 - R 1 1 - R 2 2 + 1) := by
    linear_combination hs0 + hs2 + hs3
  obtain ⟨hpos, hlist⟩ := core hA hden hrq hN
  have hd : den / (R 0 0 - R 1 1 - R 2 2 + 1) * (R 0 0 - R 1 1 - R 2 2 + 1) = den := by field_simp
  simp only [ChartPt, chq, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    List.getD_cons_zero, List.getD_cons_succ] at hpos hlist ⊢
  rw [hd] at hpos hlist
  refine ⟨fun i => ?_, hpos, hlist⟩
  fin_cases i
  · simpa using bound hA hden hs0 hm0
  · simpa using bound hA hden hs2 hm2
  · simpa using bound hA hden hs3 hm3

theorem chart2_pt {R : M3} (H : Rels R) {den : ℝ} (hden : 0 < den)
    (hmax : R 0 0 + R 1 1 + R 2 2 + 1 ≤ -R 0 0 + R 1 1 - R 2 2 + 1 ∧ R 0 0 - R 1 1 - R 2 2 + 1 ≤ -R 0 0 + R 1 1 - R 2 2 + 1 ∧ -R 0 0 - R 1 1 + R 2 2 + 1 ≤ -R 0 0 + R 1 1 - R 2 2 + 1) :
    ∃ u, ChartPt R den 2 u := by
  obtain ⟨hrq, hs0, hs1, hs3⟩ := chart2_ids H
  obtain ⟨hm0, hm1, hm3⟩ := hmax
  have hA : 0 < -R 0 0 + R 1 1 - R 2 2 + 1 := by linarith
  refine ⟨![den / (-R 0 0 + R 1 1 - R 2 2 + 1) * (R 0 2 - R 2 0), den / (-R 0 0 + R 1 1 - R 2 2 + 1) * (R 0 1 + R 1 0), den / (-R 0 0 + R 1 1 - R 2 2 + 1) * (R 1 2 + R 2 1)], ?_⟩
  have hN : (R 0 2 - R 2 0) ^ 2 + (R 0 1 + R 1 0) ^ 2 + (-R 0 0 + R 1 1 - R 2 2 + 1) ^ 2 + (R 1 2 + R 2 1) ^ 2 = 4 * (-R 0 0 + R 1 1 - R 2 2 + 1) := by
    linear_combination hs0 + hs1 + hs3
  obtain ⟨hpos, hlist⟩ := core hA hden hrq hN
  have hd : den / (-R 0 0 + R 1 1 - R 2 2 + 1) * (-R 0 0 + R 1 1 - R 2 2 + 1) = den := by field_simp
  simp only [ChartPt, chq, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    List.getD_cons_zero, List.getD_cons_succ] at hpos hlist ⊢
  rw [hd] at hpos hlist
  refine ⟨fun i => ?_, hpos, hlist⟩
  fin_cases i
  · simpa using bound hA hden hs0 hm0
  · simpa using bound hA hden hs1 hm1
  · simpa using bound hA hden hs3 hm3

theorem chart3_pt {R : M3} (H : Rels R) {den : ℝ} (hden : 0 < den)
    (hmax : R 0 0 + R 1 1 + R 2 2 + 1 ≤ -R 0 0 - R 1 1 + R 2 2 + 1 ∧ R 0 0 - R 1 1 - R 2 2 + 1 ≤ -R 0 0 - R 1 1 + R 2 2 + 1 ∧ -R 0 0 + R 1 1 - R 2 2 + 1 ≤ -R 0 0 - R 1 1 + R 2 2 + 1) :
    ∃ u, ChartPt R den 3 u := by
  obtain ⟨hrq, hs0, hs1, hs2⟩ := chart3_ids H
  obtain ⟨hm0, hm1, hm2⟩ := hmax
  have hA : 0 < -R 0 0 - R 1 1 + R 2 2 + 1 := by linarith
  refine ⟨![den / (-R 0 0 - R 1 1 + R 2 2 + 1) * (-R 0 1 + R 1 0), den / (-R 0 0 - R 1 1 + R 2 2 + 1) * (R 0 2 + R 2 0), den / (-R 0 0 - R 1 1 + R 2 2 + 1) * (R 1 2 + R 2 1)], ?_⟩
  have hN : (-R 0 1 + R 1 0) ^ 2 + (R 0 2 + R 2 0) ^ 2 + (R 1 2 + R 2 1) ^ 2 + (-R 0 0 - R 1 1 + R 2 2 + 1) ^ 2 = 4 * (-R 0 0 - R 1 1 + R 2 2 + 1) := by
    linear_combination hs0 + hs1 + hs2
  obtain ⟨hpos, hlist⟩ := core hA hden hrq hN
  have hd : den / (-R 0 0 - R 1 1 + R 2 2 + 1) * (-R 0 0 - R 1 1 + R 2 2 + 1) = den := by field_simp
  simp only [ChartPt, chq, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    List.getD_cons_zero, List.getD_cons_succ] at hpos hlist ⊢
  rw [hd] at hpos hlist
  refine ⟨fun i => ?_, hpos, hlist⟩
  fin_cases i
  · simpa using bound hA hden hs0 hm0
  · simpa using bound hA hden hs1 hm1
  · simpa using bound hA hden hs2 hm2

/-- **The four charts cover `SO(3)`.** Every `R ∈ SO(3)` is `Rq(q) / |q|²` for a quaternion `q` with
`den` in the slot of some chart `ch < 4` and the other three components in `[-den, den]`. -/
theorem charts_cover {R : M3} (hR : R ∈ SO3) {den : ℝ} (hden : 0 < den) :
    ∃ ch < 4, ∃ u, ChartPt R den ch u := by
  have H := rels_of_SO hR
  set a0 := 1 + (R 0 0 + R 1 1 + R 2 2) with ha0
  set a1 := 1 + 2 * R 0 0 - (R 0 0 + R 1 1 + R 2 2) with ha1
  set a2 := 1 + 2 * R 1 1 - (R 0 0 + R 1 1 + R 2 2) with ha2
  set a3 := 1 + 2 * R 2 2 - (R 0 0 + R 1 1 + R 2 2) with ha3
  have hsum : a0 + a1 + a2 + a3 = 4 := by simp only [a0, a1, a2, a3]; ring
  rcases le_total a1 a0 with h10 | h01 <;> rcases le_total a3 a2 with h32 | h23
  · rcases le_total a2 a0 with h20 | h02
    · exact ⟨0, by norm_num, chart0_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
    · exact ⟨2, by norm_num, chart2_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
  · rcases le_total a3 a0 with h30 | h03
    · exact ⟨0, by norm_num, chart0_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
    · exact ⟨3, by norm_num, chart3_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
  · rcases le_total a2 a1 with h21 | h12
    · exact ⟨1, by norm_num, chart1_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
    · exact ⟨2, by norm_num, chart2_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
  · rcases le_total a3 a1 with h31 | h13
    · exact ⟨1, by norm_num, chart1_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩
    · exact ⟨3, by norm_num, chart3_pt H hden ⟨by linarith, by linarith, by linarith⟩⟩

end

#assert_std_axioms PackLean.Formal.Charts.charts_cover

end PackLean.Formal.Charts
