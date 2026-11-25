-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey024

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN160_11 : List Tok := [(.D 1), .split, (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), .split, .split, (.A 4 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 10 1 4 3 11), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN160_11 : wsegOk P nbN160 (nInsideL P nbN160) kN160_11 tN160_11 kN160_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN160_12 : List Tok := [(.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 10 1 4 3 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 3 6 4 2 9), .split, .split, (.A 10 1 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN160_12 : wsegOk P nbN160 (nInsideL P nbN160) kN160_12 tN160_12 kN160_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN160_13 : List Tok := [.split, (.A 8 5 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 5 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 10 1 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, .split, (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 10 1 4 2 9), (.A 3 6 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN160_13 : wsegOk P nbN160 (nInsideL P nbN160) kN160_13 tN160_13 kN160_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN160_14 : List Tok := [(.A 10 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN160_14 : wsegOk P nbN160 (nInsideL P nbN160) kN160_14 tN160_14 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 7 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 9 1 8 9 11), (.A 7 6 8 7 11), (.A 7 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_0 : wsegOk P nbM160 (nInsideL P nbM160) (rRoots P.rden) tM160_0 kM160_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_1 : List Tok := [(.A 7 6 8 7 10), (.A 7 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 7 6 8 7 9), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_1 : wsegOk P nbM160 (nInsideL P nbM160) kM160_1 tM160_1 kM160_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_2 : List Tok := [.split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 7 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 7 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_2 : wsegOk P nbM160 (nInsideL P nbM160) kM160_2 tM160_2 kM160_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_3 : List Tok := [(.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 7 0 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_3 : wsegOk P nbM160 (nInsideL P nbM160) kM160_3 tM160_3 kM160_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_4 : List Tok := [.split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, (.A 2 6 10 2 9), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), (.A 3 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_4 : wsegOk P nbM160 (nInsideL P nbM160) kM160_4 tM160_4 kM160_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_5 : List Tok := [.split, (.A 3 1 4 3 11), .split, .split, (.A 3 5 0 3 10), .split, (.A 3 1 4 3 11), .split, .split, (.A 3 5 0 3 10), .split, (.A 3 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, (.A 2 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_5 : wsegOk P nbM160 (nInsideL P nbM160) kM160_5 tM160_5 kM160_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_6 : List Tok := [(.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 2 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_6 : wsegOk P nbM160 (nInsideL P nbM160) kM160_6 tM160_6 kM160_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM160_7 : List Tok := [.split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM160_7 : wsegOk P nbM160 (nInsideL P nbM160) kM160_7 tM160_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN161_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, .split, (.D 7), (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, .split, .split, (.D 11), (.A 10 1 8 7 11), (.A 10 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.D 11), (.A 3 6 8 7 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN161_0 : wsegOk P nbN161 (nInsideL P nbN161) (rRoots P.rden) tN161_0 kN161_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN161_1 : List Tok := [(.A 8 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, .split, (.A 10 1 0 3 11), (.A 8 5 0 3 11), (.A 10 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 10 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN161_1 : wsegOk P nbN161 (nInsideL P nbN161) kN161_1 tN161_1 kN161_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN161_2 : List Tok := [.split, .split, (.A 10 1 8 3 11), .split, .split, (.A 10 1 8 7 11), .split, (.A 10 1 8 7 11), (.A 3 6 8 7 11), (.A 10 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 10 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 0 7 11), (.A 8 5 0 7 10), .split, (.A 10 1 8 7 11), (.A 8 5 0 3 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.A 10 1 0 3 11), (.A 10 1 8 7 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN161_2 : wsegOk P nbN161 (nInsideL P nbN161) kN161_2 tN161_2 kN161_3 = true := by
  decide +kernel

end PackLean.D28.Ico
