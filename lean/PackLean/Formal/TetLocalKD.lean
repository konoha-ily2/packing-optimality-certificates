import PackLean.Formal.TetLocalK
import PackLean.Formal.KSeg
import PackLean.D28.LocalSeg

/-!
# A9 stage 7b-5: the local check of `D28` from data (for `decide +kernel`, 2026-11-16)

`TetLocalK.faceOk` (one face) is still too heavy for one kernel theorem (16 GB for a face of the
icosahedron case).  Here it is taken apart, the check functions of `D28.Core` unchanged:

* the polynomials `G_c = candPQ (localParts P rg) fs c` of the candidates are written down as data
  `Gs` (`cands.map (candPQ …) = Gs` is one small theorem per region);
* the identity at the center, `identOk`, is read off the table (`identOkG`);
* the box tree of a face is cut into segments with the stack of boxes written down at each cut
  (`D28.lsegOk`, joined by the shared `Formal/KSeg.lean`); the `H` of a face is computed from the
  table (`D28.hsOfG`).

`face_of` gives `faceOk` from these pieces and `ident_of` gives `identOk`.
-/

namespace PackLean.Formal.TetLocalKD

open PackLean.D28 (Prob Region LTok LBox LState lstep PQ Poly faceH candPQ localParts identOk
  hsOfG hsOkG identOkG lInit lsegOk fIsZero constTerm)
open PackLean.Formal.TetLocalPoly (runOf HsOf trOkOf trOf zrOf sclOf rootOf)
open PackLean.Formal.TetLocalK (faceOk)
open PackLean.Formal.KSeg

/-- The segment of a face tree, in the shared form. -/
abbrev LSeg (P : Prob) (D : Int) (Hs : List Poly) : List LBox → List LTok → List LBox → Prop :=
  SegOk (lstep P D Hs) LState.ok LState.stack lInit

theorem lstep_mono (P : Prob) (D : Int) (Hs : List Poly) : StepMono (lstep P D Hs) LState.ok := by
  intro s t h
  unfold lstep at h
  rcases s with ⟨st, ok, n⟩
  cases st with
  | nil => simp at h
  | cons b rest =>
    cases t with
    | split => simp only [Bool.and_eq_true] at h; exact h.1
    | acc c => simp only [Bool.and_eq_true] at h; exact h.1.1.1

theorem lstep_keyed (P : Prob) (D : Int) (Hs : List Poly) :
    StepKeyed (lstep P D Hs) LState.ok LState.stack := by
  intro s s' t h h' he
  rcases s with ⟨st, ok, n⟩
  rcases s' with ⟨st', ok', n'⟩
  simp only at h h' he
  subst he h h'
  cases st with
  | nil => simp [lstep]
  | cons b rest => cases t <;> simp [lstep]

theorem lInit_ok : InitOk LState.ok LState.stack lInit := fun _ => ⟨rfl, rfl⟩

theorem lseg_of {P : Prob} {D : Int} {Hs : List Poly} {k0 k1 : List LBox} {toks : List LTok}
    (h : lsegOk P D Hs k0 toks k1 = true) : LSeg P D Hs k0 toks k1 := by
  simp only [lsegOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

/-- Joining segments of a face tree. -/
theorem lseg_append {P : Prob} {D : Int} {Hs : List Poly} {a b c : List LBox} {t1 t2 : List LTok}
    (h1 : LSeg P D Hs a t1 b) (h2 : LSeg P D Hs b t2 c) : LSeg P D Hs a (t1 ++ t2) c :=
  SegOk.append (lstep_mono P D Hs) (lstep_keyed P D Hs) lInit_ok h1 h2

theorem hsOf_eq {P : Prob} {rg : Region} {fs : List Nat} {cands : List (List Nat)} {Gs : List PQ}
    {scl : List (Int × Nat)} (hG : cands.map (candPQ (localParts P rg) fs) = Gs)
    (hs : sclOf P rg = scl) (i : Nat) (sg : Int) :
    HsOf P rg fs cands i sg = Gs.map (fun G => faceH scl i sg G.p) := by
  rw [← hG, ← hs, List.map_map]; rfl

/-- **One face from the data.** -/
theorem face_of {P : Prob} {rg : Region} {fs : List Nat} {cands : List (List Nat)} {D : Int}
    {Gs : List PQ} {scl : List (Int × Nat)} {i : Nat} {sg : Int} {toks : List LTok} {root : LBox}
    (hG : cands.map (candPQ (localParts P rg) fs) = Gs) (hs : sclOf P rg = scl)
    (htr : trOkOf D (trOf (zrOf P rg) i) = true) (hr : rootOf D (trOf (zrOf P rg) i) = root)
    (hh : hsOkG scl i sg Gs = true) (hseg : LSeg P D (hsOfG scl i sg Gs) [root] toks []) :
    faceOk P rg fs cands D ((i, sg), toks) = true := by
  have e1 : (HsOf P rg fs cands i sg).all Option.isSome = true := by
    rw [hsOf_eq hG hs, List.all_map]; exact hh
  have e2 : (HsOf P rg fs cands i sg).map (fun h => h.getD []) = hsOfG scl i sg Gs := by
    rw [hsOf_eq hG hs, List.map_map]; rfl
  have e3 : runOf P rg fs cands D i sg toks = toks.foldl (lstep P D (hsOfG scl i sg Gs)) (lInit [root]) := by
    unfold runOf; rw [e2, hr]; rfl
  unfold faceOk
  simp only at e3 ⊢
  rw [htr, e1, e3, hseg.1, hseg.2]
  rfl

/-- **The identity at the center from the data.** -/
theorem ident_of {P : Prob} {rg : Region} {fs : List Nat} {cands : List (List Nat)} {Gs : List PQ}
    (hG : cands.map (candPQ (localParts P rg) fs) = Gs) (h : identOkG P.nb Gs = true) :
    identOk P (localParts P rg) fs cands = true := by
  unfold identOk; rw [← hG, identOkG, List.all_map] at h; exact h

end PackLean.Formal.TetLocalKD
