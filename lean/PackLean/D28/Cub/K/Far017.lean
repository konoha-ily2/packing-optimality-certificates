-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS017_0
import PackLean.D28.Cub.K.FarS017_1
import PackLean.D28.Cub.K.FarS017_2
import PackLean.D28.Cub.K.FarS017_3
import PackLean.D28.Cub.K.FarS017_4
import PackLean.D28.Cub.K.FarS017_5
import PackLean.D28.Cub.K.FarS017_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair054 : Pair where
  nb := nbN054
  kmNum := 339
  kmDen := 4194304
  toksN := tN054_0 ++ (tN054_1 ++ (tN054_2 ++ (tN054_3 ++ (tN054_4 ++ (tN054_5 ++ (tN054_6 ++ (tN054_7 ++ (tN054_8 ++ (tN054_9 ++ (tN054_10 ++ (tN054_11 ++ (tN054_12 ++ (tN054_13 ++ (tN054_14 ++ (tN054_15 ++ (tN054_16 ++ (tN054_17 ++ (tN054_18 ++ (tN054_19 ++ (tN054_20 ++ (tN054_21 ++ (tN054_22 ++ (tN054_23 ++ (tN054_24))))))))))))))))))))))))
  toksM := tM054_0 ++ (tM054_1 ++ (tM054_2 ++ (tM054_3 ++ (tM054_4 ++ (tM054_5 ++ (tM054_6 ++ (tM054_7 ++ (tM054_8 ++ (tM054_9 ++ (tM054_10 ++ (tM054_11 ++ (tM054_12 ++ (tM054_13 ++ (tM054_14 ++ (tM054_15 ++ (tM054_16 ++ (tM054_17 ++ (tM054_18 ++ (tM054_19 ++ (tM054_20 ++ (tM054_21 ++ (tM054_22 ++ (tM054_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 054：区間 N 25・M 24。 -/
theorem pair054_ok : pairOk P pair054 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN054_0) (wseg_append (wseg_of sN054_1) (wseg_append (wseg_of sN054_2) (wseg_append (wseg_of sN054_3) (wseg_append (wseg_of sN054_4) (wseg_append (wseg_of sN054_5) (wseg_append (wseg_of sN054_6) (wseg_append (wseg_of sN054_7) (wseg_append (wseg_of sN054_8) (wseg_append (wseg_of sN054_9) (wseg_append (wseg_of sN054_10) (wseg_append (wseg_of sN054_11) (wseg_append (wseg_of sN054_12) (wseg_append (wseg_of sN054_13) (wseg_append (wseg_of sN054_14) (wseg_append (wseg_of sN054_15) (wseg_append (wseg_of sN054_16) (wseg_append (wseg_of sN054_17) (wseg_append (wseg_of sN054_18) (wseg_append (wseg_of sN054_19) (wseg_append (wseg_of sN054_20) (wseg_append (wseg_of sN054_21) (wseg_append (wseg_of sN054_22) (wseg_append (wseg_of sN054_23) (wseg_of sN054_24))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM054_0) (wseg_append (wseg_of sM054_1) (wseg_append (wseg_of sM054_2) (wseg_append (wseg_of sM054_3) (wseg_append (wseg_of sM054_4) (wseg_append (wseg_of sM054_5) (wseg_append (wseg_of sM054_6) (wseg_append (wseg_of sM054_7) (wseg_append (wseg_of sM054_8) (wseg_append (wseg_of sM054_9) (wseg_append (wseg_of sM054_10) (wseg_append (wseg_of sM054_11) (wseg_append (wseg_of sM054_12) (wseg_append (wseg_of sM054_13) (wseg_append (wseg_of sM054_14) (wseg_append (wseg_of sM054_15) (wseg_append (wseg_of sM054_16) (wseg_append (wseg_of sM054_17) (wseg_append (wseg_of sM054_18) (wseg_append (wseg_of sM054_19) (wseg_append (wseg_of sM054_20) (wseg_append (wseg_of sM054_21) (wseg_append (wseg_of sM054_22) (wseg_of sM054_23)))))))))))))))))))))))))

def pair055 : Pair where
  nb := nbN055
  kmNum := 21915
  kmDen := 16777216
  toksN := tN055_0 ++ (tN055_1 ++ (tN055_2 ++ (tN055_3 ++ (tN055_4 ++ (tN055_5 ++ (tN055_6 ++ (tN055_7 ++ (tN055_8 ++ (tN055_9 ++ (tN055_10 ++ (tN055_11 ++ (tN055_12 ++ (tN055_13 ++ (tN055_14 ++ (tN055_15 ++ (tN055_16 ++ (tN055_17 ++ (tN055_18 ++ (tN055_19 ++ (tN055_20 ++ (tN055_21 ++ (tN055_22 ++ (tN055_23 ++ (tN055_24 ++ (tN055_25 ++ (tN055_26))))))))))))))))))))))))))
  toksM := tM055_0 ++ (tM055_1 ++ (tM055_2 ++ (tM055_3 ++ (tM055_4 ++ (tM055_5 ++ (tM055_6 ++ (tM055_7 ++ (tM055_8 ++ (tM055_9 ++ (tM055_10 ++ (tM055_11 ++ (tM055_12 ++ (tM055_13 ++ (tM055_14 ++ (tM055_15 ++ (tM055_16 ++ (tM055_17 ++ (tM055_18 ++ (tM055_19 ++ (tM055_20 ++ (tM055_21 ++ (tM055_22 ++ (tM055_23 ++ (tM055_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 055：区間 N 27・M 25。 -/
theorem pair055_ok : pairOk P pair055 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN055_0) (wseg_append (wseg_of sN055_1) (wseg_append (wseg_of sN055_2) (wseg_append (wseg_of sN055_3) (wseg_append (wseg_of sN055_4) (wseg_append (wseg_of sN055_5) (wseg_append (wseg_of sN055_6) (wseg_append (wseg_of sN055_7) (wseg_append (wseg_of sN055_8) (wseg_append (wseg_of sN055_9) (wseg_append (wseg_of sN055_10) (wseg_append (wseg_of sN055_11) (wseg_append (wseg_of sN055_12) (wseg_append (wseg_of sN055_13) (wseg_append (wseg_of sN055_14) (wseg_append (wseg_of sN055_15) (wseg_append (wseg_of sN055_16) (wseg_append (wseg_of sN055_17) (wseg_append (wseg_of sN055_18) (wseg_append (wseg_of sN055_19) (wseg_append (wseg_of sN055_20) (wseg_append (wseg_of sN055_21) (wseg_append (wseg_of sN055_22) (wseg_append (wseg_of sN055_23) (wseg_append (wseg_of sN055_24) (wseg_append (wseg_of sN055_25) (wseg_of sN055_26))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM055_0) (wseg_append (wseg_of sM055_1) (wseg_append (wseg_of sM055_2) (wseg_append (wseg_of sM055_3) (wseg_append (wseg_of sM055_4) (wseg_append (wseg_of sM055_5) (wseg_append (wseg_of sM055_6) (wseg_append (wseg_of sM055_7) (wseg_append (wseg_of sM055_8) (wseg_append (wseg_of sM055_9) (wseg_append (wseg_of sM055_10) (wseg_append (wseg_of sM055_11) (wseg_append (wseg_of sM055_12) (wseg_append (wseg_of sM055_13) (wseg_append (wseg_of sM055_14) (wseg_append (wseg_of sM055_15) (wseg_append (wseg_of sM055_16) (wseg_append (wseg_of sM055_17) (wseg_append (wseg_of sM055_18) (wseg_append (wseg_of sM055_19) (wseg_append (wseg_of sM055_20) (wseg_append (wseg_of sM055_21) (wseg_append (wseg_of sM055_22) (wseg_append (wseg_of sM055_23) (wseg_of sM055_24))))))))))))))))))))))))))

end PackLean.D28.Cub
