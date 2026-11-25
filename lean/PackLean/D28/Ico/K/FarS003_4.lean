-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey003

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN028_6 : List Tok := [.split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.A 8 5 4 2 10), .split, (.A 3 5 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 3 11), (.A 3 1 4 3 9), (.A 8 5 4 2 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN028_6 : wsegOk P nbN028 (nInsideL P nbN028) kN028_6 tN028_6 kN028_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN028_7 : List Tok := [(.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN028_7 : wsegOk P nbN028 (nInsideL P nbN028) kN028_7 tN028_7 kN028_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN028_8 : List Tok := [(.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN028_8 : wsegOk P nbN028 (nInsideL P nbN028) kN028_8 tN028_8 kN028_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN028_9 : List Tok := [.split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN028_9 : wsegOk P nbN028 (nInsideL P nbN028) kN028_9 tN028_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_0 : wsegOk P nbM028 (nInsideL P nbM028) (rRoots P.rden) tM028_0 kM028_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_1 : wsegOk P nbM028 (nInsideL P nbM028) kM028_1 tM028_1 kM028_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_2 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_2 : wsegOk P nbM028 (nInsideL P nbM028) kM028_2 tM028_2 kM028_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_3 : List Tok := [(.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 2 5 0 2 10), (.A 2 6 4 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, .split, (.A 2 5 0 2 10), (.A 3 5 0 2 10), .split, (.A 2 5 0 2 10), .split, (.A 3 5 4 2 10), (.A 2 5 4 2 10), (.A 2 5 0 2 10), .split, (.A 3 5 4 2 10), (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_3 : wsegOk P nbM028 (nInsideL P nbM028) kM028_3 tM028_3 kM028_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_4 : List Tok := [(.A 2 6 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_4 : wsegOk P nbM028 (nInsideL P nbM028) kM028_4 tM028_4 kM028_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_5 : List Tok := [(.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_5 : wsegOk P nbM028 (nInsideL P nbM028) kM028_5 tM028_5 kM028_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_6 : List Tok := [(.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 5 0 3 10), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 3 5 0 3 10), (.A 3 5 4 2 10), .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 3 5 4 3 10), (.A 8 5 4 3 9), (.A 8 5 4 3 10), (.A 8 5 4 3 9), .split, .split, (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_6 : wsegOk P nbM028 (nInsideL P nbM028) kM028_6 tM028_6 kM028_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_7 : List Tok := [(.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, (.A 8 5 0 3 10), (.A 8 5 4 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_7 : wsegOk P nbM028 (nInsideL P nbM028) kM028_7 tM028_7 kM028_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_8 : List Tok := [.split, (.A 8 5 4 2 9), (.A 2 6 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_8 : wsegOk P nbM028 (nInsideL P nbM028) kM028_8 tM028_8 kM028_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM028_9 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM028_9 : wsegOk P nbM028 (nInsideL P nbM028) kM028_9 tM028_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN029_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN029_0 : wsegOk P nbN029 (nInsideL P nbN029) (rRoots P.rden) tN029_0 kN029_1 = true := by
  decide +kernel

end PackLean.D28.Ico
