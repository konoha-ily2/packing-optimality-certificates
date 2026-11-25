import PackLean.Formal.FarG

/-!
# D45 stage 4j: the local box `L` of `D16.Core` (`localOk`)

`localOk P cands faces` (the local check of the six cases d16d・d16e) gives, at every rotation `R`
of the local box `L` (chart 0, `|u i| ≤ r0`, the output of `far_main`), the bound `S ≥ S*` for every
feasible `(R, t, S)` of the LP of the piece (`local_main`).

* `lrun_cover`: the box tree of one face of the cube covers its root box (as `CoverTreeG.run_cover`);
* `face_point`: every point `p` of the cube `|p i| ≤ ρ` is `lift i sg y` for a face `(i, sg)` of
  `faceList` and `y` in the root box (`0 ≤ y 0 ≤ ρ`, `|y 1|, |y 2| ≤ 1`);
* `rotPoly_spec`: the values of `rotPoly` (the rotation of `q = (1, x)`);
* `cand_eval`: the values of `candPolys` (`F` and `A_j`);
* `cand_bound`: weak duality — `F(x) ≥ 0` and `A_j(x) ≥ 0` give `S ≥ S*`;
* `local_main`: everything together.
-/

namespace PackLean.Formal.LocalG

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand LTok LBox LState lstep lsplit lbPos faceList localOk candOk candPolys
  rotPoly constTerm faceSub shiftLb3 FacePolys z3 pconst pvar pneg psub)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.QuadSem
  PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf pEval lift)
open scoped Matrix

noncomputable section

/-! ## The box tree of one face -/

/-- The point `z` lies in the closed box `b` (in units of `D`). -/
def InL (b : LBox) (z : Fin 3 → ℝ) : Prop :=
  ∀ k : Fin 3, ((nth b.lo k.val 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth b.hi k.val 0 : ℤ) : ℝ)

/-- What an accepted leaf certifies. -/
def LGood (P : Prob) (D : ℤ) (Hs : FacePolys) (b : LBox) : Prop :=
  b.lo.length = 3 ∧ b.hi.length = 3 ∧
  (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
  ∃ c < Hs.length, lbPos P D (nth Hs c ([], [])).1 b true = true ∧
    ∀ x ∈ (nth Hs c ([], [])).2, lbPos P D x.2 b (!x.1) = true

theorem lstep_ok_false (P : Prob) (D : ℤ) (Hs : FacePolys) (s : LState) (t : LTok)
    (h : s.ok = false) : (lstep P D Hs s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [lstep, hst, h]

theorem foldl_ok_false (P : Prob) (D : ℤ) (Hs : FacePolys) :
    ∀ (toks : List LTok) (s : LState), s.ok = false → (toks.foldl (lstep P D Hs) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (lstep_ok_false P D Hs s t h)

theorem getD_set (l : List ℤ) (a k : ℕ) (m d : ℤ) :
    (l.set a m).getD k d = l.getD k d ∨ (k = a ∧ (l.set a m).getD k d = m) := by
  simp only [List.getD_eq_getElem?_getD, List.getElem?_set]
  by_cases h : a = k
  · subst h
    by_cases h2 : a < l.length
    · right; simp [h2]
    · left; simp [h2]
  · left; simp [h]

theorem lsplit_cover (b : LBox) (z : Fin 3 → ℝ) (h : InL b z) :
    InL (lsplit b).1 z ∨ InL (lsplit b).2 z := by
  unfold lsplit
  simp only
  generalize ((List.range 3).find? _).getD 0 = ax
  generalize (nth b.lo ax 0 + nth b.hi ax 0) / 2 = mid
  have hax : ∀ k : Fin 3, k.val = ax → ((nth b.lo k.val 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ nth b.hi k.val 0 :=
    fun k _ => h k
  rcases le_total (z ⟨ax % 3, Nat.mod_lt _ (by norm_num)⟩) (mid : ℝ) with hz | hz
  · left
    intro k
    refine ⟨(h k).1, ?_⟩
    unfold nth
    rcases getD_set b.hi ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).2
    · rw [e2]
      have : k = ⟨ax % 3, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz
  · right
    intro k
    refine ⟨?_, (h k).2⟩
    unfold nth
    rcases getD_set b.lo ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).1
    · rw [e2]
      have : k = ⟨ax % 3, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz

/-- **Tree soundness** of one face (as `CoverTreeG.run_cover`). -/
theorem lrun_cover (P : Prob) (D : ℤ) (Hs : FacePolys) :
    ∀ (toks : List LTok) (s : LState), (toks.foldl (lstep P D Hs) s).ok = true →
      (toks.foldl (lstep P D Hs) s).stack = [] →
      ∀ z, (∃ B ∈ s.stack, InL B z) → ∃ B, LGood P D Hs B ∧ InL B z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (lstep P D Hs s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P D Hs toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (lstep P D Hs s .split).stack = (lsplit B).1 :: (lsplit B).2 :: rest := by
            simp [lstep, hs]
          refine ih _ hok hst z ?_
          rw [hs']
          rcases lsplit_cover B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | acc c =>
          simp only [lstep, hs, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hok'
          obtain ⟨⟨⟨⟨⟨_, hc⟩, hl⟩, hh⟩, hw⟩, hr⟩ := hok'
          refine ⟨B, ⟨hl, hh, hw, c, hc, ?_⟩, hz⟩
          simpa [List.all_eq_true] using hr
      · have hsub : ∀ C ∈ rest, C ∈ (lstep P D Hs s t).stack := by
          intro C hC; cases t <;> simp [lstep, hs, hC]
        exact ih _ hok hst z ⟨B, hsub B hBr, hz⟩

/-! ## Points of the cube on the faces -/

theorem face_aux (a b c : ℝ) (hb : |b| ≤ |a|) (hc : |c| ≤ |a|) :
    ∃ sg : ℤ, (sg = 1 ∨ sg = -1) ∧ (sg : ℝ) * |a| = a ∧ |a| * (b / |a|) = b ∧ |a| * (c / |a|) = c ∧
      abs (b / |a|) ≤ 1 ∧ abs (c / |a|) ≤ 1 := by
  have key : ∀ d : ℝ, |d| ≤ |a| → |a| * (d / |a|) = d ∧ abs (d / |a|) ≤ 1 := by
    intro d hd
    rcases eq_or_lt_of_le (abs_nonneg a) with h0 | h0
    · rw [← h0] at hd ⊢
      have : d = 0 := abs_nonpos_iff.1 hd
      subst this; simp
    · have hne : |a| ≠ 0 := h0.ne'
      refine ⟨by field_simp, ?_⟩
      rw [abs_div, abs_abs]; exact div_le_one_of_le₀ hd h0.le
  obtain ⟨b1, b2⟩ := key b hb
  obtain ⟨c1, c2⟩ := key c hc
  rcases le_total 0 a with ha | ha
  · exact ⟨1, Or.inl rfl, by rw [abs_of_nonneg ha]; simp, b1, c1, b2, c2⟩
  · exact ⟨-1, Or.inr rfl, by rw [abs_of_nonpos ha]; simp, b1, c1, b2, c2⟩

theorem faceList_mem {i : ℕ} (hi : i < 3) {sg : ℤ} (hsg : sg = 1 ∨ sg = -1) : (i, sg) ∈ faceList := by
  interval_cases i <;> rcases hsg with rfl | rfl <;> simp [faceList]

/-- Every point of the cube `|p i| ≤ ρ` is `lift i sg y` on a face of `faceList`, with `y` in the
root box of the face. -/
theorem face_point {ρ : ℝ} (p : Fin 3 → ℝ) (hp : ∀ i, |p i| ≤ ρ) :
    ∃ i sg, (i, sg) ∈ faceList ∧ i < 3 ∧ ∃ y : Fin 3 → ℝ, 0 ≤ y 0 ∧ y 0 ≤ ρ ∧ |y 1| ≤ 1 ∧
      |y 2| ≤ 1 ∧ lift i sg y = p := by
  rcases le_total |p 1| |p 0| with h10 | h01
  · rcases le_total |p 2| |p 0| with h20 | h02
    · obtain ⟨sg, hsg, e0, e1, e2, b1, b2⟩ := face_aux (p 0) (p 1) (p 2) h10 h20
      refine ⟨0, sg, faceList_mem (by norm_num) hsg, by norm_num, ![|p 0|, p 1 / |p 0|, p 2 / |p 0|],
        by simp, by simpa using hp 0, by simpa using b1, by simpa using b2, ?_⟩
      funext k; fin_cases k <;> simp [lift, e0, e1, e2]
    · obtain ⟨sg, hsg, e0, e1, e2, b1, b2⟩ := face_aux (p 2) (p 0) (p 1) h02 (h10.trans h02)
      refine ⟨2, sg, faceList_mem (by norm_num) hsg, by norm_num, ![|p 2|, p 0 / |p 2|, p 1 / |p 2|],
        by simp, by simpa using hp 2, by simpa using b1, by simpa using b2, ?_⟩
      funext k; fin_cases k <;> simp [lift, e0, e1, e2]
  · rcases le_total |p 2| |p 1| with h21 | h12
    · obtain ⟨sg, hsg, e0, e1, e2, b1, b2⟩ := face_aux (p 1) (p 0) (p 2) h01 h21
      refine ⟨1, sg, faceList_mem (by norm_num) hsg, by norm_num, ![|p 1|, p 0 / |p 1|, p 2 / |p 1|],
        by simp, by simpa using hp 1, by simpa using b1, by simpa using b2, ?_⟩
      funext k; fin_cases k <;> simp [lift, e0, e1, e2]
    · obtain ⟨sg, hsg, e0, e1, e2, b1, b2⟩ := face_aux (p 2) (p 0) (p 1) (h01.trans h12) h12
      refine ⟨2, sg, faceList_mem (by norm_num) hsg, by norm_num, ![|p 2|, p 0 / |p 2|, p 1 / |p 2|],
        by simp, by simpa using hp 2, by simpa using b1, by simpa using b2, ?_⟩
      funext k; fin_cases k <;> simp [lift, e0, e1, e2]

/-! ## Values of polynomials -/

/-- `p` is well formed with value `v` at `x`. -/
def Ev (ps : List ℕ) (x : Fin 3 → ℝ) (p : Poly) (v : ℝ) : Prop :=
  PolySemG.WF ps p ∧ pEval ps p x = v

section Ev

variable {ps : List ℕ} (x : Fin 3 → ℝ)

theorem ev_padd {p q : Poly} {a b : ℝ} (hp : Ev ps x p a) (hq : Ev ps x q b) :
    Ev ps x (padd p q) (a + b) :=
  ⟨PolySemG.padd_WF hp.1 hq.1, by rw [PolySemG.pEval_padd x hp.1 hq.1, hp.2, hq.2]⟩

theorem ev_psub {p q : Poly} {a b : ℝ} (hp : Ev ps x p a) (hq : Ev ps x q b) :
    Ev ps x (psub p q) (a - b) :=
  ⟨PolySemG.psub_WF hp.1 hq.1, by rw [PolySemG.pEval_psub x hp.1 hq.1, hp.2, hq.2]⟩

theorem ev_pmul {p q : Poly} {a b : ℝ} (hp : Ev ps x p a) (hq : Ev ps x q b) :
    Ev ps x (pmul ps p q) (a * b) :=
  ⟨PolySemG.pmul_WF hp.1 hq.1, by rw [PolySemG.pEval_pmul x hp.1 hq.1, hp.2, hq.2]⟩

theorem ev_smul (c : ℤ) {p : Poly} {a : ℝ} (hp : Ev ps x p a) : Ev ps x (psmulZ c p) (c * a) :=
  ⟨PolySemG.psmulZ_WF c hp.1, by rw [PolySemG.pEval_psmulZ x c p, hp.2]⟩

theorem ev_smulF {c : FE} (hc : Len ps c) {p : Poly} {a : ℝ} (hp : Ev ps x p a) :
    Ev ps x (psmulF ps c p) (fval ps c * a) :=
  ⟨PolySemG.psmulF_WF hc hp.1, by rw [PolySemG.pEval_psmulF x hc hp.1, hp.2]⟩

theorem ev_psum_range (n : ℕ) (f : ℕ → Poly) (v : ℕ → ℝ) (h : ∀ i < n, Ev ps x (f i) (v i)) :
    Ev ps x (psum ((List.range n).map f)) ((List.range n).map v).sum := by
  have hall : ∀ p ∈ (List.range n).map f, PolySemG.WF ps p := by
    intro p hp
    simp only [List.mem_map, List.mem_range] at hp
    obtain ⟨i, hi, rfl⟩ := hp
    exact (h i hi).1
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum x hall, List.map_map]
  congr 1
  apply List.map_congr_left
  intro i hi
  simp only [List.mem_range] at hi
  simp only [Function.comp_apply]
  exact (h i hi).2

theorem ev_psum3 {p0 p1 p2 : Poly} {a0 a1 a2 : ℝ} (h0 : Ev ps x p0 a0) (h1 : Ev ps x p1 a1)
    (h2 : Ev ps x p2 a2) : Ev ps x (psum [p0, p1, p2]) (a0 + a1 + a2) := by
  have hall : ∀ p ∈ [p0, p1, p2], PolySemG.WF ps p := by
    intro p hp
    simp only [List.mem_cons, List.not_mem_nil, or_false] at hp
    rcases hp with rfl | rfl | rfl
    · exact h0.1
    · exact h1.1
    · exact h2.1
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum x hall]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, h0.2, h1.2, h2.2]
  ring

theorem nth_WF {L : List Poly} (h : ∀ p ∈ L, PolySemG.WF ps p) (t : ℕ) :
    PolySemG.WF ps (nth L t []) := by
  unfold nth
  rcases lt_or_ge t L.length with ht | ht
  · rw [List.getD_eq_getElem _ _ ht]; exact h _ (List.getElem_mem ht)
  · rw [List.getD_eq_default _ _ ht]; exact PolySemG.WF_nil

end Ev

/-! ## The rotation `rotPoly` -/

theorem rotPoly_spec (ps : List ℕ) (x : Fin 3 → ℝ) :
    (∀ e ∈ (rotPoly ps (2 ^ ps.length)).1, PolySemG.WF ps e) ∧
    PolySemG.WF ps (rotPoly ps (2 ^ ps.length)).2 ∧
    (rotPoly ps (2 ^ ps.length)).1.map (pEval ps · x) = rqList 1 (x 0) (x 1) (x 2) ∧
    pEval ps (rotPoly ps (2 ^ ps.length)).2 x = 1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 := by
  have hw : Ev ps x (pconst (fofInt (2 ^ ps.length) 1)) 1 :=
    ⟨PolySemG.pconst_WF (len_fofInt ps 1), by rw [PolySemG.pEval_pconst, fval_fofInt]; simp⟩
  have hx : Ev ps x (pvar (2 ^ ps.length) 0) (x 0) :=
    ⟨PolySemG.pvar_WF 0 (by norm_num), (PolySemG.pEval_pvar x 0 (by norm_num)).trans rfl⟩
  have hy : Ev ps x (pvar (2 ^ ps.length) 1) (x 1) :=
    ⟨PolySemG.pvar_WF 1 (by norm_num), (PolySemG.pEval_pvar x 1 (by norm_num)).trans rfl⟩
  have hz : Ev ps x (pvar (2 ^ ps.length) 2) (x 2) :=
    ⟨PolySemG.pvar_WF 2 (by norm_num), (PolySemG.pEval_pvar x 2 (by norm_num)).trans rfl⟩
  have e0 := ev_psub x (ev_psub x (ev_padd x (ev_pmul x hw hw) (ev_pmul x hx hx)) (ev_pmul x hy hy))
    (ev_pmul x hz hz)
  have e1 := ev_smul x 2 (ev_psub x (ev_pmul x hx hy) (ev_pmul x hw hz))
  have e2 := ev_smul x 2 (ev_padd x (ev_pmul x hx hz) (ev_pmul x hw hy))
  have e3 := ev_smul x 2 (ev_padd x (ev_pmul x hx hy) (ev_pmul x hw hz))
  have e4 := ev_psub x (ev_psub x (ev_padd x (ev_pmul x hw hw) (ev_pmul x hy hy)) (ev_pmul x hx hx))
    (ev_pmul x hz hz)
  have e5 := ev_smul x 2 (ev_psub x (ev_pmul x hy hz) (ev_pmul x hw hx))
  have e6 := ev_smul x 2 (ev_psub x (ev_pmul x hx hz) (ev_pmul x hw hy))
  have e7 := ev_smul x 2 (ev_padd x (ev_pmul x hy hz) (ev_pmul x hw hx))
  have e8 := ev_psub x (ev_psub x (ev_padd x (ev_pmul x hw hw) (ev_pmul x hz hz)) (ev_pmul x hx hx))
    (ev_pmul x hy hy)
  have eN := ev_padd x (ev_padd x (ev_pmul x hw hw) (ev_pmul x hx hx))
    (ev_padd x (ev_pmul x hy hy) (ev_pmul x hz hz))
  refine ⟨?_, eN.1, ?_, ?_⟩
  · intro e he
    simp only [rotPoly, List.mem_cons, List.not_mem_nil, or_false] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl
    · exact e0.1
    · exact e1.1
    · exact e2.1
    · exact e3.1
    · exact e4.1
    · exact e5.1
    · exact e6.1
    · exact e7.1
    · exact e8.1
  · simp only [rotPoly, List.map_cons, List.map_nil]
    rw [e0.2, e1.2, e2.2, e3.2, e4.2, e5.2, e6.2, e7.2, e8.2]
    simp only [rqList, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> push_cast <;> ring
  · simp only [rotPoly]
    rw [eN.2]; ring

/-- A chart-0 point gives the rotation of `q = (1, u / den)`. -/
theorem chart_local {R : M3} {den : ℝ} (hden : 0 < den) {u : Fin 3 → ℝ}
    (hc : Charts.ChartPt R den 0 u) {x : Fin 3 → ℝ} (hx : ∀ i, x i = u i / den) :
    rqList 1 (x 0) (x 1) (x 2) =
      [(1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 0 0, (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 0 1,
       (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 0 2, (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 1 0,
       (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 1 1, (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 1 2,
       (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 2 0, (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 2 1,
       (1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2) * R 2 2] := by
  obtain ⟨_, _, hl⟩ := hc
  simp only [chq, List.getD_cons_zero, List.getD_cons_succ] at hl
  have hs := Charts.rqList_smul (1 / den) den (u 0) (u 1) (u 2)
  rw [hl] at hs
  have hne : den ≠ 0 := hden.ne'
  have e1 : 1 / den * den = 1 := by field_simp
  have eu : ∀ i, 1 / den * u i = x i := fun i => by rw [hx i]; ring
  rw [e1, eu, eu, eu] at hs
  rw [hs]
  have hN : (1 / den) ^ 2 * (den ^ 2 + u 0 ^ 2 + u 1 ^ 2 + u 2 ^ 2) =
      1 + x 0 ^ 2 + x 1 ^ 2 + x 2 ^ 2 := by
    rw [hx 0, hx 1, hx 2]; field_simp
  rw [← hN]
  simp only [List.map_cons, List.map_nil, List.cons.injEq, and_true]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ring

theorem map_getD {L : List Poly} {f : Poly → ℝ} {M : List ℝ} (h : L.map f = M) {t : ℕ}
    (ht : t < L.length) : f (nth L t []) = M.getD t 0 := by
  subst h
  unfold nth
  rw [List.getD_eq_getElem _ _ ht, List.getD_eq_getElem _ _ (by simpa using ht)]
  simp

/-! ## The polynomials of a candidate -/

section Cand

variable (P : Prob) (c : Cand)

def UnP (Rq : List Poly) (r : ℕ) : Poly :=
  psum ((List.range 3).map (fun l => psmulF P.ps (vecGet P.n0 l P.nb) (nth Rq (3 * r + l) [])))

def AIP (Rq : List Poly) (j : ℕ) : Poly :=
  psum ((List.range 3).map (fun r => psmulF P.ps (fneg (vecGet (nth c.minv j []) r P.nb))
    (nth ((List.range 3).map (UnP P Rq)) r [])))

def BIP (Rq : List Poly) (j : ℕ) : Poly :=
  psum ((List.range 9).map (fun t => psmulF P.ps
    (fmul P.ps (vecGet (nth P.normals (nth c.J j 0) []) (t / 3) P.nb)
      (vecGet (nth P.verts (nth c.al j 0) []) (t % 3) P.nb)) (nth Rq t [])))

def AIL (Rq : List Poly) : List Poly := (List.range 3).map (AIP P c Rq)

def FP (Rq : List Poly) (N : Poly) : Poly :=
  psum [psmulF P.ps (fsmul ((P.sstar.den : ℤ) * c.dm * P.dn0 * P.dn * P.dv) P.d0.num) (pmul P.ps N N),
        psmulF P.ps (fsmul (-((P.d0.den : ℤ) * P.dn * P.dv)) P.sstar.num)
          (pmul P.ps N (psum (AIL P c Rq))),
        psmulZ ((P.d0.den : ℤ) * P.sstar.den) (psum ((List.range 3).map (fun j =>
          pmul P.ps (nth (AIL P c Rq) j []) (nth ((List.range 3).map (BIP P c Rq)) j []))))]

theorem candPolys_eq (Rq : List Poly) (N : Poly) : candPolys P Rq N c = (FP P c Rq N, AIL P c Rq) :=
  rfl

/-- Values of the data (no denominators). -/
def oV (l : ℕ) : ℝ := ent P.ps P.nb P.n0 l
def mV (j r : ℕ) : ℝ := ent P.ps P.nb (nth c.minv j []) r
def nV (j a : ℕ) : ℝ := ent P.ps P.nb (nth P.normals (nth c.J j 0) []) a
def vV (j b : ℕ) : ℝ := ent P.ps P.nb (nth P.verts (nth c.al j 0) []) b

variable (e : ℕ → ℝ) (Nv : ℝ)

def UV (r : ℕ) : ℝ := ((List.range 3).map (fun l => oV P l * e (3 * r + l))).sum
def AV (j : ℕ) : ℝ := ((List.range 3).map (fun r => -mV P c j r * UV P e r)).sum
def BV (j : ℕ) : ℝ := ((List.range 9).map (fun t => nV P c j (t / 3) * vV P c j (t % 3) * e t)).sum
def sAV : ℝ := ((List.range 3).map (AV P c e)).sum
def FV : ℝ :=
  (((P.sstar.den : ℤ) * c.dm * P.dn0 * P.dn * P.dv : ℤ) : ℝ) * fval P.ps P.d0.num * (Nv * Nv) +
  ((-((P.d0.den : ℤ) * P.dn * P.dv) : ℤ) : ℝ) * fval P.ps P.sstar.num * (Nv * sAV P c e) +
  (((P.d0.den : ℤ) * P.sstar.den : ℤ) : ℝ) *
    ((List.range 3).map (fun j => AV P c e j * BV P c e j)).sum

end Cand

/-- `S*` as a real number. -/
def Ss (P : Prob) : ℝ := fval P.ps P.sstar.num / P.sstar.den

theorem nth_range {α : Type*} (f : ℕ → α) {r : ℕ} (hr : r < 3) (d : α) :
    nth ((List.range 3).map f) r d = f r := FarG.getD_range_map f hr d

/-- **The values of `candPolys`.** -/
theorem cand_eval {P : Prob} {c : Cand} (hwf : WF P) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    {Rq : List Poly} {N : Poly} (hRq : ∀ p ∈ Rq, PolySemG.WF P.ps p) (hN : PolySemG.WF P.ps N)
    (x : Fin 3 → ℝ) :
    Ev P.ps x (FP P c Rq N) (FV P c (fun t => pEval P.ps (nth Rq t []) x) (pEval P.ps N x)) ∧
      ∀ j, Ev P.ps x (AIP P c Rq j) (AV P c (fun t => pEval P.ps (nth Rq t []) x) j) := by
  set e : ℕ → ℝ := fun t => pEval P.ps (nth Rq t []) x with he
  have hnth : ∀ t, Ev P.ps x (nth Rq t []) (e t) := fun t => ⟨nth_WF hRq t, rfl⟩
  have hU : ∀ r, Ev P.ps x (UnP P Rq r) (UV P e r) := by
    intro r
    unfold UnP UV
    refine ev_psum_range x 3 _ (fun l => oV P l * e (3 * r + l)) ?_
    intro l _
    exact ev_smulF x (len_get1 hwf.nb hwf.n0 l) (hnth _)
  have hA : ∀ j, Ev P.ps x (AIP P c Rq j) (AV P c e j) := by
    intro j
    unfold AIP AV
    refine ev_psum_range x 3 _ (fun r => -mV P c j r * UV P e r) ?_
    intro r hr
    rw [nth_range _ hr]
    have := ev_smulF x (len_fneg (len_get hwf.nb hm j r)) (hU r)
    rw [fval_fneg] at this
    exact this
  have hB : ∀ j, Ev P.ps x (BIP P c Rq j) (BV P c e j) := by
    intro j
    unfold BIP BV
    refine ev_psum_range x 9 _ (fun t => nV P c j (t / 3) * vV P c j (t % 3) * e t) ?_
    intro t _
    have l1 := len_get hwf.nb hwf.normals (nth c.J j 0) (t / 3)
    have l2 := len_get hwf.nb hwf.verts (nth c.al j 0) (t % 3)
    have := ev_smulF x (len_fmul l1 l2) (hnth t)
    rw [fval_fmul l1 l2] at this
    exact this
  have hS : Ev P.ps x (psum (AIL P c Rq)) (sAV P c e) := by
    unfold AIL sAV
    exact ev_psum_range x 3 _ _ (fun j _ => hA j)
  refine ⟨?_, hA⟩
  have hNe : Ev P.ps x N (pEval P.ps N x) := ⟨hN, rfl⟩
  have h1 := ev_smulF x (len_fsmul ((P.sstar.den : ℤ) * c.dm * P.dn0 * P.dn * P.dv) hwf.d0)
    (ev_pmul x hNe hNe)
  have h2 := ev_smulF x (len_fsmul (-((P.d0.den : ℤ) * P.dn * P.dv)) hwf.sstar)
    (ev_pmul x hNe hS)
  have h3 := ev_smul x ((P.d0.den : ℤ) * P.sstar.den)
    (ev_psum_range x 3 (fun j => pmul P.ps (nth (AIL P c Rq) j [])
        (nth ((List.range 3).map (BIP P c Rq)) j []))
      (fun j => AV P c e j * BV P c e j) (fun j hj => by
        unfold AIL
        rw [nth_range _ hj, nth_range _ hj]
        exact ev_pmul x (hA j) (hB j)))
  have := ev_psum3 x h1 h2 h3
  rw [fval_fsmul, fval_fsmul] at this
  unfold FP FV
  exact this

/-! ## Weak duality for one candidate -/

/-- The real core: the multipliers `A_j ≥ 0` of the rows `(J_j, α_j)` and `dm·N·dn0` of the face
row cancel `t`; `F ≥ 0` then gives `S ≥ S*`. -/
theorem dual_core {A0 A1 A2 X0 X1 X2 Y0 Y1 Y2 Z Nv dn dv dn0 dm D0 Sst S : ℝ}
    (hA0 : 0 ≤ A0) (hA1 : 0 ≤ A1) (hA2 : 0 ≤ A2) (hNv : 0 < Nv) (hdn : 0 < dn) (hdv : 0 < dv)
    (hdn0 : 0 < dn0) (hdm : 0 < dm) (hD0 : 0 < D0)
    (r0 : X0 + Y0 ≤ S) (r1 : X1 + Y1 ≤ S) (r2 : X2 + Y2 ≤ S) (hZ : Z ≤ -D0)
    (hc : A0 * Y0 + A1 * Y1 + A2 * Y2 = -(dm * Nv * dn0) * Z)
    (hF : 0 ≤ dm * dn0 * dn * dv * D0 * Nv ^ 2 - dn * dv * Sst * Nv * (A0 + A1 + A2) +
      (A0 * (Nv * dn * dv * X0) + A1 * (Nv * dn * dv * X1) + A2 * (Nv * dn * dv * X2))) :
    Sst ≤ S := by
  have e0 := mul_le_mul_of_nonneg_left r0 hA0
  have e1 := mul_le_mul_of_nonneg_left r1 hA1
  have e2 := mul_le_mul_of_nonneg_left r2 hA2
  have hk : 0 < dm * Nv * dn0 := by positivity
  have ez := mul_le_mul_of_nonneg_left hZ hk.le
  have h1 : A0 * X0 + A1 * X1 + A2 * X2 ≤ (A0 + A1 + A2) * S - dm * Nv * dn0 * D0 := by
    linarith
  have hQ : 0 < Nv * dn * dv := by positivity
  have h1' := mul_le_mul_of_nonneg_left h1 hQ.le
  have h2 : 0 ≤ (dn * dv * Nv) * ((A0 + A1 + A2) * (S - Sst)) := by linarith
  have hK : 0 < dn * dv * Nv := by positivity
  have h3 : 0 ≤ (A0 + A1 + A2) * (S - Sst) := (mul_nonneg_iff_of_pos_left hK).1 h2
  by_contra hlt
  have hlt' := not_le.1 hlt
  have h4 : A0 + A1 + A2 ≤ 0 := by nlinarith
  have a0 : A0 = 0 := by linarith
  have a1 : A1 = 0 := by linarith
  have a2 : A2 = 0 := by linarith
  subst a0 a1 a2
  have : 0 < dm * Nv * dn0 * D0 := by positivity
  linarith

/-- The identity `M_J · M_J⁻¹ = dn · dm · I` of `candOk`, and the ranges. -/
theorem cand_ident {P : Prob} {c : Cand} (hwf : WF P) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    (hc : candOk P c = true) :
    c.J.length = 3 ∧ c.al.length = 3 ∧ 0 < c.dm ∧ (∀ j < 3, nth c.J j 0 < P.normals.length) ∧
    (∀ j < 3, nth c.al j 0 < P.verts.length) ∧
    ∀ r s, r < 3 → s < 3 →
      nV P c 0 r * mV P c 0 s + nV P c 1 r * mV P c 1 s + nV P c 2 r * mV P c 2 s
        = if r = s then (P.dn : ℝ) * c.dm else 0 := by
  unfold candOk at hc
  simp only [Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq, beq_iff_eq, List.mem_range] at hc
  obtain ⟨⟨⟨⟨⟨⟨hJl, hal⟩, _⟩, hdm⟩, hJ⟩, hα⟩, hI⟩ := hc
  refine ⟨hJl, hal, hdm, fun j hj => hJ _ (FarG.mem_nth (by omega) 0),
    fun j hj => hα _ (FarG.mem_nth (by omega) 0), ?_⟩
  intro r s hr hs
  have h := hI (3 * r + s) (by omega)
  have h1 : (3 * r + s) / 3 = r := by omega
  have h2 : (3 * r + s) % 3 = s := by omega
  rw [h1, h2] at h
  have hz : Len P.ps (fzero P.nb) := by rw [hwf.nb]; exact len_fzero P.ps
  have hg : ∀ cc ∈ List.range 3, Len P.ps (fmul P.ps (vecGet (nth P.normals (nth c.J cc 0) []) r P.nb)
      (vecGet (nth c.minv cc []) s P.nb)) := fun cc _ =>
    len_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hm _ _)
  have key := (fval_foldl (fun cc => fmul P.ps (vecGet (nth P.normals (nth c.J cc 0) []) r P.nb)
      (vecGet (nth c.minv cc []) s P.nb)) (List.range 3) (fzero P.nb) hg hz).2.symm.trans
    (congrArg (fval P.ps) h)
  rw [show List.range 3 = [0, 1, 2] from rfl] at key
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, fval_fzero] at key
  rw [fval_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hm _ _),
    fval_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hm _ _),
    fval_fmul (len_get hwf.nb hwf.normals _ _) (len_get hwf.nb hm _ _)] at key
  have hfo : ∀ z : ℤ, fval P.ps (fofInt P.nb z) = z := by
    intro z; rw [hwf.nb]; exact fval_fofInt _ _
  unfold nV mV ent
  split_ifs at key ⊢ with hrs
  · rw [hfo] at key; push_cast at key; linarith
  · rw [fval_fzero] at key; linarith

/-- **One candidate.** If `F(x) ≥ 0` and `A_j(x) ≥ 0` at a point whose rotation entries are
`e (3a + b) = N · R a b`, then every feasible `(R, t, S)` has `S ≥ S*`. -/
theorem cand_bound {P : Prob} {c : Cand} (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den)
    (hD0 : 0 < D0r P) (hc : candOk P c = true) (hm : ∀ v ∈ c.minv, LenV P.ps v)
    {e : ℕ → ℝ} {Nv : ℝ} (hNv : 0 < Nv) {R : M3}
    (he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hA : ∀ j < 3, 0 ≤ AV P c e j) (hF : 0 ≤ FV P c e Nv) : Ss P ≤ S := by
  obtain ⟨_, _, hdm, hJ, hα, hI⟩ := cand_ident hwf hm hc
  have hr3 : List.range 3 = [0, 1, 2] := rfl
  have hr9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdn0 : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
  have hdm' : (0 : ℝ) < c.dm := by exact_mod_cast hdm
  have hd0d : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
  have hssd : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  -- the multipliers
  have hAV : ∀ j, AV P c e j =
      -(mV P c j 0 * UV P e 0) - mV P c j 1 * UV P e 1 - mV P c j 2 * UV P e 2 := by
    intro j; unfold AV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]; ring
  have hUV : ∀ i : Fin 3, UV P e i.val = Nv * (R i 0 * oV P 0 + R i 1 * oV P 1 + R i 2 * oV P 2) := by
    intro i
    have a0 := he i 0
    have a1 := he i 1
    have a2 := he i 2
    simp only [Fin.val_zero, Fin.val_one, Fin.val_two, add_zero] at a0 a1 a2
    unfold UV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, add_zero]
    rw [a0, a1, a2]; ring
  -- `Σ_j A_j n_j = -dn·dm·U` (from `M_J M_J⁻¹ = dn·dm·I`)
  have hsel : ∀ a, a < 3 → UV P e 0 * (if a = 0 then (P.dn : ℝ) * c.dm else 0) +
      UV P e 1 * (if a = 1 then (P.dn : ℝ) * c.dm else 0) +
      UV P e 2 * (if a = 2 then (P.dn : ℝ) * c.dm else 0) = (P.dn : ℝ) * c.dm * UV P e a := by
    intro a ha; interval_cases a <;> simp <;> ring
  have hraw : ∀ a, a < 3 →
      AV P c e 0 * nV P c 0 a + AV P c e 1 * nV P c 1 a + AV P c e 2 * nV P c 2 a
        = -((P.dn : ℝ) * c.dm) * UV P e a := by
    intro a ha
    rw [hAV 0, hAV 1, hAV 2]
    have I0 := hI a 0 ha (by norm_num)
    have I1 := hI a 1 ha (by norm_num)
    have I2 := hI a 2 ha (by norm_num)
    linear_combination (-UV P e 0) * I0 + (-UV P e 1) * I1 + (-UV P e 2) * I2 - hsel a ha
  have hn : ∀ j (i : Fin 3), NCv P (nth c.J j 0) i = nV P c j i.val / P.dn := fun _ _ => rfl
  have hv : ∀ j (i : Fin 3), Vv P (nth c.al j 0) i = vV P c j i.val / P.dv := fun _ _ => rfl
  have hN0 : ∀ i : Fin 3, N0v P i = oV P i.val / P.dn0 := fun _ => rfl
  have hC : ∀ i : Fin 3, AV P c e 0 * NCv P (nth c.J 0 0) i + AV P c e 1 * NCv P (nth c.J 1 0) i +
      AV P c e 2 * NCv P (nth c.J 2 0) i = -((c.dm : ℝ) * Nv * P.dn0) * mv R (N0v P) i := by
    intro i
    calc AV P c e 0 * NCv P (nth c.J 0 0) i + AV P c e 1 * NCv P (nth c.J 1 0) i +
          AV P c e 2 * NCv P (nth c.J 2 0) i
        = (AV P c e 0 * nV P c 0 i.val + AV P c e 1 * nV P c 1 i.val + AV P c e 2 * nV P c 2 i.val)
            / P.dn := by rw [hn, hn, hn]; ring
      _ = (-((P.dn : ℝ) * c.dm) * UV P e i.val) / P.dn := by rw [hraw i.val i.isLt]
      _ = -((c.dm : ℝ) * Nv * P.dn0) * mv R (N0v P) i := by
        rw [hUV i, mv_apply, Fin.sum_univ_three, hN0 0, hN0 1, hN0 2]
        simp only [Fin.val_zero, Fin.val_one, Fin.val_two]
        field_simp
  have hcancel : AV P c e 0 * dot (NCv P (nth c.J 0 0)) t + AV P c e 1 * dot (NCv P (nth c.J 1 0)) t +
      AV P c e 2 * dot (NCv P (nth c.J 2 0)) t = -((c.dm : ℝ) * Nv * P.dn0) * dot (mv R (N0v P)) t := by
    simp only [dot, Fin.sum_univ_three]
    linear_combination (t 0) * hC 0 + (t 1) * hC 1 + (t 2) * hC 2
  -- `B_j = N·dn·dv·X_j`
  have E0 : e 0 = Nv * R 0 0 := he 0 0
  have E1 : e 1 = Nv * R 0 1 := he 0 1
  have E2 : e 2 = Nv * R 0 2 := he 0 2
  have E3 : e 3 = Nv * R 1 0 := he 1 0
  have E4 : e 4 = Nv * R 1 1 := he 1 1
  have E5 : e 5 = Nv * R 1 2 := he 1 2
  have E6 : e 6 = Nv * R 2 0 := he 2 0
  have E7 : e 7 = Nv * R 2 1 := he 2 1
  have E8 : e 8 = Nv * R 2 2 := he 2 2
  have hX : ∀ j, BV P c e j =
      Nv * P.dn * P.dv * dot (NCv P (nth c.J j 0)) (mv R (Vv P (nth c.al j 0))) := by
    intro j
    unfold BV; rw [hr9]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, Nat.reduceDiv, Nat.reduceMod]
    rw [E0, E1, E2, E3, E4, E5, E6, E7, E8]
    simp only [dot, mv_apply, Fin.sum_univ_three, hn, hv, Fin.val_zero, Fin.val_one, Fin.val_two]
    field_simp
    ring
  -- `F = den(D0)·den(S*)·(…)`
  have hd0n : fval P.ps P.d0.num = D0r P * P.d0.den := by unfold D0r; field_simp
  have hssn : fval P.ps P.sstar.num = Ss P * P.sstar.den := by unfold Ss; field_simp
  have hFeq : FV P c e Nv = ((P.d0.den : ℝ) * P.sstar.den) *
      (c.dm * P.dn0 * P.dn * P.dv * D0r P * Nv ^ 2 -
        P.dn * P.dv * Ss P * Nv * (AV P c e 0 + AV P c e 1 + AV P c e 2) +
        (AV P c e 0 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 0 0)) (mv R (Vv P (nth c.al 0 0)))) +
         AV P c e 1 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 1 0)) (mv R (Vv P (nth c.al 1 0)))) +
         AV P c e 2 * (Nv * P.dn * P.dv * dot (NCv P (nth c.J 2 0)) (mv R (Vv P (nth c.al 2 0)))))) := by
    unfold FV sAV; rw [hr3]
    simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil]
    rw [hX 0, hX 1, hX 2, hd0n, hssn]
    push_cast
    ring
  have hF' := (mul_nonneg_iff_of_pos_left
    (by positivity : (0 : ℝ) < (P.d0.den : ℝ) * P.sstar.den)).1 (hFeq ▸ hF)
  exact dual_core (hA 0 (by norm_num)) (hA 1 (by norm_num)) (hA 2 (by norm_num)) hNv hdn hdv hdn0
    hdm' hD0 (hLP.1 _ (hJ 0 (by norm_num)) _ (hα 0 (by norm_num)))
    (hLP.1 _ (hJ 1 (by norm_num)) _ (hα 1 (by norm_num)))
    (hLP.1 _ (hJ 2 (by norm_num)) _ (hα 2 (by norm_num))) hLP.2 hcancel hF'

/-! ## Unpacking `localOk` -/

def polysOf (P : Prob) (cands : List Cand) : List (Poly × List Poly) :=
  cands.map (candPolys P (rotPoly P.ps P.nb).1 (rotPoly P.ps P.nb).2)

def HsOf (P : Prob) (polys : List (Poly × List Poly)) (i : ℕ) (sg : ℤ) : FacePolys :=
  polys.map (fun y => (faceSub i sg 1 y.1, y.2.map (fun a =>
    (fIsZero (constTerm P.nb a), faceSub i sg (if fIsZero (constTerm P.nb a) then 1 else 0) a))))

def rootL (P : Prob) : LBox := ⟨[0, -P.rden, -P.rden], [P.r0, P.rden, P.rden]⟩

def runOf (P : Prob) (polys : List (Poly × List Poly)) (x : (ℕ × ℤ) × List LTok) : LState :=
  x.2.foldl (lstep P P.rden (HsOf P polys x.1.1 x.1.2)) ⟨[rootL P], true, 0⟩

def resOf (P : Prob) (polys : List (Poly × List Poly)) (faces : List (List LTok)) : Bool × ℕ :=
  (List.zip faceList faces).foldl (fun (acc : Bool × ℕ) x =>
    (acc.1 && (runOf P polys x).ok && (runOf P polys x).stack.isEmpty,
      acc.2 + (runOf P polys x).nAcc)) (true, 0)

theorem localOk_eq (P : Prob) (cands : List Cand) (faces : List (List LTok)) :
    localOk P cands faces =
      ((cands.all (candOk P) &&
          (polysOf P cands).all (fun (x : Poly × List Poly) => fIsZero (constTerm P.nb x.1))) &&
        ((P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden) && decide (0 < P.r0)) &&
        faces.length == 6 && (resOf P (polysOf P cands) faces).1,
       (resOf P (polysOf P cands) faces).2) := rfl

theorem foldl_and2 {α : Type} (g h : α → Bool) (n : α → ℕ) :
    ∀ (l : List α) (b : Bool) (k : ℕ),
    (l.foldl (fun (acc : Bool × ℕ) x => (acc.1 && g x && h x, acc.2 + n x)) (b, k)).1 = true →
    ∀ x ∈ l, g x = true ∧ h x = true := by
  have hfalse : ∀ (l : List α) (k : ℕ),
      (l.foldl (fun (acc : Bool × ℕ) x => (acc.1 && g x && h x, acc.2 + n x)) (false, k)).1 = false := by
    intro l; induction l with
    | nil => intro k; rfl
    | cons y l ih2 => intro k; rw [List.foldl_cons]; simp only [Bool.false_and]; exact ih2 _
  intro l
  induction l with
  | nil => intro b k _; simp
  | cons a l ih =>
    intro b k hb
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
    · exact ih _ _ hb x hx

theorem localOk_unpack {P : Prob} {cands : List Cand} {faces : List (List LTok)}
    (h : (localOk P cands faces).1 = true) :
    (∀ c ∈ cands, candOk P c = true) ∧
    (∀ c ∈ cands, fIsZero (constTerm P.nb
      (FP P c (rotPoly P.ps P.nb).1 (rotPoly P.ps P.nb).2)) = true) ∧
    faces.length = 6 ∧
    ∀ x ∈ List.zip faceList faces, (runOf P (polysOf P cands) x).ok = true ∧
      (runOf P (polysOf P cands) x).stack = [] := by
  rw [localOk_eq] at h
  simp only [Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨hc, hF⟩, _⟩, hlen⟩, hres⟩ := h
  refine ⟨List.all_eq_true.1 hc, ?_, hlen, ?_⟩
  · intro c hc'
    have := List.all_eq_true.1 hF _ (List.mem_map_of_mem (f := candPolys P (rotPoly P.ps P.nb).1
      (rotPoly P.ps P.nb).2) hc')
    simpa [candPolys_eq] using this
  · intro x hx
    have := foldl_and2 (fun x => (runOf P (polysOf P cands) x).ok)
      (fun x => (runOf P (polysOf P cands) x).stack.isEmpty)
      (fun x => (runOf P (polysOf P cands) x).nAcc) _ true 0 hres x hx
    exact ⟨this.1, List.isEmpty_iff.1 this.2⟩

theorem zip_mem {α β : Type} {l1 : List α} {l2 : List β} (hlen : l1.length = l2.length) {a : α}
    (ha : a ∈ l1) : ∃ b, (a, b) ∈ List.zip l1 l2 := by
  obtain ⟨n, hn, rfl⟩ := List.getElem_of_mem ha
  have hn2 : n < l2.length := hlen ▸ hn
  refine ⟨l2[n], ?_⟩
  have hz : n < (List.zip l1 l2).length := by simp [hn, hn2]
  have : (List.zip l1 l2)[n] = (l1[n], l2[n]) := by simp
  rw [← this]; exact List.getElem_mem hz

theorem nth_map_lt {α β : Type*} (f : α → β) {l : List α} {c : ℕ} (hc : c < l.length) (d : β) :
    nth (l.map f) c d = f (l[c]'hc) := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hc)]
  simp

/-- `lbPos` passed (strict or not) ⇒ `H ≥ 0` on the box. -/
theorem lbPos_nonneg {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : PolySemG.WF P.ps H) {b : LBox} (hl : b.lo.length = 3)
    (hh : b.hi.length = 3)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true)
    {strict : Bool} (hp : lbPos P D H b strict = true) {z : Fin 3 → ℝ} (hzb : InL b z) :
    0 ≤ pEval P.ps H (fun k => z k / D) := by
  unfold lbPos at hp
  rcases hv : shiftLb3 P D H b.lo b.hi with _ | v
  · rw [hv] at hp; simp at hp
  · rw [hv] at hp
    have hv0 : 0 ≤ v := by cases strict <;> simp at hp <;> omega
    exact PolySemG.shiftLb3_nonneg hKb hb hD hH hl hh hz hv hv0 z hzb

/-! ## The local box -/

/-- **The local box `L`.** If `localOk` passes (and the constants), every feasible `(R, t, S)` with
`R` a point of chart 0 with `|u i| ≤ r0` (the right case of `far_main`) has `S ≥ S*`. -/
theorem local_main {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hD0 : 0 < D0r P) (hrden : 0 < P.rden)
    {cands : List Cand} {faces : List (List LTok)} (hloc : (localOk P cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    {R : M3} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R P.rden 0 u) (hu : ∀ i, |u i| ≤ P.r0)
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S) :
    Ss P ≤ S := by
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  set x : Fin 3 → ℝ := fun i => u i / P.rden with hxdef
  have hx : ∀ i, x i = u i / P.rden := fun i => rfl
  -- the rotation at `x`
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
  -- the face and the point
  have hxb : ∀ i, |x i| ≤ P.r0 / P.rden := by
    intro i
    rw [hx i, abs_div, abs_of_pos hden]
    exact div_le_div_of_nonneg_right (hu i) hden.le
  obtain ⟨i, sg, hmem, hi, y, hy0, hy0', hy1, hy2, hlift⟩ := face_point x hxb
  obtain ⟨hcand, hF0, hlen, hruns⟩ := localOk_unpack hloc
  obtain ⟨toks, htm⟩ := zip_mem (by rw [hlen]; rfl) hmem
  obtain ⟨hok, hst⟩ := hruns _ htm
  have hroot : InL (rootL P) (fun k => (P.rden : ℝ) * y k) := by
    have hy0'' : (P.rden : ℝ) * y 0 ≤ P.r0 := by
      rw [le_div_iff₀ hden] at hy0'; linarith
    have a1 := abs_le.1 hy1
    have a2 := abs_le.1 hy2
    intro k
    fin_cases k <;> simp [rootL, nth] <;> constructor <;> nlinarith
  obtain ⟨B, ⟨hl3, hh3, hzw, ci, hci, hG, hH⟩, hzB⟩ :=
    lrun_cover P P.rden (HsOf P (polysOf P cands) i sg) toks _ hok hst _
      ⟨rootL P, List.mem_singleton_self _, hroot⟩
  have hzy : (fun k => (fun k => (P.rden : ℝ) * y k) k / (P.rden : ℝ)) = y := by
    funext k; field_simp
  -- the candidate
  have hci' : ci < cands.length := by simpa [HsOf, polysOf] using hci
  set cd := cands[ci]'hci' with hcd
  have hcdm : cd ∈ cands := List.getElem_mem hci'
  have hHs : nth (HsOf P (polysOf P cands) i sg) ci ([], []) =
      (faceSub i sg 1 (FP P cd Rq N), (AIL P cd Rq).map (fun a =>
        (fIsZero (constTerm P.nb a), faceSub i sg (if fIsZero (constTerm P.nb a) then 1 else 0) a))) := by
    unfold HsOf
    rw [nth_map_lt _ (by simpa [polysOf] using hci')]
    simp only [polysOf, List.getElem_map, candPolys_eq]
    rfl
  rw [hHs] at hG hH
  simp only at hG hH
  have hF0' : fIsZero (constTerm P.nb (FP P cd Rq N)) = true := hF0 cd hcdm
  obtain ⟨hFev, hAev⟩ := cand_eval hwf (hcw cd hcdm) hRqW hNW x
  have hconst : ∀ p : Poly, fIsZero (constTerm P.nb p) = true →
      fval P.ps (constTerm (2 ^ P.ps.length) p) = 0 := by
    intro p hp; rw [← hwf.nb]; exact fval_of_isZero _ hp
  -- `F ≥ 0`
  have hFx : 0 ≤ pEval P.ps (FP P cd Rq N) x := by
    obtain ⟨hGw, hGv⟩ := PolySemG.faceSub1 i hi sg y hFev.1
    have hG0 := lbPos_nonneg hb hKb hrden hGw hl3 hh3 hzw hG hzB
    rw [hzy] at hG0
    rw [hconst _ hF0', hlift, sub_zero] at hGv
    rw [← hGv]
    exact mul_nonneg hy0 hG0
  -- `A_j ≥ 0`
  have hAx : ∀ a ∈ AIL P cd Rq, 0 ≤ pEval P.ps a x := by
    intro a ha
    have haw : PolySemG.WF P.ps a := by
      unfold AIL at ha
      simp only [List.mem_map, List.mem_range] at ha
      obtain ⟨j, _, rfl⟩ := ha
      exact (hAev j).1
    have hp := hH _ (List.mem_map_of_mem ha)
    simp only at hp
    by_cases hz : fIsZero (constTerm P.nb a) = true
    · rw [ite_eq_left hz] at hp
      obtain ⟨hw1, hv1⟩ := PolySemG.faceSub1 i hi sg y haw
      have h0 := lbPos_nonneg hb hKb hrden hw1 hl3 hh3 hzw hp hzB
      rw [hzy] at h0
      rw [hconst _ hz, hlift, sub_zero] at hv1
      rw [← hv1]
      exact mul_nonneg hy0 h0
    · rw [ite_eq_right hz] at hp
      obtain ⟨hw0, hv0⟩ := PolySemG.faceSub0 i hi sg y haw
      have h0 := lbPos_nonneg hb hKb hrden hw0 hl3 hh3 hzw hp hzB
      rw [hzy, hv0, hlift] at h0
      exact h0
  have hA : ∀ j < 3, 0 ≤ AV P cd e j := by
    intro j hj
    have := hAx _ (List.mem_map_of_mem (f := AIP P cd Rq) (List.mem_range.2 hj))
    rw [(hAev j).2] at this
    exact this
  have hF : 0 ≤ FV P cd e Nx := by
    rw [hFev.2, hNv] at hFx
    exact hFx
  exact cand_bound hwf hd hsd hD0 (hcand cd hcdm) (hcw cd hcdm) hNx0 he hLP hA hF

end

#assert_std_axioms PackLean.Formal.LocalG.local_main PackLean.Formal.LocalG.cand_bound
  PackLean.Formal.LocalG.lrun_cover

end PackLean.Formal.LocalG
