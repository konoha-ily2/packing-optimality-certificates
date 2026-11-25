-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.Segs

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- 面 (0, 1) の区間 2：葉 1。 -/
theorem s0_2 : segChk P qlamL polysT 0 1 key0_2 t0_2 ([], 21, 0) = true := by
  decide +kernel

end PackLean.D44.Icoinico.KL
