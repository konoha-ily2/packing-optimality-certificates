-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS043_0
import PackLean.D28.Cub.K.FarS043_1
import PackLean.D28.Cub.K.FarS043_2
import PackLean.D28.Cub.K.FarS043_3
import PackLean.D28.Cub.K.FarS043_4
import PackLean.D28.Cub.K.FarS043_5
import PackLean.D28.Cub.K.FarS043_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair106 : Pair where
  nb := nbN106
  kmNum := 1109393
  kmDen := 16777216
  toksN := tN106_0 ++ (tN106_1 ++ (tN106_2 ++ (tN106_3 ++ (tN106_4 ++ (tN106_5 ++ (tN106_6 ++ (tN106_7 ++ (tN106_8 ++ (tN106_9 ++ (tN106_10 ++ (tN106_11 ++ (tN106_12 ++ (tN106_13 ++ (tN106_14 ++ (tN106_15 ++ (tN106_16 ++ (tN106_17 ++ (tN106_18 ++ (tN106_19 ++ (tN106_20))))))))))))))))))))
  toksM := tM106_0 ++ (tM106_1 ++ (tM106_2 ++ (tM106_3 ++ (tM106_4 ++ (tM106_5 ++ (tM106_6 ++ (tM106_7 ++ (tM106_8 ++ (tM106_9 ++ (tM106_10 ++ (tM106_11 ++ (tM106_12 ++ (tM106_13 ++ (tM106_14 ++ (tM106_15 ++ (tM106_16 ++ (tM106_17 ++ (tM106_18 ++ (tM106_19 ++ (tM106_20 ++ (tM106_21 ++ (tM106_22 ++ (tM106_23 ++ (tM106_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 106：区間 N 21・M 25。 -/
theorem pair106_ok : pairOk P pair106 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN106_0) (wseg_append (wseg_of sN106_1) (wseg_append (wseg_of sN106_2) (wseg_append (wseg_of sN106_3) (wseg_append (wseg_of sN106_4) (wseg_append (wseg_of sN106_5) (wseg_append (wseg_of sN106_6) (wseg_append (wseg_of sN106_7) (wseg_append (wseg_of sN106_8) (wseg_append (wseg_of sN106_9) (wseg_append (wseg_of sN106_10) (wseg_append (wseg_of sN106_11) (wseg_append (wseg_of sN106_12) (wseg_append (wseg_of sN106_13) (wseg_append (wseg_of sN106_14) (wseg_append (wseg_of sN106_15) (wseg_append (wseg_of sN106_16) (wseg_append (wseg_of sN106_17) (wseg_append (wseg_of sN106_18) (wseg_append (wseg_of sN106_19) (wseg_of sN106_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM106_0) (wseg_append (wseg_of sM106_1) (wseg_append (wseg_of sM106_2) (wseg_append (wseg_of sM106_3) (wseg_append (wseg_of sM106_4) (wseg_append (wseg_of sM106_5) (wseg_append (wseg_of sM106_6) (wseg_append (wseg_of sM106_7) (wseg_append (wseg_of sM106_8) (wseg_append (wseg_of sM106_9) (wseg_append (wseg_of sM106_10) (wseg_append (wseg_of sM106_11) (wseg_append (wseg_of sM106_12) (wseg_append (wseg_of sM106_13) (wseg_append (wseg_of sM106_14) (wseg_append (wseg_of sM106_15) (wseg_append (wseg_of sM106_16) (wseg_append (wseg_of sM106_17) (wseg_append (wseg_of sM106_18) (wseg_append (wseg_of sM106_19) (wseg_append (wseg_of sM106_20) (wseg_append (wseg_of sM106_21) (wseg_append (wseg_of sM106_22) (wseg_append (wseg_of sM106_23) (wseg_of sM106_24))))))))))))))))))))))))))

def pair107 : Pair where
  nb := nbN107
  kmNum := 104373
  kmDen := 4194304
  toksN := tN107_0 ++ (tN107_1 ++ (tN107_2 ++ (tN107_3 ++ (tN107_4 ++ (tN107_5 ++ (tN107_6 ++ (tN107_7 ++ (tN107_8 ++ (tN107_9 ++ (tN107_10 ++ (tN107_11 ++ (tN107_12 ++ (tN107_13 ++ (tN107_14 ++ (tN107_15 ++ (tN107_16 ++ (tN107_17 ++ (tN107_18 ++ (tN107_19 ++ (tN107_20 ++ (tN107_21 ++ (tN107_22 ++ (tN107_23 ++ (tN107_24 ++ (tN107_25)))))))))))))))))))))))))
  toksM := tM107_0 ++ (tM107_1 ++ (tM107_2 ++ (tM107_3 ++ (tM107_4 ++ (tM107_5 ++ (tM107_6 ++ (tM107_7 ++ (tM107_8 ++ (tM107_9 ++ (tM107_10 ++ (tM107_11 ++ (tM107_12 ++ (tM107_13 ++ (tM107_14 ++ (tM107_15 ++ (tM107_16 ++ (tM107_17 ++ (tM107_18 ++ (tM107_19 ++ (tM107_20 ++ (tM107_21 ++ (tM107_22 ++ (tM107_23 ++ (tM107_24 ++ (tM107_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 107：区間 N 26・M 26。 -/
theorem pair107_ok : pairOk P pair107 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN107_0) (wseg_append (wseg_of sN107_1) (wseg_append (wseg_of sN107_2) (wseg_append (wseg_of sN107_3) (wseg_append (wseg_of sN107_4) (wseg_append (wseg_of sN107_5) (wseg_append (wseg_of sN107_6) (wseg_append (wseg_of sN107_7) (wseg_append (wseg_of sN107_8) (wseg_append (wseg_of sN107_9) (wseg_append (wseg_of sN107_10) (wseg_append (wseg_of sN107_11) (wseg_append (wseg_of sN107_12) (wseg_append (wseg_of sN107_13) (wseg_append (wseg_of sN107_14) (wseg_append (wseg_of sN107_15) (wseg_append (wseg_of sN107_16) (wseg_append (wseg_of sN107_17) (wseg_append (wseg_of sN107_18) (wseg_append (wseg_of sN107_19) (wseg_append (wseg_of sN107_20) (wseg_append (wseg_of sN107_21) (wseg_append (wseg_of sN107_22) (wseg_append (wseg_of sN107_23) (wseg_append (wseg_of sN107_24) (wseg_of sN107_25)))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM107_0) (wseg_append (wseg_of sM107_1) (wseg_append (wseg_of sM107_2) (wseg_append (wseg_of sM107_3) (wseg_append (wseg_of sM107_4) (wseg_append (wseg_of sM107_5) (wseg_append (wseg_of sM107_6) (wseg_append (wseg_of sM107_7) (wseg_append (wseg_of sM107_8) (wseg_append (wseg_of sM107_9) (wseg_append (wseg_of sM107_10) (wseg_append (wseg_of sM107_11) (wseg_append (wseg_of sM107_12) (wseg_append (wseg_of sM107_13) (wseg_append (wseg_of sM107_14) (wseg_append (wseg_of sM107_15) (wseg_append (wseg_of sM107_16) (wseg_append (wseg_of sM107_17) (wseg_append (wseg_of sM107_18) (wseg_append (wseg_of sM107_19) (wseg_append (wseg_of sM107_20) (wseg_append (wseg_of sM107_21) (wseg_append (wseg_of sM107_22) (wseg_append (wseg_of sM107_23) (wseg_append (wseg_of sM107_24) (wseg_of sM107_25)))))))))))))))))))))))))))

end PackLean.D28.Cub
