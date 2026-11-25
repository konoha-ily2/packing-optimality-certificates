import PackLean.Formal.KSeg
import PackLean.D31.LocalSeg

/-!
# A9 stage 7d-5: the local check of `D31` from data (for `decide +kernel`, 2026-11-16)

One face of the local check (`D31.faceRun`) is too heavy for one kernel theorem when its tree has
hundreds of leaves (11 GB for 215 leaves).  Here it is taken apart, the check functions of
`D31.Core` unchanged:

* the face data `faceData P kd fi fv` (the candidates substituted into the face) is written down as
  data `FD` and `faceData P kd fi fv = FD` is one theorem per face (used for both sides);
* the box tree of a face is cut into segments with the stack of boxes written down at each cut
  (`D31.lsegOk`, joined by the shared `Formal/KSeg.lean`).

`faceRun_of` gives `(faceRun P kd fidx side toks).1 = true` from these pieces.  Only core Lean.
-/

namespace PackLean.Formal.OctLocalKD

open PackLean.D31 (Prm Kind LTok LBox LState lstep FaceData faceData faceRun faceList rootBox nth
  lInit lsegOk)
open PackLean.Formal.KSeg

/-- The segment of a face tree, in the shared form. -/
abbrev LSeg (P : Prm) (kd : Kind) (full : List Int) (FD : FaceData) :
    List LBox → List LTok → List LBox → Prop :=
  SegOk (lstep P kd full FD) LState.ok LState.stack lInit

theorem lstep_mono (P : Prm) (kd : Kind) (full : List Int) (FD : FaceData) :
    StepMono (lstep P kd full FD) LState.ok := by
  intro s t h
  unfold lstep at h
  rcases s with ⟨st, ok, n⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t with
    | split => exact h
    | acc c => simp only [Bool.and_eq_true] at h; exact h.1

theorem lstep_keyed (P : Prm) (kd : Kind) (full : List Int) (FD : FaceData) :
    StepKeyed (lstep P kd full FD) LState.ok LState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, n⟩
  rcases s' with ⟨st', ok', n'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [lstep]
  | cons b rest => cases t <;> simp [lstep]

theorem lInit_ok : InitOk LState.ok LState.stack lInit := fun _ => ⟨rfl, rfl⟩

theorem lseg_of {P : Prm} {kd : Kind} {full : List Int} {FD : FaceData} {k0 k1 : List LBox}
    {toks : List LTok} (h : lsegOk P kd full FD k0 toks k1 = true) : LSeg P kd full FD k0 toks k1 := by
  simp only [lsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

/-- Joining segments of a face tree. -/
theorem lseg_append {P : Prm} {kd : Kind} {full : List Int} {FD : FaceData} {a b c : List LBox}
    {t1 t2 : List LTok} (h1 : LSeg P kd full FD a t1 b) (h2 : LSeg P kd full FD b t2 c) :
    LSeg P kd full FD a (t1 ++ t2) c :=
  SegOk.append (lstep_mono P kd full FD) (lstep_keyed P kd full FD) lInit_ok h1 h2

/-- **One face and side from the data.** -/
theorem faceRun_of {P : Prm} {kd : Kind} {fidx side : Nat} {fi : Nat} {fv : Int}
    {lo hi : List Int} {FD : FaceData} {toks : List LTok}
    (h1 : (faceList kd)[fidx]? = some (fi, fv))
    (h2 : rootBox P kd (nth (faceList kd) fidx (0, 1)).1 side = some (lo, hi))
    (h3 : faceData P kd fi fv = FD) (h4 : FD.identOk = true) (h5 : side < 2)
    (hseg : LSeg P kd (List.zipWith (fun l h => h - l) lo hi) FD [⟨lo, hi⟩] toks []) :
    (faceRun P kd fidx side toks).1 = true := by
  unfold faceRun
  rw [h1, h2]
  simp only
  rw [h3]
  obtain ⟨ho, hs⟩ := hseg
  have ho' : (toks.foldl (lstep P kd (List.zipWith (fun l h => h - l) lo hi) FD)
      ⟨[⟨lo, hi⟩], true, 0⟩).ok = true := ho
  have hs' : (toks.foldl (lstep P kd (List.zipWith (fun l h => h - l) lo hi) FD)
      ⟨[⟨lo, hi⟩], true, 0⟩).stack = [] := hs
  rw [ho', hs', h4]
  simp [h5]

end PackLean.Formal.OctLocalKD
