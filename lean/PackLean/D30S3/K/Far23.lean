-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 115〜119（歩 1691〜1795）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1691_1707 : stEq (runT P X toks s_1691 1691 1707) s_1707 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1707_1725 : stEq (runT P X toks s_1707 1707 1725) s_1725 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1725_1766 : stEq (runT P X toks s_1725 1725 1766) s_1766 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1766_1780 : stEq (runT P X toks s_1766 1766 1780) s_1780 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1780_1795 : stEq (runT P X toks s_1780 1780 1795) s_1795 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1691 から歩 1795 まで（区間 5 本をつないだもの）。 -/
theorem f23 : (toks.drop 1691).foldl (wstepT P X) s_1691 = (toks.drop 1795).foldl (wstepT P X) s_1795 :=
  (segT (by decide) r_1691_1707).trans <| (segT (by decide) r_1707_1725).trans <| (segT (by decide) r_1725_1766).trans <| (segT (by decide) r_1766_1780).trans <| segT (by decide) r_1780_1795

end PackLean.D30S3.K
