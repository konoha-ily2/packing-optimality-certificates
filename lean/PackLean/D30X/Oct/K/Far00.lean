-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1021）を decide +kernel で。
import PackLean.D30X.Oct.K.FarS

namespace PackLean.D30X.Oct.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Oct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_71 : stEq (run P toks s_0 0 71) s_71 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_71_103 : stEq (run P toks s_71 71 103) s_103 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_103_143 : stEq (run P toks s_103 103 143) s_143 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_143_175 : stEq (run P toks s_143 143 175) s_175 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_175_209 : stEq (run P toks s_175 175 209) s_209 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_209_237 : stEq (run P toks s_209 209 237) s_237 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_237_285 : stEq (run P toks s_237 237 285) s_285 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_285_336 : stEq (run P toks s_285 285 336) s_336 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_336_368 : stEq (run P toks s_336 336 368) s_368 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_368_410 : stEq (run P toks s_368 368 410) s_410 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_410_440 : stEq (run P toks s_410 410 440) s_440 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_440_475 : stEq (run P toks s_440 440 475) s_475 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_475_504 : stEq (run P toks s_475 475 504) s_504 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_504_533 : stEq (run P toks s_504 504 533) s_533 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_533_564 : stEq (run P toks s_533 533 564) s_564 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_564_592 : stEq (run P toks s_564 564 592) s_592 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_592_629 : stEq (run P toks s_592 592 629) s_629 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_629_662 : stEq (run P toks s_629 629 662) s_662 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_662_693 : stEq (run P toks s_662 662 693) s_693 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_693_723 : stEq (run P toks s_693 693 723) s_723 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_723_755 : stEq (run P toks s_723 723 755) s_755 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_755_784 : stEq (run P toks s_755 755 784) s_784 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_784_811 : stEq (run P toks s_784 784 811) s_811 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_811_842 : stEq (run P toks s_811 811 842) s_842 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_842_874 : stEq (run P toks s_842 842 874) s_874 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_874_903 : stEq (run P toks s_874 874 903) s_903 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_903_933 : stEq (run P toks s_903 903 933) s_933 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_933_963 : stEq (run P toks s_933 933 963) s_963 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_963_990 : stEq (run P toks s_963 963 990) s_990 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_990_1021 : stEq (run P toks s_990 990 1021) s_1021 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1021 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1021).foldl (wstep P) s_1021 :=
  (seg (by decide) r_0_71).trans <| (seg (by decide) r_71_103).trans <| (seg (by decide) r_103_143).trans <| (seg (by decide) r_143_175).trans <| (seg (by decide) r_175_209).trans <| (seg (by decide) r_209_237).trans <| (seg (by decide) r_237_285).trans <| (seg (by decide) r_285_336).trans <| (seg (by decide) r_336_368).trans <| (seg (by decide) r_368_410).trans <| (seg (by decide) r_410_440).trans <| (seg (by decide) r_440_475).trans <| (seg (by decide) r_475_504).trans <| (seg (by decide) r_504_533).trans <| (seg (by decide) r_533_564).trans <| (seg (by decide) r_564_592).trans <| (seg (by decide) r_592_629).trans <| (seg (by decide) r_629_662).trans <| (seg (by decide) r_662_693).trans <| (seg (by decide) r_693_723).trans <| (seg (by decide) r_723_755).trans <| (seg (by decide) r_755_784).trans <| (seg (by decide) r_784_811).trans <| (seg (by decide) r_811_842).trans <| (seg (by decide) r_842_874).trans <| (seg (by decide) r_874_903).trans <| (seg (by decide) r_903_933).trans <| (seg (by decide) r_933_963).trans <| (seg (by decide) r_963_990).trans <| seg (by decide) r_990_1021

end PackLean.D30X.Oct.K
