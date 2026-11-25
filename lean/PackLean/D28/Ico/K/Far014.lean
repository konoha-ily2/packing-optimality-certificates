-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS014_0
import PackLean.D28.Ico.K.FarS014_1
import PackLean.D28.Ico.K.FarS014_2
import PackLean.D28.Ico.K.FarS014_3
import PackLean.D28.Ico.K.FarS014_4
import PackLean.D28.Ico.K.FarS014_5
import PackLean.D28.Ico.K.FarS014_6
import PackLean.D28.Ico.K.FarS014_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair097 : Pair where
  nb := nbN097
  kmNum := 197
  kmDen := 131072
  toksN := tN097_0 ++ (tN097_1 ++ (tN097_2 ++ (tN097_3 ++ (tN097_4 ++ (tN097_5 ++ (tN097_6 ++ (tN097_7 ++ (tN097_8 ++ (tN097_9)))))))))
  toksM := tM097_0 ++ (tM097_1 ++ (tM097_2 ++ (tM097_3 ++ (tM097_4 ++ (tM097_5 ++ (tM097_6 ++ (tM097_7 ++ (tM097_8 ++ (tM097_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 097：区間 N 10・M 10。 -/
theorem pair097_ok : pairOk P pair097 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN097_0) (wseg_append (wseg_of sN097_1) (wseg_append (wseg_of sN097_2) (wseg_append (wseg_of sN097_3) (wseg_append (wseg_of sN097_4) (wseg_append (wseg_of sN097_5) (wseg_append (wseg_of sN097_6) (wseg_append (wseg_of sN097_7) (wseg_append (wseg_of sN097_8) (wseg_of sN097_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM097_0) (wseg_append (wseg_of sM097_1) (wseg_append (wseg_of sM097_2) (wseg_append (wseg_of sM097_3) (wseg_append (wseg_of sM097_4) (wseg_append (wseg_of sM097_5) (wseg_append (wseg_of sM097_6) (wseg_append (wseg_of sM097_7) (wseg_append (wseg_of sM097_8) (wseg_of sM097_9)))))))))))

def pair098 : Pair where
  nb := nbN098
  kmNum := 16321
  kmDen := 4194304
  toksN := tN098_0 ++ (tN098_1 ++ (tN098_2 ++ (tN098_3 ++ (tN098_4 ++ (tN098_5 ++ (tN098_6 ++ (tN098_7 ++ (tN098_8 ++ (tN098_9)))))))))
  toksM := tM098_0 ++ (tM098_1 ++ (tM098_2 ++ (tM098_3 ++ (tM098_4 ++ (tM098_5 ++ (tM098_6 ++ (tM098_7 ++ (tM098_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 098：区間 N 10・M 9。 -/
theorem pair098_ok : pairOk P pair098 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN098_0) (wseg_append (wseg_of sN098_1) (wseg_append (wseg_of sN098_2) (wseg_append (wseg_of sN098_3) (wseg_append (wseg_of sN098_4) (wseg_append (wseg_of sN098_5) (wseg_append (wseg_of sN098_6) (wseg_append (wseg_of sN098_7) (wseg_append (wseg_of sN098_8) (wseg_of sN098_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM098_0) (wseg_append (wseg_of sM098_1) (wseg_append (wseg_of sM098_2) (wseg_append (wseg_of sM098_3) (wseg_append (wseg_of sM098_4) (wseg_append (wseg_of sM098_5) (wseg_append (wseg_of sM098_6) (wseg_append (wseg_of sM098_7) (wseg_of sM098_8))))))))))

def pair099 : Pair where
  nb := nbN099
  kmNum := 24803
  kmDen := 8388608
  toksN := tN099_0 ++ (tN099_1 ++ (tN099_2 ++ (tN099_3 ++ (tN099_4 ++ (tN099_5 ++ (tN099_6 ++ (tN099_7 ++ (tN099_8 ++ (tN099_9)))))))))
  toksM := tM099_0 ++ (tM099_1 ++ (tM099_2 ++ (tM099_3 ++ (tM099_4 ++ (tM099_5 ++ (tM099_6 ++ (tM099_7 ++ (tM099_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 099：区間 N 10・M 9。 -/
theorem pair099_ok : pairOk P pair099 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN099_0) (wseg_append (wseg_of sN099_1) (wseg_append (wseg_of sN099_2) (wseg_append (wseg_of sN099_3) (wseg_append (wseg_of sN099_4) (wseg_append (wseg_of sN099_5) (wseg_append (wseg_of sN099_6) (wseg_append (wseg_of sN099_7) (wseg_append (wseg_of sN099_8) (wseg_of sN099_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM099_0) (wseg_append (wseg_of sM099_1) (wseg_append (wseg_of sM099_2) (wseg_append (wseg_of sM099_3) (wseg_append (wseg_of sM099_4) (wseg_append (wseg_of sM099_5) (wseg_append (wseg_of sM099_6) (wseg_append (wseg_of sM099_7) (wseg_of sM099_8))))))))))

def pair100 : Pair where
  nb := nbN100
  kmNum := 88739
  kmDen := 16777216
  toksN := tN100_0 ++ (tN100_1 ++ (tN100_2 ++ (tN100_3 ++ (tN100_4 ++ (tN100_5 ++ (tN100_6 ++ (tN100_7 ++ (tN100_8 ++ (tN100_9)))))))))
  toksM := tM100_0 ++ (tM100_1 ++ (tM100_2 ++ (tM100_3 ++ (tM100_4 ++ (tM100_5 ++ (tM100_6 ++ (tM100_7 ++ (tM100_8 ++ (tM100_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 100：区間 N 10・M 10。 -/
theorem pair100_ok : pairOk P pair100 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN100_0) (wseg_append (wseg_of sN100_1) (wseg_append (wseg_of sN100_2) (wseg_append (wseg_of sN100_3) (wseg_append (wseg_of sN100_4) (wseg_append (wseg_of sN100_5) (wseg_append (wseg_of sN100_6) (wseg_append (wseg_of sN100_7) (wseg_append (wseg_of sN100_8) (wseg_of sN100_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM100_0) (wseg_append (wseg_of sM100_1) (wseg_append (wseg_of sM100_2) (wseg_append (wseg_of sM100_3) (wseg_append (wseg_of sM100_4) (wseg_append (wseg_of sM100_5) (wseg_append (wseg_of sM100_6) (wseg_append (wseg_of sM100_7) (wseg_append (wseg_of sM100_8) (wseg_of sM100_9)))))))))))

def pair101 : Pair where
  nb := nbN101
  kmNum := 104195
  kmDen := 16777216
  toksN := tN101_0 ++ (tN101_1 ++ (tN101_2 ++ (tN101_3 ++ (tN101_4 ++ (tN101_5 ++ (tN101_6 ++ (tN101_7 ++ (tN101_8 ++ (tN101_9)))))))))
  toksM := tM101_0 ++ (tM101_1 ++ (tM101_2 ++ (tM101_3 ++ (tM101_4 ++ (tM101_5 ++ (tM101_6 ++ (tM101_7 ++ (tM101_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 101：区間 N 10・M 9。 -/
theorem pair101_ok : pairOk P pair101 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN101_0) (wseg_append (wseg_of sN101_1) (wseg_append (wseg_of sN101_2) (wseg_append (wseg_of sN101_3) (wseg_append (wseg_of sN101_4) (wseg_append (wseg_of sN101_5) (wseg_append (wseg_of sN101_6) (wseg_append (wseg_of sN101_7) (wseg_append (wseg_of sN101_8) (wseg_of sN101_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM101_0) (wseg_append (wseg_of sM101_1) (wseg_append (wseg_of sM101_2) (wseg_append (wseg_of sM101_3) (wseg_append (wseg_of sM101_4) (wseg_append (wseg_of sM101_5) (wseg_append (wseg_of sM101_6) (wseg_append (wseg_of sM101_7) (wseg_of sM101_8))))))))))

def pair102 : Pair where
  nb := nbN102
  kmNum := 140787
  kmDen := 16777216
  toksN := tN102_0 ++ (tN102_1 ++ (tN102_2 ++ (tN102_3 ++ (tN102_4 ++ (tN102_5 ++ (tN102_6 ++ (tN102_7 ++ (tN102_8 ++ (tN102_9)))))))))
  toksM := tM102_0 ++ (tM102_1 ++ (tM102_2 ++ (tM102_3 ++ (tM102_4 ++ (tM102_5 ++ (tM102_6 ++ (tM102_7 ++ (tM102_8 ++ (tM102_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 102：区間 N 10・M 10。 -/
theorem pair102_ok : pairOk P pair102 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN102_0) (wseg_append (wseg_of sN102_1) (wseg_append (wseg_of sN102_2) (wseg_append (wseg_of sN102_3) (wseg_append (wseg_of sN102_4) (wseg_append (wseg_of sN102_5) (wseg_append (wseg_of sN102_6) (wseg_append (wseg_of sN102_7) (wseg_append (wseg_of sN102_8) (wseg_of sN102_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM102_0) (wseg_append (wseg_of sM102_1) (wseg_append (wseg_of sM102_2) (wseg_append (wseg_of sM102_3) (wseg_append (wseg_of sM102_4) (wseg_append (wseg_of sM102_5) (wseg_append (wseg_of sM102_6) (wseg_append (wseg_of sM102_7) (wseg_append (wseg_of sM102_8) (wseg_of sM102_9)))))))))))

end PackLean.D28.Ico
