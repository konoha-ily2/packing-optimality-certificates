-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey035

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.A 0 7 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_0 : wsegOk P nbN091 (nInsideL P nbN091) (rRoots P.rden) tN091_0 kN091_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 5), (.A 1 2 4 1 7), .split, (.D 5), .split, (.A 1 3 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 3 4 1 7), .split, (.A 1 3 4 1 7), .split, .split, (.A 5 3 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 1 3 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_1 : wsegOk P nbN091 (nInsideL P nbN091) kN091_1 tN091_1 kN091_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_2 : List Tok := [(.A 4 3 4 1 5), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 5), .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 5), (.A 0 2 4 0 5), (.A 0 2 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 5 3 4 1 7), (.A 5 2 4 1 7), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_2 : wsegOk P nbN091 (nInsideL P nbN091) kN091_2 tN091_2 kN091_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_3 : List Tok := [(.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 4 3 4 1 7), .split, .split, .split, (.A 0 3 4 1 5), (.A 0 3 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 3 4 1 7), (.A 4 3 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), (.A 0 2 4 1 5), (.A 4 3 4 1 5), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 3 4 1 7), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_3 : wsegOk P nbN091 (nInsideL P nbN091) kN091_3 tN091_3 kN091_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_4 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 4 3 4 1 7), (.A 4 2 4 1 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 4 2 4 0 7), .split, (.A 5 2 4 0 7), (.A 5 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), .split, (.A 5 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_4 : wsegOk P nbN091 (nInsideL P nbN091) kN091_4 tN091_4 kN091_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_5 : List Tok := [(.A 5 2 4 0 7), .split, (.A 1 2 4 0 5), (.A 1 2 4 0 5), .split, (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7), .L, .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_5 : wsegOk P nbN091 (nInsideL P nbN091) kN091_5 tN091_5 kN091_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_6 : List Tok := [(.A 0 7 4 2 1), (.D 7), .split, .split, .split, .split, (.D 7), (.A 1 6 4 2 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_6 : wsegOk P nbN091 (nInsideL P nbN091) kN091_6 tN091_6 kN091_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_7 : List Tok := [(.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 2 4 0 5), (.A 1 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), .split, .split, (.A 1 6 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_7 : wsegOk P nbN091 (nInsideL P nbN091) kN091_7 tN091_7 kN091_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_8 : List Tok := [(.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 4 0 3), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 3), .split, .L, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_8 : wsegOk P nbN091 (nInsideL P nbN091) kN091_8 tN091_8 kN091_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_9 : List Tok := [.split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, .split, (.D 5), .split, .split, .split, (.D 5), (.A 0 3 6 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_9 : wsegOk P nbN091 (nInsideL P nbN091) kN091_9 tN091_9 kN091_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_10 : List Tok := [(.A 4 3 6 1 5), (.A 4 3 6 1 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 5 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_10 : wsegOk P nbN091 (nInsideL P nbN091) kN091_10 tN091_10 kN091_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_11 : List Tok := [(.A 0 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 4 2 6 0 5), (.A 0 2 6 0 5), (.A 4 2 6 0 5), .split, .split, (.A 4 2 6 0 7), .L, (.A 4 2 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_11 : wsegOk P nbN091 (nInsideL P nbN091) kN091_11 tN091_11 kN091_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_12 : List Tok := [(.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_12 : wsegOk P nbN091 (nInsideL P nbN091) kN091_12 tN091_12 kN091_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_13 : List Tok := [.split, .split, .split, (.A 0 2 4 0 5), .split, .split, .L, (.A 0 2 4 0 1), .split, (.A 4 2 6 0 5), .split, (.A 0 2 6 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_13 : wsegOk P nbN091 (nInsideL P nbN091) kN091_13 tN091_13 kN091_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN091_14 : List Tok := [.split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, (.A 0 3 6 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN091_14 : wsegOk P nbN091 (nInsideL P nbN091) kN091_14 tN091_14 kN091_15 = true := by
  decide +kernel

end PackLean.D28.Cub
