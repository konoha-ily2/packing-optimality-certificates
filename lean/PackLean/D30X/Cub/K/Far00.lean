-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 0〜29（歩 0〜1049）を decide +kernel で。
import PackLean.D30X.Cub.K.FarS

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D16.KSegW PackLean.D30X.Cub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_0_63 : stEq (run P toks s_0 0 63) s_63 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_63_107 : stEq (run P toks s_63 63 107) s_107 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_107_150 : stEq (run P toks s_107 107 150) s_150 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_150_179 : stEq (run P toks s_150 150 179) s_179 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_179_208 : stEq (run P toks s_179 179 208) s_208 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_208_238 : stEq (run P toks s_208 208 238) s_238 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_238_268 : stEq (run P toks s_238 238 268) s_268 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_268_301 : stEq (run P toks s_268 268 301) s_301 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_301_328 : stEq (run P toks s_301 301 328) s_328 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_328_360 : stEq (run P toks s_328 328 360) s_360 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_360_388 : stEq (run P toks s_360 360 388) s_388 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_388_418 : stEq (run P toks s_388 388 418) s_418 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_418_469 : stEq (run P toks s_418 418 469) s_469 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_469_510 : stEq (run P toks s_469 469 510) s_510 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_510_550 : stEq (run P toks s_510 510 550) s_550 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_550_583 : stEq (run P toks s_550 550 583) s_583 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_583_620 : stEq (run P toks s_583 583 620) s_620 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_620_651 : stEq (run P toks s_620 620 651) s_651 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_651_690 : stEq (run P toks s_651 651 690) s_690 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_690_720 : stEq (run P toks s_690 690 720) s_720 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_720_755 : stEq (run P toks s_720 720 755) s_755 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_755_791 : stEq (run P toks s_755 755 791) s_791 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_791_829 : stEq (run P toks s_791 791 829) s_829 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_829_857 : stEq (run P toks s_829 829 857) s_857 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_857_892 : stEq (run P toks s_857 857 892) s_892 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_892_921 : stEq (run P toks s_892 892 921) s_921 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_921_950 : stEq (run P toks s_921 921 950) s_950 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_950_979 : stEq (run P toks s_950 950 979) s_979 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_979_1009 : stEq (run P toks s_979 979 1009) s_1009 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1009_1049 : stEq (run P toks s_1009 1009 1049) s_1049 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 0 から歩 1049 まで（区間 30 本をつないだもの）。 -/
theorem f00 : (toks.drop 0).foldl (wstep P) s_0 = (toks.drop 1049).foldl (wstep P) s_1049 :=
  (seg (by decide) r_0_63).trans <| (seg (by decide) r_63_107).trans <| (seg (by decide) r_107_150).trans <| (seg (by decide) r_150_179).trans <| (seg (by decide) r_179_208).trans <| (seg (by decide) r_208_238).trans <| (seg (by decide) r_238_268).trans <| (seg (by decide) r_268_301).trans <| (seg (by decide) r_301_328).trans <| (seg (by decide) r_328_360).trans <| (seg (by decide) r_360_388).trans <| (seg (by decide) r_388_418).trans <| (seg (by decide) r_418_469).trans <| (seg (by decide) r_469_510).trans <| (seg (by decide) r_510_550).trans <| (seg (by decide) r_550_583).trans <| (seg (by decide) r_583_620).trans <| (seg (by decide) r_620_651).trans <| (seg (by decide) r_651_690).trans <| (seg (by decide) r_690_720).trans <| (seg (by decide) r_720_755).trans <| (seg (by decide) r_755_791).trans <| (seg (by decide) r_791_829).trans <| (seg (by decide) r_829_857).trans <| (seg (by decide) r_857_892).trans <| (seg (by decide) r_892_921).trans <| (seg (by decide) r_921_950).trans <| (seg (by decide) r_950_979).trans <| (seg (by decide) r_979_1009).trans <| seg (by decide) r_1009_1049

end PackLean.D30X.Cub.K
