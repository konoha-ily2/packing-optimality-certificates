-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：遠方の全部を wstepR で（native_decide なし）。健全性は PackLean.Formal.SandwichR（d16_sandwich_certR）。
import PackLean.D44.Icoinico.KR.Far00
import PackLean.D44.Icoinico.KR.Far01
import PackLean.D44.Icoinico.KR.Far02
import PackLean.D44.Icoinico.KR.Far03
import PackLean.D44.Icoinico.KR.Far04
import PackLean.D44.Icoinico.KR.Far05
import PackLean.D44.Icoinico.KR.Far06
import PackLean.D44.Icoinico.KR.Far07
import PackLean.D44.Icoinico.KR.Far08
import PackLean.D44.Icoinico.KR.Far09
import PackLean.D44.Icoinico.KR.Far10
import PackLean.D44.Icoinico.KR.Far11
import PackLean.D44.Icoinico.KR.Far12
import PackLean.D44.Icoinico.KR.Far13
import PackLean.D44.Icoinico.KR.Far14
import PackLean.D44.Icoinico.KR.Far15
import PackLean.D44.Icoinico.KR.Far16
import PackLean.D44.Icoinico.KR.Far17
import PackLean.D44.Icoinico.KR.Far18
import PackLean.D44.Icoinico.KR.Far19
import PackLean.D44.Icoinico.KR.Far20
import PackLean.D44.Icoinico.KR.Far21
import PackLean.D44.Icoinico.KR.Far22
import PackLean.D44.Icoinico.KR.Far23
import PackLean.D44.Icoinico.KR.Far24
import PackLean.D44.Icoinico.KR.Far25
import PackLean.D44.Icoinico.KR.Far26
import PackLean.D44.Icoinico.KR.Far27
import PackLean.D44.Icoinico.KR.Far28
import PackLean.D44.Icoinico.KR.Far29
import PackLean.D44.Icoinico.KR.Far30
import PackLean.D44.Icoinico.KR.Far31
import PackLean.D44.Icoinico.KR.Far32
import PackLean.D44.Icoinico.KR.Far33
import PackLean.D44.Icoinico.KR.Far34
import PackLean.D44.Icoinico.KR.Far35
import PackLean.D44.Icoinico.KR.Far36
import PackLean.D44.Icoinico.KR.Far37
import PackLean.D44.Icoinico.KR.Far38
import PackLean.D44.Icoinico.KR.Far39
import PackLean.D44.Icoinico.KR.Far40
import PackLean.D44.Icoinico.KR.Far41
import PackLean.D44.Icoinico.KR.Far42
import PackLean.D44.Icoinico.KR.Far43
import PackLean.D44.Icoinico.KR.Far44
import PackLean.D44.Icoinico.KR.Far45
import PackLean.D44.Icoinico.KR.Far46
import PackLean.D44.Icoinico.KR.Far47
import PackLean.D44.Icoinico.KR.Far48
import PackLean.D44.Icoinico.KR.Far49
import PackLean.D44.Icoinico.KR.Far50
import PackLean.D44.Icoinico.KR.Far51
import PackLean.D44.Icoinico.KR.Far52
import PackLean.D44.Icoinico.KR.Far53
import PackLean.D44.Icoinico.KR.Far54
import PackLean.D44.Icoinico.KR.Far55
import PackLean.D44.Icoinico.KR.Far56
import PackLean.D44.Icoinico.KR.Far57
import PackLean.D44.Icoinico.KR.Far58
import PackLean.D44.Icoinico.KR.Far59
import PackLean.D44.Icoinico.KR.Far60
import PackLean.D44.Icoinico.KR.Far61
import PackLean.D44.Icoinico.KR.Far62
import PackLean.D44.Icoinico.KR.Far63
import PackLean.D44.Icoinico.KR.Far64
import PackLean.D44.Icoinico.KR.Far65
import PackLean.D44.Icoinico.KR.Far66
import PackLean.D44.Icoinico.KR.Far67
import PackLean.D44.Icoinico.KR.Far68
import PackLean.D44.Icoinico.KR.Far69
import PackLean.D44.Icoinico.KR.Far70
import PackLean.D44.Icoinico.KR.Far71
import PackLean.D44.Icoinico.KR.Far72
import PackLean.D44.Icoinico.KR.Far73
import PackLean.D44.Icoinico.KR.Far74

namespace PackLean.D44.Icoinico.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Icoinico PackLean.D44.Icoinico.K PackLean.D44.Icoinico.KR

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstepR P sbR) s_0 = s_67934 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| f14.trans <| f15.trans <| f16.trans <| f17.trans <| f18.trans <| f19.trans <| f20.trans <| f21.trans <| f22.trans <| f23.trans <| f24.trans <| f25.trans <| f26.trans <| f27.trans <| f28.trans <| f29.trans <| f30.trans <| f31.trans <| f32.trans <| f33.trans <| f34.trans <| f35.trans <| f36.trans <| f37.trans <| f38.trans <| f39.trans <| f40.trans <| f41.trans <| f42.trans <| f43.trans <| f44.trans <| f45.trans <| f46.trans <| f47.trans <| f48.trans <| f49.trans <| f50.trans <| f51.trans <| f52.trans <| f53.trans <| f54.trans <| f55.trans <| f56.trans <| f57.trans <| f58.trans <| f59.trans <| f60.trans <| f61.trans <| f62.trans <| f63.trans <| f64.trans <| f65.trans <| f66.trans <| f67.trans <| f68.trans <| f69.trans <| f70.trans <| f71.trans <| f72.trans <| f73.trans <| f74.trans <| finR (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部（wstepR、S̄″ = sbR）：受理 33221・捨てた 740・L 8。 -/
theorem far_okR : farRunR P sbR toks = (true, 33221, 740, 8) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRunR
  rw [h]
  decide +kernel

end PackLean.D44.Icoinico.KR
