-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey049

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_4 : List Tok := [.split, (.A 1 2 4 0 3), (.A 1 6 4 0 3), (.A 1 6 4 0 3), .split, (.A 5 2 4 0 1), .split, .split, .split, (.A 5 2 4 0 1), .split, .split, (.A 1 6 4 0 1), (.A 0 2 4 0 1), (.A 1 2 4 0 1), (.A 4 2 4 0 1), (.A 5 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), .split, .split, .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 4 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 1), (.A 4 6 4 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_4 : wsegOk P nbN120 (nInsideL P nbN120) kN120_4 tN120_4 kN120_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_5 : List Tok := [.split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3), .split, .split, .split, .split, (.D 5), (.A 0 3 6 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_5 : wsegOk P nbN120 (nInsideL P nbN120) kN120_5 tN120_5 kN120_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_6 : List Tok := [(.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), .split, (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), .split, .split, .split, .split, (.A 0 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_6 : wsegOk P nbN120 (nInsideL P nbN120) kN120_6 tN120_6 kN120_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_7 : List Tok := [(.A 0 7 4 0 1), (.A 4 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 1), (.A 4 6 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), (.A 4 3 5 2 1), .split, (.A 4 3 7 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_7 : wsegOk P nbN120 (nInsideL P nbN120) kN120_7 tN120_7 kN120_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_8 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), .split, (.A 5 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), .split, (.A 5 0 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), .split, (.A 5 0 6 5 3), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_8 : wsegOk P nbN120 (nInsideL P nbN120) kN120_8 tN120_8 kN120_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_9 : List Tok := [.split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_9 : wsegOk P nbN120 (nInsideL P nbN120) kN120_9 tN120_9 kN120_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_10 : List Tok := [(.A 5 2 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 5 6 5 0 1), .split, (.A 0 6 5 0 1), (.A 1 6 5 0 1), .split, (.A 1 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 5 6 5 1 3), (.A 1 6 5 0 3), (.A 5 6 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_10 : wsegOk P nbN120 (nInsideL P nbN120) kN120_10 tN120_10 kN120_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_11 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, .split, (.D 4), (.D 12), (.A 5 6 7 1 3), (.D 12), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_11 : wsegOk P nbN120 (nInsideL P nbN120) kN120_11 tN120_11 kN120_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_12 : List Tok := [.split, (.A 4 2 6 0 5), (.A 5 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5), (.D 13), (.A 4 2 6 4 5), .split, .split, (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 6 4 1), .split, (.D 13), (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_12 : wsegOk P nbN120 (nInsideL P nbN120) kN120_12 tN120_12 kN120_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_13 : List Tok := [(.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, (.A 5 0 6 5 3), .split, (.D 13), (.A 5 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, .split, .split, (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 5 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_13 : wsegOk P nbN120 (nInsideL P nbN120) kN120_13 tN120_13 kN120_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_14 : List Tok := [.split, .split, (.A 5 6 5 0 1), (.A 4 2 5 0 1), (.A 5 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 4 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 19), (.A 5 2 7 4 1), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_14 : wsegOk P nbN120 (nInsideL P nbN120) kN120_14 tN120_14 kN120_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_15 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_15 : wsegOk P nbN120 (nInsideL P nbN120) kN120_15 tN120_15 kN120_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_16 : List Tok := [.split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_16 : wsegOk P nbN120 (nInsideL P nbN120) kN120_16 tN120_16 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), (.A 0 7 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_0 : wsegOk P nbM120 (nInsideL P nbM120) (rRoots P.rden) tM120_0 kM120_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), .split, (.D 5), (.A 1 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), (.A 0 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_1 : wsegOk P nbM120 (nInsideL P nbM120) kM120_1 tM120_1 kM120_2 = true := by
  decide +kernel

end PackLean.D28.Cub
