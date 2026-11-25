-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.Segs

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- 面 (1, -1) の区間 3：葉 10。 -/
theorem s3_3 : segChk P qlamL polysT 1 (-1) key3_3 t3_3 key3_4 = true := by
  decide +kernel

end PackLean.D44.Octinoct.KL
