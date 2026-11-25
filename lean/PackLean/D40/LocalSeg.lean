import PackLean.D40.Core

/-! 局所の検査をカーネルで小分けにするための定義（A9i 7e-5、2026-11-17）。Mathlib は使わない。

* 候補の部品 `candItems P ce tab`（中心ごとの (形の合否, e₀, Λ) の表）は中心ごとに 1 回
  `candItems P ce tab = IT` を示し、データ `IT` を使い回す。
* `lsegOk`：面の木の並びの一区間。スタック `k0` から始めて並び `toks` をたどり、旗が立ったまま
  スタック `k1` で終わる。区間をつなぐ理屈は `Formal/KSeg.lean`、件への橋は `Formal/TetintLocalKD.lean`。
  D31 の `D31/LocalSeg.lean` と同じ形（D40 は `lstep` が筒かどうか・正規化の幅・候補の表を受ける）。
-/

namespace PackLean.D40

deriving instance DecidableEq for LBox
deriving instance DecidableEq for Cen

def lInit (k : List LBox) : LState := ⟨k, true, 0⟩

/-- 木の並びの一区間（スタック k0 → k1、旗が立ったまま）。 -/
def lsegOk (P : Prm) (tube : Bool) (full : List Int) (items : List (Bool × Poly × Poly))
    (k0 : List LBox) (toks : List LTok) (k1 : List LBox) : Bool :=
  (toks.foldl (lstep P tube full items) (lInit k0)).ok &&
    decide ((toks.foldl (lstep P tube full items) (lInit k0)).stack = k1)

end PackLean.D40
