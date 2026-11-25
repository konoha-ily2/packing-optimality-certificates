-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS042_0
import PackLean.D28.Cub.K.FarS042_1
import PackLean.D28.Cub.K.FarS042_2
import PackLean.D28.Cub.K.FarS042_3
import PackLean.D28.Cub.K.FarS042_4
import PackLean.D28.Cub.K.FarS042_5
import PackLean.D28.Cub.K.FarS042_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair104 : Pair where
  nb := nbN104
  kmNum := 147025
  kmDen := 2097152
  toksN := tN104_0 ++ (tN104_1 ++ (tN104_2 ++ (tN104_3 ++ (tN104_4 ++ (tN104_5 ++ (tN104_6 ++ (tN104_7 ++ (tN104_8 ++ (tN104_9 ++ (tN104_10 ++ (tN104_11 ++ (tN104_12 ++ (tN104_13 ++ (tN104_14 ++ (tN104_15 ++ (tN104_16 ++ (tN104_17 ++ (tN104_18 ++ (tN104_19 ++ (tN104_20))))))))))))))))))))
  toksM := tM104_0 ++ (tM104_1 ++ (tM104_2 ++ (tM104_3 ++ (tM104_4 ++ (tM104_5 ++ (tM104_6 ++ (tM104_7 ++ (tM104_8 ++ (tM104_9 ++ (tM104_10 ++ (tM104_11 ++ (tM104_12 ++ (tM104_13 ++ (tM104_14 ++ (tM104_15 ++ (tM104_16 ++ (tM104_17 ++ (tM104_18 ++ (tM104_19 ++ (tM104_20 ++ (tM104_21 ++ (tM104_22 ++ (tM104_23 ++ (tM104_24 ++ (tM104_25 ++ (tM104_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 104：区間 N 21・M 27。 -/
theorem pair104_ok : pairOk P pair104 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN104_0) (wseg_append (wseg_of sN104_1) (wseg_append (wseg_of sN104_2) (wseg_append (wseg_of sN104_3) (wseg_append (wseg_of sN104_4) (wseg_append (wseg_of sN104_5) (wseg_append (wseg_of sN104_6) (wseg_append (wseg_of sN104_7) (wseg_append (wseg_of sN104_8) (wseg_append (wseg_of sN104_9) (wseg_append (wseg_of sN104_10) (wseg_append (wseg_of sN104_11) (wseg_append (wseg_of sN104_12) (wseg_append (wseg_of sN104_13) (wseg_append (wseg_of sN104_14) (wseg_append (wseg_of sN104_15) (wseg_append (wseg_of sN104_16) (wseg_append (wseg_of sN104_17) (wseg_append (wseg_of sN104_18) (wseg_append (wseg_of sN104_19) (wseg_of sN104_20))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM104_0) (wseg_append (wseg_of sM104_1) (wseg_append (wseg_of sM104_2) (wseg_append (wseg_of sM104_3) (wseg_append (wseg_of sM104_4) (wseg_append (wseg_of sM104_5) (wseg_append (wseg_of sM104_6) (wseg_append (wseg_of sM104_7) (wseg_append (wseg_of sM104_8) (wseg_append (wseg_of sM104_9) (wseg_append (wseg_of sM104_10) (wseg_append (wseg_of sM104_11) (wseg_append (wseg_of sM104_12) (wseg_append (wseg_of sM104_13) (wseg_append (wseg_of sM104_14) (wseg_append (wseg_of sM104_15) (wseg_append (wseg_of sM104_16) (wseg_append (wseg_of sM104_17) (wseg_append (wseg_of sM104_18) (wseg_append (wseg_of sM104_19) (wseg_append (wseg_of sM104_20) (wseg_append (wseg_of sM104_21) (wseg_append (wseg_of sM104_22) (wseg_append (wseg_of sM104_23) (wseg_append (wseg_of sM104_24) (wseg_append (wseg_of sM104_25) (wseg_of sM104_26))))))))))))))))))))))))))))

def pair105 : Pair where
  nb := nbN105
  kmNum := 109477
  kmDen := 2097152
  toksN := tN105_0 ++ (tN105_1 ++ (tN105_2 ++ (tN105_3 ++ (tN105_4 ++ (tN105_5 ++ (tN105_6 ++ (tN105_7 ++ (tN105_8 ++ (tN105_9 ++ (tN105_10 ++ (tN105_11 ++ (tN105_12 ++ (tN105_13 ++ (tN105_14 ++ (tN105_15 ++ (tN105_16 ++ (tN105_17 ++ (tN105_18 ++ (tN105_19 ++ (tN105_20 ++ (tN105_21 ++ (tN105_22))))))))))))))))))))))
  toksM := tM105_0 ++ (tM105_1 ++ (tM105_2 ++ (tM105_3 ++ (tM105_4 ++ (tM105_5 ++ (tM105_6 ++ (tM105_7 ++ (tM105_8 ++ (tM105_9 ++ (tM105_10 ++ (tM105_11 ++ (tM105_12 ++ (tM105_13 ++ (tM105_14 ++ (tM105_15 ++ (tM105_16 ++ (tM105_17 ++ (tM105_18 ++ (tM105_19 ++ (tM105_20 ++ (tM105_21 ++ (tM105_22 ++ (tM105_23 ++ (tM105_24 ++ (tM105_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 105：区間 N 23・M 26。 -/
theorem pair105_ok : pairOk P pair105 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN105_0) (wseg_append (wseg_of sN105_1) (wseg_append (wseg_of sN105_2) (wseg_append (wseg_of sN105_3) (wseg_append (wseg_of sN105_4) (wseg_append (wseg_of sN105_5) (wseg_append (wseg_of sN105_6) (wseg_append (wseg_of sN105_7) (wseg_append (wseg_of sN105_8) (wseg_append (wseg_of sN105_9) (wseg_append (wseg_of sN105_10) (wseg_append (wseg_of sN105_11) (wseg_append (wseg_of sN105_12) (wseg_append (wseg_of sN105_13) (wseg_append (wseg_of sN105_14) (wseg_append (wseg_of sN105_15) (wseg_append (wseg_of sN105_16) (wseg_append (wseg_of sN105_17) (wseg_append (wseg_of sN105_18) (wseg_append (wseg_of sN105_19) (wseg_append (wseg_of sN105_20) (wseg_append (wseg_of sN105_21) (wseg_of sN105_22))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM105_0) (wseg_append (wseg_of sM105_1) (wseg_append (wseg_of sM105_2) (wseg_append (wseg_of sM105_3) (wseg_append (wseg_of sM105_4) (wseg_append (wseg_of sM105_5) (wseg_append (wseg_of sM105_6) (wseg_append (wseg_of sM105_7) (wseg_append (wseg_of sM105_8) (wseg_append (wseg_of sM105_9) (wseg_append (wseg_of sM105_10) (wseg_append (wseg_of sM105_11) (wseg_append (wseg_of sM105_12) (wseg_append (wseg_of sM105_13) (wseg_append (wseg_of sM105_14) (wseg_append (wseg_of sM105_15) (wseg_append (wseg_of sM105_16) (wseg_append (wseg_of sM105_17) (wseg_append (wseg_of sM105_18) (wseg_append (wseg_of sM105_19) (wseg_append (wseg_of sM105_20) (wseg_append (wseg_of sM105_21) (wseg_append (wseg_of sM105_22) (wseg_append (wseg_of sM105_23) (wseg_append (wseg_of sM105_24) (wseg_of sM105_25)))))))))))))))))))))))))))

end PackLean.D28.Cub
