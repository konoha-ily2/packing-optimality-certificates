-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS062_0
import PackLean.D40.K.FarS062_1
import PackLean.D40.K.FarS062_2
import PackLean.D40.K.FarS062_3
import PackLean.D40.K.FarS062_4
import PackLean.D40.K.FarS062_5
import PackLean.D40.K.FarS062_6
import PackLean.D40.K.FarS062_7
import PackLean.D40.K.FarS062_8
import PackLean.D40.K.FarS062_9
import PackLean.D40.K.FarS062_10
import PackLean.D40.K.FarS062_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t222A : List Tok := t222A_0 ++ (t222A_1 ++ (t222A_2 ++ (t222A_3 ++ (t222A_4 ++ (t222A_5 ++ (t222A_6 ++ (t222A_7 ++ (t222A_8 ++ (t222A_9 ++ (t222A_10 ++ (t222A_11 ++ (t222A_12 ++ (t222A_13 ++ (t222A_14 ++ (t222A_15 ++ (t222A_16 ++ (t222A_17 ++ (t222A_18 ++ (t222A_19 ++ (t222A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t222B : List Tok := t222B_0 ++ (t222B_1 ++ (t222B_2 ++ (t222B_3 ++ (t222B_4 ++ (t222B_5 ++ (t222B_6 ++ (t222B_7 ++ (t222B_8 ++ (t222B_9 ++ (t222B_10 ++ (t222B_11 ++ (t222B_12 ++ (t222B_13 ++ (t222B_14 ++ (t222B_15 ++ (t222B_16 ++ (t222B_17 ++ (t222B_18 ++ (t222B_19 ++ (t222B_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 222：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run222 : (nbRun P nb222 0 kN222 t222A).1 = true ∧ (nbRun P nb222 1 kN222 t222B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s222A_0) (wseg_append (wseg_of s222A_1) (wseg_append (wseg_of s222A_2) (wseg_append (wseg_of s222A_3) (wseg_append (wseg_of s222A_4) (wseg_append (wseg_of s222A_5) (wseg_append (wseg_of s222A_6) (wseg_append (wseg_of s222A_7) (wseg_append (wseg_of s222A_8) (wseg_append (wseg_of s222A_9) (wseg_append (wseg_of s222A_10) (wseg_append (wseg_of s222A_11) (wseg_append (wseg_of s222A_12) (wseg_append (wseg_of s222A_13) (wseg_append (wseg_of s222A_14) (wseg_append (wseg_of s222A_15) (wseg_append (wseg_of s222A_16) (wseg_append (wseg_of s222A_17) (wseg_append (wseg_of s222A_18) (wseg_append (wseg_of s222A_19) (wseg_of s222A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s222B_0) (wseg_append (wseg_of s222B_1) (wseg_append (wseg_of s222B_2) (wseg_append (wseg_of s222B_3) (wseg_append (wseg_of s222B_4) (wseg_append (wseg_of s222B_5) (wseg_append (wseg_of s222B_6) (wseg_append (wseg_of s222B_7) (wseg_append (wseg_of s222B_8) (wseg_append (wseg_of s222B_9) (wseg_append (wseg_of s222B_10) (wseg_append (wseg_of s222B_11) (wseg_append (wseg_of s222B_12) (wseg_append (wseg_of s222B_13) (wseg_append (wseg_of s222B_14) (wseg_append (wseg_of s222B_15) (wseg_append (wseg_of s222B_16) (wseg_append (wseg_of s222B_17) (wseg_append (wseg_of s222B_18) (wseg_append (wseg_of s222B_19) (wseg_of s222B_20)))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t223A : List Tok := t223A_0 ++ (t223A_1 ++ (t223A_2 ++ (t223A_3 ++ (t223A_4 ++ (t223A_5 ++ (t223A_6 ++ (t223A_7 ++ (t223A_8 ++ (t223A_9 ++ (t223A_10 ++ (t223A_11 ++ (t223A_12 ++ (t223A_13 ++ (t223A_14 ++ (t223A_15 ++ (t223A_16 ++ (t223A_17 ++ (t223A_18 ++ (t223A_19 ++ (t223A_20 ++ (t223A_21 ++ (t223A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t223B : List Tok := t223B_0 ++ (t223B_1 ++ (t223B_2 ++ (t223B_3 ++ (t223B_4 ++ (t223B_5 ++ (t223B_6 ++ (t223B_7 ++ (t223B_8 ++ (t223B_9 ++ (t223B_10 ++ (t223B_11 ++ (t223B_12 ++ (t223B_13 ++ (t223B_14 ++ (t223B_15 ++ (t223B_16 ++ (t223B_17 ++ (t223B_18 ++ (t223B_19 ++ (t223B_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 223：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run223 : (nbRun P nb223 0 kN223 t223A).1 = true ∧ (nbRun P nb223 1 kN223 t223B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s223A_0) (wseg_append (wseg_of s223A_1) (wseg_append (wseg_of s223A_2) (wseg_append (wseg_of s223A_3) (wseg_append (wseg_of s223A_4) (wseg_append (wseg_of s223A_5) (wseg_append (wseg_of s223A_6) (wseg_append (wseg_of s223A_7) (wseg_append (wseg_of s223A_8) (wseg_append (wseg_of s223A_9) (wseg_append (wseg_of s223A_10) (wseg_append (wseg_of s223A_11) (wseg_append (wseg_of s223A_12) (wseg_append (wseg_of s223A_13) (wseg_append (wseg_of s223A_14) (wseg_append (wseg_of s223A_15) (wseg_append (wseg_of s223A_16) (wseg_append (wseg_of s223A_17) (wseg_append (wseg_of s223A_18) (wseg_append (wseg_of s223A_19) (wseg_append (wseg_of s223A_20) (wseg_append (wseg_of s223A_21) (wseg_of s223A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s223B_0) (wseg_append (wseg_of s223B_1) (wseg_append (wseg_of s223B_2) (wseg_append (wseg_of s223B_3) (wseg_append (wseg_of s223B_4) (wseg_append (wseg_of s223B_5) (wseg_append (wseg_of s223B_6) (wseg_append (wseg_of s223B_7) (wseg_append (wseg_of s223B_8) (wseg_append (wseg_of s223B_9) (wseg_append (wseg_of s223B_10) (wseg_append (wseg_of s223B_11) (wseg_append (wseg_of s223B_12) (wseg_append (wseg_of s223B_13) (wseg_append (wseg_of s223B_14) (wseg_append (wseg_of s223B_15) (wseg_append (wseg_of s223B_16) (wseg_append (wseg_of s223B_17) (wseg_append (wseg_of s223B_18) (wseg_append (wseg_of s223B_19) (wseg_of s223B_20)))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224A : List Tok := t224A_0 ++ (t224A_1 ++ (t224A_2 ++ (t224A_3 ++ (t224A_4 ++ (t224A_5 ++ (t224A_6 ++ (t224A_7 ++ (t224A_8 ++ (t224A_9 ++ (t224A_10 ++ (t224A_11 ++ (t224A_12 ++ (t224A_13 ++ (t224A_14 ++ (t224A_15 ++ (t224A_16 ++ (t224A_17 ++ (t224A_18 ++ (t224A_19 ++ (t224A_20 ++ (t224A_21 ++ (t224A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t224B : List Tok := t224B_0 ++ (t224B_1 ++ (t224B_2 ++ (t224B_3 ++ (t224B_4 ++ (t224B_5 ++ (t224B_6 ++ (t224B_7 ++ (t224B_8 ++ (t224B_9 ++ (t224B_10 ++ (t224B_11 ++ (t224B_12 ++ (t224B_13 ++ (t224B_14 ++ (t224B_15 ++ (t224B_16 ++ (t224B_17 ++ (t224B_18 ++ (t224B_19 ++ (t224B_20 ++ (t224B_21 ++ (t224B_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 224：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run224 : (nbRun P nb224 0 kN224 t224A).1 = true ∧ (nbRun P nb224 1 kN224 t224B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s224A_0) (wseg_append (wseg_of s224A_1) (wseg_append (wseg_of s224A_2) (wseg_append (wseg_of s224A_3) (wseg_append (wseg_of s224A_4) (wseg_append (wseg_of s224A_5) (wseg_append (wseg_of s224A_6) (wseg_append (wseg_of s224A_7) (wseg_append (wseg_of s224A_8) (wseg_append (wseg_of s224A_9) (wseg_append (wseg_of s224A_10) (wseg_append (wseg_of s224A_11) (wseg_append (wseg_of s224A_12) (wseg_append (wseg_of s224A_13) (wseg_append (wseg_of s224A_14) (wseg_append (wseg_of s224A_15) (wseg_append (wseg_of s224A_16) (wseg_append (wseg_of s224A_17) (wseg_append (wseg_of s224A_18) (wseg_append (wseg_of s224A_19) (wseg_append (wseg_of s224A_20) (wseg_append (wseg_of s224A_21) (wseg_of s224A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s224B_0) (wseg_append (wseg_of s224B_1) (wseg_append (wseg_of s224B_2) (wseg_append (wseg_of s224B_3) (wseg_append (wseg_of s224B_4) (wseg_append (wseg_of s224B_5) (wseg_append (wseg_of s224B_6) (wseg_append (wseg_of s224B_7) (wseg_append (wseg_of s224B_8) (wseg_append (wseg_of s224B_9) (wseg_append (wseg_of s224B_10) (wseg_append (wseg_of s224B_11) (wseg_append (wseg_of s224B_12) (wseg_append (wseg_of s224B_13) (wseg_append (wseg_of s224B_14) (wseg_append (wseg_of s224B_15) (wseg_append (wseg_of s224B_16) (wseg_append (wseg_of s224B_17) (wseg_append (wseg_of s224B_18) (wseg_append (wseg_of s224B_19) (wseg_append (wseg_of s224B_20) (wseg_append (wseg_of s224B_21) (wseg_of s224B_22)))))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t225A : List Tok := t225A_0 ++ (t225A_1 ++ (t225A_2 ++ (t225A_3 ++ (t225A_4 ++ (t225A_5 ++ (t225A_6 ++ (t225A_7 ++ (t225A_8 ++ (t225A_9 ++ (t225A_10 ++ (t225A_11 ++ (t225A_12 ++ (t225A_13 ++ (t225A_14 ++ (t225A_15 ++ (t225A_16 ++ (t225A_17 ++ (t225A_18 ++ (t225A_19 ++ (t225A_20 ++ (t225A_21 ++ (t225A_22 ++ (t225A_23 ++ (t225A_24 ++ (t225A_25 ++ (t225A_26 ++ (t225A_27 ++ (t225A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t225B : List Tok := t225B_0 ++ (t225B_1 ++ (t225B_2 ++ (t225B_3 ++ (t225B_4 ++ (t225B_5 ++ (t225B_6 ++ (t225B_7 ++ (t225B_8 ++ (t225B_9 ++ (t225B_10 ++ (t225B_11 ++ (t225B_12 ++ (t225B_13 ++ (t225B_14 ++ (t225B_15 ++ (t225B_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 225：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run225 : (nbRun P nb225 0 kN225 t225A).1 = true ∧ (nbRun P nb225 1 kN225 t225B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s225A_0) (wseg_append (wseg_of s225A_1) (wseg_append (wseg_of s225A_2) (wseg_append (wseg_of s225A_3) (wseg_append (wseg_of s225A_4) (wseg_append (wseg_of s225A_5) (wseg_append (wseg_of s225A_6) (wseg_append (wseg_of s225A_7) (wseg_append (wseg_of s225A_8) (wseg_append (wseg_of s225A_9) (wseg_append (wseg_of s225A_10) (wseg_append (wseg_of s225A_11) (wseg_append (wseg_of s225A_12) (wseg_append (wseg_of s225A_13) (wseg_append (wseg_of s225A_14) (wseg_append (wseg_of s225A_15) (wseg_append (wseg_of s225A_16) (wseg_append (wseg_of s225A_17) (wseg_append (wseg_of s225A_18) (wseg_append (wseg_of s225A_19) (wseg_append (wseg_of s225A_20) (wseg_append (wseg_of s225A_21) (wseg_append (wseg_of s225A_22) (wseg_append (wseg_of s225A_23) (wseg_append (wseg_of s225A_24) (wseg_append (wseg_of s225A_25) (wseg_append (wseg_of s225A_26) (wseg_append (wseg_of s225A_27) (wseg_of s225A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s225B_0) (wseg_append (wseg_of s225B_1) (wseg_append (wseg_of s225B_2) (wseg_append (wseg_of s225B_3) (wseg_append (wseg_of s225B_4) (wseg_append (wseg_of s225B_5) (wseg_append (wseg_of s225B_6) (wseg_append (wseg_of s225B_7) (wseg_append (wseg_of s225B_8) (wseg_append (wseg_of s225B_9) (wseg_append (wseg_of s225B_10) (wseg_append (wseg_of s225B_11) (wseg_append (wseg_of s225B_12) (wseg_append (wseg_of s225B_13) (wseg_append (wseg_of s225B_14) (wseg_append (wseg_of s225B_15) (wseg_of s225B_16)))))))))))))))))⟩

end PackLean.D40.Tet
