-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey031

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_4 : List Tok := [(.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 0 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), .split, .split, (.A 1 2 4 0 7), (.A 4 2 4 0 7), .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_4 : wsegOk P nbN084 (nInsideL P nbN084) kN084_4 tN084_4 kN084_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_5 : List Tok := [(.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_5 : wsegOk P nbN084 (nInsideL P nbN084) kN084_5 tN084_5 kN084_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_6 : List Tok := [(.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_6 : wsegOk P nbN084 (nInsideL P nbN084) kN084_6 tN084_6 kN084_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_7 : List Tok := [.split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 1 2 4 0 7), .split, (.A 0 2 4 0 3), (.A 1 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_7 : wsegOk P nbN084 (nInsideL P nbN084) kN084_7 tN084_7 kN084_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_8 : List Tok := [.split, .split, .split, .split, (.A 0 2 4 0 7), (.A 4 2 4 0 7), (.A 4 2 4 0 3), (.A 0 2 4 0 3), (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_8 : wsegOk P nbN084 (nInsideL P nbN084) kN084_8 tN084_8 kN084_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_9 : List Tok := [(.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_9 : wsegOk P nbN084 (nInsideL P nbN084) kN084_9 tN084_9 kN084_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_10 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 5), .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_10 : wsegOk P nbN084 (nInsideL P nbN084) kN084_10 tN084_10 kN084_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_11 : List Tok := [.split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_11 : wsegOk P nbN084 (nInsideL P nbN084) kN084_11 tN084_11 kN084_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_12 : List Tok := [(.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, (.A 4 2 6 0 5), .split, .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_12 : wsegOk P nbN084 (nInsideL P nbN084) kN084_12 tN084_12 kN084_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_13 : List Tok := [(.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), (.A 4 3 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_13 : wsegOk P nbN084 (nInsideL P nbN084) kN084_13 tN084_13 kN084_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_14 : List Tok := [.split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_14 : wsegOk P nbN084 (nInsideL P nbN084) kN084_14 tN084_14 kN084_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_15 : List Tok := [.split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 5 2 4 0 7), (.A 4 2 6 0 7), (.A 5 2 6 0 3), (.A 5 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_15 : wsegOk P nbN084 (nInsideL P nbN084) kN084_15 tN084_15 kN084_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_16 : List Tok := [(.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_16 : wsegOk P nbN084 (nInsideL P nbN084) kN084_16 tN084_16 kN084_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_17 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_17 : wsegOk P nbN084 (nInsideL P nbN084) kN084_17 tN084_17 kN084_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN084_18 : List Tok := [(.A 1 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 4 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN084_18 : wsegOk P nbN084 (nInsideL P nbN084) kN084_18 tN084_18 kN084_19 = true := by
  decide +kernel

end PackLean.D28.Cub
