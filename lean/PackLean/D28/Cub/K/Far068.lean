-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS068_0
import PackLean.D28.Cub.K.FarS068_1
import PackLean.D28.Cub.K.FarS068_2
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair157 : Pair where
  nb := nbN157
  kmNum := 801241
  kmDen := 4194304
  toksN := tN157_0 ++ (tN157_1 ++ (tN157_2 ++ (tN157_3 ++ (tN157_4 ++ (tN157_5 ++ (tN157_6 ++ (tN157_7 ++ (tN157_8 ++ (tN157_9 ++ (tN157_10 ++ (tN157_11 ++ (tN157_12 ++ (tN157_13 ++ (tN157_14 ++ (tN157_15)))))))))))))))
  toksM := tM157_0 ++ (tM157_1 ++ (tM157_2 ++ (tM157_3 ++ (tM157_4 ++ (tM157_5 ++ (tM157_6 ++ (tM157_7 ++ (tM157_8 ++ (tM157_9 ++ (tM157_10 ++ (tM157_11 ++ (tM157_12 ++ (tM157_13 ++ (tM157_14 ++ (tM157_15 ++ (tM157_16 ++ (tM157_17 ++ (tM157_18 ++ (tM157_19 ++ (tM157_20 ++ (tM157_21 ++ (tM157_22 ++ (tM157_23 ++ (tM157_24 ++ (tM157_25 ++ (tM157_26 ++ (tM157_27 ++ (tM157_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 157：区間 N 16・M 29。 -/
theorem pair157_ok : pairOk P pair157 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN157_0) (wseg_append (wseg_of sN157_1) (wseg_append (wseg_of sN157_2) (wseg_append (wseg_of sN157_3) (wseg_append (wseg_of sN157_4) (wseg_append (wseg_of sN157_5) (wseg_append (wseg_of sN157_6) (wseg_append (wseg_of sN157_7) (wseg_append (wseg_of sN157_8) (wseg_append (wseg_of sN157_9) (wseg_append (wseg_of sN157_10) (wseg_append (wseg_of sN157_11) (wseg_append (wseg_of sN157_12) (wseg_append (wseg_of sN157_13) (wseg_append (wseg_of sN157_14) (wseg_of sN157_15)))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM157_0) (wseg_append (wseg_of sM157_1) (wseg_append (wseg_of sM157_2) (wseg_append (wseg_of sM157_3) (wseg_append (wseg_of sM157_4) (wseg_append (wseg_of sM157_5) (wseg_append (wseg_of sM157_6) (wseg_append (wseg_of sM157_7) (wseg_append (wseg_of sM157_8) (wseg_append (wseg_of sM157_9) (wseg_append (wseg_of sM157_10) (wseg_append (wseg_of sM157_11) (wseg_append (wseg_of sM157_12) (wseg_append (wseg_of sM157_13) (wseg_append (wseg_of sM157_14) (wseg_append (wseg_of sM157_15) (wseg_append (wseg_of sM157_16) (wseg_append (wseg_of sM157_17) (wseg_append (wseg_of sM157_18) (wseg_append (wseg_of sM157_19) (wseg_append (wseg_of sM157_20) (wseg_append (wseg_of sM157_21) (wseg_append (wseg_of sM157_22) (wseg_append (wseg_of sM157_23) (wseg_append (wseg_of sM157_24) (wseg_append (wseg_of sM157_25) (wseg_append (wseg_of sM157_26) (wseg_append (wseg_of sM157_27) (wseg_of sM157_28))))))))))))))))))))))))))))))

end PackLean.D28.Cub
