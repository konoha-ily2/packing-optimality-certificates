import PackLean.Formal.TetLocalPoly

/-!
# A9 stage 7b-5: the local check of `D28` face by face (for `decide +kernel`)

`D28.localRegionOk` runs the ten (or nine) face trees in one fold.  In the kernel that is too much for
one theorem, so it is split: `faceOk` is the check of one face (the same conjuncts as
`TetLocalPoly.stepF`), and `local_of` gives `(localRegionOk …).1 = true` from the identity, the
ranges, the list of faces and `faceOk` of every face.  The files `D28/<Ico|Cub>/K/Local.lean`
(written by `lean/tools/export_d28_kernel.py`) decide each piece with `decide +kernel`.
-/

namespace PackLean.Formal.TetLocalK

open PackLean.D28 (Prob Region LTok localRegionOk identOk localParts)
open PackLean.Formal.TetLocalPoly (stepF runOf HsOf trOkOf trOf zrOf rngOkOf faceListOf
  localRegionOk_eq)

/-- The check of one face (the conjuncts of `stepF` after the accumulator). -/
def faceOk (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int)
    (x : (Nat × Int) × List LTok) : Bool :=
  trOkOf D (trOf (zrOf P rg) x.1.1) && (HsOf P rg fs cands x.1.1 x.1.2).all Option.isSome &&
    (runOf P rg fs cands D x.1.1 x.1.2 x.2).ok && (runOf P rg fs cands D x.1.1 x.1.2 x.2).stack.isEmpty

theorem foldl_stepF_of (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int) :
    ∀ (l : List ((Nat × Int) × List LTok)) (k : Nat), l.all (faceOk P rg fs cands D) = true →
      (l.foldl (stepF P rg fs cands D) (true, k)).1 = true
  | [], _, _ => rfl
  | x :: l, k, h => by
    simp only [List.all_cons, Bool.and_eq_true] at h
    rw [List.foldl_cons]
    obtain ⟨⟨i, sg⟩, toks⟩ := x
    have e : stepF P rg fs cands D (true, k) ((i, sg), toks) =
        (faceOk P rg fs cands D ((i, sg), toks), k + (runOf P rg fs cands D i sg toks).nAcc) := rfl
    rw [e, h.1]
    exact foldl_stepF_of P rg fs cands D l _ h.2

/-- **The local check from its pieces.** -/
theorem local_of {P : Prob} {rg : Region} {fs : List Nat} {cands : List (List Nat)}
    {faces : List (List LTok)} {D : Int} {FL : List (Nat × Int)}
    (hid : identOk P (localParts P rg) fs cands = true) (hr : rngOkOf P rg = true)
    (hfl : faceListOf P rg = FL) (hlen : FL.length = faces.length)
    (hall : (List.zip FL faces).all (faceOk P rg fs cands D) = true) :
    (localRegionOk P rg fs cands faces D).1 = true := by
  rw [localRegionOk_eq, hid, hr, hfl, hlen, foldl_stepF_of P rg fs cands D _ 0 hall]
  simp

end PackLean.Formal.TetLocalK
