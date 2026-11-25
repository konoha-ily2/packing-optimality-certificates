-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey018

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_3 : List Tok := [(.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_3 : wsegOk P nbM126 (nInsideL P nbM126) kM126_3 tM126_3 kM126_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_4 : List Tok := [.split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, .split, .split, (.A 3 6 8 7 9), (.D 40), (.A 2 6 8 2 9), (.A 3 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_4 : wsegOk P nbM126 (nInsideL P nbM126) kM126_4 tM126_4 kM126_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_5 : List Tok := [.split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 2 5 4 2 9), .split, (.A 2 5 0 2 10), (.A 2 5 4 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31), .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_5 : wsegOk P nbM126 (nInsideL P nbM126) kM126_5 tM126_5 kM126_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_6 : List Tok := [.split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_6 : wsegOk P nbM126 (nInsideL P nbM126) kM126_6 tM126_6 kM126_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM126_7 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM126_7 : wsegOk P nbM126 (nInsideL P nbM126) kM126_7 tM126_7 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_0 : wsegOk P nbN127 (nInsideL P nbN127) (rRoots P.rden) tN127_0 kN127_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_1 : List Tok := [(.A 8 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), .split, .split, (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_1 : wsegOk P nbN127 (nInsideL P nbN127) kN127_1 tN127_1 kN127_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_2 : List Tok := [.split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_2 : wsegOk P nbN127 (nInsideL P nbN127) kN127_2 tN127_2 kN127_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_3 : List Tok := [.split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_3 : wsegOk P nbN127 (nInsideL P nbN127) kN127_3 tN127_3 kN127_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_4 : List Tok := [(.A 2 11 0 7 10), .split, .split, (.A 3 6 0 7 10), (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, .split, .split, .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.A 2 6 0 7 10), .split, (.A 8 6 8 2 9), .split, (.A 8 5 4 2 10), (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_4 : wsegOk P nbN127 (nInsideL P nbN127) kN127_4 tN127_4 kN127_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_5 : List Tok := [.split, .split, (.A 8 6 0 2 10), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, (.A 8 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_5 : wsegOk P nbN127 (nInsideL P nbN127) kN127_5 tN127_5 kN127_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_6 : List Tok := [(.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, (.A 8 7 0 3 11), .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), .split, (.A 8 1 0 3 11), .split, (.A 10 1 4 3 11), (.A 8 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_6 : wsegOk P nbN127 (nInsideL P nbN127) kN127_6 tN127_6 kN127_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_7 : List Tok := [(.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), .split, (.A 3 1 4 3 9), (.D 20), .split, (.A 10 1 4 3 9), .split, (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_7 : wsegOk P nbN127 (nInsideL P nbN127) kN127_7 tN127_7 kN127_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_8 : List Tok := [(.D 20), .split, (.A 10 1 4 3 5), (.A 10 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_8 : wsegOk P nbN127 (nInsideL P nbN127) kN127_8 tN127_8 kN127_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_9 : List Tok := [(.D 31), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), (.A 8 1 4 3 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), .split, .split, (.A 3 6 4 2 9), .split, (.A 8 6 4 2 9), (.A 3 6 4 2 9), (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_9 : wsegOk P nbN127 (nInsideL P nbN127) kN127_9 tN127_9 kN127_10 = true := by
  decide +kernel

end PackLean.D28.Ico
