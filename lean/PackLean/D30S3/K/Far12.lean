-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 60〜64（歩 832〜900）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_832_846 : stEq (runT P X toks s_832 832 846) s_846 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_846_864 : stEq (runT P X toks s_846 846 864) s_864 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_864_874 : stEq (runT P X toks s_864 864 874) s_874 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_874_887 : stEq (runT P X toks s_874 874 887) s_887 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_887_900 : stEq (runT P X toks s_887 887 900) s_900 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 832 から歩 900 まで（区間 5 本をつないだもの）。 -/
theorem f12 : (toks.drop 832).foldl (wstepT P X) s_832 = (toks.drop 900).foldl (wstepT P X) s_900 :=
  (segT (by decide) r_832_846).trans <| (segT (by decide) r_846_864).trans <| (segT (by decide) r_864_874).trans <| (segT (by decide) r_874_887).trans <| segT (by decide) r_887_900

end PackLean.D30S3.K
