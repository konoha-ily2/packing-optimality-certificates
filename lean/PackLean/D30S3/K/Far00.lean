-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜4（歩 0〜89）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_31 : stEq (runT P X toks s_0 0 31) s_31 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_31_47 : stEq (runT P X toks s_31 31 47) s_47 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_47_60 : stEq (runT P X toks s_47 47 60) s_60 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_60_77 : stEq (runT P X toks s_60 60 77) s_77 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_77_89 : stEq (runT P X toks s_77 77 89) s_89 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 89 まで（区間 5 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstepT P X) s_0 = (toks.drop 89).foldl (wstepT P X) s_89 :=
  (segT (by decide) r_0_31).trans <| (segT (by decide) r_31_47).trans <| (segT (by decide) r_47_60).trans <| (segT (by decide) r_60_77).trans <| segT (by decide) r_77_89

end PackLean.D30S3.K
