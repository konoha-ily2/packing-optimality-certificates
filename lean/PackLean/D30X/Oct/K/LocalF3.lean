-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 3（軸 1、符号 (-1)）の木（受理 5）を、区間 2 本の decide +kernel で。
import PackLean.D30X.Oct.K.LocalS

namespace PackLean.D30X.Oct.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30X.Oct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_0_8 : lstEq (lrun P cands 1 (-1) lf3 (lInit P) 0 8) l3_8 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_8_9 : lstEq (lrun P cands 1 (-1) lf3 l3_8 8 9) l3_9 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface3 : faceFold P cands 1 (-1) lf3 (lInit P) = l3_9 := by
  have h : faceFold P cands 1 (-1) (lf3.drop 0) (lInit P) = l3_9 :=
    (lseg (by decide) lr3_0_8).trans <| (lseg (by decide) lr3_8_9).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30X.Oct.K
