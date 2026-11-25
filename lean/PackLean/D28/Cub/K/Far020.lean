-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS020_0
import PackLean.D28.Cub.K.FarS020_1
import PackLean.D28.Cub.K.FarS020_2
import PackLean.D28.Cub.K.FarS020_3
import PackLean.D28.Cub.K.FarS020_4
import PackLean.D28.Cub.K.FarS020_5
import PackLean.D28.Cub.K.FarS020_6
import PackLean.D28.Cub.K.FarS020_7
import PackLean.D28.Cub.K.FarS020_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair060 : Pair where
  nb := nbN060
  kmNum := 334747
  kmDen := 8388608
  toksN := tN060_0 ++ (tN060_1 ++ (tN060_2 ++ (tN060_3 ++ (tN060_4 ++ (tN060_5 ++ (tN060_6 ++ (tN060_7 ++ (tN060_8 ++ (tN060_9 ++ (tN060_10 ++ (tN060_11 ++ (tN060_12 ++ (tN060_13 ++ (tN060_14 ++ (tN060_15 ++ (tN060_16 ++ (tN060_17 ++ (tN060_18))))))))))))))))))
  toksM := tM060_0 ++ (tM060_1 ++ (tM060_2 ++ (tM060_3 ++ (tM060_4 ++ (tM060_5 ++ (tM060_6 ++ (tM060_7 ++ (tM060_8 ++ (tM060_9 ++ (tM060_10 ++ (tM060_11 ++ (tM060_12 ++ (tM060_13 ++ (tM060_14 ++ (tM060_15 ++ (tM060_16 ++ (tM060_17 ++ (tM060_18 ++ (tM060_19 ++ (tM060_20 ++ (tM060_21 ++ (tM060_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 060：区間 N 19・M 23。 -/
theorem pair060_ok : pairOk P pair060 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN060_0) (wseg_append (wseg_of sN060_1) (wseg_append (wseg_of sN060_2) (wseg_append (wseg_of sN060_3) (wseg_append (wseg_of sN060_4) (wseg_append (wseg_of sN060_5) (wseg_append (wseg_of sN060_6) (wseg_append (wseg_of sN060_7) (wseg_append (wseg_of sN060_8) (wseg_append (wseg_of sN060_9) (wseg_append (wseg_of sN060_10) (wseg_append (wseg_of sN060_11) (wseg_append (wseg_of sN060_12) (wseg_append (wseg_of sN060_13) (wseg_append (wseg_of sN060_14) (wseg_append (wseg_of sN060_15) (wseg_append (wseg_of sN060_16) (wseg_append (wseg_of sN060_17) (wseg_of sN060_18))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM060_0) (wseg_append (wseg_of sM060_1) (wseg_append (wseg_of sM060_2) (wseg_append (wseg_of sM060_3) (wseg_append (wseg_of sM060_4) (wseg_append (wseg_of sM060_5) (wseg_append (wseg_of sM060_6) (wseg_append (wseg_of sM060_7) (wseg_append (wseg_of sM060_8) (wseg_append (wseg_of sM060_9) (wseg_append (wseg_of sM060_10) (wseg_append (wseg_of sM060_11) (wseg_append (wseg_of sM060_12) (wseg_append (wseg_of sM060_13) (wseg_append (wseg_of sM060_14) (wseg_append (wseg_of sM060_15) (wseg_append (wseg_of sM060_16) (wseg_append (wseg_of sM060_17) (wseg_append (wseg_of sM060_18) (wseg_append (wseg_of sM060_19) (wseg_append (wseg_of sM060_20) (wseg_append (wseg_of sM060_21) (wseg_of sM060_22))))))))))))))))))))))))

def pair061 : Pair where
  nb := nbN061
  kmNum := 114367
  kmDen := 2097152
  toksN := tN061_0 ++ (tN061_1 ++ (tN061_2 ++ (tN061_3 ++ (tN061_4 ++ (tN061_5 ++ (tN061_6 ++ (tN061_7 ++ (tN061_8 ++ (tN061_9 ++ (tN061_10 ++ (tN061_11 ++ (tN061_12 ++ (tN061_13 ++ (tN061_14 ++ (tN061_15 ++ (tN061_16 ++ (tN061_17)))))))))))))))))
  toksM := tM061_0 ++ (tM061_1 ++ (tM061_2 ++ (tM061_3 ++ (tM061_4 ++ (tM061_5 ++ (tM061_6 ++ (tM061_7 ++ (tM061_8 ++ (tM061_9 ++ (tM061_10 ++ (tM061_11 ++ (tM061_12 ++ (tM061_13 ++ (tM061_14 ++ (tM061_15 ++ (tM061_16 ++ (tM061_17 ++ (tM061_18 ++ (tM061_19 ++ (tM061_20 ++ (tM061_21 ++ (tM061_22 ++ (tM061_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 061：区間 N 18・M 24。 -/
theorem pair061_ok : pairOk P pair061 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN061_0) (wseg_append (wseg_of sN061_1) (wseg_append (wseg_of sN061_2) (wseg_append (wseg_of sN061_3) (wseg_append (wseg_of sN061_4) (wseg_append (wseg_of sN061_5) (wseg_append (wseg_of sN061_6) (wseg_append (wseg_of sN061_7) (wseg_append (wseg_of sN061_8) (wseg_append (wseg_of sN061_9) (wseg_append (wseg_of sN061_10) (wseg_append (wseg_of sN061_11) (wseg_append (wseg_of sN061_12) (wseg_append (wseg_of sN061_13) (wseg_append (wseg_of sN061_14) (wseg_append (wseg_of sN061_15) (wseg_append (wseg_of sN061_16) (wseg_of sN061_17)))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM061_0) (wseg_append (wseg_of sM061_1) (wseg_append (wseg_of sM061_2) (wseg_append (wseg_of sM061_3) (wseg_append (wseg_of sM061_4) (wseg_append (wseg_of sM061_5) (wseg_append (wseg_of sM061_6) (wseg_append (wseg_of sM061_7) (wseg_append (wseg_of sM061_8) (wseg_append (wseg_of sM061_9) (wseg_append (wseg_of sM061_10) (wseg_append (wseg_of sM061_11) (wseg_append (wseg_of sM061_12) (wseg_append (wseg_of sM061_13) (wseg_append (wseg_of sM061_14) (wseg_append (wseg_of sM061_15) (wseg_append (wseg_of sM061_16) (wseg_append (wseg_of sM061_17) (wseg_append (wseg_of sM061_18) (wseg_append (wseg_of sM061_19) (wseg_append (wseg_of sM061_20) (wseg_append (wseg_of sM061_21) (wseg_append (wseg_of sM061_22) (wseg_of sM061_23)))))))))))))))))))))))))

def pair062 : Pair where
  nb := nbN062
  kmNum := 711249
  kmDen := 16777216
  toksN := tN062_0 ++ (tN062_1 ++ (tN062_2 ++ (tN062_3 ++ (tN062_4 ++ (tN062_5 ++ (tN062_6 ++ (tN062_7 ++ (tN062_8 ++ (tN062_9 ++ (tN062_10 ++ (tN062_11 ++ (tN062_12 ++ (tN062_13 ++ (tN062_14 ++ (tN062_15 ++ (tN062_16 ++ (tN062_17 ++ (tN062_18 ++ (tN062_19)))))))))))))))))))
  toksM := tM062_0 ++ (tM062_1 ++ (tM062_2 ++ (tM062_3 ++ (tM062_4 ++ (tM062_5 ++ (tM062_6 ++ (tM062_7 ++ (tM062_8 ++ (tM062_9 ++ (tM062_10 ++ (tM062_11 ++ (tM062_12 ++ (tM062_13 ++ (tM062_14 ++ (tM062_15 ++ (tM062_16 ++ (tM062_17 ++ (tM062_18 ++ (tM062_19 ++ (tM062_20 ++ (tM062_21 ++ (tM062_22 ++ (tM062_23 ++ (tM062_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 062：区間 N 20・M 25。 -/
theorem pair062_ok : pairOk P pair062 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN062_0) (wseg_append (wseg_of sN062_1) (wseg_append (wseg_of sN062_2) (wseg_append (wseg_of sN062_3) (wseg_append (wseg_of sN062_4) (wseg_append (wseg_of sN062_5) (wseg_append (wseg_of sN062_6) (wseg_append (wseg_of sN062_7) (wseg_append (wseg_of sN062_8) (wseg_append (wseg_of sN062_9) (wseg_append (wseg_of sN062_10) (wseg_append (wseg_of sN062_11) (wseg_append (wseg_of sN062_12) (wseg_append (wseg_of sN062_13) (wseg_append (wseg_of sN062_14) (wseg_append (wseg_of sN062_15) (wseg_append (wseg_of sN062_16) (wseg_append (wseg_of sN062_17) (wseg_append (wseg_of sN062_18) (wseg_of sN062_19)))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM062_0) (wseg_append (wseg_of sM062_1) (wseg_append (wseg_of sM062_2) (wseg_append (wseg_of sM062_3) (wseg_append (wseg_of sM062_4) (wseg_append (wseg_of sM062_5) (wseg_append (wseg_of sM062_6) (wseg_append (wseg_of sM062_7) (wseg_append (wseg_of sM062_8) (wseg_append (wseg_of sM062_9) (wseg_append (wseg_of sM062_10) (wseg_append (wseg_of sM062_11) (wseg_append (wseg_of sM062_12) (wseg_append (wseg_of sM062_13) (wseg_append (wseg_of sM062_14) (wseg_append (wseg_of sM062_15) (wseg_append (wseg_of sM062_16) (wseg_append (wseg_of sM062_17) (wseg_append (wseg_of sM062_18) (wseg_append (wseg_of sM062_19) (wseg_append (wseg_of sM062_20) (wseg_append (wseg_of sM062_21) (wseg_append (wseg_of sM062_22) (wseg_append (wseg_of sM062_23) (wseg_of sM062_24))))))))))))))))))))))))))

end PackLean.D28.Cub
