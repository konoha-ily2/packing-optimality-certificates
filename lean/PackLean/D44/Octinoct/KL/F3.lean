-- 自動で書き出したもの（lean/tools/e3g_gen_d44.py、E3g2）。手で直さない。
import PackLean.D44.Octinoct.KL.S3_0
import PackLean.D44.Octinoct.KL.S3_1
import PackLean.D44.Octinoct.KL.S3_2
import PackLean.D44.Octinoct.KL.S3_3
import PackLean.D44.Octinoct.KL.S3_4
import PackLean.D44.Octinoct.KL.S3_5
import PackLean.D44.Octinoct.KL.S3_6
import PackLean.D44.Octinoct.KL.S3_7
import PackLean.D44.Octinoct.KL.S3_8
import PackLean.D44.Octinoct.KL.S3_9
import PackLean.D44.Octinoct.KL.S3_10
import PackLean.D44.Octinoct.KL.S3_11
import PackLean.D44.Octinoct.KL.S3_12
import PackLean.D44.Octinoct.KL.S3_13
import PackLean.D44.Octinoct.KL.S3_14
import PackLean.D44.Octinoct.KL.S3_15
import PackLean.D44.Octinoct.KL.S3_16
import PackLean.D44.Octinoct.KL.S3_17
import PackLean.D44.Octinoct.KL.S3_18
import PackLean.D44.Octinoct.KL.S3_19
import PackLean.D44.Octinoct.KL.S3_20
import PackLean.D44.Octinoct.KL.S3_21
import PackLean.D44.Octinoct.KL.S3_22
import PackLean.D44.Octinoct.KL.S3_23
import PackLean.D44.Octinoct.KL.S3_24
import PackLean.D44.Octinoct.KL.S3_25
import PackLean.D44.Octinoct.KL.S3_26
import PackLean.D44.Octinoct.KL.S3_27
import PackLean.D44.Octinoct.KL.S3_28
import PackLean.D44.Octinoct.KL.S3_29
import PackLean.D44.Octinoct.KL.S3_30
import PackLean.D44.Octinoct.KL.S3_31
import PackLean.D44.Octinoct.KL.S3_32
import PackLean.D44.Octinoct.KL.S3_33
import PackLean.D44.Octinoct.KL.S3_34
import PackLean.D44.Octinoct.KL.S3_35
import PackLean.D44.Octinoct.KL.S3_36
import PackLean.D44.Octinoct.KL.S3_37
import PackLean.D44.Octinoct.KL.S3_38
import PackLean.D44.Octinoct.KL.S3_39

namespace PackLean.D44.Octinoct.KL
open PackLean.D16 PackLean.D44 PackLean.D44.KL PackLean.D44.Octinoct
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem f3_eq : f3 = t3_0 ++ (t3_1 ++ (t3_2 ++ (t3_3 ++ (t3_4 ++ (t3_5 ++ (t3_6 ++ (t3_7 ++ (t3_8 ++ (t3_9 ++ (t3_10 ++ (t3_11 ++ (t3_12 ++ (t3_13 ++ (t3_14 ++ (t3_15 ++ (t3_16 ++ (t3_17 ++ (t3_18 ++ (t3_19 ++ (t3_20 ++ (t3_21 ++ (t3_22 ++ (t3_23 ++ (t3_24 ++ (t3_25 ++ (t3_26 ++ (t3_27 ++ (t3_28 ++ (t3_29 ++ (t3_30 ++ (t3_31 ++ (t3_32 ++ (t3_33 ++ (t3_34 ++ (t3_35 ++ (t3_36 ++ (t3_37 ++ (t3_38 ++ (t3_39))))))))))))))))))))))))))))))))))))))) := rfl

/-- 面 (1, -1)：葉 297（遠方の形 99）、40 区間（KSeg）。 -/
theorem face3 : faceRun P qlamL polysT ((1, -1), f3) = (true, 297, 99) := by
  rw [f3_eq]
  exact faceRun_of (seg_append (segOk_of s3_0) (seg_append (segOk_of s3_1) (seg_append (segOk_of s3_2) (seg_append (segOk_of s3_3) (seg_append (segOk_of s3_4) (seg_append (segOk_of s3_5) (seg_append (segOk_of s3_6) (seg_append (segOk_of s3_7) (seg_append (segOk_of s3_8) (seg_append (segOk_of s3_9) (seg_append (segOk_of s3_10) (seg_append (segOk_of s3_11) (seg_append (segOk_of s3_12) (seg_append (segOk_of s3_13) (seg_append (segOk_of s3_14) (seg_append (segOk_of s3_15) (seg_append (segOk_of s3_16) (seg_append (segOk_of s3_17) (seg_append (segOk_of s3_18) (seg_append (segOk_of s3_19) (seg_append (segOk_of s3_20) (seg_append (segOk_of s3_21) (seg_append (segOk_of s3_22) (seg_append (segOk_of s3_23) (seg_append (segOk_of s3_24) (seg_append (segOk_of s3_25) (seg_append (segOk_of s3_26) (seg_append (segOk_of s3_27) (seg_append (segOk_of s3_28) (seg_append (segOk_of s3_29) (seg_append (segOk_of s3_30) (seg_append (segOk_of s3_31) (seg_append (segOk_of s3_32) (seg_append (segOk_of s3_33) (seg_append (segOk_of s3_34) (seg_append (segOk_of s3_35) (seg_append (segOk_of s3_36) (seg_append (segOk_of s3_37) (seg_append (segOk_of s3_38) (segOk_of s3_39))))))))))))))))))))))))))))))))))))))))

end PackLean.D44.Octinoct.KL
