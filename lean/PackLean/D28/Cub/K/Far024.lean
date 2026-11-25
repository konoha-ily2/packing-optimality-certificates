-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS024_0
import PackLean.D28.Cub.K.FarS024_1
import PackLean.D28.Cub.K.FarS024_2
import PackLean.D28.Cub.K.FarS024_3
import PackLean.D28.Cub.K.FarS024_4
import PackLean.D28.Cub.K.FarS024_5
import PackLean.D28.Cub.K.FarS024_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair069 : Pair where
  nb := nbN069
  kmNum := 439639
  kmDen := 8388608
  toksN := tN069_0 ++ (tN069_1 ++ (tN069_2 ++ (tN069_3 ++ (tN069_4 ++ (tN069_5 ++ (tN069_6 ++ (tN069_7 ++ (tN069_8 ++ (tN069_9 ++ (tN069_10 ++ (tN069_11 ++ (tN069_12 ++ (tN069_13 ++ (tN069_14 ++ (tN069_15 ++ (tN069_16 ++ (tN069_17 ++ (tN069_18 ++ (tN069_19 ++ (tN069_20))))))))))))))))))))
  toksM := tM069_0 ++ (tM069_1 ++ (tM069_2 ++ (tM069_3 ++ (tM069_4 ++ (tM069_5 ++ (tM069_6 ++ (tM069_7 ++ (tM069_8 ++ (tM069_9 ++ (tM069_10 ++ (tM069_11 ++ (tM069_12 ++ (tM069_13 ++ (tM069_14 ++ (tM069_15 ++ (tM069_16 ++ (tM069_17 ++ (tM069_18 ++ (tM069_19 ++ (tM069_20 ++ (tM069_21 ++ (tM069_22 ++ (tM069_23 ++ (tM069_24 ++ (tM069_25 ++ (tM069_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 069：区間 N 21・M 27。 -/
theorem pair069_ok : pairOk P pair069 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN069_0) (wseg_append (wseg_of sN069_1) (wseg_append (wseg_of sN069_2) (wseg_append (wseg_of sN069_3) (wseg_append (wseg_of sN069_4) (wseg_append (wseg_of sN069_5) (wseg_append (wseg_of sN069_6) (wseg_append (wseg_of sN069_7) (wseg_append (wseg_of sN069_8) (wseg_append (wseg_of sN069_9) (wseg_append (wseg_of sN069_10) (wseg_append (wseg_of sN069_11) (wseg_append (wseg_of sN069_12) (wseg_append (wseg_of sN069_13) (wseg_append (wseg_of sN069_14) (wseg_append (wseg_of sN069_15) (wseg_append (wseg_of sN069_16) (wseg_append (wseg_of sN069_17) (wseg_append (wseg_of sN069_18) (wseg_append (wseg_of sN069_19) (wseg_of sN069_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM069_0) (wseg_append (wseg_of sM069_1) (wseg_append (wseg_of sM069_2) (wseg_append (wseg_of sM069_3) (wseg_append (wseg_of sM069_4) (wseg_append (wseg_of sM069_5) (wseg_append (wseg_of sM069_6) (wseg_append (wseg_of sM069_7) (wseg_append (wseg_of sM069_8) (wseg_append (wseg_of sM069_9) (wseg_append (wseg_of sM069_10) (wseg_append (wseg_of sM069_11) (wseg_append (wseg_of sM069_12) (wseg_append (wseg_of sM069_13) (wseg_append (wseg_of sM069_14) (wseg_append (wseg_of sM069_15) (wseg_append (wseg_of sM069_16) (wseg_append (wseg_of sM069_17) (wseg_append (wseg_of sM069_18) (wseg_append (wseg_of sM069_19) (wseg_append (wseg_of sM069_20) (wseg_append (wseg_of sM069_21) (wseg_append (wseg_of sM069_22) (wseg_append (wseg_of sM069_23) (wseg_append (wseg_of sM069_24) (wseg_append (wseg_of sM069_25) (wseg_of sM069_26))))))))))))))))))))))))))))

def pair070 : Pair where
  nb := nbN070
  kmNum := 602257
  kmDen := 16777216
  toksN := tN070_0 ++ (tN070_1 ++ (tN070_2 ++ (tN070_3 ++ (tN070_4 ++ (tN070_5 ++ (tN070_6 ++ (tN070_7 ++ (tN070_8 ++ (tN070_9 ++ (tN070_10 ++ (tN070_11 ++ (tN070_12 ++ (tN070_13 ++ (tN070_14 ++ (tN070_15 ++ (tN070_16 ++ (tN070_17 ++ (tN070_18 ++ (tN070_19 ++ (tN070_20 ++ (tN070_21 ++ (tN070_22 ++ (tN070_23)))))))))))))))))))))))
  toksM := tM070_0 ++ (tM070_1 ++ (tM070_2 ++ (tM070_3 ++ (tM070_4 ++ (tM070_5 ++ (tM070_6 ++ (tM070_7 ++ (tM070_8 ++ (tM070_9 ++ (tM070_10 ++ (tM070_11 ++ (tM070_12 ++ (tM070_13 ++ (tM070_14 ++ (tM070_15 ++ (tM070_16 ++ (tM070_17 ++ (tM070_18 ++ (tM070_19 ++ (tM070_20 ++ (tM070_21 ++ (tM070_22 ++ (tM070_23 ++ (tM070_24 ++ (tM070_25 ++ (tM070_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 070：区間 N 24・M 27。 -/
theorem pair070_ok : pairOk P pair070 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN070_0) (wseg_append (wseg_of sN070_1) (wseg_append (wseg_of sN070_2) (wseg_append (wseg_of sN070_3) (wseg_append (wseg_of sN070_4) (wseg_append (wseg_of sN070_5) (wseg_append (wseg_of sN070_6) (wseg_append (wseg_of sN070_7) (wseg_append (wseg_of sN070_8) (wseg_append (wseg_of sN070_9) (wseg_append (wseg_of sN070_10) (wseg_append (wseg_of sN070_11) (wseg_append (wseg_of sN070_12) (wseg_append (wseg_of sN070_13) (wseg_append (wseg_of sN070_14) (wseg_append (wseg_of sN070_15) (wseg_append (wseg_of sN070_16) (wseg_append (wseg_of sN070_17) (wseg_append (wseg_of sN070_18) (wseg_append (wseg_of sN070_19) (wseg_append (wseg_of sN070_20) (wseg_append (wseg_of sN070_21) (wseg_append (wseg_of sN070_22) (wseg_of sN070_23)))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM070_0) (wseg_append (wseg_of sM070_1) (wseg_append (wseg_of sM070_2) (wseg_append (wseg_of sM070_3) (wseg_append (wseg_of sM070_4) (wseg_append (wseg_of sM070_5) (wseg_append (wseg_of sM070_6) (wseg_append (wseg_of sM070_7) (wseg_append (wseg_of sM070_8) (wseg_append (wseg_of sM070_9) (wseg_append (wseg_of sM070_10) (wseg_append (wseg_of sM070_11) (wseg_append (wseg_of sM070_12) (wseg_append (wseg_of sM070_13) (wseg_append (wseg_of sM070_14) (wseg_append (wseg_of sM070_15) (wseg_append (wseg_of sM070_16) (wseg_append (wseg_of sM070_17) (wseg_append (wseg_of sM070_18) (wseg_append (wseg_of sM070_19) (wseg_append (wseg_of sM070_20) (wseg_append (wseg_of sM070_21) (wseg_append (wseg_of sM070_22) (wseg_append (wseg_of sM070_23) (wseg_append (wseg_of sM070_24) (wseg_append (wseg_of sM070_25) (wseg_of sM070_26))))))))))))))))))))))))))))

end PackLean.D28.Cub
