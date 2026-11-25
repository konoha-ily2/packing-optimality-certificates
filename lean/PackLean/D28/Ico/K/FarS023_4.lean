-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey023

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM154_5 : List Tok := [(.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 3 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 2 5 0 2 10), (.A 3 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM154_5 : wsegOk P nbM154 (nInsideL P nbM154) kM154_5 tM154_5 kM154_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM154_6 : List Tok := [.split, .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM154_6 : wsegOk P nbM154 (nInsideL P nbM154) kM154_6 tM154_6 kM154_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM154_7 : List Tok := [(.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 2 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM154_7 : wsegOk P nbM154 (nInsideL P nbM154) kM154_7 tM154_7 kM154_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM154_8 : List Tok := [.split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM154_8 : wsegOk P nbM154 (nInsideL P nbM154) kM154_8 tM154_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_0 : wsegOk P nbN155 (nInsideL P nbN155) (rRoots P.rden) tN155_0 kN155_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_1 : List Tok := [.split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_1 : wsegOk P nbN155 (nInsideL P nbN155) kN155_1 tN155_1 kN155_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_2 : List Tok := [.split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 8 5 0 7 10), (.A 3 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, .split, (.D 11), .split, (.D 11), (.A 10 1 8 7 11), .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_2 : wsegOk P nbN155 (nInsideL P nbN155) kN155_2 tN155_2 kN155_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_3 : List Tok := [.split, (.D 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), .split, (.D 7), .split, (.A 3 6 0 7 10), .split, (.D 7), (.A 3 6 0 7 10), .split, (.D 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_3 : wsegOk P nbN155 (nInsideL P nbN155) kN155_3 tN155_3 kN155_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_4 : List Tok := [(.A 2 5 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, (.A 8 5 0 7 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), (.A 8 5 0 7 10), .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_4 : wsegOk P nbN155 (nInsideL P nbN155) kN155_4 tN155_4 kN155_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_5 : List Tok := [(.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 8 7 10), .split, (.A 8 5 0 7 10), (.A 2 6 4 2 10), (.A 8 6 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 8 5 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 8 5 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_5 : wsegOk P nbN155 (nInsideL P nbN155) kN155_5 tN155_5 kN155_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_6 : List Tok := [(.A 8 5 4 2 9), .split, .split, (.A 3 6 8 1 9), .split, .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), (.A 3 6 8 2 9), (.D 21), .split, (.A 3 6 8 2 9), .split, (.A 3 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), .split, .split, .split, (.A 8 5 0 2 10), .split, (.D 33), (.A 8 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_6 : wsegOk P nbN155 (nInsideL P nbN155) kN155_6 tN155_6 kN155_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_7 : List Tok := [.split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 5 0 3 11), (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, .split, .split, (.D 13), (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), (.A 8 1 0 3 11), (.A 10 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_7 : wsegOk P nbN155 (nInsideL P nbN155) kN155_7 tN155_7 kN155_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_8 : List Tok := [(.A 10 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), .split, (.A 9 0 8 7 11), (.D 41), .split, (.A 10 1 8 7 11), .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_8 : wsegOk P nbN155 (nInsideL P nbN155) kN155_8 tN155_8 kN155_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_9 : List Tok := [(.A 3 0 8 7 11), (.D 40), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 10 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 10 1 4 3 11), (.A 3 1 8 2 9), .split, (.A 10 1 4 3 9), .split, (.A 3 6 4 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, .split, .split, (.A 10 1 4 3 11), .split, (.A 3 1 4 3 5), (.D 20), (.A 10 1 4 3 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_9 : wsegOk P nbN155 (nInsideL P nbN155) kN155_9 tN155_9 kN155_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN155_10 : List Tok := [(.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 7 0 3 11), (.D 1), .split, (.A 8 1 0 3 11), .split, (.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN155_10 : wsegOk P nbN155 (nInsideL P nbN155) kN155_10 tN155_10 kN155_11 = true := by
  decide +kernel

end PackLean.D28.Ico
