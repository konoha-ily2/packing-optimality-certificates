-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS005_0
import PackLean.D28.Ico.K.FarS005_1
import PackLean.D28.Ico.K.FarS005_2
import PackLean.D28.Ico.K.FarS005_3
import PackLean.D28.Ico.K.FarS005_4
import PackLean.D28.Ico.K.FarS005_5
import PackLean.D28.Ico.K.FarS005_6
import PackLean.D28.Ico.K.FarS005_7
import PackLean.D28.Ico.K.FarS005_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair038 : Pair where
  nb := nbN038
  kmNum := 0
  kmDen := 1
  toksN := tN038_0 ++ (tN038_1 ++ (tN038_2 ++ (tN038_3 ++ (tN038_4 ++ (tN038_5 ++ (tN038_6 ++ (tN038_7 ++ (tN038_8 ++ (tN038_9)))))))))
  toksM := tM038_0 ++ (tM038_1 ++ (tM038_2 ++ (tM038_3 ++ (tM038_4 ++ (tM038_5 ++ (tM038_6 ++ (tM038_7 ++ (tM038_8 ++ (tM038_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 038：区間 N 10・M 10。 -/
theorem pair038_ok : pairOk P pair038 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN038_0) (wseg_append (wseg_of sN038_1) (wseg_append (wseg_of sN038_2) (wseg_append (wseg_of sN038_3) (wseg_append (wseg_of sN038_4) (wseg_append (wseg_of sN038_5) (wseg_append (wseg_of sN038_6) (wseg_append (wseg_of sN038_7) (wseg_append (wseg_of sN038_8) (wseg_of sN038_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM038_0) (wseg_append (wseg_of sM038_1) (wseg_append (wseg_of sM038_2) (wseg_append (wseg_of sM038_3) (wseg_append (wseg_of sM038_4) (wseg_append (wseg_of sM038_5) (wseg_append (wseg_of sM038_6) (wseg_append (wseg_of sM038_7) (wseg_append (wseg_of sM038_8) (wseg_of sM038_9)))))))))))

def pair039 : Pair where
  nb := nbN039
  kmNum := 1
  kmDen := 16777216
  toksN := tN039_0 ++ (tN039_1 ++ (tN039_2 ++ (tN039_3 ++ (tN039_4 ++ (tN039_5 ++ (tN039_6 ++ (tN039_7 ++ (tN039_8))))))))
  toksM := tM039_0 ++ (tM039_1 ++ (tM039_2 ++ (tM039_3 ++ (tM039_4 ++ (tM039_5 ++ (tM039_6 ++ (tM039_7 ++ (tM039_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 039：区間 N 9・M 9。 -/
theorem pair039_ok : pairOk P pair039 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN039_0) (wseg_append (wseg_of sN039_1) (wseg_append (wseg_of sN039_2) (wseg_append (wseg_of sN039_3) (wseg_append (wseg_of sN039_4) (wseg_append (wseg_of sN039_5) (wseg_append (wseg_of sN039_6) (wseg_append (wseg_of sN039_7) (wseg_of sN039_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM039_0) (wseg_append (wseg_of sM039_1) (wseg_append (wseg_of sM039_2) (wseg_append (wseg_of sM039_3) (wseg_append (wseg_of sM039_4) (wseg_append (wseg_of sM039_5) (wseg_append (wseg_of sM039_6) (wseg_append (wseg_of sM039_7) (wseg_of sM039_8))))))))))

def pair040 : Pair where
  nb := nbN040
  kmNum := 7033
  kmDen := 16777216
  toksN := tN040_0 ++ (tN040_1 ++ (tN040_2 ++ (tN040_3 ++ (tN040_4 ++ (tN040_5 ++ (tN040_6 ++ (tN040_7 ++ (tN040_8))))))))
  toksM := tM040_0 ++ (tM040_1 ++ (tM040_2 ++ (tM040_3 ++ (tM040_4 ++ (tM040_5 ++ (tM040_6 ++ (tM040_7 ++ (tM040_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 040：区間 N 9・M 9。 -/
theorem pair040_ok : pairOk P pair040 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN040_0) (wseg_append (wseg_of sN040_1) (wseg_append (wseg_of sN040_2) (wseg_append (wseg_of sN040_3) (wseg_append (wseg_of sN040_4) (wseg_append (wseg_of sN040_5) (wseg_append (wseg_of sN040_6) (wseg_append (wseg_of sN040_7) (wseg_of sN040_8))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM040_0) (wseg_append (wseg_of sM040_1) (wseg_append (wseg_of sM040_2) (wseg_append (wseg_of sM040_3) (wseg_append (wseg_of sM040_4) (wseg_append (wseg_of sM040_5) (wseg_append (wseg_of sM040_6) (wseg_append (wseg_of sM040_7) (wseg_of sM040_8))))))))))

def pair041 : Pair where
  nb := nbN041
  kmNum := 261715
  kmDen := 8388608
  toksN := tN041_0 ++ (tN041_1 ++ (tN041_2 ++ (tN041_3 ++ (tN041_4 ++ (tN041_5)))))
  toksM := tM041_0 ++ (tM041_1 ++ (tM041_2 ++ (tM041_3 ++ (tM041_4 ++ (tM041_5 ++ (tM041_6 ++ (tM041_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 041：区間 N 6・M 8。 -/
theorem pair041_ok : pairOk P pair041 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN041_0) (wseg_append (wseg_of sN041_1) (wseg_append (wseg_of sN041_2) (wseg_append (wseg_of sN041_3) (wseg_append (wseg_of sN041_4) (wseg_of sN041_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM041_0) (wseg_append (wseg_of sM041_1) (wseg_append (wseg_of sM041_2) (wseg_append (wseg_of sM041_3) (wseg_append (wseg_of sM041_4) (wseg_append (wseg_of sM041_5) (wseg_append (wseg_of sM041_6) (wseg_of sM041_7)))))))))

def pair042 : Pair where
  nb := nbN042
  kmNum := 938735
  kmDen := 16777216
  toksN := tN042_0 ++ (tN042_1 ++ (tN042_2 ++ (tN042_3 ++ (tN042_4 ++ (tN042_5)))))
  toksM := tM042_0 ++ (tM042_1 ++ (tM042_2 ++ (tM042_3 ++ (tM042_4 ++ (tM042_5 ++ (tM042_6 ++ (tM042_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 042：区間 N 6・M 8。 -/
theorem pair042_ok : pairOk P pair042 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN042_0) (wseg_append (wseg_of sN042_1) (wseg_append (wseg_of sN042_2) (wseg_append (wseg_of sN042_3) (wseg_append (wseg_of sN042_4) (wseg_of sN042_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM042_0) (wseg_append (wseg_of sM042_1) (wseg_append (wseg_of sM042_2) (wseg_append (wseg_of sM042_3) (wseg_append (wseg_of sM042_4) (wseg_append (wseg_of sM042_5) (wseg_append (wseg_of sM042_6) (wseg_of sM042_7)))))))))

def pair043 : Pair where
  nb := nbN043
  kmNum := 40611
  kmDen := 2097152
  toksN := tN043_0 ++ (tN043_1 ++ (tN043_2 ++ (tN043_3 ++ (tN043_4 ++ (tN043_5 ++ (tN043_6))))))
  toksM := tM043_0 ++ (tM043_1 ++ (tM043_2 ++ (tM043_3 ++ (tM043_4 ++ (tM043_5 ++ (tM043_6 ++ (tM043_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 043：区間 N 7・M 8。 -/
theorem pair043_ok : pairOk P pair043 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN043_0) (wseg_append (wseg_of sN043_1) (wseg_append (wseg_of sN043_2) (wseg_append (wseg_of sN043_3) (wseg_append (wseg_of sN043_4) (wseg_append (wseg_of sN043_5) (wseg_of sN043_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM043_0) (wseg_append (wseg_of sM043_1) (wseg_append (wseg_of sM043_2) (wseg_append (wseg_of sM043_3) (wseg_append (wseg_of sM043_4) (wseg_append (wseg_of sM043_5) (wseg_append (wseg_of sM043_6) (wseg_of sM043_7)))))))))

def pair044 : Pair where
  nb := nbN044
  kmNum := 460259
  kmDen := 16777216
  toksN := tN044_0 ++ (tN044_1 ++ (tN044_2 ++ (tN044_3 ++ (tN044_4 ++ (tN044_5 ++ (tN044_6))))))
  toksM := tM044_0 ++ (tM044_1 ++ (tM044_2 ++ (tM044_3 ++ (tM044_4 ++ (tM044_5 ++ (tM044_6 ++ (tM044_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 044：区間 N 7・M 8。 -/
theorem pair044_ok : pairOk P pair044 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN044_0) (wseg_append (wseg_of sN044_1) (wseg_append (wseg_of sN044_2) (wseg_append (wseg_of sN044_3) (wseg_append (wseg_of sN044_4) (wseg_append (wseg_of sN044_5) (wseg_of sN044_6))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM044_0) (wseg_append (wseg_of sM044_1) (wseg_append (wseg_of sM044_2) (wseg_append (wseg_of sM044_3) (wseg_append (wseg_of sM044_4) (wseg_append (wseg_of sM044_5) (wseg_append (wseg_of sM044_6) (wseg_of sM044_7)))))))))

def pair045 : Pair where
  nb := nbN045
  kmNum := 877621
  kmDen := 16777216
  toksN := tN045_0 ++ (tN045_1 ++ (tN045_2 ++ (tN045_3 ++ (tN045_4 ++ (tN045_5)))))
  toksM := tM045_0 ++ (tM045_1 ++ (tM045_2 ++ (tM045_3 ++ (tM045_4 ++ (tM045_5 ++ (tM045_6 ++ (tM045_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 045：区間 N 6・M 8。 -/
theorem pair045_ok : pairOk P pair045 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN045_0) (wseg_append (wseg_of sN045_1) (wseg_append (wseg_of sN045_2) (wseg_append (wseg_of sN045_3) (wseg_append (wseg_of sN045_4) (wseg_of sN045_5)))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM045_0) (wseg_append (wseg_of sM045_1) (wseg_append (wseg_of sM045_2) (wseg_append (wseg_of sM045_3) (wseg_append (wseg_of sM045_4) (wseg_append (wseg_of sM045_5) (wseg_append (wseg_of sM045_6) (wseg_of sM045_7)))))))))

end PackLean.D28.Ico
