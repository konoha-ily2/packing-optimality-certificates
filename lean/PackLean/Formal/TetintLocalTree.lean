import PackLean.Formal.TetintLocalCube

/-!
# A9 stage 7e-3 (part 4): the leaf trees of the centres of `D40` (`faceRun`), `splitP`, `e0Ok`

Design: `plan/A9f_tet_design.md` §10.

* `lrun_cover`, `faceRun_spec`: a passed `faceRun` covers its root box (six coordinates, `du` units)
  by accepted leaves (`LGood`: the candidate's form, `e0Ok`, `shiftLb > 0`);
* `splitP_tube`, `splitP_point`: `P(h, r ζ̂) = e₀ + r · Λ(h, r, ζ̂)` (tube) and
  `P(r ζ̂) = e₀ + r · Λ(r, ζ̂)` (point);
* `e0Ok_tube`, `e0Ok_point`: `e₀ ≥ 0` on the base range of a leaf.
-/

namespace PackLean.Formal.TetintLocalTree

open PackLean.D40 (Prm Cen Poly Mono LBox LTok LState lstep lsplit faceRun faceList rootBox fullW
  candItems e0Ok splitP zdeg shiftLb nth mdeg psum)
open PackLean.Formal.TetintPoly
open PackLean.Formal PackLean.Formal.TetintLocalForm PackLean.Formal.TetintLocalCube

noncomputable section

/-! ## 1. The leaf tree -/

/-- The point `y` (coordinates times `du`) lies in the closed box `b` (six coordinates). -/
def InL (du : ℤ) (b : LBox) (y : ℕ → ℝ) : Prop :=
  ∀ k < 6, ((nth b.lo k 0 : ℤ) : ℝ) ≤ du * y k ∧ du * y k ≤ ((nth b.hi k 0 : ℤ) : ℝ)

/-- What an accepted leaf certifies. -/
def LGood (P : Prm) (tube : Bool) (items : List (Bool × Poly × Poly)) (b : LBox) : Prop :=
  b.lo.length = 6 ∧ b.hi.length = 6 ∧
  (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
  ∃ it ∈ items, it.1 = true ∧ e0Ok P.du tube it.2.1 b.lo b.hi = true ∧
    0 < shiftLb P.du it.2.2 b.lo b.hi

theorem lstep_ok_false (P : Prm) (tube : Bool) (full : List ℤ) (items : List (Bool × Poly × Poly))
    (s : LState) (t : LTok) (h : s.ok = false) : (lstep P tube full items s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [lstep, hst, h]

theorem foldl_ok_false (P : Prm) (tube : Bool) (full : List ℤ) (items : List (Bool × Poly × Poly)) :
    ∀ (toks : List LTok) (s : LState), s.ok = false →
      (toks.foldl (lstep P tube full items) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (lstep_ok_false P tube full items s t h)

theorem getD_set (l : List ℤ) (a k : ℕ) (m d : ℤ) :
    (l.set a m).getD k d = l.getD k d ∨ (k = a ∧ (l.set a m).getD k d = m) := by
  simp only [List.getD_eq_getElem?_getD, List.getElem?_set]
  by_cases h : a = k
  · subst h
    by_cases h2 : a < l.length
    · right; simp [h2]
    · left; simp [h2]
  · left; simp [h]

theorem lsplit_cover (du : ℤ) (full : List ℤ) (b : LBox) (y : ℕ → ℝ) (h : InL du b y) :
    InL du (lsplit full b).1 y ∨ InL du (lsplit full b).2 y := by
  unfold lsplit
  simp only
  generalize (List.range _).foldl _ 0 = ax
  generalize (nth b.lo ax 0 + nth b.hi ax 0) / 2 = mid
  rcases le_total (du * y ax) (mid : ℝ) with hz | hz
  · left
    intro k hk
    refine ⟨(h k hk).1, ?_⟩
    unfold nth
    rcases getD_set b.hi ax k mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k hk).2
    · rw [e2, e1]; exact hz
  · right
    intro k hk
    refine ⟨?_, (h k hk).2⟩
    unfold nth
    rcases getD_set b.lo ax k mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k hk).1
    · rw [e2, e1]; exact hz

/-- **Tree soundness** of one face. -/
theorem lrun_cover (P : Prm) (tube : Bool) (full : List ℤ) (items : List (Bool × Poly × Poly)) :
    ∀ (toks : List LTok) (s : LState),
      (toks.foldl (lstep P tube full items) s).ok = true →
      (toks.foldl (lstep P tube full items) s).stack = [] →
      ∀ y, (∃ B ∈ s.stack, InL P.du B y) → ∃ B, LGood P tube items B ∧ InL P.du B y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (lstep P tube full items s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P tube full items toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (lstep P tube full items s .split).stack
              = (lsplit full B).1 :: (lsplit full B).2 :: rest := by
            simp [lstep, hs]
          refine ih _ hok hst y ?_
          rw [hs']
          rcases lsplit_cover P.du full B y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | acc j =>
          simp only [lstep, hs] at hok'
          rcases hf : items[j]? with _ | it
          · simp [hf] at hok'
          · simp only [hf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hok'
            obtain ⟨_, ⟨⟨⟨h1, ⟨hw, hl1⟩, hl2⟩, he⟩, hsh⟩⟩ := hok'
            exact ⟨B, ⟨hl1, hl2, hw, it, List.mem_of_getElem? hf, h1, he, hsh⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (lstep P tube full items s t).stack := by
          intro C hC; cases t <;> simp [lstep, hs, hC]
        exact ih _ hok hst y ⟨B, hsub B hBr, hz⟩

/-- **A passed `faceRun`** covers its root box by accepted leaves. -/
theorem faceRun_spec {P : Prm} {ci fidx : ℕ} {tab : List ℕ} {toks : List LTok}
    (h : (faceRun P ci fidx tab toks).1 = true) :
    ∃ ce fi fv lo hi, P.cens[ci]? = some ce ∧ (faceList ce.tube)[fidx]? = some (fi, fv) ∧
      rootBox P ce.tube fi fv = some (lo, hi) ∧
      ∀ y, InL P.du ⟨lo, hi⟩ y → ∃ B, LGood P ce.tube (candItems P ce tab) B ∧ InL P.du B y := by
  unfold faceRun at h
  rcases hc : P.cens[ci]? with _ | ce
  · simp [hc] at h
  simp only [hc] at h
  rcases hf : (faceList ce.tube)[fidx]? with _ | ⟨fi, fv⟩
  · simp [hf] at h
  simp only [hf] at h
  rcases hr : rootBox P ce.tube fi fv with _ | ⟨lo, hi⟩
  · simp [hr] at h
  simp only [hr, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨hok, hst⟩ := h
  refine ⟨ce, fi, fv, lo, hi, rfl, hf, hr, fun y hy => ?_⟩
  exact lrun_cover P ce.tube _ _ toks _ hok hst y ⟨_, by simp, hy⟩

/-! ## 2. `splitP`: `P = e₀ + r · Λ` -/

/-- The leaf coordinates of a tube `(h, r, ζ̂₀, ζ̂₁, ζ̂₂, ζ̂₃)` and of a point `(r, ζ̂₀, …, ζ̂₄)`. -/
def y6 (a b c d e f : ℝ) : ℕ → ℝ := fun i => [a, b, c, d, e, f].getD i 0

theorem mono_tube (a b c d f : ℕ) (hz : b + c + d + f ≠ 0) (h r z0 z1 z2 z3 : ℝ) :
    mval [a, b, c, d, f] (xpt h (r * z0) (r * z1) (r * z2) (r * z3))
      = r * mval [a, b + c + d + f - 1, b, c, d, f] (y6 h r z0 z1 z2 z3) := by
  have key : r ^ b * r ^ c * r ^ d * r ^ f = r * r ^ (b + c + d + f - 1) := by
    rw [← pow_succ', Nat.sub_add_cancel (by omega)]; ring
  simp only [mval, xpt, y6, List.getD_cons_zero, List.getD_cons_succ, mul_pow]
  linear_combination (h ^ a * z0 ^ b * z1 ^ c * z2 ^ d * z3 ^ f) * key

theorem mono_point (a b c d f : ℕ) (hz : a + b + c + d + f ≠ 0) (r z0 z1 z2 z3 z4 : ℝ) :
    mval [a, b, c, d, f] (xpt (r * z0) (r * z1) (r * z2) (r * z3) (r * z4))
      = r * mval [a + b + c + d + f - 1, a, b, c, d, f] (y6 r z0 z1 z2 z3 z4) := by
  have key : r ^ a * r ^ b * r ^ c * r ^ d * r ^ f = r * r ^ (a + b + c + d + f - 1) := by
    rw [← pow_succ', Nat.sub_add_cancel (by omega)]; ring
  simp only [mval, xpt, y6, List.getD_cons_zero, List.getD_cons_succ, mul_pow]
  linear_combination (z0 ^ a * z1 ^ b * z2 ^ c * z3 ^ d * z4 ^ f) * key

theorem len5' {α : Type*} {m : List α} (h : m.length = 5) : ∃ a b c d e, m = [a, b, c, d, e] := by
  match m, h with
  | [a, b, c, d, e], _ => exact ⟨a, b, c, d, e, rfl⟩

/-- The key of a monomial in `splitP`. -/
def keyOf (tube : Bool) (m : Mono) : Mono :=
  if tube then [nth m 0 0, zdeg tube m - 1, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]
  else [zdeg tube m - 1, nth m 0 0, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]

theorem splitP_eq (tube : Bool) (p : Poly) :
    splitP tube p = (p.filter (fun x => zdeg tube x.1 == 0),
      psum ((p.filter (fun x => zdeg tube x.1 != 0)).map (fun x => [(keyOf tube x.1, x.2)]))) := rfl

theorem sum_split (X Y : ℕ → ℝ) (r : ℝ) (tube : Bool)
    (hm : ∀ m : Mono, m.length = 5 → zdeg tube m ≠ 0 → mval m X = r * mval (keyOf tube m) Y) :
    ∀ F : Poly, (∀ e ∈ F, e.1.length = 5 ∧ zdeg tube e.1 ≠ 0) →
      pv F X = r * pv (psum (F.map (fun x => [(keyOf tube x.1, x.2)]))) Y
  | [], _ => by simp [psum]
  | e :: F, hF => by
    rw [pv_psum, List.map_map]
    have ih := sum_split X Y r tube hm F (fun e' he' => hF e' (List.mem_cons_of_mem _ he'))
    rw [pv_psum, List.map_map] at ih
    simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons, pv_nil, add_zero]
    rw [ih, hm e.1 (hF e (by simp)).1 (hF e (by simp)).2]
    ring

/-- **`splitP` on a tube**: at `(h, r ζ̂)`, `P = e₀ + r · Λ(h, r, ζ̂)`. -/
theorem splitP_tube {p : Poly} (hp : WF 5 p) (h r z0 z1 z2 z3 : ℝ) :
    pv p (xpt h (r * z0) (r * z1) (r * z2) (r * z3))
      = pv (splitP true p).1 (xpt h (r * z0) (r * z1) (r * z2) (r * z3))
        + r * pv (splitP true p).2 (y6 h r z0 z1 z2 z3) := by
  rw [splitP_eq, pv_filter _ p (fun x => zdeg true x.1 == 0) (fun x => zdeg true x.1 != 0)
    (fun e => by simp [bne])]
  congr 1
  refine sum_split _ _ r true (fun m hm hz => ?_) _ (fun e he => ?_)
  · obtain ⟨a, b, c, d, f, rfl⟩ := len5' hm
    simp only [zdeg, if_true, nth, List.getD_cons_zero, List.getD_cons_succ] at hz
    simp only [keyOf, zdeg, if_true, nth, List.getD_cons_zero, List.getD_cons_succ]
    exact mono_tube a b c d f hz h r z0 z1 z2 z3
  · rw [List.mem_filter] at he
    exact ⟨hp e he.1, by simpa [bne] using he.2⟩

/-- **`splitP` on a point**: at `r ζ̂`, `P = e₀ + r · Λ(r, ζ̂)`. -/
theorem splitP_point {p : Poly} (hp : WF 5 p) (r z0 z1 z2 z3 z4 : ℝ) :
    pv p (xpt (r * z0) (r * z1) (r * z2) (r * z3) (r * z4))
      = pv (splitP false p).1 (xpt (r * z0) (r * z1) (r * z2) (r * z3) (r * z4))
        + r * pv (splitP false p).2 (y6 r z0 z1 z2 z3 z4) := by
  rw [splitP_eq, pv_filter _ p (fun x => zdeg false x.1 == 0) (fun x => zdeg false x.1 != 0)
    (fun e => by simp [bne])]
  congr 1
  refine sum_split _ _ r false (fun m hm hz => ?_) _ (fun e he => ?_)
  · obtain ⟨a, b, c, d, f, rfl⟩ := len5' hm
    have hd : mdeg [a, b, c, d, f] = a + b + c + d + f := by simp [mdeg_eq]; ring
    simp only [zdeg, Bool.false_eq_true, if_false, hd] at hz
    simp only [keyOf, zdeg, Bool.false_eq_true, if_false, hd, nth, List.getD_cons_zero,
      List.getD_cons_succ]
    exact mono_point a b c d f hz r z0 z1 z2 z3 z4
  · rw [List.mem_filter] at he
    exact ⟨hp e he.1, by simpa [bne] using he.2⟩

/-! ## 3. `e0Ok` -/

theorem foldl_coef (l : Poly) (acc : ℤ) :
    l.foldl (fun a x => a + x.2) acc = acc + (l.map (·.2)).sum := by
  induction l generalizing acc with
  | nil => simp
  | cons e l ih => simp only [List.foldl_cons, ih, List.map_cons, List.sum_cons]; ring

theorem pv_lin (x0 k p1 p2 p3 : ℝ) : ∀ F : Poly,
    (∀ e ∈ F, (∃ a, e.1 = [a, 0, 0, 0, 0]) ∧ nth e.1 0 0 ≤ 1) →
    pv F (xpt x0 k p1 p2 p3)
      = (((F.filter (fun x => nth x.1 0 0 == 0)).map (·.2)).sum : ℤ)
        + (((F.filter (fun x => nth x.1 0 0 == 1)).map (·.2)).sum : ℤ) * x0
  | [], _ => by simp
  | e :: F, hF => by
    obtain ⟨⟨a, ha⟩, ha1⟩ := hF e (by simp)
    have ih' := pv_lin x0 k p1 p2 p3 F fun e' he' => hF e' (List.mem_cons_of_mem _ he')
    rw [ha] at ha1
    simp only [nth, List.getD_cons_zero] at ha1
    simp only [pv_cons, ih', List.filter_cons, ha, nth, List.getD_cons_zero]
    interval_cases a
    · simp [mval, xpt]; ring
    · simp [mval, xpt]; ring

/-- **`e0Ok` on a tube**: `e₀(h) ≥ 0` for `lo₀ ≤ du · h ≤ hi₀`. -/
theorem e0Ok_tube {du : ℤ} (hdu : 0 < du) {p : Poly} (hp : WF 5 p) {lo hi : List ℤ}
    (h : e0Ok du true (splitP true p).1 lo hi = true) {x0 : ℝ}
    (h1 : ((nth lo 0 0 : ℤ) : ℝ) ≤ du * x0) (h2 : du * x0 ≤ ((nth hi 0 0 : ℤ) : ℝ))
    (k p1 p2 p3 : ℝ) : 0 ≤ pv (splitP true p).1 (xpt x0 k p1 p2 p3) := by
  set E := (splitP true p).1 with hE
  have hEm : ∀ e ∈ E, ∃ a, e.1 = [a, 0, 0, 0, 0] := by
    intro e he
    rw [hE, splitP_eq, List.mem_filter] at he
    obtain ⟨a, b, c, d, f, hm⟩ := len5' (hp e he.1)
    have hz := he.2
    rw [hm] at hz
    have h4 : b = 0 ∧ c = 0 ∧ d = 0 ∧ f = 0 := by simp [zdeg, nth] at hz; omega
    obtain ⟨rfl, rfl, rfl, rfl⟩ := h4
    exact ⟨a, hm⟩
  simp only [e0Ok, if_true, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨hall, hA⟩, hB⟩ := h
  rw [pv_lin x0 k p1 p2 p3 E fun e he => ⟨hEm e he, hall e he⟩]
  simp only [foldl_coef, zero_add] at hA hB
  set c0 : ℤ := ((E.filter (fun x => nth x.1 0 0 == 0)).map (·.2)).sum
  set c1 : ℤ := ((E.filter (fun x => nth x.1 0 0 == 1)).map (·.2)).sum
  have hdu' : (0 : ℝ) < du := by exact_mod_cast hdu
  have hA' : (0 : ℝ) ≤ c0 * du + c1 * (nth lo 0 0 : ℤ) := by exact_mod_cast hA
  have hB' : (0 : ℝ) ≤ c0 * du + c1 * (nth hi 0 0 : ℤ) := by exact_mod_cast hB
  have : 0 ≤ (du : ℝ) * ((c0 : ℝ) + c1 * x0) := by
    rcases le_total 0 (c1 : ℝ) with hc | hc <;> nlinarith
  by_contra hneg
  push_neg at hneg
  nlinarith

/-- **`e0Ok` on a point**: `e₀ ≥ 0` (a constant). -/
theorem e0Ok_point {du : ℤ} {p : Poly} {lo hi : List ℤ}
    (h : e0Ok du false (splitP false p).1 lo hi = true) (X : ℕ → ℝ) :
    0 ≤ pv (splitP false p).1 X := by
  set E := (splitP false p).1
  simp only [e0Ok, Bool.false_eq_true, if_false, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨hall, hs⟩ := h
  have hval : ∀ F : Poly, (∀ e ∈ F, e.1.all (· == 0) = true) →
      pv F X = ((F.map (·.2)).sum : ℤ) := by
    intro F hF
    induction F with
    | nil => simp
    | cons e F ih =>
      simp only [pv_cons, ih fun e' he' => hF e' (List.mem_cons_of_mem _ he'), List.map_cons,
        List.sum_cons, mval_one e.1 X (hF e (by simp))]
      push_cast; ring
  rw [hval E fun e he => List.all_eq_true.1 hall e he]
  rw [foldl_coef, zero_add] at hs
  exact_mod_cast hs

end

end PackLean.Formal.TetintLocalTree
