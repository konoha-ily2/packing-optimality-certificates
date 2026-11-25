-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS006_0
import PackLean.D28.Ico.K.FarS006_1
import PackLean.D28.Ico.K.FarS006_2
import PackLean.D28.Ico.K.FarS006_3
import PackLean.D28.Ico.K.FarS006_4
import PackLean.D28.Ico.K.FarS006_5
import PackLean.D28.Ico.K.FarS006_6
import PackLean.D28.Ico.K.FarS006_7
import PackLean.D28.Ico.K.FarS006_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair046 : Pair where
  nb := nbN046
  kmNum := 157975
  kmDen := 16777216
  toksN := tN046_0 ++ (tN046_1 ++ (tN046_2 ++ (tN046_3 ++ (tN046_4 ++ (tN046_5 ++ (tN046_6 ++ (tN046_7)))))))
  toksM := tM046_0 ++ (tM046_1 ++ (tM046_2 ++ (tM046_3 ++ (tM046_4 ++ (tM046_5 ++ (tM046_6 ++ (tM046_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 046：区間 N 8・M 8。 -/
theorem pair046_ok : pairOk P pair046 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN046_0) (wseg_append (wseg_of sN046_1) (wseg_append (wseg_of sN046_2) (wseg_append (wseg_of sN046_3) (wseg_append (wseg_of sN046_4) (wseg_append (wseg_of sN046_5) (wseg_append (wseg_of sN046_6) (wseg_of sN046_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM046_0) (wseg_append (wseg_of sM046_1) (wseg_append (wseg_of sM046_2) (wseg_append (wseg_of sM046_3) (wseg_append (wseg_of sM046_4) (wseg_append (wseg_of sM046_5) (wseg_append (wseg_of sM046_6) (wseg_of sM046_7)))))))))

def pair047 : Pair where
  nb := nbN047
  kmNum := 263773
  kmDen := 16777216
  toksN := tN047_0 ++ (tN047_1 ++ (tN047_2 ++ (tN047_3 ++ (tN047_4 ++ (tN047_5 ++ (tN047_6))))))
  toksM := tM047_0 ++ (tM047_1 ++ (tM047_2 ++ (tM047_3 ++ (tM047_4 ++ (tM047_5 ++ (tM047_6 ++ (tM047_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 047：区間 N 7・M 8。 -/
theorem pair047_ok : pairOk P pair047 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN047_0) (wseg_append (wseg_of sN047_1) (wseg_append (wseg_of sN047_2) (wseg_append (wseg_of sN047_3) (wseg_append (wseg_of sN047_4) (wseg_append (wseg_of sN047_5) (wseg_of sN047_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM047_0) (wseg_append (wseg_of sM047_1) (wseg_append (wseg_of sM047_2) (wseg_append (wseg_of sM047_3) (wseg_append (wseg_of sM047_4) (wseg_append (wseg_of sM047_5) (wseg_append (wseg_of sM047_6) (wseg_of sM047_7)))))))))

def pair048 : Pair where
  nb := nbN048
  kmNum := 41309
  kmDen := 16777216
  toksN := tN048_0 ++ (tN048_1 ++ (tN048_2 ++ (tN048_3 ++ (tN048_4 ++ (tN048_5 ++ (tN048_6 ++ (tN048_7 ++ (tN048_8))))))))
  toksM := tM048_0 ++ (tM048_1 ++ (tM048_2 ++ (tM048_3 ++ (tM048_4 ++ (tM048_5 ++ (tM048_6 ++ (tM048_7 ++ (tM048_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 048：区間 N 9・M 9。 -/
theorem pair048_ok : pairOk P pair048 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN048_0) (wseg_append (wseg_of sN048_1) (wseg_append (wseg_of sN048_2) (wseg_append (wseg_of sN048_3) (wseg_append (wseg_of sN048_4) (wseg_append (wseg_of sN048_5) (wseg_append (wseg_of sN048_6) (wseg_append (wseg_of sN048_7) (wseg_of sN048_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM048_0) (wseg_append (wseg_of sM048_1) (wseg_append (wseg_of sM048_2) (wseg_append (wseg_of sM048_3) (wseg_append (wseg_of sM048_4) (wseg_append (wseg_of sM048_5) (wseg_append (wseg_of sM048_6) (wseg_append (wseg_of sM048_7) (wseg_of sM048_8))))))))))

def pair049 : Pair where
  nb := nbN049
  kmNum := 109977
  kmDen := 16777216
  toksN := tN049_0 ++ (tN049_1 ++ (tN049_2 ++ (tN049_3 ++ (tN049_4 ++ (tN049_5 ++ (tN049_6 ++ (tN049_7)))))))
  toksM := tM049_0 ++ (tM049_1 ++ (tM049_2 ++ (tM049_3 ++ (tM049_4 ++ (tM049_5 ++ (tM049_6 ++ (tM049_7 ++ (tM049_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 049：区間 N 8・M 9。 -/
theorem pair049_ok : pairOk P pair049 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN049_0) (wseg_append (wseg_of sN049_1) (wseg_append (wseg_of sN049_2) (wseg_append (wseg_of sN049_3) (wseg_append (wseg_of sN049_4) (wseg_append (wseg_of sN049_5) (wseg_append (wseg_of sN049_6) (wseg_of sN049_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM049_0) (wseg_append (wseg_of sM049_1) (wseg_append (wseg_of sM049_2) (wseg_append (wseg_of sM049_3) (wseg_append (wseg_of sM049_4) (wseg_append (wseg_of sM049_5) (wseg_append (wseg_of sM049_6) (wseg_append (wseg_of sM049_7) (wseg_of sM049_8))))))))))

def pair050 : Pair where
  nb := nbN050
  kmNum := 399647
  kmDen := 16777216
  toksN := tN050_0 ++ (tN050_1 ++ (tN050_2 ++ (tN050_3 ++ (tN050_4 ++ (tN050_5 ++ (tN050_6))))))
  toksM := tM050_0 ++ (tM050_1 ++ (tM050_2 ++ (tM050_3 ++ (tM050_4 ++ (tM050_5 ++ (tM050_6 ++ (tM050_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 050：区間 N 7・M 8。 -/
theorem pair050_ok : pairOk P pair050 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN050_0) (wseg_append (wseg_of sN050_1) (wseg_append (wseg_of sN050_2) (wseg_append (wseg_of sN050_3) (wseg_append (wseg_of sN050_4) (wseg_append (wseg_of sN050_5) (wseg_of sN050_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM050_0) (wseg_append (wseg_of sM050_1) (wseg_append (wseg_of sM050_2) (wseg_append (wseg_of sM050_3) (wseg_append (wseg_of sM050_4) (wseg_append (wseg_of sM050_5) (wseg_append (wseg_of sM050_6) (wseg_of sM050_7)))))))))

def pair051 : Pair where
  nb := nbN051
  kmNum := 830937
  kmDen := 16777216
  toksN := tN051_0 ++ (tN051_1 ++ (tN051_2 ++ (tN051_3 ++ (tN051_4 ++ (tN051_5)))))
  toksM := tM051_0 ++ (tM051_1 ++ (tM051_2 ++ (tM051_3 ++ (tM051_4 ++ (tM051_5 ++ (tM051_6 ++ (tM051_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 051：区間 N 6・M 8。 -/
theorem pair051_ok : pairOk P pair051 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN051_0) (wseg_append (wseg_of sN051_1) (wseg_append (wseg_of sN051_2) (wseg_append (wseg_of sN051_3) (wseg_append (wseg_of sN051_4) (wseg_of sN051_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM051_0) (wseg_append (wseg_of sM051_1) (wseg_append (wseg_of sM051_2) (wseg_append (wseg_of sM051_3) (wseg_append (wseg_of sM051_4) (wseg_append (wseg_of sM051_5) (wseg_append (wseg_of sM051_6) (wseg_of sM051_7)))))))))

def pair052 : Pair where
  nb := nbN052
  kmNum := 108545
  kmDen := 8388608
  toksN := tN052_0 ++ (tN052_1 ++ (tN052_2 ++ (tN052_3 ++ (tN052_4 ++ (tN052_5 ++ (tN052_6 ++ (tN052_7)))))))
  toksM := tM052_0 ++ (tM052_1 ++ (tM052_2 ++ (tM052_3 ++ (tM052_4 ++ (tM052_5 ++ (tM052_6 ++ (tM052_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 052：区間 N 8・M 8。 -/
theorem pair052_ok : pairOk P pair052 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN052_0) (wseg_append (wseg_of sN052_1) (wseg_append (wseg_of sN052_2) (wseg_append (wseg_of sN052_3) (wseg_append (wseg_of sN052_4) (wseg_append (wseg_of sN052_5) (wseg_append (wseg_of sN052_6) (wseg_of sN052_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM052_0) (wseg_append (wseg_of sM052_1) (wseg_append (wseg_of sM052_2) (wseg_append (wseg_of sM052_3) (wseg_append (wseg_of sM052_4) (wseg_append (wseg_of sM052_5) (wseg_append (wseg_of sM052_6) (wseg_of sM052_7)))))))))

def pair053 : Pair where
  nb := nbN053
  kmNum := 357579
  kmDen := 16777216
  toksN := tN053_0 ++ (tN053_1 ++ (tN053_2 ++ (tN053_3 ++ (tN053_4 ++ (tN053_5 ++ (tN053_6 ++ (tN053_7)))))))
  toksM := tM053_0 ++ (tM053_1 ++ (tM053_2 ++ (tM053_3 ++ (tM053_4 ++ (tM053_5 ++ (tM053_6 ++ (tM053_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 053：区間 N 8・M 8。 -/
theorem pair053_ok : pairOk P pair053 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN053_0) (wseg_append (wseg_of sN053_1) (wseg_append (wseg_of sN053_2) (wseg_append (wseg_of sN053_3) (wseg_append (wseg_of sN053_4) (wseg_append (wseg_of sN053_5) (wseg_append (wseg_of sN053_6) (wseg_of sN053_7)))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM053_0) (wseg_append (wseg_of sM053_1) (wseg_append (wseg_of sM053_2) (wseg_append (wseg_of sM053_3) (wseg_append (wseg_of sM053_4) (wseg_append (wseg_of sM053_5) (wseg_append (wseg_of sM053_6) (wseg_of sM053_7)))))))))

end PackLean.D28.Ico
