-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS035_0
import PackLean.D40.K.FarS035_1
import PackLean.D40.K.FarS035_2
import PackLean.D40.K.FarS035_3
import PackLean.D40.K.FarS035_4
import PackLean.D40.K.FarS035_5
import PackLean.D40.K.FarS035_6
import PackLean.D40.K.FarS035_7
import PackLean.D40.K.FarS035_8
import PackLean.D40.K.FarS035_9
import PackLean.D40.K.FarS035_10
import PackLean.D40.K.FarS035_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t108A : List Tok := t108A_0 ++ (t108A_1 ++ (t108A_2 ++ (t108A_3 ++ (t108A_4 ++ (t108A_5 ++ (t108A_6 ++ (t108A_7 ++ (t108A_8 ++ (t108A_9 ++ (t108A_10 ++ (t108A_11 ++ (t108A_12 ++ (t108A_13 ++ (t108A_14 ++ (t108A_15 ++ (t108A_16 ++ (t108A_17 ++ (t108A_18 ++ (t108A_19 ++ (t108A_20 ++ (t108A_21 ++ (t108A_22 ++ (t108A_23 ++ (t108A_24 ++ (t108A_25 ++ (t108A_26 ++ (t108A_27 ++ (t108A_28 ++ (t108A_29 ++ (t108A_30 ++ (t108A_31 ++ (t108A_32 ++ (t108A_33 ++ (t108A_34 ++ (t108A_35 ++ (t108A_36 ++ (t108A_37 ++ (t108A_38 ++ (t108A_39 ++ (t108A_40 ++ (t108A_41 ++ (t108A_42 ++ (t108A_43)))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t108B : List Tok := t108B_0 ++ (t108B_1 ++ (t108B_2 ++ (t108B_3 ++ (t108B_4 ++ (t108B_5 ++ (t108B_6 ++ (t108B_7 ++ (t108B_8 ++ (t108B_9 ++ (t108B_10 ++ (t108B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 108：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run108 : (nbRun P nb108 0 kN108 t108A).1 = true ∧ (nbRun P nb108 1 kN108 t108B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s108A_0) (wseg_append (wseg_of s108A_1) (wseg_append (wseg_of s108A_2) (wseg_append (wseg_of s108A_3) (wseg_append (wseg_of s108A_4) (wseg_append (wseg_of s108A_5) (wseg_append (wseg_of s108A_6) (wseg_append (wseg_of s108A_7) (wseg_append (wseg_of s108A_8) (wseg_append (wseg_of s108A_9) (wseg_append (wseg_of s108A_10) (wseg_append (wseg_of s108A_11) (wseg_append (wseg_of s108A_12) (wseg_append (wseg_of s108A_13) (wseg_append (wseg_of s108A_14) (wseg_append (wseg_of s108A_15) (wseg_append (wseg_of s108A_16) (wseg_append (wseg_of s108A_17) (wseg_append (wseg_of s108A_18) (wseg_append (wseg_of s108A_19) (wseg_append (wseg_of s108A_20) (wseg_append (wseg_of s108A_21) (wseg_append (wseg_of s108A_22) (wseg_append (wseg_of s108A_23) (wseg_append (wseg_of s108A_24) (wseg_append (wseg_of s108A_25) (wseg_append (wseg_of s108A_26) (wseg_append (wseg_of s108A_27) (wseg_append (wseg_of s108A_28) (wseg_append (wseg_of s108A_29) (wseg_append (wseg_of s108A_30) (wseg_append (wseg_of s108A_31) (wseg_append (wseg_of s108A_32) (wseg_append (wseg_of s108A_33) (wseg_append (wseg_of s108A_34) (wseg_append (wseg_of s108A_35) (wseg_append (wseg_of s108A_36) (wseg_append (wseg_of s108A_37) (wseg_append (wseg_of s108A_38) (wseg_append (wseg_of s108A_39) (wseg_append (wseg_of s108A_40) (wseg_append (wseg_of s108A_41) (wseg_append (wseg_of s108A_42) (wseg_of s108A_43)))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s108B_0) (wseg_append (wseg_of s108B_1) (wseg_append (wseg_of s108B_2) (wseg_append (wseg_of s108B_3) (wseg_append (wseg_of s108B_4) (wseg_append (wseg_of s108B_5) (wseg_append (wseg_of s108B_6) (wseg_append (wseg_of s108B_7) (wseg_append (wseg_of s108B_8) (wseg_append (wseg_of s108B_9) (wseg_append (wseg_of s108B_10) (wseg_of s108B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t109A : List Tok := t109A_0 ++ (t109A_1 ++ (t109A_2 ++ (t109A_3 ++ (t109A_4 ++ (t109A_5 ++ (t109A_6 ++ (t109A_7 ++ (t109A_8 ++ (t109A_9 ++ (t109A_10 ++ (t109A_11 ++ (t109A_12 ++ (t109A_13 ++ (t109A_14 ++ (t109A_15 ++ (t109A_16 ++ (t109A_17 ++ (t109A_18 ++ (t109A_19 ++ (t109A_20 ++ (t109A_21 ++ (t109A_22 ++ (t109A_23 ++ (t109A_24 ++ (t109A_25 ++ (t109A_26 ++ (t109A_27 ++ (t109A_28 ++ (t109A_29 ++ (t109A_30 ++ (t109A_31 ++ (t109A_32 ++ (t109A_33 ++ (t109A_34 ++ (t109A_35 ++ (t109A_36 ++ (t109A_37 ++ (t109A_38 ++ (t109A_39 ++ (t109A_40 ++ (t109A_41 ++ (t109A_42 ++ (t109A_43 ++ (t109A_44 ++ (t109A_45 ++ (t109A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t109B : List Tok := t109B_0 ++ (t109B_1 ++ (t109B_2 ++ (t109B_3 ++ (t109B_4 ++ (t109B_5 ++ (t109B_6 ++ (t109B_7 ++ (t109B_8 ++ (t109B_9 ++ (t109B_10 ++ (t109B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 109：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run109 : (nbRun P nb109 0 kN109 t109A).1 = true ∧ (nbRun P nb109 1 kN109 t109B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s109A_0) (wseg_append (wseg_of s109A_1) (wseg_append (wseg_of s109A_2) (wseg_append (wseg_of s109A_3) (wseg_append (wseg_of s109A_4) (wseg_append (wseg_of s109A_5) (wseg_append (wseg_of s109A_6) (wseg_append (wseg_of s109A_7) (wseg_append (wseg_of s109A_8) (wseg_append (wseg_of s109A_9) (wseg_append (wseg_of s109A_10) (wseg_append (wseg_of s109A_11) (wseg_append (wseg_of s109A_12) (wseg_append (wseg_of s109A_13) (wseg_append (wseg_of s109A_14) (wseg_append (wseg_of s109A_15) (wseg_append (wseg_of s109A_16) (wseg_append (wseg_of s109A_17) (wseg_append (wseg_of s109A_18) (wseg_append (wseg_of s109A_19) (wseg_append (wseg_of s109A_20) (wseg_append (wseg_of s109A_21) (wseg_append (wseg_of s109A_22) (wseg_append (wseg_of s109A_23) (wseg_append (wseg_of s109A_24) (wseg_append (wseg_of s109A_25) (wseg_append (wseg_of s109A_26) (wseg_append (wseg_of s109A_27) (wseg_append (wseg_of s109A_28) (wseg_append (wseg_of s109A_29) (wseg_append (wseg_of s109A_30) (wseg_append (wseg_of s109A_31) (wseg_append (wseg_of s109A_32) (wseg_append (wseg_of s109A_33) (wseg_append (wseg_of s109A_34) (wseg_append (wseg_of s109A_35) (wseg_append (wseg_of s109A_36) (wseg_append (wseg_of s109A_37) (wseg_append (wseg_of s109A_38) (wseg_append (wseg_of s109A_39) (wseg_append (wseg_of s109A_40) (wseg_append (wseg_of s109A_41) (wseg_append (wseg_of s109A_42) (wseg_append (wseg_of s109A_43) (wseg_append (wseg_of s109A_44) (wseg_append (wseg_of s109A_45) (wseg_of s109A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s109B_0) (wseg_append (wseg_of s109B_1) (wseg_append (wseg_of s109B_2) (wseg_append (wseg_of s109B_3) (wseg_append (wseg_of s109B_4) (wseg_append (wseg_of s109B_5) (wseg_append (wseg_of s109B_6) (wseg_append (wseg_of s109B_7) (wseg_append (wseg_of s109B_8) (wseg_append (wseg_of s109B_9) (wseg_append (wseg_of s109B_10) (wseg_of s109B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t110A : List Tok := t110A_0 ++ (t110A_1 ++ (t110A_2 ++ (t110A_3 ++ (t110A_4 ++ (t110A_5 ++ (t110A_6 ++ (t110A_7 ++ (t110A_8 ++ (t110A_9 ++ (t110A_10 ++ (t110A_11 ++ (t110A_12 ++ (t110A_13 ++ (t110A_14 ++ (t110A_15 ++ (t110A_16 ++ (t110A_17 ++ (t110A_18 ++ (t110A_19 ++ (t110A_20 ++ (t110A_21 ++ (t110A_22 ++ (t110A_23 ++ (t110A_24 ++ (t110A_25 ++ (t110A_26 ++ (t110A_27 ++ (t110A_28 ++ (t110A_29 ++ (t110A_30 ++ (t110A_31 ++ (t110A_32 ++ (t110A_33 ++ (t110A_34 ++ (t110A_35 ++ (t110A_36 ++ (t110A_37 ++ (t110A_38 ++ (t110A_39 ++ (t110A_40 ++ (t110A_41 ++ (t110A_42 ++ (t110A_43 ++ (t110A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t110B : List Tok := t110B_0 ++ (t110B_1 ++ (t110B_2 ++ (t110B_3 ++ (t110B_4 ++ (t110B_5 ++ (t110B_6 ++ (t110B_7 ++ (t110B_8 ++ (t110B_9 ++ (t110B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 110：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run110 : (nbRun P nb110 0 kN110 t110A).1 = true ∧ (nbRun P nb110 1 kN110 t110B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s110A_0) (wseg_append (wseg_of s110A_1) (wseg_append (wseg_of s110A_2) (wseg_append (wseg_of s110A_3) (wseg_append (wseg_of s110A_4) (wseg_append (wseg_of s110A_5) (wseg_append (wseg_of s110A_6) (wseg_append (wseg_of s110A_7) (wseg_append (wseg_of s110A_8) (wseg_append (wseg_of s110A_9) (wseg_append (wseg_of s110A_10) (wseg_append (wseg_of s110A_11) (wseg_append (wseg_of s110A_12) (wseg_append (wseg_of s110A_13) (wseg_append (wseg_of s110A_14) (wseg_append (wseg_of s110A_15) (wseg_append (wseg_of s110A_16) (wseg_append (wseg_of s110A_17) (wseg_append (wseg_of s110A_18) (wseg_append (wseg_of s110A_19) (wseg_append (wseg_of s110A_20) (wseg_append (wseg_of s110A_21) (wseg_append (wseg_of s110A_22) (wseg_append (wseg_of s110A_23) (wseg_append (wseg_of s110A_24) (wseg_append (wseg_of s110A_25) (wseg_append (wseg_of s110A_26) (wseg_append (wseg_of s110A_27) (wseg_append (wseg_of s110A_28) (wseg_append (wseg_of s110A_29) (wseg_append (wseg_of s110A_30) (wseg_append (wseg_of s110A_31) (wseg_append (wseg_of s110A_32) (wseg_append (wseg_of s110A_33) (wseg_append (wseg_of s110A_34) (wseg_append (wseg_of s110A_35) (wseg_append (wseg_of s110A_36) (wseg_append (wseg_of s110A_37) (wseg_append (wseg_of s110A_38) (wseg_append (wseg_of s110A_39) (wseg_append (wseg_of s110A_40) (wseg_append (wseg_of s110A_41) (wseg_append (wseg_of s110A_42) (wseg_append (wseg_of s110A_43) (wseg_of s110A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s110B_0) (wseg_append (wseg_of s110B_1) (wseg_append (wseg_of s110B_2) (wseg_append (wseg_of s110B_3) (wseg_append (wseg_of s110B_4) (wseg_append (wseg_of s110B_5) (wseg_append (wseg_of s110B_6) (wseg_append (wseg_of s110B_7) (wseg_append (wseg_of s110B_8) (wseg_append (wseg_of s110B_9) (wseg_of s110B_10)))))))))))⟩

end PackLean.D40.Tet
