-- Generated automatically (lean/tools/export_d30.py). Do not edit by hand.
import PackLean.D30.Test.RhoBig.Data

namespace PackLean.D30.Test.RhoBig
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √5, piece (8 vertices), container (20 faces, 12 vertices of P), 480 symmetry pairs
  (120 container symmetries × 8 piece symmetries fixing n0), T and S̄, upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by native_decide

end PackLean.D30.Test.RhoBig
