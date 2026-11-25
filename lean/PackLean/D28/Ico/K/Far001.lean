-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS001_0
import PackLean.D28.Ico.K.FarS001_1
import PackLean.D28.Ico.K.FarS001_2
import PackLean.D28.Ico.K.FarS001_3
import PackLean.D28.Ico.K.FarS001_4
import PackLean.D28.Ico.K.FarS001_5
import PackLean.D28.Ico.K.FarS001_6
import PackLean.D28.Ico.K.FarS001_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair010 : Pair where
  nb := nbN010
  kmNum := 1062277
  kmDen := 16777216
  toksN := tN010_0 ++ (tN010_1 ++ (tN010_2 ++ (tN010_3 ++ (tN010_4 ++ (tN010_5)))))
  toksM := tM010_0 ++ (tM010_1 ++ (tM010_2 ++ (tM010_3 ++ (tM010_4 ++ (tM010_5 ++ (tM010_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 010：区間 N 6・M 7。 -/
theorem pair010_ok : pairOk P pair010 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN010_0) (wseg_append (wseg_of sN010_1) (wseg_append (wseg_of sN010_2) (wseg_append (wseg_of sN010_3) (wseg_append (wseg_of sN010_4) (wseg_of sN010_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM010_0) (wseg_append (wseg_of sM010_1) (wseg_append (wseg_of sM010_2) (wseg_append (wseg_of sM010_3) (wseg_append (wseg_of sM010_4) (wseg_append (wseg_of sM010_5) (wseg_of sM010_6))))))))

def pair011 : Pair where
  nb := nbN011
  kmNum := 224215
  kmDen := 8388608
  toksN := tN011_0 ++ (tN011_1 ++ (tN011_2 ++ (tN011_3 ++ (tN011_4 ++ (tN011_5)))))
  toksM := tM011_0 ++ (tM011_1 ++ (tM011_2 ++ (tM011_3 ++ (tM011_4 ++ (tM011_5 ++ (tM011_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 011：区間 N 6・M 7。 -/
theorem pair011_ok : pairOk P pair011 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN011_0) (wseg_append (wseg_of sN011_1) (wseg_append (wseg_of sN011_2) (wseg_append (wseg_of sN011_3) (wseg_append (wseg_of sN011_4) (wseg_of sN011_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM011_0) (wseg_append (wseg_of sM011_1) (wseg_append (wseg_of sM011_2) (wseg_append (wseg_of sM011_3) (wseg_append (wseg_of sM011_4) (wseg_append (wseg_of sM011_5) (wseg_of sM011_6))))))))

def pair012 : Pair where
  nb := nbN012
  kmNum := 293301
  kmDen := 8388608
  toksN := tN012_0 ++ (tN012_1 ++ (tN012_2 ++ (tN012_3 ++ (tN012_4 ++ (tN012_5)))))
  toksM := tM012_0 ++ (tM012_1 ++ (tM012_2 ++ (tM012_3 ++ (tM012_4 ++ (tM012_5 ++ (tM012_6))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 012：区間 N 6・M 7。 -/
theorem pair012_ok : pairOk P pair012 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN012_0) (wseg_append (wseg_of sN012_1) (wseg_append (wseg_of sN012_2) (wseg_append (wseg_of sN012_3) (wseg_append (wseg_of sN012_4) (wseg_of sN012_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM012_0) (wseg_append (wseg_of sM012_1) (wseg_append (wseg_of sM012_2) (wseg_append (wseg_of sM012_3) (wseg_append (wseg_of sM012_4) (wseg_append (wseg_of sM012_5) (wseg_of sM012_6))))))))

def pair013 : Pair where
  nb := nbN013
  kmNum := 1000335
  kmDen := 16777216
  toksN := tN013_0 ++ (tN013_1 ++ (tN013_2 ++ (tN013_3 ++ (tN013_4 ++ (tN013_5)))))
  toksM := tM013_0 ++ (tM013_1 ++ (tM013_2 ++ (tM013_3 ++ (tM013_4 ++ (tM013_5 ++ (tM013_6 ++ (tM013_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 013：区間 N 6・M 8。 -/
theorem pair013_ok : pairOk P pair013 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN013_0) (wseg_append (wseg_of sN013_1) (wseg_append (wseg_of sN013_2) (wseg_append (wseg_of sN013_3) (wseg_append (wseg_of sN013_4) (wseg_of sN013_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM013_0) (wseg_append (wseg_of sM013_1) (wseg_append (wseg_of sM013_2) (wseg_append (wseg_of sM013_3) (wseg_append (wseg_of sM013_4) (wseg_append (wseg_of sM013_5) (wseg_append (wseg_of sM013_6) (wseg_of sM013_7)))))))))

def pair014 : Pair where
  nb := nbN014
  kmNum := 25901
  kmDen := 16777216
  toksN := tN014_0 ++ (tN014_1 ++ (tN014_2 ++ (tN014_3 ++ (tN014_4 ++ (tN014_5 ++ (tN014_6 ++ (tN014_7)))))))
  toksM := tM014_0 ++ (tM014_1 ++ (tM014_2 ++ (tM014_3 ++ (tM014_4 ++ (tM014_5 ++ (tM014_6 ++ (tM014_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 014：区間 N 8・M 8。 -/
theorem pair014_ok : pairOk P pair014 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN014_0) (wseg_append (wseg_of sN014_1) (wseg_append (wseg_of sN014_2) (wseg_append (wseg_of sN014_3) (wseg_append (wseg_of sN014_4) (wseg_append (wseg_of sN014_5) (wseg_append (wseg_of sN014_6) (wseg_of sN014_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM014_0) (wseg_append (wseg_of sM014_1) (wseg_append (wseg_of sM014_2) (wseg_append (wseg_of sM014_3) (wseg_append (wseg_of sM014_4) (wseg_append (wseg_of sM014_5) (wseg_append (wseg_of sM014_6) (wseg_of sM014_7)))))))))

def pair015 : Pair where
  nb := nbN015
  kmNum := 43691
  kmDen := 4194304
  toksN := tN015_0 ++ (tN015_1 ++ (tN015_2 ++ (tN015_3 ++ (tN015_4 ++ (tN015_5 ++ (tN015_6 ++ (tN015_7)))))))
  toksM := tM015_0 ++ (tM015_1 ++ (tM015_2 ++ (tM015_3 ++ (tM015_4 ++ (tM015_5 ++ (tM015_6 ++ (tM015_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 015：区間 N 8・M 8。 -/
theorem pair015_ok : pairOk P pair015 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN015_0) (wseg_append (wseg_of sN015_1) (wseg_append (wseg_of sN015_2) (wseg_append (wseg_of sN015_3) (wseg_append (wseg_of sN015_4) (wseg_append (wseg_of sN015_5) (wseg_append (wseg_of sN015_6) (wseg_of sN015_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM015_0) (wseg_append (wseg_of sM015_1) (wseg_append (wseg_of sM015_2) (wseg_append (wseg_of sM015_3) (wseg_append (wseg_of sM015_4) (wseg_append (wseg_of sM015_5) (wseg_append (wseg_of sM015_6) (wseg_of sM015_7)))))))))

def pair016 : Pair where
  nb := nbN016
  kmNum := 0
  kmDen := 1
  toksN := tN016_0 ++ (tN016_1 ++ (tN016_2 ++ (tN016_3 ++ (tN016_4 ++ (tN016_5 ++ (tN016_6 ++ (tN016_7)))))))
  toksM := tM016_0 ++ (tM016_1 ++ (tM016_2 ++ (tM016_3 ++ (tM016_4 ++ (tM016_5 ++ (tM016_6 ++ (tM016_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 016：区間 N 8・M 8。 -/
theorem pair016_ok : pairOk P pair016 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN016_0) (wseg_append (wseg_of sN016_1) (wseg_append (wseg_of sN016_2) (wseg_append (wseg_of sN016_3) (wseg_append (wseg_of sN016_4) (wseg_append (wseg_of sN016_5) (wseg_append (wseg_of sN016_6) (wseg_of sN016_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM016_0) (wseg_append (wseg_of sM016_1) (wseg_append (wseg_of sM016_2) (wseg_append (wseg_of sM016_3) (wseg_append (wseg_of sM016_4) (wseg_append (wseg_of sM016_5) (wseg_append (wseg_of sM016_6) (wseg_of sM016_7)))))))))

def pair017 : Pair where
  nb := nbN017
  kmNum := 63421
  kmDen := 16777216
  toksN := tN017_0 ++ (tN017_1 ++ (tN017_2 ++ (tN017_3 ++ (tN017_4 ++ (tN017_5 ++ (tN017_6 ++ (tN017_7)))))))
  toksM := tM017_0 ++ (tM017_1 ++ (tM017_2 ++ (tM017_3 ++ (tM017_4 ++ (tM017_5 ++ (tM017_6 ++ (tM017_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 017：区間 N 8・M 8。 -/
theorem pair017_ok : pairOk P pair017 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN017_0) (wseg_append (wseg_of sN017_1) (wseg_append (wseg_of sN017_2) (wseg_append (wseg_of sN017_3) (wseg_append (wseg_of sN017_4) (wseg_append (wseg_of sN017_5) (wseg_append (wseg_of sN017_6) (wseg_of sN017_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM017_0) (wseg_append (wseg_of sM017_1) (wseg_append (wseg_of sM017_2) (wseg_append (wseg_of sM017_3) (wseg_append (wseg_of sM017_4) (wseg_append (wseg_of sM017_5) (wseg_append (wseg_of sM017_6) (wseg_of sM017_7)))))))))

end PackLean.D28.Ico
