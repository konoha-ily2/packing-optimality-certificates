-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S2_0
import PackLean.D44.Octinoct.KL.S2_1
import PackLean.D44.Octinoct.KL.S2_2
import PackLean.D44.Octinoct.KL.S2_3
import PackLean.D44.Octinoct.KL.S2_4
import PackLean.D44.Octinoct.KL.S2_5
import PackLean.D44.Octinoct.KL.S2_6
import PackLean.D44.Octinoct.KL.S2_7
import PackLean.D44.Octinoct.KL.S2_8
import PackLean.D44.Octinoct.KL.S2_9
import PackLean.D44.Octinoct.KL.S2_10
import PackLean.D44.Octinoct.KL.S2_11
import PackLean.D44.Octinoct.KL.S2_12
import PackLean.D44.Octinoct.KL.S2_13
import PackLean.D44.Octinoct.KL.S2_14
import PackLean.D44.Octinoct.KL.S2_15
import PackLean.D44.Octinoct.KL.S2_16
import PackLean.D44.Octinoct.KL.S2_17

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f2_eq : f2 = t2_0 ++ (t2_1 ++ (t2_2 ++ (t2_3 ++ (t2_4 ++ (t2_5 ++ (t2_6 ++ (t2_7 ++ (t2_8 ++ (t2_9 ++ (t2_10 ++ (t2_11 ++ (t2_12 ++ (t2_13 ++ (t2_14 ++ (t2_15 ++ (t2_16 ++ (t2_17))))))))))))))))) := rfl

/-- 面 (1, 1)：葉 173（遠方の形 0）、18 区間（KSeg）。 -/
theorem face2 : faceRun P qlamL polysT ((1, 1), f2) = (true, 173, 0) := by
  rw [f2_eq]
  exact faceRun_of (seg_append (segOk_of s2_0) (seg_append (segOk_of s2_1) (seg_append (segOk_of s2_2) (seg_append (segOk_of s2_3) (seg_append (segOk_of s2_4) (seg_append (segOk_of s2_5) (seg_append (segOk_of s2_6) (seg_append (segOk_of s2_7) (seg_append (segOk_of s2_8) (seg_append (segOk_of s2_9) (seg_append (segOk_of s2_10) (seg_append (segOk_of s2_11) (seg_append (segOk_of s2_12) (seg_append (segOk_of s2_13) (seg_append (segOk_of s2_14) (seg_append (segOk_of s2_15) (seg_append (segOk_of s2_16) (segOk_of s2_17))))))))))))))))))

end PackLean.D44.Octinoct.KL
