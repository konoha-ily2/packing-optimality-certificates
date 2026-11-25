-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 30〜30（歩 1092〜1136）を decide +kernel で。
import PackLean.D16.IcoOct.K.FarS

namespace PackLean.D16.IcoOct.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.IcoOct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_1092_1136 : stEq (run P toks s_1092 1092 1136) s_1136 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 1092 から歩 1136 まで（区間 1 本をつないだもの）。 -/
theorem f01 : (toks.drop 1092).foldl (wstep P) s_1092 = (toks.drop 1136).foldl (wstep P) s_1136 :=
  seg (by decide) r_1092_1136

end PackLean.D16.IcoOct.K
