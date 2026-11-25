-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey021

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM144_6 : List Tok := [(.A 3 1 4 3 9), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM144_6 : wsegOk P nbM144 (nInsideL P nbM144) kM144_6 tM144_6 kM144_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM144_7 : List Tok := [(.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 3 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM144_7 : wsegOk P nbM144 (nInsideL P nbM144) kM144_7 tM144_7 kM144_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM144_8 : List Tok := [(.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM144_8 : wsegOk P nbM144 (nInsideL P nbM144) kM144_8 tM144_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), .split, (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, (.A 3 5 0 3 11), (.A 10 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_0 : wsegOk P nbN145 (nInsideL P nbN145) (rRoots P.rden) tN145_0 kN145_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_1 : List Tok := [(.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, .split, (.A 10 1 0 3 11), (.A 8 5 0 3 11), (.A 10 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), (.A 3 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_1 : wsegOk P nbN145 (nInsideL P nbN145) kN145_1 tN145_1 kN145_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_2 : List Tok := [(.A 8 5 0 3 10), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, (.A 3 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_2 : wsegOk P nbN145 (nInsideL P nbN145) kN145_2 tN145_2 kN145_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_3 : List Tok := [(.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_3 : wsegOk P nbN145 (nInsideL P nbN145) kN145_3 tN145_3 kN145_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_4 : List Tok := [.split, (.A 8 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.D 3), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_4 : wsegOk P nbN145 (nInsideL P nbN145) kN145_4 tN145_4 kN145_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_5 : List Tok := [.split, .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, .split, (.A 3 6 8 7 10), (.A 2 5 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 10), (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_5 : wsegOk P nbN145 (nInsideL P nbN145) kN145_5 tN145_5 kN145_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_6 : List Tok := [.split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, .split, (.A 3 6 8 2 9), .split, (.A 3 6 4 2 9), (.D 21), (.A 3 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_6 : wsegOk P nbN145 (nInsideL P nbN145) kN145_6 tN145_6 kN145_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_7 : List Tok := [.split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), .split, (.A 10 7 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, (.A 3 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 9 1 8 7 11), (.A 9 0 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_7 : wsegOk P nbN145 (nInsideL P nbN145) kN145_7 tN145_7 kN145_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_8 : List Tok := [.split, (.A 3 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_8 : wsegOk P nbN145 (nInsideL P nbN145) kN145_8 tN145_8 kN145_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_9 : List Tok := [.split, (.A 10 1 4 3 9), (.A 3 1 4 2 9), .split, .split, (.A 10 1 4 3 5), (.D 20), (.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), (.A 3 5 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_9 : wsegOk P nbN145 (nInsideL P nbN145) kN145_9 tN145_9 kN145_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_10 : List Tok := [(.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, .split, .split, (.A 8 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, .split, (.A 8 1 4 3 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_10 : wsegOk P nbN145 (nInsideL P nbN145) kN145_10 tN145_10 kN145_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN145_11 : List Tok := [(.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 3 6 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, (.A 3 1 4 2 9), (.A 10 1 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, .split, (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN145_11 : wsegOk P nbN145 (nInsideL P nbN145) kN145_11 tN145_11 kN145_12 = true := by
  decide +kernel

end PackLean.D28.Ico
