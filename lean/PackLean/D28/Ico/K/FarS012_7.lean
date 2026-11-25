-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey012

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN090_5 : List Tok := [(.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), (.A 3 6 8 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN090_5 : wsegOk P nbN090 (nInsideL P nbN090) kN090_5 tN090_5 kN090_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN090_6 : List Tok := [(.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 8 1 0 3 11), (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 3 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 8 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN090_6 : wsegOk P nbN090 (nInsideL P nbN090) kN090_6 tN090_6 kN090_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN090_7 : List Tok := [(.A 8 1 4 2 9), .split, (.D 9), .split, (.A 8 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), .split, (.A 10 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, (.A 8 5 4 2 9), .split, (.A 2 5 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN090_7 : wsegOk P nbN090 (nInsideL P nbN090) kN090_7 tN090_7 kN090_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN090_8 : List Tok := [.split, (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 8 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), .split, (.A 2 6 4 2 9), .split, (.A 3 6 4 2 9), (.A 8 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), .split, (.A 3 1 4 3 9), (.A 8 1 4 8 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN090_8 : wsegOk P nbN090 (nInsideL P nbN090) kN090_8 tN090_8 kN090_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN090_9 : List Tok := [(.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN090_9 : wsegOk P nbN090 (nInsideL P nbN090) kN090_9 tN090_9 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), (.A 3 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), (.A 3 1 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, .split, (.A 3 6 8 7 10), (.A 3 5 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10), (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_0 : wsegOk P nbM090 (nInsideL P nbM090) (rRoots P.rden) tM090_0 kM090_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_1 : List Tok := [.split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, .split, .split, (.D 11), (.A 3 6 8 7 11), .split, (.A 3 0 8 7 11), (.A 3 6 8 7 11), (.D 40), .split, .split, (.A 3 6 8 7 10), (.A 3 6 8 7 11), (.A 7 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), .split, .split, (.A 3 6 0 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_1 : wsegOk P nbM090 (nInsideL P nbM090) kM090_1 tM090_1 kM090_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_2 : List Tok := [(.A 2 11 0 7 10), .split, (.A 3 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 3 5 0 3 10), (.A 8 5 0 3 10), .split, (.A 3 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), .split, (.D 9), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.A 2 11 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, .split, (.A 2 6 0 7 10), (.A 2 6 8 7 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_2 : wsegOk P nbM090 (nInsideL P nbM090) kM090_2 tM090_2 kM090_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_3 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, .split, (.A 3 6 8 7 10), .split, (.A 3 5 0 2 10), (.A 2 6 0 2 10), .split, .split, (.A 3 6 0 2 10), (.A 3 6 8 2 9), (.A 3 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, .split, (.D 13), (.A 3 1 8 3 11), .split, .split, .split, (.A 3 1 0 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_3 : wsegOk P nbM090 (nInsideL P nbM090) kM090_3 tM090_3 kM090_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_4 : List Tok := [(.A 3 5 0 3 11), .split, (.A 10 1 0 3 11), (.A 8 1 0 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), .split, (.A 3 1 4 3 11), (.A 10 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, .split, (.A 3 0 8 7 11), (.A 3 1 8 7 11), .split, (.D 41), .split, (.A 3 1 8 3 11), (.A 3 0 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_4 : wsegOk P nbM090 (nInsideL P nbM090) kM090_4 tM090_4 kM090_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_5 : List Tok := [(.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 3 6 8 2 9), (.A 3 6 10 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 3 5 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_5 : wsegOk P nbM090 (nInsideL P nbM090) kM090_5 tM090_5 kM090_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_6 : List Tok := [.split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 8 5 0 2 10), (.A 8 5 4 2 10), .split, .split, (.A 8 1 0 3 11), .split, (.A 3 1 4 3 9), (.A 3 1 4 3 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 8 1 4 2 9), .split, (.D 9), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 8 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_6 : wsegOk P nbM090 (nInsideL P nbM090) kM090_6 tM090_6 kM090_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_7 : List Tok := [(.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 3 6 4 2 9), .split, .split, (.A 2 5 4 2 9), (.A 8 5 4 2 9), (.A 2 5 4 2 9), .split, (.A 3 1 4 2 9), .split, (.A 8 1 4 2 9), .split, .split, (.A 3 6 4 2 9), (.A 8 5 4 2 9), (.A 8 1 4 2 9), (.A 2 6 4 2 9), .split, (.A 8 5 4 2 9), (.D 21), .split, .split, .split, .split, (.A 3 1 4 2 9), (.A 8 1 4 2 9), (.A 8 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_7 : wsegOk P nbM090 (nInsideL P nbM090) kM090_7 tM090_7 kM090_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM090_8 : List Tok := [(.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM090_8 : wsegOk P nbM090 (nInsideL P nbM090) kM090_8 tM090_8 [] = true := by
  decide +kernel

end PackLean.D28.Ico
