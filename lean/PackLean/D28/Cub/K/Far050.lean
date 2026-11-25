-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS050_0
import PackLean.D28.Cub.K.FarS050_1
import PackLean.D28.Cub.K.FarS050_2
import PackLean.D28.Cub.K.FarS050_3
import PackLean.D28.Cub.K.FarS050_4
import PackLean.D28.Cub.K.FarS050_5
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair121 : Pair where
  nb := nbN121
  kmNum := 812049
  kmDen := 8388608
  toksN := tN121_0 ++ (tN121_1 ++ (tN121_2 ++ (tN121_3 ++ (tN121_4 ++ (tN121_5 ++ (tN121_6 ++ (tN121_7 ++ (tN121_8 ++ (tN121_9 ++ (tN121_10 ++ (tN121_11 ++ (tN121_12 ++ (tN121_13 ++ (tN121_14 ++ (tN121_15 ++ (tN121_16))))))))))))))))
  toksM := tM121_0 ++ (tM121_1 ++ (tM121_2 ++ (tM121_3 ++ (tM121_4 ++ (tM121_5 ++ (tM121_6 ++ (tM121_7 ++ (tM121_8 ++ (tM121_9 ++ (tM121_10 ++ (tM121_11 ++ (tM121_12 ++ (tM121_13 ++ (tM121_14 ++ (tM121_15 ++ (tM121_16 ++ (tM121_17 ++ (tM121_18 ++ (tM121_19 ++ (tM121_20 ++ (tM121_21 ++ (tM121_22 ++ (tM121_23 ++ (tM121_24 ++ (tM121_25 ++ (tM121_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 121：区間 N 17・M 27。 -/
theorem pair121_ok : pairOk P pair121 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN121_0) (wseg_append (wseg_of sN121_1) (wseg_append (wseg_of sN121_2) (wseg_append (wseg_of sN121_3) (wseg_append (wseg_of sN121_4) (wseg_append (wseg_of sN121_5) (wseg_append (wseg_of sN121_6) (wseg_append (wseg_of sN121_7) (wseg_append (wseg_of sN121_8) (wseg_append (wseg_of sN121_9) (wseg_append (wseg_of sN121_10) (wseg_append (wseg_of sN121_11) (wseg_append (wseg_of sN121_12) (wseg_append (wseg_of sN121_13) (wseg_append (wseg_of sN121_14) (wseg_append (wseg_of sN121_15) (wseg_of sN121_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM121_0) (wseg_append (wseg_of sM121_1) (wseg_append (wseg_of sM121_2) (wseg_append (wseg_of sM121_3) (wseg_append (wseg_of sM121_4) (wseg_append (wseg_of sM121_5) (wseg_append (wseg_of sM121_6) (wseg_append (wseg_of sM121_7) (wseg_append (wseg_of sM121_8) (wseg_append (wseg_of sM121_9) (wseg_append (wseg_of sM121_10) (wseg_append (wseg_of sM121_11) (wseg_append (wseg_of sM121_12) (wseg_append (wseg_of sM121_13) (wseg_append (wseg_of sM121_14) (wseg_append (wseg_of sM121_15) (wseg_append (wseg_of sM121_16) (wseg_append (wseg_of sM121_17) (wseg_append (wseg_of sM121_18) (wseg_append (wseg_of sM121_19) (wseg_append (wseg_of sM121_20) (wseg_append (wseg_of sM121_21) (wseg_append (wseg_of sM121_22) (wseg_append (wseg_of sM121_23) (wseg_append (wseg_of sM121_24) (wseg_append (wseg_of sM121_25) (wseg_of sM121_26))))))))))))))))))))))))))))

def pair122 : Pair where
  nb := nbN122
  kmNum := 1458803
  kmDen := 16777216
  toksN := tN122_0 ++ (tN122_1 ++ (tN122_2 ++ (tN122_3 ++ (tN122_4 ++ (tN122_5 ++ (tN122_6 ++ (tN122_7 ++ (tN122_8 ++ (tN122_9 ++ (tN122_10 ++ (tN122_11 ++ (tN122_12 ++ (tN122_13 ++ (tN122_14 ++ (tN122_15 ++ (tN122_16 ++ (tN122_17)))))))))))))))))
  toksM := tM122_0 ++ (tM122_1 ++ (tM122_2 ++ (tM122_3 ++ (tM122_4 ++ (tM122_5 ++ (tM122_6 ++ (tM122_7 ++ (tM122_8 ++ (tM122_9 ++ (tM122_10 ++ (tM122_11 ++ (tM122_12 ++ (tM122_13 ++ (tM122_14 ++ (tM122_15 ++ (tM122_16 ++ (tM122_17 ++ (tM122_18 ++ (tM122_19 ++ (tM122_20 ++ (tM122_21 ++ (tM122_22 ++ (tM122_23 ++ (tM122_24 ++ (tM122_25 ++ (tM122_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 122：区間 N 18・M 27。 -/
theorem pair122_ok : pairOk P pair122 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN122_0) (wseg_append (wseg_of sN122_1) (wseg_append (wseg_of sN122_2) (wseg_append (wseg_of sN122_3) (wseg_append (wseg_of sN122_4) (wseg_append (wseg_of sN122_5) (wseg_append (wseg_of sN122_6) (wseg_append (wseg_of sN122_7) (wseg_append (wseg_of sN122_8) (wseg_append (wseg_of sN122_9) (wseg_append (wseg_of sN122_10) (wseg_append (wseg_of sN122_11) (wseg_append (wseg_of sN122_12) (wseg_append (wseg_of sN122_13) (wseg_append (wseg_of sN122_14) (wseg_append (wseg_of sN122_15) (wseg_append (wseg_of sN122_16) (wseg_of sN122_17)))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM122_0) (wseg_append (wseg_of sM122_1) (wseg_append (wseg_of sM122_2) (wseg_append (wseg_of sM122_3) (wseg_append (wseg_of sM122_4) (wseg_append (wseg_of sM122_5) (wseg_append (wseg_of sM122_6) (wseg_append (wseg_of sM122_7) (wseg_append (wseg_of sM122_8) (wseg_append (wseg_of sM122_9) (wseg_append (wseg_of sM122_10) (wseg_append (wseg_of sM122_11) (wseg_append (wseg_of sM122_12) (wseg_append (wseg_of sM122_13) (wseg_append (wseg_of sM122_14) (wseg_append (wseg_of sM122_15) (wseg_append (wseg_of sM122_16) (wseg_append (wseg_of sM122_17) (wseg_append (wseg_of sM122_18) (wseg_append (wseg_of sM122_19) (wseg_append (wseg_of sM122_20) (wseg_append (wseg_of sM122_21) (wseg_append (wseg_of sM122_22) (wseg_append (wseg_of sM122_23) (wseg_append (wseg_of sM122_24) (wseg_append (wseg_of sM122_25) (wseg_of sM122_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
