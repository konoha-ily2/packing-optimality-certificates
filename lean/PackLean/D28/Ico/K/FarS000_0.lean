-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey000

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 2 5 0 3 11), .split, .split, .split, (.A 2 1 0 7 11), (.A 2 6 8 7 10), (.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), (.A 2 6 8 7 10), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_0 : wsegOk P nbN000 (nInsideL P nbN000) (rRoots P.rden) tN000_0 kN000_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_1 : List Tok := [(.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, (.A 2 5 0 3 10), (.A 0 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 0 5 4 2 10), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_1 : wsegOk P nbN000 (nInsideL P nbN000) kN000_1 tN000_1 kN000_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_2 : List Tok := [(.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), (.A 8 1 0 3 11), .split, (.D 41), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 8 6 8 7 11), (.A 8 6 8 2 9), (.A 8 1 4 3 9), (.A 8 6 8 2 9), .split, (.D 41), .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_2 : wsegOk P nbN000 (nInsideL P nbN000) kN000_2 tN000_2 kN000_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_3 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 0 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 0 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_3 : wsegOk P nbN000 (nInsideL P nbN000) kN000_3 tN000_3 kN000_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN000_4 : List Tok := [(.D 21), .split, (.A 8 1 4 2 9), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN000_4 : wsegOk P nbN000 (nInsideL P nbN000) kN000_4 tN000_4 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 2 5 0 3 11), .split, .split, .split, (.A 2 1 0 7 11), (.A 2 6 8 7 10), (.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), (.A 2 6 8 7 10), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_0 : wsegOk P nbM000 (nInsideL P nbM000) (rRoots P.rden) tM000_0 kM000_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_1 : List Tok := [(.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 0 5 4 2 10), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_1 : wsegOk P nbM000 (nInsideL P nbM000) kM000_1 tM000_1 kM000_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_2 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), (.A 8 1 0 3 11), .split, (.D 41), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), (.A 8 6 8 2 9), .split, (.A 8 1 4 3 11), (.A 8 1 4 2 9), (.A 8 6 8 2 9), .split, (.D 41), .split, (.A 8 1 4 3 9), (.D 20), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_2 : wsegOk P nbM000 (nInsideL P nbM000) kM000_2 tM000_2 kM000_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_3 : List Tok := [(.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 0 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 0 5 4 2 9), (.D 21), .split, (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_3 : wsegOk P nbM000 (nInsideL P nbM000) kM000_3 tM000_3 kM000_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM000_4 : List Tok := [(.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM000_4 : wsegOk P nbM000 (nInsideL P nbM000) kM000_4 tM000_4 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 2 6 0 7 10), .split, (.A 3 1 8 9 11), .split, (.A 2 5 0 3 11), .split, .split, .split, (.A 2 1 0 7 11), (.A 2 6 8 7 10), (.A 2 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 2 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_0 : wsegOk P nbN001 (nInsideL P nbN001) (rRoots P.rden) tN001_0 kN001_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_1 : List Tok := [(.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, (.A 2 5 0 3 10), (.A 0 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 2 6 8 2 9), (.A 8 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 0 5 4 2 10), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_1 : wsegOk P nbN001 (nInsideL P nbN001) kN001_1 tN001_1 kN001_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_2 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, (.A 8 1 8 3 11), .split, (.D 41), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 8 6 8 7 11), (.A 8 6 8 2 9), (.A 8 1 4 3 9), (.A 8 6 8 2 9), .split, (.D 41), .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 5), (.D 20), (.D 40), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_2 : wsegOk P nbN001 (nInsideL P nbN001) kN001_2 tN001_2 kN001_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_3 : List Tok := [.split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 4 3 9), (.A 0 5 6 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, (.A 8 1 4 2 9), (.A 8 6 4 2 9), .split, (.A 0 5 4 2 9), (.D 21), .split, (.A 8 1 4 2 9), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_3 : wsegOk P nbN001 (nInsideL P nbN001) kN001_3 tN001_3 kN001_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN001_4 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN001_4 : wsegOk P nbN001 (nInsideL P nbN001) kN001_4 tN001_4 [] = true := by
  decide +kernel

end PackLean.D28.Ico
