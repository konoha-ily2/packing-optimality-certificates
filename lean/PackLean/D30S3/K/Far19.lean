-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 95〜99（歩 1341〜1428）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1341_1363 : stEq (runT P X toks s_1341 1341 1363) s_1363 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1363_1383 : stEq (runT P X toks s_1363 1363 1383) s_1383 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1383_1397 : stEq (runT P X toks s_1383 1383 1397) s_1397 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1397_1412 : stEq (runT P X toks s_1397 1397 1412) s_1412 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1412_1428 : stEq (runT P X toks s_1412 1412 1428) s_1428 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1341 から歩 1428 まで（区間 5 本をつないだもの）。 -/
theorem f19 : (toks.drop 1341).foldl (wstepT P X) s_1341 = (toks.drop 1428).foldl (wstepT P X) s_1428 :=
  (segT (by decide) r_1341_1363).trans <| (segT (by decide) r_1363_1383).trans <| (segT (by decide) r_1383_1397).trans <| (segT (by decide) r_1397_1412).trans <| segT (by decide) r_1412_1428

end PackLean.D30S3.K
