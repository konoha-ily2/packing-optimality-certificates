-- Written by lean/tools/export_d45dt.py (do not edit by hand).
import PackLean.D45DT.Data

namespace PackLean.D45DT

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- sqrt5 brackets, the piece (unit-edge dodecahedron), the 60 rotations, the weights on the tube corners -/
theorem consts_ok : constsOk P = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- upper bound and sandwich: [the two pieces are rotations, both inside the container u_up, separated by a plane,
  0 < 2 sqrt2 (u_up - cbar) < 4e-10, s_rat <= 2 sqrt2 cbar, the minimal polynomial of u changes sign (reference)] -/
theorem upper_ok : upperRun P UP = [true, true, true, true, true, true] := by native_decide

end PackLean.D45DT
