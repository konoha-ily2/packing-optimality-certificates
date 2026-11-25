-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey015

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_3 : List Tok := [.split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_3 : wsegOk P nbM103 (nInsideL P nbM103) kM103_3 tM103_3 kM103_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_4 : List Tok := [.split, .split, (.A 3 1 0 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_4 : wsegOk P nbM103 (nInsideL P nbM103) kM103_4 tM103_4 kM103_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_5 : List Tok := [.split, .split, .split, (.A 3 6 8 7 9), (.D 40), (.A 2 6 8 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 3 5 0 3 10), (.A 3 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_5 : wsegOk P nbM103 (nInsideL P nbM103) kM103_5 tM103_5 kM103_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_6 : List Tok := [.split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.A 8 1 0 3 11), (.A 3 1 4 3 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_6 : wsegOk P nbM103 (nInsideL P nbM103) kM103_6 tM103_6 kM103_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_7 : List Tok := [(.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 3 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, .split, (.A 8 1 4 2 9), (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_7 : wsegOk P nbM103 (nInsideL P nbM103) kM103_7 tM103_7 kM103_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM103_8 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM103_8 : wsegOk P nbM103 (nInsideL P nbM103) kM103_8 tM103_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), (.A 3 5 0 3 11), .split, (.A 8 5 0 3 4), (.A 3 5 0 3 10), .split, .split, (.D 13), .split, (.A 3 5 0 3 11), .split, (.A 10 1 0 3 11), (.A 8 1 0 3 11), (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_0 : wsegOk P nbN104 (nInsideL P nbN104) (rRoots P.rden) tN104_0 kN104_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_1 : List Tok := [.split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, .split, (.A 3 6 2 7 10), (.A 3 6 0 7 10), (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_1 : wsegOk P nbN104 (nInsideL P nbN104) kN104_1 tN104_1 kN104_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_2 : List Tok := [.split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_2 : wsegOk P nbN104 (nInsideL P nbN104) kN104_2 tN104_2 kN104_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_3 : List Tok := [.split, .split, (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), .split, (.A 2 5 0 2 10), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 2 6 8 7 10), (.A 3 6 8 7 9), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_3 : wsegOk P nbN104 (nInsideL P nbN104) kN104_3 tN104_3 kN104_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_4 : List Tok := [.split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 10), .split, (.A 3 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), .split, (.A 2 5 4 2 9), .split, .split, .split, (.A 3 5 4 2 9), (.A 8 5 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_4 : wsegOk P nbN104 (nInsideL P nbN104) kN104_4 tN104_4 kN104_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_5 : List Tok := [.split, (.A 3 6 8 2 9), .split, (.A 2 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 9), (.A 8 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_5 : wsegOk P nbN104 (nInsideL P nbN104) kN104_5 tN104_5 kN104_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_6 : List Tok := [.split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), .split, (.A 10 1 4 3 11), .split, (.A 10 1 0 3 11), .split, (.A 3 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_6 : wsegOk P nbN104 (nInsideL P nbN104) kN104_6 tN104_6 kN104_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_7 : List Tok := [.split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, (.A 3 1 4 3 11), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, .split, (.A 10 1 4 3 5), (.D 20), .split, (.A 10 1 4 3 9), (.D 20), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_7 : wsegOk P nbN104 (nInsideL P nbN104) kN104_7 tN104_7 kN104_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN104_8 : List Tok := [.split, .split, .split, (.A 8 5 0 3 11), .split, (.A 3 5 0 3 10), .split, (.A 3 1 4 3 11), (.A 8 5 4 2 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, .split, (.A 10 1 4 3 11), (.A 10 1 4 3 9), (.A 8 1 4 3 9), .split, (.A 10 1 4 3 9), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN104_8 : wsegOk P nbN104 (nInsideL P nbN104) kN104_8 tN104_8 kN104_9 = true := by
  decide +kernel

end PackLean.D28.Ico
