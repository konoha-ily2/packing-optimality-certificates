-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey011

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN080_10 : List Tok := [(.A 8 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 8 1 4 2 9), (.A 8 1 4 2 9), (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN080_10 : wsegOk P nbN080 (nInsideL P nbN080) kN080_10 tN080_10 kN080_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN080_11 : List Tok := [(.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN080_11 : wsegOk P nbN080 (nInsideL P nbN080) kN080_11 tN080_11 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, .split, (.A 7 6 2 7 10), (.A 7 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 3 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_0 : wsegOk P nbM080 (nInsideL P nbM080) (rRoots P.rden) tM080_0 kM080_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_1 : List Tok := [.split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, (.A 7 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 7 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 10), .split, (.A 3 6 8 7 11), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_1 : wsegOk P nbM080 (nInsideL P nbM080) kM080_1 tM080_1 kM080_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_2 : List Tok := [(.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, (.A 7 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), .split, (.A 2 5 0 7 10), .split, .split, (.A 3 5 0 3 10), .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 7 11 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_2 : wsegOk P nbM080 (nInsideL P nbM080) kM080_2 tM080_2 kM080_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_3 : List Tok := [(.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_3 : wsegOk P nbM080 (nInsideL P nbM080) kM080_3 tM080_3 kM080_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_4 : List Tok := [(.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_4 : wsegOk P nbM080 (nInsideL P nbM080) kM080_4 tM080_4 kM080_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_5 : List Tok := [.split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, (.A 3 6 10 2 9), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), .split, (.A 2 5 0 3 10), (.A 2 5 4 2 10), .split, (.A 3 1 4 3 11), .split, (.A 3 5 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_5 : wsegOk P nbM080 (nInsideL P nbM080) kM080_5 tM080_5 kM080_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_6 : List Tok := [(.A 2 5 4 2 9), .split, (.A 2 5 0 2 10), (.A 2 5 4 2 10), .split, .split, (.A 8 1 0 3 11), (.A 3 1 4 3 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_6 : wsegOk P nbM080 (nInsideL P nbM080) kM080_6 tM080_6 kM080_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_7 : List Tok := [(.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 2 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_7 : wsegOk P nbM080 (nInsideL P nbM080) kM080_7 tM080_7 kM080_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM080_8 : List Tok := [.split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM080_8 : wsegOk P nbM080 (nInsideL P nbM080) kM080_8 tM080_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), (.A 3 1 8 7 11), .split, .split, .split, .split, (.D 13), (.A 3 5 0 3 4), .split, (.A 8 5 0 3 4), (.A 3 5 0 3 10), .split, .split, (.D 13), .split, (.A 3 5 0 3 11), (.A 3 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_0 : wsegOk P nbN081 (nInsideL P nbN081) (rRoots P.rden) tN081_0 kN081_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_1 : List Tok := [(.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 3 6 8 7 11), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), (.D 3), (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_1 : wsegOk P nbN081 (nInsideL P nbN081) kN081_1 tN081_1 kN081_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_2 : List Tok := [(.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), .split, .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), .split, .split, (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 8 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_2 : wsegOk P nbN081 (nInsideL P nbN081) kN081_2 tN081_2 kN081_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN081_3 : List Tok := [(.A 8 5 0 2 10), .split, (.D 9), .split, (.A 2 5 0 2 10), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 6 0 7 10), (.A 2 6 8 7 9), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 3 5 0 2 10), .split, (.A 3 6 0 2 10), (.A 3 6 4 2 10), .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN081_3 : wsegOk P nbN081 (nInsideL P nbN081) kN081_3 tN081_3 kN081_4 = true := by
  decide +kernel

end PackLean.D28.Ico
