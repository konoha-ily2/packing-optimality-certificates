-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Consts.lean と同じ命題を、部品ごとの decide +kernel で（対称性の組は ConstsG）。
import PackLean.D30X.Cub.K.ConstsG
import PackLean.D30X.Cub.K.C_sqb
import PackLean.D30X.Cub.K.C_piece
import PackLean.D30X.Cub.K.C_cont
import PackLean.D30X.Cub.K.C_bounds
import PackLean.D30X.Cub.K.C_upper

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D30X.Cub


set_option maxRecDepth 100000 in
theorem consts_ok : constsOk P = true := by
  rw [constsOk, c_sqb, c_piece, c_cont, group_ok, c_bounds, c_upper]
  decide +kernel

end PackLean.D30X.Cub.K
