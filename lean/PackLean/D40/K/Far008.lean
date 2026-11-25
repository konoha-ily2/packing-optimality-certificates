-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS008_0
import PackLean.D40.K.FarS008_1
import PackLean.D40.K.FarS008_2
import PackLean.D40.K.FarS008_3
import PackLean.D40.K.FarS008_4
import PackLean.D40.K.FarS008_5
import PackLean.D40.K.FarS008_6
import PackLean.D40.K.FarS008_7
import PackLean.D40.K.FarS008_8
import PackLean.D40.K.FarS008_9
import PackLean.D40.K.FarS008_10
import PackLean.D40.K.FarS008_11
import PackLean.D40.K.FarS008_12
import PackLean.D40.K.FarS008_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t022A : List Tok := t022A_0 ++ (t022A_1 ++ (t022A_2 ++ (t022A_3 ++ (t022A_4 ++ (t022A_5 ++ (t022A_6 ++ (t022A_7 ++ (t022A_8 ++ (t022A_9 ++ (t022A_10 ++ (t022A_11 ++ (t022A_12 ++ (t022A_13 ++ (t022A_14 ++ (t022A_15 ++ (t022A_16 ++ (t022A_17 ++ (t022A_18 ++ (t022A_19 ++ (t022A_20 ++ (t022A_21 ++ (t022A_22 ++ (t022A_23 ++ (t022A_24 ++ (t022A_25 ++ (t022A_26 ++ (t022A_27 ++ (t022A_28 ++ (t022A_29 ++ (t022A_30 ++ (t022A_31 ++ (t022A_32 ++ (t022A_33 ++ (t022A_34 ++ (t022A_35 ++ (t022A_36 ++ (t022A_37 ++ (t022A_38 ++ (t022A_39 ++ (t022A_40 ++ (t022A_41 ++ (t022A_42 ++ (t022A_43 ++ (t022A_44 ++ (t022A_45 ++ (t022A_46 ++ (t022A_47 ++ (t022A_48 ++ (t022A_49 ++ (t022A_50 ++ (t022A_51 ++ (t022A_52 ++ (t022A_53 ++ (t022A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t022B : List Tok := t022B_0 ++ (t022B_1 ++ (t022B_2 ++ (t022B_3 ++ (t022B_4 ++ (t022B_5 ++ (t022B_6 ++ (t022B_7 ++ (t022B_8 ++ (t022B_9 ++ (t022B_10 ++ (t022B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 022：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run022 : (nbRun P nb022 0 kN022 t022A).1 = true ∧ (nbRun P nb022 1 kN022 t022B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s022A_0) (wseg_append (wseg_of s022A_1) (wseg_append (wseg_of s022A_2) (wseg_append (wseg_of s022A_3) (wseg_append (wseg_of s022A_4) (wseg_append (wseg_of s022A_5) (wseg_append (wseg_of s022A_6) (wseg_append (wseg_of s022A_7) (wseg_append (wseg_of s022A_8) (wseg_append (wseg_of s022A_9) (wseg_append (wseg_of s022A_10) (wseg_append (wseg_of s022A_11) (wseg_append (wseg_of s022A_12) (wseg_append (wseg_of s022A_13) (wseg_append (wseg_of s022A_14) (wseg_append (wseg_of s022A_15) (wseg_append (wseg_of s022A_16) (wseg_append (wseg_of s022A_17) (wseg_append (wseg_of s022A_18) (wseg_append (wseg_of s022A_19) (wseg_append (wseg_of s022A_20) (wseg_append (wseg_of s022A_21) (wseg_append (wseg_of s022A_22) (wseg_append (wseg_of s022A_23) (wseg_append (wseg_of s022A_24) (wseg_append (wseg_of s022A_25) (wseg_append (wseg_of s022A_26) (wseg_append (wseg_of s022A_27) (wseg_append (wseg_of s022A_28) (wseg_append (wseg_of s022A_29) (wseg_append (wseg_of s022A_30) (wseg_append (wseg_of s022A_31) (wseg_append (wseg_of s022A_32) (wseg_append (wseg_of s022A_33) (wseg_append (wseg_of s022A_34) (wseg_append (wseg_of s022A_35) (wseg_append (wseg_of s022A_36) (wseg_append (wseg_of s022A_37) (wseg_append (wseg_of s022A_38) (wseg_append (wseg_of s022A_39) (wseg_append (wseg_of s022A_40) (wseg_append (wseg_of s022A_41) (wseg_append (wseg_of s022A_42) (wseg_append (wseg_of s022A_43) (wseg_append (wseg_of s022A_44) (wseg_append (wseg_of s022A_45) (wseg_append (wseg_of s022A_46) (wseg_append (wseg_of s022A_47) (wseg_append (wseg_of s022A_48) (wseg_append (wseg_of s022A_49) (wseg_append (wseg_of s022A_50) (wseg_append (wseg_of s022A_51) (wseg_append (wseg_of s022A_52) (wseg_append (wseg_of s022A_53) (wseg_of s022A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s022B_0) (wseg_append (wseg_of s022B_1) (wseg_append (wseg_of s022B_2) (wseg_append (wseg_of s022B_3) (wseg_append (wseg_of s022B_4) (wseg_append (wseg_of s022B_5) (wseg_append (wseg_of s022B_6) (wseg_append (wseg_of s022B_7) (wseg_append (wseg_of s022B_8) (wseg_append (wseg_of s022B_9) (wseg_append (wseg_of s022B_10) (wseg_of s022B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023A : List Tok := t023A_0 ++ (t023A_1 ++ (t023A_2 ++ (t023A_3 ++ (t023A_4 ++ (t023A_5 ++ (t023A_6 ++ (t023A_7 ++ (t023A_8 ++ (t023A_9 ++ (t023A_10 ++ (t023A_11 ++ (t023A_12 ++ (t023A_13 ++ (t023A_14 ++ (t023A_15 ++ (t023A_16 ++ (t023A_17 ++ (t023A_18 ++ (t023A_19 ++ (t023A_20 ++ (t023A_21 ++ (t023A_22 ++ (t023A_23 ++ (t023A_24 ++ (t023A_25 ++ (t023A_26 ++ (t023A_27 ++ (t023A_28 ++ (t023A_29 ++ (t023A_30 ++ (t023A_31 ++ (t023A_32 ++ (t023A_33 ++ (t023A_34 ++ (t023A_35 ++ (t023A_36 ++ (t023A_37 ++ (t023A_38 ++ (t023A_39 ++ (t023A_40 ++ (t023A_41 ++ (t023A_42 ++ (t023A_43 ++ (t023A_44 ++ (t023A_45 ++ (t023A_46 ++ (t023A_47 ++ (t023A_48 ++ (t023A_49 ++ (t023A_50 ++ (t023A_51 ++ (t023A_52 ++ (t023A_53 ++ (t023A_54 ++ (t023A_55 ++ (t023A_56 ++ (t023A_57 ++ (t023A_58 ++ (t023A_59 ++ (t023A_60))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t023B : List Tok := t023B_0 ++ (t023B_1 ++ (t023B_2 ++ (t023B_3 ++ (t023B_4 ++ (t023B_5 ++ (t023B_6 ++ (t023B_7 ++ (t023B_8 ++ (t023B_9 ++ (t023B_10 ++ (t023B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 023：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run023 : (nbRun P nb023 0 kN023 t023A).1 = true ∧ (nbRun P nb023 1 kN023 t023B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s023A_0) (wseg_append (wseg_of s023A_1) (wseg_append (wseg_of s023A_2) (wseg_append (wseg_of s023A_3) (wseg_append (wseg_of s023A_4) (wseg_append (wseg_of s023A_5) (wseg_append (wseg_of s023A_6) (wseg_append (wseg_of s023A_7) (wseg_append (wseg_of s023A_8) (wseg_append (wseg_of s023A_9) (wseg_append (wseg_of s023A_10) (wseg_append (wseg_of s023A_11) (wseg_append (wseg_of s023A_12) (wseg_append (wseg_of s023A_13) (wseg_append (wseg_of s023A_14) (wseg_append (wseg_of s023A_15) (wseg_append (wseg_of s023A_16) (wseg_append (wseg_of s023A_17) (wseg_append (wseg_of s023A_18) (wseg_append (wseg_of s023A_19) (wseg_append (wseg_of s023A_20) (wseg_append (wseg_of s023A_21) (wseg_append (wseg_of s023A_22) (wseg_append (wseg_of s023A_23) (wseg_append (wseg_of s023A_24) (wseg_append (wseg_of s023A_25) (wseg_append (wseg_of s023A_26) (wseg_append (wseg_of s023A_27) (wseg_append (wseg_of s023A_28) (wseg_append (wseg_of s023A_29) (wseg_append (wseg_of s023A_30) (wseg_append (wseg_of s023A_31) (wseg_append (wseg_of s023A_32) (wseg_append (wseg_of s023A_33) (wseg_append (wseg_of s023A_34) (wseg_append (wseg_of s023A_35) (wseg_append (wseg_of s023A_36) (wseg_append (wseg_of s023A_37) (wseg_append (wseg_of s023A_38) (wseg_append (wseg_of s023A_39) (wseg_append (wseg_of s023A_40) (wseg_append (wseg_of s023A_41) (wseg_append (wseg_of s023A_42) (wseg_append (wseg_of s023A_43) (wseg_append (wseg_of s023A_44) (wseg_append (wseg_of s023A_45) (wseg_append (wseg_of s023A_46) (wseg_append (wseg_of s023A_47) (wseg_append (wseg_of s023A_48) (wseg_append (wseg_of s023A_49) (wseg_append (wseg_of s023A_50) (wseg_append (wseg_of s023A_51) (wseg_append (wseg_of s023A_52) (wseg_append (wseg_of s023A_53) (wseg_append (wseg_of s023A_54) (wseg_append (wseg_of s023A_55) (wseg_append (wseg_of s023A_56) (wseg_append (wseg_of s023A_57) (wseg_append (wseg_of s023A_58) (wseg_append (wseg_of s023A_59) (wseg_of s023A_60))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s023B_0) (wseg_append (wseg_of s023B_1) (wseg_append (wseg_of s023B_2) (wseg_append (wseg_of s023B_3) (wseg_append (wseg_of s023B_4) (wseg_append (wseg_of s023B_5) (wseg_append (wseg_of s023B_6) (wseg_append (wseg_of s023B_7) (wseg_append (wseg_of s023B_8) (wseg_append (wseg_of s023B_9) (wseg_append (wseg_of s023B_10) (wseg_of s023B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024A : List Tok := t024A_0 ++ (t024A_1 ++ (t024A_2 ++ (t024A_3 ++ (t024A_4 ++ (t024A_5 ++ (t024A_6 ++ (t024A_7 ++ (t024A_8 ++ (t024A_9 ++ (t024A_10 ++ (t024A_11 ++ (t024A_12 ++ (t024A_13 ++ (t024A_14 ++ (t024A_15 ++ (t024A_16 ++ (t024A_17 ++ (t024A_18 ++ (t024A_19 ++ (t024A_20 ++ (t024A_21 ++ (t024A_22 ++ (t024A_23 ++ (t024A_24 ++ (t024A_25 ++ (t024A_26 ++ (t024A_27 ++ (t024A_28 ++ (t024A_29 ++ (t024A_30 ++ (t024A_31 ++ (t024A_32 ++ (t024A_33 ++ (t024A_34 ++ (t024A_35 ++ (t024A_36 ++ (t024A_37 ++ (t024A_38 ++ (t024A_39 ++ (t024A_40 ++ (t024A_41 ++ (t024A_42 ++ (t024A_43 ++ (t024A_44 ++ (t024A_45 ++ (t024A_46 ++ (t024A_47 ++ (t024A_48 ++ (t024A_49 ++ (t024A_50 ++ (t024A_51 ++ (t024A_52 ++ (t024A_53 ++ (t024A_54 ++ (t024A_55 ++ (t024A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t024B : List Tok := t024B_0 ++ (t024B_1 ++ (t024B_2 ++ (t024B_3 ++ (t024B_4 ++ (t024B_5 ++ (t024B_6 ++ (t024B_7 ++ (t024B_8 ++ (t024B_9 ++ (t024B_10 ++ (t024B_11 ++ (t024B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 024：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run024 : (nbRun P nb024 0 kN024 t024A).1 = true ∧ (nbRun P nb024 1 kN024 t024B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s024A_0) (wseg_append (wseg_of s024A_1) (wseg_append (wseg_of s024A_2) (wseg_append (wseg_of s024A_3) (wseg_append (wseg_of s024A_4) (wseg_append (wseg_of s024A_5) (wseg_append (wseg_of s024A_6) (wseg_append (wseg_of s024A_7) (wseg_append (wseg_of s024A_8) (wseg_append (wseg_of s024A_9) (wseg_append (wseg_of s024A_10) (wseg_append (wseg_of s024A_11) (wseg_append (wseg_of s024A_12) (wseg_append (wseg_of s024A_13) (wseg_append (wseg_of s024A_14) (wseg_append (wseg_of s024A_15) (wseg_append (wseg_of s024A_16) (wseg_append (wseg_of s024A_17) (wseg_append (wseg_of s024A_18) (wseg_append (wseg_of s024A_19) (wseg_append (wseg_of s024A_20) (wseg_append (wseg_of s024A_21) (wseg_append (wseg_of s024A_22) (wseg_append (wseg_of s024A_23) (wseg_append (wseg_of s024A_24) (wseg_append (wseg_of s024A_25) (wseg_append (wseg_of s024A_26) (wseg_append (wseg_of s024A_27) (wseg_append (wseg_of s024A_28) (wseg_append (wseg_of s024A_29) (wseg_append (wseg_of s024A_30) (wseg_append (wseg_of s024A_31) (wseg_append (wseg_of s024A_32) (wseg_append (wseg_of s024A_33) (wseg_append (wseg_of s024A_34) (wseg_append (wseg_of s024A_35) (wseg_append (wseg_of s024A_36) (wseg_append (wseg_of s024A_37) (wseg_append (wseg_of s024A_38) (wseg_append (wseg_of s024A_39) (wseg_append (wseg_of s024A_40) (wseg_append (wseg_of s024A_41) (wseg_append (wseg_of s024A_42) (wseg_append (wseg_of s024A_43) (wseg_append (wseg_of s024A_44) (wseg_append (wseg_of s024A_45) (wseg_append (wseg_of s024A_46) (wseg_append (wseg_of s024A_47) (wseg_append (wseg_of s024A_48) (wseg_append (wseg_of s024A_49) (wseg_append (wseg_of s024A_50) (wseg_append (wseg_of s024A_51) (wseg_append (wseg_of s024A_52) (wseg_append (wseg_of s024A_53) (wseg_append (wseg_of s024A_54) (wseg_append (wseg_of s024A_55) (wseg_of s024A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s024B_0) (wseg_append (wseg_of s024B_1) (wseg_append (wseg_of s024B_2) (wseg_append (wseg_of s024B_3) (wseg_append (wseg_of s024B_4) (wseg_append (wseg_of s024B_5) (wseg_append (wseg_of s024B_6) (wseg_append (wseg_of s024B_7) (wseg_append (wseg_of s024B_8) (wseg_append (wseg_of s024B_9) (wseg_append (wseg_of s024B_10) (wseg_append (wseg_of s024B_11) (wseg_of s024B_12)))))))))))))⟩

end PackLean.D40.Tet
