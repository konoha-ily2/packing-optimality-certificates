-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey022

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_6 : List Tok := [.split, (.D 9), .split, (.A 3 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, (.A 2 5 0 3 10), .split, (.A 2 1 4 3 11), .split, .split, (.A 2 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_6 : wsegOk P nbM150 (nInsideL P nbM150) kM150_6 tM150_6 kM150_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_7 : List Tok := [.split, .split, (.A 2 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 2 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_7 : wsegOk P nbM150 (nInsideL P nbM150) kM150_7 tM150_7 kM150_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_8 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_8 : wsegOk P nbM150 (nInsideL P nbM150) kM150_8 tM150_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, .split, (.D 13), (.A 8 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_0 : wsegOk P nbN151 (nInsideL P nbN151) (rRoots P.rden) tN151_0 kN151_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_1 : List Tok := [(.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_1 : wsegOk P nbN151 (nInsideL P nbN151) kN151_1 tN151_1 kN151_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_2 : List Tok := [(.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 8 5 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_2 : wsegOk P nbN151 (nInsideL P nbN151) kN151_2 tN151_2 kN151_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_3 : List Tok := [(.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), .split, (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_3 : wsegOk P nbN151 (nInsideL P nbN151) kN151_3 tN151_3 kN151_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_4 : List Tok := [.split, (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.D 3), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_4 : wsegOk P nbN151 (nInsideL P nbN151) kN151_4 tN151_4 kN151_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_5 : List Tok := [.split, .split, (.A 3 6 8 7 10), .split, .split, .split, .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), (.A 2 6 4 2 10), (.A 8 6 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 8 5 0 2 10), (.A 8 6 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_5 : wsegOk P nbN151 (nInsideL P nbN151) kN151_5 tN151_5 kN151_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_6 : List Tok := [(.A 3 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_6 : wsegOk P nbN151 (nInsideL P nbN151) kN151_6 tN151_6 kN151_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_7 : List Tok := [(.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), .split, .split, (.D 41), (.A 3 0 8 7 11), (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_7 : wsegOk P nbN151 (nInsideL P nbN151) kN151_7 tN151_7 kN151_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_8 : List Tok := [.split, (.A 10 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 10 1 4 3 11), (.A 3 1 8 2 9), .split, (.A 10 1 4 3 9), .split, (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_8 : wsegOk P nbN151 (nInsideL P nbN151) kN151_8 tN151_8 kN151_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_9 : List Tok := [(.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, .split, .split, (.A 10 1 4 3 11), .split, (.A 3 1 4 3 5), (.D 20), (.A 10 1 4 3 9), (.D 20), (.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 8 1 0 3 11), (.A 8 7 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_9 : wsegOk P nbN151 (nInsideL P nbN151) kN151_9 tN151_9 kN151_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_10 : List Tok := [.split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, .split, .split, (.A 10 1 4 3 9), .split, (.A 8 1 4 8 9), (.A 10 1 4 2 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_10 : wsegOk P nbN151 (nInsideL P nbN151) kN151_10 tN151_10 kN151_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN151_11 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, .split, (.A 10 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 3 6 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN151_11 : wsegOk P nbN151 (nInsideL P nbN151) kN151_11 tN151_11 kN151_12 = true := by
  decide +kernel

end PackLean.D28.Ico
