-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の面 2（軸 1、符号 1）の木（受理 24）を、区間 6 本の decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_0_10 : lstEq (lrun P cands 1 1 lf2 (lInit P) 0 10) l2_10 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_10_18 : lstEq (lrun P cands 1 1 lf2 l2_10 10 18) l2_18 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_18_27 : lstEq (lrun P cands 1 1 lf2 l2_18 18 27) l2_27 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_27_32 : lstEq (lrun P cands 1 1 lf2 l2_27 27 32) l2_32 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_32_41 : lstEq (lrun P cands 1 1 lf2 l2_32 32 41) l2_41 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lr2_41_47 : lstEq (lrun P cands 1 1 lf2 l2_41 41 47) l2_47 = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem lface2 : faceFold P cands 1 1 lf2 (lInit P) = l2_47 := by
  have h : faceFold P cands 1 1 (lf2.drop 0) (lInit P) = l2_47 :=
    (lseg (by decide) lr2_0_10).trans <| (lseg (by decide) lr2_10_18).trans <| (lseg (by decide) lr2_18_27).trans <| (lseg (by decide) lr2_27_32).trans <| (lseg (by decide) lr2_32_41).trans <| (lseg (by decide) lr2_41_47).trans <| lfin (by decide +kernel)
  simpa using h

end PackLean.D30.K
