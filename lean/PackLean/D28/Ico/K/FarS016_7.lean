-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey016

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_1 : List Tok := [(.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 9 1 8 7 11), (.A 9 0 8 7 11), (.A 3 6 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_1 : wsegOk P nbN114 (nInsideL P nbN114) kN114_1 tN114_1 kN114_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_2 : List Tok := [.split, (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10), .split, (.D 9), .split, .split, (.A 8 5 0 2 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_2 : wsegOk P nbN114 (nInsideL P nbN114) kN114_2 tN114_2 kN114_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_3 : List Tok := [(.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, (.A 2 5 0 7 10), (.A 2 5 0 2 10), .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), .split, .split, .split, (.A 3 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_3 : wsegOk P nbN114 (nInsideL P nbN114) kN114_3 tN114_3 kN114_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_4 : List Tok := [(.A 3 6 8 2 9), .split, .split, (.A 3 5 4 2 10), .split, (.A 3 5 4 2 10), (.A 8 5 4 2 10), .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 6 4 2 9), (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 3 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 2 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 4 2 10), (.A 2 5 4 2 9), (.A 8 5 4 2 3), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_4 : wsegOk P nbN114 (nInsideL P nbN114) kN114_4 tN114_4 kN114_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_5 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), .split, (.A 10 7 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.A 10 1 4 3 11), .split, (.A 10 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_5 : wsegOk P nbN114 (nInsideL P nbN114) kN114_5 tN114_5 kN114_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_6 : List Tok := [(.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 9 1 8 7 11), (.A 9 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, (.A 3 1 4 3 11), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_6 : wsegOk P nbN114 (nInsideL P nbN114) kN114_6 tN114_6 kN114_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_7 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, (.A 3 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 3 5 4 2 10), .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), (.A 8 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_7 : wsegOk P nbN114 (nInsideL P nbN114) kN114_7 tN114_7 kN114_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_8 : List Tok := [.split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 3 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_8 : wsegOk P nbN114 (nInsideL P nbN114) kN114_8 tN114_8 kN114_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_9 : List Tok := [.split, (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, (.A 3 5 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 3 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), .split, (.A 10 1 4 3 9), (.A 10 1 4 8 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_9 : wsegOk P nbN114 (nInsideL P nbN114) kN114_9 tN114_9 kN114_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN114_10 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN114_10 : wsegOk P nbN114 (nInsideL P nbN114) kN114_10 tN114_10 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_0 : wsegOk P nbM114 (nInsideL P nbM114) (rRoots P.rden) tM114_0 kM114_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_1 : List Tok := [.split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, (.A 7 6 8 7 11), .split, .split, (.A 7 1 8 7 11), (.A 7 0 8 7 11), (.A 7 6 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 10), .split, (.A 3 6 8 7 10), (.A 7 6 8 7 9), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 7 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_1 : wsegOk P nbM114 (nInsideL P nbM114) kM114_1 tM114_1 kM114_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, (.A 7 5 0 7 10), (.A 3 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 3 5 0 3 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_2 : wsegOk P nbM114 (nInsideL P nbM114) kM114_2 tM114_2 kM114_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_3 : List Tok := [.split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 6 8 7 9), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 2 5 0 2 10), (.A 2 6 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), .split, (.A 3 5 4 2 10), (.A 2 6 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_3 : wsegOk P nbM114 (nInsideL P nbM114) kM114_3 tM114_3 kM114_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_4 : List Tok := [.split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 7 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_4 : wsegOk P nbM114 (nInsideL P nbM114) kM114_4 tM114_4 kM114_5 = true := by
  decide +kernel

end PackLean.D28.Ico
