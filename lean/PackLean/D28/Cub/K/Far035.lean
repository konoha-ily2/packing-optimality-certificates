-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS035_0
import PackLean.D28.Cub.K.FarS035_1
import PackLean.D28.Cub.K.FarS035_2
import PackLean.D28.Cub.K.FarS035_3
import PackLean.D28.Cub.K.FarS035_4
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair091 : Pair where
  nb := nbN091
  kmNum := 0
  kmDen := 1
  toksN := tN091_0 ++ (tN091_1 ++ (tN091_2 ++ (tN091_3 ++ (tN091_4 ++ (tN091_5 ++ (tN091_6 ++ (tN091_7 ++ (tN091_8 ++ (tN091_9 ++ (tN091_10 ++ (tN091_11 ++ (tN091_12 ++ (tN091_13 ++ (tN091_14 ++ (tN091_15 ++ (tN091_16 ++ (tN091_17 ++ (tN091_18 ++ (tN091_19 ++ (tN091_20 ++ (tN091_21 ++ (tN091_22 ++ (tN091_23 ++ (tN091_24 ++ (tN091_25 ++ (tN091_26 ++ (tN091_27 ++ (tN091_28 ++ (tN091_29 ++ (tN091_30))))))))))))))))))))))))))))))
  toksM := tM091_0 ++ (tM091_1 ++ (tM091_2 ++ (tM091_3 ++ (tM091_4 ++ (tM091_5 ++ (tM091_6 ++ (tM091_7 ++ (tM091_8 ++ (tM091_9 ++ (tM091_10 ++ (tM091_11 ++ (tM091_12 ++ (tM091_13 ++ (tM091_14 ++ (tM091_15 ++ (tM091_16 ++ (tM091_17 ++ (tM091_18 ++ (tM091_19 ++ (tM091_20 ++ (tM091_21 ++ (tM091_22 ++ (tM091_23 ++ (tM091_24 ++ (tM091_25 ++ (tM091_26 ++ (tM091_27 ++ (tM091_28 ++ (tM091_29 ++ (tM091_30 ++ (tM091_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 091：区間 N 31・M 32。 -/
theorem pair091_ok : pairOk P pair091 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN091_0) (wseg_append (wseg_of sN091_1) (wseg_append (wseg_of sN091_2) (wseg_append (wseg_of sN091_3) (wseg_append (wseg_of sN091_4) (wseg_append (wseg_of sN091_5) (wseg_append (wseg_of sN091_6) (wseg_append (wseg_of sN091_7) (wseg_append (wseg_of sN091_8) (wseg_append (wseg_of sN091_9) (wseg_append (wseg_of sN091_10) (wseg_append (wseg_of sN091_11) (wseg_append (wseg_of sN091_12) (wseg_append (wseg_of sN091_13) (wseg_append (wseg_of sN091_14) (wseg_append (wseg_of sN091_15) (wseg_append (wseg_of sN091_16) (wseg_append (wseg_of sN091_17) (wseg_append (wseg_of sN091_18) (wseg_append (wseg_of sN091_19) (wseg_append (wseg_of sN091_20) (wseg_append (wseg_of sN091_21) (wseg_append (wseg_of sN091_22) (wseg_append (wseg_of sN091_23) (wseg_append (wseg_of sN091_24) (wseg_append (wseg_of sN091_25) (wseg_append (wseg_of sN091_26) (wseg_append (wseg_of sN091_27) (wseg_append (wseg_of sN091_28) (wseg_append (wseg_of sN091_29) (wseg_of sN091_30))))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM091_0) (wseg_append (wseg_of sM091_1) (wseg_append (wseg_of sM091_2) (wseg_append (wseg_of sM091_3) (wseg_append (wseg_of sM091_4) (wseg_append (wseg_of sM091_5) (wseg_append (wseg_of sM091_6) (wseg_append (wseg_of sM091_7) (wseg_append (wseg_of sM091_8) (wseg_append (wseg_of sM091_9) (wseg_append (wseg_of sM091_10) (wseg_append (wseg_of sM091_11) (wseg_append (wseg_of sM091_12) (wseg_append (wseg_of sM091_13) (wseg_append (wseg_of sM091_14) (wseg_append (wseg_of sM091_15) (wseg_append (wseg_of sM091_16) (wseg_append (wseg_of sM091_17) (wseg_append (wseg_of sM091_18) (wseg_append (wseg_of sM091_19) (wseg_append (wseg_of sM091_20) (wseg_append (wseg_of sM091_21) (wseg_append (wseg_of sM091_22) (wseg_append (wseg_of sM091_23) (wseg_append (wseg_of sM091_24) (wseg_append (wseg_of sM091_25) (wseg_append (wseg_of sM091_26) (wseg_append (wseg_of sM091_27) (wseg_append (wseg_of sM091_28) (wseg_append (wseg_of sM091_29) (wseg_append (wseg_of sM091_30) (wseg_of sM091_31)))))))))))))))))))))))))))))))))

end PackLean.D28.Cub
