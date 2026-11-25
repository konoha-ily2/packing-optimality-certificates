-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS053_0
import PackLean.D40.K.FarS053_1
import PackLean.D40.K.FarS053_2
import PackLean.D40.K.FarS053_3
import PackLean.D40.K.FarS053_4
import PackLean.D40.K.FarS053_5
import PackLean.D40.K.FarS053_6
import PackLean.D40.K.FarS053_7
import PackLean.D40.K.FarS053_8
import PackLean.D40.K.FarS053_9
import PackLean.D40.K.FarS053_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t184A : List Tok := t184A_0 ++ (t184A_1 ++ (t184A_2 ++ (t184A_3 ++ (t184A_4 ++ (t184A_5 ++ (t184A_6 ++ (t184A_7 ++ (t184A_8 ++ (t184A_9 ++ (t184A_10 ++ (t184A_11 ++ (t184A_12 ++ (t184A_13 ++ (t184A_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t184B : List Tok := t184B_0 ++ (t184B_1 ++ (t184B_2 ++ (t184B_3 ++ (t184B_4 ++ (t184B_5 ++ (t184B_6 ++ (t184B_7 ++ (t184B_8 ++ (t184B_9 ++ (t184B_10 ++ (t184B_11 ++ (t184B_12 ++ (t184B_13 ++ (t184B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 184：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run184 : (nbRun P nb184 0 kN184 t184A).1 = true ∧ (nbRun P nb184 1 kN184 t184B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s184A_0) (wseg_append (wseg_of s184A_1) (wseg_append (wseg_of s184A_2) (wseg_append (wseg_of s184A_3) (wseg_append (wseg_of s184A_4) (wseg_append (wseg_of s184A_5) (wseg_append (wseg_of s184A_6) (wseg_append (wseg_of s184A_7) (wseg_append (wseg_of s184A_8) (wseg_append (wseg_of s184A_9) (wseg_append (wseg_of s184A_10) (wseg_append (wseg_of s184A_11) (wseg_append (wseg_of s184A_12) (wseg_append (wseg_of s184A_13) (wseg_of s184A_14))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s184B_0) (wseg_append (wseg_of s184B_1) (wseg_append (wseg_of s184B_2) (wseg_append (wseg_of s184B_3) (wseg_append (wseg_of s184B_4) (wseg_append (wseg_of s184B_5) (wseg_append (wseg_of s184B_6) (wseg_append (wseg_of s184B_7) (wseg_append (wseg_of s184B_8) (wseg_append (wseg_of s184B_9) (wseg_append (wseg_of s184B_10) (wseg_append (wseg_of s184B_11) (wseg_append (wseg_of s184B_12) (wseg_append (wseg_of s184B_13) (wseg_of s184B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t185A : List Tok := t185A_0 ++ (t185A_1 ++ (t185A_2 ++ (t185A_3 ++ (t185A_4 ++ (t185A_5 ++ (t185A_6 ++ (t185A_7 ++ (t185A_8 ++ (t185A_9 ++ (t185A_10 ++ (t185A_11 ++ (t185A_12 ++ (t185A_13 ++ (t185A_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t185B : List Tok := t185B_0 ++ (t185B_1 ++ (t185B_2 ++ (t185B_3 ++ (t185B_4 ++ (t185B_5 ++ (t185B_6 ++ (t185B_7 ++ (t185B_8 ++ (t185B_9 ++ (t185B_10 ++ (t185B_11 ++ (t185B_12 ++ (t185B_13 ++ (t185B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 185：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run185 : (nbRun P nb185 0 kN185 t185A).1 = true ∧ (nbRun P nb185 1 kN185 t185B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s185A_0) (wseg_append (wseg_of s185A_1) (wseg_append (wseg_of s185A_2) (wseg_append (wseg_of s185A_3) (wseg_append (wseg_of s185A_4) (wseg_append (wseg_of s185A_5) (wseg_append (wseg_of s185A_6) (wseg_append (wseg_of s185A_7) (wseg_append (wseg_of s185A_8) (wseg_append (wseg_of s185A_9) (wseg_append (wseg_of s185A_10) (wseg_append (wseg_of s185A_11) (wseg_append (wseg_of s185A_12) (wseg_append (wseg_of s185A_13) (wseg_of s185A_14))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s185B_0) (wseg_append (wseg_of s185B_1) (wseg_append (wseg_of s185B_2) (wseg_append (wseg_of s185B_3) (wseg_append (wseg_of s185B_4) (wseg_append (wseg_of s185B_5) (wseg_append (wseg_of s185B_6) (wseg_append (wseg_of s185B_7) (wseg_append (wseg_of s185B_8) (wseg_append (wseg_of s185B_9) (wseg_append (wseg_of s185B_10) (wseg_append (wseg_of s185B_11) (wseg_append (wseg_of s185B_12) (wseg_append (wseg_of s185B_13) (wseg_of s185B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t186A : List Tok := t186A_0 ++ (t186A_1 ++ (t186A_2 ++ (t186A_3 ++ (t186A_4 ++ (t186A_5 ++ (t186A_6 ++ (t186A_7 ++ (t186A_8 ++ (t186A_9 ++ (t186A_10 ++ (t186A_11 ++ (t186A_12 ++ (t186A_13 ++ (t186A_14 ++ (t186A_15 ++ (t186A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t186B : List Tok := t186B_0 ++ (t186B_1 ++ (t186B_2 ++ (t186B_3 ++ (t186B_4 ++ (t186B_5 ++ (t186B_6 ++ (t186B_7 ++ (t186B_8 ++ (t186B_9 ++ (t186B_10 ++ (t186B_11 ++ (t186B_12 ++ (t186B_13 ++ (t186B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 186：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run186 : (nbRun P nb186 0 kN186 t186A).1 = true ∧ (nbRun P nb186 1 kN186 t186B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s186A_0) (wseg_append (wseg_of s186A_1) (wseg_append (wseg_of s186A_2) (wseg_append (wseg_of s186A_3) (wseg_append (wseg_of s186A_4) (wseg_append (wseg_of s186A_5) (wseg_append (wseg_of s186A_6) (wseg_append (wseg_of s186A_7) (wseg_append (wseg_of s186A_8) (wseg_append (wseg_of s186A_9) (wseg_append (wseg_of s186A_10) (wseg_append (wseg_of s186A_11) (wseg_append (wseg_of s186A_12) (wseg_append (wseg_of s186A_13) (wseg_append (wseg_of s186A_14) (wseg_append (wseg_of s186A_15) (wseg_of s186A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s186B_0) (wseg_append (wseg_of s186B_1) (wseg_append (wseg_of s186B_2) (wseg_append (wseg_of s186B_3) (wseg_append (wseg_of s186B_4) (wseg_append (wseg_of s186B_5) (wseg_append (wseg_of s186B_6) (wseg_append (wseg_of s186B_7) (wseg_append (wseg_of s186B_8) (wseg_append (wseg_of s186B_9) (wseg_append (wseg_of s186B_10) (wseg_append (wseg_of s186B_11) (wseg_append (wseg_of s186B_12) (wseg_append (wseg_of s186B_13) (wseg_of s186B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t187A : List Tok := t187A_0 ++ (t187A_1 ++ (t187A_2 ++ (t187A_3 ++ (t187A_4 ++ (t187A_5 ++ (t187A_6 ++ (t187A_7 ++ (t187A_8 ++ (t187A_9 ++ (t187A_10 ++ (t187A_11 ++ (t187A_12 ++ (t187A_13 ++ (t187A_14 ++ (t187A_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t187B : List Tok := t187B_0 ++ (t187B_1 ++ (t187B_2 ++ (t187B_3 ++ (t187B_4 ++ (t187B_5 ++ (t187B_6 ++ (t187B_7 ++ (t187B_8 ++ (t187B_9 ++ (t187B_10 ++ (t187B_11 ++ (t187B_12 ++ (t187B_13 ++ (t187B_14 ++ (t187B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 187：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run187 : (nbRun P nb187 0 kN187 t187A).1 = true ∧ (nbRun P nb187 1 kN187 t187B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s187A_0) (wseg_append (wseg_of s187A_1) (wseg_append (wseg_of s187A_2) (wseg_append (wseg_of s187A_3) (wseg_append (wseg_of s187A_4) (wseg_append (wseg_of s187A_5) (wseg_append (wseg_of s187A_6) (wseg_append (wseg_of s187A_7) (wseg_append (wseg_of s187A_8) (wseg_append (wseg_of s187A_9) (wseg_append (wseg_of s187A_10) (wseg_append (wseg_of s187A_11) (wseg_append (wseg_of s187A_12) (wseg_append (wseg_of s187A_13) (wseg_append (wseg_of s187A_14) (wseg_of s187A_15)))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s187B_0) (wseg_append (wseg_of s187B_1) (wseg_append (wseg_of s187B_2) (wseg_append (wseg_of s187B_3) (wseg_append (wseg_of s187B_4) (wseg_append (wseg_of s187B_5) (wseg_append (wseg_of s187B_6) (wseg_append (wseg_of s187B_7) (wseg_append (wseg_of s187B_8) (wseg_append (wseg_of s187B_9) (wseg_append (wseg_of s187B_10) (wseg_append (wseg_of s187B_11) (wseg_append (wseg_of s187B_12) (wseg_append (wseg_of s187B_13) (wseg_append (wseg_of s187B_14) (wseg_of s187B_15))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t188A : List Tok := t188A_0 ++ (t188A_1 ++ (t188A_2 ++ (t188A_3 ++ (t188A_4 ++ (t188A_5 ++ (t188A_6 ++ (t188A_7 ++ (t188A_8 ++ (t188A_9 ++ (t188A_10 ++ (t188A_11 ++ (t188A_12 ++ (t188A_13 ++ (t188A_14 ++ (t188A_15 ++ (t188A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t188B : List Tok := t188B_0 ++ (t188B_1 ++ (t188B_2 ++ (t188B_3 ++ (t188B_4 ++ (t188B_5 ++ (t188B_6 ++ (t188B_7 ++ (t188B_8 ++ (t188B_9 ++ (t188B_10 ++ (t188B_11 ++ (t188B_12 ++ (t188B_13 ++ (t188B_14 ++ (t188B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 188：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run188 : (nbRun P nb188 0 kN188 t188A).1 = true ∧ (nbRun P nb188 1 kN188 t188B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s188A_0) (wseg_append (wseg_of s188A_1) (wseg_append (wseg_of s188A_2) (wseg_append (wseg_of s188A_3) (wseg_append (wseg_of s188A_4) (wseg_append (wseg_of s188A_5) (wseg_append (wseg_of s188A_6) (wseg_append (wseg_of s188A_7) (wseg_append (wseg_of s188A_8) (wseg_append (wseg_of s188A_9) (wseg_append (wseg_of s188A_10) (wseg_append (wseg_of s188A_11) (wseg_append (wseg_of s188A_12) (wseg_append (wseg_of s188A_13) (wseg_append (wseg_of s188A_14) (wseg_append (wseg_of s188A_15) (wseg_of s188A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s188B_0) (wseg_append (wseg_of s188B_1) (wseg_append (wseg_of s188B_2) (wseg_append (wseg_of s188B_3) (wseg_append (wseg_of s188B_4) (wseg_append (wseg_of s188B_5) (wseg_append (wseg_of s188B_6) (wseg_append (wseg_of s188B_7) (wseg_append (wseg_of s188B_8) (wseg_append (wseg_of s188B_9) (wseg_append (wseg_of s188B_10) (wseg_append (wseg_of s188B_11) (wseg_append (wseg_of s188B_12) (wseg_append (wseg_of s188B_13) (wseg_append (wseg_of s188B_14) (wseg_of s188B_15))))))))))))))))⟩

end PackLean.D40.Tet
