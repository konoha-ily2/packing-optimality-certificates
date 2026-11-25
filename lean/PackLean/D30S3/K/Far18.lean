-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 90〜94（歩 1276〜1341）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1276_1288 : stEq (runT P X toks s_1276 1276 1288) s_1288 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1288_1304 : stEq (runT P X toks s_1288 1288 1304) s_1304 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1304_1317 : stEq (runT P X toks s_1304 1304 1317) s_1317 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1317_1327 : stEq (runT P X toks s_1317 1317 1327) s_1327 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1327_1341 : stEq (runT P X toks s_1327 1327 1341) s_1341 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1276 から歩 1341 まで（区間 5 本をつないだもの）。 -/
theorem f18 : (toks.drop 1276).foldl (wstepT P X) s_1276 = (toks.drop 1341).foldl (wstepT P X) s_1341 :=
  (segT (by decide) r_1276_1288).trans <| (segT (by decide) r_1288_1304).trans <| (segT (by decide) r_1304_1317).trans <| (segT (by decide) r_1317_1327).trans <| segT (by decide) r_1327_1341

end PackLean.D30S3.K
