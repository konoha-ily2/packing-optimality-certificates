import PackLean.Formal.TetSep
import PackLean.Formal.UpperG
import PackLean.Formal.PolytopeSolids
import PackLean.Formal.TetData

/-!
# A9 stage 7a: the reduction for the tetrahedral container

Design: `plan/A9f_tet_design.md` §2–3.  The pieces of `TetSep.lean` (T1 `fits_two_sep`, the dual
bound `top_bound`, `sum_bound`, `exists_chamber`) are put together here.

* **The container.**  `tet_eq_bT`: the tetrahedron of `Spec` is `{x | ∀ f, b_f · x ≤ √2/4}` (both
  directions, from the certificate `tetCert` of `TetData.lean` and `tet_Vs`), so
  `s • tet = {x | ∀ f, b_f · x ≤ s √2/4}`; `tet_interior`: its interior is not empty.
* **The rows of a placement.**  `Rows V nv c n h R t`: every placed vertex `R V l + t` satisfies the
  four container rows `b_f · x ≤ c` and lies below the plane `n · x ≤ h`.  `Rows` is moved by a
  symmetry of the container (`rows_sym`), is positively homogeneous in `(n, h)` (`rows_scale`), and
  is kept by a symmetry of the piece (`rows_perm`).
* **The representative of largest trace.**  `Krot V nv`: rotations of the piece mapping its vertices
  into themselves; `MaxRep V nv R`: `tr(R k) ≤ tr(R)` for every such `k`; `exists_maxRep`: every `R`
  has a representative `R k` with `MaxRep`.
* **The certificate.**  `Low V nv cb p R κ`: at the direction `p` and the rotation `R` the dual bound
  (one choice of weights `μ` and vertices) is at least `κ` at the scale `cb`, or the four rows are
  inconsistent (`Σ_f b_f · R v_f > 4 cb`).  `TetCert V nv cb`: every point `p = (x, y, 1)` of the
  upper half of `D_n` has a pair `κ_A + κ_B ≥ 0` with `κ_A` a bound at `p` and `κ_B` at
  `σp = (x, -y, 1)`, for every `R ∈ SO(3)` with `MaxRep`.
* **`tet_lower`**: `TetCert V nv cb` ⇒ two copies of the piece fit in `s • tet` only if
  `cb ≤ s √2/4`.
* **`tet_upper`**: two placements `A_i x + T_i` of the vertices in the four rows at `c`, on the two
  sides of a plane ⇒ two copies fit at `c / (√2/4)`.
* **Scale** (`low_scale`, `krot_scale`, `maxRep_scale`, `tetCert_of_scale`): the checkers of
  `tetintet` use the piece scaled by `√2`.
-/

namespace PackLean.Formal.TetReduction

open PackLean.Formal PackLean.Formal.Polytope PackLean.Formal.PolyLP PackLean.Formal.Orbit
  PackLean.Formal.TetSep PackLean.Formal.FieldSem Finset
open PackLean.Formal.UpperG (place place_apply place_proper orth_of_SO hull_le mem_smul_of_le
  dot_self_eq dot_neg_left)
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## 1. The container: the tetrahedron of `Spec` as four half-spaces -/

theorem tet_ok : certOk tetCert = true := by decide +kernel

theorem tetCert_len : tetCert.verts.length = 4 := rfl

theorem tet_V0 : tetCert.V 0 = !₂[√2 / 4, √2 / 4, √2 / 4] := by
  refine eq_of_coords ?_ ?_ ?_ <;>
    simp [Cert.V, Cert.vert, tetCert_verts, tetCert_ps, tetCert_dv, tetVerts, vec_apply, ent,
      fval_sqrt2]

theorem tet_V1 : tetCert.V 1 = !₂[√2 / 4, -(√2 / 4), -(√2 / 4)] := by
  refine eq_of_coords ?_ ?_ ?_ <;>
    simp [Cert.V, Cert.vert, tetCert_verts, tetCert_ps, tetCert_dv, tetVerts, vec_apply, ent,
      fval_sqrt2] <;> ring

theorem tet_V2 : tetCert.V 2 = !₂[-(√2 / 4), √2 / 4, -(√2 / 4)] := by
  refine eq_of_coords ?_ ?_ ?_ <;>
    simp [Cert.V, Cert.vert, tetCert_verts, tetCert_ps, tetCert_dv, tetVerts, vec_apply, ent,
      fval_sqrt2] <;> ring

theorem tet_V3 : tetCert.V 3 = !₂[-(√2 / 4), -(√2 / 4), √2 / 4] := by
  refine eq_of_coords ?_ ?_ ?_ <;>
    simp [Cert.V, Cert.vert, tetCert_verts, tetCert_ps, tetCert_dv, tetVerts, vec_apply, ent,
      fval_sqrt2] <;> ring

/-- The vertices of the certificate are the vertices of `Spec.tet`. -/
theorem tet_Vs : tetCert.Vs = tetV := by
  ext x
  simp only [tetV, Set.mem_insert_iff, Set.mem_singleton_iff]
  constructor
  · rintro ⟨l, hl, rfl⟩
    rw [tetCert_len] at hl
    interval_cases l
    · exact Or.inl tet_V0
    · exact Or.inr (Or.inl tet_V1)
    · exact Or.inr (Or.inr (Or.inl tet_V2))
    · exact Or.inr (Or.inr (Or.inr tet_V3))
  · rintro (rfl | rfl | rfl | rfl)
    · exact ⟨0, by rw [tetCert_len]; norm_num, tet_V0.symm⟩
    · exact ⟨1, by rw [tetCert_len]; norm_num, tet_V1.symm⟩
    · exact ⟨2, by rw [tetCert_len]; norm_num, tet_V2.symm⟩
    · exact ⟨3, by rw [tetCert_len]; norm_num, tet_V3.symm⟩

theorem tet_D : tetCert.D = 1 / 8 := by
  simp [Cert.D, tetCert, fval_sqrt2]

/-- The normals of the certificate are `(√2/4) b_f` (in the order `b₂, b₃, b₀, b₁`). -/
theorem tet_N (x : E3) :
    dot (tetCert.N 0) x = √2 / 4 * dot (bT 2) x ∧ dot (tetCert.N 1) x = √2 / 4 * dot (bT 3) x ∧
      dot (tetCert.N 2) x = √2 / 4 * dot (bT 0) x ∧ dot (tetCert.N 3) x = √2 / 4 * dot (bT 1) x := by
  refine ⟨?_, ?_, ?_, ?_⟩ <;>
    simp [dot, Cert.N, Cert.nrm, tetCert, vec_apply, ent, fval_sqrt2, bT, Fin.sum_univ_three] <;>
    ring

theorem sqrt2_quarter_sq : √2 / 4 * (√2 / 4) = 1 / 8 := by
  rw [div_mul_div_comm, Real.mul_self_sqrt (by norm_num)]; norm_num

/-- **The tetrahedron of `Spec` as four half-spaces.** -/
theorem tet_eq_bT : tet = {x | ∀ f, dot (bT f) x ≤ √2 / 4} := by
  rw [tet, ← tet_Vs, hull_eq_of_ok tet_ok]
  have hlen : tetCert.normals.length = 4 := rfl
  have hpos : (0 : ℝ) < √2 / 4 := by positivity
  ext x
  obtain ⟨e0, e1, e2, e3⟩ := tet_N x
  have hf : ∀ f : Fin 4, ∃ j < 4, dot (tetCert.N j) x = √2 / 4 * dot (bT f) x := by
    intro f
    fin_cases f
    exacts [⟨2, by norm_num, e2⟩, ⟨3, by norm_num, e3⟩, ⟨0, by norm_num, e0⟩, ⟨1, by norm_num, e1⟩]
  have hb : ∀ j < 4, ∃ f : Fin 4, dot (tetCert.N j) x = √2 / 4 * dot (bT f) x := by
    intro j hj
    interval_cases j
    exacts [⟨2, e0⟩, ⟨3, e1⟩, ⟨0, e2⟩, ⟨1, e3⟩]
  simp only [Set.mem_ofPred_eq, hlen, tet_D]
  constructor
  · intro h f
    obtain ⟨j, hj, e⟩ := hf f
    have := h j hj
    rw [e, ← sqrt2_quarter_sq] at this
    exact le_of_mul_le_mul_left this hpos
  · intro h j hj
    obtain ⟨f, e⟩ := hb j hj
    rw [e, ← sqrt2_quarter_sq]
    exact mul_le_mul_of_nonneg_left (h f) hpos.le

/-- The interior of the tetrahedron is not empty (it contains `0`). -/
theorem tet_interior : (interior tet).Nonempty := by
  refine ⟨0, ?_⟩
  rw [tet, ← tet_Vs]
  refine interior_of_ok tet_ok fun f _ => ?_
  rw [tet_D]
  simp [dot]

/-- The rows on the tetrahedron (indexed by `ℕ`, for `PolyLP.dot_le_of_mem_smul`). -/
theorem tet_rows : ∀ y ∈ tet, ∀ j < 4, dot (bN j) y ≤ √2 / 4 := by
  intro y hy j hj
  rw [tet_eq_bT] at hy
  rw [show bN j = bT ⟨j, hj⟩ from bN_eq ⟨j, hj⟩]
  exact hy _

/-- The four rows describe the tetrahedron (for `UpperG.mem_smul_of_le`). -/
theorem tet_hC : ∀ y : E3, (∀ j < 4, dot (bN j) y ≤ √2 / 4) → y ∈ tet := by
  intro y hy
  rw [tet_eq_bT]
  intro f
  have := hy f f.isLt
  rwa [bN_eq] at this

/-! ## 2. The rows of a placement -/

/-- The placed piece `R V l + t` (`l < nv`) satisfies the four container rows at `c` and lies below
the plane `n · x ≤ h`. -/
def Rows (V : ℕ → E3) (nv : ℕ) (c : ℝ) (n : E3) (h : ℝ) (R : M3) (t : E3) : Prop :=
  ∀ l < nv, (∀ f, dot (bT f) (mv R (V l)) + dot (bT f) t ≤ c) ∧ dot n (mv R (V l)) + dot n t ≤ h

variable {V : ℕ → E3} {nv : ℕ}

theorem dot_smul_left (a : ℝ) (u x : E3) : dot (a • u) x = a * dot u x := by
  unfold dot
  rw [mul_sum]
  exact sum_congr rfl fun i _ => by simp only [PiLp.smul_apply, smul_eq_mul]; ring

theorem mv_neg (g : M3) (x : E3) : mv g (-x) = -mv g x := by
  ext i
  simp [mv_apply, mul_neg, sum_neg_distrib]

theorem mv_smul (R : M3) (τ : ℝ) (v : E3) : mv R (τ • v) = τ • mv R v := by
  ext i
  simp only [mv_apply, PiLp.smul_apply, smul_eq_mul, mul_sum]
  exact sum_congr rfl fun _ _ => by ring

/-- A placement in `s • tet` below the plane `n · x ≤ h` gives the rows at `c = (√2/4) s`. -/
theorem rows_of_fit {K : Set E3} (hV : ∀ l < nv, V l ∈ K) {g : Motion} {s : ℝ} (hs : 0 ≤ s)
    (hin : g '' K ⊆ s • tet) {n : E3} {h : ℝ} (hsep : ∀ x ∈ K, dot n (g x) ≤ h) :
    Rows V nv (√2 / 4 * s) n h (rotMat g) (g 0) := by
  intro l hl
  refine ⟨fun f => ?_, ?_⟩
  · have := dot_le_of_mem_smul tet_rows hs (hin ⟨V l, hV l hl, rfl⟩) f f.isLt
    rwa [motion_eq_mv, dot_add, bN_eq] at this
  · have := hsep _ (hV l hl)
    rwa [motion_eq_mv, dot_add] at this

/-- **Moving by a symmetry.**  `g` a symmetry of the container, `k` mapping the vertices into
themselves: `Rows c n h R t ⇒ Rows c (g n) h (g R k) (g t)`. -/
theorem rows_sym {c h : ℝ} {n : E3} {R : M3} {t : E3} {g k : M3} (hg : g ∈ Gset bN 4)
    (hk : ∀ l < nv, ∃ l' < nv, mv k (V l) = V l') (hr : Rows V nv c n h R t) :
    Rows V nv c (mv g n) h (g * R * k) (mv g t) := by
  have hgT := transpose_maps hg.1 hg.2
  intro l hl
  obtain ⟨l', hl', hel⟩ := hk l hl
  have e1 : mv (g * R * k) (V l) = mv g (mv R (V l')) := by rw [mv_mul, mv_mul, hel]
  obtain ⟨hrow, htop⟩ := hr l' hl'
  refine ⟨fun f => ?_, ?_⟩
  · obtain ⟨j', hj', hej⟩ := hgT f f.isLt
    rw [e1, dot_mv, dot_mv (bT f) g, ← bN_eq, hej, show bN j' = bT ⟨j', hj'⟩ from bN_eq ⟨j', hj'⟩]
    exact hrow _
  · rw [e1, dot_mv_orth hg.1, dot_mv_orth hg.1]
    exact htop

/-- `Rows` is positively homogeneous in `(n, h)`. -/
theorem rows_scale {c h τ : ℝ} {n : E3} {R : M3} {t : E3} (hτ : 0 ≤ τ) (hr : Rows V nv c n h R t) :
    Rows V nv c (τ • n) (τ * h) R t := fun l hl =>
  ⟨(hr l hl).1, by
    rw [dot_smul_left, dot_smul_left, ← mul_add]
    exact mul_le_mul_of_nonneg_left (hr l hl).2 hτ⟩

/-- A symmetry of the piece keeps the rows. -/
theorem rows_perm {c h : ℝ} {n : E3} {R : M3} {t : E3} {k : M3}
    (hk : ∀ l < nv, ∃ l' < nv, mv k (V l) = V l') (hr : Rows V nv c n h R t) :
    Rows V nv c n h (R * k) t := by
  have := rows_sym (one_mem_G (NC := bN) (mc := 4)) hk hr
  rwa [mv_one, mv_one, Matrix.one_mul] at this

/-! ## 3. The representative of largest trace -/

/-- Rotations of the piece mapping its vertices into themselves. -/
def Krot (V : ℕ → E3) (nv : ℕ) : Set M3 :=
  {k | kᵀ * k = 1 ∧ k.det = 1 ∧ ∀ l < nv, ∃ l' < nv, mv k (V l) = V l'}

/-- `R` has the largest trace in its orbit under the rotations of the piece. -/
def MaxRep (V : ℕ → E3) (nv : ℕ) (R : M3) : Prop :=
  ∀ k ∈ Krot V nv, (R * k).trace ≤ R.trace

theorem krot_SO {k : M3} (hk : k ∈ Krot V nv) : k ∈ SO3 :=
  Matrix.mem_specialOrthogonalGroup_iff.2 ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 hk.1, hk.2.1⟩

theorem one_mem_Krot : (1 : M3) ∈ Krot V nv :=
  ⟨by simp, by simp, fun l hl => ⟨l, hl, mv_one _⟩⟩

theorem mul_mem_Krot {k k' : M3} (hk : k ∈ Krot V nv) (hk' : k' ∈ Krot V nv) :
    k * k' ∈ Krot V nv := by
  refine ⟨?_, by rw [Matrix.det_mul, hk.2.1, hk'.2.1, one_mul], fun l hl => ?_⟩
  · rw [Matrix.transpose_mul]
    calc k'ᵀ * kᵀ * (k * k') = k'ᵀ * (kᵀ * k) * k' := by simp only [Matrix.mul_assoc]
      _ = 1 := by rw [hk.1, Matrix.mul_one, hk'.1]
  · obtain ⟨l1, hl1, e1⟩ := hk'.2.2 l hl
    obtain ⟨l2, hl2, e2⟩ := hk.2.2 l1 hl1
    exact ⟨l2, hl2, by rw [mv_mul, e1, e2]⟩

theorem isCompact_Krot : IsCompact (Krot V nv) := by
  refine isCompact_Box.of_isClosed_subset ?_ fun _ hk => orth_mem_Box hk.1
  exact isClosed_orth.inter
    ((isClosed_eq continuous_id.matrix_det continuous_const).inter (isClosed_maps V nv))

/-- **The representative of largest trace.** Every `R` has `R k` (`k ∈ Krot`) with `MaxRep`. -/
theorem exists_maxRep (R : M3) : ∃ k ∈ Krot V nv, MaxRep V nv (R * k) := by
  have hc : IsCompact ((fun k => R * k) '' Krot V nv) :=
    isCompact_Krot.image (continuous_const.matrix_mul continuous_id)
  obtain ⟨Q, ⟨k, hk, rfl⟩, hmax⟩ := hc.exists_isMaxOn ⟨R * 1, 1, one_mem_Krot, rfl⟩
    (continuous_id.matrix_trace).continuousOn
  refine ⟨k, hk, fun k' hk' => ?_⟩
  have := hmax ⟨k * k', mul_mem_Krot hk hk', rfl⟩
  simpa [Matrix.mul_assoc] using this

/-! ## 4. The certificate and the lower bound -/

/-- At the direction `p` and the rotation `R`, `κ` is a lower bound of the plane offset at the
container scale `cb`: one choice of weights and vertices (types F and M), or the four rows are
inconsistent (type S). -/
def Low (V : ℕ → E3) (nv : ℕ) (cb : ℝ) (p : E3) (R : M3) (κ : ℝ) : Prop :=
  (∃ μ : ℝ, ∃ l0 < nv, ∃ lf : Fin 4 → ℕ, (∀ f, lf f < nv) ∧ (∀ f, dot p (bT f) ≤ μ) ∧
      κ ≤ dot p (mv R (V l0)) + 1 / 4 * ∑ f, (μ - dot p (bT f)) * dot (bT f) (mv R (V (lf f)))
        - cb * μ)
  ∨ (∃ lf : Fin 4 → ℕ, (∀ f, lf f < nv) ∧ 4 * cb < ∑ f, dot (bT f) (mv R (V (lf f))))

/-- **What a checker proves** (pairs over the upper half of `D_n`). -/
def TetCert (V : ℕ → E3) (nv : ℕ) (cb : ℝ) : Prop :=
  ∀ x y : ℝ, 0 ≤ y → y ≤ x → x ≤ 1 → ∃ κA κB : ℝ, 0 ≤ κA + κB ∧
    (∀ R ∈ SO3, MaxRep V nv R → Low V nv cb !₂[x, y, 1] R κA) ∧
    (∀ R ∈ SO3, MaxRep V nv R → Low V nv cb !₂[x, -y, 1] R κB)

/-- A bound at the scale `cb` is a strict bound for a placement at a smaller scale `c`. -/
theorem low_lt {p : E3} (hp : p 2 = 1) {cb c κ h : ℝ} {R : M3} {t : E3}
    (hL : Low V nv cb p R κ) (hr : Rows V nv c p h R t) (hc : c < cb) : κ < h := by
  rcases hL with ⟨μ, l0, hl0, lf, hlf, hμ, hκ⟩ | ⟨lf, hlf, hS⟩
  · have hb := top_bound (R := R) (t := t) (vf := fun f => V (lf f))
      (fun f => (hr (lf f) (hlf f)).1 f) (hr l0 hl0).2 hμ
    have h12 : dot p (bT 1) + dot p (bT 2) = 2 * p 2 := by
      simp [dot, bT, Fin.sum_univ_three]; ring
    have hμ1 : 1 ≤ μ := by linarith [hμ 1, hμ 2]
    have := mul_lt_mul_of_pos_right hc (by linarith : (0 : ℝ) < μ)
    linarith
  · have := sum_bound (R := R) (t := t) (vf := fun f => V (lf f))
      fun f => (hr (lf f) (hlf f)).1 f
    linarith

/-- The two pieces at `p = (x, y, 1)` and `σp = (x, -y, 1)` with offsets `hA` and `-hA` contradict
the certificate when the placement scale `c` is below `cb`. -/
theorem pair_contra {cb : ℝ} (hcert : TetCert V nv cb) {x y : ℝ} (hy : 0 ≤ y) (hyx : y ≤ x)
    (hx : x ≤ 1) {c hA : ℝ} (hc : c < cb) {R₁ R₂ : M3} (h1 : R₁ ∈ SO3) (h2 : R₂ ∈ SO3)
    {t₁ t₂ : E3} (r1 : Rows V nv c !₂[x, y, 1] hA R₁ t₁)
    (r2 : Rows V nv c !₂[x, -y, 1] (-hA) R₂ t₂) : False := by
  obtain ⟨κA, κB, hsum, hA', hB'⟩ := hcert x y hy hyx hx
  obtain ⟨k₁, hk₁, hm₁⟩ := exists_maxRep (V := V) (nv := nv) R₁
  obtain ⟨k₂, hk₂, hm₂⟩ := exists_maxRep (V := V) (nv := nv) R₂
  have a := low_lt (by simp) (hA' _ (mul_mem h1 (krot_SO hk₁)) hm₁) (rows_perm hk₁.2.2 r1) hc
  have b := low_lt (by simp) (hB' _ (mul_mem h2 (krot_SO hk₂)) hm₂) (rows_perm hk₂.2.2 r2) hc
  linarith

/-- For a symmetry `g` of the container, a symmetry `k` of the piece with `det g · det k = 1`
(`k = 1` or `k = km`). -/
theorem pair_k {g km : M3} (hg : gᵀ * g = 1) (hkm : kmᵀ * km = 1) (hkd : km.det = -1)
    (hkV : ∀ l < nv, ∃ l' < nv, mv km (V l) = V l') :
    ∃ k : M3, (∀ l < nv, ∃ l' < nv, mv k (V l) = V l') ∧ kᵀ * k = 1 ∧ g.det * k.det = 1 := by
  have hd : g.det * g.det = 1 := by
    have := congrArg Matrix.det hg
    rwa [Matrix.det_mul, Matrix.det_transpose, Matrix.det_one] at this
  rcases mul_self_eq_one_iff.1 hd with h1 | h1
  · exact ⟨1, fun l hl => ⟨l, hl, mv_one _⟩, by simp, by rw [h1]; simp⟩
  · exact ⟨km, hkV, hkm, by rw [h1, hkd]; norm_num⟩

theorem g0_det : g0.det = 1 := by
  simp [g0, Matrix.det_fin_three]

theorem g0_neg (p : E3) : mv g0 (-p) = !₂[p 0, -p 1, p 2] := by
  ext i
  fin_cases i <;> simp [g0, Fin.sum_univ_three]

/-- **The lower bound for the tetrahedral container.**  A convex piece `K` with nonempty interior
and points `V l ∈ K` (its vertices), a symmetry `km` of the points with `det km = -1`, and a
certificate `TetCert V nv cb`: two copies of `K` fit in `s • tet` only if `cb ≤ s √2/4`. -/
theorem tet_lower {K : Set E3} {cb : ℝ}
    (hV : ∀ l < nv, V l ∈ K) (hK : Convex ℝ K) (hKi : (interior K).Nonempty)
    {km : M3} (hkm : kmᵀ * km = 1) (hkd : km.det = -1)
    (hkV : ∀ l < nv, ∃ l' < nv, mv km (V l) = V l')
    (hcert : TetCert V nv cb) {s : ℝ} (hs : 0 ≤ s) (hfit : Fits K tet 2 s) :
    cb ≤ s * (√2 / 4) := by
  by_contra hlt
  have hc : √2 / 4 * s < cb := by rw [mul_comm]; exact not_le.1 hlt
  obtain ⟨g₁, g₂, hp₁, hp₂, hin₁, hin₂, n, hn, h, hs₁, hs₂⟩ := fits_two_sep hK hKi hfit
  have r1 := rows_of_fit hV hs hin₁ hs₁
  have r2 := rows_of_fit (n := -n) (h := -h) hV hs hin₂ fun x hx => by
    rw [dot_neg_left]; linarith [hs₂ x hx]
  -- move `n` into the chamber over `D_n`
  obtain ⟨g, hg, hc1, hc2, hc3⟩ := exists_chamber n
  obtain ⟨k, hkV', hko, hdet⟩ := pair_k hg.1 hkm hkd hkV
  have hg' : g0 * g ∈ Gset bN 4 := mul_mem_G hg g0_mem
  have hdet' : (g0 * g).det * k.det = 1 := by rw [Matrix.det_mul, g0_det, one_mul, hdet]
  have hSO1 := sym_mem_SO hg.1 hko hdet (rotMat_mem_SO hp₁)
  have hSO2 := sym_mem_SO hg'.1 hko hdet' (rotMat_mem_SO hp₂)
  have r1' := rows_sym hg hkV' r1
  have r2' := rows_sym hg' hkV' r2
  rw [mv_mul, mv_neg, g0_neg] at r2'
  have hq_ne : mv g n ≠ 0 := fun h0 => hn (by
    have e : n = mv gᵀ (mv g n) := by rw [← mv_mul, hg.1, mv_one]
    rw [e, h0]; ext i; simp)
  generalize mv g n = q at r1' r2' hc1 hc2 hc3 hq_ne
  -- `q` is in the cone `z ≥ x ≥ |y|` and not zero
  have hz : 0 < q 2 := by
    by_contra hz0
    have hz0 := not_lt.1 hz0
    have ha0 : q 0 = 0 := by linarith
    have hb0 : q 1 = 0 := by linarith
    have hz' : q 2 = 0 := by linarith
    exact hq_ne (eq_of_coords (by simpa using ha0) (by simpa using hb0) (by simpa using hz'))
  -- scale by `1 / q₂` to the point `(x, y, 1)` of `D_n`
  have hzi : 0 ≤ (q 2)⁻¹ := (inv_pos.2 hz).le
  have s1 := rows_scale hzi r1'
  have s2 := rows_scale hzi r2'
  have e1 : (q 2)⁻¹ • q = !₂[q 0 / q 2, q 1 / q 2, 1] := by
    ext i; fin_cases i <;> simp <;> field_simp
  have e2 : (q 2)⁻¹ • !₂[q 0, -q 1, q 2] = !₂[q 0 / q 2, -(q 1 / q 2), 1] := by
    ext i; fin_cases i <;> simp <;> field_simp
  rw [e1] at s1
  rw [e2, mul_neg] at s2
  have hyx : q 1 / q 2 ≤ q 0 / q 2 := div_le_div_of_nonneg_right hc2 hz.le
  have hmyx : -(q 1 / q 2) ≤ q 0 / q 2 := by
    rw [← neg_div]; exact div_le_div_of_nonneg_right hc3 hz.le
  have hx1 : q 0 / q 2 ≤ 1 := (div_le_one hz).2 hc1
  -- the piece on the side `y ≥ 0` takes the role `A`
  rcases le_or_gt 0 (q 1 / q 2) with hy | hy
  · exact pair_contra hcert hy hyx hx1 hc hSO1 hSO2 s1 s2
  · have s1' : Rows V nv (√2 / 4 * s) !₂[q 0 / q 2, -(-(q 1 / q 2)), 1] (-(-((q 2)⁻¹ * h)))
        (g * rotMat g₁ * k) (mv g (g₁ 0)) := by simpa only [neg_neg] using s1
    exact pair_contra hcert (by linarith) hmyx hx1 hc hSO2 hSO1 s2 s1'

/-! ## 5. Scale (the piece of the checkers scaled by `τ > 0`) -/

theorem sum_scale (τ : ℝ) (a : Fin 4 → ℝ) (b : Fin 4 → ℝ) :
    ∑ f, a f * (τ * b f) = τ * ∑ f, a f * b f := by
  rw [mul_sum]; exact sum_congr rfl fun _ _ => by ring

theorem low_scale {τ : ℝ} (hτ : 0 < τ) {cb κ : ℝ} {p : E3} {R : M3} :
    Low (fun l => τ • V l) nv (τ * cb) p R (τ * κ) ↔ Low V nv cb p R κ := by
  have eL : ∀ (μ : ℝ) (l0 : ℕ) (lf : Fin 4 → ℕ),
      dot p (mv R (τ • V l0)) + 1 / 4 * ∑ f, (μ - dot p (bT f)) * dot (bT f) (mv R (τ • V (lf f)))
        - τ * cb * μ
      = τ * (dot p (mv R (V l0)) + 1 / 4 * ∑ f, (μ - dot p (bT f)) * dot (bT f) (mv R (V (lf f)))
        - cb * μ) := by
    intro μ l0 lf
    simp only [mv_smul, dot_smul]
    rw [sum_scale τ (fun f => μ - dot p (bT f)) (fun f => dot (bT f) (mv R (V (lf f))))]
    ring
  have eS : ∀ lf : Fin 4 → ℕ, ∑ f, dot (bT f) (mv R (τ • V (lf f)))
      = τ * ∑ f, dot (bT f) (mv R (V (lf f))) := by
    intro lf
    simp only [mv_smul, dot_smul, mul_sum]
  unfold Low
  constructor
  · rintro (⟨μ, l0, hl0, lf, hlf, hμ, hκ⟩ | ⟨lf, hlf, hS⟩)
    · refine Or.inl ⟨μ, l0, hl0, lf, hlf, hμ, ?_⟩
      rw [eL] at hκ
      exact le_of_mul_le_mul_left hκ hτ
    · refine Or.inr ⟨lf, hlf, ?_⟩
      rw [eS] at hS
      nlinarith
  · rintro (⟨μ, l0, hl0, lf, hlf, hμ, hκ⟩ | ⟨lf, hlf, hS⟩)
    · refine Or.inl ⟨μ, l0, hl0, lf, hlf, hμ, ?_⟩
      rw [eL]
      exact mul_le_mul_of_nonneg_left hκ hτ.le
    · refine Or.inr ⟨lf, hlf, ?_⟩
      rw [eS]
      nlinarith

theorem krot_scale {τ : ℝ} (hτ : τ ≠ 0) : Krot (fun l => τ • V l) nv = Krot V nv := by
  ext k
  simp only [Krot, Set.mem_ofPred_eq, mv_smul, smul_right_inj hτ]

theorem maxRep_scale {τ : ℝ} (hτ : τ ≠ 0) {R : M3} :
    MaxRep (fun l => τ • V l) nv R ↔ MaxRep V nv R := by
  unfold MaxRep; rw [krot_scale hτ]

/-- A certificate for the piece scaled by `τ > 0` (at the scale `τ cb`) is one for the piece. -/
theorem tetCert_of_scale {τ : ℝ} (hτ : 0 < τ) {cb : ℝ}
    (h : TetCert (fun l => τ • V l) nv (τ * cb)) : TetCert V nv cb := by
  intro x y hy hyx hx
  obtain ⟨κA, κB, hs, hA, hB⟩ := h x y hy hyx hx
  have e : ∀ κ : ℝ, κ = τ * (κ / τ) := fun κ => by field_simp
  refine ⟨κA / τ, κB / τ, ?_, fun R hR hm => ?_, fun R hR hm => ?_⟩
  · rw [← add_div]; exact div_nonneg hs hτ.le
  · have := hA R hR ((maxRep_scale hτ.ne').2 hm)
    rw [e κA] at this
    exact (low_scale hτ).1 this
  · have := hB R hR ((maxRep_scale hτ.ne').2 hm)
    rw [e κB] at this
    exact (low_scale hτ).1 this

/-! ## 6. The upper bound: two placements with different rotations -/

/-- Two sets on the two sides of the plane `n · x = h` (`n ≠ 0`) have disjoint interiors. -/
theorem disjoint_of_plane' {n : E3} (hn : n ≠ 0) {h : ℝ} (A B : Set E3)
    (hA : ∀ p ∈ A, dot n p ≤ h) (hB : ∀ p ∈ B, h ≤ dot n p) :
    Disjoint (interior A) (interior B) := by
  rw [Set.disjoint_left]
  intro z hzA hzB
  obtain ⟨ε, hε, hballA⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzA)
  obtain ⟨δ, hδ, hballB⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzB)
  have hnorm : 0 < ‖n‖ := norm_pos_iff.2 hn
  have hnn : 0 < dot n n := by rw [dot_self_eq]; positivity
  have hdist : ∀ c : ℝ, dist (z + c • n) z = |c| * ‖n‖ := fun c => by
    rw [dist_eq_norm, add_sub_cancel_left, norm_smul, Real.norm_eq_abs]
  have hv : ∀ c : ℝ, dot n (z + c • n) = dot n z + c * dot n n := fun c => by
    rw [dot_add, dot_smul]
  set a := ε / (2 * ‖n‖) with ha
  set b := δ / (2 * ‖n‖) with hb
  have ha0 : 0 < a := by positivity
  have hb0 : 0 < b := by positivity
  have h1 := hA _ (hballA (show z + a • n ∈ Metric.ball z ε by
    have : a * ‖n‖ = ε / 2 := by rw [ha]; field_simp
    rw [Metric.mem_ball, hdist, abs_of_pos ha0, this]
    linarith))
  have h2 := hB _ (hballB (show z + (-b) • n ∈ Metric.ball z δ by
    have : b * ‖n‖ = δ / 2 := by rw [hb]; field_simp
    rw [Metric.mem_ball, hdist, abs_neg, abs_of_pos hb0, this]
    linarith))
  rw [hv] at h1 h2
  have := mul_pos ha0 hnn
  have := mul_pos hb0 hnn
  nlinarith

/-- **The upper bound for the tetrahedral container.**  The piece `K = conv KV` with `KV` among the
points `V l`; two rotations `A₁`, `A₂` and translations `T₁`, `T₂` placing every point in the four
rows at `c > 0`, the first below and the second above a plane `n · x = h` (`n ≠ 0`): two copies fit
in the tetrahedron of edge `c / (√2/4)`. -/
theorem tet_upper {K KV : Set E3} (hK : K = convexHull ℝ KV)
    {A₁ A₂ : M3} (h₁ : A₁ ∈ SO3) (h₂ : A₂ ∈ SO3) {T₁ T₂ n : E3} {c h : ℝ} (hn : n ≠ 0)
    (hc : 0 < c) (hKV : ∀ x ∈ KV, ∃ l < nv, x = V l)
    (hin₁ : ∀ l < nv, ∀ f, dot (bT f) (mv A₁ (V l) + T₁) ≤ c)
    (hin₂ : ∀ l < nv, ∀ f, dot (bT f) (mv A₂ (V l) + T₂) ≤ c)
    (hlo : ∀ l < nv, dot n (mv A₁ (V l) + T₁) ≤ h)
    (hhi : ∀ l < nv, h ≤ dot n (mv A₂ (V l) + T₂)) :
    Fits K tet 2 (c / (√2 / 4)) := by
  have hσ : (0 : ℝ) < √2 / 4 := by positivity
  have hs : 0 < c / (√2 / 4) := div_pos hc hσ
  have hσs : √2 / 4 * (c / (√2 / 4)) = c := by field_simp
  -- a half-space condition on the points holds on the placed piece
  have hside : ∀ (A : M3) (hA : Aᵀ * A = 1) (T u : E3) (d : ℝ),
      (∀ l < nv, dot u (mv A (V l) + T) ≤ d) → ∀ p ∈ place A hA T '' K, dot u p ≤ d := by
    rintro A hA T u d hT _ ⟨y, hy, rfl⟩
    rw [place_apply]
    rw [hK] at hy
    refine hull_le (fun x hx => ?_) y hy
    obtain ⟨l, hl, rfl⟩ := hKV x hx
    exact hT l hl
  have hcont : ∀ (A : M3) (hA : Aᵀ * A = 1) (T : E3),
      (∀ l < nv, ∀ f, dot (bT f) (mv A (V l) + T) ≤ c) →
      place A hA T '' K ⊆ (c / (√2 / 4)) • tet := by
    intro A hA T hT p hp
    refine mem_smul_of_le tet_hC hs fun j hj => ?_
    rw [hσs, show bN j = bT ⟨j, hj⟩ from bN_eq ⟨j, hj⟩]
    exact hside A hA T _ c (fun l hl => hT l hl _) p hp
  have hL := hside A₁ (orth_of_SO h₁) T₁ n h hlo
  have hR : ∀ p ∈ place A₂ (orth_of_SO h₂) T₂ '' K, h ≤ dot n p := by
    intro p hp
    have := hside A₂ (orth_of_SO h₂) T₂ (-n) (-h)
      (fun l hl => by rw [dot_neg_left]; linarith [hhi l hl]) p hp
    rw [dot_neg_left] at this
    linarith
  have hD := disjoint_of_plane' hn _ _ hL hR
  refine ⟨![place A₁ (orth_of_SO h₁) T₁, place A₂ (orth_of_SO h₂) T₂], fun i => ?_, fun i => ?_,
    fun i j hij => ?_⟩
  · fin_cases i
    · exact place_proper h₁ _
    · exact place_proper h₂ _
  · fin_cases i
    · exact hcont _ _ _ hin₁
    · exact hcont _ _ _ hin₂
  · fin_cases i <;> fin_cases j
    · exact absurd rfl hij
    · exact hD
    · exact hD.symm
    · exact absurd rfl hij

/-- The upper bound in the edge `s`: the rows at `(√2/4) s`. -/
theorem tet_upper_s {K KV : Set E3} (hK : K = convexHull ℝ KV)
    {A₁ A₂ : M3} (h₁ : A₁ ∈ SO3) (h₂ : A₂ ∈ SO3) {T₁ T₂ n : E3} {s h : ℝ} (hn : n ≠ 0)
    (hs : 0 < s) (hKV : ∀ x ∈ KV, ∃ l < nv, x = V l)
    (hin₁ : ∀ l < nv, ∀ f, dot (bT f) (mv A₁ (V l) + T₁) ≤ √2 / 4 * s)
    (hin₂ : ∀ l < nv, ∀ f, dot (bT f) (mv A₂ (V l) + T₂) ≤ √2 / 4 * s)
    (hlo : ∀ l < nv, dot n (mv A₁ (V l) + T₁) ≤ h)
    (hhi : ∀ l < nv, h ≤ dot n (mv A₂ (V l) + T₂)) :
    Fits K tet 2 s := by
  have := tet_upper hK h₁ h₂ hn (by positivity) hKV hin₁ hin₂ hlo hhi
  rwa [mul_div_cancel_left₀ _ (by positivity : (√2 / 4 : ℝ) ≠ 0)] at this

/-! ## 7. The claims -/

/-- The lower bound for a piece given as a convex hull of vertices (the solids of `Spec`). -/
theorem tet_lower_hull {K KV : Set E3} (hK : K = convexHull ℝ KV) (hKi : (interior K).Nonempty)
    (hV : ∀ l < nv, V l ∈ KV) {km : M3} (hkm : kmᵀ * km = 1) (hkd : km.det = -1)
    (hkV : ∀ l < nv, ∃ l' < nv, mv km (V l) = V l') {cb : ℝ} (hcert : TetCert V nv cb) {s : ℝ}
    (hs : 0 ≤ s) (hfit : Fits K tet 2 s) : cb ≤ s * (√2 / 4) := by
  subst hK
  exact tet_lower (fun l hl => subset_convexHull ℝ KV (hV l hl)) (convex_convexHull ℝ KV) hKi
    hkm hkd hkV hcert hs hfit

/-- **`IsMinEdge` in the tetrahedron**: a certificate at `c* = (√2/4) s*` and two copies fitting at
`s*`. -/
theorem tet_isMinEdge {K : Set E3} (hV : ∀ l < nv, V l ∈ K) (hK : Convex ℝ K)
    (hKi : (interior K).Nonempty) {km : M3} (hkm : kmᵀ * km = 1) (hkd : km.det = -1)
    (hkV : ∀ l < nv, ∃ l' < nv, mv km (V l) = V l') {sst : ℝ}
    (hcert : TetCert V nv (√2 / 4 * sst)) (hs : 0 ≤ sst) (hup : Fits K tet 2 sst) :
    IsMinEdge K tet 2 sst := by
  refine (isMinEdge_iff _ _ _ _).2 ⟨⟨hs, hup⟩, fun s' hs' hf => ?_⟩
  have h := tet_lower hV hK hKi hkm hkd hkV hcert hs' hf
  rw [mul_comm s'] at h
  exact le_of_mul_le_mul_left h (by positivity)

end

#assert_std_axioms PackLean.Formal.TetReduction.tet_lower PackLean.Formal.TetReduction.tet_upper
  PackLean.Formal.TetReduction.tet_upper_s PackLean.Formal.TetReduction.tet_eq_bT
  PackLean.Formal.TetReduction.tet_interior PackLean.Formal.TetReduction.tetCert_of_scale
  PackLean.Formal.TetReduction.low_scale PackLean.Formal.TetReduction.tet_lower_hull
  PackLean.Formal.TetReduction.tet_isMinEdge

end PackLean.Formal.TetReduction
