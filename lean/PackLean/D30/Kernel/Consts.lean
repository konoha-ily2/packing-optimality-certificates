-- Kernel (decide +kernel) trial (hand-written, Q58). The light part of the constant checks (without the symmetry pairs, groupOk).
import PackLean.D30.Data

namespace PackLean.D30
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √5, piece, S̄ ≥ S* and T, upper bound (configuration at t*). -/
theorem kconsts : (sqbOk P && pieceOk P && boundsOk P && upperOk P) = true := by decide +kernel

end PackLean.D30
