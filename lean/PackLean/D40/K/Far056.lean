-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS056_0
import PackLean.D40.K.FarS056_1
import PackLean.D40.K.FarS056_2
import PackLean.D40.K.FarS056_3
import PackLean.D40.K.FarS056_4
import PackLean.D40.K.FarS056_5
import PackLean.D40.K.FarS056_6
import PackLean.D40.K.FarS056_7
import PackLean.D40.K.FarS056_8
import PackLean.D40.K.FarS056_9
import PackLean.D40.K.FarS056_10
import PackLean.D40.K.FarS056_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t196A : List Tok := t196A_0 ++ (t196A_1 ++ (t196A_2 ++ (t196A_3 ++ (t196A_4 ++ (t196A_5 ++ (t196A_6 ++ (t196A_7 ++ (t196A_8 ++ (t196A_9 ++ (t196A_10 ++ (t196A_11 ++ (t196A_12 ++ (t196A_13 ++ (t196A_14 ++ (t196A_15 ++ (t196A_16 ++ (t196A_17 ++ (t196A_18 ++ (t196A_19 ++ (t196A_20 ++ (t196A_21 ++ (t196A_22 ++ (t196A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t196B : List Tok := t196B_0 ++ (t196B_1 ++ (t196B_2 ++ (t196B_3 ++ (t196B_4 ++ (t196B_5 ++ (t196B_6 ++ (t196B_7 ++ (t196B_8 ++ (t196B_9 ++ (t196B_10 ++ (t196B_11 ++ (t196B_12 ++ (t196B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 196：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run196 : (nbRun P nb196 0 kN196 t196A).1 = true ∧ (nbRun P nb196 1 kN196 t196B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s196A_0) (wseg_append (wseg_of s196A_1) (wseg_append (wseg_of s196A_2) (wseg_append (wseg_of s196A_3) (wseg_append (wseg_of s196A_4) (wseg_append (wseg_of s196A_5) (wseg_append (wseg_of s196A_6) (wseg_append (wseg_of s196A_7) (wseg_append (wseg_of s196A_8) (wseg_append (wseg_of s196A_9) (wseg_append (wseg_of s196A_10) (wseg_append (wseg_of s196A_11) (wseg_append (wseg_of s196A_12) (wseg_append (wseg_of s196A_13) (wseg_append (wseg_of s196A_14) (wseg_append (wseg_of s196A_15) (wseg_append (wseg_of s196A_16) (wseg_append (wseg_of s196A_17) (wseg_append (wseg_of s196A_18) (wseg_append (wseg_of s196A_19) (wseg_append (wseg_of s196A_20) (wseg_append (wseg_of s196A_21) (wseg_append (wseg_of s196A_22) (wseg_of s196A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s196B_0) (wseg_append (wseg_of s196B_1) (wseg_append (wseg_of s196B_2) (wseg_append (wseg_of s196B_3) (wseg_append (wseg_of s196B_4) (wseg_append (wseg_of s196B_5) (wseg_append (wseg_of s196B_6) (wseg_append (wseg_of s196B_7) (wseg_append (wseg_of s196B_8) (wseg_append (wseg_of s196B_9) (wseg_append (wseg_of s196B_10) (wseg_append (wseg_of s196B_11) (wseg_append (wseg_of s196B_12) (wseg_of s196B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t197A : List Tok := t197A_0 ++ (t197A_1 ++ (t197A_2 ++ (t197A_3 ++ (t197A_4 ++ (t197A_5 ++ (t197A_6 ++ (t197A_7 ++ (t197A_8 ++ (t197A_9 ++ (t197A_10 ++ (t197A_11 ++ (t197A_12 ++ (t197A_13 ++ (t197A_14 ++ (t197A_15 ++ (t197A_16 ++ (t197A_17 ++ (t197A_18 ++ (t197A_19 ++ (t197A_20 ++ (t197A_21 ++ (t197A_22 ++ (t197A_23 ++ (t197A_24 ++ (t197A_25 ++ (t197A_26 ++ (t197A_27 ++ (t197A_28 ++ (t197A_29 ++ (t197A_30 ++ (t197A_31 ++ (t197A_32 ++ (t197A_33 ++ (t197A_34 ++ (t197A_35)))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t197B : List Tok := t197B_0 ++ (t197B_1 ++ (t197B_2 ++ (t197B_3 ++ (t197B_4 ++ (t197B_5 ++ (t197B_6 ++ (t197B_7 ++ (t197B_8 ++ (t197B_9 ++ (t197B_10 ++ (t197B_11 ++ (t197B_12 ++ (t197B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 197：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run197 : (nbRun P nb197 0 kN197 t197A).1 = true ∧ (nbRun P nb197 1 kN197 t197B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s197A_0) (wseg_append (wseg_of s197A_1) (wseg_append (wseg_of s197A_2) (wseg_append (wseg_of s197A_3) (wseg_append (wseg_of s197A_4) (wseg_append (wseg_of s197A_5) (wseg_append (wseg_of s197A_6) (wseg_append (wseg_of s197A_7) (wseg_append (wseg_of s197A_8) (wseg_append (wseg_of s197A_9) (wseg_append (wseg_of s197A_10) (wseg_append (wseg_of s197A_11) (wseg_append (wseg_of s197A_12) (wseg_append (wseg_of s197A_13) (wseg_append (wseg_of s197A_14) (wseg_append (wseg_of s197A_15) (wseg_append (wseg_of s197A_16) (wseg_append (wseg_of s197A_17) (wseg_append (wseg_of s197A_18) (wseg_append (wseg_of s197A_19) (wseg_append (wseg_of s197A_20) (wseg_append (wseg_of s197A_21) (wseg_append (wseg_of s197A_22) (wseg_append (wseg_of s197A_23) (wseg_append (wseg_of s197A_24) (wseg_append (wseg_of s197A_25) (wseg_append (wseg_of s197A_26) (wseg_append (wseg_of s197A_27) (wseg_append (wseg_of s197A_28) (wseg_append (wseg_of s197A_29) (wseg_append (wseg_of s197A_30) (wseg_append (wseg_of s197A_31) (wseg_append (wseg_of s197A_32) (wseg_append (wseg_of s197A_33) (wseg_append (wseg_of s197A_34) (wseg_of s197A_35)))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s197B_0) (wseg_append (wseg_of s197B_1) (wseg_append (wseg_of s197B_2) (wseg_append (wseg_of s197B_3) (wseg_append (wseg_of s197B_4) (wseg_append (wseg_of s197B_5) (wseg_append (wseg_of s197B_6) (wseg_append (wseg_of s197B_7) (wseg_append (wseg_of s197B_8) (wseg_append (wseg_of s197B_9) (wseg_append (wseg_of s197B_10) (wseg_append (wseg_of s197B_11) (wseg_append (wseg_of s197B_12) (wseg_of s197B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t198A : List Tok := t198A_0 ++ (t198A_1 ++ (t198A_2 ++ (t198A_3 ++ (t198A_4 ++ (t198A_5 ++ (t198A_6 ++ (t198A_7 ++ (t198A_8 ++ (t198A_9 ++ (t198A_10 ++ (t198A_11 ++ (t198A_12 ++ (t198A_13 ++ (t198A_14 ++ (t198A_15 ++ (t198A_16 ++ (t198A_17 ++ (t198A_18 ++ (t198A_19 ++ (t198A_20 ++ (t198A_21 ++ (t198A_22 ++ (t198A_23 ++ (t198A_24 ++ (t198A_25 ++ (t198A_26 ++ (t198A_27 ++ (t198A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t198B : List Tok := t198B_0 ++ (t198B_1 ++ (t198B_2 ++ (t198B_3 ++ (t198B_4 ++ (t198B_5 ++ (t198B_6 ++ (t198B_7 ++ (t198B_8 ++ (t198B_9 ++ (t198B_10 ++ (t198B_11 ++ (t198B_12 ++ (t198B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 198：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run198 : (nbRun P nb198 0 kN198 t198A).1 = true ∧ (nbRun P nb198 1 kN198 t198B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s198A_0) (wseg_append (wseg_of s198A_1) (wseg_append (wseg_of s198A_2) (wseg_append (wseg_of s198A_3) (wseg_append (wseg_of s198A_4) (wseg_append (wseg_of s198A_5) (wseg_append (wseg_of s198A_6) (wseg_append (wseg_of s198A_7) (wseg_append (wseg_of s198A_8) (wseg_append (wseg_of s198A_9) (wseg_append (wseg_of s198A_10) (wseg_append (wseg_of s198A_11) (wseg_append (wseg_of s198A_12) (wseg_append (wseg_of s198A_13) (wseg_append (wseg_of s198A_14) (wseg_append (wseg_of s198A_15) (wseg_append (wseg_of s198A_16) (wseg_append (wseg_of s198A_17) (wseg_append (wseg_of s198A_18) (wseg_append (wseg_of s198A_19) (wseg_append (wseg_of s198A_20) (wseg_append (wseg_of s198A_21) (wseg_append (wseg_of s198A_22) (wseg_append (wseg_of s198A_23) (wseg_append (wseg_of s198A_24) (wseg_append (wseg_of s198A_25) (wseg_append (wseg_of s198A_26) (wseg_append (wseg_of s198A_27) (wseg_of s198A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s198B_0) (wseg_append (wseg_of s198B_1) (wseg_append (wseg_of s198B_2) (wseg_append (wseg_of s198B_3) (wseg_append (wseg_of s198B_4) (wseg_append (wseg_of s198B_5) (wseg_append (wseg_of s198B_6) (wseg_append (wseg_of s198B_7) (wseg_append (wseg_of s198B_8) (wseg_append (wseg_of s198B_9) (wseg_append (wseg_of s198B_10) (wseg_append (wseg_of s198B_11) (wseg_append (wseg_of s198B_12) (wseg_of s198B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t199A : List Tok := t199A_0 ++ (t199A_1 ++ (t199A_2 ++ (t199A_3 ++ (t199A_4 ++ (t199A_5 ++ (t199A_6 ++ (t199A_7 ++ (t199A_8 ++ (t199A_9 ++ (t199A_10 ++ (t199A_11 ++ (t199A_12 ++ (t199A_13 ++ (t199A_14 ++ (t199A_15 ++ (t199A_16 ++ (t199A_17 ++ (t199A_18 ++ (t199A_19 ++ (t199A_20 ++ (t199A_21 ++ (t199A_22 ++ (t199A_23 ++ (t199A_24 ++ (t199A_25 ++ (t199A_26 ++ (t199A_27 ++ (t199A_28 ++ (t199A_29 ++ (t199A_30 ++ (t199A_31 ++ (t199A_32))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t199B : List Tok := t199B_0 ++ (t199B_1 ++ (t199B_2 ++ (t199B_3 ++ (t199B_4 ++ (t199B_5 ++ (t199B_6 ++ (t199B_7 ++ (t199B_8 ++ (t199B_9 ++ (t199B_10 ++ (t199B_11 ++ (t199B_12 ++ (t199B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 199：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run199 : (nbRun P nb199 0 kN199 t199A).1 = true ∧ (nbRun P nb199 1 kN199 t199B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s199A_0) (wseg_append (wseg_of s199A_1) (wseg_append (wseg_of s199A_2) (wseg_append (wseg_of s199A_3) (wseg_append (wseg_of s199A_4) (wseg_append (wseg_of s199A_5) (wseg_append (wseg_of s199A_6) (wseg_append (wseg_of s199A_7) (wseg_append (wseg_of s199A_8) (wseg_append (wseg_of s199A_9) (wseg_append (wseg_of s199A_10) (wseg_append (wseg_of s199A_11) (wseg_append (wseg_of s199A_12) (wseg_append (wseg_of s199A_13) (wseg_append (wseg_of s199A_14) (wseg_append (wseg_of s199A_15) (wseg_append (wseg_of s199A_16) (wseg_append (wseg_of s199A_17) (wseg_append (wseg_of s199A_18) (wseg_append (wseg_of s199A_19) (wseg_append (wseg_of s199A_20) (wseg_append (wseg_of s199A_21) (wseg_append (wseg_of s199A_22) (wseg_append (wseg_of s199A_23) (wseg_append (wseg_of s199A_24) (wseg_append (wseg_of s199A_25) (wseg_append (wseg_of s199A_26) (wseg_append (wseg_of s199A_27) (wseg_append (wseg_of s199A_28) (wseg_append (wseg_of s199A_29) (wseg_append (wseg_of s199A_30) (wseg_append (wseg_of s199A_31) (wseg_of s199A_32))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s199B_0) (wseg_append (wseg_of s199B_1) (wseg_append (wseg_of s199B_2) (wseg_append (wseg_of s199B_3) (wseg_append (wseg_of s199B_4) (wseg_append (wseg_of s199B_5) (wseg_append (wseg_of s199B_6) (wseg_append (wseg_of s199B_7) (wseg_append (wseg_of s199B_8) (wseg_append (wseg_of s199B_9) (wseg_append (wseg_of s199B_10) (wseg_append (wseg_of s199B_11) (wseg_append (wseg_of s199B_12) (wseg_of s199B_13))))))))))))))⟩

end PackLean.D40.Tet
