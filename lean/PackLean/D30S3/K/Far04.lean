-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 20〜24（歩 270〜328）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_270_280 : stEq (runT P X toks s_270 270 280) s_280 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_280_293 : stEq (runT P X toks s_280 280 293) s_293 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_293_305 : stEq (runT P X toks s_293 293 305) s_305 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_305_317 : stEq (runT P X toks s_305 305 317) s_317 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_317_328 : stEq (runT P X toks s_317 317 328) s_328 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 270 から歩 328 まで（区間 5 本をつないだもの）。 -/
theorem f04 : (toks.drop 270).foldl (wstepT P X) s_270 = (toks.drop 328).foldl (wstepT P X) s_328 :=
  (segT (by decide) r_270_280).trans <| (segT (by decide) r_280_293).trans <| (segT (by decide) r_293_305).trans <| (segT (by decide) r_305_317).trans <| segT (by decide) r_317_328

end PackLean.D30S3.K
