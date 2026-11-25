-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey010

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_0 : wsegOk P nbN077 (nInsideL P nbN077) (rRoots P.rden) tN077_0 kN077_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_1 : List Tok := [.split, (.A 3 5 0 3 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 3 5 0 3 11), (.A 8 5 0 3 10), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_1 : wsegOk P nbN077 (nInsideL P nbN077) kN077_1 tN077_1 kN077_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_2 : List Tok := [.split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_2 : wsegOk P nbN077 (nInsideL P nbN077) kN077_2 tN077_2 kN077_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_3 : List Tok := [(.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 2 6 8 7 9), .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_3 : wsegOk P nbN077 (nInsideL P nbN077) kN077_3 tN077_3 kN077_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_4 : List Tok := [.split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 6 0 2 10), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 2 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_4 : wsegOk P nbN077 (nInsideL P nbN077) kN077_4 tN077_4 kN077_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_5 : List Tok := [.split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 1 4 3 11), .split, (.A 10 1 4 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_5 : wsegOk P nbN077 (nInsideL P nbN077) kN077_5 tN077_5 kN077_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_6 : List Tok := [.split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5), .split, (.A 10 1 4 3 9), (.A 3 1 4 2 9), .split, .split, (.A 10 1 4 3 5), (.D 20), (.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_6 : wsegOk P nbN077 (nInsideL P nbN077) kN077_6 tN077_6 kN077_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_7 : List Tok := [.split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, (.A 8 1 4 3 9), .split, (.A 10 1 4 3 9), .split, (.D 1), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_7 : wsegOk P nbN077 (nInsideL P nbN077) kN077_7 tN077_7 kN077_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_8 : List Tok := [(.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 8 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_8 : wsegOk P nbN077 (nInsideL P nbN077) kN077_8 tN077_8 kN077_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN077_9 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN077_9 : wsegOk P nbN077 (nInsideL P nbN077) kN077_9 tN077_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM077_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), .split, (.A 3 5 0 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM077_0 : wsegOk P nbM077 (nInsideL P nbM077) (rRoots P.rden) tM077_0 kM077_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM077_1 : List Tok := [.split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM077_1 : wsegOk P nbM077 (nInsideL P nbM077) kM077_1 tM077_1 kM077_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM077_2 : List Tok := [(.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM077_2 : wsegOk P nbM077 (nInsideL P nbM077) kM077_2 tM077_2 kM077_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM077_3 : List Tok := [(.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM077_3 : wsegOk P nbM077 (nInsideL P nbM077) kM077_3 tM077_3 kM077_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM077_4 : List Tok := [.split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM077_4 : wsegOk P nbM077 (nInsideL P nbM077) kM077_4 tM077_4 kM077_5 = true := by
  decide +kernel

end PackLean.D28.Ico
