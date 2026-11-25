-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS016_0
import PackLean.D28.Ico.K.FarS016_1
import PackLean.D28.Ico.K.FarS016_2
import PackLean.D28.Ico.K.FarS016_3
import PackLean.D28.Ico.K.FarS016_4
import PackLean.D28.Ico.K.FarS016_5
import PackLean.D28.Ico.K.FarS016_6
import PackLean.D28.Ico.K.FarS016_7
import PackLean.D28.Ico.K.FarS016_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair109 : Pair where
  nb := nbN109
  kmNum := 62543
  kmDen := 8388608
  toksN := tN109_0 ++ (tN109_1 ++ (tN109_2 ++ (tN109_3 ++ (tN109_4 ++ (tN109_5 ++ (tN109_6 ++ (tN109_7 ++ (tN109_8 ++ (tN109_9 ++ (tN109_10 ++ (tN109_11)))))))))))
  toksM := tM109_0 ++ (tM109_1 ++ (tM109_2 ++ (tM109_3 ++ (tM109_4 ++ (tM109_5 ++ (tM109_6 ++ (tM109_7 ++ (tM109_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 109：区間 N 12・M 9。 -/
theorem pair109_ok : pairOk P pair109 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN109_0) (wseg_append (wseg_of sN109_1) (wseg_append (wseg_of sN109_2) (wseg_append (wseg_of sN109_3) (wseg_append (wseg_of sN109_4) (wseg_append (wseg_of sN109_5) (wseg_append (wseg_of sN109_6) (wseg_append (wseg_of sN109_7) (wseg_append (wseg_of sN109_8) (wseg_append (wseg_of sN109_9) (wseg_append (wseg_of sN109_10) (wseg_of sN109_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM109_0) (wseg_append (wseg_of sM109_1) (wseg_append (wseg_of sM109_2) (wseg_append (wseg_of sM109_3) (wseg_append (wseg_of sM109_4) (wseg_append (wseg_of sM109_5) (wseg_append (wseg_of sM109_6) (wseg_append (wseg_of sM109_7) (wseg_of sM109_8))))))))))

def pair110 : Pair where
  nb := nbN110
  kmNum := 65709
  kmDen := 8388608
  toksN := tN110_0 ++ (tN110_1 ++ (tN110_2 ++ (tN110_3 ++ (tN110_4 ++ (tN110_5 ++ (tN110_6 ++ (tN110_7 ++ (tN110_8 ++ (tN110_9 ++ (tN110_10 ++ (tN110_11 ++ (tN110_12))))))))))))
  toksM := tM110_0 ++ (tM110_1 ++ (tM110_2 ++ (tM110_3 ++ (tM110_4 ++ (tM110_5 ++ (tM110_6 ++ (tM110_7 ++ (tM110_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 110：区間 N 13・M 9。 -/
theorem pair110_ok : pairOk P pair110 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN110_0) (wseg_append (wseg_of sN110_1) (wseg_append (wseg_of sN110_2) (wseg_append (wseg_of sN110_3) (wseg_append (wseg_of sN110_4) (wseg_append (wseg_of sN110_5) (wseg_append (wseg_of sN110_6) (wseg_append (wseg_of sN110_7) (wseg_append (wseg_of sN110_8) (wseg_append (wseg_of sN110_9) (wseg_append (wseg_of sN110_10) (wseg_append (wseg_of sN110_11) (wseg_of sN110_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM110_0) (wseg_append (wseg_of sM110_1) (wseg_append (wseg_of sM110_2) (wseg_append (wseg_of sM110_3) (wseg_append (wseg_of sM110_4) (wseg_append (wseg_of sM110_5) (wseg_append (wseg_of sM110_6) (wseg_append (wseg_of sM110_7) (wseg_of sM110_8))))))))))

def pair111 : Pair where
  nb := nbN111
  kmNum := 122977
  kmDen := 16777216
  toksN := tN111_0 ++ (tN111_1 ++ (tN111_2 ++ (tN111_3 ++ (tN111_4 ++ (tN111_5 ++ (tN111_6 ++ (tN111_7 ++ (tN111_8 ++ (tN111_9 ++ (tN111_10))))))))))
  toksM := tM111_0 ++ (tM111_1 ++ (tM111_2 ++ (tM111_3 ++ (tM111_4 ++ (tM111_5 ++ (tM111_6 ++ (tM111_7 ++ (tM111_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 111：区間 N 11・M 9。 -/
theorem pair111_ok : pairOk P pair111 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN111_0) (wseg_append (wseg_of sN111_1) (wseg_append (wseg_of sN111_2) (wseg_append (wseg_of sN111_3) (wseg_append (wseg_of sN111_4) (wseg_append (wseg_of sN111_5) (wseg_append (wseg_of sN111_6) (wseg_append (wseg_of sN111_7) (wseg_append (wseg_of sN111_8) (wseg_append (wseg_of sN111_9) (wseg_of sN111_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM111_0) (wseg_append (wseg_of sM111_1) (wseg_append (wseg_of sM111_2) (wseg_append (wseg_of sM111_3) (wseg_append (wseg_of sM111_4) (wseg_append (wseg_of sM111_5) (wseg_append (wseg_of sM111_6) (wseg_append (wseg_of sM111_7) (wseg_of sM111_8))))))))))

def pair112 : Pair where
  nb := nbN112
  kmNum := 37751
  kmDen := 4194304
  toksN := tN112_0 ++ (tN112_1 ++ (tN112_2 ++ (tN112_3 ++ (tN112_4 ++ (tN112_5 ++ (tN112_6 ++ (tN112_7 ++ (tN112_8 ++ (tN112_9 ++ (tN112_10 ++ (tN112_11)))))))))))
  toksM := tM112_0 ++ (tM112_1 ++ (tM112_2 ++ (tM112_3 ++ (tM112_4 ++ (tM112_5 ++ (tM112_6 ++ (tM112_7 ++ (tM112_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 112：区間 N 12・M 9。 -/
theorem pair112_ok : pairOk P pair112 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN112_0) (wseg_append (wseg_of sN112_1) (wseg_append (wseg_of sN112_2) (wseg_append (wseg_of sN112_3) (wseg_append (wseg_of sN112_4) (wseg_append (wseg_of sN112_5) (wseg_append (wseg_of sN112_6) (wseg_append (wseg_of sN112_7) (wseg_append (wseg_of sN112_8) (wseg_append (wseg_of sN112_9) (wseg_append (wseg_of sN112_10) (wseg_of sN112_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM112_0) (wseg_append (wseg_of sM112_1) (wseg_append (wseg_of sM112_2) (wseg_append (wseg_of sM112_3) (wseg_append (wseg_of sM112_4) (wseg_append (wseg_of sM112_5) (wseg_append (wseg_of sM112_6) (wseg_append (wseg_of sM112_7) (wseg_of sM112_8))))))))))

def pair113 : Pair where
  nb := nbN113
  kmNum := 173377
  kmDen := 16777216
  toksN := tN113_0 ++ (tN113_1 ++ (tN113_2 ++ (tN113_3 ++ (tN113_4 ++ (tN113_5 ++ (tN113_6 ++ (tN113_7 ++ (tN113_8 ++ (tN113_9 ++ (tN113_10))))))))))
  toksM := tM113_0 ++ (tM113_1 ++ (tM113_2 ++ (tM113_3 ++ (tM113_4 ++ (tM113_5 ++ (tM113_6 ++ (tM113_7 ++ (tM113_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 113：区間 N 11・M 9。 -/
theorem pair113_ok : pairOk P pair113 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN113_0) (wseg_append (wseg_of sN113_1) (wseg_append (wseg_of sN113_2) (wseg_append (wseg_of sN113_3) (wseg_append (wseg_of sN113_4) (wseg_append (wseg_of sN113_5) (wseg_append (wseg_of sN113_6) (wseg_append (wseg_of sN113_7) (wseg_append (wseg_of sN113_8) (wseg_append (wseg_of sN113_9) (wseg_of sN113_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM113_0) (wseg_append (wseg_of sM113_1) (wseg_append (wseg_of sM113_2) (wseg_append (wseg_of sM113_3) (wseg_append (wseg_of sM113_4) (wseg_append (wseg_of sM113_5) (wseg_append (wseg_of sM113_6) (wseg_append (wseg_of sM113_7) (wseg_of sM113_8))))))))))

def pair114 : Pair where
  nb := nbN114
  kmNum := 6319
  kmDen := 524288
  toksN := tN114_0 ++ (tN114_1 ++ (tN114_2 ++ (tN114_3 ++ (tN114_4 ++ (tN114_5 ++ (tN114_6 ++ (tN114_7 ++ (tN114_8 ++ (tN114_9 ++ (tN114_10))))))))))
  toksM := tM114_0 ++ (tM114_1 ++ (tM114_2 ++ (tM114_3 ++ (tM114_4 ++ (tM114_5 ++ (tM114_6 ++ (tM114_7 ++ (tM114_8 ++ (tM114_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 114：区間 N 11・M 10。 -/
theorem pair114_ok : pairOk P pair114 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN114_0) (wseg_append (wseg_of sN114_1) (wseg_append (wseg_of sN114_2) (wseg_append (wseg_of sN114_3) (wseg_append (wseg_of sN114_4) (wseg_append (wseg_of sN114_5) (wseg_append (wseg_of sN114_6) (wseg_append (wseg_of sN114_7) (wseg_append (wseg_of sN114_8) (wseg_append (wseg_of sN114_9) (wseg_of sN114_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM114_0) (wseg_append (wseg_of sM114_1) (wseg_append (wseg_of sM114_2) (wseg_append (wseg_of sM114_3) (wseg_append (wseg_of sM114_4) (wseg_append (wseg_of sM114_5) (wseg_append (wseg_of sM114_6) (wseg_append (wseg_of sM114_7) (wseg_append (wseg_of sM114_8) (wseg_of sM114_9)))))))))))

end PackLean.D28.Ico
