-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 70〜74（歩 963〜1043）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_963_974 : stEq (runT P X toks s_963 963 974) s_974 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_974_983 : stEq (runT P X toks s_974 974 983) s_983 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_983_1010 : stEq (runT P X toks s_983 983 1010) s_1010 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1010_1028 : stEq (runT P X toks s_1010 1010 1028) s_1028 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1028_1043 : stEq (runT P X toks s_1028 1028 1043) s_1043 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 963 から歩 1043 まで（区間 5 本をつないだもの）。 -/
theorem f14 : (toks.drop 963).foldl (wstepT P X) s_963 = (toks.drop 1043).foldl (wstepT P X) s_1043 :=
  (segT (by decide) r_963_974).trans <| (segT (by decide) r_974_983).trans <| (segT (by decide) r_983_1010).trans <| (segT (by decide) r_1010_1028).trans <| segT (by decide) r_1028_1043

end PackLean.D30S3.K
