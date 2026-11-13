-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJ.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, 1) (index 1 in faceList), side 0. Accepted 23 (the same as the Python record). -/
def ltJ10 : List LTok := [.split, .split, .split, .split, .split, .split, (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 13), (.acc 11), (.acc 17), (.acc 70), .split, .split, (.acc 10), (.acc 17), (.acc 70), .split, .split, .split, .split, .split, .split, .split, (.acc 17), (.acc 70), (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 16), (.acc 11), (.acc 17), (.acc 70), .split, .split, .split, (.acc 10), (.acc 11), (.acc 17), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ10_ok : faceRun P .J 1 0 ltJ10 = (true, 23) := by native_decide

end PackLean.D31.Oct
