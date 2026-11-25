import PackLean.Formal.CubinoctLocalCP
import PackLean.AxiomAudit

/-!
# D45 stage 3d: the upper bound of `cubinoct_n02` and the claim

Two cubes, each rotated by 45° about `e₁` and centred at `(∓1/2, 0, 0)`, fit in the octahedron of edge
`1 + √2`: every point of a placed cube has `‖x‖₁ ≤ 1 + √2/2 = (1 + √2)·√2/2`, and the cubes lie on the
two sides of the plane `x₀ = 0`.

* `l1_mem_smul_oct`: the ℓ¹ ball of radius `s·√2/2` lies in `s • oct` (the converse of `oct_subset`);
* `cubinoct_upper`: `Fits cube oct 2 (1 + √2)`;
* **`cubinoct_n02_proof : cubinoct_n02`** (with `cubinoct_lower` from the certificates).
-/

namespace PackLean.Formal.Up

open PackLean.Formal PackLean.Formal.Dom
open Finset
open scoped Pointwise

/-! ## The ℓ¹ ball lies in the octahedron -/

/-- A vertex `±(√2/2) e_k` of the octahedron. -/
noncomputable def ov (p : Fin 3 × Bool) : E3 :=
  EuclideanSpace.single p.1 (if p.2 then -(√2 / 2) else √2 / 2)

theorem ov_mem (p : Fin 3 × Bool) : ov p ∈ octV := by
  refine ⟨p.1, ?_, ?_⟩
  · simp only [ov, PiLp.single_apply, if_true]
    split_ifs <;> simp [abs_of_pos (by positivity : (0 : ℝ) < √2 / 2)]
  · intro j hj
    simp [ov, PiLp.single_apply, hj]

theorem l1_mem_oct {y : E3} (hy : ∑ i, |y i| ≤ √2 / 2) : y ∈ oct := by
  set r : ℝ := √2 / 2 with hr
  have hr0 : 0 < r := by positivity
  set δ : ℝ := (1 - (∑ i, |y i|) / r) / 6 with hδ
  have hδ0 : 0 ≤ δ := by
    rw [hδ]
    have : (∑ i, |y i|) / r ≤ 1 := (div_le_one hr0).2 hy
    linarith
  let w : Fin 3 × Bool → ℝ := fun p => (if p.2 then max (-y p.1) 0 else max (y p.1) 0) / r + δ
  have hw0 : ∀ p ∈ (univ : Finset (Fin 3 × Bool)), 0 ≤ w p := by
    intro p _
    have : 0 ≤ (if p.2 then max (-y p.1) 0 else max (y p.1) 0) / r := by
      split_ifs <;> positivity
    exact add_nonneg this hδ0
  have hmax : ∀ a : ℝ, max a 0 + max (-a) 0 = |a| := by
    intro a
    rcases le_total 0 a with h | h
    · rw [max_eq_left h, max_eq_right (by linarith), abs_of_nonneg h]; ring
    · rw [max_eq_right h, max_eq_left (by linarith), abs_of_nonpos h]; ring
  have hw1 : ∑ p ∈ (univ : Finset (Fin 3 × Bool)), w p = 1 := by
    simp only [w, Fintype.sum_prod_type, Fintype.sum_bool, Fin.sum_univ_three, if_true,
      Bool.false_eq_true, if_false]
    have h0 := hmax (y 0); have h1 := hmax (y 1); have h2 := hmax (y 2)
    rw [hδ, Fin.sum_univ_three]
    field_simp
    linarith
  have hmem := (convex_convexHull ℝ octV).sum_mem hw0 hw1
    (fun p _ => subset_convexHull ℝ octV (ov_mem p))
  have hy' : ∑ p ∈ (univ : Finset (Fin 3 × Bool)), w p • ov p = y := by
    ext j
    simp only [WithLp.ofLp_sum, WithLp.ofLp_smul, Finset.sum_apply, Pi.smul_apply, smul_eq_mul]
    simp only [w, ov, Fintype.sum_prod_type, Fintype.sum_bool, Fin.sum_univ_three, if_true,
      Bool.false_eq_true, if_false, PiLp.single_apply]
    have hmax2 : ∀ a : ℝ, max a 0 - max (-a) 0 = a := by
      intro a
      rcases le_total 0 a with h | h
      · rw [max_eq_left h, max_eq_right (by linarith)]; ring
      · rw [max_eq_right h, max_eq_left (by linarith)]; ring
    have key : ∀ a : ℝ, -((max (-a) 0 / r + δ) * (√2 / 2)) + (max a 0 / r + δ) * (√2 / 2) = a := by
      intro a
      rw [← hr]
      have := hmax2 a
      field_simp
      linarith
    fin_cases j <;> simp <;> exact key _
  rw [← hy']
  exact hmem

theorem l1_mem_smul_oct {s : ℝ} (hs : 0 < s) {x : E3} (hx : ∑ i, |x i| ≤ s * (√2 / 2)) :
    x ∈ s • oct := by
  refine Set.mem_smul_set.2 ⟨s⁻¹ • x, l1_mem_oct ?_, ?_⟩
  · simp only [PiLp.smul_apply, smul_eq_mul, abs_mul, abs_inv, abs_of_pos hs, ← mul_sum]
    rw [inv_mul_le_iff₀ hs]; exact hx
  · rw [smul_smul, mul_inv_cancel₀ hs.ne', one_smul]

/-! ## The rotation by 45° about `e₁` -/

/-- The rotation by 45° about `e₁`. -/
noncomputable def Q : M3 := !![1, 0, 0; 0, √2 / 2, -(√2 / 2); 0, √2 / 2, √2 / 2]

theorem h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)

theorem Q_SO : Q ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ := by
  rw [Matrix.mem_specialOrthogonalGroup_iff, Matrix.mem_orthogonalGroup_iff]
  constructor
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp [Q, Matrix.mul_apply, Fin.sum_univ_three, Matrix.one_apply] <;>
      linear_combination (1 / 2 : ℝ) * h2
  · simp [Q, Matrix.det_fin_three]
    linear_combination (1 / 2 : ℝ) * h2

theorem mv_Q (x : E3) : mv Q x = WithLp.toLp 2 ![x 0, √2 / 2 * (x 1 - x 2), √2 / 2 * (x 1 + x 2)] := by
  ext i
  fin_cases i <;> simp [mv, Q, Fin.sum_univ_three] <;> ring

/-- `Q` as a linear equivalence (inverse `Qᵀ`). -/
noncomputable def Qle : E3 ≃ₗ[ℝ] E3 where
  toFun := mv Q
  invFun := mv Q.transpose
  map_add' x y := by
    ext i; simp only [mv_apply, PiLp.add_apply, mul_add, sum_add_distrib]
  map_smul' a x := by
    ext i; simp only [mv_apply, PiLp.smul_apply, smul_eq_mul, RingHom.id_apply, mul_sum]
    exact sum_congr rfl fun j _ => by ring
  left_inv x := by
    ext i
    fin_cases i <;> simp [mv, Q, Fin.sum_univ_three, Matrix.transpose_apply] <;>
      (ring_nf; try simp only [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]; try ring_nf)
  right_inv x := by
    ext i
    fin_cases i <;> simp [mv, Q, Fin.sum_univ_three, Matrix.transpose_apply] <;>
      (ring_nf; try simp only [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]; try ring_nf)

theorem Qle_apply (x : E3) : Qle x = mv Q x := rfl

/-- `Q` as a linear isometry. -/
noncomputable def Qli : E3 ≃ₗᵢ[ℝ] E3 :=
  { Qle with
    norm_map' := by
      intro x
      change ‖mv Q x‖ = ‖x‖
      rw [EuclideanSpace.norm_eq, EuclideanSpace.norm_eq]
      congr 1
      simp only [mv_apply, Fin.sum_univ_three, Q, Real.norm_eq_abs, sq_abs]
      simp
      ring_nf
      simp only [Real.sq_sqrt (show (0 : ℝ) ≤ 2 by norm_num)]
      ring }

/-- The placement `x ↦ Q x + v`. -/
noncomputable def gv (v : E3) : Motion := Qli.toAffineIsometryEquiv.trans (AffineIsometryEquiv.constVAdd ℝ E3 v)

theorem gv_apply (v x : E3) (i : Fin 3) : gv v x i = ∑ j, Q i j * x j + v i := by
  change (v +ᵥ Qli x) i = _
  rw [vadd_eq_add, PiLp.add_apply, add_comm]
  rfl

theorem gv_proper (v : E3) : IsProper (gv v) :=
  (isProper_iff (gv v)).2 ⟨Q, Q_SO, v, fun x i => gv_apply v x i⟩

theorem gv_coords (v x : E3) : gv v x 0 = x 0 + v 0 ∧ gv v x 1 = √2 / 2 * (x 1 - x 2) + v 1 ∧
    gv v x 2 = √2 / 2 * (x 1 + x 2) + v 2 := by
  refine ⟨?_, ?_, ?_⟩ <;> rw [gv_apply] <;> simp [Q, Fin.sum_univ_three] <;> ring

theorem abs_pm (a b : ℝ) (ha : |a| ≤ 1 / 2) (hb : |b| ≤ 1 / 2) : |a - b| + |a + b| ≤ 1 := by
  rw [abs_le] at ha hb
  rcases abs_cases (a - b) with ⟨h1, _⟩ | ⟨h1, _⟩ <;> rcases abs_cases (a + b) with ⟨h2, _⟩ | ⟨h2, _⟩ <;>
    rw [h1, h2] <;> linarith

/-- The two centres `(∓1/2, 0, 0)`. -/
noncomputable def vA : E3 := EuclideanSpace.single 0 (-(1 / 2))
noncomputable def vB : E3 := EuclideanSpace.single 0 (1 / 2)

theorem vA_c : vA 0 = -(1 / 2) ∧ vA 1 = 0 ∧ vA 2 = 0 := by simp [vA, PiLp.single_apply]
theorem vB_c : vB 0 = 1 / 2 ∧ vB 1 = 0 ∧ vB 2 = 0 := by simp [vB, PiLp.single_apply]

theorem gv_sub {v : E3} (hv0 : |v 0| = 1 / 2) (hv1 : v 1 = 0) (hv2 : v 2 = 0) :
    gv v '' cube ⊆ (1 + √2) • oct := by
  rintro p ⟨y, hy, rfl⟩
  rw [cube_eq] at hy
  apply l1_mem_smul_oct (by positivity)
  obtain ⟨e0, e1, e2⟩ := gv_coords v y
  rw [Fin.sum_univ_three, e0, e1, e2, hv1, hv2, add_zero, add_zero, abs_mul, abs_mul,
    abs_of_pos (by positivity : (0 : ℝ) < √2 / 2)]
  have h0 : |y 0 + v 0| ≤ 1 := by
    calc |y 0 + v 0| ≤ |y 0| + |v 0| := abs_add_le _ _
      _ ≤ 1 / 2 + 1 / 2 := by rw [hv0]; linarith [hy 0]
      _ = 1 := by norm_num
  have h12 := abs_pm (y 1) (y 2) (hy 1) (hy 2)
  have hc : 0 < √2 / 2 := by positivity
  have : √2 / 2 * |y 1 - y 2| + √2 / 2 * |y 1 + y 2| ≤ √2 / 2 := by
    have := mul_le_mul_of_nonneg_left h12 hc.le
    linarith
  have e : (1 + √2) * (√2 / 2) = 1 + √2 / 2 := by linear_combination (1 / 2 : ℝ) * h2
  rw [e]
  linarith

/-! ## The two cubes have disjoint interiors -/

theorem disjoint_halves (A B : Set E3) (hA : ∀ p ∈ A, p 0 ≤ 0) (hB : ∀ p ∈ B, 0 ≤ p 0) :
    Disjoint (interior A) (interior B) := by
  rw [Set.disjoint_left]
  intro z hzA hzB
  obtain ⟨ε, hε, hballA⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzA)
  obtain ⟨δ, hδ, hballB⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzB)
  have hdist : ∀ c : ℝ, dist (z + EuclideanSpace.single 0 c) z = |c| := by
    intro c
    rw [dist_eq_norm, add_sub_cancel_left, PiLp.norm_single, Real.norm_eq_abs]
  have h1 := hA _ (hballA (show z + EuclideanSpace.single 0 (ε / 2) ∈ Metric.ball z ε by
    rw [Metric.mem_ball, hdist, abs_of_pos (by positivity)]; linarith))
  have h2 := hB _ (hballB (show z + EuclideanSpace.single 0 (-(δ / 2)) ∈ Metric.ball z δ by
    rw [Metric.mem_ball, hdist, abs_neg, abs_of_pos (by positivity)]; linarith))
  simp only [PiLp.add_apply, PiLp.single_apply, if_true] at h1 h2
  linarith

theorem gvA_left : ∀ p ∈ gv vA '' cube, p 0 ≤ 0 := by
  rintro p ⟨y, hy, rfl⟩
  rw [cube_eq] at hy
  rw [(gv_coords vA y).1, vA_c.1]
  linarith [(abs_le.1 (hy 0)).2]

theorem gvB_right : ∀ p ∈ gv vB '' cube, 0 ≤ p 0 := by
  rintro p ⟨y, hy, rfl⟩
  rw [cube_eq] at hy
  rw [(gv_coords vB y).1, vB_c.1]
  linarith [(abs_le.1 (hy 0)).1]

/-- **Upper bound of `cubinoct_n02`.** Two cubes fit in the octahedron of edge `1 + √2`. -/
theorem cubinoct_upper : Fits cube oct 2 (1 + √2) := by
  refine ⟨![gv vA, gv vB], fun i => ?_, fun i => ?_, fun i j hij => ?_⟩
  · fin_cases i <;> exact gv_proper _
  · fin_cases i
    · exact gv_sub (by rw [vA_c.1]; norm_num) vA_c.2.1 vA_c.2.2
    · exact gv_sub (by rw [vB_c.1]; norm_num) vB_c.2.1 vB_c.2.2
  · fin_cases i <;> fin_cases j
    · exact absurd rfl hij
    · exact disjoint_halves _ _ gvA_left gvB_right
    · exact (disjoint_halves _ _ gvA_left gvB_right).symm
    · exact absurd rfl hij

/-- **The claim `cubinoct_n02`**: `1 + √2` is the minimal edge of a regular octahedron holding two unit
cubes (rotations and translations). -/
theorem cubinoct_n02_proof : cubinoct_n02 :=
  ⟨⟨by positivity, cubinoct_upper⟩, fun _ hs => PackLean.Formal.Loc.cubinoct_lower hs.1 hs.2⟩

#print axioms cubinoct_upper
#print axioms cubinoct_n02_proof

-- E3a″: the claim rests on the standard axioms only (no `native_decide`).
#assert_std_axioms PackLean.Formal.Up.cubinoct_upper PackLean.Formal.Up.cubinoct_n02_proof

end PackLean.Formal.Up
