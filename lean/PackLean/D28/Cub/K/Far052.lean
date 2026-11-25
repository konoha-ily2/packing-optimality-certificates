-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS052_0
import PackLean.D28.Cub.K.FarS052_1
import PackLean.D28.Cub.K.FarS052_2
import PackLean.D28.Cub.K.FarS052_3
import PackLean.D28.Cub.K.FarS052_4
import PackLean.D28.Cub.K.FarS052_5
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair125 : Pair where
  nb := nbN125
  kmNum := 2082275
  kmDen := 16777216
  toksN := tN125_0 ++ (tN125_1 ++ (tN125_2 ++ (tN125_3 ++ (tN125_4 ++ (tN125_5 ++ (tN125_6 ++ (tN125_7 ++ (tN125_8 ++ (tN125_9 ++ (tN125_10 ++ (tN125_11 ++ (tN125_12 ++ (tN125_13)))))))))))))
  toksM := tM125_0 ++ (tM125_1 ++ (tM125_2 ++ (tM125_3 ++ (tM125_4 ++ (tM125_5 ++ (tM125_6 ++ (tM125_7 ++ (tM125_8 ++ (tM125_9 ++ (tM125_10 ++ (tM125_11 ++ (tM125_12 ++ (tM125_13 ++ (tM125_14 ++ (tM125_15 ++ (tM125_16 ++ (tM125_17 ++ (tM125_18 ++ (tM125_19 ++ (tM125_20 ++ (tM125_21 ++ (tM125_22 ++ (tM125_23 ++ (tM125_24 ++ (tM125_25 ++ (tM125_26 ++ (tM125_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 125：区間 N 14・M 28。 -/
theorem pair125_ok : pairOk P pair125 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN125_0) (wseg_append (wseg_of sN125_1) (wseg_append (wseg_of sN125_2) (wseg_append (wseg_of sN125_3) (wseg_append (wseg_of sN125_4) (wseg_append (wseg_of sN125_5) (wseg_append (wseg_of sN125_6) (wseg_append (wseg_of sN125_7) (wseg_append (wseg_of sN125_8) (wseg_append (wseg_of sN125_9) (wseg_append (wseg_of sN125_10) (wseg_append (wseg_of sN125_11) (wseg_append (wseg_of sN125_12) (wseg_of sN125_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM125_0) (wseg_append (wseg_of sM125_1) (wseg_append (wseg_of sM125_2) (wseg_append (wseg_of sM125_3) (wseg_append (wseg_of sM125_4) (wseg_append (wseg_of sM125_5) (wseg_append (wseg_of sM125_6) (wseg_append (wseg_of sM125_7) (wseg_append (wseg_of sM125_8) (wseg_append (wseg_of sM125_9) (wseg_append (wseg_of sM125_10) (wseg_append (wseg_of sM125_11) (wseg_append (wseg_of sM125_12) (wseg_append (wseg_of sM125_13) (wseg_append (wseg_of sM125_14) (wseg_append (wseg_of sM125_15) (wseg_append (wseg_of sM125_16) (wseg_append (wseg_of sM125_17) (wseg_append (wseg_of sM125_18) (wseg_append (wseg_of sM125_19) (wseg_append (wseg_of sM125_20) (wseg_append (wseg_of sM125_21) (wseg_append (wseg_of sM125_22) (wseg_append (wseg_of sM125_23) (wseg_append (wseg_of sM125_24) (wseg_append (wseg_of sM125_25) (wseg_append (wseg_of sM125_26) (wseg_of sM125_27)))))))))))))))))))))))))))))

def pair126 : Pair where
  nb := nbN126
  kmNum := 1846881
  kmDen := 16777216
  toksN := tN126_0 ++ (tN126_1 ++ (tN126_2 ++ (tN126_3 ++ (tN126_4 ++ (tN126_5 ++ (tN126_6 ++ (tN126_7 ++ (tN126_8 ++ (tN126_9 ++ (tN126_10 ++ (tN126_11 ++ (tN126_12 ++ (tN126_13 ++ (tN126_14 ++ (tN126_15 ++ (tN126_16))))))))))))))))
  toksM := tM126_0 ++ (tM126_1 ++ (tM126_2 ++ (tM126_3 ++ (tM126_4 ++ (tM126_5 ++ (tM126_6 ++ (tM126_7 ++ (tM126_8 ++ (tM126_9 ++ (tM126_10 ++ (tM126_11 ++ (tM126_12 ++ (tM126_13 ++ (tM126_14 ++ (tM126_15 ++ (tM126_16 ++ (tM126_17 ++ (tM126_18 ++ (tM126_19 ++ (tM126_20 ++ (tM126_21 ++ (tM126_22 ++ (tM126_23 ++ (tM126_24 ++ (tM126_25 ++ (tM126_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 126：区間 N 17・M 27。 -/
theorem pair126_ok : pairOk P pair126 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN126_0) (wseg_append (wseg_of sN126_1) (wseg_append (wseg_of sN126_2) (wseg_append (wseg_of sN126_3) (wseg_append (wseg_of sN126_4) (wseg_append (wseg_of sN126_5) (wseg_append (wseg_of sN126_6) (wseg_append (wseg_of sN126_7) (wseg_append (wseg_of sN126_8) (wseg_append (wseg_of sN126_9) (wseg_append (wseg_of sN126_10) (wseg_append (wseg_of sN126_11) (wseg_append (wseg_of sN126_12) (wseg_append (wseg_of sN126_13) (wseg_append (wseg_of sN126_14) (wseg_append (wseg_of sN126_15) (wseg_of sN126_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM126_0) (wseg_append (wseg_of sM126_1) (wseg_append (wseg_of sM126_2) (wseg_append (wseg_of sM126_3) (wseg_append (wseg_of sM126_4) (wseg_append (wseg_of sM126_5) (wseg_append (wseg_of sM126_6) (wseg_append (wseg_of sM126_7) (wseg_append (wseg_of sM126_8) (wseg_append (wseg_of sM126_9) (wseg_append (wseg_of sM126_10) (wseg_append (wseg_of sM126_11) (wseg_append (wseg_of sM126_12) (wseg_append (wseg_of sM126_13) (wseg_append (wseg_of sM126_14) (wseg_append (wseg_of sM126_15) (wseg_append (wseg_of sM126_16) (wseg_append (wseg_of sM126_17) (wseg_append (wseg_of sM126_18) (wseg_append (wseg_of sM126_19) (wseg_append (wseg_of sM126_20) (wseg_append (wseg_of sM126_21) (wseg_append (wseg_of sM126_22) (wseg_append (wseg_of sM126_23) (wseg_append (wseg_of sM126_24) (wseg_append (wseg_of sM126_25) (wseg_of sM126_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
