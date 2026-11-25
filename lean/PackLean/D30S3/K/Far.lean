-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
import PackLean.D30S3.K.Far00
import PackLean.D30S3.K.Far01
import PackLean.D30S3.K.Far02
import PackLean.D30S3.K.Far03
import PackLean.D30S3.K.Far04
import PackLean.D30S3.K.Far05
import PackLean.D30S3.K.Far06
import PackLean.D30S3.K.Far07
import PackLean.D30S3.K.Far08
import PackLean.D30S3.K.Far09
import PackLean.D30S3.K.Far10
import PackLean.D30S3.K.Far11
import PackLean.D30S3.K.Far12
import PackLean.D30S3.K.Far13
import PackLean.D30S3.K.Far14
import PackLean.D30S3.K.Far15
import PackLean.D30S3.K.Far16
import PackLean.D30S3.K.Far17
import PackLean.D30S3.K.Far18
import PackLean.D30S3.K.Far19
import PackLean.D30S3.K.Far20
import PackLean.D30S3.K.Far21
import PackLean.D30S3.K.Far22
import PackLean.D30S3.K.Far23
import PackLean.D30S3.K.Far24

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstepT P X) s_0 = s_1848 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| f14.trans <| f15.trans <| f16.trans <| f17.trans <| f18.trans <| f19.trans <| f20.trans <| f21.trans <| f22.trans <| f23.trans <| f24.trans <| finT (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 676・捨てた 206・L 44（元の PackLean.D30S3.far_ok と同じ命題）。 -/
theorem far_ok : farRunT P X toks = (true, 676, 206, 44) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRunT
  rw [h]
  decide +kernel

end PackLean.D30S3.K
