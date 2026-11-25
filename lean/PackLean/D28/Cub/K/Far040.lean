-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS040_0
import PackLean.D28.Cub.K.FarS040_1
import PackLean.D28.Cub.K.FarS040_2
import PackLean.D28.Cub.K.FarS040_3
import PackLean.D28.Cub.K.FarS040_4
import PackLean.D28.Cub.K.FarS040_5
import PackLean.D28.Cub.K.FarS040_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair100 : Pair where
  nb := nbN100
  kmNum := 738637
  kmDen := 16777216
  toksN := tN100_0 ++ (tN100_1 ++ (tN100_2 ++ (tN100_3 ++ (tN100_4 ++ (tN100_5 ++ (tN100_6 ++ (tN100_7 ++ (tN100_8 ++ (tN100_9 ++ (tN100_10 ++ (tN100_11 ++ (tN100_12 ++ (tN100_13 ++ (tN100_14 ++ (tN100_15 ++ (tN100_16 ++ (tN100_17 ++ (tN100_18 ++ (tN100_19 ++ (tN100_20 ++ (tN100_21 ++ (tN100_22))))))))))))))))))))))
  toksM := tM100_0 ++ (tM100_1 ++ (tM100_2 ++ (tM100_3 ++ (tM100_4 ++ (tM100_5 ++ (tM100_6 ++ (tM100_7 ++ (tM100_8 ++ (tM100_9 ++ (tM100_10 ++ (tM100_11 ++ (tM100_12 ++ (tM100_13 ++ (tM100_14 ++ (tM100_15 ++ (tM100_16 ++ (tM100_17 ++ (tM100_18 ++ (tM100_19 ++ (tM100_20 ++ (tM100_21 ++ (tM100_22 ++ (tM100_23 ++ (tM100_24 ++ (tM100_25 ++ (tM100_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 100：区間 N 23・M 27。 -/
theorem pair100_ok : pairOk P pair100 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN100_0) (wseg_append (wseg_of sN100_1) (wseg_append (wseg_of sN100_2) (wseg_append (wseg_of sN100_3) (wseg_append (wseg_of sN100_4) (wseg_append (wseg_of sN100_5) (wseg_append (wseg_of sN100_6) (wseg_append (wseg_of sN100_7) (wseg_append (wseg_of sN100_8) (wseg_append (wseg_of sN100_9) (wseg_append (wseg_of sN100_10) (wseg_append (wseg_of sN100_11) (wseg_append (wseg_of sN100_12) (wseg_append (wseg_of sN100_13) (wseg_append (wseg_of sN100_14) (wseg_append (wseg_of sN100_15) (wseg_append (wseg_of sN100_16) (wseg_append (wseg_of sN100_17) (wseg_append (wseg_of sN100_18) (wseg_append (wseg_of sN100_19) (wseg_append (wseg_of sN100_20) (wseg_append (wseg_of sN100_21) (wseg_of sN100_22))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM100_0) (wseg_append (wseg_of sM100_1) (wseg_append (wseg_of sM100_2) (wseg_append (wseg_of sM100_3) (wseg_append (wseg_of sM100_4) (wseg_append (wseg_of sM100_5) (wseg_append (wseg_of sM100_6) (wseg_append (wseg_of sM100_7) (wseg_append (wseg_of sM100_8) (wseg_append (wseg_of sM100_9) (wseg_append (wseg_of sM100_10) (wseg_append (wseg_of sM100_11) (wseg_append (wseg_of sM100_12) (wseg_append (wseg_of sM100_13) (wseg_append (wseg_of sM100_14) (wseg_append (wseg_of sM100_15) (wseg_append (wseg_of sM100_16) (wseg_append (wseg_of sM100_17) (wseg_append (wseg_of sM100_18) (wseg_append (wseg_of sM100_19) (wseg_append (wseg_of sM100_20) (wseg_append (wseg_of sM100_21) (wseg_append (wseg_of sM100_22) (wseg_append (wseg_of sM100_23) (wseg_append (wseg_of sM100_24) (wseg_append (wseg_of sM100_25) (wseg_of sM100_26))))))))))))))))))))))))))))

def pair101 : Pair where
  nb := nbN101
  kmNum := 462331
  kmDen := 16777216
  toksN := tN101_0 ++ (tN101_1 ++ (tN101_2 ++ (tN101_3 ++ (tN101_4 ++ (tN101_5 ++ (tN101_6 ++ (tN101_7 ++ (tN101_8 ++ (tN101_9 ++ (tN101_10 ++ (tN101_11 ++ (tN101_12 ++ (tN101_13 ++ (tN101_14 ++ (tN101_15 ++ (tN101_16 ++ (tN101_17 ++ (tN101_18 ++ (tN101_19 ++ (tN101_20 ++ (tN101_21 ++ (tN101_22 ++ (tN101_23 ++ (tN101_24 ++ (tN101_25)))))))))))))))))))))))))
  toksM := tM101_0 ++ (tM101_1 ++ (tM101_2 ++ (tM101_3 ++ (tM101_4 ++ (tM101_5 ++ (tM101_6 ++ (tM101_7 ++ (tM101_8 ++ (tM101_9 ++ (tM101_10 ++ (tM101_11 ++ (tM101_12 ++ (tM101_13 ++ (tM101_14 ++ (tM101_15 ++ (tM101_16 ++ (tM101_17 ++ (tM101_18 ++ (tM101_19 ++ (tM101_20 ++ (tM101_21 ++ (tM101_22 ++ (tM101_23 ++ (tM101_24 ++ (tM101_25 ++ (tM101_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 101：区間 N 26・M 27。 -/
theorem pair101_ok : pairOk P pair101 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN101_0) (wseg_append (wseg_of sN101_1) (wseg_append (wseg_of sN101_2) (wseg_append (wseg_of sN101_3) (wseg_append (wseg_of sN101_4) (wseg_append (wseg_of sN101_5) (wseg_append (wseg_of sN101_6) (wseg_append (wseg_of sN101_7) (wseg_append (wseg_of sN101_8) (wseg_append (wseg_of sN101_9) (wseg_append (wseg_of sN101_10) (wseg_append (wseg_of sN101_11) (wseg_append (wseg_of sN101_12) (wseg_append (wseg_of sN101_13) (wseg_append (wseg_of sN101_14) (wseg_append (wseg_of sN101_15) (wseg_append (wseg_of sN101_16) (wseg_append (wseg_of sN101_17) (wseg_append (wseg_of sN101_18) (wseg_append (wseg_of sN101_19) (wseg_append (wseg_of sN101_20) (wseg_append (wseg_of sN101_21) (wseg_append (wseg_of sN101_22) (wseg_append (wseg_of sN101_23) (wseg_append (wseg_of sN101_24) (wseg_of sN101_25)))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM101_0) (wseg_append (wseg_of sM101_1) (wseg_append (wseg_of sM101_2) (wseg_append (wseg_of sM101_3) (wseg_append (wseg_of sM101_4) (wseg_append (wseg_of sM101_5) (wseg_append (wseg_of sM101_6) (wseg_append (wseg_of sM101_7) (wseg_append (wseg_of sM101_8) (wseg_append (wseg_of sM101_9) (wseg_append (wseg_of sM101_10) (wseg_append (wseg_of sM101_11) (wseg_append (wseg_of sM101_12) (wseg_append (wseg_of sM101_13) (wseg_append (wseg_of sM101_14) (wseg_append (wseg_of sM101_15) (wseg_append (wseg_of sM101_16) (wseg_append (wseg_of sM101_17) (wseg_append (wseg_of sM101_18) (wseg_append (wseg_of sM101_19) (wseg_append (wseg_of sM101_20) (wseg_append (wseg_of sM101_21) (wseg_append (wseg_of sM101_22) (wseg_append (wseg_of sM101_23) (wseg_append (wseg_of sM101_24) (wseg_append (wseg_of sM101_25) (wseg_of sM101_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
