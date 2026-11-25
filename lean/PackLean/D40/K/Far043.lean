-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS043_0
import PackLean.D40.K.FarS043_1
import PackLean.D40.K.FarS043_2
import PackLean.D40.K.FarS043_3
import PackLean.D40.K.FarS043_4
import PackLean.D40.K.FarS043_5
import PackLean.D40.K.FarS043_6
import PackLean.D40.K.FarS043_7
import PackLean.D40.K.FarS043_8
import PackLean.D40.K.FarS043_9
import PackLean.D40.K.FarS043_10
import PackLean.D40.K.FarS043_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t133A : List Tok := t133A_0 ++ (t133A_1 ++ (t133A_2 ++ (t133A_3 ++ (t133A_4 ++ (t133A_5 ++ (t133A_6 ++ (t133A_7 ++ (t133A_8 ++ (t133A_9 ++ (t133A_10 ++ (t133A_11 ++ (t133A_12 ++ (t133A_13 ++ (t133A_14 ++ (t133A_15 ++ (t133A_16 ++ (t133A_17 ++ (t133A_18 ++ (t133A_19 ++ (t133A_20 ++ (t133A_21 ++ (t133A_22 ++ (t133A_23 ++ (t133A_24 ++ (t133A_25 ++ (t133A_26 ++ (t133A_27 ++ (t133A_28 ++ (t133A_29 ++ (t133A_30 ++ (t133A_31 ++ (t133A_32 ++ (t133A_33)))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t133B : List Tok := t133B_0 ++ (t133B_1 ++ (t133B_2 ++ (t133B_3 ++ (t133B_4 ++ (t133B_5 ++ (t133B_6 ++ (t133B_7 ++ (t133B_8 ++ (t133B_9 ++ (t133B_10 ++ (t133B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 133：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run133 : (nbRun P nb133 0 kN133 t133A).1 = true ∧ (nbRun P nb133 1 kN133 t133B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s133A_0) (wseg_append (wseg_of s133A_1) (wseg_append (wseg_of s133A_2) (wseg_append (wseg_of s133A_3) (wseg_append (wseg_of s133A_4) (wseg_append (wseg_of s133A_5) (wseg_append (wseg_of s133A_6) (wseg_append (wseg_of s133A_7) (wseg_append (wseg_of s133A_8) (wseg_append (wseg_of s133A_9) (wseg_append (wseg_of s133A_10) (wseg_append (wseg_of s133A_11) (wseg_append (wseg_of s133A_12) (wseg_append (wseg_of s133A_13) (wseg_append (wseg_of s133A_14) (wseg_append (wseg_of s133A_15) (wseg_append (wseg_of s133A_16) (wseg_append (wseg_of s133A_17) (wseg_append (wseg_of s133A_18) (wseg_append (wseg_of s133A_19) (wseg_append (wseg_of s133A_20) (wseg_append (wseg_of s133A_21) (wseg_append (wseg_of s133A_22) (wseg_append (wseg_of s133A_23) (wseg_append (wseg_of s133A_24) (wseg_append (wseg_of s133A_25) (wseg_append (wseg_of s133A_26) (wseg_append (wseg_of s133A_27) (wseg_append (wseg_of s133A_28) (wseg_append (wseg_of s133A_29) (wseg_append (wseg_of s133A_30) (wseg_append (wseg_of s133A_31) (wseg_append (wseg_of s133A_32) (wseg_of s133A_33)))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s133B_0) (wseg_append (wseg_of s133B_1) (wseg_append (wseg_of s133B_2) (wseg_append (wseg_of s133B_3) (wseg_append (wseg_of s133B_4) (wseg_append (wseg_of s133B_5) (wseg_append (wseg_of s133B_6) (wseg_append (wseg_of s133B_7) (wseg_append (wseg_of s133B_8) (wseg_append (wseg_of s133B_9) (wseg_append (wseg_of s133B_10) (wseg_of s133B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t134A : List Tok := t134A_0 ++ (t134A_1 ++ (t134A_2 ++ (t134A_3 ++ (t134A_4 ++ (t134A_5 ++ (t134A_6 ++ (t134A_7 ++ (t134A_8 ++ (t134A_9 ++ (t134A_10 ++ (t134A_11 ++ (t134A_12 ++ (t134A_13 ++ (t134A_14 ++ (t134A_15 ++ (t134A_16 ++ (t134A_17 ++ (t134A_18 ++ (t134A_19 ++ (t134A_20 ++ (t134A_21 ++ (t134A_22 ++ (t134A_23 ++ (t134A_24 ++ (t134A_25 ++ (t134A_26 ++ (t134A_27 ++ (t134A_28 ++ (t134A_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t134B : List Tok := t134B_0 ++ (t134B_1 ++ (t134B_2 ++ (t134B_3 ++ (t134B_4 ++ (t134B_5 ++ (t134B_6 ++ (t134B_7 ++ (t134B_8 ++ (t134B_9 ++ (t134B_10 ++ (t134B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 134：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run134 : (nbRun P nb134 0 kN134 t134A).1 = true ∧ (nbRun P nb134 1 kN134 t134B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s134A_0) (wseg_append (wseg_of s134A_1) (wseg_append (wseg_of s134A_2) (wseg_append (wseg_of s134A_3) (wseg_append (wseg_of s134A_4) (wseg_append (wseg_of s134A_5) (wseg_append (wseg_of s134A_6) (wseg_append (wseg_of s134A_7) (wseg_append (wseg_of s134A_8) (wseg_append (wseg_of s134A_9) (wseg_append (wseg_of s134A_10) (wseg_append (wseg_of s134A_11) (wseg_append (wseg_of s134A_12) (wseg_append (wseg_of s134A_13) (wseg_append (wseg_of s134A_14) (wseg_append (wseg_of s134A_15) (wseg_append (wseg_of s134A_16) (wseg_append (wseg_of s134A_17) (wseg_append (wseg_of s134A_18) (wseg_append (wseg_of s134A_19) (wseg_append (wseg_of s134A_20) (wseg_append (wseg_of s134A_21) (wseg_append (wseg_of s134A_22) (wseg_append (wseg_of s134A_23) (wseg_append (wseg_of s134A_24) (wseg_append (wseg_of s134A_25) (wseg_append (wseg_of s134A_26) (wseg_append (wseg_of s134A_27) (wseg_append (wseg_of s134A_28) (wseg_of s134A_29)))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s134B_0) (wseg_append (wseg_of s134B_1) (wseg_append (wseg_of s134B_2) (wseg_append (wseg_of s134B_3) (wseg_append (wseg_of s134B_4) (wseg_append (wseg_of s134B_5) (wseg_append (wseg_of s134B_6) (wseg_append (wseg_of s134B_7) (wseg_append (wseg_of s134B_8) (wseg_append (wseg_of s134B_9) (wseg_append (wseg_of s134B_10) (wseg_of s134B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t135A : List Tok := t135A_0 ++ (t135A_1 ++ (t135A_2 ++ (t135A_3 ++ (t135A_4 ++ (t135A_5 ++ (t135A_6 ++ (t135A_7 ++ (t135A_8 ++ (t135A_9 ++ (t135A_10 ++ (t135A_11 ++ (t135A_12 ++ (t135A_13 ++ (t135A_14 ++ (t135A_15 ++ (t135A_16 ++ (t135A_17 ++ (t135A_18 ++ (t135A_19 ++ (t135A_20 ++ (t135A_21 ++ (t135A_22 ++ (t135A_23 ++ (t135A_24 ++ (t135A_25 ++ (t135A_26 ++ (t135A_27 ++ (t135A_28 ++ (t135A_29 ++ (t135A_30 ++ (t135A_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t135B : List Tok := t135B_0 ++ (t135B_1 ++ (t135B_2 ++ (t135B_3 ++ (t135B_4 ++ (t135B_5 ++ (t135B_6 ++ (t135B_7 ++ (t135B_8 ++ (t135B_9 ++ (t135B_10 ++ (t135B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 135：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run135 : (nbRun P nb135 0 kN135 t135A).1 = true ∧ (nbRun P nb135 1 kN135 t135B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s135A_0) (wseg_append (wseg_of s135A_1) (wseg_append (wseg_of s135A_2) (wseg_append (wseg_of s135A_3) (wseg_append (wseg_of s135A_4) (wseg_append (wseg_of s135A_5) (wseg_append (wseg_of s135A_6) (wseg_append (wseg_of s135A_7) (wseg_append (wseg_of s135A_8) (wseg_append (wseg_of s135A_9) (wseg_append (wseg_of s135A_10) (wseg_append (wseg_of s135A_11) (wseg_append (wseg_of s135A_12) (wseg_append (wseg_of s135A_13) (wseg_append (wseg_of s135A_14) (wseg_append (wseg_of s135A_15) (wseg_append (wseg_of s135A_16) (wseg_append (wseg_of s135A_17) (wseg_append (wseg_of s135A_18) (wseg_append (wseg_of s135A_19) (wseg_append (wseg_of s135A_20) (wseg_append (wseg_of s135A_21) (wseg_append (wseg_of s135A_22) (wseg_append (wseg_of s135A_23) (wseg_append (wseg_of s135A_24) (wseg_append (wseg_of s135A_25) (wseg_append (wseg_of s135A_26) (wseg_append (wseg_of s135A_27) (wseg_append (wseg_of s135A_28) (wseg_append (wseg_of s135A_29) (wseg_append (wseg_of s135A_30) (wseg_of s135A_31)))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s135B_0) (wseg_append (wseg_of s135B_1) (wseg_append (wseg_of s135B_2) (wseg_append (wseg_of s135B_3) (wseg_append (wseg_of s135B_4) (wseg_append (wseg_of s135B_5) (wseg_append (wseg_of s135B_6) (wseg_append (wseg_of s135B_7) (wseg_append (wseg_of s135B_8) (wseg_append (wseg_of s135B_9) (wseg_append (wseg_of s135B_10) (wseg_of s135B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t136A : List Tok := t136A_0 ++ (t136A_1 ++ (t136A_2 ++ (t136A_3 ++ (t136A_4 ++ (t136A_5 ++ (t136A_6 ++ (t136A_7 ++ (t136A_8 ++ (t136A_9 ++ (t136A_10 ++ (t136A_11 ++ (t136A_12 ++ (t136A_13 ++ (t136A_14 ++ (t136A_15 ++ (t136A_16 ++ (t136A_17 ++ (t136A_18 ++ (t136A_19 ++ (t136A_20 ++ (t136A_21 ++ (t136A_22 ++ (t136A_23 ++ (t136A_24 ++ (t136A_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t136B : List Tok := t136B_0 ++ (t136B_1 ++ (t136B_2 ++ (t136B_3 ++ (t136B_4 ++ (t136B_5 ++ (t136B_6 ++ (t136B_7 ++ (t136B_8 ++ (t136B_9 ++ (t136B_10 ++ (t136B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 136：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run136 : (nbRun P nb136 0 kN136 t136A).1 = true ∧ (nbRun P nb136 1 kN136 t136B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s136A_0) (wseg_append (wseg_of s136A_1) (wseg_append (wseg_of s136A_2) (wseg_append (wseg_of s136A_3) (wseg_append (wseg_of s136A_4) (wseg_append (wseg_of s136A_5) (wseg_append (wseg_of s136A_6) (wseg_append (wseg_of s136A_7) (wseg_append (wseg_of s136A_8) (wseg_append (wseg_of s136A_9) (wseg_append (wseg_of s136A_10) (wseg_append (wseg_of s136A_11) (wseg_append (wseg_of s136A_12) (wseg_append (wseg_of s136A_13) (wseg_append (wseg_of s136A_14) (wseg_append (wseg_of s136A_15) (wseg_append (wseg_of s136A_16) (wseg_append (wseg_of s136A_17) (wseg_append (wseg_of s136A_18) (wseg_append (wseg_of s136A_19) (wseg_append (wseg_of s136A_20) (wseg_append (wseg_of s136A_21) (wseg_append (wseg_of s136A_22) (wseg_append (wseg_of s136A_23) (wseg_append (wseg_of s136A_24) (wseg_of s136A_25)))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s136B_0) (wseg_append (wseg_of s136B_1) (wseg_append (wseg_of s136B_2) (wseg_append (wseg_of s136B_3) (wseg_append (wseg_of s136B_4) (wseg_append (wseg_of s136B_5) (wseg_append (wseg_of s136B_6) (wseg_append (wseg_of s136B_7) (wseg_append (wseg_of s136B_8) (wseg_append (wseg_of s136B_9) (wseg_append (wseg_of s136B_10) (wseg_of s136B_11))))))))))))⟩

end PackLean.D40.Tet
