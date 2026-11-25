-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey020

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM136_5 : List Tok := [(.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 2 5 0 2 10), (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM136_5 : wsegOk P nbM136 (nInsideL P nbM136) kM136_5 tM136_5 kM136_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM136_6 : List Tok := [.split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM136_6 : wsegOk P nbM136 (nInsideL P nbM136) kM136_6 tM136_6 kM136_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM136_7 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM136_7 : wsegOk P nbM136 (nInsideL P nbM136) kM136_7 tM136_7 kM136_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM136_8 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM136_8 : wsegOk P nbM136 (nInsideL P nbM136) kM136_8 tM136_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), .split, (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_0 : wsegOk P nbN137 (nInsideL P nbN137) (rRoots P.rden) tN137_0 kN137_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_1 : List Tok := [(.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 3 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_1 : wsegOk P nbN137 (nInsideL P nbN137) kN137_1 tN137_1 kN137_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_2 : List Tok := [(.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_2 : wsegOk P nbN137 (nInsideL P nbN137) kN137_2 tN137_2 kN137_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_3 : List Tok := [(.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_3 : wsegOk P nbN137 (nInsideL P nbN137) kN137_3 tN137_3 kN137_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_4 : List Tok := [(.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, .split, .split, (.A 8 5 0 7 10), .split, (.A 2 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_4 : wsegOk P nbN137 (nInsideL P nbN137) kN137_4 tN137_4 kN137_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_5 : List Tok := [(.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, .split, (.A 2 6 8 7 10), (.A 2 5 0 7 10), .split, .split, (.A 8 6 0 2 10), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 8 5 0 2 10), (.A 3 6 0 2 10), (.A 8 6 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_5 : wsegOk P nbN137 (nInsideL P nbN137) kN137_5 tN137_5 kN137_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_6 : List Tok := [.split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, .split, (.A 3 6 8 2 9), (.A 8 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, (.A 2 5 4 2 3), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_6 : wsegOk P nbN137 (nInsideL P nbN137) kN137_6 tN137_6 kN137_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_7 : List Tok := [(.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), (.D 41), .split, (.A 3 0 8 7 11), (.D 41), (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_7 : wsegOk P nbN137 (nInsideL P nbN137) kN137_7 tN137_7 kN137_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_8 : List Tok := [.split, (.D 41), .split, (.A 10 1 8 3 11), .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, (.A 3 1 4 3 9), (.D 20), .split, (.A 10 1 4 3 9), .split, (.A 3 1 4 2 9), (.D 20), .split, (.A 10 1 4 3 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_8 : wsegOk P nbN137 (nInsideL P nbN137) kN137_8 tN137_8 kN137_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_9 : List Tok := [(.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_9 : wsegOk P nbN137 (nInsideL P nbN137) kN137_9 tN137_9 kN137_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN137_10 : List Tok := [.split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, .split, (.A 8 1 4 3 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, .split, .split, (.A 8 1 4 2 9), (.A 10 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN137_10 : wsegOk P nbN137 (nInsideL P nbN137) kN137_10 tN137_10 kN137_11 = true := by
  decide +kernel

end PackLean.D28.Ico
