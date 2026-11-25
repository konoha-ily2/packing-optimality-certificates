-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS000_0
import PackLean.D40.K.FarS000_1
import PackLean.D40.K.FarS000_2
import PackLean.D40.K.FarS000_3
import PackLean.D40.K.FarS000_4
import PackLean.D40.K.FarS000_5
import PackLean.D40.K.FarS000_6
import PackLean.D40.K.FarS000_7
import PackLean.D40.K.FarS000_8
import PackLean.D40.K.FarS000_9
import PackLean.D40.K.FarS000_10
import PackLean.D40.K.FarS000_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000A : List Tok := t000A_0 ++ (t000A_1 ++ (t000A_2 ++ (t000A_3 ++ (t000A_4 ++ (t000A_5 ++ (t000A_6 ++ (t000A_7 ++ (t000A_8 ++ (t000A_9 ++ (t000A_10 ++ (t000A_11 ++ (t000A_12 ++ (t000A_13 ++ (t000A_14 ++ (t000A_15 ++ (t000A_16 ++ (t000A_17 ++ (t000A_18 ++ (t000A_19 ++ (t000A_20 ++ (t000A_21 ++ (t000A_22 ++ (t000A_23 ++ (t000A_24 ++ (t000A_25 ++ (t000A_26 ++ (t000A_27 ++ (t000A_28 ++ (t000A_29 ++ (t000A_30 ++ (t000A_31 ++ (t000A_32 ++ (t000A_33 ++ (t000A_34 ++ (t000A_35 ++ (t000A_36 ++ (t000A_37 ++ (t000A_38 ++ (t000A_39 ++ (t000A_40 ++ (t000A_41 ++ (t000A_42 ++ (t000A_43 ++ (t000A_44 ++ (t000A_45 ++ (t000A_46 ++ (t000A_47 ++ (t000A_48 ++ (t000A_49 ++ (t000A_50 ++ (t000A_51 ++ (t000A_52 ++ (t000A_53 ++ (t000A_54 ++ (t000A_55 ++ (t000A_56 ++ (t000A_57 ++ (t000A_58 ++ (t000A_59 ++ (t000A_60 ++ (t000A_61 ++ (t000A_62 ++ (t000A_63 ++ (t000A_64 ++ (t000A_65 ++ (t000A_66 ++ (t000A_67 ++ (t000A_68 ++ (t000A_69 ++ (t000A_70 ++ (t000A_71 ++ (t000A_72 ++ (t000A_73 ++ (t000A_74 ++ (t000A_75 ++ (t000A_76))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t000B : List Tok := t000B_0 ++ (t000B_1 ++ (t000B_2 ++ (t000B_3 ++ (t000B_4 ++ (t000B_5 ++ (t000B_6 ++ (t000B_7 ++ (t000B_8 ++ (t000B_9 ++ (t000B_10 ++ (t000B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 000：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run000 : (nbRun P nb000 0 kN000 t000A).1 = true ∧ (nbRun P nb000 1 kN000 t000B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s000A_0) (wseg_append (wseg_of s000A_1) (wseg_append (wseg_of s000A_2) (wseg_append (wseg_of s000A_3) (wseg_append (wseg_of s000A_4) (wseg_append (wseg_of s000A_5) (wseg_append (wseg_of s000A_6) (wseg_append (wseg_of s000A_7) (wseg_append (wseg_of s000A_8) (wseg_append (wseg_of s000A_9) (wseg_append (wseg_of s000A_10) (wseg_append (wseg_of s000A_11) (wseg_append (wseg_of s000A_12) (wseg_append (wseg_of s000A_13) (wseg_append (wseg_of s000A_14) (wseg_append (wseg_of s000A_15) (wseg_append (wseg_of s000A_16) (wseg_append (wseg_of s000A_17) (wseg_append (wseg_of s000A_18) (wseg_append (wseg_of s000A_19) (wseg_append (wseg_of s000A_20) (wseg_append (wseg_of s000A_21) (wseg_append (wseg_of s000A_22) (wseg_append (wseg_of s000A_23) (wseg_append (wseg_of s000A_24) (wseg_append (wseg_of s000A_25) (wseg_append (wseg_of s000A_26) (wseg_append (wseg_of s000A_27) (wseg_append (wseg_of s000A_28) (wseg_append (wseg_of s000A_29) (wseg_append (wseg_of s000A_30) (wseg_append (wseg_of s000A_31) (wseg_append (wseg_of s000A_32) (wseg_append (wseg_of s000A_33) (wseg_append (wseg_of s000A_34) (wseg_append (wseg_of s000A_35) (wseg_append (wseg_of s000A_36) (wseg_append (wseg_of s000A_37) (wseg_append (wseg_of s000A_38) (wseg_append (wseg_of s000A_39) (wseg_append (wseg_of s000A_40) (wseg_append (wseg_of s000A_41) (wseg_append (wseg_of s000A_42) (wseg_append (wseg_of s000A_43) (wseg_append (wseg_of s000A_44) (wseg_append (wseg_of s000A_45) (wseg_append (wseg_of s000A_46) (wseg_append (wseg_of s000A_47) (wseg_append (wseg_of s000A_48) (wseg_append (wseg_of s000A_49) (wseg_append (wseg_of s000A_50) (wseg_append (wseg_of s000A_51) (wseg_append (wseg_of s000A_52) (wseg_append (wseg_of s000A_53) (wseg_append (wseg_of s000A_54) (wseg_append (wseg_of s000A_55) (wseg_append (wseg_of s000A_56) (wseg_append (wseg_of s000A_57) (wseg_append (wseg_of s000A_58) (wseg_append (wseg_of s000A_59) (wseg_append (wseg_of s000A_60) (wseg_append (wseg_of s000A_61) (wseg_append (wseg_of s000A_62) (wseg_append (wseg_of s000A_63) (wseg_append (wseg_of s000A_64) (wseg_append (wseg_of s000A_65) (wseg_append (wseg_of s000A_66) (wseg_append (wseg_of s000A_67) (wseg_append (wseg_of s000A_68) (wseg_append (wseg_of s000A_69) (wseg_append (wseg_of s000A_70) (wseg_append (wseg_of s000A_71) (wseg_append (wseg_of s000A_72) (wseg_append (wseg_of s000A_73) (wseg_append (wseg_of s000A_74) (wseg_append (wseg_of s000A_75) (wseg_of s000A_76))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s000B_0) (wseg_append (wseg_of s000B_1) (wseg_append (wseg_of s000B_2) (wseg_append (wseg_of s000B_3) (wseg_append (wseg_of s000B_4) (wseg_append (wseg_of s000B_5) (wseg_append (wseg_of s000B_6) (wseg_append (wseg_of s000B_7) (wseg_append (wseg_of s000B_8) (wseg_append (wseg_of s000B_9) (wseg_append (wseg_of s000B_10) (wseg_of s000B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t001A : List Tok := t001A_0 ++ (t001A_1 ++ (t001A_2 ++ (t001A_3 ++ (t001A_4 ++ (t001A_5 ++ (t001A_6 ++ (t001A_7 ++ (t001A_8 ++ (t001A_9 ++ (t001A_10 ++ (t001A_11 ++ (t001A_12 ++ (t001A_13 ++ (t001A_14 ++ (t001A_15 ++ (t001A_16 ++ (t001A_17 ++ (t001A_18 ++ (t001A_19 ++ (t001A_20 ++ (t001A_21 ++ (t001A_22 ++ (t001A_23 ++ (t001A_24 ++ (t001A_25 ++ (t001A_26 ++ (t001A_27 ++ (t001A_28 ++ (t001A_29 ++ (t001A_30 ++ (t001A_31 ++ (t001A_32 ++ (t001A_33 ++ (t001A_34 ++ (t001A_35 ++ (t001A_36 ++ (t001A_37 ++ (t001A_38 ++ (t001A_39 ++ (t001A_40 ++ (t001A_41 ++ (t001A_42 ++ (t001A_43 ++ (t001A_44 ++ (t001A_45 ++ (t001A_46 ++ (t001A_47 ++ (t001A_48 ++ (t001A_49 ++ (t001A_50 ++ (t001A_51 ++ (t001A_52 ++ (t001A_53 ++ (t001A_54 ++ (t001A_55 ++ (t001A_56 ++ (t001A_57 ++ (t001A_58 ++ (t001A_59 ++ (t001A_60 ++ (t001A_61 ++ (t001A_62 ++ (t001A_63 ++ (t001A_64 ++ (t001A_65 ++ (t001A_66 ++ (t001A_67 ++ (t001A_68))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t001B : List Tok := t001B_0 ++ (t001B_1 ++ (t001B_2 ++ (t001B_3 ++ (t001B_4 ++ (t001B_5 ++ (t001B_6 ++ (t001B_7 ++ (t001B_8 ++ (t001B_9 ++ (t001B_10 ++ (t001B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 001：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run001 : (nbRun P nb001 0 kN001 t001A).1 = true ∧ (nbRun P nb001 1 kN001 t001B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s001A_0) (wseg_append (wseg_of s001A_1) (wseg_append (wseg_of s001A_2) (wseg_append (wseg_of s001A_3) (wseg_append (wseg_of s001A_4) (wseg_append (wseg_of s001A_5) (wseg_append (wseg_of s001A_6) (wseg_append (wseg_of s001A_7) (wseg_append (wseg_of s001A_8) (wseg_append (wseg_of s001A_9) (wseg_append (wseg_of s001A_10) (wseg_append (wseg_of s001A_11) (wseg_append (wseg_of s001A_12) (wseg_append (wseg_of s001A_13) (wseg_append (wseg_of s001A_14) (wseg_append (wseg_of s001A_15) (wseg_append (wseg_of s001A_16) (wseg_append (wseg_of s001A_17) (wseg_append (wseg_of s001A_18) (wseg_append (wseg_of s001A_19) (wseg_append (wseg_of s001A_20) (wseg_append (wseg_of s001A_21) (wseg_append (wseg_of s001A_22) (wseg_append (wseg_of s001A_23) (wseg_append (wseg_of s001A_24) (wseg_append (wseg_of s001A_25) (wseg_append (wseg_of s001A_26) (wseg_append (wseg_of s001A_27) (wseg_append (wseg_of s001A_28) (wseg_append (wseg_of s001A_29) (wseg_append (wseg_of s001A_30) (wseg_append (wseg_of s001A_31) (wseg_append (wseg_of s001A_32) (wseg_append (wseg_of s001A_33) (wseg_append (wseg_of s001A_34) (wseg_append (wseg_of s001A_35) (wseg_append (wseg_of s001A_36) (wseg_append (wseg_of s001A_37) (wseg_append (wseg_of s001A_38) (wseg_append (wseg_of s001A_39) (wseg_append (wseg_of s001A_40) (wseg_append (wseg_of s001A_41) (wseg_append (wseg_of s001A_42) (wseg_append (wseg_of s001A_43) (wseg_append (wseg_of s001A_44) (wseg_append (wseg_of s001A_45) (wseg_append (wseg_of s001A_46) (wseg_append (wseg_of s001A_47) (wseg_append (wseg_of s001A_48) (wseg_append (wseg_of s001A_49) (wseg_append (wseg_of s001A_50) (wseg_append (wseg_of s001A_51) (wseg_append (wseg_of s001A_52) (wseg_append (wseg_of s001A_53) (wseg_append (wseg_of s001A_54) (wseg_append (wseg_of s001A_55) (wseg_append (wseg_of s001A_56) (wseg_append (wseg_of s001A_57) (wseg_append (wseg_of s001A_58) (wseg_append (wseg_of s001A_59) (wseg_append (wseg_of s001A_60) (wseg_append (wseg_of s001A_61) (wseg_append (wseg_of s001A_62) (wseg_append (wseg_of s001A_63) (wseg_append (wseg_of s001A_64) (wseg_append (wseg_of s001A_65) (wseg_append (wseg_of s001A_66) (wseg_append (wseg_of s001A_67) (wseg_of s001A_68))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s001B_0) (wseg_append (wseg_of s001B_1) (wseg_append (wseg_of s001B_2) (wseg_append (wseg_of s001B_3) (wseg_append (wseg_of s001B_4) (wseg_append (wseg_of s001B_5) (wseg_append (wseg_of s001B_6) (wseg_append (wseg_of s001B_7) (wseg_append (wseg_of s001B_8) (wseg_append (wseg_of s001B_9) (wseg_append (wseg_of s001B_10) (wseg_of s001B_11))))))))))))⟩

end PackLean.D40.Tet
