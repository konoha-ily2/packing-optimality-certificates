-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 10〜14（歩 147〜208）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_147_161 : stEq (runT P X toks s_147 147 161) s_161 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_161_172 : stEq (runT P X toks s_161 161 172) s_172 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_172_185 : stEq (runT P X toks s_172 172 185) s_185 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_185_197 : stEq (runT P X toks s_185 185 197) s_197 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_197_208 : stEq (runT P X toks s_197 197 208) s_208 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 147 から歩 208 まで（区間 5 本をつないだもの）。 -/
theorem f02 : (toks.drop 147).foldl (wstepT P X) s_147 = (toks.drop 208).foldl (wstepT P X) s_208 :=
  (segT (by decide) r_147_161).trans <| (segT (by decide) r_161_172).trans <| (segT (by decide) r_172_185).trans <| (segT (by decide) r_185_197).trans <| segT (by decide) r_197_208

end PackLean.D30S3.K
