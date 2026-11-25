import PackLean.D28.Core

/-! 遠方の R の木をカーネルで小分けにするための定義（A9h 7b-5（2）、2026-11-16）。Mathlib は使わない。
  `wsegOk`：n の箱 nb の R の木の並びの一区間（スタック k0 → k1、旗が立ったまま）。
  つなぐ理屈は `Formal/KSeg.lean`、橋は `Formal/TetFarKD.lean`。A9j の `D31/FarSeg.lean` と同じ形。 -/

namespace PackLean.D28

deriving instance DecidableEq for RBox

def wInit (k : List RBox) : WState := ⟨k, true, 0, 0, 0⟩

def wsegOk (P : Prob) (nb : NBox) (inL : Bool) (k0 : List RBox) (toks : List Tok) (k1 : List RBox) : Bool :=
  (toks.foldl (wstep P nb inL) (wInit k0)).ok && decide ((toks.foldl (wstep P nb inL) (wInit k0)).stack = k1)

end PackLean.D28
