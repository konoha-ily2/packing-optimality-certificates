-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS021_0
import PackLean.D40.K.FarS021_1
import PackLean.D40.K.FarS021_2
import PackLean.D40.K.FarS021_3
import PackLean.D40.K.FarS021_4
import PackLean.D40.K.FarS021_5
import PackLean.D40.K.FarS021_6
import PackLean.D40.K.FarS021_7
import PackLean.D40.K.FarS021_8
import PackLean.D40.K.FarS021_9
import PackLean.D40.K.FarS021_10
import PackLean.D40.K.FarS021_11
import PackLean.D40.K.FarS021_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t066A : List Tok := t066A_0 ++ (t066A_1 ++ (t066A_2 ++ (t066A_3 ++ (t066A_4 ++ (t066A_5 ++ (t066A_6 ++ (t066A_7 ++ (t066A_8 ++ (t066A_9 ++ (t066A_10 ++ (t066A_11 ++ (t066A_12 ++ (t066A_13 ++ (t066A_14 ++ (t066A_15 ++ (t066A_16 ++ (t066A_17 ++ (t066A_18 ++ (t066A_19 ++ (t066A_20 ++ (t066A_21 ++ (t066A_22 ++ (t066A_23 ++ (t066A_24 ++ (t066A_25 ++ (t066A_26 ++ (t066A_27 ++ (t066A_28 ++ (t066A_29 ++ (t066A_30 ++ (t066A_31 ++ (t066A_32 ++ (t066A_33 ++ (t066A_34 ++ (t066A_35 ++ (t066A_36 ++ (t066A_37 ++ (t066A_38 ++ (t066A_39 ++ (t066A_40 ++ (t066A_41 ++ (t066A_42 ++ (t066A_43 ++ (t066A_44 ++ (t066A_45 ++ (t066A_46 ++ (t066A_47 ++ (t066A_48 ++ (t066A_49)))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t066B : List Tok := t066B_0 ++ (t066B_1 ++ (t066B_2 ++ (t066B_3 ++ (t066B_4 ++ (t066B_5 ++ (t066B_6 ++ (t066B_7 ++ (t066B_8 ++ (t066B_9 ++ (t066B_10 ++ (t066B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 066：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run066 : (nbRun P nb066 0 kN066 t066A).1 = true ∧ (nbRun P nb066 1 kN066 t066B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s066A_0) (wseg_append (wseg_of s066A_1) (wseg_append (wseg_of s066A_2) (wseg_append (wseg_of s066A_3) (wseg_append (wseg_of s066A_4) (wseg_append (wseg_of s066A_5) (wseg_append (wseg_of s066A_6) (wseg_append (wseg_of s066A_7) (wseg_append (wseg_of s066A_8) (wseg_append (wseg_of s066A_9) (wseg_append (wseg_of s066A_10) (wseg_append (wseg_of s066A_11) (wseg_append (wseg_of s066A_12) (wseg_append (wseg_of s066A_13) (wseg_append (wseg_of s066A_14) (wseg_append (wseg_of s066A_15) (wseg_append (wseg_of s066A_16) (wseg_append (wseg_of s066A_17) (wseg_append (wseg_of s066A_18) (wseg_append (wseg_of s066A_19) (wseg_append (wseg_of s066A_20) (wseg_append (wseg_of s066A_21) (wseg_append (wseg_of s066A_22) (wseg_append (wseg_of s066A_23) (wseg_append (wseg_of s066A_24) (wseg_append (wseg_of s066A_25) (wseg_append (wseg_of s066A_26) (wseg_append (wseg_of s066A_27) (wseg_append (wseg_of s066A_28) (wseg_append (wseg_of s066A_29) (wseg_append (wseg_of s066A_30) (wseg_append (wseg_of s066A_31) (wseg_append (wseg_of s066A_32) (wseg_append (wseg_of s066A_33) (wseg_append (wseg_of s066A_34) (wseg_append (wseg_of s066A_35) (wseg_append (wseg_of s066A_36) (wseg_append (wseg_of s066A_37) (wseg_append (wseg_of s066A_38) (wseg_append (wseg_of s066A_39) (wseg_append (wseg_of s066A_40) (wseg_append (wseg_of s066A_41) (wseg_append (wseg_of s066A_42) (wseg_append (wseg_of s066A_43) (wseg_append (wseg_of s066A_44) (wseg_append (wseg_of s066A_45) (wseg_append (wseg_of s066A_46) (wseg_append (wseg_of s066A_47) (wseg_append (wseg_of s066A_48) (wseg_of s066A_49)))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s066B_0) (wseg_append (wseg_of s066B_1) (wseg_append (wseg_of s066B_2) (wseg_append (wseg_of s066B_3) (wseg_append (wseg_of s066B_4) (wseg_append (wseg_of s066B_5) (wseg_append (wseg_of s066B_6) (wseg_append (wseg_of s066B_7) (wseg_append (wseg_of s066B_8) (wseg_append (wseg_of s066B_9) (wseg_append (wseg_of s066B_10) (wseg_of s066B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t067A : List Tok := t067A_0 ++ (t067A_1 ++ (t067A_2 ++ (t067A_3 ++ (t067A_4 ++ (t067A_5 ++ (t067A_6 ++ (t067A_7 ++ (t067A_8 ++ (t067A_9 ++ (t067A_10 ++ (t067A_11 ++ (t067A_12 ++ (t067A_13 ++ (t067A_14 ++ (t067A_15 ++ (t067A_16 ++ (t067A_17 ++ (t067A_18 ++ (t067A_19 ++ (t067A_20 ++ (t067A_21 ++ (t067A_22 ++ (t067A_23 ++ (t067A_24 ++ (t067A_25 ++ (t067A_26 ++ (t067A_27 ++ (t067A_28 ++ (t067A_29 ++ (t067A_30 ++ (t067A_31 ++ (t067A_32 ++ (t067A_33 ++ (t067A_34 ++ (t067A_35 ++ (t067A_36 ++ (t067A_37 ++ (t067A_38 ++ (t067A_39 ++ (t067A_40 ++ (t067A_41 ++ (t067A_42 ++ (t067A_43 ++ (t067A_44 ++ (t067A_45 ++ (t067A_46 ++ (t067A_47 ++ (t067A_48))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t067B : List Tok := t067B_0 ++ (t067B_1 ++ (t067B_2 ++ (t067B_3 ++ (t067B_4 ++ (t067B_5 ++ (t067B_6 ++ (t067B_7 ++ (t067B_8 ++ (t067B_9 ++ (t067B_10 ++ (t067B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 067：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run067 : (nbRun P nb067 0 kN067 t067A).1 = true ∧ (nbRun P nb067 1 kN067 t067B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s067A_0) (wseg_append (wseg_of s067A_1) (wseg_append (wseg_of s067A_2) (wseg_append (wseg_of s067A_3) (wseg_append (wseg_of s067A_4) (wseg_append (wseg_of s067A_5) (wseg_append (wseg_of s067A_6) (wseg_append (wseg_of s067A_7) (wseg_append (wseg_of s067A_8) (wseg_append (wseg_of s067A_9) (wseg_append (wseg_of s067A_10) (wseg_append (wseg_of s067A_11) (wseg_append (wseg_of s067A_12) (wseg_append (wseg_of s067A_13) (wseg_append (wseg_of s067A_14) (wseg_append (wseg_of s067A_15) (wseg_append (wseg_of s067A_16) (wseg_append (wseg_of s067A_17) (wseg_append (wseg_of s067A_18) (wseg_append (wseg_of s067A_19) (wseg_append (wseg_of s067A_20) (wseg_append (wseg_of s067A_21) (wseg_append (wseg_of s067A_22) (wseg_append (wseg_of s067A_23) (wseg_append (wseg_of s067A_24) (wseg_append (wseg_of s067A_25) (wseg_append (wseg_of s067A_26) (wseg_append (wseg_of s067A_27) (wseg_append (wseg_of s067A_28) (wseg_append (wseg_of s067A_29) (wseg_append (wseg_of s067A_30) (wseg_append (wseg_of s067A_31) (wseg_append (wseg_of s067A_32) (wseg_append (wseg_of s067A_33) (wseg_append (wseg_of s067A_34) (wseg_append (wseg_of s067A_35) (wseg_append (wseg_of s067A_36) (wseg_append (wseg_of s067A_37) (wseg_append (wseg_of s067A_38) (wseg_append (wseg_of s067A_39) (wseg_append (wseg_of s067A_40) (wseg_append (wseg_of s067A_41) (wseg_append (wseg_of s067A_42) (wseg_append (wseg_of s067A_43) (wseg_append (wseg_of s067A_44) (wseg_append (wseg_of s067A_45) (wseg_append (wseg_of s067A_46) (wseg_append (wseg_of s067A_47) (wseg_of s067A_48))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s067B_0) (wseg_append (wseg_of s067B_1) (wseg_append (wseg_of s067B_2) (wseg_append (wseg_of s067B_3) (wseg_append (wseg_of s067B_4) (wseg_append (wseg_of s067B_5) (wseg_append (wseg_of s067B_6) (wseg_append (wseg_of s067B_7) (wseg_append (wseg_of s067B_8) (wseg_append (wseg_of s067B_9) (wseg_append (wseg_of s067B_10) (wseg_of s067B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t068A : List Tok := t068A_0 ++ (t068A_1 ++ (t068A_2 ++ (t068A_3 ++ (t068A_4 ++ (t068A_5 ++ (t068A_6 ++ (t068A_7 ++ (t068A_8 ++ (t068A_9 ++ (t068A_10 ++ (t068A_11 ++ (t068A_12 ++ (t068A_13 ++ (t068A_14 ++ (t068A_15 ++ (t068A_16 ++ (t068A_17 ++ (t068A_18 ++ (t068A_19 ++ (t068A_20 ++ (t068A_21 ++ (t068A_22 ++ (t068A_23 ++ (t068A_24 ++ (t068A_25 ++ (t068A_26 ++ (t068A_27 ++ (t068A_28 ++ (t068A_29 ++ (t068A_30 ++ (t068A_31 ++ (t068A_32 ++ (t068A_33 ++ (t068A_34 ++ (t068A_35 ++ (t068A_36 ++ (t068A_37 ++ (t068A_38 ++ (t068A_39 ++ (t068A_40 ++ (t068A_41 ++ (t068A_42 ++ (t068A_43 ++ (t068A_44 ++ (t068A_45 ++ (t068A_46 ++ (t068A_47 ++ (t068A_48))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t068B : List Tok := t068B_0 ++ (t068B_1 ++ (t068B_2 ++ (t068B_3 ++ (t068B_4 ++ (t068B_5 ++ (t068B_6 ++ (t068B_7 ++ (t068B_8 ++ (t068B_9 ++ (t068B_10 ++ (t068B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 068：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run068 : (nbRun P nb068 0 kN068 t068A).1 = true ∧ (nbRun P nb068 1 kN068 t068B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s068A_0) (wseg_append (wseg_of s068A_1) (wseg_append (wseg_of s068A_2) (wseg_append (wseg_of s068A_3) (wseg_append (wseg_of s068A_4) (wseg_append (wseg_of s068A_5) (wseg_append (wseg_of s068A_6) (wseg_append (wseg_of s068A_7) (wseg_append (wseg_of s068A_8) (wseg_append (wseg_of s068A_9) (wseg_append (wseg_of s068A_10) (wseg_append (wseg_of s068A_11) (wseg_append (wseg_of s068A_12) (wseg_append (wseg_of s068A_13) (wseg_append (wseg_of s068A_14) (wseg_append (wseg_of s068A_15) (wseg_append (wseg_of s068A_16) (wseg_append (wseg_of s068A_17) (wseg_append (wseg_of s068A_18) (wseg_append (wseg_of s068A_19) (wseg_append (wseg_of s068A_20) (wseg_append (wseg_of s068A_21) (wseg_append (wseg_of s068A_22) (wseg_append (wseg_of s068A_23) (wseg_append (wseg_of s068A_24) (wseg_append (wseg_of s068A_25) (wseg_append (wseg_of s068A_26) (wseg_append (wseg_of s068A_27) (wseg_append (wseg_of s068A_28) (wseg_append (wseg_of s068A_29) (wseg_append (wseg_of s068A_30) (wseg_append (wseg_of s068A_31) (wseg_append (wseg_of s068A_32) (wseg_append (wseg_of s068A_33) (wseg_append (wseg_of s068A_34) (wseg_append (wseg_of s068A_35) (wseg_append (wseg_of s068A_36) (wseg_append (wseg_of s068A_37) (wseg_append (wseg_of s068A_38) (wseg_append (wseg_of s068A_39) (wseg_append (wseg_of s068A_40) (wseg_append (wseg_of s068A_41) (wseg_append (wseg_of s068A_42) (wseg_append (wseg_of s068A_43) (wseg_append (wseg_of s068A_44) (wseg_append (wseg_of s068A_45) (wseg_append (wseg_of s068A_46) (wseg_append (wseg_of s068A_47) (wseg_of s068A_48))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s068B_0) (wseg_append (wseg_of s068B_1) (wseg_append (wseg_of s068B_2) (wseg_append (wseg_of s068B_3) (wseg_append (wseg_of s068B_4) (wseg_append (wseg_of s068B_5) (wseg_append (wseg_of s068B_6) (wseg_append (wseg_of s068B_7) (wseg_append (wseg_of s068B_8) (wseg_append (wseg_of s068B_9) (wseg_append (wseg_of s068B_10) (wseg_of s068B_11))))))))))))⟩

end PackLean.D40.Tet
