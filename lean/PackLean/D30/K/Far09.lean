-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 270〜295（歩 9051〜9978）を decide +kernel で。
import PackLean.D30.K.FarS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9051_9078 : stEq (run P toks s_9051 9051 9078) s_9078 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9078_9110 : stEq (run P toks s_9078 9078 9110) s_9110 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9110_9143 : stEq (run P toks s_9110 9110 9143) s_9143 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9143_9170 : stEq (run P toks s_9143 9143 9170) s_9170 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9170_9201 : stEq (run P toks s_9170 9170 9201) s_9201 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9201_9231 : stEq (run P toks s_9201 9201 9231) s_9231 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9231_9275 : stEq (run P toks s_9231 9231 9275) s_9275 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9275_9316 : stEq (run P toks s_9275 9275 9316) s_9316 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9316_9362 : stEq (run P toks s_9316 9316 9362) s_9362 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9362_9399 : stEq (run P toks s_9362 9362 9399) s_9399 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9399_9437 : stEq (run P toks s_9399 9399 9437) s_9437 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9437_9509 : stEq (run P toks s_9437 9437 9509) s_9509 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9509_9541 : stEq (run P toks s_9509 9509 9541) s_9541 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9541_9570 : stEq (run P toks s_9541 9541 9570) s_9570 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9570_9598 : stEq (run P toks s_9570 9570 9598) s_9598 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9598_9630 : stEq (run P toks s_9598 9598 9630) s_9630 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9630_9657 : stEq (run P toks s_9630 9630 9657) s_9657 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9657_9690 : stEq (run P toks s_9657 9657 9690) s_9690 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9690_9717 : stEq (run P toks s_9690 9690 9717) s_9717 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9717_9749 : stEq (run P toks s_9717 9717 9749) s_9749 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9749_9787 : stEq (run P toks s_9749 9749 9787) s_9787 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9787_9817 : stEq (run P toks s_9787 9787 9817) s_9817 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9817_9857 : stEq (run P toks s_9817 9817 9857) s_9857 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9857_9904 : stEq (run P toks s_9857 9857 9904) s_9904 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9904_9967 : stEq (run P toks s_9904 9904 9967) s_9967 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_9967_9978 : stEq (run P toks s_9967 9967 9978) s_9978 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 9051 から歩 9978 まで（区間 26 本をつないだもの）。 -/
theorem f09 : (toks.drop 9051).foldl (wstep P) s_9051 = (toks.drop 9978).foldl (wstep P) s_9978 :=
  (seg (by decide) r_9051_9078).trans <| (seg (by decide) r_9078_9110).trans <| (seg (by decide) r_9110_9143).trans <| (seg (by decide) r_9143_9170).trans <| (seg (by decide) r_9170_9201).trans <| (seg (by decide) r_9201_9231).trans <| (seg (by decide) r_9231_9275).trans <| (seg (by decide) r_9275_9316).trans <| (seg (by decide) r_9316_9362).trans <| (seg (by decide) r_9362_9399).trans <| (seg (by decide) r_9399_9437).trans <| (seg (by decide) r_9437_9509).trans <| (seg (by decide) r_9509_9541).trans <| (seg (by decide) r_9541_9570).trans <| (seg (by decide) r_9570_9598).trans <| (seg (by decide) r_9598_9630).trans <| (seg (by decide) r_9630_9657).trans <| (seg (by decide) r_9657_9690).trans <| (seg (by decide) r_9690_9717).trans <| (seg (by decide) r_9717_9749).trans <| (seg (by decide) r_9749_9787).trans <| (seg (by decide) r_9787_9817).trans <| (seg (by decide) r_9817_9857).trans <| (seg (by decide) r_9857_9904).trans <| (seg (by decide) r_9904_9967).trans <| seg (by decide) r_9967_9978

end PackLean.D30.K
