-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- E3e：区間 3120〜3120（歩 94310〜94360）を wstepR で decide +kernel。
import PackLean.D44.Cubindod.KR.FarH

namespace PackLean.D44.Cubindod.KR
open PackLean.D16 PackLean.D16.KSegW PackLean.D16.KSegR PackLean.D44.Cubindod PackLean.D44.Cubindod.K PackLean.D44.Cubindod.KR

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem r_94310_94360 : stEq (runR P sbR toks s_94310 94310 94360) s_94360 = true := by decide +kernel

set_option maxRecDepth 100000 in
/-- 歩 94310 から歩 94360 まで（区間 1 本をつないだもの）。 -/
theorem f104 : (toks.drop 94310).foldl (wstepR P sbR) s_94310 = (toks.drop 94360).foldl (wstepR P sbR) s_94360 :=
  segR (by decide) r_94310_94360

end PackLean.D44.Cubindod.KR
