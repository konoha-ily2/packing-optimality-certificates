-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey012

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM042_22 : List Tok := [(.A 4 2 6 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, (.A 0 2 4 0 1), .split, .split, .split, (.A 0 2 4 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1), .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, .split, .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), (.A 4 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM042_22 : wsegOk P nbM042 (nInsideL P nbM042) kM042_22 tM042_22 kM042_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM042_23 : List Tok := [.split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 4 3 7 4 5), .split, (.A 4 2 7 4 1), (.A 6 3 7 4 5), (.A 6 3 7 4 1), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM042_23 : wsegOk P nbM042 (nInsideL P nbM042) kM042_23 tM042_23 kM042_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM042_24 : List Tok := [.split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM042_24 : wsegOk P nbM042 (nInsideL P nbM042) kM042_24 tM042_24 kM042_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM042_25 : List Tok := [(.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM042_25 : wsegOk P nbM042 (nInsideL P nbM042) kM042_25 tM042_25 [] = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_0 : List Tok := [.split, .split, .split, .split, .split, .split, (.D 11), .split, (.D 11), (.D 11), .split, (.D 5), .split, (.D 5), .split, .split, (.D 5), .split, (.D 5), .split, (.A 1 6 4 1 5), .split, (.D 5), (.A 0 6 4 1 5), .split, (.D 5), .split, (.D 5), .split, (.A 0 2 4 1 5), (.A 0 3 4 1 5), .split, .split, .split, (.D 11), (.D 4), .split, .split, (.D 11), .split, (.D 11), (.A 1 2 4 1 7), (.A 5 2 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_0 : wsegOk P nbN043 (nInsideL P nbN043) (rRoots P.rden) tN043_0 kN043_1 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_1 : List Tok := [.split, .split, (.D 5), (.A 4 2 4 5 7), .split, .split, .split, (.A 5 2 4 1 7), (.A 1 2 4 1 7), .split, .split, (.D 5), (.A 4 2 4 1 7), .split, (.A 0 2 4 1 5), (.A 4 2 4 1 5), .split, (.A 5 2 4 1 7), (.A 4 2 4 1 7), .split, .split, .split, (.D 7), (.D 7), .split, .split, (.D 9), .split, (.A 0 6 4 3 5), (.A 0 7 4 2 5), (.D 7), .split, .split, .split, (.A 1 6 4 3 7), (.A 1 6 5 0 7), (.D 7), .split, .split, .split, .split, (.A 1 6 4 1 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_1 : wsegOk P nbN043 (nInsideL P nbN043) kN043_1 tN043_1 kN043_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_2 : List Tok := [(.A 0 6 4 2 1), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 7 4 0 5), .split, .split, .split, (.A 0 6 4 0 5), (.A 0 2 4 0 5), (.A 0 6 4 0 5), .split, .split, (.A 0 2 4 0 5), (.A 4 2 4 0 5), .split, (.A 0 7 4 0 5), .split, (.A 0 6 4 0 5), (.A 0 6 4 0 5), .split, (.A 0 7 4 2 1), (.A 0 6 4 0 1), .split, .split, .split, (.A 1 6 4 0 7), .split, (.A 1 6 4 0 7), .split, (.A 5 2 4 0 7), (.A 1 6 4 0 3), (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, .split, (.A 5 2 4 0 7), (.A 1 2 4 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_2 : wsegOk P nbN043 (nInsideL P nbN043) kN043_2 tN043_2 kN043_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_3 : List Tok := [(.A 4 2 4 0 5), (.A 5 2 4 0 7), .split, (.A 0 6 4 0 5), .split, (.A 1 6 4 0 3), .split, .split, (.A 4 6 4 0 5), (.A 5 2 4 0 3), (.A 0 6 4 0 1), .split, (.A 4 2 4 0 5), .split, (.A 4 6 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 6 4 0 1), (.A 4 2 4 0 1), .split, .split, (.A 5 2 4 0 7), (.A 5 6 4 0 3), (.A 4 2 4 0 1), .split, .split, (.A 0 6 4 0 1), (.A 0 6 4 0 1), .split, (.A 1 6 5 0 3), (.A 4 6 5 0 1), .split, .split, (.D 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_3 : wsegOk P nbN043 (nInsideL P nbN043) kN043_3 tN043_3 kN043_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_4 : List Tok := [(.A 0 7 4 2 1), .split, (.A 0 6 5 0 3), .split, .split, (.A 0 7 4 2 1), (.A 0 6 5 0 3), (.D 18), .split, .split, .split, (.A 0 3 2 1 5), .split, (.D 2), .split, (.D 6), .split, (.A 4 3 6 0 5), (.D 2), .split, .split, (.A 4 3 2 4 7), .split, (.A 4 3 6 0 5), .split, .split, (.A 4 3 6 0 7), (.A 4 3 6 0 5), (.A 4 3 6 0 5), .split, .split, (.D 2), (.A 6 1 2 4 7), (.A 6 3 6 0 5), .split, .split, .split, .split, (.D 9), .split, (.A 0 7 4 2 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_4 : wsegOk P nbN043 (nInsideL P nbN043) kN043_4 tN043_4 kN043_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_5 : List Tok := [.split, (.A 0 3 6 0 5), (.D 6), (.A 0 7 4 2 1), (.D 6), .split, .split, .split, .split, .split, .split, (.A 0 3 4 0 5), (.A 4 3 4 0 5), (.A 0 7 4 2 1), (.A 4 3 6 0 5), .split, .split, .split, (.A 4 3 4 0 5), (.A 4 2 6 0 1), .split, (.A 4 7 4 0 1), .split, .split, (.A 4 2 4 0 1), (.A 4 7 5 0 1), (.A 4 3 5 0 1), (.A 4 3 6 0 1), (.A 4 7 4 2 1), .split, (.A 4 3 7 2 5), (.D 6), .split, .split, .split, .split, .split, (.D 4), .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_5 : wsegOk P nbN043 (nInsideL P nbN043) kN043_5 tN043_5 kN043_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_6 : List Tok := [(.A 5 2 4 1 7), (.D 4), .split, .split, .split, .split, (.D 17), (.A 5 2 4 1 7), (.A 4 0 4 5 7), .split, (.D 4), .split, (.D 17), .split, (.A 5 0 6 5 3), (.A 7 0 6 5 3), .split, (.A 5 2 4 1 7), .split, (.A 5 2 6 1 3), (.A 5 2 6 5 3), .split, (.D 4), .split, (.A 7 0 6 5 3), .split, .split, .split, (.D 4), (.A 5 0 7 1 3), .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), (.D 15), .split, .split, .split, .split, .split, .split, (.D 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_6 : wsegOk P nbN043 (nInsideL P nbN043) kN043_6 tN043_6 kN043_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_7 : List Tok := [(.D 1), (.A 1 6 5 0 3), .split, (.D 1), .split, .split, (.A 1 6 5 1 3), (.D 4), (.D 1), (.A 1 6 5 0 3), .split, .split, .split, .split, (.A 5 6 5 0 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), .split, .split, (.A 1 6 5 0 3), (.A 5 6 5 0 1), (.A 5 6 5 0 3), (.A 5 6 5 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, (.A 0 6 5 0 3), (.D 12), (.D 18), (.D 12), .split, .split, .split, .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_7 : wsegOk P nbN043 (nInsideL P nbN043) kN043_7 tN043_7 kN043_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_8 : List Tok := [.split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, .split, .split, (.A 5 6 7 1 3), (.D 12), (.A 5 6 7 4 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.A 4 2 6 0 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_8 : wsegOk P nbN043 (nInsideL P nbN043) kN043_8 tN043_8 kN043_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_9 : List Tok := [.split, .split, (.A 4 3 6 4 5), .split, .split, (.D 13), (.A 4 2 6 4 5), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 5 2 6 4 3), (.A 7 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 6 4 1), .split, (.D 13), (.A 5 2 7 4 1), (.A 5 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_9 : wsegOk P nbN043 (nInsideL P nbN043) kN043_9 tN043_9 kN043_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tN043_10 : List Tok := [(.A 6 2 7 4 5), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 7 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), (.A 7 2 7 4 1), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 5 2 7 0 1), .split, (.A 4 2 5 0 1), (.A 5 2 5 0 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sN043_10 : wsegOk P nbN043 (nInsideL P nbN043) kN043_10 tN043_10 kN043_11 = true := by
  decide +kernel

end PackLean.D28.Cub
