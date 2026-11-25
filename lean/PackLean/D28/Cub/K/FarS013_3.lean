-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey013

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_5 : List Tok := [.split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 4 3 6 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_5 : wsegOk P nbN045 (nInsideL P nbN045) kN045_5 tN045_5 kN045_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_6 : List Tok := [.split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_6 : wsegOk P nbN045 (nInsideL P nbN045) kN045_6 tN045_6 kN045_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_7 : List Tok := [(.A 4 3 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), .split, .split, (.A 4 2 4 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_7 : wsegOk P nbN045 (nInsideL P nbN045) kN045_7 tN045_7 kN045_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_8 : List Tok := [(.A 4 3 5 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_8 : wsegOk P nbN045 (nInsideL P nbN045) kN045_8 tN045_8 kN045_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_9 : List Tok := [.split, (.A 5 2 4 1 7), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 7), .split, (.A 4 2 4 0 7), (.A 5 2 6 0 3), (.A 5 2 6 1 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_9 : wsegOk P nbN045 (nInsideL P nbN045) kN045_9 tN045_9 kN045_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_10 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 1 2 4 0 3), (.A 5 2 4 0 3), .split, .split, .split, (.A 1 2 4 0 3), (.A 1 6 5 0 3), (.A 0 2 4 0 3), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_10 : wsegOk P nbN045 (nInsideL P nbN045) kN045_10 tN045_10 kN045_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_11 : List Tok := [.split, (.A 5 2 5 0 3), .split, (.A 0 2 5 0 3), (.A 1 2 5 0 3), .split, (.A 4 2 4 0 3), .split, .split, .split, (.A 4 2 4 0 3), (.A 0 2 5 0 3), (.A 4 2 4 0 1), (.A 4 2 5 0 3), .split, (.A 5 2 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 4 2 5 0 3), (.A 5 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 3), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 6 5 0 3), .split, .split, (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_11 : wsegOk P nbN045 (nInsideL P nbN045) kN045_11 tN045_11 kN045_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_12 : List Tok := [(.A 4 2 5 0 1), (.A 0 6 5 0 1), .split, .split, (.A 4 6 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 1 6 5 0 3), .split, (.A 4 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 1 3), (.A 1 6 5 1 3), (.A 5 6 7 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 5 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_12 : wsegOk P nbN045 (nInsideL P nbN045) kN045_12 tN045_12 kN045_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_13 : List Tok := [(.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_13 : wsegOk P nbN045 (nInsideL P nbN045) kN045_13 tN045_13 kN045_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_14 : List Tok := [(.A 4 0 6 5 3), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 5 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_14 : wsegOk P nbN045 (nInsideL P nbN045) kN045_14 tN045_14 kN045_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_15 : List Tok := [(.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_15 : wsegOk P nbN045 (nInsideL P nbN045) kN045_15 tN045_15 kN045_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_16 : List Tok := [(.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_16 : wsegOk P nbN045 (nInsideL P nbN045) kN045_16 tN045_16 kN045_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_17 : List Tok := [(.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_17 : wsegOk P nbN045 (nInsideL P nbN045) kN045_17 tN045_17 kN045_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_18 : List Tok := [.split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_18 : wsegOk P nbN045 (nInsideL P nbN045) kN045_18 tN045_18 kN045_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN045_19 : List Tok := [.split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN045_19 : wsegOk P nbN045 (nInsideL P nbN045) kN045_19 tN045_19 [] = true := by
  decide +kernel

end PackLean.D28.Cub
