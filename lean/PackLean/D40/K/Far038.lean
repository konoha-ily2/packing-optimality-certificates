-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS038_0
import PackLean.D40.K.FarS038_1
import PackLean.D40.K.FarS038_2
import PackLean.D40.K.FarS038_3
import PackLean.D40.K.FarS038_4
import PackLean.D40.K.FarS038_5
import PackLean.D40.K.FarS038_6
import PackLean.D40.K.FarS038_7
import PackLean.D40.K.FarS038_8
import PackLean.D40.K.FarS038_9
import PackLean.D40.K.FarS038_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t117A : List Tok := t117A_0 ++ (t117A_1 ++ (t117A_2 ++ (t117A_3 ++ (t117A_4 ++ (t117A_5 ++ (t117A_6 ++ (t117A_7 ++ (t117A_8 ++ (t117A_9 ++ (t117A_10 ++ (t117A_11 ++ (t117A_12 ++ (t117A_13 ++ (t117A_14 ++ (t117A_15 ++ (t117A_16 ++ (t117A_17 ++ (t117A_18 ++ (t117A_19 ++ (t117A_20 ++ (t117A_21 ++ (t117A_22 ++ (t117A_23 ++ (t117A_24 ++ (t117A_25 ++ (t117A_26 ++ (t117A_27 ++ (t117A_28 ++ (t117A_29 ++ (t117A_30 ++ (t117A_31 ++ (t117A_32 ++ (t117A_33 ++ (t117A_34 ++ (t117A_35 ++ (t117A_36 ++ (t117A_37 ++ (t117A_38 ++ (t117A_39 ++ (t117A_40 ++ (t117A_41 ++ (t117A_42 ++ (t117A_43)))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t117B : List Tok := t117B_0 ++ (t117B_1 ++ (t117B_2 ++ (t117B_3 ++ (t117B_4 ++ (t117B_5 ++ (t117B_6 ++ (t117B_7 ++ (t117B_8 ++ (t117B_9 ++ (t117B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 117：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run117 : (nbRun P nb117 0 kN117 t117A).1 = true ∧ (nbRun P nb117 1 kN117 t117B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s117A_0) (wseg_append (wseg_of s117A_1) (wseg_append (wseg_of s117A_2) (wseg_append (wseg_of s117A_3) (wseg_append (wseg_of s117A_4) (wseg_append (wseg_of s117A_5) (wseg_append (wseg_of s117A_6) (wseg_append (wseg_of s117A_7) (wseg_append (wseg_of s117A_8) (wseg_append (wseg_of s117A_9) (wseg_append (wseg_of s117A_10) (wseg_append (wseg_of s117A_11) (wseg_append (wseg_of s117A_12) (wseg_append (wseg_of s117A_13) (wseg_append (wseg_of s117A_14) (wseg_append (wseg_of s117A_15) (wseg_append (wseg_of s117A_16) (wseg_append (wseg_of s117A_17) (wseg_append (wseg_of s117A_18) (wseg_append (wseg_of s117A_19) (wseg_append (wseg_of s117A_20) (wseg_append (wseg_of s117A_21) (wseg_append (wseg_of s117A_22) (wseg_append (wseg_of s117A_23) (wseg_append (wseg_of s117A_24) (wseg_append (wseg_of s117A_25) (wseg_append (wseg_of s117A_26) (wseg_append (wseg_of s117A_27) (wseg_append (wseg_of s117A_28) (wseg_append (wseg_of s117A_29) (wseg_append (wseg_of s117A_30) (wseg_append (wseg_of s117A_31) (wseg_append (wseg_of s117A_32) (wseg_append (wseg_of s117A_33) (wseg_append (wseg_of s117A_34) (wseg_append (wseg_of s117A_35) (wseg_append (wseg_of s117A_36) (wseg_append (wseg_of s117A_37) (wseg_append (wseg_of s117A_38) (wseg_append (wseg_of s117A_39) (wseg_append (wseg_of s117A_40) (wseg_append (wseg_of s117A_41) (wseg_append (wseg_of s117A_42) (wseg_of s117A_43)))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s117B_0) (wseg_append (wseg_of s117B_1) (wseg_append (wseg_of s117B_2) (wseg_append (wseg_of s117B_3) (wseg_append (wseg_of s117B_4) (wseg_append (wseg_of s117B_5) (wseg_append (wseg_of s117B_6) (wseg_append (wseg_of s117B_7) (wseg_append (wseg_of s117B_8) (wseg_append (wseg_of s117B_9) (wseg_of s117B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t118A : List Tok := t118A_0 ++ (t118A_1 ++ (t118A_2 ++ (t118A_3 ++ (t118A_4 ++ (t118A_5 ++ (t118A_6 ++ (t118A_7 ++ (t118A_8 ++ (t118A_9 ++ (t118A_10 ++ (t118A_11 ++ (t118A_12 ++ (t118A_13 ++ (t118A_14 ++ (t118A_15 ++ (t118A_16 ++ (t118A_17 ++ (t118A_18 ++ (t118A_19 ++ (t118A_20 ++ (t118A_21 ++ (t118A_22 ++ (t118A_23 ++ (t118A_24 ++ (t118A_25 ++ (t118A_26 ++ (t118A_27 ++ (t118A_28 ++ (t118A_29 ++ (t118A_30 ++ (t118A_31 ++ (t118A_32 ++ (t118A_33 ++ (t118A_34 ++ (t118A_35 ++ (t118A_36 ++ (t118A_37 ++ (t118A_38 ++ (t118A_39 ++ (t118A_40))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t118B : List Tok := t118B_0 ++ (t118B_1 ++ (t118B_2 ++ (t118B_3 ++ (t118B_4 ++ (t118B_5 ++ (t118B_6 ++ (t118B_7 ++ (t118B_8 ++ (t118B_9 ++ (t118B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 118：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run118 : (nbRun P nb118 0 kN118 t118A).1 = true ∧ (nbRun P nb118 1 kN118 t118B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s118A_0) (wseg_append (wseg_of s118A_1) (wseg_append (wseg_of s118A_2) (wseg_append (wseg_of s118A_3) (wseg_append (wseg_of s118A_4) (wseg_append (wseg_of s118A_5) (wseg_append (wseg_of s118A_6) (wseg_append (wseg_of s118A_7) (wseg_append (wseg_of s118A_8) (wseg_append (wseg_of s118A_9) (wseg_append (wseg_of s118A_10) (wseg_append (wseg_of s118A_11) (wseg_append (wseg_of s118A_12) (wseg_append (wseg_of s118A_13) (wseg_append (wseg_of s118A_14) (wseg_append (wseg_of s118A_15) (wseg_append (wseg_of s118A_16) (wseg_append (wseg_of s118A_17) (wseg_append (wseg_of s118A_18) (wseg_append (wseg_of s118A_19) (wseg_append (wseg_of s118A_20) (wseg_append (wseg_of s118A_21) (wseg_append (wseg_of s118A_22) (wseg_append (wseg_of s118A_23) (wseg_append (wseg_of s118A_24) (wseg_append (wseg_of s118A_25) (wseg_append (wseg_of s118A_26) (wseg_append (wseg_of s118A_27) (wseg_append (wseg_of s118A_28) (wseg_append (wseg_of s118A_29) (wseg_append (wseg_of s118A_30) (wseg_append (wseg_of s118A_31) (wseg_append (wseg_of s118A_32) (wseg_append (wseg_of s118A_33) (wseg_append (wseg_of s118A_34) (wseg_append (wseg_of s118A_35) (wseg_append (wseg_of s118A_36) (wseg_append (wseg_of s118A_37) (wseg_append (wseg_of s118A_38) (wseg_append (wseg_of s118A_39) (wseg_of s118A_40))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s118B_0) (wseg_append (wseg_of s118B_1) (wseg_append (wseg_of s118B_2) (wseg_append (wseg_of s118B_3) (wseg_append (wseg_of s118B_4) (wseg_append (wseg_of s118B_5) (wseg_append (wseg_of s118B_6) (wseg_append (wseg_of s118B_7) (wseg_append (wseg_of s118B_8) (wseg_append (wseg_of s118B_9) (wseg_of s118B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t119A : List Tok := t119A_0 ++ (t119A_1 ++ (t119A_2 ++ (t119A_3 ++ (t119A_4 ++ (t119A_5 ++ (t119A_6 ++ (t119A_7 ++ (t119A_8 ++ (t119A_9 ++ (t119A_10 ++ (t119A_11 ++ (t119A_12 ++ (t119A_13 ++ (t119A_14 ++ (t119A_15 ++ (t119A_16 ++ (t119A_17 ++ (t119A_18 ++ (t119A_19 ++ (t119A_20 ++ (t119A_21 ++ (t119A_22 ++ (t119A_23 ++ (t119A_24 ++ (t119A_25 ++ (t119A_26 ++ (t119A_27 ++ (t119A_28 ++ (t119A_29 ++ (t119A_30 ++ (t119A_31 ++ (t119A_32 ++ (t119A_33 ++ (t119A_34 ++ (t119A_35 ++ (t119A_36 ++ (t119A_37)))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t119B : List Tok := t119B_0 ++ (t119B_1 ++ (t119B_2 ++ (t119B_3 ++ (t119B_4 ++ (t119B_5 ++ (t119B_6 ++ (t119B_7 ++ (t119B_8 ++ (t119B_9 ++ (t119B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 119：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run119 : (nbRun P nb119 0 kN119 t119A).1 = true ∧ (nbRun P nb119 1 kN119 t119B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s119A_0) (wseg_append (wseg_of s119A_1) (wseg_append (wseg_of s119A_2) (wseg_append (wseg_of s119A_3) (wseg_append (wseg_of s119A_4) (wseg_append (wseg_of s119A_5) (wseg_append (wseg_of s119A_6) (wseg_append (wseg_of s119A_7) (wseg_append (wseg_of s119A_8) (wseg_append (wseg_of s119A_9) (wseg_append (wseg_of s119A_10) (wseg_append (wseg_of s119A_11) (wseg_append (wseg_of s119A_12) (wseg_append (wseg_of s119A_13) (wseg_append (wseg_of s119A_14) (wseg_append (wseg_of s119A_15) (wseg_append (wseg_of s119A_16) (wseg_append (wseg_of s119A_17) (wseg_append (wseg_of s119A_18) (wseg_append (wseg_of s119A_19) (wseg_append (wseg_of s119A_20) (wseg_append (wseg_of s119A_21) (wseg_append (wseg_of s119A_22) (wseg_append (wseg_of s119A_23) (wseg_append (wseg_of s119A_24) (wseg_append (wseg_of s119A_25) (wseg_append (wseg_of s119A_26) (wseg_append (wseg_of s119A_27) (wseg_append (wseg_of s119A_28) (wseg_append (wseg_of s119A_29) (wseg_append (wseg_of s119A_30) (wseg_append (wseg_of s119A_31) (wseg_append (wseg_of s119A_32) (wseg_append (wseg_of s119A_33) (wseg_append (wseg_of s119A_34) (wseg_append (wseg_of s119A_35) (wseg_append (wseg_of s119A_36) (wseg_of s119A_37)))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s119B_0) (wseg_append (wseg_of s119B_1) (wseg_append (wseg_of s119B_2) (wseg_append (wseg_of s119B_3) (wseg_append (wseg_of s119B_4) (wseg_append (wseg_of s119B_5) (wseg_append (wseg_of s119B_6) (wseg_append (wseg_of s119B_7) (wseg_append (wseg_of s119B_8) (wseg_append (wseg_of s119B_9) (wseg_of s119B_10)))))))))))⟩

end PackLean.D40.Tet
