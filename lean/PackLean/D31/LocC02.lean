-- Generated automatically (lean/tools/export_d31.py). Do not edit by hand.
import PackLean.D31.Data

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (0, 1) (index 0 in faceList), side 0. Accepted 215 (the same as the Python record). -/
def ltC00 : List LTok := [.split, .split, .split, .split, .split, .split, .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, .split, .split, .split, (.acc 25), (.acc 79), (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, .split, (.acc 25), (.acc 79), (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, .split, (.acc 79), (.acc 79), (.acc 79), .split, .split, (.acc 79), (.acc 79), (.acc 79), .split, .split, .split, (.acc 16), (.acc 16), .split, .split, .split, .split, (.acc 7), .split, (.acc 16), .split, (.acc 13), .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), (.acc 43), .split, .split, (.acc 7), (.acc 16), (.acc 43), .split, .split, .split, (.acc 7), .split, (.acc 16), .split, .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), (.acc 43), .split, .split, (.acc 7), (.acc 16), (.acc 43), .split, (.acc 70), (.acc 70), .split, .split, .split, (.acc 7), .split, .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), .split, (.acc 16), .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70), .split, .split, .split, .split, .split, .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), .split, (.acc 7), (.acc 4), (.acc 7), .split, (.acc 7), .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, .split, .split, (.acc 25), (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, (.acc 25), (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, .split, (.acc 79), (.acc 79), (.acc 79), .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, .split, .split, (.acc 16), (.acc 16), .split, (.acc 16), (.acc 16), .split, .split, .split, .split, (.acc 7), .split, (.acc 16), .split, .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), (.acc 43), .split, .split, (.acc 7), (.acc 16), (.acc 43), .split, .split, .split, (.acc 7), .split, (.acc 16), .split, .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), (.acc 43), .split, .split, (.acc 7), (.acc 16), (.acc 43), .split, (.acc 70), (.acc 70), .split, .split, .split, (.acc 7), .split, .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), .split, .split, (.acc 16), (.acc 16), .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC00_ok : faceRun P .C 0 0 ltC00 = (true, 215) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (1, 1) (index 1 in faceList), side 0. Accepted 259 (the same as the Python record). -/
def ltC10 : List LTok := [.split, .split, .split, .split, .split, (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, .split, .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, (.acc 16), (.acc 16), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70), .split, .split, .split, .split, (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, .split, .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, (.acc 79), .split, (.acc 25), (.acc 79), .split, .split, (.acc 16), (.acc 16), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC10_ok : faceRun P .C 1 0 ltC10 = (true, 259) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, 1) (index 2 in faceList), side 0. Accepted 1 (the same as the Python record). -/
def ltC20 : List LTok := [(.acc 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC20_ok : faceRun P .C 2 0 ltC20 = (true, 1) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, 1) (index 2 in faceList), side 1. Accepted 18 (the same as the Python record). -/
def ltC21 : List LTok := [.split, .split, .split, .split, .split, (.acc 39), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, .split, .split, (.acc 39), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC21_ok : faceRun P .C 2 1 ltC21 = (true, 18) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, -1) (index 3 in faceList), side 0. Accepted 18 (the same as the Python record). -/
def ltC30 : List LTok := [.split, .split, .split, .split, (.acc 7), .split, (.acc 25), (.acc 79), .split, (.acc 7), (.acc 25), .split, .split, (.acc 7), (.acc 25), .split, (.acc 7), (.acc 25), .split, .split, .split, (.acc 7), .split, (.acc 25), (.acc 79), .split, (.acc 7), (.acc 25), .split, .split, (.acc 7), (.acc 25), .split, (.acc 7), (.acc 25)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC30_ok : faceRun P .C 3 0 ltC30 = (true, 18) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (2, -1) (index 3 in faceList), side 1. Accepted 1 (the same as the Python record). -/
def ltC31 : List LTok := [(.acc 75)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC31_ok : faceRun P .C 3 1 ltC31 = (true, 1) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (3, 1) (index 4 in faceList), side 0. Accepted 1 (the same as the Python record). -/
def ltC40 : List LTok := [(.acc 79)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC40_ok : faceRun P .C 4 0 ltC40 = (true, 1) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (3, 1) (index 4 in faceList), side 1. Accepted 18 (the same as the Python record). -/
def ltC41 : List LTok := [.split, .split, .split, .split, .split, (.acc 75), (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39), .split, .split, .split, .split, (.acc 75), (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC41_ok : faceRun P .C 4 1 ltC41 = (true, 18) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (3, -1) (index 5 in faceList), side 0. Accepted 18 (the same as the Python record). -/
def ltC50 : List LTok := [.split, .split, .split, .split, (.acc 7), .split, (.acc 16), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 16), .split, (.acc 7), (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 16), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 16), .split, (.acc 7), (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC50_ok : faceRun P .C 5 0 ltC50 = (true, 18) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Local C: face (3, -1) (index 5 in faceList), side 1. Accepted 1 (the same as the Python record). -/
def ltC51 : List LTok := [(.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem locC51_ok : faceRun P .C 5 1 ltC51 = (true, 1) := by native_decide

end PackLean.D31.Oct
