-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
import PackLean.D16.IcoDod.K.Far00
import PackLean.D16.IcoDod.K.Far01
import PackLean.D16.IcoDod.K.Far02

namespace PackLean.D16.IcoDod.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoDod

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstep P) s_0 = s_2212 :=
  f00.trans <| f01.trans <| f02.trans <| fin (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 892・捨てた 208・L 8（元の PackLean.D16.IcoDod.far_ok と同じ命題）。 -/
theorem far_ok : farRun P toks = (true, 892, 208, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRun
  rw [h]
  decide +kernel

end PackLean.D16.IcoDod.K
