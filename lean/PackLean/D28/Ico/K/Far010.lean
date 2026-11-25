-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS010_0
import PackLean.D28.Ico.K.FarS010_1
import PackLean.D28.Ico.K.FarS010_2
import PackLean.D28.Ico.K.FarS010_3
import PackLean.D28.Ico.K.FarS010_4
import PackLean.D28.Ico.K.FarS010_5
import PackLean.D28.Ico.K.FarS010_6
import PackLean.D28.Ico.K.FarS010_7
import PackLean.D28.Ico.K.FarS010_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair072 : Pair where
  nb := nbN072
  kmNum := 17919
  kmDen := 16777216
  toksN := tN072_0 ++ (tN072_1 ++ (tN072_2 ++ (tN072_3 ++ (tN072_4 ++ (tN072_5 ++ (tN072_6 ++ (tN072_7 ++ (tN072_8))))))))
  toksM := tM072_0 ++ (tM072_1 ++ (tM072_2 ++ (tM072_3 ++ (tM072_4 ++ (tM072_5 ++ (tM072_6 ++ (tM072_7 ++ (tM072_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 072：区間 N 9・M 9。 -/
theorem pair072_ok : pairOk P pair072 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN072_0) (wseg_append (wseg_of sN072_1) (wseg_append (wseg_of sN072_2) (wseg_append (wseg_of sN072_3) (wseg_append (wseg_of sN072_4) (wseg_append (wseg_of sN072_5) (wseg_append (wseg_of sN072_6) (wseg_append (wseg_of sN072_7) (wseg_of sN072_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM072_0) (wseg_append (wseg_of sM072_1) (wseg_append (wseg_of sM072_2) (wseg_append (wseg_of sM072_3) (wseg_append (wseg_of sM072_4) (wseg_append (wseg_of sM072_5) (wseg_append (wseg_of sM072_6) (wseg_append (wseg_of sM072_7) (wseg_of sM072_8))))))))))

def pair073 : Pair where
  nb := nbN073
  kmNum := 1763
  kmDen := 8388608
  toksN := tN073_0 ++ (tN073_1 ++ (tN073_2 ++ (tN073_3 ++ (tN073_4 ++ (tN073_5 ++ (tN073_6 ++ (tN073_7 ++ (tN073_8 ++ (tN073_9 ++ (tN073_10))))))))))
  toksM := tM073_0 ++ (tM073_1 ++ (tM073_2 ++ (tM073_3 ++ (tM073_4 ++ (tM073_5 ++ (tM073_6 ++ (tM073_7 ++ (tM073_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 073：区間 N 11・M 9。 -/
theorem pair073_ok : pairOk P pair073 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN073_0) (wseg_append (wseg_of sN073_1) (wseg_append (wseg_of sN073_2) (wseg_append (wseg_of sN073_3) (wseg_append (wseg_of sN073_4) (wseg_append (wseg_of sN073_5) (wseg_append (wseg_of sN073_6) (wseg_append (wseg_of sN073_7) (wseg_append (wseg_of sN073_8) (wseg_append (wseg_of sN073_9) (wseg_of sN073_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM073_0) (wseg_append (wseg_of sM073_1) (wseg_append (wseg_of sM073_2) (wseg_append (wseg_of sM073_3) (wseg_append (wseg_of sM073_4) (wseg_append (wseg_of sM073_5) (wseg_append (wseg_of sM073_6) (wseg_append (wseg_of sM073_7) (wseg_of sM073_8))))))))))

def pair074 : Pair where
  nb := nbN074
  kmNum := 0
  kmDen := 1
  toksN := tN074_0 ++ (tN074_1 ++ (tN074_2 ++ (tN074_3 ++ (tN074_4 ++ (tN074_5 ++ (tN074_6 ++ (tN074_7 ++ (tN074_8 ++ (tN074_9)))))))))
  toksM := tM074_0 ++ (tM074_1 ++ (tM074_2 ++ (tM074_3 ++ (tM074_4 ++ (tM074_5 ++ (tM074_6 ++ (tM074_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 074：区間 N 10・M 8。 -/
theorem pair074_ok : pairOk P pair074 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN074_0) (wseg_append (wseg_of sN074_1) (wseg_append (wseg_of sN074_2) (wseg_append (wseg_of sN074_3) (wseg_append (wseg_of sN074_4) (wseg_append (wseg_of sN074_5) (wseg_append (wseg_of sN074_6) (wseg_append (wseg_of sN074_7) (wseg_append (wseg_of sN074_8) (wseg_of sN074_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM074_0) (wseg_append (wseg_of sM074_1) (wseg_append (wseg_of sM074_2) (wseg_append (wseg_of sM074_3) (wseg_append (wseg_of sM074_4) (wseg_append (wseg_of sM074_5) (wseg_append (wseg_of sM074_6) (wseg_of sM074_7)))))))))

def pair075 : Pair where
  nb := nbN075
  kmNum := 77213
  kmDen := 16777216
  toksN := tN075_0 ++ (tN075_1 ++ (tN075_2 ++ (tN075_3 ++ (tN075_4 ++ (tN075_5 ++ (tN075_6 ++ (tN075_7 ++ (tN075_8))))))))
  toksM := tM075_0 ++ (tM075_1 ++ (tM075_2 ++ (tM075_3 ++ (tM075_4 ++ (tM075_5 ++ (tM075_6 ++ (tM075_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 075：区間 N 9・M 8。 -/
theorem pair075_ok : pairOk P pair075 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN075_0) (wseg_append (wseg_of sN075_1) (wseg_append (wseg_of sN075_2) (wseg_append (wseg_of sN075_3) (wseg_append (wseg_of sN075_4) (wseg_append (wseg_of sN075_5) (wseg_append (wseg_of sN075_6) (wseg_append (wseg_of sN075_7) (wseg_of sN075_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM075_0) (wseg_append (wseg_of sM075_1) (wseg_append (wseg_of sM075_2) (wseg_append (wseg_of sM075_3) (wseg_append (wseg_of sM075_4) (wseg_append (wseg_of sM075_5) (wseg_append (wseg_of sM075_6) (wseg_of sM075_7)))))))))

def pair076 : Pair where
  nb := nbN076
  kmNum := 22143
  kmDen := 2097152
  toksN := tN076_0 ++ (tN076_1 ++ (tN076_2 ++ (tN076_3 ++ (tN076_4 ++ (tN076_5 ++ (tN076_6 ++ (tN076_7 ++ (tN076_8))))))))
  toksM := tM076_0 ++ (tM076_1 ++ (tM076_2 ++ (tM076_3 ++ (tM076_4 ++ (tM076_5 ++ (tM076_6 ++ (tM076_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 076：区間 N 9・M 8。 -/
theorem pair076_ok : pairOk P pair076 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN076_0) (wseg_append (wseg_of sN076_1) (wseg_append (wseg_of sN076_2) (wseg_append (wseg_of sN076_3) (wseg_append (wseg_of sN076_4) (wseg_append (wseg_of sN076_5) (wseg_append (wseg_of sN076_6) (wseg_append (wseg_of sN076_7) (wseg_of sN076_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM076_0) (wseg_append (wseg_of sM076_1) (wseg_append (wseg_of sM076_2) (wseg_append (wseg_of sM076_3) (wseg_append (wseg_of sM076_4) (wseg_append (wseg_of sM076_5) (wseg_append (wseg_of sM076_6) (wseg_of sM076_7)))))))))

def pair077 : Pair where
  nb := nbN077
  kmNum := 3075
  kmDen := 16777216
  toksN := tN077_0 ++ (tN077_1 ++ (tN077_2 ++ (tN077_3 ++ (tN077_4 ++ (tN077_5 ++ (tN077_6 ++ (tN077_7 ++ (tN077_8 ++ (tN077_9)))))))))
  toksM := tM077_0 ++ (tM077_1 ++ (tM077_2 ++ (tM077_3 ++ (tM077_4 ++ (tM077_5 ++ (tM077_6 ++ (tM077_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 077：区間 N 10・M 8。 -/
theorem pair077_ok : pairOk P pair077 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN077_0) (wseg_append (wseg_of sN077_1) (wseg_append (wseg_of sN077_2) (wseg_append (wseg_of sN077_3) (wseg_append (wseg_of sN077_4) (wseg_append (wseg_of sN077_5) (wseg_append (wseg_of sN077_6) (wseg_append (wseg_of sN077_7) (wseg_append (wseg_of sN077_8) (wseg_of sN077_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM077_0) (wseg_append (wseg_of sM077_1) (wseg_append (wseg_of sM077_2) (wseg_append (wseg_of sM077_3) (wseg_append (wseg_of sM077_4) (wseg_append (wseg_of sM077_5) (wseg_append (wseg_of sM077_6) (wseg_of sM077_7)))))))))

def pair078 : Pair where
  nb := nbN078
  kmNum := 5927
  kmDen := 2097152
  toksN := tN078_0 ++ (tN078_1 ++ (tN078_2 ++ (tN078_3 ++ (tN078_4 ++ (tN078_5 ++ (tN078_6 ++ (tN078_7 ++ (tN078_8 ++ (tN078_9)))))))))
  toksM := tM078_0 ++ (tM078_1 ++ (tM078_2 ++ (tM078_3 ++ (tM078_4 ++ (tM078_5 ++ (tM078_6 ++ (tM078_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 078：区間 N 10・M 8。 -/
theorem pair078_ok : pairOk P pair078 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN078_0) (wseg_append (wseg_of sN078_1) (wseg_append (wseg_of sN078_2) (wseg_append (wseg_of sN078_3) (wseg_append (wseg_of sN078_4) (wseg_append (wseg_of sN078_5) (wseg_append (wseg_of sN078_6) (wseg_append (wseg_of sN078_7) (wseg_append (wseg_of sN078_8) (wseg_of sN078_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM078_0) (wseg_append (wseg_of sM078_1) (wseg_append (wseg_of sM078_2) (wseg_append (wseg_of sM078_3) (wseg_append (wseg_of sM078_4) (wseg_append (wseg_of sM078_5) (wseg_append (wseg_of sM078_6) (wseg_of sM078_7)))))))))

end PackLean.D28.Ico
