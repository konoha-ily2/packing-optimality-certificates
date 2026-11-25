-- 自動で書き出したもの（lean/tools/e3g_gen_d30s3.lean、E3g）。手で直さない。
import PackLean.D30S3.KL.CP0
import PackLean.D30S3.KL.CP1
import PackLean.D30S3.KL.CP2
import PackLean.D30S3.KL.CP3
import PackLean.D30S3.KL.CP4
import PackLean.D30S3.KL.SB0_0
import PackLean.D30S3.KL.SB0_1
import PackLean.D30S3.KL.SB0_2
import PackLean.D30S3.KL.SB0_3
import PackLean.D30S3.KL.SB0_4
import PackLean.D30S3.KL.SB0_5
import PackLean.D30S3.KL.SB0_6
import PackLean.D30S3.KL.SB0_7
import PackLean.D30S3.KL.SB0_8
import PackLean.D30S3.KL.SB0_9
import PackLean.D30S3.KL.SB0_10
import PackLean.D30S3.KL.SB0_11
import PackLean.D30S3.KL.SB1_0
import PackLean.D30S3.KL.SB1_1
import PackLean.D30S3.KL.SB1_2
import PackLean.D30S3.KL.SB1_3
import PackLean.D30S3.KL.SB1_4
import PackLean.D30S3.KL.SB1_5
import PackLean.D30S3.KL.SB1_6
import PackLean.D30S3.KL.SB1_7
import PackLean.D30S3.KL.SB1_8
import PackLean.D30S3.KL.SB1_9
import PackLean.D30S3.KL.SB1_10
import PackLean.D30S3.KL.SB2_0
import PackLean.D30S3.KL.SB2_1
import PackLean.D30S3.KL.SB2_2
import PackLean.D30S3.KL.SB2_3
import PackLean.D30S3.KL.SB2_4
import PackLean.D30S3.KL.SB2_5
import PackLean.D30S3.KL.SB2_6
import PackLean.D30S3.KL.SB2_7
import PackLean.D30S3.KL.SB2_8
import PackLean.D30S3.KL.SB2_9
import PackLean.D30S3.KL.SB2_10
import PackLean.D30S3.KL.SB3_0
import PackLean.D30S3.KL.SB3_1
import PackLean.D30S3.KL.SB3_2
import PackLean.D30S3.KL.SB3_3
import PackLean.D30S3.KL.SB3_4
import PackLean.D30S3.KL.SB3_5
import PackLean.D30S3.KL.SB3_6
import PackLean.D30S3.KL.SB3_7
import PackLean.D30S3.KL.SB3_8
import PackLean.D30S3.KL.SB3_9
import PackLean.D30S3.KL.SB3_10
import PackLean.D30S3.KL.SB3_11

namespace PackLean.D30S3.KL
open PackLean.D16 PackLean.D30S3
open PackLean.D28 (Poly)

set_option maxRecDepth 100000
set_option maxHeartbeats 0

theorem ct_ok : CPOk P ct.1 ct.2.1 ct.2.2 :=
  cpOk_cons cp_ok0 (cpOk_cons cp_ok1 (cpOk_cons cp_ok2 (cpOk_cons cp_ok3 (cpOk_cons cp_ok4 (cpOk_cons cp_ok5 (cpOk_cons cp_ok6 (cpOk_cons cp_ok7 (cpOk_cons cp_ok8 (cpOk_cons cp_ok9 (cpOk_cons cp_ok10 (cpOk_cons cp_ok11 (cpOk_cons cp_ok12 (cpOk_cons cp_ok13 (cpOk_cons cp_ok14 (cpOk_cons cp_ok15 (cpOk_cons cp_ok16 (cpOk_cons cp_ok17 (cpOk_cons cp_ok18 (cpOk_cons cp_ok19 (cpOk_cons cp_ok20 (cpOk_cons cp_ok21 (cpOk_cons cp_ok22 (cpOk_cons cp_ok23 (cpOk_cons cp_ok24 (cpOk_cons cp_ok25 (cpOk_cons cp_ok26 (cpOk_cons cp_ok27 (cpOk_cons cp_ok28 (cpOk_cons cp_ok29 (cpOk_cons cp_ok30 (cpOk_cons cp_ok31 (cpOk_cons cp_ok32 (cpOk_cons cp_ok33 (cpOk_cons cp_ok34 (cpOk_cons cp_ok35 (cpOk_nil _ _ _))))))))))))))))))))))))))))))))))))

theorem st_ok0 : SBOk1 P sxs0 (kScale X) srows0 :=
  sbOk1_cons sb_ok0_0 (sbOk1_cons sb_ok0_1 (sbOk1_cons sb_ok0_2 (sbOk1_cons sb_ok0_3 (sbOk1_cons sb_ok0_4 (sbOk1_cons sb_ok0_5 (sbOk1_cons sb_ok0_6 (sbOk1_cons sb_ok0_7 (sbOk1_cons sb_ok0_8 (sbOk1_cons sb_ok0_9 (sbOk1_cons sb_ok0_10 (sbOk1_cons sb_ok0_11 (sbOk1_cons sb_ok0_12 (sbOk1_cons sb_ok0_13 (sbOk1_cons sb_ok0_14 (sbOk1_cons sb_ok0_15 (sbOk1_cons sb_ok0_16 (sbOk1_cons sb_ok0_17 (sbOk1_cons sb_ok0_18 (sbOk1_cons sb_ok0_19 (sbOk1_cons sb_ok0_20 (sbOk1_cons sb_ok0_21 (sbOk1_cons sb_ok0_22 (sbOk1_cons sb_ok0_23 (sbOk1_cons sb_ok0_24 (sbOk1_cons sb_ok0_25 (sbOk1_cons sb_ok0_26 (sbOk1_cons sb_ok0_27 (sbOk1_cons sb_ok0_28 (sbOk1_cons sb_ok0_29 (sbOk1_cons sb_ok0_30 (sbOk1_cons sb_ok0_31 (sbOk1_cons sb_ok0_32 (sbOk1_cons sb_ok0_33 (sbOk1_cons sb_ok0_34 (sbOk1_cons sb_ok0_35 (sbOk1_cons sb_ok0_36 (sbOk1_cons sb_ok0_37 (sbOk1_cons sb_ok0_38 (sbOk1_cons sb_ok0_39 (sbOk1_cons sb_ok0_40 (sbOk1_cons sb_ok0_41 (sbOk1_cons sb_ok0_42 (sbOk1_cons sb_ok0_43 (sbOk1_cons sb_ok0_44 (sbOk1_nil _ _ _)))))))))))))))))))))))))))))))))))))))))))))

theorem st_ok1 : SBOk1 P sxs1 (kScale X) srows1 :=
  sbOk1_cons sb_ok1_0 (sbOk1_cons sb_ok1_1 (sbOk1_cons sb_ok1_2 (sbOk1_cons sb_ok1_3 (sbOk1_cons sb_ok1_4 (sbOk1_cons sb_ok1_5 (sbOk1_cons sb_ok1_6 (sbOk1_cons sb_ok1_7 (sbOk1_cons sb_ok1_8 (sbOk1_cons sb_ok1_9 (sbOk1_cons sb_ok1_10 (sbOk1_cons sb_ok1_11 (sbOk1_cons sb_ok1_12 (sbOk1_cons sb_ok1_13 (sbOk1_cons sb_ok1_14 (sbOk1_cons sb_ok1_15 (sbOk1_cons sb_ok1_16 (sbOk1_cons sb_ok1_17 (sbOk1_cons sb_ok1_18 (sbOk1_cons sb_ok1_19 (sbOk1_cons sb_ok1_20 (sbOk1_cons sb_ok1_21 (sbOk1_cons sb_ok1_22 (sbOk1_cons sb_ok1_23 (sbOk1_cons sb_ok1_24 (sbOk1_cons sb_ok1_25 (sbOk1_cons sb_ok1_26 (sbOk1_cons sb_ok1_27 (sbOk1_cons sb_ok1_28 (sbOk1_cons sb_ok1_29 (sbOk1_cons sb_ok1_30 (sbOk1_cons sb_ok1_31 (sbOk1_cons sb_ok1_32 (sbOk1_cons sb_ok1_33 (sbOk1_cons sb_ok1_34 (sbOk1_cons sb_ok1_35 (sbOk1_cons sb_ok1_36 (sbOk1_cons sb_ok1_37 (sbOk1_cons sb_ok1_38 (sbOk1_cons sb_ok1_39 (sbOk1_cons sb_ok1_40 (sbOk1_cons sb_ok1_41 (sbOk1_cons sb_ok1_42 (sbOk1_cons sb_ok1_43 (sbOk1_nil _ _ _))))))))))))))))))))))))))))))))))))))))))))

theorem st_ok2 : SBOk1 P sxs2 (kScale X) srows2 :=
  sbOk1_cons sb_ok2_0 (sbOk1_cons sb_ok2_1 (sbOk1_cons sb_ok2_2 (sbOk1_cons sb_ok2_3 (sbOk1_cons sb_ok2_4 (sbOk1_cons sb_ok2_5 (sbOk1_cons sb_ok2_6 (sbOk1_cons sb_ok2_7 (sbOk1_cons sb_ok2_8 (sbOk1_cons sb_ok2_9 (sbOk1_cons sb_ok2_10 (sbOk1_cons sb_ok2_11 (sbOk1_cons sb_ok2_12 (sbOk1_cons sb_ok2_13 (sbOk1_cons sb_ok2_14 (sbOk1_cons sb_ok2_15 (sbOk1_cons sb_ok2_16 (sbOk1_cons sb_ok2_17 (sbOk1_cons sb_ok2_18 (sbOk1_cons sb_ok2_19 (sbOk1_cons sb_ok2_20 (sbOk1_cons sb_ok2_21 (sbOk1_cons sb_ok2_22 (sbOk1_cons sb_ok2_23 (sbOk1_cons sb_ok2_24 (sbOk1_cons sb_ok2_25 (sbOk1_cons sb_ok2_26 (sbOk1_cons sb_ok2_27 (sbOk1_cons sb_ok2_28 (sbOk1_cons sb_ok2_29 (sbOk1_cons sb_ok2_30 (sbOk1_cons sb_ok2_31 (sbOk1_cons sb_ok2_32 (sbOk1_cons sb_ok2_33 (sbOk1_cons sb_ok2_34 (sbOk1_cons sb_ok2_35 (sbOk1_cons sb_ok2_36 (sbOk1_cons sb_ok2_37 (sbOk1_cons sb_ok2_38 (sbOk1_cons sb_ok2_39 (sbOk1_cons sb_ok2_40 (sbOk1_cons sb_ok2_41 (sbOk1_cons sb_ok2_42 (sbOk1_nil _ _ _)))))))))))))))))))))))))))))))))))))))))))

theorem st_ok3 : SBOk1 P sxs3 (kScale X) srows3 :=
  sbOk1_cons sb_ok3_0 (sbOk1_cons sb_ok3_1 (sbOk1_cons sb_ok3_2 (sbOk1_cons sb_ok3_3 (sbOk1_cons sb_ok3_4 (sbOk1_cons sb_ok3_5 (sbOk1_cons sb_ok3_6 (sbOk1_cons sb_ok3_7 (sbOk1_cons sb_ok3_8 (sbOk1_cons sb_ok3_9 (sbOk1_cons sb_ok3_10 (sbOk1_cons sb_ok3_11 (sbOk1_cons sb_ok3_12 (sbOk1_cons sb_ok3_13 (sbOk1_cons sb_ok3_14 (sbOk1_cons sb_ok3_15 (sbOk1_cons sb_ok3_16 (sbOk1_cons sb_ok3_17 (sbOk1_cons sb_ok3_18 (sbOk1_cons sb_ok3_19 (sbOk1_cons sb_ok3_20 (sbOk1_cons sb_ok3_21 (sbOk1_cons sb_ok3_22 (sbOk1_cons sb_ok3_23 (sbOk1_cons sb_ok3_24 (sbOk1_cons sb_ok3_25 (sbOk1_cons sb_ok3_26 (sbOk1_cons sb_ok3_27 (sbOk1_cons sb_ok3_28 (sbOk1_cons sb_ok3_29 (sbOk1_cons sb_ok3_30 (sbOk1_cons sb_ok3_31 (sbOk1_cons sb_ok3_32 (sbOk1_cons sb_ok3_33 (sbOk1_cons sb_ok3_34 (sbOk1_cons sb_ok3_35 (sbOk1_cons sb_ok3_36 (sbOk1_cons sb_ok3_37 (sbOk1_cons sb_ok3_38 (sbOk1_cons sb_ok3_39 (sbOk1_cons sb_ok3_40 (sbOk1_cons sb_ok3_41 (sbOk1_cons sb_ok3_42 (sbOk1_cons sb_ok3_43 (sbOk1_cons sb_ok3_44 (sbOk1_nil _ _ _)))))))))))))))))))))))))))))))))))))))))))))

theorem st_ok : SBOk P st :=
  sbOk_cons st_ok0 (sbOk_cons st_ok1 (sbOk_cons st_ok2 (sbOk_cons st_ok3 (sbOk_nil _))))

/-- 局所の全部（`D30S3.local_ok` と同じ式・同じ値）をカーネルだけで：`localOkT` を開き、`candPolys P`・`sub P` を
  表引き（`cpT_eq`・`sbT_eq`）に置き換えて `decide +kernel`。 -/
theorem local_okK : localOkT P X cands faces = (true, [4, 4, 4, 4], 10, 6) := by
  delta localOkT lstepT singleOk mixOk candsOk faceIdentOk
  rw [← cpT_eq P ct ct_ok, ← sbT_eq P st st_ok]
  decide +kernel

end PackLean.D30S3.KL
