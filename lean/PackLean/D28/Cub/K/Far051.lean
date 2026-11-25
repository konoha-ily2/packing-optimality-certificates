-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS051_0
import PackLean.D28.Cub.K.FarS051_1
import PackLean.D28.Cub.K.FarS051_2
import PackLean.D28.Cub.K.FarS051_3
import PackLean.D28.Cub.K.FarS051_4
import PackLean.D28.Cub.K.FarS051_5
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair123 : Pair where
  nb := nbN123
  kmNum := 1625243
  kmDen := 16777216
  toksN := tN123_0 ++ (tN123_1 ++ (tN123_2 ++ (tN123_3 ++ (tN123_4 ++ (tN123_5 ++ (tN123_6 ++ (tN123_7 ++ (tN123_8 ++ (tN123_9 ++ (tN123_10 ++ (tN123_11 ++ (tN123_12 ++ (tN123_13 ++ (tN123_14 ++ (tN123_15 ++ (tN123_16))))))))))))))))
  toksM := tM123_0 ++ (tM123_1 ++ (tM123_2 ++ (tM123_3 ++ (tM123_4 ++ (tM123_5 ++ (tM123_6 ++ (tM123_7 ++ (tM123_8 ++ (tM123_9 ++ (tM123_10 ++ (tM123_11 ++ (tM123_12 ++ (tM123_13 ++ (tM123_14 ++ (tM123_15 ++ (tM123_16 ++ (tM123_17 ++ (tM123_18 ++ (tM123_19 ++ (tM123_20 ++ (tM123_21 ++ (tM123_22 ++ (tM123_23 ++ (tM123_24 ++ (tM123_25 ++ (tM123_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 123：区間 N 17・M 27。 -/
theorem pair123_ok : pairOk P pair123 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN123_0) (wseg_append (wseg_of sN123_1) (wseg_append (wseg_of sN123_2) (wseg_append (wseg_of sN123_3) (wseg_append (wseg_of sN123_4) (wseg_append (wseg_of sN123_5) (wseg_append (wseg_of sN123_6) (wseg_append (wseg_of sN123_7) (wseg_append (wseg_of sN123_8) (wseg_append (wseg_of sN123_9) (wseg_append (wseg_of sN123_10) (wseg_append (wseg_of sN123_11) (wseg_append (wseg_of sN123_12) (wseg_append (wseg_of sN123_13) (wseg_append (wseg_of sN123_14) (wseg_append (wseg_of sN123_15) (wseg_of sN123_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM123_0) (wseg_append (wseg_of sM123_1) (wseg_append (wseg_of sM123_2) (wseg_append (wseg_of sM123_3) (wseg_append (wseg_of sM123_4) (wseg_append (wseg_of sM123_5) (wseg_append (wseg_of sM123_6) (wseg_append (wseg_of sM123_7) (wseg_append (wseg_of sM123_8) (wseg_append (wseg_of sM123_9) (wseg_append (wseg_of sM123_10) (wseg_append (wseg_of sM123_11) (wseg_append (wseg_of sM123_12) (wseg_append (wseg_of sM123_13) (wseg_append (wseg_of sM123_14) (wseg_append (wseg_of sM123_15) (wseg_append (wseg_of sM123_16) (wseg_append (wseg_of sM123_17) (wseg_append (wseg_of sM123_18) (wseg_append (wseg_of sM123_19) (wseg_append (wseg_of sM123_20) (wseg_append (wseg_of sM123_21) (wseg_append (wseg_of sM123_22) (wseg_append (wseg_of sM123_23) (wseg_append (wseg_of sM123_24) (wseg_append (wseg_of sM123_25) (wseg_of sM123_26))))))))))))))))))))))))))))

def pair124 : Pair where
  nb := nbN124
  kmNum := 938607
  kmDen := 8388608
  toksN := tN124_0 ++ (tN124_1 ++ (tN124_2 ++ (tN124_3 ++ (tN124_4 ++ (tN124_5 ++ (tN124_6 ++ (tN124_7 ++ (tN124_8 ++ (tN124_9 ++ (tN124_10 ++ (tN124_11 ++ (tN124_12 ++ (tN124_13 ++ (tN124_14))))))))))))))
  toksM := tM124_0 ++ (tM124_1 ++ (tM124_2 ++ (tM124_3 ++ (tM124_4 ++ (tM124_5 ++ (tM124_6 ++ (tM124_7 ++ (tM124_8 ++ (tM124_9 ++ (tM124_10 ++ (tM124_11 ++ (tM124_12 ++ (tM124_13 ++ (tM124_14 ++ (tM124_15 ++ (tM124_16 ++ (tM124_17 ++ (tM124_18 ++ (tM124_19 ++ (tM124_20 ++ (tM124_21 ++ (tM124_22 ++ (tM124_23 ++ (tM124_24 ++ (tM124_25 ++ (tM124_26 ++ (tM124_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 124：区間 N 15・M 28。 -/
theorem pair124_ok : pairOk P pair124 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN124_0) (wseg_append (wseg_of sN124_1) (wseg_append (wseg_of sN124_2) (wseg_append (wseg_of sN124_3) (wseg_append (wseg_of sN124_4) (wseg_append (wseg_of sN124_5) (wseg_append (wseg_of sN124_6) (wseg_append (wseg_of sN124_7) (wseg_append (wseg_of sN124_8) (wseg_append (wseg_of sN124_9) (wseg_append (wseg_of sN124_10) (wseg_append (wseg_of sN124_11) (wseg_append (wseg_of sN124_12) (wseg_append (wseg_of sN124_13) (wseg_of sN124_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM124_0) (wseg_append (wseg_of sM124_1) (wseg_append (wseg_of sM124_2) (wseg_append (wseg_of sM124_3) (wseg_append (wseg_of sM124_4) (wseg_append (wseg_of sM124_5) (wseg_append (wseg_of sM124_6) (wseg_append (wseg_of sM124_7) (wseg_append (wseg_of sM124_8) (wseg_append (wseg_of sM124_9) (wseg_append (wseg_of sM124_10) (wseg_append (wseg_of sM124_11) (wseg_append (wseg_of sM124_12) (wseg_append (wseg_of sM124_13) (wseg_append (wseg_of sM124_14) (wseg_append (wseg_of sM124_15) (wseg_append (wseg_of sM124_16) (wseg_append (wseg_of sM124_17) (wseg_append (wseg_of sM124_18) (wseg_append (wseg_of sM124_19) (wseg_append (wseg_of sM124_20) (wseg_append (wseg_of sM124_21) (wseg_append (wseg_of sM124_22) (wseg_append (wseg_of sM124_23) (wseg_append (wseg_of sM124_24) (wseg_append (wseg_of sM124_25) (wseg_append (wseg_of sM124_26) (wseg_of sM124_27)))))))))))))))))))))))))))))

end PackLean.D28.Cub
