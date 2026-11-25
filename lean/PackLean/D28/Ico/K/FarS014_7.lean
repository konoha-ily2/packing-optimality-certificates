-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey014

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_8 : List Tok := [(.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), (.A 3 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, (.A 3 5 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 2 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, (.A 3 1 4 2 9), (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_8 : wsegOk P nbN102 (nInsideL P nbN102) kN102_8 tN102_8 kN102_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN102_9 : List Tok := [(.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN102_9 : wsegOk P nbN102 (nInsideL P nbN102) kN102_9 tN102_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_0 : wsegOk P nbM102 (nInsideL P nbM102) (rRoots P.rden) tM102_0 kM102_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_1 : List Tok := [.split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 7 6 8 7 11), .split, .split, (.A 9 1 8 7 11), (.A 7 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 10), (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_1 : wsegOk P nbM102 (nInsideL P nbM102) kM102_1 tM102_1 kM102_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_2 : List Tok := [.split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 0 7 10), (.A 2 11 0 7 10), (.A 3 5 0 7 10), (.D 33), .split, .split, .split, (.A 3 5 0 3 10), .split, (.A 3 5 0 3 11), (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), (.A 3 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_2 : wsegOk P nbM102 (nInsideL P nbM102) kM102_2 tM102_2 kM102_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_3 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), (.A 2 6 8 7 9), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 3 5 0 2 10), (.A 2 6 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_3 : wsegOk P nbM102 (nInsideL P nbM102) kM102_3 tM102_3 kM102_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_4 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, .split, .split, (.A 3 1 0 3 11), (.A 3 5 0 3 11), .split, (.A 10 1 0 3 11), .split, (.A 10 7 0 3 11), (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 3 1 4 3 11), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_4 : wsegOk P nbM102 (nInsideL P nbM102) kM102_4 tM102_4 kM102_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_5 : List Tok := [.split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 3 6 8 2 9), .split, (.A 3 6 10 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_5 : wsegOk P nbM102 (nInsideL P nbM102) kM102_5 tM102_5 kM102_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_6 : List Tok := [.split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 3 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 3 5 4 2 10), .split, .split, (.A 3 1 0 3 11), (.A 3 1 4 3 9), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_6 : wsegOk P nbM102 (nInsideL P nbM102) kM102_6 tM102_6 kM102_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_7 : List Tok := [(.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, .split, (.A 8 1 4 3 11), (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), (.A 2 5 4 2 9), .split, (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_7 : wsegOk P nbM102 (nInsideL P nbM102) kM102_7 tM102_7 kM102_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_8 : List Tok := [.split, (.A 8 1 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 3 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_8 : wsegOk P nbM102 (nInsideL P nbM102) kM102_8 tM102_8 kM102_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM102_9 : List Tok := [.split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM102_9 : wsegOk P nbM102 (nInsideL P nbM102) kM102_9 tM102_9 [] = true := by
  decide +kernel

end PackLean.D28.Ico
