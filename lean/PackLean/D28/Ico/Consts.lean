-- Generated automatically (lean/tools/export_d28.py). Do not edit by hand.
import PackLean.D28.Ico.Data

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Enclosure of √, rotation group (60 elements: orthogonal, det 1, preserving the vertices), piece (12 vertices, unit edges, 5 edges at each vertex), local ranges. -/
theorem consts_ok : (sqbOk P && P.rots.length == 60 && rotsOk P && pieceOk P 12 5 && rangesOk P) = true := by native_decide

end PackLean.D28.Ico
