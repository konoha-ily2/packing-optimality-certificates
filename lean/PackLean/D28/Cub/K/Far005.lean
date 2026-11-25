-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS005_0
import PackLean.D28.Cub.K.FarS005_1
import PackLean.D28.Cub.K.FarS005_2
import PackLean.D28.Cub.K.FarS005_3
import PackLean.D28.Cub.K.FarS005_4
import PackLean.D28.Cub.K.FarS005_5
import PackLean.D28.Cub.K.FarS005_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair020 : Pair where
  nb := nbN020
  kmNum := 27
  kmDen := 1024
  toksN := tN020_0 ++ (tN020_1 ++ (tN020_2 ++ (tN020_3 ++ (tN020_4 ++ (tN020_5 ++ (tN020_6 ++ (tN020_7 ++ (tN020_8 ++ (tN020_9 ++ (tN020_10 ++ (tN020_11 ++ (tN020_12 ++ (tN020_13 ++ (tN020_14))))))))))))))
  toksM := tM020_0 ++ (tM020_1 ++ (tM020_2 ++ (tM020_3 ++ (tM020_4 ++ (tM020_5 ++ (tM020_6 ++ (tM020_7 ++ (tM020_8 ++ (tM020_9 ++ (tM020_10 ++ (tM020_11 ++ (tM020_12 ++ (tM020_13 ++ (tM020_14 ++ (tM020_15 ++ (tM020_16 ++ (tM020_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 020：区間 N 15・M 18。 -/
theorem pair020_ok : pairOk P pair020 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN020_0) (wseg_append (wseg_of sN020_1) (wseg_append (wseg_of sN020_2) (wseg_append (wseg_of sN020_3) (wseg_append (wseg_of sN020_4) (wseg_append (wseg_of sN020_5) (wseg_append (wseg_of sN020_6) (wseg_append (wseg_of sN020_7) (wseg_append (wseg_of sN020_8) (wseg_append (wseg_of sN020_9) (wseg_append (wseg_of sN020_10) (wseg_append (wseg_of sN020_11) (wseg_append (wseg_of sN020_12) (wseg_append (wseg_of sN020_13) (wseg_of sN020_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM020_0) (wseg_append (wseg_of sM020_1) (wseg_append (wseg_of sM020_2) (wseg_append (wseg_of sM020_3) (wseg_append (wseg_of sM020_4) (wseg_append (wseg_of sM020_5) (wseg_append (wseg_of sM020_6) (wseg_append (wseg_of sM020_7) (wseg_append (wseg_of sM020_8) (wseg_append (wseg_of sM020_9) (wseg_append (wseg_of sM020_10) (wseg_append (wseg_of sM020_11) (wseg_append (wseg_of sM020_12) (wseg_append (wseg_of sM020_13) (wseg_append (wseg_of sM020_14) (wseg_append (wseg_of sM020_15) (wseg_append (wseg_of sM020_16) (wseg_of sM020_17)))))))))))))))))))

def pair021 : Pair where
  nb := nbN021
  kmNum := 275549
  kmDen := 8388608
  toksN := tN021_0 ++ (tN021_1 ++ (tN021_2 ++ (tN021_3 ++ (tN021_4 ++ (tN021_5 ++ (tN021_6 ++ (tN021_7 ++ (tN021_8 ++ (tN021_9 ++ (tN021_10 ++ (tN021_11 ++ (tN021_12 ++ (tN021_13 ++ (tN021_14))))))))))))))
  toksM := tM021_0 ++ (tM021_1 ++ (tM021_2 ++ (tM021_3 ++ (tM021_4 ++ (tM021_5 ++ (tM021_6 ++ (tM021_7 ++ (tM021_8 ++ (tM021_9 ++ (tM021_10 ++ (tM021_11 ++ (tM021_12 ++ (tM021_13 ++ (tM021_14 ++ (tM021_15 ++ (tM021_16 ++ (tM021_17 ++ (tM021_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 021：区間 N 15・M 19。 -/
theorem pair021_ok : pairOk P pair021 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN021_0) (wseg_append (wseg_of sN021_1) (wseg_append (wseg_of sN021_2) (wseg_append (wseg_of sN021_3) (wseg_append (wseg_of sN021_4) (wseg_append (wseg_of sN021_5) (wseg_append (wseg_of sN021_6) (wseg_append (wseg_of sN021_7) (wseg_append (wseg_of sN021_8) (wseg_append (wseg_of sN021_9) (wseg_append (wseg_of sN021_10) (wseg_append (wseg_of sN021_11) (wseg_append (wseg_of sN021_12) (wseg_append (wseg_of sN021_13) (wseg_of sN021_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM021_0) (wseg_append (wseg_of sM021_1) (wseg_append (wseg_of sM021_2) (wseg_append (wseg_of sM021_3) (wseg_append (wseg_of sM021_4) (wseg_append (wseg_of sM021_5) (wseg_append (wseg_of sM021_6) (wseg_append (wseg_of sM021_7) (wseg_append (wseg_of sM021_8) (wseg_append (wseg_of sM021_9) (wseg_append (wseg_of sM021_10) (wseg_append (wseg_of sM021_11) (wseg_append (wseg_of sM021_12) (wseg_append (wseg_of sM021_13) (wseg_append (wseg_of sM021_14) (wseg_append (wseg_of sM021_15) (wseg_append (wseg_of sM021_16) (wseg_append (wseg_of sM021_17) (wseg_of sM021_18))))))))))))))))))))

def pair022 : Pair where
  nb := nbN022
  kmNum := 74495
  kmDen := 8388608
  toksN := tN022_0 ++ (tN022_1 ++ (tN022_2 ++ (tN022_3 ++ (tN022_4 ++ (tN022_5 ++ (tN022_6 ++ (tN022_7 ++ (tN022_8 ++ (tN022_9 ++ (tN022_10 ++ (tN022_11 ++ (tN022_12 ++ (tN022_13 ++ (tN022_14 ++ (tN022_15 ++ (tN022_16))))))))))))))))
  toksM := tM022_0 ++ (tM022_1 ++ (tM022_2 ++ (tM022_3 ++ (tM022_4 ++ (tM022_5 ++ (tM022_6 ++ (tM022_7 ++ (tM022_8 ++ (tM022_9 ++ (tM022_10 ++ (tM022_11 ++ (tM022_12 ++ (tM022_13 ++ (tM022_14 ++ (tM022_15 ++ (tM022_16 ++ (tM022_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 022：区間 N 17・M 18。 -/
theorem pair022_ok : pairOk P pair022 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN022_0) (wseg_append (wseg_of sN022_1) (wseg_append (wseg_of sN022_2) (wseg_append (wseg_of sN022_3) (wseg_append (wseg_of sN022_4) (wseg_append (wseg_of sN022_5) (wseg_append (wseg_of sN022_6) (wseg_append (wseg_of sN022_7) (wseg_append (wseg_of sN022_8) (wseg_append (wseg_of sN022_9) (wseg_append (wseg_of sN022_10) (wseg_append (wseg_of sN022_11) (wseg_append (wseg_of sN022_12) (wseg_append (wseg_of sN022_13) (wseg_append (wseg_of sN022_14) (wseg_append (wseg_of sN022_15) (wseg_of sN022_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM022_0) (wseg_append (wseg_of sM022_1) (wseg_append (wseg_of sM022_2) (wseg_append (wseg_of sM022_3) (wseg_append (wseg_of sM022_4) (wseg_append (wseg_of sM022_5) (wseg_append (wseg_of sM022_6) (wseg_append (wseg_of sM022_7) (wseg_append (wseg_of sM022_8) (wseg_append (wseg_of sM022_9) (wseg_append (wseg_of sM022_10) (wseg_append (wseg_of sM022_11) (wseg_append (wseg_of sM022_12) (wseg_append (wseg_of sM022_13) (wseg_append (wseg_of sM022_14) (wseg_append (wseg_of sM022_15) (wseg_append (wseg_of sM022_16) (wseg_of sM022_17)))))))))))))))))))

end PackLean.D28.Cub
