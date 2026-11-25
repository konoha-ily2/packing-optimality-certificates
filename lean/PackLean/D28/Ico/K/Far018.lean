-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS018_0
import PackLean.D28.Ico.K.FarS018_1
import PackLean.D28.Ico.K.FarS018_2
import PackLean.D28.Ico.K.FarS018_3
import PackLean.D28.Ico.K.FarS018_4
import PackLean.D28.Ico.K.FarS018_5
import PackLean.D28.Ico.K.FarS018_6
import PackLean.D28.Ico.K.FarS018_7
import PackLean.D28.Ico.K.FarS018_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair121 : Pair where
  nb := nbN121
  kmNum := 137909
  kmDen := 16777216
  toksN := tN121_0 ++ (tN121_1 ++ (tN121_2 ++ (tN121_3 ++ (tN121_4 ++ (tN121_5 ++ (tN121_6 ++ (tN121_7 ++ (tN121_8 ++ (tN121_9)))))))))
  toksM := tM121_0 ++ (tM121_1 ++ (tM121_2 ++ (tM121_3 ++ (tM121_4 ++ (tM121_5 ++ (tM121_6 ++ (tM121_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 121：区間 N 10・M 8。 -/
theorem pair121_ok : pairOk P pair121 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN121_0) (wseg_append (wseg_of sN121_1) (wseg_append (wseg_of sN121_2) (wseg_append (wseg_of sN121_3) (wseg_append (wseg_of sN121_4) (wseg_append (wseg_of sN121_5) (wseg_append (wseg_of sN121_6) (wseg_append (wseg_of sN121_7) (wseg_append (wseg_of sN121_8) (wseg_of sN121_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM121_0) (wseg_append (wseg_of sM121_1) (wseg_append (wseg_of sM121_2) (wseg_append (wseg_of sM121_3) (wseg_append (wseg_of sM121_4) (wseg_append (wseg_of sM121_5) (wseg_append (wseg_of sM121_6) (wseg_of sM121_7)))))))))

def pair122 : Pair where
  nb := nbN122
  kmNum := 273443
  kmDen := 16777216
  toksN := tN122_0 ++ (tN122_1 ++ (tN122_2 ++ (tN122_3 ++ (tN122_4 ++ (tN122_5 ++ (tN122_6 ++ (tN122_7 ++ (tN122_8))))))))
  toksM := tM122_0 ++ (tM122_1 ++ (tM122_2 ++ (tM122_3 ++ (tM122_4 ++ (tM122_5 ++ (tM122_6 ++ (tM122_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 122：区間 N 9・M 8。 -/
theorem pair122_ok : pairOk P pair122 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN122_0) (wseg_append (wseg_of sN122_1) (wseg_append (wseg_of sN122_2) (wseg_append (wseg_of sN122_3) (wseg_append (wseg_of sN122_4) (wseg_append (wseg_of sN122_5) (wseg_append (wseg_of sN122_6) (wseg_append (wseg_of sN122_7) (wseg_of sN122_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM122_0) (wseg_append (wseg_of sM122_1) (wseg_append (wseg_of sM122_2) (wseg_append (wseg_of sM122_3) (wseg_append (wseg_of sM122_4) (wseg_append (wseg_of sM122_5) (wseg_append (wseg_of sM122_6) (wseg_of sM122_7)))))))))

def pair123 : Pair where
  nb := nbN123
  kmNum := 713643
  kmDen := 16777216
  toksN := tN123_0 ++ (tN123_1 ++ (tN123_2 ++ (tN123_3 ++ (tN123_4 ++ (tN123_5 ++ (tN123_6 ++ (tN123_7)))))))
  toksM := tM123_0 ++ (tM123_1 ++ (tM123_2 ++ (tM123_3 ++ (tM123_4 ++ (tM123_5 ++ (tM123_6 ++ (tM123_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 123：区間 N 8・M 8。 -/
theorem pair123_ok : pairOk P pair123 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN123_0) (wseg_append (wseg_of sN123_1) (wseg_append (wseg_of sN123_2) (wseg_append (wseg_of sN123_3) (wseg_append (wseg_of sN123_4) (wseg_append (wseg_of sN123_5) (wseg_append (wseg_of sN123_6) (wseg_of sN123_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM123_0) (wseg_append (wseg_of sM123_1) (wseg_append (wseg_of sM123_2) (wseg_append (wseg_of sM123_3) (wseg_append (wseg_of sM123_4) (wseg_append (wseg_of sM123_5) (wseg_append (wseg_of sM123_6) (wseg_of sM123_7)))))))))

def pair124 : Pair where
  nb := nbN124
  kmNum := 11063
  kmDen := 8388608
  toksN := tN124_0 ++ (tN124_1 ++ (tN124_2 ++ (tN124_3 ++ (tN124_4 ++ (tN124_5 ++ (tN124_6 ++ (tN124_7 ++ (tN124_8 ++ (tN124_9 ++ (tN124_10))))))))))
  toksM := tM124_0 ++ (tM124_1 ++ (tM124_2 ++ (tM124_3 ++ (tM124_4 ++ (tM124_5 ++ (tM124_6 ++ (tM124_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 124：区間 N 11・M 8。 -/
theorem pair124_ok : pairOk P pair124 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN124_0) (wseg_append (wseg_of sN124_1) (wseg_append (wseg_of sN124_2) (wseg_append (wseg_of sN124_3) (wseg_append (wseg_of sN124_4) (wseg_append (wseg_of sN124_5) (wseg_append (wseg_of sN124_6) (wseg_append (wseg_of sN124_7) (wseg_append (wseg_of sN124_8) (wseg_append (wseg_of sN124_9) (wseg_of sN124_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM124_0) (wseg_append (wseg_of sM124_1) (wseg_append (wseg_of sM124_2) (wseg_append (wseg_of sM124_3) (wseg_append (wseg_of sM124_4) (wseg_append (wseg_of sM124_5) (wseg_append (wseg_of sM124_6) (wseg_of sM124_7)))))))))

def pair125 : Pair where
  nb := nbN125
  kmNum := 24949
  kmDen := 4194304
  toksN := tN125_0 ++ (tN125_1 ++ (tN125_2 ++ (tN125_3 ++ (tN125_4 ++ (tN125_5 ++ (tN125_6 ++ (tN125_7 ++ (tN125_8 ++ (tN125_9 ++ (tN125_10))))))))))
  toksM := tM125_0 ++ (tM125_1 ++ (tM125_2 ++ (tM125_3 ++ (tM125_4 ++ (tM125_5 ++ (tM125_6 ++ (tM125_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 125：区間 N 11・M 8。 -/
theorem pair125_ok : pairOk P pair125 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN125_0) (wseg_append (wseg_of sN125_1) (wseg_append (wseg_of sN125_2) (wseg_append (wseg_of sN125_3) (wseg_append (wseg_of sN125_4) (wseg_append (wseg_of sN125_5) (wseg_append (wseg_of sN125_6) (wseg_append (wseg_of sN125_7) (wseg_append (wseg_of sN125_8) (wseg_append (wseg_of sN125_9) (wseg_of sN125_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM125_0) (wseg_append (wseg_of sM125_1) (wseg_append (wseg_of sM125_2) (wseg_append (wseg_of sM125_3) (wseg_append (wseg_of sM125_4) (wseg_append (wseg_of sM125_5) (wseg_append (wseg_of sM125_6) (wseg_of sM125_7)))))))))

def pair126 : Pair where
  nb := nbN126
  kmNum := 2073
  kmDen := 4194304
  toksN := tN126_0 ++ (tN126_1 ++ (tN126_2 ++ (tN126_3 ++ (tN126_4 ++ (tN126_5 ++ (tN126_6 ++ (tN126_7 ++ (tN126_8 ++ (tN126_9 ++ (tN126_10 ++ (tN126_11 ++ (tN126_12))))))))))))
  toksM := tM126_0 ++ (tM126_1 ++ (tM126_2 ++ (tM126_3 ++ (tM126_4 ++ (tM126_5 ++ (tM126_6 ++ (tM126_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 126：区間 N 13・M 8。 -/
theorem pair126_ok : pairOk P pair126 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN126_0) (wseg_append (wseg_of sN126_1) (wseg_append (wseg_of sN126_2) (wseg_append (wseg_of sN126_3) (wseg_append (wseg_of sN126_4) (wseg_append (wseg_of sN126_5) (wseg_append (wseg_of sN126_6) (wseg_append (wseg_of sN126_7) (wseg_append (wseg_of sN126_8) (wseg_append (wseg_of sN126_9) (wseg_append (wseg_of sN126_10) (wseg_append (wseg_of sN126_11) (wseg_of sN126_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM126_0) (wseg_append (wseg_of sM126_1) (wseg_append (wseg_of sM126_2) (wseg_append (wseg_of sM126_3) (wseg_append (wseg_of sM126_4) (wseg_append (wseg_of sM126_5) (wseg_append (wseg_of sM126_6) (wseg_of sM126_7)))))))))

def pair127 : Pair where
  nb := nbN127
  kmNum := 8063
  kmDen := 8388608
  toksN := tN127_0 ++ (tN127_1 ++ (tN127_2 ++ (tN127_3 ++ (tN127_4 ++ (tN127_5 ++ (tN127_6 ++ (tN127_7 ++ (tN127_8 ++ (tN127_9 ++ (tN127_10 ++ (tN127_11)))))))))))
  toksM := tM127_0 ++ (tM127_1 ++ (tM127_2 ++ (tM127_3 ++ (tM127_4 ++ (tM127_5 ++ (tM127_6 ++ (tM127_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 127：区間 N 12・M 8。 -/
theorem pair127_ok : pairOk P pair127 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN127_0) (wseg_append (wseg_of sN127_1) (wseg_append (wseg_of sN127_2) (wseg_append (wseg_of sN127_3) (wseg_append (wseg_of sN127_4) (wseg_append (wseg_of sN127_5) (wseg_append (wseg_of sN127_6) (wseg_append (wseg_of sN127_7) (wseg_append (wseg_of sN127_8) (wseg_append (wseg_of sN127_9) (wseg_append (wseg_of sN127_10) (wseg_of sN127_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM127_0) (wseg_append (wseg_of sM127_1) (wseg_append (wseg_of sM127_2) (wseg_append (wseg_of sM127_3) (wseg_append (wseg_of sM127_4) (wseg_append (wseg_of sM127_5) (wseg_append (wseg_of sM127_6) (wseg_of sM127_7)))))))))

end PackLean.D28.Ico
