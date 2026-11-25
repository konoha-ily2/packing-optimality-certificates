-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS012_0
import PackLean.D28.Ico.K.FarS012_1
import PackLean.D28.Ico.K.FarS012_2
import PackLean.D28.Ico.K.FarS012_3
import PackLean.D28.Ico.K.FarS012_4
import PackLean.D28.Ico.K.FarS012_5
import PackLean.D28.Ico.K.FarS012_6
import PackLean.D28.Ico.K.FarS012_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair085 : Pair where
  nb := nbN085
  kmNum := 47513
  kmDen := 16777216
  toksN := tN085_0 ++ (tN085_1 ++ (tN085_2 ++ (tN085_3 ++ (tN085_4 ++ (tN085_5 ++ (tN085_6 ++ (tN085_7 ++ (tN085_8 ++ (tN085_9 ++ (tN085_10 ++ (tN085_11)))))))))))
  toksM := tM085_0 ++ (tM085_1 ++ (tM085_2 ++ (tM085_3 ++ (tM085_4 ++ (tM085_5 ++ (tM085_6 ++ (tM085_7 ++ (tM085_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 085：区間 N 12・M 9。 -/
theorem pair085_ok : pairOk P pair085 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN085_0) (wseg_append (wseg_of sN085_1) (wseg_append (wseg_of sN085_2) (wseg_append (wseg_of sN085_3) (wseg_append (wseg_of sN085_4) (wseg_append (wseg_of sN085_5) (wseg_append (wseg_of sN085_6) (wseg_append (wseg_of sN085_7) (wseg_append (wseg_of sN085_8) (wseg_append (wseg_of sN085_9) (wseg_append (wseg_of sN085_10) (wseg_of sN085_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM085_0) (wseg_append (wseg_of sM085_1) (wseg_append (wseg_of sM085_2) (wseg_append (wseg_of sM085_3) (wseg_append (wseg_of sM085_4) (wseg_append (wseg_of sM085_5) (wseg_append (wseg_of sM085_6) (wseg_append (wseg_of sM085_7) (wseg_of sM085_8))))))))))

def pair086 : Pair where
  nb := nbN086
  kmNum := 35913
  kmDen := 16777216
  toksN := tN086_0 ++ (tN086_1 ++ (tN086_2 ++ (tN086_3 ++ (tN086_4 ++ (tN086_5 ++ (tN086_6 ++ (tN086_7 ++ (tN086_8 ++ (tN086_9 ++ (tN086_10 ++ (tN086_11)))))))))))
  toksM := tM086_0 ++ (tM086_1 ++ (tM086_2 ++ (tM086_3 ++ (tM086_4 ++ (tM086_5 ++ (tM086_6 ++ (tM086_7 ++ (tM086_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 086：区間 N 12・M 9。 -/
theorem pair086_ok : pairOk P pair086 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN086_0) (wseg_append (wseg_of sN086_1) (wseg_append (wseg_of sN086_2) (wseg_append (wseg_of sN086_3) (wseg_append (wseg_of sN086_4) (wseg_append (wseg_of sN086_5) (wseg_append (wseg_of sN086_6) (wseg_append (wseg_of sN086_7) (wseg_append (wseg_of sN086_8) (wseg_append (wseg_of sN086_9) (wseg_append (wseg_of sN086_10) (wseg_of sN086_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM086_0) (wseg_append (wseg_of sM086_1) (wseg_append (wseg_of sM086_2) (wseg_append (wseg_of sM086_3) (wseg_append (wseg_of sM086_4) (wseg_append (wseg_of sM086_5) (wseg_append (wseg_of sM086_6) (wseg_append (wseg_of sM086_7) (wseg_of sM086_8))))))))))

def pair087 : Pair where
  nb := nbN087
  kmNum := 0
  kmDen := 1
  toksN := tN087_0 ++ (tN087_1 ++ (tN087_2 ++ (tN087_3 ++ (tN087_4 ++ (tN087_5 ++ (tN087_6 ++ (tN087_7 ++ (tN087_8 ++ (tN087_9)))))))))
  toksM := tM087_0 ++ (tM087_1 ++ (tM087_2 ++ (tM087_3 ++ (tM087_4 ++ (tM087_5 ++ (tM087_6 ++ (tM087_7 ++ (tM087_8 ++ (tM087_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 087：区間 N 10・M 10。 -/
theorem pair087_ok : pairOk P pair087 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN087_0) (wseg_append (wseg_of sN087_1) (wseg_append (wseg_of sN087_2) (wseg_append (wseg_of sN087_3) (wseg_append (wseg_of sN087_4) (wseg_append (wseg_of sN087_5) (wseg_append (wseg_of sN087_6) (wseg_append (wseg_of sN087_7) (wseg_append (wseg_of sN087_8) (wseg_of sN087_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM087_0) (wseg_append (wseg_of sM087_1) (wseg_append (wseg_of sM087_2) (wseg_append (wseg_of sM087_3) (wseg_append (wseg_of sM087_4) (wseg_append (wseg_of sM087_5) (wseg_append (wseg_of sM087_6) (wseg_append (wseg_of sM087_7) (wseg_append (wseg_of sM087_8) (wseg_of sM087_9)))))))))))

def pair088 : Pair where
  nb := nbN088
  kmNum := 1
  kmDen := 16777216
  toksN := tN088_0 ++ (tN088_1 ++ (tN088_2 ++ (tN088_3 ++ (tN088_4 ++ (tN088_5 ++ (tN088_6 ++ (tN088_7 ++ (tN088_8 ++ (tN088_9)))))))))
  toksM := tM088_0 ++ (tM088_1 ++ (tM088_2 ++ (tM088_3 ++ (tM088_4 ++ (tM088_5 ++ (tM088_6 ++ (tM088_7 ++ (tM088_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 088：区間 N 10・M 9。 -/
theorem pair088_ok : pairOk P pair088 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN088_0) (wseg_append (wseg_of sN088_1) (wseg_append (wseg_of sN088_2) (wseg_append (wseg_of sN088_3) (wseg_append (wseg_of sN088_4) (wseg_append (wseg_of sN088_5) (wseg_append (wseg_of sN088_6) (wseg_append (wseg_of sN088_7) (wseg_append (wseg_of sN088_8) (wseg_of sN088_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM088_0) (wseg_append (wseg_of sM088_1) (wseg_append (wseg_of sM088_2) (wseg_append (wseg_of sM088_3) (wseg_append (wseg_of sM088_4) (wseg_append (wseg_of sM088_5) (wseg_append (wseg_of sM088_6) (wseg_append (wseg_of sM088_7) (wseg_of sM088_8))))))))))

def pair089 : Pair where
  nb := nbN089
  kmNum := 0
  kmDen := 1
  toksN := tN089_0 ++ (tN089_1 ++ (tN089_2 ++ (tN089_3 ++ (tN089_4 ++ (tN089_5 ++ (tN089_6 ++ (tN089_7 ++ (tN089_8 ++ (tN089_9)))))))))
  toksM := tM089_0 ++ (tM089_1 ++ (tM089_2 ++ (tM089_3 ++ (tM089_4 ++ (tM089_5 ++ (tM089_6 ++ (tM089_7 ++ (tM089_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 089：区間 N 10・M 9。 -/
theorem pair089_ok : pairOk P pair089 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN089_0) (wseg_append (wseg_of sN089_1) (wseg_append (wseg_of sN089_2) (wseg_append (wseg_of sN089_3) (wseg_append (wseg_of sN089_4) (wseg_append (wseg_of sN089_5) (wseg_append (wseg_of sN089_6) (wseg_append (wseg_of sN089_7) (wseg_append (wseg_of sN089_8) (wseg_of sN089_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM089_0) (wseg_append (wseg_of sM089_1) (wseg_append (wseg_of sM089_2) (wseg_append (wseg_of sM089_3) (wseg_append (wseg_of sM089_4) (wseg_append (wseg_of sM089_5) (wseg_append (wseg_of sM089_6) (wseg_append (wseg_of sM089_7) (wseg_of sM089_8))))))))))

def pair090 : Pair where
  nb := nbN090
  kmNum := 0
  kmDen := 1
  toksN := tN090_0 ++ (tN090_1 ++ (tN090_2 ++ (tN090_3 ++ (tN090_4 ++ (tN090_5 ++ (tN090_6 ++ (tN090_7 ++ (tN090_8 ++ (tN090_9)))))))))
  toksM := tM090_0 ++ (tM090_1 ++ (tM090_2 ++ (tM090_3 ++ (tM090_4 ++ (tM090_5 ++ (tM090_6 ++ (tM090_7 ++ (tM090_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 090：区間 N 10・M 9。 -/
theorem pair090_ok : pairOk P pair090 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN090_0) (wseg_append (wseg_of sN090_1) (wseg_append (wseg_of sN090_2) (wseg_append (wseg_of sN090_3) (wseg_append (wseg_of sN090_4) (wseg_append (wseg_of sN090_5) (wseg_append (wseg_of sN090_6) (wseg_append (wseg_of sN090_7) (wseg_append (wseg_of sN090_8) (wseg_of sN090_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM090_0) (wseg_append (wseg_of sM090_1) (wseg_append (wseg_of sM090_2) (wseg_append (wseg_of sM090_3) (wseg_append (wseg_of sM090_4) (wseg_append (wseg_of sM090_5) (wseg_append (wseg_of sM090_6) (wseg_append (wseg_of sM090_7) (wseg_of sM090_8))))))))))

end PackLean.D28.Ico
