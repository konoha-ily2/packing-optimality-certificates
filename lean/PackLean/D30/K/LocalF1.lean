-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 1（軸 0、符号 (-1)）の木（受理 6）を、区間 2 本の decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr1_0_8 : lstEq (lrun P cands 0 (-1) lf1 (lInit P) 0 8) l1_8 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr1_8_11 : lstEq (lrun P cands 0 (-1) lf1 l1_8 8 11) l1_11 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface1 : faceFold P cands 0 (-1) lf1 (lInit P) = l1_11 := by
  have h : faceFold P cands 0 (-1) (lf1.drop 0) (lInit P) = l1_11 :=
    (lseg (by decide) lr1_0_8).trans <| (lseg (by decide) lr1_8_11).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30.K
