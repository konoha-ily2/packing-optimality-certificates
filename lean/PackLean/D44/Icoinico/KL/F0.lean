-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.S0_0
import PackLean.D44.Icoinico.KL.S0_1
import PackLean.D44.Icoinico.KL.S0_2

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f0_eq : f0 = t0_0 ++ (t0_1 ++ (t0_2)) := rfl

/-- 面 (0, 1)：葉 21（遠方の形 0）、3 区間（KSeg）。 -/
theorem face0 : faceRun P qlamL polysT ((0, 1), f0) = (true, 21, 0) := by
  rw [f0_eq]
  exact faceRun_of (seg_append (segOk_of s0_0) (seg_append (segOk_of s0_1) (segOk_of s0_2)))

end PackLean.D44.Icoinico.KL
