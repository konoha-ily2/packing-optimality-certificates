-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey017

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 3 5 0 3 4), (.A 3 5 0 3 11), .split, (.A 8 5 0 3 4), (.A 3 5 0 3 10), .split, .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 0 3 11), (.A 3 5 0 3 11), (.A 10 1 0 3 11), (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_0 : wsegOk P nbN115 (nInsideL P nbN115) (rRoots P.rden) tN115_0 kN115_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_1 : List Tok := [.split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_1 : wsegOk P nbN115 (nInsideL P nbN115) kN115_1 tN115_1 kN115_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_2 : List Tok := [(.A 3 6 8 7 11), (.D 40), .split, (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), (.A 3 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_2 : wsegOk P nbN115 (nInsideL P nbN115) kN115_2 tN115_2 kN115_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_3 : List Tok := [(.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 3 6 0 7 10), .split, (.D 3), (.A 3 6 8 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 2 10), .split, (.A 2 6 0 7 10), .split, .split, (.A 2 6 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_3 : wsegOk P nbN115 (nInsideL P nbN115) kN115_3 tN115_3 kN115_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_4 : List Tok := [(.A 2 6 8 2 9), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 3 6 8 2 9), .split, .split, .split, (.A 3 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.A 8 5 4 2 10), .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 6 4 2 9), (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 3 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_4 : wsegOk P nbN115 (nInsideL P nbN115) kN115_4 tN115_4 kN115_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_5 : List Tok := [.split, (.A 2 6 4 2 9), (.D 21), .split, .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 4 2 10), .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 3), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), .split, (.A 10 7 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_5 : wsegOk P nbN115 (nInsideL P nbN115) kN115_5 tN115_5 kN115_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_6 : List Tok := [(.A 10 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 3 1 0 3 11), .split, (.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 9 1 8 7 11), (.A 9 0 8 7 11), .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_6 : wsegOk P nbN115 (nInsideL P nbN115) kN115_6 tN115_6 kN115_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_7 : List Tok := [(.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, (.A 3 1 4 3 11), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), .split, .split, (.A 10 1 4 3 5), (.D 20), .split, (.A 10 1 4 3 9), (.D 20), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_7 : wsegOk P nbN115 (nInsideL P nbN115) kN115_7 tN115_7 kN115_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_8 : List Tok := [.split, .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 3 11), .split, .split, (.A 3 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 5 4 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 3 9), (.A 10 1 4 8 9), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_8 : wsegOk P nbN115 (nInsideL P nbN115) kN115_8 tN115_8 kN115_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_9 : List Tok := [(.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), (.A 3 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_9 : wsegOk P nbN115 (nInsideL P nbN115) kN115_9 tN115_9 kN115_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_10 : List Tok := [.split, .split, (.A 3 6 8 2 9), .split, (.A 3 6 4 2 9), (.D 21), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_10 : wsegOk P nbN115 (nInsideL P nbN115) kN115_10 tN115_10 kN115_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN115_11 : List Tok := [.split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN115_11 : wsegOk P nbN115 (nInsideL P nbN115) kN115_11 tN115_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM115_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM115_0 : wsegOk P nbM115 (nInsideL P nbM115) (rRoots P.rden) tM115_0 kM115_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM115_1 : List Tok := [.split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, (.A 7 6 8 7 11), .split, (.A 7 0 8 7 11), (.A 7 6 8 7 11), (.D 40), .split, .split, (.A 7 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM115_1 : wsegOk P nbM115 (nInsideL P nbM115) kM115_1 tM115_1 kM115_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM115_2 : List Tok := [(.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), .split, (.A 3 5 0 7 10), (.A 3 5 0 2 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM115_2 : wsegOk P nbM115 (nInsideL P nbM115) kM115_2 tM115_2 kM115_3 = true := by
  decide +kernel

end PackLean.D28.Ico
