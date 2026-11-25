-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：遠方の全部を wstepR で（native_decide なし）。健全性は PackLean.Formal.SandwichR（d16_sandwich_certR）。
import PackLean.D44.Cubindod.KR.Far00
import PackLean.D44.Cubindod.KR.Far01
import PackLean.D44.Cubindod.KR.Far02
import PackLean.D44.Cubindod.KR.Far03
import PackLean.D44.Cubindod.KR.Far04
import PackLean.D44.Cubindod.KR.Far05
import PackLean.D44.Cubindod.KR.Far06
import PackLean.D44.Cubindod.KR.Far07
import PackLean.D44.Cubindod.KR.Far08
import PackLean.D44.Cubindod.KR.Far09
import PackLean.D44.Cubindod.KR.Far10
import PackLean.D44.Cubindod.KR.Far11
import PackLean.D44.Cubindod.KR.Far12
import PackLean.D44.Cubindod.KR.Far13
import PackLean.D44.Cubindod.KR.Far14
import PackLean.D44.Cubindod.KR.Far15
import PackLean.D44.Cubindod.KR.Far16
import PackLean.D44.Cubindod.KR.Far17
import PackLean.D44.Cubindod.KR.Far18
import PackLean.D44.Cubindod.KR.Far19
import PackLean.D44.Cubindod.KR.Far20
import PackLean.D44.Cubindod.KR.Far21
import PackLean.D44.Cubindod.KR.Far22
import PackLean.D44.Cubindod.KR.Far23
import PackLean.D44.Cubindod.KR.Far24
import PackLean.D44.Cubindod.KR.Far25
import PackLean.D44.Cubindod.KR.Far26
import PackLean.D44.Cubindod.KR.Far27
import PackLean.D44.Cubindod.KR.Far28
import PackLean.D44.Cubindod.KR.Far29
import PackLean.D44.Cubindod.KR.Far30
import PackLean.D44.Cubindod.KR.Far31
import PackLean.D44.Cubindod.KR.Far32
import PackLean.D44.Cubindod.KR.Far33
import PackLean.D44.Cubindod.KR.Far34
import PackLean.D44.Cubindod.KR.Far35
import PackLean.D44.Cubindod.KR.Far36
import PackLean.D44.Cubindod.KR.Far37
import PackLean.D44.Cubindod.KR.Far38
import PackLean.D44.Cubindod.KR.Far39
import PackLean.D44.Cubindod.KR.Far40
import PackLean.D44.Cubindod.KR.Far41
import PackLean.D44.Cubindod.KR.Far42
import PackLean.D44.Cubindod.KR.Far43
import PackLean.D44.Cubindod.KR.Far44
import PackLean.D44.Cubindod.KR.Far45
import PackLean.D44.Cubindod.KR.Far46
import PackLean.D44.Cubindod.KR.Far47
import PackLean.D44.Cubindod.KR.Far48
import PackLean.D44.Cubindod.KR.Far49
import PackLean.D44.Cubindod.KR.Far50
import PackLean.D44.Cubindod.KR.Far51
import PackLean.D44.Cubindod.KR.Far52
import PackLean.D44.Cubindod.KR.Far53
import PackLean.D44.Cubindod.KR.Far54
import PackLean.D44.Cubindod.KR.Far55
import PackLean.D44.Cubindod.KR.Far56
import PackLean.D44.Cubindod.KR.Far57
import PackLean.D44.Cubindod.KR.Far58
import PackLean.D44.Cubindod.KR.Far59
import PackLean.D44.Cubindod.KR.Far60
import PackLean.D44.Cubindod.KR.Far61
import PackLean.D44.Cubindod.KR.Far62
import PackLean.D44.Cubindod.KR.Far63
import PackLean.D44.Cubindod.KR.Far64
import PackLean.D44.Cubindod.KR.Far65
import PackLean.D44.Cubindod.KR.Far66
import PackLean.D44.Cubindod.KR.Far67
import PackLean.D44.Cubindod.KR.Far68
import PackLean.D44.Cubindod.KR.Far69
import PackLean.D44.Cubindod.KR.Far70
import PackLean.D44.Cubindod.KR.Far71
import PackLean.D44.Cubindod.KR.Far72
import PackLean.D44.Cubindod.KR.Far73
import PackLean.D44.Cubindod.KR.Far74
import PackLean.D44.Cubindod.KR.Far75
import PackLean.D44.Cubindod.KR.Far76
import PackLean.D44.Cubindod.KR.Far77
import PackLean.D44.Cubindod.KR.Far78
import PackLean.D44.Cubindod.KR.Far79
import PackLean.D44.Cubindod.KR.Far80
import PackLean.D44.Cubindod.KR.Far81
import PackLean.D44.Cubindod.KR.Far82
import PackLean.D44.Cubindod.KR.Far83
import PackLean.D44.Cubindod.KR.Far84
import PackLean.D44.Cubindod.KR.Far85
import PackLean.D44.Cubindod.KR.Far86
import PackLean.D44.Cubindod.KR.Far87
import PackLean.D44.Cubindod.KR.Far88
import PackLean.D44.Cubindod.KR.Far89
import PackLean.D44.Cubindod.KR.Far90
import PackLean.D44.Cubindod.KR.Far91
import PackLean.D44.Cubindod.KR.Far92
import PackLean.D44.Cubindod.KR.Far93
import PackLean.D44.Cubindod.KR.Far94
import PackLean.D44.Cubindod.KR.Far95
import PackLean.D44.Cubindod.KR.Far96
import PackLean.D44.Cubindod.KR.Far97
import PackLean.D44.Cubindod.KR.Far98
import PackLean.D44.Cubindod.KR.Far99
import PackLean.D44.Cubindod.KR.Far100
import PackLean.D44.Cubindod.KR.Far101
import PackLean.D44.Cubindod.KR.Far102
import PackLean.D44.Cubindod.KR.Far103
import PackLean.D44.Cubindod.KR.Far104

namespace PackLean.D44.Cubindod.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Cubindod PackLean.D44.Cubindod.K PackLean.D44.Cubindod.KR

set_option maxRecDepth 100000 in
/-- 並びを全部進めた状態。 -/
theorem fold : (toks.drop 0).foldl (wstepR P sbR) s_0 = s_94360 :=
  f00.trans <| f01.trans <| f02.trans <| f03.trans <| f04.trans <| f05.trans <| f06.trans <| f07.trans <| f08.trans <| f09.trans <| f10.trans <| f11.trans <| f12.trans <| f13.trans <| f14.trans <| f15.trans <| f16.trans <| f17.trans <| f18.trans <| f19.trans <| f20.trans <| f21.trans <| f22.trans <| f23.trans <| f24.trans <| f25.trans <| f26.trans <| f27.trans <| f28.trans <| f29.trans <| f30.trans <| f31.trans <| f32.trans <| f33.trans <| f34.trans <| f35.trans <| f36.trans <| f37.trans <| f38.trans <| f39.trans <| f40.trans <| f41.trans <| f42.trans <| f43.trans <| f44.trans <| f45.trans <| f46.trans <| f47.trans <| f48.trans <| f49.trans <| f50.trans <| f51.trans <| f52.trans <| f53.trans <| f54.trans <| f55.trans <| f56.trans <| f57.trans <| f58.trans <| f59.trans <| f60.trans <| f61.trans <| f62.trans <| f63.trans <| f64.trans <| f65.trans <| f66.trans <| f67.trans <| f68.trans <| f69.trans <| f70.trans <| f71.trans <| f72.trans <| f73.trans <| f74.trans <| f75.trans <| f76.trans <| f77.trans <| f78.trans <| f79.trans <| f80.trans <| f81.trans <| f82.trans <| f83.trans <| f84.trans <| f85.trans <| f86.trans <| f87.trans <| f88.trans <| f89.trans <| f90.trans <| f91.trans <| f92.trans <| f93.trans <| f94.trans <| f95.trans <| f96.trans <| f97.trans <| f98.trans <| f99.trans <| f100.trans <| f101.trans <| f102.trans <| f103.trans <| f104.trans <| finR (by decide +kernel)

set_option maxRecDepth 100000 in
/-- 遠方の全部（wstepR、S̄″ = sbR）：受理 46658・捨てた 524・L 0。 -/
theorem far_okR : farRunR P sbR toks = (true, 46658, 524, 0) := by
  have h := fold
  simp only [List.drop_zero, s_0] at h
  unfold farRunR
  rw [h]
  decide +kernel

end PackLean.D44.Cubindod.KR
