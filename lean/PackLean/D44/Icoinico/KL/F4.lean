-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Icoinico.KL.S4_0
import PackLean.D44.Icoinico.KL.S4_1
import PackLean.D44.Icoinico.KL.S4_2
import PackLean.D44.Icoinico.KL.S4_3
import PackLean.D44.Icoinico.KL.S4_4
import PackLean.D44.Icoinico.KL.S4_5
import PackLean.D44.Icoinico.KL.S4_6
import PackLean.D44.Icoinico.KL.S4_7
import PackLean.D44.Icoinico.KL.S4_8

namespace PackLean.D44.Icoinico.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Icoinico
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f4_eq : f4 = t4_0 ++ (t4_1 ++ (t4_2 ++ (t4_3 ++ (t4_4 ++ (t4_5 ++ (t4_6 ++ (t4_7 ++ (t4_8)))))))) := rfl

/-- 面 (2, 1)：葉 88（遠方の形 0）、9 区間（KSeg）。 -/
theorem face4 : faceRun P qlamL polysT ((2, 1), f4) = (true, 88, 0) := by
  rw [f4_eq]
  exact faceRun_of (seg_append (segOk_of s4_0) (seg_append (segOk_of s4_1) (seg_append (segOk_of s4_2) (seg_append (segOk_of s4_3) (seg_append (segOk_of s4_4) (seg_append (segOk_of s4_5) (seg_append (segOk_of s4_6) (seg_append (segOk_of s4_7) (segOk_of s4_8)))))))))

end PackLean.D44.Icoinico.KL
