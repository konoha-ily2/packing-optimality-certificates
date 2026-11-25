import PackLean.Formal.CubinoctFar
import PackLean.D16.CubOct.K.Far

/-!
# D45 stage 2e: the far region of `cubinoct_n02`

Combines the tree (`CoverTree`), the accepted boxes (`CubinoctFar.accept_box`), the constants
(`farConstsOk`) and the certificate run `K.cover_far_ok` (`decide +kernel`, E3a″):

`cubinoct_far`: for `(b, γ, τ)` in the domain `D` and outside the local box `L`, with `R = Rmat b γ τ`
orthogonal, every feasible `(t, S)` of the LP has `S > S* = 1 + √2/2`.
-/

namespace PackLean.Formal.Far

open PackLean.D28 PackLean.D16C PackLean.D16 PackLean.D16.CubOct PackLean.Formal.CoverTree
open Finset

/-- The domain `D` of §8 (`reduction_symmetric.md`). -/
def inD (b γ τ : ℝ) : Prop := 0 ≤ b ∧ b ≤ γ ∧ b ^ 2 + (γ + 1) ^ 2 ≤ 2 ∧ 0 ≤ τ ∧ τ ≤ 1

/-- The local box `L = [0, 1/16]² × [3/8, 7/16]`. -/
def inL (b γ τ : ℝ) : Prop := b ≤ 1 / 16 ∧ γ ≤ 1 / 16 ∧ 3 / 8 ≤ τ ∧ τ ≤ 7 / 16

/-! ## `‖t‖₁ ≤ S − √3/2` for an orthogonal `R` -/

theorem gSup_ge {R : Matrix (Fin 3) (Fin 3) ℝ} (hR : R ∈ Matrix.orthogonalGroup (Fin 3) ℝ)
    (σ : Sgn) : √3 / 2 ≤ gSup R σ := by
  have hRR := congrFun₂ ((Matrix.mem_orthogonalGroup_iff (Fin 3) ℝ).1 hR)
  have horth : ∀ i i', ∑ j, R i j * R i' j = if i = i' then 1 else 0 := fun i i' => by
    have := hRR i i'
    simpa [Matrix.mul_apply, Matrix.one_apply, Matrix.star_eq_conjTranspose] using this
  have hsv : ∀ i, sv σ i * sv σ i = 1 := fun i => by unfold sv; split_ifs <;> norm_num
  set a : Fin 3 → ℝ := fun j => ∑ i, sv σ i * R i j with ha
  have hsq : ∑ j, a j ^ 2 = 3 := by
    have h00 := horth 0 0; have h01 := horth 0 1; have h02 := horth 0 2
    have h11 := horth 1 1; have h12 := horth 1 2; have h22 := horth 2 2
    simp only [Fin.sum_univ_three] at h00 h01 h02 h11 h12 h22
    norm_num at h00 h01 h02 h11 h12 h22
    have s0 := hsv 0; have s1 := hsv 1; have s2 := hsv 2
    simp only [ha, Fin.sum_univ_three]
    linear_combination (sv σ 0 * sv σ 0) * h00 + (2 * sv σ 0 * sv σ 1) * h01
      + (2 * sv σ 0 * sv σ 2) * h02 + (sv σ 1 * sv σ 1) * h11 + (2 * sv σ 1 * sv σ 2) * h12
      + (sv σ 2 * sv σ 2) * h22 + s0 + s1 + s2
  have habs : 3 ≤ (∑ j, |a j|) ^ 2 := by
    rw [← hsq]
    simp only [Fin.sum_univ_three]
    nlinarith [abs_nonneg (a 0), abs_nonneg (a 1), abs_nonneg (a 2), sq_abs (a 0), sq_abs (a 1),
      sq_abs (a 2), mul_nonneg (abs_nonneg (a 0)) (abs_nonneg (a 1)),
      mul_nonneg (abs_nonneg (a 0)) (abs_nonneg (a 2)), mul_nonneg (abs_nonneg (a 1)) (abs_nonneg (a 2))]
  have hsum0 : 0 ≤ ∑ j, |a j| := sum_nonneg fun j _ => abs_nonneg _
  have h3 : √3 ≤ ∑ j, |a j| := by
    rw [show ∑ j, |a j| = √((∑ j, |a j|) ^ 2) from (Real.sqrt_sq hsum0).symm]
    exact Real.sqrt_le_sqrt habs
  show √3 / 2 ≤ 1 / 2 * ∑ j, |a j|
  linarith

theorem t_bound {R : Matrix (Fin 3) (Fin 3) ℝ} (hR : R ∈ Matrix.orthogonalGroup (Fin 3) ℝ)
    {t : E3} {S : ℝ} (h : cubeLP R t S) : ∑ i, |t i| ≤ S - √3 / 2 := by
  let σ : Sgn := fun i => decide (t i < 0)
  have hrow := h.1 σ
  have hσ : ∀ i, sv σ i * t i = |t i| := fun i => by
    simp only [sv, σ]
    by_cases hi : t i < 0
    · simp [hi, abs_of_neg hi]
    · simp [hi, abs_of_nonneg (not_lt.1 hi)]
  simp only [hσ] at hrow
  have := gSup_ge hR σ
  linarith

/-! ## The constants -/

theorem consts (hc : farConstsOk CP = true) :
    1 + √2 / 2 < (CP.sbar.1 : ℝ) / CP.sbar.2 ∧
    (CP.sbar.1 : ℝ) / CP.sbar.2 - √3 / 2 ≤ (CP.t1.1 : ℝ) / CP.t1.2 := by
  simp only [farConstsOk, Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true] at hc
  obtain ⟨⟨⟨⟨⟨⟨⟨hsd, htd⟩, hgt⟩, hsq⟩, hT⟩, _⟩, _⟩, _⟩ := hc
  set sn : ℝ := ((CP.sbar.1 : ℤ) : ℝ)
  set sd : ℝ := (CP.sbar.2 : ℝ)
  set tn : ℝ := ((CP.t1.1 : ℤ) : ℝ)
  set td : ℝ := (CP.t1.2 : ℝ)
  have hsd' : (0 : ℝ) < sd := by simp only [sd]; exact_mod_cast hsd
  have htd' : (0 : ℝ) < td := by simp only [td]; exact_mod_cast htd
  have hgt' : sd < sn := by simp only [sd, sn]; exact_mod_cast hgt
  have hsq' : sd * sd < 2 * (sn - sd) * (sn - sd) := by simp only [sd, sn]; exact_mod_cast hsq
  constructor
  · -- (S̄ − 1)² > 1/2
    have h1 : 0 < sn / sd - 1 := by rw [sub_pos, one_lt_div hsd']; exact hgt'
    have h2 : 1 / 2 < (sn / sd - 1) ^ 2 := by
      rw [div_sub_one hsd'.ne', div_pow, lt_div_iff₀ (by positivity)]
      nlinarith
    have h3 : √2 / 2 < sn / sd - 1 := by
      have hs : √2 / 2 = √(1 / 2) := by
        rw [show (1 : ℝ) / 2 = 2 / 4 by norm_num, Real.sqrt_div' _ (by norm_num : (0:ℝ) ≤ 4)]
        rw [show (4 : ℝ) = 2 ^ 2 by norm_num, Real.sqrt_sq (by norm_num)]
      rw [hs, ← Real.sqrt_sq h1.le]
      exact Real.sqrt_lt_sqrt (by norm_num) h2
    linarith
  · have hdiv : sn / sd - tn / td = (sn * td - tn * sd) / (sd * td) := by field_simp
    rw [show sn / sd - √3 / 2 ≤ tn / td ↔ sn / sd - tn / td ≤ √3 / 2 by constructor <;> intro <;> linarith,
      hdiv]
    rcases hT with hT | hT
    · have : (sn * td - tn * sd) ≤ 0 := by simp only [sn, td, tn, sd]; exact_mod_cast hT
      have : (sn * td - tn * sd) / (sd * td) ≤ 0 := div_nonpos_of_nonpos_of_nonneg this (by positivity)
      have : 0 ≤ √3 / 2 := by positivity
      linarith
    · have hT' : 4 * (sn * td - tn * sd) * (sn * td - tn * sd) ≤ 3 * (sd * td) * (sd * td) := by
        simp only [sn, td, tn, sd]; exact_mod_cast hT
      have hpos : 0 < sd * td := mul_pos hsd' htd'
      have h4 : ((sn * td - tn * sd) / (sd * td)) ^ 2 ≤ 3 / 4 := by
        rw [div_pow, div_le_iff₀ (by positivity)]; nlinarith
      have h5 : |(sn * td - tn * sd) / (sd * td)| ≤ √3 / 2 := by
        rw [show √3 / 2 = √(3 / 4) by
          rw [Real.sqrt_div' _ (by norm_num : (0:ℝ) ≤ 4), show (4 : ℝ) = 2 ^ 2 by norm_num,
            Real.sqrt_sq (by norm_num)]]
        rw [← Real.sqrt_sq_eq_abs]
        exact Real.sqrt_le_sqrt h4
      exact (le_abs_self _).trans h5

/-! ## The far region -/

theorem CP_den : CP.den = 17592186044416 := rfl

/-- The far certificate run, applied to a point `z` (units of `den`). -/
theorem far_cover_CP (z : Fin 3 → ℝ) (h0 : 0 ≤ z 0 ∧ z 0 ≤ ((CP.den / 2 : ℤ) : ℝ))
    (h1 : 0 ≤ z 1 ∧ z 1 ≤ ((CP.den / 2 : ℤ) : ℝ)) (h2 : 0 ≤ z 2 ∧ z 2 ≤ (CP.den : ℝ)) :
    ∃ B, Good CP B ∧ inBox B z ∧ Inv B := by
  have hfar : (farAll CP ctoks0 ctoks1).1 = true := by rw [PackLean.D16.CubOct.K.cover_far_ok]
  exact farAll_cover CP ctoks0 ctoks1 hfar z h0 h1 h2 (by rw [CP_den]; norm_num)

/-- **The far region of `cubinoct_n02`.** -/
theorem cubinoct_far (b γ τ : ℝ) (hD : inD b γ τ) (hL : ¬ inL b γ τ)
    (hO : Rmat b γ τ ∈ Matrix.orthogonalGroup (Fin 3) ℝ) (t : E3) (S : ℝ)
    (hlp : cubeLP (Rmat b γ τ) t S) : 1 + √2 / 2 < S := by
  obtain ⟨hb0, hbg, hcirc, ht0, ht1⟩ := hD
  obtain ⟨hS1, hT1⟩ := consts PackLean.D16.CubOct.K.cover_consts_ok
  have hD : ((CP.den : ℤ) : ℝ) = 17592186044416 := by rw [CP_den]; norm_num
  have hhalf : (((CP.den / 2 : ℤ)) : ℝ) = 17592186044416 / 2 := by rw [CP_den]; norm_num
  have hg : γ ≤ 1 / 2 := by nlinarith
  set D : ℝ := 17592186044416 with hDdef
  have hD0 : 0 < D := by norm_num [hDdef]
  let z : Fin 3 → ℝ := ![D * b, D * γ, D * τ]
  obtain ⟨B, hgood, hz, hinv⟩ := far_cover_CP z
    ⟨by simp [z]; positivity, by simp [z]; rw [hhalf]; nlinarith⟩
    ⟨by simp [z]; nlinarith, by simp [z]; rw [hhalf]; nlinarith⟩
    ⟨by simp [z]; positivity, by simp [z]; rw [hD]; nlinarith⟩
  have hzb : z 0 / D = b := by simp [z]; field_simp
  have hzg : z 1 / D = γ := by simp [z]; field_simp
  have hzt : z 2 / D = τ := by simp [z]; field_simp
  obtain ⟨a1, a2, a3, a4, a5, a6⟩ := hz
  simp only [show z 0 = D * b from rfl, show z 1 = D * γ from rfl, show z 2 = D * τ from rfl]
    at a1 a2 a3 a4 a5 a6
  obtain ⟨i1, _, i3, _, _, _⟩ := hinv
  rcases hgood with ⟨hwf, lam, mu, eps, hacc⟩ | ⟨hwf, hin⟩ | hout
  · -- accepted box
    by_contra hS
    push Not at hS
    have hlt : S < (CP.sbar.1 : ℝ) / CP.sbar.2 := lt_of_le_of_lt hS hS1
    have htb := t_bound hO hlp
    have hacc' := accept_box CP B lam mu eps hacc hwf (by rw [CP_den]; norm_num) (by norm_num [CP])
      (by norm_num [CP]) (by norm_num [CP]) (by norm_num [CP]) z ⟨a1, a2, a3, a4, a5, a6⟩ t S
      (by rw [hD, hzb, hzg, hzt]; exact hlp) (by linarith)
    linarith
  · -- inside the local box
    exfalso; apply hL
    simp only [D16C.insideL, D16C.insideL.ratLeI, D16C.insideL.ratGeI, Bool.and_eq_true, decide_eq_true_eq] at hin
    obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hin
    have e : ∀ (x : ℤ) (r : ℤ × ℕ), x * r.2 ≤ r.1 * CP.den → (x : ℝ) * r.2 ≤ r.1 * D := fun x r h => by
      rw [← hD]; exact_mod_cast h
    have e' : ∀ (x : ℤ) (r : ℤ × ℕ), x * r.2 ≥ r.1 * CP.den → (x : ℝ) * r.2 ≥ r.1 * D := fun x r h => by
      rw [← hD]; exact_mod_cast h
    have k1 := e _ _ h1; have k2 := e _ _ h2; have k3 := e' _ _ h3; have k4 := e _ _ h4
    simp only [show CP.lbx = (1, 16) from rfl, show CP.lgx = (1, 16) from rfl,
      show CP.ltlo = (3, 8) from rfl, show CP.lthi = (7, 16) from rfl] at k1 k2 k3 k4
    push_cast at k1 k2 k3 k4
    refine ⟨le_of_mul_le_mul_left (by linarith) hD0, le_of_mul_le_mul_left (by linarith) hD0,
      le_of_mul_le_mul_left (by linarith) hD0, le_of_mul_le_mul_left (by linarith) hD0⟩
  · -- outside the domain
    exfalso
    simp only [outsideD, Bool.or_eq_true, decide_eq_true_eq] at hout
    have hl0 : (0 : ℝ) ≤ B.l0 := by exact_mod_cast i1
    have hl1 : (0 : ℝ) ≤ B.l1 := by exact_mod_cast i3
    rcases hout with (h | h) | h
    · have : (B.h1 : ℝ) < B.l0 := by exact_mod_cast h
      nlinarith
    · have : 2 * (CP.den : ℝ) * CP.den < (B.l0 : ℝ) * B.l0 + (B.l1 + CP.den) * (B.l1 + CP.den) := by
        exact_mod_cast h
      nlinarith [mul_le_mul a1 a1 hl0 (by linarith), mul_le_mul (add_le_add_right a3 D)
        (add_le_add_right a3 D) (by linarith) (by linarith)]
    · have h' : (B.l2 : ℝ) * (CP.tmax.2 : ℝ) > CP.tmax.1 * CP.den := by exact_mod_cast h
      simp only [show CP.tmax = (1, 1) from rfl] at h'
      push_cast at h'
      nlinarith

end PackLean.Formal.Far
