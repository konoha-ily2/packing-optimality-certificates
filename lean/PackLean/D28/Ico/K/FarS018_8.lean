-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey018

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_10 : List Tok := [(.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), .split, (.A 8 6 4 2 9), (.D 21), .split, (.A 3 6 4 2 9), .split, (.A 8 6 4 2 9), (.D 21), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, .split, (.A 10 1 4 2 9), (.A 10 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_10 : wsegOk P nbN127 (nInsideL P nbN127) kN127_10 tN127_10 kN127_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN127_11 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN127_11 : wsegOk P nbN127 (nInsideL P nbN127) kN127_11 tN127_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), .split, (.A 3 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_0 : wsegOk P nbM127 (nInsideL P nbM127) (rRoots P.rden) tM127_0 kM127_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_1 : List Tok := [(.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_1 : wsegOk P nbM127 (nInsideL P nbM127) kM127_1 tM127_1 kM127_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 2 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, (.A 2 6 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_2 : wsegOk P nbM127 (nInsideL P nbM127) kM127_2 tM127_2 kM127_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_3 : List Tok := [(.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_3 : wsegOk P nbM127 (nInsideL P nbM127) kM127_3 tM127_3 kM127_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_4 : List Tok := [(.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, (.A 3 6 10 2 9), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_4 : wsegOk P nbM127 (nInsideL P nbM127) kM127_4 tM127_4 kM127_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_5 : List Tok := [.split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 2 5 0 2 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 2 5 4 2 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 2 5 4 3 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_5 : wsegOk P nbM127 (nInsideL P nbM127) kM127_5 tM127_5 kM127_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_6 : List Tok := [(.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_6 : wsegOk P nbM127 (nInsideL P nbM127) kM127_6 tM127_6 kM127_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM127_7 : List Tok := [(.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM127_7 : wsegOk P nbM127 (nInsideL P nbM127) kM127_7 tM127_7 [] = true := by
  decide +kernel

end PackLean.D28.Ico
