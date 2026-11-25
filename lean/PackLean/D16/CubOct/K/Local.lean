-- 自動で書き出したもの（lean/tools/export_d16.py）。手で直さない。
-- E3a′：元の CoverLocal.lean と同じ命題を decide +kernel で。
import PackLean.D16.CubOct.CoverLocal

namespace PackLean.D16.CubOct.K
open PackLean.D16C PackLean.D16.CubOct

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem cover_local_ok : D16C.localOk CP lfaces = (true, 4) := by decide +kernel

end PackLean.D16.CubOct.K
