-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 100〜104（歩 1428〜1520）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1428_1447 : stEq (runT P X toks s_1428 1428 1447) s_1447 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1447_1465 : stEq (runT P X toks s_1447 1447 1465) s_1465 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1465_1483 : stEq (runT P X toks s_1465 1465 1483) s_1483 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1483_1502 : stEq (runT P X toks s_1483 1483 1502) s_1502 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1502_1520 : stEq (runT P X toks s_1502 1502 1520) s_1520 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1428 から歩 1520 まで（区間 5 本をつないだもの）。 -/
theorem f20 : (toks.drop 1428).foldl (wstepT P X) s_1428 = (toks.drop 1520).foldl (wstepT P X) s_1520 :=
  (segT (by decide) r_1428_1447).trans <| (segT (by decide) r_1447_1465).trans <| (segT (by decide) r_1465_1483).trans <| (segT (by decide) r_1483_1502).trans <| segT (by decide) r_1502_1520

end PackLean.D30S3.K
