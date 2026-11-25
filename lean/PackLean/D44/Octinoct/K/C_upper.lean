-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 定数の部品 c_upper を decide +kernel で（Consts から分けたもの）。
import PackLean.D44.Core
import PackLean.D44.Octinoct.K.ConstsG

namespace PackLean.D44.Octinoct.K
open PackLean.D16 PackLean.D44 PackLean.D44.Octinoct
open PackLean.D28 (QF)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_upper : upperOk { P with sstar := sUp } = true := by decide +kernel

end PackLean.D44.Octinoct.K
