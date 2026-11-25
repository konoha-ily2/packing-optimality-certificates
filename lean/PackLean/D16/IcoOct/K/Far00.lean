-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1092）を decide +kernel で。
import PackLean.D16.IcoOct.K.FarS

namespace PackLean.D16.IcoOct.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoOct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_69 : stEq (run P toks s_0 0 69) s_69 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_69_104 : stEq (run P toks s_69 69 104) s_104 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_104_138 : stEq (run P toks s_104 104 138) s_138 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_138_171 : stEq (run P toks s_138 138 171) s_171 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_171_201 : stEq (run P toks s_171 171 201) s_201 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_201_229 : stEq (run P toks s_201 201 229) s_229 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_229_258 : stEq (run P toks s_229 229 258) s_258 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_258_287 : stEq (run P toks s_258 258 287) s_287 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_287_332 : stEq (run P toks s_287 287 332) s_332 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_332_367 : stEq (run P toks s_332 332 367) s_367 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_367_407 : stEq (run P toks s_367 367 407) s_407 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_407_442 : stEq (run P toks s_407 407 442) s_442 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_442_473 : stEq (run P toks s_442 442 473) s_473 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_473_521 : stEq (run P toks s_473 473 521) s_521 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_521_560 : stEq (run P toks s_521 521 560) s_560 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_560_601 : stEq (run P toks s_560 560 601) s_601 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_601_630 : stEq (run P toks s_601 601 630) s_630 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_630_658 : stEq (run P toks s_630 630 658) s_658 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_658_692 : stEq (run P toks s_658 658 692) s_692 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_692_719 : stEq (run P toks s_692 692 719) s_719 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_719_749 : stEq (run P toks s_719 719 749) s_749 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_749_799 : stEq (run P toks s_749 749 799) s_799 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_799_833 : stEq (run P toks s_799 799 833) s_833 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_833_878 : stEq (run P toks s_833 833 878) s_878 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_878_910 : stEq (run P toks s_878 878 910) s_910 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_910_944 : stEq (run P toks s_910 910 944) s_944 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_944_988 : stEq (run P toks s_944 944 988) s_988 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_988_1021 : stEq (run P toks s_988 988 1021) s_1021 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1021_1062 : stEq (run P toks s_1021 1021 1062) s_1062 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1062_1092 : stEq (run P toks s_1062 1062 1092) s_1092 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1092 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1092).foldl (wstep P) s_1092 :=
  (seg (by decide) r_0_69).trans <| (seg (by decide) r_69_104).trans <| (seg (by decide) r_104_138).trans <| (seg (by decide) r_138_171).trans <| (seg (by decide) r_171_201).trans <| (seg (by decide) r_201_229).trans <| (seg (by decide) r_229_258).trans <| (seg (by decide) r_258_287).trans <| (seg (by decide) r_287_332).trans <| (seg (by decide) r_332_367).trans <| (seg (by decide) r_367_407).trans <| (seg (by decide) r_407_442).trans <| (seg (by decide) r_442_473).trans <| (seg (by decide) r_473_521).trans <| (seg (by decide) r_521_560).trans <| (seg (by decide) r_560_601).trans <| (seg (by decide) r_601_630).trans <| (seg (by decide) r_630_658).trans <| (seg (by decide) r_658_692).trans <| (seg (by decide) r_692_719).trans <| (seg (by decide) r_719_749).trans <| (seg (by decide) r_749_799).trans <| (seg (by decide) r_799_833).trans <| (seg (by decide) r_833_878).trans <| (seg (by decide) r_878_910).trans <| (seg (by decide) r_910_944).trans <| (seg (by decide) r_944_988).trans <| (seg (by decide) r_988_1021).trans <| (seg (by decide) r_1021_1062).trans <| seg (by decide) r_1062_1092

end PackLean.D16.IcoOct.K
