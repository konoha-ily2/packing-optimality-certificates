-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS011_0
import PackLean.D40.K.FarS011_1
import PackLean.D40.K.FarS011_2
import PackLean.D40.K.FarS011_3
import PackLean.D40.K.FarS011_4
import PackLean.D40.K.FarS011_5
import PackLean.D40.K.FarS011_6
import PackLean.D40.K.FarS011_7
import PackLean.D40.K.FarS011_8
import PackLean.D40.K.FarS011_9
import PackLean.D40.K.FarS011_10
import PackLean.D40.K.FarS011_11
import PackLean.D40.K.FarS011_12
import PackLean.D40.K.FarS011_13
import PackLean.D40.K.FarS011_14
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t031A : List Tok := t031A_0 ++ (t031A_1 ++ (t031A_2 ++ (t031A_3 ++ (t031A_4 ++ (t031A_5 ++ (t031A_6 ++ (t031A_7 ++ (t031A_8 ++ (t031A_9 ++ (t031A_10 ++ (t031A_11 ++ (t031A_12 ++ (t031A_13 ++ (t031A_14 ++ (t031A_15 ++ (t031A_16 ++ (t031A_17 ++ (t031A_18 ++ (t031A_19 ++ (t031A_20 ++ (t031A_21 ++ (t031A_22 ++ (t031A_23 ++ (t031A_24 ++ (t031A_25 ++ (t031A_26 ++ (t031A_27 ++ (t031A_28 ++ (t031A_29 ++ (t031A_30 ++ (t031A_31 ++ (t031A_32 ++ (t031A_33 ++ (t031A_34 ++ (t031A_35 ++ (t031A_36 ++ (t031A_37 ++ (t031A_38 ++ (t031A_39 ++ (t031A_40 ++ (t031A_41 ++ (t031A_42 ++ (t031A_43 ++ (t031A_44 ++ (t031A_45 ++ (t031A_46 ++ (t031A_47 ++ (t031A_48 ++ (t031A_49 ++ (t031A_50 ++ (t031A_51 ++ (t031A_52 ++ (t031A_53 ++ (t031A_54 ++ (t031A_55 ++ (t031A_56 ++ (t031A_57 ++ (t031A_58 ++ (t031A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t031B : List Tok := t031B_0 ++ (t031B_1 ++ (t031B_2 ++ (t031B_3 ++ (t031B_4 ++ (t031B_5 ++ (t031B_6 ++ (t031B_7 ++ (t031B_8 ++ (t031B_9 ++ (t031B_10 ++ (t031B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 031：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run031 : (nbRun P nb031 0 kN031 t031A).1 = true ∧ (nbRun P nb031 1 kN031 t031B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s031A_0) (wseg_append (wseg_of s031A_1) (wseg_append (wseg_of s031A_2) (wseg_append (wseg_of s031A_3) (wseg_append (wseg_of s031A_4) (wseg_append (wseg_of s031A_5) (wseg_append (wseg_of s031A_6) (wseg_append (wseg_of s031A_7) (wseg_append (wseg_of s031A_8) (wseg_append (wseg_of s031A_9) (wseg_append (wseg_of s031A_10) (wseg_append (wseg_of s031A_11) (wseg_append (wseg_of s031A_12) (wseg_append (wseg_of s031A_13) (wseg_append (wseg_of s031A_14) (wseg_append (wseg_of s031A_15) (wseg_append (wseg_of s031A_16) (wseg_append (wseg_of s031A_17) (wseg_append (wseg_of s031A_18) (wseg_append (wseg_of s031A_19) (wseg_append (wseg_of s031A_20) (wseg_append (wseg_of s031A_21) (wseg_append (wseg_of s031A_22) (wseg_append (wseg_of s031A_23) (wseg_append (wseg_of s031A_24) (wseg_append (wseg_of s031A_25) (wseg_append (wseg_of s031A_26) (wseg_append (wseg_of s031A_27) (wseg_append (wseg_of s031A_28) (wseg_append (wseg_of s031A_29) (wseg_append (wseg_of s031A_30) (wseg_append (wseg_of s031A_31) (wseg_append (wseg_of s031A_32) (wseg_append (wseg_of s031A_33) (wseg_append (wseg_of s031A_34) (wseg_append (wseg_of s031A_35) (wseg_append (wseg_of s031A_36) (wseg_append (wseg_of s031A_37) (wseg_append (wseg_of s031A_38) (wseg_append (wseg_of s031A_39) (wseg_append (wseg_of s031A_40) (wseg_append (wseg_of s031A_41) (wseg_append (wseg_of s031A_42) (wseg_append (wseg_of s031A_43) (wseg_append (wseg_of s031A_44) (wseg_append (wseg_of s031A_45) (wseg_append (wseg_of s031A_46) (wseg_append (wseg_of s031A_47) (wseg_append (wseg_of s031A_48) (wseg_append (wseg_of s031A_49) (wseg_append (wseg_of s031A_50) (wseg_append (wseg_of s031A_51) (wseg_append (wseg_of s031A_52) (wseg_append (wseg_of s031A_53) (wseg_append (wseg_of s031A_54) (wseg_append (wseg_of s031A_55) (wseg_append (wseg_of s031A_56) (wseg_append (wseg_of s031A_57) (wseg_append (wseg_of s031A_58) (wseg_of s031A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s031B_0) (wseg_append (wseg_of s031B_1) (wseg_append (wseg_of s031B_2) (wseg_append (wseg_of s031B_3) (wseg_append (wseg_of s031B_4) (wseg_append (wseg_of s031B_5) (wseg_append (wseg_of s031B_6) (wseg_append (wseg_of s031B_7) (wseg_append (wseg_of s031B_8) (wseg_append (wseg_of s031B_9) (wseg_append (wseg_of s031B_10) (wseg_of s031B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t032A : List Tok := t032A_0 ++ (t032A_1 ++ (t032A_2 ++ (t032A_3 ++ (t032A_4 ++ (t032A_5 ++ (t032A_6 ++ (t032A_7 ++ (t032A_8 ++ (t032A_9 ++ (t032A_10 ++ (t032A_11 ++ (t032A_12 ++ (t032A_13 ++ (t032A_14 ++ (t032A_15 ++ (t032A_16 ++ (t032A_17 ++ (t032A_18 ++ (t032A_19 ++ (t032A_20 ++ (t032A_21 ++ (t032A_22 ++ (t032A_23 ++ (t032A_24 ++ (t032A_25 ++ (t032A_26 ++ (t032A_27 ++ (t032A_28 ++ (t032A_29 ++ (t032A_30 ++ (t032A_31 ++ (t032A_32 ++ (t032A_33 ++ (t032A_34 ++ (t032A_35 ++ (t032A_36 ++ (t032A_37 ++ (t032A_38 ++ (t032A_39 ++ (t032A_40 ++ (t032A_41 ++ (t032A_42 ++ (t032A_43 ++ (t032A_44 ++ (t032A_45 ++ (t032A_46 ++ (t032A_47 ++ (t032A_48 ++ (t032A_49 ++ (t032A_50 ++ (t032A_51 ++ (t032A_52 ++ (t032A_53 ++ (t032A_54 ++ (t032A_55 ++ (t032A_56 ++ (t032A_57 ++ (t032A_58))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t032B : List Tok := t032B_0 ++ (t032B_1 ++ (t032B_2 ++ (t032B_3 ++ (t032B_4 ++ (t032B_5 ++ (t032B_6 ++ (t032B_7 ++ (t032B_8 ++ (t032B_9 ++ (t032B_10 ++ (t032B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 032：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run032 : (nbRun P nb032 0 kN032 t032A).1 = true ∧ (nbRun P nb032 1 kN032 t032B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s032A_0) (wseg_append (wseg_of s032A_1) (wseg_append (wseg_of s032A_2) (wseg_append (wseg_of s032A_3) (wseg_append (wseg_of s032A_4) (wseg_append (wseg_of s032A_5) (wseg_append (wseg_of s032A_6) (wseg_append (wseg_of s032A_7) (wseg_append (wseg_of s032A_8) (wseg_append (wseg_of s032A_9) (wseg_append (wseg_of s032A_10) (wseg_append (wseg_of s032A_11) (wseg_append (wseg_of s032A_12) (wseg_append (wseg_of s032A_13) (wseg_append (wseg_of s032A_14) (wseg_append (wseg_of s032A_15) (wseg_append (wseg_of s032A_16) (wseg_append (wseg_of s032A_17) (wseg_append (wseg_of s032A_18) (wseg_append (wseg_of s032A_19) (wseg_append (wseg_of s032A_20) (wseg_append (wseg_of s032A_21) (wseg_append (wseg_of s032A_22) (wseg_append (wseg_of s032A_23) (wseg_append (wseg_of s032A_24) (wseg_append (wseg_of s032A_25) (wseg_append (wseg_of s032A_26) (wseg_append (wseg_of s032A_27) (wseg_append (wseg_of s032A_28) (wseg_append (wseg_of s032A_29) (wseg_append (wseg_of s032A_30) (wseg_append (wseg_of s032A_31) (wseg_append (wseg_of s032A_32) (wseg_append (wseg_of s032A_33) (wseg_append (wseg_of s032A_34) (wseg_append (wseg_of s032A_35) (wseg_append (wseg_of s032A_36) (wseg_append (wseg_of s032A_37) (wseg_append (wseg_of s032A_38) (wseg_append (wseg_of s032A_39) (wseg_append (wseg_of s032A_40) (wseg_append (wseg_of s032A_41) (wseg_append (wseg_of s032A_42) (wseg_append (wseg_of s032A_43) (wseg_append (wseg_of s032A_44) (wseg_append (wseg_of s032A_45) (wseg_append (wseg_of s032A_46) (wseg_append (wseg_of s032A_47) (wseg_append (wseg_of s032A_48) (wseg_append (wseg_of s032A_49) (wseg_append (wseg_of s032A_50) (wseg_append (wseg_of s032A_51) (wseg_append (wseg_of s032A_52) (wseg_append (wseg_of s032A_53) (wseg_append (wseg_of s032A_54) (wseg_append (wseg_of s032A_55) (wseg_append (wseg_of s032A_56) (wseg_append (wseg_of s032A_57) (wseg_of s032A_58))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s032B_0) (wseg_append (wseg_of s032B_1) (wseg_append (wseg_of s032B_2) (wseg_append (wseg_of s032B_3) (wseg_append (wseg_of s032B_4) (wseg_append (wseg_of s032B_5) (wseg_append (wseg_of s032B_6) (wseg_append (wseg_of s032B_7) (wseg_append (wseg_of s032B_8) (wseg_append (wseg_of s032B_9) (wseg_append (wseg_of s032B_10) (wseg_of s032B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t033A : List Tok := t033A_0 ++ (t033A_1 ++ (t033A_2 ++ (t033A_3 ++ (t033A_4 ++ (t033A_5 ++ (t033A_6 ++ (t033A_7 ++ (t033A_8 ++ (t033A_9 ++ (t033A_10 ++ (t033A_11 ++ (t033A_12 ++ (t033A_13 ++ (t033A_14 ++ (t033A_15 ++ (t033A_16 ++ (t033A_17 ++ (t033A_18 ++ (t033A_19 ++ (t033A_20 ++ (t033A_21 ++ (t033A_22 ++ (t033A_23 ++ (t033A_24 ++ (t033A_25 ++ (t033A_26 ++ (t033A_27 ++ (t033A_28 ++ (t033A_29 ++ (t033A_30 ++ (t033A_31 ++ (t033A_32 ++ (t033A_33 ++ (t033A_34 ++ (t033A_35 ++ (t033A_36 ++ (t033A_37 ++ (t033A_38 ++ (t033A_39 ++ (t033A_40 ++ (t033A_41 ++ (t033A_42 ++ (t033A_43 ++ (t033A_44 ++ (t033A_45 ++ (t033A_46 ++ (t033A_47 ++ (t033A_48 ++ (t033A_49 ++ (t033A_50 ++ (t033A_51 ++ (t033A_52 ++ (t033A_53 ++ (t033A_54 ++ (t033A_55 ++ (t033A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t033B : List Tok := t033B_0 ++ (t033B_1 ++ (t033B_2 ++ (t033B_3 ++ (t033B_4 ++ (t033B_5 ++ (t033B_6 ++ (t033B_7 ++ (t033B_8 ++ (t033B_9 ++ (t033B_10 ++ (t033B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 033：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run033 : (nbRun P nb033 0 kN033 t033A).1 = true ∧ (nbRun P nb033 1 kN033 t033B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s033A_0) (wseg_append (wseg_of s033A_1) (wseg_append (wseg_of s033A_2) (wseg_append (wseg_of s033A_3) (wseg_append (wseg_of s033A_4) (wseg_append (wseg_of s033A_5) (wseg_append (wseg_of s033A_6) (wseg_append (wseg_of s033A_7) (wseg_append (wseg_of s033A_8) (wseg_append (wseg_of s033A_9) (wseg_append (wseg_of s033A_10) (wseg_append (wseg_of s033A_11) (wseg_append (wseg_of s033A_12) (wseg_append (wseg_of s033A_13) (wseg_append (wseg_of s033A_14) (wseg_append (wseg_of s033A_15) (wseg_append (wseg_of s033A_16) (wseg_append (wseg_of s033A_17) (wseg_append (wseg_of s033A_18) (wseg_append (wseg_of s033A_19) (wseg_append (wseg_of s033A_20) (wseg_append (wseg_of s033A_21) (wseg_append (wseg_of s033A_22) (wseg_append (wseg_of s033A_23) (wseg_append (wseg_of s033A_24) (wseg_append (wseg_of s033A_25) (wseg_append (wseg_of s033A_26) (wseg_append (wseg_of s033A_27) (wseg_append (wseg_of s033A_28) (wseg_append (wseg_of s033A_29) (wseg_append (wseg_of s033A_30) (wseg_append (wseg_of s033A_31) (wseg_append (wseg_of s033A_32) (wseg_append (wseg_of s033A_33) (wseg_append (wseg_of s033A_34) (wseg_append (wseg_of s033A_35) (wseg_append (wseg_of s033A_36) (wseg_append (wseg_of s033A_37) (wseg_append (wseg_of s033A_38) (wseg_append (wseg_of s033A_39) (wseg_append (wseg_of s033A_40) (wseg_append (wseg_of s033A_41) (wseg_append (wseg_of s033A_42) (wseg_append (wseg_of s033A_43) (wseg_append (wseg_of s033A_44) (wseg_append (wseg_of s033A_45) (wseg_append (wseg_of s033A_46) (wseg_append (wseg_of s033A_47) (wseg_append (wseg_of s033A_48) (wseg_append (wseg_of s033A_49) (wseg_append (wseg_of s033A_50) (wseg_append (wseg_of s033A_51) (wseg_append (wseg_of s033A_52) (wseg_append (wseg_of s033A_53) (wseg_append (wseg_of s033A_54) (wseg_append (wseg_of s033A_55) (wseg_of s033A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s033B_0) (wseg_append (wseg_of s033B_1) (wseg_append (wseg_of s033B_2) (wseg_append (wseg_of s033B_3) (wseg_append (wseg_of s033B_4) (wseg_append (wseg_of s033B_5) (wseg_append (wseg_of s033B_6) (wseg_append (wseg_of s033B_7) (wseg_append (wseg_of s033B_8) (wseg_append (wseg_of s033B_9) (wseg_append (wseg_of s033B_10) (wseg_of s033B_11))))))))))))⟩

end PackLean.D40.Tet
