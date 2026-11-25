-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey010

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN035_15 : List Tok := [(.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN035_15 : wsegOk P nbN035 (nInsideL P nbN035) kN035_15 tN035_15 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_0 : wsegOk P nbM035 (nInsideL P nbM035) (rRoots P.rden) tM035_0 kM035_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_1 : List Tok := [(.A 5 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), (.A 4 3 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 5), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7), .split, .split, (.A 0 2 4 1 7), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 0 7), .split, .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_1 : wsegOk P nbM035 (nInsideL P nbM035) kM035_1 tM035_1 kM035_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_2 : List Tok := [(.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, .split, (.D 7), .split, (.A 1 6 4 3 7), (.D 7), .split, (.A 1 6 5 2 7), .split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 0 6 4 1 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), .split, (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_2 : wsegOk P nbM035 (nInsideL P nbM035) kM035_2 tM035_2 kM035_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_3 : List Tok := [(.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), .split, (.A 0 2 4 0 7), (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 3), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), .split, .split, (.A 0 2 4 0 5), (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_3 : wsegOk P nbM035 (nInsideL P nbM035) kM035_3 tM035_3 kM035_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_4 : List Tok := [(.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1), (.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, (.A 0 3 6 1 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, (.A 4 3 6 5 7), (.A 4 3 2 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_4 : wsegOk P nbM035 (nInsideL P nbM035) kM035_4 tM035_4 kM035_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_5 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7), (.A 4 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), .split, (.A 0 3 6 0 5), (.A 0 2 6 0 5), (.A 0 3 6 0 5), .split, .split, (.A 4 2 6 0 7), (.A 0 2 6 0 5), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, (.A 4 3 6 0 5), .split, (.D 2), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_5 : wsegOk P nbM035 (nInsideL P nbM035) kM035_5 tM035_5 kM035_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_6 : List Tok := [.split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, .split, (.D 6), (.A 0 3 6 0 5), (.D 6), .split, (.D 9), .split, (.A 2 7 4 2 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, (.A 0 7 4 2 1), .split, (.A 0 7 4 0 1), (.A 0 7 4 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_6 : wsegOk P nbM035 (nInsideL P nbM035) kM035_6 tM035_6 kM035_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_7 : List Tok := [(.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, .split, (.A 0 2 4 0 5), .split, (.A 0 2 4 0 1), (.A 4 2 6 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 2 6 0 1), (.A 4 3 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), (.A 4 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_7 : wsegOk P nbM035 (nInsideL P nbM035) kM035_7 tM035_7 kM035_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_8 : List Tok := [.split, (.A 4 3 4 0 1), (.A 4 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, (.A 4 3 4 0 1), (.D 6), (.A 4 3 7 0 1), .split, .split, (.A 0 7 4 2 1), (.D 6), .split, .split, (.A 4 7 5 0 1), (.D 18), .split, (.A 4 3 5 2 1), (.D 18), .split, .split, (.D 6), .split, .split, .split, (.D 6), (.A 6 3 7 0 5), (.D 6), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_8 : wsegOk P nbM035 (nInsideL P nbM035) kM035_8 tM035_8 kM035_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_9 : List Tok := [(.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), (.A 4 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17), (.A 5 0 6 5 3), .split, .split, .split, (.A 5 2 4 1 7), .split, .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), (.A 1 2 4 1 3), .split, (.A 5 2 6 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_9 : wsegOk P nbM035 (nInsideL P nbM035) kM035_9 tM035_9 kM035_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_10 : List Tok := [.split, .split, .split, (.A 5 2 4 1 7), .split, (.A 0 2 4 1 7), (.A 0 2 4 1 3), .split, (.A 4 2 6 1 7), (.A 4 2 4 0 3), .split, (.A 5 2 4 1 3), (.A 4 2 6 0 3), .split, .split, (.A 5 0 4 1 3), .split, .split, (.A 5 2 5 1 3), (.A 5 2 4 1 3), .split, (.D 4), (.A 5 2 7 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 5 0 6 5 3), .split, .split, .split, (.D 4), .split, (.A 5 0 7 1 3), (.D 4), .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_10 : wsegOk P nbM035 (nInsideL P nbM035) kM035_10 tM035_10 kM035_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_11 : List Tok := [(.D 15), .split, .split, .split, .split, .split, (.A 1 6 5 0 7), .split, .split, (.A 1 6 5 1 7), (.A 1 6 5 1 3), (.A 0 6 5 0 3), .split, (.D 1), (.A 1 6 5 0 3), .split, (.A 0 6 5 0 3), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), (.A 0 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, (.A 0 2 4 0 3), .split, (.A 4 2 4 0 3), .split, .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), (.A 4 2 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_11 : wsegOk P nbM035 (nInsideL P nbM035) kM035_11 tM035_11 kM035_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_12 : List Tok := [.split, .split, .split, (.A 0 2 4 0 3), (.A 4 2 5 0 3), (.A 0 2 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3), (.A 4 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, (.A 4 6 5 0 3), (.A 4 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, .split, .split, (.A 1 6 5 1 3), (.D 4), (.A 1 6 5 1 3), (.A 5 6 7 1 3), (.A 1 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_12 : wsegOk P nbM035 (nInsideL P nbM035) kM035_12 tM035_12 kM035_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM035_13 : List Tok := [.split, .split, .split, .split, (.A 5 2 7 0 3), (.A 4 2 5 0 3), (.A 4 2 7 0 3), (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM035_13 : wsegOk P nbM035 (nInsideL P nbM035) kM035_13 tM035_13 kM035_14 = true := by
  decide +kernel

end PackLean.D28.Cub
