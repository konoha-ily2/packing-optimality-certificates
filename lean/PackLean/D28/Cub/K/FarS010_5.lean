-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey010

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_2 : List Tok := [.split, (.A 5 2 4 1 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_2 : wsegOk P nbN037 (nInsideL P nbN037) kN037_2 tN037_2 kN037_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_3 : List Tok := [.split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, .split, (.A 0 2 4 0 5), .split, .split, (.A 4 2 4 0 5), .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_3 : wsegOk P nbN037 (nInsideL P nbN037) kN037_3 tN037_3 kN037_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_4 : List Tok := [.split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 4 2 4 0 7), .split, (.A 0 2 4 0 7), (.A 4 2 4 0 3), (.A 5 2 4 0 3), .split, .split, .split, .split, .split, (.A 1 6 4 0 3), (.A 0 6 4 0 3), (.A 1 6 4 0 3), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), (.A 0 2 4 0 3), .split, (.A 4 2 4 0 1), .split, .split, .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_4 : wsegOk P nbN037 (nInsideL P nbN037) kN037_4 tN037_4 kN037_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_5 : List Tok := [.split, .split, .split, (.A 4 2 4 0 3), (.A 0 6 4 0 3), (.A 4 2 4 0 1), (.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, (.A 4 6 4 0 1), (.A 0 6 4 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_5 : wsegOk P nbN037 (nInsideL P nbN037) kN037_5 tN037_5 kN037_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_6 : List Tok := [.split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_6 : wsegOk P nbN037 (nInsideL P nbN037) kN037_6 tN037_6 kN037_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_7 : List Tok := [.split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_7 : wsegOk P nbN037 (nInsideL P nbN037) kN037_7 tN037_7 kN037_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_8 : List Tok := [.split, .split, .split, .split, (.A 0 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 4 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_8 : wsegOk P nbN037 (nInsideL P nbN037) kN037_8 tN037_8 kN037_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_9 : List Tok := [.split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, (.A 5 0 6 5 3), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, (.A 5 0 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_9 : wsegOk P nbN037 (nInsideL P nbN037) kN037_9 tN037_9 kN037_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_10 : List Tok := [(.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 5 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 2 4 0 3), .split, (.A 5 6 4 0 3), (.A 5 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_10 : wsegOk P nbN037 (nInsideL P nbN037) kN037_10 tN037_10 kN037_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_11 : List Tok := [(.A 5 2 5 0 3), .split, (.A 5 2 4 0 3), (.A 4 2 5 0 3), (.A 5 2 5 0 3), .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), (.A 4 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 3), (.A 4 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_11 : wsegOk P nbN037 (nInsideL P nbN037) kN037_11 tN037_11 kN037_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_12 : List Tok := [(.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), (.A 4 0 6 5 3), (.D 13), .split, .split, (.A 4 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_12 : wsegOk P nbN037 (nInsideL P nbN037) kN037_12 tN037_12 kN037_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_13 : List Tok := [.split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_13 : wsegOk P nbN037 (nInsideL P nbN037) kN037_13 tN037_13 kN037_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_14 : List Tok := [(.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_14 : wsegOk P nbN037 (nInsideL P nbN037) kN037_14 tN037_14 kN037_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_15 : List Tok := [(.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, (.A 5 2 5 4 1), (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 7 5 0 1), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_15 : wsegOk P nbN037 (nInsideL P nbN037) kN037_15 tN037_15 kN037_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN037_16 : List Tok := [(.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN037_16 : wsegOk P nbN037 (nInsideL P nbN037) kN037_16 tN037_16 kN037_17 = true := by
  decide +kernel

end PackLean.D28.Cub
