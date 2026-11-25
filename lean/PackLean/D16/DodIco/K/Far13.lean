-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 区間 390〜391（歩 13281〜13364）を decide +kernel で。
import PackLean.D16.DodIco.K.FarS

namespace PackLean.D16.DodIco.K
open PackLean.D28 PackLean.D16 PackLean.D16.KSegW PackLean.D16.DodIco

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_13281_13342 : stEq (run P toks s_13281 13281 13342) s_13342 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_13342_13364 : stEq (run P toks s_13342 13342 13364) s_13364 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 13281 から歩 13364 まで（区間 2 本をつないだもの）。 -/
theorem f13 : (toks.drop 13281).foldl (wstep P) s_13281 = (toks.drop 13364).foldl (wstep P) s_13364 :=
  (seg (by decide) r_13281_13342).trans <| seg (by decide) r_13342_13364

end PackLean.D16.DodIco.K
