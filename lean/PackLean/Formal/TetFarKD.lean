import PackLean.Formal.KSeg
import PackLean.D28.FarSeg

/-!
# A9 stage 7b-5 (2): the far check of `D28` in segments (for `decide +kernel`, 2026-11-16)

The R tree of one n box (`D28.rtreeRun`) is cut into segments with the stack of boxes written
down at each cut (`D28.wsegOk`), joined by the shared `Formal/KSeg.lean`.  `rtree_of` gives
`(rtreeRun P nb toks).ok = true` and `pairOk_of` gives `pairOk P p = true`.
The check functions of `D28.Core` are unchanged.  Only core Lean (same form as `OctFarKD`).
-/

namespace PackLean.Formal.TetFarKD

open PackLean.D28 (Prob NBox RBox Tok WState wstep rtreeRun nboxWf nInsideL rRoots wInit wsegOk
  Pair pairOk pairRuns mirror)
open PackLean.Formal.KSeg

abbrev WSeg (P : Prob) (nb : NBox) (inL : Bool) : List RBox → List Tok → List RBox → Prop :=
  SegOk (wstep P nb inL) WState.ok WState.stack wInit

theorem wstep_mono (P : Prob) (nb : NBox) (inL : Bool) : StepMono (wstep P nb inL) WState.ok := by
  intro s t h
  unfold wstep at h
  rcases s with ⟨st, ok, a, d, l⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t <;> simp only [Bool.and_eq_true] at h
    · exact h.1.1
    all_goals exact h.1.1

theorem wstep_keyed (P : Prob) (nb : NBox) (inL : Bool) :
    StepKeyed (wstep P nb inL) WState.ok WState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, a, d, l⟩
  rcases s' with ⟨st', ok', a', d', l'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [wstep]
  | cons b rest => cases t <;> simp [wstep]

theorem wInit_ok : InitOk WState.ok WState.stack wInit := fun _ => ⟨rfl, rfl⟩

theorem wseg_of {P : Prob} {nb : NBox} {inL : Bool} {k0 k1 : List RBox} {toks : List Tok}
    (h : wsegOk P nb inL k0 toks k1 = true) : WSeg P nb inL k0 toks k1 := by
  simp only [wsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

theorem wseg_append {P : Prob} {nb : NBox} {inL : Bool} {a b c : List RBox} {t1 t2 : List Tok}
    (h1 : WSeg P nb inL a t1 b) (h2 : WSeg P nb inL b t2 c) : WSeg P nb inL a (t1 ++ t2) c :=
  SegOk.append (wstep_mono P nb inL) (wstep_keyed P nb inL) wInit_ok h1 h2

/-- **One n box from the segments.** -/
theorem rtree_of {P : Prob} {nb : NBox} {toks : List Tok} (hw : nboxWf nb = true)
    (hseg : WSeg P nb (nInsideL P nb) (rRoots P.rden) toks []) : (rtreeRun P nb toks).ok = true := by
  unfold rtreeRun
  obtain ⟨ho, hs⟩ := hseg
  have ho' : (toks.foldl (wstep P nb (nInsideL P nb)) ⟨rRoots P.rden, nboxWf nb, 0, 0, 0⟩).ok = true := by
    rw [hw]; exact ho
  have hs' : (toks.foldl (wstep P nb (nInsideL P nb)) ⟨rRoots P.rden, nboxWf nb, 0, 0, 0⟩).stack = [] := by
    rw [hw]; exact hs
  simp [ho', hs']

/-- **One pair from its two runs.** -/
theorem pairOk_of {P : Prob} {p : Pair}
    (hk : (decide (0 < p.kmDen) && decide (p.nb.knum * p.kmDen + p.kmNum * p.nb.kden = 0)) = true)
    (hN : (rtreeRun P p.nb p.toksN).ok = true)
    (hM : (rtreeRun P (mirror p.nb p.kmNum p.kmDen) p.toksM).ok = true) : pairOk P p = true := by
  unfold pairOk pairRuns
  simp only [Bool.and_eq_true] at hk ⊢
  exact ⟨⟨hk, hN⟩, hM⟩

end PackLean.Formal.TetFarKD
