-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey021

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_1 : List Tok := [(.A 7 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 2 6 8 7 9), (.A 7 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_1 : wsegOk P nbM140 (nInsideL P nbM140) kM140_1 tM140_1 kM140_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_2 : List Tok := [(.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), .split, (.D 3), .split, (.A 7 6 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_2 : wsegOk P nbM140 (nInsideL P nbM140) kM140_2 tM140_2 kM140_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_3 : List Tok := [.split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 6 8 7 9), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_3 : wsegOk P nbM140 (nInsideL P nbM140) kM140_3 tM140_3 kM140_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_4 : List Tok := [.split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_4 : wsegOk P nbM140 (nInsideL P nbM140) kM140_4 tM140_4 kM140_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_5 : List Tok := [(.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 3 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), (.A 3 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_5 : wsegOk P nbM140 (nInsideL P nbM140) kM140_5 tM140_5 kM140_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_6 : List Tok := [.split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_6 : wsegOk P nbM140 (nInsideL P nbM140) kM140_6 tM140_6 kM140_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_7 : List Tok := [.split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_7 : wsegOk P nbM140 (nInsideL P nbM140) kM140_7 tM140_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), (.A 3 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), .split, (.A 10 5 0 3 11), (.A 10 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_0 : wsegOk P nbN141 (nInsideL P nbN141) (rRoots P.rden) tN141_0 kN141_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_1 : List Tok := [(.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, .split, (.A 3 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_1 : wsegOk P nbN141 (nInsideL P nbN141) kN141_1 tN141_1 kN141_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_2 : List Tok := [(.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_2 : wsegOk P nbN141 (nInsideL P nbN141) kN141_2 tN141_2 kN141_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_3 : List Tok := [.split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_3 : wsegOk P nbN141 (nInsideL P nbN141) kN141_3 tN141_3 kN141_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_4 : List Tok := [(.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 7 10), (.A 8 5 0 2 10), .split, (.A 2 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 3 5 4 2 10), (.A 8 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_4 : wsegOk P nbN141 (nInsideL P nbN141) kN141_4 tN141_4 kN141_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_5 : List Tok := [(.A 8 5 4 2 10), (.A 3 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, (.A 2 6 8 2 9), (.A 3 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), .split, (.A 8 5 4 2 10), (.A 8 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_5 : wsegOk P nbN141 (nInsideL P nbN141) kN141_5 tN141_5 kN141_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_6 : List Tok := [.split, (.A 10 1 0 3 11), .split, (.A 10 7 0 3 11), (.A 10 1 0 3 11), .split, .split, .split, (.A 10 1 8 3 11), (.A 3 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), (.A 3 1 0 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 9 1 8 7 11), (.A 9 0 8 7 11), .split, (.A 3 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_6 : wsegOk P nbN141 (nInsideL P nbN141) kN141_6 tN141_6 kN141_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN141_7 : List Tok := [.split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5), (.A 3 1 4 3 9), .split, .split, (.A 10 1 4 3 5), (.D 20), (.A 10 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN141_7 : wsegOk P nbN141 (nInsideL P nbN141) kN141_7 tN141_7 kN141_8 = true := by
  decide +kernel

end PackLean.D28.Ico
