-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS009_0
import PackLean.D28.Ico.K.FarS009_1
import PackLean.D28.Ico.K.FarS009_2
import PackLean.D28.Ico.K.FarS009_3
import PackLean.D28.Ico.K.FarS009_4
import PackLean.D28.Ico.K.FarS009_5
import PackLean.D28.Ico.K.FarS009_6
import PackLean.D28.Ico.K.FarS009_7
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair066 : Pair where
  nb := nbN066
  kmNum := 1
  kmDen := 16777216
  toksN := tN066_0 ++ (tN066_1 ++ (tN066_2 ++ (tN066_3 ++ (tN066_4 ++ (tN066_5 ++ (tN066_6 ++ (tN066_7 ++ (tN066_8 ++ (tN066_9)))))))))
  toksM := tM066_0 ++ (tM066_1 ++ (tM066_2 ++ (tM066_3 ++ (tM066_4 ++ (tM066_5 ++ (tM066_6 ++ (tM066_7 ++ (tM066_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 066：区間 N 10・M 9。 -/
theorem pair066_ok : pairOk P pair066 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN066_0) (wseg_append (wseg_of sN066_1) (wseg_append (wseg_of sN066_2) (wseg_append (wseg_of sN066_3) (wseg_append (wseg_of sN066_4) (wseg_append (wseg_of sN066_5) (wseg_append (wseg_of sN066_6) (wseg_append (wseg_of sN066_7) (wseg_append (wseg_of sN066_8) (wseg_of sN066_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM066_0) (wseg_append (wseg_of sM066_1) (wseg_append (wseg_of sM066_2) (wseg_append (wseg_of sM066_3) (wseg_append (wseg_of sM066_4) (wseg_append (wseg_of sM066_5) (wseg_append (wseg_of sM066_6) (wseg_append (wseg_of sM066_7) (wseg_of sM066_8))))))))))

def pair067 : Pair where
  nb := nbN067
  kmNum := 1
  kmDen := 16777216
  toksN := tN067_0 ++ (tN067_1 ++ (tN067_2 ++ (tN067_3 ++ (tN067_4 ++ (tN067_5 ++ (tN067_6 ++ (tN067_7 ++ (tN067_8 ++ (tN067_9)))))))))
  toksM := tM067_0 ++ (tM067_1 ++ (tM067_2 ++ (tM067_3 ++ (tM067_4 ++ (tM067_5 ++ (tM067_6 ++ (tM067_7 ++ (tM067_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 067：区間 N 10・M 9。 -/
theorem pair067_ok : pairOk P pair067 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN067_0) (wseg_append (wseg_of sN067_1) (wseg_append (wseg_of sN067_2) (wseg_append (wseg_of sN067_3) (wseg_append (wseg_of sN067_4) (wseg_append (wseg_of sN067_5) (wseg_append (wseg_of sN067_6) (wseg_append (wseg_of sN067_7) (wseg_append (wseg_of sN067_8) (wseg_of sN067_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM067_0) (wseg_append (wseg_of sM067_1) (wseg_append (wseg_of sM067_2) (wseg_append (wseg_of sM067_3) (wseg_append (wseg_of sM067_4) (wseg_append (wseg_of sM067_5) (wseg_append (wseg_of sM067_6) (wseg_append (wseg_of sM067_7) (wseg_of sM067_8))))))))))

def pair068 : Pair where
  nb := nbN068
  kmNum := 0
  kmDen := 1
  toksN := tN068_0 ++ (tN068_1 ++ (tN068_2 ++ (tN068_3 ++ (tN068_4 ++ (tN068_5 ++ (tN068_6 ++ (tN068_7 ++ (tN068_8 ++ (tN068_9 ++ (tN068_10))))))))))
  toksM := tM068_0 ++ (tM068_1 ++ (tM068_2 ++ (tM068_3 ++ (tM068_4 ++ (tM068_5 ++ (tM068_6 ++ (tM068_7 ++ (tM068_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 068：区間 N 11・M 9。 -/
theorem pair068_ok : pairOk P pair068 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN068_0) (wseg_append (wseg_of sN068_1) (wseg_append (wseg_of sN068_2) (wseg_append (wseg_of sN068_3) (wseg_append (wseg_of sN068_4) (wseg_append (wseg_of sN068_5) (wseg_append (wseg_of sN068_6) (wseg_append (wseg_of sN068_7) (wseg_append (wseg_of sN068_8) (wseg_append (wseg_of sN068_9) (wseg_of sN068_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM068_0) (wseg_append (wseg_of sM068_1) (wseg_append (wseg_of sM068_2) (wseg_append (wseg_of sM068_3) (wseg_append (wseg_of sM068_4) (wseg_append (wseg_of sM068_5) (wseg_append (wseg_of sM068_6) (wseg_append (wseg_of sM068_7) (wseg_of sM068_8))))))))))

def pair069 : Pair where
  nb := nbN069
  kmNum := 0
  kmDen := 1
  toksN := tN069_0 ++ (tN069_1 ++ (tN069_2 ++ (tN069_3 ++ (tN069_4 ++ (tN069_5 ++ (tN069_6 ++ (tN069_7 ++ (tN069_8 ++ (tN069_9)))))))))
  toksM := tM069_0 ++ (tM069_1 ++ (tM069_2 ++ (tM069_3 ++ (tM069_4 ++ (tM069_5 ++ (tM069_6 ++ (tM069_7 ++ (tM069_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 069：区間 N 10・M 9。 -/
theorem pair069_ok : pairOk P pair069 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN069_0) (wseg_append (wseg_of sN069_1) (wseg_append (wseg_of sN069_2) (wseg_append (wseg_of sN069_3) (wseg_append (wseg_of sN069_4) (wseg_append (wseg_of sN069_5) (wseg_append (wseg_of sN069_6) (wseg_append (wseg_of sN069_7) (wseg_append (wseg_of sN069_8) (wseg_of sN069_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM069_0) (wseg_append (wseg_of sM069_1) (wseg_append (wseg_of sM069_2) (wseg_append (wseg_of sM069_3) (wseg_append (wseg_of sM069_4) (wseg_append (wseg_of sM069_5) (wseg_append (wseg_of sM069_6) (wseg_append (wseg_of sM069_7) (wseg_of sM069_8))))))))))

def pair070 : Pair where
  nb := nbN070
  kmNum := 1
  kmDen := 16777216
  toksN := tN070_0 ++ (tN070_1 ++ (tN070_2 ++ (tN070_3 ++ (tN070_4 ++ (tN070_5 ++ (tN070_6 ++ (tN070_7 ++ (tN070_8 ++ (tN070_9 ++ (tN070_10))))))))))
  toksM := tM070_0 ++ (tM070_1 ++ (tM070_2 ++ (tM070_3 ++ (tM070_4 ++ (tM070_5 ++ (tM070_6 ++ (tM070_7 ++ (tM070_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 070：区間 N 11・M 9。 -/
theorem pair070_ok : pairOk P pair070 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN070_0) (wseg_append (wseg_of sN070_1) (wseg_append (wseg_of sN070_2) (wseg_append (wseg_of sN070_3) (wseg_append (wseg_of sN070_4) (wseg_append (wseg_of sN070_5) (wseg_append (wseg_of sN070_6) (wseg_append (wseg_of sN070_7) (wseg_append (wseg_of sN070_8) (wseg_append (wseg_of sN070_9) (wseg_of sN070_10))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM070_0) (wseg_append (wseg_of sM070_1) (wseg_append (wseg_of sM070_2) (wseg_append (wseg_of sM070_3) (wseg_append (wseg_of sM070_4) (wseg_append (wseg_of sM070_5) (wseg_append (wseg_of sM070_6) (wseg_append (wseg_of sM070_7) (wseg_of sM070_8))))))))))

def pair071 : Pair where
  nb := nbN071
  kmNum := 0
  kmDen := 1
  toksN := tN071_0 ++ (tN071_1 ++ (tN071_2 ++ (tN071_3 ++ (tN071_4 ++ (tN071_5 ++ (tN071_6 ++ (tN071_7 ++ (tN071_8 ++ (tN071_9)))))))))
  toksM := tM071_0 ++ (tM071_1 ++ (tM071_2 ++ (tM071_3 ++ (tM071_4 ++ (tM071_5 ++ (tM071_6 ++ (tM071_7 ++ (tM071_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 071：区間 N 10・M 9。 -/
theorem pair071_ok : pairOk P pair071 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN071_0) (wseg_append (wseg_of sN071_1) (wseg_append (wseg_of sN071_2) (wseg_append (wseg_of sN071_3) (wseg_append (wseg_of sN071_4) (wseg_append (wseg_of sN071_5) (wseg_append (wseg_of sN071_6) (wseg_append (wseg_of sN071_7) (wseg_append (wseg_of sN071_8) (wseg_of sN071_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM071_0) (wseg_append (wseg_of sM071_1) (wseg_append (wseg_of sM071_2) (wseg_append (wseg_of sM071_3) (wseg_append (wseg_of sM071_4) (wseg_append (wseg_of sM071_5) (wseg_append (wseg_of sM071_6) (wseg_append (wseg_of sM071_7) (wseg_of sM071_8))))))))))

end PackLean.D28.Ico
