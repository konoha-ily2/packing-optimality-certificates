-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 50〜54（歩 688〜750）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_688_701 : stEq (runT P X toks s_688 688 701) s_701 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_701_713 : stEq (runT P X toks s_701 701 713) s_713 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_713_727 : stEq (runT P X toks s_713 713 727) s_727 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_727_739 : stEq (runT P X toks s_727 727 739) s_739 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_739_750 : stEq (runT P X toks s_739 739 750) s_750 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 688 から歩 750 まで（区間 5 本をつないだもの）。 -/
theorem f10 : (toks.drop 688).foldl (wstepT P X) s_688 = (toks.drop 750).foldl (wstepT P X) s_750 :=
  (segT (by decide) r_688_701).trans <| (segT (by decide) r_701_713).trans <| (segT (by decide) r_713_727).trans <| (segT (by decide) r_727_739).trans <| segT (by decide) r_739_750

end PackLean.D30S3.K
