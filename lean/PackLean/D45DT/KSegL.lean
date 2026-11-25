import PackLean.D45DT.CoreL
import PackLean.Formal.KSeg

/-! E3g3 (2026-11-18): parts for checking the local lemma of D45DT (`tubeRunL`) in the kernel only, cut into
segments (`Formal/KSeg.lean`).  No Mathlib; `CoreL.lean`, `Core.lean` and `Formal/KSeg.lean` are unchanged.

* `tubeRunLS`: `tubeRunL` with the split candidate polynomials `sp` as an argument (`tubeRunL_eq`, by `rfl`),
  so that `sp` can be replaced by data checked once per tube (`splitE0 (candPoly (locParts P t) cd)`).
* the step `lchar` of a root face fits `Formal/KSeg.lean`: flag `ok`, key = (stack, nAcc, pend)
  (`lStepMono`, `lStepKeyed`, `lInitOk`).  Segments are joined by `seg_append`; `faceRunL_of` gives the value of
  a face; `tubeRunLS_eight` collects the eight faces.
-/

namespace PackLean.D45DT.KL
open PackLean.D28
open PackLean.D45DT
open PackLean.Formal.KSeg

deriving instance DecidableEq for PackLean.D45DT.LB

/-- `DecidableEq (Option _)` of the split candidates is not found by instance search (only `Decidable (a = b)`
  is), so lists of them get it here -/
instance instDecEqSp : DecidableEq (Option (FE × FE × Poly)) := fun a b => inferInstanceAs (Decidable (a = b))

/-- `tubeRunL` with the split candidates as an argument -/
def tubeRunLS (P : Prm) (t : Tube) (cands : List (List Nat)) (D : Int) (faces : List (List Char))
    (sp : List (Option (FE × FE × Poly))) : Bool × List Nat :=
  let spOk := sp.all Option.isSome && cands.all (fun cd => cd.length == 4 && cd.all (· < P.verts.length))
  let cs := sp.map (fun o => o.getD (fz, fz, []))
  match toD D t.ulo, toD D t.uhi, toD D t.r0 with
  | some ulo, some uhi, some r0 =>
    let U : List Int := [uhi - ulo, r0, 2 * D, 2 * D, 2 * D, 2 * D]
    let roots := lroots D ulo uhi r0
    let ctx : LCtx := ⟨D, U, cs⟩
    let res := (List.zip roots faces).map (fun (x : LB × List Char) => faceRunL P ctx x.1 x.2)
    (spOk && decide (ulo < uhi) && decide (0 < r0) && faces.length == 8 && res.all (·.1), res.map (·.2))
  | _, _, _ => (false, [])

theorem tubeRunL_eq (P : Prm) (t : Tube) (cands : List (List Nat)) (D : Int) (faces : List (List Char)) :
    tubeRunL P t cands D faces =
      tubeRunLS P t cands D faces (cands.map (fun cd => splitE0 (candPoly (locParts P t) cd))) := rfl

/-! ## segments -/

abbrev LKey := List LB × Nat × Bool

def lOk (s : LS) : Bool := s.ok
def lKey (s : LS) : LKey := (s.stack, s.nAcc, s.pend)
def lInit (k : LKey) : LS := ⟨k.1, true, k.2.1, k.2.2⟩

theorem lStepMono (P : Prm) (c : LCtx) : StepMono (lchar P c) lOk := by
  intro s t h
  unfold lOk lchar lleaf at *
  split at h
  · split at h
    · simp at h
    · split at h
      · simp at h
      · simp only [Bool.and_eq_true] at h
        exact h.1.1.1.1.1
  · split at h
    · split at h
      · simp at h
      · split at h
        · simp at h
        · exact h
    · split at h
      · exact h
      · simp at h

theorem lStepKeyed (P : Prm) (c : LCtx) : StepKeyed (lchar P c) lOk lKey := by
  intro s s' t h h' hk
  cases s; cases s'
  simp only [lOk, lKey, Prod.mk.injEq] at h h' hk
  obtain ⟨h1, h2, h3⟩ := hk
  subst h h' h1 h2 h3
  exact ⟨rfl, rfl⟩

theorem lInitOk : InitOk lOk lKey lInit := fun _ => ⟨rfl, rfl⟩

/-- the check of a segment (the decidable form of `SegOk`) -/
def segChk (P : Prm) (c : LCtx) (k : LKey) (ts : List Char) (k' : LKey) : Bool :=
  let s := ts.foldl (lchar P c) (lInit k)
  s.ok && decide (lKey s = k')

theorem segOk_of {P : Prm} {c : LCtx} {k : LKey} {ts : List Char} {k' : LKey}
    (h : segChk P c k ts k' = true) : SegOk (lchar P c) lOk lKey lInit k ts k' := by
  unfold segChk at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

theorem seg_append {P : Prm} {c : LCtx} {a b d : LKey} {t1 t2 : List Char}
    (h1 : SegOk (lchar P c) lOk lKey lInit a t1 b) (h2 : SegOk (lchar P c) lOk lKey lInit b t2 d) :
    SegOk (lchar P c) lOk lKey lInit a (t1 ++ t2) d :=
  SegOk.append (lStepMono P c) (lStepKeyed P c) lInitOk h1 h2

theorem faceRunL_of {P : Prm} {c : LCtx} {root : LB} {ts : List Char} {n : Nat}
    (h : SegOk (lchar P c) lOk lKey lInit ([root], 0, false) ts ([], n, false)) :
    faceRunL P c root ts = (true, n) := by
  obtain ⟨h1, h2⟩ := h
  unfold faceRunL
  simp only [lInit] at h1 h2
  unfold lOk at h1
  unfold lKey at h2
  simp only [Prod.mk.injEq] at h2
  obtain ⟨e1, e2, e3⟩ := h2
  simp [h1, e1, e2, e3]

/-- the eight root faces of a tube -/
theorem tubeRunLS_eight {P : Prm} {t : Tube} {cands : List (List Nat)} {D : Int}
    {sp : List (Option (FE × FE × Poly))} {ulo uhi r0 : Int} {c : LCtx}
    {b0 b1 b2 b3 b4 b5 b6 b7 : LB} {f0 f1 f2 f3 f4 f5 f6 f7 : List Char}
    {a0 a1 a2 a3 a4 a5 a6 a7 : Nat}
    (hu0 : toD D t.ulo = some ulo) (hu1 : toD D t.uhi = some uhi) (hr : toD D t.r0 = some r0)
    (hc : c = ⟨D, [uhi - ulo, r0, 2 * D, 2 * D, 2 * D, 2 * D], sp.map (fun o => o.getD (fz, fz, []))⟩)
    (hh : (sp.all Option.isSome && cands.all (fun cd => cd.length == 4 && cd.all (· < P.verts.length)) &&
      decide (ulo < uhi) && decide (0 < r0)) = true)
    (hroots : lroots D ulo uhi r0 = [b0, b1, b2, b3, b4, b5, b6, b7])
    (h0 : faceRunL P c b0 f0 = (true, a0)) (h1 : faceRunL P c b1 f1 = (true, a1))
    (h2 : faceRunL P c b2 f2 = (true, a2)) (h3 : faceRunL P c b3 f3 = (true, a3))
    (h4 : faceRunL P c b4 f4 = (true, a4)) (h5 : faceRunL P c b5 f5 = (true, a5))
    (h6 : faceRunL P c b6 f6 = (true, a6)) (h7 : faceRunL P c b7 f7 = (true, a7)) :
    tubeRunLS P t cands D [f0, f1, f2, f3, f4, f5, f6, f7] sp = (true, [a0, a1, a2, a3, a4, a5, a6, a7]) := by
  subst hc
  unfold tubeRunLS
  rw [hu0, hu1, hr]
  simp only [hroots, List.zip, List.zipWith, List.map, h0, h1, h2, h3, h4, h5, h6, h7]
  simp only [List.all_cons, List.all_nil, List.length_cons, List.length_nil]
  simp only [Bool.and_eq_true] at hh
  simp [hh]

end PackLean.D45DT.KL
