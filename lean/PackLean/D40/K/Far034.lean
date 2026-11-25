-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS034_0
import PackLean.D40.K.FarS034_1
import PackLean.D40.K.FarS034_2
import PackLean.D40.K.FarS034_3
import PackLean.D40.K.FarS034_4
import PackLean.D40.K.FarS034_5
import PackLean.D40.K.FarS034_6
import PackLean.D40.K.FarS034_7
import PackLean.D40.K.FarS034_8
import PackLean.D40.K.FarS034_9
import PackLean.D40.K.FarS034_10
import PackLean.D40.K.FarS034_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t105A : List Tok := t105A_0 ++ (t105A_1 ++ (t105A_2 ++ (t105A_3 ++ (t105A_4 ++ (t105A_5 ++ (t105A_6 ++ (t105A_7 ++ (t105A_8 ++ (t105A_9 ++ (t105A_10 ++ (t105A_11 ++ (t105A_12 ++ (t105A_13 ++ (t105A_14 ++ (t105A_15 ++ (t105A_16 ++ (t105A_17 ++ (t105A_18 ++ (t105A_19 ++ (t105A_20 ++ (t105A_21 ++ (t105A_22 ++ (t105A_23 ++ (t105A_24 ++ (t105A_25 ++ (t105A_26 ++ (t105A_27 ++ (t105A_28 ++ (t105A_29 ++ (t105A_30 ++ (t105A_31 ++ (t105A_32 ++ (t105A_33 ++ (t105A_34 ++ (t105A_35 ++ (t105A_36 ++ (t105A_37 ++ (t105A_38 ++ (t105A_39 ++ (t105A_40 ++ (t105A_41 ++ (t105A_42 ++ (t105A_43 ++ (t105A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t105B : List Tok := t105B_0 ++ (t105B_1 ++ (t105B_2 ++ (t105B_3 ++ (t105B_4 ++ (t105B_5 ++ (t105B_6 ++ (t105B_7 ++ (t105B_8 ++ (t105B_9 ++ (t105B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 105：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run105 : (nbRun P nb105 0 kN105 t105A).1 = true ∧ (nbRun P nb105 1 kN105 t105B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s105A_0) (wseg_append (wseg_of s105A_1) (wseg_append (wseg_of s105A_2) (wseg_append (wseg_of s105A_3) (wseg_append (wseg_of s105A_4) (wseg_append (wseg_of s105A_5) (wseg_append (wseg_of s105A_6) (wseg_append (wseg_of s105A_7) (wseg_append (wseg_of s105A_8) (wseg_append (wseg_of s105A_9) (wseg_append (wseg_of s105A_10) (wseg_append (wseg_of s105A_11) (wseg_append (wseg_of s105A_12) (wseg_append (wseg_of s105A_13) (wseg_append (wseg_of s105A_14) (wseg_append (wseg_of s105A_15) (wseg_append (wseg_of s105A_16) (wseg_append (wseg_of s105A_17) (wseg_append (wseg_of s105A_18) (wseg_append (wseg_of s105A_19) (wseg_append (wseg_of s105A_20) (wseg_append (wseg_of s105A_21) (wseg_append (wseg_of s105A_22) (wseg_append (wseg_of s105A_23) (wseg_append (wseg_of s105A_24) (wseg_append (wseg_of s105A_25) (wseg_append (wseg_of s105A_26) (wseg_append (wseg_of s105A_27) (wseg_append (wseg_of s105A_28) (wseg_append (wseg_of s105A_29) (wseg_append (wseg_of s105A_30) (wseg_append (wseg_of s105A_31) (wseg_append (wseg_of s105A_32) (wseg_append (wseg_of s105A_33) (wseg_append (wseg_of s105A_34) (wseg_append (wseg_of s105A_35) (wseg_append (wseg_of s105A_36) (wseg_append (wseg_of s105A_37) (wseg_append (wseg_of s105A_38) (wseg_append (wseg_of s105A_39) (wseg_append (wseg_of s105A_40) (wseg_append (wseg_of s105A_41) (wseg_append (wseg_of s105A_42) (wseg_append (wseg_of s105A_43) (wseg_of s105A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s105B_0) (wseg_append (wseg_of s105B_1) (wseg_append (wseg_of s105B_2) (wseg_append (wseg_of s105B_3) (wseg_append (wseg_of s105B_4) (wseg_append (wseg_of s105B_5) (wseg_append (wseg_of s105B_6) (wseg_append (wseg_of s105B_7) (wseg_append (wseg_of s105B_8) (wseg_append (wseg_of s105B_9) (wseg_of s105B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t106A : List Tok := t106A_0 ++ (t106A_1 ++ (t106A_2 ++ (t106A_3 ++ (t106A_4 ++ (t106A_5 ++ (t106A_6 ++ (t106A_7 ++ (t106A_8 ++ (t106A_9 ++ (t106A_10 ++ (t106A_11 ++ (t106A_12 ++ (t106A_13 ++ (t106A_14 ++ (t106A_15 ++ (t106A_16 ++ (t106A_17 ++ (t106A_18 ++ (t106A_19 ++ (t106A_20 ++ (t106A_21 ++ (t106A_22 ++ (t106A_23 ++ (t106A_24 ++ (t106A_25 ++ (t106A_26 ++ (t106A_27 ++ (t106A_28 ++ (t106A_29 ++ (t106A_30 ++ (t106A_31 ++ (t106A_32 ++ (t106A_33 ++ (t106A_34 ++ (t106A_35 ++ (t106A_36 ++ (t106A_37 ++ (t106A_38 ++ (t106A_39 ++ (t106A_40 ++ (t106A_41 ++ (t106A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t106B : List Tok := t106B_0 ++ (t106B_1 ++ (t106B_2 ++ (t106B_3 ++ (t106B_4 ++ (t106B_5 ++ (t106B_6 ++ (t106B_7 ++ (t106B_8 ++ (t106B_9 ++ (t106B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 106：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run106 : (nbRun P nb106 0 kN106 t106A).1 = true ∧ (nbRun P nb106 1 kN106 t106B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s106A_0) (wseg_append (wseg_of s106A_1) (wseg_append (wseg_of s106A_2) (wseg_append (wseg_of s106A_3) (wseg_append (wseg_of s106A_4) (wseg_append (wseg_of s106A_5) (wseg_append (wseg_of s106A_6) (wseg_append (wseg_of s106A_7) (wseg_append (wseg_of s106A_8) (wseg_append (wseg_of s106A_9) (wseg_append (wseg_of s106A_10) (wseg_append (wseg_of s106A_11) (wseg_append (wseg_of s106A_12) (wseg_append (wseg_of s106A_13) (wseg_append (wseg_of s106A_14) (wseg_append (wseg_of s106A_15) (wseg_append (wseg_of s106A_16) (wseg_append (wseg_of s106A_17) (wseg_append (wseg_of s106A_18) (wseg_append (wseg_of s106A_19) (wseg_append (wseg_of s106A_20) (wseg_append (wseg_of s106A_21) (wseg_append (wseg_of s106A_22) (wseg_append (wseg_of s106A_23) (wseg_append (wseg_of s106A_24) (wseg_append (wseg_of s106A_25) (wseg_append (wseg_of s106A_26) (wseg_append (wseg_of s106A_27) (wseg_append (wseg_of s106A_28) (wseg_append (wseg_of s106A_29) (wseg_append (wseg_of s106A_30) (wseg_append (wseg_of s106A_31) (wseg_append (wseg_of s106A_32) (wseg_append (wseg_of s106A_33) (wseg_append (wseg_of s106A_34) (wseg_append (wseg_of s106A_35) (wseg_append (wseg_of s106A_36) (wseg_append (wseg_of s106A_37) (wseg_append (wseg_of s106A_38) (wseg_append (wseg_of s106A_39) (wseg_append (wseg_of s106A_40) (wseg_append (wseg_of s106A_41) (wseg_of s106A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s106B_0) (wseg_append (wseg_of s106B_1) (wseg_append (wseg_of s106B_2) (wseg_append (wseg_of s106B_3) (wseg_append (wseg_of s106B_4) (wseg_append (wseg_of s106B_5) (wseg_append (wseg_of s106B_6) (wseg_append (wseg_of s106B_7) (wseg_append (wseg_of s106B_8) (wseg_append (wseg_of s106B_9) (wseg_of s106B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t107A : List Tok := t107A_0 ++ (t107A_1 ++ (t107A_2 ++ (t107A_3 ++ (t107A_4 ++ (t107A_5 ++ (t107A_6 ++ (t107A_7 ++ (t107A_8 ++ (t107A_9 ++ (t107A_10 ++ (t107A_11 ++ (t107A_12 ++ (t107A_13 ++ (t107A_14 ++ (t107A_15 ++ (t107A_16 ++ (t107A_17 ++ (t107A_18 ++ (t107A_19 ++ (t107A_20 ++ (t107A_21 ++ (t107A_22 ++ (t107A_23 ++ (t107A_24 ++ (t107A_25 ++ (t107A_26 ++ (t107A_27 ++ (t107A_28 ++ (t107A_29 ++ (t107A_30 ++ (t107A_31 ++ (t107A_32 ++ (t107A_33 ++ (t107A_34 ++ (t107A_35 ++ (t107A_36 ++ (t107A_37 ++ (t107A_38 ++ (t107A_39 ++ (t107A_40 ++ (t107A_41 ++ (t107A_42 ++ (t107A_43 ++ (t107A_44 ++ (t107A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t107B : List Tok := t107B_0 ++ (t107B_1 ++ (t107B_2 ++ (t107B_3 ++ (t107B_4 ++ (t107B_5 ++ (t107B_6 ++ (t107B_7 ++ (t107B_8 ++ (t107B_9 ++ (t107B_10 ++ (t107B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 107：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run107 : (nbRun P nb107 0 kN107 t107A).1 = true ∧ (nbRun P nb107 1 kN107 t107B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s107A_0) (wseg_append (wseg_of s107A_1) (wseg_append (wseg_of s107A_2) (wseg_append (wseg_of s107A_3) (wseg_append (wseg_of s107A_4) (wseg_append (wseg_of s107A_5) (wseg_append (wseg_of s107A_6) (wseg_append (wseg_of s107A_7) (wseg_append (wseg_of s107A_8) (wseg_append (wseg_of s107A_9) (wseg_append (wseg_of s107A_10) (wseg_append (wseg_of s107A_11) (wseg_append (wseg_of s107A_12) (wseg_append (wseg_of s107A_13) (wseg_append (wseg_of s107A_14) (wseg_append (wseg_of s107A_15) (wseg_append (wseg_of s107A_16) (wseg_append (wseg_of s107A_17) (wseg_append (wseg_of s107A_18) (wseg_append (wseg_of s107A_19) (wseg_append (wseg_of s107A_20) (wseg_append (wseg_of s107A_21) (wseg_append (wseg_of s107A_22) (wseg_append (wseg_of s107A_23) (wseg_append (wseg_of s107A_24) (wseg_append (wseg_of s107A_25) (wseg_append (wseg_of s107A_26) (wseg_append (wseg_of s107A_27) (wseg_append (wseg_of s107A_28) (wseg_append (wseg_of s107A_29) (wseg_append (wseg_of s107A_30) (wseg_append (wseg_of s107A_31) (wseg_append (wseg_of s107A_32) (wseg_append (wseg_of s107A_33) (wseg_append (wseg_of s107A_34) (wseg_append (wseg_of s107A_35) (wseg_append (wseg_of s107A_36) (wseg_append (wseg_of s107A_37) (wseg_append (wseg_of s107A_38) (wseg_append (wseg_of s107A_39) (wseg_append (wseg_of s107A_40) (wseg_append (wseg_of s107A_41) (wseg_append (wseg_of s107A_42) (wseg_append (wseg_of s107A_43) (wseg_append (wseg_of s107A_44) (wseg_of s107A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s107B_0) (wseg_append (wseg_of s107B_1) (wseg_append (wseg_of s107B_2) (wseg_append (wseg_of s107B_3) (wseg_append (wseg_of s107B_4) (wseg_append (wseg_of s107B_5) (wseg_append (wseg_of s107B_6) (wseg_append (wseg_of s107B_7) (wseg_append (wseg_of s107B_8) (wseg_append (wseg_of s107B_9) (wseg_append (wseg_of s107B_10) (wseg_of s107B_11))))))))))))⟩

end PackLean.D40.Tet
