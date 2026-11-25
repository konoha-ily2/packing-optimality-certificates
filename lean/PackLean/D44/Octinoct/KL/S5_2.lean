-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.Segs

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- 面 (2, -1) の区間 2：葉 10。 -/
theorem s5_2 : segChk P qlamL polysT 2 (-1) key5_2 t5_2 key5_3 = true := by
  decide +kernel

end PackLean.D44.Octinoct.KL
