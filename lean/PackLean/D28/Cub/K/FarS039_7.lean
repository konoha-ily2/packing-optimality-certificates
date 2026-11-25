-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey039

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM099_24 : List Tok := [.split, .split, (.A 0 2 5 0 1), .split, (.A 4 2 5 0 1), .split, .split, (.A 0 3 5 0 1), (.A 4 3 5 0 1), (.A 4 2 5 0 1), .split, .split, (.A 4 2 5 0 1), .split, (.A 0 2 5 0 1), (.A 4 2 5 0 1), (.A 4 2 5 0 1), .split, .split, .split, (.A 4 2 7 0 1), (.A 4 3 7 0 1), (.A 4 2 7 4 1), (.A 4 3 7 4 1), .split, .split, .split, .split, (.A 4 2 7 4 1), (.A 4 2 7 4 1), (.A 4 2 7 4 1), .split, .split, (.A 4 2 5 4 1), (.A 4 2 7 4 1), (.D 12), (.A 4 2 7 4 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM099_24 : wsegOk P nbM099 (nInsideL P nbM099) kM099_24 tM099_24 kM099_25 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM099_25 : List Tok := [.split, .split, .split, .split, .split, .split, (.A 0 6 5 0 1), (.D 12), (.A 4 7 5 0 1), (.D 12), (.D 18), (.A 4 3 5 4 1), (.D 12), .split, .split, .split, (.A 4 3 7 4 1), (.D 6), .split, (.A 4 2 7 4 1), (.D 19), .split, (.D 6), (.D 19), .split, .split, .split, .split, .split, (.A 5 2 7 4 1), (.D 12), (.A 4 2 7 4 1), (.D 12), (.D 12), .split, .split, (.D 19), (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM099_25 : wsegOk P nbM099 (nInsideL P nbM099) kM099_25 tM099_25 kM099_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM099_26 : List Tok := [(.D 19), .split, .split, (.D 9), (.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM099_26 : wsegOk P nbM099 (nInsideL P nbM099) kM099_26 tM099_26 kM099_27 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM099_27 : List Tok := [(.D 13), .split, (.D 19), (.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM099_27 : wsegOk P nbM099 (nInsideL P nbM099) kM099_27 tM099_27 [] = true := by
  decide +kernel

end PackLean.D28.Cub
