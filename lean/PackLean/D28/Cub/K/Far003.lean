-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS003_0
import PackLean.D28.Cub.K.FarS003_1
import PackLean.D28.Cub.K.FarS003_2
import PackLean.D28.Cub.K.FarS003_3
import PackLean.D28.Cub.K.FarS003_4
import PackLean.D28.Cub.K.FarS003_5
import PackLean.D28.Cub.K.FarS003_6
import PackLean.D28.Cub.K.FarS003_7
import PackLean.D28.Cub.K.FarS003_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair013 : Pair where
  nb := nbN013
  kmNum := 890049
  kmDen := 16777216
  toksN := tN013_0 ++ (tN013_1 ++ (tN013_2 ++ (tN013_3 ++ (tN013_4 ++ (tN013_5 ++ (tN013_6 ++ (tN013_7 ++ (tN013_8 ++ (tN013_9 ++ (tN013_10 ++ (tN013_11)))))))))))
  toksM := tM013_0 ++ (tM013_1 ++ (tM013_2 ++ (tM013_3 ++ (tM013_4 ++ (tM013_5 ++ (tM013_6 ++ (tM013_7 ++ (tM013_8 ++ (tM013_9 ++ (tM013_10 ++ (tM013_11 ++ (tM013_12 ++ (tM013_13 ++ (tM013_14 ++ (tM013_15 ++ (tM013_16 ++ (tM013_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 013：区間 N 12・M 18。 -/
theorem pair013_ok : pairOk P pair013 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN013_0) (wseg_append (wseg_of sN013_1) (wseg_append (wseg_of sN013_2) (wseg_append (wseg_of sN013_3) (wseg_append (wseg_of sN013_4) (wseg_append (wseg_of sN013_5) (wseg_append (wseg_of sN013_6) (wseg_append (wseg_of sN013_7) (wseg_append (wseg_of sN013_8) (wseg_append (wseg_of sN013_9) (wseg_append (wseg_of sN013_10) (wseg_of sN013_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM013_0) (wseg_append (wseg_of sM013_1) (wseg_append (wseg_of sM013_2) (wseg_append (wseg_of sM013_3) (wseg_append (wseg_of sM013_4) (wseg_append (wseg_of sM013_5) (wseg_append (wseg_of sM013_6) (wseg_append (wseg_of sM013_7) (wseg_append (wseg_of sM013_8) (wseg_append (wseg_of sM013_9) (wseg_append (wseg_of sM013_10) (wseg_append (wseg_of sM013_11) (wseg_append (wseg_of sM013_12) (wseg_append (wseg_of sM013_13) (wseg_append (wseg_of sM013_14) (wseg_append (wseg_of sM013_15) (wseg_append (wseg_of sM013_16) (wseg_of sM013_17)))))))))))))))))))

def pair014 : Pair where
  nb := nbN014
  kmNum := 82901
  kmDen := 16777216
  toksN := tN014_0 ++ (tN014_1 ++ (tN014_2 ++ (tN014_3 ++ (tN014_4 ++ (tN014_5 ++ (tN014_6 ++ (tN014_7 ++ (tN014_8 ++ (tN014_9 ++ (tN014_10 ++ (tN014_11 ++ (tN014_12 ++ (tN014_13 ++ (tN014_14 ++ (tN014_15)))))))))))))))
  toksM := tM014_0 ++ (tM014_1 ++ (tM014_2 ++ (tM014_3 ++ (tM014_4 ++ (tM014_5 ++ (tM014_6 ++ (tM014_7 ++ (tM014_8 ++ (tM014_9 ++ (tM014_10 ++ (tM014_11 ++ (tM014_12 ++ (tM014_13 ++ (tM014_14 ++ (tM014_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 014：区間 N 16・M 16。 -/
theorem pair014_ok : pairOk P pair014 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN014_0) (wseg_append (wseg_of sN014_1) (wseg_append (wseg_of sN014_2) (wseg_append (wseg_of sN014_3) (wseg_append (wseg_of sN014_4) (wseg_append (wseg_of sN014_5) (wseg_append (wseg_of sN014_6) (wseg_append (wseg_of sN014_7) (wseg_append (wseg_of sN014_8) (wseg_append (wseg_of sN014_9) (wseg_append (wseg_of sN014_10) (wseg_append (wseg_of sN014_11) (wseg_append (wseg_of sN014_12) (wseg_append (wseg_of sN014_13) (wseg_append (wseg_of sN014_14) (wseg_of sN014_15)))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM014_0) (wseg_append (wseg_of sM014_1) (wseg_append (wseg_of sM014_2) (wseg_append (wseg_of sM014_3) (wseg_append (wseg_of sM014_4) (wseg_append (wseg_of sM014_5) (wseg_append (wseg_of sM014_6) (wseg_append (wseg_of sM014_7) (wseg_append (wseg_of sM014_8) (wseg_append (wseg_of sM014_9) (wseg_append (wseg_of sM014_10) (wseg_append (wseg_of sM014_11) (wseg_append (wseg_of sM014_12) (wseg_append (wseg_of sM014_13) (wseg_append (wseg_of sM014_14) (wseg_of sM014_15)))))))))))))))))

def pair015 : Pair where
  nb := nbN015
  kmNum := 248823
  kmDen := 16777216
  toksN := tN015_0 ++ (tN015_1 ++ (tN015_2 ++ (tN015_3 ++ (tN015_4 ++ (tN015_5 ++ (tN015_6 ++ (tN015_7 ++ (tN015_8 ++ (tN015_9 ++ (tN015_10 ++ (tN015_11 ++ (tN015_12 ++ (tN015_13 ++ (tN015_14))))))))))))))
  toksM := tM015_0 ++ (tM015_1 ++ (tM015_2 ++ (tM015_3 ++ (tM015_4 ++ (tM015_5 ++ (tM015_6 ++ (tM015_7 ++ (tM015_8 ++ (tM015_9 ++ (tM015_10 ++ (tM015_11 ++ (tM015_12 ++ (tM015_13 ++ (tM015_14 ++ (tM015_15 ++ (tM015_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 015：区間 N 15・M 17。 -/
theorem pair015_ok : pairOk P pair015 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN015_0) (wseg_append (wseg_of sN015_1) (wseg_append (wseg_of sN015_2) (wseg_append (wseg_of sN015_3) (wseg_append (wseg_of sN015_4) (wseg_append (wseg_of sN015_5) (wseg_append (wseg_of sN015_6) (wseg_append (wseg_of sN015_7) (wseg_append (wseg_of sN015_8) (wseg_append (wseg_of sN015_9) (wseg_append (wseg_of sN015_10) (wseg_append (wseg_of sN015_11) (wseg_append (wseg_of sN015_12) (wseg_append (wseg_of sN015_13) (wseg_of sN015_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM015_0) (wseg_append (wseg_of sM015_1) (wseg_append (wseg_of sM015_2) (wseg_append (wseg_of sM015_3) (wseg_append (wseg_of sM015_4) (wseg_append (wseg_of sM015_5) (wseg_append (wseg_of sM015_6) (wseg_append (wseg_of sM015_7) (wseg_append (wseg_of sM015_8) (wseg_append (wseg_of sM015_9) (wseg_append (wseg_of sM015_10) (wseg_append (wseg_of sM015_11) (wseg_append (wseg_of sM015_12) (wseg_append (wseg_of sM015_13) (wseg_append (wseg_of sM015_14) (wseg_append (wseg_of sM015_15) (wseg_of sM015_16))))))))))))))))))

def pair016 : Pair where
  nb := nbN016
  kmNum := 29309
  kmDen := 8388608
  toksN := tN016_0 ++ (tN016_1 ++ (tN016_2 ++ (tN016_3 ++ (tN016_4 ++ (tN016_5 ++ (tN016_6 ++ (tN016_7 ++ (tN016_8 ++ (tN016_9 ++ (tN016_10 ++ (tN016_11 ++ (tN016_12 ++ (tN016_13 ++ (tN016_14 ++ (tN016_15 ++ (tN016_16))))))))))))))))
  toksM := tM016_0 ++ (tM016_1 ++ (tM016_2 ++ (tM016_3 ++ (tM016_4 ++ (tM016_5 ++ (tM016_6 ++ (tM016_7 ++ (tM016_8 ++ (tM016_9 ++ (tM016_10 ++ (tM016_11 ++ (tM016_12 ++ (tM016_13 ++ (tM016_14 ++ (tM016_15 ++ (tM016_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 016：区間 N 17・M 17。 -/
theorem pair016_ok : pairOk P pair016 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN016_0) (wseg_append (wseg_of sN016_1) (wseg_append (wseg_of sN016_2) (wseg_append (wseg_of sN016_3) (wseg_append (wseg_of sN016_4) (wseg_append (wseg_of sN016_5) (wseg_append (wseg_of sN016_6) (wseg_append (wseg_of sN016_7) (wseg_append (wseg_of sN016_8) (wseg_append (wseg_of sN016_9) (wseg_append (wseg_of sN016_10) (wseg_append (wseg_of sN016_11) (wseg_append (wseg_of sN016_12) (wseg_append (wseg_of sN016_13) (wseg_append (wseg_of sN016_14) (wseg_append (wseg_of sN016_15) (wseg_of sN016_16))))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM016_0) (wseg_append (wseg_of sM016_1) (wseg_append (wseg_of sM016_2) (wseg_append (wseg_of sM016_3) (wseg_append (wseg_of sM016_4) (wseg_append (wseg_of sM016_5) (wseg_append (wseg_of sM016_6) (wseg_append (wseg_of sM016_7) (wseg_append (wseg_of sM016_8) (wseg_append (wseg_of sM016_9) (wseg_append (wseg_of sM016_10) (wseg_append (wseg_of sM016_11) (wseg_append (wseg_of sM016_12) (wseg_append (wseg_of sM016_13) (wseg_append (wseg_of sM016_14) (wseg_append (wseg_of sM016_15) (wseg_of sM016_16))))))))))))))))))

end PackLean.D28.Cub
