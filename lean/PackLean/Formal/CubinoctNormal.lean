import PackLean.Formal.Domain
import PackLean.Formal.FarRegion

/-!
# D45 stage 2d: the normal form `(b, γ, τ) ∈ D`, and the far region assembled

* `normal_form`: every feasible `(R, t, S)` with `R ∈ SO(3)` gives a feasible `(Rmat b γ τ, t', S)` with
  `(b, γ, τ)` in the domain `D` (row symmetries of the octahedron, column symmetries of the cube).
* `hLP_of_local`: the hypothesis `hLP` of `cubinoct_lower_of_LP` follows from the local statement on
  `D ∩ L` alone (the far region `D \ L` is `cubinoct_far`).
* `cubinoct_lower_of_local`: the lower bound `1 + √2 ≤ s` from the local statement.
-/

namespace PackLean.Formal.Dom

open PackLean.Formal PackLean.Formal.Far Finset

/-! ## Orthogonal matrices -/

theorem orth_tt {A : M3} (h : A ∈ Matrix.orthogonalGroup (Fin 3) ℝ) : A.transpose * A = 1 := by
  exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 h

theorem orth_tt' {A : M3} (h : A ∈ Matrix.orthogonalGroup (Fin 3) ℝ) : A * A.transpose = 1 := by
  exact (Matrix.mem_orthogonalGroup_iff (Fin 3) ℝ).1 h

theorem orth_of_tt {A : M3} (h : A.transpose * A = 1) : A ∈ Matrix.orthogonalGroup (Fin 3) ℝ := by
  rw [Matrix.mem_orthogonalGroup_iff']
  exact h

theorem det_pm {A : M3} (h : A ∈ Matrix.orthogonalGroup (Fin 3) ℝ) : A.det = 1 ∨ A.det = -1 := by
  have h1 := congrArg Matrix.det (orth_tt h)
  rw [Matrix.det_mul, Matrix.det_one, Matrix.det_transpose] at h1
  have : (A.det - 1) * (A.det + 1) = 0 := by linear_combination h1
  rcases mul_eq_zero.1 this with h | h
  · left; linarith
  · right; linarith

/-- **Step 5.** Two rotations with the same first column differ by a rotation about `e₁`. -/
theorem fix_e1 {Ra R₂ : M3} (ha : Ra ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ)
    (h2 : R₂ ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) (hcol : ∀ i, Ra i 0 = R₂ i 0) :
    ∃ c s : ℝ, c ^ 2 + s ^ 2 = 1 ∧ R₂ = Ra * rotX c s := by
  obtain ⟨hao, had⟩ := Matrix.mem_specialOrthogonalGroup_iff.1 ha
  obtain ⟨h2o, h2d⟩ := Matrix.mem_specialOrthogonalGroup_iff.1 h2
  have aT := orth_tt hao; have aT' := orth_tt' hao
  have bT := orth_tt h2o; have bT' := orth_tt' h2o
  obtain ⟨M, hM⟩ : ∃ M : M3, M = Ra.transpose * R₂ := ⟨_, rfl⟩
  have hMM : M * M.transpose = 1 := by
    rw [hM, Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.mul_assoc,
      ← Matrix.mul_assoc R₂, bT', Matrix.one_mul, aT]
  have hMM' : M.transpose * M = 1 := by
    rw [hM, Matrix.transpose_mul, Matrix.transpose_transpose, Matrix.mul_assoc,
      ← Matrix.mul_assoc Ra, aT', Matrix.one_mul, bT]
  have hdet : M.det = 1 := by rw [hM, Matrix.det_mul, Matrix.det_transpose, had, h2d, one_mul]
  have hRa : Ra * M = R₂ := by rw [hM, ← Matrix.mul_assoc, aT', Matrix.one_mul]
  have hcol0 : ∀ i, M i 0 = if i = 0 then 1 else 0 := by
    intro i
    have := congrFun (congrFun aT i) 0
    rw [hM, Matrix.mul_apply]
    simp only [Matrix.transpose_apply, ← hcol]
    simpa [Matrix.mul_apply, Matrix.one_apply] using this
  have m00 := hcol0 0; have m10 := hcol0 1; have m20 := hcol0 2
  simp only [Fin.isValue, ite_true, show (1 : Fin 3) ≠ 0 by decide, show (2 : Fin 3) ≠ 0 by decide,
    ite_false] at m00 m10 m20
  have r00 := congrFun (congrFun hMM 0) 0
  have c11 := congrFun (congrFun hMM' 1) 1
  have c22 := congrFun (congrFun hMM' 2) 2
  have c12 := congrFun (congrFun hMM' 1) 2
  simp only [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_three, Matrix.one_apply,
    Fin.isValue] at r00 c11 c22 c12
  norm_num at r00 c11 c22 c12
  rw [Matrix.det_fin_three] at hdet
  rw [m00] at r00 hdet
  rw [m10, m20] at hdet
  have h01 : M 0 1 = 0 := by nlinarith [sq_nonneg (M 0 1), sq_nonneg (M 0 2)]
  have h02 : M 0 2 = 0 := by nlinarith [sq_nonneg (M 0 1), sq_nonneg (M 0 2)]
  simp only [h01, h02] at c11 c22 c12 hdet
  have hcs : M 1 1 ^ 2 + M 2 1 ^ 2 = 1 := by linear_combination c11
  have hd : M 1 1 * M 2 2 - M 1 2 * M 2 1 = 1 := by linear_combination hdet
  have hxs : M 1 2 = -M 2 1 := by linear_combination M 1 1 * c12 - M 2 1 * hd - M 1 2 * hcs
  have hyc : M 2 2 = M 1 1 := by linear_combination M 1 1 * hd + M 2 1 * c12 - M 2 2 * hcs
  refine ⟨M 1 1, M 2 1, hcs, ?_⟩
  rw [← hRa]
  congr 1
  ext i j
  fin_cases i <;> fin_cases j <;> simp [rotX, m00, m10, m20, h01, h02, hxs, hyc]

/-! ## Sorting `|u|` by signed row permutations -/

theorem sort3_aux (u : Fin 3 → ℝ) (π : Equiv.Perm (Fin 3)) (a b c : Fin 3) (ha : π 0 = a)
    (hb : π 1 = b) (hc : π 2 = c) (h1 : u b ≤ u a) (h2 : u c ≤ u b) :
    ∃ π : Equiv.Perm (Fin 3), u (π 1) ≤ u (π 0) ∧ u (π 2) ≤ u (π 1) :=
  ⟨π, by rw [ha, hb]; exact h1, by rw [hb, hc]; exact h2⟩

theorem sort3 (u : Fin 3 → ℝ) : ∃ π : Equiv.Perm (Fin 3), u (π 1) ≤ u (π 0) ∧ u (π 2) ≤ u (π 1) := by
  rcases le_total (u 1) (u 0) with h01 | h01 <;> rcases le_total (u 2) (u 1) with h12 | h12 <;>
    rcases le_total (u 2) (u 0) with h02 | h02 <;>
    first
    | exact sort3_aux u 1 0 1 2 rfl rfl rfl (by linarith) (by linarith)
    | exact sort3_aux u (Equiv.swap 0 1) 1 0 2 (by decide) (by decide) (by decide) (by linarith)
        (by linarith)
    | exact sort3_aux u (Equiv.swap 1 2) 0 2 1 (by decide) (by decide) (by decide) (by linarith)
        (by linarith)
    | exact sort3_aux u (Equiv.swap 0 2) 2 1 0 (by decide) (by decide) (by decide) (by linarith)
        (by linarith)
    | exact sort3_aux u (Equiv.swap 0 1 * Equiv.swap 1 2) 1 2 0 (by decide) (by decide) (by decide)
        (by linarith) (by linarith)
    | exact sort3_aux u (Equiv.swap 1 2 * Equiv.swap 0 1) 2 0 1 (by decide) (by decide) (by decide)
        (by linarith) (by linarith)

/-! ## The first column of `Rmat b γ 0` -/

/-- **Step 4.** Inverse stereographic projection from `−e₁`. -/
theorem Rmat_col0 {v0 v1 v2 : ℝ} (hp : 0 < 1 + v0) (hn : v0 ^ 2 + v1 ^ 2 + v2 ^ 2 = 1) :
    ∀ i, Rmat (v2 / (1 + v0)) (v1 / (1 + v0)) 0 i 0 = ![v0, v1, v2] i := by
  have hp' := hp.ne'
  have key : (1 : ℝ) ^ 2 + 0 ^ 2 + (-(v2 / (1 + v0)) + v1 / (1 + v0) * 0) ^ 2
      + (v1 / (1 + v0) + v2 / (1 + v0) * 0) ^ 2 = 2 / (1 + v0) := by
    field_simp
    first | ring1 | linear_combination hn | linear_combination -hn |
      linear_combination 2 * hn | linear_combination -2 * hn
  rw [Rmat_eq]
  intro i
  fin_cases i <;> simp only [qm] <;> rw [key] <;> simp
  all_goals field_simp
  all_goals first | ring1 | linear_combination hn | linear_combination -hn |
    linear_combination 2 * hn | linear_combination -2 * hn

/-! ## The normal form -/

/-- **Stage 2d.** Every feasible `(R, t, S)`, `R ∈ SO(3)`, gives a feasible `(Rmat b γ τ, t', S)` with
`(b, γ, τ) ∈ D`. -/
theorem normal_form {R : M3} (hR : R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ) {t : E3} {S : ℝ}
    (h : cubeLP R t S) : ∃ b γ τ : ℝ, inD b γ τ ∧ ∃ t' : E3, cubeLP (Rmat b γ τ) t' S := by
  obtain ⟨hRo, _⟩ := Matrix.mem_specialOrthogonalGroup_iff.1 hR
  -- step 2: rows, so that the first column is `|u|` sorted
  obtain ⟨π, hπ1, hπ2⟩ := sort3 (fun i => |R i 0|)
  obtain ⟨sg, hsg⟩ : ∃ sg : Fin 3 → ℝ, sg = fun l => if 0 ≤ R (π l) 0 then 1 else -1 := ⟨_, rfl⟩
  have hs : ∀ j, sg j = 1 ∨ sg j = -1 := fun j => by rw [hsg]; dsimp only; split_ifs <;> simp
  have h1 := cubeLP_mul_left (rp_orth π sg hs) (rp_sign π sg hs) h
  obtain ⟨R₁, hR₁⟩ : ∃ R₁ : M3, R₁ = rp π sg * R := ⟨_, rfl⟩
  rw [← hR₁] at h1
  have hR₁o : R₁ ∈ Matrix.orthogonalGroup (Fin 3) ℝ := by
    rw [hR₁]; exact mul_mem (orth_of_tt (rp_orth π sg hs)) hRo
  have hc1 : ∀ l, R₁ l 0 = |R (π l) 0| := fun l => by
    rw [hR₁, rp_mul_apply, hsg]; dsimp only; split_ifs with hh
    · rw [abs_of_nonneg hh, one_mul]
    · rw [abs_of_neg (not_le.1 hh)]; ring
  -- step 3: determinant one
  obtain ⟨R₂, hR₂, hc2, h2⟩ : ∃ R₂ ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ,
      (∀ l, R₂ l 0 = R₁ l 0) ∧ cubeLP R₂ (mv (rp π sg) t) S := by
    rcases det_pm hR₁o with hd | hd
    · exact ⟨R₁, Matrix.mem_specialOrthogonalGroup_iff.2 ⟨hR₁o, hd⟩, fun _ => rfl, h1⟩
    · refine ⟨R₁ * spm 1 ![1, 1, -1],
        Matrix.mem_specialOrthogonalGroup_iff.2 ⟨mul_mem hR₁o (spm_orth _ _ k90_sign), ?_⟩,
        fun l => ?_, cubeLP_mul_spm k90_sign rfl (by simp) h1⟩
      · rw [Matrix.det_mul, hd]; simp [spm, Matrix.det_fin_three]
      · rw [mul_spm_apply]; simp
  obtain ⟨hR₂o, _⟩ := Matrix.mem_specialOrthogonalGroup_iff.1 hR₂
  -- step 4: `(b, γ)` from the first column `v`
  have e0 : R₂ 0 0 = |R (π 0) 0| := by rw [hc2, hc1]
  have e1 : R₂ 1 0 = |R (π 1) 0| := by rw [hc2, hc1]
  have e2 : R₂ 2 0 = |R (π 2) 0| := by rw [hc2, hc1]
  have hv0 : R₂ 1 0 ≤ R₂ 0 0 := by rw [e0, e1]; exact hπ1
  have hv1 : R₂ 2 0 ≤ R₂ 1 0 := by rw [e1, e2]; exact hπ2
  have hv2 : 0 ≤ R₂ 2 0 := by rw [e2]; exact abs_nonneg _
  have hnorm : R₂ 0 0 ^ 2 + R₂ 1 0 ^ 2 + R₂ 2 0 ^ 2 = 1 := by
    have := congrFun (congrFun (orth_tt hR₂o) 0) 0
    simp only [Matrix.mul_apply, Matrix.transpose_apply, Fin.sum_univ_three, Matrix.one_apply,
      ite_true] at this
    linear_combination this
  have hp : 0 < 1 + R₂ 0 0 := by linarith
  set b := R₂ 2 0 / (1 + R₂ 0 0) with hb
  set γ := R₂ 1 0 / (1 + R₂ 0 0) with hγ
  have hcol := Rmat_col0 hp hnorm
  have hcolA : ∀ i, Rmat b γ 0 i 0 = R₂ i 0 := by
    intro i; rw [hcol i]; fin_cases i <;> rfl
  -- step 5: `R₂ = Rmat b γ 0 · rotX c s`
  obtain ⟨c, s, hcs, hEq⟩ := fix_e1 (Rmat_SO b γ 0) hR₂ hcolA
  rw [hEq] at h2
  -- step 6: quarter turns
  obtain ⟨c', s', hc', hs', hcs', h3⟩ := cubeLP_quadrant hcs h2
  -- step 7: `τ`
  have hc1' : (0 : ℝ) < 1 + c' := by linarith
  refine ⟨b, γ, s' / (1 + c'), ⟨?_, ?_, ?_, ?_, ?_⟩, mv (rp π sg) t, ?_⟩
  · exact div_nonneg hv2 hp.le
  · exact div_le_div_of_nonneg_right hv1 hp.le
  · have : b ^ 2 + (γ + 1) ^ 2 = (R₂ 2 0 ^ 2 + (R₂ 1 0 + 1 + R₂ 0 0) ^ 2) / (1 + R₂ 0 0) ^ 2 := by
      rw [hb, hγ]; field_simp; ring
    rw [this, div_le_iff₀ (by positivity)]
    nlinarith [mul_nonneg hp.le (sub_nonneg.2 hv0)]
  · exact div_nonneg hs' hc1'.le
  · rw [div_le_one hc1']; nlinarith
  · rw [Rmat_mul, ← rotX_eq_Rmat hc' hs' hcs']; exact h3

/-! ## Assembling: the far region and the hypothesis `hLP` -/

/-- **`hLP` from the local statement.** The hypothesis of `cubinoct_lower_of_LP` holds as soon as
it holds on `D ∩ L`; the far region `D \ L` is `cubinoct_far`. -/
theorem hLP_of_local
    (hloc : ∀ b γ τ : ℝ, inD b γ τ → inL b γ τ → ∀ (t : E3) (S : ℝ),
      cubeLP (Rmat b γ τ) t S → 1 + √2 / 2 ≤ S) :
    ∀ R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, ∀ (t : E3) (S : ℝ),
      cubeLP R t S → 1 + √2 / 2 ≤ S := by
  intro R hR t S h
  obtain ⟨b, γ, τ, hD, t', h'⟩ := normal_form hR h
  by_cases hL : inL b γ τ
  · exact hloc b γ τ hD hL t' S h'
  · exact (cubinoct_far b γ τ hD hL (Rmat_orth b γ τ) t' S h').le

/-- **Lower bound of `cubinoct_n02` from the local statement** (stage 3 is the hypothesis). -/
theorem cubinoct_lower_of_local
    (hloc : ∀ b γ τ : ℝ, inD b γ τ → inL b γ τ → ∀ (t : E3) (S : ℝ),
      cubeLP (Rmat b γ τ) t S → 1 + √2 / 2 ≤ S)
    {s : ℝ} (hs : 0 ≤ s) (h : Fits cube oct 2 s) : 1 + √2 ≤ s :=
  cubinoct_lower_of_LP (hLP_of_local hloc) hs h

end PackLean.Formal.Dom
