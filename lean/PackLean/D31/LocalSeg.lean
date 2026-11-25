import PackLean.D31.Core

/-! 局所の検査をカーネルで小分けにするための定義（A9j 7d-5、2026-11-16）。Mathlib は使わない。

* `FaceData`（面ごとの候補の部品）は `faceData P kd fi fv = FD₀` を面ごとに 1 回示し、データ `FD₀` を使い回す。
* `lsegOk`：面の木の並びの一区間。スタック `k0` から始めて並び `toks` をたどり、旗が立ったまま
  スタック `k1` で終わる。区間をつなぐ理屈は `Formal/KSeg.lean`、件への橋は `Formal/OctLocalKD.lean`。
  D28 の `D28/LocalSeg.lean` と同じ形（D31 は `lstep` が `FaceData` を受ける）。
-/

namespace PackLean.D31

deriving instance DecidableEq for LBox
deriving instance DecidableEq for FaceData

def lInit (k : List LBox) : LState := ⟨k, true, 0⟩

/-- 木の並びの一区間（スタック k0 → k1、旗が立ったまま）。 -/
def lsegOk (P : Prm) (kd : Kind) (full : List Int) (FD : FaceData) (k0 : List LBox) (toks : List LTok)
    (k1 : List LBox) : Bool :=
  (toks.foldl (lstep P kd full FD) (lInit k0)).ok &&
    decide ((toks.foldl (lstep P kd full FD) (lInit k0)).stack = k1)

end PackLean.D31
