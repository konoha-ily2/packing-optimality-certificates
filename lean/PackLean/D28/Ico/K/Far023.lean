-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS023_0
import PackLean.D28.Ico.K.FarS023_1
import PackLean.D28.Ico.K.FarS023_2
import PackLean.D28.Ico.K.FarS023_3
import PackLean.D28.Ico.K.FarS023_4
import PackLean.D28.Ico.K.FarS023_5
import PackLean.D28.Ico.K.FarS023_6
import PackLean.D28.Ico.K.FarS023_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair152 : Pair where
  nb := nbN152
  kmNum := 111017
  kmDen := 16777216
  toksN := tN152_0 ++ (tN152_1 ++ (tN152_2 ++ (tN152_3 ++ (tN152_4 ++ (tN152_5 ++ (tN152_6 ++ (tN152_7 ++ (tN152_8 ++ (tN152_9 ++ (tN152_10 ++ (tN152_11 ++ (tN152_12))))))))))))
  toksM := tM152_0 ++ (tM152_1 ++ (tM152_2 ++ (tM152_3 ++ (tM152_4 ++ (tM152_5 ++ (tM152_6 ++ (tM152_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 152：区間 N 13・M 8。 -/
theorem pair152_ok : pairOk P pair152 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN152_0) (wseg_append (wseg_of sN152_1) (wseg_append (wseg_of sN152_2) (wseg_append (wseg_of sN152_3) (wseg_append (wseg_of sN152_4) (wseg_append (wseg_of sN152_5) (wseg_append (wseg_of sN152_6) (wseg_append (wseg_of sN152_7) (wseg_append (wseg_of sN152_8) (wseg_append (wseg_of sN152_9) (wseg_append (wseg_of sN152_10) (wseg_append (wseg_of sN152_11) (wseg_of sN152_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM152_0) (wseg_append (wseg_of sM152_1) (wseg_append (wseg_of sM152_2) (wseg_append (wseg_of sM152_3) (wseg_append (wseg_of sM152_4) (wseg_append (wseg_of sM152_5) (wseg_append (wseg_of sM152_6) (wseg_of sM152_7)))))))))

def pair153 : Pair where
  nb := nbN153
  kmNum := 309575
  kmDen := 8388608
  toksN := tN153_0 ++ (tN153_1 ++ (tN153_2 ++ (tN153_3 ++ (tN153_4 ++ (tN153_5 ++ (tN153_6 ++ (tN153_7 ++ (tN153_8 ++ (tN153_9)))))))))
  toksM := tM153_0 ++ (tM153_1 ++ (tM153_2 ++ (tM153_3 ++ (tM153_4 ++ (tM153_5 ++ (tM153_6 ++ (tM153_7 ++ (tM153_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 153：区間 N 10・M 9。 -/
theorem pair153_ok : pairOk P pair153 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN153_0) (wseg_append (wseg_of sN153_1) (wseg_append (wseg_of sN153_2) (wseg_append (wseg_of sN153_3) (wseg_append (wseg_of sN153_4) (wseg_append (wseg_of sN153_5) (wseg_append (wseg_of sN153_6) (wseg_append (wseg_of sN153_7) (wseg_append (wseg_of sN153_8) (wseg_of sN153_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM153_0) (wseg_append (wseg_of sM153_1) (wseg_append (wseg_of sM153_2) (wseg_append (wseg_of sM153_3) (wseg_append (wseg_of sM153_4) (wseg_append (wseg_of sM153_5) (wseg_append (wseg_of sM153_6) (wseg_append (wseg_of sM153_7) (wseg_of sM153_8))))))))))

def pair154 : Pair where
  nb := nbN154
  kmNum := 34803
  kmDen := 8388608
  toksN := tN154_0 ++ (tN154_1 ++ (tN154_2 ++ (tN154_3 ++ (tN154_4 ++ (tN154_5 ++ (tN154_6 ++ (tN154_7 ++ (tN154_8 ++ (tN154_9 ++ (tN154_10 ++ (tN154_11 ++ (tN154_12 ++ (tN154_13 ++ (tN154_14))))))))))))))
  toksM := tM154_0 ++ (tM154_1 ++ (tM154_2 ++ (tM154_3 ++ (tM154_4 ++ (tM154_5 ++ (tM154_6 ++ (tM154_7 ++ (tM154_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 154：区間 N 15・M 9。 -/
theorem pair154_ok : pairOk P pair154 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN154_0) (wseg_append (wseg_of sN154_1) (wseg_append (wseg_of sN154_2) (wseg_append (wseg_of sN154_3) (wseg_append (wseg_of sN154_4) (wseg_append (wseg_of sN154_5) (wseg_append (wseg_of sN154_6) (wseg_append (wseg_of sN154_7) (wseg_append (wseg_of sN154_8) (wseg_append (wseg_of sN154_9) (wseg_append (wseg_of sN154_10) (wseg_append (wseg_of sN154_11) (wseg_append (wseg_of sN154_12) (wseg_append (wseg_of sN154_13) (wseg_of sN154_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM154_0) (wseg_append (wseg_of sM154_1) (wseg_append (wseg_of sM154_2) (wseg_append (wseg_of sM154_3) (wseg_append (wseg_of sM154_4) (wseg_append (wseg_of sM154_5) (wseg_append (wseg_of sM154_6) (wseg_append (wseg_of sM154_7) (wseg_of sM154_8))))))))))

def pair155 : Pair where
  nb := nbN155
  kmNum := 5303
  kmDen := 16777216
  toksN := tN155_0 ++ (tN155_1 ++ (tN155_2 ++ (tN155_3 ++ (tN155_4 ++ (tN155_5 ++ (tN155_6 ++ (tN155_7 ++ (tN155_8 ++ (tN155_9 ++ (tN155_10 ++ (tN155_11 ++ (tN155_12 ++ (tN155_13 ++ (tN155_14))))))))))))))
  toksM := tM155_0 ++ (tM155_1 ++ (tM155_2 ++ (tM155_3 ++ (tM155_4 ++ (tM155_5 ++ (tM155_6 ++ (tM155_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 155：区間 N 15・M 8。 -/
theorem pair155_ok : pairOk P pair155 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN155_0) (wseg_append (wseg_of sN155_1) (wseg_append (wseg_of sN155_2) (wseg_append (wseg_of sN155_3) (wseg_append (wseg_of sN155_4) (wseg_append (wseg_of sN155_5) (wseg_append (wseg_of sN155_6) (wseg_append (wseg_of sN155_7) (wseg_append (wseg_of sN155_8) (wseg_append (wseg_of sN155_9) (wseg_append (wseg_of sN155_10) (wseg_append (wseg_of sN155_11) (wseg_append (wseg_of sN155_12) (wseg_append (wseg_of sN155_13) (wseg_of sN155_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM155_0) (wseg_append (wseg_of sM155_1) (wseg_append (wseg_of sM155_2) (wseg_append (wseg_of sM155_3) (wseg_append (wseg_of sM155_4) (wseg_append (wseg_of sM155_5) (wseg_append (wseg_of sM155_6) (wseg_of sM155_7)))))))))

def pair156 : Pair where
  nb := nbN156
  kmNum := 171161
  kmDen := 16777216
  toksN := tN156_0 ++ (tN156_1 ++ (tN156_2 ++ (tN156_3 ++ (tN156_4 ++ (tN156_5 ++ (tN156_6 ++ (tN156_7 ++ (tN156_8 ++ (tN156_9 ++ (tN156_10 ++ (tN156_11 ++ (tN156_12 ++ (tN156_13 ++ (tN156_14))))))))))))))
  toksM := tM156_0 ++ (tM156_1 ++ (tM156_2 ++ (tM156_3 ++ (tM156_4 ++ (tM156_5 ++ (tM156_6 ++ (tM156_7 ++ (tM156_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 156：区間 N 15・M 9。 -/
theorem pair156_ok : pairOk P pair156 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN156_0) (wseg_append (wseg_of sN156_1) (wseg_append (wseg_of sN156_2) (wseg_append (wseg_of sN156_3) (wseg_append (wseg_of sN156_4) (wseg_append (wseg_of sN156_5) (wseg_append (wseg_of sN156_6) (wseg_append (wseg_of sN156_7) (wseg_append (wseg_of sN156_8) (wseg_append (wseg_of sN156_9) (wseg_append (wseg_of sN156_10) (wseg_append (wseg_of sN156_11) (wseg_append (wseg_of sN156_12) (wseg_append (wseg_of sN156_13) (wseg_of sN156_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM156_0) (wseg_append (wseg_of sM156_1) (wseg_append (wseg_of sM156_2) (wseg_append (wseg_of sM156_3) (wseg_append (wseg_of sM156_4) (wseg_append (wseg_of sM156_5) (wseg_append (wseg_of sM156_6) (wseg_append (wseg_of sM156_7) (wseg_of sM156_8))))))))))

end PackLean.D28.Ico
