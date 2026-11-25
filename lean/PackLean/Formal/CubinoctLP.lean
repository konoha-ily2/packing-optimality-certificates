import PackLean.Formal.Proper

/-!
# D45 stage 1: `cubinoct_n02` — Lemma R, the LP `φ(R)` and weak duality

Reduction of the lower bound of `cubinoct_n02` (two cubes in an octahedron) to the LP of
`docs/reduction_symmetric.md` §8 (certificates repository):

* `fits_two_imp`: Lemma R, direction (1 ⇒ 2), for any sets (no hypothesis).
* `cube_eq`: the cube is the box `|x i| ≤ 1/2`; `oct_subset`: the octahedron lies in the ℓ¹ ball of
  radius `√2/2`.
* `cubinoct_reduction`: two cubes fit in the octahedron of edge `s` ⇒ the LP
  `cubeLP R t (s·√2/2)` is feasible for some `R ∈ SO(3)` and `t` (face `e₁` of the cube).
* `cubeLP_weak_duality`: the weak-duality bound used by every lower-bound certificate.
* `cubinoct_lower_of_LP`: if every feasible `(R, t, S)` has `S ≥ 1 + √2/2`, then every `s ≥ 0` at which
  two cubes fit satisfies `1 + √2 ≤ s`.
-/

namespace PackLean.Formal

open scoped Pointwise
open Finset

noncomputable section

/-! ## Lemma R, direction (1 ⇒ 2) -/

/-- **Lemma R (1 ⇒ 2).** If two copies fit, one placed copy has the origin outside its interior. -/
theorem fits_two_imp {K C : Set E3} {s : ℝ} (h : Fits K C 2 s) :
    ∃ g : Motion, IsProper g ∧ g '' K ⊆ s • C ∧ (0 : E3) ∉ interior (g '' K) := by
  obtain ⟨g, hG, hin, hdis⟩ := h
  by_cases h0 : (0 : E3) ∈ interior (g 0 '' K)
  · refine ⟨g 1, hG 1, hin 1, fun h1 => ?_⟩
    exact Set.disjoint_left.1 (hdis 0 1 (by decide)) h0 h1
  · exact ⟨g 0, hG 0, hin 0, h0⟩

/-! ## The cube and the octahedron as inequalities -/

/-- The set `{x | ∑ |x i| ≤ r}` is convex. -/
theorem convex_l1ball (r : ℝ) : Convex ℝ {x : E3 | ∑ i, |x i| ≤ r} := by
  intro a ha b hb wa wb hwa hwb hab
  simp only [Set.mem_ofPred_eq, PiLp.add_apply, PiLp.smul_apply, smul_eq_mul] at ha hb ⊢
  calc ∑ i, |wa * a i + wb * b i| ≤ ∑ i, (wa * |a i| + wb * |b i|) := by
        refine sum_le_sum fun i _ => (abs_add_le _ _).trans ?_
        rw [abs_mul, abs_mul, abs_of_nonneg hwa, abs_of_nonneg hwb]
    _ = wa * ∑ i, |a i| + wb * ∑ i, |b i| := by rw [sum_add_distrib, mul_sum, mul_sum]
    _ ≤ wa * r + wb * r := by gcongr
    _ = r := by rw [← add_mul, hab, one_mul]

/-- The box `{x | ∀ i, |x i| ≤ r}` is convex. -/
theorem convex_box (r : ℝ) : Convex ℝ {x : E3 | ∀ i, |x i| ≤ r} := by
  intro a ha b hb wa wb hwa hwb hab i
  simp only [PiLp.add_apply, PiLp.smul_apply, smul_eq_mul]
  calc |wa * a i + wb * b i| ≤ wa * |a i| + wb * |b i| := by
        refine (abs_add_le _ _).trans ?_
        rw [abs_mul, abs_mul, abs_of_nonneg hwa, abs_of_nonneg hwb]
    _ ≤ wa * r + wb * r := by gcongr <;> [exact ha i; exact hb i]
    _ = r := by rw [← add_mul, hab, one_mul]

/-- **The cube is the box** `|x i| ≤ 1/2`. -/
theorem cube_eq : cube = {x : E3 | ∀ i, |x i| ≤ 1 / 2} := by
  apply Set.Subset.antisymm
  · exact convexHull_min (fun x hx i => (hx i).le) (convex_box _)
  · intro x hx
    let P : Set (Fin 3 → ℝ) := Set.univ.pi fun _ => ({-(1 / 2), 1 / 2} : Set ℝ)
    have h1 : WithLp.ofLp x ∈ convexHull ℝ P := by
      rw [convexHull_pi]
      intro i _
      rw [convexHull_pair, segment_eq_uIcc, Set.mem_uIcc]
      have := abs_le.1 (hx i)
      left
      exact ⟨this.1, this.2⟩
    have h2 := Set.mem_image_of_mem
      ((WithLp.linearEquiv 2 ℝ (Fin 3 → ℝ)).symm : (Fin 3 → ℝ) →ₗ[ℝ] E3) h1
    rw [LinearMap.image_convexHull] at h2
    have h3 : ((WithLp.linearEquiv 2 ℝ (Fin 3 → ℝ)).symm : (Fin 3 → ℝ) →ₗ[ℝ] E3) '' P ⊆ cubeV := by
      rintro _ ⟨y, hy, rfl⟩ i
      have hyi := hy i (Set.mem_univ i)
      show |y i| = 1 / 2
      rcases hyi with h | h
      · rw [h]; norm_num
      · rw [Set.mem_singleton_iff.1 h]; norm_num
    have h4 := convexHull_mono h3 h2
    simpa [cube] using h4

/-- The octahedron lies in the ℓ¹ ball of radius `√2/2`. -/
theorem oct_subset : oct ⊆ {x : E3 | ∑ i, |x i| ≤ √2 / 2} := by
  refine convexHull_min ?_ (convex_l1ball _)
  rintro x ⟨k, hk, h0⟩
  simp only [Set.mem_ofPred_eq, Fin.sum_univ_three]
  fin_cases k
  · simp [h0 1 (by decide), h0 2 (by decide)] at hk ⊢; rw [hk]
  · simp [h0 0 (by decide), h0 2 (by decide)] at hk ⊢; rw [hk]
  · simp [h0 0 (by decide), h0 1 (by decide)] at hk ⊢; rw [hk]

/-- A point of the octahedron of edge `s ≥ 0` has ℓ¹ norm at most `s·√2/2`. -/
theorem l1_le_of_mem_smul_oct {s : ℝ} (hs : 0 ≤ s) {x : E3} (hx : x ∈ s • oct) :
    ∑ i, |x i| ≤ s * (√2 / 2) := by
  obtain ⟨y, hy, rfl⟩ := Set.mem_smul_set.1 hx
  have := oct_subset hy
  simp only [Set.mem_ofPred_eq] at this
  simp only [PiLp.smul_apply, smul_eq_mul, abs_mul, abs_of_nonneg hs, ← mul_sum]
  exact mul_le_mul_of_nonneg_left this hs

/-! ## The LP of `docs/reduction_symmetric.md` §8 -/

/-- Sign vectors `σ ∈ {±1}³`, indexed by `Fin 3 → Bool` (`true ↦ -1`). -/
abbrev Sgn : Type := Fin 3 → Bool

/-- The sign vector as reals. -/
def sv (σ : Sgn) (i : Fin 3) : ℝ := if σ i then -1 else 1

theorem sv_mul_le_abs (σ : Sgn) (i : Fin 3) (a : ℝ) : sv σ i * a ≤ |a| := by
  unfold sv; split_ifs
  · rw [neg_one_mul]; exact neg_le_abs a
  · rw [one_mul]; exact le_abs_self a

/-- The support term `g_σ(R) = ½ ∑_j |σ · R e_j|` of the placed cube in direction `σ`. -/
def gSup (R : Matrix (Fin 3) (Fin 3) ℝ) (σ : Sgn) : ℝ :=
  (1 / 2) * ∑ j, |∑ i, sv σ i * R i j|

/-- The LP constraints of `cubinoct_n02` (§8): the 8 container rows and the fixed face `e₁` of the
cube, `u · t ≤ -1/2` with `u = R e₁`. -/
def cubeLP (R : Matrix (Fin 3) (Fin 3) ℝ) (t : E3) (S : ℝ) : Prop :=
  (∀ σ : Sgn, ∑ i, sv σ i * t i + gSup R σ ≤ S) ∧ ∑ i, R i 0 * t i ≤ -(1 / 2)

/-- The same LP with any face `ε e_k` of the cube in place of `e₁`. -/
def cubeLPAny (R : Matrix (Fin 3) (Fin 3) ℝ) (t : E3) (S : ℝ) : Prop :=
  (∀ σ : Sgn, ∑ i, sv σ i * t i + gSup R σ ≤ S) ∧
    ∃ k : Fin 3, ∃ ε : ℝ, (ε = 1 ∨ ε = -1) ∧ ε * ∑ i, R i k * t i ≤ -(1 / 2)

/-- **Weak duality.** For `λ ≥ 0` with `∑ λ = 1` and `μ ≥ 0`, every feasible `(t, S)` satisfies
`S ≥ ∑ λ_σ g_σ(R) + μ/2 + E · t` with `E = ∑ λ_σ σ + μ R e₁`. -/
theorem cubeLP_weak_duality {R : Matrix (Fin 3) (Fin 3) ℝ} {t : E3} {S : ℝ} (h : cubeLP R t S)
    (lam : Sgn → ℝ) (hlam : ∀ σ, 0 ≤ lam σ) (hsum : ∑ σ, lam σ = 1) (μ : ℝ) (hμ : 0 ≤ μ) :
    ∑ σ, lam σ * gSup R σ + μ / 2 + ∑ i, (∑ σ, lam σ * sv σ i + μ * R i 0) * t i ≤ S := by
  obtain ⟨hrow, hface⟩ := h
  have h1 : ∑ σ, lam σ * (∑ i, sv σ i * t i + gSup R σ) ≤ ∑ σ, lam σ * S :=
    sum_le_sum fun σ _ => mul_le_mul_of_nonneg_left (hrow σ) (hlam σ)
  have h2 : μ * (∑ i, R i 0 * t i) ≤ μ * (-(1 / 2)) := mul_le_mul_of_nonneg_left hface hμ
  have h3 : ∑ σ, lam σ * S = S := by rw [← sum_mul, hsum, one_mul]
  have h4 : ∑ i, (∑ σ, lam σ * sv σ i + μ * R i 0) * t i
      = ∑ σ, lam σ * ∑ i, sv σ i * t i + μ * ∑ i, R i 0 * t i := by
    simp only [add_mul, sum_add_distrib, sum_mul, mul_sum]
    rw [sum_comm]
    congr 1
    · refine sum_congr rfl fun σ _ => sum_congr rfl fun i _ => by ring
    · refine sum_congr rfl fun i _ => by ring
  have h5 : ∑ σ, lam σ * (∑ i, sv σ i * t i + gSup R σ)
      = ∑ σ, lam σ * ∑ i, sv σ i * t i + ∑ σ, lam σ * gSup R σ := by
    rw [← sum_add_distrib]; exact sum_congr rfl fun σ _ => by ring
  rw [h4]
  linarith

/-! ## From "two cubes fit" to the LP -/

/-- For a placement `g`, the coordinates of `g⁻¹ 0` are `-(R e_k) · t`. -/
theorem symm_zero_coord (g : Motion) (k : Fin 3) :
    g.symm 0 k = -∑ i, rotMat g i k * g 0 i := by
  set R := rotMat g
  set y := g.symm 0
  have hy : ∀ i, g 0 i = -∑ j, R i j * y j := fun i => by
    have := motion_apply_coord g y i
    rw [show g y = 0 from g.apply_symm_apply 0] at this
    simp only [PiLp.zero_apply] at this
    linarith
  have horth : ∀ k j, ∑ i, R i k * R i j = if k = j then 1 else 0 := fun k j => by
    have h := congrFun (congrFun ((Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 (rotMat_mem_orthogonal g)) k) j
    simpa [Matrix.mul_apply, Matrix.one_apply, Matrix.transpose_apply] using h
  calc y k = ∑ j, (if k = j then 1 else 0) * y j := by simp
    _ = ∑ j, (∑ i, R i k * R i j) * y j := by simp only [horth]
    _ = -∑ i, R i k * g 0 i := by
        simp only [hy, mul_neg, sum_neg_distrib, neg_neg, mul_sum, sum_mul]
        rw [sum_comm]
        exact sum_congr rfl fun i _ => sum_congr rfl fun j _ => by ring

/-- If the origin is not interior to the placed cube, some face `ε e_k` separates. -/
theorem face_of_not_mem_interior (g : Motion) (h : (0 : E3) ∉ interior (g '' cube)) :
    ∃ k : Fin 3, ∃ ε : ℝ, (ε = 1 ∨ ε = -1) ∧ ε * ∑ i, rotMat g i k * g 0 i ≤ -(1 / 2) := by
  by_contra hcon
  push Not at hcon
  apply h
  set U : Set E3 := {y | ∀ i, |y i| < 1 / 2}
  have hU : IsOpen U := by
    simp only [U, Set.ofPred_forall]
    exact isOpen_iInter_of_finite fun i => isOpen_lt (by fun_prop) continuous_const
  have hUc : U ⊆ cube := by rw [cube_eq]; exact fun y hy i => (hy i).le
  have hmem : g.symm 0 ∈ U := by
    intro k
    rw [symm_zero_coord, abs_lt]
    have h1 := hcon k 1 (Or.inl rfl)
    have h2 := hcon k (-1) (Or.inr rfl)
    constructor <;> linarith
  refine mem_interior.2 ⟨g '' U, Set.image_mono hUc, ?_, ⟨g.symm 0, hmem, by simp⟩⟩
  exact g.toHomeomorph.isOpenMap U hU

/-- The container rows: every `σ`-row holds with `S = s·√2/2`. -/
theorem rows_of_subset {g : Motion} {s : ℝ} (hs : 0 ≤ s) (hin : g '' cube ⊆ s • oct) (σ : Sgn) :
    ∑ i, sv σ i * g 0 i + gSup (rotMat g) σ ≤ s * (√2 / 2) := by
  set R := rotMat g
  let a : Fin 3 → ℝ := fun j => ∑ i, sv σ i * R i j
  let v : E3 := WithLp.toLp 2 (fun j => if 0 ≤ a j then 1 / 2 else -(1 / 2))
  have hv : v ∈ cube := by
    rw [cube_eq]; intro j
    simp only [v]
    split_ifs <;> norm_num
  have hgv := l1_le_of_mem_smul_oct hs (hin ⟨v, hv, rfl⟩)
  have hσ : ∑ i, sv σ i * g v i ≤ ∑ i, |g v i| := sum_le_sum fun i _ => sv_mul_le_abs σ i _
  have hexp : ∑ i, sv σ i * g v i = ∑ i, sv σ i * g 0 i + gSup R σ := by
    simp only [motion_apply_coord g v, mul_add, sum_add_distrib, gSup]
    rw [add_comm]
    congr 1
    rw [mul_sum]
    simp only [mul_sum]
    rw [sum_comm]
    refine sum_congr rfl fun j _ => ?_
    have : ∑ i, sv σ i * (R i j * v j) = a j * v j := by
      simp only [a, sum_mul]; exact sum_congr rfl fun i _ => by ring
    rw [this]
    simp only [v]
    split_ifs with hj
    · rw [abs_of_nonneg hj]; ring
    · rw [abs_of_neg (not_le.1 hj)]; ring
  linarith

/-- **Reduction (any face).** Two cubes fit in the octahedron of edge `s ≥ 0` ⇒ the LP with some
face `ε e_k` is feasible at `S = s·√2/2`. -/
theorem cubinoct_reduction_any {s : ℝ} (hs : 0 ≤ s) (h : Fits cube oct 2 s) :
    ∃ R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, ∃ t : E3, cubeLPAny R t (s * (√2 / 2)) := by
  obtain ⟨g, hg, hin, h0⟩ := fits_two_imp h
  refine ⟨rotMat g, ?_, g 0, fun σ => rows_of_subset hs hin σ, face_of_not_mem_interior g h0⟩
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  exact ⟨rotMat_mem_orthogonal g, (isProper_iff_det g).1 hg⟩

/-! ## Moving the face to `e₁` (the cube's rotations are transitive on its 6 faces) -/

/-- The signed permutation matrix: column `j` is `s j • e_{π j}`. -/
def spm (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) : Matrix (Fin 3) (Fin 3) ℝ :=
  Matrix.of fun l j => if l = π j then s j else 0

theorem mul_spm_apply (R : Matrix (Fin 3) (Fin 3) ℝ) (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ)
    (i j : Fin 3) : (R * spm π s) i j = R i (π j) * s j := by
  simp [Matrix.mul_apply, spm]

theorem spm_orth (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ) (hs : ∀ j, s j = 1 ∨ s j = -1) :
    spm π s ∈ Matrix.orthogonalGroup (Fin 3) ℝ := by
  rw [Matrix.mem_orthogonalGroup_iff']
  ext j j'
  simp only [Matrix.mul_apply, Matrix.transpose_apply, spm, Matrix.of_apply, Matrix.one_apply,
    ite_mul, zero_mul, mul_ite, mul_zero]
  rw [sum_ite_eq']
  simp only [mem_univ, ite_true]
  by_cases hj : j = j'
  · subst hj; simp only [ite_true]; rcases hs j with h | h <;> rw [h] <;> norm_num
  · rw [ite_eq_right (fun h => hj (π.injective h).symm |>.elim), ite_eq_right hj]

theorem gSup_mul_spm (R : Matrix (Fin 3) (Fin 3) ℝ) (π : Equiv.Perm (Fin 3)) (s : Fin 3 → ℝ)
    (hs : ∀ j, s j = 1 ∨ s j = -1) (σ : Sgn) : gSup (R * spm π s) σ = gSup R σ := by
  unfold gSup
  congr 1
  simp only [mul_spm_apply]
  have : ∀ j, |∑ i, sv σ i * (R i (π j) * s j)| = |∑ i, sv σ i * R i (π j)| := fun j => by
    rw [show ∑ i, sv σ i * (R i (π j) * s j) = s j * ∑ i, sv σ i * R i (π j) by
      rw [mul_sum]; exact sum_congr rfl fun i _ => by ring, abs_mul]
    rcases hs j with h | h <;> rw [h] <;> simp
  simp only [this]
  exact Equiv.sum_comp π (fun j => |∑ i, sv σ i * R i j|)

/-- **Face orbit.** A feasible LP with any face `ε e_k` gives a feasible LP with the face `e₁`,
for the rotation `R h` (`h` a rotation of the cube taking `e₁` to `ε e_k`). -/
theorem cubeLP_of_any {R : Matrix (Fin 3) (Fin 3) ℝ} (hR : R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ)
    {t : E3} {S : ℝ} (h : cubeLPAny R t S) :
    ∃ R' ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, cubeLP R' t S := by
  obtain ⟨hrow, k, ε, hε, hk⟩ := h
  have hε2 : ε * ε = 1 := by rcases hε with h | h <;> rw [h] <;> norm_num
  have hsε : ∀ a b c : ℝ, (a = 1 ∨ a = -1) → (b = 1 ∨ b = -1) → (c = 1 ∨ c = -1) →
      ∀ j, ![a, b, c] j = 1 ∨ ![a, b, c] j = -1 := fun a b c ha hb hc j => by
    fin_cases j <;> simpa
  have hmε : -ε = 1 ∨ -ε = -1 := by rcases hε with h | h <;> rw [h] <;> norm_num
  obtain ⟨π, s, hs, hπ0, hs0, hdet⟩ : ∃ π : Equiv.Perm (Fin 3), ∃ s : Fin 3 → ℝ,
      (∀ j, s j = 1 ∨ s j = -1) ∧ π 0 = k ∧ s 0 = ε ∧ (spm π s).det = 1 := by
    fin_cases k
    · refine ⟨1, ![ε, ε, 1], hsε _ _ _ hε hε (Or.inl rfl), rfl, rfl, ?_⟩
      simp [spm, Matrix.det_fin_three]; linear_combination hε2
    · refine ⟨Equiv.swap 0 1, ![ε, -ε, 1], hsε _ _ _ hε hmε (Or.inl rfl), by simp, rfl, ?_⟩
      simp [spm, Matrix.det_fin_three, Equiv.swap_apply_def]; linear_combination hε2
    · refine ⟨Equiv.swap 0 2, ![ε, 1, -ε], hsε _ _ _ hε (Or.inl rfl) hmε, by simp, rfl, ?_⟩
      simp [spm, Matrix.det_fin_three, Equiv.swap_apply_def]; linear_combination hε2
  have hh : spm π s ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ :=
    Matrix.mem_specialOrthogonalGroup_iff.2 ⟨spm_orth π s hs, hdet⟩
  refine ⟨R * spm π s, mul_mem hR hh, fun σ => by rw [gSup_mul_spm _ _ _ hs]; exact hrow σ, ?_⟩
  simp only [mul_spm_apply, hπ0, hs0]
  calc ∑ i, R i k * ε * t i = ε * ∑ i, R i k * t i := by
        rw [mul_sum]; exact sum_congr rfl fun i _ => by ring
    _ ≤ -(1 / 2) := hk

/-- **Reduction.** Two cubes fit in the octahedron of edge `s ≥ 0` ⇒ the LP of §8 (face `e₁`) is
feasible at `S = s·√2/2` for some rotation. -/
theorem cubinoct_reduction {s : ℝ} (hs : 0 ≤ s) (h : Fits cube oct 2 s) :
    ∃ R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, ∃ t : E3, cubeLP R t (s * (√2 / 2)) := by
  obtain ⟨R, hR, t, hany⟩ := cubinoct_reduction_any hs h
  obtain ⟨R', hR', hlp⟩ := cubeLP_of_any hR hany
  exact ⟨R', hR', t, hlp⟩

/-- **Lower bound from the LP.** If `S ≥ S* = 1 + √2/2` for every feasible `(R, t, S)`, then two cubes
fit in the octahedron of edge `s ≥ 0` only if `s ≥ s* = 1 + √2`.  (This is the second half of
`isMinEdge_iff` for `cubinoct_n02`; the hypothesis is what the box certificates are to prove.) -/
theorem cubinoct_lower_of_LP
    (hLP : ∀ R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, ∀ (t : E3) (S : ℝ),
      cubeLP R t S → 1 + √2 / 2 ≤ S)
    {s : ℝ} (hs : 0 ≤ s) (h : Fits cube oct 2 s) : 1 + √2 ≤ s := by
  obtain ⟨R, hR, t, hlp⟩ := cubinoct_reduction hs h
  have h1 := hLP R hR t _ hlp
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  have hpos : 0 < √2 := by positivity
  nlinarith [mul_le_mul_of_nonneg_left h1 hpos.le]

end

end PackLean.Formal
