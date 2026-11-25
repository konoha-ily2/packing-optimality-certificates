-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Consts.lean と同じ命題（D44.constsQ）を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import PackLean.D44.Core
import PackLean.D44.Cubindod.K.ConstsG

namespace PackLean.D44.Cubindod.K
open PackLean.D16 PackLean.D44 PackLean.D44.Cubindod
open PackLean.D28 (QF)

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
theorem c_sstar : sstarIsSbar P = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_upper : upperOk { P with sstar := sUp } = true := by decide +kernel
set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_claim : claimOk P sbarS sUp sUpRat = true := by decide +kernel

set_option maxRecDepth 100000 in
theorem consts_ok : constsQ P sbarS sUp sUpRat = true := by
  rw [constsQ, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_sstar, c_upper, c_claim]
  decide +kernel

end PackLean.D44.Cubindod.K
