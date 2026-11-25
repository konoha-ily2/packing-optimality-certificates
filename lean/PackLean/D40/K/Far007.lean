-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS007_0
import PackLean.D40.K.FarS007_1
import PackLean.D40.K.FarS007_2
import PackLean.D40.K.FarS007_3
import PackLean.D40.K.FarS007_4
import PackLean.D40.K.FarS007_5
import PackLean.D40.K.FarS007_6
import PackLean.D40.K.FarS007_7
import PackLean.D40.K.FarS007_8
import PackLean.D40.K.FarS007_9
import PackLean.D40.K.FarS007_10
import PackLean.D40.K.FarS007_11
import PackLean.D40.K.FarS007_12
import PackLean.D40.K.FarS007_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t019A : List Tok := t019A_0 ++ (t019A_1 ++ (t019A_2 ++ (t019A_3 ++ (t019A_4 ++ (t019A_5 ++ (t019A_6 ++ (t019A_7 ++ (t019A_8 ++ (t019A_9 ++ (t019A_10 ++ (t019A_11 ++ (t019A_12 ++ (t019A_13 ++ (t019A_14 ++ (t019A_15 ++ (t019A_16 ++ (t019A_17 ++ (t019A_18 ++ (t019A_19 ++ (t019A_20 ++ (t019A_21 ++ (t019A_22 ++ (t019A_23 ++ (t019A_24 ++ (t019A_25 ++ (t019A_26 ++ (t019A_27 ++ (t019A_28 ++ (t019A_29 ++ (t019A_30 ++ (t019A_31 ++ (t019A_32 ++ (t019A_33 ++ (t019A_34 ++ (t019A_35 ++ (t019A_36 ++ (t019A_37 ++ (t019A_38 ++ (t019A_39 ++ (t019A_40 ++ (t019A_41 ++ (t019A_42 ++ (t019A_43 ++ (t019A_44 ++ (t019A_45 ++ (t019A_46 ++ (t019A_47 ++ (t019A_48 ++ (t019A_49 ++ (t019A_50 ++ (t019A_51 ++ (t019A_52 ++ (t019A_53 ++ (t019A_54 ++ (t019A_55 ++ (t019A_56 ++ (t019A_57 ++ (t019A_58 ++ (t019A_59 ++ (t019A_60))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t019B : List Tok := t019B_0 ++ (t019B_1 ++ (t019B_2 ++ (t019B_3 ++ (t019B_4 ++ (t019B_5 ++ (t019B_6 ++ (t019B_7 ++ (t019B_8 ++ (t019B_9 ++ (t019B_10 ++ (t019B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 019：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run019 : (nbRun P nb019 0 kN019 t019A).1 = true ∧ (nbRun P nb019 1 kN019 t019B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s019A_0) (wseg_append (wseg_of s019A_1) (wseg_append (wseg_of s019A_2) (wseg_append (wseg_of s019A_3) (wseg_append (wseg_of s019A_4) (wseg_append (wseg_of s019A_5) (wseg_append (wseg_of s019A_6) (wseg_append (wseg_of s019A_7) (wseg_append (wseg_of s019A_8) (wseg_append (wseg_of s019A_9) (wseg_append (wseg_of s019A_10) (wseg_append (wseg_of s019A_11) (wseg_append (wseg_of s019A_12) (wseg_append (wseg_of s019A_13) (wseg_append (wseg_of s019A_14) (wseg_append (wseg_of s019A_15) (wseg_append (wseg_of s019A_16) (wseg_append (wseg_of s019A_17) (wseg_append (wseg_of s019A_18) (wseg_append (wseg_of s019A_19) (wseg_append (wseg_of s019A_20) (wseg_append (wseg_of s019A_21) (wseg_append (wseg_of s019A_22) (wseg_append (wseg_of s019A_23) (wseg_append (wseg_of s019A_24) (wseg_append (wseg_of s019A_25) (wseg_append (wseg_of s019A_26) (wseg_append (wseg_of s019A_27) (wseg_append (wseg_of s019A_28) (wseg_append (wseg_of s019A_29) (wseg_append (wseg_of s019A_30) (wseg_append (wseg_of s019A_31) (wseg_append (wseg_of s019A_32) (wseg_append (wseg_of s019A_33) (wseg_append (wseg_of s019A_34) (wseg_append (wseg_of s019A_35) (wseg_append (wseg_of s019A_36) (wseg_append (wseg_of s019A_37) (wseg_append (wseg_of s019A_38) (wseg_append (wseg_of s019A_39) (wseg_append (wseg_of s019A_40) (wseg_append (wseg_of s019A_41) (wseg_append (wseg_of s019A_42) (wseg_append (wseg_of s019A_43) (wseg_append (wseg_of s019A_44) (wseg_append (wseg_of s019A_45) (wseg_append (wseg_of s019A_46) (wseg_append (wseg_of s019A_47) (wseg_append (wseg_of s019A_48) (wseg_append (wseg_of s019A_49) (wseg_append (wseg_of s019A_50) (wseg_append (wseg_of s019A_51) (wseg_append (wseg_of s019A_52) (wseg_append (wseg_of s019A_53) (wseg_append (wseg_of s019A_54) (wseg_append (wseg_of s019A_55) (wseg_append (wseg_of s019A_56) (wseg_append (wseg_of s019A_57) (wseg_append (wseg_of s019A_58) (wseg_append (wseg_of s019A_59) (wseg_of s019A_60))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s019B_0) (wseg_append (wseg_of s019B_1) (wseg_append (wseg_of s019B_2) (wseg_append (wseg_of s019B_3) (wseg_append (wseg_of s019B_4) (wseg_append (wseg_of s019B_5) (wseg_append (wseg_of s019B_6) (wseg_append (wseg_of s019B_7) (wseg_append (wseg_of s019B_8) (wseg_append (wseg_of s019B_9) (wseg_append (wseg_of s019B_10) (wseg_of s019B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t020A : List Tok := t020A_0 ++ (t020A_1 ++ (t020A_2 ++ (t020A_3 ++ (t020A_4 ++ (t020A_5 ++ (t020A_6 ++ (t020A_7 ++ (t020A_8 ++ (t020A_9 ++ (t020A_10 ++ (t020A_11 ++ (t020A_12 ++ (t020A_13 ++ (t020A_14 ++ (t020A_15 ++ (t020A_16 ++ (t020A_17 ++ (t020A_18 ++ (t020A_19 ++ (t020A_20 ++ (t020A_21 ++ (t020A_22 ++ (t020A_23 ++ (t020A_24 ++ (t020A_25 ++ (t020A_26 ++ (t020A_27 ++ (t020A_28 ++ (t020A_29 ++ (t020A_30 ++ (t020A_31 ++ (t020A_32 ++ (t020A_33 ++ (t020A_34 ++ (t020A_35 ++ (t020A_36 ++ (t020A_37 ++ (t020A_38 ++ (t020A_39 ++ (t020A_40 ++ (t020A_41 ++ (t020A_42 ++ (t020A_43 ++ (t020A_44 ++ (t020A_45 ++ (t020A_46 ++ (t020A_47 ++ (t020A_48 ++ (t020A_49 ++ (t020A_50 ++ (t020A_51 ++ (t020A_52 ++ (t020A_53 ++ (t020A_54 ++ (t020A_55)))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t020B : List Tok := t020B_0 ++ (t020B_1 ++ (t020B_2 ++ (t020B_3 ++ (t020B_4 ++ (t020B_5 ++ (t020B_6 ++ (t020B_7 ++ (t020B_8 ++ (t020B_9 ++ (t020B_10 ++ (t020B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 020：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run020 : (nbRun P nb020 0 kN020 t020A).1 = true ∧ (nbRun P nb020 1 kN020 t020B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s020A_0) (wseg_append (wseg_of s020A_1) (wseg_append (wseg_of s020A_2) (wseg_append (wseg_of s020A_3) (wseg_append (wseg_of s020A_4) (wseg_append (wseg_of s020A_5) (wseg_append (wseg_of s020A_6) (wseg_append (wseg_of s020A_7) (wseg_append (wseg_of s020A_8) (wseg_append (wseg_of s020A_9) (wseg_append (wseg_of s020A_10) (wseg_append (wseg_of s020A_11) (wseg_append (wseg_of s020A_12) (wseg_append (wseg_of s020A_13) (wseg_append (wseg_of s020A_14) (wseg_append (wseg_of s020A_15) (wseg_append (wseg_of s020A_16) (wseg_append (wseg_of s020A_17) (wseg_append (wseg_of s020A_18) (wseg_append (wseg_of s020A_19) (wseg_append (wseg_of s020A_20) (wseg_append (wseg_of s020A_21) (wseg_append (wseg_of s020A_22) (wseg_append (wseg_of s020A_23) (wseg_append (wseg_of s020A_24) (wseg_append (wseg_of s020A_25) (wseg_append (wseg_of s020A_26) (wseg_append (wseg_of s020A_27) (wseg_append (wseg_of s020A_28) (wseg_append (wseg_of s020A_29) (wseg_append (wseg_of s020A_30) (wseg_append (wseg_of s020A_31) (wseg_append (wseg_of s020A_32) (wseg_append (wseg_of s020A_33) (wseg_append (wseg_of s020A_34) (wseg_append (wseg_of s020A_35) (wseg_append (wseg_of s020A_36) (wseg_append (wseg_of s020A_37) (wseg_append (wseg_of s020A_38) (wseg_append (wseg_of s020A_39) (wseg_append (wseg_of s020A_40) (wseg_append (wseg_of s020A_41) (wseg_append (wseg_of s020A_42) (wseg_append (wseg_of s020A_43) (wseg_append (wseg_of s020A_44) (wseg_append (wseg_of s020A_45) (wseg_append (wseg_of s020A_46) (wseg_append (wseg_of s020A_47) (wseg_append (wseg_of s020A_48) (wseg_append (wseg_of s020A_49) (wseg_append (wseg_of s020A_50) (wseg_append (wseg_of s020A_51) (wseg_append (wseg_of s020A_52) (wseg_append (wseg_of s020A_53) (wseg_append (wseg_of s020A_54) (wseg_of s020A_55)))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s020B_0) (wseg_append (wseg_of s020B_1) (wseg_append (wseg_of s020B_2) (wseg_append (wseg_of s020B_3) (wseg_append (wseg_of s020B_4) (wseg_append (wseg_of s020B_5) (wseg_append (wseg_of s020B_6) (wseg_append (wseg_of s020B_7) (wseg_append (wseg_of s020B_8) (wseg_append (wseg_of s020B_9) (wseg_append (wseg_of s020B_10) (wseg_of s020B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t021A : List Tok := t021A_0 ++ (t021A_1 ++ (t021A_2 ++ (t021A_3 ++ (t021A_4 ++ (t021A_5 ++ (t021A_6 ++ (t021A_7 ++ (t021A_8 ++ (t021A_9 ++ (t021A_10 ++ (t021A_11 ++ (t021A_12 ++ (t021A_13 ++ (t021A_14 ++ (t021A_15 ++ (t021A_16 ++ (t021A_17 ++ (t021A_18 ++ (t021A_19 ++ (t021A_20 ++ (t021A_21 ++ (t021A_22 ++ (t021A_23 ++ (t021A_24 ++ (t021A_25 ++ (t021A_26 ++ (t021A_27 ++ (t021A_28 ++ (t021A_29 ++ (t021A_30 ++ (t021A_31 ++ (t021A_32 ++ (t021A_33 ++ (t021A_34 ++ (t021A_35 ++ (t021A_36 ++ (t021A_37 ++ (t021A_38 ++ (t021A_39 ++ (t021A_40 ++ (t021A_41 ++ (t021A_42 ++ (t021A_43 ++ (t021A_44 ++ (t021A_45 ++ (t021A_46 ++ (t021A_47 ++ (t021A_48 ++ (t021A_49 ++ (t021A_50 ++ (t021A_51 ++ (t021A_52 ++ (t021A_53 ++ (t021A_54 ++ (t021A_55 ++ (t021A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t021B : List Tok := t021B_0 ++ (t021B_1 ++ (t021B_2 ++ (t021B_3 ++ (t021B_4 ++ (t021B_5 ++ (t021B_6 ++ (t021B_7 ++ (t021B_8 ++ (t021B_9 ++ (t021B_10 ++ (t021B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 021：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run021 : (nbRun P nb021 0 kN021 t021A).1 = true ∧ (nbRun P nb021 1 kN021 t021B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s021A_0) (wseg_append (wseg_of s021A_1) (wseg_append (wseg_of s021A_2) (wseg_append (wseg_of s021A_3) (wseg_append (wseg_of s021A_4) (wseg_append (wseg_of s021A_5) (wseg_append (wseg_of s021A_6) (wseg_append (wseg_of s021A_7) (wseg_append (wseg_of s021A_8) (wseg_append (wseg_of s021A_9) (wseg_append (wseg_of s021A_10) (wseg_append (wseg_of s021A_11) (wseg_append (wseg_of s021A_12) (wseg_append (wseg_of s021A_13) (wseg_append (wseg_of s021A_14) (wseg_append (wseg_of s021A_15) (wseg_append (wseg_of s021A_16) (wseg_append (wseg_of s021A_17) (wseg_append (wseg_of s021A_18) (wseg_append (wseg_of s021A_19) (wseg_append (wseg_of s021A_20) (wseg_append (wseg_of s021A_21) (wseg_append (wseg_of s021A_22) (wseg_append (wseg_of s021A_23) (wseg_append (wseg_of s021A_24) (wseg_append (wseg_of s021A_25) (wseg_append (wseg_of s021A_26) (wseg_append (wseg_of s021A_27) (wseg_append (wseg_of s021A_28) (wseg_append (wseg_of s021A_29) (wseg_append (wseg_of s021A_30) (wseg_append (wseg_of s021A_31) (wseg_append (wseg_of s021A_32) (wseg_append (wseg_of s021A_33) (wseg_append (wseg_of s021A_34) (wseg_append (wseg_of s021A_35) (wseg_append (wseg_of s021A_36) (wseg_append (wseg_of s021A_37) (wseg_append (wseg_of s021A_38) (wseg_append (wseg_of s021A_39) (wseg_append (wseg_of s021A_40) (wseg_append (wseg_of s021A_41) (wseg_append (wseg_of s021A_42) (wseg_append (wseg_of s021A_43) (wseg_append (wseg_of s021A_44) (wseg_append (wseg_of s021A_45) (wseg_append (wseg_of s021A_46) (wseg_append (wseg_of s021A_47) (wseg_append (wseg_of s021A_48) (wseg_append (wseg_of s021A_49) (wseg_append (wseg_of s021A_50) (wseg_append (wseg_of s021A_51) (wseg_append (wseg_of s021A_52) (wseg_append (wseg_of s021A_53) (wseg_append (wseg_of s021A_54) (wseg_append (wseg_of s021A_55) (wseg_of s021A_56))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s021B_0) (wseg_append (wseg_of s021B_1) (wseg_append (wseg_of s021B_2) (wseg_append (wseg_of s021B_3) (wseg_append (wseg_of s021B_4) (wseg_append (wseg_of s021B_5) (wseg_append (wseg_of s021B_6) (wseg_append (wseg_of s021B_7) (wseg_append (wseg_of s021B_8) (wseg_append (wseg_of s021B_9) (wseg_append (wseg_of s021B_10) (wseg_of s021B_11))))))))))))⟩

end PackLean.D40.Tet
