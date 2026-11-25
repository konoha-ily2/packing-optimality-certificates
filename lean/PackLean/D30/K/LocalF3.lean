-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 3（軸 1、符号 (-1)）の木（受理 24）を、区間 6 本の decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_0_11 : lstEq (lrun P cands 1 (-1) lf3 (lInit P) 0 11) l3_11 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_11_18 : lstEq (lrun P cands 1 (-1) lf3 l3_11 11 18) l3_18 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_18_26 : lstEq (lrun P cands 1 (-1) lf3 l3_18 18 26) l3_26 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_26_32 : lstEq (lrun P cands 1 (-1) lf3 l3_26 26 32) l3_32 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_32_42 : lstEq (lrun P cands 1 (-1) lf3 l3_32 32 42) l3_42 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr3_42_47 : lstEq (lrun P cands 1 (-1) lf3 l3_42 42 47) l3_47 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface3 : faceFold P cands 1 (-1) lf3 (lInit P) = l3_47 := by
  have h : faceFold P cands 1 (-1) (lf3.drop 0) (lInit P) = l3_47 :=
    (lseg (by decide) lr3_0_11).trans <| (lseg (by decide) lr3_11_18).trans <| (lseg (by decide) lr3_18_26).trans <| (lseg (by decide) lr3_26_32).trans <| (lseg (by decide) lr3_32_42).trans <| (lseg (by decide) lr3_42_47).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30.K
