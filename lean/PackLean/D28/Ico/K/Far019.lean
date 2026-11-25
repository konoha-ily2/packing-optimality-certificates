-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS019_0
import PackLean.D28.Ico.K.FarS019_1
import PackLean.D28.Ico.K.FarS019_2
import PackLean.D28.Ico.K.FarS019_3
import PackLean.D28.Ico.K.FarS019_4
import PackLean.D28.Ico.K.FarS019_5
import PackLean.D28.Ico.K.FarS019_6
import PackLean.D28.Ico.K.FarS019_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair128 : Pair where
  nb := nbN128
  kmNum := 231375
  kmDen := 16777216
  toksN := tN128_0 ++ (tN128_1 ++ (tN128_2 ++ (tN128_3 ++ (tN128_4 ++ (tN128_5 ++ (tN128_6 ++ (tN128_7 ++ (tN128_8 ++ (tN128_9)))))))))
  toksM := tM128_0 ++ (tM128_1 ++ (tM128_2 ++ (tM128_3 ++ (tM128_4 ++ (tM128_5 ++ (tM128_6 ++ (tM128_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 128：区間 N 10・M 8。 -/
theorem pair128_ok : pairOk P pair128 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN128_0) (wseg_append (wseg_of sN128_1) (wseg_append (wseg_of sN128_2) (wseg_append (wseg_of sN128_3) (wseg_append (wseg_of sN128_4) (wseg_append (wseg_of sN128_5) (wseg_append (wseg_of sN128_6) (wseg_append (wseg_of sN128_7) (wseg_append (wseg_of sN128_8) (wseg_of sN128_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM128_0) (wseg_append (wseg_of sM128_1) (wseg_append (wseg_of sM128_2) (wseg_append (wseg_of sM128_3) (wseg_append (wseg_of sM128_4) (wseg_append (wseg_of sM128_5) (wseg_append (wseg_of sM128_6) (wseg_of sM128_7)))))))))

def pair129 : Pair where
  nb := nbN129
  kmNum := 679107
  kmDen := 16777216
  toksN := tN129_0 ++ (tN129_1 ++ (tN129_2 ++ (tN129_3 ++ (tN129_4 ++ (tN129_5 ++ (tN129_6 ++ (tN129_7 ++ (tN129_8))))))))
  toksM := tM129_0 ++ (tM129_1 ++ (tM129_2 ++ (tM129_3 ++ (tM129_4 ++ (tM129_5 ++ (tM129_6 ++ (tM129_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 129：区間 N 9・M 8。 -/
theorem pair129_ok : pairOk P pair129 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN129_0) (wseg_append (wseg_of sN129_1) (wseg_append (wseg_of sN129_2) (wseg_append (wseg_of sN129_3) (wseg_append (wseg_of sN129_4) (wseg_append (wseg_of sN129_5) (wseg_append (wseg_of sN129_6) (wseg_append (wseg_of sN129_7) (wseg_of sN129_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM129_0) (wseg_append (wseg_of sM129_1) (wseg_append (wseg_of sM129_2) (wseg_append (wseg_of sM129_3) (wseg_append (wseg_of sM129_4) (wseg_append (wseg_of sM129_5) (wseg_append (wseg_of sM129_6) (wseg_of sM129_7)))))))))

def pair130 : Pair where
  nb := nbN130
  kmNum := 70893
  kmDen := 16777216
  toksN := tN130_0 ++ (tN130_1 ++ (tN130_2 ++ (tN130_3 ++ (tN130_4 ++ (tN130_5 ++ (tN130_6 ++ (tN130_7 ++ (tN130_8 ++ (tN130_9 ++ (tN130_10))))))))))
  toksM := tM130_0 ++ (tM130_1 ++ (tM130_2 ++ (tM130_3 ++ (tM130_4 ++ (tM130_5 ++ (tM130_6 ++ (tM130_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 130：区間 N 11・M 8。 -/
theorem pair130_ok : pairOk P pair130 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN130_0) (wseg_append (wseg_of sN130_1) (wseg_append (wseg_of sN130_2) (wseg_append (wseg_of sN130_3) (wseg_append (wseg_of sN130_4) (wseg_append (wseg_of sN130_5) (wseg_append (wseg_of sN130_6) (wseg_append (wseg_of sN130_7) (wseg_append (wseg_of sN130_8) (wseg_append (wseg_of sN130_9) (wseg_of sN130_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM130_0) (wseg_append (wseg_of sM130_1) (wseg_append (wseg_of sM130_2) (wseg_append (wseg_of sM130_3) (wseg_append (wseg_of sM130_4) (wseg_append (wseg_of sM130_5) (wseg_append (wseg_of sM130_6) (wseg_of sM130_7)))))))))

def pair131 : Pair where
  nb := nbN131
  kmNum := 189307
  kmDen := 16777216
  toksN := tN131_0 ++ (tN131_1 ++ (tN131_2 ++ (tN131_3 ++ (tN131_4 ++ (tN131_5 ++ (tN131_6 ++ (tN131_7 ++ (tN131_8 ++ (tN131_9 ++ (tN131_10))))))))))
  toksM := tM131_0 ++ (tM131_1 ++ (tM131_2 ++ (tM131_3 ++ (tM131_4 ++ (tM131_5 ++ (tM131_6 ++ (tM131_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 131：区間 N 11・M 8。 -/
theorem pair131_ok : pairOk P pair131 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN131_0) (wseg_append (wseg_of sN131_1) (wseg_append (wseg_of sN131_2) (wseg_append (wseg_of sN131_3) (wseg_append (wseg_of sN131_4) (wseg_append (wseg_of sN131_5) (wseg_append (wseg_of sN131_6) (wseg_append (wseg_of sN131_7) (wseg_append (wseg_of sN131_8) (wseg_append (wseg_of sN131_9) (wseg_of sN131_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM131_0) (wseg_append (wseg_of sM131_1) (wseg_append (wseg_of sM131_2) (wseg_append (wseg_of sM131_3) (wseg_append (wseg_of sM131_4) (wseg_append (wseg_of sM131_5) (wseg_append (wseg_of sM131_6) (wseg_of sM131_7)))))))))

def pair132 : Pair where
  nb := nbN132
  kmNum := 670349
  kmDen := 16777216
  toksN := tN132_0 ++ (tN132_1 ++ (tN132_2 ++ (tN132_3 ++ (tN132_4 ++ (tN132_5 ++ (tN132_6 ++ (tN132_7 ++ (tN132_8))))))))
  toksM := tM132_0 ++ (tM132_1 ++ (tM132_2 ++ (tM132_3 ++ (tM132_4 ++ (tM132_5 ++ (tM132_6 ++ (tM132_7 ++ (tM132_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 132：区間 N 9・M 9。 -/
theorem pair132_ok : pairOk P pair132 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN132_0) (wseg_append (wseg_of sN132_1) (wseg_append (wseg_of sN132_2) (wseg_append (wseg_of sN132_3) (wseg_append (wseg_of sN132_4) (wseg_append (wseg_of sN132_5) (wseg_append (wseg_of sN132_6) (wseg_append (wseg_of sN132_7) (wseg_of sN132_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM132_0) (wseg_append (wseg_of sM132_1) (wseg_append (wseg_of sM132_2) (wseg_append (wseg_of sM132_3) (wseg_append (wseg_of sM132_4) (wseg_append (wseg_of sM132_5) (wseg_append (wseg_of sM132_6) (wseg_append (wseg_of sM132_7) (wseg_of sM132_8))))))))))

def pair133 : Pair where
  nb := nbN133
  kmNum := 67755
  kmDen := 16777216
  toksN := tN133_0 ++ (tN133_1 ++ (tN133_2 ++ (tN133_3 ++ (tN133_4 ++ (tN133_5 ++ (tN133_6 ++ (tN133_7 ++ (tN133_8 ++ (tN133_9 ++ (tN133_10 ++ (tN133_11 ++ (tN133_12))))))))))))
  toksM := tM133_0 ++ (tM133_1 ++ (tM133_2 ++ (tM133_3 ++ (tM133_4 ++ (tM133_5 ++ (tM133_6 ++ (tM133_7 ++ (tM133_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 133：区間 N 13・M 9。 -/
theorem pair133_ok : pairOk P pair133 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN133_0) (wseg_append (wseg_of sN133_1) (wseg_append (wseg_of sN133_2) (wseg_append (wseg_of sN133_3) (wseg_append (wseg_of sN133_4) (wseg_append (wseg_of sN133_5) (wseg_append (wseg_of sN133_6) (wseg_append (wseg_of sN133_7) (wseg_append (wseg_of sN133_8) (wseg_append (wseg_of sN133_9) (wseg_append (wseg_of sN133_10) (wseg_append (wseg_of sN133_11) (wseg_of sN133_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM133_0) (wseg_append (wseg_of sM133_1) (wseg_append (wseg_of sM133_2) (wseg_append (wseg_of sM133_3) (wseg_append (wseg_of sM133_4) (wseg_append (wseg_of sM133_5) (wseg_append (wseg_of sM133_6) (wseg_append (wseg_of sM133_7) (wseg_of sM133_8))))))))))

end PackLean.D28.Ico
