-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 110〜114（歩 1607〜1691）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1607_1623 : stEq (runT P X toks s_1607 1607 1623) s_1623 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1623_1640 : stEq (runT P X toks s_1623 1623 1640) s_1640 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1640_1657 : stEq (runT P X toks s_1640 1640 1657) s_1657 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1657_1675 : stEq (runT P X toks s_1657 1657 1675) s_1675 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1675_1691 : stEq (runT P X toks s_1675 1675 1691) s_1691 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1607 から歩 1691 まで（区間 5 本をつないだもの）。 -/
theorem f22 : (toks.drop 1607).foldl (wstepT P X) s_1607 = (toks.drop 1691).foldl (wstepT P X) s_1691 :=
  (segT (by decide) r_1607_1623).trans <| (segT (by decide) r_1623_1640).trans <| (segT (by decide) r_1640_1657).trans <| (segT (by decide) r_1657_1675).trans <| segT (by decide) r_1675_1691

end PackLean.D30S3.K
