-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 30〜34（歩 392〜452）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_392_403 : stEq (runT P X toks s_392 392 403) s_403 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_403_413 : stEq (runT P X toks s_403 403 413) s_413 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_413_426 : stEq (runT P X toks s_413 413 426) s_426 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_426_438 : stEq (runT P X toks s_426 426 438) s_438 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_438_452 : stEq (runT P X toks s_438 438 452) s_452 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 392 から歩 452 まで（区間 5 本をつないだもの）。 -/
theorem f06 : (toks.drop 392).foldl (wstepT P X) s_392 = (toks.drop 452).foldl (wstepT P X) s_452 :=
  (segT (by decide) r_392_403).trans <| (segT (by decide) r_403_413).trans <| (segT (by decide) r_413_426).trans <| (segT (by decide) r_426_438).trans <| segT (by decide) r_438_452

end PackLean.D30S3.K
