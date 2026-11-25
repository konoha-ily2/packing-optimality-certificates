-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS023_0
import PackLean.D40.K.FarS023_1
import PackLean.D40.K.FarS023_2
import PackLean.D40.K.FarS023_3
import PackLean.D40.K.FarS023_4
import PackLean.D40.K.FarS023_5
import PackLean.D40.K.FarS023_6
import PackLean.D40.K.FarS023_7
import PackLean.D40.K.FarS023_8
import PackLean.D40.K.FarS023_9
import PackLean.D40.K.FarS023_10
import PackLean.D40.K.FarS023_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t072A : List Tok := t072A_0 ++ (t072A_1 ++ (t072A_2 ++ (t072A_3 ++ (t072A_4 ++ (t072A_5 ++ (t072A_6 ++ (t072A_7 ++ (t072A_8 ++ (t072A_9 ++ (t072A_10 ++ (t072A_11 ++ (t072A_12 ++ (t072A_13 ++ (t072A_14 ++ (t072A_15 ++ (t072A_16 ++ (t072A_17 ++ (t072A_18 ++ (t072A_19 ++ (t072A_20 ++ (t072A_21 ++ (t072A_22 ++ (t072A_23 ++ (t072A_24 ++ (t072A_25 ++ (t072A_26 ++ (t072A_27 ++ (t072A_28 ++ (t072A_29 ++ (t072A_30 ++ (t072A_31 ++ (t072A_32 ++ (t072A_33 ++ (t072A_34 ++ (t072A_35 ++ (t072A_36 ++ (t072A_37 ++ (t072A_38 ++ (t072A_39 ++ (t072A_40 ++ (t072A_41 ++ (t072A_42 ++ (t072A_43 ++ (t072A_44 ++ (t072A_45 ++ (t072A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t072B : List Tok := t072B_0 ++ (t072B_1 ++ (t072B_2 ++ (t072B_3 ++ (t072B_4 ++ (t072B_5 ++ (t072B_6 ++ (t072B_7 ++ (t072B_8 ++ (t072B_9 ++ (t072B_10 ++ (t072B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 072：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run072 : (nbRun P nb072 0 kN072 t072A).1 = true ∧ (nbRun P nb072 1 kN072 t072B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s072A_0) (wseg_append (wseg_of s072A_1) (wseg_append (wseg_of s072A_2) (wseg_append (wseg_of s072A_3) (wseg_append (wseg_of s072A_4) (wseg_append (wseg_of s072A_5) (wseg_append (wseg_of s072A_6) (wseg_append (wseg_of s072A_7) (wseg_append (wseg_of s072A_8) (wseg_append (wseg_of s072A_9) (wseg_append (wseg_of s072A_10) (wseg_append (wseg_of s072A_11) (wseg_append (wseg_of s072A_12) (wseg_append (wseg_of s072A_13) (wseg_append (wseg_of s072A_14) (wseg_append (wseg_of s072A_15) (wseg_append (wseg_of s072A_16) (wseg_append (wseg_of s072A_17) (wseg_append (wseg_of s072A_18) (wseg_append (wseg_of s072A_19) (wseg_append (wseg_of s072A_20) (wseg_append (wseg_of s072A_21) (wseg_append (wseg_of s072A_22) (wseg_append (wseg_of s072A_23) (wseg_append (wseg_of s072A_24) (wseg_append (wseg_of s072A_25) (wseg_append (wseg_of s072A_26) (wseg_append (wseg_of s072A_27) (wseg_append (wseg_of s072A_28) (wseg_append (wseg_of s072A_29) (wseg_append (wseg_of s072A_30) (wseg_append (wseg_of s072A_31) (wseg_append (wseg_of s072A_32) (wseg_append (wseg_of s072A_33) (wseg_append (wseg_of s072A_34) (wseg_append (wseg_of s072A_35) (wseg_append (wseg_of s072A_36) (wseg_append (wseg_of s072A_37) (wseg_append (wseg_of s072A_38) (wseg_append (wseg_of s072A_39) (wseg_append (wseg_of s072A_40) (wseg_append (wseg_of s072A_41) (wseg_append (wseg_of s072A_42) (wseg_append (wseg_of s072A_43) (wseg_append (wseg_of s072A_44) (wseg_append (wseg_of s072A_45) (wseg_of s072A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s072B_0) (wseg_append (wseg_of s072B_1) (wseg_append (wseg_of s072B_2) (wseg_append (wseg_of s072B_3) (wseg_append (wseg_of s072B_4) (wseg_append (wseg_of s072B_5) (wseg_append (wseg_of s072B_6) (wseg_append (wseg_of s072B_7) (wseg_append (wseg_of s072B_8) (wseg_append (wseg_of s072B_9) (wseg_append (wseg_of s072B_10) (wseg_of s072B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t073A : List Tok := t073A_0 ++ (t073A_1 ++ (t073A_2 ++ (t073A_3 ++ (t073A_4 ++ (t073A_5 ++ (t073A_6 ++ (t073A_7 ++ (t073A_8 ++ (t073A_9 ++ (t073A_10 ++ (t073A_11 ++ (t073A_12 ++ (t073A_13 ++ (t073A_14 ++ (t073A_15 ++ (t073A_16 ++ (t073A_17 ++ (t073A_18 ++ (t073A_19 ++ (t073A_20 ++ (t073A_21 ++ (t073A_22 ++ (t073A_23 ++ (t073A_24 ++ (t073A_25 ++ (t073A_26 ++ (t073A_27 ++ (t073A_28 ++ (t073A_29 ++ (t073A_30 ++ (t073A_31 ++ (t073A_32 ++ (t073A_33 ++ (t073A_34 ++ (t073A_35 ++ (t073A_36 ++ (t073A_37 ++ (t073A_38 ++ (t073A_39 ++ (t073A_40 ++ (t073A_41 ++ (t073A_42 ++ (t073A_43 ++ (t073A_44 ++ (t073A_45 ++ (t073A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t073B : List Tok := t073B_0 ++ (t073B_1 ++ (t073B_2 ++ (t073B_3 ++ (t073B_4 ++ (t073B_5 ++ (t073B_6 ++ (t073B_7 ++ (t073B_8 ++ (t073B_9 ++ (t073B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 073：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run073 : (nbRun P nb073 0 kN073 t073A).1 = true ∧ (nbRun P nb073 1 kN073 t073B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s073A_0) (wseg_append (wseg_of s073A_1) (wseg_append (wseg_of s073A_2) (wseg_append (wseg_of s073A_3) (wseg_append (wseg_of s073A_4) (wseg_append (wseg_of s073A_5) (wseg_append (wseg_of s073A_6) (wseg_append (wseg_of s073A_7) (wseg_append (wseg_of s073A_8) (wseg_append (wseg_of s073A_9) (wseg_append (wseg_of s073A_10) (wseg_append (wseg_of s073A_11) (wseg_append (wseg_of s073A_12) (wseg_append (wseg_of s073A_13) (wseg_append (wseg_of s073A_14) (wseg_append (wseg_of s073A_15) (wseg_append (wseg_of s073A_16) (wseg_append (wseg_of s073A_17) (wseg_append (wseg_of s073A_18) (wseg_append (wseg_of s073A_19) (wseg_append (wseg_of s073A_20) (wseg_append (wseg_of s073A_21) (wseg_append (wseg_of s073A_22) (wseg_append (wseg_of s073A_23) (wseg_append (wseg_of s073A_24) (wseg_append (wseg_of s073A_25) (wseg_append (wseg_of s073A_26) (wseg_append (wseg_of s073A_27) (wseg_append (wseg_of s073A_28) (wseg_append (wseg_of s073A_29) (wseg_append (wseg_of s073A_30) (wseg_append (wseg_of s073A_31) (wseg_append (wseg_of s073A_32) (wseg_append (wseg_of s073A_33) (wseg_append (wseg_of s073A_34) (wseg_append (wseg_of s073A_35) (wseg_append (wseg_of s073A_36) (wseg_append (wseg_of s073A_37) (wseg_append (wseg_of s073A_38) (wseg_append (wseg_of s073A_39) (wseg_append (wseg_of s073A_40) (wseg_append (wseg_of s073A_41) (wseg_append (wseg_of s073A_42) (wseg_append (wseg_of s073A_43) (wseg_append (wseg_of s073A_44) (wseg_append (wseg_of s073A_45) (wseg_of s073A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s073B_0) (wseg_append (wseg_of s073B_1) (wseg_append (wseg_of s073B_2) (wseg_append (wseg_of s073B_3) (wseg_append (wseg_of s073B_4) (wseg_append (wseg_of s073B_5) (wseg_append (wseg_of s073B_6) (wseg_append (wseg_of s073B_7) (wseg_append (wseg_of s073B_8) (wseg_append (wseg_of s073B_9) (wseg_of s073B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t074A : List Tok := t074A_0 ++ (t074A_1 ++ (t074A_2 ++ (t074A_3 ++ (t074A_4 ++ (t074A_5 ++ (t074A_6 ++ (t074A_7 ++ (t074A_8 ++ (t074A_9 ++ (t074A_10 ++ (t074A_11 ++ (t074A_12 ++ (t074A_13 ++ (t074A_14 ++ (t074A_15 ++ (t074A_16 ++ (t074A_17 ++ (t074A_18 ++ (t074A_19 ++ (t074A_20 ++ (t074A_21 ++ (t074A_22 ++ (t074A_23 ++ (t074A_24 ++ (t074A_25 ++ (t074A_26 ++ (t074A_27 ++ (t074A_28 ++ (t074A_29 ++ (t074A_30 ++ (t074A_31 ++ (t074A_32 ++ (t074A_33 ++ (t074A_34 ++ (t074A_35 ++ (t074A_36 ++ (t074A_37 ++ (t074A_38 ++ (t074A_39 ++ (t074A_40 ++ (t074A_41 ++ (t074A_42 ++ (t074A_43 ++ (t074A_44 ++ (t074A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t074B : List Tok := t074B_0 ++ (t074B_1 ++ (t074B_2 ++ (t074B_3 ++ (t074B_4 ++ (t074B_5 ++ (t074B_6 ++ (t074B_7 ++ (t074B_8 ++ (t074B_9 ++ (t074B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 074：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run074 : (nbRun P nb074 0 kN074 t074A).1 = true ∧ (nbRun P nb074 1 kN074 t074B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s074A_0) (wseg_append (wseg_of s074A_1) (wseg_append (wseg_of s074A_2) (wseg_append (wseg_of s074A_3) (wseg_append (wseg_of s074A_4) (wseg_append (wseg_of s074A_5) (wseg_append (wseg_of s074A_6) (wseg_append (wseg_of s074A_7) (wseg_append (wseg_of s074A_8) (wseg_append (wseg_of s074A_9) (wseg_append (wseg_of s074A_10) (wseg_append (wseg_of s074A_11) (wseg_append (wseg_of s074A_12) (wseg_append (wseg_of s074A_13) (wseg_append (wseg_of s074A_14) (wseg_append (wseg_of s074A_15) (wseg_append (wseg_of s074A_16) (wseg_append (wseg_of s074A_17) (wseg_append (wseg_of s074A_18) (wseg_append (wseg_of s074A_19) (wseg_append (wseg_of s074A_20) (wseg_append (wseg_of s074A_21) (wseg_append (wseg_of s074A_22) (wseg_append (wseg_of s074A_23) (wseg_append (wseg_of s074A_24) (wseg_append (wseg_of s074A_25) (wseg_append (wseg_of s074A_26) (wseg_append (wseg_of s074A_27) (wseg_append (wseg_of s074A_28) (wseg_append (wseg_of s074A_29) (wseg_append (wseg_of s074A_30) (wseg_append (wseg_of s074A_31) (wseg_append (wseg_of s074A_32) (wseg_append (wseg_of s074A_33) (wseg_append (wseg_of s074A_34) (wseg_append (wseg_of s074A_35) (wseg_append (wseg_of s074A_36) (wseg_append (wseg_of s074A_37) (wseg_append (wseg_of s074A_38) (wseg_append (wseg_of s074A_39) (wseg_append (wseg_of s074A_40) (wseg_append (wseg_of s074A_41) (wseg_append (wseg_of s074A_42) (wseg_append (wseg_of s074A_43) (wseg_append (wseg_of s074A_44) (wseg_of s074A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s074B_0) (wseg_append (wseg_of s074B_1) (wseg_append (wseg_of s074B_2) (wseg_append (wseg_of s074B_3) (wseg_append (wseg_of s074B_4) (wseg_append (wseg_of s074B_5) (wseg_append (wseg_of s074B_6) (wseg_append (wseg_of s074B_7) (wseg_append (wseg_of s074B_8) (wseg_append (wseg_of s074B_9) (wseg_of s074B_10)))))))))))⟩

end PackLean.D40.Tet
