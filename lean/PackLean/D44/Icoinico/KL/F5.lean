-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.S5_0
import PackLean.D44.Icoinico.KL.S5_1
import PackLean.D44.Icoinico.KL.S5_2
import PackLean.D44.Icoinico.KL.S5_3

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f5_eq : f5 = t5_0 ++ (t5_1 ++ (t5_2 ++ (t5_3))) := rfl

/-- 面 (2, -1)：葉 36（遠方の形 0）、4 区間（KSeg）。 -/
theorem face5 : faceRun P qlamL polysT ((2, -1), f5) = (true, 36, 0) := by
  rw [f5_eq]
  exact faceRun_of (seg_append (segOk_of s5_0) (seg_append (segOk_of s5_1) (seg_append (segOk_of s5_2) (segOk_of s5_3))))

end PackLean.D44.Icoinico.KL
