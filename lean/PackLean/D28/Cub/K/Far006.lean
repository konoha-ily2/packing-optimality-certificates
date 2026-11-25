-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS006_0
import PackLean.D28.Cub.K.FarS006_1
import PackLean.D28.Cub.K.FarS006_2
import PackLean.D28.Cub.K.FarS006_3
import PackLean.D28.Cub.K.FarS006_4
import PackLean.D28.Cub.K.FarS006_5
import PackLean.D28.Cub.K.FarS006_6
import PackLean.D28.Cub.K.FarS006_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair023 : Pair where
  nb := nbN023
  kmNum := 160515
  kmDen := 8388608
  toksN := tN023_0 ++ (tN023_1 ++ (tN023_2 ++ (tN023_3 ++ (tN023_4 ++ (tN023_5 ++ (tN023_6 ++ (tN023_7 ++ (tN023_8 ++ (tN023_9 ++ (tN023_10 ++ (tN023_11 ++ (tN023_12 ++ (tN023_13 ++ (tN023_14 ++ (tN023_15 ++ (tN023_16))))))))))))))))
  toksM := tM023_0 ++ (tM023_1 ++ (tM023_2 ++ (tM023_3 ++ (tM023_4 ++ (tM023_5 ++ (tM023_6 ++ (tM023_7 ++ (tM023_8 ++ (tM023_9 ++ (tM023_10 ++ (tM023_11 ++ (tM023_12 ++ (tM023_13 ++ (tM023_14 ++ (tM023_15 ++ (tM023_16 ++ (tM023_17 ++ (tM023_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 023：区間 N 17・M 19。 -/
theorem pair023_ok : pairOk P pair023 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN023_0) (wseg_append (wseg_of sN023_1) (wseg_append (wseg_of sN023_2) (wseg_append (wseg_of sN023_3) (wseg_append (wseg_of sN023_4) (wseg_append (wseg_of sN023_5) (wseg_append (wseg_of sN023_6) (wseg_append (wseg_of sN023_7) (wseg_append (wseg_of sN023_8) (wseg_append (wseg_of sN023_9) (wseg_append (wseg_of sN023_10) (wseg_append (wseg_of sN023_11) (wseg_append (wseg_of sN023_12) (wseg_append (wseg_of sN023_13) (wseg_append (wseg_of sN023_14) (wseg_append (wseg_of sN023_15) (wseg_of sN023_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM023_0) (wseg_append (wseg_of sM023_1) (wseg_append (wseg_of sM023_2) (wseg_append (wseg_of sM023_3) (wseg_append (wseg_of sM023_4) (wseg_append (wseg_of sM023_5) (wseg_append (wseg_of sM023_6) (wseg_append (wseg_of sM023_7) (wseg_append (wseg_of sM023_8) (wseg_append (wseg_of sM023_9) (wseg_append (wseg_of sM023_10) (wseg_append (wseg_of sM023_11) (wseg_append (wseg_of sM023_12) (wseg_append (wseg_of sM023_13) (wseg_append (wseg_of sM023_14) (wseg_append (wseg_of sM023_15) (wseg_append (wseg_of sM023_16) (wseg_append (wseg_of sM023_17) (wseg_of sM023_18))))))))))))))))))))

def pair024 : Pair where
  nb := nbN024
  kmNum := 134715
  kmDen := 16777216
  toksN := tN024_0 ++ (tN024_1 ++ (tN024_2 ++ (tN024_3 ++ (tN024_4 ++ (tN024_5 ++ (tN024_6 ++ (tN024_7 ++ (tN024_8 ++ (tN024_9 ++ (tN024_10 ++ (tN024_11 ++ (tN024_12 ++ (tN024_13 ++ (tN024_14 ++ (tN024_15 ++ (tN024_16 ++ (tN024_17)))))))))))))))))
  toksM := tM024_0 ++ (tM024_1 ++ (tM024_2 ++ (tM024_3 ++ (tM024_4 ++ (tM024_5 ++ (tM024_6 ++ (tM024_7 ++ (tM024_8 ++ (tM024_9 ++ (tM024_10 ++ (tM024_11 ++ (tM024_12 ++ (tM024_13 ++ (tM024_14 ++ (tM024_15 ++ (tM024_16 ++ (tM024_17 ++ (tM024_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 024：区間 N 18・M 19。 -/
theorem pair024_ok : pairOk P pair024 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN024_0) (wseg_append (wseg_of sN024_1) (wseg_append (wseg_of sN024_2) (wseg_append (wseg_of sN024_3) (wseg_append (wseg_of sN024_4) (wseg_append (wseg_of sN024_5) (wseg_append (wseg_of sN024_6) (wseg_append (wseg_of sN024_7) (wseg_append (wseg_of sN024_8) (wseg_append (wseg_of sN024_9) (wseg_append (wseg_of sN024_10) (wseg_append (wseg_of sN024_11) (wseg_append (wseg_of sN024_12) (wseg_append (wseg_of sN024_13) (wseg_append (wseg_of sN024_14) (wseg_append (wseg_of sN024_15) (wseg_append (wseg_of sN024_16) (wseg_of sN024_17)))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM024_0) (wseg_append (wseg_of sM024_1) (wseg_append (wseg_of sM024_2) (wseg_append (wseg_of sM024_3) (wseg_append (wseg_of sM024_4) (wseg_append (wseg_of sM024_5) (wseg_append (wseg_of sM024_6) (wseg_append (wseg_of sM024_7) (wseg_append (wseg_of sM024_8) (wseg_append (wseg_of sM024_9) (wseg_append (wseg_of sM024_10) (wseg_append (wseg_of sM024_11) (wseg_append (wseg_of sM024_12) (wseg_append (wseg_of sM024_13) (wseg_append (wseg_of sM024_14) (wseg_append (wseg_of sM024_15) (wseg_append (wseg_of sM024_16) (wseg_append (wseg_of sM024_17) (wseg_of sM024_18))))))))))))))))))))

def pair025 : Pair where
  nb := nbN025
  kmNum := 272355
  kmDen := 16777216
  toksN := tN025_0 ++ (tN025_1 ++ (tN025_2 ++ (tN025_3 ++ (tN025_4 ++ (tN025_5 ++ (tN025_6 ++ (tN025_7 ++ (tN025_8 ++ (tN025_9 ++ (tN025_10 ++ (tN025_11 ++ (tN025_12 ++ (tN025_13 ++ (tN025_14 ++ (tN025_15 ++ (tN025_16 ++ (tN025_17)))))))))))))))))
  toksM := tM025_0 ++ (tM025_1 ++ (tM025_2 ++ (tM025_3 ++ (tM025_4 ++ (tM025_5 ++ (tM025_6 ++ (tM025_7 ++ (tM025_8 ++ (tM025_9 ++ (tM025_10 ++ (tM025_11 ++ (tM025_12 ++ (tM025_13 ++ (tM025_14 ++ (tM025_15 ++ (tM025_16 ++ (tM025_17 ++ (tM025_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 025：区間 N 18・M 19。 -/
theorem pair025_ok : pairOk P pair025 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN025_0) (wseg_append (wseg_of sN025_1) (wseg_append (wseg_of sN025_2) (wseg_append (wseg_of sN025_3) (wseg_append (wseg_of sN025_4) (wseg_append (wseg_of sN025_5) (wseg_append (wseg_of sN025_6) (wseg_append (wseg_of sN025_7) (wseg_append (wseg_of sN025_8) (wseg_append (wseg_of sN025_9) (wseg_append (wseg_of sN025_10) (wseg_append (wseg_of sN025_11) (wseg_append (wseg_of sN025_12) (wseg_append (wseg_of sN025_13) (wseg_append (wseg_of sN025_14) (wseg_append (wseg_of sN025_15) (wseg_append (wseg_of sN025_16) (wseg_of sN025_17)))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM025_0) (wseg_append (wseg_of sM025_1) (wseg_append (wseg_of sM025_2) (wseg_append (wseg_of sM025_3) (wseg_append (wseg_of sM025_4) (wseg_append (wseg_of sM025_5) (wseg_append (wseg_of sM025_6) (wseg_append (wseg_of sM025_7) (wseg_append (wseg_of sM025_8) (wseg_append (wseg_of sM025_9) (wseg_append (wseg_of sM025_10) (wseg_append (wseg_of sM025_11) (wseg_append (wseg_of sM025_12) (wseg_append (wseg_of sM025_13) (wseg_append (wseg_of sM025_14) (wseg_append (wseg_of sM025_15) (wseg_append (wseg_of sM025_16) (wseg_append (wseg_of sM025_17) (wseg_of sM025_18))))))))))))))))))))

end PackLean.D28.Cub
