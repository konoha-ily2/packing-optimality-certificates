-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 45〜49（歩 621〜688）を decide +kernel で。
import PackLean.D30S3.K.FarS

namespace PackLean.D30S3.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3.KSegT PackLean.D30S3

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_621_637 : stEq (runT P X toks s_621 621 637) s_637 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_637_652 : stEq (runT P X toks s_637 637 652) s_652 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_652_665 : stEq (runT P X toks s_652 652 665) s_665 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_665_675 : stEq (runT P X toks s_665 665 675) s_675 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_675_688 : stEq (runT P X toks s_675 675 688) s_688 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 621 から歩 688 まで（区間 5 本をつないだもの）。 -/
theorem f09 : (toks.drop 621).foldl (wstepT P X) s_621 = (toks.drop 688).foldl (wstepT P X) s_688 :=
  (segT (by decide) r_621_637).trans <| (segT (by decide) r_637_652).trans <| (segT (by decide) r_652_665).trans <| (segT (by decide) r_665_675).trans <| segT (by decide) r_675_688

end PackLean.D30S3.K
