-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey020

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_1 : List Tok := [.split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 5 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, .split, (.D 5), (.A 1 2 4 1 7), (.A 0 3 4 1 7), (.A 4 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_1 : wsegOk P nbM062 (nInsideL P nbM062) kM062_1 tM062_1 kM062_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_2 : List Tok := [(.A 0 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 4 2 6 1 7), .split, (.A 0 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_2 : wsegOk P nbM062 (nInsideL P nbM062) kM062_2 tM062_2 kM062_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_3 : List Tok := [(.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 0 6 4 1 5), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 2 4 0 3), (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_3 : wsegOk P nbM062 (nInsideL P nbM062) kM062_3 tM062_3 kM062_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_4 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_4 : wsegOk P nbM062 (nInsideL P nbM062) kM062_4 tM062_4 kM062_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_5 : List Tok := [.split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_5 : wsegOk P nbM062 (nInsideL P nbM062) kM062_5 tM062_5 kM062_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_6 : List Tok := [(.A 0 3 6 0 5), .split, .split, .split, .split, (.A 0 3 6 1 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_6 : wsegOk P nbM062 (nInsideL P nbM062) kM062_6 tM062_6 kM062_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_7 : List Tok := [(.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_7 : wsegOk P nbM062 (nInsideL P nbM062) kM062_7 tM062_7 kM062_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_8 : List Tok := [.split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 4 2 6 0 1), .split, (.A 0 3 6 0 1), .split, .split, (.A 4 2 6 0 1), (.A 0 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_8 : wsegOk P nbM062 (nInsideL P nbM062) kM062_8 tM062_8 kM062_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_9 : List Tok := [.split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 3 5 0 1), (.A 4 3 5 0 1), .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_9 : wsegOk P nbM062 (nInsideL P nbM062) kM062_9 tM062_9 kM062_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_10 : List Tok := [(.A 4 7 5 0 1), (.D 18), .split, .split, (.D 6), (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_10 : wsegOk P nbM062 (nInsideL P nbM062) kM062_10 tM062_10 kM062_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_11 : List Tok := [(.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), (.A 1 2 4 1 3), .split, (.A 4 2 6 1 7), .split, .split, (.A 0 2 4 0 7), .split, (.A 4 2 6 0 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), .split, (.A 0 2 4 0 3), (.A 4 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_11 : wsegOk P nbM062 (nInsideL P nbM062) kM062_11 tM062_11 kM062_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_12 : List Tok := [.split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), .split, (.A 5 2 4 1 3), .split, (.A 5 2 6 1 3), (.A 4 2 6 0 3), .split, .split, .split, (.A 5 0 4 1 3), (.D 4), .split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 5 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), (.A 5 0 7 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_12 : wsegOk P nbM062 (nInsideL P nbM062) kM062_12 tM062_12 kM062_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_13 : List Tok := [.split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, (.A 1 6 5 1 7), (.A 1 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 0 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_13 : wsegOk P nbM062 (nInsideL P nbM062) kM062_13 tM062_13 kM062_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_14 : List Tok := [.split, (.A 0 2 4 0 3), (.A 4 2 4 0 3), .split, (.A 0 2 4 0 3), .split, (.A 0 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, .split, (.A 1 2 5 0 3), (.A 0 2 4 0 3), (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 4 2 4 0 3), (.A 4 2 6 0 3), (.A 4 2 7 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_14 : wsegOk P nbM062 (nInsideL P nbM062) kM062_14 tM062_14 kM062_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM062_15 : List Tok := [.split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, (.A 1 6 5 1 3), (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, (.A 5 2 5 0 3), (.A 5 2 7 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 1 6 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 1 2 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM062_15 : wsegOk P nbM062 (nInsideL P nbM062) kM062_15 tM062_15 kM062_16 = true := by
  decide +kernel

end PackLean.D28.Cub
