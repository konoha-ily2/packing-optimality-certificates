-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey006

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_2 : List Tok := [.split, (.A 7 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 1 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_2 : wsegOk P nbM050 (nInsideL P nbM050) kM050_2 tM050_2 kM050_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_3 : List Tok := [(.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 2 1 0 3 11), (.A 3 1 4 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 3 1 4 3 11), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_3 : wsegOk P nbM050 (nInsideL P nbM050) kM050_3 tM050_3 kM050_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_4 : List Tok := [(.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 2 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_4 : wsegOk P nbM050 (nInsideL P nbM050) kM050_4 tM050_4 kM050_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_5 : List Tok := [.split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 2 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_5 : wsegOk P nbM050 (nInsideL P nbM050) kM050_5 tM050_5 kM050_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_6 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_6 : wsegOk P nbM050 (nInsideL P nbM050) kM050_6 tM050_6 kM050_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM050_7 : List Tok := [.split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM050_7 : wsegOk P nbM050 (nInsideL P nbM050) kM050_7 tM050_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 4), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_0 : wsegOk P nbN051 (nInsideL P nbN051) (rRoots P.rden) tN051_0 kN051_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_1 : List Tok := [.split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, (.A 8 5 0 3 10), (.A 0 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_1 : wsegOk P nbN051 (nInsideL P nbN051) kN051_1 tN051_1 kN051_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_2 : List Tok := [(.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 8 5 0 7 10), (.A 2 6 0 2 10), .split, (.A 8 6 8 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), (.A 8 6 8 2 9), .split, .split, .split, (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_2 : wsegOk P nbN051 (nInsideL P nbN051) kN051_2 tN051_2 kN051_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_3 : List Tok := [.split, .split, .split, (.D 13), (.A 10 1 8 3 11), (.A 8 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 8 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, (.A 10 1 4 3 9), (.A 10 1 4 3 9), (.A 10 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_3 : wsegOk P nbN051 (nInsideL P nbN051) kN051_3 tN051_3 kN051_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_4 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_4 : wsegOk P nbN051 (nInsideL P nbN051) kN051_4 tN051_4 kN051_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN051_5 : List Tok := [(.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN051_5 : wsegOk P nbN051 (nInsideL P nbN051) kN051_5 tN051_5 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_0 : wsegOk P nbM051 (nInsideL P nbM051) (rRoots P.rden) tM051_0 kM051_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_1 : List Tok := [.split, (.A 7 6 8 7 10), (.A 3 6 8 7 11), .split, (.A 3 5 0 3 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 2 6 8 7 11), (.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, (.A 7 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_1 : wsegOk P nbM051 (nInsideL P nbM051) kM051_1 tM051_1 kM051_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM051_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 3 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 1 11 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 2 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM051_2 : wsegOk P nbM051 (nInsideL P nbM051) kM051_2 tM051_2 kM051_3 = true := by
  decide +kernel

end PackLean.D28.Ico
