-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey045

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_2 : List Tok := [(.A 5 3 6 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 3 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), .split, (.A 5 2 6 1 7), (.A 1 2 6 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 0 7), .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 6 0 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 1 6 4 3 5), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_2 : wsegOk P nbM111 (nInsideL P nbM111) kM111_2 tM111_2 kM111_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_3 : List Tok := [.split, .split, .split, (.D 7), (.D 9), .split, (.A 0 6 4 1 5), (.A 0 7 4 0 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 1 6 4 1 5), .split, (.A 1 6 4 1 7), .split, (.A 1 6 4 1 7), (.A 0 6 4 0 7), .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_3 : wsegOk P nbM111 (nInsideL P nbM111) kM111_3 tM111_3 kM111_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_4 : List Tok := [(.D 7), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 1 2 4 0 7), (.A 0 6 4 0 3), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_4 : wsegOk P nbM111 (nInsideL P nbM111) kM111_4 tM111_4 kM111_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_5 : List Tok := [(.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 0 6 4 0 1), .split, .split, (.D 7), .split, (.A 0 7 4 2 1), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_5 : wsegOk P nbM111 (nInsideL P nbM111) kM111_5 tM111_5 kM111_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_6 : List Tok := [.split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), (.A 4 3 6 5 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, .split, .split, .split, .split, (.A 1 3 6 1 7), (.A 4 3 6 1 7), (.A 4 3 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_6 : wsegOk P nbM111 (nInsideL P nbM111) kM111_6 tM111_6 kM111_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_7 : List Tok := [.split, (.A 0 3 6 0 7), (.A 0 3 6 0 7), (.A 4 3 6 0 7), .split, (.A 4 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 0 2 6 0 7), (.A 0 2 6 0 5), .split, (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_7 : wsegOk P nbM111 (nInsideL P nbM111) kM111_7 tM111_7 kM111_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_8 : List Tok := [(.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 2 1), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_8 : wsegOk P nbM111 (nInsideL P nbM111) kM111_8 tM111_8 kM111_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_9 : List Tok := [(.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), (.A 0 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 7 5 0 1), (.A 0 3 5 0 1), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_9 : wsegOk P nbM111 (nInsideL P nbM111) kM111_9 tM111_9 kM111_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_10 : List Tok := [(.D 6), (.A 0 3 7 0 1), .split, .split, .split, (.A 0 7 4 2 1), (.D 18), (.D 6), .split, (.A 0 7 5 2 1), .split, (.A 0 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_10 : wsegOk P nbM111 (nInsideL P nbM111) kM111_10 tM111_10 kM111_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_11 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), (.A 5 2 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, .split, (.A 1 2 4 1 7), (.A 5 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, .split, (.A 1 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 1 2 6 1 7), .split, .split, .split, (.A 1 2 4 0 7), (.A 0 2 4 0 7), .split, (.A 0 2 6 0 7), .split, (.A 0 2 4 0 7), (.A 0 2 6 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_11 : wsegOk P nbM111 (nInsideL P nbM111) kM111_11 tM111_11 kM111_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_12 : List Tok := [.split, (.A 1 2 4 0 3), (.A 0 2 6 0 3), .split, (.A 1 2 4 1 3), .split, (.A 5 2 6 1 3), .split, .split, (.A 1 2 6 0 3), .split, (.A 5 2 6 0 3), (.A 0 2 6 0 3), (.A 5 2 6 0 3), .split, .split, .split, .split, (.D 4), (.A 5 2 4 1 3), (.D 4), .split, (.A 1 2 4 1 3), .split, (.D 4), .split, .split, .split, (.D 4), (.A 5 2 6 1 3), (.D 4), (.A 1 2 7 1 3), .split, .split, (.A 5 2 6 5 3), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 6 1 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_12 : wsegOk P nbM111 (nInsideL P nbM111) kM111_12 tM111_12 kM111_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_13 : List Tok := [(.A 1 2 6 1 3), (.A 5 2 6 1 3), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4), (.D 1), .split, (.A 1 6 5 1 7), (.A 1 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_13 : wsegOk P nbM111 (nInsideL P nbM111) kM111_13 tM111_13 kM111_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_14 : List Tok := [.split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), .split, (.A 1 2 4 0 3), (.A 1 6 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 3), .split, .split, (.A 1 2 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), (.A 0 2 6 0 3), .split, .split, (.A 1 2 7 0 3), (.A 0 2 7 0 3), (.A 0 2 7 0 3), (.A 0 2 5 0 3), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_14 : wsegOk P nbM111 (nInsideL P nbM111) kM111_14 tM111_14 kM111_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_15 : List Tok := [.split, (.A 0 6 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 1 2 7 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), (.A 0 2 7 0 3), .split, (.A 1 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_15 : wsegOk P nbM111 (nInsideL P nbM111) kM111_15 tM111_15 kM111_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_16 : List Tok := [.split, (.A 5 2 7 4 3), .split, .split, .split, (.A 5 2 7 0 3), (.A 0 2 7 0 3), (.A 4 2 7 0 3), (.A 5 2 7 4 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 12), (.A 0 2 7 0 3), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_16 : wsegOk P nbM111 (nInsideL P nbM111) kM111_16 tM111_16 kM111_17 = true := by
  decide +kernel

end PackLean.D28.Cub
