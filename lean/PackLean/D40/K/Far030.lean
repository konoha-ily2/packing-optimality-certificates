-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS030_0
import PackLean.D40.K.FarS030_1
import PackLean.D40.K.FarS030_2
import PackLean.D40.K.FarS030_3
import PackLean.D40.K.FarS030_4
import PackLean.D40.K.FarS030_5
import PackLean.D40.K.FarS030_6
import PackLean.D40.K.FarS030_7
import PackLean.D40.K.FarS030_8
import PackLean.D40.K.FarS030_9
import PackLean.D40.K.FarS030_10
import PackLean.D40.K.FarS030_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t093A : List Tok := t093A_0 ++ (t093A_1 ++ (t093A_2 ++ (t093A_3 ++ (t093A_4 ++ (t093A_5 ++ (t093A_6 ++ (t093A_7 ++ (t093A_8 ++ (t093A_9 ++ (t093A_10 ++ (t093A_11 ++ (t093A_12 ++ (t093A_13 ++ (t093A_14 ++ (t093A_15 ++ (t093A_16 ++ (t093A_17 ++ (t093A_18 ++ (t093A_19 ++ (t093A_20 ++ (t093A_21 ++ (t093A_22 ++ (t093A_23 ++ (t093A_24 ++ (t093A_25 ++ (t093A_26 ++ (t093A_27 ++ (t093A_28 ++ (t093A_29 ++ (t093A_30 ++ (t093A_31 ++ (t093A_32 ++ (t093A_33 ++ (t093A_34 ++ (t093A_35 ++ (t093A_36 ++ (t093A_37 ++ (t093A_38 ++ (t093A_39 ++ (t093A_40 ++ (t093A_41 ++ (t093A_42 ++ (t093A_43 ++ (t093A_44 ++ (t093A_45 ++ (t093A_46 ++ (t093A_47 ++ (t093A_48 ++ (t093A_49 ++ (t093A_50 ++ (t093A_51 ++ (t093A_52 ++ (t093A_53 ++ (t093A_54 ++ (t093A_55 ++ (t093A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t093B : List Tok := t093B_0 ++ (t093B_1 ++ (t093B_2 ++ (t093B_3 ++ (t093B_4 ++ (t093B_5 ++ (t093B_6 ++ (t093B_7 ++ (t093B_8 ++ (t093B_9 ++ (t093B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 093：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run093 : (nbRun P nb093 0 kN093 t093A).1 = true ∧ (nbRun P nb093 1 kN093 t093B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s093A_0) (wseg_append (wseg_of s093A_1) (wseg_append (wseg_of s093A_2) (wseg_append (wseg_of s093A_3) (wseg_append (wseg_of s093A_4) (wseg_append (wseg_of s093A_5) (wseg_append (wseg_of s093A_6) (wseg_append (wseg_of s093A_7) (wseg_append (wseg_of s093A_8) (wseg_append (wseg_of s093A_9) (wseg_append (wseg_of s093A_10) (wseg_append (wseg_of s093A_11) (wseg_append (wseg_of s093A_12) (wseg_append (wseg_of s093A_13) (wseg_append (wseg_of s093A_14) (wseg_append (wseg_of s093A_15) (wseg_append (wseg_of s093A_16) (wseg_append (wseg_of s093A_17) (wseg_append (wseg_of s093A_18) (wseg_append (wseg_of s093A_19) (wseg_append (wseg_of s093A_20) (wseg_append (wseg_of s093A_21) (wseg_append (wseg_of s093A_22) (wseg_append (wseg_of s093A_23) (wseg_append (wseg_of s093A_24) (wseg_append (wseg_of s093A_25) (wseg_append (wseg_of s093A_26) (wseg_append (wseg_of s093A_27) (wseg_append (wseg_of s093A_28) (wseg_append (wseg_of s093A_29) (wseg_append (wseg_of s093A_30) (wseg_append (wseg_of s093A_31) (wseg_append (wseg_of s093A_32) (wseg_append (wseg_of s093A_33) (wseg_append (wseg_of s093A_34) (wseg_append (wseg_of s093A_35) (wseg_append (wseg_of s093A_36) (wseg_append (wseg_of s093A_37) (wseg_append (wseg_of s093A_38) (wseg_append (wseg_of s093A_39) (wseg_append (wseg_of s093A_40) (wseg_append (wseg_of s093A_41) (wseg_append (wseg_of s093A_42) (wseg_append (wseg_of s093A_43) (wseg_append (wseg_of s093A_44) (wseg_append (wseg_of s093A_45) (wseg_append (wseg_of s093A_46) (wseg_append (wseg_of s093A_47) (wseg_append (wseg_of s093A_48) (wseg_append (wseg_of s093A_49) (wseg_append (wseg_of s093A_50) (wseg_append (wseg_of s093A_51) (wseg_append (wseg_of s093A_52) (wseg_append (wseg_of s093A_53) (wseg_append (wseg_of s093A_54) (wseg_append (wseg_of s093A_55) (wseg_of s093A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s093B_0) (wseg_append (wseg_of s093B_1) (wseg_append (wseg_of s093B_2) (wseg_append (wseg_of s093B_3) (wseg_append (wseg_of s093B_4) (wseg_append (wseg_of s093B_5) (wseg_append (wseg_of s093B_6) (wseg_append (wseg_of s093B_7) (wseg_append (wseg_of s093B_8) (wseg_append (wseg_of s093B_9) (wseg_of s093B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t094A : List Tok := t094A_0 ++ (t094A_1 ++ (t094A_2 ++ (t094A_3 ++ (t094A_4 ++ (t094A_5 ++ (t094A_6 ++ (t094A_7 ++ (t094A_8 ++ (t094A_9 ++ (t094A_10 ++ (t094A_11 ++ (t094A_12 ++ (t094A_13 ++ (t094A_14 ++ (t094A_15 ++ (t094A_16 ++ (t094A_17 ++ (t094A_18 ++ (t094A_19 ++ (t094A_20 ++ (t094A_21 ++ (t094A_22 ++ (t094A_23 ++ (t094A_24 ++ (t094A_25 ++ (t094A_26 ++ (t094A_27 ++ (t094A_28 ++ (t094A_29 ++ (t094A_30 ++ (t094A_31 ++ (t094A_32 ++ (t094A_33 ++ (t094A_34 ++ (t094A_35 ++ (t094A_36 ++ (t094A_37 ++ (t094A_38 ++ (t094A_39 ++ (t094A_40 ++ (t094A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t094B : List Tok := t094B_0 ++ (t094B_1 ++ (t094B_2 ++ (t094B_3 ++ (t094B_4 ++ (t094B_5 ++ (t094B_6 ++ (t094B_7 ++ (t094B_8 ++ (t094B_9 ++ (t094B_10 ++ (t094B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 094：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run094 : (nbRun P nb094 0 kN094 t094A).1 = true ∧ (nbRun P nb094 1 kN094 t094B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s094A_0) (wseg_append (wseg_of s094A_1) (wseg_append (wseg_of s094A_2) (wseg_append (wseg_of s094A_3) (wseg_append (wseg_of s094A_4) (wseg_append (wseg_of s094A_5) (wseg_append (wseg_of s094A_6) (wseg_append (wseg_of s094A_7) (wseg_append (wseg_of s094A_8) (wseg_append (wseg_of s094A_9) (wseg_append (wseg_of s094A_10) (wseg_append (wseg_of s094A_11) (wseg_append (wseg_of s094A_12) (wseg_append (wseg_of s094A_13) (wseg_append (wseg_of s094A_14) (wseg_append (wseg_of s094A_15) (wseg_append (wseg_of s094A_16) (wseg_append (wseg_of s094A_17) (wseg_append (wseg_of s094A_18) (wseg_append (wseg_of s094A_19) (wseg_append (wseg_of s094A_20) (wseg_append (wseg_of s094A_21) (wseg_append (wseg_of s094A_22) (wseg_append (wseg_of s094A_23) (wseg_append (wseg_of s094A_24) (wseg_append (wseg_of s094A_25) (wseg_append (wseg_of s094A_26) (wseg_append (wseg_of s094A_27) (wseg_append (wseg_of s094A_28) (wseg_append (wseg_of s094A_29) (wseg_append (wseg_of s094A_30) (wseg_append (wseg_of s094A_31) (wseg_append (wseg_of s094A_32) (wseg_append (wseg_of s094A_33) (wseg_append (wseg_of s094A_34) (wseg_append (wseg_of s094A_35) (wseg_append (wseg_of s094A_36) (wseg_append (wseg_of s094A_37) (wseg_append (wseg_of s094A_38) (wseg_append (wseg_of s094A_39) (wseg_append (wseg_of s094A_40) (wseg_of s094A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s094B_0) (wseg_append (wseg_of s094B_1) (wseg_append (wseg_of s094B_2) (wseg_append (wseg_of s094B_3) (wseg_append (wseg_of s094B_4) (wseg_append (wseg_of s094B_5) (wseg_append (wseg_of s094B_6) (wseg_append (wseg_of s094B_7) (wseg_append (wseg_of s094B_8) (wseg_append (wseg_of s094B_9) (wseg_append (wseg_of s094B_10) (wseg_of s094B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t095A : List Tok := t095A_0 ++ (t095A_1 ++ (t095A_2 ++ (t095A_3 ++ (t095A_4 ++ (t095A_5 ++ (t095A_6 ++ (t095A_7 ++ (t095A_8 ++ (t095A_9 ++ (t095A_10 ++ (t095A_11 ++ (t095A_12 ++ (t095A_13 ++ (t095A_14 ++ (t095A_15 ++ (t095A_16 ++ (t095A_17 ++ (t095A_18 ++ (t095A_19 ++ (t095A_20 ++ (t095A_21 ++ (t095A_22 ++ (t095A_23 ++ (t095A_24 ++ (t095A_25 ++ (t095A_26 ++ (t095A_27 ++ (t095A_28 ++ (t095A_29 ++ (t095A_30 ++ (t095A_31 ++ (t095A_32 ++ (t095A_33 ++ (t095A_34 ++ (t095A_35 ++ (t095A_36 ++ (t095A_37 ++ (t095A_38 ++ (t095A_39 ++ (t095A_40 ++ (t095A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t095B : List Tok := t095B_0 ++ (t095B_1 ++ (t095B_2 ++ (t095B_3 ++ (t095B_4 ++ (t095B_5 ++ (t095B_6 ++ (t095B_7 ++ (t095B_8 ++ (t095B_9 ++ (t095B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 095：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run095 : (nbRun P nb095 0 kN095 t095A).1 = true ∧ (nbRun P nb095 1 kN095 t095B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s095A_0) (wseg_append (wseg_of s095A_1) (wseg_append (wseg_of s095A_2) (wseg_append (wseg_of s095A_3) (wseg_append (wseg_of s095A_4) (wseg_append (wseg_of s095A_5) (wseg_append (wseg_of s095A_6) (wseg_append (wseg_of s095A_7) (wseg_append (wseg_of s095A_8) (wseg_append (wseg_of s095A_9) (wseg_append (wseg_of s095A_10) (wseg_append (wseg_of s095A_11) (wseg_append (wseg_of s095A_12) (wseg_append (wseg_of s095A_13) (wseg_append (wseg_of s095A_14) (wseg_append (wseg_of s095A_15) (wseg_append (wseg_of s095A_16) (wseg_append (wseg_of s095A_17) (wseg_append (wseg_of s095A_18) (wseg_append (wseg_of s095A_19) (wseg_append (wseg_of s095A_20) (wseg_append (wseg_of s095A_21) (wseg_append (wseg_of s095A_22) (wseg_append (wseg_of s095A_23) (wseg_append (wseg_of s095A_24) (wseg_append (wseg_of s095A_25) (wseg_append (wseg_of s095A_26) (wseg_append (wseg_of s095A_27) (wseg_append (wseg_of s095A_28) (wseg_append (wseg_of s095A_29) (wseg_append (wseg_of s095A_30) (wseg_append (wseg_of s095A_31) (wseg_append (wseg_of s095A_32) (wseg_append (wseg_of s095A_33) (wseg_append (wseg_of s095A_34) (wseg_append (wseg_of s095A_35) (wseg_append (wseg_of s095A_36) (wseg_append (wseg_of s095A_37) (wseg_append (wseg_of s095A_38) (wseg_append (wseg_of s095A_39) (wseg_append (wseg_of s095A_40) (wseg_of s095A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s095B_0) (wseg_append (wseg_of s095B_1) (wseg_append (wseg_of s095B_2) (wseg_append (wseg_of s095B_3) (wseg_append (wseg_of s095B_4) (wseg_append (wseg_of s095B_5) (wseg_append (wseg_of s095B_6) (wseg_append (wseg_of s095B_7) (wseg_append (wseg_of s095B_8) (wseg_append (wseg_of s095B_9) (wseg_of s095B_10)))))))))))⟩

end PackLean.D40.Tet
