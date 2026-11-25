-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey003

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_1 : List Tok := [.split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_1 : wsegOk P nbN029 (nInsideL P nbN029) kN029_1 tN029_1 kN029_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_2 : List Tok := [.split, .split, .split, (.D 7), .split, (.A 2 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 2 5 0 2 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), (.A 2 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_2 : wsegOk P nbN029 (nInsideL P nbN029) kN029_2 tN029_2 kN029_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_3 : List Tok := [(.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 3 5 0 2 10), (.A 3 6 4 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, (.A 2 5 0 2 10), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), (.A 8 5 4 2 10), (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_3 : wsegOk P nbN029 (nInsideL P nbN029) kN029_3 tN029_3 kN029_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_4 : List Tok := [(.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 4 3 11), (.A 8 1 4 3 11), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_4 : wsegOk P nbN029 (nInsideL P nbN029) kN029_4 tN029_4 kN029_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_5 : List Tok := [.split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_5 : wsegOk P nbN029 (nInsideL P nbN029) kN029_5 tN029_5 kN029_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_6 : List Tok := [(.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 5 0 3 10), (.A 8 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 8 5 0 3 10), (.A 8 5 4 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_6 : wsegOk P nbN029 (nInsideL P nbN029) kN029_6 tN029_6 kN029_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_7 : List Tok := [.split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9), .split, .split, .split, .split, (.A 8 5 4 2 9), .split, (.A 3 5 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_7 : wsegOk P nbN029 (nInsideL P nbN029) kN029_7 tN029_7 kN029_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_8 : List Tok := [(.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_8 : wsegOk P nbN029 (nInsideL P nbN029) kN029_8 tN029_8 kN029_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_9 : List Tok := [.split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_9 : wsegOk P nbN029 (nInsideL P nbN029) kN029_9 tN029_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_0 : wsegOk P nbM029 (nInsideL P nbM029) (rRoots P.rden) tM029_0 kM029_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_1 : wsegOk P nbM029 (nInsideL P nbM029) kM029_1 tM029_1 kM029_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_2 : List Tok := [.split, .split, .split, (.D 7), .split, (.A 2 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 2 11 0 7 10), (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_2 : wsegOk P nbM029 (nInsideL P nbM029) kM029_2 tM029_2 kM029_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_3 : List Tok := [(.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_3 : wsegOk P nbM029 (nInsideL P nbM029) kM029_3 tM029_3 kM029_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_4 : List Tok := [(.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_4 : wsegOk P nbM029 (nInsideL P nbM029) kM029_4 tM029_4 kM029_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM029_5 : List Tok := [.split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM029_5 : wsegOk P nbM029 (nInsideL P nbM029) kM029_5 tM029_5 kM029_6 = true := by
  decide +kernel

end PackLean.D28.Ico
