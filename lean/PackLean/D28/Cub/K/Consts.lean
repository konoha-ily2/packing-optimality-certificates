-- 自動で書き出したもの（lean/tools/export_d28_kernel.py）。手で直さない。
import PackLean.D28.Cub.Data

namespace PackLean.D28.Cub
open PackLean.D28

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_part0 : sqbOk P = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_part1 : (P.rots.length == 24) = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_part2 : rotsOk P = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_part3 : pieceOk P 8 3 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_part4 : rangesOk P = true := by decide +kernel

/-- 元と同じ命題（部品ごとの decide +kernel を書き換えでまとめる）。 -/
theorem consts_ok : (sqbOk P && P.rots.length == 24 && rotsOk P && pieceOk P 8 3 && rangesOk P) = true := by
  rw [consts_part0, consts_part1, consts_part2, consts_part3, consts_part4]; rfl

end PackLean.D28.Cub
