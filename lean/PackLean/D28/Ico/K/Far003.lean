-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS003_0
import PackLean.D28.Ico.K.FarS003_1
import PackLean.D28.Ico.K.FarS003_2
import PackLean.D28.Ico.K.FarS003_3
import PackLean.D28.Ico.K.FarS003_4
import PackLean.D28.Ico.K.FarS003_5
import PackLean.D28.Ico.K.FarS003_6
import PackLean.D28.Ico.K.FarS003_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair025 : Pair where
  nb := nbN025
  kmNum := 0
  kmDen := 1
  toksN := tN025_0 ++ (tN025_1 ++ (tN025_2 ++ (tN025_3 ++ (tN025_4 ++ (tN025_5 ++ (tN025_6 ++ (tN025_7 ++ (tN025_8 ++ (tN025_9)))))))))
  toksM := tM025_0 ++ (tM025_1 ++ (tM025_2 ++ (tM025_3 ++ (tM025_4 ++ (tM025_5 ++ (tM025_6 ++ (tM025_7 ++ (tM025_8 ++ (tM025_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 025：区間 N 10・M 10。 -/
theorem pair025_ok : pairOk P pair025 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN025_0) (wseg_append (wseg_of sN025_1) (wseg_append (wseg_of sN025_2) (wseg_append (wseg_of sN025_3) (wseg_append (wseg_of sN025_4) (wseg_append (wseg_of sN025_5) (wseg_append (wseg_of sN025_6) (wseg_append (wseg_of sN025_7) (wseg_append (wseg_of sN025_8) (wseg_of sN025_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM025_0) (wseg_append (wseg_of sM025_1) (wseg_append (wseg_of sM025_2) (wseg_append (wseg_of sM025_3) (wseg_append (wseg_of sM025_4) (wseg_append (wseg_of sM025_5) (wseg_append (wseg_of sM025_6) (wseg_append (wseg_of sM025_7) (wseg_append (wseg_of sM025_8) (wseg_of sM025_9)))))))))))

def pair026 : Pair where
  nb := nbN026
  kmNum := 1
  kmDen := 16777216
  toksN := tN026_0 ++ (tN026_1 ++ (tN026_2 ++ (tN026_3 ++ (tN026_4 ++ (tN026_5 ++ (tN026_6 ++ (tN026_7)))))))
  toksM := tM026_0 ++ (tM026_1 ++ (tM026_2 ++ (tM026_3 ++ (tM026_4 ++ (tM026_5 ++ (tM026_6 ++ (tM026_7 ++ (tM026_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 026：区間 N 8・M 9。 -/
theorem pair026_ok : pairOk P pair026 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN026_0) (wseg_append (wseg_of sN026_1) (wseg_append (wseg_of sN026_2) (wseg_append (wseg_of sN026_3) (wseg_append (wseg_of sN026_4) (wseg_append (wseg_of sN026_5) (wseg_append (wseg_of sN026_6) (wseg_of sN026_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM026_0) (wseg_append (wseg_of sM026_1) (wseg_append (wseg_of sM026_2) (wseg_append (wseg_of sM026_3) (wseg_append (wseg_of sM026_4) (wseg_append (wseg_of sM026_5) (wseg_append (wseg_of sM026_6) (wseg_append (wseg_of sM026_7) (wseg_of sM026_8))))))))))

def pair027 : Pair where
  nb := nbN027
  kmNum := 1223
  kmDen := 8388608
  toksN := tN027_0 ++ (tN027_1 ++ (tN027_2 ++ (tN027_3 ++ (tN027_4 ++ (tN027_5 ++ (tN027_6 ++ (tN027_7)))))))
  toksM := tM027_0 ++ (tM027_1 ++ (tM027_2 ++ (tM027_3 ++ (tM027_4 ++ (tM027_5 ++ (tM027_6 ++ (tM027_7 ++ (tM027_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 027：区間 N 8・M 9。 -/
theorem pair027_ok : pairOk P pair027 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN027_0) (wseg_append (wseg_of sN027_1) (wseg_append (wseg_of sN027_2) (wseg_append (wseg_of sN027_3) (wseg_append (wseg_of sN027_4) (wseg_append (wseg_of sN027_5) (wseg_append (wseg_of sN027_6) (wseg_of sN027_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM027_0) (wseg_append (wseg_of sM027_1) (wseg_append (wseg_of sM027_2) (wseg_append (wseg_of sM027_3) (wseg_append (wseg_of sM027_4) (wseg_append (wseg_of sM027_5) (wseg_append (wseg_of sM027_6) (wseg_append (wseg_of sM027_7) (wseg_of sM027_8))))))))))

def pair028 : Pair where
  nb := nbN028
  kmNum := 0
  kmDen := 1
  toksN := tN028_0 ++ (tN028_1 ++ (tN028_2 ++ (tN028_3 ++ (tN028_4 ++ (tN028_5 ++ (tN028_6 ++ (tN028_7 ++ (tN028_8 ++ (tN028_9)))))))))
  toksM := tM028_0 ++ (tM028_1 ++ (tM028_2 ++ (tM028_3 ++ (tM028_4 ++ (tM028_5 ++ (tM028_6 ++ (tM028_7 ++ (tM028_8 ++ (tM028_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 028：区間 N 10・M 10。 -/
theorem pair028_ok : pairOk P pair028 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN028_0) (wseg_append (wseg_of sN028_1) (wseg_append (wseg_of sN028_2) (wseg_append (wseg_of sN028_3) (wseg_append (wseg_of sN028_4) (wseg_append (wseg_of sN028_5) (wseg_append (wseg_of sN028_6) (wseg_append (wseg_of sN028_7) (wseg_append (wseg_of sN028_8) (wseg_of sN028_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM028_0) (wseg_append (wseg_of sM028_1) (wseg_append (wseg_of sM028_2) (wseg_append (wseg_of sM028_3) (wseg_append (wseg_of sM028_4) (wseg_append (wseg_of sM028_5) (wseg_append (wseg_of sM028_6) (wseg_append (wseg_of sM028_7) (wseg_append (wseg_of sM028_8) (wseg_of sM028_9)))))))))))

def pair029 : Pair where
  nb := nbN029
  kmNum := 1
  kmDen := 16777216
  toksN := tN029_0 ++ (tN029_1 ++ (tN029_2 ++ (tN029_3 ++ (tN029_4 ++ (tN029_5 ++ (tN029_6 ++ (tN029_7 ++ (tN029_8 ++ (tN029_9)))))))))
  toksM := tM029_0 ++ (tM029_1 ++ (tM029_2 ++ (tM029_3 ++ (tM029_4 ++ (tM029_5 ++ (tM029_6 ++ (tM029_7 ++ (tM029_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 029：区間 N 10・M 9。 -/
theorem pair029_ok : pairOk P pair029 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN029_0) (wseg_append (wseg_of sN029_1) (wseg_append (wseg_of sN029_2) (wseg_append (wseg_of sN029_3) (wseg_append (wseg_of sN029_4) (wseg_append (wseg_of sN029_5) (wseg_append (wseg_of sN029_6) (wseg_append (wseg_of sN029_7) (wseg_append (wseg_of sN029_8) (wseg_of sN029_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM029_0) (wseg_append (wseg_of sM029_1) (wseg_append (wseg_of sM029_2) (wseg_append (wseg_of sM029_3) (wseg_append (wseg_of sM029_4) (wseg_append (wseg_of sM029_5) (wseg_append (wseg_of sM029_6) (wseg_append (wseg_of sM029_7) (wseg_of sM029_8))))))))))

def pair030 : Pair where
  nb := nbN030
  kmNum := 0
  kmDen := 1
  toksN := tN030_0 ++ (tN030_1 ++ (tN030_2 ++ (tN030_3 ++ (tN030_4 ++ (tN030_5 ++ (tN030_6 ++ (tN030_7 ++ (tN030_8 ++ (tN030_9)))))))))
  toksM := tM030_0 ++ (tM030_1 ++ (tM030_2 ++ (tM030_3 ++ (tM030_4 ++ (tM030_5 ++ (tM030_6 ++ (tM030_7 ++ (tM030_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 030：区間 N 10・M 9。 -/
theorem pair030_ok : pairOk P pair030 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN030_0) (wseg_append (wseg_of sN030_1) (wseg_append (wseg_of sN030_2) (wseg_append (wseg_of sN030_3) (wseg_append (wseg_of sN030_4) (wseg_append (wseg_of sN030_5) (wseg_append (wseg_of sN030_6) (wseg_append (wseg_of sN030_7) (wseg_append (wseg_of sN030_8) (wseg_of sN030_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM030_0) (wseg_append (wseg_of sM030_1) (wseg_append (wseg_of sM030_2) (wseg_append (wseg_of sM030_3) (wseg_append (wseg_of sM030_4) (wseg_append (wseg_of sM030_5) (wseg_append (wseg_of sM030_6) (wseg_append (wseg_of sM030_7) (wseg_of sM030_8))))))))))

end PackLean.D28.Ico
