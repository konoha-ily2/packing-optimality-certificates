import Mathlib
import PackLean.D16.Core
import PackLean.Formal.QuadSem

/-!
# D45 stage 4d: the box tree of the far checker `D16.farRun` covers the four chart cubes

`D16.farRun P toks` walks a list of tokens (`split`, `L`, `D m`, `A mu ts`) over a stack of boxes,
starting with the four roots `rRoots P.rden` (chart `ch < 4`, the cube `[-rden, rden]³`).  If the run
ends with `ok` and an empty stack, every point `(ch, y)` with `ch < 4` and `|y i| ≤ rden` lies in a
well-formed leaf box of chart `ch` that passed `leafOk` for an `L`, `D m` or `A mu ts` token.

A point of a box is `y : Fin 3 → ℝ` with `bLo b i ≤ y i ≤ bHi b i` (QuadSem's `bLo`, `bHi`), in units
of `rden`, together with the chart `b.ch`.
-/

namespace PackLean.Formal.CoverTreeG

open PackLean.D28 (RBox rboxWf split3)
open PackLean.D16 (Prob Tok leafOk WState wstep rRoots farRun acceptOk discLb insideL Term)
open PackLean.Formal.QuadSem (bLo bHi)

/-- The point `(ch, y)` lies in the closed box `b`. -/
def InBox (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) : Prop :=
  b.ch = ch ∧ ∀ i, (bLo b i : ℝ) ≤ y i ∧ y i ≤ bHi b i

/-- What a leaf certifies: the box is well formed and passed one of the three leaf tests. -/
def Good (P : Prob) (b : RBox) : Prop :=
  rboxWf b = true ∧
    (insideL P b = true ∨
     (∃ m, m < P.pairs.length ∧ discLb P b m > 0) ∨
     (∃ mu ts, acceptOk P b mu ts = true))

theorem wstep_ok_false (P : Prob) (s : WState) (t : Tok) (h : s.ok = false) :
    (wstep P s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstep, hst, h]

theorem foldl_ok_false (P : Prob) :
    ∀ (toks : List Tok) (s : WState), s.ok = false → (toks.foldl (wstep P) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstep_ok_false P s t h)

theorem split3_ch (b : RBox) : (split3 b).1.ch = b.ch ∧ (split3 b).2.ch = b.ch := by
  simp only [split3]; split_ifs <;> exact ⟨rfl, rfl⟩

theorem split3_cover (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) (h : InBox b ch y) :
    InBox (split3 b).1 ch y ∨ InBox (split3 b).2 ch y := by
  obtain ⟨hc, hy⟩ := h
  have h0 := hy 0; have h1 := hy 1; have h2 := hy 2
  simp only [bLo, bHi, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
    Matrix.head_cons, Matrix.tail_cons] at h0 h1 h2
  have key : ∀ (b' : RBox), b'.ch = ch → (b'.l0 : ℝ) ≤ y 0 → y 0 ≤ b'.h0 → (b'.l1 : ℝ) ≤ y 1 →
      y 1 ≤ b'.h1 → (b'.l2 : ℝ) ≤ y 2 → y 2 ≤ b'.h2 → InBox b' ch y := by
    intro b' hc' a1 a2 a3 a4 a5 a6
    refine ⟨hc', fun i => ?_⟩
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> assumption
  simp only [split3]
  split_ifs
  · rcases le_total (y 0) (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 hz h1.1 h1.2 h2.1 h2.2
    · right; exact key _ hc hz h0.2 h1.1 h1.2 h2.1 h2.2
  · rcases le_total (y 1) (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 hz h2.1 h2.2
    · right; exact key _ hc h0.1 h0.2 hz h1.2 h2.1 h2.2
  · rcases le_total (y 2) (((b.l2 + b.h2) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 h1.2 h2.1 hz
    · right; exact key _ hc h0.1 h0.2 h1.1 h1.2 hz h2.2

/-- A leaf token that passed gives a good box. -/
theorem leaf_good (P : Prob) (b : RBox) (t : Tok) (ht : t ≠ .split)
    (hw : rboxWf b = true) (hl : leafOk P b t = true) : Good P b := by
  refine ⟨hw, ?_⟩
  cases t with
  | split => exact absurd rfl ht
  | L => exact Or.inl hl
  | D m =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inl ⟨m, hl.1, hl.2⟩)
  | A mu ts => exact Or.inr (Or.inr ⟨mu, ts, hl⟩)

/-- **Tree soundness.** If the run from state `s` ends with `ok` and an empty stack, every point of a
box on the stack of `s` lies in a good leaf. -/
theorem run_cover (P : Prob) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstep P) s).ok = true →
      (toks.foldl (wstep P) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, Good P B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstep P s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstep P s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstep, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          have : (wstep P s .L).ok = (s.ok && rboxWf B && leafOk P B .L) := by simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P B .L (by simp) hok'.1.2 hok'.2, hz⟩
        | D m =>
          have : (wstep P s (.D m)).ok = (s.ok && rboxWf B && leafOk P B (.D m)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P B (.D m) (by simp) hok'.1.2 hok'.2, hz⟩
        | A mu ts =>
          have : (wstep P s (.A mu ts)).ok = (s.ok && rboxWf B && leafOk P B (.A mu ts)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P B (.A mu ts) (by simp) hok'.1.2 hok'.2, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstep P s t).stack := by
          intro C hC; cases t <;> simp [wstep, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The four chart cubes.** If `farRun` passes, every point `(ch, y)` with `ch < 4` and
`|y i| ≤ rden` lies in a good leaf box of chart `ch`. -/
theorem farRun_cover (P : Prob) (toks : List Tok) (h : (farRun P toks).1 = true)
    (ch : ℕ) (hch : ch < 4) (y : Fin 3 → ℝ) (hy : ∀ i, |y i| ≤ (P.rden : ℝ)) :
    ∃ B, Good P B ∧ InBox B ch y := by
  simp only [farRun, Bool.and_eq_true, List.isEmpty_iff] at h
  refine run_cover P toks _ h.1 h.2 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden, P.rden⟩,
    ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

end PackLean.Formal.CoverTreeG

#assert_std_axioms PackLean.Formal.CoverTreeG.farRun_cover
