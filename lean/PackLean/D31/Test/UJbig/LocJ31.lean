-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, 1) (index 3 in faceList), side 1. Accepted 13 (the same as the Python record). -/
def ltJ31 : List LTok := [.split, .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, (.acc 72), (.acc 66), .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, .split, (.acc 72), (.acc 72), (.acc 66)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ31_ok : faceRun P .J 3 1 ltJ31 = (true, 13) := by native_decide

end PackLean.D31.Oct
