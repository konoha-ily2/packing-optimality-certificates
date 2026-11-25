-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS027_0
import PackLean.D40.K.FarS027_1
import PackLean.D40.K.FarS027_2
import PackLean.D40.K.FarS027_3
import PackLean.D40.K.FarS027_4
import PackLean.D40.K.FarS027_5
import PackLean.D40.K.FarS027_6
import PackLean.D40.K.FarS027_7
import PackLean.D40.K.FarS027_8
import PackLean.D40.K.FarS027_9
import PackLean.D40.K.FarS027_10
import PackLean.D40.K.FarS027_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t084A : List Tok := t084A_0 ++ (t084A_1 ++ (t084A_2 ++ (t084A_3 ++ (t084A_4 ++ (t084A_5 ++ (t084A_6 ++ (t084A_7 ++ (t084A_8 ++ (t084A_9 ++ (t084A_10 ++ (t084A_11 ++ (t084A_12 ++ (t084A_13 ++ (t084A_14 ++ (t084A_15 ++ (t084A_16 ++ (t084A_17 ++ (t084A_18 ++ (t084A_19 ++ (t084A_20 ++ (t084A_21 ++ (t084A_22 ++ (t084A_23 ++ (t084A_24 ++ (t084A_25 ++ (t084A_26 ++ (t084A_27 ++ (t084A_28 ++ (t084A_29 ++ (t084A_30 ++ (t084A_31 ++ (t084A_32 ++ (t084A_33 ++ (t084A_34 ++ (t084A_35 ++ (t084A_36 ++ (t084A_37 ++ (t084A_38 ++ (t084A_39 ++ (t084A_40 ++ (t084A_41 ++ (t084A_42 ++ (t084A_43 ++ (t084A_44 ++ (t084A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t084B : List Tok := t084B_0 ++ (t084B_1 ++ (t084B_2 ++ (t084B_3 ++ (t084B_4 ++ (t084B_5 ++ (t084B_6 ++ (t084B_7 ++ (t084B_8 ++ (t084B_9 ++ (t084B_10 ++ (t084B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 084：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run084 : (nbRun P nb084 0 kN084 t084A).1 = true ∧ (nbRun P nb084 1 kN084 t084B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s084A_0) (wseg_append (wseg_of s084A_1) (wseg_append (wseg_of s084A_2) (wseg_append (wseg_of s084A_3) (wseg_append (wseg_of s084A_4) (wseg_append (wseg_of s084A_5) (wseg_append (wseg_of s084A_6) (wseg_append (wseg_of s084A_7) (wseg_append (wseg_of s084A_8) (wseg_append (wseg_of s084A_9) (wseg_append (wseg_of s084A_10) (wseg_append (wseg_of s084A_11) (wseg_append (wseg_of s084A_12) (wseg_append (wseg_of s084A_13) (wseg_append (wseg_of s084A_14) (wseg_append (wseg_of s084A_15) (wseg_append (wseg_of s084A_16) (wseg_append (wseg_of s084A_17) (wseg_append (wseg_of s084A_18) (wseg_append (wseg_of s084A_19) (wseg_append (wseg_of s084A_20) (wseg_append (wseg_of s084A_21) (wseg_append (wseg_of s084A_22) (wseg_append (wseg_of s084A_23) (wseg_append (wseg_of s084A_24) (wseg_append (wseg_of s084A_25) (wseg_append (wseg_of s084A_26) (wseg_append (wseg_of s084A_27) (wseg_append (wseg_of s084A_28) (wseg_append (wseg_of s084A_29) (wseg_append (wseg_of s084A_30) (wseg_append (wseg_of s084A_31) (wseg_append (wseg_of s084A_32) (wseg_append (wseg_of s084A_33) (wseg_append (wseg_of s084A_34) (wseg_append (wseg_of s084A_35) (wseg_append (wseg_of s084A_36) (wseg_append (wseg_of s084A_37) (wseg_append (wseg_of s084A_38) (wseg_append (wseg_of s084A_39) (wseg_append (wseg_of s084A_40) (wseg_append (wseg_of s084A_41) (wseg_append (wseg_of s084A_42) (wseg_append (wseg_of s084A_43) (wseg_append (wseg_of s084A_44) (wseg_of s084A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s084B_0) (wseg_append (wseg_of s084B_1) (wseg_append (wseg_of s084B_2) (wseg_append (wseg_of s084B_3) (wseg_append (wseg_of s084B_4) (wseg_append (wseg_of s084B_5) (wseg_append (wseg_of s084B_6) (wseg_append (wseg_of s084B_7) (wseg_append (wseg_of s084B_8) (wseg_append (wseg_of s084B_9) (wseg_append (wseg_of s084B_10) (wseg_of s084B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t085A : List Tok := t085A_0 ++ (t085A_1 ++ (t085A_2 ++ (t085A_3 ++ (t085A_4 ++ (t085A_5 ++ (t085A_6 ++ (t085A_7 ++ (t085A_8 ++ (t085A_9 ++ (t085A_10 ++ (t085A_11 ++ (t085A_12 ++ (t085A_13 ++ (t085A_14 ++ (t085A_15 ++ (t085A_16 ++ (t085A_17 ++ (t085A_18 ++ (t085A_19 ++ (t085A_20 ++ (t085A_21 ++ (t085A_22 ++ (t085A_23 ++ (t085A_24 ++ (t085A_25 ++ (t085A_26 ++ (t085A_27 ++ (t085A_28 ++ (t085A_29 ++ (t085A_30 ++ (t085A_31 ++ (t085A_32 ++ (t085A_33 ++ (t085A_34 ++ (t085A_35 ++ (t085A_36 ++ (t085A_37 ++ (t085A_38 ++ (t085A_39 ++ (t085A_40 ++ (t085A_41 ++ (t085A_42 ++ (t085A_43 ++ (t085A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t085B : List Tok := t085B_0 ++ (t085B_1 ++ (t085B_2 ++ (t085B_3 ++ (t085B_4 ++ (t085B_5 ++ (t085B_6 ++ (t085B_7 ++ (t085B_8 ++ (t085B_9 ++ (t085B_10 ++ (t085B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 085：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run085 : (nbRun P nb085 0 kN085 t085A).1 = true ∧ (nbRun P nb085 1 kN085 t085B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s085A_0) (wseg_append (wseg_of s085A_1) (wseg_append (wseg_of s085A_2) (wseg_append (wseg_of s085A_3) (wseg_append (wseg_of s085A_4) (wseg_append (wseg_of s085A_5) (wseg_append (wseg_of s085A_6) (wseg_append (wseg_of s085A_7) (wseg_append (wseg_of s085A_8) (wseg_append (wseg_of s085A_9) (wseg_append (wseg_of s085A_10) (wseg_append (wseg_of s085A_11) (wseg_append (wseg_of s085A_12) (wseg_append (wseg_of s085A_13) (wseg_append (wseg_of s085A_14) (wseg_append (wseg_of s085A_15) (wseg_append (wseg_of s085A_16) (wseg_append (wseg_of s085A_17) (wseg_append (wseg_of s085A_18) (wseg_append (wseg_of s085A_19) (wseg_append (wseg_of s085A_20) (wseg_append (wseg_of s085A_21) (wseg_append (wseg_of s085A_22) (wseg_append (wseg_of s085A_23) (wseg_append (wseg_of s085A_24) (wseg_append (wseg_of s085A_25) (wseg_append (wseg_of s085A_26) (wseg_append (wseg_of s085A_27) (wseg_append (wseg_of s085A_28) (wseg_append (wseg_of s085A_29) (wseg_append (wseg_of s085A_30) (wseg_append (wseg_of s085A_31) (wseg_append (wseg_of s085A_32) (wseg_append (wseg_of s085A_33) (wseg_append (wseg_of s085A_34) (wseg_append (wseg_of s085A_35) (wseg_append (wseg_of s085A_36) (wseg_append (wseg_of s085A_37) (wseg_append (wseg_of s085A_38) (wseg_append (wseg_of s085A_39) (wseg_append (wseg_of s085A_40) (wseg_append (wseg_of s085A_41) (wseg_append (wseg_of s085A_42) (wseg_append (wseg_of s085A_43) (wseg_of s085A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s085B_0) (wseg_append (wseg_of s085B_1) (wseg_append (wseg_of s085B_2) (wseg_append (wseg_of s085B_3) (wseg_append (wseg_of s085B_4) (wseg_append (wseg_of s085B_5) (wseg_append (wseg_of s085B_6) (wseg_append (wseg_of s085B_7) (wseg_append (wseg_of s085B_8) (wseg_append (wseg_of s085B_9) (wseg_append (wseg_of s085B_10) (wseg_of s085B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086A : List Tok := t086A_0 ++ (t086A_1 ++ (t086A_2 ++ (t086A_3 ++ (t086A_4 ++ (t086A_5 ++ (t086A_6 ++ (t086A_7 ++ (t086A_8 ++ (t086A_9 ++ (t086A_10 ++ (t086A_11 ++ (t086A_12 ++ (t086A_13 ++ (t086A_14 ++ (t086A_15 ++ (t086A_16 ++ (t086A_17 ++ (t086A_18 ++ (t086A_19 ++ (t086A_20 ++ (t086A_21 ++ (t086A_22 ++ (t086A_23 ++ (t086A_24 ++ (t086A_25 ++ (t086A_26 ++ (t086A_27 ++ (t086A_28 ++ (t086A_29 ++ (t086A_30 ++ (t086A_31 ++ (t086A_32 ++ (t086A_33 ++ (t086A_34 ++ (t086A_35 ++ (t086A_36 ++ (t086A_37 ++ (t086A_38 ++ (t086A_39 ++ (t086A_40 ++ (t086A_41 ++ (t086A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t086B : List Tok := t086B_0 ++ (t086B_1 ++ (t086B_2 ++ (t086B_3 ++ (t086B_4 ++ (t086B_5 ++ (t086B_6 ++ (t086B_7 ++ (t086B_8 ++ (t086B_9 ++ (t086B_10 ++ (t086B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 086：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run086 : (nbRun P nb086 0 kN086 t086A).1 = true ∧ (nbRun P nb086 1 kN086 t086B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s086A_0) (wseg_append (wseg_of s086A_1) (wseg_append (wseg_of s086A_2) (wseg_append (wseg_of s086A_3) (wseg_append (wseg_of s086A_4) (wseg_append (wseg_of s086A_5) (wseg_append (wseg_of s086A_6) (wseg_append (wseg_of s086A_7) (wseg_append (wseg_of s086A_8) (wseg_append (wseg_of s086A_9) (wseg_append (wseg_of s086A_10) (wseg_append (wseg_of s086A_11) (wseg_append (wseg_of s086A_12) (wseg_append (wseg_of s086A_13) (wseg_append (wseg_of s086A_14) (wseg_append (wseg_of s086A_15) (wseg_append (wseg_of s086A_16) (wseg_append (wseg_of s086A_17) (wseg_append (wseg_of s086A_18) (wseg_append (wseg_of s086A_19) (wseg_append (wseg_of s086A_20) (wseg_append (wseg_of s086A_21) (wseg_append (wseg_of s086A_22) (wseg_append (wseg_of s086A_23) (wseg_append (wseg_of s086A_24) (wseg_append (wseg_of s086A_25) (wseg_append (wseg_of s086A_26) (wseg_append (wseg_of s086A_27) (wseg_append (wseg_of s086A_28) (wseg_append (wseg_of s086A_29) (wseg_append (wseg_of s086A_30) (wseg_append (wseg_of s086A_31) (wseg_append (wseg_of s086A_32) (wseg_append (wseg_of s086A_33) (wseg_append (wseg_of s086A_34) (wseg_append (wseg_of s086A_35) (wseg_append (wseg_of s086A_36) (wseg_append (wseg_of s086A_37) (wseg_append (wseg_of s086A_38) (wseg_append (wseg_of s086A_39) (wseg_append (wseg_of s086A_40) (wseg_append (wseg_of s086A_41) (wseg_of s086A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s086B_0) (wseg_append (wseg_of s086B_1) (wseg_append (wseg_of s086B_2) (wseg_append (wseg_of s086B_3) (wseg_append (wseg_of s086B_4) (wseg_append (wseg_of s086B_5) (wseg_append (wseg_of s086B_6) (wseg_append (wseg_of s086B_7) (wseg_append (wseg_of s086B_8) (wseg_append (wseg_of s086B_9) (wseg_append (wseg_of s086B_10) (wseg_of s086B_11))))))))))))⟩

end PackLean.D40.Tet
