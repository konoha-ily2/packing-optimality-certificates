-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 120〜130（歩 4172〜4608）を decide +kernel で。
import PackLean.D16.OctDod.K.FarS

namespace PackLean.D16.OctDod.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.OctDod

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4172_4206 : stEq (run P toks s_4172 4172 4206) s_4206 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4206_4252 : stEq (run P toks s_4206 4206 4252) s_4252 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4252_4286 : stEq (run P toks s_4252 4252 4286) s_4286 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4286_4321 : stEq (run P toks s_4286 4286 4321) s_4321 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4321_4364 : stEq (run P toks s_4321 4321 4364) s_4364 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4364_4400 : stEq (run P toks s_4364 4364 4400) s_4400 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4400_4435 : stEq (run P toks s_4400 4400 4435) s_4435 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4435_4470 : stEq (run P toks s_4435 4435 4470) s_4470 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4470_4512 : stEq (run P toks s_4470 4470 4512) s_4512 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4512_4560 : stEq (run P toks s_4512 4512 4560) s_4560 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_4560_4608 : stEq (run P toks s_4560 4560 4608) s_4608 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 4172 から歩 4608 まで（区間 11 本をつないだもの）。 -/
theorem f04 : (toks.drop 4172).foldl (wstep P) s_4172 = (toks.drop 4608).foldl (wstep P) s_4608 :=
  (seg (by decide) r_4172_4206).trans <| (seg (by decide) r_4206_4252).trans <| (seg (by decide) r_4252_4286).trans <| (seg (by decide) r_4286_4321).trans <| (seg (by decide) r_4321_4364).trans <| (seg (by decide) r_4364_4400).trans <| (seg (by decide) r_4400_4435).trans <| (seg (by decide) r_4435_4470).trans <| (seg (by decide) r_4470_4512).trans <| (seg (by decide) r_4512_4560).trans <| seg (by decide) r_4560_4608

end PackLean.D16.OctDod.K
