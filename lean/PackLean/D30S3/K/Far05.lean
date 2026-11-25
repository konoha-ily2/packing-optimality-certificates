-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 25〜29（歩 328〜392）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_328_340 : stEq (runT P X toks s_328 328 340) s_340 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_340_353 : stEq (runT P X toks s_340 340 353) s_353 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_353_365 : stEq (runT P X toks s_353 353 365) s_365 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_365_379 : stEq (runT P X toks s_365 365 379) s_379 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_379_392 : stEq (runT P X toks s_379 379 392) s_392 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 328 から歩 392 まで（区間 5 本をつないだもの）。 -/
theorem f05 : (toks.drop 328).foldl (wstepT P X) s_328 = (toks.drop 392).foldl (wstepT P X) s_392 :=
  (segT (by decide) r_328_340).trans <| (segT (by decide) r_340_353).trans <| (segT (by decide) r_353_365).trans <| (segT (by decide) r_365_379).trans <| segT (by decide) r_379_392

end PackLean.D30S3.K
