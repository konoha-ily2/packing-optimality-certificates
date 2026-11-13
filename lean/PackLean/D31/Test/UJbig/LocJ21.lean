-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.UJbig.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, -1) (index 2 in faceList), side 1. Accepted 8 (the same as the Python record). -/
def ltJ21 : List LTok := [.split, .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78), .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ21_ok : faceRun P .J 2 1 ltJ21 = (true, 8) := by native_decide

end PackLean.D31.Oct
