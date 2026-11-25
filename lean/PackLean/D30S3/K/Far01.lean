-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 5〜9（歩 89〜147）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_89_100 : stEq (runT P X toks s_89 89 100) s_100 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_100_111 : stEq (runT P X toks s_100 100 111) s_111 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_111_124 : stEq (runT P X toks s_111 111 124) s_124 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_124_136 : stEq (runT P X toks s_124 124 136) s_136 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_136_147 : stEq (runT P X toks s_136 136 147) s_147 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 89 から歩 147 まで（区間 5 本をつないだもの）。 -/
theorem f01 : (toks.drop 89).foldl (wstepT P X) s_89 = (toks.drop 147).foldl (wstepT P X) s_147 :=
  (segT (by decide) r_89_100).trans <| (segT (by decide) r_100_111).trans <| (segT (by decide) r_111_124).trans <| (segT (by decide) r_124_136).trans <| segT (by decide) r_136_147

end PackLean.D30S3.K
