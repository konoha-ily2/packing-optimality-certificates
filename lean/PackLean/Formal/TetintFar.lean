import PackLean.Formal.OctFar
import PackLean.D40.Core

/-!
# A9 stage 7e (part 1): meaning of the far checks of `D40.Core` (tetintet)

Design: `plan/A9f_tet_design.md` §4 and §10.  `D40.Core` works with the piece scaled by `√2`
(vertices `ṽ = vt / 2`, `VD`) in the container `{b_f · x ≤ s̄/2}` (`cbD`).  The quadratics of `D40`
are those of `D31` (the same `Aff`, `Quad`, `rboxQ`, `rotQ`, `quadLb`, monomial order), so the value
lemmas of `OctFar` are used through the bridge `cvB` (`rotQ_eq`, `box_point`).

* `dualC`: the left branch of `TetReduction.Low` with `μ = p · b₂ + μ′` (types F and M) and the
  vertices of the candidate; `sumS`: the right branch (type S);
* `coefs_FM`, `coefs_S`: the integer coefficients `farCoefs` are `T · (dualC ± κ_N)` and
  `2 s_d · sumS − 4 s_n` (no case split on `s₁(R) ≤ s̄`: the weights are valid for every `R`);
* `accept_FM`, `accept_S` (token `A`), `disc_trace` (token `D`), `rot_krot` (the rotations of the
  piece are in `Krot`).
-/

namespace PackLean.Formal.TetintFar

open PackLean.D40 (Prm Cand decCand candOk farCoefs farLbAt farAccept NBox nboxWf discLb nth vt bvec
  RBox rboxQ rotQ nAt dotI vsub RatI)
open PackLean.Formal PackLean.Formal.PolyLP
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open PackLean.Formal.OctFar (qEval)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The bridge to the quadratics of `D31` -/

def cvB (b : RBox) : PackLean.D31.RBox := ⟨b.ch, b.l0, b.l1, b.l2, b.h0, b.h1, b.h2⟩

theorem rotQ_eq (den : ℤ) (b : RBox) :
    rotQ (rboxQ den b) = PackLean.D31.rotQ (PackLean.D31.rboxQ den (cvB b)) := by
  obtain ⟨ch, l0, l1, l2, h0, h1, h2⟩ := b
  rcases ch with _ | _ | _ | n <;> rfl

theorem rboxWf_eq (b : RBox) : PackLean.D40.rboxWf b = PackLean.D31.rboxWf (cvB b) := rfl

theorem qadd_eq (a b : List ℤ) : PackLean.D40.qadd a b = PackLean.D31.qadd a b := rfl
theorem qsmul_eq (c : ℤ) (a : List ℤ) : PackLean.D40.qsmul c a = PackLean.D31.qsmul c a := rfl
theorem qzero_eq : PackLean.D40.qzero = PackLean.D31.qzero := rfl
theorem nth_eq {α : Type*} (l : List α) (i : ℕ) (d : α) :
    nth l i d = PackLean.D31.nth l i d := rfl

theorem mget_length (den : ℤ) (b : RBox) (t : ℕ) :
    (nth (rotQ (rboxQ den b)).1 t PackLean.D40.qzero).length = 10 := by
  rw [rotQ_eq]; exact OctFar.mget_length den (cvB b) t

theorem q_length (den : ℤ) (b : RBox) : (rotQ (rboxQ den b)).2.length = 10 := by
  rw [rotQ_eq]; exact OctFar.q_length den (cvB b)

/-- The point `u` of a well-formed box: its box coordinate and the rotation entries. -/
theorem box_point {den : ℤ} {rb : RBox} (hwf : PackLean.D40.rboxWf rb = true) {R : M3}
    {u : Fin 3 → ℝ} (hcu : Charts.ChartPt R den rb.ch u) (hin : OctFar.InBox (cvB rb) rb.ch u) :
    ∃ s : Fin 3 → ℝ, (∀ i, |s i| ≤ 1) ∧ ∃ Nv : ℝ, 0 < Nv ∧ qEval (rotQ (rboxQ den rb)).2 s = Nv ∧
      ∀ i j : Fin 3,
        qEval (nth (rotQ (rboxQ den rb)).1 (3 * i.val + j.val) PackLean.D40.qzero) s = Nv * R i j := by
  rw [rotQ_eq]
  exact OctFar.box_point (rb := cvB rb) hwf hcu hin

/-! ## 2. The piece and the candidate forms -/

/-- The entry `i` of the doubled vertex `2ṽ_v` (`D40.vt`). -/
def vtR (v i : ℕ) : ℝ := ((nth (nth vt v []) i 0 : ℤ) : ℝ)

/-- The vertices `ṽ_v = vt_v / 2` of the piece of `D40` (`√2` times Spec's `tetV`). -/
def VD (l : ℕ) : E3 := WithLp.toLp 2 (fun i => vtR l i.val / 2)

/-- The weight `μ = p · b₂ + μ′`. -/
def muC (p : E3) (c : Cand) : ℝ := dot p (bT 2) + c.mu

/-- The left branch of `Low` with the weight `muC` and the vertices of the candidate. -/
def dualC (cb : ℝ) (p : E3) (R : M3) (c : Cand) : ℝ :=
  dot p (mv R (VD c.top))
    + 1 / 4 * ∑ f : Fin 4, (muC p c - dot p (bT f)) * dot (bT f) (mv R (VD (nth c.vs f.val 0)))
    - cb * muC p c

/-- The right branch of `Low` with the vertices of the candidate. -/
def sumS (R : M3) (c : Cand) : ℝ := ∑ f : Fin 4, dot (bT f) (mv R (VD (nth c.vs f.val 0)))

theorem decCand_top (code : ℕ) : (decCand code).top < 4 := by
  simp only [decCand]; omega

theorem decCand_vs (code : ℕ) (f : Fin 4) : nth (decCand code).vs f.val 0 < 4 := by
  fin_cases f <;> simp [decCand, nth] <;> omega

theorem low_of_dual {cb x y κ : ℝ} (h1 : -x ≤ y) (h2 : y ≤ x) (h3 : x ≤ 1) {R : M3} {code : ℕ}
    (hmu : 0 ≤ (decCand code).mu) (hk : κ ≤ dualC cb !₂[x, y, 1] R (decCand code)) :
    Low VD 4 cb !₂[x, y, 1] R κ := by
  left
  refine ⟨muC !₂[x, y, 1] (decCand code), (decCand code).top, decCand_top code,
    fun f => nth (decCand code).vs f.val 0, decCand_vs code, fun f => ?_, hk⟩
  have := OctFar.mu_max h1 h2 h3 f
  have : (0 : ℝ) ≤ (decCand code).mu := by exact_mod_cast hmu
  unfold muC; linarith

theorem low_of_S {cb κ : ℝ} {p : E3} {R : M3} {code : ℕ} (h : 4 * cb < sumS R (decCand code)) :
    Low VD 4 cb p R κ :=
  Or.inr ⟨fun f => nth (decCand code).vs f.val 0, decCand_vs code, h⟩

theorem candOk_mu {P : Prm} {side code : ℕ} (hmus : ∀ m ∈ P.mus, 0 < m)
    (h : candOk P side code = true) : 0 ≤ (decCand code).mu := by
  unfold candOk at h
  simp only [Bool.and_eq_true] at h
  obtain ⟨_, h2⟩ := h
  split at h2
  · rw [beq_iff_eq] at h2; omega
  · simp only [Bool.and_eq_true, List.contains_iff_mem] at h2
    exact (hmus _ h2.2).le
  · simp only [Bool.and_eq_true, beq_iff_eq] at h2; omega

/-! ## 3. The quadratic of `farLbAt` and its coefficients -/

/-- The quadratic whose lower bound `farLbAt` takes. -/
def linQ (cf : List ℤ) (cq : ℤ) (M : List (List ℤ)) (Q : List ℤ) : List ℤ :=
  PackLean.D40.qadd ((List.range 9).foldl (fun acc li =>
    PackLean.D40.qadd acc (PackLean.D40.qsmul (nth cf li 0) (nth M li PackLean.D40.qzero)))
      PackLean.D40.qzero) (PackLean.D40.qsmul cq Q)

theorem farLbAt_eq (P : Prm) (side : ℕ) (c : Cand) (kN : RatI) (MQ : List (List ℤ) × List ℤ)
    (hv kv : ℤ) :
    farLbAt P side c kN MQ hv kv
      = PackLean.D40.quadLb (linQ (farCoefs P side c kN hv kv).1 (farCoefs P side c kN hv kv).2 MQ.1
          MQ.2) := rfl

/-- The linear form of the coefficients in the entries of `R`. -/
def linR (cf : List ℤ) (cq : ℤ) (R : M3) : ℝ :=
  ∑ i : Fin 3, ∑ j : Fin 3, ((nth cf (3 * i.val + j.val) 0 : ℤ) : ℝ) * R i j + cq

theorem qEval_linQ (s : Fin 3 → ℝ) {M : List (List ℤ)} {Q : List ℤ}
    (hM : ∀ t, (nth M t PackLean.D40.qzero).length = 10) (hQ : Q.length = 10) (cf : List ℤ) (cq : ℤ)
    {Nv : ℝ} {R : M3} (hN : qEval Q s = Nv)
    (hent : ∀ i j : Fin 3, qEval (nth M (3 * i.val + j.val) PackLean.D40.qzero) s = Nv * R i j) :
    qEval (linQ cf cq M Q) s = Nv * linR cf cq R := by
  have hM' : ∀ t, (PackLean.D31.nth M t PackLean.D31.qzero).length = 10 := hM
  simp only [linQ, OctFar.range9, List.foldl_cons, List.foldl_nil, qadd_eq, qsmul_eq, qzero_eq,
    nth_eq] at hent ⊢
  simp only [OctFar.qEval_qadd_qzero, OctFar.qEval_qadd, OctFar.qEval_qsmul, OctFar.qadd_length,
    OctFar.qsmul_length, OctFar.qzero_length, hM', hQ, min_self, OctFar.qEval_qzero]
  have e00 := hent 0 0; have e01 := hent 0 1; have e02 := hent 0 2
  have e10 := hent 1 0; have e11 := hent 1 1; have e12 := hent 1 2
  have e20 := hent 2 0; have e21 := hent 2 1; have e22 := hent 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22
  rw [e00, e01, e02, e10, e11, e12, e20, e21, e22, hN]
  simp only [linR, Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two, nth_eq]
  norm_num
  ring

/-- The sign of `κ_N` in the form of the side (`A`: `−`, `B`: `+`). -/
def sgn (side : ℕ) : ℝ := if side = 0 then -1 else 1

/-- The direction of the side at `(h, k′)`: `A` is `(1 − h, 1 − h − k′, 1)`, `B` its mirror. -/
def pS (side : ℕ) (h k : ℝ) : E3 :=
  if side = 0 then !₂[1 - h, 1 - h - k, 1] else !₂[1 - h, -(1 - h - k), 1]

/-- `κ_N(h, k′) = (A0 + A1 h + B k′)/KD + k_N`. -/
def kapN (P : Prm) (kN : RatI) (h k : ℝ) : ℝ :=
  ((nth P.kap 0 0 : ℤ) + (nth P.kap 1 0 : ℤ) * h + (nth P.kap 2 0 : ℤ) * k) / (P.kd : ℝ)
    + (kN.1 : ℝ) / (kN.2 : ℝ)

/-- The container of `D40` in the rows of `TetReduction`: `s̄ / 2`. -/
def cbD (P : Prm) : ℝ := (P.sbar.1 : ℝ) / (P.sbar.2 : ℝ) / 2

/-- The positive factor `T = 16 · ND · s_d · KD · k_d`. -/
def TT (P : Prm) (kN : RatI) : ℝ := 16 * P.nd * P.sbar.2 * P.kd * kN.2

/-- The real form of the far candidate (types F and M) at `(H, K)` in `ND` units. -/
def Phi (P : Prm) (side : ℕ) (c : Cand) (kN : RatI) (R : M3) (H K : ℝ) : ℝ :=
  TT P kN * (dualC (cbD P) (pS side (H / P.nd) (K / P.nd)) R c
    + sgn side * kapN P kN (H / P.nd) (K / P.nd))

theorem vtR_eq (v i : ℕ) : vtR v i = ((PackLean.D40.nth (PackLean.D40.nth vt v []) i 0 : ℤ) : ℝ) := rfl

theorem coefs_FM {P : Prm} (hms : P.msign = 1) (hnd : 0 < P.nd) (hsd : 0 < P.sbar.2)
    (hKD : 0 < P.kd) {kN : RatI} (hkd : 0 < kN.2) {side : ℕ} (hs : side = 0 ∨ side = 1) {c : Cand}
    (ht : c.typ ≠ 2) (hv kv : ℤ) (R : M3) :
    linR (farCoefs P side c kN hv kv).1 (farCoefs P side c kN hv kv).2 R
      = Phi P side c kN R hv kv := by
  have ht' : (c.typ == 2) = false := by simpa using ht
  have hndr : (P.nd : ℝ) ≠ 0 := by exact_mod_cast hnd.ne'
  have hsdr : ((P.sbar.2 : ℕ) : ℝ) ≠ 0 := by exact_mod_cast hsd.ne'
  have hKDr : (P.kd : ℝ) ≠ 0 := by exact_mod_cast hKD.ne'
  have hkdr : ((kN.2 : ℕ) : ℝ) ≠ 0 := by exact_mod_cast hkd.ne'
  rcases hs with rfl | rfl
  all_goals
    simp only [farCoefs, ht', Bool.false_eq_true, if_false, nAt, beq_self_eq_true, if_true,
      show ((1 : ℕ) == 0) = false from rfl, hms, one_mul]
    simp only [linR, Phi, TT, dualC, muC, pS, sgn, kapN, cbD, Fin.sum_univ_three, Fin.sum_univ_four,
      Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue, List.range, List.range.loop,
      List.map_cons, List.map_nil, List.foldl_cons, List.foldl_nil, nth, List.getD_cons_zero,
      List.getD_cons_succ, bvec, dotI, vsub, List.zipWith_cons_cons, List.zipWith_nil_left,
      dot, mv_apply, VD, vtR, bT, if_true, one_ne_zero, if_false]
    simp
    field_simp
    ring

theorem coefs_S {P : Prm} {kN : RatI} {side : ℕ} {c : Cand} (ht : c.typ = 2) (hv kv : ℤ) (R : M3) :
    linR (farCoefs P side c kN hv kv).1 (farCoefs P side c kN hv kv).2 R
      = 2 * (P.sbar.2 : ℝ) * sumS R c - 4 * P.sbar.1 := by
  have ht' : (c.typ == 2) = true := by simpa using ht
  simp only [farCoefs, ht', if_true]
  simp only [linR, sumS, Fin.sum_univ_three, Fin.sum_univ_four,
    Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue, List.range, List.range.loop,
    List.map_cons, List.map_nil, List.foldl_cons, List.foldl_nil, nth, List.getD_cons_zero,
    List.getD_cons_succ, bvec, dot, mv_apply, VD, vtR, bT]
  simp
  ring

theorem Phi_affine (P : Prm) (side : ℕ) (c : Cand) (kN : RatI) (R : M3) (H K : ℝ) :
    Phi P side c kN R H K = Phi P side c kN R 0 0 + (Phi P side c kN R 1 0 - Phi P side c kN R 0 0) * H
      + (Phi P side c kN R 0 1 - Phi P side c kN R 0 0) * K := by
  by_cases hs : side = 0 <;>
  simp only [Phi, TT, dualC, muC, pS, sgn, kapN, cbD, hs, if_true, if_false, Fin.sum_univ_four,
    dot, mv_apply, Fin.sum_univ_three, bT] <;>
  simp <;> ring

/-! ## 4. Token `A` -/

/-- **Token `A`, types F and M.** `farAccept` for a candidate with `typ ≠ 2` gives the bound
`dualC ≥ −sgn · κ_N` at every point `(H, K)` of the direction box (`ND` units) and every rotation of
the R box. -/
theorem accept_FM {P : Prm} (hms : P.msign = 1) (hnd : 0 < P.nd) (hsd : 0 < P.sbar.2)
    (hKD : 0 < P.kd) {kN : RatI} (hkd : 0 < kN.2) {side : ℕ} (hs : side = 0 ∨ side = 1)
    {nb : NBox} (hnw : nboxWf nb = true) {rb : RBox} (hwf : PackLean.D40.rboxWf rb = true)
    {code : ℕ} (hA : farAccept P side nb kN (rotQ (rboxQ P.den rb)) code = true)
    (ht : (decCand code).typ ≠ 2) {R : M3} {u : Fin 3 → ℝ} (hcu : Charts.ChartPt R P.den rb.ch u)
    (hin : OctFar.InBox (cvB rb) rb.ch u) {H K : ℝ}
    (hH1 : (nb.l0 : ℝ) ≤ H) (hH2 : H ≤ nb.h0) (hK1 : (nb.l1 : ℝ) ≤ K) (hK2 : K ≤ nb.h1) :
    -(sgn side * kapN P kN (H / P.nd) (K / P.nd))
      ≤ dualC (cbD P) (pS side (H / P.nd) (K / P.nd)) R (decCand code) := by
  obtain ⟨s, hs1, Nv, hNv, hN, hent⟩ := box_point hwf hcu hin
  have ht' : ((decCand code).typ == 2) = false := by simpa using ht
  simp only [farAccept, Bool.and_eq_true, ht', Bool.false_eq_true, if_false, decide_eq_true_eq,
    ge_iff_le, le_min_iff] at hA
  set c := decCand code
  have corner : ∀ a b : ℤ,
      0 ≤ farLbAt P side c kN (rotQ (rboxQ P.den rb)) a b → 0 ≤ Phi P side c kN R a b := by
    intro a b hab
    rw [farLbAt_eq] at hab
    have h1 := OctFar.quadLb_le s hab hs1
    rw [qEval_linQ s (mget_length P.den rb) (q_length P.den rb) _ _ hN hent,
      coefs_FM hms hnd hsd hKD hkd hs ht] at h1
    have : (0 : ℝ) ≤ Nv * Phi P side c kN R a b := le_trans (by exact_mod_cast hab) h1
    exact (mul_nonneg_iff_of_pos_left hNv).1 this
  obtain ⟨_, ⟨a1, a2⟩, a3, a4⟩ := hA
  have hb : (nb.l0 : ℝ) < nb.h0 ∧ (nb.l1 : ℝ) < nb.h1 := by
    simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq] at hnw
    exact ⟨by exact_mod_cast hnw.1, by exact_mod_cast hnw.2⟩
  have hF := OctFar.rect_nonneg (f := fun H K => Phi P side c kN R H K)
    (A := Phi P side c kN R 0 0)
    (B := Phi P side c kN R 1 0 - Phi P side c kN R 0 0)
    (C := Phi P side c kN R 0 1 - Phi P side c kN R 0 0)
    (fun H K => Phi_affine P side c kN R H K) hb.1 hb.2
    (corner _ _ a1) (corner _ _ a2) (corner _ _ a3) (corner _ _ a4) hH1 hH2 hK1 hK2
  have hT : 0 < TT P kN := by
    unfold TT
    have : (0 : ℝ) < P.nd := by exact_mod_cast hnd
    have : (0 : ℝ) < (P.sbar.2 : ℝ) := by exact_mod_cast hsd
    have : (0 : ℝ) < P.kd := by exact_mod_cast hKD
    have : (0 : ℝ) < (kN.2 : ℝ) := by exact_mod_cast hkd
    positivity
  simp only [Phi] at hF
  have := (mul_nonneg_iff_of_pos_left hT).1 hF
  linarith

/-- **Token `A`, type S.** `farAccept` for a candidate with `typ = 2` gives the right branch
`4 · (s̄/2) < Σ_f b_f · R ṽ_{v_f}` for every rotation of the R box. -/
theorem accept_S {P : Prm} (hsd : 0 < P.sbar.2) {kN : RatI} {side : ℕ} {nb : NBox} {rb : RBox}
    (hwf : PackLean.D40.rboxWf rb = true) {code : ℕ}
    (hA : farAccept P side nb kN (rotQ (rboxQ P.den rb)) code = true)
    (ht : (decCand code).typ = 2) {R : M3} {u : Fin 3 → ℝ} (hcu : Charts.ChartPt R P.den rb.ch u)
    (hin : OctFar.InBox (cvB rb) rb.ch u) : 4 * cbD P < sumS R (decCand code) := by
  obtain ⟨s, hs1, Nv, hNv, hN, hent⟩ := box_point hwf hcu hin
  have ht' : ((decCand code).typ == 2) = true := by simpa using ht
  simp only [farAccept, Bool.and_eq_true, ht', if_true, decide_eq_true_eq] at hA
  obtain ⟨_, hA⟩ := hA
  rw [farLbAt_eq] at hA
  have h1 := lt_of_lt_of_le (by exact_mod_cast hA : (0 : ℝ) < _) (OctFar.quadLb_le s hA.le hs1)
  rw [qEval_linQ s (mget_length P.den rb) (q_length P.den rb) _ _ hN hent, coefs_S ht] at h1
  have h2 := (mul_pos_iff_of_pos_left hNv).1 h1
  have hsdr : (0 : ℝ) < (P.sbar.2 : ℝ) := by exact_mod_cast hsd
  unfold cbD
  rw [show 4 * ((P.sbar.1 : ℝ) / (P.sbar.2 : ℝ) / 2) = 2 * P.sbar.1 / P.sbar.2 by ring,
    div_lt_iff₀ hsdr]
  linarith

/-! ## 5. Token `D` and the rotations of the piece -/

theorem discLb_eq (M : List (List ℤ)) (K : List (List ℤ)) :
    discLb M K = PackLean.D31.quadLb (OctFar.discQ M K) := rfl

theorem disc_trace {den : ℤ} {rb : RBox} (hwf : PackLean.D40.rboxWf rb = true) {K : List (List ℤ)}
    (hD : discLb (rotQ (rboxQ den rb)).1 K > 0) {R : M3} {u : Fin 3 → ℝ}
    (hcu : Charts.ChartPt R den rb.ch u) (hin : OctFar.InBox (cvB rb) rb.ch u) :
    R.trace < (R * OctFar.imat K).trace := by
  obtain ⟨s, hs, Nv, hNv, _, hent⟩ := box_point hwf hcu hin
  rw [discLb_eq, rotQ_eq] at hD
  rw [rotQ_eq] at hent
  have hM := OctFar.mget_length den (cvB rb)
  have hDr : (0 : ℝ) < (PackLean.D31.quadLb (OctFar.discQ (PackLean.D31.rotQ
      (PackLean.D31.rboxQ den (cvB rb))).1 K) : ℝ) := by exact_mod_cast hD
  have h1 := lt_of_lt_of_le hDr (OctFar.quadLb_le s (le_of_lt hD) hs)
  clear hDr
  simp only [OctFar.discQ, OctFar.range9, List.foldl_cons, List.foldl_nil] at h1
  simp only [OctFar.qEval_qadd_qzero, OctFar.qEval_qadd, OctFar.qEval_qsmul, OctFar.qadd_length,
    OctFar.qsmul_length, OctFar.qzero_length, hM, min_self, OctFar.qEval_qzero] at h1
  have e00 := hent 0 0; have e01 := hent 0 1; have e02 := hent 0 2
  have e10 := hent 1 0; have e11 := hent 1 1; have e12 := hent 1 2
  have e20 := hent 2 0; have e21 := hent 2 1; have e22 := hent 2 2
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, Fin.isValue, nth_eq, qzero_eq] at e00 e01 e02 e10 e11 e12 e20 e21 e22
  norm_num at e00 e01 e02 e10 e11 e12 e20 e21 e22 h1
  rw [e00, e01, e02, e10, e11, e12, e20, e21, e22] at h1
  have hpos : (0 : ℝ) < Nv * ((R * OctFar.imat K).trace - R.trace) := by
    simp only [Matrix.trace, Matrix.diag, Matrix.mul_apply, Fin.sum_univ_three, OctFar.imat,
      PackLean.D28.igt, PackLean.D28.nth, PackLean.D31.nth] at h1 ⊢
    norm_num at h1 ⊢
    linarith
  have := (mul_pos_iff_of_pos_left hNv).1 hpos
  linarith

open PackLean.D28 (rotIntOk igt)

/-- The integer matrix maps every doubled vertex `vt_l` to a doubled vertex. -/
def vmapT (K : List (List ℤ)) : Bool :=
  (List.range 4).all fun l => (List.range 4).any fun l' =>
    (List.range 3).all fun i =>
      igt K i 0 * nth (nth vt l []) 0 0 + igt K i 1 * nth (nth vt l []) 1 0
        + igt K i 2 * nth (nth vt l []) 2 0 == nth (nth vt l' []) i 0

/-- **An integer rotation that maps the vertices to vertices is in `Krot`.** -/
theorem rot_krot {K : List (List ℤ)} (h1 : rotIntOk K = true) (h2 : vmapT K = true) :
    OctFar.imat K ∈ Krot VD 4 := by
  have hSO := OctFar.imat_SO h1
  rw [Matrix.mem_specialOrthogonalGroup_iff] at hSO
  refine ⟨(Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hSO.1, hSO.2, fun l hl => ?_⟩
  simp only [vmapT, List.all_eq_true, List.any_eq_true, List.mem_range, beq_iff_eq] at h2
  obtain ⟨l', hl', h⟩ := h2 l hl
  refine ⟨l', hl', ?_⟩
  ext i
  have e := h i.val i.isLt
  have e' : ((igt K i.val 0 * nth (nth vt l []) 0 0 + igt K i.val 1 * nth (nth vt l []) 1 0
      + igt K i.val 2 * nth (nth vt l []) 2 0 : ℤ) : ℝ) = ((nth (nth vt l' []) i.val 0 : ℤ) : ℝ) := by
    rw [e]
  push_cast at e'
  simp only [mv_apply, VD, vtR, Fin.sum_univ_three, OctFar.imat, Fin.val_zero, Fin.val_one,
    Fin.val_two, Fin.isValue]
  change _ = ((nth (nth vt l' []) i.val 0 : ℤ) : ℝ) / 2
  rw [← e']
  ring

end

#assert_std_axioms PackLean.Formal.TetintFar.accept_FM PackLean.Formal.TetintFar.accept_S
  PackLean.Formal.TetintFar.disc_trace PackLean.Formal.TetintFar.rot_krot
  PackLean.Formal.TetintFar.low_of_dual PackLean.Formal.TetintFar.low_of_S

end PackLean.Formal.TetintFar
