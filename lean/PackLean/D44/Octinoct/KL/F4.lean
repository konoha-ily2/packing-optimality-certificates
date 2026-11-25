-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S4_0
import PackLean.D44.Octinoct.KL.S4_1

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f4_eq : f4 = t4_0 ++ (t4_1) := rfl

/-- 面 (2, 1)：葉 15（遠方の形 0）、2 区間（KSeg）。 -/
theorem face4 : faceRun P qlamL polysT ((2, 1), f4) = (true, 15, 0) := by
  rw [f4_eq]
  exact faceRun_of (seg_append (segOk_of s4_0) (segOk_of s4_1))

end PackLean.D44.Octinoct.KL
