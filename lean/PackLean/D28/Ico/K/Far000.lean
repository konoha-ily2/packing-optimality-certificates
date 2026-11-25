-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS000_0
import PackLean.D28.Ico.K.FarS000_1
import PackLean.D28.Ico.K.FarS000_2
import PackLean.D28.Ico.K.FarS000_3
import PackLean.D28.Ico.K.FarS000_4
import PackLean.D28.Ico.K.FarS000_5
import PackLean.D28.Ico.K.FarS000_6
import PackLean.D28.Ico.K.FarS000_7
import PackLean.D28.Ico.K.FarS000_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair000 : Pair where
  nb := nbN000
  kmNum := 8943
  kmDen := 8388608
  toksN := tN000_0 ++ (tN000_1 ++ (tN000_2 ++ (tN000_3 ++ (tN000_4))))
  toksM := tM000_0 ++ (tM000_1 ++ (tM000_2 ++ (tM000_3 ++ (tM000_4))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 000：区間 N 5・M 5。 -/
theorem pair000_ok : pairOk P pair000 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN000_0) (wseg_append (wseg_of sN000_1) (wseg_append (wseg_of sN000_2) (wseg_append (wseg_of sN000_3) (wseg_of sN000_4))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM000_0) (wseg_append (wseg_of sM000_1) (wseg_append (wseg_of sM000_2) (wseg_append (wseg_of sM000_3) (wseg_of sM000_4))))))

def pair001 : Pair where
  nb := nbN001
  kmNum := 645531
  kmDen := 16777216
  toksN := tN001_0 ++ (tN001_1 ++ (tN001_2 ++ (tN001_3 ++ (tN001_4))))
  toksM := tM001_0 ++ (tM001_1 ++ (tM001_2 ++ (tM001_3 ++ (tM001_4 ++ (tM001_5)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 001：区間 N 5・M 6。 -/
theorem pair001_ok : pairOk P pair001 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN001_0) (wseg_append (wseg_of sN001_1) (wseg_append (wseg_of sN001_2) (wseg_append (wseg_of sN001_3) (wseg_of sN001_4))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM001_0) (wseg_append (wseg_of sM001_1) (wseg_append (wseg_of sM001_2) (wseg_append (wseg_of sM001_3) (wseg_append (wseg_of sM001_4) (wseg_of sM001_5)))))))

def pair002 : Pair where
  nb := nbN002
  kmNum := 7921
  kmDen := 4194304
  toksN := tN002_0 ++ (tN002_1 ++ (tN002_2 ++ (tN002_3 ++ (tN002_4 ++ (tN002_5)))))
  toksM := tM002_0 ++ (tM002_1 ++ (tM002_2 ++ (tM002_3 ++ (tM002_4 ++ (tM002_5)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 002：区間 N 6・M 6。 -/
theorem pair002_ok : pairOk P pair002 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN002_0) (wseg_append (wseg_of sN002_1) (wseg_append (wseg_of sN002_2) (wseg_append (wseg_of sN002_3) (wseg_append (wseg_of sN002_4) (wseg_of sN002_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM002_0) (wseg_append (wseg_of sM002_1) (wseg_append (wseg_of sM002_2) (wseg_append (wseg_of sM002_3) (wseg_append (wseg_of sM002_4) (wseg_of sM002_5)))))))

def pair003 : Pair where
  nb := nbN003
  kmNum := 40293
  kmDen := 4194304
  toksN := tN003_0 ++ (tN003_1 ++ (tN003_2 ++ (tN003_3 ++ (tN003_4 ++ (tN003_5)))))
  toksM := tM003_0 ++ (tM003_1 ++ (tM003_2 ++ (tM003_3 ++ (tM003_4 ++ (tM003_5)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 003：区間 N 6・M 6。 -/
theorem pair003_ok : pairOk P pair003 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN003_0) (wseg_append (wseg_of sN003_1) (wseg_append (wseg_of sN003_2) (wseg_append (wseg_of sN003_3) (wseg_append (wseg_of sN003_4) (wseg_of sN003_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM003_0) (wseg_append (wseg_of sM003_1) (wseg_append (wseg_of sM003_2) (wseg_append (wseg_of sM003_3) (wseg_append (wseg_of sM003_4) (wseg_of sM003_5)))))))

def pair004 : Pair where
  nb := nbN004
  kmNum := 787933
  kmDen := 16777216
  toksN := tN004_0 ++ (tN004_1 ++ (tN004_2 ++ (tN004_3 ++ (tN004_4))))
  toksM := tM004_0 ++ (tM004_1 ++ (tM004_2 ++ (tM004_3 ++ (tM004_4 ++ (tM004_5 ++ (tM004_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 004：区間 N 5・M 7。 -/
theorem pair004_ok : pairOk P pair004 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN004_0) (wseg_append (wseg_of sN004_1) (wseg_append (wseg_of sN004_2) (wseg_append (wseg_of sN004_3) (wseg_of sN004_4))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM004_0) (wseg_append (wseg_of sM004_1) (wseg_append (wseg_of sM004_2) (wseg_append (wseg_of sM004_3) (wseg_append (wseg_of sM004_4) (wseg_append (wseg_of sM004_5) (wseg_of sM004_6))))))))

def pair005 : Pair where
  nb := nbN005
  kmNum := 31649
  kmDen := 16777216
  toksN := tN005_0 ++ (tN005_1 ++ (tN005_2 ++ (tN005_3 ++ (tN005_4 ++ (tN005_5 ++ (tN005_6))))))
  toksM := tM005_0 ++ (tM005_1 ++ (tM005_2 ++ (tM005_3 ++ (tM005_4 ++ (tM005_5)))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 005：区間 N 7・M 6。 -/
theorem pair005_ok : pairOk P pair005 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN005_0) (wseg_append (wseg_of sN005_1) (wseg_append (wseg_of sN005_2) (wseg_append (wseg_of sN005_3) (wseg_append (wseg_of sN005_4) (wseg_append (wseg_of sN005_5) (wseg_of sN005_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM005_0) (wseg_append (wseg_of sM005_1) (wseg_append (wseg_of sM005_2) (wseg_append (wseg_of sM005_3) (wseg_append (wseg_of sM005_4) (wseg_of sM005_5)))))))

def pair006 : Pair where
  nb := nbN006
  kmNum := 87043
  kmDen := 8388608
  toksN := tN006_0 ++ (tN006_1 ++ (tN006_2 ++ (tN006_3 ++ (tN006_4 ++ (tN006_5 ++ (tN006_6))))))
  toksM := tM006_0 ++ (tM006_1 ++ (tM006_2 ++ (tM006_3 ++ (tM006_4 ++ (tM006_5 ++ (tM006_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 006：区間 N 7・M 7。 -/
theorem pair006_ok : pairOk P pair006 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN006_0) (wseg_append (wseg_of sN006_1) (wseg_append (wseg_of sN006_2) (wseg_append (wseg_of sN006_3) (wseg_append (wseg_of sN006_4) (wseg_append (wseg_of sN006_5) (wseg_of sN006_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM006_0) (wseg_append (wseg_of sM006_1) (wseg_append (wseg_of sM006_2) (wseg_append (wseg_of sM006_3) (wseg_append (wseg_of sM006_4) (wseg_append (wseg_of sM006_5) (wseg_of sM006_6))))))))

def pair007 : Pair where
  nb := nbN007
  kmNum := 3609
  kmDen := 2097152
  toksN := tN007_0 ++ (tN007_1 ++ (tN007_2 ++ (tN007_3 ++ (tN007_4 ++ (tN007_5 ++ (tN007_6))))))
  toksM := tM007_0 ++ (tM007_1 ++ (tM007_2 ++ (tM007_3 ++ (tM007_4 ++ (tM007_5 ++ (tM007_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 007：区間 N 7・M 7。 -/
theorem pair007_ok : pairOk P pair007 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN007_0) (wseg_append (wseg_of sN007_1) (wseg_append (wseg_of sN007_2) (wseg_append (wseg_of sN007_3) (wseg_append (wseg_of sN007_4) (wseg_append (wseg_of sN007_5) (wseg_of sN007_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM007_0) (wseg_append (wseg_of sM007_1) (wseg_append (wseg_of sM007_2) (wseg_append (wseg_of sM007_3) (wseg_append (wseg_of sM007_4) (wseg_append (wseg_of sM007_5) (wseg_of sM007_6))))))))

def pair008 : Pair where
  nb := nbN008
  kmNum := 196891
  kmDen := 16777216
  toksN := tN008_0 ++ (tN008_1 ++ (tN008_2 ++ (tN008_3 ++ (tN008_4 ++ (tN008_5 ++ (tN008_6))))))
  toksM := tM008_0 ++ (tM008_1 ++ (tM008_2 ++ (tM008_3 ++ (tM008_4 ++ (tM008_5 ++ (tM008_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 008：区間 N 7・M 7。 -/
theorem pair008_ok : pairOk P pair008 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN008_0) (wseg_append (wseg_of sN008_1) (wseg_append (wseg_of sN008_2) (wseg_append (wseg_of sN008_3) (wseg_append (wseg_of sN008_4) (wseg_append (wseg_of sN008_5) (wseg_of sN008_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM008_0) (wseg_append (wseg_of sM008_1) (wseg_append (wseg_of sM008_2) (wseg_append (wseg_of sM008_3) (wseg_append (wseg_of sM008_4) (wseg_append (wseg_of sM008_5) (wseg_of sM008_6))))))))

def pair009 : Pair where
  nb := nbN009
  kmNum := 15933
  kmDen := 524288
  toksN := tN009_0 ++ (tN009_1 ++ (tN009_2 ++ (tN009_3 ++ (tN009_4 ++ (tN009_5)))))
  toksM := tM009_0 ++ (tM009_1 ++ (tM009_2 ++ (tM009_3 ++ (tM009_4 ++ (tM009_5 ++ (tM009_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 009：区間 N 6・M 7。 -/
theorem pair009_ok : pairOk P pair009 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN009_0) (wseg_append (wseg_of sN009_1) (wseg_append (wseg_of sN009_2) (wseg_append (wseg_of sN009_3) (wseg_append (wseg_of sN009_4) (wseg_of sN009_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM009_0) (wseg_append (wseg_of sM009_1) (wseg_append (wseg_of sM009_2) (wseg_append (wseg_of sM009_3) (wseg_append (wseg_of sM009_4) (wseg_append (wseg_of sM009_5) (wseg_of sM009_6))))))))

end PackLean.D28.Ico
