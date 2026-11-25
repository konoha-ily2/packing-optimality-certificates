-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S1_0
import PackLean.D44.Octinoct.KL.S1_1
import PackLean.D44.Octinoct.KL.S1_2
import PackLean.D44.Octinoct.KL.S1_3
import PackLean.D44.Octinoct.KL.S1_4
import PackLean.D44.Octinoct.KL.S1_5
import PackLean.D44.Octinoct.KL.S1_6
import PackLean.D44.Octinoct.KL.S1_7
import PackLean.D44.Octinoct.KL.S1_8
import PackLean.D44.Octinoct.KL.S1_9
import PackLean.D44.Octinoct.KL.S1_10
import PackLean.D44.Octinoct.KL.S1_11
import PackLean.D44.Octinoct.KL.S1_12
import PackLean.D44.Octinoct.KL.S1_13
import PackLean.D44.Octinoct.KL.S1_14
import PackLean.D44.Octinoct.KL.S1_15
import PackLean.D44.Octinoct.KL.S1_16
import PackLean.D44.Octinoct.KL.S1_17
import PackLean.D44.Octinoct.KL.S1_18
import PackLean.D44.Octinoct.KL.S1_19
import PackLean.D44.Octinoct.KL.S1_20
import PackLean.D44.Octinoct.KL.S1_21
import PackLean.D44.Octinoct.KL.S1_22
import PackLean.D44.Octinoct.KL.S1_23
import PackLean.D44.Octinoct.KL.S1_24
import PackLean.D44.Octinoct.KL.S1_25
import PackLean.D44.Octinoct.KL.S1_26
import PackLean.D44.Octinoct.KL.S1_27
import PackLean.D44.Octinoct.KL.S1_28
import PackLean.D44.Octinoct.KL.S1_29
import PackLean.D44.Octinoct.KL.S1_30
import PackLean.D44.Octinoct.KL.S1_31
import PackLean.D44.Octinoct.KL.S1_32

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f1_eq : f1 = t1_0 ++ (t1_1 ++ (t1_2 ++ (t1_3 ++ (t1_4 ++ (t1_5 ++ (t1_6 ++ (t1_7 ++ (t1_8 ++ (t1_9 ++ (t1_10 ++ (t1_11 ++ (t1_12 ++ (t1_13 ++ (t1_14 ++ (t1_15 ++ (t1_16 ++ (t1_17 ++ (t1_18 ++ (t1_19 ++ (t1_20 ++ (t1_21 ++ (t1_22 ++ (t1_23 ++ (t1_24 ++ (t1_25 ++ (t1_26 ++ (t1_27 ++ (t1_28 ++ (t1_29 ++ (t1_30 ++ (t1_31 ++ (t1_32)))))))))))))))))))))))))))))))) := rfl

/-- 面 (0, -1)：葉 240（遠方の形 87）、33 区間（KSeg）。 -/
theorem face1 : faceRun P qlamL polysT ((0, -1), f1) = (true, 240, 87) := by
  rw [f1_eq]
  exact faceRun_of (seg_append (segOk_of s1_0) (seg_append (segOk_of s1_1) (seg_append (segOk_of s1_2) (seg_append (segOk_of s1_3) (seg_append (segOk_of s1_4) (seg_append (segOk_of s1_5) (seg_append (segOk_of s1_6) (seg_append (segOk_of s1_7) (seg_append (segOk_of s1_8) (seg_append (segOk_of s1_9) (seg_append (segOk_of s1_10) (seg_append (segOk_of s1_11) (seg_append (segOk_of s1_12) (seg_append (segOk_of s1_13) (seg_append (segOk_of s1_14) (seg_append (segOk_of s1_15) (seg_append (segOk_of s1_16) (seg_append (segOk_of s1_17) (seg_append (segOk_of s1_18) (seg_append (segOk_of s1_19) (seg_append (segOk_of s1_20) (seg_append (segOk_of s1_21) (seg_append (segOk_of s1_22) (seg_append (segOk_of s1_23) (seg_append (segOk_of s1_24) (seg_append (segOk_of s1_25) (seg_append (segOk_of s1_26) (seg_append (segOk_of s1_27) (seg_append (segOk_of s1_28) (seg_append (segOk_of s1_29) (seg_append (segOk_of s1_30) (seg_append (segOk_of s1_31) (segOk_of s1_32)))))))))))))))))))))))))))))))))

end PackLean.D44.Octinoct.KL
