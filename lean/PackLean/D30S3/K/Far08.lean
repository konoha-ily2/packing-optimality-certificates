-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 40〜44（歩 526〜621）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_526_554 : stEq (runT P X toks s_526 526 554) s_554 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_554_562 : stEq (runT P X toks s_554 554 562) s_562 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_562_583 : stEq (runT P X toks s_562 562 583) s_583 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_583_599 : stEq (runT P X toks s_583 583 599) s_599 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_599_621 : stEq (runT P X toks s_599 599 621) s_621 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 526 から歩 621 まで（区間 5 本をつないだもの）。 -/
theorem f08 : (toks.drop 526).foldl (wstepT P X) s_526 = (toks.drop 621).foldl (wstepT P X) s_621 :=
  (segT (by decide) r_526_554).trans <| (segT (by decide) r_554_562).trans <| (segT (by decide) r_562_583).trans <| (segT (by decide) r_583_599).trans <| segT (by decide) r_599_621

end PackLean.D30S3.K
