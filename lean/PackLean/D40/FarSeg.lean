import PackLean.D40.Core

/-! 遠方の R の木をカーネルで小分けにするための定義（A9i 7e-5、2026-11-17）。Mathlib は使わない。
  `wsegOk`：n の箱 nb・片側 side・κ_N の R の木の並びの一区間（スタック k0 → k1、旗が立ったまま）。
  D31 の `D31/FarSeg.lean` と同じ形（D40 は `wstep` が片側と κ_N を受ける）。
  つなぐ理屈は `Formal/KSeg.lean`、橋は `Formal/TetintFarKD.lean`。 -/

namespace PackLean.D40

deriving instance DecidableEq for RBox

def wInit (k : List RBox) : WState := ⟨k, true, 0, 0, 0⟩

def wsegOk (P : Prm) (side : Nat) (nb : NBox) (kN : RatI) (k0 : List RBox) (toks : List Tok)
    (k1 : List RBox) : Bool :=
  (toks.foldl (wstep P side nb kN) (wInit k0)).ok &&
    decide ((toks.foldl (wstep P side nb kN) (wInit k0)).stack = k1)

end PackLean.D40
