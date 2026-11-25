import PackLean.Formal.Orbit

/-!
# A9 stage 7a (trial): separation by a plane and the dual bound for the tetrahedral container

Design: `plan/A9f_tet_design.md`.  This file is the trial part of the design (the pieces whose
Mathlib side was uncertain):

* `sep_plane` (T1, direction ⇒): two convex sets with nonempty, disjoint interiors are separated by
  a plane `dot n x = h`, `n ≠ 0` (Mathlib: `geometric_hahn_banach_open_open`).
* `fits_two_sep`: two copies of a convex `K` with nonempty interior fit ⇒ two proper placements in
  the container and a separating plane.
* `top_bound` (replaces T2–T4): if a placed piece `R K + t` satisfies the four container rows
  `b_f · x ≤ c` and lies below the plane `n · x ≤ h`, then for every `μ ≥ max_f n · b_f` and every
  choice of vertices, `n·R v₀ + ¼ Σ_f (μ − n·b_f) (b_f·R v_f) − c μ ≤ h` (weak duality; no minimiser,
  no description of the set of translations is needed).
* `sum_bound`: the four rows alone give `Σ_f b_f·R v_f ≤ 4c` (the leaf type "S" of `tetintet`).
* `exists_chamber`: every direction is moved by a symmetry of the container (an orthogonal matrix
  permuting the `b_f`) into the cone `z ≥ x ≥ |y|` over `D_n`.  No list of the 24 elements of `T_d`:
  the symmetry maximising a linear form with `ρ = (2, 1, 4)` works, by three reflections.
-/

namespace PackLean.Formal.TetSep

open PackLean.Formal PackLean.Formal.Polytope PackLean.Formal.PolyLP PackLean.Formal.Orbit Finset
open scoped Matrix Pointwise

noncomputable section

/-! ## T1 (⇒) -/

/-- A continuous linear functional on `E3` is `dot n`. -/
theorem functional_eq_dot (f : StrongDual ℝ E3) : ∃ n : E3, ∀ x, f x = dot n x := by
  refine ⟨WithLp.toLp 2 (fun i => f (EuclideanSpace.single i 1)), fun x => ?_⟩
  have hx : x = ∑ i, x i • (EuclideanSpace.single i (1 : ℝ) : E3) := by
    ext j
    fin_cases j <;> simp [Fin.sum_univ_three]
  conv_lhs => rw [hx]
  simp only [map_sum, map_smul, smul_eq_mul, dot]
  exact sum_congr rfl fun i _ => mul_comm _ _

/-- **T1 (⇒).** Convex sets with nonempty and disjoint interiors are separated by a plane. -/
theorem sep_plane {A B : Set E3} (hA : Convex ℝ A) (hB : Convex ℝ B)
    (hAi : (interior A).Nonempty) (hBi : (interior B).Nonempty)
    (hd : Disjoint (interior A) (interior B)) :
    ∃ n : E3, n ≠ 0 ∧ ∃ h : ℝ, (∀ x ∈ A, dot n x ≤ h) ∧ ∀ x ∈ B, h ≤ dot n x := by
  obtain ⟨f, u, hfa, hfb⟩ := geometric_hahn_banach_open_open hA.interior isOpen_interior
    hB.interior isOpen_interior hd
  obtain ⟨n, hn⟩ := functional_eq_dot f
  have hcA : A ⊆ closure (interior A) := by
    rw [hA.closure_interior_eq_closure_of_nonempty_interior hAi]; exact subset_closure
  have hcB : B ⊆ closure (interior B) := by
    rw [hB.closure_interior_eq_closure_of_nonempty_interior hBi]; exact subset_closure
  have hleA : ∀ x ∈ A, f x ≤ u := fun x hx =>
    (closure_minimal (t := {y | f y ≤ u}) (fun y hy => (hfa y hy).le)
      (isClosed_le f.continuous continuous_const)) (hcA hx)
  have hleB : ∀ x ∈ B, u ≤ f x := fun x hx =>
    (closure_minimal (t := {y | u ≤ f y}) (fun y hy => (hfb y hy).le)
      (isClosed_le continuous_const f.continuous)) (hcB hx)
  refine ⟨n, ?_, u, fun x hx => hn x ▸ hleA x hx, fun x hx => hn x ▸ hleB x hx⟩
  rintro rfl
  obtain ⟨a, ha⟩ := hAi
  obtain ⟨b, hb⟩ := hBi
  have h1 := hfa a ha
  have h2 := hfb b hb
  rw [hn] at h1 h2
  simp [dot] at h1 h2
  linarith

/-- Two copies of a convex `K` with nonempty interior fit ⇒ two proper placements inside the
container and a plane `dot n x = h` (`n ≠ 0`) with the first copy below and the second above. -/
theorem fits_two_sep {K C : Set E3} (hK : Convex ℝ K) (hKi : (interior K).Nonempty) {s : ℝ}
    (h : Fits K C 2 s) :
    ∃ g₁ g₂ : Motion, IsProper g₁ ∧ IsProper g₂ ∧ g₁ '' K ⊆ s • C ∧ g₂ '' K ⊆ s • C ∧
      ∃ n : E3, n ≠ 0 ∧ ∃ h : ℝ, (∀ x ∈ K, dot n (g₁ x) ≤ h) ∧ ∀ x ∈ K, h ≤ dot n (g₂ x) := by
  obtain ⟨g, hG, hin, hdis⟩ := h
  have hconv : ∀ i, Convex ℝ (g i '' K) := fun i =>
    hK.affine_image (g i).toAffineEquiv.toAffineMap
  have hint : ∀ i, (interior (g i '' K)).Nonempty := fun i => by
    have himg := (g i).toHomeomorph.image_interior K
    simp only [AffineIsometryEquiv.coe_toHomeomorph] at himg
    rw [← himg]
    exact hKi.image _
  obtain ⟨n, hn, u, h1, h2⟩ :=
    sep_plane (hconv 0) (hconv 1) (hint 0) (hint 1) (hdis 0 1 (by decide))
  exact ⟨g 0, g 1, hG 0, hG 1, hin 0, hin 1, n, hn, u, fun x hx => h1 _ ⟨x, hx, rfl⟩,
    fun x hx => h2 _ ⟨x, hx, rfl⟩⟩

/-! ## The dual bound (replaces T2–T4) -/

/-- The container normals `b_f` (scaled by `√3`): the tetrahedron of edge `s` is
`{x | ∀ f, b_f · x ≤ s / (2√2)}`. -/
def bT : Fin 4 → E3
  | 0 => !₂[-1, -1, -1]
  | 1 => !₂[-1, 1, 1]
  | 2 => !₂[1, -1, 1]
  | 3 => !₂[1, 1, -1]

/-- `Σ_f b_f = 0`. -/
theorem sum_bT_dot (t : E3) : ∑ f, dot (bT f) t = 0 := by
  simp only [Fin.sum_univ_four, dot, Fin.sum_univ_three, bT]
  simp
  ring

/-- `n = −¼ Σ_f (μ − n·b_f) b_f` for every `μ` (the `b_f` are a tight frame with sum 0). -/
theorem dot_frame (μ : ℝ) (n t : E3) :
    dot n t = -(1 / 4) * ∑ f, (μ - dot n (bT f)) * dot (bT f) t := by
  simp only [Fin.sum_univ_four, dot, Fin.sum_univ_three, bT]
  simp
  ring

/-- `Σ_f (μ − n·b_f) = 4μ`. -/
theorem sum_weights (μ : ℝ) (n : E3) : ∑ f, (μ - dot n (bT f)) = 4 * μ := by
  simp only [Fin.sum_univ_four, dot, Fin.sum_univ_three, bT]
  simp
  ring

/-- **The dual bound.** Rows `b_f · (R v_f + t) ≤ c` and `n · (R v₀ + t) ≤ h`, weights
`μ − n·b_f ≥ 0` ⇒ `n·R v₀ + ¼ Σ_f (μ − n·b_f)(b_f·R v_f) − c μ ≤ h`. -/
theorem top_bound {R : M3} {t n : E3} {c h μ : ℝ} {v0 : E3} {vf : Fin 4 → E3}
    (hin : ∀ f, dot (bT f) (mv R (vf f)) + dot (bT f) t ≤ c)
    (htop : dot n (mv R v0) + dot n t ≤ h)
    (hμ : ∀ f, dot n (bT f) ≤ μ) :
    dot n (mv R v0) + 1 / 4 * ∑ f, (μ - dot n (bT f)) * dot (bT f) (mv R (vf f)) - c * μ ≤ h := by
  have hsum : ∑ f, (μ - dot n (bT f)) * dot (bT f) t
      ≤ ∑ f, (μ - dot n (bT f)) * (c - dot (bT f) (mv R (vf f))) :=
    sum_le_sum fun f _ => mul_le_mul_of_nonneg_left (by linarith [hin f]) (by linarith [hμ f])
  have hexp : ∑ f, (μ - dot n (bT f)) * (c - dot (bT f) (mv R (vf f)))
      = c * (4 * μ) - ∑ f, (μ - dot n (bT f)) * dot (bT f) (mv R (vf f)) := by
    rw [← sum_weights μ n, mul_sum, ← sum_sub_distrib]
    exact sum_congr rfl fun _ _ => by ring
  have hfr := dot_frame μ n t
  linarith

/-- The four rows alone: `Σ_f b_f · R v_f ≤ 4c`. -/
theorem sum_bound {R : M3} {t : E3} {c : ℝ} {vf : Fin 4 → E3}
    (hin : ∀ f, dot (bT f) (mv R (vf f)) + dot (bT f) t ≤ c) :
    ∑ f, dot (bT f) (mv R (vf f)) ≤ 4 * c := by
  have h := sum_le_sum fun f (_ : f ∈ univ) => hin f
  rw [sum_add_distrib, sum_bT_dot] at h
  simp at h
  linarith

/-! ## The domain `D_n`: every direction can be moved into the cone `z ≥ x ≥ |y|` -/

/-- The normals indexed by `ℕ` (for `Orbit.Gset`). -/
def bN : ℕ → E3
  | 0 => !₂[-1, -1, -1]
  | 1 => !₂[-1, 1, 1]
  | 2 => !₂[1, -1, 1]
  | 3 => !₂[1, 1, -1]
  | _ => 0

theorem bN_eq (f : Fin 4) : bN f = bT f := by fin_cases f <;> rfl

/-- The reflections in the walls `x = z`, `x = y`, `x = -y`, and the rotation `diag(-1, 1, -1)`. -/
def rxz : M3 := !![0, 0, 1; 0, 1, 0; 1, 0, 0]
def rxy : M3 := !![0, 1, 0; 1, 0, 0; 0, 0, 1]
def rm : M3 := !![0, -1, 0; -1, 0, 0; 0, 0, 1]
def g0 : M3 := !![-1, 0, 0; 0, 1, 0; 0, 0, -1]

theorem rxz_mem : rxz ∈ Gset bN 4 := by
  refine ⟨?_, fun j hj => ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp [rxz, Matrix.mul_apply, Fin.sum_univ_three]
  · interval_cases j
    · exact ⟨0, by norm_num, by ext i; fin_cases i <;> simp [rxz, bN, Fin.sum_univ_three]⟩
    · exact ⟨3, by norm_num, by ext i; fin_cases i <;> simp [rxz, bN, Fin.sum_univ_three]⟩
    · exact ⟨2, by norm_num, by ext i; fin_cases i <;> simp [rxz, bN, Fin.sum_univ_three]⟩
    · exact ⟨1, by norm_num, by ext i; fin_cases i <;> simp [rxz, bN, Fin.sum_univ_three]⟩

theorem rxy_mem : rxy ∈ Gset bN 4 := by
  refine ⟨?_, fun j hj => ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp [rxy, Matrix.mul_apply, Fin.sum_univ_three]
  · interval_cases j
    · exact ⟨0, by norm_num, by ext i; fin_cases i <;> simp [rxy, bN, Fin.sum_univ_three]⟩
    · exact ⟨2, by norm_num, by ext i; fin_cases i <;> simp [rxy, bN, Fin.sum_univ_three]⟩
    · exact ⟨1, by norm_num, by ext i; fin_cases i <;> simp [rxy, bN, Fin.sum_univ_three]⟩
    · exact ⟨3, by norm_num, by ext i; fin_cases i <;> simp [rxy, bN, Fin.sum_univ_three]⟩

theorem rm_mem : rm ∈ Gset bN 4 := by
  refine ⟨?_, fun j hj => ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp [rm, Matrix.mul_apply, Fin.sum_univ_three]
  · interval_cases j
    · exact ⟨3, by norm_num, by ext i; fin_cases i <;> simp [rm, bN, Fin.sum_univ_three]⟩
    · exact ⟨1, by norm_num, by ext i; fin_cases i <;> simp [rm, bN, Fin.sum_univ_three]⟩
    · exact ⟨2, by norm_num, by ext i; fin_cases i <;> simp [rm, bN, Fin.sum_univ_three]⟩
    · exact ⟨0, by norm_num, by ext i; fin_cases i <;> simp [rm, bN, Fin.sum_univ_three]⟩

/-- `diag(-1, 1, -1)` is a symmetry of the container; it maps `-(x, y, z)` to `(x, -y, z)`. -/
theorem g0_mem : g0 ∈ Gset bN 4 := by
  refine ⟨?_, fun j hj => ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp [g0, Matrix.mul_apply, Fin.sum_univ_three]
  · interval_cases j
    · exact ⟨2, by norm_num, by ext i; fin_cases i <;> simp [g0, bN, Fin.sum_univ_three]⟩
    · exact ⟨3, by norm_num, by ext i; fin_cases i <;> simp [g0, bN, Fin.sum_univ_three]⟩
    · exact ⟨0, by norm_num, by ext i; fin_cases i <;> simp [g0, bN, Fin.sum_univ_three]⟩
    · exact ⟨1, by norm_num, by ext i; fin_cases i <;> simp [g0, bN, Fin.sum_univ_three]⟩

theorem isCompact_G4 : IsCompact (Gset bN 4) :=
  isCompact_Box.of_isClosed_subset isClosed_G fun _ hg => orth_mem_Box hg.1

/-- A direction in the interior of the cone `z > x > |y|`. -/
def rho : E3 := !₂[2, 1, 4]

theorem rho_val (p : E3) : dot rho p = 2 * p 0 + p 1 + 4 * p 2 := by
  simp [dot, rho, Fin.sum_univ_three]

theorem rxz_val (p : E3) : dot rho (mv rxz p) = 2 * p 2 + p 1 + 4 * p 0 := by
  simp [dot, rho, rxz, Fin.sum_univ_three]

theorem rxy_val (p : E3) : dot rho (mv rxy p) = 2 * p 1 + p 0 + 4 * p 2 := by
  simp [dot, rho, rxy, Fin.sum_univ_three]

theorem rm_val (p : E3) : dot rho (mv rm p) = -(2 * p 1) - p 0 + 4 * p 2 := by
  simp [dot, rho, rm, Fin.sum_univ_three]
  ring

/-- **The domain of `n`.** Some symmetry `g` of the container maps `n` into the cone
`x ≤ z`, `y ≤ x`, `-y ≤ x` (the cone over `D_n = {(x, y, 1) : |y| ≤ x ≤ 1}`). -/
theorem exists_chamber (n : E3) :
    ∃ g ∈ Gset bN 4, mv g n 0 ≤ mv g n 2 ∧ mv g n 1 ≤ mv g n 0 ∧ -(mv g n 1) ≤ mv g n 0 := by
  have hcont : Continuous fun g : M3 => dot rho (mv g n) := by
    simp only [dot, mv_apply, Fin.sum_univ_three]
    have he := continuous_entry
    fun_prop
  obtain ⟨g, hg, hmax⟩ := isCompact_G4.exists_isMaxOn ⟨1, one_mem_G⟩ hcont.continuousOn
  have key : ∀ r ∈ Gset bN 4, dot rho (mv r (mv g n)) ≤ dot rho (mv g n) := fun r hr => by
    have h : dot rho (mv (r * g) n) ≤ dot rho (mv g n) := hmax (mul_mem_G hg hr)
    rwa [mv_mul] at h
  have h1 := key rxz rxz_mem
  have h2 := key rxy rxy_mem
  have h3 := key rm rm_mem
  rw [rxz_val, rho_val] at h1
  rw [rxy_val, rho_val] at h2
  rw [rm_val, rho_val] at h3
  exact ⟨g, hg, by linarith, by linarith, by linarith⟩

end

end PackLean.Formal.TetSep
