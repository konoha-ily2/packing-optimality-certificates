-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.
import PackLean.D30X.Cub.Test.Tsmall.Data

namespace PackLean.D30X.Cub.Test.Tsmall
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- dodincub_n02: enclosures of the square roots, piece (20 vertices), container (6 faces, 8 vertices of P),
  240 symmetry pairs (48 container symmetries × 10 piece symmetries fixing n0), T and S̄,
  upper bound (configuration at t*). -/
theorem consts_ok : constsOk P = true := by native_decide

end PackLean.D30X.Cub.Test.Tsmall
