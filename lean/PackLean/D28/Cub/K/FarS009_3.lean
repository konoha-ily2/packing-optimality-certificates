-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey009

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_12 : List Tok := [(.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_12 : wsegOk P nbN033 (nInsideL P nbN033) kN033_12 tN033_12 kN033_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN033_13 : List Tok := [.split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN033_13 : wsegOk P nbN033 (nInsideL P nbN033) kN033_13 tN033_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_0 : wsegOk P nbM033 (nInsideL P nbM033) (rRoots P.rden) tM033_0 kM033_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_1 : List Tok := [.split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, .split, (.D 5), .split, (.A 0 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_1 : wsegOk P nbM033 (nInsideL P nbM033) kM033_1 tM033_1 kM033_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_2 : List Tok := [(.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), .split, (.A 0 7 4 1 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_2 : wsegOk P nbM033 (nInsideL P nbM033) kM033_2 tM033_2 kM033_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_3 : List Tok := [(.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_3 : wsegOk P nbM033 (nInsideL P nbM033) kM033_3 tM033_3 kM033_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_4 : List Tok := [.split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7), (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_4 : wsegOk P nbM033 (nInsideL P nbM033) kM033_4 tM033_4 kM033_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_5 : List Tok := [.split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.A 0 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_5 : wsegOk P nbM033 (nInsideL P nbM033) kM033_5 tM033_5 kM033_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_6 : List Tok := [.split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_6 : wsegOk P nbM033 (nInsideL P nbM033) kM033_6 tM033_6 kM033_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_7 : List Tok := [(.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), .split, .split, (.A 0 3 4 0 1), (.A 4 3 6 0 1), (.A 4 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), (.A 4 6 5 0 1), .split, (.A 4 3 4 0 1), (.A 4 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_7 : wsegOk P nbM033 (nInsideL P nbM033) kM033_7 tM033_7 kM033_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_8 : List Tok := [(.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 4 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, .split, .split, (.A 2 7 4 2 1), (.A 0 7 4 2 1), (.D 18), (.D 6), .split, (.A 4 7 5 2 1), .split, (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 6 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_8 : wsegOk P nbM033 (nInsideL P nbM033) kM033_8 tM033_8 kM033_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_9 : List Tok := [.split, (.D 4), .split, (.A 1 2 4 1 7), (.D 4), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, (.A 5 0 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_9 : wsegOk P nbM033 (nInsideL P nbM033) kM033_9 tM033_9 kM033_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_10 : List Tok := [(.A 1 2 4 1 3), (.A 1 2 4 1 3), .split, .split, (.A 4 2 6 1 7), (.A 5 2 6 1 7), .split, .split, .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 1 3), .split, (.A 4 2 6 1 7), (.A 4 2 4 0 3), .split, .split, (.A 5 2 4 1 3), (.A 4 2 4 1 3), (.A 4 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), (.A 5 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_10 : wsegOk P nbM033 (nInsideL P nbM033) kM033_10 tM033_10 kM033_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_11 : List Tok := [.split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), .split, (.A 1 2 4 1 7), (.A 0 6 4 0 3), (.A 1 2 5 1 3), (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_11 : wsegOk P nbM033 (nInsideL P nbM033) kM033_11 tM033_11 kM033_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM033_12 : List Tok := [(.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 4 2 5 0 3), .split, (.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1), (.A 4 6 5 0 1), .split, (.A 0 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM033_12 : wsegOk P nbM033 (nInsideL P nbM033) kM033_12 tM033_12 kM033_13 = true := by
  decide +kernel

end PackLean.D28.Cub
