-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS031_0
import PackLean.D28.Cub.K.FarS031_1
import PackLean.D28.Cub.K.FarS031_2
import PackLean.D28.Cub.K.FarS031_3
import PackLean.D28.Cub.K.FarS031_4
import PackLean.D28.Cub.K.FarS031_5
import PackLean.D28.Cub.K.FarS031_6
import PackLean.D28.Cub.K.FarS031_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair083 : Pair where
  nb := nbN083
  kmNum := 155387
  kmDen := 8388608
  toksN := tN083_0 ++ (tN083_1 ++ (tN083_2 ++ (tN083_3 ++ (tN083_4 ++ (tN083_5 ++ (tN083_6 ++ (tN083_7 ++ (tN083_8 ++ (tN083_9 ++ (tN083_10 ++ (tN083_11 ++ (tN083_12 ++ (tN083_13 ++ (tN083_14 ++ (tN083_15 ++ (tN083_16 ++ (tN083_17 ++ (tN083_18 ++ (tN083_19 ++ (tN083_20 ++ (tN083_21 ++ (tN083_22 ++ (tN083_23 ++ (tN083_24 ++ (tN083_25 ++ (tN083_26 ++ (tN083_27)))))))))))))))))))))))))))
  toksM := tM083_0 ++ (tM083_1 ++ (tM083_2 ++ (tM083_3 ++ (tM083_4 ++ (tM083_5 ++ (tM083_6 ++ (tM083_7 ++ (tM083_8 ++ (tM083_9 ++ (tM083_10 ++ (tM083_11 ++ (tM083_12 ++ (tM083_13 ++ (tM083_14 ++ (tM083_15 ++ (tM083_16 ++ (tM083_17 ++ (tM083_18 ++ (tM083_19 ++ (tM083_20 ++ (tM083_21 ++ (tM083_22 ++ (tM083_23 ++ (tM083_24 ++ (tM083_25 ++ (tM083_26 ++ (tM083_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 083：区間 N 28・M 28。 -/
theorem pair083_ok : pairOk P pair083 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN083_0) (wseg_append (wseg_of sN083_1) (wseg_append (wseg_of sN083_2) (wseg_append (wseg_of sN083_3) (wseg_append (wseg_of sN083_4) (wseg_append (wseg_of sN083_5) (wseg_append (wseg_of sN083_6) (wseg_append (wseg_of sN083_7) (wseg_append (wseg_of sN083_8) (wseg_append (wseg_of sN083_9) (wseg_append (wseg_of sN083_10) (wseg_append (wseg_of sN083_11) (wseg_append (wseg_of sN083_12) (wseg_append (wseg_of sN083_13) (wseg_append (wseg_of sN083_14) (wseg_append (wseg_of sN083_15) (wseg_append (wseg_of sN083_16) (wseg_append (wseg_of sN083_17) (wseg_append (wseg_of sN083_18) (wseg_append (wseg_of sN083_19) (wseg_append (wseg_of sN083_20) (wseg_append (wseg_of sN083_21) (wseg_append (wseg_of sN083_22) (wseg_append (wseg_of sN083_23) (wseg_append (wseg_of sN083_24) (wseg_append (wseg_of sN083_25) (wseg_append (wseg_of sN083_26) (wseg_of sN083_27)))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM083_0) (wseg_append (wseg_of sM083_1) (wseg_append (wseg_of sM083_2) (wseg_append (wseg_of sM083_3) (wseg_append (wseg_of sM083_4) (wseg_append (wseg_of sM083_5) (wseg_append (wseg_of sM083_6) (wseg_append (wseg_of sM083_7) (wseg_append (wseg_of sM083_8) (wseg_append (wseg_of sM083_9) (wseg_append (wseg_of sM083_10) (wseg_append (wseg_of sM083_11) (wseg_append (wseg_of sM083_12) (wseg_append (wseg_of sM083_13) (wseg_append (wseg_of sM083_14) (wseg_append (wseg_of sM083_15) (wseg_append (wseg_of sM083_16) (wseg_append (wseg_of sM083_17) (wseg_append (wseg_of sM083_18) (wseg_append (wseg_of sM083_19) (wseg_append (wseg_of sM083_20) (wseg_append (wseg_of sM083_21) (wseg_append (wseg_of sM083_22) (wseg_append (wseg_of sM083_23) (wseg_append (wseg_of sM083_24) (wseg_append (wseg_of sM083_25) (wseg_append (wseg_of sM083_26) (wseg_of sM083_27)))))))))))))))))))))))))))))

def pair084 : Pair where
  nb := nbN084
  kmNum := -18475
  kmDen := 8388608
  toksN := tN084_0 ++ (tN084_1 ++ (tN084_2 ++ (tN084_3 ++ (tN084_4 ++ (tN084_5 ++ (tN084_6 ++ (tN084_7 ++ (tN084_8 ++ (tN084_9 ++ (tN084_10 ++ (tN084_11 ++ (tN084_12 ++ (tN084_13 ++ (tN084_14 ++ (tN084_15 ++ (tN084_16 ++ (tN084_17 ++ (tN084_18 ++ (tN084_19 ++ (tN084_20 ++ (tN084_21 ++ (tN084_22 ++ (tN084_23 ++ (tN084_24 ++ (tN084_25 ++ (tN084_26 ++ (tN084_27 ++ (tN084_28 ++ (tN084_29 ++ (tN084_30 ++ (tN084_31)))))))))))))))))))))))))))))))
  toksM := tM084_0 ++ (tM084_1 ++ (tM084_2 ++ (tM084_3 ++ (tM084_4 ++ (tM084_5 ++ (tM084_6 ++ (tM084_7 ++ (tM084_8 ++ (tM084_9 ++ (tM084_10 ++ (tM084_11 ++ (tM084_12 ++ (tM084_13 ++ (tM084_14 ++ (tM084_15 ++ (tM084_16 ++ (tM084_17 ++ (tM084_18 ++ (tM084_19 ++ (tM084_20 ++ (tM084_21 ++ (tM084_22 ++ (tM084_23 ++ (tM084_24 ++ (tM084_25 ++ (tM084_26 ++ (tM084_27 ++ (tM084_28 ++ (tM084_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 084：区間 N 32・M 30。 -/
theorem pair084_ok : pairOk P pair084 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN084_0) (wseg_append (wseg_of sN084_1) (wseg_append (wseg_of sN084_2) (wseg_append (wseg_of sN084_3) (wseg_append (wseg_of sN084_4) (wseg_append (wseg_of sN084_5) (wseg_append (wseg_of sN084_6) (wseg_append (wseg_of sN084_7) (wseg_append (wseg_of sN084_8) (wseg_append (wseg_of sN084_9) (wseg_append (wseg_of sN084_10) (wseg_append (wseg_of sN084_11) (wseg_append (wseg_of sN084_12) (wseg_append (wseg_of sN084_13) (wseg_append (wseg_of sN084_14) (wseg_append (wseg_of sN084_15) (wseg_append (wseg_of sN084_16) (wseg_append (wseg_of sN084_17) (wseg_append (wseg_of sN084_18) (wseg_append (wseg_of sN084_19) (wseg_append (wseg_of sN084_20) (wseg_append (wseg_of sN084_21) (wseg_append (wseg_of sN084_22) (wseg_append (wseg_of sN084_23) (wseg_append (wseg_of sN084_24) (wseg_append (wseg_of sN084_25) (wseg_append (wseg_of sN084_26) (wseg_append (wseg_of sN084_27) (wseg_append (wseg_of sN084_28) (wseg_append (wseg_of sN084_29) (wseg_append (wseg_of sN084_30) (wseg_of sN084_31)))))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM084_0) (wseg_append (wseg_of sM084_1) (wseg_append (wseg_of sM084_2) (wseg_append (wseg_of sM084_3) (wseg_append (wseg_of sM084_4) (wseg_append (wseg_of sM084_5) (wseg_append (wseg_of sM084_6) (wseg_append (wseg_of sM084_7) (wseg_append (wseg_of sM084_8) (wseg_append (wseg_of sM084_9) (wseg_append (wseg_of sM084_10) (wseg_append (wseg_of sM084_11) (wseg_append (wseg_of sM084_12) (wseg_append (wseg_of sM084_13) (wseg_append (wseg_of sM084_14) (wseg_append (wseg_of sM084_15) (wseg_append (wseg_of sM084_16) (wseg_append (wseg_of sM084_17) (wseg_append (wseg_of sM084_18) (wseg_append (wseg_of sM084_19) (wseg_append (wseg_of sM084_20) (wseg_append (wseg_of sM084_21) (wseg_append (wseg_of sM084_22) (wseg_append (wseg_of sM084_23) (wseg_append (wseg_of sM084_24) (wseg_append (wseg_of sM084_25) (wseg_append (wseg_of sM084_26) (wseg_append (wseg_of sM084_27) (wseg_append (wseg_of sM084_28) (wseg_of sM084_29)))))))))))))))))))))))))))))))

end PackLean.D28.Cub
