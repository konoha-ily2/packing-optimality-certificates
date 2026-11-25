-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS016_0
import PackLean.D40.K.FarS016_1
import PackLean.D40.K.FarS016_2
import PackLean.D40.K.FarS016_3
import PackLean.D40.K.FarS016_4
import PackLean.D40.K.FarS016_5
import PackLean.D40.K.FarS016_6
import PackLean.D40.K.FarS016_7
import PackLean.D40.K.FarS016_8
import PackLean.D40.K.FarS016_9
import PackLean.D40.K.FarS016_10
import PackLean.D40.K.FarS016_11
import PackLean.D40.K.FarS016_12
import PackLean.D40.K.FarS016_13
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t046A : List Tok := t046A_0 ++ (t046A_1 ++ (t046A_2 ++ (t046A_3 ++ (t046A_4 ++ (t046A_5 ++ (t046A_6 ++ (t046A_7 ++ (t046A_8 ++ (t046A_9 ++ (t046A_10 ++ (t046A_11 ++ (t046A_12 ++ (t046A_13 ++ (t046A_14 ++ (t046A_15 ++ (t046A_16 ++ (t046A_17 ++ (t046A_18 ++ (t046A_19 ++ (t046A_20 ++ (t046A_21 ++ (t046A_22 ++ (t046A_23 ++ (t046A_24 ++ (t046A_25 ++ (t046A_26 ++ (t046A_27 ++ (t046A_28 ++ (t046A_29 ++ (t046A_30 ++ (t046A_31 ++ (t046A_32 ++ (t046A_33 ++ (t046A_34 ++ (t046A_35 ++ (t046A_36 ++ (t046A_37 ++ (t046A_38 ++ (t046A_39)))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t046B : List Tok := t046B_0 ++ (t046B_1 ++ (t046B_2 ++ (t046B_3 ++ (t046B_4 ++ (t046B_5 ++ (t046B_6 ++ (t046B_7 ++ (t046B_8 ++ (t046B_9 ++ (t046B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 046：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run046 : (nbRun P nb046 0 kN046 t046A).1 = true ∧ (nbRun P nb046 1 kN046 t046B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s046A_0) (wseg_append (wseg_of s046A_1) (wseg_append (wseg_of s046A_2) (wseg_append (wseg_of s046A_3) (wseg_append (wseg_of s046A_4) (wseg_append (wseg_of s046A_5) (wseg_append (wseg_of s046A_6) (wseg_append (wseg_of s046A_7) (wseg_append (wseg_of s046A_8) (wseg_append (wseg_of s046A_9) (wseg_append (wseg_of s046A_10) (wseg_append (wseg_of s046A_11) (wseg_append (wseg_of s046A_12) (wseg_append (wseg_of s046A_13) (wseg_append (wseg_of s046A_14) (wseg_append (wseg_of s046A_15) (wseg_append (wseg_of s046A_16) (wseg_append (wseg_of s046A_17) (wseg_append (wseg_of s046A_18) (wseg_append (wseg_of s046A_19) (wseg_append (wseg_of s046A_20) (wseg_append (wseg_of s046A_21) (wseg_append (wseg_of s046A_22) (wseg_append (wseg_of s046A_23) (wseg_append (wseg_of s046A_24) (wseg_append (wseg_of s046A_25) (wseg_append (wseg_of s046A_26) (wseg_append (wseg_of s046A_27) (wseg_append (wseg_of s046A_28) (wseg_append (wseg_of s046A_29) (wseg_append (wseg_of s046A_30) (wseg_append (wseg_of s046A_31) (wseg_append (wseg_of s046A_32) (wseg_append (wseg_of s046A_33) (wseg_append (wseg_of s046A_34) (wseg_append (wseg_of s046A_35) (wseg_append (wseg_of s046A_36) (wseg_append (wseg_of s046A_37) (wseg_append (wseg_of s046A_38) (wseg_of s046A_39)))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s046B_0) (wseg_append (wseg_of s046B_1) (wseg_append (wseg_of s046B_2) (wseg_append (wseg_of s046B_3) (wseg_append (wseg_of s046B_4) (wseg_append (wseg_of s046B_5) (wseg_append (wseg_of s046B_6) (wseg_append (wseg_of s046B_7) (wseg_append (wseg_of s046B_8) (wseg_append (wseg_of s046B_9) (wseg_of s046B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t047A : List Tok := t047A_0 ++ (t047A_1 ++ (t047A_2 ++ (t047A_3 ++ (t047A_4 ++ (t047A_5 ++ (t047A_6 ++ (t047A_7 ++ (t047A_8 ++ (t047A_9 ++ (t047A_10 ++ (t047A_11 ++ (t047A_12 ++ (t047A_13 ++ (t047A_14 ++ (t047A_15 ++ (t047A_16 ++ (t047A_17 ++ (t047A_18 ++ (t047A_19 ++ (t047A_20 ++ (t047A_21 ++ (t047A_22 ++ (t047A_23 ++ (t047A_24 ++ (t047A_25 ++ (t047A_26 ++ (t047A_27 ++ (t047A_28 ++ (t047A_29 ++ (t047A_30 ++ (t047A_31 ++ (t047A_32 ++ (t047A_33 ++ (t047A_34 ++ (t047A_35 ++ (t047A_36 ++ (t047A_37 ++ (t047A_38))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t047B : List Tok := t047B_0 ++ (t047B_1 ++ (t047B_2 ++ (t047B_3 ++ (t047B_4 ++ (t047B_5 ++ (t047B_6 ++ (t047B_7 ++ (t047B_8 ++ (t047B_9 ++ (t047B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 047：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run047 : (nbRun P nb047 0 kN047 t047A).1 = true ∧ (nbRun P nb047 1 kN047 t047B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s047A_0) (wseg_append (wseg_of s047A_1) (wseg_append (wseg_of s047A_2) (wseg_append (wseg_of s047A_3) (wseg_append (wseg_of s047A_4) (wseg_append (wseg_of s047A_5) (wseg_append (wseg_of s047A_6) (wseg_append (wseg_of s047A_7) (wseg_append (wseg_of s047A_8) (wseg_append (wseg_of s047A_9) (wseg_append (wseg_of s047A_10) (wseg_append (wseg_of s047A_11) (wseg_append (wseg_of s047A_12) (wseg_append (wseg_of s047A_13) (wseg_append (wseg_of s047A_14) (wseg_append (wseg_of s047A_15) (wseg_append (wseg_of s047A_16) (wseg_append (wseg_of s047A_17) (wseg_append (wseg_of s047A_18) (wseg_append (wseg_of s047A_19) (wseg_append (wseg_of s047A_20) (wseg_append (wseg_of s047A_21) (wseg_append (wseg_of s047A_22) (wseg_append (wseg_of s047A_23) (wseg_append (wseg_of s047A_24) (wseg_append (wseg_of s047A_25) (wseg_append (wseg_of s047A_26) (wseg_append (wseg_of s047A_27) (wseg_append (wseg_of s047A_28) (wseg_append (wseg_of s047A_29) (wseg_append (wseg_of s047A_30) (wseg_append (wseg_of s047A_31) (wseg_append (wseg_of s047A_32) (wseg_append (wseg_of s047A_33) (wseg_append (wseg_of s047A_34) (wseg_append (wseg_of s047A_35) (wseg_append (wseg_of s047A_36) (wseg_append (wseg_of s047A_37) (wseg_of s047A_38))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s047B_0) (wseg_append (wseg_of s047B_1) (wseg_append (wseg_of s047B_2) (wseg_append (wseg_of s047B_3) (wseg_append (wseg_of s047B_4) (wseg_append (wseg_of s047B_5) (wseg_append (wseg_of s047B_6) (wseg_append (wseg_of s047B_7) (wseg_append (wseg_of s047B_8) (wseg_append (wseg_of s047B_9) (wseg_of s047B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t048A : List Tok := t048A_0 ++ (t048A_1 ++ (t048A_2 ++ (t048A_3 ++ (t048A_4 ++ (t048A_5 ++ (t048A_6 ++ (t048A_7 ++ (t048A_8 ++ (t048A_9 ++ (t048A_10 ++ (t048A_11 ++ (t048A_12 ++ (t048A_13 ++ (t048A_14 ++ (t048A_15 ++ (t048A_16 ++ (t048A_17 ++ (t048A_18 ++ (t048A_19 ++ (t048A_20 ++ (t048A_21 ++ (t048A_22 ++ (t048A_23 ++ (t048A_24 ++ (t048A_25 ++ (t048A_26 ++ (t048A_27 ++ (t048A_28 ++ (t048A_29 ++ (t048A_30 ++ (t048A_31 ++ (t048A_32 ++ (t048A_33 ++ (t048A_34 ++ (t048A_35 ++ (t048A_36))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t048B : List Tok := t048B_0 ++ (t048B_1 ++ (t048B_2 ++ (t048B_3 ++ (t048B_4 ++ (t048B_5 ++ (t048B_6 ++ (t048B_7 ++ (t048B_8 ++ (t048B_9 ++ (t048B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 048：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run048 : (nbRun P nb048 0 kN048 t048A).1 = true ∧ (nbRun P nb048 1 kN048 t048B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s048A_0) (wseg_append (wseg_of s048A_1) (wseg_append (wseg_of s048A_2) (wseg_append (wseg_of s048A_3) (wseg_append (wseg_of s048A_4) (wseg_append (wseg_of s048A_5) (wseg_append (wseg_of s048A_6) (wseg_append (wseg_of s048A_7) (wseg_append (wseg_of s048A_8) (wseg_append (wseg_of s048A_9) (wseg_append (wseg_of s048A_10) (wseg_append (wseg_of s048A_11) (wseg_append (wseg_of s048A_12) (wseg_append (wseg_of s048A_13) (wseg_append (wseg_of s048A_14) (wseg_append (wseg_of s048A_15) (wseg_append (wseg_of s048A_16) (wseg_append (wseg_of s048A_17) (wseg_append (wseg_of s048A_18) (wseg_append (wseg_of s048A_19) (wseg_append (wseg_of s048A_20) (wseg_append (wseg_of s048A_21) (wseg_append (wseg_of s048A_22) (wseg_append (wseg_of s048A_23) (wseg_append (wseg_of s048A_24) (wseg_append (wseg_of s048A_25) (wseg_append (wseg_of s048A_26) (wseg_append (wseg_of s048A_27) (wseg_append (wseg_of s048A_28) (wseg_append (wseg_of s048A_29) (wseg_append (wseg_of s048A_30) (wseg_append (wseg_of s048A_31) (wseg_append (wseg_of s048A_32) (wseg_append (wseg_of s048A_33) (wseg_append (wseg_of s048A_34) (wseg_append (wseg_of s048A_35) (wseg_of s048A_36))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s048B_0) (wseg_append (wseg_of s048B_1) (wseg_append (wseg_of s048B_2) (wseg_append (wseg_of s048B_3) (wseg_append (wseg_of s048B_4) (wseg_append (wseg_of s048B_5) (wseg_append (wseg_of s048B_6) (wseg_append (wseg_of s048B_7) (wseg_append (wseg_of s048B_8) (wseg_append (wseg_of s048B_9) (wseg_of s048B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049A : List Tok := t049A_0 ++ (t049A_1 ++ (t049A_2 ++ (t049A_3 ++ (t049A_4 ++ (t049A_5 ++ (t049A_6 ++ (t049A_7 ++ (t049A_8 ++ (t049A_9 ++ (t049A_10 ++ (t049A_11 ++ (t049A_12 ++ (t049A_13 ++ (t049A_14 ++ (t049A_15 ++ (t049A_16 ++ (t049A_17 ++ (t049A_18 ++ (t049A_19 ++ (t049A_20 ++ (t049A_21 ++ (t049A_22 ++ (t049A_23 ++ (t049A_24 ++ (t049A_25 ++ (t049A_26 ++ (t049A_27 ++ (t049A_28 ++ (t049A_29 ++ (t049A_30 ++ (t049A_31 ++ (t049A_32 ++ (t049A_33 ++ (t049A_34 ++ (t049A_35 ++ (t049A_36 ++ (t049A_37 ++ (t049A_38))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049B : List Tok := t049B_0 ++ (t049B_1 ++ (t049B_2 ++ (t049B_3 ++ (t049B_4 ++ (t049B_5 ++ (t049B_6 ++ (t049B_7 ++ (t049B_8 ++ (t049B_9 ++ (t049B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 049：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run049 : (nbRun P nb049 0 kN049 t049A).1 = true ∧ (nbRun P nb049 1 kN049 t049B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s049A_0) (wseg_append (wseg_of s049A_1) (wseg_append (wseg_of s049A_2) (wseg_append (wseg_of s049A_3) (wseg_append (wseg_of s049A_4) (wseg_append (wseg_of s049A_5) (wseg_append (wseg_of s049A_6) (wseg_append (wseg_of s049A_7) (wseg_append (wseg_of s049A_8) (wseg_append (wseg_of s049A_9) (wseg_append (wseg_of s049A_10) (wseg_append (wseg_of s049A_11) (wseg_append (wseg_of s049A_12) (wseg_append (wseg_of s049A_13) (wseg_append (wseg_of s049A_14) (wseg_append (wseg_of s049A_15) (wseg_append (wseg_of s049A_16) (wseg_append (wseg_of s049A_17) (wseg_append (wseg_of s049A_18) (wseg_append (wseg_of s049A_19) (wseg_append (wseg_of s049A_20) (wseg_append (wseg_of s049A_21) (wseg_append (wseg_of s049A_22) (wseg_append (wseg_of s049A_23) (wseg_append (wseg_of s049A_24) (wseg_append (wseg_of s049A_25) (wseg_append (wseg_of s049A_26) (wseg_append (wseg_of s049A_27) (wseg_append (wseg_of s049A_28) (wseg_append (wseg_of s049A_29) (wseg_append (wseg_of s049A_30) (wseg_append (wseg_of s049A_31) (wseg_append (wseg_of s049A_32) (wseg_append (wseg_of s049A_33) (wseg_append (wseg_of s049A_34) (wseg_append (wseg_of s049A_35) (wseg_append (wseg_of s049A_36) (wseg_append (wseg_of s049A_37) (wseg_of s049A_38))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s049B_0) (wseg_append (wseg_of s049B_1) (wseg_append (wseg_of s049B_2) (wseg_append (wseg_of s049B_3) (wseg_append (wseg_of s049B_4) (wseg_append (wseg_of s049B_5) (wseg_append (wseg_of s049B_6) (wseg_append (wseg_of s049B_7) (wseg_append (wseg_of s049B_8) (wseg_append (wseg_of s049B_9) (wseg_of s049B_10)))))))))))⟩

end PackLean.D40.Tet
