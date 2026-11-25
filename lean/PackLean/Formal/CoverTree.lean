import Mathlib
import PackLean.D16.CoverCore

/-!
# D45 stage 2b: the box tree of the far checker of `cubinoct_n02` covers its root

`D16C.farRun` walks a list of tokens over a stack of boxes (`split`, `out`, `L`, `A …`).  If it ends
with `ok` and an empty stack, every point of the root box lies in a leaf box that was accepted
(`A`: `farAccept`), lies in the local box (`L`: `insideL`), or misses the domain (`out`: `outsideD`).
Coordinates are in units of `den` (a point is `z : Fin 3 → ℝ`, components `(b, γ, τ)·den`).
-/

namespace PackLean.Formal.CoverTree

open PackLean.D28 PackLean.D16C

/-- The closed box `[l, h]` (in units of `den`). -/
def inBox (b : RBox) (z : Fin 3 → ℝ) : Prop :=
  (b.l0 : ℝ) ≤ z 0 ∧ z 0 ≤ b.h0 ∧ (b.l1 : ℝ) ≤ z 1 ∧ z 1 ≤ b.h1 ∧ (b.l2 : ℝ) ≤ z 2 ∧ z 2 ≤ b.h2

/-- What a leaf certifies. -/
def Good (P : CProb) (b : RBox) : Prop :=
  (rboxWf b = true ∧ ∃ lam mu eps, farAccept P b lam mu eps = true) ∨
  (rboxWf b = true ∧ insideL P b = true) ∨ outsideD P b = true

theorem cstep_ok_false (P : CProb) (s : CState) (t : CTok) (h : s.ok = false) :
    (cstep P s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [cstep, hst, h]

theorem foldl_ok_false (P : CProb) :
    ∀ (toks : List CTok) (s : CState), s.ok = false → (toks.foldl (cstep P) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (cstep_ok_false P s t h)

theorem split3_cover (b : RBox) (z : Fin 3 → ℝ) (h : inBox b z) :
    inBox (split3 b).1 z ∨ inBox (split3 b).2 z := by
  obtain ⟨a1, a2, a3, a4, a5, a6⟩ := h
  simp only [split3]
  split_ifs
  · rcases le_total (z 0) (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, hz, a3, a4, a5, a6⟩
    · right; exact ⟨hz, a2, a3, a4, a5, a6⟩
  · rcases le_total (z 1) (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, a2, a3, hz, a5, a6⟩
    · right; exact ⟨a1, a2, hz, a4, a5, a6⟩
  · rcases le_total (z 2) (((b.l2 + b.h2) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, a2, a3, a4, a5, hz⟩
    · right; exact ⟨a1, a2, a3, a4, hz, a6⟩

/-- Boxes stay ordered and nonnegative. -/
def Inv (b : RBox) : Prop :=
  0 ≤ b.l0 ∧ b.l0 ≤ b.h0 ∧ 0 ≤ b.l1 ∧ b.l1 ≤ b.h1 ∧ 0 ≤ b.l2 ∧ b.l2 ≤ b.h2

theorem split3_inv (b : RBox) (h : Inv b) : Inv (split3 b).1 ∧ Inv (split3 b).2 := by
  obtain ⟨a1, a2, a3, a4, a5, a6⟩ := h
  simp only [split3]
  split_ifs <;> refine ⟨⟨?_, ?_, ?_, ?_, ?_, ?_⟩, ⟨?_, ?_, ?_, ?_, ?_, ?_⟩⟩ <;> dsimp only <;> omega

/-- **Tree soundness.** If the run from state `s` ends with `ok` and an empty stack, every point of a
box on the stack of `s` lies in a good leaf. -/
theorem run_cover (P : CProb) :
    ∀ (toks : List CTok) (s : CState), (toks.foldl (cstep P) s).ok = true →
      (toks.foldl (cstep P) s).stack = [] →
      (∀ B ∈ s.stack, Inv B) →
      ∀ z, (∃ B ∈ s.stack, inBox B z) → ∃ B, Good P B ∧ inBox B z ∧ Inv B := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst _ z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst hinv z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (cstep P s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB hinv
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (cstep P s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [cstep, hs]
          have hi := split3_inv B (hinv B (by simp))
          refine ih _ hok hst ?_ z ?_
          · rw [hs']
            intro C hC
            simp only [List.mem_cons] at hC
            rcases hC with rfl | rfl | hC
            · exact hi.1
            · exact hi.2
            · exact hinv C (by simp [hC])
          rw [hs']
          rcases split3_cover B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | out =>
          have : (cstep P s .out).ok = (s.ok && outsideD P B) := by simp [cstep, hs]
          rw [this, Bool.and_eq_true] at hok'
          exact ⟨B, Or.inr (Or.inr hok'.2), hz, hinv B (by simp)⟩
        | L =>
          have : (cstep P s .L).ok = (s.ok && rboxWf B && insideL P B) := by simp [cstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, Or.inr (Or.inl ⟨hok'.1.2, hok'.2⟩), hz, hinv B (by simp)⟩
        | A lam mu eps =>
          have : (cstep P s (.A lam mu eps)).ok = (s.ok && rboxWf B && farAccept P B lam mu eps) := by
            simp [cstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, Or.inl ⟨hok'.1.2, lam, mu, eps, hok'.2⟩, hz, hinv B (by simp)⟩
      · have hsub : ∀ C ∈ rest, C ∈ (cstep P s t).stack := by
          intro C hC; cases t <;> simp [cstep, hs, hC]
        refine ih _ hok hst ?_ z ⟨B, hsub B hBr, hz⟩
        intro C hC
        have hrest : ∀ C ∈ rest, Inv C := fun C hC => hinv C (by simp [hC])
        cases t with
        | split =>
          have hi := split3_inv b (hinv b (by simp))
          simp only [cstep, hs, List.mem_cons] at hC
          rcases hC with rfl | rfl | hC
          · exact hi.1
          · exact hi.2
          · exact hrest C hC
        | _ => simp only [cstep, hs] at hC; exact hrest C hC

/-- The root box of `farRun P tlo thi`. -/
def root (P : CProb) (tlo thi : ℤ) : RBox := ⟨0, 0, 0, tlo, P.den / 2, P.den / 2, thi⟩

theorem farRun_cover (P : CProb) (tlo thi : ℤ) (toks : List CTok)
    (h : (farRun P tlo thi toks).1 = true) (hr : Inv (root P tlo thi)) (z : Fin 3 → ℝ)
    (hz : inBox (root P tlo thi) z) :
    ∃ B, Good P B ∧ inBox B z ∧ Inv B := by
  simp only [farRun, Bool.and_eq_true, List.isEmpty_iff] at h
  refine run_cover P toks _ h.1 h.2 ?_ z ⟨root P tlo thi, by simp [root], hz⟩
  intro C hC; simp only [List.mem_singleton] at hC; subst hC; exact hr

/-- **The whole far region.** If `farAll` passes, every point with `0 ≤ b, γ ≤ den/2` and
`0 ≤ τ ≤ den` (units of `den`) lies in a good leaf. -/
theorem farAll_cover (P : CProb) (toks0 toks1 : List CTok)
    (h : (farAll P toks0 toks1).1 = true) (z : Fin 3 → ℝ)
    (h0 : 0 ≤ z 0 ∧ z 0 ≤ ((P.den / 2 : ℤ) : ℝ)) (h1 : 0 ≤ z 1 ∧ z 1 ≤ ((P.den / 2 : ℤ) : ℝ))
    (h2 : 0 ≤ z 2 ∧ z 2 ≤ (P.den : ℝ)) (hden : 0 ≤ P.den) :
    ∃ B, Good P B ∧ inBox B z ∧ Inv B := by
  simp only [farAll, Bool.and_eq_true] at h
  obtain ⟨⟨⟨hr0, hr1⟩, _⟩, _⟩ := h
  rcases le_total (z 2) ((P.den / 2 : ℤ) : ℝ) with hz | hz
  · refine farRun_cover P 0 (P.den / 2) toks0 hr0 (by simp only [Inv, root]; omega) z ?_
    simp only [inBox, root, Int.cast_zero]
    exact ⟨h0.1, h0.2, h1.1, h1.2, h2.1, hz⟩
  · refine farRun_cover P (P.den / 2) P.den toks1 hr1
      (by simp only [Inv, root]; omega) z ?_
    simp only [inBox, root, Int.cast_zero]
    exact ⟨h0.1, h0.2, h1.1, h1.2, hz, h2.2⟩

end PackLean.Formal.CoverTree
