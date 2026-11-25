-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS036_0
import PackLean.D40.K.FarS036_1
import PackLean.D40.K.FarS036_2
import PackLean.D40.K.FarS036_3
import PackLean.D40.K.FarS036_4
import PackLean.D40.K.FarS036_5
import PackLean.D40.K.FarS036_6
import PackLean.D40.K.FarS036_7
import PackLean.D40.K.FarS036_8
import PackLean.D40.K.FarS036_9
import PackLean.D40.K.FarS036_10
import PackLean.D40.K.FarS036_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t111A : List Tok := t111A_0 ++ (t111A_1 ++ (t111A_2 ++ (t111A_3 ++ (t111A_4 ++ (t111A_5 ++ (t111A_6 ++ (t111A_7 ++ (t111A_8 ++ (t111A_9 ++ (t111A_10 ++ (t111A_11 ++ (t111A_12 ++ (t111A_13 ++ (t111A_14 ++ (t111A_15 ++ (t111A_16 ++ (t111A_17 ++ (t111A_18 ++ (t111A_19 ++ (t111A_20 ++ (t111A_21 ++ (t111A_22 ++ (t111A_23 ++ (t111A_24 ++ (t111A_25 ++ (t111A_26 ++ (t111A_27 ++ (t111A_28 ++ (t111A_29 ++ (t111A_30 ++ (t111A_31 ++ (t111A_32 ++ (t111A_33 ++ (t111A_34 ++ (t111A_35 ++ (t111A_36 ++ (t111A_37 ++ (t111A_38 ++ (t111A_39 ++ (t111A_40 ++ (t111A_41 ++ (t111A_42 ++ (t111A_43 ++ (t111A_44 ++ (t111A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t111B : List Tok := t111B_0 ++ (t111B_1 ++ (t111B_2 ++ (t111B_3 ++ (t111B_4 ++ (t111B_5 ++ (t111B_6 ++ (t111B_7 ++ (t111B_8 ++ (t111B_9 ++ (t111B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 111：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run111 : (nbRun P nb111 0 kN111 t111A).1 = true ∧ (nbRun P nb111 1 kN111 t111B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s111A_0) (wseg_append (wseg_of s111A_1) (wseg_append (wseg_of s111A_2) (wseg_append (wseg_of s111A_3) (wseg_append (wseg_of s111A_4) (wseg_append (wseg_of s111A_5) (wseg_append (wseg_of s111A_6) (wseg_append (wseg_of s111A_7) (wseg_append (wseg_of s111A_8) (wseg_append (wseg_of s111A_9) (wseg_append (wseg_of s111A_10) (wseg_append (wseg_of s111A_11) (wseg_append (wseg_of s111A_12) (wseg_append (wseg_of s111A_13) (wseg_append (wseg_of s111A_14) (wseg_append (wseg_of s111A_15) (wseg_append (wseg_of s111A_16) (wseg_append (wseg_of s111A_17) (wseg_append (wseg_of s111A_18) (wseg_append (wseg_of s111A_19) (wseg_append (wseg_of s111A_20) (wseg_append (wseg_of s111A_21) (wseg_append (wseg_of s111A_22) (wseg_append (wseg_of s111A_23) (wseg_append (wseg_of s111A_24) (wseg_append (wseg_of s111A_25) (wseg_append (wseg_of s111A_26) (wseg_append (wseg_of s111A_27) (wseg_append (wseg_of s111A_28) (wseg_append (wseg_of s111A_29) (wseg_append (wseg_of s111A_30) (wseg_append (wseg_of s111A_31) (wseg_append (wseg_of s111A_32) (wseg_append (wseg_of s111A_33) (wseg_append (wseg_of s111A_34) (wseg_append (wseg_of s111A_35) (wseg_append (wseg_of s111A_36) (wseg_append (wseg_of s111A_37) (wseg_append (wseg_of s111A_38) (wseg_append (wseg_of s111A_39) (wseg_append (wseg_of s111A_40) (wseg_append (wseg_of s111A_41) (wseg_append (wseg_of s111A_42) (wseg_append (wseg_of s111A_43) (wseg_append (wseg_of s111A_44) (wseg_of s111A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s111B_0) (wseg_append (wseg_of s111B_1) (wseg_append (wseg_of s111B_2) (wseg_append (wseg_of s111B_3) (wseg_append (wseg_of s111B_4) (wseg_append (wseg_of s111B_5) (wseg_append (wseg_of s111B_6) (wseg_append (wseg_of s111B_7) (wseg_append (wseg_of s111B_8) (wseg_append (wseg_of s111B_9) (wseg_of s111B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t112A : List Tok := t112A_0 ++ (t112A_1 ++ (t112A_2 ++ (t112A_3 ++ (t112A_4 ++ (t112A_5 ++ (t112A_6 ++ (t112A_7 ++ (t112A_8 ++ (t112A_9 ++ (t112A_10 ++ (t112A_11 ++ (t112A_12 ++ (t112A_13 ++ (t112A_14 ++ (t112A_15 ++ (t112A_16 ++ (t112A_17 ++ (t112A_18 ++ (t112A_19 ++ (t112A_20 ++ (t112A_21 ++ (t112A_22 ++ (t112A_23 ++ (t112A_24 ++ (t112A_25 ++ (t112A_26 ++ (t112A_27 ++ (t112A_28 ++ (t112A_29 ++ (t112A_30 ++ (t112A_31 ++ (t112A_32 ++ (t112A_33 ++ (t112A_34 ++ (t112A_35 ++ (t112A_36 ++ (t112A_37 ++ (t112A_38 ++ (t112A_39 ++ (t112A_40 ++ (t112A_41 ++ (t112A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t112B : List Tok := t112B_0 ++ (t112B_1 ++ (t112B_2 ++ (t112B_3 ++ (t112B_4 ++ (t112B_5 ++ (t112B_6 ++ (t112B_7 ++ (t112B_8 ++ (t112B_9 ++ (t112B_10 ++ (t112B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 112：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run112 : (nbRun P nb112 0 kN112 t112A).1 = true ∧ (nbRun P nb112 1 kN112 t112B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s112A_0) (wseg_append (wseg_of s112A_1) (wseg_append (wseg_of s112A_2) (wseg_append (wseg_of s112A_3) (wseg_append (wseg_of s112A_4) (wseg_append (wseg_of s112A_5) (wseg_append (wseg_of s112A_6) (wseg_append (wseg_of s112A_7) (wseg_append (wseg_of s112A_8) (wseg_append (wseg_of s112A_9) (wseg_append (wseg_of s112A_10) (wseg_append (wseg_of s112A_11) (wseg_append (wseg_of s112A_12) (wseg_append (wseg_of s112A_13) (wseg_append (wseg_of s112A_14) (wseg_append (wseg_of s112A_15) (wseg_append (wseg_of s112A_16) (wseg_append (wseg_of s112A_17) (wseg_append (wseg_of s112A_18) (wseg_append (wseg_of s112A_19) (wseg_append (wseg_of s112A_20) (wseg_append (wseg_of s112A_21) (wseg_append (wseg_of s112A_22) (wseg_append (wseg_of s112A_23) (wseg_append (wseg_of s112A_24) (wseg_append (wseg_of s112A_25) (wseg_append (wseg_of s112A_26) (wseg_append (wseg_of s112A_27) (wseg_append (wseg_of s112A_28) (wseg_append (wseg_of s112A_29) (wseg_append (wseg_of s112A_30) (wseg_append (wseg_of s112A_31) (wseg_append (wseg_of s112A_32) (wseg_append (wseg_of s112A_33) (wseg_append (wseg_of s112A_34) (wseg_append (wseg_of s112A_35) (wseg_append (wseg_of s112A_36) (wseg_append (wseg_of s112A_37) (wseg_append (wseg_of s112A_38) (wseg_append (wseg_of s112A_39) (wseg_append (wseg_of s112A_40) (wseg_append (wseg_of s112A_41) (wseg_of s112A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s112B_0) (wseg_append (wseg_of s112B_1) (wseg_append (wseg_of s112B_2) (wseg_append (wseg_of s112B_3) (wseg_append (wseg_of s112B_4) (wseg_append (wseg_of s112B_5) (wseg_append (wseg_of s112B_6) (wseg_append (wseg_of s112B_7) (wseg_append (wseg_of s112B_8) (wseg_append (wseg_of s112B_9) (wseg_append (wseg_of s112B_10) (wseg_of s112B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t113A : List Tok := t113A_0 ++ (t113A_1 ++ (t113A_2 ++ (t113A_3 ++ (t113A_4 ++ (t113A_5 ++ (t113A_6 ++ (t113A_7 ++ (t113A_8 ++ (t113A_9 ++ (t113A_10 ++ (t113A_11 ++ (t113A_12 ++ (t113A_13 ++ (t113A_14 ++ (t113A_15 ++ (t113A_16 ++ (t113A_17 ++ (t113A_18 ++ (t113A_19 ++ (t113A_20 ++ (t113A_21 ++ (t113A_22 ++ (t113A_23 ++ (t113A_24 ++ (t113A_25 ++ (t113A_26 ++ (t113A_27 ++ (t113A_28 ++ (t113A_29 ++ (t113A_30 ++ (t113A_31 ++ (t113A_32 ++ (t113A_33 ++ (t113A_34 ++ (t113A_35 ++ (t113A_36 ++ (t113A_37 ++ (t113A_38 ++ (t113A_39 ++ (t113A_40 ++ (t113A_41 ++ (t113A_42 ++ (t113A_43 ++ (t113A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t113B : List Tok := t113B_0 ++ (t113B_1 ++ (t113B_2 ++ (t113B_3 ++ (t113B_4 ++ (t113B_5 ++ (t113B_6 ++ (t113B_7 ++ (t113B_8 ++ (t113B_9 ++ (t113B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 113：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run113 : (nbRun P nb113 0 kN113 t113A).1 = true ∧ (nbRun P nb113 1 kN113 t113B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s113A_0) (wseg_append (wseg_of s113A_1) (wseg_append (wseg_of s113A_2) (wseg_append (wseg_of s113A_3) (wseg_append (wseg_of s113A_4) (wseg_append (wseg_of s113A_5) (wseg_append (wseg_of s113A_6) (wseg_append (wseg_of s113A_7) (wseg_append (wseg_of s113A_8) (wseg_append (wseg_of s113A_9) (wseg_append (wseg_of s113A_10) (wseg_append (wseg_of s113A_11) (wseg_append (wseg_of s113A_12) (wseg_append (wseg_of s113A_13) (wseg_append (wseg_of s113A_14) (wseg_append (wseg_of s113A_15) (wseg_append (wseg_of s113A_16) (wseg_append (wseg_of s113A_17) (wseg_append (wseg_of s113A_18) (wseg_append (wseg_of s113A_19) (wseg_append (wseg_of s113A_20) (wseg_append (wseg_of s113A_21) (wseg_append (wseg_of s113A_22) (wseg_append (wseg_of s113A_23) (wseg_append (wseg_of s113A_24) (wseg_append (wseg_of s113A_25) (wseg_append (wseg_of s113A_26) (wseg_append (wseg_of s113A_27) (wseg_append (wseg_of s113A_28) (wseg_append (wseg_of s113A_29) (wseg_append (wseg_of s113A_30) (wseg_append (wseg_of s113A_31) (wseg_append (wseg_of s113A_32) (wseg_append (wseg_of s113A_33) (wseg_append (wseg_of s113A_34) (wseg_append (wseg_of s113A_35) (wseg_append (wseg_of s113A_36) (wseg_append (wseg_of s113A_37) (wseg_append (wseg_of s113A_38) (wseg_append (wseg_of s113A_39) (wseg_append (wseg_of s113A_40) (wseg_append (wseg_of s113A_41) (wseg_append (wseg_of s113A_42) (wseg_append (wseg_of s113A_43) (wseg_of s113A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s113B_0) (wseg_append (wseg_of s113B_1) (wseg_append (wseg_of s113B_2) (wseg_append (wseg_of s113B_3) (wseg_append (wseg_of s113B_4) (wseg_append (wseg_of s113B_5) (wseg_append (wseg_of s113B_6) (wseg_append (wseg_of s113B_7) (wseg_append (wseg_of s113B_8) (wseg_append (wseg_of s113B_9) (wseg_of s113B_10)))))))))))⟩

end PackLean.D40.Tet
