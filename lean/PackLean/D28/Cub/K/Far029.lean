-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS029_0
import PackLean.D28.Cub.K.FarS029_1
import PackLean.D28.Cub.K.FarS029_2
import PackLean.D28.Cub.K.FarS029_3
import PackLean.D28.Cub.K.FarS029_4
import PackLean.D28.Cub.K.FarS029_5
import PackLean.D28.Cub.K.FarS029_6
import PackLean.D28.Cub.K.FarS029_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair079 : Pair where
  nb := nbN079
  kmNum := 1115
  kmDen := 4194304
  toksN := tN079_0 ++ (tN079_1 ++ (tN079_2 ++ (tN079_3 ++ (tN079_4 ++ (tN079_5 ++ (tN079_6 ++ (tN079_7 ++ (tN079_8 ++ (tN079_9 ++ (tN079_10 ++ (tN079_11 ++ (tN079_12 ++ (tN079_13 ++ (tN079_14 ++ (tN079_15 ++ (tN079_16 ++ (tN079_17 ++ (tN079_18 ++ (tN079_19 ++ (tN079_20 ++ (tN079_21 ++ (tN079_22 ++ (tN079_23 ++ (tN079_24 ++ (tN079_25 ++ (tN079_26 ++ (tN079_27 ++ (tN079_28 ++ (tN079_29 ++ (tN079_30 ++ (tN079_31)))))))))))))))))))))))))))))))
  toksM := tM079_0 ++ (tM079_1 ++ (tM079_2 ++ (tM079_3 ++ (tM079_4 ++ (tM079_5 ++ (tM079_6 ++ (tM079_7 ++ (tM079_8 ++ (tM079_9 ++ (tM079_10 ++ (tM079_11 ++ (tM079_12 ++ (tM079_13 ++ (tM079_14 ++ (tM079_15 ++ (tM079_16 ++ (tM079_17 ++ (tM079_18 ++ (tM079_19 ++ (tM079_20 ++ (tM079_21 ++ (tM079_22 ++ (tM079_23 ++ (tM079_24 ++ (tM079_25 ++ (tM079_26 ++ (tM079_27 ++ (tM079_28 ++ (tM079_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 079：区間 N 32・M 30。 -/
theorem pair079_ok : pairOk P pair079 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN079_0) (wseg_append (wseg_of sN079_1) (wseg_append (wseg_of sN079_2) (wseg_append (wseg_of sN079_3) (wseg_append (wseg_of sN079_4) (wseg_append (wseg_of sN079_5) (wseg_append (wseg_of sN079_6) (wseg_append (wseg_of sN079_7) (wseg_append (wseg_of sN079_8) (wseg_append (wseg_of sN079_9) (wseg_append (wseg_of sN079_10) (wseg_append (wseg_of sN079_11) (wseg_append (wseg_of sN079_12) (wseg_append (wseg_of sN079_13) (wseg_append (wseg_of sN079_14) (wseg_append (wseg_of sN079_15) (wseg_append (wseg_of sN079_16) (wseg_append (wseg_of sN079_17) (wseg_append (wseg_of sN079_18) (wseg_append (wseg_of sN079_19) (wseg_append (wseg_of sN079_20) (wseg_append (wseg_of sN079_21) (wseg_append (wseg_of sN079_22) (wseg_append (wseg_of sN079_23) (wseg_append (wseg_of sN079_24) (wseg_append (wseg_of sN079_25) (wseg_append (wseg_of sN079_26) (wseg_append (wseg_of sN079_27) (wseg_append (wseg_of sN079_28) (wseg_append (wseg_of sN079_29) (wseg_append (wseg_of sN079_30) (wseg_of sN079_31)))))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM079_0) (wseg_append (wseg_of sM079_1) (wseg_append (wseg_of sM079_2) (wseg_append (wseg_of sM079_3) (wseg_append (wseg_of sM079_4) (wseg_append (wseg_of sM079_5) (wseg_append (wseg_of sM079_6) (wseg_append (wseg_of sM079_7) (wseg_append (wseg_of sM079_8) (wseg_append (wseg_of sM079_9) (wseg_append (wseg_of sM079_10) (wseg_append (wseg_of sM079_11) (wseg_append (wseg_of sM079_12) (wseg_append (wseg_of sM079_13) (wseg_append (wseg_of sM079_14) (wseg_append (wseg_of sM079_15) (wseg_append (wseg_of sM079_16) (wseg_append (wseg_of sM079_17) (wseg_append (wseg_of sM079_18) (wseg_append (wseg_of sM079_19) (wseg_append (wseg_of sM079_20) (wseg_append (wseg_of sM079_21) (wseg_append (wseg_of sM079_22) (wseg_append (wseg_of sM079_23) (wseg_append (wseg_of sM079_24) (wseg_append (wseg_of sM079_25) (wseg_append (wseg_of sM079_26) (wseg_append (wseg_of sM079_27) (wseg_append (wseg_of sM079_28) (wseg_of sM079_29)))))))))))))))))))))))))))))))

def pair080 : Pair where
  nb := nbN080
  kmNum := 183221
  kmDen := 16777216
  toksN := tN080_0 ++ (tN080_1 ++ (tN080_2 ++ (tN080_3 ++ (tN080_4 ++ (tN080_5 ++ (tN080_6 ++ (tN080_7 ++ (tN080_8 ++ (tN080_9 ++ (tN080_10 ++ (tN080_11 ++ (tN080_12 ++ (tN080_13 ++ (tN080_14 ++ (tN080_15 ++ (tN080_16 ++ (tN080_17 ++ (tN080_18 ++ (tN080_19 ++ (tN080_20 ++ (tN080_21 ++ (tN080_22 ++ (tN080_23 ++ (tN080_24 ++ (tN080_25 ++ (tN080_26 ++ (tN080_27 ++ (tN080_28))))))))))))))))))))))))))))
  toksM := tM080_0 ++ (tM080_1 ++ (tM080_2 ++ (tM080_3 ++ (tM080_4 ++ (tM080_5 ++ (tM080_6 ++ (tM080_7 ++ (tM080_8 ++ (tM080_9 ++ (tM080_10 ++ (tM080_11 ++ (tM080_12 ++ (tM080_13 ++ (tM080_14 ++ (tM080_15 ++ (tM080_16 ++ (tM080_17 ++ (tM080_18 ++ (tM080_19 ++ (tM080_20 ++ (tM080_21 ++ (tM080_22 ++ (tM080_23 ++ (tM080_24 ++ (tM080_25 ++ (tM080_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 080：区間 N 29・M 27。 -/
theorem pair080_ok : pairOk P pair080 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN080_0) (wseg_append (wseg_of sN080_1) (wseg_append (wseg_of sN080_2) (wseg_append (wseg_of sN080_3) (wseg_append (wseg_of sN080_4) (wseg_append (wseg_of sN080_5) (wseg_append (wseg_of sN080_6) (wseg_append (wseg_of sN080_7) (wseg_append (wseg_of sN080_8) (wseg_append (wseg_of sN080_9) (wseg_append (wseg_of sN080_10) (wseg_append (wseg_of sN080_11) (wseg_append (wseg_of sN080_12) (wseg_append (wseg_of sN080_13) (wseg_append (wseg_of sN080_14) (wseg_append (wseg_of sN080_15) (wseg_append (wseg_of sN080_16) (wseg_append (wseg_of sN080_17) (wseg_append (wseg_of sN080_18) (wseg_append (wseg_of sN080_19) (wseg_append (wseg_of sN080_20) (wseg_append (wseg_of sN080_21) (wseg_append (wseg_of sN080_22) (wseg_append (wseg_of sN080_23) (wseg_append (wseg_of sN080_24) (wseg_append (wseg_of sN080_25) (wseg_append (wseg_of sN080_26) (wseg_append (wseg_of sN080_27) (wseg_of sN080_28))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM080_0) (wseg_append (wseg_of sM080_1) (wseg_append (wseg_of sM080_2) (wseg_append (wseg_of sM080_3) (wseg_append (wseg_of sM080_4) (wseg_append (wseg_of sM080_5) (wseg_append (wseg_of sM080_6) (wseg_append (wseg_of sM080_7) (wseg_append (wseg_of sM080_8) (wseg_append (wseg_of sM080_9) (wseg_append (wseg_of sM080_10) (wseg_append (wseg_of sM080_11) (wseg_append (wseg_of sM080_12) (wseg_append (wseg_of sM080_13) (wseg_append (wseg_of sM080_14) (wseg_append (wseg_of sM080_15) (wseg_append (wseg_of sM080_16) (wseg_append (wseg_of sM080_17) (wseg_append (wseg_of sM080_18) (wseg_append (wseg_of sM080_19) (wseg_append (wseg_of sM080_20) (wseg_append (wseg_of sM080_21) (wseg_append (wseg_of sM080_22) (wseg_append (wseg_of sM080_23) (wseg_append (wseg_of sM080_24) (wseg_append (wseg_of sM080_25) (wseg_of sM080_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
