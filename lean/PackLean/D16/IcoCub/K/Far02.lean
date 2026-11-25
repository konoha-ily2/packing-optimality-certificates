-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 60〜76（歩 2045〜2610）を decide +kernel で。
import PackLean.D16.IcoCub.K.FarS

namespace PackLean.D16.IcoCub.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoCub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2045_2093 : stEq (run P toks s_2045 2045 2093) s_2093 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2093_2121 : stEq (run P toks s_2093 2093 2121) s_2121 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2121_2155 : stEq (run P toks s_2121 2121 2155) s_2155 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2155_2187 : stEq (run P toks s_2155 2155 2187) s_2187 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2187_2216 : stEq (run P toks s_2187 2187 2216) s_2216 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2216_2243 : stEq (run P toks s_2216 2216 2243) s_2243 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2243_2273 : stEq (run P toks s_2243 2243 2273) s_2273 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2273_2304 : stEq (run P toks s_2273 2273 2304) s_2304 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2304_2344 : stEq (run P toks s_2304 2304 2344) s_2344 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2344_2398 : stEq (run P toks s_2344 2344 2398) s_2398 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2398_2427 : stEq (run P toks s_2398 2398 2427) s_2427 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2427_2456 : stEq (run P toks s_2427 2427 2456) s_2456 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2456_2484 : stEq (run P toks s_2456 2456 2484) s_2484 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2484_2519 : stEq (run P toks s_2484 2484 2519) s_2519 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2519_2556 : stEq (run P toks s_2519 2519 2556) s_2556 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2556_2604 : stEq (run P toks s_2556 2556 2604) s_2604 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_2604_2610 : stEq (run P toks s_2604 2604 2610) s_2610 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 2045 から歩 2610 まで（区間 17 本をつないだもの）。 -/
theorem f02 : (toks.drop 2045).foldl (wstep P) s_2045 = (toks.drop 2610).foldl (wstep P) s_2610 :=
  (seg (by decide) r_2045_2093).trans <| (seg (by decide) r_2093_2121).trans <| (seg (by decide) r_2121_2155).trans <| (seg (by decide) r_2155_2187).trans <| (seg (by decide) r_2187_2216).trans <| (seg (by decide) r_2216_2243).trans <| (seg (by decide) r_2243_2273).trans <| (seg (by decide) r_2273_2304).trans <| (seg (by decide) r_2304_2344).trans <| (seg (by decide) r_2344_2398).trans <| (seg (by decide) r_2398_2427).trans <| (seg (by decide) r_2427_2456).trans <| (seg (by decide) r_2456_2484).trans <| (seg (by decide) r_2484_2519).trans <| (seg (by decide) r_2519_2556).trans <| (seg (by decide) r_2556_2604).trans <| seg (by decide) r_2604_2610

end PackLean.D16.IcoCub.K
