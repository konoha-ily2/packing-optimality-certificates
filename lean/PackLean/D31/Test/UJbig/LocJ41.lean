-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, -1) (index 4 in faceList), side 1. Accepted 4 (the same as the Python record). -/
def ltJ41 : List LTok := [.split, (.acc 3), .split, (.acc 3), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ41_ok : faceRun P .J 4 1 ltJ41 = (true, 4) := by native_decide

end PackLean.D31.Oct
