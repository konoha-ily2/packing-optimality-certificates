-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS008_0
import PackLean.D28.Ico.K.FarS008_1
import PackLean.D28.Ico.K.FarS008_2
import PackLean.D28.Ico.K.FarS008_3
import PackLean.D28.Ico.K.FarS008_4
import PackLean.D28.Ico.K.FarS008_5
import PackLean.D28.Ico.K.FarS008_6
import PackLean.D28.Ico.K.FarS008_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair060 : Pair where
  nb := nbN060
  kmNum := 1
  kmDen := 16777216
  toksN := tN060_0 ++ (tN060_1 ++ (tN060_2 ++ (tN060_3 ++ (tN060_4 ++ (tN060_5 ++ (tN060_6 ++ (tN060_7 ++ (tN060_8 ++ (tN060_9 ++ (tN060_10 ++ (tN060_11)))))))))))
  toksM := tM060_0 ++ (tM060_1 ++ (tM060_2 ++ (tM060_3 ++ (tM060_4 ++ (tM060_5 ++ (tM060_6 ++ (tM060_7 ++ (tM060_8 ++ (tM060_9 ++ (tM060_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 060：区間 N 12・M 11。 -/
theorem pair060_ok : pairOk P pair060 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN060_0) (wseg_append (wseg_of sN060_1) (wseg_append (wseg_of sN060_2) (wseg_append (wseg_of sN060_3) (wseg_append (wseg_of sN060_4) (wseg_append (wseg_of sN060_5) (wseg_append (wseg_of sN060_6) (wseg_append (wseg_of sN060_7) (wseg_append (wseg_of sN060_8) (wseg_append (wseg_of sN060_9) (wseg_append (wseg_of sN060_10) (wseg_of sN060_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM060_0) (wseg_append (wseg_of sM060_1) (wseg_append (wseg_of sM060_2) (wseg_append (wseg_of sM060_3) (wseg_append (wseg_of sM060_4) (wseg_append (wseg_of sM060_5) (wseg_append (wseg_of sM060_6) (wseg_append (wseg_of sM060_7) (wseg_append (wseg_of sM060_8) (wseg_append (wseg_of sM060_9) (wseg_of sM060_10))))))))))))

def pair061 : Pair where
  nb := nbN061
  kmNum := 0
  kmDen := 1
  toksN := tN061_0 ++ (tN061_1 ++ (tN061_2 ++ (tN061_3 ++ (tN061_4 ++ (tN061_5 ++ (tN061_6 ++ (tN061_7 ++ (tN061_8 ++ (tN061_9)))))))))
  toksM := tM061_0 ++ (tM061_1 ++ (tM061_2 ++ (tM061_3 ++ (tM061_4 ++ (tM061_5 ++ (tM061_6 ++ (tM061_7 ++ (tM061_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 061：区間 N 10・M 9。 -/
theorem pair061_ok : pairOk P pair061 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN061_0) (wseg_append (wseg_of sN061_1) (wseg_append (wseg_of sN061_2) (wseg_append (wseg_of sN061_3) (wseg_append (wseg_of sN061_4) (wseg_append (wseg_of sN061_5) (wseg_append (wseg_of sN061_6) (wseg_append (wseg_of sN061_7) (wseg_append (wseg_of sN061_8) (wseg_of sN061_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM061_0) (wseg_append (wseg_of sM061_1) (wseg_append (wseg_of sM061_2) (wseg_append (wseg_of sM061_3) (wseg_append (wseg_of sM061_4) (wseg_append (wseg_of sM061_5) (wseg_append (wseg_of sM061_6) (wseg_append (wseg_of sM061_7) (wseg_of sM061_8))))))))))

def pair062 : Pair where
  nb := nbN062
  kmNum := 0
  kmDen := 1
  toksN := tN062_0 ++ (tN062_1 ++ (tN062_2 ++ (tN062_3 ++ (tN062_4 ++ (tN062_5 ++ (tN062_6 ++ (tN062_7 ++ (tN062_8 ++ (tN062_9 ++ (tN062_10))))))))))
  toksM := tM062_0 ++ (tM062_1 ++ (tM062_2 ++ (tM062_3 ++ (tM062_4 ++ (tM062_5 ++ (tM062_6 ++ (tM062_7 ++ (tM062_8 ++ (tM062_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 062：区間 N 11・M 10。 -/
theorem pair062_ok : pairOk P pair062 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN062_0) (wseg_append (wseg_of sN062_1) (wseg_append (wseg_of sN062_2) (wseg_append (wseg_of sN062_3) (wseg_append (wseg_of sN062_4) (wseg_append (wseg_of sN062_5) (wseg_append (wseg_of sN062_6) (wseg_append (wseg_of sN062_7) (wseg_append (wseg_of sN062_8) (wseg_append (wseg_of sN062_9) (wseg_of sN062_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM062_0) (wseg_append (wseg_of sM062_1) (wseg_append (wseg_of sM062_2) (wseg_append (wseg_of sM062_3) (wseg_append (wseg_of sM062_4) (wseg_append (wseg_of sM062_5) (wseg_append (wseg_of sM062_6) (wseg_append (wseg_of sM062_7) (wseg_append (wseg_of sM062_8) (wseg_of sM062_9)))))))))))

def pair063 : Pair where
  nb := nbN063
  kmNum := 0
  kmDen := 1
  toksN := tN063_0 ++ (tN063_1 ++ (tN063_2 ++ (tN063_3 ++ (tN063_4 ++ (tN063_5 ++ (tN063_6 ++ (tN063_7 ++ (tN063_8))))))))
  toksM := tM063_0 ++ (tM063_1 ++ (tM063_2 ++ (tM063_3 ++ (tM063_4 ++ (tM063_5 ++ (tM063_6 ++ (tM063_7 ++ (tM063_8 ++ (tM063_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 063：区間 N 9・M 10。 -/
theorem pair063_ok : pairOk P pair063 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN063_0) (wseg_append (wseg_of sN063_1) (wseg_append (wseg_of sN063_2) (wseg_append (wseg_of sN063_3) (wseg_append (wseg_of sN063_4) (wseg_append (wseg_of sN063_5) (wseg_append (wseg_of sN063_6) (wseg_append (wseg_of sN063_7) (wseg_of sN063_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM063_0) (wseg_append (wseg_of sM063_1) (wseg_append (wseg_of sM063_2) (wseg_append (wseg_of sM063_3) (wseg_append (wseg_of sM063_4) (wseg_append (wseg_of sM063_5) (wseg_append (wseg_of sM063_6) (wseg_append (wseg_of sM063_7) (wseg_append (wseg_of sM063_8) (wseg_of sM063_9)))))))))))

def pair064 : Pair where
  nb := nbN064
  kmNum := 1
  kmDen := 16777216
  toksN := tN064_0 ++ (tN064_1 ++ (tN064_2 ++ (tN064_3 ++ (tN064_4 ++ (tN064_5 ++ (tN064_6 ++ (tN064_7 ++ (tN064_8 ++ (tN064_9)))))))))
  toksM := tM064_0 ++ (tM064_1 ++ (tM064_2 ++ (tM064_3 ++ (tM064_4 ++ (tM064_5 ++ (tM064_6 ++ (tM064_7 ++ (tM064_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 064：区間 N 10・M 9。 -/
theorem pair064_ok : pairOk P pair064 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN064_0) (wseg_append (wseg_of sN064_1) (wseg_append (wseg_of sN064_2) (wseg_append (wseg_of sN064_3) (wseg_append (wseg_of sN064_4) (wseg_append (wseg_of sN064_5) (wseg_append (wseg_of sN064_6) (wseg_append (wseg_of sN064_7) (wseg_append (wseg_of sN064_8) (wseg_of sN064_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM064_0) (wseg_append (wseg_of sM064_1) (wseg_append (wseg_of sM064_2) (wseg_append (wseg_of sM064_3) (wseg_append (wseg_of sM064_4) (wseg_append (wseg_of sM064_5) (wseg_append (wseg_of sM064_6) (wseg_append (wseg_of sM064_7) (wseg_of sM064_8))))))))))

def pair065 : Pair where
  nb := nbN065
  kmNum := 1
  kmDen := 16777216
  toksN := tN065_0 ++ (tN065_1 ++ (tN065_2 ++ (tN065_3 ++ (tN065_4 ++ (tN065_5 ++ (tN065_6 ++ (tN065_7 ++ (tN065_8))))))))
  toksM := tM065_0 ++ (tM065_1 ++ (tM065_2 ++ (tM065_3 ++ (tM065_4 ++ (tM065_5 ++ (tM065_6 ++ (tM065_7 ++ (tM065_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 065：区間 N 9・M 9。 -/
theorem pair065_ok : pairOk P pair065 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN065_0) (wseg_append (wseg_of sN065_1) (wseg_append (wseg_of sN065_2) (wseg_append (wseg_of sN065_3) (wseg_append (wseg_of sN065_4) (wseg_append (wseg_of sN065_5) (wseg_append (wseg_of sN065_6) (wseg_append (wseg_of sN065_7) (wseg_of sN065_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM065_0) (wseg_append (wseg_of sM065_1) (wseg_append (wseg_of sM065_2) (wseg_append (wseg_of sM065_3) (wseg_append (wseg_of sM065_4) (wseg_append (wseg_of sM065_5) (wseg_append (wseg_of sM065_6) (wseg_append (wseg_of sM065_7) (wseg_of sM065_8))))))))))

end PackLean.D28.Ico
