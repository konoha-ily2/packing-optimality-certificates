-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey052

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_1 : List Tok := [(.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 1 2 4 1 7), (.A 1 3 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 1 3 4 1 7), .split, .split, .split, (.A 1 2 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_1 : wsegOk P nbM125 (nInsideL P nbM125) kM125_1 tM125_1 kM125_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_2 : List Tok := [(.A 0 2 4 1 5), (.A 0 3 4 1 5), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_2 : wsegOk P nbM125 (nInsideL P nbM125) kM125_2 tM125_2 kM125_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_3 : List Tok := [(.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, .split, (.A 1 6 4 1 7), (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, .split, (.D 7), (.A 0 6 4 1 5), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_3 : wsegOk P nbM125 (nInsideL P nbM125) kM125_3 tM125_3 kM125_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_4 : List Tok := [.split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), .split, (.A 0 7 4 2 1), (.D 7), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_4 : wsegOk P nbM125 (nInsideL P nbM125) kM125_4 tM125_4 kM125_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_5 : List Tok := [.split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_5 : wsegOk P nbM125 (nInsideL P nbM125) kM125_5 tM125_5 kM125_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_6 : List Tok := [.split, .split, (.D 5), (.A 0 3 4 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), (.A 4 3 6 5 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_6 : wsegOk P nbM125 (nInsideL P nbM125) kM125_6 tM125_6 kM125_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_7 : List Tok := [.split, (.A 0 2 6 1 7), (.A 0 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_7 : wsegOk P nbM125 (nInsideL P nbM125) kM125_7 tM125_7 kM125_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_8 : List Tok := [(.A 0 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), .split, .split, (.A 0 3 6 0 5), (.D 6), (.D 6), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 2 7 4 2 1), .split, (.A 2 7 4 2 1), (.A 2 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_8 : wsegOk P nbM125 (nInsideL P nbM125) kM125_8 tM125_8 kM125_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_9 : List Tok := [.split, (.A 0 3 6 0 5), .split, (.D 6), .split, .split, (.A 0 3 4 0 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_9 : wsegOk P nbM125 (nInsideL P nbM125) kM125_9 tM125_9 kM125_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_10 : List Tok := [.split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, .split, (.A 0 3 4 0 1), (.D 6), .split, .split, (.A 0 3 7 0 1), (.A 0 3 5 0 1), .split, (.A 0 3 7 0 1), (.D 6), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_10 : wsegOk P nbM125 (nInsideL P nbM125) kM125_10 tM125_10 kM125_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_11 : List Tok := [(.D 18), .split, (.A 0 7 5 0 1), .split, .split, (.A 0 7 5 0 1), .split, (.A 0 7 5 0 1), (.A 0 3 5 0 1), (.D 18), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 4 3 5 0 1), (.D 18), (.D 6), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 0 3 7 0 5), (.D 6), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_11 : wsegOk P nbM125 (nInsideL P nbM125) kM125_11 tM125_11 kM125_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_12 : List Tok := [(.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_12 : wsegOk P nbM125 (nInsideL P nbM125) kM125_12 tM125_12 kM125_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_13 : List Tok := [(.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), (.A 1 2 6 1 7), (.A 5 2 6 1 7), .split, .split, (.A 0 2 4 1 7), .split, (.A 0 2 6 1 7), .split, .split, (.A 0 2 4 0 7), (.A 0 2 6 0 7), (.A 0 2 6 0 3), .split, .split, .split, (.A 1 2 4 1 3), (.A 1 2 6 1 3), .split, (.A 0 2 4 1 3), .split, (.A 1 2 4 1 3), (.A 0 2 6 1 3), (.A 0 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_13 : wsegOk P nbM125 (nInsideL P nbM125) kM125_13 tM125_13 kM125_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_14 : List Tok := [.split, .split, .split, (.D 4), (.A 1 2 5 1 3), .split, (.A 1 2 4 1 3), (.A 1 2 5 1 3), .split, (.D 4), .split, .split, (.A 1 2 6 1 3), (.D 4), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 6 1 3), (.A 5 2 6 1 3), .split, .split, (.A 1 2 6 1 3), (.A 0 2 6 1 3), .split, (.A 1 2 7 1 3), .split, (.A 5 2 6 1 3), (.A 5 2 7 1 3), (.A 4 2 6 1 3), .split, .split, (.A 5 2 6 1 3), (.A 5 2 7 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_14 : wsegOk P nbM125 (nInsideL P nbM125) kM125_14 tM125_14 kM125_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM125_15 : List Tok := [(.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 5 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM125_15 : wsegOk P nbM125 (nInsideL P nbM125) kM125_15 tM125_15 kM125_16 = true := by
  decide +kernel

end PackLean.D28.Cub
