-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Consts.lean と同じ命題（D44.constsQ）を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import PackLean.D44.Core
import PackLean.D44.Octinoct.K.ConstsG
import PackLean.D44.Octinoct.K.C_sqb
import PackLean.D44.Octinoct.K.C_piece
import PackLean.D44.Octinoct.K.C_cont
import PackLean.D44.Octinoct.K.C_bounds
import PackLean.D44.Octinoct.K.C_sstar
import PackLean.D44.Octinoct.K.C_upper
import PackLean.D44.Octinoct.K.C_claim

namespace PackLean.D44.Octinoct.K
open PackLean.D16 PackLean.D44 PackLean.D44.Octinoct
open PackLean.D28 (QF)


set_option maxRecDepth 100000 in
theorem consts_ok : constsQ P sbarS sUp sUpRat = true := by
  rw [constsQ, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_sstar, c_upper, c_claim]
  decide +kernel

end PackLean.D44.Octinoct.K
