-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey045

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_17 : List Tok := [(.D 1), (.D 4), (.D 1), .split, .split, .split, .split, .split, (.A 1 6 7 1 3), (.D 12), (.D 12), .split, .split, .split, .split, (.A 5 2 7 1 3), (.D 12), (.A 5 2 7 4 3), (.D 12), (.D 12), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, .split, (.A 5 3 6 5 7), (.A 4 3 6 4 7), .split, (.A 5 0 6 5 7), (.D 13), .split, (.D 13), (.A 4 1 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_17 : wsegOk P nbM111 (nInsideL P nbM111) kM111_17 tM111_17 kM111_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_18 : List Tok := [.split, .split, (.D 17), .split, (.D 13), (.D 13), (.D 13), .split, .split, .split, (.A 4 2 6 4 7), .split, .split, .split, (.A 4 2 6 0 7), .split, .split, .split, (.A 0 2 6 0 7), .split, (.A 0 2 6 0 5), (.A 0 2 6 0 3), (.A 0 2 6 0 5), .split, .split, (.A 4 2 6 0 3), (.A 0 2 6 0 3), (.A 4 2 6 0 1), (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, .split, (.A 4 3 6 4 7), (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_18 : wsegOk P nbM111 (nInsideL P nbM111) kM111_18 tM111_18 kM111_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_19 : List Tok := [.split, .split, .split, .split, (.A 5 2 6 5 3), .split, (.D 13), (.A 4 2 6 4 3), .split, (.A 5 0 6 5 3), (.D 13), .split, (.A 4 2 6 4 3), .split, (.A 5 2 6 4 3), (.A 5 2 6 4 1), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), .split, .split, (.D 13), (.A 4 2 7 4 1), (.D 13), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 4 3 6 4 5), .split, (.A 4 2 7 4 5), (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_19 : wsegOk P nbM111 (nInsideL P nbM111) kM111_19 tM111_19 kM111_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_20 : List Tok := [.split, (.D 13), .split, (.D 6), (.D 13), .split, .split, (.D 13), .split, (.D 13), (.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, (.A 5 0 6 5 3), (.A 5 2 7 5 3), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 0 2 6 0 1), .split, (.A 0 2 4 0 1), (.A 0 2 5 0 1), .split, (.A 4 2 6 0 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_20 : wsegOk P nbM111 (nInsideL P nbM111) kM111_20 tM111_20 kM111_21 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_21 : List Tok := [(.A 0 2 7 0 1), .split, .split, .split, .split, (.A 0 2 6 0 3), (.A 4 2 6 0 1), .split, (.A 4 2 7 0 3), (.A 4 2 7 0 1), .split, (.A 0 2 7 0 1), (.A 4 2 7 0 1), (.A 4 2 7 0 1), .split, (.A 0 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, .split, (.A 4 2 6 0 1), (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, .split, (.A 4 2 7 4 3), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_21 : wsegOk P nbM111 (nInsideL P nbM111) kM111_21 tM111_21 kM111_22 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_22 : List Tok := [(.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1), .split, .split, .split, .split, .split, (.A 0 7 5 0 1), .split, (.A 0 3 5 0 1), (.D 18), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_22 : wsegOk P nbM111 (nInsideL P nbM111) kM111_22 tM111_22 kM111_23 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_23 : List Tok := [(.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_23 : wsegOk P nbM111 (nInsideL P nbM111) kM111_23 tM111_23 kM111_24 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM111_24 : List Tok := [(.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM111_24 : wsegOk P nbM111 (nInsideL P nbM111) kM111_24 tM111_24 [] = true := by
  decide +kernel

end PackLean.D28.Cub
