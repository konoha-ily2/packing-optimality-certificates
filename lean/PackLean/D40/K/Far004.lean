-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS004_0
import PackLean.D40.K.FarS004_1
import PackLean.D40.K.FarS004_2
import PackLean.D40.K.FarS004_3
import PackLean.D40.K.FarS004_4
import PackLean.D40.K.FarS004_5
import PackLean.D40.K.FarS004_6
import PackLean.D40.K.FarS004_7
import PackLean.D40.K.FarS004_8
import PackLean.D40.K.FarS004_9
import PackLean.D40.K.FarS004_10
import PackLean.D40.K.FarS004_11
import PackLean.D40.K.FarS004_12
import PackLean.D40.K.FarS004_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t010A : List Tok := t010A_0 ++ (t010A_1 ++ (t010A_2 ++ (t010A_3 ++ (t010A_4 ++ (t010A_5 ++ (t010A_6 ++ (t010A_7 ++ (t010A_8 ++ (t010A_9 ++ (t010A_10 ++ (t010A_11 ++ (t010A_12 ++ (t010A_13 ++ (t010A_14 ++ (t010A_15 ++ (t010A_16 ++ (t010A_17 ++ (t010A_18 ++ (t010A_19 ++ (t010A_20 ++ (t010A_21 ++ (t010A_22 ++ (t010A_23 ++ (t010A_24 ++ (t010A_25 ++ (t010A_26 ++ (t010A_27 ++ (t010A_28 ++ (t010A_29 ++ (t010A_30 ++ (t010A_31 ++ (t010A_32 ++ (t010A_33 ++ (t010A_34 ++ (t010A_35 ++ (t010A_36 ++ (t010A_37 ++ (t010A_38 ++ (t010A_39 ++ (t010A_40 ++ (t010A_41 ++ (t010A_42 ++ (t010A_43 ++ (t010A_44 ++ (t010A_45 ++ (t010A_46 ++ (t010A_47 ++ (t010A_48 ++ (t010A_49 ++ (t010A_50 ++ (t010A_51 ++ (t010A_52 ++ (t010A_53 ++ (t010A_54 ++ (t010A_55 ++ (t010A_56 ++ (t010A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t010B : List Tok := t010B_0 ++ (t010B_1 ++ (t010B_2 ++ (t010B_3 ++ (t010B_4 ++ (t010B_5 ++ (t010B_6 ++ (t010B_7 ++ (t010B_8 ++ (t010B_9 ++ (t010B_10 ++ (t010B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 010：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run010 : (nbRun P nb010 0 kN010 t010A).1 = true ∧ (nbRun P nb010 1 kN010 t010B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s010A_0) (wseg_append (wseg_of s010A_1) (wseg_append (wseg_of s010A_2) (wseg_append (wseg_of s010A_3) (wseg_append (wseg_of s010A_4) (wseg_append (wseg_of s010A_5) (wseg_append (wseg_of s010A_6) (wseg_append (wseg_of s010A_7) (wseg_append (wseg_of s010A_8) (wseg_append (wseg_of s010A_9) (wseg_append (wseg_of s010A_10) (wseg_append (wseg_of s010A_11) (wseg_append (wseg_of s010A_12) (wseg_append (wseg_of s010A_13) (wseg_append (wseg_of s010A_14) (wseg_append (wseg_of s010A_15) (wseg_append (wseg_of s010A_16) (wseg_append (wseg_of s010A_17) (wseg_append (wseg_of s010A_18) (wseg_append (wseg_of s010A_19) (wseg_append (wseg_of s010A_20) (wseg_append (wseg_of s010A_21) (wseg_append (wseg_of s010A_22) (wseg_append (wseg_of s010A_23) (wseg_append (wseg_of s010A_24) (wseg_append (wseg_of s010A_25) (wseg_append (wseg_of s010A_26) (wseg_append (wseg_of s010A_27) (wseg_append (wseg_of s010A_28) (wseg_append (wseg_of s010A_29) (wseg_append (wseg_of s010A_30) (wseg_append (wseg_of s010A_31) (wseg_append (wseg_of s010A_32) (wseg_append (wseg_of s010A_33) (wseg_append (wseg_of s010A_34) (wseg_append (wseg_of s010A_35) (wseg_append (wseg_of s010A_36) (wseg_append (wseg_of s010A_37) (wseg_append (wseg_of s010A_38) (wseg_append (wseg_of s010A_39) (wseg_append (wseg_of s010A_40) (wseg_append (wseg_of s010A_41) (wseg_append (wseg_of s010A_42) (wseg_append (wseg_of s010A_43) (wseg_append (wseg_of s010A_44) (wseg_append (wseg_of s010A_45) (wseg_append (wseg_of s010A_46) (wseg_append (wseg_of s010A_47) (wseg_append (wseg_of s010A_48) (wseg_append (wseg_of s010A_49) (wseg_append (wseg_of s010A_50) (wseg_append (wseg_of s010A_51) (wseg_append (wseg_of s010A_52) (wseg_append (wseg_of s010A_53) (wseg_append (wseg_of s010A_54) (wseg_append (wseg_of s010A_55) (wseg_append (wseg_of s010A_56) (wseg_of s010A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s010B_0) (wseg_append (wseg_of s010B_1) (wseg_append (wseg_of s010B_2) (wseg_append (wseg_of s010B_3) (wseg_append (wseg_of s010B_4) (wseg_append (wseg_of s010B_5) (wseg_append (wseg_of s010B_6) (wseg_append (wseg_of s010B_7) (wseg_append (wseg_of s010B_8) (wseg_append (wseg_of s010B_9) (wseg_append (wseg_of s010B_10) (wseg_of s010B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t011A : List Tok := t011A_0 ++ (t011A_1 ++ (t011A_2 ++ (t011A_3 ++ (t011A_4 ++ (t011A_5 ++ (t011A_6 ++ (t011A_7 ++ (t011A_8 ++ (t011A_9 ++ (t011A_10 ++ (t011A_11 ++ (t011A_12 ++ (t011A_13 ++ (t011A_14 ++ (t011A_15 ++ (t011A_16 ++ (t011A_17 ++ (t011A_18 ++ (t011A_19 ++ (t011A_20 ++ (t011A_21 ++ (t011A_22 ++ (t011A_23 ++ (t011A_24 ++ (t011A_25 ++ (t011A_26 ++ (t011A_27 ++ (t011A_28 ++ (t011A_29 ++ (t011A_30 ++ (t011A_31 ++ (t011A_32 ++ (t011A_33 ++ (t011A_34 ++ (t011A_35 ++ (t011A_36 ++ (t011A_37 ++ (t011A_38 ++ (t011A_39 ++ (t011A_40 ++ (t011A_41 ++ (t011A_42 ++ (t011A_43 ++ (t011A_44 ++ (t011A_45 ++ (t011A_46 ++ (t011A_47 ++ (t011A_48 ++ (t011A_49 ++ (t011A_50 ++ (t011A_51 ++ (t011A_52 ++ (t011A_53 ++ (t011A_54 ++ (t011A_55 ++ (t011A_56 ++ (t011A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t011B : List Tok := t011B_0 ++ (t011B_1 ++ (t011B_2 ++ (t011B_3 ++ (t011B_4 ++ (t011B_5 ++ (t011B_6 ++ (t011B_7 ++ (t011B_8 ++ (t011B_9 ++ (t011B_10 ++ (t011B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 011：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run011 : (nbRun P nb011 0 kN011 t011A).1 = true ∧ (nbRun P nb011 1 kN011 t011B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s011A_0) (wseg_append (wseg_of s011A_1) (wseg_append (wseg_of s011A_2) (wseg_append (wseg_of s011A_3) (wseg_append (wseg_of s011A_4) (wseg_append (wseg_of s011A_5) (wseg_append (wseg_of s011A_6) (wseg_append (wseg_of s011A_7) (wseg_append (wseg_of s011A_8) (wseg_append (wseg_of s011A_9) (wseg_append (wseg_of s011A_10) (wseg_append (wseg_of s011A_11) (wseg_append (wseg_of s011A_12) (wseg_append (wseg_of s011A_13) (wseg_append (wseg_of s011A_14) (wseg_append (wseg_of s011A_15) (wseg_append (wseg_of s011A_16) (wseg_append (wseg_of s011A_17) (wseg_append (wseg_of s011A_18) (wseg_append (wseg_of s011A_19) (wseg_append (wseg_of s011A_20) (wseg_append (wseg_of s011A_21) (wseg_append (wseg_of s011A_22) (wseg_append (wseg_of s011A_23) (wseg_append (wseg_of s011A_24) (wseg_append (wseg_of s011A_25) (wseg_append (wseg_of s011A_26) (wseg_append (wseg_of s011A_27) (wseg_append (wseg_of s011A_28) (wseg_append (wseg_of s011A_29) (wseg_append (wseg_of s011A_30) (wseg_append (wseg_of s011A_31) (wseg_append (wseg_of s011A_32) (wseg_append (wseg_of s011A_33) (wseg_append (wseg_of s011A_34) (wseg_append (wseg_of s011A_35) (wseg_append (wseg_of s011A_36) (wseg_append (wseg_of s011A_37) (wseg_append (wseg_of s011A_38) (wseg_append (wseg_of s011A_39) (wseg_append (wseg_of s011A_40) (wseg_append (wseg_of s011A_41) (wseg_append (wseg_of s011A_42) (wseg_append (wseg_of s011A_43) (wseg_append (wseg_of s011A_44) (wseg_append (wseg_of s011A_45) (wseg_append (wseg_of s011A_46) (wseg_append (wseg_of s011A_47) (wseg_append (wseg_of s011A_48) (wseg_append (wseg_of s011A_49) (wseg_append (wseg_of s011A_50) (wseg_append (wseg_of s011A_51) (wseg_append (wseg_of s011A_52) (wseg_append (wseg_of s011A_53) (wseg_append (wseg_of s011A_54) (wseg_append (wseg_of s011A_55) (wseg_append (wseg_of s011A_56) (wseg_of s011A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s011B_0) (wseg_append (wseg_of s011B_1) (wseg_append (wseg_of s011B_2) (wseg_append (wseg_of s011B_3) (wseg_append (wseg_of s011B_4) (wseg_append (wseg_of s011B_5) (wseg_append (wseg_of s011B_6) (wseg_append (wseg_of s011B_7) (wseg_append (wseg_of s011B_8) (wseg_append (wseg_of s011B_9) (wseg_append (wseg_of s011B_10) (wseg_of s011B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012A : List Tok := t012A_0 ++ (t012A_1 ++ (t012A_2 ++ (t012A_3 ++ (t012A_4 ++ (t012A_5 ++ (t012A_6 ++ (t012A_7 ++ (t012A_8 ++ (t012A_9 ++ (t012A_10 ++ (t012A_11 ++ (t012A_12 ++ (t012A_13 ++ (t012A_14 ++ (t012A_15 ++ (t012A_16 ++ (t012A_17 ++ (t012A_18 ++ (t012A_19 ++ (t012A_20 ++ (t012A_21 ++ (t012A_22 ++ (t012A_23 ++ (t012A_24 ++ (t012A_25 ++ (t012A_26 ++ (t012A_27 ++ (t012A_28 ++ (t012A_29 ++ (t012A_30 ++ (t012A_31 ++ (t012A_32 ++ (t012A_33 ++ (t012A_34 ++ (t012A_35 ++ (t012A_36 ++ (t012A_37 ++ (t012A_38 ++ (t012A_39 ++ (t012A_40 ++ (t012A_41 ++ (t012A_42 ++ (t012A_43 ++ (t012A_44 ++ (t012A_45 ++ (t012A_46 ++ (t012A_47 ++ (t012A_48 ++ (t012A_49 ++ (t012A_50 ++ (t012A_51 ++ (t012A_52 ++ (t012A_53 ++ (t012A_54 ++ (t012A_55 ++ (t012A_56 ++ (t012A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t012B : List Tok := t012B_0 ++ (t012B_1 ++ (t012B_2 ++ (t012B_3 ++ (t012B_4 ++ (t012B_5 ++ (t012B_6 ++ (t012B_7 ++ (t012B_8 ++ (t012B_9 ++ (t012B_10 ++ (t012B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 012：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run012 : (nbRun P nb012 0 kN012 t012A).1 = true ∧ (nbRun P nb012 1 kN012 t012B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s012A_0) (wseg_append (wseg_of s012A_1) (wseg_append (wseg_of s012A_2) (wseg_append (wseg_of s012A_3) (wseg_append (wseg_of s012A_4) (wseg_append (wseg_of s012A_5) (wseg_append (wseg_of s012A_6) (wseg_append (wseg_of s012A_7) (wseg_append (wseg_of s012A_8) (wseg_append (wseg_of s012A_9) (wseg_append (wseg_of s012A_10) (wseg_append (wseg_of s012A_11) (wseg_append (wseg_of s012A_12) (wseg_append (wseg_of s012A_13) (wseg_append (wseg_of s012A_14) (wseg_append (wseg_of s012A_15) (wseg_append (wseg_of s012A_16) (wseg_append (wseg_of s012A_17) (wseg_append (wseg_of s012A_18) (wseg_append (wseg_of s012A_19) (wseg_append (wseg_of s012A_20) (wseg_append (wseg_of s012A_21) (wseg_append (wseg_of s012A_22) (wseg_append (wseg_of s012A_23) (wseg_append (wseg_of s012A_24) (wseg_append (wseg_of s012A_25) (wseg_append (wseg_of s012A_26) (wseg_append (wseg_of s012A_27) (wseg_append (wseg_of s012A_28) (wseg_append (wseg_of s012A_29) (wseg_append (wseg_of s012A_30) (wseg_append (wseg_of s012A_31) (wseg_append (wseg_of s012A_32) (wseg_append (wseg_of s012A_33) (wseg_append (wseg_of s012A_34) (wseg_append (wseg_of s012A_35) (wseg_append (wseg_of s012A_36) (wseg_append (wseg_of s012A_37) (wseg_append (wseg_of s012A_38) (wseg_append (wseg_of s012A_39) (wseg_append (wseg_of s012A_40) (wseg_append (wseg_of s012A_41) (wseg_append (wseg_of s012A_42) (wseg_append (wseg_of s012A_43) (wseg_append (wseg_of s012A_44) (wseg_append (wseg_of s012A_45) (wseg_append (wseg_of s012A_46) (wseg_append (wseg_of s012A_47) (wseg_append (wseg_of s012A_48) (wseg_append (wseg_of s012A_49) (wseg_append (wseg_of s012A_50) (wseg_append (wseg_of s012A_51) (wseg_append (wseg_of s012A_52) (wseg_append (wseg_of s012A_53) (wseg_append (wseg_of s012A_54) (wseg_append (wseg_of s012A_55) (wseg_append (wseg_of s012A_56) (wseg_of s012A_57)))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s012B_0) (wseg_append (wseg_of s012B_1) (wseg_append (wseg_of s012B_2) (wseg_append (wseg_of s012B_3) (wseg_append (wseg_of s012B_4) (wseg_append (wseg_of s012B_5) (wseg_append (wseg_of s012B_6) (wseg_append (wseg_of s012B_7) (wseg_append (wseg_of s012B_8) (wseg_append (wseg_of s012B_9) (wseg_append (wseg_of s012B_10) (wseg_of s012B_11))))))))))))⟩

end PackLean.D40.Tet
