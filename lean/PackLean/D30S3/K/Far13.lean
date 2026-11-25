-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 65〜69（歩 900〜963）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_900_910 : stEq (runT P X toks s_900 900 910) s_910 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_910_926 : stEq (runT P X toks s_910 910 926) s_926 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_926_937 : stEq (runT P X toks s_926 926 937) s_937 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_937_950 : stEq (runT P X toks s_937 937 950) s_950 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_950_963 : stEq (runT P X toks s_950 950 963) s_963 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 900 から歩 963 まで（区間 5 本をつないだもの）。 -/
theorem f13 : (toks.drop 900).foldl (wstepT P X) s_900 = (toks.drop 963).foldl (wstepT P X) s_963 :=
  (segT (by decide) r_900_910).trans <| (segT (by decide) r_910_926).trans <| (segT (by decide) r_926_937).trans <| (segT (by decide) r_937_950).trans <| segT (by decide) r_950_963

end PackLean.D30S3.K
