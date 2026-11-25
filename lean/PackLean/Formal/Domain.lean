import PackLean.Formal.CubinoctFar

/-!
# D45 stage 2d: every rotation is moved into the domain `D` by symmetries

Row action of a signed permutation (a symmetry of the octahedral container) and column action of a
symmetry of the cube fixing `e₁` both preserve feasibility of the LP `cubeLP`.
-/

namespace PackLean.Formal.Dom

open PackLean.Formal PackLean.Formal.Far Finset

abbrev M3 : Type := Matrix (Fin 3) (Fin 3) ℝ

/-- A matrix applied to a vector of `E3`. -/
noncomputable def mv (g : M3) (t : E3) : E3 := WithLp.toLp 2 (fun i => ∑ j, g i j * t j)

@[simp] theorem mv_apply (g : M3) (t : E3) (i : Fin 3) : mv g t i = ∑ j, g i j * t j := rfl

/-- **Row action.** If `gᵀg = I` and `gᵀσ` is a sign vector for every sign vector `σ`, then
`g` maps feasible solutions of the LP for `R` to feasible solutions for `gR`. -/
theorem cubeLP_mul_left {g R : M3} (hg : g.transpose * g = 1)
    (hσ : ∀ σ : Sgn, ∃ σ' : Sgn, ∀ j, ∑ i, sv σ i * g i j = sv σ' j)
    {t : E3} {S : ℝ} (h : cubeLP R t S) : cubeLP (g * R) (mv g t) S := by
  obtain ⟨hrow, hface⟩ := h
  have horth : ∀ l j, ∑ i, g i l * g i j = if l = j then 1 else 0 := fun l j => by
    have := congrFun (congrFun hg l) j
    simpa [Matrix.mul_apply, Matrix.one_apply] using this
  refine ⟨fun σ => ?_, ?_⟩
  · obtain ⟨σ', hσ'⟩ := hσ σ
    have e1 : ∑ i, sv σ i * mv g t i = ∑ j, sv σ' j * t j := by
      simp only [mv_apply, ← hσ', Fin.sum_univ_three]; ring
    have e2 : gSup (g * R) σ = gSup R σ' := by
      have : ∀ j, ∑ i, sv σ i * (g * R) i j = ∑ l, sv σ' l * R l j := fun j => by
        simp only [Matrix.mul_apply, ← hσ', Fin.sum_univ_three]; ring
      simp only [gSup, this]
    rw [e1, e2]; exact hrow σ'
  · have h00 := horth 0 0; have h01 := horth 0 1; have h02 := horth 0 2
    have h10 := horth 1 0; have h11 := horth 1 1; have h12 := horth 1 2
    have h20 := horth 2 0; have h21 := horth 2 1; have h22 := horth 2 2
    simp only [Fin.sum_univ_three, Fin.isValue] at h00 h01 h02 h10 h11 h12 h20 h21 h22
    norm_num at h00 h01 h02 h10 h11 h12 h20 h21 h22
    have e : ∑ i, (g * R) i 0 * mv g t i = ∑ i, R i 0 * t i := by
      simp only [Matrix.mul_apply, mv_apply, Fin.sum_univ_three]
      linear_combination (R 0 0 * t 0) * h00 + (R 0 0 * t 1) * h01 + (R 0 0 * t 2) * h02
        + (R 1 0 * t 0) * h10 + (R 1 0 * t 1) * h11 + (R 1 0 * t 2) * h12
        + (R 2 0 * t 0) * h20 + (R 2 0 * t 1) * h21 + (R 2 0 * t 2) * h22
    rw [e]; exact hface

/-- **Column action.** A signed permutation of the columns fixing `e₁` keeps feasibility. -/
theorem cubeLP_mul_spm {R : M3} {π : Equiv.Perm (Fin 3)} {s : Fin 3 → ℝ}
    (hs : ∀ j, s j = 1 ∨ s j = -1) (hπ : π 0 = 0) (hs0 : s 0 = 1)
    {t : E3} {S : ℝ} (h : cubeLP R t S) : cubeLP (R * spm π s) t S := by
  refine ⟨fun σ => by rw [gSup_mul_spm _ _ _ hs]; exact h.1 σ, ?_⟩
  simp only [mul_spm_apply, hπ, hs0, mul_one]
  exact h.2

/-! ## Signed row permutations -/

/-- Row `l` of `rp π s` takes coordinate `π l` with sign `s l`. -/
def rp (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) : M3 := Matrix.of fun l j => if j = π l then s l else 0

theorem rp_mul_apply (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) (R : M3) (l j : Fin 3) :
    (rp π s * R) l j = s l * R (π l) j := by
  simp [Matrix.mul_apply, rp]

theorem rp_orth (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) (hs : ∀ j, s j = 1 ∨ s j = -1) :
    (rp π s).transpose * rp π s = 1 := by
  ext l j
  simp only [Matrix.mul_apply, Matrix.transpose_apply, rp, Matrix.of_apply, Matrix.one_apply]
  rw [Finset.sum_eq_single (π.symm l)]
  · simp only [Equiv.apply_symm_apply, ite_true]
    by_cases h : l = j
    · subst h; simp only [ite_true]; rcases hs (π.symm l) with h | h <;> rw [h] <;> norm_num
    · simp [h, Ne.symm h]
  · intro i _ hi
    have : l ≠ π i := fun h => hi (by rw [h, Equiv.symm_apply_apply])
    simp [this]
  · simp

theorem rp_sign (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) (hs : ∀ j, s j = 1 ∨ s j = -1)
    (σ : Sgn) : ∃ σ' : Sgn, ∀ j, ∑ i, sv σ i * rp π s i j = sv σ' j := by
  refine ⟨fun j => xor (σ (π.symm j)) (decide (s (π.symm j) = -1)), fun j => ?_⟩
  have : ∑ i, sv σ i * rp π s i j = sv σ (π.symm j) * s (π.symm j) := by
    simp only [rp, Matrix.of_apply, mul_ite, mul_zero]
    rw [Finset.sum_eq_single (π.symm j)]
    · simp
    · intro i _ hi; rw [if_neg]; intro h; apply hi; rw [h, Equiv.symm_apply_apply]
    · simp
  rw [this]
  rcases hs (π.symm j) with h | h <;> simp only [sv, h] <;> cases σ (π.symm j) <;> norm_num


/-! ## Quaternion rotations -/

/-- The rotation matrix `R(q)/|q|²` of the quaternion `q = (w, a, b, c)`. -/
noncomputable def qm (w a b c : ℝ) : M3 :=
  let N := w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2
  !![(w ^ 2 + a ^ 2 - b ^ 2 - c ^ 2) / N, 2 * (a * b - w * c) / N, 2 * (a * c + w * b) / N;
     2 * (a * b + w * c) / N, (w ^ 2 + b ^ 2 - a ^ 2 - c ^ 2) / N, 2 * (b * c - w * a) / N;
     2 * (a * c - w * b) / N, 2 * (b * c + w * a) / N, (w ^ 2 + c ^ 2 - a ^ 2 - b ^ 2) / N]

theorem Rmat_eq (b γ τ : ℝ) : Rmat b γ τ = qm 1 τ (-b + γ * τ) (γ + b * τ) := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [Rmat, qm, rqList]

theorem qm_orth (w a b c : ℝ) (hN : 0 < w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2) :
    qm w a b c ∈ Matrix.orthogonalGroup (Fin 3) ℝ := by
  rw [Matrix.mem_orthogonalGroup_iff]
  have hN' := hN.ne'
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [qm, Matrix.mul_apply, Fin.sum_univ_three] <;> field_simp <;> ring

theorem qm_det (w a b c : ℝ) (hN : 0 < w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2) : (qm w a b c).det = 1 := by
  have hN' := hN.ne'
  simp [qm, Matrix.det_fin_three]
  field_simp
  ring

theorem qm_SO (w a b c : ℝ) (hN : 0 < w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2) :
    qm w a b c ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ :=
  Matrix.mem_specialOrthogonalGroup_iff.2 ⟨qm_orth w a b c hN, qm_det w a b c hN⟩

theorem Rmat_N_pos (b γ τ : ℝ) : 0 < (1 : ℝ) ^ 2 + τ ^ 2 + (-b + γ * τ) ^ 2 + (γ + b * τ) ^ 2 := by
  positivity

/-- **Step 8.** `Rmat b γ τ ∈ SO(3)`. -/
theorem Rmat_SO (b γ τ : ℝ) : Rmat b γ τ ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ := by
  rw [Rmat_eq]; exact qm_SO _ _ _ _ (Rmat_N_pos b γ τ)

theorem Rmat_orth (b γ τ : ℝ) : Rmat b γ τ ∈ Matrix.orthogonalGroup (Fin 3) ℝ :=
  (Matrix.mem_specialOrthogonalGroup_iff.1 (Rmat_SO b γ τ)).1

/-- **Step 7.** The quaternion `(1, τ, −b+γτ, γ+bτ)` is `(1, 0, −b, γ)·(1, τ, 0, 0)`. -/
theorem Rmat_mul (b γ τ : ℝ) : Rmat b γ τ = Rmat b γ 0 * Rmat 0 0 τ := by
  have h1 : (0 : ℝ) < 1 + b ^ 2 + γ ^ 2 := by positivity
  have h2 : (0 : ℝ) < 1 + τ ^ 2 := by positivity
  have h3 := Rmat_N_pos b γ τ
  have h1' := h1.ne'; have h2' := h2.ne'; have h3' := h3.ne'
  rw [Rmat_eq, Rmat_eq, Rmat_eq]
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [qm, Matrix.mul_apply, Fin.sum_univ_three] <;> field_simp <;> ring

/-! ## Rotations about `e₁` -/

/-- The rotation about `e₁` with cosine `c` and sine `s`. -/
def rotX (c s : ℝ) : M3 := !![1, 0, 0; 0, c, -s; 0, s, c]

/-- The quarter turn about `e₁`, as a column signed permutation (a symmetry of the cube). -/
def k90 : M3 := spm (Equiv.swap 1 2) ![1, 1, -1]

theorem k90_sign : ∀ j, (![1, 1, -1] : Fin 3 → ℝ) j = 1 ∨ (![1, 1, -1] : Fin 3 → ℝ) j = -1 := by
  intro j; fin_cases j <;> simp

theorem rotX_k90 (c s : ℝ) : rotX c s * k90 = rotX (-s) c := by
  ext i j
  rw [k90, mul_spm_apply]
  fin_cases i <;> fin_cases j <;> simp [rotX, Equiv.swap_apply_def]

/-- **Step 6.** A quarter turn of the columns keeps feasibility. -/
theorem cubeLP_step {A : M3} {c s : ℝ} {t : E3} {S : ℝ} (h : cubeLP (A * rotX c s) t S) :
    cubeLP (A * rotX (-s) c) t S := by
  have := cubeLP_mul_spm (π := Equiv.swap 1 2) k90_sign (by decide) (by simp) h
  rwa [Matrix.mul_assoc, ← k90, rotX_k90] at this

/-- Turning `0`–`3` quarter turns puts `(c, s)` in the first quadrant. -/
theorem cubeLP_quadrant {A : M3} {c s : ℝ} (hcs : c ^ 2 + s ^ 2 = 1) {t : E3} {S : ℝ}
    (h : cubeLP (A * rotX c s) t S) :
    ∃ c' s' : ℝ, 0 ≤ c' ∧ 0 ≤ s' ∧ c' ^ 2 + s' ^ 2 = 1 ∧ cubeLP (A * rotX c' s') t S := by
  have h1 := cubeLP_step h
  have h2 := cubeLP_step h1
  have h3 := cubeLP_step h2
  rcases le_total 0 c with hc | hc <;> rcases le_total 0 s with hs | hs
  · exact ⟨c, s, hc, hs, hcs, h⟩
  · exact ⟨-s, c, by linarith, hc, by linear_combination hcs, h1⟩
  · exact ⟨s, -c, hs, by linarith, by linear_combination hcs, by simpa using h3⟩
  · exact ⟨-c, -s, by linarith, by linarith, by linear_combination hcs, h2⟩

/-- **Step 7 (τ).** In the first quadrant, `rotX c s = Rmat 0 0 τ` with `τ = s/(1+c) ∈ [0, 1]`. -/
theorem rotX_eq_Rmat {c s : ℝ} (hc : 0 ≤ c) (hs : 0 ≤ s) (hcs : c ^ 2 + s ^ 2 = 1) :
    rotX c s = Rmat 0 0 (s / (1 + c)) := by
  have h1 : (0 : ℝ) < 1 + c := by linarith
  have h1' := h1.ne'
  have hN : (1 : ℝ) + (s / (1 + c)) ^ 2 = 2 / (1 + c) := by
    field_simp; linear_combination hcs
  have hN' : (1 : ℝ) ^ 2 + (s / (1 + c)) ^ 2 + (-0 + 0 * (s / (1 + c))) ^ 2
      + (0 + 0 * (s / (1 + c))) ^ 2 = 2 / (1 + c) := by
    simp only [neg_zero, zero_mul, add_zero, one_pow]; norm_num; exact hN
  rw [Rmat_eq]
  ext i j
  fin_cases i <;> fin_cases j <;> simp only [qm, rotX] <;> rw [hN'] <;> simp
  all_goals field_simp
  all_goals first | ring1 | linear_combination hcs | linear_combination -hcs |
    linear_combination 2 * hcs | linear_combination -2 * hcs

end PackLean.Formal.Dom
