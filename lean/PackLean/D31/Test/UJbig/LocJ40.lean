-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, -1) (index 4 in faceList), side 0. Accepted 16 (the same as the Python record). -/
def ltJ40 : List LTok := [.split, .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 4), (.acc 8), (.acc 8), .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ40_ok : faceRun P .J 4 0 ltJ40 = (true, 16) := by native_decide

end PackLean.D31.Oct
