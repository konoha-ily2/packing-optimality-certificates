-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey008

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_7 : List Tok := [.split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 3 6 4 2 9), (.A 3 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.A 8 6 4 2 9), .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 8 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_7 : wsegOk P nbN061 (nInsideL P nbN061) kN061_7 tN061_7 kN061_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_8 : List Tok := [(.A 8 1 4 2 9), .split, (.A 2 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_8 : wsegOk P nbN061 (nInsideL P nbN061) kN061_8 tN061_8 kN061_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN061_9 : List Tok := [(.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN061_9 : wsegOk P nbN061 (nInsideL P nbN061) kN061_9 tN061_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_0 : wsegOk P nbM061 (nInsideL P nbM061) (rRoots P.rden) tM061_0 kM061_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_1 : List Tok := [.split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, (.A 7 6 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_1 : wsegOk P nbM061 (nInsideL P nbM061) kM061_1 tM061_1 kM061_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_2 : List Tok := [(.A 2 5 0 7 10), (.D 33), .split, .split, .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 3 5 0 3 10), .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.D 3), (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_2 : wsegOk P nbM061 (nInsideL P nbM061) kM061_2 tM061_2 kM061_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_3 : List Tok := [(.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_3 : wsegOk P nbM061 (nInsideL P nbM061) kM061_3 tM061_3 kM061_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_4 : List Tok := [.split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, .split, .split, (.A 3 1 0 3 11), (.A 3 5 0 3 11), (.A 8 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 3 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_4 : wsegOk P nbM061 (nInsideL P nbM061) kM061_4 tM061_4 kM061_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_5 : List Tok := [(.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 3 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 8 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_5 : wsegOk P nbM061 (nInsideL P nbM061) kM061_5 tM061_5 kM061_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_6 : List Tok := [.split, (.A 2 5 4 2 10), .split, (.A 3 5 4 2 9), (.A 2 5 4 2 10), .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), .split, .split, (.A 8 5 4 3 10), (.A 8 5 4 3 9), (.A 8 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_6 : wsegOk P nbM061 (nInsideL P nbM061) kM061_6 tM061_6 kM061_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_7 : List Tok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), .split, (.A 3 5 4 2 9), (.A 2 6 4 2 9), (.A 3 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, (.A 3 1 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), .split, .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_7 : wsegOk P nbM061 (nInsideL P nbM061) kM061_7 tM061_7 kM061_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM061_8 : List Tok := [(.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM061_8 : wsegOk P nbM061 (nInsideL P nbM061) kM061_8 tM061_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN062_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), (.A 3 5 0 3 4), .split, (.A 8 5 0 3 4), (.A 3 5 0 3 10), .split, .split, (.D 13), .split, (.A 3 5 0 3 11), (.A 3 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN062_0 : wsegOk P nbN062 (nInsideL P nbN062) (rRoots P.rden) tN062_0 kN062_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN062_1 : List Tok := [(.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, .split, (.A 3 6 2 7 10), (.A 2 6 0 7 10), (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN062_1 : wsegOk P nbN062 (nInsideL P nbN062) kN062_1 tN062_1 kN062_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN062_2 : List Tok := [.split, .split, (.A 3 6 8 7 10), .split, (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, .split, (.A 8 5 0 3 10), .split, (.A 2 5 0 7 10), (.A 3 5 0 7 10), (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 8 5 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN062_2 : wsegOk P nbN062 (nInsideL P nbN062) kN062_2 tN062_2 kN062_3 = true := by
  decide +kernel

end PackLean.D28.Ico
