-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey022

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 3 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), .split, (.A 3 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_0 : wsegOk P nbM148 (nInsideL P nbM148) (rRoots P.rden) tM148_0 kM148_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_1 : List Tok := [(.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 3 6 8 7 9), (.A 7 6 8 7 9), (.A 7 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_1 : wsegOk P nbM148 (nInsideL P nbM148) kM148_1 tM148_1 kM148_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), .split, (.D 3), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 2 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 7 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_2 : wsegOk P nbM148 (nInsideL P nbM148) kM148_2 tM148_2 kM148_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_3 : List Tok := [(.A 7 6 8 7 9), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_3 : wsegOk P nbM148 (nInsideL P nbM148) kM148_3 tM148_3 kM148_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_4 : List Tok := [(.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 7 6 8 7 11), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, .split, (.A 7 6 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_4 : wsegOk P nbM148 (nInsideL P nbM148) kM148_4 tM148_4 kM148_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_5 : List Tok := [(.D 40), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11), .split, (.D 9), .split, (.A 3 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 3 5 0 2 10), (.A 3 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_5 : wsegOk P nbM148 (nInsideL P nbM148) kM148_5 tM148_5 kM148_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_6 : List Tok := [.split, (.A 3 5 0 2 10), (.A 2 5 4 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, .split, (.A 2 5 4 2 10), (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_6 : wsegOk P nbM148 (nInsideL P nbM148) kM148_6 tM148_6 kM148_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_7 : List Tok := [(.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 2 5 4 2 9), (.A 3 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 3 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_7 : wsegOk P nbM148 (nInsideL P nbM148) kM148_7 tM148_7 kM148_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM148_8 : List Tok := [(.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM148_8 : wsegOk P nbM148 (nInsideL P nbM148) kM148_8 tM148_8 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 3 6 2 7 10), .split, (.A 3 6 0 7 10), .split, (.A 3 5 0 7 10), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, (.A 3 1 8 7 11), .split, (.A 10 1 8 9 11), (.A 10 1 8 7 11), .split, .split, .split, .split, (.D 13), (.A 8 5 0 3 4), (.A 8 5 0 3 4), .split, .split, (.D 13), (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, .split, .split, .split, (.A 3 1 0 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_0 : wsegOk P nbN149 (nInsideL P nbN149) (rRoots P.rden) tN149_0 kN149_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_1 : List Tok := [(.A 3 6 8 7 10), (.A 3 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11), (.A 3 5 0 7 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, .split, (.A 8 1 8 3 11), (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 8 1 0 7 11), (.A 3 6 8 7 11), .split, (.A 8 5 0 7 10), (.A 8 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 8 5 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_1 : wsegOk P nbN149 (nInsideL P nbN149) kN149_1 tN149_1 kN149_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_2 : List Tok := [(.A 8 1 0 7 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, .split, (.A 3 1 8 7 11), (.A 3 0 8 7 11), .split, .split, (.A 3 6 8 7 11), (.A 3 1 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_2 : wsegOk P nbN149 (nInsideL P nbN149) kN149_2 tN149_2 kN149_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_3 : List Tok := [.split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 0 7 10), .split, (.A 8 5 0 7 10), (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10), (.A 8 5 0 3 10), .split, (.D 9), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_3 : wsegOk P nbN149 (nInsideL P nbN149) kN149_3 tN149_3 kN149_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_4 : List Tok := [(.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), (.A 3 6 8 7 9), .split, (.A 8 5 0 7 10), .split, .split, (.A 3 6 8 7 10), .split, (.A 8 5 0 7 10), (.A 2 6 4 2 10), (.A 8 6 4 2 9), (.A 8 6 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_4 : wsegOk P nbN149 (nInsideL P nbN149) kN149_4 tN149_4 kN149_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN149_5 : List Tok := [.split, .split, .split, (.A 3 6 8 2 9), (.A 8 6 4 2 9), (.A 3 6 4 2 9), (.D 21), .split, .split, .split, (.A 8 5 4 2 10), (.D 33), (.A 8 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN149_5 : wsegOk P nbN149 (nInsideL P nbN149) kN149_5 tN149_5 kN149_6 = true := by
  decide +kernel

end PackLean.D28.Ico
