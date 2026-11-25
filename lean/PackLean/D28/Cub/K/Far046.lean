-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS046_0
import PackLean.D28.Cub.K.FarS046_1
import PackLean.D28.Cub.K.FarS046_2
import PackLean.D28.Cub.K.FarS046_3
import PackLean.D28.Cub.K.FarS046_4
import PackLean.D28.Cub.K.FarS046_5
import PackLean.D28.Cub.K.FarS046_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair112 : Pair where
  nb := nbN112
  kmNum := 1043571
  kmDen := 16777216
  toksN := tN112_0 ++ (tN112_1 ++ (tN112_2 ++ (tN112_3 ++ (tN112_4 ++ (tN112_5 ++ (tN112_6 ++ (tN112_7 ++ (tN112_8 ++ (tN112_9 ++ (tN112_10 ++ (tN112_11 ++ (tN112_12 ++ (tN112_13 ++ (tN112_14 ++ (tN112_15 ++ (tN112_16 ++ (tN112_17 ++ (tN112_18 ++ (tN112_19 ++ (tN112_20))))))))))))))))))))
  toksM := tM112_0 ++ (tM112_1 ++ (tM112_2 ++ (tM112_3 ++ (tM112_4 ++ (tM112_5 ++ (tM112_6 ++ (tM112_7 ++ (tM112_8 ++ (tM112_9 ++ (tM112_10 ++ (tM112_11 ++ (tM112_12 ++ (tM112_13 ++ (tM112_14 ++ (tM112_15 ++ (tM112_16 ++ (tM112_17 ++ (tM112_18 ++ (tM112_19 ++ (tM112_20 ++ (tM112_21 ++ (tM112_22 ++ (tM112_23 ++ (tM112_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 112：区間 N 21・M 25。 -/
theorem pair112_ok : pairOk P pair112 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN112_0) (wseg_append (wseg_of sN112_1) (wseg_append (wseg_of sN112_2) (wseg_append (wseg_of sN112_3) (wseg_append (wseg_of sN112_4) (wseg_append (wseg_of sN112_5) (wseg_append (wseg_of sN112_6) (wseg_append (wseg_of sN112_7) (wseg_append (wseg_of sN112_8) (wseg_append (wseg_of sN112_9) (wseg_append (wseg_of sN112_10) (wseg_append (wseg_of sN112_11) (wseg_append (wseg_of sN112_12) (wseg_append (wseg_of sN112_13) (wseg_append (wseg_of sN112_14) (wseg_append (wseg_of sN112_15) (wseg_append (wseg_of sN112_16) (wseg_append (wseg_of sN112_17) (wseg_append (wseg_of sN112_18) (wseg_append (wseg_of sN112_19) (wseg_of sN112_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM112_0) (wseg_append (wseg_of sM112_1) (wseg_append (wseg_of sM112_2) (wseg_append (wseg_of sM112_3) (wseg_append (wseg_of sM112_4) (wseg_append (wseg_of sM112_5) (wseg_append (wseg_of sM112_6) (wseg_append (wseg_of sM112_7) (wseg_append (wseg_of sM112_8) (wseg_append (wseg_of sM112_9) (wseg_append (wseg_of sM112_10) (wseg_append (wseg_of sM112_11) (wseg_append (wseg_of sM112_12) (wseg_append (wseg_of sM112_13) (wseg_append (wseg_of sM112_14) (wseg_append (wseg_of sM112_15) (wseg_append (wseg_of sM112_16) (wseg_append (wseg_of sM112_17) (wseg_append (wseg_of sM112_18) (wseg_append (wseg_of sM112_19) (wseg_append (wseg_of sM112_20) (wseg_append (wseg_of sM112_21) (wseg_append (wseg_of sM112_22) (wseg_append (wseg_of sM112_23) (wseg_of sM112_24))))))))))))))))))))))))))

def pair113 : Pair where
  nb := nbN113
  kmNum := 765385
  kmDen := 16777216
  toksN := tN113_0 ++ (tN113_1 ++ (tN113_2 ++ (tN113_3 ++ (tN113_4 ++ (tN113_5 ++ (tN113_6 ++ (tN113_7 ++ (tN113_8 ++ (tN113_9 ++ (tN113_10 ++ (tN113_11 ++ (tN113_12 ++ (tN113_13 ++ (tN113_14 ++ (tN113_15 ++ (tN113_16 ++ (tN113_17 ++ (tN113_18 ++ (tN113_19 ++ (tN113_20 ++ (tN113_21 ++ (tN113_22))))))))))))))))))))))
  toksM := tM113_0 ++ (tM113_1 ++ (tM113_2 ++ (tM113_3 ++ (tM113_4 ++ (tM113_5 ++ (tM113_6 ++ (tM113_7 ++ (tM113_8 ++ (tM113_9 ++ (tM113_10 ++ (tM113_11 ++ (tM113_12 ++ (tM113_13 ++ (tM113_14 ++ (tM113_15 ++ (tM113_16 ++ (tM113_17 ++ (tM113_18 ++ (tM113_19 ++ (tM113_20 ++ (tM113_21 ++ (tM113_22 ++ (tM113_23 ++ (tM113_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 113：区間 N 23・M 25。 -/
theorem pair113_ok : pairOk P pair113 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN113_0) (wseg_append (wseg_of sN113_1) (wseg_append (wseg_of sN113_2) (wseg_append (wseg_of sN113_3) (wseg_append (wseg_of sN113_4) (wseg_append (wseg_of sN113_5) (wseg_append (wseg_of sN113_6) (wseg_append (wseg_of sN113_7) (wseg_append (wseg_of sN113_8) (wseg_append (wseg_of sN113_9) (wseg_append (wseg_of sN113_10) (wseg_append (wseg_of sN113_11) (wseg_append (wseg_of sN113_12) (wseg_append (wseg_of sN113_13) (wseg_append (wseg_of sN113_14) (wseg_append (wseg_of sN113_15) (wseg_append (wseg_of sN113_16) (wseg_append (wseg_of sN113_17) (wseg_append (wseg_of sN113_18) (wseg_append (wseg_of sN113_19) (wseg_append (wseg_of sN113_20) (wseg_append (wseg_of sN113_21) (wseg_of sN113_22))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM113_0) (wseg_append (wseg_of sM113_1) (wseg_append (wseg_of sM113_2) (wseg_append (wseg_of sM113_3) (wseg_append (wseg_of sM113_4) (wseg_append (wseg_of sM113_5) (wseg_append (wseg_of sM113_6) (wseg_append (wseg_of sM113_7) (wseg_append (wseg_of sM113_8) (wseg_append (wseg_of sM113_9) (wseg_append (wseg_of sM113_10) (wseg_append (wseg_of sM113_11) (wseg_append (wseg_of sM113_12) (wseg_append (wseg_of sM113_13) (wseg_append (wseg_of sM113_14) (wseg_append (wseg_of sM113_15) (wseg_append (wseg_of sM113_16) (wseg_append (wseg_of sM113_17) (wseg_append (wseg_of sM113_18) (wseg_append (wseg_of sM113_19) (wseg_append (wseg_of sM113_20) (wseg_append (wseg_of sM113_21) (wseg_append (wseg_of sM113_22) (wseg_append (wseg_of sM113_23) (wseg_of sM113_24))))))))))))))))))))))))))

end PackLean.D28.Cub
