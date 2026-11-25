-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey028

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_5 : List Tok := [.split, .split, .split, (.A 1 6 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 0 2 4 0 7), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_5 : wsegOk P nbN078 (nInsideL P nbN078) kN078_5 tN078_5 kN078_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_6 : List Tok := [.split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 3), .split, .split, (.A 1 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 7), (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 0 2 4 0 3), .split, .split, .split, (.A 0 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_6 : wsegOk P nbN078 (nInsideL P nbN078) kN078_6 tN078_6 kN078_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_7 : List Tok := [(.A 4 2 4 0 5), (.A 4 2 4 0 3), (.A 0 2 4 0 1), (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_7 : wsegOk P nbN078 (nInsideL P nbN078) kN078_7 tN078_7 kN078_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_8 : List Tok := [.split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_8 : wsegOk P nbN078 (nInsideL P nbN078) kN078_8 tN078_8 kN078_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_9 : List Tok := [(.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 5), .split, (.A 0 2 4 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_9 : wsegOk P nbN078 (nInsideL P nbN078) kN078_9 tN078_9 kN078_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_10 : List Tok := [.split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 5), .split, .split, .split, .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_10 : wsegOk P nbN078 (nInsideL P nbN078) kN078_10 tN078_10 kN078_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_11 : List Tok := [.split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, (.A 0 3 6 0 1), (.A 0 3 4 0 1), (.A 4 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_11 : wsegOk P nbN078 (nInsideL P nbN078) kN078_11 tN078_11 kN078_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_12 : List Tok := [(.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, .split, (.A 0 3 4 0 1), (.A 4 2 5 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_12 : wsegOk P nbN078 (nInsideL P nbN078) kN078_12 tN078_12 kN078_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_13 : List Tok := [(.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_13 : wsegOk P nbN078 (nInsideL P nbN078) kN078_13 tN078_13 kN078_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_14 : List Tok := [(.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 6 0 7), (.A 4 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_14 : wsegOk P nbN078 (nInsideL P nbN078) kN078_14 tN078_14 kN078_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_15 : List Tok := [(.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_15 : wsegOk P nbN078 (nInsideL P nbN078) kN078_15 tN078_15 kN078_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_16 : List Tok := [.split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), .split, (.A 0 6 4 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_16 : wsegOk P nbN078 (nInsideL P nbN078) kN078_16 tN078_16 kN078_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_17 : List Tok := [.split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_17 : wsegOk P nbN078 (nInsideL P nbN078) kN078_17 tN078_17 kN078_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_18 : List Tok := [.split, (.A 1 2 4 0 3), (.A 4 2 4 0 3), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3), (.A 5 2 4 0 3), (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_18 : wsegOk P nbN078 (nInsideL P nbN078) kN078_18 tN078_18 kN078_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN078_19 : List Tok := [.split, (.A 0 2 5 0 3), .split, (.A 4 2 5 0 3), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 5 2 6 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 5 0 3), (.A 1 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 5 2 5 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN078_19 : wsegOk P nbN078 (nInsideL P nbN078) kN078_19 tN078_19 kN078_20 = true := by
  decide +kernel

end PackLean.D28.Cub
