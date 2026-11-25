import PackLean.Formal.KSeg
import PackLean.D40.LocalSeg

/-!
# A9 stage 7e-5: the local check of `D40` from data (for `decide +kernel`, 2026-11-17)

One face of the local check (`D40.faceRun`) is too heavy for one kernel theorem when its tree has
hundreds of leaves.  Here it is taken apart, the check functions of `D40.Core` unchanged:

* the candidate table `candItems P ce tab` of a centre (the candidates substituted into the local
  polynomial, split into e₀ and Λ) is written down as data `IT`, and `candItems P ce tab = IT` is one
  theorem per centre (used for all its faces);
* the box tree of a face is cut into segments with the stack of boxes written down at each cut
  (`D40.lsegOk`, joined by the shared `Formal/KSeg.lean`).

`faceRun_of` gives `(faceRun P ci fidx tab toks).1 = true` from these pieces.  The same form as
`Formal/OctLocalKD.lean` (D31).  Only core Lean.
-/

namespace PackLean.Formal.TetintLocalKD

open PackLean.D40 (Prm Cen Poly LTok LBox LState lstep candItems faceRun faceList rootBox fullW
  lInit lsegOk)
open PackLean.Formal.KSeg

/-- The segment of a face tree, in the shared form. -/
abbrev LSeg (P : Prm) (tube : Bool) (full : List Int) (IT : List (Bool × Poly × Poly)) :
    List LBox → List LTok → List LBox → Prop :=
  SegOk (lstep P tube full IT) LState.ok LState.stack lInit

theorem lstep_mono (P : Prm) (tube : Bool) (full : List Int) (IT : List (Bool × Poly × Poly)) :
    StepMono (lstep P tube full IT) LState.ok := by
  intro s t h
  unfold lstep at h
  rcases s with ⟨st, ok, n⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t with
    | split => exact h
    | acc c => simp only [Bool.and_eq_true] at h; exact h.1

theorem lstep_keyed (P : Prm) (tube : Bool) (full : List Int) (IT : List (Bool × Poly × Poly)) :
    StepKeyed (lstep P tube full IT) LState.ok LState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, n⟩
  rcases s' with ⟨st', ok', n'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [lstep]
  | cons b rest => cases t <;> simp [lstep]

theorem lInit_ok : InitOk LState.ok LState.stack lInit := fun _ => ⟨rfl, rfl⟩

theorem lseg_of {P : Prm} {tube : Bool} {full : List Int} {IT : List (Bool × Poly × Poly)}
    {k0 k1 : List LBox} {toks : List LTok} (h : lsegOk P tube full IT k0 toks k1 = true) :
    LSeg P tube full IT k0 toks k1 := by
  simp only [lsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

/-- Joining segments of a face tree. -/
theorem lseg_append {P : Prm} {tube : Bool} {full : List Int} {IT : List (Bool × Poly × Poly)}
    {a b c : List LBox} {t1 t2 : List LTok} (h1 : LSeg P tube full IT a t1 b)
    (h2 : LSeg P tube full IT b t2 c) : LSeg P tube full IT a (t1 ++ t2) c :=
  SegOk.append (lstep_mono P tube full IT) (lstep_keyed P tube full IT) lInit_ok h1 h2

/-- **One face from the data.** -/
theorem faceRun_of {P : Prm} {ci fidx : Nat} {ce : Cen} {fi : Nat} {fv : Int}
    {lo hi : List Int} {tab : List Nat} {IT : List (Bool × Poly × Poly)} {toks : List LTok}
    (h1 : P.cens[ci]? = some ce)
    (h2 : (faceList ce.tube)[fidx]? = some (fi, fv))
    (h3 : rootBox P ce.tube fi fv = some (lo, hi))
    (h4 : candItems P ce tab = IT)
    (hseg : LSeg P ce.tube (fullW P ce.tube) IT [⟨lo, hi⟩] toks []) :
    (faceRun P ci fidx tab toks).1 = true := by
  unfold faceRun
  rw [h1]
  simp only
  rw [h2]
  simp only
  rw [h3]
  simp only
  rw [h4]
  obtain ⟨ho, hs⟩ := hseg
  have ho' : (toks.foldl (lstep P ce.tube (fullW P ce.tube) IT) ⟨[⟨lo, hi⟩], true, 0⟩).ok = true := ho
  have hs' : (toks.foldl (lstep P ce.tube (fullW P ce.tube) IT)
      ⟨[⟨lo, hi⟩], true, 0⟩).stack = [] := hs
  simp [ho', hs']

end PackLean.Formal.TetintLocalKD
