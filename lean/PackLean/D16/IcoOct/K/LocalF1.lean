-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 1（軸 0、符号 (-1)）の木（受理 10）を、区間 1 本の decide +kernel で。
import PackLean.D16.IcoOct.K.LocalS

namespace PackLean.D16.IcoOct.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D16.IcoOct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr1_0_19 : lstEq (lrun P cands 0 (-1) lf1 (lInit P) 0 19) l1_19 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface1 : faceFold P cands 0 (-1) lf1 (lInit P) = l1_19 := by
  have h : faceFold P cands 0 (-1) (lf1.drop 0) (lInit P) = l1_19 :=
    (lseg (by decide) lr1_0_19).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D16.IcoOct.K
