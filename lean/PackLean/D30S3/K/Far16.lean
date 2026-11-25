-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 80〜84（歩 1114〜1214）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1114_1135 : stEq (runT P X toks s_1114 1114 1135) s_1135 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1135_1152 : stEq (runT P X toks s_1135 1135 1152) s_1152 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1152_1170 : stEq (runT P X toks s_1152 1152 1170) s_1170 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1170_1196 : stEq (runT P X toks s_1170 1170 1196) s_1196 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1196_1214 : stEq (runT P X toks s_1196 1196 1214) s_1214 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1114 から歩 1214 まで（区間 5 本をつないだもの）。 -/
theorem f16 : (toks.drop 1114).foldl (wstepT P X) s_1114 = (toks.drop 1214).foldl (wstepT P X) s_1214 :=
  (segT (by decide) r_1114_1135).trans <| (segT (by decide) r_1135_1152).trans <| (segT (by decide) r_1152_1170).trans <| (segT (by decide) r_1170_1196).trans <| segT (by decide) r_1196_1214

end PackLean.D30S3.K
