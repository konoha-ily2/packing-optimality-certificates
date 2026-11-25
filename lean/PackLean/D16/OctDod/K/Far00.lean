-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1139）を decide +kernel で。
import PackLean.D16.OctDod.K.FarS

namespace PackLean.D16.OctDod.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.OctDod

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_59 : stEq (run P toks s_0 0 59) s_59 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_59_100 : stEq (run P toks s_59 59 100) s_100 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_100_145 : stEq (run P toks s_100 100 145) s_145 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_145_182 : stEq (run P toks s_145 145 182) s_182 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_182_208 : stEq (run P toks s_182 182 208) s_208 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_208_241 : stEq (run P toks s_208 208 241) s_241 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_241_271 : stEq (run P toks s_241 241 271) s_271 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_271_300 : stEq (run P toks s_271 271 300) s_300 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_300_331 : stEq (run P toks s_300 300 331) s_331 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_331_384 : stEq (run P toks s_331 331 384) s_384 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_384_428 : stEq (run P toks s_384 384 428) s_428 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_428_473 : stEq (run P toks s_428 428 473) s_473 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_473_506 : stEq (run P toks s_473 473 506) s_506 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_506_537 : stEq (run P toks s_506 506 537) s_537 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_537_566 : stEq (run P toks s_537 537 566) s_566 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_566_607 : stEq (run P toks s_566 566 607) s_607 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_607_650 : stEq (run P toks s_607 607 650) s_650 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_650_718 : stEq (run P toks s_650 650 718) s_718 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_718_749 : stEq (run P toks s_718 718 749) s_749 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_749_779 : stEq (run P toks s_749 749 779) s_779 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_779_817 : stEq (run P toks s_779 779 817) s_817 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_817_844 : stEq (run P toks s_817 817 844) s_844 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_844_879 : stEq (run P toks s_844 844 879) s_879 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_879_910 : stEq (run P toks s_879 879 910) s_910 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_910_951 : stEq (run P toks s_910 910 951) s_951 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_951_993 : stEq (run P toks s_951 951 993) s_993 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_993_1031 : stEq (run P toks s_993 993 1031) s_1031 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1031_1059 : stEq (run P toks s_1031 1031 1059) s_1059 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1059_1106 : stEq (run P toks s_1059 1059 1106) s_1106 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1106_1139 : stEq (run P toks s_1106 1106 1139) s_1139 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1139 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1139).foldl (wstep P) s_1139 :=
  (seg (by decide) r_0_59).trans <| (seg (by decide) r_59_100).trans <| (seg (by decide) r_100_145).trans <| (seg (by decide) r_145_182).trans <| (seg (by decide) r_182_208).trans <| (seg (by decide) r_208_241).trans <| (seg (by decide) r_241_271).trans <| (seg (by decide) r_271_300).trans <| (seg (by decide) r_300_331).trans <| (seg (by decide) r_331_384).trans <| (seg (by decide) r_384_428).trans <| (seg (by decide) r_428_473).trans <| (seg (by decide) r_473_506).trans <| (seg (by decide) r_506_537).trans <| (seg (by decide) r_537_566).trans <| (seg (by decide) r_566_607).trans <| (seg (by decide) r_607_650).trans <| (seg (by decide) r_650_718).trans <| (seg (by decide) r_718_749).trans <| (seg (by decide) r_749_779).trans <| (seg (by decide) r_779_817).trans <| (seg (by decide) r_817_844).trans <| (seg (by decide) r_844_879).trans <| (seg (by decide) r_879_910).trans <| (seg (by decide) r_910_951).trans <| (seg (by decide) r_951_993).trans <| (seg (by decide) r_993_1031).trans <| (seg (by decide) r_1031_1059).trans <| (seg (by decide) r_1059_1106).trans <| seg (by decide) r_1106_1139

end PackLean.D16.OctDod.K
