-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1039）を decide +kernel で。
import PackLean.D16.IcoDod.K.FarS

namespace PackLean.D16.IcoDod.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoDod

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_54 : stEq (run P toks s_0 0 54) s_54 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_54_90 : stEq (run P toks s_54 54 90) s_90 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_90_123 : stEq (run P toks s_90 90 123) s_123 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_123_158 : stEq (run P toks s_123 123 158) s_158 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_158_186 : stEq (run P toks s_158 158 186) s_186 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_186_216 : stEq (run P toks s_186 186 216) s_216 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_216_247 : stEq (run P toks s_216 216 247) s_247 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_247_275 : stEq (run P toks s_247 247 275) s_275 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_275_329 : stEq (run P toks s_275 275 329) s_329 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_329_361 : stEq (run P toks s_329 329 361) s_361 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_361_396 : stEq (run P toks s_361 361 396) s_396 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_396_428 : stEq (run P toks s_396 396 428) s_428 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_428_456 : stEq (run P toks s_428 428 456) s_456 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_456_491 : stEq (run P toks s_456 456 491) s_491 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_491_541 : stEq (run P toks s_491 491 541) s_541 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_541_574 : stEq (run P toks s_541 541 574) s_574 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_574_611 : stEq (run P toks s_574 574 611) s_611 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_611_642 : stEq (run P toks s_611 611 642) s_642 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_642_670 : stEq (run P toks s_642 642 670) s_670 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_670_702 : stEq (run P toks s_670 670 702) s_702 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_702_734 : stEq (run P toks s_702 702 734) s_734 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_734_765 : stEq (run P toks s_734 734 765) s_765 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_765_811 : stEq (run P toks s_765 765 811) s_811 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_811_845 : stEq (run P toks s_811 811 845) s_845 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_845_877 : stEq (run P toks s_845 845 877) s_877 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_877_908 : stEq (run P toks s_877 877 908) s_908 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_908_937 : stEq (run P toks s_908 908 937) s_937 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_937_967 : stEq (run P toks s_937 937 967) s_967 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_967_1001 : stEq (run P toks s_967 967 1001) s_1001 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1001_1039 : stEq (run P toks s_1001 1001 1039) s_1039 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1039 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1039).foldl (wstep P) s_1039 :=
  (seg (by decide) r_0_54).trans <| (seg (by decide) r_54_90).trans <| (seg (by decide) r_90_123).trans <| (seg (by decide) r_123_158).trans <| (seg (by decide) r_158_186).trans <| (seg (by decide) r_186_216).trans <| (seg (by decide) r_216_247).trans <| (seg (by decide) r_247_275).trans <| (seg (by decide) r_275_329).trans <| (seg (by decide) r_329_361).trans <| (seg (by decide) r_361_396).trans <| (seg (by decide) r_396_428).trans <| (seg (by decide) r_428_456).trans <| (seg (by decide) r_456_491).trans <| (seg (by decide) r_491_541).trans <| (seg (by decide) r_541_574).trans <| (seg (by decide) r_574_611).trans <| (seg (by decide) r_611_642).trans <| (seg (by decide) r_642_670).trans <| (seg (by decide) r_670_702).trans <| (seg (by decide) r_702_734).trans <| (seg (by decide) r_734_765).trans <| (seg (by decide) r_765_811).trans <| (seg (by decide) r_811_845).trans <| (seg (by decide) r_845_877).trans <| (seg (by decide) r_877_908).trans <| (seg (by decide) r_908_937).trans <| (seg (by decide) r_937_967).trans <| (seg (by decide) r_967_1001).trans <| seg (by decide) r_1001_1039

end PackLean.D16.IcoDod.K
