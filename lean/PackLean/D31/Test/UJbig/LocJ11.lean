-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, 1) (index 1 in faceList), side 1. Accepted 19 (the same as the Python record). -/
def ltJ11 : List LTok := [.split, .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), (.acc 66), (.acc 63), .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), .split, (.acc 66), .split, .split, (.acc 12), (.acc 63), (.acc 66), (.acc 63)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ11_ok : faceRun P .J 1 1 ltJ11 = (true, 19) := by native_decide

end PackLean.D31.Oct
