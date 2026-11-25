import PackLean.Formal.LocalG
import PackLean.AxiomAudit

/-!
# D45 stage 4k: the upper bound of `D16.Core` (`upperOk` ⇒ two copies fit)

The general form of `CubinoctUpper.lean` for the six cases (`plan/D45_s4_design.md` §2, step 10).

* `rotLI A`: an orthogonal matrix as a linear isometry; `place A T`: the placement `x ↦ A x + T`,
  proper when `A ∈ SO(3)` (`place_proper`);
* `mem_smul_of_le`: the container half-spaces at offset `σ s` lie in `s • C` when `C` contains the
  half-spaces at offset `σ` (the **H ⊆ V of the container**, `hsubv_of_ok` of 4f);
* `disjoint_of_plane`: two sets on the two sides of a plane `n0 · x = 0` have disjoint interiors;
* **`upper_fits`** (reals): the piece `K = conv KV`, a rotation `A` mapping `KV` into the points
  `V l` (point-symmetric), the placed points `±(V l + T)` in the container half-spaces at `S*`, and
  `n0 · (V l + T) ≤ 0` ⇒ `Fits K C 2 (S* / σ)` with the placements `x ↦ A x ± T`;
* `upper_data`: what `upperOk P` says about the real vectors of `P` (`Vv`, `NCv`, `N0v`, `Tv`, `Ss`);
* **`upper_main`**: the two together.
-/

namespace PackLean.Formal.UpperG

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fmul fsign nth vecGet)
open PackLean.D16 (Prob fdot fnn vsmul upperOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.LocalG (Ss)
open Finset
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## Dot products -/

theorem dot_self_eq (u : E3) : dot u u = ‖u‖ ^ 2 := by
  rw [EuclideanSpace.norm_eq, Real.sq_sqrt (by positivity)]
  unfold dot
  exact sum_congr rfl fun i _ => by rw [Real.norm_eq_abs, sq_abs, sq]

theorem dot_neg_left (u x : E3) : dot (-u) x = -dot u x := by
  unfold dot
  rw [← sum_neg_distrib]
  exact sum_congr rfl fun i _ => by simp only [PiLp.neg_apply]; ring

theorem dot_neg_right (u x : E3) : dot u (-x) = -dot u x := by
  unfold dot
  rw [← sum_neg_distrib]
  exact sum_congr rfl fun i _ => by simp only [PiLp.neg_apply]; ring

theorem dot_isLinear (u : E3) : IsLinearMap ℝ (dot u) :=
  ⟨dot_add u, fun c x => by rw [dot_smul, smul_eq_mul]⟩

/-! ## Placements `x ↦ A x + T` -/

/-- An orthogonal matrix as a linear equivalence (inverse `Aᵀ`). -/
def rotLE (A : M3) (hA : Aᵀ * A = 1) : E3 ≃ₗ[ℝ] E3 where
  toFun := mv A
  invFun := mv Aᵀ
  map_add' x y := by
    ext i; simp only [mv_apply, PiLp.add_apply, mul_add, sum_add_distrib]
  map_smul' a x := by
    ext i; simp only [mv_apply, PiLp.smul_apply, smul_eq_mul, RingHom.id_apply, mul_sum]
    exact sum_congr rfl fun j _ => by ring
  left_inv x := by
    rw [← mv_mul, hA, mv_one]
  right_inv x := by
    rw [← mv_mul, mul_transpose_of hA, mv_one]

/-- An orthogonal matrix as a linear isometry equivalence. -/
def rotLI (A : M3) (hA : Aᵀ * A = 1) : E3 ≃ₗᵢ[ℝ] E3 :=
  { rotLE A hA with
    norm_map' := by
      intro x
      change ‖mv A x‖ = ‖x‖
      have h := dot_mv_orth hA x x
      rw [dot_self_eq, dot_self_eq] at h
      exact (pow_left_inj₀ (norm_nonneg _) (norm_nonneg _) two_ne_zero).1 h }

theorem orth_of_SO {A : M3} (hA : A ∈ SO3) : Aᵀ * A = 1 := by
  rw [Matrix.mem_specialOrthogonalGroup_iff] at hA
  exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hA.1

/-- The placement `x ↦ A x + T`. -/
def place (A : M3) (hA : Aᵀ * A = 1) (T : E3) : Motion :=
  (rotLI A hA).toAffineIsometryEquiv.trans (AffineIsometryEquiv.constVAdd ℝ E3 T)

theorem place_apply (A : M3) (hA : Aᵀ * A = 1) (T x : E3) : place A hA T x = mv A x + T := by
  change (T +ᵥ rotLI A hA x) = _
  rw [vadd_eq_add, add_comm]
  rfl

theorem place_proper {A : M3} (hA : A ∈ SO3) (T : E3) : IsProper (place A (orth_of_SO hA) T) :=
  (isProper_iff _).2 ⟨A, hA, T, fun x i => by rw [place_apply, PiLp.add_apply, mv_apply]⟩

/-! ## The hull of the placed piece -/

/-- An affine half-space condition on the vertices holds on their convex hull. -/
theorem hull_le {KV : Set E3} {A : M3} {T u : E3} {c : ℝ}
    (h : ∀ x ∈ KV, dot u (mv A x + T) ≤ c) : ∀ y ∈ convexHull ℝ KV, dot u (mv A y + T) ≤ c := by
  have e : ∀ y, dot u (mv A y + T) = dot (mv Aᵀ u) y + dot u T := fun y => by
    rw [dot_add, dot_mv]
  have hconv : Convex ℝ {y : E3 | dot u (mv A y + T) ≤ c} := by
    have : {y : E3 | dot u (mv A y + T) ≤ c} = {y | dot (mv Aᵀ u) y ≤ c - dot u T} := by
      ext y; simp only [Set.mem_ofPred_eq, e]; constructor <;> intro h <;> linarith
    rw [this]
    exact convex_halfSpace_le (dot_isLinear _) _
  exact fun y hy => convexHull_min (fun x hx => h x hx) hconv hy

/-- **H ⊆ V of the container, scaled.** If every point of the half-spaces `NC j · y ≤ σ` is in `C`,
every point of the half-spaces at `σ s` (`s > 0`) is in `s • C`. -/
theorem mem_smul_of_le {C : Set E3} {NC : ℕ → E3} {mc : ℕ} {σ : ℝ}
    (hC : ∀ y : E3, (∀ j < mc, dot (NC j) y ≤ σ) → y ∈ C) {s : ℝ} (hs : 0 < s) {z : E3}
    (hz : ∀ j < mc, dot (NC j) z ≤ σ * s) : z ∈ s • C := by
  refine Set.mem_smul_set.2 ⟨s⁻¹ • z, hC _ fun j hj => ?_, ?_⟩
  · rw [dot_smul]
    have := hz j hj
    rw [inv_mul_le_iff₀ hs]; linarith
  · rw [smul_smul, mul_inv_cancel₀ hs.ne', one_smul]

/-! ## Separation by a plane -/

/-- Two sets on the two sides of the plane `n0 · x = 0` (`n0 ≠ 0`) have disjoint interiors. -/
theorem disjoint_of_plane {n0 : E3} (hn0 : n0 ≠ 0) (A B : Set E3) (hA : ∀ p ∈ A, dot n0 p ≤ 0)
    (hB : ∀ p ∈ B, 0 ≤ dot n0 p) : Disjoint (interior A) (interior B) := by
  rw [Set.disjoint_left]
  intro z hzA hzB
  obtain ⟨ε, hε, hballA⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzA)
  obtain ⟨δ, hδ, hballB⟩ := Metric.mem_nhds_iff.1 (mem_interior_iff_mem_nhds.1 hzB)
  have hn : 0 < ‖n0‖ := norm_pos_iff.2 hn0
  have hnn : 0 < dot n0 n0 := by rw [dot_self_eq]; positivity
  have hdist : ∀ c : ℝ, dist (z + c • n0) z = |c| * ‖n0‖ := fun c => by
    rw [dist_eq_norm, add_sub_cancel_left, norm_smul, Real.norm_eq_abs]
  have hv : ∀ c : ℝ, dot n0 (z + c • n0) = dot n0 z + c * dot n0 n0 := fun c => by
    rw [dot_add, dot_smul]
  set a := ε / (2 * ‖n0‖) with ha
  set b := δ / (2 * ‖n0‖) with hb
  have ha0 : 0 < a := by positivity
  have hb0 : 0 < b := by positivity
  have h1 := hA _ (hballA (show z + a • n0 ∈ Metric.ball z ε by
    have : a * ‖n0‖ = ε / 2 := by rw [ha]; field_simp
    rw [Metric.mem_ball, hdist, abs_of_pos ha0, this]
    linarith))
  have h2 := hB _ (hballB (show z + (-b) • n0 ∈ Metric.ball z δ by
    have : b * ‖n0‖ = δ / 2 := by rw [hb]; field_simp
    rw [Metric.mem_ball, hdist, abs_neg, abs_of_pos hb0, this]
    linarith))
  rw [hv] at h1 h2
  have := mul_pos ha0 hnn
  have := mul_pos hb0 hnn
  nlinarith

/-! ## The upper bound over the reals -/

/-- **Upper bound.** The piece `K = conv KV`, a rotation `A ∈ SO(3)` mapping `KV` into the points
`V l` (`l < nv`, symmetric under `x ↦ -x`), a container `C` containing the half-spaces
`NC j · y ≤ σ`; if the points `V l + T` and `-(V l + T)` satisfy `NC j · y ≤ S*` and
`n0 · (V l + T) ≤ 0` (`n0 ≠ 0`), two copies fit at `S* / σ`: `x ↦ A x + T` and `x ↦ A x - T`. -/
theorem upper_fits {K C KV : Set E3} (hK : K = convexHull ℝ KV) {V : ℕ → E3} {nv : ℕ}
    {NC : ℕ → E3} {mc : ℕ} {σ Sst : ℝ} {n0 T : E3} {A : M3}
    (hA : A ∈ SO3) (hAV : ∀ x ∈ KV, ∃ l < nv, mv A x = V l)
    (hsym : ∀ l < nv, ∃ l' < nv, V l' = -V l)
    (hσ : 0 < σ) (hS : 0 < Sst)
    (hC : ∀ y : E3, (∀ j < mc, dot (NC j) y ≤ σ) → y ∈ C)
    (hin : ∀ l < nv, ∀ j < mc, dot (NC j) (V l + T) ≤ Sst)
    (hin' : ∀ l < nv, ∀ j < mc, dot (NC j) (-(V l + T)) ≤ Sst)
    (hsep : ∀ l < nv, dot n0 (V l + T) ≤ 0) (hn0 : n0 ≠ 0) :
    Fits K C 2 (Sst / σ) := by
  have hAo := orth_of_SO hA
  have hs : 0 < Sst / σ := div_pos hS hσ
  have hσs : σ * (Sst / σ) = Sst := by field_simp
  -- the second placement at a vertex: `A x - T = -(V l' + T)`
  have hminus : ∀ x ∈ KV, ∃ l < nv, mv A x + -T = -(V l + T) := by
    intro x hx
    obtain ⟨l, hl, he⟩ := hAV x hx
    obtain ⟨l', hl', he'⟩ := hsym l hl
    refine ⟨l', hl', ?_⟩
    rw [he, he', neg_add, neg_neg]
  -- containment
  have hcont : ∀ U : E3, (∀ x ∈ KV, ∀ j < mc, dot (NC j) (mv A x + U) ≤ Sst) →
      place A hAo U '' K ⊆ (Sst / σ) • C := by
    rintro U hU _ ⟨y, hy, rfl⟩
    rw [place_apply]
    refine mem_smul_of_le hC hs fun j hj => ?_
    rw [hσs]
    rw [hK] at hy
    exact hull_le (fun x hx => hU x hx j hj) y hy
  have h1 : place A hAo T '' K ⊆ (Sst / σ) • C := hcont T fun x hx j hj => by
    obtain ⟨l, hl, he⟩ := hAV x hx
    rw [he]; exact hin l hl j hj
  have h2 : place A hAo (-T) '' K ⊆ (Sst / σ) • C := hcont (-T) fun x hx j hj => by
    obtain ⟨l, hl, he⟩ := hminus x hx
    rw [he]; exact hin' l hl j hj
  -- the two sides of the plane
  have hL : ∀ p ∈ place A hAo T '' K, dot n0 p ≤ 0 := by
    rintro _ ⟨y, hy, rfl⟩
    rw [place_apply]
    rw [hK] at hy
    refine hull_le (fun x hx => ?_) y hy
    obtain ⟨l, hl, he⟩ := hAV x hx
    rw [he]; exact hsep l hl
  have hR : ∀ p ∈ place A hAo (-T) '' K, 0 ≤ dot n0 p := by
    rintro _ ⟨y, hy, rfl⟩
    rw [place_apply]
    rw [hK] at hy
    have := hull_le (A := A) (T := -T) (u := -n0) (c := 0) (fun x hx => ?_) y hy
    · rw [dot_neg_left] at this; linarith
    · obtain ⟨l, hl, he⟩ := hminus x hx
      rw [he, dot_neg_left, dot_neg_right, neg_neg]; exact hsep l hl
  have hD := disjoint_of_plane hn0 _ _ hL hR
  refine ⟨![place A hAo T, place A hAo (-T)], fun i => ?_, fun i => ?_, fun i j hij => ?_⟩
  · fin_cases i <;> exact place_proper hA _
  · fin_cases i
    · exact h1
    · exact h2
  · fin_cases i <;> fin_cases j
    · exact absurd rfl hij
    · exact hD
    · exact hD.symm
    · exact absurd rfl hij

/-! ## What `upperOk` says -/

/-- The translation `t*` of the data. -/
def Tv (P : Prob) : E3 := vec P.ps P.nb P.dt P.tstar

/-- `c v + d w` entrywise, for vectors of three field elements. -/
theorem comb_spec {ps : List ℕ} {nb : ℕ} (_hnb : nb = 2 ^ ps.length) (c d : ℤ) {v w : List FE}
    (hv : LenV ps v) (hw : LenV ps w) :
    LenV ps (List.zipWith fadd (vsmul c v) (vsmul d w)) ∧
      ∀ i : ℕ, i < 3 → ent ps nb (List.zipWith fadd (vsmul c v) (vsmul d w)) i
        = c * ent ps nb v i + d * ent ps nb w i := by
  obtain ⟨hvl, hva⟩ := hv
  obtain ⟨hwl, hwa⟩ := hw
  match v, w, hvl, hwl with
  | [a0, a1, a2], [b0, b1, b2], _, _ =>
    have la0 := hva a0 (by simp); have la1 := hva a1 (by simp); have la2 := hva a2 (by simp)
    have lb0 := hwa b0 (by simp); have lb1 := hwa b1 (by simp); have lb2 := hwa b2 (by simp)
    refine ⟨⟨by simp [vsmul], ?_⟩, ?_⟩
    · intro a ha
      simp only [vsmul, List.map_cons, List.map_nil, List.zipWith_cons_cons, List.zipWith_nil_left,
        List.mem_cons, List.not_mem_nil, or_false] at ha
      rcases ha with rfl | rfl | rfl <;> exact len_fadd (len_fsmul _ ‹_›) (len_fsmul _ ‹_›)
    · intro i hi
      interval_cases i <;>
        simp only [ent, vecGet, vsmul, List.map_cons, List.map_nil, List.zipWith_cons_cons,
          List.zipWith_nil_left, List.getD_cons_zero, List.getD_cons_succ] <;>
        rw [fval_fadd (len_fsmul _ ‹_›) (len_fsmul _ ‹_›), fval_fsmul, fval_fsmul]

theorem neg_spec {ps : List ℕ} {nb : ℕ} {v : List FE} (hv : LenV ps v) :
    LenV ps (vsmul (-1) v) ∧ ∀ i : ℕ, ent ps nb (vsmul (-1) v) i = -ent ps nb v i := by
  obtain ⟨hvl, hva⟩ := hv
  refine ⟨⟨by simp [vsmul, hvl], fun a ha => ?_⟩, fun i => ?_⟩
  · simp only [vsmul, List.mem_map] at ha
    obtain ⟨b, hb, rfl⟩ := ha
    exact len_fsmul _ (hva b hb)
  · unfold ent vecGet vsmul
    rcases lt_or_ge i v.length with hi | hi
    · rw [List.getD_eq_getElem _ _ (by simpa using hi), List.getD_eq_getElem _ _ hi,
        List.getElem_map, fval_fsmul]
      push_cast; ring
    · rw [List.getD_eq_default _ _ (by simpa using hi), List.getD_eq_default _ _ hi]
      simp [fval_fzero]

theorem nonpos_of_fsign {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a : FE} (hl : Len ps a)
    (h : fsign ps a ≤ 0) : fval ps a ≤ 0 := by
  rw [fsign_spec ps hpos a hl] at h
  by_contra hc
  push Not at hc
  rw [sgn_pos hc] at h
  omega

/-- The value of a dot product with the placed point `p = dt·v + dv·t*` (as `vec … (dv·dt)`). -/
theorem vec_comb {P : Prob} (hwf : WF P) (hd : Dens P) (hdt : 0 < P.dt) {l : ℕ}
    (hl : l < P.verts.length) :
    Vv P l + Tv P = vec P.ps P.nb (P.dv * P.dt)
      (List.zipWith fadd (vsmul (P.dt : ℤ) (nth P.verts l [])) (vsmul (P.dv : ℤ) P.tstar)) := by
  have hv := lenV_nth hwf.verts hl
  obtain ⟨_, he⟩ := comb_spec hwf.nb (P.dt : ℤ) (P.dv : ℤ) hv hwf.tstar
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdt' : (0 : ℝ) < P.dt := by exact_mod_cast hdt
  ext i
  rw [PiLp.add_apply, Vv, Tv, vec_apply, vec_apply, vec_apply, he i i.isLt]
  push_cast
  field_simp

/-- **What `upperOk` says** about the real vectors of `P`. -/
theorem upper_data {P : Prob} (hwf : WF P) (hd : Dens P) (hdt : 0 < P.dt) (hsd : 0 < P.sstar.den)
    (h : upperOk P = true) :
    (∀ l < P.verts.length, ∀ j < P.normals.length, dot (NCv P j) (Vv P l + Tv P) ≤ Ss P) ∧
    (∀ l < P.verts.length, ∀ j < P.normals.length, dot (NCv P j) (-(Vv P l + Tv P)) ≤ Ss P) ∧
    (∀ l < P.verts.length, dot (N0v P) (Vv P l + Tv P) ≤ 0) := by
  simp only [upperOk, Bool.and_eq_true, List.all_eq_true, List.mem_map, decide_eq_true_eq,
    forall_exists_index, and_imp, forall_apply_eq_imp_iff₂] at h
  obtain ⟨⟨⟨_, hin⟩, hin'⟩, hsep⟩ := h
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdn0 : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdt' : (0 : ℝ) < P.dt := by exact_mod_cast hdt
  have hsd' : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  have hmem : ∀ l < P.verts.length, nth P.verts l [] ∈ P.verts := fun l hl => by
    unfold nth; rw [List.getD_eq_getElem _ _ hl]; exact List.getElem_mem hl
  have hnmem : ∀ j < P.normals.length, nth P.normals j [] ∈ P.normals := fun j hj => by
    unfold nth; rw [List.getD_eq_getElem _ _ hj]; exact List.getElem_mem hj
  -- the containment condition for a point `p` (× dv·dt) and a normal
  have key : ∀ p : List FE, LenV P.ps p → ∀ j < P.normals.length,
      fnn P.ps (fsub (fsmul ((P.dn : ℤ) * P.dv * P.dt) P.sstar.num)
        (fsmul P.sstar.den (fdot P.ps P.nb (nth P.normals j []) p))) = true →
      dot (NCv P j) (vec P.ps P.nb (P.dv * P.dt) p) ≤ Ss P := by
    intro p hp j hj hf
    have hn := lenV_nth hwf.normals hj
    obtain ⟨hlf, hvf⟩ := fval_fdot hwf.nb hn hp
    have h0 := nonneg_of_fnn hwf.pos (len_fsub (len_fsmul _ hwf.sstar) (len_fsmul _ hlf)) hf
    rw [fval_fsub (len_fsmul _ hwf.sstar) (len_fsmul _ hlf), fval_fsmul, fval_fsmul, hvf] at h0
    push_cast at h0
    have hpos : (0 : ℝ) < (P.dn : ℝ) * ((P.dv * P.dt : ℕ) : ℝ) := by push_cast; positivity
    rw [NCv, dot_vec, Ss, div_le_div_iff₀ hpos hsd']
    push_cast
    nlinarith
  refine ⟨fun l hl j hj => ?_, fun l hl j hj => ?_, fun l hl => ?_⟩
  · have hc := (comb_spec hwf.nb (P.dt : ℤ) (P.dv : ℤ) (lenV_nth hwf.verts hl) hwf.tstar).1
    rw [vec_comb hwf hd hdt hl]
    exact key _ hc j hj (hin _ (hmem l hl) _ (hnmem j hj))
  · have hc := (comb_spec hwf.nb (P.dt : ℤ) (P.dv : ℤ) (lenV_nth hwf.verts hl) hwf.tstar).1
    obtain ⟨hcn, hne⟩ := neg_spec (nb := P.nb) hc
    have e : -(Vv P l + Tv P) = vec P.ps P.nb (P.dv * P.dt) (vsmul (-1)
        (List.zipWith fadd (vsmul (P.dt : ℤ) (nth P.verts l [])) (vsmul (P.dv : ℤ) P.tstar))) := by
      rw [vec_comb hwf hd hdt hl]
      ext i
      rw [PiLp.neg_apply, vec_apply, vec_apply, hne, neg_div]
    rw [e]
    exact key _ hcn j hj (hin' _ (hmem l hl) _ (hnmem j hj))
  · have hc := (comb_spec hwf.nb (P.dt : ℤ) (P.dv : ℤ) (lenV_nth hwf.verts hl) hwf.tstar).1
    obtain ⟨hlf, hvf⟩ := fval_fdot hwf.nb hwf.n0 hc
    have h0 := nonpos_of_fsign hwf.pos hlf (hsep _ (hmem l hl))
    rw [hvf] at h0
    rw [vec_comb hwf hd hdt hl, N0v, dot_vec]
    exact div_nonpos_of_nonpos_of_nonneg h0 (by positivity)

/-- **`upperOk` ⇒ two copies fit at `S* / σ`.** The piece `K = conv KV` with a rotation `A`
mapping `KV` into the vertices of the data (`Vv P l`, symmetric under `x ↦ -x`), the container `C`
containing the half-spaces `NCv P j · y ≤ σ`, `S* > 0` and `|n0| > 0`. -/
theorem upper_main {P : Prob} (hwf : WF P) (hd : Dens P) (hdt : 0 < P.dt) (hsd : 0 < P.sstar.den)
    (hup : upperOk P = true) {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hsym : ∀ l < P.verts.length, ∃ l' < P.verts.length, Vv P l' = -Vv P l)
    {σ : ℝ} (hσ : 0 < σ) (hS : 0 < Ss P)
    (hC : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C)
    (hN0 : 0 < dot (N0v P) (N0v P)) :
    Fits K C 2 (Ss P / σ) := by
  obtain ⟨hin, hin', hsep⟩ := upper_data hwf hd hdt hsd hup
  have hn0 : N0v P ≠ 0 := by
    intro h0; rw [h0] at hN0; simp [dot] at hN0
  exact upper_fits hK hA hAV hsym hσ hS hC hin hin' hsep hn0

end

#assert_std_axioms PackLean.Formal.UpperG.upper_fits PackLean.Formal.UpperG.upper_data
  PackLean.Formal.UpperG.upper_main

end PackLean.Formal.UpperG
