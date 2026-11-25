-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 35〜39（歩 452〜526）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_452_461 : stEq (runT P X toks s_452 452 461) s_461 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_461_480 : stEq (runT P X toks s_461 461 480) s_480 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_480_502 : stEq (runT P X toks s_480 480 502) s_502 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_502_513 : stEq (runT P X toks s_502 502 513) s_513 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_513_526 : stEq (runT P X toks s_513 513 526) s_526 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 452 から歩 526 まで（区間 5 本をつないだもの）。 -/
theorem f07 : (toks.drop 452).foldl (wstepT P X) s_452 = (toks.drop 526).foldl (wstepT P X) s_526 :=
  (segT (by decide) r_452_461).trans <| (segT (by decide) r_461_480).trans <| (segT (by decide) r_480_502).trans <| (segT (by decide) r_502_513).trans <| segT (by decide) r_513_526

end PackLean.D30S3.K
