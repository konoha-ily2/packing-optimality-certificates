-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 105〜109（歩 1520〜1607）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1520_1543 : stEq (runT P X toks s_1520 1520 1543) s_1543 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1543_1560 : stEq (runT P X toks s_1543 1543 1560) s_1560 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1560_1574 : stEq (runT P X toks s_1560 1560 1574) s_1574 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1574_1589 : stEq (runT P X toks s_1574 1574 1589) s_1589 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1589_1607 : stEq (runT P X toks s_1589 1589 1607) s_1607 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1520 から歩 1607 まで（区間 5 本をつないだもの）。 -/
theorem f21 : (toks.drop 1520).foldl (wstepT P X) s_1520 = (toks.drop 1607).foldl (wstepT P X) s_1607 :=
  (segT (by decide) r_1520_1543).trans <| (segT (by decide) r_1543_1560).trans <| (segT (by decide) r_1560_1574).trans <| (segT (by decide) r_1574_1589).trans <| segT (by decide) r_1589_1607

end PackLean.D30S3.K
