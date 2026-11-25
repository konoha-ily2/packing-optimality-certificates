-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS014_0
import PackLean.D28.Cub.K.FarS014_1
import PackLean.D28.Cub.K.FarS014_2
import PackLean.D28.Cub.K.FarS014_3
import PackLean.D28.Cub.K.FarS014_4
import PackLean.D28.Cub.K.FarS014_5
import PackLean.D28.Cub.K.FarS014_6
import PackLean.D28.Cub.K.FarS014_7
import PackLean.D28.Cub.K.FarS014_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair047 : Pair where
  nb := nbN047
  kmNum := 18827
  kmDen := 2097152
  toksN := tN047_0 ++ (tN047_1 ++ (tN047_2 ++ (tN047_3 ++ (tN047_4 ++ (tN047_5 ++ (tN047_6 ++ (tN047_7 ++ (tN047_8 ++ (tN047_9 ++ (tN047_10 ++ (tN047_11 ++ (tN047_12 ++ (tN047_13 ++ (tN047_14 ++ (tN047_15 ++ (tN047_16 ++ (tN047_17 ++ (tN047_18 ++ (tN047_19 ++ (tN047_20))))))))))))))))))))
  toksM := tM047_0 ++ (tM047_1 ++ (tM047_2 ++ (tM047_3 ++ (tM047_4 ++ (tM047_5 ++ (tM047_6 ++ (tM047_7 ++ (tM047_8 ++ (tM047_9 ++ (tM047_10 ++ (tM047_11 ++ (tM047_12 ++ (tM047_13 ++ (tM047_14 ++ (tM047_15 ++ (tM047_16 ++ (tM047_17 ++ (tM047_18 ++ (tM047_19 ++ (tM047_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 047：区間 N 21・M 21。 -/
theorem pair047_ok : pairOk P pair047 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN047_0) (wseg_append (wseg_of sN047_1) (wseg_append (wseg_of sN047_2) (wseg_append (wseg_of sN047_3) (wseg_append (wseg_of sN047_4) (wseg_append (wseg_of sN047_5) (wseg_append (wseg_of sN047_6) (wseg_append (wseg_of sN047_7) (wseg_append (wseg_of sN047_8) (wseg_append (wseg_of sN047_9) (wseg_append (wseg_of sN047_10) (wseg_append (wseg_of sN047_11) (wseg_append (wseg_of sN047_12) (wseg_append (wseg_of sN047_13) (wseg_append (wseg_of sN047_14) (wseg_append (wseg_of sN047_15) (wseg_append (wseg_of sN047_16) (wseg_append (wseg_of sN047_17) (wseg_append (wseg_of sN047_18) (wseg_append (wseg_of sN047_19) (wseg_of sN047_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM047_0) (wseg_append (wseg_of sM047_1) (wseg_append (wseg_of sM047_2) (wseg_append (wseg_of sM047_3) (wseg_append (wseg_of sM047_4) (wseg_append (wseg_of sM047_5) (wseg_append (wseg_of sM047_6) (wseg_append (wseg_of sM047_7) (wseg_append (wseg_of sM047_8) (wseg_append (wseg_of sM047_9) (wseg_append (wseg_of sM047_10) (wseg_append (wseg_of sM047_11) (wseg_append (wseg_of sM047_12) (wseg_append (wseg_of sM047_13) (wseg_append (wseg_of sM047_14) (wseg_append (wseg_of sM047_15) (wseg_append (wseg_of sM047_16) (wseg_append (wseg_of sM047_17) (wseg_append (wseg_of sM047_18) (wseg_append (wseg_of sM047_19) (wseg_of sM047_20))))))))))))))))))))))

def pair048 : Pair where
  nb := nbN048
  kmNum := 363137
  kmDen := 16777216
  toksN := tN048_0 ++ (tN048_1 ++ (tN048_2 ++ (tN048_3 ++ (tN048_4 ++ (tN048_5 ++ (tN048_6 ++ (tN048_7 ++ (tN048_8 ++ (tN048_9 ++ (tN048_10 ++ (tN048_11 ++ (tN048_12 ++ (tN048_13 ++ (tN048_14 ++ (tN048_15 ++ (tN048_16 ++ (tN048_17 ++ (tN048_18))))))))))))))))))
  toksM := tM048_0 ++ (tM048_1 ++ (tM048_2 ++ (tM048_3 ++ (tM048_4 ++ (tM048_5 ++ (tM048_6 ++ (tM048_7 ++ (tM048_8 ++ (tM048_9 ++ (tM048_10 ++ (tM048_11 ++ (tM048_12 ++ (tM048_13 ++ (tM048_14 ++ (tM048_15 ++ (tM048_16 ++ (tM048_17 ++ (tM048_18 ++ (tM048_19 ++ (tM048_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 048：区間 N 19・M 21。 -/
theorem pair048_ok : pairOk P pair048 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN048_0) (wseg_append (wseg_of sN048_1) (wseg_append (wseg_of sN048_2) (wseg_append (wseg_of sN048_3) (wseg_append (wseg_of sN048_4) (wseg_append (wseg_of sN048_5) (wseg_append (wseg_of sN048_6) (wseg_append (wseg_of sN048_7) (wseg_append (wseg_of sN048_8) (wseg_append (wseg_of sN048_9) (wseg_append (wseg_of sN048_10) (wseg_append (wseg_of sN048_11) (wseg_append (wseg_of sN048_12) (wseg_append (wseg_of sN048_13) (wseg_append (wseg_of sN048_14) (wseg_append (wseg_of sN048_15) (wseg_append (wseg_of sN048_16) (wseg_append (wseg_of sN048_17) (wseg_of sN048_18))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM048_0) (wseg_append (wseg_of sM048_1) (wseg_append (wseg_of sM048_2) (wseg_append (wseg_of sM048_3) (wseg_append (wseg_of sM048_4) (wseg_append (wseg_of sM048_5) (wseg_append (wseg_of sM048_6) (wseg_append (wseg_of sM048_7) (wseg_append (wseg_of sM048_8) (wseg_append (wseg_of sM048_9) (wseg_append (wseg_of sM048_10) (wseg_append (wseg_of sM048_11) (wseg_append (wseg_of sM048_12) (wseg_append (wseg_of sM048_13) (wseg_append (wseg_of sM048_14) (wseg_append (wseg_of sM048_15) (wseg_append (wseg_of sM048_16) (wseg_append (wseg_of sM048_17) (wseg_append (wseg_of sM048_18) (wseg_append (wseg_of sM048_19) (wseg_of sM048_20))))))))))))))))))))))

def pair049 : Pair where
  nb := nbN049
  kmNum := 466159
  kmDen := 16777216
  toksN := tN049_0 ++ (tN049_1 ++ (tN049_2 ++ (tN049_3 ++ (tN049_4 ++ (tN049_5 ++ (tN049_6 ++ (tN049_7 ++ (tN049_8 ++ (tN049_9 ++ (tN049_10 ++ (tN049_11 ++ (tN049_12 ++ (tN049_13 ++ (tN049_14 ++ (tN049_15 ++ (tN049_16 ++ (tN049_17 ++ (tN049_18 ++ (tN049_19)))))))))))))))))))
  toksM := tM049_0 ++ (tM049_1 ++ (tM049_2 ++ (tM049_3 ++ (tM049_4 ++ (tM049_5 ++ (tM049_6 ++ (tM049_7 ++ (tM049_8 ++ (tM049_9 ++ (tM049_10 ++ (tM049_11 ++ (tM049_12 ++ (tM049_13 ++ (tM049_14 ++ (tM049_15 ++ (tM049_16 ++ (tM049_17 ++ (tM049_18 ++ (tM049_19 ++ (tM049_20 ++ (tM049_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 049：区間 N 20・M 22。 -/
theorem pair049_ok : pairOk P pair049 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN049_0) (wseg_append (wseg_of sN049_1) (wseg_append (wseg_of sN049_2) (wseg_append (wseg_of sN049_3) (wseg_append (wseg_of sN049_4) (wseg_append (wseg_of sN049_5) (wseg_append (wseg_of sN049_6) (wseg_append (wseg_of sN049_7) (wseg_append (wseg_of sN049_8) (wseg_append (wseg_of sN049_9) (wseg_append (wseg_of sN049_10) (wseg_append (wseg_of sN049_11) (wseg_append (wseg_of sN049_12) (wseg_append (wseg_of sN049_13) (wseg_append (wseg_of sN049_14) (wseg_append (wseg_of sN049_15) (wseg_append (wseg_of sN049_16) (wseg_append (wseg_of sN049_17) (wseg_append (wseg_of sN049_18) (wseg_of sN049_19)))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM049_0) (wseg_append (wseg_of sM049_1) (wseg_append (wseg_of sM049_2) (wseg_append (wseg_of sM049_3) (wseg_append (wseg_of sM049_4) (wseg_append (wseg_of sM049_5) (wseg_append (wseg_of sM049_6) (wseg_append (wseg_of sM049_7) (wseg_append (wseg_of sM049_8) (wseg_append (wseg_of sM049_9) (wseg_append (wseg_of sM049_10) (wseg_append (wseg_of sM049_11) (wseg_append (wseg_of sM049_12) (wseg_append (wseg_of sM049_13) (wseg_append (wseg_of sM049_14) (wseg_append (wseg_of sM049_15) (wseg_append (wseg_of sM049_16) (wseg_append (wseg_of sM049_17) (wseg_append (wseg_of sM049_18) (wseg_append (wseg_of sM049_19) (wseg_append (wseg_of sM049_20) (wseg_of sM049_21)))))))))))))))))))))))

end PackLean.D28.Cub
