-- 自動で書き出したもの（lean/tools/e3g3_gen_d45dt.lean、E3g3）。手で直さない。
import PackLean.D45DT.KL.SegB_0
import PackLean.D45DT.KL.SegB_1
import PackLean.D45DT.KL.SegB_2
import PackLean.D45DT.KL.SegB_3
import PackLean.D45DT.KL.SegB_4
import PackLean.D45DT.KL.SegB_5
import PackLean.D45DT.KL.SegB_6
import PackLean.D45DT.KL.SegB_7
import PackLean.D45DT.KL.SegB_8
import PackLean.D45DT.KL.SegB_9
import PackLean.D45DT.KL.SegB_10
import PackLean.D45DT.KL.SegB_11
import PackLean.D45DT.KL.SegB_12
import PackLean.D45DT.KL.SegB_13
import PackLean.D45DT.KL.SegB_14
import PackLean.D45DT.KL.SegB_15
import PackLean.D45DT.KL.SegB_16
import PackLean.D45DT.KL.SegB_17
import PackLean.D45DT.KL.SegB_18
import PackLean.D45DT.KL.SegB_19
import PackLean.D45DT.KL.SegB_20
import PackLean.D45DT.KL.SegB_21
import PackLean.D45DT.KL.SegB_22
import PackLean.D45DT.KL.SegB_23
import PackLean.D45DT.KL.SegB_24
import PackLean.D45DT.KL.SegB_25

namespace PackLean.D45DT.KL
open PackLean.D28 PackLean.D45DT PackLean.Formal.KSeg

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem faceB_0 : faceRunL P ctxB ⟨[-224, 0, 512, -512, -512, -512], [64, 16, 512, 512, 512, 512]⟩ fB_0 = (true, 259) :=
  faceRunL_of (seg_append (segOk_of sB_0_0) (seg_append (segOk_of sB_0_1) (seg_append (segOk_of sB_0_2) (seg_append (segOk_of sB_0_3) (seg_append (segOk_of sB_0_4) (seg_append (segOk_of sB_0_5) (seg_append (segOk_of sB_0_6) (seg_append (segOk_of sB_0_7) (seg_append (segOk_of sB_0_8) (seg_append (segOk_of sB_0_9) (seg_append (segOk_of sB_0_10) (seg_append (segOk_of sB_0_11) (seg_append (segOk_of sB_0_12) (seg_append (segOk_of sB_0_13) (seg_append (segOk_of sB_0_14) (seg_append (segOk_of sB_0_15) (seg_append (segOk_of sB_0_16) (seg_append (segOk_of sB_0_17) (seg_append (segOk_of sB_0_18) (seg_append (segOk_of sB_0_19) (seg_append (segOk_of sB_0_20) (seg_append (segOk_of sB_0_21) (seg_append (segOk_of sB_0_22) (seg_append (segOk_of sB_0_23) (seg_append (segOk_of sB_0_24) (segOk_of sB_0_25))))))))))))))))))))))))))
theorem faceB_1 : faceRunL P ctxB ⟨[-224, 0, -512, -512, -512, -512], [64, 16, -512, 512, 512, 512]⟩ fB_1 = (true, 480) :=
  faceRunL_of (seg_append (segOk_of sB_1_0) (seg_append (segOk_of sB_1_1) (seg_append (segOk_of sB_1_2) (seg_append (segOk_of sB_1_3) (seg_append (segOk_of sB_1_4) (seg_append (segOk_of sB_1_5) (seg_append (segOk_of sB_1_6) (seg_append (segOk_of sB_1_7) (seg_append (segOk_of sB_1_8) (seg_append (segOk_of sB_1_9) (seg_append (segOk_of sB_1_10) (seg_append (segOk_of sB_1_11) (seg_append (segOk_of sB_1_12) (seg_append (segOk_of sB_1_13) (seg_append (segOk_of sB_1_14) (seg_append (segOk_of sB_1_15) (seg_append (segOk_of sB_1_16) (seg_append (segOk_of sB_1_17) (seg_append (segOk_of sB_1_18) (seg_append (segOk_of sB_1_19) (seg_append (segOk_of sB_1_20) (seg_append (segOk_of sB_1_21) (seg_append (segOk_of sB_1_22) (seg_append (segOk_of sB_1_23) (seg_append (segOk_of sB_1_24) (seg_append (segOk_of sB_1_25) (seg_append (segOk_of sB_1_26) (seg_append (segOk_of sB_1_27) (seg_append (segOk_of sB_1_28) (seg_append (segOk_of sB_1_29) (seg_append (segOk_of sB_1_30) (seg_append (segOk_of sB_1_31) (seg_append (segOk_of sB_1_32) (seg_append (segOk_of sB_1_33) (seg_append (segOk_of sB_1_34) (seg_append (segOk_of sB_1_35) (seg_append (segOk_of sB_1_36) (seg_append (segOk_of sB_1_37) (seg_append (segOk_of sB_1_38) (seg_append (segOk_of sB_1_39) (seg_append (segOk_of sB_1_40) (seg_append (segOk_of sB_1_41) (seg_append (segOk_of sB_1_42) (seg_append (segOk_of sB_1_43) (seg_append (segOk_of sB_1_44) (seg_append (segOk_of sB_1_45) (seg_append (segOk_of sB_1_46) (segOk_of sB_1_47))))))))))))))))))))))))))))))))))))))))))))))))
theorem faceB_2 : faceRunL P ctxB ⟨[-224, 0, -512, 512, -512, -512], [64, 16, 512, 512, 512, 512]⟩ fB_2 = (true, 2) :=
  faceRunL_of (segOk_of sB_2_0)
theorem faceB_3 : faceRunL P ctxB ⟨[-224, 0, -512, -512, -512, -512], [64, 16, 512, -512, 512, 512]⟩ fB_3 = (true, 40) :=
  faceRunL_of (seg_append (segOk_of sB_3_0) (seg_append (segOk_of sB_3_1) (seg_append (segOk_of sB_3_2) (segOk_of sB_3_3))))
theorem faceB_4 : faceRunL P ctxB ⟨[-224, 0, -512, -512, 512, -512], [64, 16, 512, 512, 512, 512]⟩ fB_4 = (true, 4) :=
  faceRunL_of (segOk_of sB_4_0)
theorem faceB_5 : faceRunL P ctxB ⟨[-224, 0, -512, -512, -512, -512], [64, 16, 512, 512, -512, 512]⟩ fB_5 = (true, 1) :=
  faceRunL_of (segOk_of sB_5_0)
theorem faceB_6 : faceRunL P ctxB ⟨[-224, 0, -512, -512, -512, 512], [64, 16, 512, 512, 512, 512]⟩ fB_6 = (true, 168) :=
  faceRunL_of (seg_append (segOk_of sB_6_0) (seg_append (segOk_of sB_6_1) (seg_append (segOk_of sB_6_2) (seg_append (segOk_of sB_6_3) (seg_append (segOk_of sB_6_4) (seg_append (segOk_of sB_6_5) (seg_append (segOk_of sB_6_6) (seg_append (segOk_of sB_6_7) (seg_append (segOk_of sB_6_8) (seg_append (segOk_of sB_6_9) (seg_append (segOk_of sB_6_10) (seg_append (segOk_of sB_6_11) (seg_append (segOk_of sB_6_12) (seg_append (segOk_of sB_6_13) (seg_append (segOk_of sB_6_14) (seg_append (segOk_of sB_6_15) (segOk_of sB_6_16)))))))))))))))))
theorem faceB_7 : faceRunL P ctxB ⟨[-224, 0, -512, -512, -512, -512], [64, 16, 512, 512, 512, -512]⟩ fB_7 = (true, 48) :=
  faceRunL_of (seg_append (segOk_of sB_7_0) (seg_append (segOk_of sB_7_1) (seg_append (segOk_of sB_7_2) (seg_append (segOk_of sB_7_3) (segOk_of sB_7_4)))))

end PackLean.D45DT.KL
