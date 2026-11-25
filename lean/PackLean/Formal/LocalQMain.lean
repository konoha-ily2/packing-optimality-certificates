import PackLean.Formal.LocalQ
import PackLean.Formal.LocalW

/-!
# D45 stage 6b: the local region of Lemma Q (D44 3.2, `D44.localQ`) — the leaves and the region

* `wleaf`: a weighted leaf (`wLeafOk`) gives, at every point of the box, `A^k ≥ 0` for every
  candidate with a weight and `Σ w_k Φ_k > 0` (from `face_split`, `quadPos_spec` and the box lower
  bounds `loHi`・`shiftLb3`);
* `pbox_spec`・`far_leaf`: a far-shaped leaf (`farLeafOk`): the `p` box of chart 0 contains the
  lifted local box (`pboxOk`, bilinear in `(ρ, a)`, so the four corners suffice), and the far rule
  `acceptOk` with `qlam := qlamL` gives `S ≥ S̄` there (`FarAccept.accept_G`・`accept_bound`);
* `localQ_main`: every feasible `(R, t, S)` with `R` in the local box of chart 0 has `S ≥ S̄`
  (weighted leaves through `LocalW.cands_wbound`, `S* = S̄` by `hSS`).
-/

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet RBox rboxWf loHi)
open PackLean.D16 (Prob Cand LBox lsplit lbPos faceList candOk candPolys rotPoly constTerm faceSub
  shiftLb3 z3 Term acceptOk termsOk boundsOk)
open PackLean.D44 (mdeg faceSubEq QTok QFace quadPos wsumP wsumE wLeafOk pboxOk farLeafOk QState
  boxWf qstep localQ)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept PackLean.Formal.LocalG PackLean.Formal.LocalQ
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf pEval lift)
open scoped Matrix

namespace PackLean.Formal.LocalQMain

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

theorem nth_map_of_lt {α β : Type*} (f : α → β) {l : List α} {k : ℕ} (hk : k < l.length) (d : β)
    (d' : α) : nth (l.map f) k d = f (nth l k d') := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hk), List.getD_eq_getElem _ _ hk]
  simp

theorem nth_mem {α : Type*} {l : List α} {k : ℕ} (hk : k < l.length) (d : α) : nth l k d ∈ l := by
  unfold nth
  rw [List.getD_eq_getElem _ _ hk]
  exact List.getElem_mem hk

theorem sum3 {α : Type*} (l : List α) (w a b c : α → ℝ) (ρ : ℝ) :
    (l.map fun x => w x * (a x + ρ * b x + ρ ^ 2 * c x)).sum
      = (l.map fun x => w x * a x).sum + ρ * (l.map fun x => w x * b x).sum +
        ρ ^ 2 * (l.map fun x => w x * c x).sum := by
  induction l with
  | nil => simp
  | cons x l ih => simp only [List.map_cons, List.sum_cons, ih]; ring

/-- The face data of `localQ` on the face `(i, sg)`. -/
def cfOf (P : Prob) (polys : List (Poly × List Poly)) (i : ℕ) (sg : ℤ) : QFace :=
  polys.map (fun (y : Poly × List Poly) =>
    (constTerm P.nb y.1, faceSubEq i sg 1 y.1, faceSub i sg 2 y.1, y.2.map (faceSub i sg 0)))

theorem boxWf_spec {b : LBox} (h : boxWf b = true) :
    b.lo.length = 3 ∧ b.hi.length = 3 ∧
    (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true := by
  simp only [boxWf, Bool.and_eq_true, beq_iff_eq] at h
  exact ⟨h.1.1, h.1.2, h.2⟩

/-! ## A weighted leaf -/

/-- **A weighted leaf.** At every point `z` of the box (`ρ = z 0 / D ≥ 0`): every candidate with a
weight has `A ≥ 0`, and the weighted sum of the `Φ_k` is `> 0`. -/
theorem wleaf {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb) (hwf : WF P)
    (hrden : 0 < P.rden) {polys : List (Poly × List Poly)}
    (hpw : ∀ y ∈ polys, PolySemG.WF P.ps y.1 ∧ ∀ a ∈ y.2, PolySemG.WF P.ps a)
    {i : ℕ} (hi : i < 3) {sg : ℤ} {b : LBox} (hbw : boxWf b = true) {ws : List (ℕ × ℕ)}
    (hl : wLeafOk P P.rden (cfOf P polys i sg) b ws = true) {z : Fin 3 → ℝ} (hz : InL b z)
    (hz0 : 0 ≤ z 0) :
    (∀ x ∈ ws, x.1 < polys.length ∧
      ∀ a ∈ (nth polys x.1 ([], [])).2, 0 ≤ pEval P.ps a (lift i sg (fun k => z k / P.rden))) ∧
    0 < (ws.map (fun x => (x.2 : ℝ) *
      pEval P.ps (nth polys x.1 ([], [])).1 (lift i sg (fun k => z k / P.rden)))).sum := by
  obtain ⟨hl3, hh3, hzw⟩ := boxWf_spec hbw
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  set y : Fin 3 → ℝ := fun k => z k / P.rden with hydef
  set cf := cfOf P polys i sg with hcf
  have hcflen : cf.length = polys.length := by simp [hcf, cfOf]
  have hcfnth : ∀ k < polys.length, nth cf k (fzero P.nb, [], [], []) =
      (constTerm P.nb (nth polys k ([], [])).1, faceSubEq i sg 1 (nth polys k ([], [])).1,
        faceSub i sg 2 (nth polys k ([], [])).1, (nth polys k ([], [])).2.map (faceSub i sg 0)) := by
    intro k hk
    rw [hcf, cfOf, nth_map_of_lt _ hk _ ([], [])]
  have hpwk : ∀ k, PolySemG.WF P.ps (nth polys k ([], [])).1 ∧
      ∀ a ∈ (nth polys k ([], [])).2, PolySemG.WF P.ps a := by
    intro k
    unfold nth
    rcases lt_or_ge k polys.length with hk | hk
    · rw [List.getD_eq_getElem _ _ hk]; exact hpw _ (List.getElem_mem hk)
    · rw [List.getD_eq_default _ _ hk]; exact ⟨PolySemG.WF_nil, by simp⟩
  unfold wLeafOk at hl
  simp only [Bool.and_eq_true] at hl
  obtain ⟨⟨⟨_, hidx⟩, hA⟩, hq⟩ := hl
  have hidx' : ∀ x ∈ ws, x.1 < polys.length ∧ 0 < x.2 := by
    intro x hx
    have := List.all_eq_true.1 hidx x hx
    simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨hcflen ▸ this.1, this.2⟩
  refine ⟨fun x hx => ⟨(hidx' x hx).1, ?_⟩, ?_⟩
  · -- `A ≥ 0`
    intro a ha
    have h1 := List.all_eq_true.1 hA x hx
    rw [hcfnth _ (hidx' x hx).1] at h1
    simp only [Bool.and_eq_true, List.all_eq_true] at h1
    have hp := h1.2 _ (List.mem_map_of_mem ha)
    have haw := (hpwk x.1).2 a ha
    obtain ⟨hw0, hv0⟩ := PolySemG.faceSub0 i hi sg y haw
    have h0 := lbPos_nonneg hb hKb hrden hw0 hl3 hh3 hzw hp hz
    rw [hv0] at h0
    exact h0
  · -- the quadratic
    rcases hg : shiftLb3 P P.rden (wsumP ws (cf.map (fun x => x.2.1))) b.lo b.hi with _ | g
    · rw [hg] at hq; simp at hq
    rcases hh : shiftLb3 P P.rden (wsumP ws (cf.map (fun x => x.2.2.1))) b.lo b.hi with _ | h
    · rw [hg, hh] at hq; simp at hq
    rw [hg, hh] at hq
    try simp only at hq
    -- the three parts at the point
    set Ek : ℕ → ℝ := fun k => fval P.ps (constTerm (2 ^ P.ps.length) (nth polys k ([], [])).1)
      with hEk
    set Gk : ℕ → ℝ := fun k => pEval P.ps (faceSubEq i sg 1 (nth polys k ([], [])).1) y with hGk
    set Hk : ℕ → ℝ := fun k => pEval P.ps (faceSub i sg 2 (nth polys k ([], [])).1) y with hHk
    have hsplitk : ∀ k, pEval P.ps (nth polys k ([], [])).1 (lift i sg y) =
        Ek k + y 0 * Gk k + y 0 ^ 2 * Hk k := fun k => (face_split i hi sg y (hpwk k).1).2.2
    set wr : ℕ × ℕ → ℝ := fun x => (x.2 : ℝ) with hwr
    -- `e`
    have hes : ∀ e ∈ cf.map (fun x => x.1), Len P.ps e := by
      intro e he
      simp only [hcf, cfOf, List.map_map, List.mem_map, Function.comp_apply] at he
      obtain ⟨yy, hyy, rfl⟩ := he
      rw [hwf.nb]; exact PolySemG.constTerm_len (hpw yy hyy).1
    rw [hwf.nb] at hq
    obtain ⟨hEl, hEv⟩ := wsumE_spec ws hes
    have hEv' : fval P.ps (wsumE (2 ^ P.ps.length) ws (cf.map (fun x => x.1)))
        = (ws.map (fun x => wr x * Ek x.1)).sum := by
      rw [hEv]
      congr 1
      apply List.map_congr_left
      intro x hx
      rw [nth_map_of_lt _ (hcflen ▸ (hidx' x hx).1) _ (fzero P.nb, [], [], []),
        hcfnth _ (hidx' x hx).1, hwf.nb]
    have he_lb := (PolySemG.loHi_spec hb (len_fsmul (P.rden ^ 8) hEl)).1
    rw [fval_fsmul, hEv'] at he_lb
    -- `g`
    have hgs : ∀ q ∈ cf.map (fun x => x.2.1), PolySemG.WF P.ps q := by
      intro q hq'
      simp only [hcf, cfOf, List.map_map, List.mem_map, Function.comp_apply] at hq'
      obtain ⟨yy, hyy, rfl⟩ := hq'
      exact (face_split i hi sg y (hpw yy hyy).1).1
    obtain ⟨hGw, hGv⟩ := wsumP_spec ws hgs y
    have hg_lb := PolySemG.shiftLb3_spec hb hrden hGw hl3 hh3 hzw hg z hz
    have hGv' : pEval P.ps (wsumP ws (cf.map (fun x => x.2.1))) y = (ws.map (fun x => wr x * Gk x.1)).sum := by
      rw [hGv]
      congr 1
      apply List.map_congr_left
      intro x hx
      rw [nth_map_of_lt _ (hcflen ▸ (hidx' x hx).1) [] (fzero P.nb, [], [], []),
        hcfnth _ (hidx' x hx).1]
    -- `h`
    have hhs : ∀ q ∈ cf.map (fun x => x.2.2.1), PolySemG.WF P.ps q := by
      intro q hq'
      simp only [hcf, cfOf, List.map_map, List.mem_map, Function.comp_apply] at hq'
      obtain ⟨yy, hyy, rfl⟩ := hq'
      exact (face_split i hi sg y (hpw yy hyy).1).2.1
    obtain ⟨hHw, hHv⟩ := wsumP_spec ws hhs y
    have hh_lb := PolySemG.shiftLb3_spec hb hrden hHw hl3 hh3 hzw hh z hz
    have hHv' : pEval P.ps (wsumP ws (cf.map (fun x => x.2.2.1))) y = (ws.map (fun x => wr x * Hk x.1)).sum := by
      rw [hHv]
      congr 1
      apply List.map_congr_left
      intro x hx
      rw [nth_map_of_lt _ (hcflen ▸ (hidx' x hx).1) [] (fzero P.nb, [], [], []),
        hcfnth _ (hidx' x hx).1]
    have hyz : (fun k => z k / (P.rden : ℝ)) = y := rfl
    rw [hyz, hGv'] at hg_lb
    rw [hyz, hHv'] at hh_lb
    -- the quadratic at `r = z 0`
    have hz0b := hz 0
    have hQ := quadPos_spec hrden hq hz0b.1 hz0b.2
    set E := (ws.map (fun x => wr x * Ek x.1)).sum with hE
    set G := (ws.map (fun x => wr x * Gk x.1)).sum with hG
    set H := (ws.map (fun x => wr x * Hk x.1)).sum with hH
    have hzy : z 0 = P.rden * y 0 := by simp only [hydef]; field_simp
    have hy0 : 0 ≤ y 0 := by simp only [hydef]; positivity
    -- the sum
    have hsum : (ws.map (fun x => (x.2 : ℝ) * pEval P.ps (nth polys x.1 ([], [])).1 (lift i sg y))).sum
        = E + y 0 * G + y 0 ^ 2 * H := by
      rw [hE, hG, hH, ← sum3]
      congr 1
      apply List.map_congr_left
      intro x _
      rw [hsplitk]
    rw [hsum]
    have hD8 : (0 : ℝ) < (P.rden : ℝ) ^ 8 := by positivity
    -- `e + g ρ + h ρ² ≤ Kb D⁸ (E + ρ G + ρ² H)`
    have hle : ((loHi P.sqb (fsmul (P.rden ^ 8) (wsumE (2 ^ P.ps.length) ws (cf.map (fun x => x.1))))).1 : ℝ)
        + g * y 0 + h * y 0 ^ 2 ≤ Kb * (P.rden : ℝ) ^ 8 * (E + y 0 * G + y 0 ^ 2 * H) := by
      have a1 := mul_le_mul_of_nonneg_right hg_lb hy0
      have a2 := mul_le_mul_of_nonneg_right hh_lb (sq_nonneg (y 0))
      push_cast at he_lb
      nlinarith
    rw [hzy] at hQ
    have hQ' : 0 < (P.rden : ℝ) ^ 2 * (((loHi P.sqb (fsmul (P.rden ^ 8)
        (wsumE (2 ^ P.ps.length) ws (cf.map (fun x => x.1))))).1 : ℝ) + g * y 0 + h * y 0 ^ 2) := by
      nlinarith
    have hpos1 : 0 < ((loHi P.sqb (fsmul (P.rden ^ 8)
        (wsumE (2 ^ P.ps.length) ws (cf.map (fun x => x.1))))).1 : ℝ) + g * y 0 + h * y 0 ^ 2 :=
      pos_of_mul_pos_right hQ' (by positivity)
    have : 0 < Kb * (P.rden : ℝ) ^ 8 * (E + y 0 * G + y 0 ^ 2 * H) := by linarith
    exact pos_of_mul_pos_right this (by positivity)

/-! ## A far-shaped leaf -/

theorem bilin_lb {r0 r1 a0 a1 z w c : ℝ} (hr : r0 < r1) (ha : a0 < a1) (hz0 : r0 ≤ z) (hz1 : z ≤ r1)
    (hw0 : a0 ≤ w) (hw1 : w ≤ a1) (h00 : c ≤ r0 * a0) (h01 : c ≤ r0 * a1) (h10 : c ≤ r1 * a0)
    (h11 : c ≤ r1 * a1) : c ≤ z * w := by
  have p1 : 0 ≤ (r1 - z) * (a1 - w) := mul_nonneg (by linarith) (by linarith)
  have p2 : 0 ≤ (r1 - z) * (w - a0) := mul_nonneg (by linarith) (by linarith)
  have p3 : 0 ≤ (z - r0) * (a1 - w) := mul_nonneg (by linarith) (by linarith)
  have p4 : 0 ≤ (z - r0) * (w - a0) := mul_nonneg (by linarith) (by linarith)
  have key : (r1 - r0) * (a1 - a0) * (z * w - c) =
      (r1 - z) * (a1 - w) * (r0 * a0 - c) + (r1 - z) * (w - a0) * (r0 * a1 - c) +
      (z - r0) * (a1 - w) * (r1 * a0 - c) + (z - r0) * (w - a0) * (r1 * a1 - c) := by ring
  have hR : 0 ≤ (r1 - r0) * (a1 - a0) * (z * w - c) := by
    rw [key]
    have := mul_nonneg p1 (sub_nonneg.2 h00)
    have := mul_nonneg p2 (sub_nonneg.2 h01)
    have := mul_nonneg p3 (sub_nonneg.2 h10)
    have := mul_nonneg p4 (sub_nonneg.2 h11)
    linarith
  have hpos : 0 < (r1 - r0) * (a1 - a0) := mul_pos (by linarith) (by linarith)
  have := (mul_nonneg_iff_of_pos_left hpos).1 hR
  linarith

theorem bilin_ub {r0 r1 a0 a1 z w c : ℝ} (hr : r0 < r1) (ha : a0 < a1) (hz0 : r0 ≤ z) (hz1 : z ≤ r1)
    (hw0 : a0 ≤ w) (hw1 : w ≤ a1) (h00 : r0 * a0 ≤ c) (h01 : r0 * a1 ≤ c) (h10 : r1 * a0 ≤ c)
    (h11 : r1 * a1 ≤ c) : z * w ≤ c := by
  have := bilin_lb (c := -c) (w := -w) (a0 := -a1) (a1 := -a0) hr (by linarith) hz0 hz1
    (by linarith) (by linarith) (by linarith) (by linarith) (by linarith) (by linarith)
  linarith

/-- The two integer bounds of `pboxOk` on one other axis give the real bounds of `ρ·a`. -/
theorem pbox_axis {D pl ph r0 r1 a0 a1 : ℤ} (hD : 0 < D) (hr : r0 < r1) (ha : a0 < a1)
    (h : ((decide (pl * D ≤ r0 * a0) = true ∧ decide (r0 * a0 ≤ ph * D) = true) ∧
        decide (pl * D ≤ r0 * a1) = true ∧ decide (r0 * a1 ≤ ph * D) = true) ∧
      (decide (pl * D ≤ r1 * a0) = true ∧ decide (r1 * a0 ≤ ph * D) = true) ∧
        decide (pl * D ≤ r1 * a1) = true ∧ decide (r1 * a1 ≤ ph * D) = true)
    {z w : ℝ} (hz0 : (r0 : ℝ) ≤ z) (hz1 : z ≤ r1) (hw0 : (a0 : ℝ) ≤ w) (hw1 : w ≤ a1) :
    (pl : ℝ) ≤ D * (z / D * (w / D)) ∧ D * (z / D * (w / D)) ≤ ph := by
  simp only [decide_eq_true_eq] at h
  obtain ⟨⟨⟨a, b⟩, c, d⟩, ⟨e, f⟩, g, k⟩ := h
  have hD' : (0 : ℝ) < D := by exact_mod_cast hD
  have hr' : (r0 : ℝ) < r1 := by exact_mod_cast hr
  have ha' : (a0 : ℝ) < a1 := by exact_mod_cast ha
  have hdz : (D : ℝ) * (z / D * (w / D)) = z * w / D := by field_simp
  rw [hdz, le_div_iff₀ hD', div_le_iff₀ hD']
  constructor
  · exact bilin_lb hr' ha' hz0 hz1 hw0 hw1 (by exact_mod_cast a) (by exact_mod_cast c)
      (by exact_mod_cast e) (by exact_mod_cast g)
  · exact bilin_ub hr' ha' hz0 hz1 hw0 hw1 (by exact_mod_cast b) (by exact_mod_cast d)
      (by exact_mod_cast f) (by exact_mod_cast k)

/-- **`pboxOk`.** The lifted point `D · lift i sg (z / D)` of a point `z` of the local box lies in the
`p` box `[plo, phi]` of chart 0. -/
theorem pbox_spec {D : ℤ} (hD : 0 < D) {i : ℕ} (hi : i < 3) {sg : ℤ} (hsg : sg = 1 ∨ sg = -1)
    {b : LBox} (hbw : boxWf b = true) {plo phi : List ℤ}
    (hp : pboxOk D i sg b.lo b.hi plo phi = true) {z : Fin 3 → ℝ} (hz : InL b z) :
    ∀ k : Fin 3, ((nth plo k.val 0 : ℤ) : ℝ) ≤ D * lift i sg (fun k => z k / D) k ∧
      D * lift i sg (fun k => z k / D) k ≤ ((nth phi k.val 0 : ℤ) : ℝ) := by
  obtain ⟨hl3, hh3, hzw⟩ := boxWf_spec hbw
  obtain ⟨l0, l1, l2, hl⟩ := List.length_eq_three.1 hl3
  obtain ⟨h0, h1, h2, hh⟩ := List.length_eq_three.1 hh3
  rw [hl, hh] at hzw
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, List.all_cons, List.all_nil,
    Bool.and_true, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, id] at hzw
  obtain ⟨⟨e0, _⟩, ⟨e1, _⟩, ⟨e2, _⟩⟩ := hzw
  have hz0 := hz 0
  have hz1 := hz 1
  have hz2 := hz 2
  rw [hl, hh] at hz0 hz1 hz2
  simp only [nth, Fin.val_zero, Fin.val_one, Fin.val_two, List.getD_cons_zero,
    List.getD_cons_succ] at hz0 hz1 hz2
  have hD' : (0 : ℝ) < D := by exact_mod_cast hD
  unfold pboxOk at hp
  rw [hl, hh] at hp
  simp only [nth, List.getD_cons_zero, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hp
  obtain ⟨⟨⟨⟨⟨hpl, hph⟩, _⟩, hax⟩, hoth⟩, _⟩ := hp
  obtain ⟨p0, p1, p2, rfl⟩ := List.length_eq_three.1 hpl
  obtain ⟨q0, q1, q2, rfl⟩ := List.length_eq_three.1 hph
  have hdiv : ∀ t : ℝ, (D : ℝ) * (sg * (t / D)) = sg * t := by intro t; field_simp
  have haxis : ∀ (pl ph : ℤ), (if sg > 0 then decide (pl ≤ l0) && decide (h0 ≤ ph)
      else decide (pl ≤ -h0) && decide (-l0 ≤ ph)) = true →
      (pl : ℝ) ≤ D * (sg * (z 0 / D)) ∧ D * (sg * (z 0 / D)) ≤ ph := by
    intro pl ph hc
    rw [hdiv]
    rcases hsg with rfl | rfl
    · simp only [gt_iff_lt, Int.reduceLT, ite_true, Bool.and_eq_true, decide_eq_true_eq] at hc
      have a : (pl : ℝ) ≤ l0 := by exact_mod_cast hc.1
      have b : (h0 : ℝ) ≤ ph := by exact_mod_cast hc.2
      push_cast; constructor <;> linarith [hz0.1, hz0.2]
    · simp only [gt_iff_lt, Int.reduceLT, ite_false, Bool.and_eq_true, decide_eq_true_eq] at hc
      have a : (pl : ℝ) ≤ -h0 := by exact_mod_cast hc.1
      have b : (-l0 : ℝ) ≤ ph := by exact_mod_cast hc.2
      push_cast; constructor <;> linarith [hz0.1, hz0.2]
  have hr : l0 < h0 := e0
  interval_cases i
  · have hothers : (List.zip (List.range 2) ((List.range 3).filter (· != 0))) = [(0, 1), (1, 2)] := by
      decide
    rw [hothers] at hoth
    simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true] at hoth
    obtain ⟨o1, o2⟩ := hoth
    simp only [List.getD_cons_zero, List.getD_cons_succ] at hax o1 o2
    intro k
    fin_cases k
    · simpa [lift, nth] using haxis p0 q0 hax
    · simpa [lift, nth] using pbox_axis hD hr e1 o1 hz0.1 hz0.2 hz1.1 hz1.2
    · simpa [lift, nth] using pbox_axis hD hr e2 o2 hz0.1 hz0.2 hz2.1 hz2.2
  · have hothers : (List.zip (List.range 2) ((List.range 3).filter (· != 1))) = [(0, 0), (1, 2)] := by
      decide
    rw [hothers] at hoth
    simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true] at hoth
    obtain ⟨o1, o2⟩ := hoth
    simp only [List.getD_cons_zero, List.getD_cons_succ] at hax o1 o2
    intro k
    fin_cases k
    · simpa [lift, nth] using pbox_axis hD hr e1 o1 hz0.1 hz0.2 hz1.1 hz1.2
    · simpa [lift, nth] using haxis p1 q1 hax
    · simpa [lift, nth] using pbox_axis hD hr e2 o2 hz0.1 hz0.2 hz2.1 hz2.2
  · have hothers : (List.zip (List.range 2) ((List.range 3).filter (· != 2))) = [(0, 0), (1, 1)] := by
      decide
    rw [hothers] at hoth
    simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true] at hoth
    obtain ⟨o1, o2⟩ := hoth
    simp only [List.getD_cons_zero, List.getD_cons_succ] at hax o1 o2
    intro k
    fin_cases k
    · simpa [lift, nth] using pbox_axis hD hr e1 o1 hz0.1 hz0.2 hz1.1 hz1.2
    · simpa [lift, nth] using pbox_axis hD hr e2 o2 hz0.1 hz0.2 hz2.1 hz2.2
    · simpa [lift, nth] using haxis p2 q2 hax

/-- `qlam` does not enter `WF`・`Dens`. -/
theorem wf_qlam {P : Prob} (h : WF P) (q : ℕ) : WF { P with qlam := q } :=
  ⟨h.pos, h.nb, h.verts, h.normals, h.n0, h.pv, h.cverts, h.tstar, h.gs, h.ks, h.d0, h.sstar, h.c0⟩

theorem dens_qlam {P : Prob} (h : Dens P) (q : ℕ) : Dens { P with qlam := q } :=
  ⟨h.dn, h.dv, h.dn0, h.dp, h.d0, h.sd, h.td⟩

/-- **A far-shaped leaf.** If `farLeafOk` passes, every feasible `(R, t, S)` with `t ∈ T·P_T` and `R`
at a point `z` of the local box (`u = D · lift i sg (z / D)` in chart 0) has `S ≥ S̄`. -/
theorem far_leaf {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) {qlamL : ℕ} (hqL : 0 < qlamL) (hTr : 0 < Tr P) (hrden : 0 < P.rden)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    {i : ℕ} (hi : i < 3) {sg : ℤ} (hsg : sg = 1 ∨ sg = -1) {b : LBox} (hbw : boxWf b = true)
    {plo phi : List ℤ} {mu : ℕ} {ts : List Term}
    (hf : farLeafOk P qlamL P.rden i sg b plo phi mu ts = true) {z : Fin 3 → ℝ} (hz : InL b z)
    {R : M3} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R P.rden 0 u)
    (hu : ∀ k, u k = P.rden * lift i sg (fun k => z k / P.rden) k) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hin : ∀ j < P.normals.length, dot (NCv P j) t ≤ Tr P) : Sb P ≤ S := by
  unfold farLeafOk at hf
  simp only [Bool.and_eq_true] at hf
  obtain ⟨⟨hpb, hrw⟩, hacc⟩ := hf
  set P' : Prob := { P with qlam := qlamL } with hP'
  set rb : RBox := ⟨0, nth plo 0 0, nth plo 1 0, nth plo 2 0, nth phi 0 0, nth phi 1 0, nth phi 2 0⟩
    with hrb
  have hbox := pbox_spec hrden hi hsg hbw hpb hz
  have hy : ∀ k, (bLo rb k : ℝ) ≤ u k ∧ u k ≤ bHi rb k := by
    intro k
    rw [hu k]
    have := hbox k
    fin_cases k <;> simpa [bLo, bHi, hrb] using this
  obtain ⟨s, hs, hsu⟩ := box_param hrw u hy
  obtain ⟨Nv, hNv, hN, hent⟩ := FarG.box_entries (P := P') hc (B := rb) rfl hsu
  have hG := accept_G (P := P') hb hKb (wf_qlam hwf qlamL) (dens_qlam hd qlamL) hacc hs hNv hent hN
  have hts : termsOk P' ts = true := by
    simp only [acceptOk, Bool.and_eq_true] at hacc; exact hacc.1
  exact accept_bound (P := P') hG hts hqL hTr hPT hLP hin

/-! ## Unpacking `localQ` -/

def runQ (P : Prob) (qlamL : ℕ) (polys : List (Poly × List Poly)) (x : (ℕ × ℤ) × List QTok) : QState :=
  x.2.foldl (qstep P qlamL P.rden x.1.1 x.1.2 (cfOf P polys x.1.1 x.1.2)) ⟨[rootL P], true, 0, 0⟩

def resQ (P : Prob) (qlamL : ℕ) (polys : List (Poly × List Poly)) (faces : List (List QTok)) :
    Bool × ℕ × ℕ :=
  (List.zip faceList faces).foldl (fun (acc : Bool × ℕ × ℕ) x =>
    (acc.1 && (runQ P qlamL polys x).ok && (runQ P qlamL polys x).stack.isEmpty,
      acc.2.1 + (runQ P qlamL polys x).nW, acc.2.2 + (runQ P qlamL polys x).nF)) (true, 0, 0)

theorem localQ_eq (P : Prob) (qlamL : ℕ) (cands : List Cand) (faces : List (List QTok)) :
    localQ P qlamL cands faces =
      ((((!cands.isEmpty && cands.all (candOk P)) &&
            cands.all (fun c => c.dm == (cands.headD ⟨[], [], [], 0⟩).dm)) &&
          ((P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden) && decide (0 < P.r0))) &&
        faces.length == 6 && (resQ P qlamL (polysOf P cands) faces).1,
       (resQ P qlamL (polysOf P cands) faces).2.1, (resQ P qlamL (polysOf P cands) faces).2.2) := rfl

theorem foldl_and3 {α : Type} (g h : α → Bool) (n m : α → ℕ) :
    ∀ (l : List α) (b : Bool) (k1 k2 : ℕ),
    (l.foldl (fun (acc : Bool × ℕ × ℕ) x => (acc.1 && g x && h x, acc.2.1 + n x, acc.2.2 + m x))
      (b, k1, k2)).1 = true →
    ∀ x ∈ l, g x = true ∧ h x = true := by
  have hfalse : ∀ (l : List α) (k1 k2 : ℕ),
      (l.foldl (fun (acc : Bool × ℕ × ℕ) x => (acc.1 && g x && h x, acc.2.1 + n x, acc.2.2 + m x))
        (false, k1, k2)).1 = false := by
    intro l; induction l with
    | nil => intro k1 k2; rfl
    | cons y l ih2 => intro k1 k2; rw [List.foldl_cons]; simp only [Bool.false_and]; exact ih2 _ _
  intro l
  induction l with
  | nil => intro b k1 k2 _; simp
  | cons a l ih =>
    intro b k1 k2 hb
    rw [List.foldl_cons] at hb
    have h1 : (b && g a && h a) = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [hc, hfalse] at hb
      exact Bool.false_ne_true hb
    simp only [Bool.and_eq_true] at h1
    intro x hx
    rcases List.mem_cons.1 hx with rfl | hx
    · exact ⟨h1.1.2, h1.2⟩
    · exact ih _ _ _ hb x hx

theorem localQ_unpack {P : Prob} {qlamL : ℕ} {cands : List Cand} {faces : List (List QTok)}
    (h : (localQ P qlamL cands faces).1 = true) :
    (∀ c ∈ cands, candOk P c = true) ∧ faces.length = 6 ∧
    ∀ x ∈ List.zip faceList faces, (runQ P qlamL (polysOf P cands) x).ok = true ∧
      (runQ P qlamL (polysOf P cands) x).stack = [] := by
  rw [localQ_eq] at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨_, hc⟩, _⟩, _⟩, hlen⟩, hres⟩ := h
  refine ⟨List.all_eq_true.1 hc, hlen, ?_⟩
  intro x hx
  have := foldl_and3 (fun x => (runQ P qlamL (polysOf P cands) x).ok)
    (fun x => (runQ P qlamL (polysOf P cands) x).stack.isEmpty)
    (fun x => (runQ P qlamL (polysOf P cands) x).nW)
    (fun x => (runQ P qlamL (polysOf P cands) x).nF) _ true 0 0 hres x hx
  exact ⟨this.1, List.isEmpty_iff.1 this.2⟩

/-- The candidate polynomials are well formed. -/
theorem polys_wf {P : Prob} (hwf : WF P) {cands : List Cand}
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v) {Rq : List Poly} {N : Poly}
    (hRq : ∀ p ∈ Rq, PolySemG.WF P.ps p) (hN : PolySemG.WF P.ps N) :
    ∀ yy ∈ cands.map (fun c => (FP P c Rq N, AIL P c Rq)),
      PolySemG.WF P.ps yy.1 ∧ ∀ a ∈ yy.2, PolySemG.WF P.ps a := by
  intro yy hyy
  rw [List.mem_map] at hyy
  obtain ⟨c, hc', hyc⟩ := hyy
  subst hyc
  dsimp only
  refine ⟨(cand_eval hwf (hcw c hc') hRq hN (fun _ => 0)).1.1, fun a ha => ?_⟩
  have hAev := (cand_eval hwf (hcw c hc') hRq hN (fun _ => 0)).2
  simp only [AIL, List.mem_map, List.mem_range] at ha
  obtain ⟨j, _, rfl⟩ := ha
  exact (hAev j).1

theorem map_candPolys (P : Prob) (cands : List Cand) (Rq : List Poly) (N : Poly) :
    cands.map (candPolys P Rq N) = cands.map (fun c => (FP P c Rq N, AIL P c Rq)) :=
  List.map_congr_left (fun c _ => candPolys_eq P c Rq N)

/-! ## The local region -/

/-- **The local region of Lemma Q.** If `localQ` passes (and the constants), every feasible
`(R, t, S)` with `R` a point of chart 0 with `|u i| ≤ r0` (the right case of `far_main`) has
`S ≥ S̄`. Weighted leaves through `LocalW.cands_wbound` (with `S* = S̄`), far-shaped leaves through
`far_leaf` inside `T·P_T` and `outside_bound` outside. -/
theorem localQ_main {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hrden : 0 < P.rden) {qlamL : ℕ}
    (hqL : 0 < qlamL) (hTr : 0 < Tr P) (hbo : boundsOk P = true)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    (hSS : Ss P = Sb P)
    {cands : List Cand} {faces : List (List QTok)} (hloc : (localQ P qlamL cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    {R : M3} (hR : R ∈ SO3) {u : Fin 3 → ℝ} (hc : Charts.ChartPt R P.rden 0 u)
    (hu : ∀ i, |u i| ≤ P.r0) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S) :
    Sb P ≤ S := by
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  set x : Fin 3 → ℝ := fun i => u i / P.rden with hxdef
  have hx : ∀ i, x i = u i / P.rden := fun i => rfl
  have hrq := chart_local hden hc hx
  obtain ⟨hRqW, hNW, hmap, hNv⟩ := rotPoly_spec P.ps x
  rw [← hwf.nb] at hRqW hNW hmap hNv
  set Rq := (rotPoly P.ps P.nb).1 with hRq
  set N := (rotPoly P.ps P.nb).2 with hN
  set Nx := 1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 with hNx
  have hNx0 : 0 < Nx := by positivity
  have hlenRq : Rq.length = 9 := by
    have := congrArg List.length hmap; simpa [rqList] using this
  set e : ℕ → ℝ := fun t => pEval P.ps (nth Rq t []) x with hedef
  have he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nx * R a b := by
    intro a b
    have hab : 3 * a.val + b.val < Rq.length := by rw [hlenRq]; omega
    have := map_getD hmap hab
    rw [hrq] at this
    simp only [hedef]
    rw [this]
    fin_cases a <;> fin_cases b <;> rfl
  have hxb : ∀ i, |x i| ≤ P.r0 / P.rden := by
    intro i
    rw [hx i, abs_div, abs_of_pos hden]
    exact div_le_div_of_nonneg_right (hu i) hden.le
  obtain ⟨i, sg, hmem, hi, y, hy0, hy0', hy1, hy2, hlift⟩ := face_point x hxb
  obtain ⟨hcand, hlen, hruns⟩ := localQ_unpack hloc
  obtain ⟨toks, htm⟩ := zip_mem (by rw [hlen]; rfl) hmem
  obtain ⟨hok, hst⟩ := hruns _ htm
  have hroot : InL (rootL P) (fun k => (P.rden : ℝ) * y k) := by
    have hy0'' : (P.rden : ℝ) * y 0 ≤ P.r0 := by
      rw [le_div_iff₀ hden] at hy0'; linarith
    have a1 := abs_le.1 hy1
    have a2 := abs_le.1 hy2
    intro k
    fin_cases k <;> simp [rootL, nth] <;> constructor <;> nlinarith
  obtain ⟨B, ⟨hbw, hleaf⟩, hzB⟩ :=
    qrun_cover P qlamL P.rden i sg (cfOf P (polysOf P cands) i sg) toks _ hok hst _
      ⟨rootL P, List.mem_singleton_self _, hroot⟩
  have hzy : (fun k => (fun k => (P.rden : ℝ) * y k) k / (P.rden : ℝ)) = y := by
    funext k; field_simp
  have hsg : sg = 1 ∨ sg = -1 := by
    simp only [faceList, List.mem_cons, Prod.mk.injEq, List.not_mem_nil, or_false] at hmem
    rcases hmem with ⟨_, h⟩ | ⟨_, h⟩ | ⟨_, h⟩ | ⟨_, h⟩ | ⟨_, h⟩ | ⟨_, h⟩ <;> simp [h]
  have hz0 : 0 ≤ (fun k => (P.rden : ℝ) * y k) 0 := mul_nonneg hden.le hy0
  rcases hleaf with ⟨ws, hw⟩ | ⟨plo, phi, mu, ts, hf⟩
  · -- a weighted leaf
    have hpol : polysOf P cands = cands.map (fun c => (FP P c Rq N, AIL P c Rq)) := by
      rw [← map_candPolys, hRq, hN]; rfl
    rw [hpol] at hw
    have hpw := polys_wf hwf hcw hRqW hNW
    obtain ⟨hAll, hpos⟩ := wleaf hb hKb hwf hrden hpw hi hbw hw hzB hz0
    rw [hzy, hlift] at hAll hpos
    have hplen : (cands.map (fun c => (FP P c Rq N, AIL P c Rq))).length = cands.length := List.length_map _
    set cd : ℕ × ℕ → Cand := fun q => nth cands q.1 ⟨[], [], [], 0⟩ with hcd
    have hlt : ∀ q ∈ ws, q.1 < cands.length := fun q hq => hplen ▸ (hAll q hq).1
    have hpn : ∀ q ∈ ws, nth (cands.map (fun c => (FP P c Rq N, AIL P c Rq))) q.1 ([], []) =
        (FP P (cd q) Rq N, AIL P (cd q) Rq) := by
      intro q hq
      rw [nth_map_of_lt _ (hlt q hq) _ ⟨[], [], [], 0⟩]
    have hcm : ∀ q ∈ ws, cd q ∈ cands := fun q hq => nth_mem (hlt q hq) _
    have hA : ∀ q ∈ ws, ∀ j < 3, 0 ≤ AV P (cd q) e j := by
      intro q hq j hj
      obtain ⟨_, hAev⟩ := cand_eval hwf (hcw _ (hcm q hq)) hRqW hNW x
      have h1 := (hAll q hq).2 (AIP P (cd q) Rq j) (by
        rw [hpn q hq]; dsimp only; exact List.mem_map_of_mem (List.mem_range.2 hj))
      rw [(hAev j).2] at h1
      exact h1
    have hsum : (ws.map (fun q => (q.2 : ℝ) * FV P (cd q) e Nx)).sum =
        (ws.map (fun q => (q.2 : ℝ) * pEval P.ps (nth (cands.map (fun c => (FP P c Rq N, AIL P c Rq))) q.1 ([], [])).1 x)).sum := by
      congr 1
      apply List.map_congr_left
      intro q hq
      obtain ⟨hFev, _⟩ := cand_eval hwf (hcw _ (hcm q hq)) hRqW hNW x
      rw [hpn q hq]; dsimp only; rw [hFev.2, hNv]
    have key := LocalW.cands_wbound hwf hd hsd ws cd (fun q => (q.2 : ℝ))
      (fun q hq => hcand _ (hcm q hq)) (fun q hq => hcw _ (hcm q hq)) (fun q _ => by positivity)
      hNx0 he hLP hA (by rw [hsum]; exact hpos)
    rw [← hSS]; exact key
  · -- a far-shaped leaf
    have hu' : ∀ k, u k = P.rden * lift i sg (fun k => (fun k => (P.rden : ℝ) * y k) k / P.rden) k := by
      intro k
      rw [hzy, hlift, hx k]
      field_simp
    exact far_leaf hb hKb hwf hd hqL hTr hrden hPT hi hsg hbw hf hzB hc hu' hLP hout

end

#assert_std_axioms PackLean.Formal.LocalQMain.wleaf PackLean.Formal.LocalQMain.far_leaf
  PackLean.Formal.LocalQMain.localQ_main

end PackLean.Formal.LocalQMain
