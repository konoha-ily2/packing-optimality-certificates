-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey020

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), .split, .split, (.A 3 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 3 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_0 : wsegOk P nbN134 (nInsideL P nbN134) (rRoots P.rden) tN134_0 kN134_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_1 : List Tok := [(.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), (.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, .split, .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 1 0 3 11), (.A 8 5 0 3 11), (.A 8 5 0 3 10), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 1 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_1 : wsegOk P nbN134 (nInsideL P nbN134) kN134_1 tN134_1 kN134_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_2 : List Tok := [(.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_2 : wsegOk P nbN134 (nInsideL P nbN134) kN134_2 tN134_2 kN134_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_3 : List Tok := [.split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 2 10), (.A 8 5 0 2 10), .split, (.D 9), (.A 8 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_3 : wsegOk P nbN134 (nInsideL P nbN134) kN134_3 tN134_3 kN134_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_4 : List Tok := [(.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), (.A 3 6 8 7 9), .split, .split, .split, .split, (.A 8 5 0 7 10), (.A 2 5 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 2 10), .split, (.A 2 6 0 7 10), .split, .split, .split, .split, (.A 3 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_4 : wsegOk P nbN134 (nInsideL P nbN134) kN134_4 tN134_4 kN134_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_5 : List Tok := [(.A 2 6 0 2 10), (.A 8 6 4 2 10), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), (.A 2 5 4 2 9), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 8 5 0 2 10), (.A 3 6 0 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 8 5 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), (.A 8 6 4 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_5 : wsegOk P nbN134 (nInsideL P nbN134) kN134_5 tN134_5 kN134_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_6 : List Tok := [.split, (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), .split, .split, .split, (.A 3 6 8 2 9), (.A 2 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 3), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_6 : wsegOk P nbN134 (nInsideL P nbN134) kN134_6 tN134_6 kN134_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_7 : List Tok := [.split, (.A 8 7 0 3 11), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 8 1 0 3 11), .split, (.A 10 1 4 3 11), (.A 8 1 4 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 41), (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_7 : wsegOk P nbN134 (nInsideL P nbN134) kN134_7 tN134_7 kN134_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_8 : List Tok := [.split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), (.A 3 1 4 3 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, .split, .split, (.A 10 1 4 3 11), (.A 3 1 4 3 5), .split, (.A 10 1 4 3 9), (.A 3 1 4 2 9), .split, .split, (.A 10 1 4 3 5), (.D 20), (.A 10 1 4 3 9), (.D 20), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_8 : wsegOk P nbN134 (nInsideL P nbN134) kN134_8 tN134_8 kN134_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_9 : List Tok := [(.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), (.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), .split, (.A 8 5 4 2 10), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_9 : wsegOk P nbN134 (nInsideL P nbN134) kN134_9 tN134_9 kN134_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_10 : List Tok := [.split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, (.A 8 1 4 8 9), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), .split, (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_10 : wsegOk P nbN134 (nInsideL P nbN134) kN134_10 tN134_10 kN134_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_11 : List Tok := [(.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), .split, .split, (.A 3 6 8 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), (.D 21), .split, (.A 3 6 4 2 9), .split, (.A 3 6 4 2 9), (.D 21), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, .split, (.A 10 1 4 2 9), .split, (.A 3 1 4 2 9), (.D 20), (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_11 : wsegOk P nbN134 (nInsideL P nbN134) kN134_11 tN134_11 kN134_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN134_12 : List Tok := [(.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN134_12 : wsegOk P nbN134 (nInsideL P nbN134) kN134_12 tN134_12 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM134_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 7 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM134_0 : wsegOk P nbM134 (nInsideL P nbM134) (rRoots P.rden) tM134_0 kM134_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM134_1 : List Tok := [.split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM134_1 : wsegOk P nbM134 (nInsideL P nbM134) kM134_1 tM134_1 kM134_2 = true := by
  decide +kernel

end PackLean.D28.Ico
