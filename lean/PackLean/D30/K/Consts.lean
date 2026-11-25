-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Consts.lean と同じ命題を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import PackLean.D30.K.ConstsG

namespace PackLean.D30.K
open PackLean.D16 PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_sqb : sqbOk P = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_piece : pieceOk P = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_cont : containerOk P = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_bounds : boundsOk P = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_upper : upperOk P = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem consts_ok : constsOk P = true := by
  rw [constsOk, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_upper]
  decide +kernel

end PackLean.D30.K
