-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarKey054

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_25 : List Tok := [(.D 9), .split, (.D 15), (.D 15), .split, .split, .split, .split, (.D 1), (.D 1), .split, (.D 4), (.D 10), .split, .split, .split, (.D 1), (.D 7), (.D 8), .split, (.D 11), (.D 11), .split, .split, .split, (.D 2), (.D 2), .split, (.D 10), (.D 6), .split, .split, (.D 8), .split, (.D 2), (.D 13), .split, (.D 19)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_25 : wsegOk P nbM130 (nInsideL P nbM130) kM130_25 tM130_25 kM130_26 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tM130_26 : List Tok := [(.D 19), .split, .split, (.D 17), (.D 17), .split, (.D 18), (.D 18)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sM130_26 : wsegOk P nbM130 (nInsideL P nbM130) kM130_26 tM130_26 [] = true := by
  decide +kernel

end PackLean.D28.Cub
