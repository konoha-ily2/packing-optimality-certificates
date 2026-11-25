import PackLean.D28.Core

/-! 局所の検査をカーネルで小分けにするための定義（A9h 7b-5、2026-11-16）。Mathlib は使わない。

* `hsOfG`：候補ごとの G（代入の結果、データ）から面 (i, sg) の H の並び（`lstep` が引くもの）。
* `lsegOk`：面の木の並びの一区間。スタック `k0` から始めて並び `toks` をたどり、旗が立ったまま
  スタック `k1` で終わる。区間をつなぐ理屈は `Formal/KSeg.lean`、件への橋は `Formal/TetLocalKD.lean`。
-/

namespace PackLean.D28

deriving instance DecidableEq for PQ
deriving instance DecidableEq for LBox

/-- 候補ごとの G の表から、面 (i, sg) の H の並び。 -/
def hsOfG (scl : List (Int × Nat)) (i : Nat) (sg : Int) (Gs : List PQ) : List Poly :=
  Gs.map (fun G => (faceH scl i sg G.p).getD [])

/-- 面 (i, sg) で全候補の `faceH` が通る。 -/
def hsOkG (scl : List (Int × Nat)) (i : Nat) (sg : Int) (Gs : List PQ) : Bool :=
  Gs.all (fun G => (faceH scl i sg G.p).isSome)

/-- 0 次の恒等式を G の表で（`identOk` と同じ）。 -/
def identOkG (nb : Nat) (Gs : List PQ) : Bool := Gs.all (fun G => fIsZero (constTerm nb G.p))

def lInit (k : List LBox) : LState := ⟨k, true, 0⟩

/-- 木の並びの一区間（スタック k0 → k1、旗が立ったまま）。 -/
def lsegOk (P : Prob) (D : Int) (Hs : List Poly) (k0 : List LBox) (toks : List LTok)
    (k1 : List LBox) : Bool :=
  (toks.foldl (lstep P D Hs) (lInit k0)).ok && decide ((toks.foldl (lstep P D Hs) (lInit k0)).stack = k1)

end PackLean.D28
