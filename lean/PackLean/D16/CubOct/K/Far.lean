-- 自動で書き出したもの（lean/tools/export_d16.py）。手で直さない。
-- E3a′：元の CoverFar.lean と同じ命題を、native_decide なし（decide +kernel と区間をつなぐ補題）で。
import PackLean.D16.CubOct.K.Far0
import PackLean.D16.CubOct.K.Far1

namespace PackLean.D16.CubOct.K
open PackLean.D16C PackLean.D16.CubOct

set_option maxRecDepth 100000 in
/-- 遠方の全部：τ の根 [0, ½]・[½, 1] の木が閉じ、受理 623・L 1（元の PackLean.D16.CubOct.cover_far_ok と同じ命題）。 -/
theorem cover_far_ok : D16C.farAll CP ctoks0 ctoks1 = (true, 623, 1) := by
  unfold D16C.farAll
  simp only [farRun0, farRun1]
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- S̄ ≥ S* = 1 + √2/2、T1 の条件、b・γ の根の箱が定義域を含む（元の PackLean.D16.CubOct.cover_consts_ok と同じ命題）。 -/
theorem cover_consts_ok : D16C.farConstsOk CP = true := by decide +kernel

end PackLean.D16.CubOct.K
