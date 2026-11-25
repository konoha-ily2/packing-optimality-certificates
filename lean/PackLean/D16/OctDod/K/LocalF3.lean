-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 3（軸 1、符号 (-1)）の木（受理 4）を、区間 1 本の decide +kernel で。
import PackLean.D16.OctDod.K.LocalS

namespace PackLean.D16.OctDod.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.OctDod

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_0_7 : lstEq (lrun P cands 1 (-1) lf3 (lInit P) 0 7) l3_7 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface3 : faceFold P cands 1 (-1) lf3 (lInit P) = l3_7 := by
  have h : faceFold P cands 1 (-1) (lf3.drop 0) (lInit P) = l3_7 :=
    (lseg (by decide) lr3_0_7).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D16.OctDod.K
