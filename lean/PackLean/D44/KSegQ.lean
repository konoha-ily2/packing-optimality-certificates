import PackLean.D44.Core
import PackLean.Formal.KSeg

/-! E3g2（2026-11-17）：D44 の `localQ` を面ごと・区間ごとに分けてカーネルに確かめさせるための部品（Mathlib なし）。

1 定理で局所の全部（dodindod、葉 68）を `decide +kernel` にかけると、24 分で 9 GB に達した（止めた）。そこで

* `localQS`：`localQ` と同じ値を、候補の多項式 `polys` を引数にし、面ごとの `faceRun` の畳み込みで書いたもの
  （`localQ_eq`、一般の P・cands・faces で示す）。
* 面の木の歩み `qstep` は `Formal/KSeg.lean` の形（旗 `ok`、鍵 = (stack, nW, nF)）に合う
  （`qStepMono`・`qStepKeyed`・`qInitOk`）。区間ごとの定理を `SegOk.append` でつなぎ、`faceRun_of` で面の値にする。
-/

namespace PackLean.D44.KL
open PackLean.D28 (Poly)
open PackLean.D16 PackLean.D44
open PackLean.Formal.KSeg

deriving instance DecidableEq for PackLean.D16.LBox

def faceCf (P : Prob) (polys : List (Poly × List Poly)) (i : Nat) (sg : Int) : QFace :=
  polys.map (fun (y : Poly × List Poly) =>
    (constTerm P.nb y.1, faceSubEq i sg 1 y.1, faceSub i sg 2 y.1, y.2.map (faceSub i sg 0)))

def box0 (P : Prob) : LBox := ⟨[0, -P.rden, -P.rden], [P.r0, P.rden, P.rden]⟩

def faceRun (P : Prob) (qlamL : Nat) (polys : List (Poly × List Poly)) (x : (Nat × Int) × List QTok) :
    Bool × Nat × Nat :=
  let s := x.2.foldl (qstep P qlamL P.rden x.1.1 x.1.2 (faceCf P polys x.1.1 x.1.2)) ⟨[box0 P], true, 0, 0⟩
  (s.ok && s.stack.isEmpty, s.nW, s.nF)

def facesRes (P : Prob) (qlamL : Nat) (polys : List (Poly × List Poly)) (faces : List (List QTok)) :
    Bool × Nat × Nat :=
  (List.zip faceList faces).foldl (fun (acc : Bool × Nat × Nat) x =>
    let r := faceRun P qlamL polys x
    (acc.1 && r.1, acc.2.1 + r.2.1, acc.2.2 + r.2.2)) (true, 0, 0)

def headOk (P : Prob) (cands : List Cand) : Bool :=
  let dm0 := (cands.headD ⟨[], [], [], 0⟩).dm
  (!cands.isEmpty && cands.all (candOk P) && cands.all (fun c => c.dm == dm0)) &&
  ((P.r0 * (P.rho0.2 : Int) == P.rho0.1 * P.rden) && decide (0 < P.r0))

def localQS (P : Prob) (qlamL : Nat) (cands : List Cand) (faces : List (List QTok))
    (polys : List (Poly × List Poly)) : Bool × Nat × Nat :=
  let res := facesRes P qlamL polys faces
  (headOk P cands && faces.length == 6 && res.1, res.2.1, res.2.2)

def polysOf (P : Prob) (cands : List Cand) : List (Poly × List Poly) :=
  match rotPoly P.ps P.nb with
  | (Rq, N) => cands.map (candPolys P Rq N)

theorem localQ_eq (P : Prob) (qlamL : Nat) (cands : List Cand) (faces : List (List QTok)) :
    localQ P qlamL cands faces = localQS P qlamL cands faces (polysOf P cands) := by
  unfold localQ localQS polysOf facesRes faceRun headOk faceCf box0
  dsimp only
  cases rotPoly P.ps P.nb
  simp only [Bool.and_assoc]

/-! ## 区間（KSeg） -/

abbrev QKey := List LBox × Nat × Nat

def qOk (s : QState) : Bool := s.ok
def qKey (s : QState) : QKey := (s.stack, s.nW, s.nF)
def qInit (k : QKey) : QState := ⟨k.1, true, k.2.1, k.2.2⟩

theorem qStepMono (P : Prob) (qlamL : Nat) (D : Int) (i : Nat) (sg : Int) (cf : QFace) :
    StepMono (qstep P qlamL D i sg cf) qOk := by
  intro s t h
  unfold qOk qstep at *
  split at h
  · simp at h
  · split at h <;> simp_all

theorem qStepKeyed (P : Prob) (qlamL : Nat) (D : Int) (i : Nat) (sg : Int) (cf : QFace) :
    StepKeyed (qstep P qlamL D i sg cf) qOk qKey := by
  intro s s' t h h' hk
  cases s; cases s'
  simp only [qOk, qKey, Prod.mk.injEq] at h h' hk
  obtain ⟨h1, h2, h3⟩ := hk
  subst h h' h1 h2 h3
  exact ⟨rfl, rfl⟩

theorem qInitOk : InitOk qOk qKey qInit := fun _ => ⟨rfl, rfl⟩

/-- 区間の検査（`SegOk` の判定できる形）。 -/
def segChk (P : Prob) (qlamL : Nat) (polys : List (Poly × List Poly)) (i : Nat) (sg : Int)
    (k : QKey) (ts : List QTok) (k' : QKey) : Bool :=
  let s := ts.foldl (qstep P qlamL P.rden i sg (faceCf P polys i sg)) (qInit k)
  s.ok && decide (qKey s = k')

theorem segOk_of {P : Prob} {qlamL : Nat} {polys : List (Poly × List Poly)} {i : Nat} {sg : Int}
    {k : QKey} {ts : List QTok} {k' : QKey} (h : segChk P qlamL polys i sg k ts k' = true) :
    SegOk (qstep P qlamL P.rden i sg (faceCf P polys i sg)) qOk qKey qInit k ts k' := by
  unfold segChk at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  exact h

theorem faceRun_of {P : Prob} {qlamL : Nat} {polys : List (Poly × List Poly)} {i : Nat} {sg : Int}
    {ts : List QTok} {a b : Nat}
    (h : SegOk (qstep P qlamL P.rden i sg (faceCf P polys i sg)) qOk qKey qInit ([box0 P], 0, 0) ts ([], a, b)) :
    faceRun P qlamL polys ((i, sg), ts) = (true, a, b) := by
  obtain ⟨h1, h2⟩ := h
  unfold faceRun
  simp only [qInit] at h1 h2
  unfold qOk at h1
  unfold qKey at h2
  simp only [Prod.mk.injEq] at h2
  obtain ⟨e1, e2, e3⟩ := h2
  simp [h1, e1, e2, e3]

theorem seg_append {P : Prob} {qlamL : Nat} {polys : List (Poly × List Poly)} {i : Nat} {sg : Int}
    {a b c : QKey} {t1 t2 : List QTok}
    (h1 : SegOk (qstep P qlamL P.rden i sg (faceCf P polys i sg)) qOk qKey qInit a t1 b)
    (h2 : SegOk (qstep P qlamL P.rden i sg (faceCf P polys i sg)) qOk qKey qInit b t2 c) :
    SegOk (qstep P qlamL P.rden i sg (faceCf P polys i sg)) qOk qKey qInit a (t1 ++ t2) c :=
  SegOk.append (qStepMono P qlamL P.rden i sg _) (qStepKeyed P qlamL P.rden i sg _) qInitOk h1 h2

/-- 6 面をまとめる。 -/
theorem localQS_six {P : Prob} {qlamL : Nat} {cands : List Cand} {polys : List (Poly × List Poly)}
    {f0 f1 f2 f3 f4 f5 : List QTok} {a0 a1 a2 a3 a4 a5 b0 b1 b2 b3 b4 b5 : Nat}
    (hh : headOk P cands = true)
    (h0 : faceRun P qlamL polys ((0, 1), f0) = (true, a0, b0))
    (h1 : faceRun P qlamL polys ((0, -1), f1) = (true, a1, b1))
    (h2 : faceRun P qlamL polys ((1, 1), f2) = (true, a2, b2))
    (h3 : faceRun P qlamL polys ((1, -1), f3) = (true, a3, b3))
    (h4 : faceRun P qlamL polys ((2, 1), f4) = (true, a4, b4))
    (h5 : faceRun P qlamL polys ((2, -1), f5) = (true, a5, b5)) :
    localQS P qlamL cands [f0, f1, f2, f3, f4, f5] polys =
      (true, 0 + a0 + a1 + a2 + a3 + a4 + a5, 0 + b0 + b1 + b2 + b3 + b4 + b5) := by
  unfold localQS facesRes
  simp only [faceList, List.zip, List.zipWith, List.foldl, h0, h1, h2, h3, h4, h5, hh]
  rfl

end PackLean.D44.KL
