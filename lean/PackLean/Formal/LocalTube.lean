import PackLean.D30S3.Core
import PackLean.Formal.LocalW

/-!
# D45 stage 5b (part 1): the tube of octinico (`D30S3.Core`) — the far tree and the substitution

`D30S3.Core` (octinico_n02, D30 stage 3) replaces the local cube `L` of `D16.Core` by a **tube**
around the line of minimisers `p = τ·n` of chart 0:
`{TC − TW ≤ τ ≤ TC + TW, |y₁|, |y₂| ≤ ρ₀}` in the coordinates `p = τ n + y₁ e₁ + y₂ e₂`.

This file gives the parts that do not involve the duality of the mixed leaves:

* `runT_cover` / `farRunT_cover`: the far tree `farRunT` covers the four chart cubes
  (the copy of `CoverTreeG.run_cover` with the leaf `L` replaced by `insideTube`);
* `coordIn_spec`, `coord_box`, `insideTube_spec`: a box that passed `insideTube` lies in the tube
  (the coordinates are linear, so the 8 corners suffice);
* `far_mainT`: the far region of octinico — `S ≥ S̄`, or the rotation is a point of chart 0 in the
  tube (`InTube`), the copy of `FarG.far_main`;
* `pow_fold_spec`, `subst_spec`, `homScale_spec`, `divRho_spec`: the meaning of the substitution
  `subst`, the scaling `homScale` and the division by `ρ` `divRho` of the local check.

The local part (the faces of the tube, the single leaves, the mixed leaves with the pair lift and
`R* = spin(τ₀)`) is the next part (D45_s4_design 8.7).
-/

namespace PackLean.Formal.LocalTube

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet RBox rboxWf split3)
open PackLean.D16 (Prob Tok WState rRoots acceptOk discLb Term termsOk boundsOk groupOk z3)
open PackLean.D30S3 (S3 tubeOk insideTube leafOkT wstepT farRunT corners coordIn tauLo tauHi idot
  subst homScale divRho decHead degLe monoDeg)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf pEval)
open PackLean.Formal.PolySem (monoEval monoEval_three)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.FarG (box_entries disc_trace group_pair gM kM)
open scoped Matrix

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## The far tree `farRunT` -/

/-- What a leaf of `farRunT` certifies. -/
def GoodT (P : Prob) (X : S3) (b : RBox) : Prop :=
  rboxWf b = true ∧
    (insideTube P X b = true ∨
     (∃ m, m < P.pairs.length ∧ discLb P b m > 0) ∨
     (∃ mu ts, acceptOk P b mu ts = true))

theorem wstepT_ok_false (P : Prob) (X : S3) (s : WState) (t : Tok) (h : s.ok = false) :
    (wstepT P X s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstepT, hst, h]

theorem foldlT_ok_false (P : Prob) (X : S3) :
    ∀ (toks : List Tok) (s : WState), s.ok = false → (toks.foldl (wstepT P X) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstepT_ok_false P X s t h)

theorem leafT_good (P : Prob) (X : S3) (b : RBox) (t : Tok) (ht : t ≠ .split)
    (hw : rboxWf b = true) (hl : leafOkT P X b t = true) : GoodT P X b := by
  refine ⟨hw, ?_⟩
  cases t with
  | split => exact absurd rfl ht
  | L => exact Or.inl hl
  | D m =>
    simp only [leafOkT, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inl ⟨m, hl.1, hl.2⟩)
  | A mu ts => exact Or.inr (Or.inr ⟨mu, ts, hl⟩)

/-- **Tree soundness** (the copy of `CoverTreeG.run_cover`). -/
theorem runT_cover (P : Prob) (X : S3) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstepT P X) s).ok = true →
      (toks.foldl (wstepT P X) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, GoodT P X B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstepT P X s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldlT_ok_false P X toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstepT P X s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstepT, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          have : (wstepT P X s .L).ok = (s.ok && rboxWf B && leafOkT P X B .L) := by
            simp [wstepT, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leafT_good P X B .L (by simp) hok'.1.2 hok'.2, hz⟩
        | D m =>
          have : (wstepT P X s (.D m)).ok = (s.ok && rboxWf B && leafOkT P X B (.D m)) := by
            simp [wstepT, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leafT_good P X B (.D m) (by simp) hok'.1.2 hok'.2, hz⟩
        | A mu ts =>
          have : (wstepT P X s (.A mu ts)).ok = (s.ok && rboxWf B && leafOkT P X B (.A mu ts)) := by
            simp [wstepT, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leafT_good P X B (.A mu ts) (by simp) hok'.1.2 hok'.2, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstepT P X s t).stack := by
          intro C hC; cases t <;> simp [wstepT, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The four chart cubes** for `farRunT`. -/
theorem farRunT_cover (P : Prob) (X : S3) (toks : List Tok) (h : (farRunT P X toks).1 = true)
    (ch : ℕ) (hch : ch < 4) (y : Fin 3 → ℝ) (hy : ∀ i, |y i| ≤ (P.rden : ℝ)) :
    ∃ B, GoodT P X B ∧ InBox B ch y := by
  simp only [farRunT, Bool.and_eq_true, List.isEmpty_iff] at h
  refine runT_cover P X toks _ h.1 h.2 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden, P.rden⟩,
    ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-! ## The tube coordinates -/

/-- `Σ b_i y_i` for an integer vector `b` (its first three entries). -/
def lin (b : List ℤ) (y : Fin 3 → ℝ) : ℝ :=
  ((nth b 0 0 : ℤ) : ℝ) * y 0 + ((nth b 1 0 : ℤ) : ℝ) * y 1 + ((nth b 2 0 : ℤ) : ℝ) * y 2

/-- The value of a rational pair `(num, den)`. -/
def qv2 (q : ℤ × ℕ) : ℝ := (q.1 : ℝ) / q.2

/-- The tube coordinate of `u` (in units of `rden`) along `b / ed`: `(u·b)·ed / (rden·|b|²)`, i.e. the
coordinate `(p·b')/|b'|²` of the point `p = u / rden` along `b' = b / ed`. -/
def tco (rden : ℤ) (ed : ℕ) (b : List ℤ) (u : Fin 3 → ℝ) : ℝ := lin b u * ed / (rden * idot b b)

/-- The point `u` (chart 0, units of `rden`) lies in the tube of `X`. -/
def InTube (X : S3) (rden : ℤ) (u : Fin 3 → ℝ) : Prop :=
  qv2 (tauLo X) ≤ tco rden X.ed X.n u ∧ tco rden X.ed X.n u ≤ qv2 (tauHi X) ∧
  |tco rden X.ed X.e1 u| ≤ qv2 X.rho0 ∧ |tco rden X.ed X.e2 u| ≤ qv2 X.rho0

theorem idot_three (x y z b0 b1 b2 : ℤ) : idot [x, y, z] [b0, b1, b2] = x * b0 + y * b1 + z * b2 := by
  simp [idot]

theorem lin_three (b0 b1 b2 : ℤ) (y : Fin 3 → ℝ) :
    lin [b0, b1, b2] y = (b0 : ℝ) * y 0 + b1 * y 1 + b2 * y 2 := by
  simp [lin, nth]

/-- One corner that passed `coordIn`: the bounds, multiplied out. -/
theorem coordIn_spec {rden : ℤ} {ed : ℕ} {b : List ℤ} (hb : b.length = 3) {lo hi : ℤ × ℕ}
    (hlo : 0 < lo.2) (hhi : 0 < hi.2) {x y z : ℤ} (h : coordIn rden ed [x, y, z] b lo hi = true) :
    qv2 lo * (rden * idot b b) ≤ lin b ![(x : ℝ), y, z] * ed ∧
      lin b ![(x : ℝ), y, z] * ed ≤ qv2 hi * (rden * idot b b) := by
  obtain ⟨b0, b1, b2, rfl⟩ := List.length_eq_three.1 hb
  simp only [coordIn, idot_three, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨h1, h2⟩ := h
  have hl : (0 : ℝ) < lo.2 := by exact_mod_cast hlo
  have hh : (0 : ℝ) < hi.2 := by exact_mod_cast hhi
  have e1 : ((lo.1 * (rden * (b0 * b0 + b1 * b1 + b2 * b2)) : ℤ) : ℝ) ≤
      (((x * b0 + y * b1 + z * b2) * ed * lo.2 : ℤ) : ℝ) := by exact_mod_cast h1
  have e2 : ((((x * b0 + y * b1 + z * b2) * ed * hi.2 : ℤ)) : ℝ) ≤
      ((hi.1 * (rden * (b0 * b0 + b1 * b1 + b2 * b2)) : ℤ) : ℝ) := by exact_mod_cast h2
  rw [idot_three]
  push_cast at e1 e2 ⊢
  rw [lin_three]
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons,
    Matrix.tail_cons]
  unfold qv2
  constructor
  · rw [div_mul_eq_mul_div, div_le_iff₀ hl]; linarith
  · rw [div_mul_eq_mul_div, le_div_iff₀ hh]; linarith

theorem mem_corners (B : RBox) {x y z : ℤ} (hx : x = B.l0 ∨ x = B.h0) (hy : y = B.l1 ∨ y = B.h1)
    (hz : z = B.l2 ∨ z = B.h2) : [x, y, z] ∈ corners B := by
  simp only [corners, List.foldr_cons, List.foldr_nil, List.map_cons, List.map_nil, List.cons_append,
    List.nil_append, List.mem_cons, List.not_mem_nil, or_false]
  rcases hx with rfl | rfl <;> rcases hy with rfl | rfl <;> rcases hz with rfl | rfl <;> simp

/-- One coordinate: an endpoint below (and one above) `b_i · u_i`. -/
theorem end_lo (bi l h : ℤ) (ui : ℝ) (hl : (l : ℝ) ≤ ui) (hh : ui ≤ h) :
    ∃ x : ℤ, (x = l ∨ x = h) ∧ (bi : ℝ) * x ≤ bi * ui := by
  rcases le_total 0 bi with hb | hb
  · exact ⟨l, Or.inl rfl, mul_le_mul_of_nonneg_left hl (by exact_mod_cast hb)⟩
  · exact ⟨h, Or.inr rfl, mul_le_mul_of_nonpos_left hh (by exact_mod_cast hb)⟩

theorem end_hi (bi l h : ℤ) (ui : ℝ) (hl : (l : ℝ) ≤ ui) (hh : ui ≤ h) :
    ∃ x : ℤ, (x = l ∨ x = h) ∧ (bi : ℝ) * ui ≤ bi * x := by
  rcases le_total 0 bi with hb | hb
  · exact ⟨h, Or.inr rfl, mul_le_mul_of_nonneg_left hh (by exact_mod_cast hb)⟩
  · exact ⟨l, Or.inl rfl, mul_le_mul_of_nonpos_left hl (by exact_mod_cast hb)⟩

/-- **A linear coordinate on a box** is bounded by its values at the corners: if every corner passed
`coordIn … lo hi`, every point of the box has its coordinate in `[lo, hi]`. -/
theorem coord_box {rden : ℤ} (hrd : 0 < rden) {ed : ℕ} {b : List ℤ} (hb : b.length = 3)
    (hbb : 0 < idot b b) {lo hi : ℤ × ℕ} (hlo : 0 < lo.2) (hhi : 0 < hi.2) {B : RBox}
    (hall : ∀ Pt ∈ corners B, coordIn rden ed Pt b lo hi = true) {ch : ℕ} {u : Fin 3 → ℝ}
    (hin : InBox B ch u) : qv2 lo ≤ tco rden ed b u ∧ tco rden ed b u ≤ qv2 hi := by
  obtain ⟨_, hy⟩ := hin
  have h0 := hy 0; have h1 := hy 1; have h2 := hy 2
  simp only [bLo, bHi, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    Matrix.head_cons, Matrix.tail_cons] at h0 h1 h2
  obtain ⟨b0, b1, b2, rfl⟩ := List.length_eq_three.1 hb
  obtain ⟨x0, hx0, ex0⟩ := end_lo b0 _ _ _ h0.1 h0.2
  obtain ⟨x1, hx1, ex1⟩ := end_lo b1 _ _ _ h1.1 h1.2
  obtain ⟨x2, hx2, ex2⟩ := end_lo b2 _ _ _ h2.1 h2.2
  obtain ⟨z0, hz0, ez0⟩ := end_hi b0 _ _ _ h0.1 h0.2
  obtain ⟨z1, hz1, ez1⟩ := end_hi b1 _ _ _ h1.1 h1.2
  obtain ⟨z2, hz2, ez2⟩ := end_hi b2 _ _ _ h2.1 h2.2
  have cl := (coordIn_spec (by rfl) hlo hhi (hall _ (mem_corners B hx0 hx1 hx2))).1
  have ch' := (coordIn_spec (by rfl) hlo hhi (hall _ (mem_corners B hz0 hz1 hz2))).2
  rw [lin_three] at cl ch'
  simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two, Matrix.head_cons,
    Matrix.tail_cons] at cl ch'
  have hs : (0 : ℝ) < rden * idot [b0, b1, b2] [b0, b1, b2] := by
    have : (0 : ℝ) < idot [b0, b1, b2] [b0, b1, b2] := by exact_mod_cast hbb
    have : (0 : ℝ) < rden := by exact_mod_cast hrd
    positivity
  have hed : (0 : ℝ) ≤ ed := by positivity
  unfold tco
  rw [lin_three]
  constructor
  · rw [le_div_iff₀ hs]
    have : (b0 * x0 + b1 * x1 + b2 * x2 : ℝ) * ed ≤ (b0 * u 0 + b1 * u 1 + b2 * u 2) * ed :=
      mul_le_mul_of_nonneg_right (by linarith) hed
    linarith
  · rw [div_le_iff₀ hs]
    have : (b0 * u 0 + b1 * u 1 + b2 * u 2 : ℝ) * ed ≤ (b0 * z0 + b1 * z1 + b2 * z2) * ed :=
      mul_le_mul_of_nonneg_right (by linarith) hed
    linarith

theorem tubeOk_spec {X : S3} (h : tubeOk X = true) :
    X.n.length = 3 ∧ X.e1.length = 3 ∧ X.e2.length = 3 ∧ 0 < idot X.n X.n ∧ 0 < idot X.e1 X.e1 ∧
      0 < idot X.e2 X.e2 ∧ 0 < X.tc.2 ∧ 0 < X.tw.2 ∧ 0 < X.rho0.2 ∧
      idot X.n X.e1 = 0 ∧ idot X.n X.e2 = 0 ∧ idot X.e1 X.e2 = 0 ∧ 0 < X.ed ∧ 0 < X.tw.1 ∧
      0 < X.rho0.1 := by
  simp only [tubeOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩, h12⟩, h13⟩, h14⟩, h15⟩ := h
  exact ⟨h1, h2, h3, h7, h8, h9, h11, h12, h13, h4, h5, h6, h10, h14, h15⟩

/-- **A box that passed `insideTube` lies in the tube.** -/
theorem insideTube_spec {P : Prob} {X : S3} (hX : tubeOk X = true) (hrd : 0 < P.rden) {B : RBox}
    (h : insideTube P X B = true) {ch : ℕ} {u : Fin 3 → ℝ} (hin : InBox B ch u) :
    ch = 0 ∧ InTube X P.rden u := by
  obtain ⟨hn, he1, he2, hnn, h11, h22, htc, htw, hr0, -⟩ := tubeOk_spec hX
  simp only [insideTube, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨hch, hall⟩ := h
  have hd : 0 < (tauLo X).2 := by simp only [tauLo]; positivity
  have hd' : 0 < (tauHi X).2 := by simp only [tauHi]; positivity
  have c1 := coord_box hrd hn hnn hd hd' (fun Pt hPt => (hall Pt hPt).1.1) hin
  have c2 := coord_box hrd he1 h11 (lo := (-X.rho0.1, X.rho0.2)) hr0 hr0
    (fun Pt hPt => (hall Pt hPt).1.2) hin
  have c3 := coord_box hrd he2 h22 (lo := (-X.rho0.1, X.rho0.2)) hr0 hr0
    (fun Pt hPt => (hall Pt hPt).2) hin
  have hneg : qv2 (-X.rho0.1, X.rho0.2) = -qv2 X.rho0 := by unfold qv2; push_cast; ring
  rw [hneg] at c2 c3
  exact ⟨hin.1 ▸ hch, c1.1, c1.2, abs_le.2 c2, abs_le.2 c3⟩

/-! ## The far region of the tube -/

/-- **The far region of octinico** (the copy of `FarG.far_main` with `farRunT`): every feasible
`(R, t, S)` with `R ∈ SO(3)` of largest trace in its orbit has `S ≥ S̄`, or `R` is a point `u` of
chart 0 in the tube. -/
theorem far_mainT {P : Prob} {X : S3} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P) (hrden : 0 < P.rden) (hbo : boundsOk P = true) (hgrp : groupOk P = true)
    (hX : tubeOk X = true)
    {toks : List Tok} (hfar : (farRunT P X toks).1 = true)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hmax : ∀ g ∈ Orbit.Gset (NCv P) P.normals.length, ∀ k ∈ Orbit.Kset (Vv P) P.verts.length (N0v P),
      g.det * k.det = 1 → (g * R * k).trace ≤ R.trace) :
    Sb P ≤ S ∨ ∃ u, Charts.ChartPt R P.rden 0 u ∧ InTube X P.rden u := by
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact Or.inl (outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt)
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  obtain ⟨ch, hch, u, hc⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := farRunT_cover P X toks hfar ch hch u
    (fun i => abs_le.2 ⟨(hc.1 i).1, (hc.1 i).2⟩)
  obtain ⟨s, hs, hsu⟩ := box_param hwB u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hc hin.1 hsu
  rcases hgood with hL | ⟨m, hm, hD⟩ | ⟨mu, ts, hA⟩
  · obtain ⟨rfl, hu⟩ := insideTube_spec hX hrden hL hin
    exact Or.inr ⟨u, hc, hu⟩
  · exfalso
    have htr := disc_trace hb hKb hwf hdg hdk hD hs hNv hent
    obtain ⟨hg, hk, hdet⟩ := group_pair hwf hd hdg hdk hgrp hm
    have := hmax _ hg _ hk hdet
    unfold gM kM at this
    linarith
  · left
    have hG := accept_G hb hKb hwf hd hA hs hNv hent hN
    have hts : termsOk P ts = true := by
      simp only [acceptOk, Bool.and_eq_true] at hA; exact hA.1
    exact accept_bound hG hts hq hTr hPT hLP hout

/-! ## The substitution, the scaling and the division by `ρ` -/

section Poly

variable {ps : List ℕ}

/-- `acc · Q^k` by repeated `pmul`. -/
theorem pow_fold_spec (Q : Poly) (hQ : PolySemG.WF ps Q) (z : Fin 3 → ℝ) :
    ∀ (k : ℕ) (acc : Poly), PolySemG.WF ps acc →
      PolySemG.WF ps ((List.range k).foldl (fun acc2 _ => pmul ps acc2 Q) acc) ∧
      pEval ps ((List.range k).foldl (fun acc2 _ => pmul ps acc2 Q) acc) z =
        pEval ps acc z * pEval ps Q z ^ k := by
  intro k
  induction k with
  | zero => intro acc h; simp [h]
  | succ k ih =>
    intro acc h
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    obtain ⟨h1, h2⟩ := ih acc h
    refine ⟨PolySemG.pmul_WF h1 hQ, ?_⟩
    rw [PolySemG.pEval_pmul z h1 hQ, h2]
    ring

/-- The value of the substituted variables. -/
def subV (ps : List ℕ) (Xs : List Poly) (z : Fin 3 → ℝ) : Fin 3 → ℝ :=
  fun i => pEval ps (nth Xs i.val []) z

theorem nth_WF {Xs : List Poly} (hX : ∀ q ∈ Xs, PolySemG.WF ps q) (i : ℕ) :
    PolySemG.WF ps (nth Xs i []) := by
  unfold nth
  rcases Nat.lt_or_ge i Xs.length with h | h
  · rw [List.getD_eq_getElem _ _ h]; exact hX _ (List.getElem_mem h)
  · rw [List.getD_eq_default _ _ h]; intro e he; simp at he

/-- One term of `subst`. -/
theorem subst_term (Xs : List Poly) (hX : ∀ q ∈ Xs, PolySemG.WF ps q) (z : Fin 3 → ℝ)
    (m : Mono) (hm : m.length = 3) (a : FE) (ha : Len ps a) :
    PolySemG.WF ps ((List.zip (List.range 3) m).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmul ps acc2 (nth Xs y.1 [])) acc) [(z3, a)]) ∧
    pEval ps ((List.zip (List.range 3) m).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmul ps acc2 (nth Xs y.1 [])) acc) [(z3, a)]) z =
      fval ps a * monoEval m (subV ps Xs z) := by
  obtain ⟨m0, m1, m2, rfl⟩ := List.length_eq_three.1 hm
  have h3 : List.range 3 = [0, 1, 2] := rfl
  rw [h3]
  simp only [List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil]
  have hw0 : PolySemG.WF ps [(z3, a)] := by
    intro e he; simp at he; subst he; exact ⟨rfl, ha⟩
  obtain ⟨w1, v1⟩ := pow_fold_spec _ (nth_WF hX 0) z m0 _ hw0
  obtain ⟨w2, v2⟩ := pow_fold_spec _ (nth_WF hX 1) z m1 _ w1
  obtain ⟨w3, v3⟩ := pow_fold_spec _ (nth_WF hX 2) z m2 _ w2
  refine ⟨w3, ?_⟩
  rw [v3, v2, v1, monoEval_three]
  simp [z3, monoEval_three, subV]
  ring

/-- **The substitution**: `subst ps Xs p` at `z` is `p` at the values of the `Xs` at `z`. -/
theorem subst_spec (Xs : List Poly) (hX : ∀ q ∈ Xs, PolySemG.WF ps q) (z : Fin 3 → ℝ) :
    ∀ (p : Poly), PolySemG.WF ps p →
      PolySemG.WF ps (subst ps Xs p) ∧ pEval ps (subst ps Xs p) z = pEval ps p (subV ps Xs z) := by
  intro p hp
  have hall : ∀ r ∈ p.map (fun (x : Mono × FE) =>
      (List.zip (List.range 3) x.1).foldl (fun acc (y : ℕ × ℕ) =>
        (List.range y.2).foldl (fun acc2 _ => pmul ps acc2 (nth Xs y.1 [])) acc) [(z3, x.2)]),
      PolySemG.WF ps r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (subst_term Xs hX z e.1 (hp e he).1 e.2 (hp e he).2).1
  have heq : subst ps Xs p = psum (p.map (fun (x : Mono × FE) =>
      (List.zip (List.range 3) x.1).foldl (fun acc (y : ℕ × ℕ) =>
        (List.range y.2).foldl (fun acc2 _ => pmul ps acc2 (nth Xs y.1 [])) acc) [(z3, x.2)])) := rfl
  rw [heq]
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum z hall, List.map_map]
  clear hall heq
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [PolySemG.WF_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, PolySemG.pEval_cons, Function.comp_apply,
      (subst_term Xs hX z e.1 hp.1.1 e.2 hp.1.2).2]

theorem monoEval_div {m : Mono} (hm : m.length = 3) (y : Fin 3 → ℝ) (K : ℝ) :
    monoEval m (fun i => y i / K) = monoEval m y / K ^ monoDeg m := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  simp only [monoEval_three, monoDeg, List.foldl_cons, List.foldl_nil, zero_add, div_pow, pow_add]
  field_simp

/-- **The scaling** `homScale K d p` at `y` is `K^d · p(y / K)` when `p` has degree at most `d`. -/
theorem homScale_spec (K : ℤ) (hK : K ≠ 0) (d : ℕ) (y : Fin 3 → ℝ) :
    ∀ (p : Poly), PolySemG.WF ps p → degLe d p = true →
      PolySemG.WF ps (homScale K d p) ∧
      pEval ps (homScale K d p) y = (K : ℝ) ^ d * pEval ps p (fun i => y i / K) := by
  intro p
  induction p with
  | nil => intro _ _; simp [homScale]
  | cons e p ih =>
    intro hp hdeg
    rw [PolySemG.WF_cons] at hp
    simp only [degLe, List.all_cons, Bool.and_eq_true, decide_eq_true_eq] at hdeg
    have hdeg' : degLe d p = true := by simpa [degLe] using hdeg.2
    obtain ⟨ih1, ih2⟩ := ih hp.2 hdeg'
    have hcons : homScale K d (e :: p) = (e.1, fsmul (K ^ (d - monoDeg e.1)) e.2) :: homScale K d p :=
      rfl
    rw [hcons]
    refine ⟨PolySemG.WF_cons.2 ⟨⟨hp.1.1, len_fsmul _ hp.1.2⟩, ih1⟩, ?_⟩
    rw [PolySemG.pEval_cons, PolySemG.pEval_cons, ih2, fval_fsmul, monoEval_div hp.1.1]
    have hKr : (K : ℝ) ≠ 0 := by exact_mod_cast hK
    have hpow : (K : ℝ) ^ d = (K : ℝ) ^ (d - monoDeg e.1) * (K : ℝ) ^ monoDeg e.1 := by
      rw [← pow_add, Nat.sub_add_cancel hdeg.1]
    push_cast
    rw [hpow]
    field_simp

/-- **The division by `ρ`**: if `divRho p = some G`, then `p = ρ · G` (`ρ` the first variable). -/
theorem divRho_spec (z : Fin 3 → ℝ) :
    ∀ (p : Poly) (G : Poly), PolySemG.WF ps p → divRho p = some G →
      PolySemG.WF ps G ∧ pEval ps p z = z 0 * pEval ps G z := by
  intro p
  induction p with
  | nil =>
    intro G _ h
    simp only [divRho, List.all_nil, if_true, List.filterMap_nil, Option.some.injEq] at h
    subst h; simp
  | cons e p ih =>
    intro G hp h
    rw [PolySemG.WF_cons] at hp
    unfold divRho at h
    split_ifs at h with hall
    simp only [Option.some.injEq] at h
    subst h
    simp only [List.all_cons, Bool.and_eq_true, Bool.or_eq_true, decide_eq_true_eq] at hall
    have hrest : divRho p = some (p.filterMap (fun (x : Mono × FE) =>
        if fIsZero x.2 then none else some (decHead x.1, x.2))) := by
      unfold divRho; rw [if_pos hall.2]
    obtain ⟨ih1, ih2⟩ := ih _ hp.2 hrest
    rw [List.filterMap_cons]
    by_cases hz : fIsZero e.2 = true
    · rw [if_pos hz]
      refine ⟨ih1, ?_⟩
      rw [PolySemG.pEval_cons, ih2, fval_of_isZero _ hz]; ring
    · rw [if_neg hz]
      have hh : e.1.headD 0 > 0 := by
        rcases hall.1 with h1 | h1
        · exact h1
        · exact absurd h1 hz
      obtain ⟨m0, m1, m2, hm⟩ := List.length_eq_three.1 hp.1.1
      have hdec : decHead e.1 = [m0 - 1, m1, m2] := by rw [hm]; rfl
      have hm0 : 0 < m0 := by rw [hm] at hh; simpa using hh
      refine ⟨PolySemG.WF_cons.2 ⟨⟨by rw [hdec]; rfl, hp.1.2⟩, ih1⟩, ?_⟩
      rw [PolySemG.pEval_cons, PolySemG.pEval_cons, ih2, hdec, hm, monoEval_three, monoEval_three]
      obtain ⟨k, rfl⟩ := Nat.exists_eq_add_of_lt hm0
      simp only [zero_add, Nat.add_sub_cancel, pow_succ]
      ring

end Poly

end

#assert_std_axioms PackLean.Formal.LocalTube.far_mainT PackLean.Formal.LocalTube.subst_spec
  PackLean.Formal.LocalTube.homScale_spec PackLean.Formal.LocalTube.divRho_spec

end PackLean.Formal.LocalTube
