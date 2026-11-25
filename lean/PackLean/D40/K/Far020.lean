-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS020_0
import PackLean.D40.K.FarS020_1
import PackLean.D40.K.FarS020_2
import PackLean.D40.K.FarS020_3
import PackLean.D40.K.FarS020_4
import PackLean.D40.K.FarS020_5
import PackLean.D40.K.FarS020_6
import PackLean.D40.K.FarS020_7
import PackLean.D40.K.FarS020_8
import PackLean.D40.K.FarS020_9
import PackLean.D40.K.FarS020_10
import PackLean.D40.K.FarS020_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t062A : List Tok := t062A_0 ++ (t062A_1 ++ (t062A_2 ++ (t062A_3 ++ (t062A_4 ++ (t062A_5 ++ (t062A_6 ++ (t062A_7 ++ (t062A_8 ++ (t062A_9 ++ (t062A_10 ++ (t062A_11 ++ (t062A_12 ++ (t062A_13 ++ (t062A_14 ++ (t062A_15 ++ (t062A_16 ++ (t062A_17 ++ (t062A_18 ++ (t062A_19 ++ (t062A_20 ++ (t062A_21 ++ (t062A_22 ++ (t062A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t062B : List Tok := t062B_0 ++ (t062B_1 ++ (t062B_2 ++ (t062B_3 ++ (t062B_4 ++ (t062B_5 ++ (t062B_6 ++ (t062B_7 ++ (t062B_8 ++ (t062B_9 ++ (t062B_10 ++ (t062B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 062：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run062 : (nbRun P nb062 0 kN062 t062A).1 = true ∧ (nbRun P nb062 1 kN062 t062B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s062A_0) (wseg_append (wseg_of s062A_1) (wseg_append (wseg_of s062A_2) (wseg_append (wseg_of s062A_3) (wseg_append (wseg_of s062A_4) (wseg_append (wseg_of s062A_5) (wseg_append (wseg_of s062A_6) (wseg_append (wseg_of s062A_7) (wseg_append (wseg_of s062A_8) (wseg_append (wseg_of s062A_9) (wseg_append (wseg_of s062A_10) (wseg_append (wseg_of s062A_11) (wseg_append (wseg_of s062A_12) (wseg_append (wseg_of s062A_13) (wseg_append (wseg_of s062A_14) (wseg_append (wseg_of s062A_15) (wseg_append (wseg_of s062A_16) (wseg_append (wseg_of s062A_17) (wseg_append (wseg_of s062A_18) (wseg_append (wseg_of s062A_19) (wseg_append (wseg_of s062A_20) (wseg_append (wseg_of s062A_21) (wseg_append (wseg_of s062A_22) (wseg_of s062A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s062B_0) (wseg_append (wseg_of s062B_1) (wseg_append (wseg_of s062B_2) (wseg_append (wseg_of s062B_3) (wseg_append (wseg_of s062B_4) (wseg_append (wseg_of s062B_5) (wseg_append (wseg_of s062B_6) (wseg_append (wseg_of s062B_7) (wseg_append (wseg_of s062B_8) (wseg_append (wseg_of s062B_9) (wseg_append (wseg_of s062B_10) (wseg_of s062B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t063A : List Tok := t063A_0 ++ (t063A_1 ++ (t063A_2 ++ (t063A_3 ++ (t063A_4 ++ (t063A_5 ++ (t063A_6 ++ (t063A_7 ++ (t063A_8 ++ (t063A_9 ++ (t063A_10 ++ (t063A_11 ++ (t063A_12 ++ (t063A_13 ++ (t063A_14 ++ (t063A_15 ++ (t063A_16 ++ (t063A_17 ++ (t063A_18 ++ (t063A_19 ++ (t063A_20 ++ (t063A_21 ++ (t063A_22 ++ (t063A_23 ++ (t063A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t063B : List Tok := t063B_0 ++ (t063B_1 ++ (t063B_2 ++ (t063B_3 ++ (t063B_4 ++ (t063B_5 ++ (t063B_6 ++ (t063B_7 ++ (t063B_8 ++ (t063B_9 ++ (t063B_10 ++ (t063B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 063：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run063 : (nbRun P nb063 0 kN063 t063A).1 = true ∧ (nbRun P nb063 1 kN063 t063B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s063A_0) (wseg_append (wseg_of s063A_1) (wseg_append (wseg_of s063A_2) (wseg_append (wseg_of s063A_3) (wseg_append (wseg_of s063A_4) (wseg_append (wseg_of s063A_5) (wseg_append (wseg_of s063A_6) (wseg_append (wseg_of s063A_7) (wseg_append (wseg_of s063A_8) (wseg_append (wseg_of s063A_9) (wseg_append (wseg_of s063A_10) (wseg_append (wseg_of s063A_11) (wseg_append (wseg_of s063A_12) (wseg_append (wseg_of s063A_13) (wseg_append (wseg_of s063A_14) (wseg_append (wseg_of s063A_15) (wseg_append (wseg_of s063A_16) (wseg_append (wseg_of s063A_17) (wseg_append (wseg_of s063A_18) (wseg_append (wseg_of s063A_19) (wseg_append (wseg_of s063A_20) (wseg_append (wseg_of s063A_21) (wseg_append (wseg_of s063A_22) (wseg_append (wseg_of s063A_23) (wseg_of s063A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s063B_0) (wseg_append (wseg_of s063B_1) (wseg_append (wseg_of s063B_2) (wseg_append (wseg_of s063B_3) (wseg_append (wseg_of s063B_4) (wseg_append (wseg_of s063B_5) (wseg_append (wseg_of s063B_6) (wseg_append (wseg_of s063B_7) (wseg_append (wseg_of s063B_8) (wseg_append (wseg_of s063B_9) (wseg_append (wseg_of s063B_10) (wseg_of s063B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t064A : List Tok := t064A_0 ++ (t064A_1 ++ (t064A_2 ++ (t064A_3 ++ (t064A_4 ++ (t064A_5 ++ (t064A_6 ++ (t064A_7 ++ (t064A_8 ++ (t064A_9 ++ (t064A_10 ++ (t064A_11 ++ (t064A_12 ++ (t064A_13 ++ (t064A_14 ++ (t064A_15 ++ (t064A_16 ++ (t064A_17 ++ (t064A_18 ++ (t064A_19 ++ (t064A_20 ++ (t064A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t064B : List Tok := t064B_0 ++ (t064B_1 ++ (t064B_2 ++ (t064B_3 ++ (t064B_4 ++ (t064B_5 ++ (t064B_6 ++ (t064B_7 ++ (t064B_8 ++ (t064B_9 ++ (t064B_10 ++ (t064B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 064：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run064 : (nbRun P nb064 0 kN064 t064A).1 = true ∧ (nbRun P nb064 1 kN064 t064B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s064A_0) (wseg_append (wseg_of s064A_1) (wseg_append (wseg_of s064A_2) (wseg_append (wseg_of s064A_3) (wseg_append (wseg_of s064A_4) (wseg_append (wseg_of s064A_5) (wseg_append (wseg_of s064A_6) (wseg_append (wseg_of s064A_7) (wseg_append (wseg_of s064A_8) (wseg_append (wseg_of s064A_9) (wseg_append (wseg_of s064A_10) (wseg_append (wseg_of s064A_11) (wseg_append (wseg_of s064A_12) (wseg_append (wseg_of s064A_13) (wseg_append (wseg_of s064A_14) (wseg_append (wseg_of s064A_15) (wseg_append (wseg_of s064A_16) (wseg_append (wseg_of s064A_17) (wseg_append (wseg_of s064A_18) (wseg_append (wseg_of s064A_19) (wseg_append (wseg_of s064A_20) (wseg_of s064A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s064B_0) (wseg_append (wseg_of s064B_1) (wseg_append (wseg_of s064B_2) (wseg_append (wseg_of s064B_3) (wseg_append (wseg_of s064B_4) (wseg_append (wseg_of s064B_5) (wseg_append (wseg_of s064B_6) (wseg_append (wseg_of s064B_7) (wseg_append (wseg_of s064B_8) (wseg_append (wseg_of s064B_9) (wseg_append (wseg_of s064B_10) (wseg_of s064B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065A : List Tok := t065A_0 ++ (t065A_1 ++ (t065A_2 ++ (t065A_3 ++ (t065A_4 ++ (t065A_5 ++ (t065A_6 ++ (t065A_7 ++ (t065A_8 ++ (t065A_9 ++ (t065A_10 ++ (t065A_11 ++ (t065A_12 ++ (t065A_13 ++ (t065A_14 ++ (t065A_15 ++ (t065A_16 ++ (t065A_17 ++ (t065A_18 ++ (t065A_19 ++ (t065A_20 ++ (t065A_21 ++ (t065A_22 ++ (t065A_23 ++ (t065A_24 ++ (t065A_25 ++ (t065A_26 ++ (t065A_27 ++ (t065A_28 ++ (t065A_29 ++ (t065A_30 ++ (t065A_31 ++ (t065A_32 ++ (t065A_33 ++ (t065A_34 ++ (t065A_35 ++ (t065A_36 ++ (t065A_37 ++ (t065A_38 ++ (t065A_39 ++ (t065A_40 ++ (t065A_41 ++ (t065A_42 ++ (t065A_43 ++ (t065A_44 ++ (t065A_45 ++ (t065A_46 ++ (t065A_47 ++ (t065A_48 ++ (t065A_49 ++ (t065A_50))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t065B : List Tok := t065B_0 ++ (t065B_1 ++ (t065B_2 ++ (t065B_3 ++ (t065B_4 ++ (t065B_5 ++ (t065B_6 ++ (t065B_7 ++ (t065B_8 ++ (t065B_9 ++ (t065B_10 ++ (t065B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 065：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run065 : (nbRun P nb065 0 kN065 t065A).1 = true ∧ (nbRun P nb065 1 kN065 t065B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s065A_0) (wseg_append (wseg_of s065A_1) (wseg_append (wseg_of s065A_2) (wseg_append (wseg_of s065A_3) (wseg_append (wseg_of s065A_4) (wseg_append (wseg_of s065A_5) (wseg_append (wseg_of s065A_6) (wseg_append (wseg_of s065A_7) (wseg_append (wseg_of s065A_8) (wseg_append (wseg_of s065A_9) (wseg_append (wseg_of s065A_10) (wseg_append (wseg_of s065A_11) (wseg_append (wseg_of s065A_12) (wseg_append (wseg_of s065A_13) (wseg_append (wseg_of s065A_14) (wseg_append (wseg_of s065A_15) (wseg_append (wseg_of s065A_16) (wseg_append (wseg_of s065A_17) (wseg_append (wseg_of s065A_18) (wseg_append (wseg_of s065A_19) (wseg_append (wseg_of s065A_20) (wseg_append (wseg_of s065A_21) (wseg_append (wseg_of s065A_22) (wseg_append (wseg_of s065A_23) (wseg_append (wseg_of s065A_24) (wseg_append (wseg_of s065A_25) (wseg_append (wseg_of s065A_26) (wseg_append (wseg_of s065A_27) (wseg_append (wseg_of s065A_28) (wseg_append (wseg_of s065A_29) (wseg_append (wseg_of s065A_30) (wseg_append (wseg_of s065A_31) (wseg_append (wseg_of s065A_32) (wseg_append (wseg_of s065A_33) (wseg_append (wseg_of s065A_34) (wseg_append (wseg_of s065A_35) (wseg_append (wseg_of s065A_36) (wseg_append (wseg_of s065A_37) (wseg_append (wseg_of s065A_38) (wseg_append (wseg_of s065A_39) (wseg_append (wseg_of s065A_40) (wseg_append (wseg_of s065A_41) (wseg_append (wseg_of s065A_42) (wseg_append (wseg_of s065A_43) (wseg_append (wseg_of s065A_44) (wseg_append (wseg_of s065A_45) (wseg_append (wseg_of s065A_46) (wseg_append (wseg_of s065A_47) (wseg_append (wseg_of s065A_48) (wseg_append (wseg_of s065A_49) (wseg_of s065A_50))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s065B_0) (wseg_append (wseg_of s065B_1) (wseg_append (wseg_of s065B_2) (wseg_append (wseg_of s065B_3) (wseg_append (wseg_of s065B_4) (wseg_append (wseg_of s065B_5) (wseg_append (wseg_of s065B_6) (wseg_append (wseg_of s065B_7) (wseg_append (wseg_of s065B_8) (wseg_append (wseg_of s065B_9) (wseg_append (wseg_of s065B_10) (wseg_of s065B_11))))))))))))⟩

end PackLean.D40.Tet
