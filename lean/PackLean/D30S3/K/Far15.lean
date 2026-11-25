-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 75〜79（歩 1043〜1114）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1043_1051 : stEq (runT P X toks s_1043 1043 1051) s_1051 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1051_1068 : stEq (runT P X toks s_1051 1051 1068) s_1068 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1068_1083 : stEq (runT P X toks s_1068 1068 1083) s_1083 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1083_1094 : stEq (runT P X toks s_1083 1083 1094) s_1094 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1094_1114 : stEq (runT P X toks s_1094 1094 1114) s_1114 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1043 から歩 1114 まで（区間 5 本をつないだもの）。 -/
theorem f15 : (toks.drop 1043).foldl (wstepT P X) s_1043 = (toks.drop 1114).foldl (wstepT P X) s_1114 :=
  (segT (by decide) r_1043_1051).trans <| (segT (by decide) r_1051_1068).trans <| (segT (by decide) r_1068_1083).trans <| (segT (by decide) r_1083_1094).trans <| segT (by decide) r_1094_1114

end PackLean.D30S3.K
