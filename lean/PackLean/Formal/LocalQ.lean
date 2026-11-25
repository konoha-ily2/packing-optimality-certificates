import PackLean.Formal.LocalG
import PackLean.D44.Core

/-!
# D45 stage 6b: the local region of Lemma Q (D44 3.2, `D44.localQ`) — part 1

The pieces of the soundness of `D44.localQ` that do not depend on the weighted weak duality
(`LocalW`):

* `quadPos_spec`: `quadPos D e g h lo hi` ⇒ `e·D² + g·r·D + h·r² > 0` for every real `r ∈ [lo, hi]`
  (both ends; when `h > 0` and the vertex is strictly inside, the discriminant);
* `face_split`: on the face `(i, sg)`, `Φ(lift y) = e + ρ·g(y) + ρ²·H(y)` with `ρ = y 0`,
  `e = constTerm Φ`, `g = faceSubEq i sg 1 Φ` (the monomials of total degree 1) and
  `H = faceSub i sg 2 Φ` (all monomials of degree ≥ 2) — an identity, for every `Φ`;
* `wsumE_spec`・`wsumP_spec`: the values of the weighted sums;
* `qrun_cover`: the box tree of one face covers its root box (as `LocalG.lrun_cover`).
-/

namespace PackLean.Formal.LocalQ

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand LBox lsplit lbPos faceList candOk candPolys rotPoly constTerm faceSub
  shiftLb3 z3)
open PackLean.D44 (mdeg faceSubEq QTok QFace quadPos wsumP wsumE wLeafOk pboxOk farLeafOk QState
  boxWf qstep localQ)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.LocalG
open PackLean.Formal.PolySemG (BracketG maskOf pEval lift)

noncomputable section

/-! ## The quadratic in `ρ` -/

/-- **`quadPos`.** `e·D² + g·r·D + h·r² > 0` on the real interval `[lo, hi]`. -/
theorem quadPos_spec {D e g h lo hi : ℤ} (hD : 0 < D) (hq : quadPos D e g h lo hi = true) {r : ℝ}
    (hlo : (lo : ℝ) ≤ r) (hhi : r ≤ hi) :
    0 < (e : ℝ) * D * D + g * r * D + h * r * r := by
  have hD' : (0 : ℝ) < D := by exact_mod_cast hD
  simp only [quadPos] at hq
  split_ifs at hq with hc
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hq hc
    obtain ⟨⟨_, _⟩, h3⟩ := hq
    obtain ⟨⟨hh, _⟩, _⟩ := hc
    have hh' : (0 : ℝ) < h := by exact_mod_cast hh
    have h3' : (0 : ℝ) < 4 * e * h - g * g := by exact_mod_cast h3
    have key : 4 * (h : ℝ) * (e * D * D + g * r * D + h * r * r)
        = (2 * h * r + g * D) ^ 2 + (D : ℝ) ^ 2 * (4 * e * h - g * g) := by ring
    have : 0 < 4 * (h : ℝ) * (e * D * D + g * r * D + h * r * r) := by
      rw [key]
      have := sq_nonneg (2 * (h : ℝ) * r + g * D)
      have := mul_pos (pow_pos hD' 2) h3'
      linarith
    have h4 : (0 : ℝ) < 4 * h := by linarith
    exact pos_of_mul_pos_right this h4.le
  · simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.and_true] at hq
    obtain ⟨h1, h2⟩ := hq
    have h1' : (0 : ℝ) < (e : ℝ) * D * D + g * lo * D + h * lo * lo := by exact_mod_cast h1
    have h2' : (0 : ℝ) < (e : ℝ) * D * D + g * hi * D + h * hi * hi := by exact_mod_cast h2
    by_cases hh : 0 < h
    · have hh' : (0 : ℝ) < h := by exact_mod_cast hh
      by_cases hv1 : 2 * h * lo < -g * D
      · have hv2 : ¬ -g * D < 2 * h * hi := fun h' => hc (by
          simp only [Bool.and_eq_true, decide_eq_true_eq]; exact ⟨⟨hh, hv1⟩, h'⟩)
        push Not at hv2
        have hv2' : (2 : ℝ) * h * hi ≤ -g * D := by exact_mod_cast hv2
        -- decreasing on `[lo, hi]`
        have hm : 0 ≤ ((hi : ℝ) - r) * (-(g * D) - h * (r + hi)) := by
          apply mul_nonneg (by linarith)
          nlinarith
        nlinarith
      · push Not at hv1
        have hv1' : (-g : ℝ) * D ≤ 2 * h * lo := by exact_mod_cast hv1
        -- increasing on `[lo, hi]`
        have hm : 0 ≤ (r - (lo : ℝ)) * (g * D + h * (r + lo)) := by
          apply mul_nonneg (by linarith)
          nlinarith
        nlinarith
    · push Not at hh
      have hh' : (h : ℝ) ≤ 0 := by exact_mod_cast hh
      -- concave: `(a + b) v(r) = a v(lo) + b v(hi) - h (a + b) a b`
      set a : ℝ := hi - r with ha
      set b : ℝ := r - lo with hb
      have ha0 : 0 ≤ a := by linarith
      have hb0 : 0 ≤ b := by linarith
      have key : (a + b) * ((e : ℝ) * D * D + g * r * D + h * r * r)
          = a * ((e : ℝ) * D * D + g * lo * D + h * lo * lo) +
            b * ((e : ℝ) * D * D + g * hi * D + h * hi * hi) - h * (a + b) * a * b := by
        rw [ha, hb]; ring
      rcases eq_or_lt_of_le (add_nonneg ha0 hb0) with hab | hab
      · have : b = 0 := by linarith
        have hr : r = lo := by linarith
        rw [hr]; exact h1'
      · have hpos : 0 < a * ((e : ℝ) * D * D + g * lo * D + h * lo * lo) +
            b * ((e : ℝ) * D * D + g * hi * D + h * hi * hi) := by
          rcases eq_or_lt_of_le ha0 with ha' | ha'
          · rw [← ha']; have : 0 < b := by linarith
            nlinarith
          · nlinarith
        have hk : 0 ≤ -(h : ℝ) * (a + b) * a * b := by
          have := mul_nonneg (mul_nonneg (mul_nonneg (neg_nonneg.2 hh') hab.le) ha0) hb0
          linarith
        have : 0 < (a + b) * ((e : ℝ) * D * D + g * r * D + h * r * r) := by
          rw [key]; linarith
        exact pos_of_mul_pos_right this hab.le

/-! ## The split `Φ = e + ρ g + ρ² H` on a face -/

section Split

variable {ps : List ℕ}

theorem filt_split {α : Type*} (l : List α) (f : α → ℝ) (d : α → ℕ) :
    ((l.filter (fun e => decide (d e < 2))).map f).sum
      = ((l.filter (fun e => decide (d e < 1))).map f).sum +
        ((l.filter (fun e => d e == 1)).map f).sum := by
  induction l with
  | nil => simp
  | cons a l ih =>
    by_cases h0 : d a = 0
    · have h1 : d a < 2 := by omega
      have h2 : d a < 1 := by omega
      have h3 : (d a == 1) = false := by simp [h0]
      simp only [List.filter_cons, h1, h2, h3, decide_true, ite_true, Bool.false_eq_true, ite_false,
        List.map_cons, List.sum_cons, ih]
      ring
    · by_cases h1 : d a = 1
      · have h2 : d a < 2 := by omega
        have h3 : ¬ d a < 1 := by omega
        have h4 : (d a == 1) = true := by simp [h1]
        simp only [List.filter_cons, h2, h3, h4, decide_true, decide_false, ite_true,
          Bool.false_eq_true, ite_false, List.map_cons, List.sum_cons, ih]
        ring
      · have h2 : ¬ d a < 2 := by omega
        have h3 : ¬ d a < 1 := by omega
        have h4 : (d a == 1) = false := by simp [h1]
        simp only [List.filter_cons, h2, h3, h4, decide_false, Bool.false_eq_true, ite_false, ih]

/-- **The split on a face.** For `ρ = y 0`: `Φ(lift y) = e + ρ·g(y) + ρ²·H(y)`. -/
theorem face_split (i : ℕ) (hi : i < 3) (sg : ℤ) (y : Fin 3 → ℝ) {p : Poly} (hp : PolySemG.WF ps p) :
    PolySemG.WF ps (faceSubEq i sg 1 p) ∧ PolySemG.WF ps (faceSub i sg 2 p) ∧
    pEval ps p (lift i sg y) = fval ps (constTerm (2 ^ ps.length) p) +
      y 0 * pEval ps (faceSubEq i sg 1 p) y + y 0 ^ 2 * pEval ps (faceSub i sg 2 p) y := by
  set p1 := p.filter (fun x : Mono × FE => mdeg x.1 == 1) with hp1def
  have hp1 : PolySemG.WF ps p1 := fun e he => hp e (List.mem_of_mem_filter he)
  have hEq : faceSubEq i sg 1 p = faceSub i sg 1 p1 := rfl
  obtain ⟨_, vA⟩ := PolySemG.faceSub_spec i hi sg 1 y p hp
  obtain ⟨_, vB⟩ := PolySemG.faceSub1 i hi sg y hp
  obtain ⟨w2, v2⟩ := PolySemG.faceSub_spec i hi sg 2 y p hp
  obtain ⟨w1, v1⟩ := PolySemG.faceSub_spec i hi sg 1 y p1 hp1
  rw [hEq]
  refine ⟨w1, w2, ?_⟩
  set f : Mono × FE → ℝ := fun e => fval ps e.2 * PolySem.monoEval e.1 (lift i sg y) with hf
  have hT1p1 : ((p1.filter (fun e => decide (e.1.foldl (· + ·) 0 < 1))).map f).sum = 0 := by
    have : p1.filter (fun e => decide (e.1.foldl (· + ·) 0 < 1)) = [] := by
      rw [List.filter_eq_nil_iff]
      intro e he
      rw [hp1def, List.mem_filter] at he
      have h1 : mdeg e.1 = 1 := by simpa using he.2
      unfold mdeg at h1
      simp [h1]
    rw [this]; simp
  have hp1v : pEval ps p1 (lift i sg y) = ((p.filter (fun e => mdeg e.1 == 1)).map f).sum := rfl
  have hsplit := filt_split p f (fun e => e.1.foldl (· + ·) 0)
  have hmd : (fun e : Mono × FE => (e.1.foldl (· + ·) 0 == 1)) = (fun e => mdeg e.1 == 1) := rfl
  rw [hmd] at hsplit
  rw [pow_one] at vA v1
  rw [hT1p1, sub_zero] at v1
  -- `T1(p) = constant`
  have hT1 : ((p.filter (fun e => decide (e.1.foldl (· + ·) 0 < 1))).map f).sum
      = fval ps (constTerm (2 ^ ps.length) p) := by
    have := vA.symm.trans vB; simp only [hf] at this ⊢; linarith
  simp only [hf] at hsplit hT1 v2 v1 hp1v
  rw [hsplit, hT1, ← hp1v, ← v1] at v2
  linarith

end Split

/-! ## Weighted sums -/

theorem len_nth {ps : List ℕ} {es : List FE} (hes : ∀ e ∈ es, Len ps e) {d : FE} (hd : Len ps d)
    (k : ℕ) : Len ps (nth es k d) := by
  unfold nth
  rcases lt_or_ge k es.length with hk | hk
  · rw [List.getD_eq_getElem _ _ hk]; exact hes _ (List.getElem_mem hk)
  · rw [List.getD_eq_default _ _ hk]; exact hd

theorem wsumE_spec {ps : List ℕ} (ws : List (ℕ × ℕ)) {es : List FE} (hes : ∀ e ∈ es, Len ps e) :
    Len ps (wsumE (2 ^ ps.length) ws es) ∧
    fval ps (wsumE (2 ^ ps.length) ws es)
      = (ws.map (fun x => (x.2 : ℝ) * fval ps (nth es x.1 (fzero (2 ^ ps.length))))).sum := by
  unfold wsumE
  have hg : ∀ x ∈ ws, Len ps (fsmul (x.2 : ℤ) (nth es x.1 (fzero (2 ^ ps.length)))) :=
    fun x _ => len_fsmul _ (len_nth hes (len_fzero ps) _)
  obtain ⟨h1, h2⟩ := FarAccept.fval_foldl (ps := ps)
    (fun x : ℕ × ℕ => fsmul (x.2 : ℤ) (nth es x.1 (fzero (2 ^ ps.length)))) ws
    (fzero (2 ^ ps.length)) hg (len_fzero ps)
  refine ⟨h1, ?_⟩
  rw [h2, fval_fzero, zero_add]
  congr 1
  apply List.map_congr_left
  intro x _
  rw [fval_fsmul]
  push_cast
  ring

theorem wsumP_spec {ps : List ℕ} (ws : List (ℕ × ℕ)) {qs : List Poly}
    (hq : ∀ q ∈ qs, PolySemG.WF ps q) (X : Fin 3 → ℝ) :
    PolySemG.WF ps (wsumP ws qs) ∧
    pEval ps (wsumP ws qs) X = (ws.map (fun x => (x.2 : ℝ) * pEval ps (nth qs x.1 []) X)).sum := by
  unfold wsumP
  have hall : ∀ q ∈ ws.map (fun x : ℕ × ℕ => psmulZ (x.2 : ℤ) (nth qs x.1 [])), PolySemG.WF ps q := by
    intro q hq'
    simp only [List.mem_map] at hq'
    obtain ⟨x, _, rfl⟩ := hq'
    exact PolySemG.psmulZ_WF _ (nth_WF hq _)
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum X hall, List.map_map]
  congr 1
  apply List.map_congr_left
  intro x _
  simp only [Function.comp_apply]
  rw [PolySemG.pEval_psmulZ]
  push_cast
  ring

/-! ## The box tree of one face -/

/-- What a leaf of `qstep` certifies: a weighted leaf or a far-shaped leaf. -/
def QGood (P : Prob) (qlamL : ℕ) (D : ℤ) (i : ℕ) (sg : ℤ) (cf : QFace) (b : LBox) : Prop :=
  boxWf b = true ∧ ((∃ ws, wLeafOk P D cf b ws = true) ∨
    (∃ plo phi mu ts, farLeafOk P qlamL D i sg b plo phi mu ts = true))

theorem qstep_ok_false (P : Prob) (qlamL : ℕ) (D : ℤ) (i : ℕ) (sg : ℤ) (cf : QFace) (s : QState)
    (t : QTok) (h : s.ok = false) : (qstep P qlamL D i sg cf s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [qstep, hst, h]

theorem qfoldl_ok_false (P : Prob) (qlamL : ℕ) (D : ℤ) (i : ℕ) (sg : ℤ) (cf : QFace) :
    ∀ (toks : List QTok) (s : QState), s.ok = false →
      (toks.foldl (qstep P qlamL D i sg cf) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (qstep_ok_false P qlamL D i sg cf s t h)

/-- **Tree soundness** of one face of `localQ` (as `LocalG.lrun_cover`). -/
theorem qrun_cover (P : Prob) (qlamL : ℕ) (D : ℤ) (i : ℕ) (sg : ℤ) (cf : QFace) :
    ∀ (toks : List QTok) (s : QState), (toks.foldl (qstep P qlamL D i sg cf) s).ok = true →
      (toks.foldl (qstep P qlamL D i sg cf) s).stack = [] →
      ∀ z, (∃ B ∈ s.stack, InL B z) → ∃ B, QGood P qlamL D i sg cf B ∧ InL B z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (qstep P qlamL D i sg cf s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [qfoldl_ok_false P qlamL D i sg cf toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (qstep P qlamL D i sg cf s .split).stack = (lsplit B).1 :: (lsplit B).2 :: rest := by
            simp [qstep, hs]
          refine ih _ hok hst z ?_
          rw [hs']
          rcases lsplit_cover B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | w ws =>
          simp only [qstep, hs, Bool.and_eq_true] at hok'
          obtain ⟨⟨_, hw⟩, hl⟩ := hok'
          exact ⟨B, ⟨hw, Or.inl ⟨ws, hl⟩⟩, hz⟩
        | far plo phi mu ts =>
          simp only [qstep, hs, Bool.and_eq_true] at hok'
          obtain ⟨⟨_, hw⟩, hl⟩ := hok'
          exact ⟨B, ⟨hw, Or.inr ⟨plo, phi, mu, ts, hl⟩⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (qstep P qlamL D i sg cf s t).stack := by
          intro C hC; cases t <;> simp [qstep, hs, hC]
        exact ih _ hok hst z ⟨B, hsub B hBr, hz⟩

end

#assert_std_axioms PackLean.Formal.LocalQ.quadPos_spec PackLean.Formal.LocalQ.face_split
  PackLean.Formal.LocalQ.wsumE_spec PackLean.Formal.LocalQ.wsumP_spec PackLean.Formal.LocalQ.qrun_cover

end PackLean.Formal.LocalQ
