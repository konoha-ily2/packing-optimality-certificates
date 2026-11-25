-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 局所の ident（候補の形と F(0) = 0）を decide +kernel で。
import PackLean.D30.K.LocalS

namespace PackLean.D30.K
open PackLean.D16 PackLean.D16.KLoc PackLean.D30

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem lident : identOk P cands = true := by decide +kernel

end PackLean.D30.K
