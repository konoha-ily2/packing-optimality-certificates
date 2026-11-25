-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS024_0
import PackLean.D40.K.FarS024_1
import PackLean.D40.K.FarS024_2
import PackLean.D40.K.FarS024_3
import PackLean.D40.K.FarS024_4
import PackLean.D40.K.FarS024_5
import PackLean.D40.K.FarS024_6
import PackLean.D40.K.FarS024_7
import PackLean.D40.K.FarS024_8
import PackLean.D40.K.FarS024_9
import PackLean.D40.K.FarS024_10
import PackLean.D40.K.FarS024_11
import PackLean.D40.K.FarS024_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t075A : List Tok := t075A_0 ++ (t075A_1 ++ (t075A_2 ++ (t075A_3 ++ (t075A_4 ++ (t075A_5 ++ (t075A_6 ++ (t075A_7 ++ (t075A_8 ++ (t075A_9 ++ (t075A_10 ++ (t075A_11 ++ (t075A_12 ++ (t075A_13 ++ (t075A_14 ++ (t075A_15 ++ (t075A_16 ++ (t075A_17 ++ (t075A_18 ++ (t075A_19 ++ (t075A_20 ++ (t075A_21 ++ (t075A_22 ++ (t075A_23 ++ (t075A_24 ++ (t075A_25 ++ (t075A_26 ++ (t075A_27 ++ (t075A_28 ++ (t075A_29 ++ (t075A_30 ++ (t075A_31 ++ (t075A_32 ++ (t075A_33 ++ (t075A_34 ++ (t075A_35 ++ (t075A_36 ++ (t075A_37 ++ (t075A_38 ++ (t075A_39 ++ (t075A_40 ++ (t075A_41 ++ (t075A_42 ++ (t075A_43 ++ (t075A_44 ++ (t075A_45 ++ (t075A_46 ++ (t075A_47 ++ (t075A_48 ++ (t075A_49 ++ (t075A_50 ++ (t075A_51)))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t075B : List Tok := t075B_0 ++ (t075B_1 ++ (t075B_2 ++ (t075B_3 ++ (t075B_4 ++ (t075B_5 ++ (t075B_6 ++ (t075B_7 ++ (t075B_8 ++ (t075B_9 ++ (t075B_10 ++ (t075B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 075：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run075 : (nbRun P nb075 0 kN075 t075A).1 = true ∧ (nbRun P nb075 1 kN075 t075B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s075A_0) (wseg_append (wseg_of s075A_1) (wseg_append (wseg_of s075A_2) (wseg_append (wseg_of s075A_3) (wseg_append (wseg_of s075A_4) (wseg_append (wseg_of s075A_5) (wseg_append (wseg_of s075A_6) (wseg_append (wseg_of s075A_7) (wseg_append (wseg_of s075A_8) (wseg_append (wseg_of s075A_9) (wseg_append (wseg_of s075A_10) (wseg_append (wseg_of s075A_11) (wseg_append (wseg_of s075A_12) (wseg_append (wseg_of s075A_13) (wseg_append (wseg_of s075A_14) (wseg_append (wseg_of s075A_15) (wseg_append (wseg_of s075A_16) (wseg_append (wseg_of s075A_17) (wseg_append (wseg_of s075A_18) (wseg_append (wseg_of s075A_19) (wseg_append (wseg_of s075A_20) (wseg_append (wseg_of s075A_21) (wseg_append (wseg_of s075A_22) (wseg_append (wseg_of s075A_23) (wseg_append (wseg_of s075A_24) (wseg_append (wseg_of s075A_25) (wseg_append (wseg_of s075A_26) (wseg_append (wseg_of s075A_27) (wseg_append (wseg_of s075A_28) (wseg_append (wseg_of s075A_29) (wseg_append (wseg_of s075A_30) (wseg_append (wseg_of s075A_31) (wseg_append (wseg_of s075A_32) (wseg_append (wseg_of s075A_33) (wseg_append (wseg_of s075A_34) (wseg_append (wseg_of s075A_35) (wseg_append (wseg_of s075A_36) (wseg_append (wseg_of s075A_37) (wseg_append (wseg_of s075A_38) (wseg_append (wseg_of s075A_39) (wseg_append (wseg_of s075A_40) (wseg_append (wseg_of s075A_41) (wseg_append (wseg_of s075A_42) (wseg_append (wseg_of s075A_43) (wseg_append (wseg_of s075A_44) (wseg_append (wseg_of s075A_45) (wseg_append (wseg_of s075A_46) (wseg_append (wseg_of s075A_47) (wseg_append (wseg_of s075A_48) (wseg_append (wseg_of s075A_49) (wseg_append (wseg_of s075A_50) (wseg_of s075A_51)))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s075B_0) (wseg_append (wseg_of s075B_1) (wseg_append (wseg_of s075B_2) (wseg_append (wseg_of s075B_3) (wseg_append (wseg_of s075B_4) (wseg_append (wseg_of s075B_5) (wseg_append (wseg_of s075B_6) (wseg_append (wseg_of s075B_7) (wseg_append (wseg_of s075B_8) (wseg_append (wseg_of s075B_9) (wseg_append (wseg_of s075B_10) (wseg_of s075B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076A : List Tok := t076A_0 ++ (t076A_1 ++ (t076A_2 ++ (t076A_3 ++ (t076A_4 ++ (t076A_5 ++ (t076A_6 ++ (t076A_7 ++ (t076A_8 ++ (t076A_9 ++ (t076A_10 ++ (t076A_11 ++ (t076A_12 ++ (t076A_13 ++ (t076A_14 ++ (t076A_15 ++ (t076A_16 ++ (t076A_17 ++ (t076A_18 ++ (t076A_19 ++ (t076A_20 ++ (t076A_21 ++ (t076A_22 ++ (t076A_23 ++ (t076A_24 ++ (t076A_25 ++ (t076A_26 ++ (t076A_27 ++ (t076A_28 ++ (t076A_29 ++ (t076A_30 ++ (t076A_31 ++ (t076A_32 ++ (t076A_33 ++ (t076A_34 ++ (t076A_35 ++ (t076A_36 ++ (t076A_37 ++ (t076A_38 ++ (t076A_39 ++ (t076A_40 ++ (t076A_41 ++ (t076A_42 ++ (t076A_43 ++ (t076A_44 ++ (t076A_45 ++ (t076A_46 ++ (t076A_47)))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t076B : List Tok := t076B_0 ++ (t076B_1 ++ (t076B_2 ++ (t076B_3 ++ (t076B_4 ++ (t076B_5 ++ (t076B_6 ++ (t076B_7 ++ (t076B_8 ++ (t076B_9 ++ (t076B_10 ++ (t076B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 076：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run076 : (nbRun P nb076 0 kN076 t076A).1 = true ∧ (nbRun P nb076 1 kN076 t076B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s076A_0) (wseg_append (wseg_of s076A_1) (wseg_append (wseg_of s076A_2) (wseg_append (wseg_of s076A_3) (wseg_append (wseg_of s076A_4) (wseg_append (wseg_of s076A_5) (wseg_append (wseg_of s076A_6) (wseg_append (wseg_of s076A_7) (wseg_append (wseg_of s076A_8) (wseg_append (wseg_of s076A_9) (wseg_append (wseg_of s076A_10) (wseg_append (wseg_of s076A_11) (wseg_append (wseg_of s076A_12) (wseg_append (wseg_of s076A_13) (wseg_append (wseg_of s076A_14) (wseg_append (wseg_of s076A_15) (wseg_append (wseg_of s076A_16) (wseg_append (wseg_of s076A_17) (wseg_append (wseg_of s076A_18) (wseg_append (wseg_of s076A_19) (wseg_append (wseg_of s076A_20) (wseg_append (wseg_of s076A_21) (wseg_append (wseg_of s076A_22) (wseg_append (wseg_of s076A_23) (wseg_append (wseg_of s076A_24) (wseg_append (wseg_of s076A_25) (wseg_append (wseg_of s076A_26) (wseg_append (wseg_of s076A_27) (wseg_append (wseg_of s076A_28) (wseg_append (wseg_of s076A_29) (wseg_append (wseg_of s076A_30) (wseg_append (wseg_of s076A_31) (wseg_append (wseg_of s076A_32) (wseg_append (wseg_of s076A_33) (wseg_append (wseg_of s076A_34) (wseg_append (wseg_of s076A_35) (wseg_append (wseg_of s076A_36) (wseg_append (wseg_of s076A_37) (wseg_append (wseg_of s076A_38) (wseg_append (wseg_of s076A_39) (wseg_append (wseg_of s076A_40) (wseg_append (wseg_of s076A_41) (wseg_append (wseg_of s076A_42) (wseg_append (wseg_of s076A_43) (wseg_append (wseg_of s076A_44) (wseg_append (wseg_of s076A_45) (wseg_append (wseg_of s076A_46) (wseg_of s076A_47)))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s076B_0) (wseg_append (wseg_of s076B_1) (wseg_append (wseg_of s076B_2) (wseg_append (wseg_of s076B_3) (wseg_append (wseg_of s076B_4) (wseg_append (wseg_of s076B_5) (wseg_append (wseg_of s076B_6) (wseg_append (wseg_of s076B_7) (wseg_append (wseg_of s076B_8) (wseg_append (wseg_of s076B_9) (wseg_append (wseg_of s076B_10) (wseg_of s076B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077A : List Tok := t077A_0 ++ (t077A_1 ++ (t077A_2 ++ (t077A_3 ++ (t077A_4 ++ (t077A_5 ++ (t077A_6 ++ (t077A_7 ++ (t077A_8 ++ (t077A_9 ++ (t077A_10 ++ (t077A_11 ++ (t077A_12 ++ (t077A_13 ++ (t077A_14 ++ (t077A_15 ++ (t077A_16 ++ (t077A_17 ++ (t077A_18 ++ (t077A_19 ++ (t077A_20 ++ (t077A_21 ++ (t077A_22 ++ (t077A_23 ++ (t077A_24 ++ (t077A_25 ++ (t077A_26 ++ (t077A_27 ++ (t077A_28 ++ (t077A_29 ++ (t077A_30 ++ (t077A_31 ++ (t077A_32 ++ (t077A_33 ++ (t077A_34 ++ (t077A_35 ++ (t077A_36 ++ (t077A_37 ++ (t077A_38 ++ (t077A_39 ++ (t077A_40 ++ (t077A_41 ++ (t077A_42 ++ (t077A_43 ++ (t077A_44 ++ (t077A_45 ++ (t077A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t077B : List Tok := t077B_0 ++ (t077B_1 ++ (t077B_2 ++ (t077B_3 ++ (t077B_4 ++ (t077B_5 ++ (t077B_6 ++ (t077B_7 ++ (t077B_8 ++ (t077B_9 ++ (t077B_10 ++ (t077B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 077：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run077 : (nbRun P nb077 0 kN077 t077A).1 = true ∧ (nbRun P nb077 1 kN077 t077B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s077A_0) (wseg_append (wseg_of s077A_1) (wseg_append (wseg_of s077A_2) (wseg_append (wseg_of s077A_3) (wseg_append (wseg_of s077A_4) (wseg_append (wseg_of s077A_5) (wseg_append (wseg_of s077A_6) (wseg_append (wseg_of s077A_7) (wseg_append (wseg_of s077A_8) (wseg_append (wseg_of s077A_9) (wseg_append (wseg_of s077A_10) (wseg_append (wseg_of s077A_11) (wseg_append (wseg_of s077A_12) (wseg_append (wseg_of s077A_13) (wseg_append (wseg_of s077A_14) (wseg_append (wseg_of s077A_15) (wseg_append (wseg_of s077A_16) (wseg_append (wseg_of s077A_17) (wseg_append (wseg_of s077A_18) (wseg_append (wseg_of s077A_19) (wseg_append (wseg_of s077A_20) (wseg_append (wseg_of s077A_21) (wseg_append (wseg_of s077A_22) (wseg_append (wseg_of s077A_23) (wseg_append (wseg_of s077A_24) (wseg_append (wseg_of s077A_25) (wseg_append (wseg_of s077A_26) (wseg_append (wseg_of s077A_27) (wseg_append (wseg_of s077A_28) (wseg_append (wseg_of s077A_29) (wseg_append (wseg_of s077A_30) (wseg_append (wseg_of s077A_31) (wseg_append (wseg_of s077A_32) (wseg_append (wseg_of s077A_33) (wseg_append (wseg_of s077A_34) (wseg_append (wseg_of s077A_35) (wseg_append (wseg_of s077A_36) (wseg_append (wseg_of s077A_37) (wseg_append (wseg_of s077A_38) (wseg_append (wseg_of s077A_39) (wseg_append (wseg_of s077A_40) (wseg_append (wseg_of s077A_41) (wseg_append (wseg_of s077A_42) (wseg_append (wseg_of s077A_43) (wseg_append (wseg_of s077A_44) (wseg_append (wseg_of s077A_45) (wseg_of s077A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s077B_0) (wseg_append (wseg_of s077B_1) (wseg_append (wseg_of s077B_2) (wseg_append (wseg_of s077B_3) (wseg_append (wseg_of s077B_4) (wseg_append (wseg_of s077B_5) (wseg_append (wseg_of s077B_6) (wseg_append (wseg_of s077B_7) (wseg_append (wseg_of s077B_8) (wseg_append (wseg_of s077B_9) (wseg_append (wseg_of s077B_10) (wseg_of s077B_11))))))))))))⟩

end PackLean.D40.Tet
