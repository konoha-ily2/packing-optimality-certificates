-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey001

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_9 : List Tok := [(.D 4), (.D 1), .split, .split, (.D 1), (.D 1), (.D 1), .split, .split, .split, .split, .split, .split, .split, (.A 1 2 5 1 7), (.A 1 6 5 0 3), (.A 0 2 5 0 3), .split, .split, (.A 1 2 5 1 3), (.A 1 6 5 0 3), .split, (.A 5 2 5 0 3), (.A 5 6 5 0 3), (.A 0 6 5 0 3), .split, .split, .split, .split, (.A 4 2 4 0 3), (.A 4 2 5 0 3), (.A 4 2 4 0 3), (.A 4 2 5 0 3), .split, .split, (.A 0 6 5 0 3), (.A 4 6 5 0 1), (.A 4 6 5 0 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_9 : wsegOk P nbM008 (nInsideL P nbM008) kM008_9 tM008_9 kM008_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_10 : List Tok := [.split, (.A 5 6 5 0 3), .split, (.A 5 2 7 0 3), .split, (.A 4 6 5 0 3), (.D 12), (.A 4 6 5 0 3), .split, .split, .split, .split, (.D 1), .split, (.D 4), (.D 1), (.D 4), (.D 1), .split, .split, (.A 5 6 7 0 3), (.D 12), (.D 12), .split, .split, .split, .split, .split, .split, .split, (.D 17), .split, (.A 4 3 6 5 7), (.A 4 0 6 5 7), .split, (.D 13), (.A 4 1 6 4 7), (.A 4 0 6 5 7), .split, .split, .split, (.A 4 2 6 4 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_10 : wsegOk P nbM008 (nInsideL P nbM008) kM008_10 tM008_10 kM008_11 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_11 : List Tok := [.split, (.A 4 2 6 0 5), (.A 4 2 6 4 3), .split, .split, (.A 4 3 6 4 5), .split, (.A 4 2 6 4 7), (.D 13), (.A 4 2 6 4 5), .split, (.A 4 2 6 4 3), .split, .split, (.D 13), (.D 13), .split, (.A 4 2 6 4 1), (.A 4 2 7 4 1), .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, (.A 6 3 6 4 5), .split, (.A 6 2 7 4 5), (.D 13), (.A 6 1 7 4 5), .split, .split, (.D 13), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_11 : wsegOk P nbM008 (nInsideL P nbM008) kM008_11 tM008_11 kM008_12 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_12 : List Tok := [(.D 13), (.D 13), .split, .split, (.D 13), .split, .split, .split, .split, (.D 13), (.D 13), .split, .split, (.A 5 2 7 5 3), .split, (.D 13), (.A 5 2 7 4 1), .split, (.D 15), (.D 13), .split, (.D 13), .split, (.D 13), (.D 13), (.D 15), .split, (.D 13), (.D 13), .split, .split, .split, .split, .split, .split, (.A 4 2 7 0 1), (.A 4 2 5 0 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_12 : wsegOk P nbM008 (nInsideL P nbM008) kM008_12 tM008_12 kM008_13 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_13 : List Tok := [.split, .split, (.A 4 7 5 4 1), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, .split, .split, (.A 6 3 7 4 5), (.A 6 2 7 4 1), (.A 6 3 7 4 1), (.D 6), (.A 6 2 7 4 1), .split, (.D 6), (.D 19), .split, .split, .split, .split, (.A 5 2 7 4 1), (.A 5 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19), (.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_13 : wsegOk P nbM008 (nInsideL P nbM008) kM008_13 tM008_13 kM008_14 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_14 : List Tok := [(.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_14 : wsegOk P nbM008 (nInsideL P nbM008) kM008_14 tM008_14 kM008_15 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM008_15 : List Tok := [(.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM008_15 : wsegOk P nbM008 (nInsideL P nbM008) kM008_15 tM008_15 [] = true := by
  decide +kernel

end PackLean.D28.Cub
