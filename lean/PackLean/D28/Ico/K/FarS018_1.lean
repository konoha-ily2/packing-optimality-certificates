-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey018

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_5 : List Tok := [(.A 2 5 0 2 10), .split, (.A 2 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, .split, (.A 3 1 0 3 11), (.A 3 1 4 3 9), .split, .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, (.A 8 1 4 3 9), (.A 8 1 4 8 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_5 : wsegOk P nbM121 (nInsideL P nbM121) kM121_5 tM121_5 kM121_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_6 : List Tok := [(.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_6 : wsegOk P nbM121 (nInsideL P nbM121) kM121_6 tM121_6 kM121_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM121_7 : List Tok := [(.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM121_7 : wsegOk P nbM121 (nInsideL P nbM121) kM121_7 tM121_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 8 5 0 3 4), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_0 : wsegOk P nbN122 (nInsideL P nbN122) (rRoots P.rden) tN122_0 kN122_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_1 : List Tok := [.split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, (.A 8 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_1 : wsegOk P nbN122 (nInsideL P nbN122) kN122_1 tN122_1 kN122_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_2 : List Tok := [(.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 8 6 0 7 10), (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_2 : wsegOk P nbN122 (nInsideL P nbN122) kN122_2 tN122_2 kN122_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_3 : List Tok := [.split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 2 6 0 7 10), .split, (.A 2 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 8 6 4 2 9), .split, (.A 8 6 8 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_3 : wsegOk P nbN122 (nInsideL P nbN122) kN122_3 tN122_3 kN122_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_4 : List Tok := [(.A 8 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 3), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_4 : wsegOk P nbN122 (nInsideL P nbN122) kN122_4 tN122_4 kN122_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_5 : List Tok := [(.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_5 : wsegOk P nbN122 (nInsideL P nbN122) kN122_5 tN122_5 kN122_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_6 : List Tok := [(.A 10 1 4 3 9), (.D 20), (.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 3 9), (.A 10 1 4 8 9), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_6 : wsegOk P nbN122 (nInsideL P nbN122) kN122_6 tN122_6 kN122_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_7 : List Tok := [(.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 8 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_7 : wsegOk P nbN122 (nInsideL P nbN122) kN122_7 tN122_7 kN122_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN122_8 : List Tok := [(.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN122_8 : wsegOk P nbN122 (nInsideL P nbN122) kN122_8 tN122_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM122_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM122_0 : wsegOk P nbM122 (nInsideL P nbM122) (rRoots P.rden) tM122_0 kM122_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM122_1 : List Tok := [(.A 7 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), (.A 2 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM122_1 : wsegOk P nbM122 (nInsideL P nbM122) kM122_1 tM122_1 kM122_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM122_2 : List Tok := [.split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 2 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM122_2 : wsegOk P nbM122 (nInsideL P nbM122) kM122_2 tM122_2 kM122_3 = true := by
  decide +kernel

end PackLean.D28.Ico
