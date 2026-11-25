-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS034_0
import PackLean.D28.Cub.K.FarS034_1
import PackLean.D28.Cub.K.FarS034_2
import PackLean.D28.Cub.K.FarS034_3
import PackLean.D28.Cub.K.FarS034_4
import PackLean.D28.Cub.K.FarS034_5
import PackLean.D28.Cub.K.FarS034_6
import PackLean.D28.Cub.K.FarS034_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair089 : Pair where
  nb := nbN089
  kmNum := 51161
  kmDen := 16777216
  toksN := tN089_0 ++ (tN089_1 ++ (tN089_2 ++ (tN089_3 ++ (tN089_4 ++ (tN089_5 ++ (tN089_6 ++ (tN089_7 ++ (tN089_8 ++ (tN089_9 ++ (tN089_10 ++ (tN089_11 ++ (tN089_12 ++ (tN089_13 ++ (tN089_14 ++ (tN089_15 ++ (tN089_16 ++ (tN089_17 ++ (tN089_18 ++ (tN089_19 ++ (tN089_20 ++ (tN089_21 ++ (tN089_22 ++ (tN089_23 ++ (tN089_24 ++ (tN089_25 ++ (tN089_26 ++ (tN089_27 ++ (tN089_28))))))))))))))))))))))))))))
  toksM := tM089_0 ++ (tM089_1 ++ (tM089_2 ++ (tM089_3 ++ (tM089_4 ++ (tM089_5 ++ (tM089_6 ++ (tM089_7 ++ (tM089_8 ++ (tM089_9 ++ (tM089_10 ++ (tM089_11 ++ (tM089_12 ++ (tM089_13 ++ (tM089_14 ++ (tM089_15 ++ (tM089_16 ++ (tM089_17 ++ (tM089_18 ++ (tM089_19 ++ (tM089_20 ++ (tM089_21 ++ (tM089_22 ++ (tM089_23 ++ (tM089_24 ++ (tM089_25 ++ (tM089_26 ++ (tM089_27 ++ (tM089_28 ++ (tM089_29 ++ (tM089_30))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 089：区間 N 29・M 31。 -/
theorem pair089_ok : pairOk P pair089 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN089_0) (wseg_append (wseg_of sN089_1) (wseg_append (wseg_of sN089_2) (wseg_append (wseg_of sN089_3) (wseg_append (wseg_of sN089_4) (wseg_append (wseg_of sN089_5) (wseg_append (wseg_of sN089_6) (wseg_append (wseg_of sN089_7) (wseg_append (wseg_of sN089_8) (wseg_append (wseg_of sN089_9) (wseg_append (wseg_of sN089_10) (wseg_append (wseg_of sN089_11) (wseg_append (wseg_of sN089_12) (wseg_append (wseg_of sN089_13) (wseg_append (wseg_of sN089_14) (wseg_append (wseg_of sN089_15) (wseg_append (wseg_of sN089_16) (wseg_append (wseg_of sN089_17) (wseg_append (wseg_of sN089_18) (wseg_append (wseg_of sN089_19) (wseg_append (wseg_of sN089_20) (wseg_append (wseg_of sN089_21) (wseg_append (wseg_of sN089_22) (wseg_append (wseg_of sN089_23) (wseg_append (wseg_of sN089_24) (wseg_append (wseg_of sN089_25) (wseg_append (wseg_of sN089_26) (wseg_append (wseg_of sN089_27) (wseg_of sN089_28))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM089_0) (wseg_append (wseg_of sM089_1) (wseg_append (wseg_of sM089_2) (wseg_append (wseg_of sM089_3) (wseg_append (wseg_of sM089_4) (wseg_append (wseg_of sM089_5) (wseg_append (wseg_of sM089_6) (wseg_append (wseg_of sM089_7) (wseg_append (wseg_of sM089_8) (wseg_append (wseg_of sM089_9) (wseg_append (wseg_of sM089_10) (wseg_append (wseg_of sM089_11) (wseg_append (wseg_of sM089_12) (wseg_append (wseg_of sM089_13) (wseg_append (wseg_of sM089_14) (wseg_append (wseg_of sM089_15) (wseg_append (wseg_of sM089_16) (wseg_append (wseg_of sM089_17) (wseg_append (wseg_of sM089_18) (wseg_append (wseg_of sM089_19) (wseg_append (wseg_of sM089_20) (wseg_append (wseg_of sM089_21) (wseg_append (wseg_of sM089_22) (wseg_append (wseg_of sM089_23) (wseg_append (wseg_of sM089_24) (wseg_append (wseg_of sM089_25) (wseg_append (wseg_of sM089_26) (wseg_append (wseg_of sM089_27) (wseg_append (wseg_of sM089_28) (wseg_append (wseg_of sM089_29) (wseg_of sM089_30))))))))))))))))))))))))))))))))

def pair090 : Pair where
  nb := nbN090
  kmNum := 82065
  kmDen := 16777216
  toksN := tN090_0 ++ (tN090_1 ++ (tN090_2 ++ (tN090_3 ++ (tN090_4 ++ (tN090_5 ++ (tN090_6 ++ (tN090_7 ++ (tN090_8 ++ (tN090_9 ++ (tN090_10 ++ (tN090_11 ++ (tN090_12 ++ (tN090_13 ++ (tN090_14 ++ (tN090_15 ++ (tN090_16 ++ (tN090_17 ++ (tN090_18 ++ (tN090_19 ++ (tN090_20 ++ (tN090_21 ++ (tN090_22 ++ (tN090_23 ++ (tN090_24 ++ (tN090_25 ++ (tN090_26 ++ (tN090_27)))))))))))))))))))))))))))
  toksM := tM090_0 ++ (tM090_1 ++ (tM090_2 ++ (tM090_3 ++ (tM090_4 ++ (tM090_5 ++ (tM090_6 ++ (tM090_7 ++ (tM090_8 ++ (tM090_9 ++ (tM090_10 ++ (tM090_11 ++ (tM090_12 ++ (tM090_13 ++ (tM090_14 ++ (tM090_15 ++ (tM090_16 ++ (tM090_17 ++ (tM090_18 ++ (tM090_19 ++ (tM090_20 ++ (tM090_21 ++ (tM090_22 ++ (tM090_23 ++ (tM090_24 ++ (tM090_25 ++ (tM090_26 ++ (tM090_27 ++ (tM090_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 090：区間 N 28・M 29。 -/
theorem pair090_ok : pairOk P pair090 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN090_0) (wseg_append (wseg_of sN090_1) (wseg_append (wseg_of sN090_2) (wseg_append (wseg_of sN090_3) (wseg_append (wseg_of sN090_4) (wseg_append (wseg_of sN090_5) (wseg_append (wseg_of sN090_6) (wseg_append (wseg_of sN090_7) (wseg_append (wseg_of sN090_8) (wseg_append (wseg_of sN090_9) (wseg_append (wseg_of sN090_10) (wseg_append (wseg_of sN090_11) (wseg_append (wseg_of sN090_12) (wseg_append (wseg_of sN090_13) (wseg_append (wseg_of sN090_14) (wseg_append (wseg_of sN090_15) (wseg_append (wseg_of sN090_16) (wseg_append (wseg_of sN090_17) (wseg_append (wseg_of sN090_18) (wseg_append (wseg_of sN090_19) (wseg_append (wseg_of sN090_20) (wseg_append (wseg_of sN090_21) (wseg_append (wseg_of sN090_22) (wseg_append (wseg_of sN090_23) (wseg_append (wseg_of sN090_24) (wseg_append (wseg_of sN090_25) (wseg_append (wseg_of sN090_26) (wseg_of sN090_27)))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM090_0) (wseg_append (wseg_of sM090_1) (wseg_append (wseg_of sM090_2) (wseg_append (wseg_of sM090_3) (wseg_append (wseg_of sM090_4) (wseg_append (wseg_of sM090_5) (wseg_append (wseg_of sM090_6) (wseg_append (wseg_of sM090_7) (wseg_append (wseg_of sM090_8) (wseg_append (wseg_of sM090_9) (wseg_append (wseg_of sM090_10) (wseg_append (wseg_of sM090_11) (wseg_append (wseg_of sM090_12) (wseg_append (wseg_of sM090_13) (wseg_append (wseg_of sM090_14) (wseg_append (wseg_of sM090_15) (wseg_append (wseg_of sM090_16) (wseg_append (wseg_of sM090_17) (wseg_append (wseg_of sM090_18) (wseg_append (wseg_of sM090_19) (wseg_append (wseg_of sM090_20) (wseg_append (wseg_of sM090_21) (wseg_append (wseg_of sM090_22) (wseg_append (wseg_of sM090_23) (wseg_append (wseg_of sM090_24) (wseg_append (wseg_of sM090_25) (wseg_append (wseg_of sM090_26) (wseg_append (wseg_of sM090_27) (wseg_of sM090_28))))))))))))))))))))))))))))))

end PackLean.D28.Cub
