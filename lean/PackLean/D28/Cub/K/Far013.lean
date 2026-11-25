-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS013_0
import PackLean.D28.Cub.K.FarS013_1
import PackLean.D28.Cub.K.FarS013_2
import PackLean.D28.Cub.K.FarS013_3
import PackLean.D28.Cub.K.FarS013_4
import PackLean.D28.Cub.K.FarS013_5
import PackLean.D28.Cub.K.FarS013_6
import PackLean.D28.Cub.K.FarS013_7
import PackLean.D28.Cub.K.FarS013_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair044 : Pair where
  nb := nbN044
  kmNum := 85117
  kmDen := 16777216
  toksN := tN044_0 ++ (tN044_1 ++ (tN044_2 ++ (tN044_3 ++ (tN044_4 ++ (tN044_5 ++ (tN044_6 ++ (tN044_7 ++ (tN044_8 ++ (tN044_9 ++ (tN044_10 ++ (tN044_11 ++ (tN044_12 ++ (tN044_13 ++ (tN044_14 ++ (tN044_15 ++ (tN044_16 ++ (tN044_17 ++ (tN044_18 ++ (tN044_19)))))))))))))))))))
  toksM := tM044_0 ++ (tM044_1 ++ (tM044_2 ++ (tM044_3 ++ (tM044_4 ++ (tM044_5 ++ (tM044_6 ++ (tM044_7 ++ (tM044_8 ++ (tM044_9 ++ (tM044_10 ++ (tM044_11 ++ (tM044_12 ++ (tM044_13 ++ (tM044_14 ++ (tM044_15 ++ (tM044_16 ++ (tM044_17 ++ (tM044_18 ++ (tM044_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 044：区間 N 20・M 20。 -/
theorem pair044_ok : pairOk P pair044 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN044_0) (wseg_append (wseg_of sN044_1) (wseg_append (wseg_of sN044_2) (wseg_append (wseg_of sN044_3) (wseg_append (wseg_of sN044_4) (wseg_append (wseg_of sN044_5) (wseg_append (wseg_of sN044_6) (wseg_append (wseg_of sN044_7) (wseg_append (wseg_of sN044_8) (wseg_append (wseg_of sN044_9) (wseg_append (wseg_of sN044_10) (wseg_append (wseg_of sN044_11) (wseg_append (wseg_of sN044_12) (wseg_append (wseg_of sN044_13) (wseg_append (wseg_of sN044_14) (wseg_append (wseg_of sN044_15) (wseg_append (wseg_of sN044_16) (wseg_append (wseg_of sN044_17) (wseg_append (wseg_of sN044_18) (wseg_of sN044_19)))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM044_0) (wseg_append (wseg_of sM044_1) (wseg_append (wseg_of sM044_2) (wseg_append (wseg_of sM044_3) (wseg_append (wseg_of sM044_4) (wseg_append (wseg_of sM044_5) (wseg_append (wseg_of sM044_6) (wseg_append (wseg_of sM044_7) (wseg_append (wseg_of sM044_8) (wseg_append (wseg_of sM044_9) (wseg_append (wseg_of sM044_10) (wseg_append (wseg_of sM044_11) (wseg_append (wseg_of sM044_12) (wseg_append (wseg_of sM044_13) (wseg_append (wseg_of sM044_14) (wseg_append (wseg_of sM044_15) (wseg_append (wseg_of sM044_16) (wseg_append (wseg_of sM044_17) (wseg_append (wseg_of sM044_18) (wseg_of sM044_19)))))))))))))))))))))

def pair045 : Pair where
  nb := nbN045
  kmNum := 117345
  kmDen := 8388608
  toksN := tN045_0 ++ (tN045_1 ++ (tN045_2 ++ (tN045_3 ++ (tN045_4 ++ (tN045_5 ++ (tN045_6 ++ (tN045_7 ++ (tN045_8 ++ (tN045_9 ++ (tN045_10 ++ (tN045_11 ++ (tN045_12 ++ (tN045_13 ++ (tN045_14 ++ (tN045_15 ++ (tN045_16 ++ (tN045_17 ++ (tN045_18 ++ (tN045_19)))))))))))))))))))
  toksM := tM045_0 ++ (tM045_1 ++ (tM045_2 ++ (tM045_3 ++ (tM045_4 ++ (tM045_5 ++ (tM045_6 ++ (tM045_7 ++ (tM045_8 ++ (tM045_9 ++ (tM045_10 ++ (tM045_11 ++ (tM045_12 ++ (tM045_13 ++ (tM045_14 ++ (tM045_15 ++ (tM045_16 ++ (tM045_17 ++ (tM045_18 ++ (tM045_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 045：区間 N 20・M 20。 -/
theorem pair045_ok : pairOk P pair045 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN045_0) (wseg_append (wseg_of sN045_1) (wseg_append (wseg_of sN045_2) (wseg_append (wseg_of sN045_3) (wseg_append (wseg_of sN045_4) (wseg_append (wseg_of sN045_5) (wseg_append (wseg_of sN045_6) (wseg_append (wseg_of sN045_7) (wseg_append (wseg_of sN045_8) (wseg_append (wseg_of sN045_9) (wseg_append (wseg_of sN045_10) (wseg_append (wseg_of sN045_11) (wseg_append (wseg_of sN045_12) (wseg_append (wseg_of sN045_13) (wseg_append (wseg_of sN045_14) (wseg_append (wseg_of sN045_15) (wseg_append (wseg_of sN045_16) (wseg_append (wseg_of sN045_17) (wseg_append (wseg_of sN045_18) (wseg_of sN045_19)))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM045_0) (wseg_append (wseg_of sM045_1) (wseg_append (wseg_of sM045_2) (wseg_append (wseg_of sM045_3) (wseg_append (wseg_of sM045_4) (wseg_append (wseg_of sM045_5) (wseg_append (wseg_of sM045_6) (wseg_append (wseg_of sM045_7) (wseg_append (wseg_of sM045_8) (wseg_append (wseg_of sM045_9) (wseg_append (wseg_of sM045_10) (wseg_append (wseg_of sM045_11) (wseg_append (wseg_of sM045_12) (wseg_append (wseg_of sM045_13) (wseg_append (wseg_of sM045_14) (wseg_append (wseg_of sM045_15) (wseg_append (wseg_of sM045_16) (wseg_append (wseg_of sM045_17) (wseg_append (wseg_of sM045_18) (wseg_of sM045_19)))))))))))))))))))))

def pair046 : Pair where
  nb := nbN046
  kmNum := 31279
  kmDen := 16777216
  toksN := tN046_0 ++ (tN046_1 ++ (tN046_2 ++ (tN046_3 ++ (tN046_4 ++ (tN046_5 ++ (tN046_6 ++ (tN046_7 ++ (tN046_8 ++ (tN046_9 ++ (tN046_10 ++ (tN046_11 ++ (tN046_12 ++ (tN046_13 ++ (tN046_14 ++ (tN046_15 ++ (tN046_16 ++ (tN046_17 ++ (tN046_18 ++ (tN046_19 ++ (tN046_20))))))))))))))))))))
  toksM := tM046_0 ++ (tM046_1 ++ (tM046_2 ++ (tM046_3 ++ (tM046_4 ++ (tM046_5 ++ (tM046_6 ++ (tM046_7 ++ (tM046_8 ++ (tM046_9 ++ (tM046_10 ++ (tM046_11 ++ (tM046_12 ++ (tM046_13 ++ (tM046_14 ++ (tM046_15 ++ (tM046_16 ++ (tM046_17 ++ (tM046_18 ++ (tM046_19 ++ (tM046_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 046：区間 N 21・M 21。 -/
theorem pair046_ok : pairOk P pair046 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN046_0) (wseg_append (wseg_of sN046_1) (wseg_append (wseg_of sN046_2) (wseg_append (wseg_of sN046_3) (wseg_append (wseg_of sN046_4) (wseg_append (wseg_of sN046_5) (wseg_append (wseg_of sN046_6) (wseg_append (wseg_of sN046_7) (wseg_append (wseg_of sN046_8) (wseg_append (wseg_of sN046_9) (wseg_append (wseg_of sN046_10) (wseg_append (wseg_of sN046_11) (wseg_append (wseg_of sN046_12) (wseg_append (wseg_of sN046_13) (wseg_append (wseg_of sN046_14) (wseg_append (wseg_of sN046_15) (wseg_append (wseg_of sN046_16) (wseg_append (wseg_of sN046_17) (wseg_append (wseg_of sN046_18) (wseg_append (wseg_of sN046_19) (wseg_of sN046_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM046_0) (wseg_append (wseg_of sM046_1) (wseg_append (wseg_of sM046_2) (wseg_append (wseg_of sM046_3) (wseg_append (wseg_of sM046_4) (wseg_append (wseg_of sM046_5) (wseg_append (wseg_of sM046_6) (wseg_append (wseg_of sM046_7) (wseg_append (wseg_of sM046_8) (wseg_append (wseg_of sM046_9) (wseg_append (wseg_of sM046_10) (wseg_append (wseg_of sM046_11) (wseg_append (wseg_of sM046_12) (wseg_append (wseg_of sM046_13) (wseg_append (wseg_of sM046_14) (wseg_append (wseg_of sM046_15) (wseg_append (wseg_of sM046_16) (wseg_append (wseg_of sM046_17) (wseg_append (wseg_of sM046_18) (wseg_append (wseg_of sM046_19) (wseg_of sM046_20))))))))))))))))))))))

end PackLean.D28.Cub
