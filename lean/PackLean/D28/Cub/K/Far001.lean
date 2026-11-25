-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS001_0
import PackLean.D28.Cub.K.FarS001_1
import PackLean.D28.Cub.K.FarS001_2
import PackLean.D28.Cub.K.FarS001_3
import PackLean.D28.Cub.K.FarS001_4
import PackLean.D28.Cub.K.FarS001_5
import PackLean.D28.Cub.K.FarS001_6
import PackLean.D28.Cub.K.FarS001_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair005 : Pair where
  nb := nbN005
  kmNum := 14755
  kmDen := 2097152
  toksN := tN005_0 ++ (tN005_1 ++ (tN005_2 ++ (tN005_3 ++ (tN005_4 ++ (tN005_5 ++ (tN005_6 ++ (tN005_7 ++ (tN005_8 ++ (tN005_9 ++ (tN005_10 ++ (tN005_11 ++ (tN005_12))))))))))))
  toksM := tM005_0 ++ (tM005_1 ++ (tM005_2 ++ (tM005_3 ++ (tM005_4 ++ (tM005_5 ++ (tM005_6 ++ (tM005_7 ++ (tM005_8 ++ (tM005_9 ++ (tM005_10 ++ (tM005_11 ++ (tM005_12 ++ (tM005_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 005：区間 N 13・M 14。 -/
theorem pair005_ok : pairOk P pair005 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN005_0) (wseg_append (wseg_of sN005_1) (wseg_append (wseg_of sN005_2) (wseg_append (wseg_of sN005_3) (wseg_append (wseg_of sN005_4) (wseg_append (wseg_of sN005_5) (wseg_append (wseg_of sN005_6) (wseg_append (wseg_of sN005_7) (wseg_append (wseg_of sN005_8) (wseg_append (wseg_of sN005_9) (wseg_append (wseg_of sN005_10) (wseg_append (wseg_of sN005_11) (wseg_of sN005_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM005_0) (wseg_append (wseg_of sM005_1) (wseg_append (wseg_of sM005_2) (wseg_append (wseg_of sM005_3) (wseg_append (wseg_of sM005_4) (wseg_append (wseg_of sM005_5) (wseg_append (wseg_of sM005_6) (wseg_append (wseg_of sM005_7) (wseg_append (wseg_of sM005_8) (wseg_append (wseg_of sM005_9) (wseg_append (wseg_of sM005_10) (wseg_append (wseg_of sM005_11) (wseg_append (wseg_of sM005_12) (wseg_of sM005_13)))))))))))))))

def pair006 : Pair where
  nb := nbN006
  kmNum := 351719
  kmDen := 16777216
  toksN := tN006_0 ++ (tN006_1 ++ (tN006_2 ++ (tN006_3 ++ (tN006_4 ++ (tN006_5 ++ (tN006_6 ++ (tN006_7 ++ (tN006_8 ++ (tN006_9 ++ (tN006_10 ++ (tN006_11)))))))))))
  toksM := tM006_0 ++ (tM006_1 ++ (tM006_2 ++ (tM006_3 ++ (tM006_4 ++ (tM006_5 ++ (tM006_6 ++ (tM006_7 ++ (tM006_8 ++ (tM006_9 ++ (tM006_10 ++ (tM006_11 ++ (tM006_12 ++ (tM006_13 ++ (tM006_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 006：区間 N 12・M 15。 -/
theorem pair006_ok : pairOk P pair006 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN006_0) (wseg_append (wseg_of sN006_1) (wseg_append (wseg_of sN006_2) (wseg_append (wseg_of sN006_3) (wseg_append (wseg_of sN006_4) (wseg_append (wseg_of sN006_5) (wseg_append (wseg_of sN006_6) (wseg_append (wseg_of sN006_7) (wseg_append (wseg_of sN006_8) (wseg_append (wseg_of sN006_9) (wseg_append (wseg_of sN006_10) (wseg_of sN006_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM006_0) (wseg_append (wseg_of sM006_1) (wseg_append (wseg_of sM006_2) (wseg_append (wseg_of sM006_3) (wseg_append (wseg_of sM006_4) (wseg_append (wseg_of sM006_5) (wseg_append (wseg_of sM006_6) (wseg_append (wseg_of sM006_7) (wseg_append (wseg_of sM006_8) (wseg_append (wseg_of sM006_9) (wseg_append (wseg_of sM006_10) (wseg_append (wseg_of sM006_11) (wseg_append (wseg_of sM006_12) (wseg_append (wseg_of sM006_13) (wseg_of sM006_14))))))))))))))))

def pair007 : Pair where
  nb := nbN007
  kmNum := 103049
  kmDen := 16777216
  toksN := tN007_0 ++ (tN007_1 ++ (tN007_2 ++ (tN007_3 ++ (tN007_4 ++ (tN007_5 ++ (tN007_6 ++ (tN007_7 ++ (tN007_8 ++ (tN007_9 ++ (tN007_10 ++ (tN007_11 ++ (tN007_12 ++ (tN007_13)))))))))))))
  toksM := tM007_0 ++ (tM007_1 ++ (tM007_2 ++ (tM007_3 ++ (tM007_4 ++ (tM007_5 ++ (tM007_6 ++ (tM007_7 ++ (tM007_8 ++ (tM007_9 ++ (tM007_10 ++ (tM007_11 ++ (tM007_12 ++ (tM007_13 ++ (tM007_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 007：区間 N 14・M 15。 -/
theorem pair007_ok : pairOk P pair007 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN007_0) (wseg_append (wseg_of sN007_1) (wseg_append (wseg_of sN007_2) (wseg_append (wseg_of sN007_3) (wseg_append (wseg_of sN007_4) (wseg_append (wseg_of sN007_5) (wseg_append (wseg_of sN007_6) (wseg_append (wseg_of sN007_7) (wseg_append (wseg_of sN007_8) (wseg_append (wseg_of sN007_9) (wseg_append (wseg_of sN007_10) (wseg_append (wseg_of sN007_11) (wseg_append (wseg_of sN007_12) (wseg_of sN007_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM007_0) (wseg_append (wseg_of sM007_1) (wseg_append (wseg_of sM007_2) (wseg_append (wseg_of sM007_3) (wseg_append (wseg_of sM007_4) (wseg_append (wseg_of sM007_5) (wseg_append (wseg_of sM007_6) (wseg_append (wseg_of sM007_7) (wseg_append (wseg_of sM007_8) (wseg_append (wseg_of sM007_9) (wseg_append (wseg_of sM007_10) (wseg_append (wseg_of sM007_11) (wseg_append (wseg_of sM007_12) (wseg_append (wseg_of sM007_13) (wseg_of sM007_14))))))))))))))))

def pair008 : Pair where
  nb := nbN008
  kmNum := 308035
  kmDen := 16777216
  toksN := tN008_0 ++ (tN008_1 ++ (tN008_2 ++ (tN008_3 ++ (tN008_4 ++ (tN008_5 ++ (tN008_6 ++ (tN008_7 ++ (tN008_8 ++ (tN008_9 ++ (tN008_10 ++ (tN008_11 ++ (tN008_12))))))))))))
  toksM := tM008_0 ++ (tM008_1 ++ (tM008_2 ++ (tM008_3 ++ (tM008_4 ++ (tM008_5 ++ (tM008_6 ++ (tM008_7 ++ (tM008_8 ++ (tM008_9 ++ (tM008_10 ++ (tM008_11 ++ (tM008_12 ++ (tM008_13 ++ (tM008_14 ++ (tM008_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 008：区間 N 13・M 16。 -/
theorem pair008_ok : pairOk P pair008 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN008_0) (wseg_append (wseg_of sN008_1) (wseg_append (wseg_of sN008_2) (wseg_append (wseg_of sN008_3) (wseg_append (wseg_of sN008_4) (wseg_append (wseg_of sN008_5) (wseg_append (wseg_of sN008_6) (wseg_append (wseg_of sN008_7) (wseg_append (wseg_of sN008_8) (wseg_append (wseg_of sN008_9) (wseg_append (wseg_of sN008_10) (wseg_append (wseg_of sN008_11) (wseg_of sN008_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM008_0) (wseg_append (wseg_of sM008_1) (wseg_append (wseg_of sM008_2) (wseg_append (wseg_of sM008_3) (wseg_append (wseg_of sM008_4) (wseg_append (wseg_of sM008_5) (wseg_append (wseg_of sM008_6) (wseg_append (wseg_of sM008_7) (wseg_append (wseg_of sM008_8) (wseg_append (wseg_of sM008_9) (wseg_append (wseg_of sM008_10) (wseg_append (wseg_of sM008_11) (wseg_append (wseg_of sM008_12) (wseg_append (wseg_of sM008_13) (wseg_append (wseg_of sM008_14) (wseg_of sM008_15)))))))))))))))))

end PackLean.D28.Cub
