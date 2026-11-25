import PackLean.D31.Core

/-! 遠方の R の木をカーネルで小分けにするための定義（A9j 7d-5、2026-11-16）。Mathlib は使わない。
  `wsegOk`：n の箱 nb の R の木の並びの一区間（スタック k0 → k1、旗が立ったまま）。
  つなぐ理屈は `Formal/KSeg.lean`、橋は `Formal/OctFarKD.lean`。 -/

namespace PackLean.D31

deriving instance DecidableEq for RBox

def wInit (k : List RBox) : WState := ⟨k, true, 0, 0, 0⟩

def wsegOk (P : Prm) (nb : NBox) (k0 : List RBox) (toks : List Tok) (k1 : List RBox) : Bool :=
  (toks.foldl (wstep P nb) (wInit k0)).ok && decide ((toks.foldl (wstep P nb) (wInit k0)).stack = k1)

end PackLean.D31
