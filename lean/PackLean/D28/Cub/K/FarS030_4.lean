-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey030

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_5 : List Tok := [(.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, .split, (.A 1 6 4 0 5), (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_5 : wsegOk P nbN082 (nInsideL P nbN082) kN082_5 tN082_5 kN082_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_6 : List Tok := [(.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_6 : wsegOk P nbN082 (nInsideL P nbN082) kN082_6 tN082_6 kN082_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_7 : List Tok := [(.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 3), (.A 0 2 4 0 5), .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 3), .split, .split, .split, .split, .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 5), (.A 5 2 4 0 7), (.A 0 2 4 0 3), (.A 4 2 4 0 5), .split, .split, (.A 5 2 4 0 7), .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3), .split, (.A 4 2 4 0 1), (.A 5 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_7 : wsegOk P nbN082 (nInsideL P nbN082) kN082_7 tN082_7 kN082_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_8 : List Tok := [(.A 5 2 4 0 3), (.A 4 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 0 3 6 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_8 : wsegOk P nbN082 (nInsideL P nbN082) kN082_8 tN082_8 kN082_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_9 : List Tok := [(.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_9 : wsegOk P nbN082 (nInsideL P nbN082) kN082_9 tN082_9 kN082_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_10 : List Tok := [.split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_10 : wsegOk P nbN082 (nInsideL P nbN082) kN082_10 tN082_10 kN082_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_11 : List Tok := [(.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 4 3 6 0 1), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_11 : wsegOk P nbN082 (nInsideL P nbN082) kN082_11 tN082_11 kN082_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_12 : List Tok := [(.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 0 7 5 0 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_12 : wsegOk P nbN082 (nInsideL P nbN082) kN082_12 tN082_12 kN082_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_13 : List Tok := [.split, (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_13 : wsegOk P nbN082 (nInsideL P nbN082) kN082_13 tN082_13 kN082_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_14 : List Tok := [(.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 3), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_14 : wsegOk P nbN082 (nInsideL P nbN082) kN082_14 tN082_14 kN082_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_15 : List Tok := [(.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_15 : wsegOk P nbN082 (nInsideL P nbN082) kN082_15 tN082_15 kN082_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_16 : List Tok := [.split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 1), (.A 1 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 5 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_16 : wsegOk P nbN082 (nInsideL P nbN082) kN082_16 tN082_16 kN082_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_17 : List Tok := [(.A 0 2 4 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 1 2 4 0 3), (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, (.A 5 2 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 5 0 1), .split, (.A 5 2 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 2 5 0 1), .split, (.A 0 2 5 0 1), .split, .split, (.A 1 2 5 0 3), (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_17 : wsegOk P nbN082 (nInsideL P nbN082) kN082_17 tN082_17 kN082_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_18 : List Tok := [(.A 4 2 5 0 1), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_18 : wsegOk P nbN082 (nInsideL P nbN082) kN082_18 tN082_18 kN082_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN082_19 : List Tok := [(.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), .split, (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN082_19 : wsegOk P nbN082 (nInsideL P nbN082) kN082_19 tN082_19 kN082_20 = true := by
  decide +kernel

end PackLean.D28.Cub
