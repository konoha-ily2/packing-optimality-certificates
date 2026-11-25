-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Cub.K.FarS004_0
import PackLean.D28.Cub.K.FarS004_1
import PackLean.D28.Cub.K.FarS004_2
import PackLean.D28.Cub.K.FarS004_3
import PackLean.D28.Cub.K.FarS004_4
import PackLean.D28.Cub.K.FarS004_5
import PackLean.D28.Cub.K.FarS004_6
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Cub
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair017 : Pair where
  nb := nbN017
  kmNum := 117517
  kmDen := 8388608
  toksN := tN017_0 ++ (tN017_1 ++ (tN017_2 ++ (tN017_3 ++ (tN017_4 ++ (tN017_5 ++ (tN017_6 ++ (tN017_7 ++ (tN017_8 ++ (tN017_9 ++ (tN017_10 ++ (tN017_11 ++ (tN017_12 ++ (tN017_13 ++ (tN017_14 ++ (tN017_15)))))))))))))))
  toksM := tM017_0 ++ (tM017_1 ++ (tM017_2 ++ (tM017_3 ++ (tM017_4 ++ (tM017_5 ++ (tM017_6 ++ (tM017_7 ++ (tM017_8 ++ (tM017_9 ++ (tM017_10 ++ (tM017_11 ++ (tM017_12 ++ (tM017_13 ++ (tM017_14 ++ (tM017_15 ++ (tM017_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 017：区間 N 16・M 17。 -/
theorem pair017_ok : pairOk P pair017 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN017_0) (wseg_append (wseg_of sN017_1) (wseg_append (wseg_of sN017_2) (wseg_append (wseg_of sN017_3) (wseg_append (wseg_of sN017_4) (wseg_append (wseg_of sN017_5) (wseg_append (wseg_of sN017_6) (wseg_append (wseg_of sN017_7) (wseg_append (wseg_of sN017_8) (wseg_append (wseg_of sN017_9) (wseg_append (wseg_of sN017_10) (wseg_append (wseg_of sN017_11) (wseg_append (wseg_of sN017_12) (wseg_append (wseg_of sN017_13) (wseg_append (wseg_of sN017_14) (wseg_of sN017_15)))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM017_0) (wseg_append (wseg_of sM017_1) (wseg_append (wseg_of sM017_2) (wseg_append (wseg_of sM017_3) (wseg_append (wseg_of sM017_4) (wseg_append (wseg_of sM017_5) (wseg_append (wseg_of sM017_6) (wseg_append (wseg_of sM017_7) (wseg_append (wseg_of sM017_8) (wseg_append (wseg_of sM017_9) (wseg_append (wseg_of sM017_10) (wseg_append (wseg_of sM017_11) (wseg_append (wseg_of sM017_12) (wseg_append (wseg_of sM017_13) (wseg_append (wseg_of sM017_14) (wseg_append (wseg_of sM017_15) (wseg_of sM017_16))))))))))))))))))

def pair018 : Pair where
  nb := nbN018
  kmNum := 414713
  kmDen := 16777216
  toksN := tN018_0 ++ (tN018_1 ++ (tN018_2 ++ (tN018_3 ++ (tN018_4 ++ (tN018_5 ++ (tN018_6 ++ (tN018_7 ++ (tN018_8 ++ (tN018_9 ++ (tN018_10 ++ (tN018_11 ++ (tN018_12 ++ (tN018_13)))))))))))))
  toksM := tM018_0 ++ (tM018_1 ++ (tM018_2 ++ (tM018_3 ++ (tM018_4 ++ (tM018_5 ++ (tM018_6 ++ (tM018_7 ++ (tM018_8 ++ (tM018_9 ++ (tM018_10 ++ (tM018_11 ++ (tM018_12 ++ (tM018_13 ++ (tM018_14 ++ (tM018_15 ++ (tM018_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 018：区間 N 14・M 17。 -/
theorem pair018_ok : pairOk P pair018 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN018_0) (wseg_append (wseg_of sN018_1) (wseg_append (wseg_of sN018_2) (wseg_append (wseg_of sN018_3) (wseg_append (wseg_of sN018_4) (wseg_append (wseg_of sN018_5) (wseg_append (wseg_of sN018_6) (wseg_append (wseg_of sN018_7) (wseg_append (wseg_of sN018_8) (wseg_append (wseg_of sN018_9) (wseg_append (wseg_of sN018_10) (wseg_append (wseg_of sN018_11) (wseg_append (wseg_of sN018_12) (wseg_of sN018_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM018_0) (wseg_append (wseg_of sM018_1) (wseg_append (wseg_of sM018_2) (wseg_append (wseg_of sM018_3) (wseg_append (wseg_of sM018_4) (wseg_append (wseg_of sM018_5) (wseg_append (wseg_of sM018_6) (wseg_append (wseg_of sM018_7) (wseg_append (wseg_of sM018_8) (wseg_append (wseg_of sM018_9) (wseg_append (wseg_of sM018_10) (wseg_append (wseg_of sM018_11) (wseg_append (wseg_of sM018_12) (wseg_append (wseg_of sM018_13) (wseg_append (wseg_of sM018_14) (wseg_append (wseg_of sM018_15) (wseg_of sM018_16))))))))))))))))))

def pair019 : Pair where
  nb := nbN019
  kmNum := 654653
  kmDen := 16777216
  toksN := tN019_0 ++ (tN019_1 ++ (tN019_2 ++ (tN019_3 ++ (tN019_4 ++ (tN019_5 ++ (tN019_6 ++ (tN019_7 ++ (tN019_8 ++ (tN019_9 ++ (tN019_10 ++ (tN019_11 ++ (tN019_12 ++ (tN019_13)))))))))))))
  toksM := tM019_0 ++ (tM019_1 ++ (tM019_2 ++ (tM019_3 ++ (tM019_4 ++ (tM019_5 ++ (tM019_6 ++ (tM019_7 ++ (tM019_8 ++ (tM019_9 ++ (tM019_10 ++ (tM019_11 ++ (tM019_12 ++ (tM019_13 ++ (tM019_14 ++ (tM019_15 ++ (tM019_16 ++ (tM019_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 019：区間 N 14・M 18。 -/
theorem pair019_ok : pairOk P pair019 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN019_0) (wseg_append (wseg_of sN019_1) (wseg_append (wseg_of sN019_2) (wseg_append (wseg_of sN019_3) (wseg_append (wseg_of sN019_4) (wseg_append (wseg_of sN019_5) (wseg_append (wseg_of sN019_6) (wseg_append (wseg_of sN019_7) (wseg_append (wseg_of sN019_8) (wseg_append (wseg_of sN019_9) (wseg_append (wseg_of sN019_10) (wseg_append (wseg_of sN019_11) (wseg_append (wseg_of sN019_12) (wseg_of sN019_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM019_0) (wseg_append (wseg_of sM019_1) (wseg_append (wseg_of sM019_2) (wseg_append (wseg_of sM019_3) (wseg_append (wseg_of sM019_4) (wseg_append (wseg_of sM019_5) (wseg_append (wseg_of sM019_6) (wseg_append (wseg_of sM019_7) (wseg_append (wseg_of sM019_8) (wseg_append (wseg_of sM019_9) (wseg_append (wseg_of sM019_10) (wseg_append (wseg_of sM019_11) (wseg_append (wseg_of sM019_12) (wseg_append (wseg_of sM019_13) (wseg_append (wseg_of sM019_14) (wseg_append (wseg_of sM019_15) (wseg_append (wseg_of sM019_16) (wseg_of sM019_17)))))))))))))))))))

end PackLean.D28.Cub
