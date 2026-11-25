-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS002_0
import PackLean.D40.K.FarS002_1
import PackLean.D40.K.FarS002_2
import PackLean.D40.K.FarS002_3
import PackLean.D40.K.FarS002_4
import PackLean.D40.K.FarS002_5
import PackLean.D40.K.FarS002_6
import PackLean.D40.K.FarS002_7
import PackLean.D40.K.FarS002_8
import PackLean.D40.K.FarS002_9
import PackLean.D40.K.FarS002_10
import PackLean.D40.K.FarS002_11
import PackLean.D40.K.FarS002_12
import PackLean.D40.K.FarS002_13
import PackLean.D40.K.FarS002_14
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004A : List Tok := t004A_0 ++ (t004A_1 ++ (t004A_2 ++ (t004A_3 ++ (t004A_4 ++ (t004A_5 ++ (t004A_6 ++ (t004A_7 ++ (t004A_8 ++ (t004A_9 ++ (t004A_10 ++ (t004A_11 ++ (t004A_12 ++ (t004A_13 ++ (t004A_14 ++ (t004A_15 ++ (t004A_16 ++ (t004A_17 ++ (t004A_18 ++ (t004A_19 ++ (t004A_20 ++ (t004A_21 ++ (t004A_22 ++ (t004A_23 ++ (t004A_24 ++ (t004A_25 ++ (t004A_26 ++ (t004A_27 ++ (t004A_28 ++ (t004A_29 ++ (t004A_30 ++ (t004A_31 ++ (t004A_32 ++ (t004A_33 ++ (t004A_34 ++ (t004A_35 ++ (t004A_36 ++ (t004A_37 ++ (t004A_38 ++ (t004A_39 ++ (t004A_40 ++ (t004A_41 ++ (t004A_42 ++ (t004A_43 ++ (t004A_44 ++ (t004A_45 ++ (t004A_46 ++ (t004A_47 ++ (t004A_48 ++ (t004A_49 ++ (t004A_50 ++ (t004A_51 ++ (t004A_52 ++ (t004A_53 ++ (t004A_54 ++ (t004A_55 ++ (t004A_56 ++ (t004A_57 ++ (t004A_58 ++ (t004A_59 ++ (t004A_60 ++ (t004A_61)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t004B : List Tok := t004B_0 ++ (t004B_1 ++ (t004B_2 ++ (t004B_3 ++ (t004B_4 ++ (t004B_5 ++ (t004B_6 ++ (t004B_7 ++ (t004B_8 ++ (t004B_9 ++ (t004B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 004：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run004 : (nbRun P nb004 0 kN004 t004A).1 = true ∧ (nbRun P nb004 1 kN004 t004B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s004A_0) (wseg_append (wseg_of s004A_1) (wseg_append (wseg_of s004A_2) (wseg_append (wseg_of s004A_3) (wseg_append (wseg_of s004A_4) (wseg_append (wseg_of s004A_5) (wseg_append (wseg_of s004A_6) (wseg_append (wseg_of s004A_7) (wseg_append (wseg_of s004A_8) (wseg_append (wseg_of s004A_9) (wseg_append (wseg_of s004A_10) (wseg_append (wseg_of s004A_11) (wseg_append (wseg_of s004A_12) (wseg_append (wseg_of s004A_13) (wseg_append (wseg_of s004A_14) (wseg_append (wseg_of s004A_15) (wseg_append (wseg_of s004A_16) (wseg_append (wseg_of s004A_17) (wseg_append (wseg_of s004A_18) (wseg_append (wseg_of s004A_19) (wseg_append (wseg_of s004A_20) (wseg_append (wseg_of s004A_21) (wseg_append (wseg_of s004A_22) (wseg_append (wseg_of s004A_23) (wseg_append (wseg_of s004A_24) (wseg_append (wseg_of s004A_25) (wseg_append (wseg_of s004A_26) (wseg_append (wseg_of s004A_27) (wseg_append (wseg_of s004A_28) (wseg_append (wseg_of s004A_29) (wseg_append (wseg_of s004A_30) (wseg_append (wseg_of s004A_31) (wseg_append (wseg_of s004A_32) (wseg_append (wseg_of s004A_33) (wseg_append (wseg_of s004A_34) (wseg_append (wseg_of s004A_35) (wseg_append (wseg_of s004A_36) (wseg_append (wseg_of s004A_37) (wseg_append (wseg_of s004A_38) (wseg_append (wseg_of s004A_39) (wseg_append (wseg_of s004A_40) (wseg_append (wseg_of s004A_41) (wseg_append (wseg_of s004A_42) (wseg_append (wseg_of s004A_43) (wseg_append (wseg_of s004A_44) (wseg_append (wseg_of s004A_45) (wseg_append (wseg_of s004A_46) (wseg_append (wseg_of s004A_47) (wseg_append (wseg_of s004A_48) (wseg_append (wseg_of s004A_49) (wseg_append (wseg_of s004A_50) (wseg_append (wseg_of s004A_51) (wseg_append (wseg_of s004A_52) (wseg_append (wseg_of s004A_53) (wseg_append (wseg_of s004A_54) (wseg_append (wseg_of s004A_55) (wseg_append (wseg_of s004A_56) (wseg_append (wseg_of s004A_57) (wseg_append (wseg_of s004A_58) (wseg_append (wseg_of s004A_59) (wseg_append (wseg_of s004A_60) (wseg_of s004A_61)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s004B_0) (wseg_append (wseg_of s004B_1) (wseg_append (wseg_of s004B_2) (wseg_append (wseg_of s004B_3) (wseg_append (wseg_of s004B_4) (wseg_append (wseg_of s004B_5) (wseg_append (wseg_of s004B_6) (wseg_append (wseg_of s004B_7) (wseg_append (wseg_of s004B_8) (wseg_append (wseg_of s004B_9) (wseg_of s004B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t005A : List Tok := t005A_0 ++ (t005A_1 ++ (t005A_2 ++ (t005A_3 ++ (t005A_4 ++ (t005A_5 ++ (t005A_6 ++ (t005A_7 ++ (t005A_8 ++ (t005A_9 ++ (t005A_10 ++ (t005A_11 ++ (t005A_12 ++ (t005A_13 ++ (t005A_14 ++ (t005A_15 ++ (t005A_16 ++ (t005A_17 ++ (t005A_18 ++ (t005A_19 ++ (t005A_20 ++ (t005A_21 ++ (t005A_22 ++ (t005A_23 ++ (t005A_24 ++ (t005A_25 ++ (t005A_26 ++ (t005A_27 ++ (t005A_28 ++ (t005A_29 ++ (t005A_30 ++ (t005A_31 ++ (t005A_32 ++ (t005A_33 ++ (t005A_34 ++ (t005A_35 ++ (t005A_36 ++ (t005A_37 ++ (t005A_38 ++ (t005A_39 ++ (t005A_40 ++ (t005A_41 ++ (t005A_42 ++ (t005A_43 ++ (t005A_44 ++ (t005A_45 ++ (t005A_46 ++ (t005A_47 ++ (t005A_48 ++ (t005A_49 ++ (t005A_50 ++ (t005A_51 ++ (t005A_52 ++ (t005A_53 ++ (t005A_54 ++ (t005A_55 ++ (t005A_56 ++ (t005A_57 ++ (t005A_58 ++ (t005A_59 ++ (t005A_60 ++ (t005A_61 ++ (t005A_62 ++ (t005A_63 ++ (t005A_64))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t005B : List Tok := t005B_0 ++ (t005B_1 ++ (t005B_2 ++ (t005B_3 ++ (t005B_4 ++ (t005B_5 ++ (t005B_6 ++ (t005B_7 ++ (t005B_8 ++ (t005B_9 ++ (t005B_10 ++ (t005B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 005：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run005 : (nbRun P nb005 0 kN005 t005A).1 = true ∧ (nbRun P nb005 1 kN005 t005B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s005A_0) (wseg_append (wseg_of s005A_1) (wseg_append (wseg_of s005A_2) (wseg_append (wseg_of s005A_3) (wseg_append (wseg_of s005A_4) (wseg_append (wseg_of s005A_5) (wseg_append (wseg_of s005A_6) (wseg_append (wseg_of s005A_7) (wseg_append (wseg_of s005A_8) (wseg_append (wseg_of s005A_9) (wseg_append (wseg_of s005A_10) (wseg_append (wseg_of s005A_11) (wseg_append (wseg_of s005A_12) (wseg_append (wseg_of s005A_13) (wseg_append (wseg_of s005A_14) (wseg_append (wseg_of s005A_15) (wseg_append (wseg_of s005A_16) (wseg_append (wseg_of s005A_17) (wseg_append (wseg_of s005A_18) (wseg_append (wseg_of s005A_19) (wseg_append (wseg_of s005A_20) (wseg_append (wseg_of s005A_21) (wseg_append (wseg_of s005A_22) (wseg_append (wseg_of s005A_23) (wseg_append (wseg_of s005A_24) (wseg_append (wseg_of s005A_25) (wseg_append (wseg_of s005A_26) (wseg_append (wseg_of s005A_27) (wseg_append (wseg_of s005A_28) (wseg_append (wseg_of s005A_29) (wseg_append (wseg_of s005A_30) (wseg_append (wseg_of s005A_31) (wseg_append (wseg_of s005A_32) (wseg_append (wseg_of s005A_33) (wseg_append (wseg_of s005A_34) (wseg_append (wseg_of s005A_35) (wseg_append (wseg_of s005A_36) (wseg_append (wseg_of s005A_37) (wseg_append (wseg_of s005A_38) (wseg_append (wseg_of s005A_39) (wseg_append (wseg_of s005A_40) (wseg_append (wseg_of s005A_41) (wseg_append (wseg_of s005A_42) (wseg_append (wseg_of s005A_43) (wseg_append (wseg_of s005A_44) (wseg_append (wseg_of s005A_45) (wseg_append (wseg_of s005A_46) (wseg_append (wseg_of s005A_47) (wseg_append (wseg_of s005A_48) (wseg_append (wseg_of s005A_49) (wseg_append (wseg_of s005A_50) (wseg_append (wseg_of s005A_51) (wseg_append (wseg_of s005A_52) (wseg_append (wseg_of s005A_53) (wseg_append (wseg_of s005A_54) (wseg_append (wseg_of s005A_55) (wseg_append (wseg_of s005A_56) (wseg_append (wseg_of s005A_57) (wseg_append (wseg_of s005A_58) (wseg_append (wseg_of s005A_59) (wseg_append (wseg_of s005A_60) (wseg_append (wseg_of s005A_61) (wseg_append (wseg_of s005A_62) (wseg_append (wseg_of s005A_63) (wseg_of s005A_64))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s005B_0) (wseg_append (wseg_of s005B_1) (wseg_append (wseg_of s005B_2) (wseg_append (wseg_of s005B_3) (wseg_append (wseg_of s005B_4) (wseg_append (wseg_of s005B_5) (wseg_append (wseg_of s005B_6) (wseg_append (wseg_of s005B_7) (wseg_append (wseg_of s005B_8) (wseg_append (wseg_of s005B_9) (wseg_append (wseg_of s005B_10) (wseg_of s005B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t006A : List Tok := t006A_0 ++ (t006A_1 ++ (t006A_2 ++ (t006A_3 ++ (t006A_4 ++ (t006A_5 ++ (t006A_6 ++ (t006A_7 ++ (t006A_8 ++ (t006A_9 ++ (t006A_10 ++ (t006A_11 ++ (t006A_12 ++ (t006A_13 ++ (t006A_14 ++ (t006A_15 ++ (t006A_16 ++ (t006A_17 ++ (t006A_18 ++ (t006A_19 ++ (t006A_20 ++ (t006A_21 ++ (t006A_22 ++ (t006A_23 ++ (t006A_24 ++ (t006A_25 ++ (t006A_26 ++ (t006A_27 ++ (t006A_28 ++ (t006A_29 ++ (t006A_30 ++ (t006A_31 ++ (t006A_32 ++ (t006A_33 ++ (t006A_34 ++ (t006A_35 ++ (t006A_36 ++ (t006A_37 ++ (t006A_38 ++ (t006A_39 ++ (t006A_40 ++ (t006A_41 ++ (t006A_42 ++ (t006A_43 ++ (t006A_44 ++ (t006A_45 ++ (t006A_46 ++ (t006A_47 ++ (t006A_48 ++ (t006A_49 ++ (t006A_50 ++ (t006A_51 ++ (t006A_52 ++ (t006A_53 ++ (t006A_54 ++ (t006A_55 ++ (t006A_56 ++ (t006A_57 ++ (t006A_58 ++ (t006A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t006B : List Tok := t006B_0 ++ (t006B_1 ++ (t006B_2 ++ (t006B_3 ++ (t006B_4 ++ (t006B_5 ++ (t006B_6 ++ (t006B_7 ++ (t006B_8 ++ (t006B_9 ++ (t006B_10 ++ (t006B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 006：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run006 : (nbRun P nb006 0 kN006 t006A).1 = true ∧ (nbRun P nb006 1 kN006 t006B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s006A_0) (wseg_append (wseg_of s006A_1) (wseg_append (wseg_of s006A_2) (wseg_append (wseg_of s006A_3) (wseg_append (wseg_of s006A_4) (wseg_append (wseg_of s006A_5) (wseg_append (wseg_of s006A_6) (wseg_append (wseg_of s006A_7) (wseg_append (wseg_of s006A_8) (wseg_append (wseg_of s006A_9) (wseg_append (wseg_of s006A_10) (wseg_append (wseg_of s006A_11) (wseg_append (wseg_of s006A_12) (wseg_append (wseg_of s006A_13) (wseg_append (wseg_of s006A_14) (wseg_append (wseg_of s006A_15) (wseg_append (wseg_of s006A_16) (wseg_append (wseg_of s006A_17) (wseg_append (wseg_of s006A_18) (wseg_append (wseg_of s006A_19) (wseg_append (wseg_of s006A_20) (wseg_append (wseg_of s006A_21) (wseg_append (wseg_of s006A_22) (wseg_append (wseg_of s006A_23) (wseg_append (wseg_of s006A_24) (wseg_append (wseg_of s006A_25) (wseg_append (wseg_of s006A_26) (wseg_append (wseg_of s006A_27) (wseg_append (wseg_of s006A_28) (wseg_append (wseg_of s006A_29) (wseg_append (wseg_of s006A_30) (wseg_append (wseg_of s006A_31) (wseg_append (wseg_of s006A_32) (wseg_append (wseg_of s006A_33) (wseg_append (wseg_of s006A_34) (wseg_append (wseg_of s006A_35) (wseg_append (wseg_of s006A_36) (wseg_append (wseg_of s006A_37) (wseg_append (wseg_of s006A_38) (wseg_append (wseg_of s006A_39) (wseg_append (wseg_of s006A_40) (wseg_append (wseg_of s006A_41) (wseg_append (wseg_of s006A_42) (wseg_append (wseg_of s006A_43) (wseg_append (wseg_of s006A_44) (wseg_append (wseg_of s006A_45) (wseg_append (wseg_of s006A_46) (wseg_append (wseg_of s006A_47) (wseg_append (wseg_of s006A_48) (wseg_append (wseg_of s006A_49) (wseg_append (wseg_of s006A_50) (wseg_append (wseg_of s006A_51) (wseg_append (wseg_of s006A_52) (wseg_append (wseg_of s006A_53) (wseg_append (wseg_of s006A_54) (wseg_append (wseg_of s006A_55) (wseg_append (wseg_of s006A_56) (wseg_append (wseg_of s006A_57) (wseg_append (wseg_of s006A_58) (wseg_of s006A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s006B_0) (wseg_append (wseg_of s006B_1) (wseg_append (wseg_of s006B_2) (wseg_append (wseg_of s006B_3) (wseg_append (wseg_of s006B_4) (wseg_append (wseg_of s006B_5) (wseg_append (wseg_of s006B_6) (wseg_append (wseg_of s006B_7) (wseg_append (wseg_of s006B_8) (wseg_append (wseg_of s006B_9) (wseg_append (wseg_of s006B_10) (wseg_of s006B_11))))))))))))⟩

end PackLean.D40.Tet
