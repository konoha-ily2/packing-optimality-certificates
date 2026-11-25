-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 15〜19（歩 208〜270）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_208_223 : stEq (runT P X toks s_208 208 223) s_223 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_223_233 : stEq (runT P X toks s_223 223 233) s_233 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_233_246 : stEq (runT P X toks s_233 233 246) s_246 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_246_257 : stEq (runT P X toks s_246 246 257) s_257 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_257_270 : stEq (runT P X toks s_257 257 270) s_270 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 208 から歩 270 まで（区間 5 本をつないだもの）。 -/
theorem f03 : (toks.drop 208).foldl (wstepT P X) s_208 = (toks.drop 270).foldl (wstepT P X) s_270 :=
  (segT (by decide) r_208_223).trans <| (segT (by decide) r_223_233).trans <| (segT (by decide) r_233_246).trans <| (segT (by decide) r_246_257).trans <| segT (by decide) r_257_270

end PackLean.D30S3.K
