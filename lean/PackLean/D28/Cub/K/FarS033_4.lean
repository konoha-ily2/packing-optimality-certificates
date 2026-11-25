-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey033

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_3 : List Tok := [.split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 4 2 4 1 7), (.A 5 2 4 1 7), (.A 0 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 0 7), (.A 4 2 4 0 7), (.A 5 2 4 0 7), .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_3 : wsegOk P nbN088 (nInsideL P nbN088) kN088_3 tN088_3 kN088_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_4 : List Tok := [.split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 0 2 4 0 5), .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 7), .split, .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 4 2 4 0 5), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_4 : wsegOk P nbN088 (nInsideL P nbN088) kN088_4 tN088_4 kN088_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_5 : List Tok := [(.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_5 : wsegOk P nbN088 (nInsideL P nbN088) kN088_5 tN088_5 kN088_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_6 : List Tok := [(.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_6 : wsegOk P nbN088 (nInsideL P nbN088) kN088_6 tN088_6 kN088_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_7 : List Tok := [(.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_7 : wsegOk P nbN088 (nInsideL P nbN088) kN088_7 tN088_7 kN088_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_8 : List Tok := [.split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_8 : wsegOk P nbN088 (nInsideL P nbN088) kN088_8 tN088_8 kN088_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_9 : List Tok := [(.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_9 : wsegOk P nbN088 (nInsideL P nbN088) kN088_9 tN088_9 kN088_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_10 : List Tok := [(.D 6), .split, (.D 9), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 6 0 5), (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_10 : wsegOk P nbN088 (nInsideL P nbN088) kN088_10 tN088_10 kN088_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_11 : List Tok := [(.A 0 2 4 0 1), .split, .split, .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 3 6 0 1), (.A 0 3 4 0 1), (.A 4 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_11 : wsegOk P nbN088 (nInsideL P nbN088) kN088_11 tN088_11 kN088_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_12 : List Tok := [.split, .split, (.A 0 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_12 : wsegOk P nbN088 (nInsideL P nbN088) kN088_12 tN088_12 kN088_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_13 : List Tok := [(.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 0 7), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), .split, .split, .split, (.D 4), (.A 1 2 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_13 : wsegOk P nbN088 (nInsideL P nbN088) kN088_13 tN088_13 kN088_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_14 : List Tok := [(.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 7 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_14 : wsegOk P nbN088 (nInsideL P nbN088) kN088_14 tN088_14 kN088_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_15 : List Tok := [(.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3), .split, (.A 4 2 4 0 1), (.A 5 2 4 0 3), (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_15 : wsegOk P nbN088 (nInsideL P nbN088) kN088_15 tN088_15 kN088_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_16 : List Tok := [(.A 4 2 4 0 1), .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 3), (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 1 2 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 3), .split, (.A 0 2 4 0 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 5 2 4 0 1), (.A 4 2 4 0 1), (.A 0 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_16 : wsegOk P nbN088 (nInsideL P nbN088) kN088_16 tN088_16 kN088_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN088_17 : List Tok := [.split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), (.A 5 2 5 0 3), .split, .split, (.A 0 2 5 0 3), (.A 4 2 5 0 1), (.A 5 2 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 2 5 0 3), (.A 0 2 5 0 1), (.A 1 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN088_17 : wsegOk P nbN088 (nInsideL P nbN088) kN088_17 tN088_17 kN088_18 = true := by
  decide +kernel

end PackLean.D28.Cub
