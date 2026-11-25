-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey044

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM108_21 : List Tok := [.split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, .split, (.A 4 2 6 0 3), .split, (.A 0 2 6 0 1), .split, (.A 0 2 7 0 3), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM108_21 : wsegOk P nbM108 (nInsideL P nbM108) kM108_21 tM108_21 kM108_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM108_22 : List Tok := [(.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM108_22 : wsegOk P nbM108 (nInsideL P nbM108) kM108_22 tM108_22 kM108_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM108_23 : List Tok := [(.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM108_23 : wsegOk P nbM108 (nInsideL P nbM108) kM108_23 tM108_23 kM108_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM108_24 : List Tok := [(.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM108_24 : wsegOk P nbM108 (nInsideL P nbM108) kM108_24 tM108_24 kM108_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM108_25 : List Tok := [(.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM108_25 : wsegOk P nbM108 (nInsideL P nbM108) kM108_25 tM108_25 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 5), .split, (.A 1 2 4 1 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_0 : wsegOk P nbN109 (nInsideL P nbN109) (rRoots P.rden) tN109_0 kN109_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_1 : List Tok := [.split, (.A 1 2 4 1 7), .split, (.D 4), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), (.A 5 3 4 1 7), .split, .split, .split, .split, (.D 5), (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), (.A 5 3 4 1 7), .split, .split, (.A 1 2 4 1 5), .split, .split, .split, (.A 1 3 4 1 5), (.A 0 3 4 1 5), .split, (.A 1 3 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_1 : wsegOk P nbN109 (nInsideL P nbN109) kN109_1 tN109_1 kN109_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_2 : List Tok := [(.A 0 3 4 1 5), .split, (.A 0 3 4 1 5), .split, .split, (.A 1 2 4 1 5), .split, (.A 0 2 4 1 5), (.A 1 2 4 0 5), (.A 0 3 4 0 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 5), .split, (.A 5 3 4 1 5), .split, .split, (.A 1 2 4 1 5), (.A 4 3 4 0 5), .split, (.A 5 2 4 1 5), (.A 4 2 4 0 5), (.A 0 2 4 0 5), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_2 : wsegOk P nbN109 (nInsideL P nbN109) kN109_2 tN109_2 kN109_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_3 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 0 5), (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), .split, (.A 1 2 4 0 7), .split, (.A 5 2 4 0 5), .split, (.A 1 2 4 0 5), (.A 5 2 4 0 5), .split, (.A 5 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 1 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_3 : wsegOk P nbN109 (nInsideL P nbN109) kN109_3 tN109_3 kN109_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_4 : List Tok := [(.A 0 7 4 0 5), (.A 0 7 4 2 1), (.D 7), .split, .split, (.A 1 6 5 2 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7), (.A 1 6 4 2 1), .split, .split, .split, (.A 1 6 4 0 5), .split, .split, (.A 0 7 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), (.A 0 3 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 1 6 4 0 5), (.A 1 2 4 0 5), (.A 1 6 4 0 5), .split, (.A 0 2 4 0 5), .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_4 : wsegOk P nbN109 (nInsideL P nbN109) kN109_4 tN109_4 kN109_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_5 : List Tok := [.split, (.A 0 2 4 0 5), (.A 0 7 4 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, (.A 1 6 4 0 7), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 6 4 0 5), .split, (.A 1 6 4 0 3), (.A 1 6 4 0 1), .split, .split, (.A 0 2 4 0 5), .split, (.A 1 2 4 0 5), (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 7), (.A 1 6 4 0 3), .split, .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 5), .split, (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_5 : wsegOk P nbN109 (nInsideL P nbN109) kN109_5 tN109_5 kN109_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_6 : List Tok := [(.A 1 2 4 0 1), .split, (.A 1 2 4 0 3), .split, (.A 5 2 4 0 1), (.A 1 2 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, (.A 1 2 4 0 3), .split, (.A 1 2 4 0 1), (.A 1 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 2 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_6 : wsegOk P nbN109 (nInsideL P nbN109) kN109_6 tN109_6 kN109_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_7 : List Tok := [.split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, (.A 4 3 6 1 5), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 5), (.A 0 3 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 6 0 7), .split, (.A 5 2 6 1 7), (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_7 : wsegOk P nbN109 (nInsideL P nbN109) kN109_7 tN109_7 kN109_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_8 : List Tok := [.split, .split, .split, .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 4 0 5), (.A 0 2 4 0 5), (.A 4 3 6 0 5), .split, (.A 4 2 4 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 4 1 2 4 7), .split, .split, (.A 4 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), (.A 4 1 6 0 5), .split, .split, .split, .split, (.D 9), (.A 0 7 6 2 5), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_8 : wsegOk P nbN109 (nInsideL P nbN109) kN109_8 tN109_8 kN109_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN109_9 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, .split, (.A 0 2 4 0 5), (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 4 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, .split, (.A 4 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN109_9 : wsegOk P nbN109 (nInsideL P nbN109) kN109_9 tN109_9 kN109_10 = true := by
  decide +kernel

end PackLean.D28.Cub
