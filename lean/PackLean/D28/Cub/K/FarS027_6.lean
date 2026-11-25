-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey027

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_16 : List Tok := [(.A 4 2 5 0 3), (.A 0 2 5 0 1), .split, (.A 1 2 5 0 3), .split, .split, .split, (.A 5 2 4 0 3), .split, (.A 5 2 6 0 3), .split, .split, .split, (.A 5 2 4 0 3), (.A 5 2 5 0 3), (.A 4 2 6 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, .split, (.A 1 2 5 0 3), (.A 0 2 5 0 3), (.A 4 2 5 0 3), .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), .split, .split, .split, (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_16 : wsegOk P nbM076 (nInsideL P nbM076) kM076_16 tM076_16 kM076_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_17 : List Tok := [(.A 0 2 5 0 1), (.A 0 6 5 0 1), .split, (.A 0 6 5 0 3), .split, .split, .split, .split, .split, (.A 0 6 5 0 3), .split, (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 1), .split, .split, (.A 0 2 5 0 3), (.A 0 6 5 0 3), (.A 0 2 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 1 6 5 1 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 1 3), .split, (.A 1 2 7 1 3), (.A 1 6 5 0 3), (.A 1 6 5 0 3), .split, .split, .split, (.A 1 2 5 0 3), .split, (.A 5 2 7 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_17 : wsegOk P nbM076 (nInsideL P nbM076) kM076_17 tM076_17 kM076_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_18 : List Tok := [.split, .split, (.A 5 2 5 0 3), (.A 5 2 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 5 2 7 0 3), (.A 1 6 7 0 3), (.A 5 2 7 0 3), .split, .split, (.A 1 6 5 0 3), .split, .split, .split, .split, .split, .split, (.A 1 6 5 0 3), (.A 1 2 5 0 3), .split, (.A 1 6 5 0 3), (.A 5 2 5 0 3), (.A 0 6 5 0 3), (.A 4 2 5 0 3), .split, .split, (.A 5 6 5 0 3), (.D 12), .split, (.A 5 2 7 0 3), (.D 12), (.D 12), (.D 12), .split, .split, (.A 0 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_18 : wsegOk P nbM076 (nInsideL P nbM076) kM076_18 tM076_18 kM076_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_19 : List Tok := [(.A 0 6 5 0 3), (.D 12), .split, .split, .split, .split, (.D 1), (.A 1 4 5 1 3), (.D 4), (.D 1), .split, .split, .split, .split, .split, .split, (.A 1 6 7 1 3), .split, (.A 1 6 7 1 3), (.D 12), (.D 12), (.D 12), .split, .split, (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, .split, (.D 17), (.A 4 2 6 5 7), (.A 4 3 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_19 : wsegOk P nbM076 (nInsideL P nbM076) kM076_19 tM076_19 kM076_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_20 : List Tok := [.split, .split, (.D 17), (.A 5 2 6 5 7), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), .split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, (.A 4 2 6 0 7), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_20 : wsegOk P nbM076 (nInsideL P nbM076) kM076_20 tM076_20 kM076_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_21 : List Tok := [(.A 5 2 6 4 3), (.A 5 0 6 5 3), (.A 5 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 5 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13), .split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_21 : wsegOk P nbM076 (nInsideL P nbM076) kM076_21 tM076_21 kM076_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_22 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 4 0 1), (.A 4 2 6 0 1), (.A 4 2 6 0 1), .split, .split, (.A 0 2 4 0 1), (.A 4 2 4 0 1), .split, (.A 4 2 5 0 1), (.A 4 2 7 0 1), (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_22 : wsegOk P nbM076 (nInsideL P nbM076) kM076_22 tM076_22 kM076_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_23 : List Tok := [.split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, .split, (.A 0 6 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, (.A 4 2 7 4 1), (.A 5 2 7 4 1), .split, .split, .split, (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_23 : wsegOk P nbM076 (nInsideL P nbM076) kM076_23 tM076_23 kM076_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_24 : List Tok := [(.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 5 2 7 4 1), (.D 12), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_24 : wsegOk P nbM076 (nInsideL P nbM076) kM076_24 tM076_24 kM076_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_25 : List Tok := [.split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_25 : wsegOk P nbM076 (nInsideL P nbM076) kM076_25 tM076_25 kM076_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM076_26 : List Tok := [.split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM076_26 : wsegOk P nbM076 (nInsideL P nbM076) kM076_26 tM076_26 [] = true := by
  decide +kernel

end PackLean.D28.Cub
