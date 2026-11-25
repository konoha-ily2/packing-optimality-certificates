-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS042_0
import PackLean.D40.K.FarS042_1
import PackLean.D40.K.FarS042_2
import PackLean.D40.K.FarS042_3
import PackLean.D40.K.FarS042_4
import PackLean.D40.K.FarS042_5
import PackLean.D40.K.FarS042_6
import PackLean.D40.K.FarS042_7
import PackLean.D40.K.FarS042_8
import PackLean.D40.K.FarS042_9
import PackLean.D40.K.FarS042_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t130A : List Tok := t130A_0 ++ (t130A_1 ++ (t130A_2 ++ (t130A_3 ++ (t130A_4 ++ (t130A_5 ++ (t130A_6 ++ (t130A_7 ++ (t130A_8 ++ (t130A_9 ++ (t130A_10 ++ (t130A_11 ++ (t130A_12 ++ (t130A_13 ++ (t130A_14 ++ (t130A_15 ++ (t130A_16 ++ (t130A_17 ++ (t130A_18 ++ (t130A_19 ++ (t130A_20 ++ (t130A_21 ++ (t130A_22 ++ (t130A_23 ++ (t130A_24 ++ (t130A_25 ++ (t130A_26 ++ (t130A_27 ++ (t130A_28 ++ (t130A_29 ++ (t130A_30 ++ (t130A_31 ++ (t130A_32 ++ (t130A_33 ++ (t130A_34 ++ (t130A_35 ++ (t130A_36 ++ (t130A_37 ++ (t130A_38 ++ (t130A_39 ++ (t130A_40 ++ (t130A_41 ++ (t130A_42 ++ (t130A_43 ++ (t130A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t130B : List Tok := t130B_0 ++ (t130B_1 ++ (t130B_2 ++ (t130B_3 ++ (t130B_4 ++ (t130B_5 ++ (t130B_6 ++ (t130B_7 ++ (t130B_8 ++ (t130B_9 ++ (t130B_10 ++ (t130B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 130：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run130 : (nbRun P nb130 0 kN130 t130A).1 = true ∧ (nbRun P nb130 1 kN130 t130B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s130A_0) (wseg_append (wseg_of s130A_1) (wseg_append (wseg_of s130A_2) (wseg_append (wseg_of s130A_3) (wseg_append (wseg_of s130A_4) (wseg_append (wseg_of s130A_5) (wseg_append (wseg_of s130A_6) (wseg_append (wseg_of s130A_7) (wseg_append (wseg_of s130A_8) (wseg_append (wseg_of s130A_9) (wseg_append (wseg_of s130A_10) (wseg_append (wseg_of s130A_11) (wseg_append (wseg_of s130A_12) (wseg_append (wseg_of s130A_13) (wseg_append (wseg_of s130A_14) (wseg_append (wseg_of s130A_15) (wseg_append (wseg_of s130A_16) (wseg_append (wseg_of s130A_17) (wseg_append (wseg_of s130A_18) (wseg_append (wseg_of s130A_19) (wseg_append (wseg_of s130A_20) (wseg_append (wseg_of s130A_21) (wseg_append (wseg_of s130A_22) (wseg_append (wseg_of s130A_23) (wseg_append (wseg_of s130A_24) (wseg_append (wseg_of s130A_25) (wseg_append (wseg_of s130A_26) (wseg_append (wseg_of s130A_27) (wseg_append (wseg_of s130A_28) (wseg_append (wseg_of s130A_29) (wseg_append (wseg_of s130A_30) (wseg_append (wseg_of s130A_31) (wseg_append (wseg_of s130A_32) (wseg_append (wseg_of s130A_33) (wseg_append (wseg_of s130A_34) (wseg_append (wseg_of s130A_35) (wseg_append (wseg_of s130A_36) (wseg_append (wseg_of s130A_37) (wseg_append (wseg_of s130A_38) (wseg_append (wseg_of s130A_39) (wseg_append (wseg_of s130A_40) (wseg_append (wseg_of s130A_41) (wseg_append (wseg_of s130A_42) (wseg_append (wseg_of s130A_43) (wseg_of s130A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s130B_0) (wseg_append (wseg_of s130B_1) (wseg_append (wseg_of s130B_2) (wseg_append (wseg_of s130B_3) (wseg_append (wseg_of s130B_4) (wseg_append (wseg_of s130B_5) (wseg_append (wseg_of s130B_6) (wseg_append (wseg_of s130B_7) (wseg_append (wseg_of s130B_8) (wseg_append (wseg_of s130B_9) (wseg_append (wseg_of s130B_10) (wseg_of s130B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t131A : List Tok := t131A_0 ++ (t131A_1 ++ (t131A_2 ++ (t131A_3 ++ (t131A_4 ++ (t131A_5 ++ (t131A_6 ++ (t131A_7 ++ (t131A_8 ++ (t131A_9 ++ (t131A_10 ++ (t131A_11 ++ (t131A_12 ++ (t131A_13 ++ (t131A_14 ++ (t131A_15 ++ (t131A_16 ++ (t131A_17 ++ (t131A_18 ++ (t131A_19 ++ (t131A_20 ++ (t131A_21 ++ (t131A_22 ++ (t131A_23 ++ (t131A_24 ++ (t131A_25 ++ (t131A_26 ++ (t131A_27 ++ (t131A_28 ++ (t131A_29 ++ (t131A_30 ++ (t131A_31 ++ (t131A_32 ++ (t131A_33 ++ (t131A_34 ++ (t131A_35 ++ (t131A_36 ++ (t131A_37 ++ (t131A_38 ++ (t131A_39 ++ (t131A_40 ++ (t131A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t131B : List Tok := t131B_0 ++ (t131B_1 ++ (t131B_2 ++ (t131B_3 ++ (t131B_4 ++ (t131B_5 ++ (t131B_6 ++ (t131B_7 ++ (t131B_8 ++ (t131B_9 ++ (t131B_10 ++ (t131B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 131：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run131 : (nbRun P nb131 0 kN131 t131A).1 = true ∧ (nbRun P nb131 1 kN131 t131B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s131A_0) (wseg_append (wseg_of s131A_1) (wseg_append (wseg_of s131A_2) (wseg_append (wseg_of s131A_3) (wseg_append (wseg_of s131A_4) (wseg_append (wseg_of s131A_5) (wseg_append (wseg_of s131A_6) (wseg_append (wseg_of s131A_7) (wseg_append (wseg_of s131A_8) (wseg_append (wseg_of s131A_9) (wseg_append (wseg_of s131A_10) (wseg_append (wseg_of s131A_11) (wseg_append (wseg_of s131A_12) (wseg_append (wseg_of s131A_13) (wseg_append (wseg_of s131A_14) (wseg_append (wseg_of s131A_15) (wseg_append (wseg_of s131A_16) (wseg_append (wseg_of s131A_17) (wseg_append (wseg_of s131A_18) (wseg_append (wseg_of s131A_19) (wseg_append (wseg_of s131A_20) (wseg_append (wseg_of s131A_21) (wseg_append (wseg_of s131A_22) (wseg_append (wseg_of s131A_23) (wseg_append (wseg_of s131A_24) (wseg_append (wseg_of s131A_25) (wseg_append (wseg_of s131A_26) (wseg_append (wseg_of s131A_27) (wseg_append (wseg_of s131A_28) (wseg_append (wseg_of s131A_29) (wseg_append (wseg_of s131A_30) (wseg_append (wseg_of s131A_31) (wseg_append (wseg_of s131A_32) (wseg_append (wseg_of s131A_33) (wseg_append (wseg_of s131A_34) (wseg_append (wseg_of s131A_35) (wseg_append (wseg_of s131A_36) (wseg_append (wseg_of s131A_37) (wseg_append (wseg_of s131A_38) (wseg_append (wseg_of s131A_39) (wseg_append (wseg_of s131A_40) (wseg_of s131A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s131B_0) (wseg_append (wseg_of s131B_1) (wseg_append (wseg_of s131B_2) (wseg_append (wseg_of s131B_3) (wseg_append (wseg_of s131B_4) (wseg_append (wseg_of s131B_5) (wseg_append (wseg_of s131B_6) (wseg_append (wseg_of s131B_7) (wseg_append (wseg_of s131B_8) (wseg_append (wseg_of s131B_9) (wseg_append (wseg_of s131B_10) (wseg_of s131B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t132A : List Tok := t132A_0 ++ (t132A_1 ++ (t132A_2 ++ (t132A_3 ++ (t132A_4 ++ (t132A_5 ++ (t132A_6 ++ (t132A_7 ++ (t132A_8 ++ (t132A_9 ++ (t132A_10 ++ (t132A_11 ++ (t132A_12 ++ (t132A_13 ++ (t132A_14 ++ (t132A_15 ++ (t132A_16 ++ (t132A_17 ++ (t132A_18 ++ (t132A_19 ++ (t132A_20 ++ (t132A_21 ++ (t132A_22 ++ (t132A_23 ++ (t132A_24 ++ (t132A_25 ++ (t132A_26 ++ (t132A_27 ++ (t132A_28 ++ (t132A_29 ++ (t132A_30 ++ (t132A_31 ++ (t132A_32 ++ (t132A_33 ++ (t132A_34 ++ (t132A_35 ++ (t132A_36))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t132B : List Tok := t132B_0 ++ (t132B_1 ++ (t132B_2 ++ (t132B_3 ++ (t132B_4 ++ (t132B_5 ++ (t132B_6 ++ (t132B_7 ++ (t132B_8 ++ (t132B_9 ++ (t132B_10 ++ (t132B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 132：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run132 : (nbRun P nb132 0 kN132 t132A).1 = true ∧ (nbRun P nb132 1 kN132 t132B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s132A_0) (wseg_append (wseg_of s132A_1) (wseg_append (wseg_of s132A_2) (wseg_append (wseg_of s132A_3) (wseg_append (wseg_of s132A_4) (wseg_append (wseg_of s132A_5) (wseg_append (wseg_of s132A_6) (wseg_append (wseg_of s132A_7) (wseg_append (wseg_of s132A_8) (wseg_append (wseg_of s132A_9) (wseg_append (wseg_of s132A_10) (wseg_append (wseg_of s132A_11) (wseg_append (wseg_of s132A_12) (wseg_append (wseg_of s132A_13) (wseg_append (wseg_of s132A_14) (wseg_append (wseg_of s132A_15) (wseg_append (wseg_of s132A_16) (wseg_append (wseg_of s132A_17) (wseg_append (wseg_of s132A_18) (wseg_append (wseg_of s132A_19) (wseg_append (wseg_of s132A_20) (wseg_append (wseg_of s132A_21) (wseg_append (wseg_of s132A_22) (wseg_append (wseg_of s132A_23) (wseg_append (wseg_of s132A_24) (wseg_append (wseg_of s132A_25) (wseg_append (wseg_of s132A_26) (wseg_append (wseg_of s132A_27) (wseg_append (wseg_of s132A_28) (wseg_append (wseg_of s132A_29) (wseg_append (wseg_of s132A_30) (wseg_append (wseg_of s132A_31) (wseg_append (wseg_of s132A_32) (wseg_append (wseg_of s132A_33) (wseg_append (wseg_of s132A_34) (wseg_append (wseg_of s132A_35) (wseg_of s132A_36))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s132B_0) (wseg_append (wseg_of s132B_1) (wseg_append (wseg_of s132B_2) (wseg_append (wseg_of s132B_3) (wseg_append (wseg_of s132B_4) (wseg_append (wseg_of s132B_5) (wseg_append (wseg_of s132B_6) (wseg_append (wseg_of s132B_7) (wseg_append (wseg_of s132B_8) (wseg_append (wseg_of s132B_9) (wseg_append (wseg_of s132B_10) (wseg_of s132B_11))))))))))))⟩

end PackLean.D40.Tet
