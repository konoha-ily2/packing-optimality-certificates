-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 0（軸 0、符号 1）の木（受理 5）を、区間 2 本の decide +kernel で。
import PackLean.D30X.Cub.K.LocalS

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30X.Cub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr0_0_8 : lstEq (lrun P cands 0 1 lf0 (lInit P) 0 8) l0_8 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr0_8_9 : lstEq (lrun P cands 0 1 lf0 l0_8 8 9) l0_9 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface0 : faceFold P cands 0 1 lf0 (lInit P) = l0_9 := by
  have h : faceFold P cands 0 1 (lf0.drop 0) (lInit P) = l0_9 :=
    (lseg (by decide) lr0_0_8).trans <| (lseg (by decide) lr0_8_9).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30X.Cub.K
