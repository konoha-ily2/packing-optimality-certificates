-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS019_0
import PackLean.D28.Cub.K.FarS019_1
import PackLean.D28.Cub.K.FarS019_2
import PackLean.D28.Cub.K.FarS019_3
import PackLean.D28.Cub.K.FarS019_4
import PackLean.D28.Cub.K.FarS019_5
import PackLean.D28.Cub.K.FarS019_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair058 : Pair where
  nb := nbN058
  kmNum := 63475
  kmDen := 8388608
  toksN := tN058_0 ++ (tN058_1 ++ (tN058_2 ++ (tN058_3 ++ (tN058_4 ++ (tN058_5 ++ (tN058_6 ++ (tN058_7 ++ (tN058_8 ++ (tN058_9 ++ (tN058_10 ++ (tN058_11 ++ (tN058_12 ++ (tN058_13 ++ (tN058_14 ++ (tN058_15 ++ (tN058_16 ++ (tN058_17 ++ (tN058_18 ++ (tN058_19 ++ (tN058_20 ++ (tN058_21 ++ (tN058_22 ++ (tN058_23 ++ (tN058_24 ++ (tN058_25 ++ (tN058_26))))))))))))))))))))))))))
  toksM := tM058_0 ++ (tM058_1 ++ (tM058_2 ++ (tM058_3 ++ (tM058_4 ++ (tM058_5 ++ (tM058_6 ++ (tM058_7 ++ (tM058_8 ++ (tM058_9 ++ (tM058_10 ++ (tM058_11 ++ (tM058_12 ++ (tM058_13 ++ (tM058_14 ++ (tM058_15 ++ (tM058_16 ++ (tM058_17 ++ (tM058_18 ++ (tM058_19 ++ (tM058_20 ++ (tM058_21 ++ (tM058_22 ++ (tM058_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 058：区間 N 27・M 24。 -/
theorem pair058_ok : pairOk P pair058 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN058_0) (wseg_append (wseg_of sN058_1) (wseg_append (wseg_of sN058_2) (wseg_append (wseg_of sN058_3) (wseg_append (wseg_of sN058_4) (wseg_append (wseg_of sN058_5) (wseg_append (wseg_of sN058_6) (wseg_append (wseg_of sN058_7) (wseg_append (wseg_of sN058_8) (wseg_append (wseg_of sN058_9) (wseg_append (wseg_of sN058_10) (wseg_append (wseg_of sN058_11) (wseg_append (wseg_of sN058_12) (wseg_append (wseg_of sN058_13) (wseg_append (wseg_of sN058_14) (wseg_append (wseg_of sN058_15) (wseg_append (wseg_of sN058_16) (wseg_append (wseg_of sN058_17) (wseg_append (wseg_of sN058_18) (wseg_append (wseg_of sN058_19) (wseg_append (wseg_of sN058_20) (wseg_append (wseg_of sN058_21) (wseg_append (wseg_of sN058_22) (wseg_append (wseg_of sN058_23) (wseg_append (wseg_of sN058_24) (wseg_append (wseg_of sN058_25) (wseg_of sN058_26))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM058_0) (wseg_append (wseg_of sM058_1) (wseg_append (wseg_of sM058_2) (wseg_append (wseg_of sM058_3) (wseg_append (wseg_of sM058_4) (wseg_append (wseg_of sM058_5) (wseg_append (wseg_of sM058_6) (wseg_append (wseg_of sM058_7) (wseg_append (wseg_of sM058_8) (wseg_append (wseg_of sM058_9) (wseg_append (wseg_of sM058_10) (wseg_append (wseg_of sM058_11) (wseg_append (wseg_of sM058_12) (wseg_append (wseg_of sM058_13) (wseg_append (wseg_of sM058_14) (wseg_append (wseg_of sM058_15) (wseg_append (wseg_of sM058_16) (wseg_append (wseg_of sM058_17) (wseg_append (wseg_of sM058_18) (wseg_append (wseg_of sM058_19) (wseg_append (wseg_of sM058_20) (wseg_append (wseg_of sM058_21) (wseg_append (wseg_of sM058_22) (wseg_of sM058_23)))))))))))))))))))))))))

def pair059 : Pair where
  nb := nbN059
  kmNum := 419025
  kmDen := 16777216
  toksN := tN059_0 ++ (tN059_1 ++ (tN059_2 ++ (tN059_3 ++ (tN059_4 ++ (tN059_5 ++ (tN059_6 ++ (tN059_7 ++ (tN059_8 ++ (tN059_9 ++ (tN059_10 ++ (tN059_11 ++ (tN059_12 ++ (tN059_13 ++ (tN059_14 ++ (tN059_15 ++ (tN059_16 ++ (tN059_17 ++ (tN059_18 ++ (tN059_19 ++ (tN059_20 ++ (tN059_21 ++ (tN059_22 ++ (tN059_23 ++ (tN059_24))))))))))))))))))))))))
  toksM := tM059_0 ++ (tM059_1 ++ (tM059_2 ++ (tM059_3 ++ (tM059_4 ++ (tM059_5 ++ (tM059_6 ++ (tM059_7 ++ (tM059_8 ++ (tM059_9 ++ (tM059_10 ++ (tM059_11 ++ (tM059_12 ++ (tM059_13 ++ (tM059_14 ++ (tM059_15 ++ (tM059_16 ++ (tM059_17 ++ (tM059_18 ++ (tM059_19 ++ (tM059_20 ++ (tM059_21 ++ (tM059_22 ++ (tM059_23 ++ (tM059_24 ++ (tM059_25 ++ (tM059_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 059：区間 N 25・M 27。 -/
theorem pair059_ok : pairOk P pair059 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN059_0) (wseg_append (wseg_of sN059_1) (wseg_append (wseg_of sN059_2) (wseg_append (wseg_of sN059_3) (wseg_append (wseg_of sN059_4) (wseg_append (wseg_of sN059_5) (wseg_append (wseg_of sN059_6) (wseg_append (wseg_of sN059_7) (wseg_append (wseg_of sN059_8) (wseg_append (wseg_of sN059_9) (wseg_append (wseg_of sN059_10) (wseg_append (wseg_of sN059_11) (wseg_append (wseg_of sN059_12) (wseg_append (wseg_of sN059_13) (wseg_append (wseg_of sN059_14) (wseg_append (wseg_of sN059_15) (wseg_append (wseg_of sN059_16) (wseg_append (wseg_of sN059_17) (wseg_append (wseg_of sN059_18) (wseg_append (wseg_of sN059_19) (wseg_append (wseg_of sN059_20) (wseg_append (wseg_of sN059_21) (wseg_append (wseg_of sN059_22) (wseg_append (wseg_of sN059_23) (wseg_of sN059_24))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM059_0) (wseg_append (wseg_of sM059_1) (wseg_append (wseg_of sM059_2) (wseg_append (wseg_of sM059_3) (wseg_append (wseg_of sM059_4) (wseg_append (wseg_of sM059_5) (wseg_append (wseg_of sM059_6) (wseg_append (wseg_of sM059_7) (wseg_append (wseg_of sM059_8) (wseg_append (wseg_of sM059_9) (wseg_append (wseg_of sM059_10) (wseg_append (wseg_of sM059_11) (wseg_append (wseg_of sM059_12) (wseg_append (wseg_of sM059_13) (wseg_append (wseg_of sM059_14) (wseg_append (wseg_of sM059_15) (wseg_append (wseg_of sM059_16) (wseg_append (wseg_of sM059_17) (wseg_append (wseg_of sM059_18) (wseg_append (wseg_of sM059_19) (wseg_append (wseg_of sM059_20) (wseg_append (wseg_of sM059_21) (wseg_append (wseg_of sM059_22) (wseg_append (wseg_of sM059_23) (wseg_append (wseg_of sM059_24) (wseg_append (wseg_of sM059_25) (wseg_of sM059_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
