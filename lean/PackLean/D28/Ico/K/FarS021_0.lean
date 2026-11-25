-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey021

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), .split, (.A 10 1 8 3 11), .split, (.A 3 1 8 7 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_0 : wsegOk P nbN140 (nInsideL P nbN140) (rRoots P.rden) tN140_0 kN140_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_1 : List Tok := [(.A 8 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_1 : wsegOk P nbN140 (nInsideL P nbN140) kN140_1 tN140_1 kN140_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_2 : List Tok := [.split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_2 : wsegOk P nbN140 (nInsideL P nbN140) kN140_2 tN140_2 kN140_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_3 : List Tok := [(.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.A 3 6 0 7 10), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), .split, (.A 8 5 0 7 10), .split, (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_3 : wsegOk P nbN140 (nInsideL P nbN140) kN140_3 tN140_3 kN140_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_4 : List Tok := [.split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_4 : wsegOk P nbN140 (nInsideL P nbN140) kN140_4 tN140_4 kN140_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_5 : List Tok := [(.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, .split, .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, .split, (.A 3 6 8 7 10), (.A 2 5 0 7 10), (.A 8 6 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 8 5 0 2 10), (.A 3 6 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 8 5 4 2 9), (.A 3 6 8 2 9), (.A 8 5 4 2 9), (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_5 : wsegOk P nbN140 (nInsideL P nbN140) kN140_5 tN140_5 kN140_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_6 : List Tok := [.split, (.A 8 5 4 2 10), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, .split, (.A 3 6 8 2 9), .split, (.A 8 6 4 2 9), (.D 21), (.A 3 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 3), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_6 : wsegOk P nbN140 (nInsideL P nbN140) kN140_6 tN140_6 kN140_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_7 : List Tok := [(.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_7 : wsegOk P nbN140 (nInsideL P nbN140) kN140_7 tN140_7 kN140_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_8 : List Tok := [.split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), .split, .split, (.D 41), (.A 3 0 8 7 11), (.D 41), .split, .split, (.A 3 1 8 7 11), (.A 10 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_8 : wsegOk P nbN140 (nInsideL P nbN140) kN140_8 tN140_8 kN140_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_9 : List Tok := [(.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5), .split, (.A 10 1 4 3 9), (.A 3 1 4 2 9), (.D 20), .split, (.A 10 1 4 3 9), .split, (.A 3 1 4 2 9), (.D 20), .split, (.A 10 1 4 3 5), (.A 10 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_9 : wsegOk P nbN140 (nInsideL P nbN140) kN140_9 tN140_9 kN140_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_10 : List Tok := [(.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_10 : wsegOk P nbN140 (nInsideL P nbN140) kN140_10 tN140_10 kN140_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_11 : List Tok := [.split, .split, (.A 10 1 4 3 9), .split, .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 8 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_11 : wsegOk P nbN140 (nInsideL P nbN140) kN140_11 tN140_11 kN140_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_12 : List Tok := [.split, .split, .split, .split, (.A 10 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), (.A 3 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 10 1 4 2 9), .split, (.A 10 1 4 2 9), .split, .split, (.A 10 1 4 2 9), (.A 8 1 4 2 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_12 : wsegOk P nbN140 (nInsideL P nbN140) kN140_12 tN140_12 kN140_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN140_13 : List Tok := [(.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN140_13 : wsegOk P nbN140 (nInsideL P nbN140) kN140_13 tN140_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM140_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM140_0 : wsegOk P nbM140 (nInsideL P nbM140) (rRoots P.rden) tM140_0 kM140_1 = true := by
  decide +kernel

end PackLean.D28.Ico
