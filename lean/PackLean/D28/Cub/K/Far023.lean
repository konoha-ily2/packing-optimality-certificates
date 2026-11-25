-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS023_0
import PackLean.D28.Cub.K.FarS023_1
import PackLean.D28.Cub.K.FarS023_2
import PackLean.D28.Cub.K.FarS023_3
import PackLean.D28.Cub.K.FarS023_4
import PackLean.D28.Cub.K.FarS023_5
import PackLean.D28.Cub.K.FarS023_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair067 : Pair where
  nb := nbN067
  kmNum := 618367
  kmDen := 8388608
  toksN := tN067_0 ++ (tN067_1 ++ (tN067_2 ++ (tN067_3 ++ (tN067_4 ++ (tN067_5 ++ (tN067_6 ++ (tN067_7 ++ (tN067_8 ++ (tN067_9 ++ (tN067_10 ++ (tN067_11 ++ (tN067_12 ++ (tN067_13 ++ (tN067_14 ++ (tN067_15 ++ (tN067_16 ++ (tN067_17)))))))))))))))))
  toksM := tM067_0 ++ (tM067_1 ++ (tM067_2 ++ (tM067_3 ++ (tM067_4 ++ (tM067_5 ++ (tM067_6 ++ (tM067_7 ++ (tM067_8 ++ (tM067_9 ++ (tM067_10 ++ (tM067_11 ++ (tM067_12 ++ (tM067_13 ++ (tM067_14 ++ (tM067_15 ++ (tM067_16 ++ (tM067_17 ++ (tM067_18 ++ (tM067_19 ++ (tM067_20 ++ (tM067_21 ++ (tM067_22 ++ (tM067_23 ++ (tM067_24 ++ (tM067_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 067：区間 N 18・M 26。 -/
theorem pair067_ok : pairOk P pair067 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN067_0) (wseg_append (wseg_of sN067_1) (wseg_append (wseg_of sN067_2) (wseg_append (wseg_of sN067_3) (wseg_append (wseg_of sN067_4) (wseg_append (wseg_of sN067_5) (wseg_append (wseg_of sN067_6) (wseg_append (wseg_of sN067_7) (wseg_append (wseg_of sN067_8) (wseg_append (wseg_of sN067_9) (wseg_append (wseg_of sN067_10) (wseg_append (wseg_of sN067_11) (wseg_append (wseg_of sN067_12) (wseg_append (wseg_of sN067_13) (wseg_append (wseg_of sN067_14) (wseg_append (wseg_of sN067_15) (wseg_append (wseg_of sN067_16) (wseg_of sN067_17)))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM067_0) (wseg_append (wseg_of sM067_1) (wseg_append (wseg_of sM067_2) (wseg_append (wseg_of sM067_3) (wseg_append (wseg_of sM067_4) (wseg_append (wseg_of sM067_5) (wseg_append (wseg_of sM067_6) (wseg_append (wseg_of sM067_7) (wseg_append (wseg_of sM067_8) (wseg_append (wseg_of sM067_9) (wseg_append (wseg_of sM067_10) (wseg_append (wseg_of sM067_11) (wseg_append (wseg_of sM067_12) (wseg_append (wseg_of sM067_13) (wseg_append (wseg_of sM067_14) (wseg_append (wseg_of sM067_15) (wseg_append (wseg_of sM067_16) (wseg_append (wseg_of sM067_17) (wseg_append (wseg_of sM067_18) (wseg_append (wseg_of sM067_19) (wseg_append (wseg_of sM067_20) (wseg_append (wseg_of sM067_21) (wseg_append (wseg_of sM067_22) (wseg_append (wseg_of sM067_23) (wseg_append (wseg_of sM067_24) (wseg_of sM067_25)))))))))))))))))))))))))))

def pair068 : Pair where
  nb := nbN068
  kmNum := 353063
  kmDen := 8388608
  toksN := tN068_0 ++ (tN068_1 ++ (tN068_2 ++ (tN068_3 ++ (tN068_4 ++ (tN068_5 ++ (tN068_6 ++ (tN068_7 ++ (tN068_8 ++ (tN068_9 ++ (tN068_10 ++ (tN068_11 ++ (tN068_12 ++ (tN068_13 ++ (tN068_14 ++ (tN068_15 ++ (tN068_16 ++ (tN068_17 ++ (tN068_18 ++ (tN068_19 ++ (tN068_20))))))))))))))))))))
  toksM := tM068_0 ++ (tM068_1 ++ (tM068_2 ++ (tM068_3 ++ (tM068_4 ++ (tM068_5 ++ (tM068_6 ++ (tM068_7 ++ (tM068_8 ++ (tM068_9 ++ (tM068_10 ++ (tM068_11 ++ (tM068_12 ++ (tM068_13 ++ (tM068_14 ++ (tM068_15 ++ (tM068_16 ++ (tM068_17 ++ (tM068_18 ++ (tM068_19 ++ (tM068_20 ++ (tM068_21 ++ (tM068_22 ++ (tM068_23 ++ (tM068_24 ++ (tM068_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 068：区間 N 21・M 26。 -/
theorem pair068_ok : pairOk P pair068 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN068_0) (wseg_append (wseg_of sN068_1) (wseg_append (wseg_of sN068_2) (wseg_append (wseg_of sN068_3) (wseg_append (wseg_of sN068_4) (wseg_append (wseg_of sN068_5) (wseg_append (wseg_of sN068_6) (wseg_append (wseg_of sN068_7) (wseg_append (wseg_of sN068_8) (wseg_append (wseg_of sN068_9) (wseg_append (wseg_of sN068_10) (wseg_append (wseg_of sN068_11) (wseg_append (wseg_of sN068_12) (wseg_append (wseg_of sN068_13) (wseg_append (wseg_of sN068_14) (wseg_append (wseg_of sN068_15) (wseg_append (wseg_of sN068_16) (wseg_append (wseg_of sN068_17) (wseg_append (wseg_of sN068_18) (wseg_append (wseg_of sN068_19) (wseg_of sN068_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM068_0) (wseg_append (wseg_of sM068_1) (wseg_append (wseg_of sM068_2) (wseg_append (wseg_of sM068_3) (wseg_append (wseg_of sM068_4) (wseg_append (wseg_of sM068_5) (wseg_append (wseg_of sM068_6) (wseg_append (wseg_of sM068_7) (wseg_append (wseg_of sM068_8) (wseg_append (wseg_of sM068_9) (wseg_append (wseg_of sM068_10) (wseg_append (wseg_of sM068_11) (wseg_append (wseg_of sM068_12) (wseg_append (wseg_of sM068_13) (wseg_append (wseg_of sM068_14) (wseg_append (wseg_of sM068_15) (wseg_append (wseg_of sM068_16) (wseg_append (wseg_of sM068_17) (wseg_append (wseg_of sM068_18) (wseg_append (wseg_of sM068_19) (wseg_append (wseg_of sM068_20) (wseg_append (wseg_of sM068_21) (wseg_append (wseg_of sM068_22) (wseg_append (wseg_of sM068_23) (wseg_append (wseg_of sM068_24) (wseg_of sM068_25)))))))))))))))))))))))))))

end PackLean.D28.Cub
