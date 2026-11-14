-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Kernel.Data

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local T_C: face (1, 1) (number 1 of faceList). Accepted 1 (the same as the Python record). -/
def lt61 : List LTok := [(.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc61_ok : faceRun P 6 1 tab6 lt61 = (true, 1) := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local P_23: face (2, 1) (number 2 of faceList). Accepted 1 (the same as the Python record). -/
def lt22 : List LTok := [(.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc22_ok : faceRun P 2 2 tab2 lt22 = (true, 1) := by decide +kernel

end PackLean.D40.Tet
