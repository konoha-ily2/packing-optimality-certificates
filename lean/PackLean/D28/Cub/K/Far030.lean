-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS030_0
import PackLean.D28.Cub.K.FarS030_1
import PackLean.D28.Cub.K.FarS030_2
import PackLean.D28.Cub.K.FarS030_3
import PackLean.D28.Cub.K.FarS030_4
import PackLean.D28.Cub.K.FarS030_5
import PackLean.D28.Cub.K.FarS030_6
import PackLean.D28.Cub.K.FarS030_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair081 : Pair where
  nb := nbN081
  kmNum := 371069
  kmDen := 16777216
  toksN := tN081_0 ++ (tN081_1 ++ (tN081_2 ++ (tN081_3 ++ (tN081_4 ++ (tN081_5 ++ (tN081_6 ++ (tN081_7 ++ (tN081_8 ++ (tN081_9 ++ (tN081_10 ++ (tN081_11 ++ (tN081_12 ++ (tN081_13 ++ (tN081_14 ++ (tN081_15 ++ (tN081_16 ++ (tN081_17 ++ (tN081_18 ++ (tN081_19 ++ (tN081_20 ++ (tN081_21 ++ (tN081_22 ++ (tN081_23 ++ (tN081_24 ++ (tN081_25 ++ (tN081_26))))))))))))))))))))))))))
  toksM := tM081_0 ++ (tM081_1 ++ (tM081_2 ++ (tM081_3 ++ (tM081_4 ++ (tM081_5 ++ (tM081_6 ++ (tM081_7 ++ (tM081_8 ++ (tM081_9 ++ (tM081_10 ++ (tM081_11 ++ (tM081_12 ++ (tM081_13 ++ (tM081_14 ++ (tM081_15 ++ (tM081_16 ++ (tM081_17 ++ (tM081_18 ++ (tM081_19 ++ (tM081_20 ++ (tM081_21 ++ (tM081_22 ++ (tM081_23 ++ (tM081_24 ++ (tM081_25 ++ (tM081_26 ++ (tM081_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 081：区間 N 27・M 28。 -/
theorem pair081_ok : pairOk P pair081 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN081_0) (wseg_append (wseg_of sN081_1) (wseg_append (wseg_of sN081_2) (wseg_append (wseg_of sN081_3) (wseg_append (wseg_of sN081_4) (wseg_append (wseg_of sN081_5) (wseg_append (wseg_of sN081_6) (wseg_append (wseg_of sN081_7) (wseg_append (wseg_of sN081_8) (wseg_append (wseg_of sN081_9) (wseg_append (wseg_of sN081_10) (wseg_append (wseg_of sN081_11) (wseg_append (wseg_of sN081_12) (wseg_append (wseg_of sN081_13) (wseg_append (wseg_of sN081_14) (wseg_append (wseg_of sN081_15) (wseg_append (wseg_of sN081_16) (wseg_append (wseg_of sN081_17) (wseg_append (wseg_of sN081_18) (wseg_append (wseg_of sN081_19) (wseg_append (wseg_of sN081_20) (wseg_append (wseg_of sN081_21) (wseg_append (wseg_of sN081_22) (wseg_append (wseg_of sN081_23) (wseg_append (wseg_of sN081_24) (wseg_append (wseg_of sN081_25) (wseg_of sN081_26))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM081_0) (wseg_append (wseg_of sM081_1) (wseg_append (wseg_of sM081_2) (wseg_append (wseg_of sM081_3) (wseg_append (wseg_of sM081_4) (wseg_append (wseg_of sM081_5) (wseg_append (wseg_of sM081_6) (wseg_append (wseg_of sM081_7) (wseg_append (wseg_of sM081_8) (wseg_append (wseg_of sM081_9) (wseg_append (wseg_of sM081_10) (wseg_append (wseg_of sM081_11) (wseg_append (wseg_of sM081_12) (wseg_append (wseg_of sM081_13) (wseg_append (wseg_of sM081_14) (wseg_append (wseg_of sM081_15) (wseg_append (wseg_of sM081_16) (wseg_append (wseg_of sM081_17) (wseg_append (wseg_of sM081_18) (wseg_append (wseg_of sM081_19) (wseg_append (wseg_of sM081_20) (wseg_append (wseg_of sM081_21) (wseg_append (wseg_of sM081_22) (wseg_append (wseg_of sM081_23) (wseg_append (wseg_of sM081_24) (wseg_append (wseg_of sM081_25) (wseg_append (wseg_of sM081_26) (wseg_of sM081_27)))))))))))))))))))))))))))))

def pair082 : Pair where
  nb := nbN082
  kmNum := 193061
  kmDen := 16777216
  toksN := tN082_0 ++ (tN082_1 ++ (tN082_2 ++ (tN082_3 ++ (tN082_4 ++ (tN082_5 ++ (tN082_6 ++ (tN082_7 ++ (tN082_8 ++ (tN082_9 ++ (tN082_10 ++ (tN082_11 ++ (tN082_12 ++ (tN082_13 ++ (tN082_14 ++ (tN082_15 ++ (tN082_16 ++ (tN082_17 ++ (tN082_18 ++ (tN082_19 ++ (tN082_20 ++ (tN082_21 ++ (tN082_22 ++ (tN082_23 ++ (tN082_24 ++ (tN082_25 ++ (tN082_26 ++ (tN082_27 ++ (tN082_28 ++ (tN082_29)))))))))))))))))))))))))))))
  toksM := tM082_0 ++ (tM082_1 ++ (tM082_2 ++ (tM082_3 ++ (tM082_4 ++ (tM082_5 ++ (tM082_6 ++ (tM082_7 ++ (tM082_8 ++ (tM082_9 ++ (tM082_10 ++ (tM082_11 ++ (tM082_12 ++ (tM082_13 ++ (tM082_14 ++ (tM082_15 ++ (tM082_16 ++ (tM082_17 ++ (tM082_18 ++ (tM082_19 ++ (tM082_20 ++ (tM082_21 ++ (tM082_22 ++ (tM082_23 ++ (tM082_24 ++ (tM082_25 ++ (tM082_26 ++ (tM082_27 ++ (tM082_28 ++ (tM082_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 082：区間 N 30・M 30。 -/
theorem pair082_ok : pairOk P pair082 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN082_0) (wseg_append (wseg_of sN082_1) (wseg_append (wseg_of sN082_2) (wseg_append (wseg_of sN082_3) (wseg_append (wseg_of sN082_4) (wseg_append (wseg_of sN082_5) (wseg_append (wseg_of sN082_6) (wseg_append (wseg_of sN082_7) (wseg_append (wseg_of sN082_8) (wseg_append (wseg_of sN082_9) (wseg_append (wseg_of sN082_10) (wseg_append (wseg_of sN082_11) (wseg_append (wseg_of sN082_12) (wseg_append (wseg_of sN082_13) (wseg_append (wseg_of sN082_14) (wseg_append (wseg_of sN082_15) (wseg_append (wseg_of sN082_16) (wseg_append (wseg_of sN082_17) (wseg_append (wseg_of sN082_18) (wseg_append (wseg_of sN082_19) (wseg_append (wseg_of sN082_20) (wseg_append (wseg_of sN082_21) (wseg_append (wseg_of sN082_22) (wseg_append (wseg_of sN082_23) (wseg_append (wseg_of sN082_24) (wseg_append (wseg_of sN082_25) (wseg_append (wseg_of sN082_26) (wseg_append (wseg_of sN082_27) (wseg_append (wseg_of sN082_28) (wseg_of sN082_29)))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM082_0) (wseg_append (wseg_of sM082_1) (wseg_append (wseg_of sM082_2) (wseg_append (wseg_of sM082_3) (wseg_append (wseg_of sM082_4) (wseg_append (wseg_of sM082_5) (wseg_append (wseg_of sM082_6) (wseg_append (wseg_of sM082_7) (wseg_append (wseg_of sM082_8) (wseg_append (wseg_of sM082_9) (wseg_append (wseg_of sM082_10) (wseg_append (wseg_of sM082_11) (wseg_append (wseg_of sM082_12) (wseg_append (wseg_of sM082_13) (wseg_append (wseg_of sM082_14) (wseg_append (wseg_of sM082_15) (wseg_append (wseg_of sM082_16) (wseg_append (wseg_of sM082_17) (wseg_append (wseg_of sM082_18) (wseg_append (wseg_of sM082_19) (wseg_append (wseg_of sM082_20) (wseg_append (wseg_of sM082_21) (wseg_append (wseg_of sM082_22) (wseg_append (wseg_of sM082_23) (wseg_append (wseg_of sM082_24) (wseg_append (wseg_of sM082_25) (wseg_append (wseg_of sM082_26) (wseg_append (wseg_of sM082_27) (wseg_append (wseg_of sM082_28) (wseg_of sM082_29)))))))))))))))))))))))))))))))

end PackLean.D28.Cub
