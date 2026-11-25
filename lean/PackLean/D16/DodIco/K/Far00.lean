-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1092）を decide +kernel で。
import PackLean.D16.DodIco.K.FarS

namespace PackLean.D16.DodIco.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.DodIco

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_72 : stEq (run P toks s_0 0 72) s_72 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_72_108 : stEq (run P toks s_72 72 108) s_108 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_108_138 : stEq (run P toks s_108 108 138) s_138 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_138_173 : stEq (run P toks s_138 138 173) s_173 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_173_209 : stEq (run P toks s_173 173 209) s_209 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_209_246 : stEq (run P toks s_209 209 246) s_246 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_246_279 : stEq (run P toks s_246 246 279) s_279 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_279_309 : stEq (run P toks s_279 279 309) s_309 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_309_337 : stEq (run P toks s_309 309 337) s_337 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_337_372 : stEq (run P toks s_337 337 372) s_372 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_372_400 : stEq (run P toks s_372 372 400) s_400 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_400_439 : stEq (run P toks s_400 400 439) s_439 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_439_478 : stEq (run P toks s_439 439 478) s_478 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_478_536 : stEq (run P toks s_478 478 536) s_536 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_536_570 : stEq (run P toks s_536 536 570) s_570 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_570_600 : stEq (run P toks s_570 570 600) s_600 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_600_634 : stEq (run P toks s_600 600 634) s_634 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_634_678 : stEq (run P toks s_634 634 678) s_678 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_678_729 : stEq (run P toks s_678 678 729) s_729 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_729_765 : stEq (run P toks s_729 729 765) s_765 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_765_804 : stEq (run P toks s_765 765 804) s_804 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_804_831 : stEq (run P toks s_804 804 831) s_831 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_831_879 : stEq (run P toks s_831 831 879) s_879 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_879_912 : stEq (run P toks s_879 879 912) s_912 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_912_941 : stEq (run P toks s_912 912 941) s_941 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_941_974 : stEq (run P toks s_941 941 974) s_974 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_974_1006 : stEq (run P toks s_974 974 1006) s_1006 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1006_1035 : stEq (run P toks s_1006 1006 1035) s_1035 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1035_1061 : stEq (run P toks s_1035 1035 1061) s_1061 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1061_1092 : stEq (run P toks s_1061 1061 1092) s_1092 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1092 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1092).foldl (wstep P) s_1092 :=
  (seg (by decide) r_0_72).trans <| (seg (by decide) r_72_108).trans <| (seg (by decide) r_108_138).trans <| (seg (by decide) r_138_173).trans <| (seg (by decide) r_173_209).trans <| (seg (by decide) r_209_246).trans <| (seg (by decide) r_246_279).trans <| (seg (by decide) r_279_309).trans <| (seg (by decide) r_309_337).trans <| (seg (by decide) r_337_372).trans <| (seg (by decide) r_372_400).trans <| (seg (by decide) r_400_439).trans <| (seg (by decide) r_439_478).trans <| (seg (by decide) r_478_536).trans <| (seg (by decide) r_536_570).trans <| (seg (by decide) r_570_600).trans <| (seg (by decide) r_600_634).trans <| (seg (by decide) r_634_678).trans <| (seg (by decide) r_678_729).trans <| (seg (by decide) r_729_765).trans <| (seg (by decide) r_765_804).trans <| (seg (by decide) r_804_831).trans <| (seg (by decide) r_831_879).trans <| (seg (by decide) r_879_912).trans <| (seg (by decide) r_912_941).trans <| (seg (by decide) r_941_974).trans <| (seg (by decide) r_974_1006).trans <| (seg (by decide) r_1006_1035).trans <| (seg (by decide) r_1035_1061).trans <| seg (by decide) r_1061_1092

end PackLean.D16.DodIco.K
