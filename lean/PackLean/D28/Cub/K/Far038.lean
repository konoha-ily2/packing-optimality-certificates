-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS038_0
import PackLean.D28.Cub.K.FarS038_1
import PackLean.D28.Cub.K.FarS038_2
import PackLean.D28.Cub.K.FarS038_3
import PackLean.D28.Cub.K.FarS038_4
import PackLean.D28.Cub.K.FarS038_5
import PackLean.D28.Cub.K.FarS038_6
import PackLean.D28.Cub.K.FarS038_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair096 : Pair where
  nb := nbN096
  kmNum := 1049
  kmDen := 65536
  toksN := tN096_0 ++ (tN096_1 ++ (tN096_2 ++ (tN096_3 ++ (tN096_4 ++ (tN096_5 ++ (tN096_6 ++ (tN096_7 ++ (tN096_8 ++ (tN096_9 ++ (tN096_10 ++ (tN096_11 ++ (tN096_12 ++ (tN096_13 ++ (tN096_14 ++ (tN096_15 ++ (tN096_16 ++ (tN096_17 ++ (tN096_18 ++ (tN096_19 ++ (tN096_20 ++ (tN096_21 ++ (tN096_22 ++ (tN096_23 ++ (tN096_24 ++ (tN096_25 ++ (tN096_26 ++ (tN096_27)))))))))))))))))))))))))))
  toksM := tM096_0 ++ (tM096_1 ++ (tM096_2 ++ (tM096_3 ++ (tM096_4 ++ (tM096_5 ++ (tM096_6 ++ (tM096_7 ++ (tM096_8 ++ (tM096_9 ++ (tM096_10 ++ (tM096_11 ++ (tM096_12 ++ (tM096_13 ++ (tM096_14 ++ (tM096_15 ++ (tM096_16 ++ (tM096_17 ++ (tM096_18 ++ (tM096_19 ++ (tM096_20 ++ (tM096_21 ++ (tM096_22 ++ (tM096_23 ++ (tM096_24 ++ (tM096_25 ++ (tM096_26 ++ (tM096_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 096：区間 N 28・M 28。 -/
theorem pair096_ok : pairOk P pair096 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN096_0) (wseg_append (wseg_of sN096_1) (wseg_append (wseg_of sN096_2) (wseg_append (wseg_of sN096_3) (wseg_append (wseg_of sN096_4) (wseg_append (wseg_of sN096_5) (wseg_append (wseg_of sN096_6) (wseg_append (wseg_of sN096_7) (wseg_append (wseg_of sN096_8) (wseg_append (wseg_of sN096_9) (wseg_append (wseg_of sN096_10) (wseg_append (wseg_of sN096_11) (wseg_append (wseg_of sN096_12) (wseg_append (wseg_of sN096_13) (wseg_append (wseg_of sN096_14) (wseg_append (wseg_of sN096_15) (wseg_append (wseg_of sN096_16) (wseg_append (wseg_of sN096_17) (wseg_append (wseg_of sN096_18) (wseg_append (wseg_of sN096_19) (wseg_append (wseg_of sN096_20) (wseg_append (wseg_of sN096_21) (wseg_append (wseg_of sN096_22) (wseg_append (wseg_of sN096_23) (wseg_append (wseg_of sN096_24) (wseg_append (wseg_of sN096_25) (wseg_append (wseg_of sN096_26) (wseg_of sN096_27)))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM096_0) (wseg_append (wseg_of sM096_1) (wseg_append (wseg_of sM096_2) (wseg_append (wseg_of sM096_3) (wseg_append (wseg_of sM096_4) (wseg_append (wseg_of sM096_5) (wseg_append (wseg_of sM096_6) (wseg_append (wseg_of sM096_7) (wseg_append (wseg_of sM096_8) (wseg_append (wseg_of sM096_9) (wseg_append (wseg_of sM096_10) (wseg_append (wseg_of sM096_11) (wseg_append (wseg_of sM096_12) (wseg_append (wseg_of sM096_13) (wseg_append (wseg_of sM096_14) (wseg_append (wseg_of sM096_15) (wseg_append (wseg_of sM096_16) (wseg_append (wseg_of sM096_17) (wseg_append (wseg_of sM096_18) (wseg_append (wseg_of sM096_19) (wseg_append (wseg_of sM096_20) (wseg_append (wseg_of sM096_21) (wseg_append (wseg_of sM096_22) (wseg_append (wseg_of sM096_23) (wseg_append (wseg_of sM096_24) (wseg_append (wseg_of sM096_25) (wseg_append (wseg_of sM096_26) (wseg_of sM096_27)))))))))))))))))))))))))))))

def pair097 : Pair where
  nb := nbN097
  kmNum := 130759
  kmDen := 16777216
  toksN := tN097_0 ++ (tN097_1 ++ (tN097_2 ++ (tN097_3 ++ (tN097_4 ++ (tN097_5 ++ (tN097_6 ++ (tN097_7 ++ (tN097_8 ++ (tN097_9 ++ (tN097_10 ++ (tN097_11 ++ (tN097_12 ++ (tN097_13 ++ (tN097_14 ++ (tN097_15 ++ (tN097_16 ++ (tN097_17 ++ (tN097_18 ++ (tN097_19 ++ (tN097_20 ++ (tN097_21 ++ (tN097_22 ++ (tN097_23 ++ (tN097_24 ++ (tN097_25 ++ (tN097_26 ++ (tN097_27 ++ (tN097_28 ++ (tN097_29)))))))))))))))))))))))))))))
  toksM := tM097_0 ++ (tM097_1 ++ (tM097_2 ++ (tM097_3 ++ (tM097_4 ++ (tM097_5 ++ (tM097_6 ++ (tM097_7 ++ (tM097_8 ++ (tM097_9 ++ (tM097_10 ++ (tM097_11 ++ (tM097_12 ++ (tM097_13 ++ (tM097_14 ++ (tM097_15 ++ (tM097_16 ++ (tM097_17 ++ (tM097_18 ++ (tM097_19 ++ (tM097_20 ++ (tM097_21 ++ (tM097_22 ++ (tM097_23 ++ (tM097_24 ++ (tM097_25 ++ (tM097_26 ++ (tM097_27 ++ (tM097_28 ++ (tM097_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 097：区間 N 30・M 30。 -/
theorem pair097_ok : pairOk P pair097 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN097_0) (wseg_append (wseg_of sN097_1) (wseg_append (wseg_of sN097_2) (wseg_append (wseg_of sN097_3) (wseg_append (wseg_of sN097_4) (wseg_append (wseg_of sN097_5) (wseg_append (wseg_of sN097_6) (wseg_append (wseg_of sN097_7) (wseg_append (wseg_of sN097_8) (wseg_append (wseg_of sN097_9) (wseg_append (wseg_of sN097_10) (wseg_append (wseg_of sN097_11) (wseg_append (wseg_of sN097_12) (wseg_append (wseg_of sN097_13) (wseg_append (wseg_of sN097_14) (wseg_append (wseg_of sN097_15) (wseg_append (wseg_of sN097_16) (wseg_append (wseg_of sN097_17) (wseg_append (wseg_of sN097_18) (wseg_append (wseg_of sN097_19) (wseg_append (wseg_of sN097_20) (wseg_append (wseg_of sN097_21) (wseg_append (wseg_of sN097_22) (wseg_append (wseg_of sN097_23) (wseg_append (wseg_of sN097_24) (wseg_append (wseg_of sN097_25) (wseg_append (wseg_of sN097_26) (wseg_append (wseg_of sN097_27) (wseg_append (wseg_of sN097_28) (wseg_of sN097_29)))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM097_0) (wseg_append (wseg_of sM097_1) (wseg_append (wseg_of sM097_2) (wseg_append (wseg_of sM097_3) (wseg_append (wseg_of sM097_4) (wseg_append (wseg_of sM097_5) (wseg_append (wseg_of sM097_6) (wseg_append (wseg_of sM097_7) (wseg_append (wseg_of sM097_8) (wseg_append (wseg_of sM097_9) (wseg_append (wseg_of sM097_10) (wseg_append (wseg_of sM097_11) (wseg_append (wseg_of sM097_12) (wseg_append (wseg_of sM097_13) (wseg_append (wseg_of sM097_14) (wseg_append (wseg_of sM097_15) (wseg_append (wseg_of sM097_16) (wseg_append (wseg_of sM097_17) (wseg_append (wseg_of sM097_18) (wseg_append (wseg_of sM097_19) (wseg_append (wseg_of sM097_20) (wseg_append (wseg_of sM097_21) (wseg_append (wseg_of sM097_22) (wseg_append (wseg_of sM097_23) (wseg_append (wseg_of sM097_24) (wseg_append (wseg_of sM097_25) (wseg_append (wseg_of sM097_26) (wseg_append (wseg_of sM097_27) (wseg_append (wseg_of sM097_28) (wseg_of sM097_29)))))))))))))))))))))))))))))))

end PackLean.D28.Cub
