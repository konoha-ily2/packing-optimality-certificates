-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS007_0
import PackLean.D28.Ico.K.FarS007_1
import PackLean.D28.Ico.K.FarS007_2
import PackLean.D28.Ico.K.FarS007_3
import PackLean.D28.Ico.K.FarS007_4
import PackLean.D28.Ico.K.FarS007_5
import PackLean.D28.Ico.K.FarS007_6
import PackLean.D28.Ico.K.FarS007_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair054 : Pair where
  nb := nbN054
  kmNum := 790991
  kmDen := 16777216
  toksN := tN054_0 ++ (tN054_1 ++ (tN054_2 ++ (tN054_3 ++ (tN054_4 ++ (tN054_5 ++ (tN054_6))))))
  toksM := tM054_0 ++ (tM054_1 ++ (tM054_2 ++ (tM054_3 ++ (tM054_4 ++ (tM054_5 ++ (tM054_6 ++ (tM054_7 ++ (tM054_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 054：区間 N 7・M 9。 -/
theorem pair054_ok : pairOk P pair054 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN054_0) (wseg_append (wseg_of sN054_1) (wseg_append (wseg_of sN054_2) (wseg_append (wseg_of sN054_3) (wseg_append (wseg_of sN054_4) (wseg_append (wseg_of sN054_5) (wseg_of sN054_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM054_0) (wseg_append (wseg_of sM054_1) (wseg_append (wseg_of sM054_2) (wseg_append (wseg_of sM054_3) (wseg_append (wseg_of sM054_4) (wseg_append (wseg_of sM054_5) (wseg_append (wseg_of sM054_6) (wseg_append (wseg_of sM054_7) (wseg_of sM054_8))))))))))

def pair055 : Pair where
  nb := nbN055
  kmNum := 1
  kmDen := 16777216
  toksN := tN055_0 ++ (tN055_1 ++ (tN055_2 ++ (tN055_3 ++ (tN055_4 ++ (tN055_5 ++ (tN055_6 ++ (tN055_7 ++ (tN055_8 ++ (tN055_9)))))))))
  toksM := tM055_0 ++ (tM055_1 ++ (tM055_2 ++ (tM055_3 ++ (tM055_4 ++ (tM055_5 ++ (tM055_6 ++ (tM055_7 ++ (tM055_8 ++ (tM055_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 055：区間 N 10・M 10。 -/
theorem pair055_ok : pairOk P pair055 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN055_0) (wseg_append (wseg_of sN055_1) (wseg_append (wseg_of sN055_2) (wseg_append (wseg_of sN055_3) (wseg_append (wseg_of sN055_4) (wseg_append (wseg_of sN055_5) (wseg_append (wseg_of sN055_6) (wseg_append (wseg_of sN055_7) (wseg_append (wseg_of sN055_8) (wseg_of sN055_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM055_0) (wseg_append (wseg_of sM055_1) (wseg_append (wseg_of sM055_2) (wseg_append (wseg_of sM055_3) (wseg_append (wseg_of sM055_4) (wseg_append (wseg_of sM055_5) (wseg_append (wseg_of sM055_6) (wseg_append (wseg_of sM055_7) (wseg_append (wseg_of sM055_8) (wseg_of sM055_9)))))))))))

def pair056 : Pair where
  nb := nbN056
  kmNum := 0
  kmDen := 1
  toksN := tN056_0 ++ (tN056_1 ++ (tN056_2 ++ (tN056_3 ++ (tN056_4 ++ (tN056_5 ++ (tN056_6 ++ (tN056_7 ++ (tN056_8 ++ (tN056_9)))))))))
  toksM := tM056_0 ++ (tM056_1 ++ (tM056_2 ++ (tM056_3 ++ (tM056_4 ++ (tM056_5 ++ (tM056_6 ++ (tM056_7 ++ (tM056_8 ++ (tM056_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 056：区間 N 10・M 10。 -/
theorem pair056_ok : pairOk P pair056 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN056_0) (wseg_append (wseg_of sN056_1) (wseg_append (wseg_of sN056_2) (wseg_append (wseg_of sN056_3) (wseg_append (wseg_of sN056_4) (wseg_append (wseg_of sN056_5) (wseg_append (wseg_of sN056_6) (wseg_append (wseg_of sN056_7) (wseg_append (wseg_of sN056_8) (wseg_of sN056_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM056_0) (wseg_append (wseg_of sM056_1) (wseg_append (wseg_of sM056_2) (wseg_append (wseg_of sM056_3) (wseg_append (wseg_of sM056_4) (wseg_append (wseg_of sM056_5) (wseg_append (wseg_of sM056_6) (wseg_append (wseg_of sM056_7) (wseg_append (wseg_of sM056_8) (wseg_of sM056_9)))))))))))

def pair057 : Pair where
  nb := nbN057
  kmNum := 0
  kmDen := 1
  toksN := tN057_0 ++ (tN057_1 ++ (tN057_2 ++ (tN057_3 ++ (tN057_4 ++ (tN057_5 ++ (tN057_6 ++ (tN057_7 ++ (tN057_8 ++ (tN057_9)))))))))
  toksM := tM057_0 ++ (tM057_1 ++ (tM057_2 ++ (tM057_3 ++ (tM057_4 ++ (tM057_5 ++ (tM057_6 ++ (tM057_7 ++ (tM057_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 057：区間 N 10・M 9。 -/
theorem pair057_ok : pairOk P pair057 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN057_0) (wseg_append (wseg_of sN057_1) (wseg_append (wseg_of sN057_2) (wseg_append (wseg_of sN057_3) (wseg_append (wseg_of sN057_4) (wseg_append (wseg_of sN057_5) (wseg_append (wseg_of sN057_6) (wseg_append (wseg_of sN057_7) (wseg_append (wseg_of sN057_8) (wseg_of sN057_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM057_0) (wseg_append (wseg_of sM057_1) (wseg_append (wseg_of sM057_2) (wseg_append (wseg_of sM057_3) (wseg_append (wseg_of sM057_4) (wseg_append (wseg_of sM057_5) (wseg_append (wseg_of sM057_6) (wseg_append (wseg_of sM057_7) (wseg_of sM057_8))))))))))

def pair058 : Pair where
  nb := nbN058
  kmNum := 1
  kmDen := 16777216
  toksN := tN058_0 ++ (tN058_1 ++ (tN058_2 ++ (tN058_3 ++ (tN058_4 ++ (tN058_5 ++ (tN058_6 ++ (tN058_7 ++ (tN058_8 ++ (tN058_9)))))))))
  toksM := tM058_0 ++ (tM058_1 ++ (tM058_2 ++ (tM058_3 ++ (tM058_4 ++ (tM058_5 ++ (tM058_6 ++ (tM058_7 ++ (tM058_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 058：区間 N 10・M 9。 -/
theorem pair058_ok : pairOk P pair058 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN058_0) (wseg_append (wseg_of sN058_1) (wseg_append (wseg_of sN058_2) (wseg_append (wseg_of sN058_3) (wseg_append (wseg_of sN058_4) (wseg_append (wseg_of sN058_5) (wseg_append (wseg_of sN058_6) (wseg_append (wseg_of sN058_7) (wseg_append (wseg_of sN058_8) (wseg_of sN058_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM058_0) (wseg_append (wseg_of sM058_1) (wseg_append (wseg_of sM058_2) (wseg_append (wseg_of sM058_3) (wseg_append (wseg_of sM058_4) (wseg_append (wseg_of sM058_5) (wseg_append (wseg_of sM058_6) (wseg_append (wseg_of sM058_7) (wseg_of sM058_8))))))))))

def pair059 : Pair where
  nb := nbN059
  kmNum := 0
  kmDen := 1
  toksN := tN059_0 ++ (tN059_1 ++ (tN059_2 ++ (tN059_3 ++ (tN059_4 ++ (tN059_5 ++ (tN059_6 ++ (tN059_7 ++ (tN059_8 ++ (tN059_9 ++ (tN059_10))))))))))
  toksM := tM059_0 ++ (tM059_1 ++ (tM059_2 ++ (tM059_3 ++ (tM059_4 ++ (tM059_5 ++ (tM059_6 ++ (tM059_7 ++ (tM059_8 ++ (tM059_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 059：区間 N 11・M 10。 -/
theorem pair059_ok : pairOk P pair059 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN059_0) (wseg_append (wseg_of sN059_1) (wseg_append (wseg_of sN059_2) (wseg_append (wseg_of sN059_3) (wseg_append (wseg_of sN059_4) (wseg_append (wseg_of sN059_5) (wseg_append (wseg_of sN059_6) (wseg_append (wseg_of sN059_7) (wseg_append (wseg_of sN059_8) (wseg_append (wseg_of sN059_9) (wseg_of sN059_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM059_0) (wseg_append (wseg_of sM059_1) (wseg_append (wseg_of sM059_2) (wseg_append (wseg_of sM059_3) (wseg_append (wseg_of sM059_4) (wseg_append (wseg_of sM059_5) (wseg_append (wseg_of sM059_6) (wseg_append (wseg_of sM059_7) (wseg_append (wseg_of sM059_8) (wseg_of sM059_9)))))))))))

end PackLean.D28.Ico
