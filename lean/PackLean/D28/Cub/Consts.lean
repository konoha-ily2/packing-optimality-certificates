-- Generated automatically (lean/tools/export_d28.py). Do not edit by hand.
import PackLean.D28.Cub.Data

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √, rotation group (24 elements: orthogonal, det 1, preserving the vertices), piece (8 vertices, unit edges, 3 edges at each vertex), local ranges. -/
theorem consts_ok : (sqbOk P && P.rots.length == 24 && rotsOk P && pieceOk P 8 3 && rangesOk P) = true := by native_decide

end PackLean.D28.Cub
