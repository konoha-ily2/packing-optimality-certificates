-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1071）を decide +kernel で。
import PackLean.D16.IcoCub.K.FarS

namespace PackLean.D16.IcoCub.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoCub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_74 : stEq (run P toks s_0 0 74) s_74 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_74_132 : stEq (run P toks s_74 74 132) s_132 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_132_172 : stEq (run P toks s_132 132 172) s_172 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_172_208 : stEq (run P toks s_172 172 208) s_208 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_208_238 : stEq (run P toks s_208 208 238) s_238 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_238_272 : stEq (run P toks s_238 238 272) s_272 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_272_312 : stEq (run P toks s_272 272 312) s_312 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_312_342 : stEq (run P toks s_312 312 342) s_342 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_342_371 : stEq (run P toks s_342 342 371) s_371 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_371_405 : stEq (run P toks s_371 371 405) s_405 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_405_437 : stEq (run P toks s_405 405 437) s_437 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_437_466 : stEq (run P toks s_437 437 466) s_466 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_466_497 : stEq (run P toks s_466 466 497) s_497 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_497_526 : stEq (run P toks s_497 497 526) s_526 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_526_557 : stEq (run P toks s_526 526 557) s_557 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_557_610 : stEq (run P toks s_557 557 610) s_610 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_610_643 : stEq (run P toks s_610 610 643) s_643 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_643_680 : stEq (run P toks s_643 643 680) s_680 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_680_714 : stEq (run P toks s_680 680 714) s_714 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_714_745 : stEq (run P toks s_714 714 745) s_745 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_745_773 : stEq (run P toks s_745 745 773) s_773 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_773_804 : stEq (run P toks s_773 773 804) s_804 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_804_834 : stEq (run P toks s_804 804 834) s_834 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_834_864 : stEq (run P toks s_834 834 864) s_864 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_864_892 : stEq (run P toks s_864 864 892) s_892 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_892_944 : stEq (run P toks s_892 892 944) s_944 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_944_977 : stEq (run P toks s_944 944 977) s_977 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_977_1011 : stEq (run P toks s_977 977 1011) s_1011 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1011_1039 : stEq (run P toks s_1011 1011 1039) s_1039 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1039_1071 : stEq (run P toks s_1039 1039 1071) s_1071 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1071 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1071).foldl (wstep P) s_1071 :=
  (seg (by decide) r_0_74).trans <| (seg (by decide) r_74_132).trans <| (seg (by decide) r_132_172).trans <| (seg (by decide) r_172_208).trans <| (seg (by decide) r_208_238).trans <| (seg (by decide) r_238_272).trans <| (seg (by decide) r_272_312).trans <| (seg (by decide) r_312_342).trans <| (seg (by decide) r_342_371).trans <| (seg (by decide) r_371_405).trans <| (seg (by decide) r_405_437).trans <| (seg (by decide) r_437_466).trans <| (seg (by decide) r_466_497).trans <| (seg (by decide) r_497_526).trans <| (seg (by decide) r_526_557).trans <| (seg (by decide) r_557_610).trans <| (seg (by decide) r_610_643).trans <| (seg (by decide) r_643_680).trans <| (seg (by decide) r_680_714).trans <| (seg (by decide) r_714_745).trans <| (seg (by decide) r_745_773).trans <| (seg (by decide) r_773_804).trans <| (seg (by decide) r_804_834).trans <| (seg (by decide) r_834_864).trans <| (seg (by decide) r_864_892).trans <| (seg (by decide) r_892_944).trans <| (seg (by decide) r_944_977).trans <| (seg (by decide) r_977_1011).trans <| (seg (by decide) r_1011_1039).trans <| seg (by decide) r_1039_1071

end PackLean.D16.IcoCub.K
