-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey009

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM032_16 : List Tok := [(.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), .split, (.A 4 2 7 4 1), (.A 6 3 7 4 5), (.A 6 3 7 4 1), (.D 6), .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 19), (.A 4 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM032_16 : wsegOk P nbM032 (nInsideL P nbM032) kM032_16 tM032_16 kM032_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM032_17 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM032_17 : wsegOk P nbM032 (nInsideL P nbM032) kM032_17 tM032_17 kM032_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM032_18 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM032_18 : wsegOk P nbM032 (nInsideL P nbM032) kM032_18 tM032_18 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 5 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_0 : wsegOk P nbN033 (nInsideL P nbN033) (rRoots P.rden) tN033_0 kN033_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_1 : List Tok := [(.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 5 2 4 1 7), (.A 5 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 0 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_1 : wsegOk P nbN033 (nInsideL P nbN033) kN033_1 tN033_1 kN033_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_2 : List Tok := [.split, (.A 1 6 4 1 7), (.A 0 6 4 0 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 2 4 0 7), .split, .split, (.A 4 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_2 : wsegOk P nbN033 (nInsideL P nbN033) kN033_2 tN033_2 kN033_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_3 : List Tok := [(.A 0 2 4 0 7), (.A 4 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 4 2 4 0 1), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), (.A 4 6 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 6 4 0 1), (.A 4 2 4 0 1), .split, .split, .split, (.A 4 2 4 0 7), (.A 5 2 4 0 3), (.A 4 6 4 0 3), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_3 : wsegOk P nbN033 (nInsideL P nbN033) kN033_3 tN033_3 kN033_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_4 : List Tok := [.split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, (.A 0 3 2 1 5), .split, (.D 2), .split, (.D 6), (.A 2 3 6 0 5), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_4 : wsegOk P nbN033 (nInsideL P nbN033) kN033_4 tN033_4 kN033_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_5 : List Tok := [.split, (.D 2), (.D 2), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 0 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 4 3 4 0 5), (.A 4 3 6 0 5), .split, (.A 0 7 4 2 1), (.A 4 7 4 0 1), (.A 4 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 4 0 5), (.A 4 3 4 0 1), (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_5 : wsegOk P nbN033 (nInsideL P nbN033) kN033_5 tN033_5 kN033_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_6 : List Tok := [(.A 4 2 6 0 1), .split, (.A 4 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_6 : wsegOk P nbN033 (nInsideL P nbN033) kN033_6 tN033_6 kN033_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_7 : List Tok := [(.A 4 0 6 5 3), .split, .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, (.A 5 0 6 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_7 : wsegOk P nbN033 (nInsideL P nbN033) kN033_7 tN033_7 kN033_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_8 : List Tok := [(.A 5 2 5 0 3), .split, (.A 4 6 5 0 3), (.A 5 6 5 0 3), .split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), (.A 5 6 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_8 : wsegOk P nbN033 (nInsideL P nbN033) kN033_8 tN033_8 kN033_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_9 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), (.A 4 1 2 4 7), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.A 4 2 6 0 7), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, .split, (.A 4 0 6 5 3), (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), (.A 5 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_9 : wsegOk P nbN033 (nInsideL P nbN033) kN033_9 tN033_9 kN033_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_10 : List Tok := [.split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), (.A 6 2 7 4 5), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), (.A 6 2 7 4 5), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_10 : wsegOk P nbN033 (nInsideL P nbN033) kN033_10 tN033_10 kN033_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_11 : List Tok := [(.A 7 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 7 4 1), .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, .split, (.A 4 2 7 4 1), .split, (.D 19), (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_11 : wsegOk P nbN033 (nInsideL P nbN033) kN033_11 tN033_11 kN033_12 = true := by
  decide +kernel

end PackLean.D28.Cub
