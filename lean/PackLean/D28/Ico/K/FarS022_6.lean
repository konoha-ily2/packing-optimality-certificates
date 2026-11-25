-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey022

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_1 : List Tok := [(.A 8 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 8 5 0 3 10), .split, (.A 3 6 0 7 10), .split, (.A 3 6 0 7 10), (.A 8 6 0 7 10), .split, .split, (.A 10 1 8 3 11), (.A 3 1 8 7 11), .split, (.A 8 5 0 3 11), .split, (.A 8 6 0 7 10), (.A 8 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 3 6 8 7 10), (.D 3), .split, .split, .split, (.A 3 6 8 7 11), .split, .split, .split, (.D 11), (.A 10 1 8 7 11), (.A 3 0 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_1 : wsegOk P nbN150 (nInsideL P nbN150) kN150_1 tN150_1 kN150_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_2 : List Tok := [.split, (.A 3 6 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 3 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, .split, (.D 7), (.A 2 6 0 7 10), .split, (.D 7), (.A 2 11 0 7 10), .split, .split, (.A 8 5 0 7 10), .split, (.A 8 6 0 7 10), (.A 8 5 0 7 10), (.A 8 5 0 7 10), (.D 33), .split, .split, (.A 8 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_2 : wsegOk P nbN150 (nInsideL P nbN150) kN150_2 tN150_2 kN150_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_3 : List Tok := [(.A 8 5 0 3 10), (.A 8 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 11 0 7 10), .split, (.A 3 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, (.A 8 6 0 7 10), (.A 8 6 4 2 9), .split, .split, (.A 3 6 8 1 9), (.A 2 6 8 1 9), .split, (.A 3 6 8 2 9), (.A 3 6 8 2 9), .split, (.A 8 5 4 2 10), (.D 21)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_3 : wsegOk P nbN150 (nInsideL P nbN150) kN150_3 tN150_3 kN150_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_4 : List Tok := [(.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 10 1 8 3 11), .split, .split, (.A 8 1 0 3 11), .split, .split, (.D 13), (.A 10 1 0 3 11), .split, .split, (.A 8 7 0 3 11), (.D 1), (.A 10 1 0 3 11), .split, .split, (.A 10 1 8 3 11), .split, (.A 8 1 0 3 11), (.A 10 1 0 3 11), (.A 10 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_4 : wsegOk P nbN150 (nInsideL P nbN150) kN150_4 tN150_4 kN150_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_5 : List Tok := [.split, .split, .split, .split, .split, .split, .split, (.A 10 1 8 7 11), .split, .split, (.D 41), (.A 3 0 8 7 11), (.D 41), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 10 1 8 3 11), .split, .split, (.D 41), (.A 3 1 8 7 11), (.A 10 0 8 7 11), (.D 40), .split, .split, .split, .split, .split, (.A 3 1 8 7 11), (.A 10 1 8 7 11), (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 10 1 4 3 11), (.A 3 1 8 2 9), .split, (.A 10 1 4 3 9), .split, (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_5 : wsegOk P nbN150 (nInsideL P nbN150) kN150_5 tN150_5 kN150_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_6 : List Tok := [(.A 10 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 10 1 4 3 9), (.A 10 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 4 7 0 3 11), (.A 8 1 0 3 11), .split, (.D 9), (.A 8 7 0 3 11), .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), (.A 8 1 4 3 9), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_6 : wsegOk P nbN150 (nInsideL P nbN150) kN150_6 tN150_6 kN150_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_7 : List Tok := [(.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 10 1 4 3 9), .split, .split, .split, (.A 10 1 4 3 9), .split, (.A 4 1 4 8 9), (.A 10 1 4 2 9), (.D 1), (.A 10 1 4 2 9), (.A 10 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 8 6 4 2 9), (.A 8 1 4 2 9), (.A 3 6 4 2 9), (.A 8 5 4 2 9), .split, .split, (.A 10 1 4 2 9), .split, .split, (.A 3 6 4 2 9), .split, (.A 8 6 4 2 9), (.A 3 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_7 : wsegOk P nbN150 (nInsideL P nbN150) kN150_7 tN150_7 kN150_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_8 : List Tok := [(.A 10 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), .split, (.A 3 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, (.A 10 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_8 : wsegOk P nbN150 (nInsideL P nbN150) kN150_8 tN150_8 kN150_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN150_9 : List Tok := [.split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN150_9 : wsegOk P nbN150 (nInsideL P nbN150) kN150_9 tN150_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, (.A 7 6 2 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, .split, .split, (.D 11), .split, .split, (.D 11), (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 7 1 8 7 11), (.A 7 6 8 7 11), (.A 7 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 2 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_0 : wsegOk P nbM150 (nInsideL P nbM150) (rRoots P.rden) tM150_0 kM150_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_1 : List Tok := [(.A 3 1 8 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), (.A 3 1 0 3 11), (.A 7 6 8 7 10), (.A 7 5 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 7 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 2 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_1 : wsegOk P nbM150 (nInsideL P nbM150) kM150_1 tM150_1 kM150_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_2 : List Tok := [.split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), (.A 2 6 8 7 9), (.A 2 6 8 7 9), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_2 : wsegOk P nbM150 (nInsideL P nbM150) kM150_2 tM150_2 kM150_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_3 : List Tok := [.split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), .split, (.D 3), .split, (.A 7 6 0 7 10), .split, (.A 7 5 0 7 10), (.A 1 11 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 7 6 8 7 10), .split, (.A 2 5 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 4 2 9), .split, .split, (.A 2 6 0 2 10), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, (.A 2 5 4 2 10), (.A 2 5 4 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_3 : wsegOk P nbM150 (nInsideL P nbM150) kM150_3 tM150_3 kM150_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_4 : List Tok := [(.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, .split, (.A 3 1 8 7 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_4 : wsegOk P nbM150 (nInsideL P nbM150) kM150_4 tM150_4 kM150_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM150_5 : List Tok := [(.A 7 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), .split, .split, (.A 3 6 8 7 11), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 7 9), (.A 2 1 4 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 3 5 0 3 11), .split, (.A 3 7 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM150_5 : wsegOk P nbM150 (nInsideL P nbM150) kM150_5 tM150_5 kM150_6 = true := by
  decide +kernel

end PackLean.D28.Ico
