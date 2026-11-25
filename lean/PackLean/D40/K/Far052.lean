-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS052_0
import PackLean.D40.K.FarS052_1
import PackLean.D40.K.FarS052_2
import PackLean.D40.K.FarS052_3
import PackLean.D40.K.FarS052_4
import PackLean.D40.K.FarS052_5
import PackLean.D40.K.FarS052_6
import PackLean.D40.K.FarS052_7
import PackLean.D40.K.FarS052_8
import PackLean.D40.K.FarS052_9
import PackLean.D40.K.FarS052_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t179A : List Tok := t179A_0 ++ (t179A_1 ++ (t179A_2 ++ (t179A_3 ++ (t179A_4 ++ (t179A_5 ++ (t179A_6 ++ (t179A_7 ++ (t179A_8 ++ (t179A_9 ++ (t179A_10 ++ (t179A_11 ++ (t179A_12 ++ (t179A_13 ++ (t179A_14 ++ (t179A_15 ++ (t179A_16 ++ (t179A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t179B : List Tok := t179B_0 ++ (t179B_1 ++ (t179B_2 ++ (t179B_3 ++ (t179B_4 ++ (t179B_5 ++ (t179B_6 ++ (t179B_7 ++ (t179B_8 ++ (t179B_9 ++ (t179B_10 ++ (t179B_11 ++ (t179B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 179：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run179 : (nbRun P nb179 0 kN179 t179A).1 = true ∧ (nbRun P nb179 1 kN179 t179B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s179A_0) (wseg_append (wseg_of s179A_1) (wseg_append (wseg_of s179A_2) (wseg_append (wseg_of s179A_3) (wseg_append (wseg_of s179A_4) (wseg_append (wseg_of s179A_5) (wseg_append (wseg_of s179A_6) (wseg_append (wseg_of s179A_7) (wseg_append (wseg_of s179A_8) (wseg_append (wseg_of s179A_9) (wseg_append (wseg_of s179A_10) (wseg_append (wseg_of s179A_11) (wseg_append (wseg_of s179A_12) (wseg_append (wseg_of s179A_13) (wseg_append (wseg_of s179A_14) (wseg_append (wseg_of s179A_15) (wseg_append (wseg_of s179A_16) (wseg_of s179A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s179B_0) (wseg_append (wseg_of s179B_1) (wseg_append (wseg_of s179B_2) (wseg_append (wseg_of s179B_3) (wseg_append (wseg_of s179B_4) (wseg_append (wseg_of s179B_5) (wseg_append (wseg_of s179B_6) (wseg_append (wseg_of s179B_7) (wseg_append (wseg_of s179B_8) (wseg_append (wseg_of s179B_9) (wseg_append (wseg_of s179B_10) (wseg_append (wseg_of s179B_11) (wseg_of s179B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180A : List Tok := t180A_0 ++ (t180A_1 ++ (t180A_2 ++ (t180A_3 ++ (t180A_4 ++ (t180A_5 ++ (t180A_6 ++ (t180A_7 ++ (t180A_8 ++ (t180A_9 ++ (t180A_10 ++ (t180A_11 ++ (t180A_12 ++ (t180A_13 ++ (t180A_14 ++ (t180A_15 ++ (t180A_16 ++ (t180A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t180B : List Tok := t180B_0 ++ (t180B_1 ++ (t180B_2 ++ (t180B_3 ++ (t180B_4 ++ (t180B_5 ++ (t180B_6 ++ (t180B_7 ++ (t180B_8 ++ (t180B_9 ++ (t180B_10 ++ (t180B_11 ++ (t180B_12 ++ (t180B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 180：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run180 : (nbRun P nb180 0 kN180 t180A).1 = true ∧ (nbRun P nb180 1 kN180 t180B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s180A_0) (wseg_append (wseg_of s180A_1) (wseg_append (wseg_of s180A_2) (wseg_append (wseg_of s180A_3) (wseg_append (wseg_of s180A_4) (wseg_append (wseg_of s180A_5) (wseg_append (wseg_of s180A_6) (wseg_append (wseg_of s180A_7) (wseg_append (wseg_of s180A_8) (wseg_append (wseg_of s180A_9) (wseg_append (wseg_of s180A_10) (wseg_append (wseg_of s180A_11) (wseg_append (wseg_of s180A_12) (wseg_append (wseg_of s180A_13) (wseg_append (wseg_of s180A_14) (wseg_append (wseg_of s180A_15) (wseg_append (wseg_of s180A_16) (wseg_of s180A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s180B_0) (wseg_append (wseg_of s180B_1) (wseg_append (wseg_of s180B_2) (wseg_append (wseg_of s180B_3) (wseg_append (wseg_of s180B_4) (wseg_append (wseg_of s180B_5) (wseg_append (wseg_of s180B_6) (wseg_append (wseg_of s180B_7) (wseg_append (wseg_of s180B_8) (wseg_append (wseg_of s180B_9) (wseg_append (wseg_of s180B_10) (wseg_append (wseg_of s180B_11) (wseg_append (wseg_of s180B_12) (wseg_of s180B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181A : List Tok := t181A_0 ++ (t181A_1 ++ (t181A_2 ++ (t181A_3 ++ (t181A_4 ++ (t181A_5 ++ (t181A_6 ++ (t181A_7 ++ (t181A_8 ++ (t181A_9 ++ (t181A_10 ++ (t181A_11 ++ (t181A_12 ++ (t181A_13 ++ (t181A_14 ++ (t181A_15 ++ (t181A_16 ++ (t181A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t181B : List Tok := t181B_0 ++ (t181B_1 ++ (t181B_2 ++ (t181B_3 ++ (t181B_4 ++ (t181B_5 ++ (t181B_6 ++ (t181B_7 ++ (t181B_8 ++ (t181B_9 ++ (t181B_10 ++ (t181B_11 ++ (t181B_12 ++ (t181B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 181：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run181 : (nbRun P nb181 0 kN181 t181A).1 = true ∧ (nbRun P nb181 1 kN181 t181B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s181A_0) (wseg_append (wseg_of s181A_1) (wseg_append (wseg_of s181A_2) (wseg_append (wseg_of s181A_3) (wseg_append (wseg_of s181A_4) (wseg_append (wseg_of s181A_5) (wseg_append (wseg_of s181A_6) (wseg_append (wseg_of s181A_7) (wseg_append (wseg_of s181A_8) (wseg_append (wseg_of s181A_9) (wseg_append (wseg_of s181A_10) (wseg_append (wseg_of s181A_11) (wseg_append (wseg_of s181A_12) (wseg_append (wseg_of s181A_13) (wseg_append (wseg_of s181A_14) (wseg_append (wseg_of s181A_15) (wseg_append (wseg_of s181A_16) (wseg_of s181A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s181B_0) (wseg_append (wseg_of s181B_1) (wseg_append (wseg_of s181B_2) (wseg_append (wseg_of s181B_3) (wseg_append (wseg_of s181B_4) (wseg_append (wseg_of s181B_5) (wseg_append (wseg_of s181B_6) (wseg_append (wseg_of s181B_7) (wseg_append (wseg_of s181B_8) (wseg_append (wseg_of s181B_9) (wseg_append (wseg_of s181B_10) (wseg_append (wseg_of s181B_11) (wseg_append (wseg_of s181B_12) (wseg_of s181B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t182A : List Tok := t182A_0 ++ (t182A_1 ++ (t182A_2 ++ (t182A_3 ++ (t182A_4 ++ (t182A_5 ++ (t182A_6 ++ (t182A_7 ++ (t182A_8 ++ (t182A_9 ++ (t182A_10 ++ (t182A_11 ++ (t182A_12 ++ (t182A_13 ++ (t182A_14 ++ (t182A_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t182B : List Tok := t182B_0 ++ (t182B_1 ++ (t182B_2 ++ (t182B_3 ++ (t182B_4 ++ (t182B_5 ++ (t182B_6 ++ (t182B_7 ++ (t182B_8 ++ (t182B_9 ++ (t182B_10 ++ (t182B_11 ++ (t182B_12 ++ (t182B_13 ++ (t182B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 182：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run182 : (nbRun P nb182 0 kN182 t182A).1 = true ∧ (nbRun P nb182 1 kN182 t182B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s182A_0) (wseg_append (wseg_of s182A_1) (wseg_append (wseg_of s182A_2) (wseg_append (wseg_of s182A_3) (wseg_append (wseg_of s182A_4) (wseg_append (wseg_of s182A_5) (wseg_append (wseg_of s182A_6) (wseg_append (wseg_of s182A_7) (wseg_append (wseg_of s182A_8) (wseg_append (wseg_of s182A_9) (wseg_append (wseg_of s182A_10) (wseg_append (wseg_of s182A_11) (wseg_append (wseg_of s182A_12) (wseg_append (wseg_of s182A_13) (wseg_append (wseg_of s182A_14) (wseg_of s182A_15)))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s182B_0) (wseg_append (wseg_of s182B_1) (wseg_append (wseg_of s182B_2) (wseg_append (wseg_of s182B_3) (wseg_append (wseg_of s182B_4) (wseg_append (wseg_of s182B_5) (wseg_append (wseg_of s182B_6) (wseg_append (wseg_of s182B_7) (wseg_append (wseg_of s182B_8) (wseg_append (wseg_of s182B_9) (wseg_append (wseg_of s182B_10) (wseg_append (wseg_of s182B_11) (wseg_append (wseg_of s182B_12) (wseg_append (wseg_of s182B_13) (wseg_of s182B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t183A : List Tok := t183A_0 ++ (t183A_1 ++ (t183A_2 ++ (t183A_3 ++ (t183A_4 ++ (t183A_5 ++ (t183A_6 ++ (t183A_7 ++ (t183A_8 ++ (t183A_9 ++ (t183A_10 ++ (t183A_11 ++ (t183A_12 ++ (t183A_13 ++ (t183A_14 ++ (t183A_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t183B : List Tok := t183B_0 ++ (t183B_1 ++ (t183B_2 ++ (t183B_3 ++ (t183B_4 ++ (t183B_5 ++ (t183B_6 ++ (t183B_7 ++ (t183B_8 ++ (t183B_9 ++ (t183B_10 ++ (t183B_11 ++ (t183B_12 ++ (t183B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 183：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run183 : (nbRun P nb183 0 kN183 t183A).1 = true ∧ (nbRun P nb183 1 kN183 t183B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s183A_0) (wseg_append (wseg_of s183A_1) (wseg_append (wseg_of s183A_2) (wseg_append (wseg_of s183A_3) (wseg_append (wseg_of s183A_4) (wseg_append (wseg_of s183A_5) (wseg_append (wseg_of s183A_6) (wseg_append (wseg_of s183A_7) (wseg_append (wseg_of s183A_8) (wseg_append (wseg_of s183A_9) (wseg_append (wseg_of s183A_10) (wseg_append (wseg_of s183A_11) (wseg_append (wseg_of s183A_12) (wseg_append (wseg_of s183A_13) (wseg_append (wseg_of s183A_14) (wseg_of s183A_15)))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s183B_0) (wseg_append (wseg_of s183B_1) (wseg_append (wseg_of s183B_2) (wseg_append (wseg_of s183B_3) (wseg_append (wseg_of s183B_4) (wseg_append (wseg_of s183B_5) (wseg_append (wseg_of s183B_6) (wseg_append (wseg_of s183B_7) (wseg_append (wseg_of s183B_8) (wseg_append (wseg_of s183B_9) (wseg_append (wseg_of s183B_10) (wseg_append (wseg_of s183B_11) (wseg_append (wseg_of s183B_12) (wseg_of s183B_13))))))))))))))⟩

end PackLean.D40.Tet
