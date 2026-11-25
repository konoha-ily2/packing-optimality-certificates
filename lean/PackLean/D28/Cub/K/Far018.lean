-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS018_0
import PackLean.D28.Cub.K.FarS018_1
import PackLean.D28.Cub.K.FarS018_2
import PackLean.D28.Cub.K.FarS018_3
import PackLean.D28.Cub.K.FarS018_4
import PackLean.D28.Cub.K.FarS018_5
import PackLean.D28.Cub.K.FarS018_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair056 : Pair where
  nb := nbN056
  kmNum := 151009
  kmDen := 16777216
  toksN := tN056_0 ++ (tN056_1 ++ (tN056_2 ++ (tN056_3 ++ (tN056_4 ++ (tN056_5 ++ (tN056_6 ++ (tN056_7 ++ (tN056_8 ++ (tN056_9 ++ (tN056_10 ++ (tN056_11 ++ (tN056_12 ++ (tN056_13 ++ (tN056_14 ++ (tN056_15 ++ (tN056_16 ++ (tN056_17 ++ (tN056_18 ++ (tN056_19 ++ (tN056_20 ++ (tN056_21 ++ (tN056_22 ++ (tN056_23 ++ (tN056_24))))))))))))))))))))))))
  toksM := tM056_0 ++ (tM056_1 ++ (tM056_2 ++ (tM056_3 ++ (tM056_4 ++ (tM056_5 ++ (tM056_6 ++ (tM056_7 ++ (tM056_8 ++ (tM056_9 ++ (tM056_10 ++ (tM056_11 ++ (tM056_12 ++ (tM056_13 ++ (tM056_14 ++ (tM056_15 ++ (tM056_16 ++ (tM056_17 ++ (tM056_18 ++ (tM056_19 ++ (tM056_20 ++ (tM056_21 ++ (tM056_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 056：区間 N 25・M 23。 -/
theorem pair056_ok : pairOk P pair056 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN056_0) (wseg_append (wseg_of sN056_1) (wseg_append (wseg_of sN056_2) (wseg_append (wseg_of sN056_3) (wseg_append (wseg_of sN056_4) (wseg_append (wseg_of sN056_5) (wseg_append (wseg_of sN056_6) (wseg_append (wseg_of sN056_7) (wseg_append (wseg_of sN056_8) (wseg_append (wseg_of sN056_9) (wseg_append (wseg_of sN056_10) (wseg_append (wseg_of sN056_11) (wseg_append (wseg_of sN056_12) (wseg_append (wseg_of sN056_13) (wseg_append (wseg_of sN056_14) (wseg_append (wseg_of sN056_15) (wseg_append (wseg_of sN056_16) (wseg_append (wseg_of sN056_17) (wseg_append (wseg_of sN056_18) (wseg_append (wseg_of sN056_19) (wseg_append (wseg_of sN056_20) (wseg_append (wseg_of sN056_21) (wseg_append (wseg_of sN056_22) (wseg_append (wseg_of sN056_23) (wseg_of sN056_24))))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM056_0) (wseg_append (wseg_of sM056_1) (wseg_append (wseg_of sM056_2) (wseg_append (wseg_of sM056_3) (wseg_append (wseg_of sM056_4) (wseg_append (wseg_of sM056_5) (wseg_append (wseg_of sM056_6) (wseg_append (wseg_of sM056_7) (wseg_append (wseg_of sM056_8) (wseg_append (wseg_of sM056_9) (wseg_append (wseg_of sM056_10) (wseg_append (wseg_of sM056_11) (wseg_append (wseg_of sM056_12) (wseg_append (wseg_of sM056_13) (wseg_append (wseg_of sM056_14) (wseg_append (wseg_of sM056_15) (wseg_append (wseg_of sM056_16) (wseg_append (wseg_of sM056_17) (wseg_append (wseg_of sM056_18) (wseg_append (wseg_of sM056_19) (wseg_append (wseg_of sM056_20) (wseg_append (wseg_of sM056_21) (wseg_of sM056_22))))))))))))))))))))))))

def pair057 : Pair where
  nb := nbN057
  kmNum := 197453
  kmDen := 8388608
  toksN := tN057_0 ++ (tN057_1 ++ (tN057_2 ++ (tN057_3 ++ (tN057_4 ++ (tN057_5 ++ (tN057_6 ++ (tN057_7 ++ (tN057_8 ++ (tN057_9 ++ (tN057_10 ++ (tN057_11 ++ (tN057_12 ++ (tN057_13 ++ (tN057_14 ++ (tN057_15 ++ (tN057_16 ++ (tN057_17 ++ (tN057_18 ++ (tN057_19 ++ (tN057_20 ++ (tN057_21 ++ (tN057_22))))))))))))))))))))))
  toksM := tM057_0 ++ (tM057_1 ++ (tM057_2 ++ (tM057_3 ++ (tM057_4 ++ (tM057_5 ++ (tM057_6 ++ (tM057_7 ++ (tM057_8 ++ (tM057_9 ++ (tM057_10 ++ (tM057_11 ++ (tM057_12 ++ (tM057_13 ++ (tM057_14 ++ (tM057_15 ++ (tM057_16 ++ (tM057_17 ++ (tM057_18 ++ (tM057_19 ++ (tM057_20 ++ (tM057_21 ++ (tM057_22 ++ (tM057_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 057：区間 N 23・M 24。 -/
theorem pair057_ok : pairOk P pair057 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN057_0) (wseg_append (wseg_of sN057_1) (wseg_append (wseg_of sN057_2) (wseg_append (wseg_of sN057_3) (wseg_append (wseg_of sN057_4) (wseg_append (wseg_of sN057_5) (wseg_append (wseg_of sN057_6) (wseg_append (wseg_of sN057_7) (wseg_append (wseg_of sN057_8) (wseg_append (wseg_of sN057_9) (wseg_append (wseg_of sN057_10) (wseg_append (wseg_of sN057_11) (wseg_append (wseg_of sN057_12) (wseg_append (wseg_of sN057_13) (wseg_append (wseg_of sN057_14) (wseg_append (wseg_of sN057_15) (wseg_append (wseg_of sN057_16) (wseg_append (wseg_of sN057_17) (wseg_append (wseg_of sN057_18) (wseg_append (wseg_of sN057_19) (wseg_append (wseg_of sN057_20) (wseg_append (wseg_of sN057_21) (wseg_of sN057_22))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM057_0) (wseg_append (wseg_of sM057_1) (wseg_append (wseg_of sM057_2) (wseg_append (wseg_of sM057_3) (wseg_append (wseg_of sM057_4) (wseg_append (wseg_of sM057_5) (wseg_append (wseg_of sM057_6) (wseg_append (wseg_of sM057_7) (wseg_append (wseg_of sM057_8) (wseg_append (wseg_of sM057_9) (wseg_append (wseg_of sM057_10) (wseg_append (wseg_of sM057_11) (wseg_append (wseg_of sM057_12) (wseg_append (wseg_of sM057_13) (wseg_append (wseg_of sM057_14) (wseg_append (wseg_of sM057_15) (wseg_append (wseg_of sM057_16) (wseg_append (wseg_of sM057_17) (wseg_append (wseg_of sM057_18) (wseg_append (wseg_of sM057_19) (wseg_append (wseg_of sM057_20) (wseg_append (wseg_of sM057_21) (wseg_append (wseg_of sM057_22) (wseg_of sM057_23)))))))))))))))))))))))))

end PackLean.D28.Cub
