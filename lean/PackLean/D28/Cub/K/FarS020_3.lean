-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey020

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_3 : List Tok := [(.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 3), (.A 0 6 4 0 1), .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_3 : wsegOk P nbN061 (nInsideL P nbN061) kN061_3 tN061_3 kN061_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_4 : List Tok := [.split, .split, (.A 1 2 4 0 7), (.A 4 2 4 0 7), (.A 5 2 4 0 3), (.A 5 2 4 0 3), .split, .split, (.A 1 6 4 0 3), .split, .split, (.A 0 2 4 0 3), .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 0 6 4 0 3), .split, (.A 1 6 4 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 1 6 4 0 3), (.A 0 6 4 0 3), (.A 1 6 4 0 3), .split, (.A 4 2 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_4 : wsegOk P nbN061 (nInsideL P nbN061) kN061_4 tN061_4 kN061_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_5 : List Tok := [(.A 4 2 4 0 3), (.A 4 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_5 : wsegOk P nbN061 (nInsideL P nbN061) kN061_5 tN061_5 kN061_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_6 : List Tok := [.split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_6 : wsegOk P nbN061 (nInsideL P nbN061) kN061_6 tN061_6 kN061_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_7 : List Tok := [(.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 4 3 6 0 5), (.A 4 3 4 2 1), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, .split, (.A 0 3 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, .split, (.A 0 3 4 0 1), (.A 4 2 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_7 : wsegOk P nbN061 (nInsideL P nbN061) kN061_7 tN061_7 kN061_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_8 : List Tok := [(.A 4 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), .split, (.A 4 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), (.A 4 7 5 2 1), .split, .split, (.D 6), (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_8 : wsegOk P nbN061 (nInsideL P nbN061) kN061_8 tN061_8 kN061_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_9 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_9 : wsegOk P nbN061 (nInsideL P nbN061) kN061_9 tN061_9 kN061_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_10 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 5 2 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 2 4 0 3), (.A 5 2 5 0 3), .split, (.A 5 2 4 0 3), .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 1), (.A 5 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_10 : wsegOk P nbN061 (nInsideL P nbN061) kN061_10 tN061_10 kN061_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_11 : List Tok := [(.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 4 6 5 0 1), .split, (.A 0 6 5 0 1), (.A 4 6 5 0 1), .split, (.A 1 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_11 : wsegOk P nbN061 (nInsideL P nbN061) kN061_11 tN061_11 kN061_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_12 : List Tok := [(.D 1), .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), .split, .split, (.D 17), (.A 4 0 6 5 3), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_12 : wsegOk P nbN061 (nInsideL P nbN061) kN061_12 tN061_12 kN061_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_13 : List Tok := [.split, (.D 13), (.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_13 : wsegOk P nbN061 (nInsideL P nbN061) kN061_13 tN061_13 kN061_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_14 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), .split, .split, (.A 5 2 7 4 1), .split, .split, (.A 5 2 5 4 1), (.A 5 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_14 : wsegOk P nbN061 (nInsideL P nbN061) kN061_14 tN061_14 kN061_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_15 : List Tok := [(.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_15 : wsegOk P nbN061 (nInsideL P nbN061) kN061_15 tN061_15 kN061_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_16 : List Tok := [.split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_16 : wsegOk P nbN061 (nInsideL P nbN061) kN061_16 tN061_16 kN061_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_17 : List Tok := [.split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_17 : wsegOk P nbN061 (nInsideL P nbN061) kN061_17 tN061_17 [] = true := by
  decide +kernel

end PackLean.D28.Cub
