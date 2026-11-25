-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 60〜63（歩 2069〜2212）を decide +kernel で。
import PackLean.D16.IcoDod.K.FarS

namespace PackLean.D16.IcoDod.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoDod

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2069_2101 : stEq (run P toks s_2069 2069 2101) s_2101 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2101_2136 : stEq (run P toks s_2101 2101 2136) s_2136 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2136_2175 : stEq (run P toks s_2136 2136 2175) s_2175 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2175_2212 : stEq (run P toks s_2175 2175 2212) s_2212 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 2069 から歩 2212 まで（区間 4 本をつないだもの）。 -/
theorem f02 : (toks.drop 2069).foldl (wstep P) s_2069 = (toks.drop 2212).foldl (wstep P) s_2212 :=
  (seg (by decide) r_2069_2101).trans <| (seg (by decide) r_2101_2136).trans <| (seg (by decide) r_2136_2175).trans <| seg (by decide) r_2175_2212

end PackLean.D16.IcoDod.K
