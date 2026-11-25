-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey008

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_3 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 2 5 0 2 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, (.A 2 5 0 2 10), .split, (.A 3 5 4 2 10), (.A 2 5 4 2 10), (.A 2 6 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_3 : wsegOk P nbM063 (nInsideL P nbM063) kM063_3 tM063_3 kM063_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_4 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 3 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, .split, (.A 3 1 4 3 11), (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_4 : wsegOk P nbM063 (nInsideL P nbM063) kM063_4 tM063_4 kM063_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_5 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_5 : wsegOk P nbM063 (nInsideL P nbM063) kM063_5 tM063_5 kM063_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_6 : List Tok := [.split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 8 5 0 3 10), .split, (.A 3 5 4 2 10), (.A 8 5 4 2 9), .split, (.A 3 1 4 3 11), (.A 8 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_6 : wsegOk P nbM063 (nInsideL P nbM063) kM063_6 tM063_6 kM063_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_7 : List Tok := [(.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), (.A 3 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 3 5 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 1 4 2 9), .split, (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_7 : wsegOk P nbM063 (nInsideL P nbM063) kM063_7 tM063_7 kM063_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_8 : List Tok := [(.A 2 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_8 : wsegOk P nbM063 (nInsideL P nbM063) kM063_8 tM063_8 kM063_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM063_9 : List Tok := [(.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM063_9 : wsegOk P nbM063 (nInsideL P nbM063) kM063_9 tM063_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), (.A 3 5 0 3 4), .split, (.A 3 5 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_0 : wsegOk P nbN064 (nInsideL P nbN064) (rRoots P.rden) tN064_0 kN064_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, (.A 7 6 8 7 10), (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), .split, .split, (.A 7 6 8 7 9), (.A 2 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_1 : wsegOk P nbN064 (nInsideL P nbN064) kN064_1 tN064_1 kN064_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_2 : List Tok := [.split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), (.A 3 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_2 : wsegOk P nbN064 (nInsideL P nbN064) kN064_2 tN064_2 kN064_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_3 : List Tok := [.split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 2 5 0 2 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_3 : wsegOk P nbN064 (nInsideL P nbN064) kN064_3 tN064_3 kN064_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_4 : List Tok := [.split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, .split, .split, (.A 8 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.A 3 1 4 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_4 : wsegOk P nbN064 (nInsideL P nbN064) kN064_4 tN064_4 kN064_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_5 : List Tok := [(.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 7 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_5 : wsegOk P nbN064 (nInsideL P nbN064) kN064_5 tN064_5 kN064_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_6 : List Tok := [.split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 1 0 3 11), (.A 8 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 8 5 0 3 10), (.A 8 5 4 2 10), .split, .split, (.A 8 1 4 3 11), (.A 3 1 4 3 9), (.A 8 5 4 2 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_6 : wsegOk P nbN064 (nInsideL P nbN064) kN064_6 tN064_6 kN064_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN064_7 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, .split, .split, (.A 3 5 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN064_7 : wsegOk P nbN064 (nInsideL P nbN064) kN064_7 tN064_7 kN064_8 = true := by
  decide +kernel

end PackLean.D28.Ico
