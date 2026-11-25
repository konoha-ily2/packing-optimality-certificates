-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS040_0
import PackLean.D40.K.FarS040_1
import PackLean.D40.K.FarS040_2
import PackLean.D40.K.FarS040_3
import PackLean.D40.K.FarS040_4
import PackLean.D40.K.FarS040_5
import PackLean.D40.K.FarS040_6
import PackLean.D40.K.FarS040_7
import PackLean.D40.K.FarS040_8
import PackLean.D40.K.FarS040_9
import PackLean.D40.K.FarS040_10
import PackLean.D40.K.FarS040_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124A : List Tok := t124A_0 ++ (t124A_1 ++ (t124A_2 ++ (t124A_3 ++ (t124A_4 ++ (t124A_5 ++ (t124A_6 ++ (t124A_7 ++ (t124A_8 ++ (t124A_9 ++ (t124A_10 ++ (t124A_11 ++ (t124A_12 ++ (t124A_13 ++ (t124A_14 ++ (t124A_15 ++ (t124A_16 ++ (t124A_17 ++ (t124A_18 ++ (t124A_19 ++ (t124A_20 ++ (t124A_21 ++ (t124A_22 ++ (t124A_23 ++ (t124A_24 ++ (t124A_25 ++ (t124A_26 ++ (t124A_27 ++ (t124A_28 ++ (t124A_29 ++ (t124A_30 ++ (t124A_31 ++ (t124A_32 ++ (t124A_33 ++ (t124A_34 ++ (t124A_35 ++ (t124A_36 ++ (t124A_37 ++ (t124A_38 ++ (t124A_39 ++ (t124A_40 ++ (t124A_41 ++ (t124A_42 ++ (t124A_43 ++ (t124A_44 ++ (t124A_45 ++ (t124A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t124B : List Tok := t124B_0 ++ (t124B_1 ++ (t124B_2 ++ (t124B_3 ++ (t124B_4 ++ (t124B_5 ++ (t124B_6 ++ (t124B_7 ++ (t124B_8 ++ (t124B_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 124：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run124 : (nbRun P nb124 0 kN124 t124A).1 = true ∧ (nbRun P nb124 1 kN124 t124B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s124A_0) (wseg_append (wseg_of s124A_1) (wseg_append (wseg_of s124A_2) (wseg_append (wseg_of s124A_3) (wseg_append (wseg_of s124A_4) (wseg_append (wseg_of s124A_5) (wseg_append (wseg_of s124A_6) (wseg_append (wseg_of s124A_7) (wseg_append (wseg_of s124A_8) (wseg_append (wseg_of s124A_9) (wseg_append (wseg_of s124A_10) (wseg_append (wseg_of s124A_11) (wseg_append (wseg_of s124A_12) (wseg_append (wseg_of s124A_13) (wseg_append (wseg_of s124A_14) (wseg_append (wseg_of s124A_15) (wseg_append (wseg_of s124A_16) (wseg_append (wseg_of s124A_17) (wseg_append (wseg_of s124A_18) (wseg_append (wseg_of s124A_19) (wseg_append (wseg_of s124A_20) (wseg_append (wseg_of s124A_21) (wseg_append (wseg_of s124A_22) (wseg_append (wseg_of s124A_23) (wseg_append (wseg_of s124A_24) (wseg_append (wseg_of s124A_25) (wseg_append (wseg_of s124A_26) (wseg_append (wseg_of s124A_27) (wseg_append (wseg_of s124A_28) (wseg_append (wseg_of s124A_29) (wseg_append (wseg_of s124A_30) (wseg_append (wseg_of s124A_31) (wseg_append (wseg_of s124A_32) (wseg_append (wseg_of s124A_33) (wseg_append (wseg_of s124A_34) (wseg_append (wseg_of s124A_35) (wseg_append (wseg_of s124A_36) (wseg_append (wseg_of s124A_37) (wseg_append (wseg_of s124A_38) (wseg_append (wseg_of s124A_39) (wseg_append (wseg_of s124A_40) (wseg_append (wseg_of s124A_41) (wseg_append (wseg_of s124A_42) (wseg_append (wseg_of s124A_43) (wseg_append (wseg_of s124A_44) (wseg_append (wseg_of s124A_45) (wseg_of s124A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s124B_0) (wseg_append (wseg_of s124B_1) (wseg_append (wseg_of s124B_2) (wseg_append (wseg_of s124B_3) (wseg_append (wseg_of s124B_4) (wseg_append (wseg_of s124B_5) (wseg_append (wseg_of s124B_6) (wseg_append (wseg_of s124B_7) (wseg_append (wseg_of s124B_8) (wseg_of s124B_9))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t125A : List Tok := t125A_0 ++ (t125A_1 ++ (t125A_2 ++ (t125A_3 ++ (t125A_4 ++ (t125A_5 ++ (t125A_6 ++ (t125A_7 ++ (t125A_8 ++ (t125A_9 ++ (t125A_10 ++ (t125A_11 ++ (t125A_12 ++ (t125A_13 ++ (t125A_14 ++ (t125A_15 ++ (t125A_16 ++ (t125A_17 ++ (t125A_18 ++ (t125A_19 ++ (t125A_20 ++ (t125A_21 ++ (t125A_22 ++ (t125A_23 ++ (t125A_24 ++ (t125A_25 ++ (t125A_26 ++ (t125A_27 ++ (t125A_28 ++ (t125A_29 ++ (t125A_30 ++ (t125A_31 ++ (t125A_32 ++ (t125A_33 ++ (t125A_34 ++ (t125A_35 ++ (t125A_36 ++ (t125A_37 ++ (t125A_38 ++ (t125A_39 ++ (t125A_40 ++ (t125A_41 ++ (t125A_42 ++ (t125A_43 ++ (t125A_44 ++ (t125A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t125B : List Tok := t125B_0 ++ (t125B_1 ++ (t125B_2 ++ (t125B_3 ++ (t125B_4 ++ (t125B_5 ++ (t125B_6 ++ (t125B_7 ++ (t125B_8 ++ (t125B_9 ++ (t125B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 125：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run125 : (nbRun P nb125 0 kN125 t125A).1 = true ∧ (nbRun P nb125 1 kN125 t125B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s125A_0) (wseg_append (wseg_of s125A_1) (wseg_append (wseg_of s125A_2) (wseg_append (wseg_of s125A_3) (wseg_append (wseg_of s125A_4) (wseg_append (wseg_of s125A_5) (wseg_append (wseg_of s125A_6) (wseg_append (wseg_of s125A_7) (wseg_append (wseg_of s125A_8) (wseg_append (wseg_of s125A_9) (wseg_append (wseg_of s125A_10) (wseg_append (wseg_of s125A_11) (wseg_append (wseg_of s125A_12) (wseg_append (wseg_of s125A_13) (wseg_append (wseg_of s125A_14) (wseg_append (wseg_of s125A_15) (wseg_append (wseg_of s125A_16) (wseg_append (wseg_of s125A_17) (wseg_append (wseg_of s125A_18) (wseg_append (wseg_of s125A_19) (wseg_append (wseg_of s125A_20) (wseg_append (wseg_of s125A_21) (wseg_append (wseg_of s125A_22) (wseg_append (wseg_of s125A_23) (wseg_append (wseg_of s125A_24) (wseg_append (wseg_of s125A_25) (wseg_append (wseg_of s125A_26) (wseg_append (wseg_of s125A_27) (wseg_append (wseg_of s125A_28) (wseg_append (wseg_of s125A_29) (wseg_append (wseg_of s125A_30) (wseg_append (wseg_of s125A_31) (wseg_append (wseg_of s125A_32) (wseg_append (wseg_of s125A_33) (wseg_append (wseg_of s125A_34) (wseg_append (wseg_of s125A_35) (wseg_append (wseg_of s125A_36) (wseg_append (wseg_of s125A_37) (wseg_append (wseg_of s125A_38) (wseg_append (wseg_of s125A_39) (wseg_append (wseg_of s125A_40) (wseg_append (wseg_of s125A_41) (wseg_append (wseg_of s125A_42) (wseg_append (wseg_of s125A_43) (wseg_append (wseg_of s125A_44) (wseg_of s125A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s125B_0) (wseg_append (wseg_of s125B_1) (wseg_append (wseg_of s125B_2) (wseg_append (wseg_of s125B_3) (wseg_append (wseg_of s125B_4) (wseg_append (wseg_of s125B_5) (wseg_append (wseg_of s125B_6) (wseg_append (wseg_of s125B_7) (wseg_append (wseg_of s125B_8) (wseg_append (wseg_of s125B_9) (wseg_of s125B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t126A : List Tok := t126A_0 ++ (t126A_1 ++ (t126A_2 ++ (t126A_3 ++ (t126A_4 ++ (t126A_5 ++ (t126A_6 ++ (t126A_7 ++ (t126A_8 ++ (t126A_9 ++ (t126A_10 ++ (t126A_11 ++ (t126A_12 ++ (t126A_13 ++ (t126A_14 ++ (t126A_15 ++ (t126A_16 ++ (t126A_17 ++ (t126A_18 ++ (t126A_19 ++ (t126A_20 ++ (t126A_21 ++ (t126A_22 ++ (t126A_23 ++ (t126A_24 ++ (t126A_25 ++ (t126A_26 ++ (t126A_27 ++ (t126A_28 ++ (t126A_29 ++ (t126A_30 ++ (t126A_31 ++ (t126A_32 ++ (t126A_33 ++ (t126A_34 ++ (t126A_35 ++ (t126A_36 ++ (t126A_37 ++ (t126A_38 ++ (t126A_39 ++ (t126A_40 ++ (t126A_41 ++ (t126A_42 ++ (t126A_43 ++ (t126A_44 ++ (t126A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t126B : List Tok := t126B_0 ++ (t126B_1 ++ (t126B_2 ++ (t126B_3 ++ (t126B_4 ++ (t126B_5 ++ (t126B_6 ++ (t126B_7 ++ (t126B_8 ++ (t126B_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 126：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run126 : (nbRun P nb126 0 kN126 t126A).1 = true ∧ (nbRun P nb126 1 kN126 t126B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s126A_0) (wseg_append (wseg_of s126A_1) (wseg_append (wseg_of s126A_2) (wseg_append (wseg_of s126A_3) (wseg_append (wseg_of s126A_4) (wseg_append (wseg_of s126A_5) (wseg_append (wseg_of s126A_6) (wseg_append (wseg_of s126A_7) (wseg_append (wseg_of s126A_8) (wseg_append (wseg_of s126A_9) (wseg_append (wseg_of s126A_10) (wseg_append (wseg_of s126A_11) (wseg_append (wseg_of s126A_12) (wseg_append (wseg_of s126A_13) (wseg_append (wseg_of s126A_14) (wseg_append (wseg_of s126A_15) (wseg_append (wseg_of s126A_16) (wseg_append (wseg_of s126A_17) (wseg_append (wseg_of s126A_18) (wseg_append (wseg_of s126A_19) (wseg_append (wseg_of s126A_20) (wseg_append (wseg_of s126A_21) (wseg_append (wseg_of s126A_22) (wseg_append (wseg_of s126A_23) (wseg_append (wseg_of s126A_24) (wseg_append (wseg_of s126A_25) (wseg_append (wseg_of s126A_26) (wseg_append (wseg_of s126A_27) (wseg_append (wseg_of s126A_28) (wseg_append (wseg_of s126A_29) (wseg_append (wseg_of s126A_30) (wseg_append (wseg_of s126A_31) (wseg_append (wseg_of s126A_32) (wseg_append (wseg_of s126A_33) (wseg_append (wseg_of s126A_34) (wseg_append (wseg_of s126A_35) (wseg_append (wseg_of s126A_36) (wseg_append (wseg_of s126A_37) (wseg_append (wseg_of s126A_38) (wseg_append (wseg_of s126A_39) (wseg_append (wseg_of s126A_40) (wseg_append (wseg_of s126A_41) (wseg_append (wseg_of s126A_42) (wseg_append (wseg_of s126A_43) (wseg_append (wseg_of s126A_44) (wseg_of s126A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s126B_0) (wseg_append (wseg_of s126B_1) (wseg_append (wseg_of s126B_2) (wseg_append (wseg_of s126B_3) (wseg_append (wseg_of s126B_4) (wseg_append (wseg_of s126B_5) (wseg_append (wseg_of s126B_6) (wseg_append (wseg_of s126B_7) (wseg_append (wseg_of s126B_8) (wseg_of s126B_9))))))))))⟩

end PackLean.D40.Tet
