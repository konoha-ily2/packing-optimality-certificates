-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey064

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_1 : List Tok := [.split, .split, (.D 11), (.A 5 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 6 5 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 5 2 4 1 7), .split, .split, .split, (.A 5 2 4 1 5), (.A 1 2 4 1 5), .split, (.A 4 3 4 1 5), .split, (.A 0 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_1 : wsegOk P nbN150 (nInsideL P nbN150) kN150_1 tN150_1 kN150_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_2 : List Tok := [.split, .split, (.A 4 2 4 1 5), .split, (.A 0 2 4 1 5), (.A 4 2 4 0 5), (.A 4 3 4 0 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 1 6 4 3 5), .split, .split, (.A 0 7 4 3 5), .split, (.A 1 6 4 1 5), (.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, (.A 1 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_2 : wsegOk P nbN150 (nInsideL P nbN150) kN150_2 tN150_2 kN150_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_3 : List Tok := [.split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, (.A 1 6 4 0 5), (.A 1 6 4 0 5), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 0 5), (.A 1 2 4 0 5), (.A 4 2 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, (.A 1 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_3 : wsegOk P nbN150 (nInsideL P nbN150) kN150_3 tN150_3 kN150_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_4 : List Tok := [.split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3), .split, (.A 5 2 4 0 5), .split, .split, (.A 1 6 4 0 1), (.A 0 2 4 0 1), (.A 1 2 4 0 1), .split, (.A 5 2 4 0 3), (.A 5 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, (.A 1 6 4 0 1), (.A 1 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 5 0 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_4 : wsegOk P nbN150 (nInsideL P nbN150) kN150_4 tN150_4 kN150_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_5 : List Tok := [(.A 4 3 6 0 5), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 6 1 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), (.A 0 7 6 2 5), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 4 3 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_5 : wsegOk P nbN150 (nInsideL P nbN150) kN150_5 tN150_5 kN150_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_6 : List Tok := [(.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, .split, (.A 4 3 4 0 5), (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_6 : wsegOk P nbN150 (nInsideL P nbN150) kN150_6 tN150_6 kN150_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_7 : List Tok := [.split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 0 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_7 : wsegOk P nbN150 (nInsideL P nbN150) kN150_7 tN150_7 kN150_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_8 : List Tok := [(.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 2 7 5 3), (.D 15), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_8 : wsegOk P nbN150 (nInsideL P nbN150) kN150_8 tN150_8 kN150_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_9 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 6 5 0 3), (.A 1 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_9 : wsegOk P nbN150 (nInsideL P nbN150) kN150_9 tN150_9 kN150_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_10 : List Tok := [(.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7), .split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), (.A 7 0 6 5 3), (.D 13), .split, .split, .split, .split, .split, (.A 5 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_10 : wsegOk P nbN150 (nInsideL P nbN150) kN150_10 tN150_10 kN150_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_11 : List Tok := [(.A 4 2 6 4 7), (.A 5 2 6 4 7), (.A 5 2 6 0 1), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 5 2 6 4 5), (.D 13), (.A 4 2 6 4 5), .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_11 : wsegOk P nbN150 (nInsideL P nbN150) kN150_11 tN150_11 kN150_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_12 : List Tok := [.split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 5 2 5 0 1), .split, .split, (.A 1 6 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 0 6 5 0 1), (.A 4 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_12 : wsegOk P nbN150 (nInsideL P nbN150) kN150_12 tN150_12 kN150_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_13 : List Tok := [.split, (.A 1 6 5 0 1), .split, (.A 5 2 5 0 1), .split, (.A 4 6 5 0 1), (.A 5 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 5 2 5 0 1), .split, .split, (.A 1 6 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), .split, (.A 4 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_13 : wsegOk P nbN150 (nInsideL P nbN150) kN150_13 tN150_13 kN150_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_14 : List Tok := [(.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 5 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, (.A 5 2 7 4 1), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_14 : wsegOk P nbN150 (nInsideL P nbN150) kN150_14 tN150_14 kN150_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_15 : List Tok := [.split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_15 : wsegOk P nbN150 (nInsideL P nbN150) kN150_15 tN150_15 [] = true := by
  decide +kernel

end PackLean.D28.Cub
