-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Data

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (1, 1) (index 1 of faceList). Accepted 9 (as in the Python record). -/
def lt41 : List LTok := [.split, .split, .split, (.acc 5), (.acc 6), .split, (.acc 5), (.acc 6), .split, .split, (.acc 5), (.acc 6), .split, (.acc 5), .split, (.acc 6), (.acc 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc41_ok : faceRun P 4 1 tab4 lt41 = (true, 9) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (1, -1) (index 2 of faceList). Accepted 2 (as in the Python record). -/
def lt42 : List LTok := [.split, (.acc 14), (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc42_ok : faceRun P 4 2 tab4 lt42 = (true, 2) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (2, 1) (index 3 of faceList). Accepted 9 (as in the Python record). -/
def lt43 : List LTok := [.split, (.acc 3), .split, .split, .split, .split, (.acc 4), (.acc 4), (.acc 16), (.acc 3), .split, .split, .split, (.acc 4), (.acc 4), (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc43_ok : faceRun P 4 3 tab4 lt43 = (true, 9) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (2, -1) (index 4 of faceList). Accepted 8 (as in the Python record). -/
def lt44 : List LTok := [.split, .split, .split, (.acc 27), (.acc 24), .split, (.acc 27), (.acc 24), .split, .split, (.acc 27), (.acc 24), .split, (.acc 27), (.acc 24)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc44_ok : faceRun P 4 4 tab4 lt44 = (true, 8) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (3, 1) (index 5 of faceList). Accepted 2 (as in the Python record). -/
def lt45 : List LTok := [.split, (.acc 22), (.acc 22)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc45_ok : faceRun P 4 5 tab4 lt45 = (true, 2) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- local T_C: face (3, -1) (index 6 of faceList). Accepted 6 (as in the Python record). -/
def lt46 : List LTok := [.split, (.acc 10), .split, .split, (.acc 26), (.acc 10), .split, .split, (.acc 26), (.acc 10), (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem loc46_ok : faceRun P 4 6 tab4 lt46 = (true, 6) := by native_decide

end PackLean.D37N05.Tet
