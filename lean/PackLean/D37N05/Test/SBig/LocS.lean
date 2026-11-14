-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Test.SBig.Data

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_S: face (2, 1) (index 3 of faceList). Accepted 119 (as in the Python record). -/
def lt03 : List LTok := [.split, .split, .split, (.acc 14), .split, .split, (.acc 20), .split, .split, .split, (.acc 20), (.acc 18), .split, (.acc 20), (.acc 18), .split, .split, (.acc 20), (.acc 18), .split, (.acc 20), (.acc 18), (.acc 20), .split, .split, (.acc 8), (.acc 20), .split, .split, .split, .split, .split, (.acc 20), (.acc 18), .split, (.acc 20), (.acc 18), .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), (.acc 20), .split, .split, .split, .split, (.acc 14), .split, (.acc 14), (.acc 8), (.acc 20), .split, .split, .split, .split, .split, (.acc 20), (.acc 18), .split, (.acc 20), (.acc 18), .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, (.acc 18), (.acc 20), (.acc 21), (.acc 23), .split, .split, .split, .split, (.acc 8), .split, (.acc 8), .split, (.acc 8), (.acc 8), .split, .split, .split, (.acc 8), (.acc 8), .split, (.acc 8), .split, (.acc 6), (.acc 20), .split, .split, .split, (.acc 2), (.acc 20), .split, .split, (.acc 6), .split, (.acc 6), (.acc 6), (.acc 20), .split, .split, (.acc 2), (.acc 20), .split, .split, .split, (.acc 6), .split, (.acc 6), .split, (.acc 0), (.acc 18), .split, .split, (.acc 6), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 0), (.acc 18), .split, (.acc 0), (.acc 18), (.acc 20), (.acc 20), .split, .split, .split, .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, (.acc 18), (.acc 20), (.acc 18), .split, .split, .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, .split, (.acc 18), (.acc 20), (.acc 21), .split, .split, (.acc 18), (.acc 20), (.acc 21), (.acc 23)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc03_ok : faceRun P 0 3 tab0 lt03 = (true, 119) := by native_decide

end PackLean.D37N05.Tet
