import PackLean.Formal.KSeg
import PackLean.D40.FarSeg

/-!
# A9 stage 7e-5: the far check of `D40` in segments (for `decide +kernel`, 2026-11-17)

The R tree of one n box and one side (`D40.nbRun`) is cut into segments with the stack of boxes
written down at each cut (`D40.wsegOk`), joined by the shared `Formal/KSeg.lean`.  `nbRun_of`
gives `(nbRun P nb side kN toks).1 = true`.  The check functions of `D40.Core` are unchanged.
The same form as `Formal/OctFarKD.lean` (D31), with the side and κ_N as extra parameters.
Only core Lean.
-/

namespace PackLean.Formal.TetintFarKD

open PackLean.D40 (Prm NBox RBox Tok WState RatI wstep nbRun nboxWf overlapsN1 rRoots wInit wsegOk)
open PackLean.Formal.KSeg

abbrev WSeg (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) :
    List RBox → List Tok → List RBox → Prop :=
  SegOk (wstep P side nb kN) WState.ok WState.stack wInit

theorem wstep_mono (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) :
    StepMono (wstep P side nb kN) WState.ok := by
  intro s t h
  unfold wstep at h
  rcases s with ⟨st, ok, a, d, l⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t <;> simp only [Bool.and_eq_true] at h
    · exact h.1
    all_goals exact h.1.1

theorem wstep_keyed (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) :
    StepKeyed (wstep P side nb kN) WState.ok WState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, a, d, l⟩
  rcases s' with ⟨st', ok', a', d', l'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [wstep]
  | cons b rest => cases t <;> simp [wstep]

theorem wInit_ok : InitOk WState.ok WState.stack wInit := fun _ => ⟨rfl, rfl⟩

theorem wseg_of {P : Prm} {side : Nat} {nb : NBox} {kN : RatI} {k0 k1 : List RBox}
    {toks : List Tok} (h : wsegOk P side nb kN k0 toks k1 = true) : WSeg P side nb kN k0 toks k1 := by
  simp only [wsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

theorem wseg_append {P : Prm} {side : Nat} {nb : NBox} {kN : RatI} {a b c : List RBox}
    {t1 t2 : List Tok} (h1 : WSeg P side nb kN a t1 b) (h2 : WSeg P side nb kN b t2 c) :
    WSeg P side nb kN a (t1 ++ t2) c :=
  SegOk.append (wstep_mono P side nb kN) (wstep_keyed P side nb kN) wInit_ok h1 h2

/-- **One n box and side from the segments.**  `hpre` is the precondition of `nbRun`. -/
theorem nbRun_of {P : Prm} {nb : NBox} {side : Nat} {kN : RatI} {toks : List Tok}
    (hpre : (nboxWf nb && decide (kN.2 > 0) && decide (side < 2) &&
      (kN.1 == 0 || !(overlapsN1 P nb))) = true)
    (hseg : WSeg P side nb kN (rRoots P.den) toks []) : (nbRun P nb side kN toks).1 = true := by
  unfold nbRun
  obtain ⟨ho, hs⟩ := hseg
  simp only
  rw [hpre]
  have ho' : (toks.foldl (wstep P side nb kN) ⟨rRoots P.den, true, 0, 0, 0⟩).ok = true := ho
  have hs' : (toks.foldl (wstep P side nb kN) ⟨rRoots P.den, true, 0, 0, 0⟩).stack = [] := hs
  simp [ho', hs']

end PackLean.Formal.TetintFarKD
