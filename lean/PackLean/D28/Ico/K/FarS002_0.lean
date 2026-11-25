-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey002

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 2 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, (.A 3 5 0 3 4), .split, (.A 8 5 0 3 4), (.A 2 5 0 3 10), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_0 : wsegOk P nbN018 (nInsideL P nbN018) (rRoots P.rden) tN018_0 kN018_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_1 : List Tok := [.split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), .split, (.A 2 6 0 7 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 2 6 0 7 10), .split, (.A 8 1 8 3 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_1 : wsegOk P nbN018 (nInsideL P nbN018) kN018_1 tN018_1 kN018_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_2 : List Tok := [.split, .split, .split, (.A 3 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 8 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 0 5 0 2 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_2 : wsegOk P nbN018 (nInsideL P nbN018) kN018_2 tN018_2 kN018_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_3 : List Tok := [.split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 8 6 0 2 10), (.A 2 6 8 2 9), .split, (.A 8 5 4 2 10), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, .split, (.A 2 5 4 2 10), (.D 33), .split, (.A 8 5 4 2 10), (.A 0 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_3 : wsegOk P nbN018 (nInsideL P nbN018) kN018_3 tN018_3 kN018_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_4 : List Tok := [(.A 3 1 8 3 11), (.A 8 1 0 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 8 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.A 3 6 8 7 11), (.A 8 6 8 2 9), (.A 8 1 4 3 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_4 : wsegOk P nbN018 (nInsideL P nbN018) kN018_4 tN018_4 kN018_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_5 : List Tok := [.split, (.A 10 1 4 3 5), (.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_5 : wsegOk P nbN018 (nInsideL P nbN018) kN018_5 tN018_5 kN018_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_6 : List Tok := [(.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_6 : wsegOk P nbN018 (nInsideL P nbN018) kN018_6 tN018_6 kN018_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN018_7 : List Tok := [.split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN018_7 : wsegOk P nbN018 (nInsideL P nbN018) kN018_7 tN018_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 2 5 0 3 10), (.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 2 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_0 : wsegOk P nbM018 (nInsideL P nbM018) (rRoots P.rden) tM018_0 kM018_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_1 : List Tok := [(.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 2 6 8 7 10), (.D 3), .split, .split, (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 2 6 8 7 10), .split, (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_1 : wsegOk P nbM018 (nInsideL P nbM018) kM018_1 tM018_1 kM018_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_2 : List Tok := [(.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, .split, (.A 2 5 4 2 10), (.D 33), (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_2 : wsegOk P nbM018 (nInsideL P nbM018) kM018_2 tM018_2 kM018_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_3 : List Tok := [(.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 2 1 0 3 11), (.A 8 1 4 3 11), (.A 8 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 8 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_3 : wsegOk P nbM018 (nInsideL P nbM018) kM018_3 tM018_3 kM018_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_4 : List Tok := [.split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), (.A 3 1 4 3 9), .split, (.A 2 6 8 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, (.A 3 1 4 3 5), (.A 8 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 2 5 0 3 11), .split, (.A 2 5 0 3 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_4 : wsegOk P nbM018 (nInsideL P nbM018) kM018_4 tM018_4 kM018_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_5 : List Tok := [(.A 8 1 4 3 9), .split, (.A 8 5 0 2 10), (.A 2 5 4 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, .split, (.A 2 5 4 2 10), (.A 0 5 6 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 8 1 4 2 9), (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_5 : wsegOk P nbM018 (nInsideL P nbM018) kM018_5 tM018_5 kM018_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM018_6 : List Tok := [.split, .split, (.A 0 5 4 2 9), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM018_6 : wsegOk P nbM018 (nInsideL P nbM018) kM018_6 tM018_6 kM018_7 = true := by
  decide +kernel

end PackLean.D28.Ico
