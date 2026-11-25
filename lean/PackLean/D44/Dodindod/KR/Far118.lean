-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：区間 3540〜3550（歩 110239〜110666）を wstepR で decide +kernel。
import PackLean.D44.Dodindod.KR.FarH

namespace PackLean.D44.Dodindod.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Dodindod PackLean.D44.Dodindod.K PackLean.D44.Dodindod.KR

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110239_110290 : stEq (runR P sbR toks s_110239 110239 110290) s_110290 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110290_110324 : stEq (runR P sbR toks s_110290 110290 110324) s_110324 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110324_110358 : stEq (runR P sbR toks s_110324 110324 110358) s_110358 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110358_110390 : stEq (runR P sbR toks s_110358 110358 110390) s_110390 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110390_110419 : stEq (runR P sbR toks s_110390 110390 110419) s_110419 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110419_110460 : stEq (runR P sbR toks s_110419 110419 110460) s_110460 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110460_110511 : stEq (runR P sbR toks s_110460 110460 110511) s_110511 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110511_110552 : stEq (runR P sbR toks s_110511 110511 110552) s_110552 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110552_110589 : stEq (runR P sbR toks s_110552 110552 110589) s_110589 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110589_110647 : stEq (runR P sbR toks s_110589 110589 110647) s_110647 = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_110647_110666 : stEq (runR P sbR toks s_110647 110647 110666) s_110666 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 110239 から歩 110666 まで（区間 11 本をつないだもの）。 -/
theorem f118 : (toks.drop 110239).foldl (wstepR P sbR) s_110239 = (toks.drop 110666).foldl (wstepR P sbR) s_110666 :=
  (segR (by decide) r_110239_110290).trans <| (segR (by decide) r_110290_110324).trans <| (segR (by decide) r_110324_110358).trans <| (segR (by decide) r_110358_110390).trans <| (segR (by decide) r_110390_110419).trans <| (segR (by decide) r_110419_110460).trans <| (segR (by decide) r_110460_110511).trans <| (segR (by decide) r_110511_110552).trans <| (segR (by decide) r_110552_110589).trans <| (segR (by decide) r_110589_110647).trans <| segR (by decide) r_110647_110666

end PackLean.D44.Dodindod.KR
