-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS004_0
import PackLean.D28.Ico.K.FarS004_1
import PackLean.D28.Ico.K.FarS004_2
import PackLean.D28.Ico.K.FarS004_3
import PackLean.D28.Ico.K.FarS004_4
import PackLean.D28.Ico.K.FarS004_5
import PackLean.D28.Ico.K.FarS004_6
import PackLean.D28.Ico.K.FarS004_7
import PackLean.D28.Ico.K.FarS004_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair031 : Pair where
  nb := nbN031
  kmNum := 0
  kmDen := 1
  toksN := tN031_0 ++ (tN031_1 ++ (tN031_2 ++ (tN031_3 ++ (tN031_4 ++ (tN031_5 ++ (tN031_6 ++ (tN031_7 ++ (tN031_8 ++ (tN031_9)))))))))
  toksM := tM031_0 ++ (tM031_1 ++ (tM031_2 ++ (tM031_3 ++ (tM031_4 ++ (tM031_5 ++ (tM031_6 ++ (tM031_7 ++ (tM031_8 ++ (tM031_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 031：区間 N 10・M 10。 -/
theorem pair031_ok : pairOk P pair031 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN031_0) (wseg_append (wseg_of sN031_1) (wseg_append (wseg_of sN031_2) (wseg_append (wseg_of sN031_3) (wseg_append (wseg_of sN031_4) (wseg_append (wseg_of sN031_5) (wseg_append (wseg_of sN031_6) (wseg_append (wseg_of sN031_7) (wseg_append (wseg_of sN031_8) (wseg_of sN031_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM031_0) (wseg_append (wseg_of sM031_1) (wseg_append (wseg_of sM031_2) (wseg_append (wseg_of sM031_3) (wseg_append (wseg_of sM031_4) (wseg_append (wseg_of sM031_5) (wseg_append (wseg_of sM031_6) (wseg_append (wseg_of sM031_7) (wseg_append (wseg_of sM031_8) (wseg_of sM031_9)))))))))))

def pair032 : Pair where
  nb := nbN032
  kmNum := 0
  kmDen := 1
  toksN := tN032_0 ++ (tN032_1 ++ (tN032_2 ++ (tN032_3 ++ (tN032_4 ++ (tN032_5 ++ (tN032_6 ++ (tN032_7)))))))
  toksM := tM032_0 ++ (tM032_1 ++ (tM032_2 ++ (tM032_3 ++ (tM032_4 ++ (tM032_5 ++ (tM032_6 ++ (tM032_7 ++ (tM032_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 032：区間 N 8・M 9。 -/
theorem pair032_ok : pairOk P pair032 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN032_0) (wseg_append (wseg_of sN032_1) (wseg_append (wseg_of sN032_2) (wseg_append (wseg_of sN032_3) (wseg_append (wseg_of sN032_4) (wseg_append (wseg_of sN032_5) (wseg_append (wseg_of sN032_6) (wseg_of sN032_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM032_0) (wseg_append (wseg_of sM032_1) (wseg_append (wseg_of sM032_2) (wseg_append (wseg_of sM032_3) (wseg_append (wseg_of sM032_4) (wseg_append (wseg_of sM032_5) (wseg_append (wseg_of sM032_6) (wseg_append (wseg_of sM032_7) (wseg_of sM032_8))))))))))

def pair033 : Pair where
  nb := nbN033
  kmNum := 1
  kmDen := 16777216
  toksN := tN033_0 ++ (tN033_1 ++ (tN033_2 ++ (tN033_3 ++ (tN033_4 ++ (tN033_5 ++ (tN033_6 ++ (tN033_7 ++ (tN033_8 ++ (tN033_9)))))))))
  toksM := tM033_0 ++ (tM033_1 ++ (tM033_2 ++ (tM033_3 ++ (tM033_4 ++ (tM033_5 ++ (tM033_6 ++ (tM033_7 ++ (tM033_8 ++ (tM033_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 033：区間 N 10・M 10。 -/
theorem pair033_ok : pairOk P pair033 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN033_0) (wseg_append (wseg_of sN033_1) (wseg_append (wseg_of sN033_2) (wseg_append (wseg_of sN033_3) (wseg_append (wseg_of sN033_4) (wseg_append (wseg_of sN033_5) (wseg_append (wseg_of sN033_6) (wseg_append (wseg_of sN033_7) (wseg_append (wseg_of sN033_8) (wseg_of sN033_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM033_0) (wseg_append (wseg_of sM033_1) (wseg_append (wseg_of sM033_2) (wseg_append (wseg_of sM033_3) (wseg_append (wseg_of sM033_4) (wseg_append (wseg_of sM033_5) (wseg_append (wseg_of sM033_6) (wseg_append (wseg_of sM033_7) (wseg_append (wseg_of sM033_8) (wseg_of sM033_9)))))))))))

def pair034 : Pair where
  nb := nbN034
  kmNum := 0
  kmDen := 1
  toksN := tN034_0 ++ (tN034_1 ++ (tN034_2 ++ (tN034_3 ++ (tN034_4 ++ (tN034_5 ++ (tN034_6 ++ (tN034_7 ++ (tN034_8 ++ (tN034_9)))))))))
  toksM := tM034_0 ++ (tM034_1 ++ (tM034_2 ++ (tM034_3 ++ (tM034_4 ++ (tM034_5 ++ (tM034_6 ++ (tM034_7 ++ (tM034_8 ++ (tM034_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 034：区間 N 10・M 10。 -/
theorem pair034_ok : pairOk P pair034 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN034_0) (wseg_append (wseg_of sN034_1) (wseg_append (wseg_of sN034_2) (wseg_append (wseg_of sN034_3) (wseg_append (wseg_of sN034_4) (wseg_append (wseg_of sN034_5) (wseg_append (wseg_of sN034_6) (wseg_append (wseg_of sN034_7) (wseg_append (wseg_of sN034_8) (wseg_of sN034_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM034_0) (wseg_append (wseg_of sM034_1) (wseg_append (wseg_of sM034_2) (wseg_append (wseg_of sM034_3) (wseg_append (wseg_of sM034_4) (wseg_append (wseg_of sM034_5) (wseg_append (wseg_of sM034_6) (wseg_append (wseg_of sM034_7) (wseg_append (wseg_of sM034_8) (wseg_of sM034_9)))))))))))

def pair035 : Pair where
  nb := nbN035
  kmNum := 15509
  kmDen := 8388608
  toksN := tN035_0 ++ (tN035_1 ++ (tN035_2 ++ (tN035_3 ++ (tN035_4 ++ (tN035_5 ++ (tN035_6 ++ (tN035_7 ++ (tN035_8))))))))
  toksM := tM035_0 ++ (tM035_1 ++ (tM035_2 ++ (tM035_3 ++ (tM035_4 ++ (tM035_5 ++ (tM035_6 ++ (tM035_7 ++ (tM035_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 035：区間 N 9・M 9。 -/
theorem pair035_ok : pairOk P pair035 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN035_0) (wseg_append (wseg_of sN035_1) (wseg_append (wseg_of sN035_2) (wseg_append (wseg_of sN035_3) (wseg_append (wseg_of sN035_4) (wseg_append (wseg_of sN035_5) (wseg_append (wseg_of sN035_6) (wseg_append (wseg_of sN035_7) (wseg_of sN035_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM035_0) (wseg_append (wseg_of sM035_1) (wseg_append (wseg_of sM035_2) (wseg_append (wseg_of sM035_3) (wseg_append (wseg_of sM035_4) (wseg_append (wseg_of sM035_5) (wseg_append (wseg_of sM035_6) (wseg_append (wseg_of sM035_7) (wseg_of sM035_8))))))))))

def pair036 : Pair where
  nb := nbN036
  kmNum := 80913
  kmDen := 16777216
  toksN := tN036_0 ++ (tN036_1 ++ (tN036_2 ++ (tN036_3 ++ (tN036_4 ++ (tN036_5 ++ (tN036_6 ++ (tN036_7)))))))
  toksM := tM036_0 ++ (tM036_1 ++ (tM036_2 ++ (tM036_3 ++ (tM036_4 ++ (tM036_5 ++ (tM036_6 ++ (tM036_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 036：区間 N 8・M 8。 -/
theorem pair036_ok : pairOk P pair036 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN036_0) (wseg_append (wseg_of sN036_1) (wseg_append (wseg_of sN036_2) (wseg_append (wseg_of sN036_3) (wseg_append (wseg_of sN036_4) (wseg_append (wseg_of sN036_5) (wseg_append (wseg_of sN036_6) (wseg_of sN036_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM036_0) (wseg_append (wseg_of sM036_1) (wseg_append (wseg_of sM036_2) (wseg_append (wseg_of sM036_3) (wseg_append (wseg_of sM036_4) (wseg_append (wseg_of sM036_5) (wseg_append (wseg_of sM036_6) (wseg_of sM036_7)))))))))

def pair037 : Pair where
  nb := nbN037
  kmNum := 127
  kmDen := 16777216
  toksN := tN037_0 ++ (tN037_1 ++ (tN037_2 ++ (tN037_3 ++ (tN037_4 ++ (tN037_5 ++ (tN037_6 ++ (tN037_7 ++ (tN037_8))))))))
  toksM := tM037_0 ++ (tM037_1 ++ (tM037_2 ++ (tM037_3 ++ (tM037_4 ++ (tM037_5 ++ (tM037_6 ++ (tM037_7 ++ (tM037_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 037：区間 N 9・M 9。 -/
theorem pair037_ok : pairOk P pair037 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN037_0) (wseg_append (wseg_of sN037_1) (wseg_append (wseg_of sN037_2) (wseg_append (wseg_of sN037_3) (wseg_append (wseg_of sN037_4) (wseg_append (wseg_of sN037_5) (wseg_append (wseg_of sN037_6) (wseg_append (wseg_of sN037_7) (wseg_of sN037_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM037_0) (wseg_append (wseg_of sM037_1) (wseg_append (wseg_of sM037_2) (wseg_append (wseg_of sM037_3) (wseg_append (wseg_of sM037_4) (wseg_append (wseg_of sM037_5) (wseg_append (wseg_of sM037_6) (wseg_append (wseg_of sM037_7) (wseg_of sM037_8))))))))))

end PackLean.D28.Ico
