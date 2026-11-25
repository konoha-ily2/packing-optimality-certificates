-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS031_0
import PackLean.D40.K.FarS031_1
import PackLean.D40.K.FarS031_2
import PackLean.D40.K.FarS031_3
import PackLean.D40.K.FarS031_4
import PackLean.D40.K.FarS031_5
import PackLean.D40.K.FarS031_6
import PackLean.D40.K.FarS031_7
import PackLean.D40.K.FarS031_8
import PackLean.D40.K.FarS031_9
import PackLean.D40.K.FarS031_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t096A : List Tok := t096A_0 ++ (t096A_1 ++ (t096A_2 ++ (t096A_3 ++ (t096A_4 ++ (t096A_5 ++ (t096A_6 ++ (t096A_7 ++ (t096A_8 ++ (t096A_9 ++ (t096A_10 ++ (t096A_11 ++ (t096A_12 ++ (t096A_13 ++ (t096A_14 ++ (t096A_15 ++ (t096A_16 ++ (t096A_17 ++ (t096A_18 ++ (t096A_19 ++ (t096A_20 ++ (t096A_21 ++ (t096A_22 ++ (t096A_23 ++ (t096A_24 ++ (t096A_25 ++ (t096A_26 ++ (t096A_27 ++ (t096A_28 ++ (t096A_29 ++ (t096A_30 ++ (t096A_31 ++ (t096A_32 ++ (t096A_33 ++ (t096A_34 ++ (t096A_35 ++ (t096A_36 ++ (t096A_37 ++ (t096A_38 ++ (t096A_39 ++ (t096A_40 ++ (t096A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t096B : List Tok := t096B_0 ++ (t096B_1 ++ (t096B_2 ++ (t096B_3 ++ (t096B_4 ++ (t096B_5 ++ (t096B_6 ++ (t096B_7 ++ (t096B_8 ++ (t096B_9 ++ (t096B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 096：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run096 : (nbRun P nb096 0 kN096 t096A).1 = true ∧ (nbRun P nb096 1 kN096 t096B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s096A_0) (wseg_append (wseg_of s096A_1) (wseg_append (wseg_of s096A_2) (wseg_append (wseg_of s096A_3) (wseg_append (wseg_of s096A_4) (wseg_append (wseg_of s096A_5) (wseg_append (wseg_of s096A_6) (wseg_append (wseg_of s096A_7) (wseg_append (wseg_of s096A_8) (wseg_append (wseg_of s096A_9) (wseg_append (wseg_of s096A_10) (wseg_append (wseg_of s096A_11) (wseg_append (wseg_of s096A_12) (wseg_append (wseg_of s096A_13) (wseg_append (wseg_of s096A_14) (wseg_append (wseg_of s096A_15) (wseg_append (wseg_of s096A_16) (wseg_append (wseg_of s096A_17) (wseg_append (wseg_of s096A_18) (wseg_append (wseg_of s096A_19) (wseg_append (wseg_of s096A_20) (wseg_append (wseg_of s096A_21) (wseg_append (wseg_of s096A_22) (wseg_append (wseg_of s096A_23) (wseg_append (wseg_of s096A_24) (wseg_append (wseg_of s096A_25) (wseg_append (wseg_of s096A_26) (wseg_append (wseg_of s096A_27) (wseg_append (wseg_of s096A_28) (wseg_append (wseg_of s096A_29) (wseg_append (wseg_of s096A_30) (wseg_append (wseg_of s096A_31) (wseg_append (wseg_of s096A_32) (wseg_append (wseg_of s096A_33) (wseg_append (wseg_of s096A_34) (wseg_append (wseg_of s096A_35) (wseg_append (wseg_of s096A_36) (wseg_append (wseg_of s096A_37) (wseg_append (wseg_of s096A_38) (wseg_append (wseg_of s096A_39) (wseg_append (wseg_of s096A_40) (wseg_of s096A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s096B_0) (wseg_append (wseg_of s096B_1) (wseg_append (wseg_of s096B_2) (wseg_append (wseg_of s096B_3) (wseg_append (wseg_of s096B_4) (wseg_append (wseg_of s096B_5) (wseg_append (wseg_of s096B_6) (wseg_append (wseg_of s096B_7) (wseg_append (wseg_of s096B_8) (wseg_append (wseg_of s096B_9) (wseg_of s096B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t097A : List Tok := t097A_0 ++ (t097A_1 ++ (t097A_2 ++ (t097A_3 ++ (t097A_4 ++ (t097A_5 ++ (t097A_6 ++ (t097A_7 ++ (t097A_8 ++ (t097A_9 ++ (t097A_10 ++ (t097A_11 ++ (t097A_12 ++ (t097A_13 ++ (t097A_14 ++ (t097A_15 ++ (t097A_16 ++ (t097A_17 ++ (t097A_18 ++ (t097A_19 ++ (t097A_20 ++ (t097A_21 ++ (t097A_22 ++ (t097A_23 ++ (t097A_24 ++ (t097A_25 ++ (t097A_26 ++ (t097A_27 ++ (t097A_28 ++ (t097A_29 ++ (t097A_30 ++ (t097A_31 ++ (t097A_32 ++ (t097A_33 ++ (t097A_34 ++ (t097A_35 ++ (t097A_36 ++ (t097A_37 ++ (t097A_38 ++ (t097A_39 ++ (t097A_40 ++ (t097A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t097B : List Tok := t097B_0 ++ (t097B_1 ++ (t097B_2 ++ (t097B_3 ++ (t097B_4 ++ (t097B_5 ++ (t097B_6 ++ (t097B_7 ++ (t097B_8 ++ (t097B_9 ++ (t097B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 097：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run097 : (nbRun P nb097 0 kN097 t097A).1 = true ∧ (nbRun P nb097 1 kN097 t097B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s097A_0) (wseg_append (wseg_of s097A_1) (wseg_append (wseg_of s097A_2) (wseg_append (wseg_of s097A_3) (wseg_append (wseg_of s097A_4) (wseg_append (wseg_of s097A_5) (wseg_append (wseg_of s097A_6) (wseg_append (wseg_of s097A_7) (wseg_append (wseg_of s097A_8) (wseg_append (wseg_of s097A_9) (wseg_append (wseg_of s097A_10) (wseg_append (wseg_of s097A_11) (wseg_append (wseg_of s097A_12) (wseg_append (wseg_of s097A_13) (wseg_append (wseg_of s097A_14) (wseg_append (wseg_of s097A_15) (wseg_append (wseg_of s097A_16) (wseg_append (wseg_of s097A_17) (wseg_append (wseg_of s097A_18) (wseg_append (wseg_of s097A_19) (wseg_append (wseg_of s097A_20) (wseg_append (wseg_of s097A_21) (wseg_append (wseg_of s097A_22) (wseg_append (wseg_of s097A_23) (wseg_append (wseg_of s097A_24) (wseg_append (wseg_of s097A_25) (wseg_append (wseg_of s097A_26) (wseg_append (wseg_of s097A_27) (wseg_append (wseg_of s097A_28) (wseg_append (wseg_of s097A_29) (wseg_append (wseg_of s097A_30) (wseg_append (wseg_of s097A_31) (wseg_append (wseg_of s097A_32) (wseg_append (wseg_of s097A_33) (wseg_append (wseg_of s097A_34) (wseg_append (wseg_of s097A_35) (wseg_append (wseg_of s097A_36) (wseg_append (wseg_of s097A_37) (wseg_append (wseg_of s097A_38) (wseg_append (wseg_of s097A_39) (wseg_append (wseg_of s097A_40) (wseg_of s097A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s097B_0) (wseg_append (wseg_of s097B_1) (wseg_append (wseg_of s097B_2) (wseg_append (wseg_of s097B_3) (wseg_append (wseg_of s097B_4) (wseg_append (wseg_of s097B_5) (wseg_append (wseg_of s097B_6) (wseg_append (wseg_of s097B_7) (wseg_append (wseg_of s097B_8) (wseg_append (wseg_of s097B_9) (wseg_of s097B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t098A : List Tok := t098A_0 ++ (t098A_1 ++ (t098A_2 ++ (t098A_3 ++ (t098A_4 ++ (t098A_5 ++ (t098A_6 ++ (t098A_7 ++ (t098A_8 ++ (t098A_9 ++ (t098A_10 ++ (t098A_11 ++ (t098A_12 ++ (t098A_13 ++ (t098A_14 ++ (t098A_15 ++ (t098A_16 ++ (t098A_17 ++ (t098A_18 ++ (t098A_19 ++ (t098A_20 ++ (t098A_21 ++ (t098A_22 ++ (t098A_23 ++ (t098A_24 ++ (t098A_25 ++ (t098A_26 ++ (t098A_27 ++ (t098A_28 ++ (t098A_29 ++ (t098A_30 ++ (t098A_31 ++ (t098A_32 ++ (t098A_33 ++ (t098A_34 ++ (t098A_35 ++ (t098A_36 ++ (t098A_37 ++ (t098A_38 ++ (t098A_39 ++ (t098A_40 ++ (t098A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t098B : List Tok := t098B_0 ++ (t098B_1 ++ (t098B_2 ++ (t098B_3 ++ (t098B_4 ++ (t098B_5 ++ (t098B_6 ++ (t098B_7 ++ (t098B_8 ++ (t098B_9 ++ (t098B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 098：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run098 : (nbRun P nb098 0 kN098 t098A).1 = true ∧ (nbRun P nb098 1 kN098 t098B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s098A_0) (wseg_append (wseg_of s098A_1) (wseg_append (wseg_of s098A_2) (wseg_append (wseg_of s098A_3) (wseg_append (wseg_of s098A_4) (wseg_append (wseg_of s098A_5) (wseg_append (wseg_of s098A_6) (wseg_append (wseg_of s098A_7) (wseg_append (wseg_of s098A_8) (wseg_append (wseg_of s098A_9) (wseg_append (wseg_of s098A_10) (wseg_append (wseg_of s098A_11) (wseg_append (wseg_of s098A_12) (wseg_append (wseg_of s098A_13) (wseg_append (wseg_of s098A_14) (wseg_append (wseg_of s098A_15) (wseg_append (wseg_of s098A_16) (wseg_append (wseg_of s098A_17) (wseg_append (wseg_of s098A_18) (wseg_append (wseg_of s098A_19) (wseg_append (wseg_of s098A_20) (wseg_append (wseg_of s098A_21) (wseg_append (wseg_of s098A_22) (wseg_append (wseg_of s098A_23) (wseg_append (wseg_of s098A_24) (wseg_append (wseg_of s098A_25) (wseg_append (wseg_of s098A_26) (wseg_append (wseg_of s098A_27) (wseg_append (wseg_of s098A_28) (wseg_append (wseg_of s098A_29) (wseg_append (wseg_of s098A_30) (wseg_append (wseg_of s098A_31) (wseg_append (wseg_of s098A_32) (wseg_append (wseg_of s098A_33) (wseg_append (wseg_of s098A_34) (wseg_append (wseg_of s098A_35) (wseg_append (wseg_of s098A_36) (wseg_append (wseg_of s098A_37) (wseg_append (wseg_of s098A_38) (wseg_append (wseg_of s098A_39) (wseg_append (wseg_of s098A_40) (wseg_of s098A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s098B_0) (wseg_append (wseg_of s098B_1) (wseg_append (wseg_of s098B_2) (wseg_append (wseg_of s098B_3) (wseg_append (wseg_of s098B_4) (wseg_append (wseg_of s098B_5) (wseg_append (wseg_of s098B_6) (wseg_append (wseg_of s098B_7) (wseg_append (wseg_of s098B_8) (wseg_append (wseg_of s098B_9) (wseg_of s098B_10)))))))))))⟩

end PackLean.D40.Tet
