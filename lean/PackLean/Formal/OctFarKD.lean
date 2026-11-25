import PackLean.Formal.KSeg
import PackLean.D31.FarSeg

/-!
# A9 stage 7d-5: the far check of `D31` in segments (for `decide +kernel`, 2026-11-16)

The R tree of one n box (`D31.nbRun`) is cut into segments with the stack of boxes written down
at each cut (`D31.wsegOk`), joined by the shared `Formal/KSeg.lean`.  `nbRun_of` gives
`(nbRun P nb toks).1 = true`.  The check functions of `D31.Core` are unchanged.  Only core Lean.
-/

namespace PackLean.Formal.OctFarKD

open PackLean.D31 (Prm NBox RBox Tok WState wstep nbRun nboxWf rRoots wInit wsegOk)
open PackLean.Formal.KSeg

abbrev WSeg (P : Prm) (nb : NBox) : List RBox → List Tok → List RBox → Prop :=
  SegOk (wstep P nb) WState.ok WState.stack wInit

theorem wstep_mono (P : Prm) (nb : NBox) : StepMono (wstep P nb) WState.ok := by
  intro s t h
  unfold wstep at h
  rcases s with ⟨st, ok, a, d, l⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t <;> simp only [Bool.and_eq_true] at h
    · exact h.1
    all_goals exact h.1.1

theorem wstep_keyed (P : Prm) (nb : NBox) : StepKeyed (wstep P nb) WState.ok WState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, a, d, l⟩
  rcases s' with ⟨st', ok', a', d', l'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [wstep]
  | cons b rest => cases t <;> simp [wstep]

theorem wInit_ok : InitOk WState.ok WState.stack wInit := fun _ => ⟨rfl, rfl⟩

theorem wseg_of {P : Prm} {nb : NBox} {k0 k1 : List RBox} {toks : List Tok}
    (h : wsegOk P nb k0 toks k1 = true) : WSeg P nb k0 toks k1 := by
  simp only [wsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

theorem wseg_append {P : Prm} {nb : NBox} {a b c : List RBox} {t1 t2 : List Tok}
    (h1 : WSeg P nb a t1 b) (h2 : WSeg P nb b t2 c) : WSeg P nb a (t1 ++ t2) c :=
  SegOk.append (wstep_mono P nb) (wstep_keyed P nb) wInit_ok h1 h2

/-- **One n box from the segments.** -/
theorem nbRun_of {P : Prm} {nb : NBox} {toks : List Tok} (hw : nboxWf nb = true)
    (hseg : WSeg P nb (rRoots P.den) toks []) : (nbRun P nb toks).1 = true := by
  unfold nbRun
  obtain ⟨ho, hs⟩ := hseg
  have ho' : (toks.foldl (wstep P nb) ⟨rRoots P.den, nboxWf nb, 0, 0, 0⟩).ok = true := by
    rw [hw]; exact ho
  have hs' : (toks.foldl (wstep P nb) ⟨rRoots P.den, nboxWf nb, 0, 0, 0⟩).stack = [] := by
    rw [hw]; exact hs
  simp [ho', hs']

end PackLean.Formal.OctFarKD
