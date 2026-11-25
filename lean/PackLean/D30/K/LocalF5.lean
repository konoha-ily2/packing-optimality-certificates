-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 5（軸 2、符号 (-1)）の木（受理 8）を、区間 2 本の decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr5_0_9 : lstEq (lrun P cands 2 (-1) lf5 (lInit P) 0 9) l5_9 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr5_9_15 : lstEq (lrun P cands 2 (-1) lf5 l5_9 9 15) l5_15 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface5 : faceFold P cands 2 (-1) lf5 (lInit P) = l5_15 := by
  have h : faceFold P cands 2 (-1) (lf5.drop 0) (lInit P) = l5_15 :=
    (lseg (by decide) lr5_0_9).trans <| (lseg (by decide) lr5_9_15).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30.K
