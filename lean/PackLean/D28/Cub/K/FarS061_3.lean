-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey061

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_1 : List Tok := [.split, .split, (.D 11), (.A 5 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 5 3 4 1 7), .split, .split, .split, (.A 5 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 4 3 4 1 5), .split, (.A 0 3 4 1 5), .split, .split, .split, (.A 4 2 4 1 5), (.A 5 2 4 1 5), (.A 1 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_1 : wsegOk P nbN144 (nInsideL P nbN144) kN144_1 tN144_1 kN144_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_2 : List Tok := [(.A 4 3 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 5), .split, .split, (.A 5 2 4 0 5), (.A 4 3 4 0 5), (.A 5 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_2 : wsegOk P nbN144 (nInsideL P nbN144) kN144_2 tN144_2 kN144_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_3 : List Tok := [.split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, (.A 1 6 4 0 5), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 0 2 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_3 : wsegOk P nbN144 (nInsideL P nbN144) kN144_3 tN144_3 kN144_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_4 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), .split, .split, .split, (.A 5 2 4 0 5), .split, (.A 5 2 4 0 5), .split, .split, (.A 5 2 4 0 5), (.A 4 2 4 0 5), (.A 5 2 4 0 5), (.A 5 2 4 0 5), .split, .split, (.A 1 6 4 0 1), (.A 0 2 4 0 1), .split, (.A 1 2 4 0 1), (.A 1 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), .split, (.A 1 2 4 0 1), (.A 5 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_4 : wsegOk P nbN144 (nInsideL P nbN144) kN144_4 tN144_4 kN144_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_5 : List Tok := [(.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 3 6 1 5), (.A 4 3 6 0 5), .split, (.D 2), .split, (.D 6), (.A 4 3 6 0 5), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_5 : wsegOk P nbN144 (nInsideL P nbN144) kN144_5 tN144_5 kN144_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_6 : List Tok := [.split, (.D 2), (.D 2), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 4 0 5), .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 2 4 0 5), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_6 : wsegOk P nbN144 (nInsideL P nbN144) kN144_6 tN144_6 kN144_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_7 : List Tok := [(.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 4 0 1), (.A 4 3 6 0 5), .split, .split, (.A 5 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 5 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_7 : wsegOk P nbN144 (nInsideL P nbN144) kN144_7 tN144_7 kN144_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_8 : List Tok := [(.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_8 : wsegOk P nbN144 (nInsideL P nbN144) kN144_8 tN144_8 kN144_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_9 : List Tok := [(.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 0 4 1 3), .split, (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_9 : wsegOk P nbN144 (nInsideL P nbN144) kN144_9 tN144_9 kN144_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_10 : List Tok := [.split, (.D 1), .split, .split, .split, (.D 4), (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 1), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 6 5 1 3), (.A 1 6 7 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 1 6 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_10 : wsegOk P nbN144 (nInsideL P nbN144) kN144_10 tN144_10 kN144_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_11 : List Tok := [(.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 5 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_11 : wsegOk P nbN144 (nInsideL P nbN144) kN144_11 tN144_11 kN144_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_12 : List Tok := [.split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), (.A 7 0 6 5 3), (.D 13), .split, .split, .split, .split, .split, (.A 5 2 6 1 7), .split, (.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 5 2 6 4 5), (.D 13), (.A 4 2 6 4 5), .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_12 : wsegOk P nbN144 (nInsideL P nbN144) kN144_12 tN144_12 kN144_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_13 : List Tok := [(.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, (.A 5 0 6 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_13 : wsegOk P nbN144 (nInsideL P nbN144) kN144_13 tN144_13 kN144_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_14 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 5 2 5 0 1), (.A 1 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 0 2 5 0 1), .split, (.A 1 6 5 0 1), .split, (.A 5 2 5 0 1), (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 5 2 5 0 1), .split, (.A 1 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, (.A 5 2 5 4 1), (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_14 : wsegOk P nbN144 (nInsideL P nbN144) kN144_14 tN144_14 kN144_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN144_15 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, .split, (.A 4 3 5 0 1), .split, .split, .split, (.A 4 3 5 0 1), (.D 12), (.D 12), (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN144_15 : wsegOk P nbN144 (nInsideL P nbN144) kN144_15 tN144_15 kN144_16 = true := by
  decide +kernel

end PackLean.D28.Cub
