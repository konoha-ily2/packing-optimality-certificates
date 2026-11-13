-- Generated automatically (lean/tools/export_d16.py). Do not edit by hand.
import PackLean.D16.Test.CubOctDrop.CoverData
import PackLean.D16.Test.CubOctDrop.CoverTok0
import PackLean.D16.Test.CubOctDrop.CoverTok1

namespace PackLean.D16.CubOct
open PackLean.D16C

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the τ roots [0, ½] and [½, 1] close; accepted 623, L 1 (same counts as the Python records d16_far_t0/t1). -/
theorem cover_far_ok : D16C.farAll CP ctoks0 ctoks1 = (true, 623, 1) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- S̄ ≥ S* = 1 + √2/2, the T1 condition, and the root box in b, γ contains the domain. -/
theorem cover_consts_ok : D16C.farConstsOk CP = true := by native_decide

end PackLean.D16.CubOct
