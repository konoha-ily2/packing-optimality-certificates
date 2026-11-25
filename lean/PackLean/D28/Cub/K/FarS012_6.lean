-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey012

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_11 : List Tok := [(.A 5 2 7 4 1), .split, .split, .split, .split, .split, (.A 4 7 5 0 1), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, (.A 4 3 7 4 5), (.A 4 3 7 4 1), (.D 6), .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 19), (.A 5 2 7 4 1), (.D 19), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_11 : wsegOk P nbN043 (nInsideL P nbN043) kN043_11 tN043_11 kN043_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_12 : List Tok := [.split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_12 : wsegOk P nbN043 (nInsideL P nbN043) kN043_12 tN043_12 kN043_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_13 : List Tok := [.split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_13 : wsegOk P nbN043 (nInsideL P nbN043) kN043_13 tN043_13 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 1 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), (.A 0 6 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), (.A 1 2 4 1 7), .split, (.D 4), (.A 1 2 4 1 7), .split, .split, (.D 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_0 : wsegOk P nbM043 (nInsideL P nbM043) (rRoots P.rden) tM043_0 kM043_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_1 : List Tok := [.split, .split, (.D 17), (.A 1 2 4 1 7), .split, (.D 17), .split, (.D 5), .split, (.A 5 2 4 1 7), .split, (.D 5), .split, .split, (.A 5 2 4 1 7), (.A 4 3 6 1 7), (.A 5 2 6 5 7), .split, .split, .split, (.A 1 2 4 1 7), .split, .split, .split, (.A 1 2 4 1 7), (.A 1 6 4 1 7), (.A 1 2 4 1 5), .split, (.A 1 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), .split, (.A 1 2 4 1 7), (.A 0 3 4 1 7), (.A 0 2 4 1 5), .split, (.A 1 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_1 : wsegOk P nbM043 (nInsideL P nbM043) kM043_1 tM043_1 kM043_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_2 : List Tok := [.split, .split, .split, (.A 1 2 4 1 7), (.A 0 2 4 1 7), .split, (.A 1 2 4 1 7), (.A 0 2 6 1 7), (.A 0 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, .split, (.A 0 6 4 3 5), (.D 7), .split, (.A 0 7 4 1 5), .split, (.D 7), (.D 7), (.D 7), .split, .split, .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 7), .split, .split, (.A 1 6 5 3 7), (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_2 : wsegOk P nbM043 (nInsideL P nbM043) kM043_2 tM043_2 kM043_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_3 : List Tok := [.split, (.A 1 6 5 1 7), (.A 0 6 5 0 7), (.D 7), .split, .split, .split, .split, .split, (.A 0 6 4 1 5), (.A 0 6 4 0 7), .split, (.D 7), (.D 7), .split, .split, (.A 0 6 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, .split, (.D 7), (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 0 6 4 0 7), .split, (.A 0 6 4 0 7), (.A 0 6 4 0 7), .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 0 2 4 0 7), .split, (.A 0 6 4 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_3 : wsegOk P nbM043 (nInsideL P nbM043) kM043_3 tM043_3 kM043_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_4 : List Tok := [.split, (.A 0 6 4 0 3), (.A 0 6 4 0 1), .split, (.A 0 2 4 0 5), (.A 0 2 4 0 1), .split, (.A 0 2 4 0 3), (.A 0 2 4 0 1), .split, (.A 0 6 4 0 1), .split, .split, (.A 0 6 4 0 3), (.A 0 6 5 0 3), .split, (.A 0 6 4 0 1), (.A 0 6 5 0 1), .split, .split, (.D 7), .split, .split, (.D 7), (.D 7), (.D 18), .split, .split, (.A 0 6 5 0 3), (.D 7), .split, .split, (.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), (.A 0 7 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_4 : wsegOk P nbM043 (nInsideL P nbM043) kM043_4 tM043_4 kM043_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_5 : List Tok := [(.D 18), .split, .split, .split, .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, (.D 2), .split, (.D 6), .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.D 5), .split, .split, (.D 17), .split, (.D 5), (.A 4 3 6 5 7), .split, (.D 5), (.A 4 3 6 4 7), .split, .split, .split, .split, (.D 5), .split, (.A 0 3 6 1 7), (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_5 : wsegOk P nbM043 (nInsideL P nbM043) kM043_5 tM043_5 kM043_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_6 : List Tok := [(.A 0 3 6 0 5), (.A 0 3 6 0 5), .split, .split, .split, (.A 0 3 6 0 7), .split, (.A 0 2 6 1 7), (.A 4 3 6 0 7), .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 3 6 0 5), (.A 0 2 6 0 5), .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), (.A 0 3 6 0 5), .split, .split, (.D 2), .split, (.D 2), (.D 2), .split, .split, (.A 0 3 6 0 5), (.D 2), .split, .split, .split, (.A 0 3 6 0 5), (.A 4 3 6 0 5), .split, (.A 0 3 6 0 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_6 : wsegOk P nbM043 (nInsideL P nbM043) kM043_6 tM043_6 kM043_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_7 : List Tok := [(.A 4 3 6 0 5), .split, (.D 2), (.D 6), .split, .split, .split, .split, (.D 9), .split, .split, (.A 0 7 4 0 5), (.A 2 7 4 2 1), .split, (.A 2 3 6 0 5), (.D 6), .split, (.D 9), (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, (.A 0 3 4 0 5), .split, .split, (.A 0 7 4 2 1), .split, (.A 2 7 4 2 1), (.A 2 7 4 2 1), .split, (.A 0 7 4 0 1), .split, (.A 0 3 4 0 1), (.A 0 7 4 2 1), .split, (.A 0 3 6 0 5), .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_7 : wsegOk P nbM043 (nInsideL P nbM043) kM043_7 tM043_7 kM043_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_8 : List Tok := [.split, .split, (.A 0 3 4 0 1), (.D 6), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 0 2 4 0 5), (.A 0 3 4 0 1), .split, (.A 0 3 6 0 5), (.A 0 3 4 0 1), .split, .split, (.A 0 2 4 0 1), (.A 0 2 4 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), (.A 0 3 6 0 5), (.A 0 2 6 0 1), .split, (.A 0 3 6 0 1), (.A 0 2 6 0 1), .split, .split, .split, .split, (.A 0 7 4 0 1), (.A 0 3 4 0 1), (.A 0 7 4 0 1), (.A 0 3 4 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_8 : wsegOk P nbM043 (nInsideL P nbM043) kM043_8 tM043_8 kM043_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_9 : List Tok := [.split, .split, (.A 0 2 4 0 1), .split, (.A 0 7 5 0 1), .split, (.A 0 6 5 0 1), .split, (.A 0 2 5 0 1), (.A 0 7 5 0 1), .split, .split, (.A 0 3 4 0 1), (.A 0 3 5 0 1), .split, (.A 0 3 5 0 1), .split, (.A 4 3 5 0 1), (.A 4 3 5 0 1), .split, .split, .split, .split, (.A 0 3 6 0 5), (.A 0 3 6 0 1), .split, (.A 0 3 6 0 5), .split, (.D 6), .split, (.A 0 3 6 0 1), (.D 6), .split, (.A 0 3 6 0 1), .split, (.A 4 3 6 0 5), (.A 4 3 6 0 1), .split, .split, .split, (.A 0 3 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_9 : wsegOk P nbM043 (nInsideL P nbM043) kM043_9 tM043_9 kM043_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_10 : List Tok := [(.A 0 3 4 0 1), (.D 6), .split, .split, .split, (.A 0 3 6 0 1), (.A 4 3 7 0 1), (.A 4 3 5 0 1), (.A 4 3 7 0 1), .split, .split, (.A 2 7 4 2 1), (.D 6), .split, .split, .split, .split, (.A 0 7 4 2 1), .split, .split, (.A 0 7 4 2 1), (.A 0 7 5 2 1), (.D 18), .split, (.A 0 7 5 0 1), (.A 4 7 5 0 1), (.D 18), .split, .split, (.D 6), .split, (.A 4 3 5 2 1), (.D 6), (.D 18), .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_10 : wsegOk P nbM043 (nInsideL P nbM043) kM043_10 tM043_10 kM043_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM043_11 : List Tok := [.split, .split, .split, (.D 6), .split, (.A 4 3 7 0 5), (.D 6), (.D 6), (.D 6), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4), .split, (.D 4), (.A 1 2 5 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), .split, (.D 17), .split, .split, (.A 5 2 4 5 7), .split, (.D 17), (.A 5 2 6 5 7), (.A 5 0 6 5 7), .split, (.D 4), .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM043_11 : wsegOk P nbM043 (nInsideL P nbM043) kM043_11 tM043_11 kM043_12 = true := by
  decide +kernel

end PackLean.D28.Cub
