-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS022_0
import PackLean.D40.K.FarS022_1
import PackLean.D40.K.FarS022_2
import PackLean.D40.K.FarS022_3
import PackLean.D40.K.FarS022_4
import PackLean.D40.K.FarS022_5
import PackLean.D40.K.FarS022_6
import PackLean.D40.K.FarS022_7
import PackLean.D40.K.FarS022_8
import PackLean.D40.K.FarS022_9
import PackLean.D40.K.FarS022_10
import PackLean.D40.K.FarS022_11
import PackLean.D40.K.FarS022_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t069A : List Tok := t069A_0 ++ (t069A_1 ++ (t069A_2 ++ (t069A_3 ++ (t069A_4 ++ (t069A_5 ++ (t069A_6 ++ (t069A_7 ++ (t069A_8 ++ (t069A_9 ++ (t069A_10 ++ (t069A_11 ++ (t069A_12 ++ (t069A_13 ++ (t069A_14 ++ (t069A_15 ++ (t069A_16 ++ (t069A_17 ++ (t069A_18 ++ (t069A_19 ++ (t069A_20 ++ (t069A_21 ++ (t069A_22 ++ (t069A_23 ++ (t069A_24 ++ (t069A_25 ++ (t069A_26 ++ (t069A_27 ++ (t069A_28 ++ (t069A_29 ++ (t069A_30 ++ (t069A_31 ++ (t069A_32 ++ (t069A_33 ++ (t069A_34 ++ (t069A_35 ++ (t069A_36 ++ (t069A_37 ++ (t069A_38 ++ (t069A_39 ++ (t069A_40 ++ (t069A_41 ++ (t069A_42 ++ (t069A_43 ++ (t069A_44 ++ (t069A_45 ++ (t069A_46 ++ (t069A_47 ++ (t069A_48 ++ (t069A_49)))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t069B : List Tok := t069B_0 ++ (t069B_1 ++ (t069B_2 ++ (t069B_3 ++ (t069B_4 ++ (t069B_5 ++ (t069B_6 ++ (t069B_7 ++ (t069B_8 ++ (t069B_9 ++ (t069B_10 ++ (t069B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 069：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run069 : (nbRun P nb069 0 kN069 t069A).1 = true ∧ (nbRun P nb069 1 kN069 t069B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s069A_0) (wseg_append (wseg_of s069A_1) (wseg_append (wseg_of s069A_2) (wseg_append (wseg_of s069A_3) (wseg_append (wseg_of s069A_4) (wseg_append (wseg_of s069A_5) (wseg_append (wseg_of s069A_6) (wseg_append (wseg_of s069A_7) (wseg_append (wseg_of s069A_8) (wseg_append (wseg_of s069A_9) (wseg_append (wseg_of s069A_10) (wseg_append (wseg_of s069A_11) (wseg_append (wseg_of s069A_12) (wseg_append (wseg_of s069A_13) (wseg_append (wseg_of s069A_14) (wseg_append (wseg_of s069A_15) (wseg_append (wseg_of s069A_16) (wseg_append (wseg_of s069A_17) (wseg_append (wseg_of s069A_18) (wseg_append (wseg_of s069A_19) (wseg_append (wseg_of s069A_20) (wseg_append (wseg_of s069A_21) (wseg_append (wseg_of s069A_22) (wseg_append (wseg_of s069A_23) (wseg_append (wseg_of s069A_24) (wseg_append (wseg_of s069A_25) (wseg_append (wseg_of s069A_26) (wseg_append (wseg_of s069A_27) (wseg_append (wseg_of s069A_28) (wseg_append (wseg_of s069A_29) (wseg_append (wseg_of s069A_30) (wseg_append (wseg_of s069A_31) (wseg_append (wseg_of s069A_32) (wseg_append (wseg_of s069A_33) (wseg_append (wseg_of s069A_34) (wseg_append (wseg_of s069A_35) (wseg_append (wseg_of s069A_36) (wseg_append (wseg_of s069A_37) (wseg_append (wseg_of s069A_38) (wseg_append (wseg_of s069A_39) (wseg_append (wseg_of s069A_40) (wseg_append (wseg_of s069A_41) (wseg_append (wseg_of s069A_42) (wseg_append (wseg_of s069A_43) (wseg_append (wseg_of s069A_44) (wseg_append (wseg_of s069A_45) (wseg_append (wseg_of s069A_46) (wseg_append (wseg_of s069A_47) (wseg_append (wseg_of s069A_48) (wseg_of s069A_49)))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s069B_0) (wseg_append (wseg_of s069B_1) (wseg_append (wseg_of s069B_2) (wseg_append (wseg_of s069B_3) (wseg_append (wseg_of s069B_4) (wseg_append (wseg_of s069B_5) (wseg_append (wseg_of s069B_6) (wseg_append (wseg_of s069B_7) (wseg_append (wseg_of s069B_8) (wseg_append (wseg_of s069B_9) (wseg_append (wseg_of s069B_10) (wseg_of s069B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070A : List Tok := t070A_0 ++ (t070A_1 ++ (t070A_2 ++ (t070A_3 ++ (t070A_4 ++ (t070A_5 ++ (t070A_6 ++ (t070A_7 ++ (t070A_8 ++ (t070A_9 ++ (t070A_10 ++ (t070A_11 ++ (t070A_12 ++ (t070A_13 ++ (t070A_14 ++ (t070A_15 ++ (t070A_16 ++ (t070A_17 ++ (t070A_18 ++ (t070A_19 ++ (t070A_20 ++ (t070A_21 ++ (t070A_22 ++ (t070A_23 ++ (t070A_24 ++ (t070A_25 ++ (t070A_26 ++ (t070A_27 ++ (t070A_28 ++ (t070A_29 ++ (t070A_30 ++ (t070A_31 ++ (t070A_32 ++ (t070A_33 ++ (t070A_34 ++ (t070A_35 ++ (t070A_36 ++ (t070A_37 ++ (t070A_38 ++ (t070A_39 ++ (t070A_40 ++ (t070A_41 ++ (t070A_42 ++ (t070A_43 ++ (t070A_44 ++ (t070A_45 ++ (t070A_46 ++ (t070A_47 ++ (t070A_48))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t070B : List Tok := t070B_0 ++ (t070B_1 ++ (t070B_2 ++ (t070B_3 ++ (t070B_4 ++ (t070B_5 ++ (t070B_6 ++ (t070B_7 ++ (t070B_8 ++ (t070B_9 ++ (t070B_10 ++ (t070B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 070：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run070 : (nbRun P nb070 0 kN070 t070A).1 = true ∧ (nbRun P nb070 1 kN070 t070B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s070A_0) (wseg_append (wseg_of s070A_1) (wseg_append (wseg_of s070A_2) (wseg_append (wseg_of s070A_3) (wseg_append (wseg_of s070A_4) (wseg_append (wseg_of s070A_5) (wseg_append (wseg_of s070A_6) (wseg_append (wseg_of s070A_7) (wseg_append (wseg_of s070A_8) (wseg_append (wseg_of s070A_9) (wseg_append (wseg_of s070A_10) (wseg_append (wseg_of s070A_11) (wseg_append (wseg_of s070A_12) (wseg_append (wseg_of s070A_13) (wseg_append (wseg_of s070A_14) (wseg_append (wseg_of s070A_15) (wseg_append (wseg_of s070A_16) (wseg_append (wseg_of s070A_17) (wseg_append (wseg_of s070A_18) (wseg_append (wseg_of s070A_19) (wseg_append (wseg_of s070A_20) (wseg_append (wseg_of s070A_21) (wseg_append (wseg_of s070A_22) (wseg_append (wseg_of s070A_23) (wseg_append (wseg_of s070A_24) (wseg_append (wseg_of s070A_25) (wseg_append (wseg_of s070A_26) (wseg_append (wseg_of s070A_27) (wseg_append (wseg_of s070A_28) (wseg_append (wseg_of s070A_29) (wseg_append (wseg_of s070A_30) (wseg_append (wseg_of s070A_31) (wseg_append (wseg_of s070A_32) (wseg_append (wseg_of s070A_33) (wseg_append (wseg_of s070A_34) (wseg_append (wseg_of s070A_35) (wseg_append (wseg_of s070A_36) (wseg_append (wseg_of s070A_37) (wseg_append (wseg_of s070A_38) (wseg_append (wseg_of s070A_39) (wseg_append (wseg_of s070A_40) (wseg_append (wseg_of s070A_41) (wseg_append (wseg_of s070A_42) (wseg_append (wseg_of s070A_43) (wseg_append (wseg_of s070A_44) (wseg_append (wseg_of s070A_45) (wseg_append (wseg_of s070A_46) (wseg_append (wseg_of s070A_47) (wseg_of s070A_48))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s070B_0) (wseg_append (wseg_of s070B_1) (wseg_append (wseg_of s070B_2) (wseg_append (wseg_of s070B_3) (wseg_append (wseg_of s070B_4) (wseg_append (wseg_of s070B_5) (wseg_append (wseg_of s070B_6) (wseg_append (wseg_of s070B_7) (wseg_append (wseg_of s070B_8) (wseg_append (wseg_of s070B_9) (wseg_append (wseg_of s070B_10) (wseg_of s070B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t071A : List Tok := t071A_0 ++ (t071A_1 ++ (t071A_2 ++ (t071A_3 ++ (t071A_4 ++ (t071A_5 ++ (t071A_6 ++ (t071A_7 ++ (t071A_8 ++ (t071A_9 ++ (t071A_10 ++ (t071A_11 ++ (t071A_12 ++ (t071A_13 ++ (t071A_14 ++ (t071A_15 ++ (t071A_16 ++ (t071A_17 ++ (t071A_18 ++ (t071A_19 ++ (t071A_20 ++ (t071A_21 ++ (t071A_22 ++ (t071A_23 ++ (t071A_24 ++ (t071A_25 ++ (t071A_26 ++ (t071A_27 ++ (t071A_28 ++ (t071A_29 ++ (t071A_30 ++ (t071A_31 ++ (t071A_32 ++ (t071A_33 ++ (t071A_34 ++ (t071A_35 ++ (t071A_36 ++ (t071A_37 ++ (t071A_38 ++ (t071A_39 ++ (t071A_40 ++ (t071A_41 ++ (t071A_42 ++ (t071A_43 ++ (t071A_44 ++ (t071A_45 ++ (t071A_46 ++ (t071A_47 ++ (t071A_48 ++ (t071A_49)))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t071B : List Tok := t071B_0 ++ (t071B_1 ++ (t071B_2 ++ (t071B_3 ++ (t071B_4 ++ (t071B_5 ++ (t071B_6 ++ (t071B_7 ++ (t071B_8 ++ (t071B_9 ++ (t071B_10 ++ (t071B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 071：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run071 : (nbRun P nb071 0 kN071 t071A).1 = true ∧ (nbRun P nb071 1 kN071 t071B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s071A_0) (wseg_append (wseg_of s071A_1) (wseg_append (wseg_of s071A_2) (wseg_append (wseg_of s071A_3) (wseg_append (wseg_of s071A_4) (wseg_append (wseg_of s071A_5) (wseg_append (wseg_of s071A_6) (wseg_append (wseg_of s071A_7) (wseg_append (wseg_of s071A_8) (wseg_append (wseg_of s071A_9) (wseg_append (wseg_of s071A_10) (wseg_append (wseg_of s071A_11) (wseg_append (wseg_of s071A_12) (wseg_append (wseg_of s071A_13) (wseg_append (wseg_of s071A_14) (wseg_append (wseg_of s071A_15) (wseg_append (wseg_of s071A_16) (wseg_append (wseg_of s071A_17) (wseg_append (wseg_of s071A_18) (wseg_append (wseg_of s071A_19) (wseg_append (wseg_of s071A_20) (wseg_append (wseg_of s071A_21) (wseg_append (wseg_of s071A_22) (wseg_append (wseg_of s071A_23) (wseg_append (wseg_of s071A_24) (wseg_append (wseg_of s071A_25) (wseg_append (wseg_of s071A_26) (wseg_append (wseg_of s071A_27) (wseg_append (wseg_of s071A_28) (wseg_append (wseg_of s071A_29) (wseg_append (wseg_of s071A_30) (wseg_append (wseg_of s071A_31) (wseg_append (wseg_of s071A_32) (wseg_append (wseg_of s071A_33) (wseg_append (wseg_of s071A_34) (wseg_append (wseg_of s071A_35) (wseg_append (wseg_of s071A_36) (wseg_append (wseg_of s071A_37) (wseg_append (wseg_of s071A_38) (wseg_append (wseg_of s071A_39) (wseg_append (wseg_of s071A_40) (wseg_append (wseg_of s071A_41) (wseg_append (wseg_of s071A_42) (wseg_append (wseg_of s071A_43) (wseg_append (wseg_of s071A_44) (wseg_append (wseg_of s071A_45) (wseg_append (wseg_of s071A_46) (wseg_append (wseg_of s071A_47) (wseg_append (wseg_of s071A_48) (wseg_of s071A_49)))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s071B_0) (wseg_append (wseg_of s071B_1) (wseg_append (wseg_of s071B_2) (wseg_append (wseg_of s071B_3) (wseg_append (wseg_of s071B_4) (wseg_append (wseg_of s071B_5) (wseg_append (wseg_of s071B_6) (wseg_append (wseg_of s071B_7) (wseg_append (wseg_of s071B_8) (wseg_append (wseg_of s071B_9) (wseg_append (wseg_of s071B_10) (wseg_of s071B_11))))))))))))⟩

end PackLean.D40.Tet
