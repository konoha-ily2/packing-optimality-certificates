-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS055_0
import PackLean.D40.K.FarS055_1
import PackLean.D40.K.FarS055_2
import PackLean.D40.K.FarS055_3
import PackLean.D40.K.FarS055_4
import PackLean.D40.K.FarS055_5
import PackLean.D40.K.FarS055_6
import PackLean.D40.K.FarS055_7
import PackLean.D40.K.FarS055_8
import PackLean.D40.K.FarS055_9
import PackLean.D40.K.FarS055_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192A : List Tok := t192A_0 ++ (t192A_1 ++ (t192A_2 ++ (t192A_3 ++ (t192A_4 ++ (t192A_5 ++ (t192A_6 ++ (t192A_7 ++ (t192A_8 ++ (t192A_9 ++ (t192A_10 ++ (t192A_11 ++ (t192A_12 ++ (t192A_13 ++ (t192A_14 ++ (t192A_15 ++ (t192A_16 ++ (t192A_17 ++ (t192A_18 ++ (t192A_19 ++ (t192A_20 ++ (t192A_21 ++ (t192A_22 ++ (t192A_23 ++ (t192A_24 ++ (t192A_25 ++ (t192A_26 ++ (t192A_27 ++ (t192A_28 ++ (t192A_29 ++ (t192A_30 ++ (t192A_31)))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t192B : List Tok := t192B_0 ++ (t192B_1 ++ (t192B_2 ++ (t192B_3 ++ (t192B_4 ++ (t192B_5 ++ (t192B_6 ++ (t192B_7 ++ (t192B_8 ++ (t192B_9 ++ (t192B_10 ++ (t192B_11 ++ (t192B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 192：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run192 : (nbRun P nb192 0 kN192 t192A).1 = true ∧ (nbRun P nb192 1 kN192 t192B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s192A_0) (wseg_append (wseg_of s192A_1) (wseg_append (wseg_of s192A_2) (wseg_append (wseg_of s192A_3) (wseg_append (wseg_of s192A_4) (wseg_append (wseg_of s192A_5) (wseg_append (wseg_of s192A_6) (wseg_append (wseg_of s192A_7) (wseg_append (wseg_of s192A_8) (wseg_append (wseg_of s192A_9) (wseg_append (wseg_of s192A_10) (wseg_append (wseg_of s192A_11) (wseg_append (wseg_of s192A_12) (wseg_append (wseg_of s192A_13) (wseg_append (wseg_of s192A_14) (wseg_append (wseg_of s192A_15) (wseg_append (wseg_of s192A_16) (wseg_append (wseg_of s192A_17) (wseg_append (wseg_of s192A_18) (wseg_append (wseg_of s192A_19) (wseg_append (wseg_of s192A_20) (wseg_append (wseg_of s192A_21) (wseg_append (wseg_of s192A_22) (wseg_append (wseg_of s192A_23) (wseg_append (wseg_of s192A_24) (wseg_append (wseg_of s192A_25) (wseg_append (wseg_of s192A_26) (wseg_append (wseg_of s192A_27) (wseg_append (wseg_of s192A_28) (wseg_append (wseg_of s192A_29) (wseg_append (wseg_of s192A_30) (wseg_of s192A_31)))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s192B_0) (wseg_append (wseg_of s192B_1) (wseg_append (wseg_of s192B_2) (wseg_append (wseg_of s192B_3) (wseg_append (wseg_of s192B_4) (wseg_append (wseg_of s192B_5) (wseg_append (wseg_of s192B_6) (wseg_append (wseg_of s192B_7) (wseg_append (wseg_of s192B_8) (wseg_append (wseg_of s192B_9) (wseg_append (wseg_of s192B_10) (wseg_append (wseg_of s192B_11) (wseg_of s192B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t193A : List Tok := t193A_0 ++ (t193A_1 ++ (t193A_2 ++ (t193A_3 ++ (t193A_4 ++ (t193A_5 ++ (t193A_6 ++ (t193A_7 ++ (t193A_8 ++ (t193A_9 ++ (t193A_10 ++ (t193A_11 ++ (t193A_12 ++ (t193A_13 ++ (t193A_14 ++ (t193A_15 ++ (t193A_16 ++ (t193A_17 ++ (t193A_18 ++ (t193A_19 ++ (t193A_20 ++ (t193A_21 ++ (t193A_22 ++ (t193A_23 ++ (t193A_24 ++ (t193A_25 ++ (t193A_26 ++ (t193A_27 ++ (t193A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t193B : List Tok := t193B_0 ++ (t193B_1 ++ (t193B_2 ++ (t193B_3 ++ (t193B_4 ++ (t193B_5 ++ (t193B_6 ++ (t193B_7 ++ (t193B_8 ++ (t193B_9 ++ (t193B_10 ++ (t193B_11 ++ (t193B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 193：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run193 : (nbRun P nb193 0 kN193 t193A).1 = true ∧ (nbRun P nb193 1 kN193 t193B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s193A_0) (wseg_append (wseg_of s193A_1) (wseg_append (wseg_of s193A_2) (wseg_append (wseg_of s193A_3) (wseg_append (wseg_of s193A_4) (wseg_append (wseg_of s193A_5) (wseg_append (wseg_of s193A_6) (wseg_append (wseg_of s193A_7) (wseg_append (wseg_of s193A_8) (wseg_append (wseg_of s193A_9) (wseg_append (wseg_of s193A_10) (wseg_append (wseg_of s193A_11) (wseg_append (wseg_of s193A_12) (wseg_append (wseg_of s193A_13) (wseg_append (wseg_of s193A_14) (wseg_append (wseg_of s193A_15) (wseg_append (wseg_of s193A_16) (wseg_append (wseg_of s193A_17) (wseg_append (wseg_of s193A_18) (wseg_append (wseg_of s193A_19) (wseg_append (wseg_of s193A_20) (wseg_append (wseg_of s193A_21) (wseg_append (wseg_of s193A_22) (wseg_append (wseg_of s193A_23) (wseg_append (wseg_of s193A_24) (wseg_append (wseg_of s193A_25) (wseg_append (wseg_of s193A_26) (wseg_append (wseg_of s193A_27) (wseg_of s193A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s193B_0) (wseg_append (wseg_of s193B_1) (wseg_append (wseg_of s193B_2) (wseg_append (wseg_of s193B_3) (wseg_append (wseg_of s193B_4) (wseg_append (wseg_of s193B_5) (wseg_append (wseg_of s193B_6) (wseg_append (wseg_of s193B_7) (wseg_append (wseg_of s193B_8) (wseg_append (wseg_of s193B_9) (wseg_append (wseg_of s193B_10) (wseg_append (wseg_of s193B_11) (wseg_of s193B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t194A : List Tok := t194A_0 ++ (t194A_1 ++ (t194A_2 ++ (t194A_3 ++ (t194A_4 ++ (t194A_5 ++ (t194A_6 ++ (t194A_7 ++ (t194A_8 ++ (t194A_9 ++ (t194A_10 ++ (t194A_11 ++ (t194A_12 ++ (t194A_13 ++ (t194A_14 ++ (t194A_15 ++ (t194A_16 ++ (t194A_17 ++ (t194A_18 ++ (t194A_19 ++ (t194A_20 ++ (t194A_21 ++ (t194A_22 ++ (t194A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t194B : List Tok := t194B_0 ++ (t194B_1 ++ (t194B_2 ++ (t194B_3 ++ (t194B_4 ++ (t194B_5 ++ (t194B_6 ++ (t194B_7 ++ (t194B_8 ++ (t194B_9 ++ (t194B_10 ++ (t194B_11 ++ (t194B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 194：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run194 : (nbRun P nb194 0 kN194 t194A).1 = true ∧ (nbRun P nb194 1 kN194 t194B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s194A_0) (wseg_append (wseg_of s194A_1) (wseg_append (wseg_of s194A_2) (wseg_append (wseg_of s194A_3) (wseg_append (wseg_of s194A_4) (wseg_append (wseg_of s194A_5) (wseg_append (wseg_of s194A_6) (wseg_append (wseg_of s194A_7) (wseg_append (wseg_of s194A_8) (wseg_append (wseg_of s194A_9) (wseg_append (wseg_of s194A_10) (wseg_append (wseg_of s194A_11) (wseg_append (wseg_of s194A_12) (wseg_append (wseg_of s194A_13) (wseg_append (wseg_of s194A_14) (wseg_append (wseg_of s194A_15) (wseg_append (wseg_of s194A_16) (wseg_append (wseg_of s194A_17) (wseg_append (wseg_of s194A_18) (wseg_append (wseg_of s194A_19) (wseg_append (wseg_of s194A_20) (wseg_append (wseg_of s194A_21) (wseg_append (wseg_of s194A_22) (wseg_of s194A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s194B_0) (wseg_append (wseg_of s194B_1) (wseg_append (wseg_of s194B_2) (wseg_append (wseg_of s194B_3) (wseg_append (wseg_of s194B_4) (wseg_append (wseg_of s194B_5) (wseg_append (wseg_of s194B_6) (wseg_append (wseg_of s194B_7) (wseg_append (wseg_of s194B_8) (wseg_append (wseg_of s194B_9) (wseg_append (wseg_of s194B_10) (wseg_append (wseg_of s194B_11) (wseg_of s194B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t195A : List Tok := t195A_0 ++ (t195A_1 ++ (t195A_2 ++ (t195A_3 ++ (t195A_4 ++ (t195A_5 ++ (t195A_6 ++ (t195A_7 ++ (t195A_8 ++ (t195A_9 ++ (t195A_10 ++ (t195A_11 ++ (t195A_12 ++ (t195A_13 ++ (t195A_14 ++ (t195A_15 ++ (t195A_16 ++ (t195A_17 ++ (t195A_18 ++ (t195A_19 ++ (t195A_20 ++ (t195A_21 ++ (t195A_22 ++ (t195A_23 ++ (t195A_24 ++ (t195A_25 ++ (t195A_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t195B : List Tok := t195B_0 ++ (t195B_1 ++ (t195B_2 ++ (t195B_3 ++ (t195B_4 ++ (t195B_5 ++ (t195B_6 ++ (t195B_7 ++ (t195B_8 ++ (t195B_9 ++ (t195B_10 ++ (t195B_11 ++ (t195B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 195：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run195 : (nbRun P nb195 0 kN195 t195A).1 = true ∧ (nbRun P nb195 1 kN195 t195B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s195A_0) (wseg_append (wseg_of s195A_1) (wseg_append (wseg_of s195A_2) (wseg_append (wseg_of s195A_3) (wseg_append (wseg_of s195A_4) (wseg_append (wseg_of s195A_5) (wseg_append (wseg_of s195A_6) (wseg_append (wseg_of s195A_7) (wseg_append (wseg_of s195A_8) (wseg_append (wseg_of s195A_9) (wseg_append (wseg_of s195A_10) (wseg_append (wseg_of s195A_11) (wseg_append (wseg_of s195A_12) (wseg_append (wseg_of s195A_13) (wseg_append (wseg_of s195A_14) (wseg_append (wseg_of s195A_15) (wseg_append (wseg_of s195A_16) (wseg_append (wseg_of s195A_17) (wseg_append (wseg_of s195A_18) (wseg_append (wseg_of s195A_19) (wseg_append (wseg_of s195A_20) (wseg_append (wseg_of s195A_21) (wseg_append (wseg_of s195A_22) (wseg_append (wseg_of s195A_23) (wseg_append (wseg_of s195A_24) (wseg_append (wseg_of s195A_25) (wseg_of s195A_26))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s195B_0) (wseg_append (wseg_of s195B_1) (wseg_append (wseg_of s195B_2) (wseg_append (wseg_of s195B_3) (wseg_append (wseg_of s195B_4) (wseg_append (wseg_of s195B_5) (wseg_append (wseg_of s195B_6) (wseg_append (wseg_of s195B_7) (wseg_append (wseg_of s195B_8) (wseg_append (wseg_of s195B_9) (wseg_append (wseg_of s195B_10) (wseg_append (wseg_of s195B_11) (wseg_of s195B_12)))))))))))))⟩

end PackLean.D40.Tet
