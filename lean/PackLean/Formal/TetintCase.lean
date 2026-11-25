import PackLean.Formal.TetintCover

/-!
# A9 stage 7e (part 5, frame): from the checks of `D40` to `EdgeBetween tet tet 2 a b` (tetintet)

Design: `plan/A9f_tet_design.md` §4 and §10.  This file has no data; the case file (stage 7e-5) gives
the hypotheses with the kernel.

* **Scale.**  `VS l = (√2/2) VD l` are the vertices of Spec's `tet` (`VS_eq`, `VS_mem`, `tetV_VS`);
  `VD = √2 • VS` (`VD_eq`), so `TetCert VD 4 cb` gives `TetCert VS 4 (cb/√2)`
  (`TetReduction.tetCert_of_scale`).
* **The mirror of the piece** `km = rxy` (`x ↔ y`, `det = −1`, vertices to vertices: `0 ↔ 0`,
  `1 ↔ 2`, `3 ↔ 3`).
* `tet_lower_D`: `TetCert VD 4 cb` and two copies in `s • tet` ⇒ `cb ≤ s/2`.
* `upper_of_rows`: two placements of `VD` in the rows `b_f · x ≤ s/2` on the two sides of a plane ⇒
  `Fits tet tet 2 s` (`TetReduction.tet_upper_s` at the scale `√2/2`).
* `tetintet_edge`, `tetintet_of_far`: the claim `EdgeBetween tet tet 2 a b`.
-/

namespace PackLean.Formal.TetintCase

open PackLean.D40 (Prm NBox NTok Tok nbRun ntreeRun vt nth)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar PackLean.Formal.TetintCover
open PackLean.Formal.Polytope (dot tetCert)
open PackLean.Formal.TetSep (bT rxy)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot tet_V0 tet_V1 tet_V2 tet_V3 tet_Vs
  tetCert_len)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. Scale and vertices -/

/-- The vertices of Spec's unit tetrahedron, `(√2/2) ṽ_l = (√2/4) vt_l`. -/
def VS (l : ℕ) : E3 := (√2 / 2) • VD l

theorem VS_eq {l : ℕ} (hl : l < 4) : VS l = tetCert.V l := by
  interval_cases l
  · rw [tet_V0]; ext i; fin_cases i <;> simp [VS, VD, vtR, vt, nth] <;> ring
  · rw [tet_V1]; ext i; fin_cases i <;> simp [VS, VD, vtR, vt, nth] <;> ring
  · rw [tet_V2]; ext i; fin_cases i <;> simp [VS, VD, vtR, vt, nth] <;> ring
  · rw [tet_V3]; ext i; fin_cases i <;> simp [VS, VD, vtR, vt, nth] <;> ring

theorem VS_mem {l : ℕ} (hl : l < 4) : VS l ∈ tetV := by
  rw [VS_eq hl, ← tet_Vs]
  exact ⟨l, by rw [tetCert_len]; exact hl, rfl⟩

theorem tetV_VS : ∀ x ∈ tetV, ∃ l < 4, x = VS l := by
  intro x hx
  rw [← tet_Vs] at hx
  obtain ⟨l, hl, rfl⟩ := hx
  rw [tetCert_len] at hl
  exact ⟨l, hl, (VS_eq hl).symm⟩

theorem VD_eq : (fun l => √2 • VS l) = VD := by
  funext l
  simp only [VS, smul_smul]
  rw [show √2 * (√2 / 2) = 1 by rw [← mul_div_assoc, Real.mul_self_sqrt (by norm_num)]; norm_num,
    one_smul]

/-! ## 2. The mirror of the piece -/

theorem rxy_orth : rxyᵀ * rxy = 1 := by
  ext i j; fin_cases i <;> fin_cases j <;> simp [rxy, Matrix.mul_apply, Fin.sum_univ_three]

theorem rxy_det : rxy.det = -1 := by
  simp [rxy, Matrix.det_fin_three]

theorem rxy_VS : ∀ l < 4, ∃ l' < 4, mv rxy (VS l) = VS l' := by
  intro l hl
  interval_cases l
  · exact ⟨0, by norm_num, by ext i; fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, rxy, VS, VD, vtR, vt, nth]⟩
  · exact ⟨2, by norm_num, by ext i; fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, rxy, VS, VD, vtR, vt, nth]⟩
  · exact ⟨1, by norm_num, by ext i; fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, rxy, VS, VD, vtR, vt, nth]⟩
  · exact ⟨3, by norm_num, by ext i; fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, rxy, VS, VD, vtR, vt, nth]⟩

/-! ## 3. The lower and the upper bound -/

/-- **The lower bound** in the scale of `D40`: `TetCert VD 4 cb` and two copies in `s • tet` give
`cb ≤ s / 2`. -/
theorem tet_lower_D {cb : ℝ} (hcert : TetCert VD 4 cb) {s : ℝ} (hs : 0 ≤ s)
    (hfit : Fits tet tet 2 s) : cb ≤ s / 2 := by
  have h2 : (0 : ℝ) < √2 := by positivity
  have hc' : TetCert (fun l => √2 • VS l) 4 (√2 * (cb / √2)) := by
    rw [VD_eq, mul_div_cancel₀ _ h2.ne']; exact hcert
  have hc := TetReduction.tetCert_of_scale h2 hc'
  have := TetReduction.tet_lower_hull (K := tet) (KV := tetV) rfl TetReduction.tet_interior
    (fun l hl => VS_mem hl) rxy_orth rxy_det rxy_VS hc hs hfit
  have e : s * (√2 / 4) = (s / 2) / √2 := by
    have hsq : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
    rw [eq_div_iff h2.ne']
    linear_combination (s / 4) * hsq
  rw [e, div_le_div_iff_of_pos_right h2] at this
  exact this

theorem place_VS (A : M3) (t : E3) (l : ℕ) :
    mv A (VS l) + (√2 / 2) • t = (√2 / 2) • (mv A (VD l) + t) := by
  rw [VS, TetReduction.mv_smul, smul_add]

/-- **The upper bound** in the scale of `D40`: two placements of `VD` in the rows `b_f · x ≤ s/2`,
the first below and the second above the plane `n · x = h`, give two copies of `tet` in `s • tet`. -/
theorem upper_of_rows {A₁ A₂ : M3} (h₁ : A₁ ∈ SO3) (h₂ : A₂ ∈ SO3) {t₁ t₂ n : E3} {s h : ℝ}
    (hn : n ≠ 0) (hs : 0 < s)
    (hin₁ : ∀ l < 4, ∀ f, dot (bT f) (mv A₁ (VD l) + t₁) ≤ s / 2)
    (hin₂ : ∀ l < 4, ∀ f, dot (bT f) (mv A₂ (VD l) + t₂) ≤ s / 2)
    (hlo : ∀ l < 4, dot n (mv A₁ (VD l) + t₁) ≤ h)
    (hhi : ∀ l < 4, h ≤ dot n (mv A₂ (VD l) + t₂)) : Fits tet tet 2 s := by
  have hc : (0 : ℝ) ≤ √2 / 2 := by positivity
  have e : √2 / 2 * (s / 2) = √2 / 4 * s := by ring
  refine TetReduction.tet_upper_s (V := VS) (nv := 4) (K := tet) (KV := tetV) rfl h₁ h₂
    (T₁ := (√2 / 2) • t₁) (T₂ := (√2 / 2) • t₂) (n := n) (h := √2 / 2 * h) hn hs tetV_VS
    (fun l hl f => ?_) (fun l hl f => ?_) (fun l hl => ?_) (fun l hl => ?_)
  · rw [place_VS, dot_smul, ← e]; exact mul_le_mul_of_nonneg_left (hin₁ l hl f) hc
  · rw [place_VS, dot_smul, ← e]; exact mul_le_mul_of_nonneg_left (hin₂ l hl f) hc
  · rw [place_VS, dot_smul]; exact mul_le_mul_of_nonneg_left (hlo l hl) hc
  · rw [place_VS, dot_smul]; exact mul_le_mul_of_nonneg_left (hhi l hl) hc

/-- `upper_of_rows` with the separation as pairs (the plane through the highest vertex of the first
piece). -/
theorem upper_of_sep {A₁ A₂ : M3} (h₁ : A₁ ∈ SO3) (h₂ : A₂ ∈ SO3) {t₁ t₂ n : E3} {s : ℝ}
    (hn : n ≠ 0) (hs : 0 < s)
    (hin₁ : ∀ l < 4, ∀ f, dot (bT f) (mv A₁ (VD l) + t₁) ≤ s / 2)
    (hin₂ : ∀ l < 4, ∀ f, dot (bT f) (mv A₂ (VD l) + t₂) ≤ s / 2)
    (hsep : ∀ l < 4, ∀ l' < 4, dot n (mv A₁ (VD l) + t₁) ≤ dot n (mv A₂ (VD l') + t₂)) :
    Fits tet tet 2 s := by
  obtain ⟨l0, hl0, hmax⟩ := (Finset.range 4).exists_max_image
    (fun l => dot n (mv A₁ (VD l) + t₁)) ⟨0, by simp⟩
  rw [Finset.mem_range] at hl0
  exact upper_of_rows h₁ h₂ hn hs hin₁ hin₂ (h := dot n (mv A₁ (VD l0) + t₁))
    (fun l hl => hmax l (Finset.mem_range.2 hl)) (fun l hl => hsep l0 hl0 l hl)

/-! ## 4. The claim -/

theorem tetintet_edge {a b : ℝ} (hcert : TetCert VD 4 (a / 2)) (hup : Fits tet tet 2 b) :
    EdgeBetween tet tet 2 a b :=
  ⟨fun s hs hf => by have := tet_lower_D hcert hs hf; linarith, hup⟩

/-- **tetintet from the far data**: the far checks (`far_cert`), the local hypothesis `HLoc`
(stage 7e-3), `s̄ = a` and two copies at `b`. -/
theorem tetintet_of_far {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {nboxes : List (ℤ × ℤ × ℤ × ℤ)} (hn : (ntreeRun P.nd ntoks nboxes).1 = true)
    (hb : ∀ b ∈ nboxes, ∃ nb kN tA tB, cornersD nb = b ∧ (nbRun P nb 0 kN tA).1 = true ∧
      (nbRun P nb 1 kN tB).1 = true)
    {a b : ℝ} (ha : (P.sbar.1 : ℝ) / (P.sbar.2 : ℝ) = a) (hup : Fits tet tet 2 b) :
    EdgeBetween tet tet 2 a b := by
  have := far_cert hc hloc hn hb
  rw [cbD, ha] at this
  exact tetintet_edge this hup

/-! ## 5. Rotations for the upper bound -/

/-- The rotation `M(q)/|q|²` of a real quaternion `q = (w, a, b, c) ≠ 0` (the matrix of `D40.mqI`). -/
def qrot (w a b c : ℝ) : M3 :=
  let N := w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2
  !![(w*w + a*a - b*b - c*c) / N, 2*(a*b - w*c) / N, 2*(a*c + w*b) / N;
     2*(a*b + w*c) / N, (w*w - a*a + b*b - c*c) / N, 2*(b*c - w*a) / N;
     2*(a*c - w*b) / N, 2*(b*c + w*a) / N, (w*w - a*a - b*b + c*c) / N]

theorem qrot_SO {w a b c : ℝ} (hN : 0 < w ^ 2 + a ^ 2 + b ^ 2 + c ^ 2) : qrot w a b c ∈ SO3 := by
  have hN' := hN.ne'
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 ?_, ?_⟩
  · ext i j
    fin_cases i <;> fin_cases j <;>
      simp [qrot, Matrix.mul_apply, Fin.sum_univ_three] <;> field_simp <;> ring
  · simp only [qrot, Matrix.det_fin_three, Matrix.of_apply, Matrix.cons_val', Matrix.cons_val_zero,
      Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons, Matrix.empty_val',
      Matrix.cons_val_fin_one, Matrix.head_fin_const]
    field_simp
    ring

/-- The rotation `τ = diag(−1, 1, −1)` of the corner piece. -/
theorem tau_SO : (!![-1, 0, 0; 0, 1, 0; 0, 0, -1] : M3) ∈ SO3 := by
  rw [Matrix.mem_specialOrthogonalGroup_iff]
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).2 ?_, ?_⟩
  · ext i j; fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_three]
  · simp [Matrix.det_fin_three]

end

#assert_std_axioms PackLean.Formal.TetintCase.tetintet_of_far PackLean.Formal.TetintCase.upper_of_rows
  PackLean.Formal.TetintCase.tet_lower_D PackLean.Formal.TetintCase.qrot_SO PackLean.Formal.TetintCase.tau_SO

end PackLean.Formal.TetintCase
