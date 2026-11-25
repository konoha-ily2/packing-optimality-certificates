-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S5_0
import PackLean.D44.Octinoct.KL.S5_1
import PackLean.D44.Octinoct.KL.S5_2
import PackLean.D44.Octinoct.KL.S5_3
import PackLean.D44.Octinoct.KL.S5_4
import PackLean.D44.Octinoct.KL.S5_5
import PackLean.D44.Octinoct.KL.S5_6
import PackLean.D44.Octinoct.KL.S5_7

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f5_eq : f5 = t5_0 ++ (t5_1 ++ (t5_2 ++ (t5_3 ++ (t5_4 ++ (t5_5 ++ (t5_6 ++ (t5_7))))))) := rfl

/-- 面 (2, -1)：葉 72（遠方の形 0）、8 区間（KSeg）。 -/
theorem face5 : faceRun P qlamL polysT ((2, -1), f5) = (true, 72, 0) := by
  rw [f5_eq]
  exact faceRun_of (seg_append (segOk_of s5_0) (seg_append (segOk_of s5_1) (seg_append (segOk_of s5_2) (seg_append (segOk_of s5_3) (seg_append (segOk_of s5_4) (seg_append (segOk_of s5_5) (seg_append (segOk_of s5_6) (segOk_of s5_7))))))))

end PackLean.D44.Octinoct.KL
