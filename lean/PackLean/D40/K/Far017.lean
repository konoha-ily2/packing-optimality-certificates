-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS017_0
import PackLean.D40.K.FarS017_1
import PackLean.D40.K.FarS017_2
import PackLean.D40.K.FarS017_3
import PackLean.D40.K.FarS017_4
import PackLean.D40.K.FarS017_5
import PackLean.D40.K.FarS017_6
import PackLean.D40.K.FarS017_7
import PackLean.D40.K.FarS017_8
import PackLean.D40.K.FarS017_9
import PackLean.D40.K.FarS017_10
import PackLean.D40.K.FarS017_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t050A : List Tok := t050A_0 ++ (t050A_1 ++ (t050A_2 ++ (t050A_3 ++ (t050A_4 ++ (t050A_5 ++ (t050A_6 ++ (t050A_7 ++ (t050A_8 ++ (t050A_9 ++ (t050A_10 ++ (t050A_11 ++ (t050A_12 ++ (t050A_13 ++ (t050A_14 ++ (t050A_15 ++ (t050A_16 ++ (t050A_17 ++ (t050A_18 ++ (t050A_19 ++ (t050A_20 ++ (t050A_21 ++ (t050A_22 ++ (t050A_23 ++ (t050A_24 ++ (t050A_25 ++ (t050A_26 ++ (t050A_27 ++ (t050A_28 ++ (t050A_29 ++ (t050A_30 ++ (t050A_31 ++ (t050A_32 ++ (t050A_33)))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t050B : List Tok := t050B_0 ++ (t050B_1 ++ (t050B_2 ++ (t050B_3 ++ (t050B_4 ++ (t050B_5 ++ (t050B_6 ++ (t050B_7 ++ (t050B_8 ++ (t050B_9 ++ (t050B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 050：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run050 : (nbRun P nb050 0 kN050 t050A).1 = true ∧ (nbRun P nb050 1 kN050 t050B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s050A_0) (wseg_append (wseg_of s050A_1) (wseg_append (wseg_of s050A_2) (wseg_append (wseg_of s050A_3) (wseg_append (wseg_of s050A_4) (wseg_append (wseg_of s050A_5) (wseg_append (wseg_of s050A_6) (wseg_append (wseg_of s050A_7) (wseg_append (wseg_of s050A_8) (wseg_append (wseg_of s050A_9) (wseg_append (wseg_of s050A_10) (wseg_append (wseg_of s050A_11) (wseg_append (wseg_of s050A_12) (wseg_append (wseg_of s050A_13) (wseg_append (wseg_of s050A_14) (wseg_append (wseg_of s050A_15) (wseg_append (wseg_of s050A_16) (wseg_append (wseg_of s050A_17) (wseg_append (wseg_of s050A_18) (wseg_append (wseg_of s050A_19) (wseg_append (wseg_of s050A_20) (wseg_append (wseg_of s050A_21) (wseg_append (wseg_of s050A_22) (wseg_append (wseg_of s050A_23) (wseg_append (wseg_of s050A_24) (wseg_append (wseg_of s050A_25) (wseg_append (wseg_of s050A_26) (wseg_append (wseg_of s050A_27) (wseg_append (wseg_of s050A_28) (wseg_append (wseg_of s050A_29) (wseg_append (wseg_of s050A_30) (wseg_append (wseg_of s050A_31) (wseg_append (wseg_of s050A_32) (wseg_of s050A_33)))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s050B_0) (wseg_append (wseg_of s050B_1) (wseg_append (wseg_of s050B_2) (wseg_append (wseg_of s050B_3) (wseg_append (wseg_of s050B_4) (wseg_append (wseg_of s050B_5) (wseg_append (wseg_of s050B_6) (wseg_append (wseg_of s050B_7) (wseg_append (wseg_of s050B_8) (wseg_append (wseg_of s050B_9) (wseg_of s050B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051A : List Tok := t051A_0 ++ (t051A_1 ++ (t051A_2 ++ (t051A_3 ++ (t051A_4 ++ (t051A_5 ++ (t051A_6 ++ (t051A_7 ++ (t051A_8 ++ (t051A_9 ++ (t051A_10 ++ (t051A_11 ++ (t051A_12 ++ (t051A_13 ++ (t051A_14 ++ (t051A_15 ++ (t051A_16 ++ (t051A_17 ++ (t051A_18 ++ (t051A_19 ++ (t051A_20 ++ (t051A_21 ++ (t051A_22 ++ (t051A_23 ++ (t051A_24 ++ (t051A_25 ++ (t051A_26 ++ (t051A_27 ++ (t051A_28 ++ (t051A_29 ++ (t051A_30 ++ (t051A_31 ++ (t051A_32 ++ (t051A_33 ++ (t051A_34 ++ (t051A_35)))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t051B : List Tok := t051B_0 ++ (t051B_1 ++ (t051B_2 ++ (t051B_3 ++ (t051B_4 ++ (t051B_5 ++ (t051B_6 ++ (t051B_7 ++ (t051B_8 ++ (t051B_9 ++ (t051B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 051：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run051 : (nbRun P nb051 0 kN051 t051A).1 = true ∧ (nbRun P nb051 1 kN051 t051B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s051A_0) (wseg_append (wseg_of s051A_1) (wseg_append (wseg_of s051A_2) (wseg_append (wseg_of s051A_3) (wseg_append (wseg_of s051A_4) (wseg_append (wseg_of s051A_5) (wseg_append (wseg_of s051A_6) (wseg_append (wseg_of s051A_7) (wseg_append (wseg_of s051A_8) (wseg_append (wseg_of s051A_9) (wseg_append (wseg_of s051A_10) (wseg_append (wseg_of s051A_11) (wseg_append (wseg_of s051A_12) (wseg_append (wseg_of s051A_13) (wseg_append (wseg_of s051A_14) (wseg_append (wseg_of s051A_15) (wseg_append (wseg_of s051A_16) (wseg_append (wseg_of s051A_17) (wseg_append (wseg_of s051A_18) (wseg_append (wseg_of s051A_19) (wseg_append (wseg_of s051A_20) (wseg_append (wseg_of s051A_21) (wseg_append (wseg_of s051A_22) (wseg_append (wseg_of s051A_23) (wseg_append (wseg_of s051A_24) (wseg_append (wseg_of s051A_25) (wseg_append (wseg_of s051A_26) (wseg_append (wseg_of s051A_27) (wseg_append (wseg_of s051A_28) (wseg_append (wseg_of s051A_29) (wseg_append (wseg_of s051A_30) (wseg_append (wseg_of s051A_31) (wseg_append (wseg_of s051A_32) (wseg_append (wseg_of s051A_33) (wseg_append (wseg_of s051A_34) (wseg_of s051A_35)))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s051B_0) (wseg_append (wseg_of s051B_1) (wseg_append (wseg_of s051B_2) (wseg_append (wseg_of s051B_3) (wseg_append (wseg_of s051B_4) (wseg_append (wseg_of s051B_5) (wseg_append (wseg_of s051B_6) (wseg_append (wseg_of s051B_7) (wseg_append (wseg_of s051B_8) (wseg_append (wseg_of s051B_9) (wseg_of s051B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052A : List Tok := t052A_0 ++ (t052A_1 ++ (t052A_2 ++ (t052A_3 ++ (t052A_4 ++ (t052A_5 ++ (t052A_6 ++ (t052A_7 ++ (t052A_8 ++ (t052A_9 ++ (t052A_10 ++ (t052A_11 ++ (t052A_12 ++ (t052A_13 ++ (t052A_14 ++ (t052A_15 ++ (t052A_16 ++ (t052A_17 ++ (t052A_18 ++ (t052A_19 ++ (t052A_20 ++ (t052A_21 ++ (t052A_22 ++ (t052A_23 ++ (t052A_24 ++ (t052A_25 ++ (t052A_26 ++ (t052A_27 ++ (t052A_28 ++ (t052A_29 ++ (t052A_30 ++ (t052A_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t052B : List Tok := t052B_0 ++ (t052B_1 ++ (t052B_2 ++ (t052B_3 ++ (t052B_4 ++ (t052B_5 ++ (t052B_6 ++ (t052B_7 ++ (t052B_8 ++ (t052B_9 ++ (t052B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 052：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run052 : (nbRun P nb052 0 kN052 t052A).1 = true ∧ (nbRun P nb052 1 kN052 t052B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s052A_0) (wseg_append (wseg_of s052A_1) (wseg_append (wseg_of s052A_2) (wseg_append (wseg_of s052A_3) (wseg_append (wseg_of s052A_4) (wseg_append (wseg_of s052A_5) (wseg_append (wseg_of s052A_6) (wseg_append (wseg_of s052A_7) (wseg_append (wseg_of s052A_8) (wseg_append (wseg_of s052A_9) (wseg_append (wseg_of s052A_10) (wseg_append (wseg_of s052A_11) (wseg_append (wseg_of s052A_12) (wseg_append (wseg_of s052A_13) (wseg_append (wseg_of s052A_14) (wseg_append (wseg_of s052A_15) (wseg_append (wseg_of s052A_16) (wseg_append (wseg_of s052A_17) (wseg_append (wseg_of s052A_18) (wseg_append (wseg_of s052A_19) (wseg_append (wseg_of s052A_20) (wseg_append (wseg_of s052A_21) (wseg_append (wseg_of s052A_22) (wseg_append (wseg_of s052A_23) (wseg_append (wseg_of s052A_24) (wseg_append (wseg_of s052A_25) (wseg_append (wseg_of s052A_26) (wseg_append (wseg_of s052A_27) (wseg_append (wseg_of s052A_28) (wseg_append (wseg_of s052A_29) (wseg_append (wseg_of s052A_30) (wseg_of s052A_31)))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s052B_0) (wseg_append (wseg_of s052B_1) (wseg_append (wseg_of s052B_2) (wseg_append (wseg_of s052B_3) (wseg_append (wseg_of s052B_4) (wseg_append (wseg_of s052B_5) (wseg_append (wseg_of s052B_6) (wseg_append (wseg_of s052B_7) (wseg_append (wseg_of s052B_8) (wseg_append (wseg_of s052B_9) (wseg_of s052B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t053A : List Tok := t053A_0 ++ (t053A_1 ++ (t053A_2 ++ (t053A_3 ++ (t053A_4 ++ (t053A_5 ++ (t053A_6 ++ (t053A_7 ++ (t053A_8 ++ (t053A_9 ++ (t053A_10 ++ (t053A_11 ++ (t053A_12 ++ (t053A_13 ++ (t053A_14 ++ (t053A_15 ++ (t053A_16 ++ (t053A_17 ++ (t053A_18 ++ (t053A_19 ++ (t053A_20 ++ (t053A_21 ++ (t053A_22 ++ (t053A_23 ++ (t053A_24 ++ (t053A_25 ++ (t053A_26 ++ (t053A_27 ++ (t053A_28 ++ (t053A_29 ++ (t053A_30 ++ (t053A_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t053B : List Tok := t053B_0 ++ (t053B_1 ++ (t053B_2 ++ (t053B_3 ++ (t053B_4 ++ (t053B_5 ++ (t053B_6 ++ (t053B_7 ++ (t053B_8 ++ (t053B_9 ++ (t053B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 053：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run053 : (nbRun P nb053 0 kN053 t053A).1 = true ∧ (nbRun P nb053 1 kN053 t053B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s053A_0) (wseg_append (wseg_of s053A_1) (wseg_append (wseg_of s053A_2) (wseg_append (wseg_of s053A_3) (wseg_append (wseg_of s053A_4) (wseg_append (wseg_of s053A_5) (wseg_append (wseg_of s053A_6) (wseg_append (wseg_of s053A_7) (wseg_append (wseg_of s053A_8) (wseg_append (wseg_of s053A_9) (wseg_append (wseg_of s053A_10) (wseg_append (wseg_of s053A_11) (wseg_append (wseg_of s053A_12) (wseg_append (wseg_of s053A_13) (wseg_append (wseg_of s053A_14) (wseg_append (wseg_of s053A_15) (wseg_append (wseg_of s053A_16) (wseg_append (wseg_of s053A_17) (wseg_append (wseg_of s053A_18) (wseg_append (wseg_of s053A_19) (wseg_append (wseg_of s053A_20) (wseg_append (wseg_of s053A_21) (wseg_append (wseg_of s053A_22) (wseg_append (wseg_of s053A_23) (wseg_append (wseg_of s053A_24) (wseg_append (wseg_of s053A_25) (wseg_append (wseg_of s053A_26) (wseg_append (wseg_of s053A_27) (wseg_append (wseg_of s053A_28) (wseg_append (wseg_of s053A_29) (wseg_append (wseg_of s053A_30) (wseg_of s053A_31)))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s053B_0) (wseg_append (wseg_of s053B_1) (wseg_append (wseg_of s053B_2) (wseg_append (wseg_of s053B_3) (wseg_append (wseg_of s053B_4) (wseg_append (wseg_of s053B_5) (wseg_append (wseg_of s053B_6) (wseg_append (wseg_of s053B_7) (wseg_append (wseg_of s053B_8) (wseg_append (wseg_of s053B_9) (wseg_of s053B_10)))))))))))⟩

end PackLean.D40.Tet
