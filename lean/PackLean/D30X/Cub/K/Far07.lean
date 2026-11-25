-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 210〜231（歩 6853〜7604）を decide +kernel で。
import PackLean.D30X.Cub.K.FarS

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Cub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_6853_6887 : stEq (run P toks s_6853 6853 6887) s_6887 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_6887_6915 : stEq (run P toks s_6887 6887 6915) s_6915 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_6915_6945 : stEq (run P toks s_6915 6915 6945) s_6945 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_6945_6978 : stEq (run P toks s_6945 6945 6978) s_6978 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_6978_7006 : stEq (run P toks s_6978 6978 7006) s_7006 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7006_7035 : stEq (run P toks s_7006 7006 7035) s_7035 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7035_7067 : stEq (run P toks s_7035 7035 7067) s_7067 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7067_7110 : stEq (run P toks s_7067 7067 7110) s_7110 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7110_7155 : stEq (run P toks s_7110 7110 7155) s_7155 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7155_7182 : stEq (run P toks s_7155 7155 7182) s_7182 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7182_7211 : stEq (run P toks s_7182 7182 7211) s_7211 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7211_7241 : stEq (run P toks s_7211 7211 7241) s_7241 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7241_7276 : stEq (run P toks s_7241 7241 7276) s_7276 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7276_7310 : stEq (run P toks s_7276 7276 7310) s_7310 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7310_7340 : stEq (run P toks s_7310 7310 7340) s_7340 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7340_7369 : stEq (run P toks s_7340 7340 7369) s_7369 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7369_7402 : stEq (run P toks s_7369 7369 7402) s_7402 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7402_7436 : stEq (run P toks s_7402 7402 7436) s_7436 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7436_7475 : stEq (run P toks s_7436 7436 7475) s_7475 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7475_7508 : stEq (run P toks s_7475 7475 7508) s_7508 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7508_7541 : stEq (run P toks s_7508 7508 7541) s_7541 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_7541_7604 : stEq (run P toks s_7541 7541 7604) s_7604 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 6853 から歩 7604 まで（区間 22 本をつないだもの）。 -/
theorem f07 : (toks.drop 6853).foldl (wstep P) s_6853 = (toks.drop 7604).foldl (wstep P) s_7604 :=
  (seg (by decide) r_6853_6887).trans <| (seg (by decide) r_6887_6915).trans <| (seg (by decide) r_6915_6945).trans <| (seg (by decide) r_6945_6978).trans <| (seg (by decide) r_6978_7006).trans <| (seg (by decide) r_7006_7035).trans <| (seg (by decide) r_7035_7067).trans <| (seg (by decide) r_7067_7110).trans <| (seg (by decide) r_7110_7155).trans <| (seg (by decide) r_7155_7182).trans <| (seg (by decide) r_7182_7211).trans <| (seg (by decide) r_7211_7241).trans <| (seg (by decide) r_7241_7276).trans <| (seg (by decide) r_7276_7310).trans <| (seg (by decide) r_7310_7340).trans <| (seg (by decide) r_7340_7369).trans <| (seg (by decide) r_7369_7402).trans <| (seg (by decide) r_7402_7436).trans <| (seg (by decide) r_7436_7475).trans <| (seg (by decide) r_7475_7508).trans <| (seg (by decide) r_7508_7541).trans <| seg (by decide) r_7541_7604

end PackLean.D30X.Cub.K
