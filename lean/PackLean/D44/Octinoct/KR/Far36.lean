-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：区間 1080〜1082（歩 33348〜33458）を wstepR で decide +kernel。
import PackLean.D44.Octinoct.KR.FarH

namespace PackLean.D44.Octinoct.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Octinoct PackLean.D44.Octinoct.K PackLean.D44.Octinoct.KR

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_33348_33390 : stEq (runR P sbR toks s_33348 33348 33390) s_33390 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_33390_33437 : stEq (runR P sbR toks s_33390 33390 33437) s_33437 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_33437_33458 : stEq (runR P sbR toks s_33437 33437 33458) s_33458 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 33348 から歩 33458 まで（区間 3 本をつないだもの）。 -/
theorem f36 : (toks.drop 33348).foldl (wstepR P sbR) s_33348 = (toks.drop 33458).foldl (wstepR P sbR) s_33458 :=
  (segR (by decide) r_33348_33390).trans <| (segR (by decide) r_33390_33437).trans <| segR (by decide) r_33437_33458

end PackLean.D44.Octinoct.KR
