-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey023

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, .split, (.D 7), (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), (.A 8 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_0 : wsegOk P nbN152 (nInsideL P nbN152) (rRoots P.rden) tN152_0 kN152_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_1 : List Tok := [(.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_1 : wsegOk P nbN152 (nInsideL P nbN152) kN152_1 tN152_1 kN152_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_2 : List Tok := [(.A 8 1 0 7 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, .split, (.D 11), (.A 10 1 8 7 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_2 : wsegOk P nbN152 (nInsideL P nbN152) kN152_2 tN152_2 kN152_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_3 : List Tok := [(.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 0 7 10), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_3 : wsegOk P nbN152 (nInsideL P nbN152) kN152_3 tN152_3 kN152_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_4 : List Tok := [(.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 3 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 3 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_4 : wsegOk P nbN152 (nInsideL P nbN152) kN152_4 tN152_4 kN152_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_5 : List Tok := [.split, (.A 8 5 0 7 10), (.A 8 6 0 2 10), (.A 8 6 4 2 9), .split, .split, (.A 3 6 8 1 9), .split, .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 8 6 4 2 9), (.D 21), (.D 21), .split, (.A 3 6 8 2 9), .split, (.A 3 6 4 2 9), (.D 21), .split, .split, (.A 8 5 4 2 10), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_5 : wsegOk P nbN152 (nInsideL P nbN152) kN152_5 tN152_5 kN152_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_6 : List Tok := [.split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_6 : wsegOk P nbN152 (nInsideL P nbN152) kN152_6 tN152_6 kN152_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_7 : List Tok := [.split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), .split, .split, (.D 41), (.A 3 0 8 7 11), (.D 41), .split, (.A 10 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), (.A 10 0 8 7 11), (.D 40), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 10 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_7 : wsegOk P nbN152 (nInsideL P nbN152) kN152_7 tN152_7 kN152_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_8 : List Tok := [.split, .split, (.A 10 1 4 3 11), (.A 3 1 8 2 9), .split, (.A 10 1 4 3 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, (.A 10 1 4 3 9), (.D 20), (.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 7 0 3 11), (.D 1), .split, (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_8 : wsegOk P nbN152 (nInsideL P nbN152) kN152_8 tN152_8 kN152_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_9 : List Tok := [.split, .split, .split, (.A 8 1 0 3 11), (.D 1), (.A 10 1 0 3 11), (.A 8 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, .split, .split, (.A 10 1 4 3 9), .split, .split, (.A 8 1 4 8 9), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_9 : wsegOk P nbN152 (nInsideL P nbN152) kN152_9 tN152_9 kN152_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_10 : List Tok := [(.A 10 1 4 2 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), .split, .split, (.A 10 1 4 2 9), (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 10 1 4 2 9), .split, .split, (.A 3 6 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_10 : wsegOk P nbN152 (nInsideL P nbN152) kN152_10 tN152_10 kN152_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_11 : List Tok := [(.A 3 6 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 10 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), .split, (.A 3 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9), (.A 10 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_11 : wsegOk P nbN152 (nInsideL P nbN152) kN152_11 tN152_11 kN152_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN152_12 : List Tok := [(.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN152_12 : wsegOk P nbN152 (nInsideL P nbN152) kN152_12 tN152_12 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM152_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 7 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), (.A 7 6 8 7 11), (.A 7 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 7 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM152_0 : wsegOk P nbM152 (nInsideL P nbM152) (rRoots P.rden) tM152_0 kM152_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM152_1 : List Tok := [(.A 7 5 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM152_1 : wsegOk P nbM152 (nInsideL P nbM152) kM152_1 tM152_1 kM152_2 = true := by
  decide +kernel

end PackLean.D28.Ico
