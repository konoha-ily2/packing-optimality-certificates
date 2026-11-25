-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS036_0
import PackLean.D28.Cub.K.FarS036_1
import PackLean.D28.Cub.K.FarS036_2
import PackLean.D28.Cub.K.FarS036_3
import PackLean.D28.Cub.K.FarS036_4
import PackLean.D28.Cub.K.FarS036_5
import PackLean.D28.Cub.K.FarS036_6
import PackLean.D28.Cub.K.FarS036_7
import PackLean.D28.Cub.K.FarS036_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair092 : Pair where
  nb := nbN092
  kmNum := 6991
  kmDen := 2097152
  toksN := tN092_0 ++ (tN092_1 ++ (tN092_2 ++ (tN092_3 ++ (tN092_4 ++ (tN092_5 ++ (tN092_6 ++ (tN092_7 ++ (tN092_8 ++ (tN092_9 ++ (tN092_10 ++ (tN092_11 ++ (tN092_12 ++ (tN092_13 ++ (tN092_14 ++ (tN092_15 ++ (tN092_16 ++ (tN092_17 ++ (tN092_18 ++ (tN092_19 ++ (tN092_20 ++ (tN092_21 ++ (tN092_22 ++ (tN092_23 ++ (tN092_24 ++ (tN092_25 ++ (tN092_26 ++ (tN092_27 ++ (tN092_28 ++ (tN092_29 ++ (tN092_30 ++ (tN092_31)))))))))))))))))))))))))))))))
  toksM := tM092_0 ++ (tM092_1 ++ (tM092_2 ++ (tM092_3 ++ (tM092_4 ++ (tM092_5 ++ (tM092_6 ++ (tM092_7 ++ (tM092_8 ++ (tM092_9 ++ (tM092_10 ++ (tM092_11 ++ (tM092_12 ++ (tM092_13 ++ (tM092_14 ++ (tM092_15 ++ (tM092_16 ++ (tM092_17 ++ (tM092_18 ++ (tM092_19 ++ (tM092_20 ++ (tM092_21 ++ (tM092_22 ++ (tM092_23 ++ (tM092_24 ++ (tM092_25 ++ (tM092_26 ++ (tM092_27 ++ (tM092_28 ++ (tM092_29 ++ (tM092_30 ++ (tM092_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 092：区間 N 32・M 32。 -/
theorem pair092_ok : pairOk P pair092 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN092_0) (wseg_append (wseg_of sN092_1) (wseg_append (wseg_of sN092_2) (wseg_append (wseg_of sN092_3) (wseg_append (wseg_of sN092_4) (wseg_append (wseg_of sN092_5) (wseg_append (wseg_of sN092_6) (wseg_append (wseg_of sN092_7) (wseg_append (wseg_of sN092_8) (wseg_append (wseg_of sN092_9) (wseg_append (wseg_of sN092_10) (wseg_append (wseg_of sN092_11) (wseg_append (wseg_of sN092_12) (wseg_append (wseg_of sN092_13) (wseg_append (wseg_of sN092_14) (wseg_append (wseg_of sN092_15) (wseg_append (wseg_of sN092_16) (wseg_append (wseg_of sN092_17) (wseg_append (wseg_of sN092_18) (wseg_append (wseg_of sN092_19) (wseg_append (wseg_of sN092_20) (wseg_append (wseg_of sN092_21) (wseg_append (wseg_of sN092_22) (wseg_append (wseg_of sN092_23) (wseg_append (wseg_of sN092_24) (wseg_append (wseg_of sN092_25) (wseg_append (wseg_of sN092_26) (wseg_append (wseg_of sN092_27) (wseg_append (wseg_of sN092_28) (wseg_append (wseg_of sN092_29) (wseg_append (wseg_of sN092_30) (wseg_of sN092_31)))))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM092_0) (wseg_append (wseg_of sM092_1) (wseg_append (wseg_of sM092_2) (wseg_append (wseg_of sM092_3) (wseg_append (wseg_of sM092_4) (wseg_append (wseg_of sM092_5) (wseg_append (wseg_of sM092_6) (wseg_append (wseg_of sM092_7) (wseg_append (wseg_of sM092_8) (wseg_append (wseg_of sM092_9) (wseg_append (wseg_of sM092_10) (wseg_append (wseg_of sM092_11) (wseg_append (wseg_of sM092_12) (wseg_append (wseg_of sM092_13) (wseg_append (wseg_of sM092_14) (wseg_append (wseg_of sM092_15) (wseg_append (wseg_of sM092_16) (wseg_append (wseg_of sM092_17) (wseg_append (wseg_of sM092_18) (wseg_append (wseg_of sM092_19) (wseg_append (wseg_of sM092_20) (wseg_append (wseg_of sM092_21) (wseg_append (wseg_of sM092_22) (wseg_append (wseg_of sM092_23) (wseg_append (wseg_of sM092_24) (wseg_append (wseg_of sM092_25) (wseg_append (wseg_of sM092_26) (wseg_append (wseg_of sM092_27) (wseg_append (wseg_of sM092_28) (wseg_append (wseg_of sM092_29) (wseg_append (wseg_of sM092_30) (wseg_of sM092_31)))))))))))))))))))))))))))))))))

def pair093 : Pair where
  nb := nbN093
  kmNum := 36333
  kmDen := 16777216
  toksN := tN093_0 ++ (tN093_1 ++ (tN093_2 ++ (tN093_3 ++ (tN093_4 ++ (tN093_5 ++ (tN093_6 ++ (tN093_7 ++ (tN093_8 ++ (tN093_9 ++ (tN093_10 ++ (tN093_11 ++ (tN093_12 ++ (tN093_13 ++ (tN093_14 ++ (tN093_15 ++ (tN093_16 ++ (tN093_17 ++ (tN093_18 ++ (tN093_19 ++ (tN093_20 ++ (tN093_21 ++ (tN093_22 ++ (tN093_23 ++ (tN093_24 ++ (tN093_25 ++ (tN093_26 ++ (tN093_27 ++ (tN093_28))))))))))))))))))))))))))))
  toksM := tM093_0 ++ (tM093_1 ++ (tM093_2 ++ (tM093_3 ++ (tM093_4 ++ (tM093_5 ++ (tM093_6 ++ (tM093_7 ++ (tM093_8 ++ (tM093_9 ++ (tM093_10 ++ (tM093_11 ++ (tM093_12 ++ (tM093_13 ++ (tM093_14 ++ (tM093_15 ++ (tM093_16 ++ (tM093_17 ++ (tM093_18 ++ (tM093_19 ++ (tM093_20 ++ (tM093_21 ++ (tM093_22 ++ (tM093_23 ++ (tM093_24 ++ (tM093_25 ++ (tM093_26 ++ (tM093_27 ++ (tM093_28 ++ (tM093_29 ++ (tM093_30))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 093：区間 N 29・M 31。 -/
theorem pair093_ok : pairOk P pair093 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN093_0) (wseg_append (wseg_of sN093_1) (wseg_append (wseg_of sN093_2) (wseg_append (wseg_of sN093_3) (wseg_append (wseg_of sN093_4) (wseg_append (wseg_of sN093_5) (wseg_append (wseg_of sN093_6) (wseg_append (wseg_of sN093_7) (wseg_append (wseg_of sN093_8) (wseg_append (wseg_of sN093_9) (wseg_append (wseg_of sN093_10) (wseg_append (wseg_of sN093_11) (wseg_append (wseg_of sN093_12) (wseg_append (wseg_of sN093_13) (wseg_append (wseg_of sN093_14) (wseg_append (wseg_of sN093_15) (wseg_append (wseg_of sN093_16) (wseg_append (wseg_of sN093_17) (wseg_append (wseg_of sN093_18) (wseg_append (wseg_of sN093_19) (wseg_append (wseg_of sN093_20) (wseg_append (wseg_of sN093_21) (wseg_append (wseg_of sN093_22) (wseg_append (wseg_of sN093_23) (wseg_append (wseg_of sN093_24) (wseg_append (wseg_of sN093_25) (wseg_append (wseg_of sN093_26) (wseg_append (wseg_of sN093_27) (wseg_of sN093_28))))))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM093_0) (wseg_append (wseg_of sM093_1) (wseg_append (wseg_of sM093_2) (wseg_append (wseg_of sM093_3) (wseg_append (wseg_of sM093_4) (wseg_append (wseg_of sM093_5) (wseg_append (wseg_of sM093_6) (wseg_append (wseg_of sM093_7) (wseg_append (wseg_of sM093_8) (wseg_append (wseg_of sM093_9) (wseg_append (wseg_of sM093_10) (wseg_append (wseg_of sM093_11) (wseg_append (wseg_of sM093_12) (wseg_append (wseg_of sM093_13) (wseg_append (wseg_of sM093_14) (wseg_append (wseg_of sM093_15) (wseg_append (wseg_of sM093_16) (wseg_append (wseg_of sM093_17) (wseg_append (wseg_of sM093_18) (wseg_append (wseg_of sM093_19) (wseg_append (wseg_of sM093_20) (wseg_append (wseg_of sM093_21) (wseg_append (wseg_of sM093_22) (wseg_append (wseg_of sM093_23) (wseg_append (wseg_of sM093_24) (wseg_append (wseg_of sM093_25) (wseg_append (wseg_of sM093_26) (wseg_append (wseg_of sM093_27) (wseg_append (wseg_of sM093_28) (wseg_append (wseg_of sM093_29) (wseg_of sM093_30))))))))))))))))))))))))))))))))

end PackLean.D28.Cub
