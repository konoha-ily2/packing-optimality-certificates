-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Dodindod.Test.Upper.Data

namespace PackLean.D44.Dodindod.Test.Upper
open PackLean.D16 PackLean.D44
open PackLean.D28 (QF)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- dodindod_n02: enclosures of the square roots, piece (20 vertices), container (12 faces,
  20 vertices of P), 600 symmetry pairs, T and S̄ (= sstar), the sandwich
  (S̄ ≥ C0·s̄, S_up ≤ C0·s_up, s̄ < s_up) and the upper configuration at t̂ in the container of offset S_up. -/
theorem consts_ok : constsQ P sbarS sUp sUpRat = true := by native_decide

end PackLean.D44.Dodindod.Test.Upper
