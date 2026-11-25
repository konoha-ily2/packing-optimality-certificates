-- 自動で書き出したもの（lean/tools/export_kernel_far.py、E3c）。手で直さない。
-- 元の Local.lean と同じ命題を decide +kernel で。
import PackLean.D16.IcoCub.Local

namespace PackLean.D16.IcoCub.K
open PackLean.D16 PackLean.D16.IcoCub

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem local_ok : localOk P cands faces = (true, 24) := by decide +kernel

end PackLean.D16.IcoCub.K
