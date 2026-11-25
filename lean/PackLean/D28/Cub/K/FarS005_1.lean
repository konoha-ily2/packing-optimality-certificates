-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey005

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_0 : wsegOk P nbM020 (nInsideL P nbM020) (rRoots P.rden) tM020_0 kM020_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_1 : List Tok := [.split, (.D 17), .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, .split, (.D 5), .split, (.A 0 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 4 2 4 0 7), .split, .split, .split, (.D 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_1 : wsegOk P nbM020 (nInsideL P nbM020) kM020_1 tM020_1 kM020_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_2 : List Tok := [.split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), (.A 0 6 4 2 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), (.A 0 6 4 2 1), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 1 6 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_2 : wsegOk P nbM020 (nInsideL P nbM020) kM020_2 tM020_2 kM020_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_3 : List Tok := [.split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 4 0 1), (.A 0 6 5 0 1), (.A 0 6 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_3 : wsegOk P nbM020 (nInsideL P nbM020) kM020_3 tM020_3 kM020_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_4 : List Tok := [.split, .split, (.D 7), (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), (.A 4 3 2 4 7), .split, (.A 0 3 6 0 5), .split, .split, (.A 4 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_4 : wsegOk P nbM020 (nInsideL P nbM020) kM020_4 tM020_4 kM020_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_5 : List Tok := [(.A 0 2 6 0 5), (.A 0 3 6 0 5), (.A 4 2 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 0 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_5 : wsegOk P nbM020 (nInsideL P nbM020) kM020_5 tM020_5 kM020_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_6 : List Tok := [(.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), .split, (.A 0 3 4 0 1), (.A 0 2 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 4 2 6 0 5), (.A 4 2 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_6 : wsegOk P nbM020 (nInsideL P nbM020) kM020_6 tM020_6 kM020_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_7 : List Tok := [(.A 4 2 6 0 1), .split, (.A 4 2 4 0 1), (.A 4 2 4 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 4 3 4 0 1), .split, .split, .split, .split, (.A 0 2 4 0 1), (.A 4 3 4 0 1), (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, (.A 4 7 5 2 1), (.A 4 3 5 2 1), .split, .split, (.D 6), .split, .split, (.A 6 3 7 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_7 : wsegOk P nbM020 (nInsideL P nbM020) kM020_7 tM020_7 kM020_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_8 : List Tok := [(.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, (.A 4 2 4 5 7), .split, (.A 5 0 4 5 7), (.A 4 0 6 5 7), .split, (.D 4), .split, (.D 17), .split, .split, (.A 5 0 6 5 3), (.A 5 0 6 5 7), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_8 : wsegOk P nbM020 (nInsideL P nbM020) kM020_8 tM020_8 kM020_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_9 : List Tok := [.split, .split, (.A 1 2 4 1 7), .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 3), (.A 5 2 4 1 3), .split, (.A 5 2 6 1 7), .split, .split, (.A 4 2 4 1 7), (.A 4 2 6 0 7), .split, (.A 5 2 4 1 3), (.A 4 2 6 0 3), .split, .split, (.A 5 0 4 1 3), (.A 5 2 5 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_9 : wsegOk P nbM020 (nInsideL P nbM020) kM020_9 tM020_9 kM020_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_10 : List Tok := [(.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 1 6 5 0 3), .split, (.D 1), .split, (.A 1 6 5 1 3), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, (.A 4 2 4 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_10 : wsegOk P nbM020 (nInsideL P nbM020) kM020_10 tM020_10 kM020_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_11 : List Tok := [(.A 4 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1), .split, (.A 4 6 5 0 3), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), .split, (.A 5 2 5 1 3), (.A 5 6 5 0 3), (.A 5 6 5 1 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 5 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_11 : wsegOk P nbM020 (nInsideL P nbM020) kM020_11 tM020_11 kM020_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_12 : List Tok := [(.A 4 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, (.A 5 6 7 1 3), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7), .split, (.A 4 2 6 0 5), (.A 4 2 6 4 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_12 : wsegOk P nbM020 (nInsideL P nbM020) kM020_12 tM020_12 kM020_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_13 : List Tok := [.split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, (.A 4 2 6 4 3), (.A 4 0 6 5 3), (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_13 : wsegOk P nbM020 (nInsideL P nbM020) kM020_13 tM020_13 kM020_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM020_14 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM020_14 : wsegOk P nbM020 (nInsideL P nbM020) kM020_14 tM020_14 kM020_15 = true := by
  decide +kernel

end PackLean.D28.Cub
