-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey017

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN120_6 : List Tok := [(.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN120_6 : wsegOk P nbN120 (nInsideL P nbN120) kN120_6 tN120_6 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_0 : wsegOk P nbM120 (nInsideL P nbM120) (rRoots P.rden) tM120_0 kM120_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_1 : List Tok := [(.A 3 1 0 3 11), (.A 7 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 2 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 2 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_1 : wsegOk P nbM120 (nInsideL P nbM120) kM120_1 tM120_1 kM120_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), .split, .split, (.A 7 6 0 7 10), (.A 7 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_2 : wsegOk P nbM120 (nInsideL P nbM120) kM120_2 tM120_2 kM120_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_3 : List Tok := [(.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 2 1 0 3 11), (.A 3 1 4 3 11), (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_3 : wsegOk P nbM120 (nInsideL P nbM120) kM120_3 tM120_3 kM120_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_4 : List Tok := [.split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 7 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), (.A 3 6 10 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_4 : wsegOk P nbM120 (nInsideL P nbM120) kM120_4 tM120_4 kM120_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_5 : List Tok := [(.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, .split, (.A 3 5 0 3 11), (.A 2 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 3 1 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 2 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_5 : wsegOk P nbM120 (nInsideL P nbM120) kM120_5 tM120_5 kM120_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_6 : List Tok := [.split, (.A 2 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, (.A 2 1 4 3 11), .split, .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, (.A 8 1 4 3 9), (.A 8 1 4 8 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_6 : wsegOk P nbM120 (nInsideL P nbM120) kM120_6 tM120_6 kM120_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_7 : List Tok := [(.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_7 : wsegOk P nbM120 (nInsideL P nbM120) kM120_7 tM120_7 kM120_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM120_8 : List Tok := [(.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM120_8 : wsegOk P nbM120 (nInsideL P nbM120) kM120_8 tM120_8 [] = true := by
  decide +kernel

end PackLean.D28.Ico
