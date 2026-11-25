-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS039_0
import PackLean.D40.K.FarS039_1
import PackLean.D40.K.FarS039_2
import PackLean.D40.K.FarS039_3
import PackLean.D40.K.FarS039_4
import PackLean.D40.K.FarS039_5
import PackLean.D40.K.FarS039_6
import PackLean.D40.K.FarS039_7
import PackLean.D40.K.FarS039_8
import PackLean.D40.K.FarS039_9
import PackLean.D40.K.FarS039_10
import PackLean.D40.K.FarS039_11
import PackLean.D40.K.FarS039_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t120A : List Tok := t120A_0 ++ (t120A_1 ++ (t120A_2 ++ (t120A_3 ++ (t120A_4 ++ (t120A_5 ++ (t120A_6 ++ (t120A_7 ++ (t120A_8 ++ (t120A_9 ++ (t120A_10 ++ (t120A_11 ++ (t120A_12 ++ (t120A_13 ++ (t120A_14 ++ (t120A_15 ++ (t120A_16 ++ (t120A_17 ++ (t120A_18 ++ (t120A_19 ++ (t120A_20 ++ (t120A_21 ++ (t120A_22 ++ (t120A_23 ++ (t120A_24 ++ (t120A_25 ++ (t120A_26 ++ (t120A_27 ++ (t120A_28 ++ (t120A_29 ++ (t120A_30 ++ (t120A_31 ++ (t120A_32 ++ (t120A_33)))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t120B : List Tok := t120B_0 ++ (t120B_1 ++ (t120B_2 ++ (t120B_3 ++ (t120B_4 ++ (t120B_5 ++ (t120B_6 ++ (t120B_7 ++ (t120B_8 ++ (t120B_9 ++ (t120B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 120：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run120 : (nbRun P nb120 0 kN120 t120A).1 = true ∧ (nbRun P nb120 1 kN120 t120B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s120A_0) (wseg_append (wseg_of s120A_1) (wseg_append (wseg_of s120A_2) (wseg_append (wseg_of s120A_3) (wseg_append (wseg_of s120A_4) (wseg_append (wseg_of s120A_5) (wseg_append (wseg_of s120A_6) (wseg_append (wseg_of s120A_7) (wseg_append (wseg_of s120A_8) (wseg_append (wseg_of s120A_9) (wseg_append (wseg_of s120A_10) (wseg_append (wseg_of s120A_11) (wseg_append (wseg_of s120A_12) (wseg_append (wseg_of s120A_13) (wseg_append (wseg_of s120A_14) (wseg_append (wseg_of s120A_15) (wseg_append (wseg_of s120A_16) (wseg_append (wseg_of s120A_17) (wseg_append (wseg_of s120A_18) (wseg_append (wseg_of s120A_19) (wseg_append (wseg_of s120A_20) (wseg_append (wseg_of s120A_21) (wseg_append (wseg_of s120A_22) (wseg_append (wseg_of s120A_23) (wseg_append (wseg_of s120A_24) (wseg_append (wseg_of s120A_25) (wseg_append (wseg_of s120A_26) (wseg_append (wseg_of s120A_27) (wseg_append (wseg_of s120A_28) (wseg_append (wseg_of s120A_29) (wseg_append (wseg_of s120A_30) (wseg_append (wseg_of s120A_31) (wseg_append (wseg_of s120A_32) (wseg_of s120A_33)))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s120B_0) (wseg_append (wseg_of s120B_1) (wseg_append (wseg_of s120B_2) (wseg_append (wseg_of s120B_3) (wseg_append (wseg_of s120B_4) (wseg_append (wseg_of s120B_5) (wseg_append (wseg_of s120B_6) (wseg_append (wseg_of s120B_7) (wseg_append (wseg_of s120B_8) (wseg_append (wseg_of s120B_9) (wseg_of s120B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t121A : List Tok := t121A_0 ++ (t121A_1 ++ (t121A_2 ++ (t121A_3 ++ (t121A_4 ++ (t121A_5 ++ (t121A_6 ++ (t121A_7 ++ (t121A_8 ++ (t121A_9 ++ (t121A_10 ++ (t121A_11 ++ (t121A_12 ++ (t121A_13 ++ (t121A_14 ++ (t121A_15 ++ (t121A_16 ++ (t121A_17 ++ (t121A_18 ++ (t121A_19 ++ (t121A_20 ++ (t121A_21 ++ (t121A_22 ++ (t121A_23 ++ (t121A_24 ++ (t121A_25 ++ (t121A_26 ++ (t121A_27 ++ (t121A_28 ++ (t121A_29 ++ (t121A_30 ++ (t121A_31 ++ (t121A_32 ++ (t121A_33 ++ (t121A_34 ++ (t121A_35 ++ (t121A_36))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t121B : List Tok := t121B_0 ++ (t121B_1 ++ (t121B_2 ++ (t121B_3 ++ (t121B_4 ++ (t121B_5 ++ (t121B_6 ++ (t121B_7 ++ (t121B_8 ++ (t121B_9 ++ (t121B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 121：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run121 : (nbRun P nb121 0 kN121 t121A).1 = true ∧ (nbRun P nb121 1 kN121 t121B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s121A_0) (wseg_append (wseg_of s121A_1) (wseg_append (wseg_of s121A_2) (wseg_append (wseg_of s121A_3) (wseg_append (wseg_of s121A_4) (wseg_append (wseg_of s121A_5) (wseg_append (wseg_of s121A_6) (wseg_append (wseg_of s121A_7) (wseg_append (wseg_of s121A_8) (wseg_append (wseg_of s121A_9) (wseg_append (wseg_of s121A_10) (wseg_append (wseg_of s121A_11) (wseg_append (wseg_of s121A_12) (wseg_append (wseg_of s121A_13) (wseg_append (wseg_of s121A_14) (wseg_append (wseg_of s121A_15) (wseg_append (wseg_of s121A_16) (wseg_append (wseg_of s121A_17) (wseg_append (wseg_of s121A_18) (wseg_append (wseg_of s121A_19) (wseg_append (wseg_of s121A_20) (wseg_append (wseg_of s121A_21) (wseg_append (wseg_of s121A_22) (wseg_append (wseg_of s121A_23) (wseg_append (wseg_of s121A_24) (wseg_append (wseg_of s121A_25) (wseg_append (wseg_of s121A_26) (wseg_append (wseg_of s121A_27) (wseg_append (wseg_of s121A_28) (wseg_append (wseg_of s121A_29) (wseg_append (wseg_of s121A_30) (wseg_append (wseg_of s121A_31) (wseg_append (wseg_of s121A_32) (wseg_append (wseg_of s121A_33) (wseg_append (wseg_of s121A_34) (wseg_append (wseg_of s121A_35) (wseg_of s121A_36))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s121B_0) (wseg_append (wseg_of s121B_1) (wseg_append (wseg_of s121B_2) (wseg_append (wseg_of s121B_3) (wseg_append (wseg_of s121B_4) (wseg_append (wseg_of s121B_5) (wseg_append (wseg_of s121B_6) (wseg_append (wseg_of s121B_7) (wseg_append (wseg_of s121B_8) (wseg_append (wseg_of s121B_9) (wseg_of s121B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t122A : List Tok := t122A_0 ++ (t122A_1 ++ (t122A_2 ++ (t122A_3 ++ (t122A_4 ++ (t122A_5 ++ (t122A_6 ++ (t122A_7 ++ (t122A_8 ++ (t122A_9 ++ (t122A_10 ++ (t122A_11 ++ (t122A_12 ++ (t122A_13 ++ (t122A_14 ++ (t122A_15 ++ (t122A_16 ++ (t122A_17 ++ (t122A_18 ++ (t122A_19 ++ (t122A_20 ++ (t122A_21 ++ (t122A_22 ++ (t122A_23 ++ (t122A_24 ++ (t122A_25 ++ (t122A_26 ++ (t122A_27 ++ (t122A_28 ++ (t122A_29 ++ (t122A_30))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t122B : List Tok := t122B_0 ++ (t122B_1 ++ (t122B_2 ++ (t122B_3 ++ (t122B_4 ++ (t122B_5 ++ (t122B_6 ++ (t122B_7 ++ (t122B_8 ++ (t122B_9 ++ (t122B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 122：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run122 : (nbRun P nb122 0 kN122 t122A).1 = true ∧ (nbRun P nb122 1 kN122 t122B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s122A_0) (wseg_append (wseg_of s122A_1) (wseg_append (wseg_of s122A_2) (wseg_append (wseg_of s122A_3) (wseg_append (wseg_of s122A_4) (wseg_append (wseg_of s122A_5) (wseg_append (wseg_of s122A_6) (wseg_append (wseg_of s122A_7) (wseg_append (wseg_of s122A_8) (wseg_append (wseg_of s122A_9) (wseg_append (wseg_of s122A_10) (wseg_append (wseg_of s122A_11) (wseg_append (wseg_of s122A_12) (wseg_append (wseg_of s122A_13) (wseg_append (wseg_of s122A_14) (wseg_append (wseg_of s122A_15) (wseg_append (wseg_of s122A_16) (wseg_append (wseg_of s122A_17) (wseg_append (wseg_of s122A_18) (wseg_append (wseg_of s122A_19) (wseg_append (wseg_of s122A_20) (wseg_append (wseg_of s122A_21) (wseg_append (wseg_of s122A_22) (wseg_append (wseg_of s122A_23) (wseg_append (wseg_of s122A_24) (wseg_append (wseg_of s122A_25) (wseg_append (wseg_of s122A_26) (wseg_append (wseg_of s122A_27) (wseg_append (wseg_of s122A_28) (wseg_append (wseg_of s122A_29) (wseg_of s122A_30))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s122B_0) (wseg_append (wseg_of s122B_1) (wseg_append (wseg_of s122B_2) (wseg_append (wseg_of s122B_3) (wseg_append (wseg_of s122B_4) (wseg_append (wseg_of s122B_5) (wseg_append (wseg_of s122B_6) (wseg_append (wseg_of s122B_7) (wseg_append (wseg_of s122B_8) (wseg_append (wseg_of s122B_9) (wseg_of s122B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t123A : List Tok := t123A_0 ++ (t123A_1 ++ (t123A_2 ++ (t123A_3 ++ (t123A_4 ++ (t123A_5 ++ (t123A_6 ++ (t123A_7 ++ (t123A_8 ++ (t123A_9 ++ (t123A_10 ++ (t123A_11 ++ (t123A_12 ++ (t123A_13 ++ (t123A_14 ++ (t123A_15 ++ (t123A_16 ++ (t123A_17 ++ (t123A_18 ++ (t123A_19 ++ (t123A_20 ++ (t123A_21 ++ (t123A_22 ++ (t123A_23 ++ (t123A_24 ++ (t123A_25 ++ (t123A_26 ++ (t123A_27 ++ (t123A_28 ++ (t123A_29 ++ (t123A_30 ++ (t123A_31 ++ (t123A_32 ++ (t123A_33 ++ (t123A_34 ++ (t123A_35 ++ (t123A_36 ++ (t123A_37 ++ (t123A_38 ++ (t123A_39 ++ (t123A_40 ++ (t123A_41 ++ (t123A_42 ++ (t123A_43 ++ (t123A_44 ++ (t123A_45 ++ (t123A_46 ++ (t123A_47 ++ (t123A_48 ++ (t123A_49)))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t123B : List Tok := t123B_0 ++ (t123B_1 ++ (t123B_2 ++ (t123B_3 ++ (t123B_4 ++ (t123B_5 ++ (t123B_6 ++ (t123B_7 ++ (t123B_8 ++ (t123B_9)))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 123：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run123 : (nbRun P nb123 0 kN123 t123A).1 = true ∧ (nbRun P nb123 1 kN123 t123B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s123A_0) (wseg_append (wseg_of s123A_1) (wseg_append (wseg_of s123A_2) (wseg_append (wseg_of s123A_3) (wseg_append (wseg_of s123A_4) (wseg_append (wseg_of s123A_5) (wseg_append (wseg_of s123A_6) (wseg_append (wseg_of s123A_7) (wseg_append (wseg_of s123A_8) (wseg_append (wseg_of s123A_9) (wseg_append (wseg_of s123A_10) (wseg_append (wseg_of s123A_11) (wseg_append (wseg_of s123A_12) (wseg_append (wseg_of s123A_13) (wseg_append (wseg_of s123A_14) (wseg_append (wseg_of s123A_15) (wseg_append (wseg_of s123A_16) (wseg_append (wseg_of s123A_17) (wseg_append (wseg_of s123A_18) (wseg_append (wseg_of s123A_19) (wseg_append (wseg_of s123A_20) (wseg_append (wseg_of s123A_21) (wseg_append (wseg_of s123A_22) (wseg_append (wseg_of s123A_23) (wseg_append (wseg_of s123A_24) (wseg_append (wseg_of s123A_25) (wseg_append (wseg_of s123A_26) (wseg_append (wseg_of s123A_27) (wseg_append (wseg_of s123A_28) (wseg_append (wseg_of s123A_29) (wseg_append (wseg_of s123A_30) (wseg_append (wseg_of s123A_31) (wseg_append (wseg_of s123A_32) (wseg_append (wseg_of s123A_33) (wseg_append (wseg_of s123A_34) (wseg_append (wseg_of s123A_35) (wseg_append (wseg_of s123A_36) (wseg_append (wseg_of s123A_37) (wseg_append (wseg_of s123A_38) (wseg_append (wseg_of s123A_39) (wseg_append (wseg_of s123A_40) (wseg_append (wseg_of s123A_41) (wseg_append (wseg_of s123A_42) (wseg_append (wseg_of s123A_43) (wseg_append (wseg_of s123A_44) (wseg_append (wseg_of s123A_45) (wseg_append (wseg_of s123A_46) (wseg_append (wseg_of s123A_47) (wseg_append (wseg_of s123A_48) (wseg_of s123A_49)))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s123B_0) (wseg_append (wseg_of s123B_1) (wseg_append (wseg_of s123B_2) (wseg_append (wseg_of s123B_3) (wseg_append (wseg_of s123B_4) (wseg_append (wseg_of s123B_5) (wseg_append (wseg_of s123B_6) (wseg_append (wseg_of s123B_7) (wseg_append (wseg_of s123B_8) (wseg_of s123B_9))))))))))⟩

end PackLean.D40.Tet
