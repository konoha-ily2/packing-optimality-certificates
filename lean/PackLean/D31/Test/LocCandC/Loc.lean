-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Test.LocCandC.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, 1) (index 2 in faceList), side 1. Accepted 18 (the same as the Python record). -/
def ltC21 : List LTok := [.split, .split, .split, .split, .split, (.acc 0), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, .split, .split, (.acc 39), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC21_ok : faceRun P .C 2 1 ltC21 = (true, 18) := by native_decide

end PackLean.D31.Oct
