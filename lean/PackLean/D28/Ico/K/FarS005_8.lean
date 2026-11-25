-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey005

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_0 : List Tok := [.split, .split, .split, .split, (.D 7), .split, (.D 11), .split, (.D 13), .split, .split, (.D 11), .split, (.D 7), .split, (.A 7 6 2 7 10), .split, .split, .split, (.D 7), (.A 3 6 0 7 10), (.A 7 6 8 7 10), (.A 7 6 0 7 10), .split, .split, (.D 13), .split, .split, (.D 11), .split, (.A 3 1 8 9 11), (.A 7 6 8 7 11), (.A 3 1 8 7 11), .split, (.A 3 5 0 3 11), .split, .split, .split, .split, (.A 3 6 0 7 10), (.A 3 1 0 3 11), (.A 3 6 8 7 10), .split, (.A 3 5 0 3 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_0 : wsegOk P nbM045 (nInsideL P nbM045) (rRoots P.rden) tM045_0 kM045_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_1 : List Tok := [(.A 2 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, .split, (.A 2 6 8 7 11), (.A 2 5 0 7 10), (.A 2 1 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, .split, (.A 7 6 8 7 11), (.D 40), .split, .split, (.A 2 6 8 7 10), (.A 2 6 8 7 11), (.A 2 6 8 7 9), (.D 40), .split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_1 : wsegOk P nbM045 (nInsideL P nbM045) kM045_1 tM045_1 kM045_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_2 : List Tok := [.split, (.A 7 5 0 7 10), (.A 2 5 0 7 10), (.D 33), .split, .split, .split, (.A 2 5 0 3 10), .split, (.A 2 5 0 3 11), (.A 2 5 0 3 10), (.A 2 5 0 3 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, (.A 7 6 0 7 10), (.D 3), (.A 1 11 0 7 10), .split, (.A 2 6 0 7 10), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10), .split, (.A 2 5 0 7 10), (.A 2 6 0 2 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_2 : wsegOk P nbM045 (nInsideL P nbM045) kM045_2 tM045_2 kM045_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_3 : List Tok := [.split, (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, .split, .split, (.A 2 5 4 2 10), (.D 33), (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), .split, .split, (.A 3 1 8 3 11), .split, (.A 3 1 0 3 11), (.A 2 1 0 3 11), (.A 3 1 4 3 11), .split, (.D 41), .split, (.D 1), (.A 8 1 4 3 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_3 : wsegOk P nbM045 (nInsideL P nbM045) kM045_3 tM045_3 kM045_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_4 : List Tok := [(.D 1), .split, .split, (.D 41), .split, .split, .split, .split, (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 2 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 2 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, .split, (.A 2 6 8 2 9), .split, (.A 3 6 10 2 9), (.A 2 6 10 2 9), (.D 40), (.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_4 : wsegOk P nbM045 (nInsideL P nbM045) kM045_4 tM045_4 kM045_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_5 : List Tok := [(.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 2 5 0 3 11), .split, (.A 8 7 0 3 11), .split, (.D 9), .split, (.A 8 5 0 3 11), (.A 8 7 0 3 11), .split, .split, .split, (.A 2 5 0 3 11), .split, .split, (.A 2 5 0 3 11), (.A 2 5 0 2 10), (.A 2 1 4 3 9), (.A 2 5 0 2 10), .split, .split, (.A 8 1 0 3 11), (.A 8 1 4 3 9), .split, .split, .split, (.A 8 5 0 3 11), (.A 2 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), .split, (.A 2 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_5 : wsegOk P nbM045 (nInsideL P nbM045) kM045_5 tM045_5 kM045_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_6 : List Tok := [(.A 8 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), .split, .split, (.A 8 5 6 2 10), (.A 2 5 4 2 9), (.D 31), .split, .split, (.D 1), (.A 8 1 4 3 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), .split, .split, (.A 2 5 4 2 9), (.A 0 5 4 2 9), (.D 21), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_6 : wsegOk P nbM045 (nInsideL P nbM045) kM045_6 tM045_6 kM045_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM045_7 : List Tok := [(.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM045_7 : wsegOk P nbM045 (nInsideL P nbM045) kM045_7 tM045_7 [] = true := by
  decide +kernel

end PackLean.D28.Ico
