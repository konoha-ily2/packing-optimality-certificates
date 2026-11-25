-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS014_0
import PackLean.D40.K.FarS014_1
import PackLean.D40.K.FarS014_2
import PackLean.D40.K.FarS014_3
import PackLean.D40.K.FarS014_4
import PackLean.D40.K.FarS014_5
import PackLean.D40.K.FarS014_6
import PackLean.D40.K.FarS014_7
import PackLean.D40.K.FarS014_8
import PackLean.D40.K.FarS014_9
import PackLean.D40.K.FarS014_10
import PackLean.D40.K.FarS014_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t040A : List Tok := t040A_0 ++ (t040A_1 ++ (t040A_2 ++ (t040A_3 ++ (t040A_4 ++ (t040A_5 ++ (t040A_6 ++ (t040A_7 ++ (t040A_8 ++ (t040A_9 ++ (t040A_10 ++ (t040A_11 ++ (t040A_12 ++ (t040A_13 ++ (t040A_14 ++ (t040A_15 ++ (t040A_16 ++ (t040A_17 ++ (t040A_18 ++ (t040A_19 ++ (t040A_20 ++ (t040A_21 ++ (t040A_22 ++ (t040A_23 ++ (t040A_24 ++ (t040A_25 ++ (t040A_26 ++ (t040A_27 ++ (t040A_28 ++ (t040A_29 ++ (t040A_30 ++ (t040A_31 ++ (t040A_32 ++ (t040A_33 ++ (t040A_34 ++ (t040A_35 ++ (t040A_36 ++ (t040A_37 ++ (t040A_38 ++ (t040A_39 ++ (t040A_40 ++ (t040A_41 ++ (t040A_42 ++ (t040A_43 ++ (t040A_44 ++ (t040A_45 ++ (t040A_46 ++ (t040A_47)))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t040B : List Tok := t040B_0 ++ (t040B_1 ++ (t040B_2 ++ (t040B_3 ++ (t040B_4 ++ (t040B_5 ++ (t040B_6 ++ (t040B_7 ++ (t040B_8 ++ (t040B_9 ++ (t040B_10 ++ (t040B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 040：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run040 : (nbRun P nb040 0 kN040 t040A).1 = true ∧ (nbRun P nb040 1 kN040 t040B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s040A_0) (wseg_append (wseg_of s040A_1) (wseg_append (wseg_of s040A_2) (wseg_append (wseg_of s040A_3) (wseg_append (wseg_of s040A_4) (wseg_append (wseg_of s040A_5) (wseg_append (wseg_of s040A_6) (wseg_append (wseg_of s040A_7) (wseg_append (wseg_of s040A_8) (wseg_append (wseg_of s040A_9) (wseg_append (wseg_of s040A_10) (wseg_append (wseg_of s040A_11) (wseg_append (wseg_of s040A_12) (wseg_append (wseg_of s040A_13) (wseg_append (wseg_of s040A_14) (wseg_append (wseg_of s040A_15) (wseg_append (wseg_of s040A_16) (wseg_append (wseg_of s040A_17) (wseg_append (wseg_of s040A_18) (wseg_append (wseg_of s040A_19) (wseg_append (wseg_of s040A_20) (wseg_append (wseg_of s040A_21) (wseg_append (wseg_of s040A_22) (wseg_append (wseg_of s040A_23) (wseg_append (wseg_of s040A_24) (wseg_append (wseg_of s040A_25) (wseg_append (wseg_of s040A_26) (wseg_append (wseg_of s040A_27) (wseg_append (wseg_of s040A_28) (wseg_append (wseg_of s040A_29) (wseg_append (wseg_of s040A_30) (wseg_append (wseg_of s040A_31) (wseg_append (wseg_of s040A_32) (wseg_append (wseg_of s040A_33) (wseg_append (wseg_of s040A_34) (wseg_append (wseg_of s040A_35) (wseg_append (wseg_of s040A_36) (wseg_append (wseg_of s040A_37) (wseg_append (wseg_of s040A_38) (wseg_append (wseg_of s040A_39) (wseg_append (wseg_of s040A_40) (wseg_append (wseg_of s040A_41) (wseg_append (wseg_of s040A_42) (wseg_append (wseg_of s040A_43) (wseg_append (wseg_of s040A_44) (wseg_append (wseg_of s040A_45) (wseg_append (wseg_of s040A_46) (wseg_of s040A_47)))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s040B_0) (wseg_append (wseg_of s040B_1) (wseg_append (wseg_of s040B_2) (wseg_append (wseg_of s040B_3) (wseg_append (wseg_of s040B_4) (wseg_append (wseg_of s040B_5) (wseg_append (wseg_of s040B_6) (wseg_append (wseg_of s040B_7) (wseg_append (wseg_of s040B_8) (wseg_append (wseg_of s040B_9) (wseg_append (wseg_of s040B_10) (wseg_of s040B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t041A : List Tok := t041A_0 ++ (t041A_1 ++ (t041A_2 ++ (t041A_3 ++ (t041A_4 ++ (t041A_5 ++ (t041A_6 ++ (t041A_7 ++ (t041A_8 ++ (t041A_9 ++ (t041A_10 ++ (t041A_11 ++ (t041A_12 ++ (t041A_13 ++ (t041A_14 ++ (t041A_15 ++ (t041A_16 ++ (t041A_17 ++ (t041A_18 ++ (t041A_19 ++ (t041A_20 ++ (t041A_21 ++ (t041A_22 ++ (t041A_23 ++ (t041A_24 ++ (t041A_25 ++ (t041A_26 ++ (t041A_27 ++ (t041A_28 ++ (t041A_29 ++ (t041A_30 ++ (t041A_31 ++ (t041A_32 ++ (t041A_33 ++ (t041A_34 ++ (t041A_35 ++ (t041A_36 ++ (t041A_37 ++ (t041A_38 ++ (t041A_39 ++ (t041A_40 ++ (t041A_41 ++ (t041A_42 ++ (t041A_43 ++ (t041A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t041B : List Tok := t041B_0 ++ (t041B_1 ++ (t041B_2 ++ (t041B_3 ++ (t041B_4 ++ (t041B_5 ++ (t041B_6 ++ (t041B_7 ++ (t041B_8 ++ (t041B_9 ++ (t041B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 041：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run041 : (nbRun P nb041 0 kN041 t041A).1 = true ∧ (nbRun P nb041 1 kN041 t041B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s041A_0) (wseg_append (wseg_of s041A_1) (wseg_append (wseg_of s041A_2) (wseg_append (wseg_of s041A_3) (wseg_append (wseg_of s041A_4) (wseg_append (wseg_of s041A_5) (wseg_append (wseg_of s041A_6) (wseg_append (wseg_of s041A_7) (wseg_append (wseg_of s041A_8) (wseg_append (wseg_of s041A_9) (wseg_append (wseg_of s041A_10) (wseg_append (wseg_of s041A_11) (wseg_append (wseg_of s041A_12) (wseg_append (wseg_of s041A_13) (wseg_append (wseg_of s041A_14) (wseg_append (wseg_of s041A_15) (wseg_append (wseg_of s041A_16) (wseg_append (wseg_of s041A_17) (wseg_append (wseg_of s041A_18) (wseg_append (wseg_of s041A_19) (wseg_append (wseg_of s041A_20) (wseg_append (wseg_of s041A_21) (wseg_append (wseg_of s041A_22) (wseg_append (wseg_of s041A_23) (wseg_append (wseg_of s041A_24) (wseg_append (wseg_of s041A_25) (wseg_append (wseg_of s041A_26) (wseg_append (wseg_of s041A_27) (wseg_append (wseg_of s041A_28) (wseg_append (wseg_of s041A_29) (wseg_append (wseg_of s041A_30) (wseg_append (wseg_of s041A_31) (wseg_append (wseg_of s041A_32) (wseg_append (wseg_of s041A_33) (wseg_append (wseg_of s041A_34) (wseg_append (wseg_of s041A_35) (wseg_append (wseg_of s041A_36) (wseg_append (wseg_of s041A_37) (wseg_append (wseg_of s041A_38) (wseg_append (wseg_of s041A_39) (wseg_append (wseg_of s041A_40) (wseg_append (wseg_of s041A_41) (wseg_append (wseg_of s041A_42) (wseg_append (wseg_of s041A_43) (wseg_of s041A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s041B_0) (wseg_append (wseg_of s041B_1) (wseg_append (wseg_of s041B_2) (wseg_append (wseg_of s041B_3) (wseg_append (wseg_of s041B_4) (wseg_append (wseg_of s041B_5) (wseg_append (wseg_of s041B_6) (wseg_append (wseg_of s041B_7) (wseg_append (wseg_of s041B_8) (wseg_append (wseg_of s041B_9) (wseg_of s041B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t042A : List Tok := t042A_0 ++ (t042A_1 ++ (t042A_2 ++ (t042A_3 ++ (t042A_4 ++ (t042A_5 ++ (t042A_6 ++ (t042A_7 ++ (t042A_8 ++ (t042A_9 ++ (t042A_10 ++ (t042A_11 ++ (t042A_12 ++ (t042A_13 ++ (t042A_14 ++ (t042A_15 ++ (t042A_16 ++ (t042A_17 ++ (t042A_18 ++ (t042A_19 ++ (t042A_20 ++ (t042A_21 ++ (t042A_22 ++ (t042A_23 ++ (t042A_24 ++ (t042A_25 ++ (t042A_26 ++ (t042A_27 ++ (t042A_28 ++ (t042A_29 ++ (t042A_30 ++ (t042A_31 ++ (t042A_32 ++ (t042A_33 ++ (t042A_34 ++ (t042A_35 ++ (t042A_36 ++ (t042A_37 ++ (t042A_38 ++ (t042A_39 ++ (t042A_40))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t042B : List Tok := t042B_0 ++ (t042B_1 ++ (t042B_2 ++ (t042B_3 ++ (t042B_4 ++ (t042B_5 ++ (t042B_6 ++ (t042B_7 ++ (t042B_8 ++ (t042B_9 ++ (t042B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 042：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run042 : (nbRun P nb042 0 kN042 t042A).1 = true ∧ (nbRun P nb042 1 kN042 t042B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s042A_0) (wseg_append (wseg_of s042A_1) (wseg_append (wseg_of s042A_2) (wseg_append (wseg_of s042A_3) (wseg_append (wseg_of s042A_4) (wseg_append (wseg_of s042A_5) (wseg_append (wseg_of s042A_6) (wseg_append (wseg_of s042A_7) (wseg_append (wseg_of s042A_8) (wseg_append (wseg_of s042A_9) (wseg_append (wseg_of s042A_10) (wseg_append (wseg_of s042A_11) (wseg_append (wseg_of s042A_12) (wseg_append (wseg_of s042A_13) (wseg_append (wseg_of s042A_14) (wseg_append (wseg_of s042A_15) (wseg_append (wseg_of s042A_16) (wseg_append (wseg_of s042A_17) (wseg_append (wseg_of s042A_18) (wseg_append (wseg_of s042A_19) (wseg_append (wseg_of s042A_20) (wseg_append (wseg_of s042A_21) (wseg_append (wseg_of s042A_22) (wseg_append (wseg_of s042A_23) (wseg_append (wseg_of s042A_24) (wseg_append (wseg_of s042A_25) (wseg_append (wseg_of s042A_26) (wseg_append (wseg_of s042A_27) (wseg_append (wseg_of s042A_28) (wseg_append (wseg_of s042A_29) (wseg_append (wseg_of s042A_30) (wseg_append (wseg_of s042A_31) (wseg_append (wseg_of s042A_32) (wseg_append (wseg_of s042A_33) (wseg_append (wseg_of s042A_34) (wseg_append (wseg_of s042A_35) (wseg_append (wseg_of s042A_36) (wseg_append (wseg_of s042A_37) (wseg_append (wseg_of s042A_38) (wseg_append (wseg_of s042A_39) (wseg_of s042A_40))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s042B_0) (wseg_append (wseg_of s042B_1) (wseg_append (wseg_of s042B_2) (wseg_append (wseg_of s042B_3) (wseg_append (wseg_of s042B_4) (wseg_append (wseg_of s042B_5) (wseg_append (wseg_of s042B_6) (wseg_append (wseg_of s042B_7) (wseg_append (wseg_of s042B_8) (wseg_append (wseg_of s042B_9) (wseg_of s042B_10)))))))))))⟩

end PackLean.D40.Tet
