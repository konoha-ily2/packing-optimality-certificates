-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, 1) (index 3 in faceList), side 0. Accepted 8 (the same as the Python record). -/
def ltJ30 : List LTok := [.split, .split, .split, (.acc 79), (.acc 70), .split, (.acc 79), (.acc 70), .split, .split, (.acc 79), (.acc 70), .split, (.acc 79), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ30_ok : faceRun P .J 3 0 ltJ30 = (true, 8) := by native_decide

end PackLean.D31.Oct
