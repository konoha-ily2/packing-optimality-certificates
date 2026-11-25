-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Far.lean の far_ok と同じ命題を、native_decide なし（区間の decide +kernel と KernelSegW のつなぎ）で。
import PackLean.D30X.Oct.K.Far00
import PackLean.D30X.Oct.K.Far01
import PackLean.D30X.Oct.K.Far02
import PackLean.D30X.Oct.K.Far03
import PackLean.D30X.Oct.K.Far04
import PackLean.D30X.Oct.K.Far05
import PackLean.D30X.Oct.K.Far06
import PackLean.D30X.Oct.K.Far07
import PackLean.D30X.Oct.K.Far08
import PackLean.D30X.Oct.K.Far09
import PackLean.D30X.Oct.K.Far10
import PackLean.D30X.Oct.K.Far11
import PackLean.D30X.Oct.K.Far12
import PackLean.D30X.Oct.K.Far13
import PackLean.D30X.Oct.K.Far14
import PackLean.D30X.Oct.K.Far15
import PackLean.D30X.Oct.K.Far16
import PackLean.D30X.Oct.K.Far17
import PackLean.D30X.Oct.K.Far18
import PackLean.D30X.Oct.K.Far19
import PackLean.D30X.Oct.K.Far20
import PackLean.D30X.Oct.K.Far21
import PackLean.D30X.Oct.K.Far22
import PackLean.D30X.Oct.K.Far23
import PackLean.D30X.Oct.K.Far24
import PackLean.D30X.Oct.K.Far25
import PackLean.D30X.Oct.K.Far26
import PackLean.D30X.Oct.K.Far27
import PackLean.D30X.Oct.K.Far28
import PackLean.D30X.Oct.K.Far29
import PackLean.D30X.Oct.K.Far30
import PackLean.D30X.Oct.K.Far31
import PackLean.D30X.Oct.K.Far32
import PackLean.D30X.Oct.K.Far33
import PackLean.D30X.Oct.K.Far34

namespace PackLean.D30X.Oct.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Oct

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstep P) s_0 = s_31966 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| f14.trans <| f15.trans <| f16.trans <| f17.trans <| f18.trans <| f19.trans <| f20.trans <| f21.trans <| f22.trans <| f23.trans <| f24.trans <| f25.trans <| f26.trans <| f27.trans <| f28.trans <| f29.trans <| f30.trans <| f31.trans <| f32.trans <| f33.trans <| f34.trans <| fin (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部：4 枚の地図の木が尽き、すべての葉が受理される。受理 15250・捨てた 727・L 8（元の PackLean.D30X.Oct.far_ok と同じ命題）。 -/
theorem far_ok : farRun P toks = (true, 15250, 727, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRun
  rw [h]
  decide +kernel

end PackLean.D30X.Oct.K
