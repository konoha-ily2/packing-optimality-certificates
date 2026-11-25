-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS033_0
import PackLean.D28.Cub.K.FarS033_1
import PackLean.D28.Cub.K.FarS033_2
import PackLean.D28.Cub.K.FarS033_3
import PackLean.D28.Cub.K.FarS033_4
import PackLean.D28.Cub.K.FarS033_5
import PackLean.D28.Cub.K.FarS033_6
import PackLean.D28.Cub.K.FarS033_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair087 : Pair where
  nb := nbN087
  kmNum := 24185
  kmDen := 16777216
  toksN := tN087_0 ++ (tN087_1 ++ (tN087_2 ++ (tN087_3 ++ (tN087_4 ++ (tN087_5 ++ (tN087_6 ++ (tN087_7 ++ (tN087_8 ++ (tN087_9 ++ (tN087_10 ++ (tN087_11 ++ (tN087_12 ++ (tN087_13 ++ (tN087_14 ++ (tN087_15 ++ (tN087_16 ++ (tN087_17 ++ (tN087_18 ++ (tN087_19 ++ (tN087_20 ++ (tN087_21 ++ (tN087_22 ++ (tN087_23 ++ (tN087_24 ++ (tN087_25 ++ (tN087_26 ++ (tN087_27 ++ (tN087_28))))))))))))))))))))))))))))
  toksM := tM087_0 ++ (tM087_1 ++ (tM087_2 ++ (tM087_3 ++ (tM087_4 ++ (tM087_5 ++ (tM087_6 ++ (tM087_7 ++ (tM087_8 ++ (tM087_9 ++ (tM087_10 ++ (tM087_11 ++ (tM087_12 ++ (tM087_13 ++ (tM087_14 ++ (tM087_15 ++ (tM087_16 ++ (tM087_17 ++ (tM087_18 ++ (tM087_19 ++ (tM087_20 ++ (tM087_21 ++ (tM087_22 ++ (tM087_23 ++ (tM087_24 ++ (tM087_25 ++ (tM087_26 ++ (tM087_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 087：区間 N 29・M 28。 -/
theorem pair087_ok : pairOk P pair087 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN087_0) (wseg_append (wseg_of sN087_1) (wseg_append (wseg_of sN087_2) (wseg_append (wseg_of sN087_3) (wseg_append (wseg_of sN087_4) (wseg_append (wseg_of sN087_5) (wseg_append (wseg_of sN087_6) (wseg_append (wseg_of sN087_7) (wseg_append (wseg_of sN087_8) (wseg_append (wseg_of sN087_9) (wseg_append (wseg_of sN087_10) (wseg_append (wseg_of sN087_11) (wseg_append (wseg_of sN087_12) (wseg_append (wseg_of sN087_13) (wseg_append (wseg_of sN087_14) (wseg_append (wseg_of sN087_15) (wseg_append (wseg_of sN087_16) (wseg_append (wseg_of sN087_17) (wseg_append (wseg_of sN087_18) (wseg_append (wseg_of sN087_19) (wseg_append (wseg_of sN087_20) (wseg_append (wseg_of sN087_21) (wseg_append (wseg_of sN087_22) (wseg_append (wseg_of sN087_23) (wseg_append (wseg_of sN087_24) (wseg_append (wseg_of sN087_25) (wseg_append (wseg_of sN087_26) (wseg_append (wseg_of sN087_27) (wseg_of sN087_28))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM087_0) (wseg_append (wseg_of sM087_1) (wseg_append (wseg_of sM087_2) (wseg_append (wseg_of sM087_3) (wseg_append (wseg_of sM087_4) (wseg_append (wseg_of sM087_5) (wseg_append (wseg_of sM087_6) (wseg_append (wseg_of sM087_7) (wseg_append (wseg_of sM087_8) (wseg_append (wseg_of sM087_9) (wseg_append (wseg_of sM087_10) (wseg_append (wseg_of sM087_11) (wseg_append (wseg_of sM087_12) (wseg_append (wseg_of sM087_13) (wseg_append (wseg_of sM087_14) (wseg_append (wseg_of sM087_15) (wseg_append (wseg_of sM087_16) (wseg_append (wseg_of sM087_17) (wseg_append (wseg_of sM087_18) (wseg_append (wseg_of sM087_19) (wseg_append (wseg_of sM087_20) (wseg_append (wseg_of sM087_21) (wseg_append (wseg_of sM087_22) (wseg_append (wseg_of sM087_23) (wseg_append (wseg_of sM087_24) (wseg_append (wseg_of sM087_25) (wseg_append (wseg_of sM087_26) (wseg_of sM087_27)))))))))))))))))))))))))))))

def pair088 : Pair where
  nb := nbN088
  kmNum := 96983
  kmDen := 16777216
  toksN := tN088_0 ++ (tN088_1 ++ (tN088_2 ++ (tN088_3 ++ (tN088_4 ++ (tN088_5 ++ (tN088_6 ++ (tN088_7 ++ (tN088_8 ++ (tN088_9 ++ (tN088_10 ++ (tN088_11 ++ (tN088_12 ++ (tN088_13 ++ (tN088_14 ++ (tN088_15 ++ (tN088_16 ++ (tN088_17 ++ (tN088_18 ++ (tN088_19 ++ (tN088_20 ++ (tN088_21 ++ (tN088_22 ++ (tN088_23 ++ (tN088_24 ++ (tN088_25 ++ (tN088_26 ++ (tN088_27)))))))))))))))))))))))))))
  toksM := tM088_0 ++ (tM088_1 ++ (tM088_2 ++ (tM088_3 ++ (tM088_4 ++ (tM088_5 ++ (tM088_6 ++ (tM088_7 ++ (tM088_8 ++ (tM088_9 ++ (tM088_10 ++ (tM088_11 ++ (tM088_12 ++ (tM088_13 ++ (tM088_14 ++ (tM088_15 ++ (tM088_16 ++ (tM088_17 ++ (tM088_18 ++ (tM088_19 ++ (tM088_20 ++ (tM088_21 ++ (tM088_22 ++ (tM088_23 ++ (tM088_24 ++ (tM088_25 ++ (tM088_26 ++ (tM088_27 ++ (tM088_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 088：区間 N 28・M 29。 -/
theorem pair088_ok : pairOk P pair088 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN088_0) (wseg_append (wseg_of sN088_1) (wseg_append (wseg_of sN088_2) (wseg_append (wseg_of sN088_3) (wseg_append (wseg_of sN088_4) (wseg_append (wseg_of sN088_5) (wseg_append (wseg_of sN088_6) (wseg_append (wseg_of sN088_7) (wseg_append (wseg_of sN088_8) (wseg_append (wseg_of sN088_9) (wseg_append (wseg_of sN088_10) (wseg_append (wseg_of sN088_11) (wseg_append (wseg_of sN088_12) (wseg_append (wseg_of sN088_13) (wseg_append (wseg_of sN088_14) (wseg_append (wseg_of sN088_15) (wseg_append (wseg_of sN088_16) (wseg_append (wseg_of sN088_17) (wseg_append (wseg_of sN088_18) (wseg_append (wseg_of sN088_19) (wseg_append (wseg_of sN088_20) (wseg_append (wseg_of sN088_21) (wseg_append (wseg_of sN088_22) (wseg_append (wseg_of sN088_23) (wseg_append (wseg_of sN088_24) (wseg_append (wseg_of sN088_25) (wseg_append (wseg_of sN088_26) (wseg_of sN088_27)))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM088_0) (wseg_append (wseg_of sM088_1) (wseg_append (wseg_of sM088_2) (wseg_append (wseg_of sM088_3) (wseg_append (wseg_of sM088_4) (wseg_append (wseg_of sM088_5) (wseg_append (wseg_of sM088_6) (wseg_append (wseg_of sM088_7) (wseg_append (wseg_of sM088_8) (wseg_append (wseg_of sM088_9) (wseg_append (wseg_of sM088_10) (wseg_append (wseg_of sM088_11) (wseg_append (wseg_of sM088_12) (wseg_append (wseg_of sM088_13) (wseg_append (wseg_of sM088_14) (wseg_append (wseg_of sM088_15) (wseg_append (wseg_of sM088_16) (wseg_append (wseg_of sM088_17) (wseg_append (wseg_of sM088_18) (wseg_append (wseg_of sM088_19) (wseg_append (wseg_of sM088_20) (wseg_append (wseg_of sM088_21) (wseg_append (wseg_of sM088_22) (wseg_append (wseg_of sM088_23) (wseg_append (wseg_of sM088_24) (wseg_append (wseg_of sM088_25) (wseg_append (wseg_of sM088_26) (wseg_append (wseg_of sM088_27) (wseg_of sM088_28))))))))))))))))))))))))))))))

end PackLean.D28.Cub
