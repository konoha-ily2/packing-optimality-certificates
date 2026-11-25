-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS054_0
import PackLean.D40.K.FarS054_1
import PackLean.D40.K.FarS054_2
import PackLean.D40.K.FarS054_3
import PackLean.D40.K.FarS054_4
import PackLean.D40.K.FarS054_5
import PackLean.D40.K.FarS054_6
import PackLean.D40.K.FarS054_7
import PackLean.D40.K.FarS054_8
import PackLean.D40.K.FarS054_9
import PackLean.D40.K.FarS054_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t189A : List Tok := t189A_0 ++ (t189A_1 ++ (t189A_2 ++ (t189A_3 ++ (t189A_4 ++ (t189A_5 ++ (t189A_6 ++ (t189A_7 ++ (t189A_8 ++ (t189A_9 ++ (t189A_10 ++ (t189A_11 ++ (t189A_12 ++ (t189A_13 ++ (t189A_14 ++ (t189A_15 ++ (t189A_16 ++ (t189A_17 ++ (t189A_18 ++ (t189A_19 ++ (t189A_20 ++ (t189A_21 ++ (t189A_22 ++ (t189A_23 ++ (t189A_24 ++ (t189A_25 ++ (t189A_26 ++ (t189A_27 ++ (t189A_28 ++ (t189A_29 ++ (t189A_30 ++ (t189A_31 ++ (t189A_32 ++ (t189A_33 ++ (t189A_34 ++ (t189A_35 ++ (t189A_36 ++ (t189A_37 ++ (t189A_38 ++ (t189A_39 ++ (t189A_40 ++ (t189A_41 ++ (t189A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t189B : List Tok := t189B_0 ++ (t189B_1 ++ (t189B_2 ++ (t189B_3 ++ (t189B_4 ++ (t189B_5 ++ (t189B_6 ++ (t189B_7 ++ (t189B_8 ++ (t189B_9 ++ (t189B_10 ++ (t189B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 189：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run189 : (nbRun P nb189 0 kN189 t189A).1 = true ∧ (nbRun P nb189 1 kN189 t189B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s189A_0) (wseg_append (wseg_of s189A_1) (wseg_append (wseg_of s189A_2) (wseg_append (wseg_of s189A_3) (wseg_append (wseg_of s189A_4) (wseg_append (wseg_of s189A_5) (wseg_append (wseg_of s189A_6) (wseg_append (wseg_of s189A_7) (wseg_append (wseg_of s189A_8) (wseg_append (wseg_of s189A_9) (wseg_append (wseg_of s189A_10) (wseg_append (wseg_of s189A_11) (wseg_append (wseg_of s189A_12) (wseg_append (wseg_of s189A_13) (wseg_append (wseg_of s189A_14) (wseg_append (wseg_of s189A_15) (wseg_append (wseg_of s189A_16) (wseg_append (wseg_of s189A_17) (wseg_append (wseg_of s189A_18) (wseg_append (wseg_of s189A_19) (wseg_append (wseg_of s189A_20) (wseg_append (wseg_of s189A_21) (wseg_append (wseg_of s189A_22) (wseg_append (wseg_of s189A_23) (wseg_append (wseg_of s189A_24) (wseg_append (wseg_of s189A_25) (wseg_append (wseg_of s189A_26) (wseg_append (wseg_of s189A_27) (wseg_append (wseg_of s189A_28) (wseg_append (wseg_of s189A_29) (wseg_append (wseg_of s189A_30) (wseg_append (wseg_of s189A_31) (wseg_append (wseg_of s189A_32) (wseg_append (wseg_of s189A_33) (wseg_append (wseg_of s189A_34) (wseg_append (wseg_of s189A_35) (wseg_append (wseg_of s189A_36) (wseg_append (wseg_of s189A_37) (wseg_append (wseg_of s189A_38) (wseg_append (wseg_of s189A_39) (wseg_append (wseg_of s189A_40) (wseg_append (wseg_of s189A_41) (wseg_of s189A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s189B_0) (wseg_append (wseg_of s189B_1) (wseg_append (wseg_of s189B_2) (wseg_append (wseg_of s189B_3) (wseg_append (wseg_of s189B_4) (wseg_append (wseg_of s189B_5) (wseg_append (wseg_of s189B_6) (wseg_append (wseg_of s189B_7) (wseg_append (wseg_of s189B_8) (wseg_append (wseg_of s189B_9) (wseg_append (wseg_of s189B_10) (wseg_of s189B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t190A : List Tok := t190A_0 ++ (t190A_1 ++ (t190A_2 ++ (t190A_3 ++ (t190A_4 ++ (t190A_5 ++ (t190A_6 ++ (t190A_7 ++ (t190A_8 ++ (t190A_9 ++ (t190A_10 ++ (t190A_11 ++ (t190A_12 ++ (t190A_13 ++ (t190A_14 ++ (t190A_15 ++ (t190A_16 ++ (t190A_17 ++ (t190A_18 ++ (t190A_19 ++ (t190A_20 ++ (t190A_21 ++ (t190A_22 ++ (t190A_23 ++ (t190A_24 ++ (t190A_25 ++ (t190A_26 ++ (t190A_27 ++ (t190A_28 ++ (t190A_29 ++ (t190A_30 ++ (t190A_31 ++ (t190A_32 ++ (t190A_33 ++ (t190A_34))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t190B : List Tok := t190B_0 ++ (t190B_1 ++ (t190B_2 ++ (t190B_3 ++ (t190B_4 ++ (t190B_5 ++ (t190B_6 ++ (t190B_7 ++ (t190B_8 ++ (t190B_9 ++ (t190B_10 ++ (t190B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 190：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run190 : (nbRun P nb190 0 kN190 t190A).1 = true ∧ (nbRun P nb190 1 kN190 t190B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s190A_0) (wseg_append (wseg_of s190A_1) (wseg_append (wseg_of s190A_2) (wseg_append (wseg_of s190A_3) (wseg_append (wseg_of s190A_4) (wseg_append (wseg_of s190A_5) (wseg_append (wseg_of s190A_6) (wseg_append (wseg_of s190A_7) (wseg_append (wseg_of s190A_8) (wseg_append (wseg_of s190A_9) (wseg_append (wseg_of s190A_10) (wseg_append (wseg_of s190A_11) (wseg_append (wseg_of s190A_12) (wseg_append (wseg_of s190A_13) (wseg_append (wseg_of s190A_14) (wseg_append (wseg_of s190A_15) (wseg_append (wseg_of s190A_16) (wseg_append (wseg_of s190A_17) (wseg_append (wseg_of s190A_18) (wseg_append (wseg_of s190A_19) (wseg_append (wseg_of s190A_20) (wseg_append (wseg_of s190A_21) (wseg_append (wseg_of s190A_22) (wseg_append (wseg_of s190A_23) (wseg_append (wseg_of s190A_24) (wseg_append (wseg_of s190A_25) (wseg_append (wseg_of s190A_26) (wseg_append (wseg_of s190A_27) (wseg_append (wseg_of s190A_28) (wseg_append (wseg_of s190A_29) (wseg_append (wseg_of s190A_30) (wseg_append (wseg_of s190A_31) (wseg_append (wseg_of s190A_32) (wseg_append (wseg_of s190A_33) (wseg_of s190A_34))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s190B_0) (wseg_append (wseg_of s190B_1) (wseg_append (wseg_of s190B_2) (wseg_append (wseg_of s190B_3) (wseg_append (wseg_of s190B_4) (wseg_append (wseg_of s190B_5) (wseg_append (wseg_of s190B_6) (wseg_append (wseg_of s190B_7) (wseg_append (wseg_of s190B_8) (wseg_append (wseg_of s190B_9) (wseg_append (wseg_of s190B_10) (wseg_of s190B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t191A : List Tok := t191A_0 ++ (t191A_1 ++ (t191A_2 ++ (t191A_3 ++ (t191A_4 ++ (t191A_5 ++ (t191A_6 ++ (t191A_7 ++ (t191A_8 ++ (t191A_9 ++ (t191A_10 ++ (t191A_11 ++ (t191A_12 ++ (t191A_13 ++ (t191A_14 ++ (t191A_15 ++ (t191A_16 ++ (t191A_17 ++ (t191A_18 ++ (t191A_19 ++ (t191A_20 ++ (t191A_21 ++ (t191A_22 ++ (t191A_23 ++ (t191A_24 ++ (t191A_25 ++ (t191A_26 ++ (t191A_27 ++ (t191A_28 ++ (t191A_29 ++ (t191A_30 ++ (t191A_31 ++ (t191A_32 ++ (t191A_33 ++ (t191A_34 ++ (t191A_35 ++ (t191A_36 ++ (t191A_37 ++ (t191A_38))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t191B : List Tok := t191B_0 ++ (t191B_1 ++ (t191B_2 ++ (t191B_3 ++ (t191B_4 ++ (t191B_5 ++ (t191B_6 ++ (t191B_7 ++ (t191B_8 ++ (t191B_9 ++ (t191B_10 ++ (t191B_11 ++ (t191B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 191：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run191 : (nbRun P nb191 0 kN191 t191A).1 = true ∧ (nbRun P nb191 1 kN191 t191B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s191A_0) (wseg_append (wseg_of s191A_1) (wseg_append (wseg_of s191A_2) (wseg_append (wseg_of s191A_3) (wseg_append (wseg_of s191A_4) (wseg_append (wseg_of s191A_5) (wseg_append (wseg_of s191A_6) (wseg_append (wseg_of s191A_7) (wseg_append (wseg_of s191A_8) (wseg_append (wseg_of s191A_9) (wseg_append (wseg_of s191A_10) (wseg_append (wseg_of s191A_11) (wseg_append (wseg_of s191A_12) (wseg_append (wseg_of s191A_13) (wseg_append (wseg_of s191A_14) (wseg_append (wseg_of s191A_15) (wseg_append (wseg_of s191A_16) (wseg_append (wseg_of s191A_17) (wseg_append (wseg_of s191A_18) (wseg_append (wseg_of s191A_19) (wseg_append (wseg_of s191A_20) (wseg_append (wseg_of s191A_21) (wseg_append (wseg_of s191A_22) (wseg_append (wseg_of s191A_23) (wseg_append (wseg_of s191A_24) (wseg_append (wseg_of s191A_25) (wseg_append (wseg_of s191A_26) (wseg_append (wseg_of s191A_27) (wseg_append (wseg_of s191A_28) (wseg_append (wseg_of s191A_29) (wseg_append (wseg_of s191A_30) (wseg_append (wseg_of s191A_31) (wseg_append (wseg_of s191A_32) (wseg_append (wseg_of s191A_33) (wseg_append (wseg_of s191A_34) (wseg_append (wseg_of s191A_35) (wseg_append (wseg_of s191A_36) (wseg_append (wseg_of s191A_37) (wseg_of s191A_38))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s191B_0) (wseg_append (wseg_of s191B_1) (wseg_append (wseg_of s191B_2) (wseg_append (wseg_of s191B_3) (wseg_append (wseg_of s191B_4) (wseg_append (wseg_of s191B_5) (wseg_append (wseg_of s191B_6) (wseg_append (wseg_of s191B_7) (wseg_append (wseg_of s191B_8) (wseg_append (wseg_of s191B_9) (wseg_append (wseg_of s191B_10) (wseg_append (wseg_of s191B_11) (wseg_of s191B_12)))))))))))))⟩

end PackLean.D40.Tet
