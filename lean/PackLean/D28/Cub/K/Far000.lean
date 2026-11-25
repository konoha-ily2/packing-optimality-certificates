-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS000_0
import PackLean.D28.Cub.K.FarS000_1
import PackLean.D28.Cub.K.FarS000_2
import PackLean.D28.Cub.K.FarS000_3
import PackLean.D28.Cub.K.FarS000_4
import PackLean.D28.Cub.K.FarS000_5
import PackLean.D28.Cub.K.FarS000_6
import PackLean.D28.Cub.K.FarS000_7
import PackLean.D28.Cub.K.FarS000_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair000 : Pair where
  nb := nbN000
  kmNum := 130681
  kmDen := 16777216
  toksN := tN000_0 ++ (tN000_1 ++ (tN000_2 ++ (tN000_3 ++ (tN000_4 ++ (tN000_5 ++ (tN000_6 ++ (tN000_7 ++ (tN000_8 ++ (tN000_9 ++ (tN000_10))))))))))
  toksM := tM000_0 ++ (tM000_1 ++ (tM000_2 ++ (tM000_3 ++ (tM000_4 ++ (tM000_5 ++ (tM000_6 ++ (tM000_7 ++ (tM000_8 ++ (tM000_9 ++ (tM000_10 ++ (tM000_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 000：区間 N 11・M 12。 -/
theorem pair000_ok : pairOk P pair000 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN000_0) (wseg_append (wseg_of sN000_1) (wseg_append (wseg_of sN000_2) (wseg_append (wseg_of sN000_3) (wseg_append (wseg_of sN000_4) (wseg_append (wseg_of sN000_5) (wseg_append (wseg_of sN000_6) (wseg_append (wseg_of sN000_7) (wseg_append (wseg_of sN000_8) (wseg_append (wseg_of sN000_9) (wseg_of sN000_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM000_0) (wseg_append (wseg_of sM000_1) (wseg_append (wseg_of sM000_2) (wseg_append (wseg_of sM000_3) (wseg_append (wseg_of sM000_4) (wseg_append (wseg_of sM000_5) (wseg_append (wseg_of sM000_6) (wseg_append (wseg_of sM000_7) (wseg_append (wseg_of sM000_8) (wseg_append (wseg_of sM000_9) (wseg_append (wseg_of sM000_10) (wseg_of sM000_11)))))))))))))

def pair001 : Pair where
  nb := nbN001
  kmNum := 365749
  kmDen := 16777216
  toksN := tN001_0 ++ (tN001_1 ++ (tN001_2 ++ (tN001_3 ++ (tN001_4 ++ (tN001_5 ++ (tN001_6 ++ (tN001_7 ++ (tN001_8 ++ (tN001_9)))))))))
  toksM := tM001_0 ++ (tM001_1 ++ (tM001_2 ++ (tM001_3 ++ (tM001_4 ++ (tM001_5 ++ (tM001_6 ++ (tM001_7 ++ (tM001_8 ++ (tM001_9 ++ (tM001_10 ++ (tM001_11 ++ (tM001_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 001：区間 N 10・M 13。 -/
theorem pair001_ok : pairOk P pair001 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN001_0) (wseg_append (wseg_of sN001_1) (wseg_append (wseg_of sN001_2) (wseg_append (wseg_of sN001_3) (wseg_append (wseg_of sN001_4) (wseg_append (wseg_of sN001_5) (wseg_append (wseg_of sN001_6) (wseg_append (wseg_of sN001_7) (wseg_append (wseg_of sN001_8) (wseg_of sN001_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM001_0) (wseg_append (wseg_of sM001_1) (wseg_append (wseg_of sM001_2) (wseg_append (wseg_of sM001_3) (wseg_append (wseg_of sM001_4) (wseg_append (wseg_of sM001_5) (wseg_append (wseg_of sM001_6) (wseg_append (wseg_of sM001_7) (wseg_append (wseg_of sM001_8) (wseg_append (wseg_of sM001_9) (wseg_append (wseg_of sM001_10) (wseg_append (wseg_of sM001_11) (wseg_of sM001_12))))))))))))))

def pair002 : Pair where
  nb := nbN002
  kmNum := 127331
  kmDen := 16777216
  toksN := tN002_0 ++ (tN002_1 ++ (tN002_2 ++ (tN002_3 ++ (tN002_4 ++ (tN002_5 ++ (tN002_6 ++ (tN002_7 ++ (tN002_8 ++ (tN002_9 ++ (tN002_10 ++ (tN002_11)))))))))))
  toksM := tM002_0 ++ (tM002_1 ++ (tM002_2 ++ (tM002_3 ++ (tM002_4 ++ (tM002_5 ++ (tM002_6 ++ (tM002_7 ++ (tM002_8 ++ (tM002_9 ++ (tM002_10 ++ (tM002_11 ++ (tM002_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 002：区間 N 12・M 13。 -/
theorem pair002_ok : pairOk P pair002 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN002_0) (wseg_append (wseg_of sN002_1) (wseg_append (wseg_of sN002_2) (wseg_append (wseg_of sN002_3) (wseg_append (wseg_of sN002_4) (wseg_append (wseg_of sN002_5) (wseg_append (wseg_of sN002_6) (wseg_append (wseg_of sN002_7) (wseg_append (wseg_of sN002_8) (wseg_append (wseg_of sN002_9) (wseg_append (wseg_of sN002_10) (wseg_of sN002_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM002_0) (wseg_append (wseg_of sM002_1) (wseg_append (wseg_of sM002_2) (wseg_append (wseg_of sM002_3) (wseg_append (wseg_of sM002_4) (wseg_append (wseg_of sM002_5) (wseg_append (wseg_of sM002_6) (wseg_append (wseg_of sM002_7) (wseg_append (wseg_of sM002_8) (wseg_append (wseg_of sM002_9) (wseg_append (wseg_of sM002_10) (wseg_append (wseg_of sM002_11) (wseg_of sM002_12))))))))))))))

def pair003 : Pair where
  nb := nbN003
  kmNum := 378387
  kmDen := 16777216
  toksN := tN003_0 ++ (tN003_1 ++ (tN003_2 ++ (tN003_3 ++ (tN003_4 ++ (tN003_5 ++ (tN003_6 ++ (tN003_7 ++ (tN003_8 ++ (tN003_9 ++ (tN003_10))))))))))
  toksM := tM003_0 ++ (tM003_1 ++ (tM003_2 ++ (tM003_3 ++ (tM003_4 ++ (tM003_5 ++ (tM003_6 ++ (tM003_7 ++ (tM003_8 ++ (tM003_9 ++ (tM003_10 ++ (tM003_11 ++ (tM003_12 ++ (tM003_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 003：区間 N 11・M 14。 -/
theorem pair003_ok : pairOk P pair003 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN003_0) (wseg_append (wseg_of sN003_1) (wseg_append (wseg_of sN003_2) (wseg_append (wseg_of sN003_3) (wseg_append (wseg_of sN003_4) (wseg_append (wseg_of sN003_5) (wseg_append (wseg_of sN003_6) (wseg_append (wseg_of sN003_7) (wseg_append (wseg_of sN003_8) (wseg_append (wseg_of sN003_9) (wseg_of sN003_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM003_0) (wseg_append (wseg_of sM003_1) (wseg_append (wseg_of sM003_2) (wseg_append (wseg_of sM003_3) (wseg_append (wseg_of sM003_4) (wseg_append (wseg_of sM003_5) (wseg_append (wseg_of sM003_6) (wseg_append (wseg_of sM003_7) (wseg_append (wseg_of sM003_8) (wseg_append (wseg_of sM003_9) (wseg_append (wseg_of sM003_10) (wseg_append (wseg_of sM003_11) (wseg_append (wseg_of sM003_12) (wseg_of sM003_13)))))))))))))))

def pair004 : Pair where
  nb := nbN004
  kmNum := 293387
  kmDen := 8388608
  toksN := tN004_0 ++ (tN004_1 ++ (tN004_2 ++ (tN004_3 ++ (tN004_4 ++ (tN004_5 ++ (tN004_6 ++ (tN004_7 ++ (tN004_8 ++ (tN004_9)))))))))
  toksM := tM004_0 ++ (tM004_1 ++ (tM004_2 ++ (tM004_3 ++ (tM004_4 ++ (tM004_5 ++ (tM004_6 ++ (tM004_7 ++ (tM004_8 ++ (tM004_9 ++ (tM004_10 ++ (tM004_11 ++ (tM004_12 ++ (tM004_13 ++ (tM004_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 004：区間 N 10・M 15。 -/
theorem pair004_ok : pairOk P pair004 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN004_0) (wseg_append (wseg_of sN004_1) (wseg_append (wseg_of sN004_2) (wseg_append (wseg_of sN004_3) (wseg_append (wseg_of sN004_4) (wseg_append (wseg_of sN004_5) (wseg_append (wseg_of sN004_6) (wseg_append (wseg_of sN004_7) (wseg_append (wseg_of sN004_8) (wseg_of sN004_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM004_0) (wseg_append (wseg_of sM004_1) (wseg_append (wseg_of sM004_2) (wseg_append (wseg_of sM004_3) (wseg_append (wseg_of sM004_4) (wseg_append (wseg_of sM004_5) (wseg_append (wseg_of sM004_6) (wseg_append (wseg_of sM004_7) (wseg_append (wseg_of sM004_8) (wseg_append (wseg_of sM004_9) (wseg_append (wseg_of sM004_10) (wseg_append (wseg_of sM004_11) (wseg_append (wseg_of sM004_12) (wseg_append (wseg_of sM004_13) (wseg_of sM004_14))))))))))))))))

end PackLean.D28.Cub
