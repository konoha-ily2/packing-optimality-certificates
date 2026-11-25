-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 定数の部品 c_sqb を decide +kernel で（Consts から分けたもの）。
import PackLean.D30X.Cub.K.ConstsG

namespace PackLean.D30X.Cub.K
open PackLean.D16 PackLean.D30X.Cub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem c_sqb : sqbOk P = true := by decide +kernel

end PackLean.D30X.Cub.K
