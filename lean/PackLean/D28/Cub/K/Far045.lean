-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS045_0
import PackLean.D28.Cub.K.FarS045_1
import PackLean.D28.Cub.K.FarS045_2
import PackLean.D28.Cub.K.FarS045_3
import PackLean.D28.Cub.K.FarS045_4
import PackLean.D28.Cub.K.FarS045_5
import PackLean.D28.Cub.K.FarS045_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair110 : Pair where
  nb := nbN110
  kmNum := 563953
  kmDen := 16777216
  toksN := tN110_0 ++ (tN110_1 ++ (tN110_2 ++ (tN110_3 ++ (tN110_4 ++ (tN110_5 ++ (tN110_6 ++ (tN110_7 ++ (tN110_8 ++ (tN110_9 ++ (tN110_10 ++ (tN110_11 ++ (tN110_12 ++ (tN110_13 ++ (tN110_14 ++ (tN110_15 ++ (tN110_16 ++ (tN110_17 ++ (tN110_18 ++ (tN110_19 ++ (tN110_20 ++ (tN110_21 ++ (tN110_22 ++ (tN110_23)))))))))))))))))))))))
  toksM := tM110_0 ++ (tM110_1 ++ (tM110_2 ++ (tM110_3 ++ (tM110_4 ++ (tM110_5 ++ (tM110_6 ++ (tM110_7 ++ (tM110_8 ++ (tM110_9 ++ (tM110_10 ++ (tM110_11 ++ (tM110_12 ++ (tM110_13 ++ (tM110_14 ++ (tM110_15 ++ (tM110_16 ++ (tM110_17 ++ (tM110_18 ++ (tM110_19 ++ (tM110_20 ++ (tM110_21 ++ (tM110_22 ++ (tM110_23 ++ (tM110_24 ++ (tM110_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 110：区間 N 24・M 26。 -/
theorem pair110_ok : pairOk P pair110 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN110_0) (wseg_append (wseg_of sN110_1) (wseg_append (wseg_of sN110_2) (wseg_append (wseg_of sN110_3) (wseg_append (wseg_of sN110_4) (wseg_append (wseg_of sN110_5) (wseg_append (wseg_of sN110_6) (wseg_append (wseg_of sN110_7) (wseg_append (wseg_of sN110_8) (wseg_append (wseg_of sN110_9) (wseg_append (wseg_of sN110_10) (wseg_append (wseg_of sN110_11) (wseg_append (wseg_of sN110_12) (wseg_append (wseg_of sN110_13) (wseg_append (wseg_of sN110_14) (wseg_append (wseg_of sN110_15) (wseg_append (wseg_of sN110_16) (wseg_append (wseg_of sN110_17) (wseg_append (wseg_of sN110_18) (wseg_append (wseg_of sN110_19) (wseg_append (wseg_of sN110_20) (wseg_append (wseg_of sN110_21) (wseg_append (wseg_of sN110_22) (wseg_of sN110_23)))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM110_0) (wseg_append (wseg_of sM110_1) (wseg_append (wseg_of sM110_2) (wseg_append (wseg_of sM110_3) (wseg_append (wseg_of sM110_4) (wseg_append (wseg_of sM110_5) (wseg_append (wseg_of sM110_6) (wseg_append (wseg_of sM110_7) (wseg_append (wseg_of sM110_8) (wseg_append (wseg_of sM110_9) (wseg_append (wseg_of sM110_10) (wseg_append (wseg_of sM110_11) (wseg_append (wseg_of sM110_12) (wseg_append (wseg_of sM110_13) (wseg_append (wseg_of sM110_14) (wseg_append (wseg_of sM110_15) (wseg_append (wseg_of sM110_16) (wseg_append (wseg_of sM110_17) (wseg_append (wseg_of sM110_18) (wseg_append (wseg_of sM110_19) (wseg_append (wseg_of sM110_20) (wseg_append (wseg_of sM110_21) (wseg_append (wseg_of sM110_22) (wseg_append (wseg_of sM110_23) (wseg_append (wseg_of sM110_24) (wseg_of sM110_25)))))))))))))))))))))))))))

def pair111 : Pair where
  nb := nbN111
  kmNum := 805607
  kmDen := 16777216
  toksN := tN111_0 ++ (tN111_1 ++ (tN111_2 ++ (tN111_3 ++ (tN111_4 ++ (tN111_5 ++ (tN111_6 ++ (tN111_7 ++ (tN111_8 ++ (tN111_9 ++ (tN111_10 ++ (tN111_11 ++ (tN111_12 ++ (tN111_13 ++ (tN111_14 ++ (tN111_15 ++ (tN111_16 ++ (tN111_17 ++ (tN111_18 ++ (tN111_19 ++ (tN111_20 ++ (tN111_21 ++ (tN111_22))))))))))))))))))))))
  toksM := tM111_0 ++ (tM111_1 ++ (tM111_2 ++ (tM111_3 ++ (tM111_4 ++ (tM111_5 ++ (tM111_6 ++ (tM111_7 ++ (tM111_8 ++ (tM111_9 ++ (tM111_10 ++ (tM111_11 ++ (tM111_12 ++ (tM111_13 ++ (tM111_14 ++ (tM111_15 ++ (tM111_16 ++ (tM111_17 ++ (tM111_18 ++ (tM111_19 ++ (tM111_20 ++ (tM111_21 ++ (tM111_22 ++ (tM111_23 ++ (tM111_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 111：区間 N 23・M 25。 -/
theorem pair111_ok : pairOk P pair111 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN111_0) (wseg_append (wseg_of sN111_1) (wseg_append (wseg_of sN111_2) (wseg_append (wseg_of sN111_3) (wseg_append (wseg_of sN111_4) (wseg_append (wseg_of sN111_5) (wseg_append (wseg_of sN111_6) (wseg_append (wseg_of sN111_7) (wseg_append (wseg_of sN111_8) (wseg_append (wseg_of sN111_9) (wseg_append (wseg_of sN111_10) (wseg_append (wseg_of sN111_11) (wseg_append (wseg_of sN111_12) (wseg_append (wseg_of sN111_13) (wseg_append (wseg_of sN111_14) (wseg_append (wseg_of sN111_15) (wseg_append (wseg_of sN111_16) (wseg_append (wseg_of sN111_17) (wseg_append (wseg_of sN111_18) (wseg_append (wseg_of sN111_19) (wseg_append (wseg_of sN111_20) (wseg_append (wseg_of sN111_21) (wseg_of sN111_22))))))))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM111_0) (wseg_append (wseg_of sM111_1) (wseg_append (wseg_of sM111_2) (wseg_append (wseg_of sM111_3) (wseg_append (wseg_of sM111_4) (wseg_append (wseg_of sM111_5) (wseg_append (wseg_of sM111_6) (wseg_append (wseg_of sM111_7) (wseg_append (wseg_of sM111_8) (wseg_append (wseg_of sM111_9) (wseg_append (wseg_of sM111_10) (wseg_append (wseg_of sM111_11) (wseg_append (wseg_of sM111_12) (wseg_append (wseg_of sM111_13) (wseg_append (wseg_of sM111_14) (wseg_append (wseg_of sM111_15) (wseg_append (wseg_of sM111_16) (wseg_append (wseg_of sM111_17) (wseg_append (wseg_of sM111_18) (wseg_append (wseg_of sM111_19) (wseg_append (wseg_of sM111_20) (wseg_append (wseg_of sM111_21) (wseg_append (wseg_of sM111_22) (wseg_append (wseg_of sM111_23) (wseg_of sM111_24))))))))))))))))))))))))))

end PackLean.D28.Cub
