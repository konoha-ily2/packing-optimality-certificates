-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S0_0
import PackLean.D44.Octinoct.KL.S0_1
import PackLean.D44.Octinoct.KL.S0_2
import PackLean.D44.Octinoct.KL.S0_3
import PackLean.D44.Octinoct.KL.S0_4
import PackLean.D44.Octinoct.KL.S0_5
import PackLean.D44.Octinoct.KL.S0_6
import PackLean.D44.Octinoct.KL.S0_7
import PackLean.D44.Octinoct.KL.S0_8
import PackLean.D44.Octinoct.KL.S0_9
import PackLean.D44.Octinoct.KL.S0_10
import PackLean.D44.Octinoct.KL.S0_11
import PackLean.D44.Octinoct.KL.S0_12
import PackLean.D44.Octinoct.KL.S0_13
import PackLean.D44.Octinoct.KL.S0_14

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f0_eq : f0 = t0_0 ++ (t0_1 ++ (t0_2 ++ (t0_3 ++ (t0_4 ++ (t0_5 ++ (t0_6 ++ (t0_7 ++ (t0_8 ++ (t0_9 ++ (t0_10 ++ (t0_11 ++ (t0_12 ++ (t0_13 ++ (t0_14)))))))))))))) := rfl

/-- 面 (0, 1)：葉 141（遠方の形 0）、15 区間（KSeg）。 -/
theorem face0 : faceRun P qlamL polysT ((0, 1), f0) = (true, 141, 0) := by
  rw [f0_eq]
  exact faceRun_of (seg_append (segOk_of s0_0) (seg_append (segOk_of s0_1) (seg_append (segOk_of s0_2) (seg_append (segOk_of s0_3) (seg_append (segOk_of s0_4) (seg_append (segOk_of s0_5) (seg_append (segOk_of s0_6) (seg_append (segOk_of s0_7) (seg_append (segOk_of s0_8) (seg_append (segOk_of s0_9) (seg_append (segOk_of s0_10) (seg_append (segOk_of s0_11) (seg_append (segOk_of s0_12) (seg_append (segOk_of s0_13) (segOk_of s0_14)))))))))))))))

end PackLean.D44.Octinoct.KL
