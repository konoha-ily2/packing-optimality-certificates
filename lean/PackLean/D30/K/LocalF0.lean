-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 0（軸 0、符号 1）の木（受理 4）を、区間 1 本の decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr0_0_7 : lstEq (lrun P cands 0 1 lf0 (lInit P) 0 7) l0_7 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface0 : faceFold P cands 0 1 lf0 (lInit P) = l0_7 := by
  have h : faceFold P cands 0 1 (lf0.drop 0) (lInit P) = l0_7 :=
    (lseg (by decide) lr0_0_7).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30.K
