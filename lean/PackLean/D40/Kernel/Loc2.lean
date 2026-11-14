-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Kernel.Data

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local P_cyc1: face (2, -1) (number 3 of faceList). Accepted 60 (the same as the Python record). -/
def lt43 : List LTok := [.split, .split, .split, (.acc 11), .split, .split, .split, .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 0), .split, .split, (.acc 11), .split, .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, .split, .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 1), .split, (.acc 5), .split, (.acc 11), (.acc 1), .split, (.acc 11), (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc43_ok : faceRun P 4 3 tab4 lt43 = (true, 60) := by decide +kernel

end PackLean.D40.Tet
