-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 85〜89（歩 1214〜1276）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1214_1223 : stEq (runT P X toks s_1214 1214 1223) s_1223 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1223_1238 : stEq (runT P X toks s_1223 1223 1238) s_1238 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1238_1249 : stEq (runT P X toks s_1238 1238 1249) s_1249 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1249_1265 : stEq (runT P X toks s_1249 1249 1265) s_1265 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1265_1276 : stEq (runT P X toks s_1265 1265 1276) s_1276 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1214 から歩 1276 まで（区間 5 本をつないだもの）。 -/
theorem f17 : (toks.drop 1214).foldl (wstepT P X) s_1214 = (toks.drop 1276).foldl (wstepT P X) s_1276 :=
  (segT (by decide) r_1214_1223).trans <| (segT (by decide) r_1223_1238).trans <| (segT (by decide) r_1238_1249).trans <| (segT (by decide) r_1249_1265).trans <| segT (by decide) r_1265_1276

end PackLean.D30S3.K
