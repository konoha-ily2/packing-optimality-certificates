-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 2（軸 1、符号 1）の木（受理 1）を、区間 1 本の decide +kernel で。
import PackLean.D16.IcoOct.K.LocalS

namespace PackLean.D16.IcoOct.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.IcoOct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_0_1 : lstEq (lrun P cands 1 1 lf2 (lInit P) 0 1) l2_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface2 : faceFold P cands 1 1 lf2 (lInit P) = l2_1 := by
  have h : faceFold P cands 1 1 (lf2.drop 0) (lInit P) = l2_1 :=
    (lseg (by decide) lr2_0_1).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D16.IcoOct.K
