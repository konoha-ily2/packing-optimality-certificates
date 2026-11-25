-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
import PackLean.D30X.Cub.K.Far00
import PackLean.D30X.Cub.K.Far01
import PackLean.D30X.Cub.K.Far02
import PackLean.D30X.Cub.K.Far03
import PackLean.D30X.Cub.K.Far04
import PackLean.D30X.Cub.K.Far05
import PackLean.D30X.Cub.K.Far06
import PackLean.D30X.Cub.K.Far07

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Cub

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstep P) s_0 = s_7604 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| fin (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 3347・捨てた 449・L 8（元の PackLean.D30X.Cub.far_ok と同じ命題）。 -/
theorem far_ok : farRun P toks = (true, 3347, 449, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRun
  rw [h]
  decide +kernel

end PackLean.D30X.Cub.K
