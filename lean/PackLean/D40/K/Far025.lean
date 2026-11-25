-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS025_0
import PackLean.D40.K.FarS025_1
import PackLean.D40.K.FarS025_2
import PackLean.D40.K.FarS025_3
import PackLean.D40.K.FarS025_4
import PackLean.D40.K.FarS025_5
import PackLean.D40.K.FarS025_6
import PackLean.D40.K.FarS025_7
import PackLean.D40.K.FarS025_8
import PackLean.D40.K.FarS025_9
import PackLean.D40.K.FarS025_10
import PackLean.D40.K.FarS025_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t078A : List Tok := t078A_0 ++ (t078A_1 ++ (t078A_2 ++ (t078A_3 ++ (t078A_4 ++ (t078A_5 ++ (t078A_6 ++ (t078A_7 ++ (t078A_8 ++ (t078A_9 ++ (t078A_10 ++ (t078A_11 ++ (t078A_12 ++ (t078A_13 ++ (t078A_14 ++ (t078A_15 ++ (t078A_16 ++ (t078A_17 ++ (t078A_18 ++ (t078A_19 ++ (t078A_20 ++ (t078A_21 ++ (t078A_22 ++ (t078A_23 ++ (t078A_24 ++ (t078A_25 ++ (t078A_26 ++ (t078A_27 ++ (t078A_28 ++ (t078A_29 ++ (t078A_30 ++ (t078A_31 ++ (t078A_32 ++ (t078A_33 ++ (t078A_34 ++ (t078A_35 ++ (t078A_36 ++ (t078A_37 ++ (t078A_38 ++ (t078A_39 ++ (t078A_40 ++ (t078A_41 ++ (t078A_42 ++ (t078A_43 ++ (t078A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t078B : List Tok := t078B_0 ++ (t078B_1 ++ (t078B_2 ++ (t078B_3 ++ (t078B_4 ++ (t078B_5 ++ (t078B_6 ++ (t078B_7 ++ (t078B_8 ++ (t078B_9 ++ (t078B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 078：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run078 : (nbRun P nb078 0 kN078 t078A).1 = true ∧ (nbRun P nb078 1 kN078 t078B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s078A_0) (wseg_append (wseg_of s078A_1) (wseg_append (wseg_of s078A_2) (wseg_append (wseg_of s078A_3) (wseg_append (wseg_of s078A_4) (wseg_append (wseg_of s078A_5) (wseg_append (wseg_of s078A_6) (wseg_append (wseg_of s078A_7) (wseg_append (wseg_of s078A_8) (wseg_append (wseg_of s078A_9) (wseg_append (wseg_of s078A_10) (wseg_append (wseg_of s078A_11) (wseg_append (wseg_of s078A_12) (wseg_append (wseg_of s078A_13) (wseg_append (wseg_of s078A_14) (wseg_append (wseg_of s078A_15) (wseg_append (wseg_of s078A_16) (wseg_append (wseg_of s078A_17) (wseg_append (wseg_of s078A_18) (wseg_append (wseg_of s078A_19) (wseg_append (wseg_of s078A_20) (wseg_append (wseg_of s078A_21) (wseg_append (wseg_of s078A_22) (wseg_append (wseg_of s078A_23) (wseg_append (wseg_of s078A_24) (wseg_append (wseg_of s078A_25) (wseg_append (wseg_of s078A_26) (wseg_append (wseg_of s078A_27) (wseg_append (wseg_of s078A_28) (wseg_append (wseg_of s078A_29) (wseg_append (wseg_of s078A_30) (wseg_append (wseg_of s078A_31) (wseg_append (wseg_of s078A_32) (wseg_append (wseg_of s078A_33) (wseg_append (wseg_of s078A_34) (wseg_append (wseg_of s078A_35) (wseg_append (wseg_of s078A_36) (wseg_append (wseg_of s078A_37) (wseg_append (wseg_of s078A_38) (wseg_append (wseg_of s078A_39) (wseg_append (wseg_of s078A_40) (wseg_append (wseg_of s078A_41) (wseg_append (wseg_of s078A_42) (wseg_append (wseg_of s078A_43) (wseg_of s078A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s078B_0) (wseg_append (wseg_of s078B_1) (wseg_append (wseg_of s078B_2) (wseg_append (wseg_of s078B_3) (wseg_append (wseg_of s078B_4) (wseg_append (wseg_of s078B_5) (wseg_append (wseg_of s078B_6) (wseg_append (wseg_of s078B_7) (wseg_append (wseg_of s078B_8) (wseg_append (wseg_of s078B_9) (wseg_of s078B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t079A : List Tok := t079A_0 ++ (t079A_1 ++ (t079A_2 ++ (t079A_3 ++ (t079A_4 ++ (t079A_5 ++ (t079A_6 ++ (t079A_7 ++ (t079A_8 ++ (t079A_9 ++ (t079A_10 ++ (t079A_11 ++ (t079A_12 ++ (t079A_13 ++ (t079A_14 ++ (t079A_15 ++ (t079A_16 ++ (t079A_17 ++ (t079A_18 ++ (t079A_19 ++ (t079A_20 ++ (t079A_21 ++ (t079A_22 ++ (t079A_23 ++ (t079A_24 ++ (t079A_25 ++ (t079A_26 ++ (t079A_27 ++ (t079A_28 ++ (t079A_29 ++ (t079A_30 ++ (t079A_31 ++ (t079A_32 ++ (t079A_33 ++ (t079A_34 ++ (t079A_35 ++ (t079A_36 ++ (t079A_37 ++ (t079A_38 ++ (t079A_39 ++ (t079A_40 ++ (t079A_41 ++ (t079A_42 ++ (t079A_43 ++ (t079A_44 ++ (t079A_45 ++ (t079A_46 ++ (t079A_47 ++ (t079A_48))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t079B : List Tok := t079B_0 ++ (t079B_1 ++ (t079B_2 ++ (t079B_3 ++ (t079B_4 ++ (t079B_5 ++ (t079B_6 ++ (t079B_7 ++ (t079B_8 ++ (t079B_9 ++ (t079B_10 ++ (t079B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 079：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run079 : (nbRun P nb079 0 kN079 t079A).1 = true ∧ (nbRun P nb079 1 kN079 t079B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s079A_0) (wseg_append (wseg_of s079A_1) (wseg_append (wseg_of s079A_2) (wseg_append (wseg_of s079A_3) (wseg_append (wseg_of s079A_4) (wseg_append (wseg_of s079A_5) (wseg_append (wseg_of s079A_6) (wseg_append (wseg_of s079A_7) (wseg_append (wseg_of s079A_8) (wseg_append (wseg_of s079A_9) (wseg_append (wseg_of s079A_10) (wseg_append (wseg_of s079A_11) (wseg_append (wseg_of s079A_12) (wseg_append (wseg_of s079A_13) (wseg_append (wseg_of s079A_14) (wseg_append (wseg_of s079A_15) (wseg_append (wseg_of s079A_16) (wseg_append (wseg_of s079A_17) (wseg_append (wseg_of s079A_18) (wseg_append (wseg_of s079A_19) (wseg_append (wseg_of s079A_20) (wseg_append (wseg_of s079A_21) (wseg_append (wseg_of s079A_22) (wseg_append (wseg_of s079A_23) (wseg_append (wseg_of s079A_24) (wseg_append (wseg_of s079A_25) (wseg_append (wseg_of s079A_26) (wseg_append (wseg_of s079A_27) (wseg_append (wseg_of s079A_28) (wseg_append (wseg_of s079A_29) (wseg_append (wseg_of s079A_30) (wseg_append (wseg_of s079A_31) (wseg_append (wseg_of s079A_32) (wseg_append (wseg_of s079A_33) (wseg_append (wseg_of s079A_34) (wseg_append (wseg_of s079A_35) (wseg_append (wseg_of s079A_36) (wseg_append (wseg_of s079A_37) (wseg_append (wseg_of s079A_38) (wseg_append (wseg_of s079A_39) (wseg_append (wseg_of s079A_40) (wseg_append (wseg_of s079A_41) (wseg_append (wseg_of s079A_42) (wseg_append (wseg_of s079A_43) (wseg_append (wseg_of s079A_44) (wseg_append (wseg_of s079A_45) (wseg_append (wseg_of s079A_46) (wseg_append (wseg_of s079A_47) (wseg_of s079A_48))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s079B_0) (wseg_append (wseg_of s079B_1) (wseg_append (wseg_of s079B_2) (wseg_append (wseg_of s079B_3) (wseg_append (wseg_of s079B_4) (wseg_append (wseg_of s079B_5) (wseg_append (wseg_of s079B_6) (wseg_append (wseg_of s079B_7) (wseg_append (wseg_of s079B_8) (wseg_append (wseg_of s079B_9) (wseg_append (wseg_of s079B_10) (wseg_of s079B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t080A : List Tok := t080A_0 ++ (t080A_1 ++ (t080A_2 ++ (t080A_3 ++ (t080A_4 ++ (t080A_5 ++ (t080A_6 ++ (t080A_7 ++ (t080A_8 ++ (t080A_9 ++ (t080A_10 ++ (t080A_11 ++ (t080A_12 ++ (t080A_13 ++ (t080A_14 ++ (t080A_15 ++ (t080A_16 ++ (t080A_17 ++ (t080A_18 ++ (t080A_19 ++ (t080A_20 ++ (t080A_21 ++ (t080A_22 ++ (t080A_23 ++ (t080A_24 ++ (t080A_25 ++ (t080A_26 ++ (t080A_27 ++ (t080A_28 ++ (t080A_29 ++ (t080A_30 ++ (t080A_31 ++ (t080A_32 ++ (t080A_33 ++ (t080A_34 ++ (t080A_35 ++ (t080A_36 ++ (t080A_37 ++ (t080A_38 ++ (t080A_39 ++ (t080A_40 ++ (t080A_41 ++ (t080A_42 ++ (t080A_43 ++ (t080A_44 ++ (t080A_45 ++ (t080A_46 ++ (t080A_47)))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t080B : List Tok := t080B_0 ++ (t080B_1 ++ (t080B_2 ++ (t080B_3 ++ (t080B_4 ++ (t080B_5 ++ (t080B_6 ++ (t080B_7 ++ (t080B_8 ++ (t080B_9 ++ (t080B_10 ++ (t080B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 080：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run080 : (nbRun P nb080 0 kN080 t080A).1 = true ∧ (nbRun P nb080 1 kN080 t080B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s080A_0) (wseg_append (wseg_of s080A_1) (wseg_append (wseg_of s080A_2) (wseg_append (wseg_of s080A_3) (wseg_append (wseg_of s080A_4) (wseg_append (wseg_of s080A_5) (wseg_append (wseg_of s080A_6) (wseg_append (wseg_of s080A_7) (wseg_append (wseg_of s080A_8) (wseg_append (wseg_of s080A_9) (wseg_append (wseg_of s080A_10) (wseg_append (wseg_of s080A_11) (wseg_append (wseg_of s080A_12) (wseg_append (wseg_of s080A_13) (wseg_append (wseg_of s080A_14) (wseg_append (wseg_of s080A_15) (wseg_append (wseg_of s080A_16) (wseg_append (wseg_of s080A_17) (wseg_append (wseg_of s080A_18) (wseg_append (wseg_of s080A_19) (wseg_append (wseg_of s080A_20) (wseg_append (wseg_of s080A_21) (wseg_append (wseg_of s080A_22) (wseg_append (wseg_of s080A_23) (wseg_append (wseg_of s080A_24) (wseg_append (wseg_of s080A_25) (wseg_append (wseg_of s080A_26) (wseg_append (wseg_of s080A_27) (wseg_append (wseg_of s080A_28) (wseg_append (wseg_of s080A_29) (wseg_append (wseg_of s080A_30) (wseg_append (wseg_of s080A_31) (wseg_append (wseg_of s080A_32) (wseg_append (wseg_of s080A_33) (wseg_append (wseg_of s080A_34) (wseg_append (wseg_of s080A_35) (wseg_append (wseg_of s080A_36) (wseg_append (wseg_of s080A_37) (wseg_append (wseg_of s080A_38) (wseg_append (wseg_of s080A_39) (wseg_append (wseg_of s080A_40) (wseg_append (wseg_of s080A_41) (wseg_append (wseg_of s080A_42) (wseg_append (wseg_of s080A_43) (wseg_append (wseg_of s080A_44) (wseg_append (wseg_of s080A_45) (wseg_append (wseg_of s080A_46) (wseg_of s080A_47)))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s080B_0) (wseg_append (wseg_of s080B_1) (wseg_append (wseg_of s080B_2) (wseg_append (wseg_of s080B_3) (wseg_append (wseg_of s080B_4) (wseg_append (wseg_of s080B_5) (wseg_append (wseg_of s080B_6) (wseg_append (wseg_of s080B_7) (wseg_append (wseg_of s080B_8) (wseg_append (wseg_of s080B_9) (wseg_append (wseg_of s080B_10) (wseg_of s080B_11))))))))))))⟩

end PackLean.D40.Tet
