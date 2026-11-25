-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.Faces

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

/-- 面 (0, -1)：葉 1（遠方の形 0）。 -/
theorem face1 : faceRun P qlamL polysT ((0, -1), f1) = (true, 1, 0) := by
  decide +kernel

end PackLean.D44.Icoinico.KL
