-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
import PackLean.D16.DodIco.K.Far00
import PackLean.D16.DodIco.K.Far01
import PackLean.D16.DodIco.K.Far02
import PackLean.D16.DodIco.K.Far03
import PackLean.D16.DodIco.K.Far04
import PackLean.D16.DodIco.K.Far05
import PackLean.D16.DodIco.K.Far06
import PackLean.D16.DodIco.K.Far07
import PackLean.D16.DodIco.K.Far08
import PackLean.D16.DodIco.K.Far09
import PackLean.D16.DodIco.K.Far10
import PackLean.D16.DodIco.K.Far11
import PackLean.D16.DodIco.K.Far12
import PackLean.D16.DodIco.K.Far13

namespace PackLean.D16.DodIco.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.DodIco

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstep P) s_0 = s_13364 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| fin (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 5558・捨てた 1118・L 8（元の PackLean.D16.DodIco.far_ok と同じ命題）。 -/
theorem far_ok : farRun P toks = (true, 5558, 1118, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRun
  rw [h]
  decide +kernel

end PackLean.D16.DodIco.K
