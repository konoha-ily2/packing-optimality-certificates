-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey019

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN059_24 : List Tok := [.split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN059_24 : wsegOk P nbN059 (nInsideL P nbN059) kN059_24 tN059_24 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 1 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_0 : wsegOk P nbM059 (nInsideL P nbM059) (rRoots P.rden) tM059_0 kM059_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), .split, (.D 5), (.A 0 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5), (.A 1 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_1 : wsegOk P nbM059 (nInsideL P nbM059) kM059_1 tM059_1 kM059_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_2 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), (.A 4 3 4 1 7), .split, (.A 5 2 4 1 7), (.A 5 3 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 0 3 4 1 7), (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 5 2 4 1 7), (.A 5 2 6 1 7), .split, (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 4 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_2 : wsegOk P nbM059 (nInsideL P nbM059) kM059_2 tM059_2 kM059_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_3 : List Tok := [.split, .split, (.A 1 6 4 3 5), (.D 7), .split, .split, (.A 0 7 4 3 5), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 7), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_3 : wsegOk P nbM059 (nInsideL P nbM059) kM059_3 tM059_3 kM059_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_4 : List Tok := [.split, (.D 7), (.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_4 : wsegOk P nbM059 (nInsideL P nbM059) kM059_4 tM059_4 kM059_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_5 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_5 : wsegOk P nbM059 (nInsideL P nbM059) kM059_5 tM059_5 kM059_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_6 : List Tok := [.split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, (.A 4 3 6 1 7), .split, (.A 0 3 6 0 7), (.A 4 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_6 : wsegOk P nbM059 (nInsideL P nbM059) kM059_6 tM059_6 kM059_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_7 : List Tok := [(.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 4 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_7 : wsegOk P nbM059 (nInsideL P nbM059) kM059_7 tM059_7 kM059_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_8 : List Tok := [.split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_8 : wsegOk P nbM059 (nInsideL P nbM059) kM059_8 tM059_8 kM059_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_9 : List Tok := [.split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, (.A 0 2 6 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_9 : wsegOk P nbM059 (nInsideL P nbM059) kM059_9 tM059_9 kM059_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_10 : List Tok := [.split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1), .split, (.A 0 7 5 0 1), (.D 18), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_10 : wsegOk P nbM059 (nInsideL P nbM059) kM059_10 tM059_10 kM059_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_11 : List Tok := [.split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_11 : wsegOk P nbM059 (nInsideL P nbM059) kM059_11 tM059_11 kM059_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_12 : List Tok := [.split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), .split, (.A 0 2 4 0 3), (.A 4 2 6 0 3), .split, .split, (.A 5 2 4 0 3), .split, .split, (.A 1 2 4 0 3), (.A 0 2 4 0 3), (.A 5 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), .split, (.A 5 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_12 : wsegOk P nbM059 (nInsideL P nbM059) kM059_12 tM059_12 kM059_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM059_13 : List Tok := [(.A 5 2 6 0 3), .split, .split, .split, (.A 5 0 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 5 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM059_13 : wsegOk P nbM059 (nInsideL P nbM059) kM059_13 tM059_13 kM059_14 = true := by
  decide +kernel

end PackLean.D28.Cub
