import Mathlib

/-!
# A9m: the box-tree induction once, with the step rule as a parameter

The checkers walk a list of tokens over a stack of boxes: the top box is either **split** (its
children go on the stack) or taken off as a **leaf** (a test on the box must pass).  Six files
(`CoverTree`, `CoverTreeG`, `Sandwich`, `TetCover`, `LocalG`, `TetLocalPoly`) prove the same
induction for their own step function (`run_cover`, `lrun_cover`).  This file proves it once.

The parameters (all generic):

* `step : σ → τ → σ` (state, token), `stack : σ → List β` (the boxes on the stack);
* `Alive : σ → Prop`: "the run has not failed" (`ok = true`; with a counter that must stay `0`,
  `ok = true ∧ nL = 0`).  It must go backwards: `Alive (step s t) → Alive s` (`alive_of_ok`);
* `In : β → π → Prop`: the point `z` lies in the box (fold a box invariant into it:
  `fun b z => Inv b ∧ InBox b z`);
* `Q : σ → π → Prop`: what a point gets; for leaves `∃ B, Good B ∧ In B z` (`run_cover`).

The one-step rule (`StepOk`): when the stack is `b :: rest` and the step is alive, `rest` stays on
the stack and every point of `b` either gets `Q` (a leaf) or lies in a box of the new stack (a
split).  `StepSpec` is the common special case (leaf: stack `rest` and `Good b`; split: stack
`kids ++ rest` and the kids cover `b`).

Also generic: the split of a list box `lo, hi` at one axis (`set_cover`), the kernel-segment
lemmas of `KernelSeg`/`KernelSegW` (`seg`, `listEq_of`, `allSeg_trans`), and the monomial value in
`n` variables (`monoN_zipWith`, the one lemma of `PolySem5` that uses `5`).  Uses:
`BoxTreeDemo.lean` (the old theorems again from these).
-/

namespace PackLean.Formal.BoxTree

/-! ## 1. The induction -/

section Run

variable {σ τ β π : Type*} (step : σ → τ → σ) (stack : σ → List β) (Alive : σ → Prop)
  (In : β → π → Prop)

/-- Alive at the end of a run ⇒ alive at its start. -/
theorem alive_foldl (hA : ∀ s t, Alive (step s t) → Alive s) :
    ∀ (toks : List τ) (s : σ), Alive (toks.foldl step s) → Alive s := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact hA s t (ih _ h)

/-- For `Alive s := ok s = true`: a failed run stays failed. -/
theorem alive_of_ok (ok : σ → Bool) (h : ∀ s t, ok s = false → ok (step s t) = false) :
    ∀ s t, ok (step s t) = true → ok s = true := by
  intro s t hs
  by_contra hc
  rw [Bool.not_eq_true] at hc
  rw [h s t hc] at hs
  exact Bool.false_ne_true hs

/-- **The one-step rule.** The top box `b` is replaced: `rest` stays, and every point of `b` gets
`Q s` or lies in a box of the new stack. -/
def StepOk (Q : σ → π → Prop) : Prop :=
  ∀ s t b rest, stack s = b :: rest → Alive (step s t) →
    (∀ C ∈ rest, C ∈ stack (step s t)) ∧
    ∀ z, In b z → Q s z ∨ ∃ c ∈ stack (step s t), In c z

/-- **Tree soundness, general form.** `Q` may depend on the state, if it goes backwards along a
step (`hQ`; e.g. a list of boxes that is used up). -/
theorem run_coverQ (Q : σ → π → Prop) (hA : ∀ s t, Alive (step s t) → Alive s)
    (hQ : ∀ s t z, Q (step s t) z → Q s z) (hS : StepOk step stack Alive In Q) :
    ∀ (toks : List τ) (s : σ), Alive (toks.foldl step s) → stack (toks.foldl step s) = [] →
      ∀ z, (∃ B ∈ stack s, In B z) → Q s z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have ha := alive_foldl step Alive hA toks _ hok
    rcases hs : stack s with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      obtain ⟨hsub, hcov⟩ := hS s t b rest hs ha
      rcases List.mem_cons.1 hB with rfl | hBr
      · rcases hcov z hz with hq | ⟨c, hc, hcz⟩
        · exact hq
        · exact hQ s t z (ih _ hok hst z ⟨c, hc, hcz⟩)
      · exact hQ s t z (ih _ hok hst z ⟨B, hsub B hBr, hz⟩)

/-- **The common step rule.** Leaf: the stack becomes `rest` and `b` is good.  Split: the stack
becomes `kids ++ rest` and the kids cover `b`. -/
def StepSpec (Good : β → Prop) : Prop :=
  ∀ s t b rest, stack s = b :: rest → Alive (step s t) →
    (stack (step s t) = rest ∧ Good b) ∨
    (∃ kids, stack (step s t) = kids ++ rest ∧ ∀ z, In b z → ∃ c ∈ kids, In c z)

theorem stepOk_of_spec (Good : β → Prop) (h : StepSpec step stack Alive In Good) :
    StepOk step stack Alive In (fun _ z => ∃ B, Good B ∧ In B z) := by
  intro s t b rest hs ha
  rcases h s t b rest hs ha with ⟨e, hg⟩ | ⟨kids, e, hk⟩
  · exact ⟨fun C hC => e ▸ hC, fun z hz => Or.inl ⟨b, hg, hz⟩⟩
  · refine ⟨fun C hC => by rw [e]; exact List.mem_append_right _ hC, fun z hz => Or.inr ?_⟩
    obtain ⟨c, hc, hcz⟩ := hk z hz
    exact ⟨c, by rw [e]; exact List.mem_append_left _ hc, hcz⟩

/-- **Tree soundness.** If the run from `s` stays alive and ends with an empty stack, every point
of a box on the stack of `s` lies in a good leaf. -/
theorem run_cover (Good : β → Prop) (hA : ∀ s t, Alive (step s t) → Alive s)
    (hS : StepSpec step stack Alive In Good) :
    ∀ (toks : List τ) (s : σ), Alive (toks.foldl step s) → stack (toks.foldl step s) = [] →
      ∀ z, (∃ B ∈ stack s, In B z) → ∃ B, Good B ∧ In B z :=
  run_coverQ step stack Alive In _ hA (fun _ _ _ h => h) (stepOk_of_spec step stack Alive In Good hS)

end Run

/-- The leaf case of `StepSpec`, for a proof by cases on the token (`L` is the new stack). -/
theorem spec_leaf {β π : Type*} {In : β → π → Prop} {Good : β → Prop} {L rest : List β} {b : β}
    (e : L = rest) (hg : Good b) :
    (L = rest ∧ Good b) ∨ (∃ kids, L = kids ++ rest ∧ ∀ z, In b z → ∃ c ∈ kids, In c z) :=
  Or.inl ⟨e, hg⟩

/-- The split case of `StepSpec` with two children. -/
theorem spec_split2 {β π : Type*} {In : β → π → Prop} {Good : β → Prop} {L rest : List β}
    {b c1 c2 : β} (e : L = c1 :: c2 :: rest) (hc : ∀ z, In b z → In c1 z ∨ In c2 z) :
    (L = rest ∧ Good b) ∨ (∃ kids, L = kids ++ rest ∧ ∀ z, In b z → ∃ c ∈ kids, In c z) := by
  refine Or.inr ⟨[c1, c2], e, fun z hz => ?_⟩
  rcases hc z hz with h | h
  · exact ⟨c1, by simp, h⟩
  · exact ⟨c2, by simp, h⟩

/-! ## 2. Splitting a box at one axis -/

section Split

/-- The point `z` lies in the box `[lo, hi]` given as lists (missing entries read as `0`). -/
def InList (n : ℕ) (lo hi : List ℤ) (z : Fin n → ℝ) : Prop :=
  ∀ k : Fin n, ((lo.getD k.val 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((hi.getD k.val 0 : ℤ) : ℝ)

theorem getD_set (l : List ℤ) (a k : ℕ) (m d : ℤ) :
    (l.set a m).getD k d = l.getD k d ∨ (k = a ∧ (l.set a m).getD k d = m) := by
  simp only [List.getD_eq_getElem?_getD, List.getElem?_set]
  by_cases h : a = k
  · subst h
    by_cases h2 : a < l.length
    · right; simp [h2]
    · left; simp [h2]
  · left; simp [h]

/-- **Split at axis `ax`, value `mid`**: the lower half `hi[ax] := mid` or the upper half
`lo[ax] := mid`.  Any `ax`, any `mid` (outside `0 ≤ ax < n` the lower half is the whole box). -/
theorem set_cover {n : ℕ} {lo hi : List ℤ} {z : Fin n → ℝ} (ax : ℕ) (mid : ℤ)
    (h : InList n lo hi z) :
    InList n lo (hi.set ax mid) z ∨ InList n (lo.set ax mid) hi z := by
  have low : (∀ k : Fin n, k.val = ax → z k ≤ mid) → InList n lo (hi.set ax mid) z := by
    intro hm k
    refine ⟨(h k).1, ?_⟩
    rcases getD_set hi ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).2
    · rw [e2]; exact hm k e1
  have up : (∀ k : Fin n, k.val = ax → (mid : ℝ) ≤ z k) → InList n (lo.set ax mid) hi z := by
    intro hm k
    refine ⟨?_, (h k).2⟩
    rcases getD_set lo ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).1
    · rw [e2]; exact hm k e1
  by_cases hax : ax < n
  · rcases le_total (z ⟨ax, hax⟩) (mid : ℝ) with hz | hz
    · left; refine low fun k hk => ?_
      have : k = ⟨ax, hax⟩ := Fin.ext hk
      rw [this]; exact hz
    · right; refine up fun k hk => ?_
      have : k = ⟨ax, hax⟩ := Fin.ext hk
      rw [this]; exact hz
  · left; exact low fun k hk => absurd (hk ▸ k.isLt) hax

/-- The two halves of one interval. -/
theorem interval_split {l h x m : ℝ} (hl : l ≤ x) (hh : x ≤ h) :
    (l ≤ x ∧ x ≤ m) ∨ (m ≤ x ∧ x ≤ h) := by
  rcases le_total x m with hx | hx
  · exact Or.inl ⟨hl, hx⟩
  · exact Or.inr ⟨hx, hh⟩

end Split

/-! ## 3. Kernel segments (`KernelSeg`, `KernelSegW` for any step) -/

section Seg

variable {σ τ : Type*} (f : σ → τ → σ)

/-- From the state `s`, run the tokens `i, …, j - 1`. -/
def runSeg (toks : List τ) (s : σ) (i j : ℕ) : σ := ((toks.drop i).take (j - i)).foldl f s

/-- **Join one segment.** With a Bool comparison `eq` that implies `=`, the segment theorem
`eq (runSeg f toks s i j) t = true` (checked by `decide +kernel`) moves the run from `i` to `j`. -/
theorem seg {eq : σ → σ → Bool} (heq : ∀ a b, eq a b = true → a = b) {toks : List τ} {s t : σ}
    {i j : ℕ} (hij : i ≤ j) (h : eq (runSeg f toks s i j) t = true) :
    (toks.drop i).foldl f s = (toks.drop j).foldl f t := by
  rw [← heq _ _ h, runSeg, ← List.foldl_append]
  have e : toks.drop j = (toks.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

theorem seg_fin {toks : List τ} {s : σ} {j : ℕ} (h : toks.length ≤ j) :
    (toks.drop j).foldl f s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

/-- Lists are equal if they have the same length and are equal entry by entry (by `e`). -/
theorem listEq_of {α : Type*} {e : α → α → Bool} (he : ∀ a b, e a b = true → a = b) :
    ∀ {l₁ l₂ : List α}, l₁.length = l₂.length →
      (l₁.zip l₂).all (fun p => e p.1 p.2) = true → l₁ = l₂
  | [], [], _, _ => rfl
  | [], _ :: _, h, _ => by simp at h
  | _ :: _, [], h, _ => by simp at h
  | a :: as, b :: bs, h, hz => by
    simp only [List.zip_cons_cons, List.all_cons, Bool.and_eq_true] at hz
    simp only [List.length_cons, Nat.add_right_cancel_iff] at h
    rw [he _ _ hz.1, listEq_of he h hz.2]

/-- `List.all` on the entries `i, …, j - 1`. -/
def allSeg {α : Type*} (p : α → Bool) (l : List α) (i j : ℕ) : Bool := ((l.drop i).take (j - i)).all p

theorem allSeg_trans {α : Type*} {p : α → Bool} {l : List α} {i j : ℕ} (hij : i ≤ j)
    (h : allSeg p l i j = true) (h2 : (l.drop j).all p = true) : (l.drop i).all p = true := by
  have e : l.drop j = (l.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e] at h2
  unfold allSeg at h
  rw [← List.take_append_drop (j - i) (l.drop i), List.all_append, h, h2]; rfl

theorem all_fin {α : Type*} {p : α → Bool} {l : List α} {j : ℕ} (h : l.length ≤ j) :
    (l.drop j).all p = true := by
  rw [List.drop_eq_nil_of_le h]; rfl

end Seg

/-! ## 4. Monomials in `n` variables (the step of `PolySem5` that used `5`) -/

/- A9n (11/17 2026, passed): the rest of `PolySem5` in `n` variables (`monoN_zero`, `monoN_incAt`,
`getD_memN`, `shift_termN`, `shiftLbN_spec` with the step as a parameter) is in `PolySemN.lean`. -/

section Mono

/-- The value of a monomial (exponents `m`, missing ones `0`) at `x : Fin n → ℝ`. -/
noncomputable def monoN (n : ℕ) (m : List ℕ) (x : Fin n → ℝ) : ℝ := ∏ i : Fin n, x i ^ (m.getD i 0)

theorem getD_zipWith_add : ∀ (m m' : List ℕ), m.length = m'.length → ∀ i : ℕ,
    (List.zipWith (· + ·) m m').getD i 0 = m.getD i 0 + m'.getD i 0
  | [], [], _, i => by simp
  | [], _ :: _, h, _ => by simp at h
  | _ :: _, [], h, _ => by simp at h
  | a :: as, b :: bs, _, 0 => by simp
  | a :: as, b :: bs, h, i + 1 => by
    simp only [List.zipWith_cons_cons, List.getD_cons_succ]
    exact getD_zipWith_add as bs (by simpa using h) i

/-- The product of monomials is the sum of the exponents (any `n`, equal lengths). -/
theorem monoN_zipWith {n : ℕ} {m m' : List ℕ} (h : m.length = m'.length) (x : Fin n → ℝ) :
    monoN n (List.zipWith (· + ·) m m') x = monoN n m x * monoN n m' x := by
  simp only [monoN, getD_zipWith_add m m' h, pow_add, Finset.prod_mul_distrib]

end Mono

end PackLean.Formal.BoxTree
