-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS021_0
import PackLean.D28.Ico.K.FarS021_1
import PackLean.D28.Ico.K.FarS021_2
import PackLean.D28.Ico.K.FarS021_3
import PackLean.D28.Ico.K.FarS021_4
import PackLean.D28.Ico.K.FarS021_5
import PackLean.D28.Ico.K.FarS021_6
import PackLean.D28.Ico.K.FarS021_7
import PackLean.D28.Ico.K.FarS021_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair140 : Pair where
  nb := nbN140
  kmNum := 26959
  kmDen := 16777216
  toksN := tN140_0 ++ (tN140_1 ++ (tN140_2 ++ (tN140_3 ++ (tN140_4 ++ (tN140_5 ++ (tN140_6 ++ (tN140_7 ++ (tN140_8 ++ (tN140_9 ++ (tN140_10 ++ (tN140_11 ++ (tN140_12 ++ (tN140_13)))))))))))))
  toksM := tM140_0 ++ (tM140_1 ++ (tM140_2 ++ (tM140_3 ++ (tM140_4 ++ (tM140_5 ++ (tM140_6 ++ (tM140_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 140：区間 N 14・M 8。 -/
theorem pair140_ok : pairOk P pair140 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN140_0) (wseg_append (wseg_of sN140_1) (wseg_append (wseg_of sN140_2) (wseg_append (wseg_of sN140_3) (wseg_append (wseg_of sN140_4) (wseg_append (wseg_of sN140_5) (wseg_append (wseg_of sN140_6) (wseg_append (wseg_of sN140_7) (wseg_append (wseg_of sN140_8) (wseg_append (wseg_of sN140_9) (wseg_append (wseg_of sN140_10) (wseg_append (wseg_of sN140_11) (wseg_append (wseg_of sN140_12) (wseg_of sN140_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM140_0) (wseg_append (wseg_of sM140_1) (wseg_append (wseg_of sM140_2) (wseg_append (wseg_of sM140_3) (wseg_append (wseg_of sM140_4) (wseg_append (wseg_of sM140_5) (wseg_append (wseg_of sM140_6) (wseg_of sM140_7)))))))))

def pair141 : Pair where
  nb := nbN141
  kmNum := 46245
  kmDen := 4194304
  toksN := tN141_0 ++ (tN141_1 ++ (tN141_2 ++ (tN141_3 ++ (tN141_4 ++ (tN141_5 ++ (tN141_6 ++ (tN141_7 ++ (tN141_8 ++ (tN141_9 ++ (tN141_10 ++ (tN141_11)))))))))))
  toksM := tM141_0 ++ (tM141_1 ++ (tM141_2 ++ (tM141_3 ++ (tM141_4 ++ (tM141_5 ++ (tM141_6 ++ (tM141_7 ++ (tM141_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 141：区間 N 12・M 9。 -/
theorem pair141_ok : pairOk P pair141 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN141_0) (wseg_append (wseg_of sN141_1) (wseg_append (wseg_of sN141_2) (wseg_append (wseg_of sN141_3) (wseg_append (wseg_of sN141_4) (wseg_append (wseg_of sN141_5) (wseg_append (wseg_of sN141_6) (wseg_append (wseg_of sN141_7) (wseg_append (wseg_of sN141_8) (wseg_append (wseg_of sN141_9) (wseg_append (wseg_of sN141_10) (wseg_of sN141_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM141_0) (wseg_append (wseg_of sM141_1) (wseg_append (wseg_of sM141_2) (wseg_append (wseg_of sM141_3) (wseg_append (wseg_of sM141_4) (wseg_append (wseg_of sM141_5) (wseg_append (wseg_of sM141_6) (wseg_append (wseg_of sM141_7) (wseg_of sM141_8))))))))))

def pair142 : Pair where
  nb := nbN142
  kmNum := 175537
  kmDen := 16777216
  toksN := tN142_0 ++ (tN142_1 ++ (tN142_2 ++ (tN142_3 ++ (tN142_4 ++ (tN142_5 ++ (tN142_6 ++ (tN142_7 ++ (tN142_8 ++ (tN142_9 ++ (tN142_10 ++ (tN142_11 ++ (tN142_12))))))))))))
  toksM := tM142_0 ++ (tM142_1 ++ (tM142_2 ++ (tM142_3 ++ (tM142_4 ++ (tM142_5 ++ (tM142_6 ++ (tM142_7 ++ (tM142_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 142：区間 N 13・M 9。 -/
theorem pair142_ok : pairOk P pair142 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN142_0) (wseg_append (wseg_of sN142_1) (wseg_append (wseg_of sN142_2) (wseg_append (wseg_of sN142_3) (wseg_append (wseg_of sN142_4) (wseg_append (wseg_of sN142_5) (wseg_append (wseg_of sN142_6) (wseg_append (wseg_of sN142_7) (wseg_append (wseg_of sN142_8) (wseg_append (wseg_of sN142_9) (wseg_append (wseg_of sN142_10) (wseg_append (wseg_of sN142_11) (wseg_of sN142_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM142_0) (wseg_append (wseg_of sM142_1) (wseg_append (wseg_of sM142_2) (wseg_append (wseg_of sM142_3) (wseg_append (wseg_of sM142_4) (wseg_append (wseg_of sM142_5) (wseg_append (wseg_of sM142_6) (wseg_append (wseg_of sM142_7) (wseg_of sM142_8))))))))))

def pair143 : Pair where
  nb := nbN143
  kmNum := 247959
  kmDen := 16777216
  toksN := tN143_0 ++ (tN143_1 ++ (tN143_2 ++ (tN143_3 ++ (tN143_4 ++ (tN143_5 ++ (tN143_6 ++ (tN143_7 ++ (tN143_8 ++ (tN143_9 ++ (tN143_10 ++ (tN143_11)))))))))))
  toksM := tM143_0 ++ (tM143_1 ++ (tM143_2 ++ (tM143_3 ++ (tM143_4 ++ (tM143_5 ++ (tM143_6 ++ (tM143_7 ++ (tM143_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 143：区間 N 12・M 9。 -/
theorem pair143_ok : pairOk P pair143 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN143_0) (wseg_append (wseg_of sN143_1) (wseg_append (wseg_of sN143_2) (wseg_append (wseg_of sN143_3) (wseg_append (wseg_of sN143_4) (wseg_append (wseg_of sN143_5) (wseg_append (wseg_of sN143_6) (wseg_append (wseg_of sN143_7) (wseg_append (wseg_of sN143_8) (wseg_append (wseg_of sN143_9) (wseg_append (wseg_of sN143_10) (wseg_of sN143_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM143_0) (wseg_append (wseg_of sM143_1) (wseg_append (wseg_of sM143_2) (wseg_append (wseg_of sM143_3) (wseg_append (wseg_of sM143_4) (wseg_append (wseg_of sM143_5) (wseg_append (wseg_of sM143_6) (wseg_append (wseg_of sM143_7) (wseg_of sM143_8))))))))))

def pair144 : Pair where
  nb := nbN144
  kmNum := 246187
  kmDen := 16777216
  toksN := tN144_0 ++ (tN144_1 ++ (tN144_2 ++ (tN144_3 ++ (tN144_4 ++ (tN144_5 ++ (tN144_6 ++ (tN144_7 ++ (tN144_8 ++ (tN144_9 ++ (tN144_10 ++ (tN144_11 ++ (tN144_12))))))))))))
  toksM := tM144_0 ++ (tM144_1 ++ (tM144_2 ++ (tM144_3 ++ (tM144_4 ++ (tM144_5 ++ (tM144_6 ++ (tM144_7 ++ (tM144_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 144：区間 N 13・M 9。 -/
theorem pair144_ok : pairOk P pair144 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN144_0) (wseg_append (wseg_of sN144_1) (wseg_append (wseg_of sN144_2) (wseg_append (wseg_of sN144_3) (wseg_append (wseg_of sN144_4) (wseg_append (wseg_of sN144_5) (wseg_append (wseg_of sN144_6) (wseg_append (wseg_of sN144_7) (wseg_append (wseg_of sN144_8) (wseg_append (wseg_of sN144_9) (wseg_append (wseg_of sN144_10) (wseg_append (wseg_of sN144_11) (wseg_of sN144_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM144_0) (wseg_append (wseg_of sM144_1) (wseg_append (wseg_of sM144_2) (wseg_append (wseg_of sM144_3) (wseg_append (wseg_of sM144_4) (wseg_append (wseg_of sM144_5) (wseg_append (wseg_of sM144_6) (wseg_append (wseg_of sM144_7) (wseg_of sM144_8))))))))))

def pair145 : Pair where
  nb := nbN145
  kmNum := 153827
  kmDen := 16777216
  toksN := tN145_0 ++ (tN145_1 ++ (tN145_2 ++ (tN145_3 ++ (tN145_4 ++ (tN145_5 ++ (tN145_6 ++ (tN145_7 ++ (tN145_8 ++ (tN145_9 ++ (tN145_10 ++ (tN145_11 ++ (tN145_12 ++ (tN145_13)))))))))))))
  toksM := tM145_0 ++ (tM145_1 ++ (tM145_2 ++ (tM145_3 ++ (tM145_4 ++ (tM145_5 ++ (tM145_6 ++ (tM145_7 ++ (tM145_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 145：区間 N 14・M 9。 -/
theorem pair145_ok : pairOk P pair145 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN145_0) (wseg_append (wseg_of sN145_1) (wseg_append (wseg_of sN145_2) (wseg_append (wseg_of sN145_3) (wseg_append (wseg_of sN145_4) (wseg_append (wseg_of sN145_5) (wseg_append (wseg_of sN145_6) (wseg_append (wseg_of sN145_7) (wseg_append (wseg_of sN145_8) (wseg_append (wseg_of sN145_9) (wseg_append (wseg_of sN145_10) (wseg_append (wseg_of sN145_11) (wseg_append (wseg_of sN145_12) (wseg_of sN145_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM145_0) (wseg_append (wseg_of sM145_1) (wseg_append (wseg_of sM145_2) (wseg_append (wseg_of sM145_3) (wseg_append (wseg_of sM145_4) (wseg_append (wseg_of sM145_5) (wseg_append (wseg_of sM145_6) (wseg_append (wseg_of sM145_7) (wseg_of sM145_8))))))))))

end PackLean.D28.Ico
