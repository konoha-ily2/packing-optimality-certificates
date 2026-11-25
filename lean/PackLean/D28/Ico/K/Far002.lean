-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS002_0
import PackLean.D28.Ico.K.FarS002_1
import PackLean.D28.Ico.K.FarS002_2
import PackLean.D28.Ico.K.FarS002_3
import PackLean.D28.Ico.K.FarS002_4
import PackLean.D28.Ico.K.FarS002_5
import PackLean.D28.Ico.K.FarS002_6
import PackLean.D28.Ico.K.FarS002_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair018 : Pair where
  nb := nbN018
  kmNum := 269595
  kmDen := 16777216
  toksN := tN018_0 ++ (tN018_1 ++ (tN018_2 ++ (tN018_3 ++ (tN018_4 ++ (tN018_5 ++ (tN018_6 ++ (tN018_7)))))))
  toksM := tM018_0 ++ (tM018_1 ++ (tM018_2 ++ (tM018_3 ++ (tM018_4 ++ (tM018_5 ++ (tM018_6 ++ (tM018_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 018：区間 N 8・M 8。 -/
theorem pair018_ok : pairOk P pair018 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN018_0) (wseg_append (wseg_of sN018_1) (wseg_append (wseg_of sN018_2) (wseg_append (wseg_of sN018_3) (wseg_append (wseg_of sN018_4) (wseg_append (wseg_of sN018_5) (wseg_append (wseg_of sN018_6) (wseg_of sN018_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM018_0) (wseg_append (wseg_of sM018_1) (wseg_append (wseg_of sM018_2) (wseg_append (wseg_of sM018_3) (wseg_append (wseg_of sM018_4) (wseg_append (wseg_of sM018_5) (wseg_append (wseg_of sM018_6) (wseg_of sM018_7)))))))))

def pair019 : Pair where
  nb := nbN019
  kmNum := 48311
  kmDen := 2097152
  toksN := tN019_0 ++ (tN019_1 ++ (tN019_2 ++ (tN019_3 ++ (tN019_4 ++ (tN019_5 ++ (tN019_6))))))
  toksM := tM019_0 ++ (tM019_1 ++ (tM019_2 ++ (tM019_3 ++ (tM019_4 ++ (tM019_5 ++ (tM019_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 019：区間 N 7・M 7。 -/
theorem pair019_ok : pairOk P pair019 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN019_0) (wseg_append (wseg_of sN019_1) (wseg_append (wseg_of sN019_2) (wseg_append (wseg_of sN019_3) (wseg_append (wseg_of sN019_4) (wseg_append (wseg_of sN019_5) (wseg_of sN019_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM019_0) (wseg_append (wseg_of sM019_1) (wseg_append (wseg_of sM019_2) (wseg_append (wseg_of sM019_3) (wseg_append (wseg_of sM019_4) (wseg_append (wseg_of sM019_5) (wseg_of sM019_6))))))))

def pair020 : Pair where
  nb := nbN020
  kmNum := 62953
  kmDen := 8388608
  toksN := tN020_0 ++ (tN020_1 ++ (tN020_2 ++ (tN020_3 ++ (tN020_4 ++ (tN020_5 ++ (tN020_6 ++ (tN020_7)))))))
  toksM := tM020_0 ++ (tM020_1 ++ (tM020_2 ++ (tM020_3 ++ (tM020_4 ++ (tM020_5 ++ (tM020_6 ++ (tM020_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 020：区間 N 8・M 8。 -/
theorem pair020_ok : pairOk P pair020 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN020_0) (wseg_append (wseg_of sN020_1) (wseg_append (wseg_of sN020_2) (wseg_append (wseg_of sN020_3) (wseg_append (wseg_of sN020_4) (wseg_append (wseg_of sN020_5) (wseg_append (wseg_of sN020_6) (wseg_of sN020_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM020_0) (wseg_append (wseg_of sM020_1) (wseg_append (wseg_of sM020_2) (wseg_append (wseg_of sM020_3) (wseg_append (wseg_of sM020_4) (wseg_append (wseg_of sM020_5) (wseg_append (wseg_of sM020_6) (wseg_of sM020_7)))))))))

def pair021 : Pair where
  nb := nbN021
  kmNum := 106427
  kmDen := 8388608
  toksN := tN021_0 ++ (tN021_1 ++ (tN021_2 ++ (tN021_3 ++ (tN021_4 ++ (tN021_5 ++ (tN021_6))))))
  toksM := tM021_0 ++ (tM021_1 ++ (tM021_2 ++ (tM021_3 ++ (tM021_4 ++ (tM021_5 ++ (tM021_6 ++ (tM021_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 021：区間 N 7・M 8。 -/
theorem pair021_ok : pairOk P pair021 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN021_0) (wseg_append (wseg_of sN021_1) (wseg_append (wseg_of sN021_2) (wseg_append (wseg_of sN021_3) (wseg_append (wseg_of sN021_4) (wseg_append (wseg_of sN021_5) (wseg_of sN021_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM021_0) (wseg_append (wseg_of sM021_1) (wseg_append (wseg_of sM021_2) (wseg_append (wseg_of sM021_3) (wseg_append (wseg_of sM021_4) (wseg_append (wseg_of sM021_5) (wseg_append (wseg_of sM021_6) (wseg_of sM021_7)))))))))

def pair022 : Pair where
  nb := nbN022
  kmNum := 0
  kmDen := 1
  toksN := tN022_0 ++ (tN022_1 ++ (tN022_2 ++ (tN022_3 ++ (tN022_4 ++ (tN022_5 ++ (tN022_6 ++ (tN022_7)))))))
  toksM := tM022_0 ++ (tM022_1 ++ (tM022_2 ++ (tM022_3 ++ (tM022_4 ++ (tM022_5 ++ (tM022_6 ++ (tM022_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 022：区間 N 8・M 8。 -/
theorem pair022_ok : pairOk P pair022 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN022_0) (wseg_append (wseg_of sN022_1) (wseg_append (wseg_of sN022_2) (wseg_append (wseg_of sN022_3) (wseg_append (wseg_of sN022_4) (wseg_append (wseg_of sN022_5) (wseg_append (wseg_of sN022_6) (wseg_of sN022_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM022_0) (wseg_append (wseg_of sM022_1) (wseg_append (wseg_of sM022_2) (wseg_append (wseg_of sM022_3) (wseg_append (wseg_of sM022_4) (wseg_append (wseg_of sM022_5) (wseg_append (wseg_of sM022_6) (wseg_of sM022_7)))))))))

def pair023 : Pair where
  nb := nbN023
  kmNum := 7121
  kmDen := 8388608
  toksN := tN023_0 ++ (tN023_1 ++ (tN023_2 ++ (tN023_3 ++ (tN023_4 ++ (tN023_5 ++ (tN023_6 ++ (tN023_7 ++ (tN023_8))))))))
  toksM := tM023_0 ++ (tM023_1 ++ (tM023_2 ++ (tM023_3 ++ (tM023_4 ++ (tM023_5 ++ (tM023_6 ++ (tM023_7 ++ (tM023_8 ++ (tM023_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 023：区間 N 9・M 10。 -/
theorem pair023_ok : pairOk P pair023 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN023_0) (wseg_append (wseg_of sN023_1) (wseg_append (wseg_of sN023_2) (wseg_append (wseg_of sN023_3) (wseg_append (wseg_of sN023_4) (wseg_append (wseg_of sN023_5) (wseg_append (wseg_of sN023_6) (wseg_append (wseg_of sN023_7) (wseg_of sN023_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM023_0) (wseg_append (wseg_of sM023_1) (wseg_append (wseg_of sM023_2) (wseg_append (wseg_of sM023_3) (wseg_append (wseg_of sM023_4) (wseg_append (wseg_of sM023_5) (wseg_append (wseg_of sM023_6) (wseg_append (wseg_of sM023_7) (wseg_append (wseg_of sM023_8) (wseg_of sM023_9)))))))))))

def pair024 : Pair where
  nb := nbN024
  kmNum := 477
  kmDen := 16777216
  toksN := tN024_0 ++ (tN024_1 ++ (tN024_2 ++ (tN024_3 ++ (tN024_4 ++ (tN024_5 ++ (tN024_6 ++ (tN024_7)))))))
  toksM := tM024_0 ++ (tM024_1 ++ (tM024_2 ++ (tM024_3 ++ (tM024_4 ++ (tM024_5 ++ (tM024_6 ++ (tM024_7 ++ (tM024_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 024：区間 N 8・M 9。 -/
theorem pair024_ok : pairOk P pair024 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN024_0) (wseg_append (wseg_of sN024_1) (wseg_append (wseg_of sN024_2) (wseg_append (wseg_of sN024_3) (wseg_append (wseg_of sN024_4) (wseg_append (wseg_of sN024_5) (wseg_append (wseg_of sN024_6) (wseg_of sN024_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM024_0) (wseg_append (wseg_of sM024_1) (wseg_append (wseg_of sM024_2) (wseg_append (wseg_of sM024_3) (wseg_append (wseg_of sM024_4) (wseg_append (wseg_of sM024_5) (wseg_append (wseg_of sM024_6) (wseg_append (wseg_of sM024_7) (wseg_of sM024_8))))))))))

end PackLean.D28.Ico
