-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 2（軸 1、符号 1）の木（受理 6）を、区間 2 本の decide +kernel で。
import PackLean.D30X.Cub.K.LocalS

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30X.Cub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_0_8 : lstEq (lrun P cands 1 1 lf2 (lInit P) 0 8) l2_8 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_8_11 : lstEq (lrun P cands 1 1 lf2 l2_8 8 11) l2_11 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface2 : faceFold P cands 1 1 lf2 (lInit P) = l2_11 := by
  have h : faceFold P cands 1 1 (lf2.drop 0) (lInit P) = l2_11 :=
    (lseg (by decide) lr2_0_8).trans <| (lseg (by decide) lr2_8_11).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30X.Cub.K
