-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 55〜59（歩 750〜832）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_750_766 : stEq (runT P X toks s_750 750 766) s_766 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_766_781 : stEq (runT P X toks s_766 766 781) s_781 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_781_794 : stEq (runT P X toks s_781 781 794) s_794 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_794_815 : stEq (runT P X toks s_794 794 815) s_815 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_815_832 : stEq (runT P X toks s_815 815 832) s_832 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 750 から歩 832 まで（区間 5 本をつないだもの）。 -/
theorem f11 : (toks.drop 750).foldl (wstepT P X) s_750 = (toks.drop 832).foldl (wstepT P X) s_832 :=
  (segT (by decide) r_750_766).trans <| (segT (by decide) r_766_781).trans <| (segT (by decide) r_781_794).trans <| (segT (by decide) r_794_815).trans <| segT (by decide) r_815_832

end PackLean.D30S3.K
