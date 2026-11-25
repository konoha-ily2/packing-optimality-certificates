-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey031

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_2 : List Tok := [(.A 1 2 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 5 3 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 4 3 4 1 7), .split, (.A 0 3 4 1 7), (.A 4 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_2 : wsegOk P nbM084 (nInsideL P nbM084) kM084_2 tM084_2 kM084_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_3 : List Tok := [.split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), (.A 5 2 4 1 7), (.A 0 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), (.A 5 2 4 0 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), .split, .split, .split, (.A 5 2 4 0 7), (.A 4 2 6 0 7), (.A 5 2 6 0 7), .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 4 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_3 : wsegOk P nbM084 (nInsideL P nbM084) kM084_3 tM084_3 kM084_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_4 : List Tok := [.split, (.A 0 2 4 0 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_4 : wsegOk P nbM084 (nInsideL P nbM084) kM084_4 tM084_4 kM084_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_5 : List Tok := [.split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_5 : wsegOk P nbM084 (nInsideL P nbM084) kM084_5 tM084_5 kM084_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_6 : List Tok := [.split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_6 : wsegOk P nbM084 (nInsideL P nbM084) kM084_6 tM084_6 kM084_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_7 : List Tok := [.split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_7 : wsegOk P nbM084 (nInsideL P nbM084) kM084_7 tM084_7 kM084_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_8 : List Tok := [(.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, .split, (.D 5), .split, (.A 0 3 6 1 5), (.A 4 3 6 1 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_8 : wsegOk P nbM084 (nInsideL P nbM084) kM084_8 tM084_8 kM084_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_9 : List Tok := [(.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 5), (.A 0 2 6 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_9 : wsegOk P nbM084 (nInsideL P nbM084) kM084_9 tM084_9 kM084_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_10 : List Tok := [.split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_10 : wsegOk P nbM084 (nInsideL P nbM084) kM084_10 tM084_10 kM084_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_11 : List Tok := [.split, .split, .split, (.A 0 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 0 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, (.A 4 2 6 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_11 : wsegOk P nbM084 (nInsideL P nbM084) kM084_11 tM084_11 kM084_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_12 : List Tok := [(.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_12 : wsegOk P nbM084 (nInsideL P nbM084) kM084_12 tM084_12 kM084_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_13 : List Tok := [(.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_13 : wsegOk P nbM084 (nInsideL P nbM084) kM084_13 tM084_13 kM084_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_14 : List Tok := [.split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 7), .split, (.A 5 2 6 0 7), (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_14 : wsegOk P nbM084 (nInsideL P nbM084) kM084_14 tM084_14 kM084_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_15 : List Tok := [(.A 1 2 5 1 3), .split, (.A 5 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_15 : wsegOk P nbM084 (nInsideL P nbM084) kM084_15 tM084_15 kM084_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM084_16 : List Tok := [.split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM084_16 : wsegOk P nbM084 (nInsideL P nbM084) kM084_16 tM084_16 kM084_17 = true := by
  decide +kernel

end PackLean.D28.Cub
