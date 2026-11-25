-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Consts.lean と同じ命題を decide +kernel で。
import PackLean.D16.IcoCub.Data

namespace PackLean.D16.IcoCub.K
open PackLean.D16 PackLean.D16.IcoCub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem consts_ok : constsOk P = true := by decide +kernel

end PackLean.D16.IcoCub.K
