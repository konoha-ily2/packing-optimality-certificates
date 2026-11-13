-- Generated automatically (lean/tools/export_d16.py). Do not edit by hand.
import PackLean.D16.CubOct.CoverData

namespace PackLean.D16.CubOct
open PackLean.D16C

/-- Trees of the 4 faces (g=1, b=1, e=+1, e=-1). Accepted 4. -/
def lfaces : List (List D16C.LTok) := [
  [(.acc (-1) 6)],
  [(.acc (-1) 15)],
  [(.acc (1) 12)],
  [(.acc (1) 3)]]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cover_local_ok : D16C.localOk CP lfaces = (true, 4) := by native_decide

end PackLean.D16.CubOct
