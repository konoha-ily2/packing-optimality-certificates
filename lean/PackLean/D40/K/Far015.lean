-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS015_0
import PackLean.D40.K.FarS015_1
import PackLean.D40.K.FarS015_2
import PackLean.D40.K.FarS015_3
import PackLean.D40.K.FarS015_4
import PackLean.D40.K.FarS015_5
import PackLean.D40.K.FarS015_6
import PackLean.D40.K.FarS015_7
import PackLean.D40.K.FarS015_8
import PackLean.D40.K.FarS015_9
import PackLean.D40.K.FarS015_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t043A : List Tok := t043A_0 ++ (t043A_1 ++ (t043A_2 ++ (t043A_3 ++ (t043A_4 ++ (t043A_5 ++ (t043A_6 ++ (t043A_7 ++ (t043A_8 ++ (t043A_9 ++ (t043A_10 ++ (t043A_11 ++ (t043A_12 ++ (t043A_13 ++ (t043A_14 ++ (t043A_15 ++ (t043A_16 ++ (t043A_17 ++ (t043A_18 ++ (t043A_19 ++ (t043A_20 ++ (t043A_21 ++ (t043A_22 ++ (t043A_23 ++ (t043A_24 ++ (t043A_25 ++ (t043A_26 ++ (t043A_27 ++ (t043A_28 ++ (t043A_29 ++ (t043A_30 ++ (t043A_31 ++ (t043A_32 ++ (t043A_33 ++ (t043A_34 ++ (t043A_35 ++ (t043A_36 ++ (t043A_37 ++ (t043A_38 ++ (t043A_39 ++ (t043A_40 ++ (t043A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t043B : List Tok := t043B_0 ++ (t043B_1 ++ (t043B_2 ++ (t043B_3 ++ (t043B_4 ++ (t043B_5 ++ (t043B_6 ++ (t043B_7 ++ (t043B_8 ++ (t043B_9 ++ (t043B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 043：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run043 : (nbRun P nb043 0 kN043 t043A).1 = true ∧ (nbRun P nb043 1 kN043 t043B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s043A_0) (wseg_append (wseg_of s043A_1) (wseg_append (wseg_of s043A_2) (wseg_append (wseg_of s043A_3) (wseg_append (wseg_of s043A_4) (wseg_append (wseg_of s043A_5) (wseg_append (wseg_of s043A_6) (wseg_append (wseg_of s043A_7) (wseg_append (wseg_of s043A_8) (wseg_append (wseg_of s043A_9) (wseg_append (wseg_of s043A_10) (wseg_append (wseg_of s043A_11) (wseg_append (wseg_of s043A_12) (wseg_append (wseg_of s043A_13) (wseg_append (wseg_of s043A_14) (wseg_append (wseg_of s043A_15) (wseg_append (wseg_of s043A_16) (wseg_append (wseg_of s043A_17) (wseg_append (wseg_of s043A_18) (wseg_append (wseg_of s043A_19) (wseg_append (wseg_of s043A_20) (wseg_append (wseg_of s043A_21) (wseg_append (wseg_of s043A_22) (wseg_append (wseg_of s043A_23) (wseg_append (wseg_of s043A_24) (wseg_append (wseg_of s043A_25) (wseg_append (wseg_of s043A_26) (wseg_append (wseg_of s043A_27) (wseg_append (wseg_of s043A_28) (wseg_append (wseg_of s043A_29) (wseg_append (wseg_of s043A_30) (wseg_append (wseg_of s043A_31) (wseg_append (wseg_of s043A_32) (wseg_append (wseg_of s043A_33) (wseg_append (wseg_of s043A_34) (wseg_append (wseg_of s043A_35) (wseg_append (wseg_of s043A_36) (wseg_append (wseg_of s043A_37) (wseg_append (wseg_of s043A_38) (wseg_append (wseg_of s043A_39) (wseg_append (wseg_of s043A_40) (wseg_of s043A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s043B_0) (wseg_append (wseg_of s043B_1) (wseg_append (wseg_of s043B_2) (wseg_append (wseg_of s043B_3) (wseg_append (wseg_of s043B_4) (wseg_append (wseg_of s043B_5) (wseg_append (wseg_of s043B_6) (wseg_append (wseg_of s043B_7) (wseg_append (wseg_of s043B_8) (wseg_append (wseg_of s043B_9) (wseg_of s043B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t044A : List Tok := t044A_0 ++ (t044A_1 ++ (t044A_2 ++ (t044A_3 ++ (t044A_4 ++ (t044A_5 ++ (t044A_6 ++ (t044A_7 ++ (t044A_8 ++ (t044A_9 ++ (t044A_10 ++ (t044A_11 ++ (t044A_12 ++ (t044A_13 ++ (t044A_14 ++ (t044A_15 ++ (t044A_16 ++ (t044A_17 ++ (t044A_18 ++ (t044A_19 ++ (t044A_20 ++ (t044A_21 ++ (t044A_22 ++ (t044A_23 ++ (t044A_24 ++ (t044A_25 ++ (t044A_26 ++ (t044A_27 ++ (t044A_28 ++ (t044A_29 ++ (t044A_30 ++ (t044A_31 ++ (t044A_32 ++ (t044A_33 ++ (t044A_34 ++ (t044A_35 ++ (t044A_36 ++ (t044A_37 ++ (t044A_38 ++ (t044A_39 ++ (t044A_40 ++ (t044A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t044B : List Tok := t044B_0 ++ (t044B_1 ++ (t044B_2 ++ (t044B_3 ++ (t044B_4 ++ (t044B_5 ++ (t044B_6 ++ (t044B_7 ++ (t044B_8 ++ (t044B_9 ++ (t044B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 044：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run044 : (nbRun P nb044 0 kN044 t044A).1 = true ∧ (nbRun P nb044 1 kN044 t044B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s044A_0) (wseg_append (wseg_of s044A_1) (wseg_append (wseg_of s044A_2) (wseg_append (wseg_of s044A_3) (wseg_append (wseg_of s044A_4) (wseg_append (wseg_of s044A_5) (wseg_append (wseg_of s044A_6) (wseg_append (wseg_of s044A_7) (wseg_append (wseg_of s044A_8) (wseg_append (wseg_of s044A_9) (wseg_append (wseg_of s044A_10) (wseg_append (wseg_of s044A_11) (wseg_append (wseg_of s044A_12) (wseg_append (wseg_of s044A_13) (wseg_append (wseg_of s044A_14) (wseg_append (wseg_of s044A_15) (wseg_append (wseg_of s044A_16) (wseg_append (wseg_of s044A_17) (wseg_append (wseg_of s044A_18) (wseg_append (wseg_of s044A_19) (wseg_append (wseg_of s044A_20) (wseg_append (wseg_of s044A_21) (wseg_append (wseg_of s044A_22) (wseg_append (wseg_of s044A_23) (wseg_append (wseg_of s044A_24) (wseg_append (wseg_of s044A_25) (wseg_append (wseg_of s044A_26) (wseg_append (wseg_of s044A_27) (wseg_append (wseg_of s044A_28) (wseg_append (wseg_of s044A_29) (wseg_append (wseg_of s044A_30) (wseg_append (wseg_of s044A_31) (wseg_append (wseg_of s044A_32) (wseg_append (wseg_of s044A_33) (wseg_append (wseg_of s044A_34) (wseg_append (wseg_of s044A_35) (wseg_append (wseg_of s044A_36) (wseg_append (wseg_of s044A_37) (wseg_append (wseg_of s044A_38) (wseg_append (wseg_of s044A_39) (wseg_append (wseg_of s044A_40) (wseg_of s044A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s044B_0) (wseg_append (wseg_of s044B_1) (wseg_append (wseg_of s044B_2) (wseg_append (wseg_of s044B_3) (wseg_append (wseg_of s044B_4) (wseg_append (wseg_of s044B_5) (wseg_append (wseg_of s044B_6) (wseg_append (wseg_of s044B_7) (wseg_append (wseg_of s044B_8) (wseg_append (wseg_of s044B_9) (wseg_of s044B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t045A : List Tok := t045A_0 ++ (t045A_1 ++ (t045A_2 ++ (t045A_3 ++ (t045A_4 ++ (t045A_5 ++ (t045A_6 ++ (t045A_7 ++ (t045A_8 ++ (t045A_9 ++ (t045A_10 ++ (t045A_11 ++ (t045A_12 ++ (t045A_13 ++ (t045A_14 ++ (t045A_15 ++ (t045A_16 ++ (t045A_17 ++ (t045A_18 ++ (t045A_19 ++ (t045A_20 ++ (t045A_21 ++ (t045A_22 ++ (t045A_23 ++ (t045A_24 ++ (t045A_25 ++ (t045A_26 ++ (t045A_27 ++ (t045A_28 ++ (t045A_29 ++ (t045A_30 ++ (t045A_31 ++ (t045A_32 ++ (t045A_33 ++ (t045A_34 ++ (t045A_35 ++ (t045A_36 ++ (t045A_37 ++ (t045A_38 ++ (t045A_39 ++ (t045A_40 ++ (t045A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t045B : List Tok := t045B_0 ++ (t045B_1 ++ (t045B_2 ++ (t045B_3 ++ (t045B_4 ++ (t045B_5 ++ (t045B_6 ++ (t045B_7 ++ (t045B_8 ++ (t045B_9 ++ (t045B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 045：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run045 : (nbRun P nb045 0 kN045 t045A).1 = true ∧ (nbRun P nb045 1 kN045 t045B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s045A_0) (wseg_append (wseg_of s045A_1) (wseg_append (wseg_of s045A_2) (wseg_append (wseg_of s045A_3) (wseg_append (wseg_of s045A_4) (wseg_append (wseg_of s045A_5) (wseg_append (wseg_of s045A_6) (wseg_append (wseg_of s045A_7) (wseg_append (wseg_of s045A_8) (wseg_append (wseg_of s045A_9) (wseg_append (wseg_of s045A_10) (wseg_append (wseg_of s045A_11) (wseg_append (wseg_of s045A_12) (wseg_append (wseg_of s045A_13) (wseg_append (wseg_of s045A_14) (wseg_append (wseg_of s045A_15) (wseg_append (wseg_of s045A_16) (wseg_append (wseg_of s045A_17) (wseg_append (wseg_of s045A_18) (wseg_append (wseg_of s045A_19) (wseg_append (wseg_of s045A_20) (wseg_append (wseg_of s045A_21) (wseg_append (wseg_of s045A_22) (wseg_append (wseg_of s045A_23) (wseg_append (wseg_of s045A_24) (wseg_append (wseg_of s045A_25) (wseg_append (wseg_of s045A_26) (wseg_append (wseg_of s045A_27) (wseg_append (wseg_of s045A_28) (wseg_append (wseg_of s045A_29) (wseg_append (wseg_of s045A_30) (wseg_append (wseg_of s045A_31) (wseg_append (wseg_of s045A_32) (wseg_append (wseg_of s045A_33) (wseg_append (wseg_of s045A_34) (wseg_append (wseg_of s045A_35) (wseg_append (wseg_of s045A_36) (wseg_append (wseg_of s045A_37) (wseg_append (wseg_of s045A_38) (wseg_append (wseg_of s045A_39) (wseg_append (wseg_of s045A_40) (wseg_of s045A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s045B_0) (wseg_append (wseg_of s045B_1) (wseg_append (wseg_of s045B_2) (wseg_append (wseg_of s045B_3) (wseg_append (wseg_of s045B_4) (wseg_append (wseg_of s045B_5) (wseg_append (wseg_of s045B_6) (wseg_append (wseg_of s045B_7) (wseg_append (wseg_of s045B_8) (wseg_append (wseg_of s045B_9) (wseg_of s045B_10)))))))))))⟩

end PackLean.D40.Tet
