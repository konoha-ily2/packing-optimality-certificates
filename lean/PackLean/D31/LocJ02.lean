-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, 1) (index 1 in faceList), side 0. Accepted 23 (the same as the Python record). -/
def ltJ10 : List LTok := [.split, .split, .split, .split, .split, .split, (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 13), (.acc 11), (.acc 17), (.acc 70), .split, .split, (.acc 10), (.acc 17), (.acc 70), .split, .split, .split, .split, .split, .split, .split, (.acc 17), (.acc 70), (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 16), (.acc 11), (.acc 17), (.acc 70), .split, .split, .split, (.acc 10), (.acc 11), (.acc 17), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ10_ok : faceRun P .J 1 0 ltJ10 = (true, 23) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, 1) (index 1 in faceList), side 1. Accepted 19 (the same as the Python record). -/
def ltJ11 : List LTok := [.split, .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), (.acc 66), (.acc 63), .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), .split, (.acc 66), .split, .split, (.acc 12), (.acc 63), (.acc 66), (.acc 63)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ11_ok : faceRun P .J 1 1 ltJ11 = (true, 19) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, -1) (index 2 in faceList), side 0. Accepted 8 (the same as the Python record). -/
def ltJ20 : List LTok := [.split, .split, .split, (.acc 6), (.acc 24), .split, (.acc 6), (.acc 24), .split, .split, (.acc 6), (.acc 24), .split, (.acc 6), (.acc 24)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ20_ok : faceRun P .J 2 0 ltJ20 = (true, 8) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (1, -1) (index 2 in faceList), side 1. Accepted 8 (the same as the Python record). -/
def ltJ21 : List LTok := [.split, .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78), .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ21_ok : faceRun P .J 2 1 ltJ21 = (true, 8) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, 1) (index 3 in faceList), side 0. Accepted 8 (the same as the Python record). -/
def ltJ30 : List LTok := [.split, .split, .split, (.acc 79), (.acc 70), .split, (.acc 79), (.acc 70), .split, .split, (.acc 79), (.acc 70), .split, (.acc 79), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ30_ok : faceRun P .J 3 0 ltJ30 = (true, 8) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, 1) (index 3 in faceList), side 1. Accepted 13 (the same as the Python record). -/
def ltJ31 : List LTok := [.split, .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, (.acc 72), (.acc 66), .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, .split, (.acc 72), (.acc 72), (.acc 66)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ31_ok : faceRun P .J 3 1 ltJ31 = (true, 13) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, -1) (index 4 in faceList), side 0. Accepted 16 (the same as the Python record). -/
def ltJ40 : List LTok := [.split, .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 4), (.acc 8), (.acc 8), .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ40_ok : faceRun P .J 4 0 ltJ40 = (true, 16) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local J: face (2, -1) (index 4 in faceList), side 1. Accepted 4 (the same as the Python record). -/
def ltJ41 : List LTok := [.split, (.acc 3), .split, (.acc 3), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locJ41_ok : faceRun P .J 4 1 ltJ41 = (true, 4) := by native_decide

end PackLean.D31.Oct
