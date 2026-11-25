-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS005_0
import PackLean.D40.K.FarS005_1
import PackLean.D40.K.FarS005_2
import PackLean.D40.K.FarS005_3
import PackLean.D40.K.FarS005_4
import PackLean.D40.K.FarS005_5
import PackLean.D40.K.FarS005_6
import PackLean.D40.K.FarS005_7
import PackLean.D40.K.FarS005_8
import PackLean.D40.K.FarS005_9
import PackLean.D40.K.FarS005_10
import PackLean.D40.K.FarS005_11
import PackLean.D40.K.FarS005_12
import PackLean.D40.K.FarS005_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t013A : List Tok := t013A_0 ++ (t013A_1 ++ (t013A_2 ++ (t013A_3 ++ (t013A_4 ++ (t013A_5 ++ (t013A_6 ++ (t013A_7 ++ (t013A_8 ++ (t013A_9 ++ (t013A_10 ++ (t013A_11 ++ (t013A_12 ++ (t013A_13 ++ (t013A_14 ++ (t013A_15 ++ (t013A_16 ++ (t013A_17 ++ (t013A_18 ++ (t013A_19 ++ (t013A_20 ++ (t013A_21 ++ (t013A_22 ++ (t013A_23 ++ (t013A_24 ++ (t013A_25 ++ (t013A_26 ++ (t013A_27 ++ (t013A_28 ++ (t013A_29 ++ (t013A_30 ++ (t013A_31 ++ (t013A_32 ++ (t013A_33 ++ (t013A_34 ++ (t013A_35 ++ (t013A_36 ++ (t013A_37 ++ (t013A_38 ++ (t013A_39 ++ (t013A_40 ++ (t013A_41 ++ (t013A_42 ++ (t013A_43 ++ (t013A_44 ++ (t013A_45 ++ (t013A_46 ++ (t013A_47 ++ (t013A_48 ++ (t013A_49 ++ (t013A_50 ++ (t013A_51 ++ (t013A_52 ++ (t013A_53 ++ (t013A_54 ++ (t013A_55 ++ (t013A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t013B : List Tok := t013B_0 ++ (t013B_1 ++ (t013B_2 ++ (t013B_3 ++ (t013B_4 ++ (t013B_5 ++ (t013B_6 ++ (t013B_7 ++ (t013B_8 ++ (t013B_9 ++ (t013B_10 ++ (t013B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 013：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run013 : (nbRun P nb013 0 kN013 t013A).1 = true ∧ (nbRun P nb013 1 kN013 t013B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s013A_0) (wseg_append (wseg_of s013A_1) (wseg_append (wseg_of s013A_2) (wseg_append (wseg_of s013A_3) (wseg_append (wseg_of s013A_4) (wseg_append (wseg_of s013A_5) (wseg_append (wseg_of s013A_6) (wseg_append (wseg_of s013A_7) (wseg_append (wseg_of s013A_8) (wseg_append (wseg_of s013A_9) (wseg_append (wseg_of s013A_10) (wseg_append (wseg_of s013A_11) (wseg_append (wseg_of s013A_12) (wseg_append (wseg_of s013A_13) (wseg_append (wseg_of s013A_14) (wseg_append (wseg_of s013A_15) (wseg_append (wseg_of s013A_16) (wseg_append (wseg_of s013A_17) (wseg_append (wseg_of s013A_18) (wseg_append (wseg_of s013A_19) (wseg_append (wseg_of s013A_20) (wseg_append (wseg_of s013A_21) (wseg_append (wseg_of s013A_22) (wseg_append (wseg_of s013A_23) (wseg_append (wseg_of s013A_24) (wseg_append (wseg_of s013A_25) (wseg_append (wseg_of s013A_26) (wseg_append (wseg_of s013A_27) (wseg_append (wseg_of s013A_28) (wseg_append (wseg_of s013A_29) (wseg_append (wseg_of s013A_30) (wseg_append (wseg_of s013A_31) (wseg_append (wseg_of s013A_32) (wseg_append (wseg_of s013A_33) (wseg_append (wseg_of s013A_34) (wseg_append (wseg_of s013A_35) (wseg_append (wseg_of s013A_36) (wseg_append (wseg_of s013A_37) (wseg_append (wseg_of s013A_38) (wseg_append (wseg_of s013A_39) (wseg_append (wseg_of s013A_40) (wseg_append (wseg_of s013A_41) (wseg_append (wseg_of s013A_42) (wseg_append (wseg_of s013A_43) (wseg_append (wseg_of s013A_44) (wseg_append (wseg_of s013A_45) (wseg_append (wseg_of s013A_46) (wseg_append (wseg_of s013A_47) (wseg_append (wseg_of s013A_48) (wseg_append (wseg_of s013A_49) (wseg_append (wseg_of s013A_50) (wseg_append (wseg_of s013A_51) (wseg_append (wseg_of s013A_52) (wseg_append (wseg_of s013A_53) (wseg_append (wseg_of s013A_54) (wseg_append (wseg_of s013A_55) (wseg_of s013A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s013B_0) (wseg_append (wseg_of s013B_1) (wseg_append (wseg_of s013B_2) (wseg_append (wseg_of s013B_3) (wseg_append (wseg_of s013B_4) (wseg_append (wseg_of s013B_5) (wseg_append (wseg_of s013B_6) (wseg_append (wseg_of s013B_7) (wseg_append (wseg_of s013B_8) (wseg_append (wseg_of s013B_9) (wseg_append (wseg_of s013B_10) (wseg_of s013B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t014A : List Tok := t014A_0 ++ (t014A_1 ++ (t014A_2 ++ (t014A_3 ++ (t014A_4 ++ (t014A_5 ++ (t014A_6 ++ (t014A_7 ++ (t014A_8 ++ (t014A_9 ++ (t014A_10 ++ (t014A_11 ++ (t014A_12 ++ (t014A_13 ++ (t014A_14 ++ (t014A_15 ++ (t014A_16 ++ (t014A_17 ++ (t014A_18 ++ (t014A_19 ++ (t014A_20 ++ (t014A_21 ++ (t014A_22 ++ (t014A_23 ++ (t014A_24 ++ (t014A_25 ++ (t014A_26 ++ (t014A_27 ++ (t014A_28 ++ (t014A_29 ++ (t014A_30 ++ (t014A_31 ++ (t014A_32 ++ (t014A_33 ++ (t014A_34 ++ (t014A_35 ++ (t014A_36 ++ (t014A_37 ++ (t014A_38 ++ (t014A_39 ++ (t014A_40 ++ (t014A_41 ++ (t014A_42 ++ (t014A_43 ++ (t014A_44 ++ (t014A_45 ++ (t014A_46 ++ (t014A_47 ++ (t014A_48 ++ (t014A_49 ++ (t014A_50 ++ (t014A_51 ++ (t014A_52 ++ (t014A_53 ++ (t014A_54 ++ (t014A_55 ++ (t014A_56 ++ (t014A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t014B : List Tok := t014B_0 ++ (t014B_1 ++ (t014B_2 ++ (t014B_3 ++ (t014B_4 ++ (t014B_5 ++ (t014B_6 ++ (t014B_7 ++ (t014B_8 ++ (t014B_9 ++ (t014B_10 ++ (t014B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 014：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run014 : (nbRun P nb014 0 kN014 t014A).1 = true ∧ (nbRun P nb014 1 kN014 t014B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s014A_0) (wseg_append (wseg_of s014A_1) (wseg_append (wseg_of s014A_2) (wseg_append (wseg_of s014A_3) (wseg_append (wseg_of s014A_4) (wseg_append (wseg_of s014A_5) (wseg_append (wseg_of s014A_6) (wseg_append (wseg_of s014A_7) (wseg_append (wseg_of s014A_8) (wseg_append (wseg_of s014A_9) (wseg_append (wseg_of s014A_10) (wseg_append (wseg_of s014A_11) (wseg_append (wseg_of s014A_12) (wseg_append (wseg_of s014A_13) (wseg_append (wseg_of s014A_14) (wseg_append (wseg_of s014A_15) (wseg_append (wseg_of s014A_16) (wseg_append (wseg_of s014A_17) (wseg_append (wseg_of s014A_18) (wseg_append (wseg_of s014A_19) (wseg_append (wseg_of s014A_20) (wseg_append (wseg_of s014A_21) (wseg_append (wseg_of s014A_22) (wseg_append (wseg_of s014A_23) (wseg_append (wseg_of s014A_24) (wseg_append (wseg_of s014A_25) (wseg_append (wseg_of s014A_26) (wseg_append (wseg_of s014A_27) (wseg_append (wseg_of s014A_28) (wseg_append (wseg_of s014A_29) (wseg_append (wseg_of s014A_30) (wseg_append (wseg_of s014A_31) (wseg_append (wseg_of s014A_32) (wseg_append (wseg_of s014A_33) (wseg_append (wseg_of s014A_34) (wseg_append (wseg_of s014A_35) (wseg_append (wseg_of s014A_36) (wseg_append (wseg_of s014A_37) (wseg_append (wseg_of s014A_38) (wseg_append (wseg_of s014A_39) (wseg_append (wseg_of s014A_40) (wseg_append (wseg_of s014A_41) (wseg_append (wseg_of s014A_42) (wseg_append (wseg_of s014A_43) (wseg_append (wseg_of s014A_44) (wseg_append (wseg_of s014A_45) (wseg_append (wseg_of s014A_46) (wseg_append (wseg_of s014A_47) (wseg_append (wseg_of s014A_48) (wseg_append (wseg_of s014A_49) (wseg_append (wseg_of s014A_50) (wseg_append (wseg_of s014A_51) (wseg_append (wseg_of s014A_52) (wseg_append (wseg_of s014A_53) (wseg_append (wseg_of s014A_54) (wseg_append (wseg_of s014A_55) (wseg_append (wseg_of s014A_56) (wseg_of s014A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s014B_0) (wseg_append (wseg_of s014B_1) (wseg_append (wseg_of s014B_2) (wseg_append (wseg_of s014B_3) (wseg_append (wseg_of s014B_4) (wseg_append (wseg_of s014B_5) (wseg_append (wseg_of s014B_6) (wseg_append (wseg_of s014B_7) (wseg_append (wseg_of s014B_8) (wseg_append (wseg_of s014B_9) (wseg_append (wseg_of s014B_10) (wseg_of s014B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t015A : List Tok := t015A_0 ++ (t015A_1 ++ (t015A_2 ++ (t015A_3 ++ (t015A_4 ++ (t015A_5 ++ (t015A_6 ++ (t015A_7 ++ (t015A_8 ++ (t015A_9 ++ (t015A_10 ++ (t015A_11 ++ (t015A_12 ++ (t015A_13 ++ (t015A_14 ++ (t015A_15 ++ (t015A_16 ++ (t015A_17 ++ (t015A_18 ++ (t015A_19 ++ (t015A_20 ++ (t015A_21 ++ (t015A_22 ++ (t015A_23 ++ (t015A_24 ++ (t015A_25 ++ (t015A_26 ++ (t015A_27 ++ (t015A_28 ++ (t015A_29 ++ (t015A_30 ++ (t015A_31 ++ (t015A_32 ++ (t015A_33 ++ (t015A_34 ++ (t015A_35 ++ (t015A_36 ++ (t015A_37 ++ (t015A_38 ++ (t015A_39 ++ (t015A_40 ++ (t015A_41 ++ (t015A_42 ++ (t015A_43 ++ (t015A_44 ++ (t015A_45 ++ (t015A_46 ++ (t015A_47 ++ (t015A_48 ++ (t015A_49 ++ (t015A_50 ++ (t015A_51 ++ (t015A_52 ++ (t015A_53 ++ (t015A_54 ++ (t015A_55 ++ (t015A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t015B : List Tok := t015B_0 ++ (t015B_1 ++ (t015B_2 ++ (t015B_3 ++ (t015B_4 ++ (t015B_5 ++ (t015B_6 ++ (t015B_7 ++ (t015B_8 ++ (t015B_9 ++ (t015B_10 ++ (t015B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 015：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run015 : (nbRun P nb015 0 kN015 t015A).1 = true ∧ (nbRun P nb015 1 kN015 t015B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s015A_0) (wseg_append (wseg_of s015A_1) (wseg_append (wseg_of s015A_2) (wseg_append (wseg_of s015A_3) (wseg_append (wseg_of s015A_4) (wseg_append (wseg_of s015A_5) (wseg_append (wseg_of s015A_6) (wseg_append (wseg_of s015A_7) (wseg_append (wseg_of s015A_8) (wseg_append (wseg_of s015A_9) (wseg_append (wseg_of s015A_10) (wseg_append (wseg_of s015A_11) (wseg_append (wseg_of s015A_12) (wseg_append (wseg_of s015A_13) (wseg_append (wseg_of s015A_14) (wseg_append (wseg_of s015A_15) (wseg_append (wseg_of s015A_16) (wseg_append (wseg_of s015A_17) (wseg_append (wseg_of s015A_18) (wseg_append (wseg_of s015A_19) (wseg_append (wseg_of s015A_20) (wseg_append (wseg_of s015A_21) (wseg_append (wseg_of s015A_22) (wseg_append (wseg_of s015A_23) (wseg_append (wseg_of s015A_24) (wseg_append (wseg_of s015A_25) (wseg_append (wseg_of s015A_26) (wseg_append (wseg_of s015A_27) (wseg_append (wseg_of s015A_28) (wseg_append (wseg_of s015A_29) (wseg_append (wseg_of s015A_30) (wseg_append (wseg_of s015A_31) (wseg_append (wseg_of s015A_32) (wseg_append (wseg_of s015A_33) (wseg_append (wseg_of s015A_34) (wseg_append (wseg_of s015A_35) (wseg_append (wseg_of s015A_36) (wseg_append (wseg_of s015A_37) (wseg_append (wseg_of s015A_38) (wseg_append (wseg_of s015A_39) (wseg_append (wseg_of s015A_40) (wseg_append (wseg_of s015A_41) (wseg_append (wseg_of s015A_42) (wseg_append (wseg_of s015A_43) (wseg_append (wseg_of s015A_44) (wseg_append (wseg_of s015A_45) (wseg_append (wseg_of s015A_46) (wseg_append (wseg_of s015A_47) (wseg_append (wseg_of s015A_48) (wseg_append (wseg_of s015A_49) (wseg_append (wseg_of s015A_50) (wseg_append (wseg_of s015A_51) (wseg_append (wseg_of s015A_52) (wseg_append (wseg_of s015A_53) (wseg_append (wseg_of s015A_54) (wseg_append (wseg_of s015A_55) (wseg_of s015A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s015B_0) (wseg_append (wseg_of s015B_1) (wseg_append (wseg_of s015B_2) (wseg_append (wseg_of s015B_3) (wseg_append (wseg_of s015B_4) (wseg_append (wseg_of s015B_5) (wseg_append (wseg_of s015B_6) (wseg_append (wseg_of s015B_7) (wseg_append (wseg_of s015B_8) (wseg_append (wseg_of s015B_9) (wseg_append (wseg_of s015B_10) (wseg_of s015B_11))))))))))))⟩

end PackLean.D40.Tet
