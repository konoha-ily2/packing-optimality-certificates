-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey016

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_5 : List Tok := [(.A 3 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, .split, (.A 7 6 8 2 9), (.A 2 6 8 2 9), .split, (.A 3 6 10 2 9), .split, (.A 3 6 4 2 9), (.A 2 6 10 2 9), .split, (.D 41), .split, .split, (.A 3 1 4 3 9), (.A 3 1 4 3 5), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, .split, (.A 8 7 0 3 11), (.A 8 1 0 3 11), .split, (.D 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_5 : wsegOk P nbM114 (nInsideL P nbM114) kM114_5 tM114_5 kM114_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_6 : List Tok := [(.A 8 7 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, (.A 3 5 0 3 11), (.A 3 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 3 5 0 2 10), .split, (.A 2 5 4 2 10), (.A 3 5 4 2 10), .split, .split, (.A 3 1 0 3 11), (.A 3 1 4 3 9), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 3 5 4 3 10), (.A 8 1 4 3 9), (.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, .split, (.A 8 5 0 3 10), (.A 8 1 4 3 9), (.A 8 1 4 2 9), .split, (.A 8 5 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_6 : wsegOk P nbM114 (nInsideL P nbM114) kM114_6 tM114_6 kM114_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_7 : List Tok := [(.A 8 1 4 2 9), .split, (.D 9), .split, .split, .split, (.A 8 5 0 2 10), (.A 2 5 4 2 10), (.A 2 5 6 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, .split, (.A 3 1 4 3 11), (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 6 4 2 9), (.A 3 5 4 2 9), (.A 3 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, (.A 3 1 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_7 : wsegOk P nbM114 (nInsideL P nbM114) kM114_7 tM114_7 kM114_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_8 : List Tok := [(.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 3 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58), (.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_8 : wsegOk P nbM114 (nInsideL P nbM114) kM114_8 tM114_8 kM114_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM114_9 : List Tok := [(.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM114_9 : wsegOk P nbM114 (nInsideL P nbM114) kM114_9 tM114_9 [] = true := by
  decide +kernel

end PackLean.D28.Ico
