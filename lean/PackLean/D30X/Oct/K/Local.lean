-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Local.lean と同じ命題を、ident と 6 面に分けた decide +kernel で（KernelLocal.localOk_eq）。
import PackLean.D30X.Oct.K.LocalI
import PackLean.D30X.Oct.K.LocalF0
import PackLean.D30X.Oct.K.LocalF1
import PackLean.D30X.Oct.K.LocalF2
import PackLean.D30X.Oct.K.LocalF3
import PackLean.D30X.Oct.K.LocalF4
import PackLean.D30X.Oct.K.LocalF5

namespace PackLean.D30X.Oct.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30X.Oct

set_option maxRecDepth 100000 in
theorem local_ok : localOk P cands faces = (true, 126) := by
  rw [faces_eq, localOk_eq, lident, lface0, lface1, lface2, lface3, lface4, lface5]
  decide +kernel

end PackLean.D30X.Oct.K
