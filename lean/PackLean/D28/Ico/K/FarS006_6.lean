-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey006

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_3 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, (.A 2 1 0 3 11), (.A 3 1 4 3 11), (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_3 : wsegOk P nbM051 (nInsideL P nbM051) kM051_3 tM051_3 kM051_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_4 : List Tok := [.split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_4 : wsegOk P nbM051 (nInsideL P nbM051) kM051_4 tM051_4 kM051_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_5 : List Tok := [(.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 2 5 0 3 11), .split, (.A 8 7 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 2 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, .split, (.A 8 1 0 3 11), (.A 2 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_5 : wsegOk P nbM051 (nInsideL P nbM051) kM051_5 tM051_5 kM051_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_6 : List Tok := [.split, .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_6 : wsegOk P nbM051 (nInsideL P nbM051) kM051_6 tM051_6 kM051_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_7 : List Tok := [(.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_7 : wsegOk P nbM051 (nInsideL P nbM051) kM051_7 tM051_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), .split, .split, (.D 13), (.A 3 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_0 : wsegOk P nbN052 (nInsideL P nbN052) (rRoots P.rden) tN052_0 kN052_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_1 : List Tok := [(.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 8 6 0 7 10), .split, (.A 8 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_1 : wsegOk P nbN052 (nInsideL P nbN052) kN052_1 tN052_1 kN052_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_2 : List Tok := [.split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_2 : wsegOk P nbN052 (nInsideL P nbN052) kN052_2 tN052_2 kN052_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_3 : List Tok := [(.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, (.A 8 6 8 2 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), (.A 8 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_3 : wsegOk P nbN052 (nInsideL P nbN052) kN052_3 tN052_3 kN052_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_4 : List Tok := [(.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), .split, (.A 8 1 8 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), (.A 8 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_4 : wsegOk P nbN052 (nInsideL P nbN052) kN052_4 tN052_4 kN052_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_5 : List Tok := [(.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5), .split, (.A 10 1 4 3 9), .split, (.A 3 1 4 2 9), (.D 20), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_5 : wsegOk P nbN052 (nInsideL P nbN052) kN052_5 tN052_5 kN052_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_6 : List Tok := [.split, (.A 8 1 4 3 9), .split, (.A 10 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_6 : wsegOk P nbN052 (nInsideL P nbN052) kN052_6 tN052_6 kN052_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN052_7 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN052_7 : wsegOk P nbN052 (nInsideL P nbN052) kN052_7 tN052_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM052_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM052_0 : wsegOk P nbM052 (nInsideL P nbM052) (rRoots P.rden) tM052_0 kM052_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM052_1 : List Tok := [.split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 2 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, (.A 7 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, (.A 7 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM052_1 : wsegOk P nbM052 (nInsideL P nbM052) kM052_1 tM052_1 kM052_2 = true := by
  decide +kernel

end PackLean.D28.Ico
