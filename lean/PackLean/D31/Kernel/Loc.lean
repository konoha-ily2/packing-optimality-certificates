-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Kernel.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, -1) (index 4 in faceList), side 1. Accepted 4 (the same as the Python record). -/
def ltJ41 : List LTok := [.split, (.acc 3), .split, (.acc 3), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ41_ok : faceRun P .J 4 1 ltJ41 = (true, 4) := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, 1) (index 2 in faceList), side 0. Accepted 1 (the same as the Python record). -/
def ltC20 : List LTok := [(.acc 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC20_ok : faceRun P .C 2 0 ltC20 = (true, 1) := by decide +kernel

end PackLean.D31.Oct
