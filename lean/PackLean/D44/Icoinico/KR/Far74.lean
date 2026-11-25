-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：区間 2220〜2228（歩 67597〜67934）を wstepR で decide +kernel。
import PackLean.D44.Icoinico.KR.FarH

namespace PackLean.D44.Icoinico.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Icoinico PackLean.D44.Icoinico.K PackLean.D44.Icoinico.KR

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67597_67627 : stEq (runR P sbR toks s_67597 67597 67627) s_67627 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67627_67660 : stEq (runR P sbR toks s_67627 67627 67660) s_67660 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67660_67694 : stEq (runR P sbR toks s_67660 67660 67694) s_67694 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67694_67743 : stEq (runR P sbR toks s_67694 67694 67743) s_67743 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67743_67787 : stEq (runR P sbR toks s_67743 67743 67787) s_67787 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67787_67827 : stEq (runR P sbR toks s_67787 67787 67827) s_67827 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67827_67863 : stEq (runR P sbR toks s_67827 67827 67863) s_67863 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67863_67916 : stEq (runR P sbR toks s_67863 67863 67916) s_67916 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_67916_67934 : stEq (runR P sbR toks s_67916 67916 67934) s_67934 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 67597 から歩 67934 まで（区間 9 本をつないだもの）。 -/
theorem f74 : (toks.drop 67597).foldl (wstepR P sbR) s_67597 = (toks.drop 67934).foldl (wstepR P sbR) s_67934 :=
  (segR (by decide) r_67597_67627).trans <| (segR (by decide) r_67627_67660).trans <| (segR (by decide) r_67660_67694).trans <| (segR (by decide) r_67694_67743).trans <| (segR (by decide) r_67743_67787).trans <| (segR (by decide) r_67787_67827).trans <| (segR (by decide) r_67827_67863).trans <| (segR (by decide) r_67863_67916).trans <| segR (by decide) r_67916_67934

end PackLean.D44.Icoinico.KR
