-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS002_0
import PackLean.D28.Cub.K.FarS002_1
import PackLean.D28.Cub.K.FarS002_2
import PackLean.D28.Cub.K.FarS002_3
import PackLean.D28.Cub.K.FarS002_4
import PackLean.D28.Cub.K.FarS002_5
import PackLean.D28.Cub.K.FarS002_6
import PackLean.D28.Cub.K.FarS002_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair009 : Pair where
  nb := nbN009
  kmNum := 18057
  kmDen := 524288
  toksN := tN009_0 ++ (tN009_1 ++ (tN009_2 ++ (tN009_3 ++ (tN009_4 ++ (tN009_5 ++ (tN009_6 ++ (tN009_7 ++ (tN009_8 ++ (tN009_9 ++ (tN009_10 ++ (tN009_11)))))))))))
  toksM := tM009_0 ++ (tM009_1 ++ (tM009_2 ++ (tM009_3 ++ (tM009_4 ++ (tM009_5 ++ (tM009_6 ++ (tM009_7 ++ (tM009_8 ++ (tM009_9 ++ (tM009_10 ++ (tM009_11 ++ (tM009_12 ++ (tM009_13 ++ (tM009_14 ++ (tM009_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 009：区間 N 12・M 16。 -/
theorem pair009_ok : pairOk P pair009 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN009_0) (wseg_append (wseg_of sN009_1) (wseg_append (wseg_of sN009_2) (wseg_append (wseg_of sN009_3) (wseg_append (wseg_of sN009_4) (wseg_append (wseg_of sN009_5) (wseg_append (wseg_of sN009_6) (wseg_append (wseg_of sN009_7) (wseg_append (wseg_of sN009_8) (wseg_append (wseg_of sN009_9) (wseg_append (wseg_of sN009_10) (wseg_of sN009_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM009_0) (wseg_append (wseg_of sM009_1) (wseg_append (wseg_of sM009_2) (wseg_append (wseg_of sM009_3) (wseg_append (wseg_of sM009_4) (wseg_append (wseg_of sM009_5) (wseg_append (wseg_of sM009_6) (wseg_append (wseg_of sM009_7) (wseg_append (wseg_of sM009_8) (wseg_append (wseg_of sM009_9) (wseg_append (wseg_of sM009_10) (wseg_append (wseg_of sM009_11) (wseg_append (wseg_of sM009_12) (wseg_append (wseg_of sM009_13) (wseg_append (wseg_of sM009_14) (wseg_of sM009_15)))))))))))))))))

def pair010 : Pair where
  nb := nbN010
  kmNum := 744125
  kmDen := 16777216
  toksN := tN010_0 ++ (tN010_1 ++ (tN010_2 ++ (tN010_3 ++ (tN010_4 ++ (tN010_5 ++ (tN010_6 ++ (tN010_7 ++ (tN010_8 ++ (tN010_9 ++ (tN010_10))))))))))
  toksM := tM010_0 ++ (tM010_1 ++ (tM010_2 ++ (tM010_3 ++ (tM010_4 ++ (tM010_5 ++ (tM010_6 ++ (tM010_7 ++ (tM010_8 ++ (tM010_9 ++ (tM010_10 ++ (tM010_11 ++ (tM010_12 ++ (tM010_13 ++ (tM010_14 ++ (tM010_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 010：区間 N 11・M 16。 -/
theorem pair010_ok : pairOk P pair010 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN010_0) (wseg_append (wseg_of sN010_1) (wseg_append (wseg_of sN010_2) (wseg_append (wseg_of sN010_3) (wseg_append (wseg_of sN010_4) (wseg_append (wseg_of sN010_5) (wseg_append (wseg_of sN010_6) (wseg_append (wseg_of sN010_7) (wseg_append (wseg_of sN010_8) (wseg_append (wseg_of sN010_9) (wseg_of sN010_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM010_0) (wseg_append (wseg_of sM010_1) (wseg_append (wseg_of sM010_2) (wseg_append (wseg_of sM010_3) (wseg_append (wseg_of sM010_4) (wseg_append (wseg_of sM010_5) (wseg_append (wseg_of sM010_6) (wseg_append (wseg_of sM010_7) (wseg_append (wseg_of sM010_8) (wseg_append (wseg_of sM010_9) (wseg_append (wseg_of sM010_10) (wseg_append (wseg_of sM010_11) (wseg_append (wseg_of sM010_12) (wseg_append (wseg_of sM010_13) (wseg_append (wseg_of sM010_14) (wseg_of sM010_15)))))))))))))))))

def pair011 : Pair where
  nb := nbN011
  kmNum := 127315
  kmDen := 4194304
  toksN := tN011_0 ++ (tN011_1 ++ (tN011_2 ++ (tN011_3 ++ (tN011_4 ++ (tN011_5 ++ (tN011_6 ++ (tN011_7 ++ (tN011_8 ++ (tN011_9 ++ (tN011_10 ++ (tN011_11 ++ (tN011_12))))))))))))
  toksM := tM011_0 ++ (tM011_1 ++ (tM011_2 ++ (tM011_3 ++ (tM011_4 ++ (tM011_5 ++ (tM011_6 ++ (tM011_7 ++ (tM011_8 ++ (tM011_9 ++ (tM011_10 ++ (tM011_11 ++ (tM011_12 ++ (tM011_13 ++ (tM011_14 ++ (tM011_15 ++ (tM011_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 011：区間 N 13・M 17。 -/
theorem pair011_ok : pairOk P pair011 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN011_0) (wseg_append (wseg_of sN011_1) (wseg_append (wseg_of sN011_2) (wseg_append (wseg_of sN011_3) (wseg_append (wseg_of sN011_4) (wseg_append (wseg_of sN011_5) (wseg_append (wseg_of sN011_6) (wseg_append (wseg_of sN011_7) (wseg_append (wseg_of sN011_8) (wseg_append (wseg_of sN011_9) (wseg_append (wseg_of sN011_10) (wseg_append (wseg_of sN011_11) (wseg_of sN011_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM011_0) (wseg_append (wseg_of sM011_1) (wseg_append (wseg_of sM011_2) (wseg_append (wseg_of sM011_3) (wseg_append (wseg_of sM011_4) (wseg_append (wseg_of sM011_5) (wseg_append (wseg_of sM011_6) (wseg_append (wseg_of sM011_7) (wseg_append (wseg_of sM011_8) (wseg_append (wseg_of sM011_9) (wseg_append (wseg_of sM011_10) (wseg_append (wseg_of sM011_11) (wseg_append (wseg_of sM011_12) (wseg_append (wseg_of sM011_13) (wseg_append (wseg_of sM011_14) (wseg_append (wseg_of sM011_15) (wseg_of sM011_16))))))))))))))))))

def pair012 : Pair where
  nb := nbN012
  kmNum := 702893
  kmDen := 16777216
  toksN := tN012_0 ++ (tN012_1 ++ (tN012_2 ++ (tN012_3 ++ (tN012_4 ++ (tN012_5 ++ (tN012_6 ++ (tN012_7 ++ (tN012_8 ++ (tN012_9 ++ (tN012_10 ++ (tN012_11)))))))))))
  toksM := tM012_0 ++ (tM012_1 ++ (tM012_2 ++ (tM012_3 ++ (tM012_4 ++ (tM012_5 ++ (tM012_6 ++ (tM012_7 ++ (tM012_8 ++ (tM012_9 ++ (tM012_10 ++ (tM012_11 ++ (tM012_12 ++ (tM012_13 ++ (tM012_14 ++ (tM012_15 ++ (tM012_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 012：区間 N 12・M 17。 -/
theorem pair012_ok : pairOk P pair012 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN012_0) (wseg_append (wseg_of sN012_1) (wseg_append (wseg_of sN012_2) (wseg_append (wseg_of sN012_3) (wseg_append (wseg_of sN012_4) (wseg_append (wseg_of sN012_5) (wseg_append (wseg_of sN012_6) (wseg_append (wseg_of sN012_7) (wseg_append (wseg_of sN012_8) (wseg_append (wseg_of sN012_9) (wseg_append (wseg_of sN012_10) (wseg_of sN012_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM012_0) (wseg_append (wseg_of sM012_1) (wseg_append (wseg_of sM012_2) (wseg_append (wseg_of sM012_3) (wseg_append (wseg_of sM012_4) (wseg_append (wseg_of sM012_5) (wseg_append (wseg_of sM012_6) (wseg_append (wseg_of sM012_7) (wseg_append (wseg_of sM012_8) (wseg_append (wseg_of sM012_9) (wseg_append (wseg_of sM012_10) (wseg_append (wseg_of sM012_11) (wseg_append (wseg_of sM012_12) (wseg_append (wseg_of sM012_13) (wseg_append (wseg_of sM012_14) (wseg_append (wseg_of sM012_15) (wseg_of sM012_16))))))))))))))))))

end PackLean.D28.Cub
