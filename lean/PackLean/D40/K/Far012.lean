-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS012_0
import PackLean.D40.K.FarS012_1
import PackLean.D40.K.FarS012_2
import PackLean.D40.K.FarS012_3
import PackLean.D40.K.FarS012_4
import PackLean.D40.K.FarS012_5
import PackLean.D40.K.FarS012_6
import PackLean.D40.K.FarS012_7
import PackLean.D40.K.FarS012_8
import PackLean.D40.K.FarS012_9
import PackLean.D40.K.FarS012_10
import PackLean.D40.K.FarS012_11
import PackLean.D40.K.FarS012_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t034A : List Tok := t034A_0 ++ (t034A_1 ++ (t034A_2 ++ (t034A_3 ++ (t034A_4 ++ (t034A_5 ++ (t034A_6 ++ (t034A_7 ++ (t034A_8 ++ (t034A_9 ++ (t034A_10 ++ (t034A_11 ++ (t034A_12 ++ (t034A_13 ++ (t034A_14 ++ (t034A_15 ++ (t034A_16 ++ (t034A_17 ++ (t034A_18 ++ (t034A_19 ++ (t034A_20 ++ (t034A_21 ++ (t034A_22 ++ (t034A_23 ++ (t034A_24 ++ (t034A_25 ++ (t034A_26 ++ (t034A_27 ++ (t034A_28 ++ (t034A_29 ++ (t034A_30 ++ (t034A_31 ++ (t034A_32 ++ (t034A_33 ++ (t034A_34 ++ (t034A_35 ++ (t034A_36 ++ (t034A_37 ++ (t034A_38 ++ (t034A_39 ++ (t034A_40 ++ (t034A_41 ++ (t034A_42 ++ (t034A_43 ++ (t034A_44 ++ (t034A_45 ++ (t034A_46 ++ (t034A_47 ++ (t034A_48 ++ (t034A_49 ++ (t034A_50 ++ (t034A_51 ++ (t034A_52))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t034B : List Tok := t034B_0 ++ (t034B_1 ++ (t034B_2 ++ (t034B_3 ++ (t034B_4 ++ (t034B_5 ++ (t034B_6 ++ (t034B_7 ++ (t034B_8 ++ (t034B_9 ++ (t034B_10 ++ (t034B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 034：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run034 : (nbRun P nb034 0 kN034 t034A).1 = true ∧ (nbRun P nb034 1 kN034 t034B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s034A_0) (wseg_append (wseg_of s034A_1) (wseg_append (wseg_of s034A_2) (wseg_append (wseg_of s034A_3) (wseg_append (wseg_of s034A_4) (wseg_append (wseg_of s034A_5) (wseg_append (wseg_of s034A_6) (wseg_append (wseg_of s034A_7) (wseg_append (wseg_of s034A_8) (wseg_append (wseg_of s034A_9) (wseg_append (wseg_of s034A_10) (wseg_append (wseg_of s034A_11) (wseg_append (wseg_of s034A_12) (wseg_append (wseg_of s034A_13) (wseg_append (wseg_of s034A_14) (wseg_append (wseg_of s034A_15) (wseg_append (wseg_of s034A_16) (wseg_append (wseg_of s034A_17) (wseg_append (wseg_of s034A_18) (wseg_append (wseg_of s034A_19) (wseg_append (wseg_of s034A_20) (wseg_append (wseg_of s034A_21) (wseg_append (wseg_of s034A_22) (wseg_append (wseg_of s034A_23) (wseg_append (wseg_of s034A_24) (wseg_append (wseg_of s034A_25) (wseg_append (wseg_of s034A_26) (wseg_append (wseg_of s034A_27) (wseg_append (wseg_of s034A_28) (wseg_append (wseg_of s034A_29) (wseg_append (wseg_of s034A_30) (wseg_append (wseg_of s034A_31) (wseg_append (wseg_of s034A_32) (wseg_append (wseg_of s034A_33) (wseg_append (wseg_of s034A_34) (wseg_append (wseg_of s034A_35) (wseg_append (wseg_of s034A_36) (wseg_append (wseg_of s034A_37) (wseg_append (wseg_of s034A_38) (wseg_append (wseg_of s034A_39) (wseg_append (wseg_of s034A_40) (wseg_append (wseg_of s034A_41) (wseg_append (wseg_of s034A_42) (wseg_append (wseg_of s034A_43) (wseg_append (wseg_of s034A_44) (wseg_append (wseg_of s034A_45) (wseg_append (wseg_of s034A_46) (wseg_append (wseg_of s034A_47) (wseg_append (wseg_of s034A_48) (wseg_append (wseg_of s034A_49) (wseg_append (wseg_of s034A_50) (wseg_append (wseg_of s034A_51) (wseg_of s034A_52))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s034B_0) (wseg_append (wseg_of s034B_1) (wseg_append (wseg_of s034B_2) (wseg_append (wseg_of s034B_3) (wseg_append (wseg_of s034B_4) (wseg_append (wseg_of s034B_5) (wseg_append (wseg_of s034B_6) (wseg_append (wseg_of s034B_7) (wseg_append (wseg_of s034B_8) (wseg_append (wseg_of s034B_9) (wseg_append (wseg_of s034B_10) (wseg_of s034B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t035A : List Tok := t035A_0 ++ (t035A_1 ++ (t035A_2 ++ (t035A_3 ++ (t035A_4 ++ (t035A_5 ++ (t035A_6 ++ (t035A_7 ++ (t035A_8 ++ (t035A_9 ++ (t035A_10 ++ (t035A_11 ++ (t035A_12 ++ (t035A_13 ++ (t035A_14 ++ (t035A_15 ++ (t035A_16 ++ (t035A_17 ++ (t035A_18 ++ (t035A_19 ++ (t035A_20 ++ (t035A_21 ++ (t035A_22 ++ (t035A_23 ++ (t035A_24 ++ (t035A_25 ++ (t035A_26 ++ (t035A_27 ++ (t035A_28 ++ (t035A_29 ++ (t035A_30 ++ (t035A_31 ++ (t035A_32 ++ (t035A_33 ++ (t035A_34 ++ (t035A_35 ++ (t035A_36 ++ (t035A_37 ++ (t035A_38 ++ (t035A_39 ++ (t035A_40 ++ (t035A_41 ++ (t035A_42 ++ (t035A_43 ++ (t035A_44 ++ (t035A_45 ++ (t035A_46 ++ (t035A_47 ++ (t035A_48 ++ (t035A_49 ++ (t035A_50))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t035B : List Tok := t035B_0 ++ (t035B_1 ++ (t035B_2 ++ (t035B_3 ++ (t035B_4 ++ (t035B_5 ++ (t035B_6 ++ (t035B_7 ++ (t035B_8 ++ (t035B_9 ++ (t035B_10 ++ (t035B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 035：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run035 : (nbRun P nb035 0 kN035 t035A).1 = true ∧ (nbRun P nb035 1 kN035 t035B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s035A_0) (wseg_append (wseg_of s035A_1) (wseg_append (wseg_of s035A_2) (wseg_append (wseg_of s035A_3) (wseg_append (wseg_of s035A_4) (wseg_append (wseg_of s035A_5) (wseg_append (wseg_of s035A_6) (wseg_append (wseg_of s035A_7) (wseg_append (wseg_of s035A_8) (wseg_append (wseg_of s035A_9) (wseg_append (wseg_of s035A_10) (wseg_append (wseg_of s035A_11) (wseg_append (wseg_of s035A_12) (wseg_append (wseg_of s035A_13) (wseg_append (wseg_of s035A_14) (wseg_append (wseg_of s035A_15) (wseg_append (wseg_of s035A_16) (wseg_append (wseg_of s035A_17) (wseg_append (wseg_of s035A_18) (wseg_append (wseg_of s035A_19) (wseg_append (wseg_of s035A_20) (wseg_append (wseg_of s035A_21) (wseg_append (wseg_of s035A_22) (wseg_append (wseg_of s035A_23) (wseg_append (wseg_of s035A_24) (wseg_append (wseg_of s035A_25) (wseg_append (wseg_of s035A_26) (wseg_append (wseg_of s035A_27) (wseg_append (wseg_of s035A_28) (wseg_append (wseg_of s035A_29) (wseg_append (wseg_of s035A_30) (wseg_append (wseg_of s035A_31) (wseg_append (wseg_of s035A_32) (wseg_append (wseg_of s035A_33) (wseg_append (wseg_of s035A_34) (wseg_append (wseg_of s035A_35) (wseg_append (wseg_of s035A_36) (wseg_append (wseg_of s035A_37) (wseg_append (wseg_of s035A_38) (wseg_append (wseg_of s035A_39) (wseg_append (wseg_of s035A_40) (wseg_append (wseg_of s035A_41) (wseg_append (wseg_of s035A_42) (wseg_append (wseg_of s035A_43) (wseg_append (wseg_of s035A_44) (wseg_append (wseg_of s035A_45) (wseg_append (wseg_of s035A_46) (wseg_append (wseg_of s035A_47) (wseg_append (wseg_of s035A_48) (wseg_append (wseg_of s035A_49) (wseg_of s035A_50))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s035B_0) (wseg_append (wseg_of s035B_1) (wseg_append (wseg_of s035B_2) (wseg_append (wseg_of s035B_3) (wseg_append (wseg_of s035B_4) (wseg_append (wseg_of s035B_5) (wseg_append (wseg_of s035B_6) (wseg_append (wseg_of s035B_7) (wseg_append (wseg_of s035B_8) (wseg_append (wseg_of s035B_9) (wseg_append (wseg_of s035B_10) (wseg_of s035B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t036A : List Tok := t036A_0 ++ (t036A_1 ++ (t036A_2 ++ (t036A_3 ++ (t036A_4 ++ (t036A_5 ++ (t036A_6 ++ (t036A_7 ++ (t036A_8 ++ (t036A_9 ++ (t036A_10 ++ (t036A_11 ++ (t036A_12 ++ (t036A_13 ++ (t036A_14 ++ (t036A_15 ++ (t036A_16 ++ (t036A_17 ++ (t036A_18 ++ (t036A_19 ++ (t036A_20 ++ (t036A_21 ++ (t036A_22 ++ (t036A_23 ++ (t036A_24 ++ (t036A_25 ++ (t036A_26 ++ (t036A_27 ++ (t036A_28 ++ (t036A_29 ++ (t036A_30 ++ (t036A_31 ++ (t036A_32 ++ (t036A_33 ++ (t036A_34 ++ (t036A_35 ++ (t036A_36 ++ (t036A_37 ++ (t036A_38 ++ (t036A_39 ++ (t036A_40 ++ (t036A_41 ++ (t036A_42 ++ (t036A_43 ++ (t036A_44 ++ (t036A_45 ++ (t036A_46 ++ (t036A_47 ++ (t036A_48 ++ (t036A_49 ++ (t036A_50 ++ (t036A_51 ++ (t036A_52 ++ (t036A_53)))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t036B : List Tok := t036B_0 ++ (t036B_1 ++ (t036B_2 ++ (t036B_3 ++ (t036B_4 ++ (t036B_5 ++ (t036B_6 ++ (t036B_7 ++ (t036B_8 ++ (t036B_9 ++ (t036B_10 ++ (t036B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 036：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run036 : (nbRun P nb036 0 kN036 t036A).1 = true ∧ (nbRun P nb036 1 kN036 t036B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s036A_0) (wseg_append (wseg_of s036A_1) (wseg_append (wseg_of s036A_2) (wseg_append (wseg_of s036A_3) (wseg_append (wseg_of s036A_4) (wseg_append (wseg_of s036A_5) (wseg_append (wseg_of s036A_6) (wseg_append (wseg_of s036A_7) (wseg_append (wseg_of s036A_8) (wseg_append (wseg_of s036A_9) (wseg_append (wseg_of s036A_10) (wseg_append (wseg_of s036A_11) (wseg_append (wseg_of s036A_12) (wseg_append (wseg_of s036A_13) (wseg_append (wseg_of s036A_14) (wseg_append (wseg_of s036A_15) (wseg_append (wseg_of s036A_16) (wseg_append (wseg_of s036A_17) (wseg_append (wseg_of s036A_18) (wseg_append (wseg_of s036A_19) (wseg_append (wseg_of s036A_20) (wseg_append (wseg_of s036A_21) (wseg_append (wseg_of s036A_22) (wseg_append (wseg_of s036A_23) (wseg_append (wseg_of s036A_24) (wseg_append (wseg_of s036A_25) (wseg_append (wseg_of s036A_26) (wseg_append (wseg_of s036A_27) (wseg_append (wseg_of s036A_28) (wseg_append (wseg_of s036A_29) (wseg_append (wseg_of s036A_30) (wseg_append (wseg_of s036A_31) (wseg_append (wseg_of s036A_32) (wseg_append (wseg_of s036A_33) (wseg_append (wseg_of s036A_34) (wseg_append (wseg_of s036A_35) (wseg_append (wseg_of s036A_36) (wseg_append (wseg_of s036A_37) (wseg_append (wseg_of s036A_38) (wseg_append (wseg_of s036A_39) (wseg_append (wseg_of s036A_40) (wseg_append (wseg_of s036A_41) (wseg_append (wseg_of s036A_42) (wseg_append (wseg_of s036A_43) (wseg_append (wseg_of s036A_44) (wseg_append (wseg_of s036A_45) (wseg_append (wseg_of s036A_46) (wseg_append (wseg_of s036A_47) (wseg_append (wseg_of s036A_48) (wseg_append (wseg_of s036A_49) (wseg_append (wseg_of s036A_50) (wseg_append (wseg_of s036A_51) (wseg_append (wseg_of s036A_52) (wseg_of s036A_53)))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s036B_0) (wseg_append (wseg_of s036B_1) (wseg_append (wseg_of s036B_2) (wseg_append (wseg_of s036B_3) (wseg_append (wseg_of s036B_4) (wseg_append (wseg_of s036B_5) (wseg_append (wseg_of s036B_6) (wseg_append (wseg_of s036B_7) (wseg_append (wseg_of s036B_8) (wseg_append (wseg_of s036B_9) (wseg_append (wseg_of s036B_10) (wseg_of s036B_11))))))))))))⟩

end PackLean.D40.Tet
