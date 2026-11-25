-- 自動で書き出したもの（lean/tools/export_d28_far_k.py）。手で直さない。
import PackLean.D28.Ico.K.FarS022_0
import PackLean.D28.Ico.K.FarS022_1
import PackLean.D28.Ico.K.FarS022_2
import PackLean.D28.Ico.K.FarS022_3
import PackLean.D28.Ico.K.FarS022_4
import PackLean.D28.Ico.K.FarS022_5
import PackLean.D28.Ico.K.FarS022_6
import PackLean.D28.Ico.K.FarS022_7
import PackLean.D28.Ico.K.FarS022_8
import PackLean.Formal.TetFarKD

namespace PackLean.D28.Ico
open PackLean.D28
open PackLean.Formal.TetFarKD (pairOk_of rtree_of wseg_of wseg_append)

def pair146 : Pair where
  nb := nbN146
  kmNum := 59415
  kmDen := 8388608
  toksN := tN146_0 ++ (tN146_1 ++ (tN146_2 ++ (tN146_3 ++ (tN146_4 ++ (tN146_5 ++ (tN146_6 ++ (tN146_7 ++ (tN146_8 ++ (tN146_9 ++ (tN146_10 ++ (tN146_11 ++ (tN146_12 ++ (tN146_13 ++ (tN146_14))))))))))))))
  toksM := tM146_0 ++ (tM146_1 ++ (tM146_2 ++ (tM146_3 ++ (tM146_4 ++ (tM146_5 ++ (tM146_6 ++ (tM146_7 ++ (tM146_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 146：区間 N 15・M 9。 -/
theorem pair146_ok : pairOk P pair146 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN146_0) (wseg_append (wseg_of sN146_1) (wseg_append (wseg_of sN146_2) (wseg_append (wseg_of sN146_3) (wseg_append (wseg_of sN146_4) (wseg_append (wseg_of sN146_5) (wseg_append (wseg_of sN146_6) (wseg_append (wseg_of sN146_7) (wseg_append (wseg_of sN146_8) (wseg_append (wseg_of sN146_9) (wseg_append (wseg_of sN146_10) (wseg_append (wseg_of sN146_11) (wseg_append (wseg_of sN146_12) (wseg_append (wseg_of sN146_13) (wseg_of sN146_14))))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM146_0) (wseg_append (wseg_of sM146_1) (wseg_append (wseg_of sM146_2) (wseg_append (wseg_of sM146_3) (wseg_append (wseg_of sM146_4) (wseg_append (wseg_of sM146_5) (wseg_append (wseg_of sM146_6) (wseg_append (wseg_of sM146_7) (wseg_of sM146_8))))))))))

def pair147 : Pair where
  nb := nbN147
  kmNum := 58303
  kmDen := 4194304
  toksN := tN147_0 ++ (tN147_1 ++ (tN147_2 ++ (tN147_3 ++ (tN147_4 ++ (tN147_5 ++ (tN147_6 ++ (tN147_7 ++ (tN147_8 ++ (tN147_9 ++ (tN147_10 ++ (tN147_11 ++ (tN147_12))))))))))))
  toksM := tM147_0 ++ (tM147_1 ++ (tM147_2 ++ (tM147_3 ++ (tM147_4 ++ (tM147_5 ++ (tM147_6 ++ (tM147_7 ++ (tM147_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 147：区間 N 13・M 9。 -/
theorem pair147_ok : pairOk P pair147 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN147_0) (wseg_append (wseg_of sN147_1) (wseg_append (wseg_of sN147_2) (wseg_append (wseg_of sN147_3) (wseg_append (wseg_of sN147_4) (wseg_append (wseg_of sN147_5) (wseg_append (wseg_of sN147_6) (wseg_append (wseg_of sN147_7) (wseg_append (wseg_of sN147_8) (wseg_append (wseg_of sN147_9) (wseg_append (wseg_of sN147_10) (wseg_append (wseg_of sN147_11) (wseg_of sN147_12))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM147_0) (wseg_append (wseg_of sM147_1) (wseg_append (wseg_of sM147_2) (wseg_append (wseg_of sM147_3) (wseg_append (wseg_of sM147_4) (wseg_append (wseg_of sM147_5) (wseg_append (wseg_of sM147_6) (wseg_append (wseg_of sM147_7) (wseg_of sM147_8))))))))))

def pair148 : Pair where
  nb := nbN148
  kmNum := 208121
  kmDen := 16777216
  toksN := tN148_0 ++ (tN148_1 ++ (tN148_2 ++ (tN148_3 ++ (tN148_4 ++ (tN148_5 ++ (tN148_6 ++ (tN148_7 ++ (tN148_8 ++ (tN148_9 ++ (tN148_10 ++ (tN148_11 ++ (tN148_12 ++ (tN148_13)))))))))))))
  toksM := tM148_0 ++ (tM148_1 ++ (tM148_2 ++ (tM148_3 ++ (tM148_4 ++ (tM148_5 ++ (tM148_6 ++ (tM148_7 ++ (tM148_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 148：区間 N 14・M 9。 -/
theorem pair148_ok : pairOk P pair148 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN148_0) (wseg_append (wseg_of sN148_1) (wseg_append (wseg_of sN148_2) (wseg_append (wseg_of sN148_3) (wseg_append (wseg_of sN148_4) (wseg_append (wseg_of sN148_5) (wseg_append (wseg_of sN148_6) (wseg_append (wseg_of sN148_7) (wseg_append (wseg_of sN148_8) (wseg_append (wseg_of sN148_9) (wseg_append (wseg_of sN148_10) (wseg_append (wseg_of sN148_11) (wseg_append (wseg_of sN148_12) (wseg_of sN148_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM148_0) (wseg_append (wseg_of sM148_1) (wseg_append (wseg_of sM148_2) (wseg_append (wseg_of sM148_3) (wseg_append (wseg_of sM148_4) (wseg_append (wseg_of sM148_5) (wseg_append (wseg_of sM148_6) (wseg_append (wseg_of sM148_7) (wseg_of sM148_8))))))))))

def pair149 : Pair where
  nb := nbN149
  kmNum := 147239
  kmDen := 16777216
  toksN := tN149_0 ++ (tN149_1 ++ (tN149_2 ++ (tN149_3 ++ (tN149_4 ++ (tN149_5 ++ (tN149_6 ++ (tN149_7 ++ (tN149_8 ++ (tN149_9 ++ (tN149_10 ++ (tN149_11)))))))))))
  toksM := tM149_0 ++ (tM149_1 ++ (tM149_2 ++ (tM149_3 ++ (tM149_4 ++ (tM149_5 ++ (tM149_6 ++ (tM149_7)))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 149：区間 N 12・M 8。 -/
theorem pair149_ok : pairOk P pair149 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN149_0) (wseg_append (wseg_of sN149_1) (wseg_append (wseg_of sN149_2) (wseg_append (wseg_of sN149_3) (wseg_append (wseg_of sN149_4) (wseg_append (wseg_of sN149_5) (wseg_append (wseg_of sN149_6) (wseg_append (wseg_of sN149_7) (wseg_append (wseg_of sN149_8) (wseg_append (wseg_of sN149_9) (wseg_append (wseg_of sN149_10) (wseg_of sN149_11)))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM149_0) (wseg_append (wseg_of sM149_1) (wseg_append (wseg_of sM149_2) (wseg_append (wseg_of sM149_3) (wseg_append (wseg_of sM149_4) (wseg_append (wseg_of sM149_5) (wseg_append (wseg_of sM149_6) (wseg_of sM149_7)))))))))

def pair150 : Pair where
  nb := nbN150
  kmNum := 644741
  kmDen := 16777216
  toksN := tN150_0 ++ (tN150_1 ++ (tN150_2 ++ (tN150_3 ++ (tN150_4 ++ (tN150_5 ++ (tN150_6 ++ (tN150_7 ++ (tN150_8 ++ (tN150_9)))))))))
  toksM := tM150_0 ++ (tM150_1 ++ (tM150_2 ++ (tM150_3 ++ (tM150_4 ++ (tM150_5 ++ (tM150_6 ++ (tM150_7 ++ (tM150_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 150：区間 N 10・M 9。 -/
theorem pair150_ok : pairOk P pair150 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN150_0) (wseg_append (wseg_of sN150_1) (wseg_append (wseg_of sN150_2) (wseg_append (wseg_of sN150_3) (wseg_append (wseg_of sN150_4) (wseg_append (wseg_of sN150_5) (wseg_append (wseg_of sN150_6) (wseg_append (wseg_of sN150_7) (wseg_append (wseg_of sN150_8) (wseg_of sN150_9)))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM150_0) (wseg_append (wseg_of sM150_1) (wseg_append (wseg_of sM150_2) (wseg_append (wseg_of sM150_3) (wseg_append (wseg_of sM150_4) (wseg_append (wseg_of sM150_5) (wseg_append (wseg_of sM150_6) (wseg_append (wseg_of sM150_7) (wseg_of sM150_8))))))))))

def pair151 : Pair where
  nb := nbN151
  kmNum := 15447
  kmDen := 8388608
  toksN := tN151_0 ++ (tN151_1 ++ (tN151_2 ++ (tN151_3 ++ (tN151_4 ++ (tN151_5 ++ (tN151_6 ++ (tN151_7 ++ (tN151_8 ++ (tN151_9 ++ (tN151_10 ++ (tN151_11 ++ (tN151_12 ++ (tN151_13)))))))))))))
  toksM := tM151_0 ++ (tM151_1 ++ (tM151_2 ++ (tM151_3 ++ (tM151_4 ++ (tM151_5 ++ (tM151_6 ++ (tM151_7 ++ (tM151_8))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 組 151：区間 N 14・M 9。 -/
theorem pair151_ok : pairOk P pair151 = true :=
  pairOk_of (by decide +kernel)
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sN151_0) (wseg_append (wseg_of sN151_1) (wseg_append (wseg_of sN151_2) (wseg_append (wseg_of sN151_3) (wseg_append (wseg_of sN151_4) (wseg_append (wseg_of sN151_5) (wseg_append (wseg_of sN151_6) (wseg_append (wseg_of sN151_7) (wseg_append (wseg_of sN151_8) (wseg_append (wseg_of sN151_9) (wseg_append (wseg_of sN151_10) (wseg_append (wseg_of sN151_11) (wseg_append (wseg_of sN151_12) (wseg_of sN151_13)))))))))))))))
    (rtree_of (by decide +kernel) (wseg_append (wseg_of sM151_0) (wseg_append (wseg_of sM151_1) (wseg_append (wseg_of sM151_2) (wseg_append (wseg_of sM151_3) (wseg_append (wseg_of sM151_4) (wseg_append (wseg_of sM151_5) (wseg_append (wseg_of sM151_6) (wseg_append (wseg_of sM151_7) (wseg_of sM151_8))))))))))

end PackLean.D28.Ico
