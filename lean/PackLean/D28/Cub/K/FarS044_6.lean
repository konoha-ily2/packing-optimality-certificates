-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey044

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_15 : List Tok := [.split, (.A 0 2 6 0 3), (.A 0 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 1 2 5 0 3), (.A 0 2 6 0 3), .split, (.A 1 2 7 0 3), .split, .split, .split, (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 7 0 3), (.A 0 2 7 0 3), .split, (.A 0 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_15 : wsegOk P nbM109 (nInsideL P nbM109) kM109_15 tM109_15 kM109_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_16 : List Tok := [(.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 0 2 7 0 3), .split, (.A 1 2 7 0 3), .split, (.A 5 2 7 0 3), (.A 4 2 7 0 3), .split, (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_16 : wsegOk P nbM109 (nInsideL P nbM109) kM109_16 tM109_16 kM109_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_17 : List Tok := [(.A 5 2 7 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.D 12), (.D 12), (.A 0 2 7 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, (.A 1 6 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_17 : wsegOk P nbM109 (nInsideL P nbM109) kM109_17 tM109_17 kM109_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_18 : List Tok := [(.D 12), .split, .split, .split, (.A 1 2 7 1 3), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_18 : wsegOk P nbM109 (nInsideL P nbM109) kM109_18 tM109_18 kM109_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_19 : List Tok := [.split, (.A 5 2 6 5 7), (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, .split, (.A 0 2 6 0 7), (.A 4 2 6 0 7), .split, (.A 0 2 6 0 5), (.A 0 2 6 0 3), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 3), .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_19 : wsegOk P nbM109 (nInsideL P nbM109) kM109_19 tM109_19 kM109_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_20 : List Tok := [.split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), .split, .split, (.A 5 2 6 4 3), (.A 4 2 6 4 1), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_20 : wsegOk P nbM109 (nInsideL P nbM109) kM109_20 tM109_20 kM109_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_21 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_21 : wsegOk P nbM109 (nInsideL P nbM109) kM109_21 tM109_21 kM109_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_22 : List Tok := [.split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_22 : wsegOk P nbM109 (nInsideL P nbM109) kM109_22 tM109_22 kM109_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_23 : List Tok := [(.A 4 3 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_23 : wsegOk P nbM109 (nInsideL P nbM109) kM109_23 tM109_23 kM109_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_24 : List Tok := [.split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_24 : wsegOk P nbM109 (nInsideL P nbM109) kM109_24 tM109_24 kM109_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM109_25 : List Tok := [(.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM109_25 : wsegOk P nbM109 (nInsideL P nbM109) kM109_25 tM109_25 [] = true := by
  decide +kernel

end PackLean.D28.Cub
