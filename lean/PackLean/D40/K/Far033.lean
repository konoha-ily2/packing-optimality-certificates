-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS033_0
import PackLean.D40.K.FarS033_1
import PackLean.D40.K.FarS033_2
import PackLean.D40.K.FarS033_3
import PackLean.D40.K.FarS033_4
import PackLean.D40.K.FarS033_5
import PackLean.D40.K.FarS033_6
import PackLean.D40.K.FarS033_7
import PackLean.D40.K.FarS033_8
import PackLean.D40.K.FarS033_9
import PackLean.D40.K.FarS033_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t102A : List Tok := t102A_0 ++ (t102A_1 ++ (t102A_2 ++ (t102A_3 ++ (t102A_4 ++ (t102A_5 ++ (t102A_6 ++ (t102A_7 ++ (t102A_8 ++ (t102A_9 ++ (t102A_10 ++ (t102A_11 ++ (t102A_12 ++ (t102A_13 ++ (t102A_14 ++ (t102A_15 ++ (t102A_16 ++ (t102A_17 ++ (t102A_18 ++ (t102A_19 ++ (t102A_20 ++ (t102A_21 ++ (t102A_22 ++ (t102A_23 ++ (t102A_24 ++ (t102A_25 ++ (t102A_26 ++ (t102A_27 ++ (t102A_28 ++ (t102A_29 ++ (t102A_30 ++ (t102A_31 ++ (t102A_32 ++ (t102A_33 ++ (t102A_34 ++ (t102A_35 ++ (t102A_36 ++ (t102A_37 ++ (t102A_38 ++ (t102A_39 ++ (t102A_40 ++ (t102A_41 ++ (t102A_42 ++ (t102A_43)))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t102B : List Tok := t102B_0 ++ (t102B_1 ++ (t102B_2 ++ (t102B_3 ++ (t102B_4 ++ (t102B_5 ++ (t102B_6 ++ (t102B_7 ++ (t102B_8 ++ (t102B_9 ++ (t102B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 102：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run102 : (nbRun P nb102 0 kN102 t102A).1 = true ∧ (nbRun P nb102 1 kN102 t102B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s102A_0) (wseg_append (wseg_of s102A_1) (wseg_append (wseg_of s102A_2) (wseg_append (wseg_of s102A_3) (wseg_append (wseg_of s102A_4) (wseg_append (wseg_of s102A_5) (wseg_append (wseg_of s102A_6) (wseg_append (wseg_of s102A_7) (wseg_append (wseg_of s102A_8) (wseg_append (wseg_of s102A_9) (wseg_append (wseg_of s102A_10) (wseg_append (wseg_of s102A_11) (wseg_append (wseg_of s102A_12) (wseg_append (wseg_of s102A_13) (wseg_append (wseg_of s102A_14) (wseg_append (wseg_of s102A_15) (wseg_append (wseg_of s102A_16) (wseg_append (wseg_of s102A_17) (wseg_append (wseg_of s102A_18) (wseg_append (wseg_of s102A_19) (wseg_append (wseg_of s102A_20) (wseg_append (wseg_of s102A_21) (wseg_append (wseg_of s102A_22) (wseg_append (wseg_of s102A_23) (wseg_append (wseg_of s102A_24) (wseg_append (wseg_of s102A_25) (wseg_append (wseg_of s102A_26) (wseg_append (wseg_of s102A_27) (wseg_append (wseg_of s102A_28) (wseg_append (wseg_of s102A_29) (wseg_append (wseg_of s102A_30) (wseg_append (wseg_of s102A_31) (wseg_append (wseg_of s102A_32) (wseg_append (wseg_of s102A_33) (wseg_append (wseg_of s102A_34) (wseg_append (wseg_of s102A_35) (wseg_append (wseg_of s102A_36) (wseg_append (wseg_of s102A_37) (wseg_append (wseg_of s102A_38) (wseg_append (wseg_of s102A_39) (wseg_append (wseg_of s102A_40) (wseg_append (wseg_of s102A_41) (wseg_append (wseg_of s102A_42) (wseg_of s102A_43)))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s102B_0) (wseg_append (wseg_of s102B_1) (wseg_append (wseg_of s102B_2) (wseg_append (wseg_of s102B_3) (wseg_append (wseg_of s102B_4) (wseg_append (wseg_of s102B_5) (wseg_append (wseg_of s102B_6) (wseg_append (wseg_of s102B_7) (wseg_append (wseg_of s102B_8) (wseg_append (wseg_of s102B_9) (wseg_of s102B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t103A : List Tok := t103A_0 ++ (t103A_1 ++ (t103A_2 ++ (t103A_3 ++ (t103A_4 ++ (t103A_5 ++ (t103A_6 ++ (t103A_7 ++ (t103A_8 ++ (t103A_9 ++ (t103A_10 ++ (t103A_11 ++ (t103A_12 ++ (t103A_13 ++ (t103A_14 ++ (t103A_15 ++ (t103A_16 ++ (t103A_17 ++ (t103A_18 ++ (t103A_19 ++ (t103A_20 ++ (t103A_21 ++ (t103A_22 ++ (t103A_23 ++ (t103A_24 ++ (t103A_25 ++ (t103A_26 ++ (t103A_27 ++ (t103A_28 ++ (t103A_29 ++ (t103A_30 ++ (t103A_31 ++ (t103A_32 ++ (t103A_33 ++ (t103A_34 ++ (t103A_35 ++ (t103A_36 ++ (t103A_37 ++ (t103A_38 ++ (t103A_39 ++ (t103A_40 ++ (t103A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t103B : List Tok := t103B_0 ++ (t103B_1 ++ (t103B_2 ++ (t103B_3 ++ (t103B_4 ++ (t103B_5 ++ (t103B_6 ++ (t103B_7 ++ (t103B_8 ++ (t103B_9 ++ (t103B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 103：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run103 : (nbRun P nb103 0 kN103 t103A).1 = true ∧ (nbRun P nb103 1 kN103 t103B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s103A_0) (wseg_append (wseg_of s103A_1) (wseg_append (wseg_of s103A_2) (wseg_append (wseg_of s103A_3) (wseg_append (wseg_of s103A_4) (wseg_append (wseg_of s103A_5) (wseg_append (wseg_of s103A_6) (wseg_append (wseg_of s103A_7) (wseg_append (wseg_of s103A_8) (wseg_append (wseg_of s103A_9) (wseg_append (wseg_of s103A_10) (wseg_append (wseg_of s103A_11) (wseg_append (wseg_of s103A_12) (wseg_append (wseg_of s103A_13) (wseg_append (wseg_of s103A_14) (wseg_append (wseg_of s103A_15) (wseg_append (wseg_of s103A_16) (wseg_append (wseg_of s103A_17) (wseg_append (wseg_of s103A_18) (wseg_append (wseg_of s103A_19) (wseg_append (wseg_of s103A_20) (wseg_append (wseg_of s103A_21) (wseg_append (wseg_of s103A_22) (wseg_append (wseg_of s103A_23) (wseg_append (wseg_of s103A_24) (wseg_append (wseg_of s103A_25) (wseg_append (wseg_of s103A_26) (wseg_append (wseg_of s103A_27) (wseg_append (wseg_of s103A_28) (wseg_append (wseg_of s103A_29) (wseg_append (wseg_of s103A_30) (wseg_append (wseg_of s103A_31) (wseg_append (wseg_of s103A_32) (wseg_append (wseg_of s103A_33) (wseg_append (wseg_of s103A_34) (wseg_append (wseg_of s103A_35) (wseg_append (wseg_of s103A_36) (wseg_append (wseg_of s103A_37) (wseg_append (wseg_of s103A_38) (wseg_append (wseg_of s103A_39) (wseg_append (wseg_of s103A_40) (wseg_of s103A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s103B_0) (wseg_append (wseg_of s103B_1) (wseg_append (wseg_of s103B_2) (wseg_append (wseg_of s103B_3) (wseg_append (wseg_of s103B_4) (wseg_append (wseg_of s103B_5) (wseg_append (wseg_of s103B_6) (wseg_append (wseg_of s103B_7) (wseg_append (wseg_of s103B_8) (wseg_append (wseg_of s103B_9) (wseg_of s103B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104A : List Tok := t104A_0 ++ (t104A_1 ++ (t104A_2 ++ (t104A_3 ++ (t104A_4 ++ (t104A_5 ++ (t104A_6 ++ (t104A_7 ++ (t104A_8 ++ (t104A_9 ++ (t104A_10 ++ (t104A_11 ++ (t104A_12 ++ (t104A_13 ++ (t104A_14 ++ (t104A_15 ++ (t104A_16 ++ (t104A_17 ++ (t104A_18 ++ (t104A_19 ++ (t104A_20 ++ (t104A_21 ++ (t104A_22 ++ (t104A_23 ++ (t104A_24 ++ (t104A_25 ++ (t104A_26 ++ (t104A_27 ++ (t104A_28 ++ (t104A_29 ++ (t104A_30 ++ (t104A_31 ++ (t104A_32 ++ (t104A_33 ++ (t104A_34 ++ (t104A_35 ++ (t104A_36 ++ (t104A_37 ++ (t104A_38 ++ (t104A_39 ++ (t104A_40 ++ (t104A_41 ++ (t104A_42 ++ (t104A_43 ++ (t104A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t104B : List Tok := t104B_0 ++ (t104B_1 ++ (t104B_2 ++ (t104B_3 ++ (t104B_4 ++ (t104B_5 ++ (t104B_6 ++ (t104B_7 ++ (t104B_8 ++ (t104B_9 ++ (t104B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 104：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run104 : (nbRun P nb104 0 kN104 t104A).1 = true ∧ (nbRun P nb104 1 kN104 t104B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s104A_0) (wseg_append (wseg_of s104A_1) (wseg_append (wseg_of s104A_2) (wseg_append (wseg_of s104A_3) (wseg_append (wseg_of s104A_4) (wseg_append (wseg_of s104A_5) (wseg_append (wseg_of s104A_6) (wseg_append (wseg_of s104A_7) (wseg_append (wseg_of s104A_8) (wseg_append (wseg_of s104A_9) (wseg_append (wseg_of s104A_10) (wseg_append (wseg_of s104A_11) (wseg_append (wseg_of s104A_12) (wseg_append (wseg_of s104A_13) (wseg_append (wseg_of s104A_14) (wseg_append (wseg_of s104A_15) (wseg_append (wseg_of s104A_16) (wseg_append (wseg_of s104A_17) (wseg_append (wseg_of s104A_18) (wseg_append (wseg_of s104A_19) (wseg_append (wseg_of s104A_20) (wseg_append (wseg_of s104A_21) (wseg_append (wseg_of s104A_22) (wseg_append (wseg_of s104A_23) (wseg_append (wseg_of s104A_24) (wseg_append (wseg_of s104A_25) (wseg_append (wseg_of s104A_26) (wseg_append (wseg_of s104A_27) (wseg_append (wseg_of s104A_28) (wseg_append (wseg_of s104A_29) (wseg_append (wseg_of s104A_30) (wseg_append (wseg_of s104A_31) (wseg_append (wseg_of s104A_32) (wseg_append (wseg_of s104A_33) (wseg_append (wseg_of s104A_34) (wseg_append (wseg_of s104A_35) (wseg_append (wseg_of s104A_36) (wseg_append (wseg_of s104A_37) (wseg_append (wseg_of s104A_38) (wseg_append (wseg_of s104A_39) (wseg_append (wseg_of s104A_40) (wseg_append (wseg_of s104A_41) (wseg_append (wseg_of s104A_42) (wseg_append (wseg_of s104A_43) (wseg_of s104A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s104B_0) (wseg_append (wseg_of s104B_1) (wseg_append (wseg_of s104B_2) (wseg_append (wseg_of s104B_3) (wseg_append (wseg_of s104B_4) (wseg_append (wseg_of s104B_5) (wseg_append (wseg_of s104B_6) (wseg_append (wseg_of s104B_7) (wseg_append (wseg_of s104B_8) (wseg_append (wseg_of s104B_9) (wseg_of s104B_10)))))))))))⟩

end PackLean.D40.Tet
