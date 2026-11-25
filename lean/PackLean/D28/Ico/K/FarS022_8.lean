-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey022

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_12 : List Tok := [(.A 8 1 4 2 9), .split, (.A 3 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9), .split, (.A 10 1 4 2 9), (.A 10 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_12 : wsegOk P nbN151 (nInsideL P nbN151) kN151_12 tN151_12 kN151_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_13 : List Tok := [(.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_13 : wsegOk P nbN151 (nInsideL P nbN151) kN151_13 tN151_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_0 : wsegOk P nbM151 (nInsideL P nbM151) (rRoots P.rden) tM151_0 kM151_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_1 : List Tok := [(.A 7 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 2 6 8 7 9), (.A 7 6 8 7 9), (.A 7 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_1 : wsegOk P nbM151 (nInsideL P nbM151) kM151_1 tM151_1 kM151_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), .split, (.D 3), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 7 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_2 : wsegOk P nbM151 (nInsideL P nbM151) kM151_2 tM151_2 kM151_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_3 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_3 : wsegOk P nbM151 (nInsideL P nbM151) kM151_3 tM151_3 kM151_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_4 : List Tok := [.split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 7 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, (.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_4 : wsegOk P nbM151 (nInsideL P nbM151) kM151_4 tM151_4 kM151_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_5 : List Tok := [.split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 3 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 2 5 0 2 10), (.A 3 1 4 3 9), (.A 2 5 0 2 10), (.A 3 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_5 : wsegOk P nbM151 (nInsideL P nbM151) kM151_5 tM151_5 kM151_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_6 : List Tok := [(.A 2 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_6 : wsegOk P nbM151 (nInsideL P nbM151) kM151_6 tM151_6 kM151_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_7 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 2 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_7 : wsegOk P nbM151 (nInsideL P nbM151) kM151_7 tM151_7 kM151_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM151_8 : List Tok := [.split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM151_8 : wsegOk P nbM151 (nInsideL P nbM151) kM151_8 tM151_8 [] = true := by
  decide +kernel

end PackLean.D28.Ico
