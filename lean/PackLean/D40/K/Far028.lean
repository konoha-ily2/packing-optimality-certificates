-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS028_0
import PackLean.D40.K.FarS028_1
import PackLean.D40.K.FarS028_2
import PackLean.D40.K.FarS028_3
import PackLean.D40.K.FarS028_4
import PackLean.D40.K.FarS028_5
import PackLean.D40.K.FarS028_6
import PackLean.D40.K.FarS028_7
import PackLean.D40.K.FarS028_8
import PackLean.D40.K.FarS028_9
import PackLean.D40.K.FarS028_10
import PackLean.D40.K.FarS028_11
import PackLean.D40.K.FarS028_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t087A : List Tok := t087A_0 ++ (t087A_1 ++ (t087A_2 ++ (t087A_3 ++ (t087A_4 ++ (t087A_5 ++ (t087A_6 ++ (t087A_7 ++ (t087A_8 ++ (t087A_9 ++ (t087A_10 ++ (t087A_11 ++ (t087A_12 ++ (t087A_13 ++ (t087A_14 ++ (t087A_15 ++ (t087A_16 ++ (t087A_17 ++ (t087A_18 ++ (t087A_19 ++ (t087A_20 ++ (t087A_21 ++ (t087A_22 ++ (t087A_23 ++ (t087A_24 ++ (t087A_25 ++ (t087A_26 ++ (t087A_27 ++ (t087A_28 ++ (t087A_29 ++ (t087A_30 ++ (t087A_31 ++ (t087A_32 ++ (t087A_33 ++ (t087A_34 ++ (t087A_35 ++ (t087A_36 ++ (t087A_37 ++ (t087A_38 ++ (t087A_39 ++ (t087A_40 ++ (t087A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t087B : List Tok := t087B_0 ++ (t087B_1 ++ (t087B_2 ++ (t087B_3 ++ (t087B_4 ++ (t087B_5 ++ (t087B_6 ++ (t087B_7 ++ (t087B_8 ++ (t087B_9 ++ (t087B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 087：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run087 : (nbRun P nb087 0 kN087 t087A).1 = true ∧ (nbRun P nb087 1 kN087 t087B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s087A_0) (wseg_append (wseg_of s087A_1) (wseg_append (wseg_of s087A_2) (wseg_append (wseg_of s087A_3) (wseg_append (wseg_of s087A_4) (wseg_append (wseg_of s087A_5) (wseg_append (wseg_of s087A_6) (wseg_append (wseg_of s087A_7) (wseg_append (wseg_of s087A_8) (wseg_append (wseg_of s087A_9) (wseg_append (wseg_of s087A_10) (wseg_append (wseg_of s087A_11) (wseg_append (wseg_of s087A_12) (wseg_append (wseg_of s087A_13) (wseg_append (wseg_of s087A_14) (wseg_append (wseg_of s087A_15) (wseg_append (wseg_of s087A_16) (wseg_append (wseg_of s087A_17) (wseg_append (wseg_of s087A_18) (wseg_append (wseg_of s087A_19) (wseg_append (wseg_of s087A_20) (wseg_append (wseg_of s087A_21) (wseg_append (wseg_of s087A_22) (wseg_append (wseg_of s087A_23) (wseg_append (wseg_of s087A_24) (wseg_append (wseg_of s087A_25) (wseg_append (wseg_of s087A_26) (wseg_append (wseg_of s087A_27) (wseg_append (wseg_of s087A_28) (wseg_append (wseg_of s087A_29) (wseg_append (wseg_of s087A_30) (wseg_append (wseg_of s087A_31) (wseg_append (wseg_of s087A_32) (wseg_append (wseg_of s087A_33) (wseg_append (wseg_of s087A_34) (wseg_append (wseg_of s087A_35) (wseg_append (wseg_of s087A_36) (wseg_append (wseg_of s087A_37) (wseg_append (wseg_of s087A_38) (wseg_append (wseg_of s087A_39) (wseg_append (wseg_of s087A_40) (wseg_of s087A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s087B_0) (wseg_append (wseg_of s087B_1) (wseg_append (wseg_of s087B_2) (wseg_append (wseg_of s087B_3) (wseg_append (wseg_of s087B_4) (wseg_append (wseg_of s087B_5) (wseg_append (wseg_of s087B_6) (wseg_append (wseg_of s087B_7) (wseg_append (wseg_of s087B_8) (wseg_append (wseg_of s087B_9) (wseg_of s087B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t088A : List Tok := t088A_0 ++ (t088A_1 ++ (t088A_2 ++ (t088A_3 ++ (t088A_4 ++ (t088A_5 ++ (t088A_6 ++ (t088A_7 ++ (t088A_8 ++ (t088A_9 ++ (t088A_10 ++ (t088A_11 ++ (t088A_12 ++ (t088A_13 ++ (t088A_14 ++ (t088A_15 ++ (t088A_16 ++ (t088A_17 ++ (t088A_18 ++ (t088A_19 ++ (t088A_20 ++ (t088A_21 ++ (t088A_22 ++ (t088A_23 ++ (t088A_24 ++ (t088A_25 ++ (t088A_26 ++ (t088A_27 ++ (t088A_28 ++ (t088A_29 ++ (t088A_30 ++ (t088A_31 ++ (t088A_32 ++ (t088A_33 ++ (t088A_34 ++ (t088A_35 ++ (t088A_36 ++ (t088A_37 ++ (t088A_38 ++ (t088A_39 ++ (t088A_40 ++ (t088A_41 ++ (t088A_42 ++ (t088A_43 ++ (t088A_44 ++ (t088A_45 ++ (t088A_46 ++ (t088A_47 ++ (t088A_48 ++ (t088A_49 ++ (t088A_50 ++ (t088A_51 ++ (t088A_52 ++ (t088A_53 ++ (t088A_54 ++ (t088A_55 ++ (t088A_56 ++ (t088A_57 ++ (t088A_58 ++ (t088A_59 ++ (t088A_60 ++ (t088A_61 ++ (t088A_62 ++ (t088A_63 ++ (t088A_64 ++ (t088A_65 ++ (t088A_66 ++ (t088A_67 ++ (t088A_68 ++ (t088A_69 ++ (t088A_70 ++ (t088A_71 ++ (t088A_72 ++ (t088A_73 ++ (t088A_74))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t088B : List Tok := t088B_0 ++ (t088B_1 ++ (t088B_2 ++ (t088B_3 ++ (t088B_4 ++ (t088B_5 ++ (t088B_6 ++ (t088B_7 ++ (t088B_8 ++ (t088B_9 ++ (t088B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 088：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run088 : (nbRun P nb088 0 kN088 t088A).1 = true ∧ (nbRun P nb088 1 kN088 t088B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s088A_0) (wseg_append (wseg_of s088A_1) (wseg_append (wseg_of s088A_2) (wseg_append (wseg_of s088A_3) (wseg_append (wseg_of s088A_4) (wseg_append (wseg_of s088A_5) (wseg_append (wseg_of s088A_6) (wseg_append (wseg_of s088A_7) (wseg_append (wseg_of s088A_8) (wseg_append (wseg_of s088A_9) (wseg_append (wseg_of s088A_10) (wseg_append (wseg_of s088A_11) (wseg_append (wseg_of s088A_12) (wseg_append (wseg_of s088A_13) (wseg_append (wseg_of s088A_14) (wseg_append (wseg_of s088A_15) (wseg_append (wseg_of s088A_16) (wseg_append (wseg_of s088A_17) (wseg_append (wseg_of s088A_18) (wseg_append (wseg_of s088A_19) (wseg_append (wseg_of s088A_20) (wseg_append (wseg_of s088A_21) (wseg_append (wseg_of s088A_22) (wseg_append (wseg_of s088A_23) (wseg_append (wseg_of s088A_24) (wseg_append (wseg_of s088A_25) (wseg_append (wseg_of s088A_26) (wseg_append (wseg_of s088A_27) (wseg_append (wseg_of s088A_28) (wseg_append (wseg_of s088A_29) (wseg_append (wseg_of s088A_30) (wseg_append (wseg_of s088A_31) (wseg_append (wseg_of s088A_32) (wseg_append (wseg_of s088A_33) (wseg_append (wseg_of s088A_34) (wseg_append (wseg_of s088A_35) (wseg_append (wseg_of s088A_36) (wseg_append (wseg_of s088A_37) (wseg_append (wseg_of s088A_38) (wseg_append (wseg_of s088A_39) (wseg_append (wseg_of s088A_40) (wseg_append (wseg_of s088A_41) (wseg_append (wseg_of s088A_42) (wseg_append (wseg_of s088A_43) (wseg_append (wseg_of s088A_44) (wseg_append (wseg_of s088A_45) (wseg_append (wseg_of s088A_46) (wseg_append (wseg_of s088A_47) (wseg_append (wseg_of s088A_48) (wseg_append (wseg_of s088A_49) (wseg_append (wseg_of s088A_50) (wseg_append (wseg_of s088A_51) (wseg_append (wseg_of s088A_52) (wseg_append (wseg_of s088A_53) (wseg_append (wseg_of s088A_54) (wseg_append (wseg_of s088A_55) (wseg_append (wseg_of s088A_56) (wseg_append (wseg_of s088A_57) (wseg_append (wseg_of s088A_58) (wseg_append (wseg_of s088A_59) (wseg_append (wseg_of s088A_60) (wseg_append (wseg_of s088A_61) (wseg_append (wseg_of s088A_62) (wseg_append (wseg_of s088A_63) (wseg_append (wseg_of s088A_64) (wseg_append (wseg_of s088A_65) (wseg_append (wseg_of s088A_66) (wseg_append (wseg_of s088A_67) (wseg_append (wseg_of s088A_68) (wseg_append (wseg_of s088A_69) (wseg_append (wseg_of s088A_70) (wseg_append (wseg_of s088A_71) (wseg_append (wseg_of s088A_72) (wseg_append (wseg_of s088A_73) (wseg_of s088A_74))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s088B_0) (wseg_append (wseg_of s088B_1) (wseg_append (wseg_of s088B_2) (wseg_append (wseg_of s088B_3) (wseg_append (wseg_of s088B_4) (wseg_append (wseg_of s088B_5) (wseg_append (wseg_of s088B_6) (wseg_append (wseg_of s088B_7) (wseg_append (wseg_of s088B_8) (wseg_append (wseg_of s088B_9) (wseg_of s088B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t089A : List Tok := t089A_0 ++ (t089A_1 ++ (t089A_2 ++ (t089A_3 ++ (t089A_4 ++ (t089A_5 ++ (t089A_6 ++ (t089A_7 ++ (t089A_8 ++ (t089A_9 ++ (t089A_10 ++ (t089A_11 ++ (t089A_12 ++ (t089A_13 ++ (t089A_14 ++ (t089A_15 ++ (t089A_16 ++ (t089A_17 ++ (t089A_18 ++ (t089A_19 ++ (t089A_20 ++ (t089A_21 ++ (t089A_22 ++ (t089A_23 ++ (t089A_24 ++ (t089A_25 ++ (t089A_26 ++ (t089A_27 ++ (t089A_28 ++ (t089A_29 ++ (t089A_30 ++ (t089A_31 ++ (t089A_32 ++ (t089A_33 ++ (t089A_34 ++ (t089A_35 ++ (t089A_36 ++ (t089A_37 ++ (t089A_38 ++ (t089A_39 ++ (t089A_40 ++ (t089A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t089B : List Tok := t089B_0 ++ (t089B_1 ++ (t089B_2 ++ (t089B_3 ++ (t089B_4 ++ (t089B_5 ++ (t089B_6 ++ (t089B_7 ++ (t089B_8 ++ (t089B_9 ++ (t089B_10 ++ (t089B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 089：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run089 : (nbRun P nb089 0 kN089 t089A).1 = true ∧ (nbRun P nb089 1 kN089 t089B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s089A_0) (wseg_append (wseg_of s089A_1) (wseg_append (wseg_of s089A_2) (wseg_append (wseg_of s089A_3) (wseg_append (wseg_of s089A_4) (wseg_append (wseg_of s089A_5) (wseg_append (wseg_of s089A_6) (wseg_append (wseg_of s089A_7) (wseg_append (wseg_of s089A_8) (wseg_append (wseg_of s089A_9) (wseg_append (wseg_of s089A_10) (wseg_append (wseg_of s089A_11) (wseg_append (wseg_of s089A_12) (wseg_append (wseg_of s089A_13) (wseg_append (wseg_of s089A_14) (wseg_append (wseg_of s089A_15) (wseg_append (wseg_of s089A_16) (wseg_append (wseg_of s089A_17) (wseg_append (wseg_of s089A_18) (wseg_append (wseg_of s089A_19) (wseg_append (wseg_of s089A_20) (wseg_append (wseg_of s089A_21) (wseg_append (wseg_of s089A_22) (wseg_append (wseg_of s089A_23) (wseg_append (wseg_of s089A_24) (wseg_append (wseg_of s089A_25) (wseg_append (wseg_of s089A_26) (wseg_append (wseg_of s089A_27) (wseg_append (wseg_of s089A_28) (wseg_append (wseg_of s089A_29) (wseg_append (wseg_of s089A_30) (wseg_append (wseg_of s089A_31) (wseg_append (wseg_of s089A_32) (wseg_append (wseg_of s089A_33) (wseg_append (wseg_of s089A_34) (wseg_append (wseg_of s089A_35) (wseg_append (wseg_of s089A_36) (wseg_append (wseg_of s089A_37) (wseg_append (wseg_of s089A_38) (wseg_append (wseg_of s089A_39) (wseg_append (wseg_of s089A_40) (wseg_of s089A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s089B_0) (wseg_append (wseg_of s089B_1) (wseg_append (wseg_of s089B_2) (wseg_append (wseg_of s089B_3) (wseg_append (wseg_of s089B_4) (wseg_append (wseg_of s089B_5) (wseg_append (wseg_of s089B_6) (wseg_append (wseg_of s089B_7) (wseg_append (wseg_of s089B_8) (wseg_append (wseg_of s089B_9) (wseg_append (wseg_of s089B_10) (wseg_of s089B_11))))))))))))⟩

end PackLean.D40.Tet
