-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS049_0
import PackLean.D40.K.FarS049_1
import PackLean.D40.K.FarS049_2
import PackLean.D40.K.FarS049_3
import PackLean.D40.K.FarS049_4
import PackLean.D40.K.FarS049_5
import PackLean.D40.K.FarS049_6
import PackLean.D40.K.FarS049_7
import PackLean.D40.K.FarS049_8
import PackLean.D40.K.FarS049_9
import PackLean.D40.K.FarS049_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t162A : List Tok := t162A_0 ++ (t162A_1 ++ (t162A_2 ++ (t162A_3 ++ (t162A_4 ++ (t162A_5 ++ (t162A_6 ++ (t162A_7 ++ (t162A_8 ++ (t162A_9 ++ (t162A_10 ++ (t162A_11 ++ (t162A_12 ++ (t162A_13 ++ (t162A_14 ++ (t162A_15 ++ (t162A_16 ++ (t162A_17 ++ (t162A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t162B : List Tok := t162B_0 ++ (t162B_1 ++ (t162B_2 ++ (t162B_3 ++ (t162B_4 ++ (t162B_5 ++ (t162B_6 ++ (t162B_7 ++ (t162B_8 ++ (t162B_9 ++ (t162B_10 ++ (t162B_11 ++ (t162B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 162：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run162 : (nbRun P nb162 0 kN162 t162A).1 = true ∧ (nbRun P nb162 1 kN162 t162B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s162A_0) (wseg_append (wseg_of s162A_1) (wseg_append (wseg_of s162A_2) (wseg_append (wseg_of s162A_3) (wseg_append (wseg_of s162A_4) (wseg_append (wseg_of s162A_5) (wseg_append (wseg_of s162A_6) (wseg_append (wseg_of s162A_7) (wseg_append (wseg_of s162A_8) (wseg_append (wseg_of s162A_9) (wseg_append (wseg_of s162A_10) (wseg_append (wseg_of s162A_11) (wseg_append (wseg_of s162A_12) (wseg_append (wseg_of s162A_13) (wseg_append (wseg_of s162A_14) (wseg_append (wseg_of s162A_15) (wseg_append (wseg_of s162A_16) (wseg_append (wseg_of s162A_17) (wseg_of s162A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s162B_0) (wseg_append (wseg_of s162B_1) (wseg_append (wseg_of s162B_2) (wseg_append (wseg_of s162B_3) (wseg_append (wseg_of s162B_4) (wseg_append (wseg_of s162B_5) (wseg_append (wseg_of s162B_6) (wseg_append (wseg_of s162B_7) (wseg_append (wseg_of s162B_8) (wseg_append (wseg_of s162B_9) (wseg_append (wseg_of s162B_10) (wseg_append (wseg_of s162B_11) (wseg_of s162B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t163A : List Tok := t163A_0 ++ (t163A_1 ++ (t163A_2 ++ (t163A_3 ++ (t163A_4 ++ (t163A_5 ++ (t163A_6 ++ (t163A_7 ++ (t163A_8 ++ (t163A_9 ++ (t163A_10 ++ (t163A_11 ++ (t163A_12 ++ (t163A_13 ++ (t163A_14 ++ (t163A_15 ++ (t163A_16 ++ (t163A_17 ++ (t163A_18 ++ (t163A_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t163B : List Tok := t163B_0 ++ (t163B_1 ++ (t163B_2 ++ (t163B_3 ++ (t163B_4 ++ (t163B_5 ++ (t163B_6 ++ (t163B_7 ++ (t163B_8 ++ (t163B_9 ++ (t163B_10 ++ (t163B_11 ++ (t163B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 163：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run163 : (nbRun P nb163 0 kN163 t163A).1 = true ∧ (nbRun P nb163 1 kN163 t163B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s163A_0) (wseg_append (wseg_of s163A_1) (wseg_append (wseg_of s163A_2) (wseg_append (wseg_of s163A_3) (wseg_append (wseg_of s163A_4) (wseg_append (wseg_of s163A_5) (wseg_append (wseg_of s163A_6) (wseg_append (wseg_of s163A_7) (wseg_append (wseg_of s163A_8) (wseg_append (wseg_of s163A_9) (wseg_append (wseg_of s163A_10) (wseg_append (wseg_of s163A_11) (wseg_append (wseg_of s163A_12) (wseg_append (wseg_of s163A_13) (wseg_append (wseg_of s163A_14) (wseg_append (wseg_of s163A_15) (wseg_append (wseg_of s163A_16) (wseg_append (wseg_of s163A_17) (wseg_append (wseg_of s163A_18) (wseg_of s163A_19)))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s163B_0) (wseg_append (wseg_of s163B_1) (wseg_append (wseg_of s163B_2) (wseg_append (wseg_of s163B_3) (wseg_append (wseg_of s163B_4) (wseg_append (wseg_of s163B_5) (wseg_append (wseg_of s163B_6) (wseg_append (wseg_of s163B_7) (wseg_append (wseg_of s163B_8) (wseg_append (wseg_of s163B_9) (wseg_append (wseg_of s163B_10) (wseg_append (wseg_of s163B_11) (wseg_of s163B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t164A : List Tok := t164A_0 ++ (t164A_1 ++ (t164A_2 ++ (t164A_3 ++ (t164A_4 ++ (t164A_5 ++ (t164A_6 ++ (t164A_7 ++ (t164A_8 ++ (t164A_9 ++ (t164A_10 ++ (t164A_11 ++ (t164A_12 ++ (t164A_13 ++ (t164A_14 ++ (t164A_15 ++ (t164A_16 ++ (t164A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t164B : List Tok := t164B_0 ++ (t164B_1 ++ (t164B_2 ++ (t164B_3 ++ (t164B_4 ++ (t164B_5 ++ (t164B_6 ++ (t164B_7 ++ (t164B_8 ++ (t164B_9 ++ (t164B_10 ++ (t164B_11 ++ (t164B_12 ++ (t164B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 164：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run164 : (nbRun P nb164 0 kN164 t164A).1 = true ∧ (nbRun P nb164 1 kN164 t164B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s164A_0) (wseg_append (wseg_of s164A_1) (wseg_append (wseg_of s164A_2) (wseg_append (wseg_of s164A_3) (wseg_append (wseg_of s164A_4) (wseg_append (wseg_of s164A_5) (wseg_append (wseg_of s164A_6) (wseg_append (wseg_of s164A_7) (wseg_append (wseg_of s164A_8) (wseg_append (wseg_of s164A_9) (wseg_append (wseg_of s164A_10) (wseg_append (wseg_of s164A_11) (wseg_append (wseg_of s164A_12) (wseg_append (wseg_of s164A_13) (wseg_append (wseg_of s164A_14) (wseg_append (wseg_of s164A_15) (wseg_append (wseg_of s164A_16) (wseg_of s164A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s164B_0) (wseg_append (wseg_of s164B_1) (wseg_append (wseg_of s164B_2) (wseg_append (wseg_of s164B_3) (wseg_append (wseg_of s164B_4) (wseg_append (wseg_of s164B_5) (wseg_append (wseg_of s164B_6) (wseg_append (wseg_of s164B_7) (wseg_append (wseg_of s164B_8) (wseg_append (wseg_of s164B_9) (wseg_append (wseg_of s164B_10) (wseg_append (wseg_of s164B_11) (wseg_append (wseg_of s164B_12) (wseg_of s164B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t165A : List Tok := t165A_0 ++ (t165A_1 ++ (t165A_2 ++ (t165A_3 ++ (t165A_4 ++ (t165A_5 ++ (t165A_6 ++ (t165A_7 ++ (t165A_8 ++ (t165A_9 ++ (t165A_10 ++ (t165A_11 ++ (t165A_12 ++ (t165A_13 ++ (t165A_14 ++ (t165A_15 ++ (t165A_16 ++ (t165A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t165B : List Tok := t165B_0 ++ (t165B_1 ++ (t165B_2 ++ (t165B_3 ++ (t165B_4 ++ (t165B_5 ++ (t165B_6 ++ (t165B_7 ++ (t165B_8 ++ (t165B_9 ++ (t165B_10 ++ (t165B_11 ++ (t165B_12 ++ (t165B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 165：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run165 : (nbRun P nb165 0 kN165 t165A).1 = true ∧ (nbRun P nb165 1 kN165 t165B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s165A_0) (wseg_append (wseg_of s165A_1) (wseg_append (wseg_of s165A_2) (wseg_append (wseg_of s165A_3) (wseg_append (wseg_of s165A_4) (wseg_append (wseg_of s165A_5) (wseg_append (wseg_of s165A_6) (wseg_append (wseg_of s165A_7) (wseg_append (wseg_of s165A_8) (wseg_append (wseg_of s165A_9) (wseg_append (wseg_of s165A_10) (wseg_append (wseg_of s165A_11) (wseg_append (wseg_of s165A_12) (wseg_append (wseg_of s165A_13) (wseg_append (wseg_of s165A_14) (wseg_append (wseg_of s165A_15) (wseg_append (wseg_of s165A_16) (wseg_of s165A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s165B_0) (wseg_append (wseg_of s165B_1) (wseg_append (wseg_of s165B_2) (wseg_append (wseg_of s165B_3) (wseg_append (wseg_of s165B_4) (wseg_append (wseg_of s165B_5) (wseg_append (wseg_of s165B_6) (wseg_append (wseg_of s165B_7) (wseg_append (wseg_of s165B_8) (wseg_append (wseg_of s165B_9) (wseg_append (wseg_of s165B_10) (wseg_append (wseg_of s165B_11) (wseg_append (wseg_of s165B_12) (wseg_of s165B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t166A : List Tok := t166A_0 ++ (t166A_1 ++ (t166A_2 ++ (t166A_3 ++ (t166A_4 ++ (t166A_5 ++ (t166A_6 ++ (t166A_7 ++ (t166A_8 ++ (t166A_9 ++ (t166A_10 ++ (t166A_11 ++ (t166A_12 ++ (t166A_13 ++ (t166A_14 ++ (t166A_15 ++ (t166A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t166B : List Tok := t166B_0 ++ (t166B_1 ++ (t166B_2 ++ (t166B_3 ++ (t166B_4 ++ (t166B_5 ++ (t166B_6 ++ (t166B_7 ++ (t166B_8 ++ (t166B_9 ++ (t166B_10 ++ (t166B_11 ++ (t166B_12 ++ (t166B_13 ++ (t166B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 166：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run166 : (nbRun P nb166 0 kN166 t166A).1 = true ∧ (nbRun P nb166 1 kN166 t166B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s166A_0) (wseg_append (wseg_of s166A_1) (wseg_append (wseg_of s166A_2) (wseg_append (wseg_of s166A_3) (wseg_append (wseg_of s166A_4) (wseg_append (wseg_of s166A_5) (wseg_append (wseg_of s166A_6) (wseg_append (wseg_of s166A_7) (wseg_append (wseg_of s166A_8) (wseg_append (wseg_of s166A_9) (wseg_append (wseg_of s166A_10) (wseg_append (wseg_of s166A_11) (wseg_append (wseg_of s166A_12) (wseg_append (wseg_of s166A_13) (wseg_append (wseg_of s166A_14) (wseg_append (wseg_of s166A_15) (wseg_of s166A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s166B_0) (wseg_append (wseg_of s166B_1) (wseg_append (wseg_of s166B_2) (wseg_append (wseg_of s166B_3) (wseg_append (wseg_of s166B_4) (wseg_append (wseg_of s166B_5) (wseg_append (wseg_of s166B_6) (wseg_append (wseg_of s166B_7) (wseg_append (wseg_of s166B_8) (wseg_append (wseg_of s166B_9) (wseg_append (wseg_of s166B_10) (wseg_append (wseg_of s166B_11) (wseg_append (wseg_of s166B_12) (wseg_append (wseg_of s166B_13) (wseg_of s166B_14)))))))))))))))⟩

end PackLean.D40.Tet
