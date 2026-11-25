import PackLean.Formal.CubinoctLP
import PackLean.Formal.Polytope

/-!
# D45 stage 4g: the LP of a polytope piece in a polytope container

The general form of `CubinoctLP.lean` for the six cases of `D16.Core` (`plan/D45_s4_design.md` §2,
steps 1–4).  Everything is over the reals, for any finite lists of vectors (indexed by `ℕ` with a
count, as in `Polytope.lean`):

* `V l` (`l < nv`): points of the piece `K` (its vertices);
* `NK f` (`f < mk`) and `DK`: face normals and offset of the piece (`K` contains every point with
  `NK f · y < DK` for all `f` in its interior — `*_interior` of `PolytopeSolids.lean`);
* `NC j` (`j < mc`) and `σ`: face normals of the container `C` with `NC j · y ≤ σ` on `C`;
* `n0`: the fixed face of the piece.

The LP `polyLP V nv NC mc n0 D0 R t S`: every container face holds every placed vertex,
`NC j · (R V l + t) ≤ S`, and the face `n0` separates the origin, `(R n0) · t ≤ -D0`.

Results:
* `polyLP_weak`: weak duality (multipliers `λ ≥ 0` on rows with `Σ λ = 1`, `μ ≥ 0` on the face);
* `poly_reduction_any`: **Lemma R** — two copies fit in `s • C` ⇒ for some `R ∈ SO(3)` and `t` all
  rows hold with `S = σ s` and *some* face `NK f` separates;
* `poly_reduction`: with the **face orbit** (a rotation `h` of the piece permuting `V` with
  `h n0 = NK f`, for each `f`) the LP for the face `n0` is feasible;
* `poly_lower_of_LP`: a lower bound `S*` on every feasible `S` gives `S* ≤ σ s`;
* `polyLP_sym`: a **symmetry pair** — `g` orthogonal mapping the container normals into themselves,
  `k` mapping the vertices into themselves and fixing `n0` — maps feasible `(R, t)` to `(g R k, g t)`;
  `sym_mem_SO`: `g R k ∈ SO(3)` when `det g · det k = 1`;
* `polyLP_conj`: the LP for the piece rotated by `A` (the coordinates of the checkers, `A = R*`).
-/

namespace PackLean.Formal.PolyLP

open PackLean.Formal PackLean.Formal.Polytope Finset
open scoped Matrix Pointwise

noncomputable section

abbrev M3 : Type := Matrix (Fin 3) (Fin 3) ℝ

/-- `SO(3)`. -/
local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- A matrix applied to a vector of `E3`. -/
def mv (g : M3) (t : E3) : E3 := WithLp.toLp 2 (fun i => ∑ j, g i j * t j)

@[simp] theorem mv_apply (g : M3) (t : E3) (i : Fin 3) : mv g t i = ∑ j, g i j * t j := rfl

/-! ## Linear algebra of `mv` and `dot` -/

theorem mv_mul (A B : M3) (x : E3) : mv (A * B) x = mv A (mv B x) := by
  ext i
  simp only [mv_apply, Matrix.mul_apply, sum_mul, mul_sum]
  rw [sum_comm]
  exact sum_congr rfl fun _ _ => sum_congr rfl fun _ _ => by ring

theorem mv_one (x : E3) : mv 1 x = x := by
  ext i
  simp [mv_apply, Matrix.one_apply]

theorem dot_add (u x y : E3) : dot u (x + y) = dot u x + dot u y := by
  unfold dot
  rw [← sum_add_distrib]
  exact sum_congr rfl fun i _ => by simp only [PiLp.add_apply]; ring

theorem dot_smul (u x : E3) (c : ℝ) : dot u (c • x) = c * dot u x := by
  unfold dot
  rw [mul_sum]
  exact sum_congr rfl fun i _ => by simp only [PiLp.smul_apply, smul_eq_mul]; ring

/-- Moving a matrix across the dot product. -/
theorem dot_mv (u : E3) (A : M3) (x : E3) : dot u (mv A x) = dot (mv Aᵀ u) x := by
  unfold dot
  simp only [mv_apply, Matrix.transpose_apply, mul_sum, sum_mul]
  rw [sum_comm]
  exact sum_congr rfl fun _ _ => sum_congr rfl fun _ _ => by ring

theorem dot_mv_orth {g : M3} (hg : gᵀ * g = 1) (a b : E3) : dot (mv g a) (mv g b) = dot a b := by
  rw [dot_mv, ← mv_mul, hg, mv_one]

theorem mul_transpose_of {g : M3} (hg : gᵀ * g = 1) : g * gᵀ = 1 :=
  (Matrix.mem_orthogonalGroup_iff (Fin 3) ℝ).1 ((Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 hg)

/-! ## The LP -/

/-- The LP of the piece (points `V l`, `l < nv`, face `n0` with offset `D0`) in the container
(normals `NC j`, `j < mc`, offset `S`): rows `NC j · (R V l + t) ≤ S` and `(R n0) · t ≤ -D0`. -/
def polyLP (V : ℕ → E3) (nv : ℕ) (NC : ℕ → E3) (mc : ℕ) (n0 : E3) (D0 : ℝ) (R : M3) (t : E3)
    (S : ℝ) : Prop :=
  (∀ j < mc, ∀ l < nv, dot (NC j) (mv R (V l)) + dot (NC j) t ≤ S) ∧ dot (mv R n0) t ≤ -D0

theorem list_sum_le {β : Type*} (L : List β) (a b : β → ℝ) (h : ∀ x ∈ L, a x ≤ b x) :
    (L.map a).sum ≤ (L.map b).sum := by
  induction L with
  | nil => simp
  | cons x L ih =>
    simp only [List.map_cons, List.sum_cons]
    exact add_le_add (h x (by simp)) (ih fun y hy => h y (List.mem_cons_of_mem _ hy))

theorem list_sum_mul_right {β : Type*} (L : List β) (c : ℝ) (g : β → ℝ) :
    (L.map (fun t => g t * c)).sum = (L.map g).sum * c := by
  induction L with
  | nil => simp
  | cons t L ih => simp [List.sum_cons, ih, add_mul]

/-- **Weak duality.** Multipliers `λ ≥ 0` on rows `(j, l)` with `Σ λ = 1` and `μ ≥ 0` on the face:
`Σ λ · (NC j · R V l + NC j · t) + μ · (D0 + (R n0) · t) ≤ S`. -/
theorem polyLP_weak {V : ℕ → E3} {nv : ℕ} {NC : ℕ → E3} {mc : ℕ} {n0 : E3} {D0 : ℝ} {R : M3}
    {t : E3} {S : ℝ} (h : polyLP V nv NC mc n0 D0 R t S) (ts : List (ℕ × ℕ × ℝ))
    (hts : ∀ x ∈ ts, x.1 < mc ∧ x.2.1 < nv ∧ 0 ≤ x.2.2) (hsum : (ts.map fun x => x.2.2).sum = 1)
    {μ : ℝ} (hμ : 0 ≤ μ) :
    (ts.map fun x => x.2.2 * (dot (NC x.1) (mv R (V x.2.1)) + dot (NC x.1) t)).sum
      + μ * (D0 + dot (mv R n0) t) ≤ S := by
  obtain ⟨hrow, hface⟩ := h
  have h1 := list_sum_le ts (fun x => x.2.2 * (dot (NC x.1) (mv R (V x.2.1)) + dot (NC x.1) t))
    (fun x => x.2.2 * S) fun x hx => by
      obtain ⟨hj, hl, hlam⟩ := hts x hx
      exact mul_le_mul_of_nonneg_left (hrow _ hj _ hl) hlam
  rw [list_sum_mul_right, hsum, one_mul] at h1
  have h2 : μ * (D0 + dot (mv R n0) t) ≤ 0 := mul_nonpos_of_nonneg_of_nonpos hμ (by linarith)
  linarith

/-! ## Scale of the container -/

/-- If the container satisfies `NC j · y ≤ σ`, its copy of edge `s ≥ 0` satisfies `NC j · y ≤ σ s`. -/
theorem dot_le_of_mem_smul {C : Set E3} {NC : ℕ → E3} {mc : ℕ} {σ : ℝ}
    (hC : ∀ y ∈ C, ∀ j < mc, dot (NC j) y ≤ σ) {s : ℝ} (hs : 0 ≤ s) {y : E3} (hy : y ∈ s • C) :
    ∀ j < mc, dot (NC j) y ≤ σ * s := by
  obtain ⟨c, hc, rfl⟩ := Set.mem_smul_set.1 hy
  intro j hj
  rw [dot_smul]
  have := mul_le_mul_of_nonneg_left (hC c hc j hj) hs
  linarith

/-! ## Lemma R and the face orbit -/

/-- A placement is `x ↦ R x + t` with `R = rotMat g`, `t = g 0`. -/
theorem motion_eq_mv (g : Motion) (x : E3) : g x = mv (rotMat g) x + g 0 := by
  ext i
  rw [motion_apply_coord, PiLp.add_apply, mv_apply]

theorem rotMat_mem_SO {g : Motion} (hg : IsProper g) : rotMat g ∈ SO3 := by
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  exact ⟨rotMat_mem_orthogonal g, (isProper_iff_det g).1 hg⟩

/-- `g⁻¹ 0 · n = -(R n) · t`. -/
theorem dot_symm_zero (g : Motion) (n : E3) : dot n (g.symm 0) = -dot (mv (rotMat g) n) (g 0) := by
  unfold dot
  simp only [symm_zero_coord, mv_apply, mul_neg, sum_neg_distrib, neg_inj, mul_sum, sum_mul]
  rw [sum_comm]
  exact sum_congr rfl fun _ _ => sum_congr rfl fun _ _ => by ring

/-- **Lemma R (any face).** Two copies of `K` fit in `s • C` ⇒ for some `R ∈ SO(3)` and `t` every
row holds with `S = σ s` and some face `NK f` of the piece separates the origin. -/
theorem poly_reduction_any {K C : Set E3} {V : ℕ → E3} {nv : ℕ} {NK : ℕ → E3} {mk : ℕ} {DK : ℝ}
    {NC : ℕ → E3} {mc : ℕ} {σ : ℝ}
    (hV : ∀ l < nv, V l ∈ K)
    (hint : ∀ y : E3, (∀ f < mk, dot (NK f) y < DK) → y ∈ interior K)
    (hC : ∀ y ∈ C, ∀ j < mc, dot (NC j) y ≤ σ) {s : ℝ} (hs : 0 ≤ s) (h : Fits K C 2 s) :
    ∃ R ∈ SO3, ∃ t : E3, (∀ j < mc, ∀ l < nv, dot (NC j) (mv R (V l)) + dot (NC j) t ≤ σ * s) ∧
      ∃ f < mk, dot (mv R (NK f)) t ≤ -DK := by
  obtain ⟨g, hg, hin, h0⟩ := fits_two_imp h
  refine ⟨rotMat g, rotMat_mem_SO hg, g 0, fun j hj l hl => ?_, ?_⟩
  · have := dot_le_of_mem_smul hC hs (hin ⟨V l, hV l hl, rfl⟩) j hj
    rwa [motion_eq_mv, dot_add] at this
  · by_contra hcon
    push Not at hcon
    apply h0
    have hy : g.symm 0 ∈ interior K := hint _ fun f hf => by
      rw [dot_symm_zero]; linarith [hcon f hf]
    have himg := g.toHomeomorph.image_interior K
    simp only [AffineIsometryEquiv.coe_toHomeomorph] at himg
    rw [← himg]
    exact ⟨g.symm 0, hy, g.apply_symm_apply 0⟩

/-- **Lemma R with the face orbit.** If for each face `f` a rotation `h` of the piece maps the
points into themselves and `n0` to `NK f`, two copies fit in `s • C` ⇒ the LP for the face `n0` is
feasible at `S = σ s` for some `R ∈ SO(3)`. -/
theorem poly_reduction {K C : Set E3} {V : ℕ → E3} {nv : ℕ} {NK : ℕ → E3} {mk : ℕ} {DK : ℝ}
    {NC : ℕ → E3} {mc : ℕ} {σ : ℝ} {n0 : E3}
    (hV : ∀ l < nv, V l ∈ K)
    (hint : ∀ y : E3, (∀ f < mk, dot (NK f) y < DK) → y ∈ interior K)
    (hC : ∀ y ∈ C, ∀ j < mc, dot (NC j) y ≤ σ)
    (horb : ∀ f < mk, ∃ h ∈ SO3, (∀ l < nv, ∃ l' < nv, mv h (V l) = V l') ∧ mv h n0 = NK f)
    {s : ℝ} (hs : 0 ≤ s) (hfit : Fits K C 2 s) :
    ∃ R ∈ SO3, ∃ t : E3, polyLP V nv NC mc n0 DK R t (σ * s) := by
  obtain ⟨R, hR, t, hrow, f, hf, hface⟩ := poly_reduction_any hV hint hC hs hfit
  obtain ⟨h, hh, hperm, hn0⟩ := horb f hf
  refine ⟨R * h, mul_mem hR hh, t, fun j hj l hl => ?_, ?_⟩
  · obtain ⟨l', hl', he⟩ := hperm l hl
    rw [mv_mul, he]
    exact hrow j hj l' hl'
  · rw [mv_mul, hn0]
    exact hface

/-- **Lower bound from the LP.** If `S* ≤ S` for every feasible `(R, t, S)`, then two copies fit in
`s • C` (`s ≥ 0`) only if `S* ≤ σ s`. -/
theorem poly_lower_of_LP {K C : Set E3} {V : ℕ → E3} {nv : ℕ} {NK : ℕ → E3} {mk : ℕ} {DK : ℝ}
    {NC : ℕ → E3} {mc : ℕ} {σ : ℝ} {n0 : E3} {Sstar : ℝ}
    (hV : ∀ l < nv, V l ∈ K)
    (hint : ∀ y : E3, (∀ f < mk, dot (NK f) y < DK) → y ∈ interior K)
    (hC : ∀ y ∈ C, ∀ j < mc, dot (NC j) y ≤ σ)
    (horb : ∀ f < mk, ∃ h ∈ SO3, (∀ l < nv, ∃ l' < nv, mv h (V l) = V l') ∧ mv h n0 = NK f)
    (hLP : ∀ R ∈ SO3, ∀ (t : E3) (S : ℝ), polyLP V nv NC mc n0 DK R t S → Sstar ≤ S)
    {s : ℝ} (hs : 0 ≤ s) (hfit : Fits K C 2 s) : Sstar ≤ σ * s := by
  obtain ⟨R, hR, t, hlp⟩ := poly_reduction hV hint hC horb hs hfit
  exact hLP R hR t _ hlp

/-! ## Symmetry pairs -/

/-- An orthogonal `g` that maps the finite list of normals into itself maps it onto itself, so
`gᵀ` maps it into itself as well. -/
theorem transpose_maps {g : M3} (hg : gᵀ * g = 1) {NC : ℕ → E3} {mc : ℕ}
    (hgN : ∀ j < mc, ∃ j' < mc, mv g (NC j) = NC j') :
    ∀ j < mc, ∃ j' < mc, mv gᵀ (NC j) = NC j' := by
  set T : Set E3 := (fun j => NC j) '' {j | j < mc}
  have hT : T.Finite := (Set.finite_lt_nat mc).image _
  have hm : Set.MapsTo (mv g) T T := by
    rintro _ ⟨j, hj, rfl⟩
    obtain ⟨j', hj', he⟩ := hgN j hj
    exact ⟨j', hj', he.symm⟩
  have hinj : Set.InjOn (mv g) T := fun x _ y _ hxy => by
    have := congrArg (mv gᵀ) hxy
    rwa [← mv_mul, ← mv_mul, hg, mv_one, mv_one] at this
  have hbij := (hT.injOn_iff_bijOn_of_mapsTo hm).1 hinj
  intro j hj
  obtain ⟨x, ⟨j', hj', rfl⟩, hx⟩ := hbij.surjOn ⟨j, hj, rfl⟩
  refine ⟨j', hj', ?_⟩
  simp only at hx
  rw [← hx, ← mv_mul, hg, mv_one]

/-- **Symmetry pair.** `g` orthogonal mapping the container normals into themselves, `k` mapping the
points of the piece into themselves and fixing `n0`: a feasible `(R, t)` gives a feasible
`(g R k, g t)` with the same `S`. -/
theorem polyLP_sym {V : ℕ → E3} {nv : ℕ} {NC : ℕ → E3} {mc : ℕ} {n0 : E3} {D0 : ℝ} {g k : M3}
    (hg : gᵀ * g = 1) (hgN : ∀ j < mc, ∃ j' < mc, mv g (NC j) = NC j')
    (hk : ∀ l < nv, ∃ l' < nv, mv k (V l) = V l') (hk0 : mv k n0 = n0)
    {R : M3} {t : E3} {S : ℝ} (h : polyLP V nv NC mc n0 D0 R t S) :
    polyLP V nv NC mc n0 D0 (g * R * k) (mv g t) S := by
  obtain ⟨hrow, hface⟩ := h
  have hgT := transpose_maps hg hgN
  have hgg : gᵀᵀ * gᵀ = 1 := by rw [Matrix.transpose_transpose]; exact mul_transpose_of hg
  refine ⟨fun j hj l hl => ?_, ?_⟩
  · obtain ⟨j', hj', hej⟩ := hgT j hj
    obtain ⟨l', hl', hel⟩ := hk l hl
    have e1 : mv (g * R * k) (V l) = mv g (mv R (V l')) := by rw [mv_mul, mv_mul, hel]
    rw [e1, dot_mv, dot_mv (NC j) g, hej]
    exact hrow j' hj' l' hl'
  · rw [mv_mul, mv_mul, hk0, dot_mv_orth hg]
    exact hface

/-- `g R k ∈ SO(3)` for orthogonal `g`, `k` with `det g · det k = 1` and `R ∈ SO(3)`. -/
theorem sym_mem_SO {g k R : M3} (hg : gᵀ * g = 1) (hk : kᵀ * k = 1) (hdet : g.det * k.det = 1)
    (hR : R ∈ SO3) : g * R * k ∈ SO3 := by
  rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff'] at hR ⊢
  refine ⟨?_, ?_⟩
  · rw [Matrix.transpose_mul, Matrix.transpose_mul]
    calc kᵀ * (Rᵀ * gᵀ) * (g * R * k) = kᵀ * (Rᵀ * (gᵀ * g) * R) * k := by
          simp only [Matrix.mul_assoc]
      _ = 1 := by rw [hg, Matrix.mul_one, hR.1, Matrix.mul_one, hk]
  · rw [Matrix.det_mul, Matrix.det_mul, hR.2, mul_one, hdet]

/-! ## The coordinates of the checkers -/

/-- The LP for the piece in its own coordinates, at `R`, is the LP for the piece rotated by `A`
(points `A V l`, face `A n0`), at `R Aᵀ`. -/
theorem polyLP_conj {V : ℕ → E3} {nv : ℕ} {NC : ℕ → E3} {mc : ℕ} {n0 : E3} {D0 : ℝ} {A : M3}
    (hA : Aᵀ * A = 1) {R : M3} {t : E3} {S : ℝ} (h : polyLP V nv NC mc n0 D0 R t S) :
    polyLP (fun l => mv A (V l)) nv NC mc (mv A n0) D0 (R * Aᵀ) t S := by
  have e : ∀ x, mv (R * Aᵀ) (mv A x) = mv R x := fun x => by
    rw [← mv_mul, Matrix.mul_assoc, hA, Matrix.mul_one]
  obtain ⟨hrow, hface⟩ := h
  exact ⟨fun j hj l hl => by simp only [e]; exact hrow j hj l hl, by rw [e]; exact hface⟩

/-- `R Aᵀ ∈ SO(3)` for `R, A ∈ SO(3)`. -/
theorem mul_transpose_mem_SO {R A : M3} (hR : R ∈ SO3) (hA : A ∈ SO3) : R * Aᵀ ∈ SO3 := by
  rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff'] at hR hA ⊢
  refine ⟨?_, ?_⟩
  · rw [Matrix.transpose_mul, Matrix.transpose_transpose]
    calc A * Rᵀ * (R * Aᵀ) = A * (Rᵀ * R) * Aᵀ := by simp only [Matrix.mul_assoc]
      _ = 1 := by rw [hR.1, Matrix.mul_one]; exact mul_transpose_of hA.1
  · rw [Matrix.det_mul, Matrix.det_transpose, hR.2, hA.2, mul_one]

/-- Any feasible point of the LP in the checkers' coordinates comes from one in the piece's own
coordinates and back: `polyLP_conj` with `Aᵀ` undoes `polyLP_conj` with `A`. -/
theorem polyLP_conj_iff {V : ℕ → E3} {nv : ℕ} {NC : ℕ → E3} {mc : ℕ} {n0 : E3} {D0 : ℝ} {A : M3}
    (hA : Aᵀ * A = 1) {R : M3} {t : E3} {S : ℝ} :
    polyLP V nv NC mc n0 D0 R t S ↔ polyLP (fun l => mv A (V l)) nv NC mc (mv A n0) D0 (R * Aᵀ) t S := by
  refine ⟨polyLP_conj hA, fun h => ?_⟩
  have hA' : Aᵀᵀ * Aᵀ = 1 := by rw [Matrix.transpose_transpose]; exact mul_transpose_of hA
  have h2 := polyLP_conj hA' h
  have e : ∀ x, mv Aᵀ (mv A x) = x := fun x => by rw [← mv_mul, hA, mv_one]
  simp only [e, Matrix.transpose_transpose, Matrix.mul_assoc, hA, Matrix.mul_one] at h2
  exact h2

end

#assert_std_axioms PackLean.Formal.PolyLP.polyLP_weak PackLean.Formal.PolyLP.poly_reduction
  PackLean.Formal.PolyLP.poly_lower_of_LP PackLean.Formal.PolyLP.polyLP_sym
  PackLean.Formal.PolyLP.sym_mem_SO PackLean.Formal.PolyLP.polyLP_conj_iff

end PackLean.Formal.PolyLP
