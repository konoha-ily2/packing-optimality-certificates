-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Test.SBig.Data

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (1, 1) (index 1 of faceList). Accepted 9 (as in the Python record). -/
def lt41 : List LTok := [.split, .split, .split, (.acc 5), (.acc 6), .split, (.acc 5), (.acc 6), .split, .split, (.acc 5), (.acc 6), .split, (.acc 5), .split, (.acc 6), (.acc 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc41_ok : faceRun P 4 1 tab4 lt41 = (true, 9) := by native_decide

end PackLean.D37N05.Tet
