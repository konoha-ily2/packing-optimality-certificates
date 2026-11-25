-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS010_0
import PackLean.D40.K.FarS010_1
import PackLean.D40.K.FarS010_2
import PackLean.D40.K.FarS010_3
import PackLean.D40.K.FarS010_4
import PackLean.D40.K.FarS010_5
import PackLean.D40.K.FarS010_6
import PackLean.D40.K.FarS010_7
import PackLean.D40.K.FarS010_8
import PackLean.D40.K.FarS010_9
import PackLean.D40.K.FarS010_10
import PackLean.D40.K.FarS010_11
import PackLean.D40.K.FarS010_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028A : List Tok := t028A_0 ++ (t028A_1 ++ (t028A_2 ++ (t028A_3 ++ (t028A_4 ++ (t028A_5 ++ (t028A_6 ++ (t028A_7 ++ (t028A_8 ++ (t028A_9 ++ (t028A_10 ++ (t028A_11 ++ (t028A_12 ++ (t028A_13 ++ (t028A_14 ++ (t028A_15 ++ (t028A_16 ++ (t028A_17 ++ (t028A_18 ++ (t028A_19 ++ (t028A_20 ++ (t028A_21 ++ (t028A_22 ++ (t028A_23 ++ (t028A_24 ++ (t028A_25 ++ (t028A_26 ++ (t028A_27 ++ (t028A_28 ++ (t028A_29 ++ (t028A_30 ++ (t028A_31 ++ (t028A_32 ++ (t028A_33 ++ (t028A_34 ++ (t028A_35 ++ (t028A_36 ++ (t028A_37 ++ (t028A_38 ++ (t028A_39 ++ (t028A_40 ++ (t028A_41 ++ (t028A_42 ++ (t028A_43 ++ (t028A_44 ++ (t028A_45 ++ (t028A_46 ++ (t028A_47 ++ (t028A_48 ++ (t028A_49 ++ (t028A_50 ++ (t028A_51 ++ (t028A_52))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t028B : List Tok := t028B_0 ++ (t028B_1 ++ (t028B_2 ++ (t028B_3 ++ (t028B_4 ++ (t028B_5 ++ (t028B_6 ++ (t028B_7 ++ (t028B_8 ++ (t028B_9 ++ (t028B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 028：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run028 : (nbRun P nb028 0 kN028 t028A).1 = true ∧ (nbRun P nb028 1 kN028 t028B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s028A_0) (wseg_append (wseg_of s028A_1) (wseg_append (wseg_of s028A_2) (wseg_append (wseg_of s028A_3) (wseg_append (wseg_of s028A_4) (wseg_append (wseg_of s028A_5) (wseg_append (wseg_of s028A_6) (wseg_append (wseg_of s028A_7) (wseg_append (wseg_of s028A_8) (wseg_append (wseg_of s028A_9) (wseg_append (wseg_of s028A_10) (wseg_append (wseg_of s028A_11) (wseg_append (wseg_of s028A_12) (wseg_append (wseg_of s028A_13) (wseg_append (wseg_of s028A_14) (wseg_append (wseg_of s028A_15) (wseg_append (wseg_of s028A_16) (wseg_append (wseg_of s028A_17) (wseg_append (wseg_of s028A_18) (wseg_append (wseg_of s028A_19) (wseg_append (wseg_of s028A_20) (wseg_append (wseg_of s028A_21) (wseg_append (wseg_of s028A_22) (wseg_append (wseg_of s028A_23) (wseg_append (wseg_of s028A_24) (wseg_append (wseg_of s028A_25) (wseg_append (wseg_of s028A_26) (wseg_append (wseg_of s028A_27) (wseg_append (wseg_of s028A_28) (wseg_append (wseg_of s028A_29) (wseg_append (wseg_of s028A_30) (wseg_append (wseg_of s028A_31) (wseg_append (wseg_of s028A_32) (wseg_append (wseg_of s028A_33) (wseg_append (wseg_of s028A_34) (wseg_append (wseg_of s028A_35) (wseg_append (wseg_of s028A_36) (wseg_append (wseg_of s028A_37) (wseg_append (wseg_of s028A_38) (wseg_append (wseg_of s028A_39) (wseg_append (wseg_of s028A_40) (wseg_append (wseg_of s028A_41) (wseg_append (wseg_of s028A_42) (wseg_append (wseg_of s028A_43) (wseg_append (wseg_of s028A_44) (wseg_append (wseg_of s028A_45) (wseg_append (wseg_of s028A_46) (wseg_append (wseg_of s028A_47) (wseg_append (wseg_of s028A_48) (wseg_append (wseg_of s028A_49) (wseg_append (wseg_of s028A_50) (wseg_append (wseg_of s028A_51) (wseg_of s028A_52))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s028B_0) (wseg_append (wseg_of s028B_1) (wseg_append (wseg_of s028B_2) (wseg_append (wseg_of s028B_3) (wseg_append (wseg_of s028B_4) (wseg_append (wseg_of s028B_5) (wseg_append (wseg_of s028B_6) (wseg_append (wseg_of s028B_7) (wseg_append (wseg_of s028B_8) (wseg_append (wseg_of s028B_9) (wseg_of s028B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029A : List Tok := t029A_0 ++ (t029A_1 ++ (t029A_2 ++ (t029A_3 ++ (t029A_4 ++ (t029A_5 ++ (t029A_6 ++ (t029A_7 ++ (t029A_8 ++ (t029A_9 ++ (t029A_10 ++ (t029A_11 ++ (t029A_12 ++ (t029A_13 ++ (t029A_14 ++ (t029A_15 ++ (t029A_16 ++ (t029A_17 ++ (t029A_18 ++ (t029A_19 ++ (t029A_20 ++ (t029A_21 ++ (t029A_22 ++ (t029A_23 ++ (t029A_24 ++ (t029A_25 ++ (t029A_26 ++ (t029A_27 ++ (t029A_28 ++ (t029A_29 ++ (t029A_30 ++ (t029A_31 ++ (t029A_32 ++ (t029A_33 ++ (t029A_34 ++ (t029A_35 ++ (t029A_36 ++ (t029A_37 ++ (t029A_38 ++ (t029A_39 ++ (t029A_40 ++ (t029A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t029B : List Tok := t029B_0 ++ (t029B_1 ++ (t029B_2 ++ (t029B_3 ++ (t029B_4 ++ (t029B_5 ++ (t029B_6 ++ (t029B_7 ++ (t029B_8 ++ (t029B_9 ++ (t029B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 029：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run029 : (nbRun P nb029 0 kN029 t029A).1 = true ∧ (nbRun P nb029 1 kN029 t029B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s029A_0) (wseg_append (wseg_of s029A_1) (wseg_append (wseg_of s029A_2) (wseg_append (wseg_of s029A_3) (wseg_append (wseg_of s029A_4) (wseg_append (wseg_of s029A_5) (wseg_append (wseg_of s029A_6) (wseg_append (wseg_of s029A_7) (wseg_append (wseg_of s029A_8) (wseg_append (wseg_of s029A_9) (wseg_append (wseg_of s029A_10) (wseg_append (wseg_of s029A_11) (wseg_append (wseg_of s029A_12) (wseg_append (wseg_of s029A_13) (wseg_append (wseg_of s029A_14) (wseg_append (wseg_of s029A_15) (wseg_append (wseg_of s029A_16) (wseg_append (wseg_of s029A_17) (wseg_append (wseg_of s029A_18) (wseg_append (wseg_of s029A_19) (wseg_append (wseg_of s029A_20) (wseg_append (wseg_of s029A_21) (wseg_append (wseg_of s029A_22) (wseg_append (wseg_of s029A_23) (wseg_append (wseg_of s029A_24) (wseg_append (wseg_of s029A_25) (wseg_append (wseg_of s029A_26) (wseg_append (wseg_of s029A_27) (wseg_append (wseg_of s029A_28) (wseg_append (wseg_of s029A_29) (wseg_append (wseg_of s029A_30) (wseg_append (wseg_of s029A_31) (wseg_append (wseg_of s029A_32) (wseg_append (wseg_of s029A_33) (wseg_append (wseg_of s029A_34) (wseg_append (wseg_of s029A_35) (wseg_append (wseg_of s029A_36) (wseg_append (wseg_of s029A_37) (wseg_append (wseg_of s029A_38) (wseg_append (wseg_of s029A_39) (wseg_append (wseg_of s029A_40) (wseg_of s029A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s029B_0) (wseg_append (wseg_of s029B_1) (wseg_append (wseg_of s029B_2) (wseg_append (wseg_of s029B_3) (wseg_append (wseg_of s029B_4) (wseg_append (wseg_of s029B_5) (wseg_append (wseg_of s029B_6) (wseg_append (wseg_of s029B_7) (wseg_append (wseg_of s029B_8) (wseg_append (wseg_of s029B_9) (wseg_of s029B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t030A : List Tok := t030A_0 ++ (t030A_1 ++ (t030A_2 ++ (t030A_3 ++ (t030A_4 ++ (t030A_5 ++ (t030A_6 ++ (t030A_7 ++ (t030A_8 ++ (t030A_9 ++ (t030A_10 ++ (t030A_11 ++ (t030A_12 ++ (t030A_13 ++ (t030A_14 ++ (t030A_15 ++ (t030A_16 ++ (t030A_17 ++ (t030A_18 ++ (t030A_19 ++ (t030A_20 ++ (t030A_21 ++ (t030A_22 ++ (t030A_23 ++ (t030A_24 ++ (t030A_25 ++ (t030A_26 ++ (t030A_27 ++ (t030A_28 ++ (t030A_29 ++ (t030A_30 ++ (t030A_31 ++ (t030A_32 ++ (t030A_33 ++ (t030A_34 ++ (t030A_35 ++ (t030A_36 ++ (t030A_37 ++ (t030A_38 ++ (t030A_39 ++ (t030A_40 ++ (t030A_41 ++ (t030A_42 ++ (t030A_43 ++ (t030A_44 ++ (t030A_45 ++ (t030A_46 ++ (t030A_47 ++ (t030A_48 ++ (t030A_49 ++ (t030A_50 ++ (t030A_51 ++ (t030A_52 ++ (t030A_53 ++ (t030A_54 ++ (t030A_55 ++ (t030A_56 ++ (t030A_57 ++ (t030A_58))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t030B : List Tok := t030B_0 ++ (t030B_1 ++ (t030B_2 ++ (t030B_3 ++ (t030B_4 ++ (t030B_5 ++ (t030B_6 ++ (t030B_7 ++ (t030B_8 ++ (t030B_9 ++ (t030B_10 ++ (t030B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 030：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run030 : (nbRun P nb030 0 kN030 t030A).1 = true ∧ (nbRun P nb030 1 kN030 t030B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s030A_0) (wseg_append (wseg_of s030A_1) (wseg_append (wseg_of s030A_2) (wseg_append (wseg_of s030A_3) (wseg_append (wseg_of s030A_4) (wseg_append (wseg_of s030A_5) (wseg_append (wseg_of s030A_6) (wseg_append (wseg_of s030A_7) (wseg_append (wseg_of s030A_8) (wseg_append (wseg_of s030A_9) (wseg_append (wseg_of s030A_10) (wseg_append (wseg_of s030A_11) (wseg_append (wseg_of s030A_12) (wseg_append (wseg_of s030A_13) (wseg_append (wseg_of s030A_14) (wseg_append (wseg_of s030A_15) (wseg_append (wseg_of s030A_16) (wseg_append (wseg_of s030A_17) (wseg_append (wseg_of s030A_18) (wseg_append (wseg_of s030A_19) (wseg_append (wseg_of s030A_20) (wseg_append (wseg_of s030A_21) (wseg_append (wseg_of s030A_22) (wseg_append (wseg_of s030A_23) (wseg_append (wseg_of s030A_24) (wseg_append (wseg_of s030A_25) (wseg_append (wseg_of s030A_26) (wseg_append (wseg_of s030A_27) (wseg_append (wseg_of s030A_28) (wseg_append (wseg_of s030A_29) (wseg_append (wseg_of s030A_30) (wseg_append (wseg_of s030A_31) (wseg_append (wseg_of s030A_32) (wseg_append (wseg_of s030A_33) (wseg_append (wseg_of s030A_34) (wseg_append (wseg_of s030A_35) (wseg_append (wseg_of s030A_36) (wseg_append (wseg_of s030A_37) (wseg_append (wseg_of s030A_38) (wseg_append (wseg_of s030A_39) (wseg_append (wseg_of s030A_40) (wseg_append (wseg_of s030A_41) (wseg_append (wseg_of s030A_42) (wseg_append (wseg_of s030A_43) (wseg_append (wseg_of s030A_44) (wseg_append (wseg_of s030A_45) (wseg_append (wseg_of s030A_46) (wseg_append (wseg_of s030A_47) (wseg_append (wseg_of s030A_48) (wseg_append (wseg_of s030A_49) (wseg_append (wseg_of s030A_50) (wseg_append (wseg_of s030A_51) (wseg_append (wseg_of s030A_52) (wseg_append (wseg_of s030A_53) (wseg_append (wseg_of s030A_54) (wseg_append (wseg_of s030A_55) (wseg_append (wseg_of s030A_56) (wseg_append (wseg_of s030A_57) (wseg_of s030A_58))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s030B_0) (wseg_append (wseg_of s030B_1) (wseg_append (wseg_of s030B_2) (wseg_append (wseg_of s030B_3) (wseg_append (wseg_of s030B_4) (wseg_append (wseg_of s030B_5) (wseg_append (wseg_of s030B_6) (wseg_append (wseg_of s030B_7) (wseg_append (wseg_of s030B_8) (wseg_append (wseg_of s030B_9) (wseg_append (wseg_of s030B_10) (wseg_of s030B_11))))))))))))⟩

end PackLean.D40.Tet
