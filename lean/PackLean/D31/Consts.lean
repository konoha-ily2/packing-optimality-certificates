-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The 23 piece rotations (identity excluded) are signed permutations with det = 1, pairwise distinct. Form of the constants. -/
theorem consts_ok : rotsOk P = true ∧ P.rots.length = 23 ∧ prmOk P = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Zero-order identities of the local part: for J, T = k′u(e₀ + e₁u) for the 54 candidates of family S_E; for C, T = 0 for the 81 candidates of family S_C. -/
theorem ident_ok : identOk .J = true ∧ identOk .C = true ∧ (family .J).length = 54 ∧ (family .C).length = 81 := by native_decide

end PackLean.D31.Oct
