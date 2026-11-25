-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarKey019

namespace PackLean.D28.Ico
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_1 : List Tok := [(.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), .split, (.A 3 5 0 3 11), .split, (.A 3 6 0 7 10), .split, (.A 3 1 8 3 11), (.A 3 5 0 3 11), .split, (.D 3), .split, (.D 11), .split, .split, .split, (.D 11), .split, (.A 7 6 8 7 10), (.D 3), .split, (.A 7 6 8 7 11), .split, .split, (.A 7 6 8 7 10), .split, (.A 7 6 8 7 11), .split, .split, .split, (.A 7 6 8 7 10), (.A 2 6 8 7 10), (.A 3 6 8 7 9), (.A 2 6 8 7 9), (.A 7 6 8 7 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_1 : wsegOk P nbM133 (nInsideL P nbM133) kM133_1 tM133_1 kM133_2 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_2 : List Tok := [.split, .split, (.D 7), .split, .split, (.D 9), .split, .split, .split, (.D 7), (.A 7 5 0 7 10), (.D 33), .split, .split, (.A 3 5 0 3 10), .split, (.A 2 5 0 7 10), .split, (.A 3 5 0 3 10), (.A 2 5 0 2 10), (.A 2 5 0 2 10), (.D 33), .split, (.D 3), .split, .split, .split, .split, .split, .split, (.A 7 11 0 7 10), .split, (.A 7 6 0 7 10), .split, (.A 2 5 0 7 10), .split, (.D 3), (.A 2 6 0 7 10), (.D 3), (.D 33), .split, .split, .split, .split, (.A 2 6 8 7 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_2 : wsegOk P nbM133 (nInsideL P nbM133) kM133_2 tM133_2 kM133_3 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_3 : List Tok := [.split, (.A 2 5 0 7 10), (.A 2 6 0 2 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, .split, .split, (.A 2 6 0 7 10), .split, (.A 3 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), (.A 2 5 4 2 9), (.A 2 6 8 2 9), .split, (.A 2 5 4 2 10), (.D 21), (.D 21), (.D 33), .split, .split, .split, .split, (.D 41), .split, (.D 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_3 : wsegOk P nbM133 (nInsideL P nbM133) kM133_3 tM133_3 kM133_4 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_4 : List Tok := [.split, .split, (.A 3 1 8 3 11), (.A 3 1 0 3 11), .split, (.D 41), .split, (.D 1), (.A 3 1 4 3 11), (.D 1), .split, .split, (.D 41), .split, .split, .split, .split, .split, (.A 7 1 8 7 11), .split, (.D 41), (.A 3 1 8 7 11), (.D 40), .split, .split, .split, (.A 3 6 8 7 11), .split, (.A 3 1 8 2 9), (.A 2 6 8 2 9), .split, .split, (.A 3 1 4 3 11), (.A 3 1 8 2 9), (.A 3 1 4 2 9), .split, (.A 2 6 8 2 9), .split, .split, (.A 3 6 10 2 9), (.D 40)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_4 : wsegOk P nbM133 (nInsideL P nbM133) kM133_4 tM133_4 kM133_5 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_5 : List Tok := [(.A 2 6 10 2 9), .split, (.D 41), .split, (.A 3 1 4 3 9), (.D 20), (.D 40), (.D 20), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 8 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), .split, .split, .split, (.A 3 5 0 3 11), (.A 3 5 4 3 9), (.A 2 5 0 2 10), .split, (.A 3 1 4 3 11), (.A 3 5 4 2 9), .split, (.A 2 5 0 2 10), (.A 2 5 4 2 10), .split, (.A 3 1 4 3 11), .split, .split, .split, .split, (.A 8 5 0 3 11), .split, (.A 3 5 4 3 10), (.A 8 1 4 3 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_5 : wsegOk P nbM133 (nInsideL P nbM133) kM133_5 tM133_5 kM133_6 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_6 : List Tok := [(.A 8 5 0 2 10), .split, (.A 8 1 4 3 11), .split, (.A 8 5 4 3 10), (.A 8 1 4 2 9), (.A 2 1 4 2 9), .split, (.D 9), .split, (.A 2 5 4 2 10), (.A 8 5 4 2 10), .split, .split, (.D 1), .split, .split, (.A 3 1 4 3 9), (.A 8 1 4 3 9), (.A 8 1 4 8 9), (.D 31), (.D 31), (.D 1), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 3 5 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_6 : wsegOk P nbM133 (nInsideL P nbM133) kM133_6 tM133_6 kM133_7 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_7 : List Tok := [(.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), (.A 2 1 4 2 9), (.A 2 6 4 2 9), (.A 2 5 4 2 9), .split, .split, (.A 8 1 4 2 9), (.D 20), (.D 31), (.D 21), (.D 31), (.D 20), .split, .split, (.D 34), (.D 8), .split, (.D 22), (.D 30), .split, .split, (.D 50), (.D 35), .split, (.D 58)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_7 : wsegOk P nbM133 (nInsideL P nbM133) kM133_7 tM133_7 kM133_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM133_8 : List Tok := [(.D 25), .split, .split, (.D 12), (.D 39), .split, (.D 43), (.D 51)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM133_8 : wsegOk P nbM133 (nInsideL P nbM133) kM133_8 tM133_8 [] = true := by
  decide +kernel

end PackLean.D28.Ico
