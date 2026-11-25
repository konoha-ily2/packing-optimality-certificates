-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey048

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_1 : List Tok := [(.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 5), (.A 4 2 4 1 5), (.A 5 2 4 1 7), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_1 : wsegOk P nbN118 (nInsideL P nbN118) kN118_1 tN118_1 kN118_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_2 : List Tok := [.split, .split, (.D 9), .split, (.A 1 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 1 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_2 : wsegOk P nbN118 (nInsideL P nbN118) kN118_2 tN118_2 kN118_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_3 : List Tok := [.split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 5), (.A 5 2 4 0 5), (.A 5 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), .split, (.A 1 6 4 0 1), (.A 1 6 4 0 1), .split, (.A 4 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), (.A 0 6 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_3 : wsegOk P nbN118 (nInsideL P nbN118) kN118_3 tN118_3 kN118_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_4 : List Tok := [.split, .split, (.A 4 2 4 0 1), (.A 0 6 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 7), (.A 5 6 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, (.A 5 2 4 0 1), (.A 4 2 4 0 1), (.A 5 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_4 : wsegOk P nbN118 (nInsideL P nbN118) kN118_4 tN118_4 kN118_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_5 : List Tok := [.split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_5 : wsegOk P nbN118 (nInsideL P nbN118) kN118_5 tN118_5 kN118_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_6 : List Tok := [(.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, (.A 4 7 4 0 1), (.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 4 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), (.A 4 7 5 2 1), .split, (.A 4 3 7 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_6 : wsegOk P nbN118 (nInsideL P nbN118) kN118_6 tN118_6 kN118_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_7 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_7 : wsegOk P nbN118 (nInsideL P nbN118) kN118_7 tN118_7 kN118_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_8 : List Tok := [.split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 6 5 0 1), (.A 5 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_8 : wsegOk P nbN118 (nInsideL P nbN118) kN118_8 tN118_8 kN118_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_9 : List Tok := [(.A 5 6 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_9 : wsegOk P nbN118 (nInsideL P nbN118) kN118_9 tN118_9 kN118_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_10 : List Tok := [.split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 5 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 7 0 6 5 3), (.A 5 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_10 : wsegOk P nbN118 (nInsideL P nbN118) kN118_10 tN118_10 kN118_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_11 : List Tok := [.split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 6 4 1), .split, (.D 13), (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_11 : wsegOk P nbN118 (nInsideL P nbN118) kN118_11 tN118_11 kN118_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_12 : List Tok := [.split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 7 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 5 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), .split, (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_12 : wsegOk P nbN118 (nInsideL P nbN118) kN118_12 tN118_12 kN118_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_13 : List Tok := [(.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, .split, (.A 5 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_13 : wsegOk P nbN118 (nInsideL P nbN118) kN118_13 tN118_13 kN118_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_14 : List Tok := [(.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_14 : wsegOk P nbN118 (nInsideL P nbN118) kN118_14 tN118_14 kN118_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN118_15 : List Tok := [(.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN118_15 : wsegOk P nbN118 (nInsideL P nbN118) kN118_15 tN118_15 [] = true := by
  decide +kernel

end PackLean.D28.Cub
