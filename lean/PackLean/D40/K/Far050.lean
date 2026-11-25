-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS050_0
import PackLean.D40.K.FarS050_1
import PackLean.D40.K.FarS050_2
import PackLean.D40.K.FarS050_3
import PackLean.D40.K.FarS050_4
import PackLean.D40.K.FarS050_5
import PackLean.D40.K.FarS050_6
import PackLean.D40.K.FarS050_7
import PackLean.D40.K.FarS050_8
import PackLean.D40.K.FarS050_9
import PackLean.D40.K.FarS050_10
import PackLean.D40.K.FarS050_11
import PackLean.D40.K.FarS050_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t167A : List Tok := t167A_0 ++ (t167A_1 ++ (t167A_2 ++ (t167A_3 ++ (t167A_4 ++ (t167A_5 ++ (t167A_6 ++ (t167A_7 ++ (t167A_8 ++ (t167A_9 ++ (t167A_10 ++ (t167A_11 ++ (t167A_12 ++ (t167A_13 ++ (t167A_14 ++ (t167A_15 ++ (t167A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t167B : List Tok := t167B_0 ++ (t167B_1 ++ (t167B_2 ++ (t167B_3 ++ (t167B_4 ++ (t167B_5 ++ (t167B_6 ++ (t167B_7 ++ (t167B_8 ++ (t167B_9 ++ (t167B_10 ++ (t167B_11 ++ (t167B_12 ++ (t167B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 167：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run167 : (nbRun P nb167 0 kN167 t167A).1 = true ∧ (nbRun P nb167 1 kN167 t167B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s167A_0) (wseg_append (wseg_of s167A_1) (wseg_append (wseg_of s167A_2) (wseg_append (wseg_of s167A_3) (wseg_append (wseg_of s167A_4) (wseg_append (wseg_of s167A_5) (wseg_append (wseg_of s167A_6) (wseg_append (wseg_of s167A_7) (wseg_append (wseg_of s167A_8) (wseg_append (wseg_of s167A_9) (wseg_append (wseg_of s167A_10) (wseg_append (wseg_of s167A_11) (wseg_append (wseg_of s167A_12) (wseg_append (wseg_of s167A_13) (wseg_append (wseg_of s167A_14) (wseg_append (wseg_of s167A_15) (wseg_of s167A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s167B_0) (wseg_append (wseg_of s167B_1) (wseg_append (wseg_of s167B_2) (wseg_append (wseg_of s167B_3) (wseg_append (wseg_of s167B_4) (wseg_append (wseg_of s167B_5) (wseg_append (wseg_of s167B_6) (wseg_append (wseg_of s167B_7) (wseg_append (wseg_of s167B_8) (wseg_append (wseg_of s167B_9) (wseg_append (wseg_of s167B_10) (wseg_append (wseg_of s167B_11) (wseg_append (wseg_of s167B_12) (wseg_of s167B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t168A : List Tok := t168A_0 ++ (t168A_1 ++ (t168A_2 ++ (t168A_3 ++ (t168A_4 ++ (t168A_5 ++ (t168A_6 ++ (t168A_7 ++ (t168A_8 ++ (t168A_9 ++ (t168A_10 ++ (t168A_11 ++ (t168A_12 ++ (t168A_13 ++ (t168A_14 ++ (t168A_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t168B : List Tok := t168B_0 ++ (t168B_1 ++ (t168B_2 ++ (t168B_3 ++ (t168B_4 ++ (t168B_5 ++ (t168B_6 ++ (t168B_7 ++ (t168B_8 ++ (t168B_9 ++ (t168B_10 ++ (t168B_11 ++ (t168B_12 ++ (t168B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 168：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run168 : (nbRun P nb168 0 kN168 t168A).1 = true ∧ (nbRun P nb168 1 kN168 t168B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s168A_0) (wseg_append (wseg_of s168A_1) (wseg_append (wseg_of s168A_2) (wseg_append (wseg_of s168A_3) (wseg_append (wseg_of s168A_4) (wseg_append (wseg_of s168A_5) (wseg_append (wseg_of s168A_6) (wseg_append (wseg_of s168A_7) (wseg_append (wseg_of s168A_8) (wseg_append (wseg_of s168A_9) (wseg_append (wseg_of s168A_10) (wseg_append (wseg_of s168A_11) (wseg_append (wseg_of s168A_12) (wseg_append (wseg_of s168A_13) (wseg_append (wseg_of s168A_14) (wseg_of s168A_15)))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s168B_0) (wseg_append (wseg_of s168B_1) (wseg_append (wseg_of s168B_2) (wseg_append (wseg_of s168B_3) (wseg_append (wseg_of s168B_4) (wseg_append (wseg_of s168B_5) (wseg_append (wseg_of s168B_6) (wseg_append (wseg_of s168B_7) (wseg_append (wseg_of s168B_8) (wseg_append (wseg_of s168B_9) (wseg_append (wseg_of s168B_10) (wseg_append (wseg_of s168B_11) (wseg_append (wseg_of s168B_12) (wseg_of s168B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t169A : List Tok := t169A_0 ++ (t169A_1 ++ (t169A_2 ++ (t169A_3 ++ (t169A_4 ++ (t169A_5 ++ (t169A_6 ++ (t169A_7 ++ (t169A_8 ++ (t169A_9 ++ (t169A_10 ++ (t169A_11 ++ (t169A_12 ++ (t169A_13 ++ (t169A_14 ++ (t169A_15 ++ (t169A_16 ++ (t169A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t169B : List Tok := t169B_0 ++ (t169B_1 ++ (t169B_2 ++ (t169B_3 ++ (t169B_4 ++ (t169B_5 ++ (t169B_6 ++ (t169B_7 ++ (t169B_8 ++ (t169B_9 ++ (t169B_10 ++ (t169B_11 ++ (t169B_12 ++ (t169B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 169：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run169 : (nbRun P nb169 0 kN169 t169A).1 = true ∧ (nbRun P nb169 1 kN169 t169B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s169A_0) (wseg_append (wseg_of s169A_1) (wseg_append (wseg_of s169A_2) (wseg_append (wseg_of s169A_3) (wseg_append (wseg_of s169A_4) (wseg_append (wseg_of s169A_5) (wseg_append (wseg_of s169A_6) (wseg_append (wseg_of s169A_7) (wseg_append (wseg_of s169A_8) (wseg_append (wseg_of s169A_9) (wseg_append (wseg_of s169A_10) (wseg_append (wseg_of s169A_11) (wseg_append (wseg_of s169A_12) (wseg_append (wseg_of s169A_13) (wseg_append (wseg_of s169A_14) (wseg_append (wseg_of s169A_15) (wseg_append (wseg_of s169A_16) (wseg_of s169A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s169B_0) (wseg_append (wseg_of s169B_1) (wseg_append (wseg_of s169B_2) (wseg_append (wseg_of s169B_3) (wseg_append (wseg_of s169B_4) (wseg_append (wseg_of s169B_5) (wseg_append (wseg_of s169B_6) (wseg_append (wseg_of s169B_7) (wseg_append (wseg_of s169B_8) (wseg_append (wseg_of s169B_9) (wseg_append (wseg_of s169B_10) (wseg_append (wseg_of s169B_11) (wseg_append (wseg_of s169B_12) (wseg_of s169B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170A : List Tok := t170A_0 ++ (t170A_1 ++ (t170A_2 ++ (t170A_3 ++ (t170A_4 ++ (t170A_5 ++ (t170A_6 ++ (t170A_7 ++ (t170A_8 ++ (t170A_9 ++ (t170A_10 ++ (t170A_11 ++ (t170A_12 ++ (t170A_13 ++ (t170A_14 ++ (t170A_15 ++ (t170A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t170B : List Tok := t170B_0 ++ (t170B_1 ++ (t170B_2 ++ (t170B_3 ++ (t170B_4 ++ (t170B_5 ++ (t170B_6 ++ (t170B_7 ++ (t170B_8 ++ (t170B_9 ++ (t170B_10 ++ (t170B_11 ++ (t170B_12 ++ (t170B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 170：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run170 : (nbRun P nb170 0 kN170 t170A).1 = true ∧ (nbRun P nb170 1 kN170 t170B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s170A_0) (wseg_append (wseg_of s170A_1) (wseg_append (wseg_of s170A_2) (wseg_append (wseg_of s170A_3) (wseg_append (wseg_of s170A_4) (wseg_append (wseg_of s170A_5) (wseg_append (wseg_of s170A_6) (wseg_append (wseg_of s170A_7) (wseg_append (wseg_of s170A_8) (wseg_append (wseg_of s170A_9) (wseg_append (wseg_of s170A_10) (wseg_append (wseg_of s170A_11) (wseg_append (wseg_of s170A_12) (wseg_append (wseg_of s170A_13) (wseg_append (wseg_of s170A_14) (wseg_append (wseg_of s170A_15) (wseg_of s170A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s170B_0) (wseg_append (wseg_of s170B_1) (wseg_append (wseg_of s170B_2) (wseg_append (wseg_of s170B_3) (wseg_append (wseg_of s170B_4) (wseg_append (wseg_of s170B_5) (wseg_append (wseg_of s170B_6) (wseg_append (wseg_of s170B_7) (wseg_append (wseg_of s170B_8) (wseg_append (wseg_of s170B_9) (wseg_append (wseg_of s170B_10) (wseg_append (wseg_of s170B_11) (wseg_append (wseg_of s170B_12) (wseg_of s170B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t171A : List Tok := t171A_0 ++ (t171A_1 ++ (t171A_2 ++ (t171A_3 ++ (t171A_4 ++ (t171A_5 ++ (t171A_6 ++ (t171A_7 ++ (t171A_8 ++ (t171A_9 ++ (t171A_10 ++ (t171A_11 ++ (t171A_12 ++ (t171A_13 ++ (t171A_14 ++ (t171A_15 ++ (t171A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t171B : List Tok := t171B_0 ++ (t171B_1 ++ (t171B_2 ++ (t171B_3 ++ (t171B_4 ++ (t171B_5 ++ (t171B_6 ++ (t171B_7 ++ (t171B_8 ++ (t171B_9 ++ (t171B_10 ++ (t171B_11 ++ (t171B_12 ++ (t171B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 171：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run171 : (nbRun P nb171 0 kN171 t171A).1 = true ∧ (nbRun P nb171 1 kN171 t171B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s171A_0) (wseg_append (wseg_of s171A_1) (wseg_append (wseg_of s171A_2) (wseg_append (wseg_of s171A_3) (wseg_append (wseg_of s171A_4) (wseg_append (wseg_of s171A_5) (wseg_append (wseg_of s171A_6) (wseg_append (wseg_of s171A_7) (wseg_append (wseg_of s171A_8) (wseg_append (wseg_of s171A_9) (wseg_append (wseg_of s171A_10) (wseg_append (wseg_of s171A_11) (wseg_append (wseg_of s171A_12) (wseg_append (wseg_of s171A_13) (wseg_append (wseg_of s171A_14) (wseg_append (wseg_of s171A_15) (wseg_of s171A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s171B_0) (wseg_append (wseg_of s171B_1) (wseg_append (wseg_of s171B_2) (wseg_append (wseg_of s171B_3) (wseg_append (wseg_of s171B_4) (wseg_append (wseg_of s171B_5) (wseg_append (wseg_of s171B_6) (wseg_append (wseg_of s171B_7) (wseg_append (wseg_of s171B_8) (wseg_append (wseg_of s171B_9) (wseg_append (wseg_of s171B_10) (wseg_append (wseg_of s171B_11) (wseg_append (wseg_of s171B_12) (wseg_of s171B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t172A : List Tok := t172A_0 ++ (t172A_1 ++ (t172A_2 ++ (t172A_3 ++ (t172A_4 ++ (t172A_5 ++ (t172A_6 ++ (t172A_7 ++ (t172A_8 ++ (t172A_9 ++ (t172A_10 ++ (t172A_11 ++ (t172A_12 ++ (t172A_13 ++ (t172A_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t172B : List Tok := t172B_0 ++ (t172B_1 ++ (t172B_2 ++ (t172B_3 ++ (t172B_4 ++ (t172B_5 ++ (t172B_6 ++ (t172B_7 ++ (t172B_8 ++ (t172B_9 ++ (t172B_10 ++ (t172B_11 ++ (t172B_12 ++ (t172B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 172：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run172 : (nbRun P nb172 0 kN172 t172A).1 = true ∧ (nbRun P nb172 1 kN172 t172B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s172A_0) (wseg_append (wseg_of s172A_1) (wseg_append (wseg_of s172A_2) (wseg_append (wseg_of s172A_3) (wseg_append (wseg_of s172A_4) (wseg_append (wseg_of s172A_5) (wseg_append (wseg_of s172A_6) (wseg_append (wseg_of s172A_7) (wseg_append (wseg_of s172A_8) (wseg_append (wseg_of s172A_9) (wseg_append (wseg_of s172A_10) (wseg_append (wseg_of s172A_11) (wseg_append (wseg_of s172A_12) (wseg_append (wseg_of s172A_13) (wseg_of s172A_14))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s172B_0) (wseg_append (wseg_of s172B_1) (wseg_append (wseg_of s172B_2) (wseg_append (wseg_of s172B_3) (wseg_append (wseg_of s172B_4) (wseg_append (wseg_of s172B_5) (wseg_append (wseg_of s172B_6) (wseg_append (wseg_of s172B_7) (wseg_append (wseg_of s172B_8) (wseg_append (wseg_of s172B_9) (wseg_append (wseg_of s172B_10) (wseg_append (wseg_of s172B_11) (wseg_append (wseg_of s172B_12) (wseg_of s172B_13))))))))))))))⟩

end PackLean.D40.Tet
