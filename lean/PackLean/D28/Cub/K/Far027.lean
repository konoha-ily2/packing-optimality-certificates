-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS027_0
import PackLean.D28.Cub.K.FarS027_1
import PackLean.D28.Cub.K.FarS027_2
import PackLean.D28.Cub.K.FarS027_3
import PackLean.D28.Cub.K.FarS027_4
import PackLean.D28.Cub.K.FarS027_5
import PackLean.D28.Cub.K.FarS027_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair075 : Pair where
  nb := nbN075
  kmNum := 1244139
  kmDen := 16777216
  toksN := tN075_0 ++ (tN075_1 ++ (tN075_2 ++ (tN075_3 ++ (tN075_4 ++ (tN075_5 ++ (tN075_6 ++ (tN075_7 ++ (tN075_8 ++ (tN075_9 ++ (tN075_10 ++ (tN075_11 ++ (tN075_12 ++ (tN075_13 ++ (tN075_14 ++ (tN075_15 ++ (tN075_16 ++ (tN075_17 ++ (tN075_18))))))))))))))))))
  toksM := tM075_0 ++ (tM075_1 ++ (tM075_2 ++ (tM075_3 ++ (tM075_4 ++ (tM075_5 ++ (tM075_6 ++ (tM075_7 ++ (tM075_8 ++ (tM075_9 ++ (tM075_10 ++ (tM075_11 ++ (tM075_12 ++ (tM075_13 ++ (tM075_14 ++ (tM075_15 ++ (tM075_16 ++ (tM075_17 ++ (tM075_18 ++ (tM075_19 ++ (tM075_20 ++ (tM075_21 ++ (tM075_22 ++ (tM075_23 ++ (tM075_24 ++ (tM075_25 ++ (tM075_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 075：区間 N 19・M 27。 -/
theorem pair075_ok : pairOk P pair075 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN075_0) (wseg_append (wseg_of sN075_1) (wseg_append (wseg_of sN075_2) (wseg_append (wseg_of sN075_3) (wseg_append (wseg_of sN075_4) (wseg_append (wseg_of sN075_5) (wseg_append (wseg_of sN075_6) (wseg_append (wseg_of sN075_7) (wseg_append (wseg_of sN075_8) (wseg_append (wseg_of sN075_9) (wseg_append (wseg_of sN075_10) (wseg_append (wseg_of sN075_11) (wseg_append (wseg_of sN075_12) (wseg_append (wseg_of sN075_13) (wseg_append (wseg_of sN075_14) (wseg_append (wseg_of sN075_15) (wseg_append (wseg_of sN075_16) (wseg_append (wseg_of sN075_17) (wseg_of sN075_18))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM075_0) (wseg_append (wseg_of sM075_1) (wseg_append (wseg_of sM075_2) (wseg_append (wseg_of sM075_3) (wseg_append (wseg_of sM075_4) (wseg_append (wseg_of sM075_5) (wseg_append (wseg_of sM075_6) (wseg_append (wseg_of sM075_7) (wseg_append (wseg_of sM075_8) (wseg_append (wseg_of sM075_9) (wseg_append (wseg_of sM075_10) (wseg_append (wseg_of sM075_11) (wseg_append (wseg_of sM075_12) (wseg_append (wseg_of sM075_13) (wseg_append (wseg_of sM075_14) (wseg_append (wseg_of sM075_15) (wseg_append (wseg_of sM075_16) (wseg_append (wseg_of sM075_17) (wseg_append (wseg_of sM075_18) (wseg_append (wseg_of sM075_19) (wseg_append (wseg_of sM075_20) (wseg_append (wseg_of sM075_21) (wseg_append (wseg_of sM075_22) (wseg_append (wseg_of sM075_23) (wseg_append (wseg_of sM075_24) (wseg_append (wseg_of sM075_25) (wseg_of sM075_26))))))))))))))))))))))))))))

def pair076 : Pair where
  nb := nbN076
  kmNum := -6511
  kmDen := 8388608
  toksN := tN076_0 ++ (tN076_1 ++ (tN076_2 ++ (tN076_3 ++ (tN076_4 ++ (tN076_5 ++ (tN076_6 ++ (tN076_7 ++ (tN076_8 ++ (tN076_9 ++ (tN076_10 ++ (tN076_11 ++ (tN076_12 ++ (tN076_13 ++ (tN076_14 ++ (tN076_15 ++ (tN076_16 ++ (tN076_17 ++ (tN076_18 ++ (tN076_19 ++ (tN076_20 ++ (tN076_21 ++ (tN076_22 ++ (tN076_23 ++ (tN076_24 ++ (tN076_25 ++ (tN076_26 ++ (tN076_27)))))))))))))))))))))))))))
  toksM := tM076_0 ++ (tM076_1 ++ (tM076_2 ++ (tM076_3 ++ (tM076_4 ++ (tM076_5 ++ (tM076_6 ++ (tM076_7 ++ (tM076_8 ++ (tM076_9 ++ (tM076_10 ++ (tM076_11 ++ (tM076_12 ++ (tM076_13 ++ (tM076_14 ++ (tM076_15 ++ (tM076_16 ++ (tM076_17 ++ (tM076_18 ++ (tM076_19 ++ (tM076_20 ++ (tM076_21 ++ (tM076_22 ++ (tM076_23 ++ (tM076_24 ++ (tM076_25 ++ (tM076_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 076：区間 N 28・M 27。 -/
theorem pair076_ok : pairOk P pair076 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN076_0) (wseg_append (wseg_of sN076_1) (wseg_append (wseg_of sN076_2) (wseg_append (wseg_of sN076_3) (wseg_append (wseg_of sN076_4) (wseg_append (wseg_of sN076_5) (wseg_append (wseg_of sN076_6) (wseg_append (wseg_of sN076_7) (wseg_append (wseg_of sN076_8) (wseg_append (wseg_of sN076_9) (wseg_append (wseg_of sN076_10) (wseg_append (wseg_of sN076_11) (wseg_append (wseg_of sN076_12) (wseg_append (wseg_of sN076_13) (wseg_append (wseg_of sN076_14) (wseg_append (wseg_of sN076_15) (wseg_append (wseg_of sN076_16) (wseg_append (wseg_of sN076_17) (wseg_append (wseg_of sN076_18) (wseg_append (wseg_of sN076_19) (wseg_append (wseg_of sN076_20) (wseg_append (wseg_of sN076_21) (wseg_append (wseg_of sN076_22) (wseg_append (wseg_of sN076_23) (wseg_append (wseg_of sN076_24) (wseg_append (wseg_of sN076_25) (wseg_append (wseg_of sN076_26) (wseg_of sN076_27)))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM076_0) (wseg_append (wseg_of sM076_1) (wseg_append (wseg_of sM076_2) (wseg_append (wseg_of sM076_3) (wseg_append (wseg_of sM076_4) (wseg_append (wseg_of sM076_5) (wseg_append (wseg_of sM076_6) (wseg_append (wseg_of sM076_7) (wseg_append (wseg_of sM076_8) (wseg_append (wseg_of sM076_9) (wseg_append (wseg_of sM076_10) (wseg_append (wseg_of sM076_11) (wseg_append (wseg_of sM076_12) (wseg_append (wseg_of sM076_13) (wseg_append (wseg_of sM076_14) (wseg_append (wseg_of sM076_15) (wseg_append (wseg_of sM076_16) (wseg_append (wseg_of sM076_17) (wseg_append (wseg_of sM076_18) (wseg_append (wseg_of sM076_19) (wseg_append (wseg_of sM076_20) (wseg_append (wseg_of sM076_21) (wseg_append (wseg_of sM076_22) (wseg_append (wseg_of sM076_23) (wseg_append (wseg_of sM076_24) (wseg_append (wseg_of sM076_25) (wseg_of sM076_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
