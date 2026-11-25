-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS015_0
import PackLean.D28.Ico.K.FarS015_1
import PackLean.D28.Ico.K.FarS015_2
import PackLean.D28.Ico.K.FarS015_3
import PackLean.D28.Ico.K.FarS015_4
import PackLean.D28.Ico.K.FarS015_5
import PackLean.D28.Ico.K.FarS015_6
import PackLean.D28.Ico.K.FarS015_7
import PackLean.D28.Ico.K.FarS015_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair103 : Pair where
  nb := nbN103
  kmNum := 12593
  kmDen := 4194304
  toksN := tN103_0 ++ (tN103_1 ++ (tN103_2 ++ (tN103_3 ++ (tN103_4 ++ (tN103_5 ++ (tN103_6 ++ (tN103_7 ++ (tN103_8 ++ (tN103_9 ++ (tN103_10 ++ (tN103_11)))))))))))
  toksM := tM103_0 ++ (tM103_1 ++ (tM103_2 ++ (tM103_3 ++ (tM103_4 ++ (tM103_5 ++ (tM103_6 ++ (tM103_7 ++ (tM103_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 103：区間 N 12・M 9。 -/
theorem pair103_ok : pairOk P pair103 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN103_0) (wseg_append (wseg_of sN103_1) (wseg_append (wseg_of sN103_2) (wseg_append (wseg_of sN103_3) (wseg_append (wseg_of sN103_4) (wseg_append (wseg_of sN103_5) (wseg_append (wseg_of sN103_6) (wseg_append (wseg_of sN103_7) (wseg_append (wseg_of sN103_8) (wseg_append (wseg_of sN103_9) (wseg_append (wseg_of sN103_10) (wseg_of sN103_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM103_0) (wseg_append (wseg_of sM103_1) (wseg_append (wseg_of sM103_2) (wseg_append (wseg_of sM103_3) (wseg_append (wseg_of sM103_4) (wseg_append (wseg_of sM103_5) (wseg_append (wseg_of sM103_6) (wseg_append (wseg_of sM103_7) (wseg_of sM103_8))))))))))

def pair104 : Pair where
  nb := nbN104
  kmNum := 18237
  kmDen := 4194304
  toksN := tN104_0 ++ (tN104_1 ++ (tN104_2 ++ (tN104_3 ++ (tN104_4 ++ (tN104_5 ++ (tN104_6 ++ (tN104_7 ++ (tN104_8 ++ (tN104_9 ++ (tN104_10 ++ (tN104_11)))))))))))
  toksM := tM104_0 ++ (tM104_1 ++ (tM104_2 ++ (tM104_3 ++ (tM104_4 ++ (tM104_5 ++ (tM104_6 ++ (tM104_7 ++ (tM104_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 104：区間 N 12・M 9。 -/
theorem pair104_ok : pairOk P pair104 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN104_0) (wseg_append (wseg_of sN104_1) (wseg_append (wseg_of sN104_2) (wseg_append (wseg_of sN104_3) (wseg_append (wseg_of sN104_4) (wseg_append (wseg_of sN104_5) (wseg_append (wseg_of sN104_6) (wseg_append (wseg_of sN104_7) (wseg_append (wseg_of sN104_8) (wseg_append (wseg_of sN104_9) (wseg_append (wseg_of sN104_10) (wseg_of sN104_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM104_0) (wseg_append (wseg_of sM104_1) (wseg_append (wseg_of sM104_2) (wseg_append (wseg_of sM104_3) (wseg_append (wseg_of sM104_4) (wseg_append (wseg_of sM104_5) (wseg_append (wseg_of sM104_6) (wseg_append (wseg_of sM104_7) (wseg_of sM104_8))))))))))

def pair105 : Pair where
  nb := nbN105
  kmNum := 40963
  kmDen := 8388608
  toksN := tN105_0 ++ (tN105_1 ++ (tN105_2 ++ (tN105_3 ++ (tN105_4 ++ (tN105_5 ++ (tN105_6 ++ (tN105_7 ++ (tN105_8 ++ (tN105_9 ++ (tN105_10))))))))))
  toksM := tM105_0 ++ (tM105_1 ++ (tM105_2 ++ (tM105_3 ++ (tM105_4 ++ (tM105_5 ++ (tM105_6 ++ (tM105_7 ++ (tM105_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 105：区間 N 11・M 9。 -/
theorem pair105_ok : pairOk P pair105 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN105_0) (wseg_append (wseg_of sN105_1) (wseg_append (wseg_of sN105_2) (wseg_append (wseg_of sN105_3) (wseg_append (wseg_of sN105_4) (wseg_append (wseg_of sN105_5) (wseg_append (wseg_of sN105_6) (wseg_append (wseg_of sN105_7) (wseg_append (wseg_of sN105_8) (wseg_append (wseg_of sN105_9) (wseg_of sN105_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM105_0) (wseg_append (wseg_of sM105_1) (wseg_append (wseg_of sM105_2) (wseg_append (wseg_of sM105_3) (wseg_append (wseg_of sM105_4) (wseg_append (wseg_of sM105_5) (wseg_append (wseg_of sM105_6) (wseg_append (wseg_of sM105_7) (wseg_of sM105_8))))))))))

def pair106 : Pair where
  nb := nbN106
  kmNum := 108149
  kmDen := 16777216
  toksN := tN106_0 ++ (tN106_1 ++ (tN106_2 ++ (tN106_3 ++ (tN106_4 ++ (tN106_5 ++ (tN106_6 ++ (tN106_7 ++ (tN106_8 ++ (tN106_9 ++ (tN106_10 ++ (tN106_11)))))))))))
  toksM := tM106_0 ++ (tM106_1 ++ (tM106_2 ++ (tM106_3 ++ (tM106_4 ++ (tM106_5 ++ (tM106_6 ++ (tM106_7 ++ (tM106_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 106：区間 N 12・M 9。 -/
theorem pair106_ok : pairOk P pair106 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN106_0) (wseg_append (wseg_of sN106_1) (wseg_append (wseg_of sN106_2) (wseg_append (wseg_of sN106_3) (wseg_append (wseg_of sN106_4) (wseg_append (wseg_of sN106_5) (wseg_append (wseg_of sN106_6) (wseg_append (wseg_of sN106_7) (wseg_append (wseg_of sN106_8) (wseg_append (wseg_of sN106_9) (wseg_append (wseg_of sN106_10) (wseg_of sN106_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM106_0) (wseg_append (wseg_of sM106_1) (wseg_append (wseg_of sM106_2) (wseg_append (wseg_of sM106_3) (wseg_append (wseg_of sM106_4) (wseg_append (wseg_of sM106_5) (wseg_append (wseg_of sM106_6) (wseg_append (wseg_of sM106_7) (wseg_of sM106_8))))))))))

def pair107 : Pair where
  nb := nbN107
  kmNum := 84249
  kmDen := 16777216
  toksN := tN107_0 ++ (tN107_1 ++ (tN107_2 ++ (tN107_3 ++ (tN107_4 ++ (tN107_5 ++ (tN107_6 ++ (tN107_7 ++ (tN107_8 ++ (tN107_9 ++ (tN107_10 ++ (tN107_11)))))))))))
  toksM := tM107_0 ++ (tM107_1 ++ (tM107_2 ++ (tM107_3 ++ (tM107_4 ++ (tM107_5 ++ (tM107_6 ++ (tM107_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 107：区間 N 12・M 8。 -/
theorem pair107_ok : pairOk P pair107 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN107_0) (wseg_append (wseg_of sN107_1) (wseg_append (wseg_of sN107_2) (wseg_append (wseg_of sN107_3) (wseg_append (wseg_of sN107_4) (wseg_append (wseg_of sN107_5) (wseg_append (wseg_of sN107_6) (wseg_append (wseg_of sN107_7) (wseg_append (wseg_of sN107_8) (wseg_append (wseg_of sN107_9) (wseg_append (wseg_of sN107_10) (wseg_of sN107_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM107_0) (wseg_append (wseg_of sM107_1) (wseg_append (wseg_of sM107_2) (wseg_append (wseg_of sM107_3) (wseg_append (wseg_of sM107_4) (wseg_append (wseg_of sM107_5) (wseg_append (wseg_of sM107_6) (wseg_of sM107_7)))))))))

def pair108 : Pair where
  nb := nbN108
  kmNum := 82935
  kmDen := 16777216
  toksN := tN108_0 ++ (tN108_1 ++ (tN108_2 ++ (tN108_3 ++ (tN108_4 ++ (tN108_5 ++ (tN108_6 ++ (tN108_7 ++ (tN108_8 ++ (tN108_9 ++ (tN108_10 ++ (tN108_11 ++ (tN108_12))))))))))))
  toksM := tM108_0 ++ (tM108_1 ++ (tM108_2 ++ (tM108_3 ++ (tM108_4 ++ (tM108_5 ++ (tM108_6 ++ (tM108_7 ++ (tM108_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 108：区間 N 13・M 9。 -/
theorem pair108_ok : pairOk P pair108 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN108_0) (wseg_append (wseg_of sN108_1) (wseg_append (wseg_of sN108_2) (wseg_append (wseg_of sN108_3) (wseg_append (wseg_of sN108_4) (wseg_append (wseg_of sN108_5) (wseg_append (wseg_of sN108_6) (wseg_append (wseg_of sN108_7) (wseg_append (wseg_of sN108_8) (wseg_append (wseg_of sN108_9) (wseg_append (wseg_of sN108_10) (wseg_append (wseg_of sN108_11) (wseg_of sN108_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM108_0) (wseg_append (wseg_of sM108_1) (wseg_append (wseg_of sM108_2) (wseg_append (wseg_of sM108_3) (wseg_append (wseg_of sM108_4) (wseg_append (wseg_of sM108_5) (wseg_append (wseg_of sM108_6) (wseg_append (wseg_of sM108_7) (wseg_of sM108_8))))))))))

end PackLean.D28.Ico
