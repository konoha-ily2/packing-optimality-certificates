-- E3c（11/15）：D16.Core の局所の確かめ `localOk` を、面ごと（さらに面の中の区間ごと）の `decide +kernel` に分けるための
-- 補題（手で書いたもの）。`localOk_eq` は定義を開いただけの等式（P などは変数のまま、`rfl`）。どれも標準の公理だけ。
import PackLean.D16.KernelSegW

namespace PackLean.D16.KLoc
open PackLean.D28 PackLean.D16

/-- 面 (i, sg) の候補ごとの (G, [(R* で 0 か, H_j)])（localOk の中の Hs と同じ式）。 -/
def facePolys (P : Prob) (cands : List Cand) (i : Nat) (sg : Int) : FacePolys :=
  let k := P.nb
  let RN := rotPoly P.ps k
  let polys := cands.map (candPolys P RN.1 RN.2)
  polys.map (fun (y : Poly × List Poly) =>
    (faceSub i sg 1 y.1, y.2.map (fun a =>
      let z := fIsZero (constTerm k a)
      (z, faceSub i sg (if z then 1 else 0) a))))

/-- 候補の形と 0 次の恒等式 F(0) = 0（localOk の中の ident と同じ式）。 -/
def identOk (P : Prob) (cands : List Cand) : Bool :=
  let k := P.nb
  let RN := rotPoly P.ps k
  let polys := cands.map (candPolys P RN.1 RN.2)
  cands.all (candOk P) && polys.all (fun (x : Poly × List Poly) => fIsZero (constTerm k x.1))

/-- 面の木の始めの状態。 -/
def lInit (P : Prob) : LState := ⟨[⟨[0, -P.rden, -P.rden], [P.r0, P.rden, P.rden]⟩], true, 0⟩

/-- 面 (i, sg) の木 toks を状態 s から進める。 -/
def faceFold (P : Prob) (cands : List Cand) (i : Nat) (sg : Int) (toks : List LTok) (s : LState) : LState :=
  toks.foldl (lstep P P.rden (facePolys P cands i sg)) s

/-- 面ごとの結果のまとめ（localOk の中の foldl の 1 歩）。 -/
def acc1 (a : Bool × Nat) (s : LState) : Bool × Nat := (a.1 && s.ok && s.stack.isEmpty, a.2 + s.nAcc)

/-- localOk を、ident と 6 面それぞれの木に分けた形（定義を開いただけ）。 -/
theorem localOk_eq (P : Prob) (cands : List Cand) (t0 t1 t2 t3 t4 t5 : List LTok) :
    localOk P cands [t0, t1, t2, t3, t4, t5] =
      (identOk P cands && ((P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden) && decide (0 < P.r0)) && true &&
        (acc1 (acc1 (acc1 (acc1 (acc1 (acc1 (true, 0)
          (faceFold P cands 0 1 t0 (lInit P))) (faceFold P cands 0 (-1) t1 (lInit P)))
          (faceFold P cands 1 1 t2 (lInit P))) (faceFold P cands 1 (-1) t3 (lInit P)))
          (faceFold P cands 2 1 t4 (lInit P))) (faceFold P cands 2 (-1) t5 (lInit P))).1,
       (acc1 (acc1 (acc1 (acc1 (acc1 (acc1 (true, 0)
          (faceFold P cands 0 1 t0 (lInit P))) (faceFold P cands 0 (-1) t1 (lInit P)))
          (faceFold P cands 1 1 t2 (lInit P))) (faceFold P cands 1 (-1) t3 (lInit P)))
          (faceFold P cands 2 1 t4 (lInit P))) (faceFold P cands 2 (-1) t5 (lInit P))).2) := rfl

/-! ## 面の中の区間 -/

def lboxEq (a b : LBox) : Bool := a.lo == b.lo && a.hi == b.hi

def lstEq (a b : LState) : Bool :=
  a.ok == b.ok && a.nAcc == b.nAcc &&
  a.stack.length == b.stack.length && (a.stack.zip b.stack).all (fun p => lboxEq p.1 p.2)

theorem lboxEq_eq {a b : LBox} (h : lboxEq a b = true) : a = b := by
  cases a; cases b
  simp only [lboxEq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨h1, h2⟩ := h
  subst h1 h2; rfl

theorem llistEq : ∀ {l₁ l₂ : List LBox}, l₁.length = l₂.length →
    (l₁.zip l₂).all (fun p => lboxEq p.1 p.2) = true → l₁ = l₂
  | [], [], _, _ => rfl
  | [], _ :: _, h, _ => by simp at h
  | _ :: _, [], h, _ => by simp at h
  | a :: as, b :: bs, h, hz => by
    simp only [List.zip_cons_cons, List.all_cons, Bool.and_eq_true] at hz
    simp only [List.length_cons, Nat.add_right_cancel_iff] at h
    rw [lboxEq_eq hz.1, llistEq h hz.2]

theorem lstEq_eq {a b : LState} (h : lstEq a b = true) : a = b := by
  cases a; cases b
  simp only [lstEq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := h
  rw [llistEq h3 h4]; subst h1 h2; rfl

/-- 面 (i, sg) の木の i 歩目から j 歩目の手前までを状態 s から進める。 -/
def lrun (P : Prob) (cands : List Cand) (i : Nat) (sg : Int) (toks : List LTok) (s : LState) (a b : Nat) : LState :=
  faceFold P cands i sg ((toks.drop a).take (b - a)) s

theorem lseg {P : Prob} {cands : List Cand} {i : Nat} {sg : Int} {toks : List LTok} {s t : LState} {a b : Nat}
    (hab : a ≤ b) (h : lstEq (lrun P cands i sg toks s a b) t = true) :
    faceFold P cands i sg (toks.drop a) s = faceFold P cands i sg (toks.drop b) t := by
  rw [← lstEq_eq h, lrun, faceFold, faceFold, faceFold, ← List.foldl_append]
  have e : toks.drop b = (toks.drop a).drop (b - a) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

theorem lfin {P : Prob} {cands : List Cand} {i : Nat} {sg : Int} {toks : List LTok} {s : LState} {b : Nat}
    (h : toks.length ≤ b) : faceFold P cands i sg (toks.drop b) s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

end PackLean.D16.KLoc
