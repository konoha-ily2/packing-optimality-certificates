-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS006_0
import PackLean.D40.K.FarS006_1
import PackLean.D40.K.FarS006_2
import PackLean.D40.K.FarS006_3
import PackLean.D40.K.FarS006_4
import PackLean.D40.K.FarS006_5
import PackLean.D40.K.FarS006_6
import PackLean.D40.K.FarS006_7
import PackLean.D40.K.FarS006_8
import PackLean.D40.K.FarS006_9
import PackLean.D40.K.FarS006_10
import PackLean.D40.K.FarS006_11
import PackLean.D40.K.FarS006_12
import PackLean.D40.K.FarS006_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t016A : List Tok := t016A_0 ++ (t016A_1 ++ (t016A_2 ++ (t016A_3 ++ (t016A_4 ++ (t016A_5 ++ (t016A_6 ++ (t016A_7 ++ (t016A_8 ++ (t016A_9 ++ (t016A_10 ++ (t016A_11 ++ (t016A_12 ++ (t016A_13 ++ (t016A_14 ++ (t016A_15 ++ (t016A_16 ++ (t016A_17 ++ (t016A_18 ++ (t016A_19 ++ (t016A_20 ++ (t016A_21 ++ (t016A_22 ++ (t016A_23 ++ (t016A_24 ++ (t016A_25 ++ (t016A_26 ++ (t016A_27 ++ (t016A_28 ++ (t016A_29 ++ (t016A_30 ++ (t016A_31 ++ (t016A_32 ++ (t016A_33 ++ (t016A_34 ++ (t016A_35 ++ (t016A_36 ++ (t016A_37 ++ (t016A_38 ++ (t016A_39 ++ (t016A_40 ++ (t016A_41 ++ (t016A_42 ++ (t016A_43 ++ (t016A_44 ++ (t016A_45 ++ (t016A_46 ++ (t016A_47 ++ (t016A_48 ++ (t016A_49 ++ (t016A_50 ++ (t016A_51 ++ (t016A_52 ++ (t016A_53 ++ (t016A_54 ++ (t016A_55 ++ (t016A_56 ++ (t016A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t016B : List Tok := t016B_0 ++ (t016B_1 ++ (t016B_2 ++ (t016B_3 ++ (t016B_4 ++ (t016B_5 ++ (t016B_6 ++ (t016B_7 ++ (t016B_8 ++ (t016B_9 ++ (t016B_10 ++ (t016B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 016：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run016 : (nbRun P nb016 0 kN016 t016A).1 = true ∧ (nbRun P nb016 1 kN016 t016B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s016A_0) (wseg_append (wseg_of s016A_1) (wseg_append (wseg_of s016A_2) (wseg_append (wseg_of s016A_3) (wseg_append (wseg_of s016A_4) (wseg_append (wseg_of s016A_5) (wseg_append (wseg_of s016A_6) (wseg_append (wseg_of s016A_7) (wseg_append (wseg_of s016A_8) (wseg_append (wseg_of s016A_9) (wseg_append (wseg_of s016A_10) (wseg_append (wseg_of s016A_11) (wseg_append (wseg_of s016A_12) (wseg_append (wseg_of s016A_13) (wseg_append (wseg_of s016A_14) (wseg_append (wseg_of s016A_15) (wseg_append (wseg_of s016A_16) (wseg_append (wseg_of s016A_17) (wseg_append (wseg_of s016A_18) (wseg_append (wseg_of s016A_19) (wseg_append (wseg_of s016A_20) (wseg_append (wseg_of s016A_21) (wseg_append (wseg_of s016A_22) (wseg_append (wseg_of s016A_23) (wseg_append (wseg_of s016A_24) (wseg_append (wseg_of s016A_25) (wseg_append (wseg_of s016A_26) (wseg_append (wseg_of s016A_27) (wseg_append (wseg_of s016A_28) (wseg_append (wseg_of s016A_29) (wseg_append (wseg_of s016A_30) (wseg_append (wseg_of s016A_31) (wseg_append (wseg_of s016A_32) (wseg_append (wseg_of s016A_33) (wseg_append (wseg_of s016A_34) (wseg_append (wseg_of s016A_35) (wseg_append (wseg_of s016A_36) (wseg_append (wseg_of s016A_37) (wseg_append (wseg_of s016A_38) (wseg_append (wseg_of s016A_39) (wseg_append (wseg_of s016A_40) (wseg_append (wseg_of s016A_41) (wseg_append (wseg_of s016A_42) (wseg_append (wseg_of s016A_43) (wseg_append (wseg_of s016A_44) (wseg_append (wseg_of s016A_45) (wseg_append (wseg_of s016A_46) (wseg_append (wseg_of s016A_47) (wseg_append (wseg_of s016A_48) (wseg_append (wseg_of s016A_49) (wseg_append (wseg_of s016A_50) (wseg_append (wseg_of s016A_51) (wseg_append (wseg_of s016A_52) (wseg_append (wseg_of s016A_53) (wseg_append (wseg_of s016A_54) (wseg_append (wseg_of s016A_55) (wseg_append (wseg_of s016A_56) (wseg_of s016A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s016B_0) (wseg_append (wseg_of s016B_1) (wseg_append (wseg_of s016B_2) (wseg_append (wseg_of s016B_3) (wseg_append (wseg_of s016B_4) (wseg_append (wseg_of s016B_5) (wseg_append (wseg_of s016B_6) (wseg_append (wseg_of s016B_7) (wseg_append (wseg_of s016B_8) (wseg_append (wseg_of s016B_9) (wseg_append (wseg_of s016B_10) (wseg_of s016B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t017A : List Tok := t017A_0 ++ (t017A_1 ++ (t017A_2 ++ (t017A_3 ++ (t017A_4 ++ (t017A_5 ++ (t017A_6 ++ (t017A_7 ++ (t017A_8 ++ (t017A_9 ++ (t017A_10 ++ (t017A_11 ++ (t017A_12 ++ (t017A_13 ++ (t017A_14 ++ (t017A_15 ++ (t017A_16 ++ (t017A_17 ++ (t017A_18 ++ (t017A_19 ++ (t017A_20 ++ (t017A_21 ++ (t017A_22 ++ (t017A_23 ++ (t017A_24 ++ (t017A_25 ++ (t017A_26 ++ (t017A_27 ++ (t017A_28 ++ (t017A_29 ++ (t017A_30 ++ (t017A_31 ++ (t017A_32 ++ (t017A_33 ++ (t017A_34 ++ (t017A_35 ++ (t017A_36 ++ (t017A_37 ++ (t017A_38 ++ (t017A_39 ++ (t017A_40 ++ (t017A_41 ++ (t017A_42 ++ (t017A_43 ++ (t017A_44 ++ (t017A_45 ++ (t017A_46 ++ (t017A_47 ++ (t017A_48 ++ (t017A_49 ++ (t017A_50 ++ (t017A_51 ++ (t017A_52 ++ (t017A_53 ++ (t017A_54 ++ (t017A_55 ++ (t017A_56 ++ (t017A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t017B : List Tok := t017B_0 ++ (t017B_1 ++ (t017B_2 ++ (t017B_3 ++ (t017B_4 ++ (t017B_5 ++ (t017B_6 ++ (t017B_7 ++ (t017B_8 ++ (t017B_9 ++ (t017B_10 ++ (t017B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 017：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run017 : (nbRun P nb017 0 kN017 t017A).1 = true ∧ (nbRun P nb017 1 kN017 t017B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s017A_0) (wseg_append (wseg_of s017A_1) (wseg_append (wseg_of s017A_2) (wseg_append (wseg_of s017A_3) (wseg_append (wseg_of s017A_4) (wseg_append (wseg_of s017A_5) (wseg_append (wseg_of s017A_6) (wseg_append (wseg_of s017A_7) (wseg_append (wseg_of s017A_8) (wseg_append (wseg_of s017A_9) (wseg_append (wseg_of s017A_10) (wseg_append (wseg_of s017A_11) (wseg_append (wseg_of s017A_12) (wseg_append (wseg_of s017A_13) (wseg_append (wseg_of s017A_14) (wseg_append (wseg_of s017A_15) (wseg_append (wseg_of s017A_16) (wseg_append (wseg_of s017A_17) (wseg_append (wseg_of s017A_18) (wseg_append (wseg_of s017A_19) (wseg_append (wseg_of s017A_20) (wseg_append (wseg_of s017A_21) (wseg_append (wseg_of s017A_22) (wseg_append (wseg_of s017A_23) (wseg_append (wseg_of s017A_24) (wseg_append (wseg_of s017A_25) (wseg_append (wseg_of s017A_26) (wseg_append (wseg_of s017A_27) (wseg_append (wseg_of s017A_28) (wseg_append (wseg_of s017A_29) (wseg_append (wseg_of s017A_30) (wseg_append (wseg_of s017A_31) (wseg_append (wseg_of s017A_32) (wseg_append (wseg_of s017A_33) (wseg_append (wseg_of s017A_34) (wseg_append (wseg_of s017A_35) (wseg_append (wseg_of s017A_36) (wseg_append (wseg_of s017A_37) (wseg_append (wseg_of s017A_38) (wseg_append (wseg_of s017A_39) (wseg_append (wseg_of s017A_40) (wseg_append (wseg_of s017A_41) (wseg_append (wseg_of s017A_42) (wseg_append (wseg_of s017A_43) (wseg_append (wseg_of s017A_44) (wseg_append (wseg_of s017A_45) (wseg_append (wseg_of s017A_46) (wseg_append (wseg_of s017A_47) (wseg_append (wseg_of s017A_48) (wseg_append (wseg_of s017A_49) (wseg_append (wseg_of s017A_50) (wseg_append (wseg_of s017A_51) (wseg_append (wseg_of s017A_52) (wseg_append (wseg_of s017A_53) (wseg_append (wseg_of s017A_54) (wseg_append (wseg_of s017A_55) (wseg_append (wseg_of s017A_56) (wseg_of s017A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s017B_0) (wseg_append (wseg_of s017B_1) (wseg_append (wseg_of s017B_2) (wseg_append (wseg_of s017B_3) (wseg_append (wseg_of s017B_4) (wseg_append (wseg_of s017B_5) (wseg_append (wseg_of s017B_6) (wseg_append (wseg_of s017B_7) (wseg_append (wseg_of s017B_8) (wseg_append (wseg_of s017B_9) (wseg_append (wseg_of s017B_10) (wseg_of s017B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t018A : List Tok := t018A_0 ++ (t018A_1 ++ (t018A_2 ++ (t018A_3 ++ (t018A_4 ++ (t018A_5 ++ (t018A_6 ++ (t018A_7 ++ (t018A_8 ++ (t018A_9 ++ (t018A_10 ++ (t018A_11 ++ (t018A_12 ++ (t018A_13 ++ (t018A_14 ++ (t018A_15 ++ (t018A_16 ++ (t018A_17 ++ (t018A_18 ++ (t018A_19 ++ (t018A_20 ++ (t018A_21 ++ (t018A_22 ++ (t018A_23 ++ (t018A_24 ++ (t018A_25 ++ (t018A_26 ++ (t018A_27 ++ (t018A_28 ++ (t018A_29 ++ (t018A_30 ++ (t018A_31 ++ (t018A_32 ++ (t018A_33 ++ (t018A_34 ++ (t018A_35 ++ (t018A_36 ++ (t018A_37 ++ (t018A_38 ++ (t018A_39 ++ (t018A_40 ++ (t018A_41 ++ (t018A_42 ++ (t018A_43 ++ (t018A_44 ++ (t018A_45 ++ (t018A_46 ++ (t018A_47 ++ (t018A_48 ++ (t018A_49 ++ (t018A_50 ++ (t018A_51 ++ (t018A_52 ++ (t018A_53 ++ (t018A_54 ++ (t018A_55 ++ (t018A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t018B : List Tok := t018B_0 ++ (t018B_1 ++ (t018B_2 ++ (t018B_3 ++ (t018B_4 ++ (t018B_5 ++ (t018B_6 ++ (t018B_7 ++ (t018B_8 ++ (t018B_9 ++ (t018B_10 ++ (t018B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 018：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run018 : (nbRun P nb018 0 kN018 t018A).1 = true ∧ (nbRun P nb018 1 kN018 t018B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s018A_0) (wseg_append (wseg_of s018A_1) (wseg_append (wseg_of s018A_2) (wseg_append (wseg_of s018A_3) (wseg_append (wseg_of s018A_4) (wseg_append (wseg_of s018A_5) (wseg_append (wseg_of s018A_6) (wseg_append (wseg_of s018A_7) (wseg_append (wseg_of s018A_8) (wseg_append (wseg_of s018A_9) (wseg_append (wseg_of s018A_10) (wseg_append (wseg_of s018A_11) (wseg_append (wseg_of s018A_12) (wseg_append (wseg_of s018A_13) (wseg_append (wseg_of s018A_14) (wseg_append (wseg_of s018A_15) (wseg_append (wseg_of s018A_16) (wseg_append (wseg_of s018A_17) (wseg_append (wseg_of s018A_18) (wseg_append (wseg_of s018A_19) (wseg_append (wseg_of s018A_20) (wseg_append (wseg_of s018A_21) (wseg_append (wseg_of s018A_22) (wseg_append (wseg_of s018A_23) (wseg_append (wseg_of s018A_24) (wseg_append (wseg_of s018A_25) (wseg_append (wseg_of s018A_26) (wseg_append (wseg_of s018A_27) (wseg_append (wseg_of s018A_28) (wseg_append (wseg_of s018A_29) (wseg_append (wseg_of s018A_30) (wseg_append (wseg_of s018A_31) (wseg_append (wseg_of s018A_32) (wseg_append (wseg_of s018A_33) (wseg_append (wseg_of s018A_34) (wseg_append (wseg_of s018A_35) (wseg_append (wseg_of s018A_36) (wseg_append (wseg_of s018A_37) (wseg_append (wseg_of s018A_38) (wseg_append (wseg_of s018A_39) (wseg_append (wseg_of s018A_40) (wseg_append (wseg_of s018A_41) (wseg_append (wseg_of s018A_42) (wseg_append (wseg_of s018A_43) (wseg_append (wseg_of s018A_44) (wseg_append (wseg_of s018A_45) (wseg_append (wseg_of s018A_46) (wseg_append (wseg_of s018A_47) (wseg_append (wseg_of s018A_48) (wseg_append (wseg_of s018A_49) (wseg_append (wseg_of s018A_50) (wseg_append (wseg_of s018A_51) (wseg_append (wseg_of s018A_52) (wseg_append (wseg_of s018A_53) (wseg_append (wseg_of s018A_54) (wseg_append (wseg_of s018A_55) (wseg_of s018A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s018B_0) (wseg_append (wseg_of s018B_1) (wseg_append (wseg_of s018B_2) (wseg_append (wseg_of s018B_3) (wseg_append (wseg_of s018B_4) (wseg_append (wseg_of s018B_5) (wseg_append (wseg_of s018B_6) (wseg_append (wseg_of s018B_7) (wseg_append (wseg_of s018B_8) (wseg_append (wseg_of s018B_9) (wseg_append (wseg_of s018B_10) (wseg_of s018B_11))))))))))))⟩

end PackLean.D40.Tet
