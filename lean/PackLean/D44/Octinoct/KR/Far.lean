-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：遠方の全部を wstepR で（native_decide なし）。健全性は PackLean.Formal.SandwichR（d16_sandwich_certR）。
import PackLean.D44.Octinoct.KR.Far00
import PackLean.D44.Octinoct.KR.Far01
import PackLean.D44.Octinoct.KR.Far02
import PackLean.D44.Octinoct.KR.Far03
import PackLean.D44.Octinoct.KR.Far04
import PackLean.D44.Octinoct.KR.Far05
import PackLean.D44.Octinoct.KR.Far06
import PackLean.D44.Octinoct.KR.Far07
import PackLean.D44.Octinoct.KR.Far08
import PackLean.D44.Octinoct.KR.Far09
import PackLean.D44.Octinoct.KR.Far10
import PackLean.D44.Octinoct.KR.Far11
import PackLean.D44.Octinoct.KR.Far12
import PackLean.D44.Octinoct.KR.Far13
import PackLean.D44.Octinoct.KR.Far14
import PackLean.D44.Octinoct.KR.Far15
import PackLean.D44.Octinoct.KR.Far16
import PackLean.D44.Octinoct.KR.Far17
import PackLean.D44.Octinoct.KR.Far18
import PackLean.D44.Octinoct.KR.Far19
import PackLean.D44.Octinoct.KR.Far20
import PackLean.D44.Octinoct.KR.Far21
import PackLean.D44.Octinoct.KR.Far22
import PackLean.D44.Octinoct.KR.Far23
import PackLean.D44.Octinoct.KR.Far24
import PackLean.D44.Octinoct.KR.Far25
import PackLean.D44.Octinoct.KR.Far26
import PackLean.D44.Octinoct.KR.Far27
import PackLean.D44.Octinoct.KR.Far28
import PackLean.D44.Octinoct.KR.Far29
import PackLean.D44.Octinoct.KR.Far30
import PackLean.D44.Octinoct.KR.Far31
import PackLean.D44.Octinoct.KR.Far32
import PackLean.D44.Octinoct.KR.Far33
import PackLean.D44.Octinoct.KR.Far34
import PackLean.D44.Octinoct.KR.Far35
import PackLean.D44.Octinoct.KR.Far36

namespace PackLean.D44.Octinoct.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Octinoct PackLean.D44.Octinoct.K PackLean.D44.Octinoct.KR

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstepR P sbR) s_0 = s_33458 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| f14.trans <| f15.trans <| f16.trans <| f17.trans <| f18.trans <| f19.trans <| f20.trans <| f21.trans <| f22.trans <| f23.trans <| f24.trans <| f25.trans <| f26.trans <| f27.trans <| f28.trans <| f29.trans <| f30.trans <| f31.trans <| f32.trans <| f33.trans <| f34.trans <| f35.trans <| f36.trans <| finR (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部（wstepR、S̄″ = sbR）：受理 16050・捨てた 673・L 8。 -/
theorem far_okR : farRunR P sbR toks = (true, 16050, 673, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRunR
  rw [h]
  decide +kernel

end PackLean.D44.Octinoct.KR
