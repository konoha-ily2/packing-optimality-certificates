-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1079）を decide +kernel で。
import PackLean.D30.K.FarS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_65 : stEq (run P toks s_0 0 65) s_65 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_65_103 : stEq (run P toks s_65 65 103) s_103 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_103_155 : stEq (run P toks s_103 103 155) s_155 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_155_206 : stEq (run P toks s_155 155 206) s_206 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_206_245 : stEq (run P toks s_206 206 245) s_245 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_245_275 : stEq (run P toks s_245 245 275) s_275 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_275_315 : stEq (run P toks s_275 275 315) s_315 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_315_360 : stEq (run P toks s_315 315 360) s_360 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_360_403 : stEq (run P toks s_360 360 403) s_403 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_403_437 : stEq (run P toks s_403 403 437) s_437 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_437_471 : stEq (run P toks s_437 437 471) s_471 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_471_502 : stEq (run P toks s_471 471 502) s_502 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_502_535 : stEq (run P toks s_502 502 535) s_535 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_535_565 : stEq (run P toks s_535 535 565) s_565 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_565_596 : stEq (run P toks s_565 565 596) s_596 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_596_624 : stEq (run P toks s_596 596 624) s_624 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_624_655 : stEq (run P toks s_624 624 655) s_655 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_655_694 : stEq (run P toks s_655 655 694) s_694 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_694_722 : stEq (run P toks s_694 694 722) s_722 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_722_763 : stEq (run P toks s_722 722 763) s_763 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_763_798 : stEq (run P toks s_763 763 798) s_798 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_798_827 : stEq (run P toks s_798 798 827) s_827 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_827_863 : stEq (run P toks s_827 827 863) s_863 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_863_891 : stEq (run P toks s_863 863 891) s_891 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_891_919 : stEq (run P toks s_891 891 919) s_919 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_919_952 : stEq (run P toks s_919 919 952) s_952 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_952_980 : stEq (run P toks s_952 952 980) s_980 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_980_1012 : stEq (run P toks s_980 980 1012) s_1012 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1012_1047 : stEq (run P toks s_1012 1012 1047) s_1047 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1047_1079 : stEq (run P toks s_1047 1047 1079) s_1079 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1079 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1079).foldl (wstep P) s_1079 :=
  (seg (by decide) r_0_65).trans <| (seg (by decide) r_65_103).trans <| (seg (by decide) r_103_155).trans <| (seg (by decide) r_155_206).trans <| (seg (by decide) r_206_245).trans <| (seg (by decide) r_245_275).trans <| (seg (by decide) r_275_315).trans <| (seg (by decide) r_315_360).trans <| (seg (by decide) r_360_403).trans <| (seg (by decide) r_403_437).trans <| (seg (by decide) r_437_471).trans <| (seg (by decide) r_471_502).trans <| (seg (by decide) r_502_535).trans <| (seg (by decide) r_535_565).trans <| (seg (by decide) r_565_596).trans <| (seg (by decide) r_596_624).trans <| (seg (by decide) r_624_655).trans <| (seg (by decide) r_655_694).trans <| (seg (by decide) r_694_722).trans <| (seg (by decide) r_722_763).trans <| (seg (by decide) r_763_798).trans <| (seg (by decide) r_798_827).trans <| (seg (by decide) r_827_863).trans <| (seg (by decide) r_863_891).trans <| (seg (by decide) r_891_919).trans <| (seg (by decide) r_919_952).trans <| (seg (by decide) r_952_980).trans <| (seg (by decide) r_980_1012).trans <| (seg (by decide) r_1012_1047).trans <| seg (by decide) r_1047_1079

end PackLean.D30.K
