-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS026_0
import PackLean.D40.K.FarS026_1
import PackLean.D40.K.FarS026_2
import PackLean.D40.K.FarS026_3
import PackLean.D40.K.FarS026_4
import PackLean.D40.K.FarS026_5
import PackLean.D40.K.FarS026_6
import PackLean.D40.K.FarS026_7
import PackLean.D40.K.FarS026_8
import PackLean.D40.K.FarS026_9
import PackLean.D40.K.FarS026_10
import PackLean.D40.K.FarS026_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t081A : List Tok := t081A_0 ++ (t081A_1 ++ (t081A_2 ++ (t081A_3 ++ (t081A_4 ++ (t081A_5 ++ (t081A_6 ++ (t081A_7 ++ (t081A_8 ++ (t081A_9 ++ (t081A_10 ++ (t081A_11 ++ (t081A_12 ++ (t081A_13 ++ (t081A_14 ++ (t081A_15 ++ (t081A_16 ++ (t081A_17 ++ (t081A_18 ++ (t081A_19 ++ (t081A_20 ++ (t081A_21 ++ (t081A_22 ++ (t081A_23 ++ (t081A_24 ++ (t081A_25 ++ (t081A_26 ++ (t081A_27 ++ (t081A_28 ++ (t081A_29 ++ (t081A_30 ++ (t081A_31 ++ (t081A_32 ++ (t081A_33 ++ (t081A_34 ++ (t081A_35 ++ (t081A_36 ++ (t081A_37 ++ (t081A_38 ++ (t081A_39 ++ (t081A_40 ++ (t081A_41 ++ (t081A_42 ++ (t081A_43 ++ (t081A_44 ++ (t081A_45 ++ (t081A_46 ++ (t081A_47)))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t081B : List Tok := t081B_0 ++ (t081B_1 ++ (t081B_2 ++ (t081B_3 ++ (t081B_4 ++ (t081B_5 ++ (t081B_6 ++ (t081B_7 ++ (t081B_8 ++ (t081B_9 ++ (t081B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 081：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run081 : (nbRun P nb081 0 kN081 t081A).1 = true ∧ (nbRun P nb081 1 kN081 t081B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s081A_0) (wseg_append (wseg_of s081A_1) (wseg_append (wseg_of s081A_2) (wseg_append (wseg_of s081A_3) (wseg_append (wseg_of s081A_4) (wseg_append (wseg_of s081A_5) (wseg_append (wseg_of s081A_6) (wseg_append (wseg_of s081A_7) (wseg_append (wseg_of s081A_8) (wseg_append (wseg_of s081A_9) (wseg_append (wseg_of s081A_10) (wseg_append (wseg_of s081A_11) (wseg_append (wseg_of s081A_12) (wseg_append (wseg_of s081A_13) (wseg_append (wseg_of s081A_14) (wseg_append (wseg_of s081A_15) (wseg_append (wseg_of s081A_16) (wseg_append (wseg_of s081A_17) (wseg_append (wseg_of s081A_18) (wseg_append (wseg_of s081A_19) (wseg_append (wseg_of s081A_20) (wseg_append (wseg_of s081A_21) (wseg_append (wseg_of s081A_22) (wseg_append (wseg_of s081A_23) (wseg_append (wseg_of s081A_24) (wseg_append (wseg_of s081A_25) (wseg_append (wseg_of s081A_26) (wseg_append (wseg_of s081A_27) (wseg_append (wseg_of s081A_28) (wseg_append (wseg_of s081A_29) (wseg_append (wseg_of s081A_30) (wseg_append (wseg_of s081A_31) (wseg_append (wseg_of s081A_32) (wseg_append (wseg_of s081A_33) (wseg_append (wseg_of s081A_34) (wseg_append (wseg_of s081A_35) (wseg_append (wseg_of s081A_36) (wseg_append (wseg_of s081A_37) (wseg_append (wseg_of s081A_38) (wseg_append (wseg_of s081A_39) (wseg_append (wseg_of s081A_40) (wseg_append (wseg_of s081A_41) (wseg_append (wseg_of s081A_42) (wseg_append (wseg_of s081A_43) (wseg_append (wseg_of s081A_44) (wseg_append (wseg_of s081A_45) (wseg_append (wseg_of s081A_46) (wseg_of s081A_47)))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s081B_0) (wseg_append (wseg_of s081B_1) (wseg_append (wseg_of s081B_2) (wseg_append (wseg_of s081B_3) (wseg_append (wseg_of s081B_4) (wseg_append (wseg_of s081B_5) (wseg_append (wseg_of s081B_6) (wseg_append (wseg_of s081B_7) (wseg_append (wseg_of s081B_8) (wseg_append (wseg_of s081B_9) (wseg_of s081B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t082A : List Tok := t082A_0 ++ (t082A_1 ++ (t082A_2 ++ (t082A_3 ++ (t082A_4 ++ (t082A_5 ++ (t082A_6 ++ (t082A_7 ++ (t082A_8 ++ (t082A_9 ++ (t082A_10 ++ (t082A_11 ++ (t082A_12 ++ (t082A_13 ++ (t082A_14 ++ (t082A_15 ++ (t082A_16 ++ (t082A_17 ++ (t082A_18 ++ (t082A_19 ++ (t082A_20 ++ (t082A_21 ++ (t082A_22 ++ (t082A_23 ++ (t082A_24 ++ (t082A_25 ++ (t082A_26 ++ (t082A_27 ++ (t082A_28 ++ (t082A_29 ++ (t082A_30 ++ (t082A_31 ++ (t082A_32 ++ (t082A_33 ++ (t082A_34 ++ (t082A_35 ++ (t082A_36 ++ (t082A_37 ++ (t082A_38 ++ (t082A_39 ++ (t082A_40 ++ (t082A_41 ++ (t082A_42 ++ (t082A_43 ++ (t082A_44 ++ (t082A_45 ++ (t082A_46 ++ (t082A_47 ++ (t082A_48 ++ (t082A_49 ++ (t082A_50))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t082B : List Tok := t082B_0 ++ (t082B_1 ++ (t082B_2 ++ (t082B_3 ++ (t082B_4 ++ (t082B_5 ++ (t082B_6 ++ (t082B_7 ++ (t082B_8 ++ (t082B_9 ++ (t082B_10 ++ (t082B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 082：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run082 : (nbRun P nb082 0 kN082 t082A).1 = true ∧ (nbRun P nb082 1 kN082 t082B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s082A_0) (wseg_append (wseg_of s082A_1) (wseg_append (wseg_of s082A_2) (wseg_append (wseg_of s082A_3) (wseg_append (wseg_of s082A_4) (wseg_append (wseg_of s082A_5) (wseg_append (wseg_of s082A_6) (wseg_append (wseg_of s082A_7) (wseg_append (wseg_of s082A_8) (wseg_append (wseg_of s082A_9) (wseg_append (wseg_of s082A_10) (wseg_append (wseg_of s082A_11) (wseg_append (wseg_of s082A_12) (wseg_append (wseg_of s082A_13) (wseg_append (wseg_of s082A_14) (wseg_append (wseg_of s082A_15) (wseg_append (wseg_of s082A_16) (wseg_append (wseg_of s082A_17) (wseg_append (wseg_of s082A_18) (wseg_append (wseg_of s082A_19) (wseg_append (wseg_of s082A_20) (wseg_append (wseg_of s082A_21) (wseg_append (wseg_of s082A_22) (wseg_append (wseg_of s082A_23) (wseg_append (wseg_of s082A_24) (wseg_append (wseg_of s082A_25) (wseg_append (wseg_of s082A_26) (wseg_append (wseg_of s082A_27) (wseg_append (wseg_of s082A_28) (wseg_append (wseg_of s082A_29) (wseg_append (wseg_of s082A_30) (wseg_append (wseg_of s082A_31) (wseg_append (wseg_of s082A_32) (wseg_append (wseg_of s082A_33) (wseg_append (wseg_of s082A_34) (wseg_append (wseg_of s082A_35) (wseg_append (wseg_of s082A_36) (wseg_append (wseg_of s082A_37) (wseg_append (wseg_of s082A_38) (wseg_append (wseg_of s082A_39) (wseg_append (wseg_of s082A_40) (wseg_append (wseg_of s082A_41) (wseg_append (wseg_of s082A_42) (wseg_append (wseg_of s082A_43) (wseg_append (wseg_of s082A_44) (wseg_append (wseg_of s082A_45) (wseg_append (wseg_of s082A_46) (wseg_append (wseg_of s082A_47) (wseg_append (wseg_of s082A_48) (wseg_append (wseg_of s082A_49) (wseg_of s082A_50))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s082B_0) (wseg_append (wseg_of s082B_1) (wseg_append (wseg_of s082B_2) (wseg_append (wseg_of s082B_3) (wseg_append (wseg_of s082B_4) (wseg_append (wseg_of s082B_5) (wseg_append (wseg_of s082B_6) (wseg_append (wseg_of s082B_7) (wseg_append (wseg_of s082B_8) (wseg_append (wseg_of s082B_9) (wseg_append (wseg_of s082B_10) (wseg_of s082B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083A : List Tok := t083A_0 ++ (t083A_1 ++ (t083A_2 ++ (t083A_3 ++ (t083A_4 ++ (t083A_5 ++ (t083A_6 ++ (t083A_7 ++ (t083A_8 ++ (t083A_9 ++ (t083A_10 ++ (t083A_11 ++ (t083A_12 ++ (t083A_13 ++ (t083A_14 ++ (t083A_15 ++ (t083A_16 ++ (t083A_17 ++ (t083A_18 ++ (t083A_19 ++ (t083A_20 ++ (t083A_21 ++ (t083A_22 ++ (t083A_23 ++ (t083A_24 ++ (t083A_25 ++ (t083A_26 ++ (t083A_27 ++ (t083A_28 ++ (t083A_29 ++ (t083A_30 ++ (t083A_31 ++ (t083A_32 ++ (t083A_33 ++ (t083A_34 ++ (t083A_35 ++ (t083A_36 ++ (t083A_37 ++ (t083A_38 ++ (t083A_39 ++ (t083A_40 ++ (t083A_41 ++ (t083A_42 ++ (t083A_43 ++ (t083A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t083B : List Tok := t083B_0 ++ (t083B_1 ++ (t083B_2 ++ (t083B_3 ++ (t083B_4 ++ (t083B_5 ++ (t083B_6 ++ (t083B_7 ++ (t083B_8 ++ (t083B_9 ++ (t083B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 083：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run083 : (nbRun P nb083 0 kN083 t083A).1 = true ∧ (nbRun P nb083 1 kN083 t083B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s083A_0) (wseg_append (wseg_of s083A_1) (wseg_append (wseg_of s083A_2) (wseg_append (wseg_of s083A_3) (wseg_append (wseg_of s083A_4) (wseg_append (wseg_of s083A_5) (wseg_append (wseg_of s083A_6) (wseg_append (wseg_of s083A_7) (wseg_append (wseg_of s083A_8) (wseg_append (wseg_of s083A_9) (wseg_append (wseg_of s083A_10) (wseg_append (wseg_of s083A_11) (wseg_append (wseg_of s083A_12) (wseg_append (wseg_of s083A_13) (wseg_append (wseg_of s083A_14) (wseg_append (wseg_of s083A_15) (wseg_append (wseg_of s083A_16) (wseg_append (wseg_of s083A_17) (wseg_append (wseg_of s083A_18) (wseg_append (wseg_of s083A_19) (wseg_append (wseg_of s083A_20) (wseg_append (wseg_of s083A_21) (wseg_append (wseg_of s083A_22) (wseg_append (wseg_of s083A_23) (wseg_append (wseg_of s083A_24) (wseg_append (wseg_of s083A_25) (wseg_append (wseg_of s083A_26) (wseg_append (wseg_of s083A_27) (wseg_append (wseg_of s083A_28) (wseg_append (wseg_of s083A_29) (wseg_append (wseg_of s083A_30) (wseg_append (wseg_of s083A_31) (wseg_append (wseg_of s083A_32) (wseg_append (wseg_of s083A_33) (wseg_append (wseg_of s083A_34) (wseg_append (wseg_of s083A_35) (wseg_append (wseg_of s083A_36) (wseg_append (wseg_of s083A_37) (wseg_append (wseg_of s083A_38) (wseg_append (wseg_of s083A_39) (wseg_append (wseg_of s083A_40) (wseg_append (wseg_of s083A_41) (wseg_append (wseg_of s083A_42) (wseg_append (wseg_of s083A_43) (wseg_of s083A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s083B_0) (wseg_append (wseg_of s083B_1) (wseg_append (wseg_of s083B_2) (wseg_append (wseg_of s083B_3) (wseg_append (wseg_of s083B_4) (wseg_append (wseg_of s083B_5) (wseg_append (wseg_of s083B_6) (wseg_append (wseg_of s083B_7) (wseg_append (wseg_of s083B_8) (wseg_append (wseg_of s083B_9) (wseg_of s083B_10)))))))))))⟩

end PackLean.D40.Tet
