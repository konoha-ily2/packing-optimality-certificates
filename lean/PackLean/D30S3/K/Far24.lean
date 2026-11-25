-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 120〜121（歩 1795〜1848）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1795_1816 : stEq (runT P X toks s_1795 1795 1816) s_1816 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1816_1848 : stEq (runT P X toks s_1816 1816 1848) s_1848 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1795 から歩 1848 まで（区間 2 本をつないだもの）。 -/
theorem f24 : (toks.drop 1795).foldl (wstepT P X) s_1795 = (toks.drop 1848).foldl (wstepT P X) s_1848 :=
  (segT (by decide) r_1795_1816).trans <| segT (by decide) r_1816_1848

end PackLean.D30S3.K
