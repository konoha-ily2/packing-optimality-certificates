-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS047_0
import PackLean.D40.K.FarS047_1
import PackLean.D40.K.FarS047_2
import PackLean.D40.K.FarS047_3
import PackLean.D40.K.FarS047_4
import PackLean.D40.K.FarS047_5
import PackLean.D40.K.FarS047_6
import PackLean.D40.K.FarS047_7
import PackLean.D40.K.FarS047_8
import PackLean.D40.K.FarS047_9
import PackLean.D40.K.FarS047_10
import PackLean.D40.K.FarS047_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152A : List Tok := t152A_0 ++ (t152A_1 ++ (t152A_2 ++ (t152A_3 ++ (t152A_4 ++ (t152A_5 ++ (t152A_6 ++ (t152A_7 ++ (t152A_8 ++ (t152A_9 ++ (t152A_10 ++ (t152A_11 ++ (t152A_12 ++ (t152A_13 ++ (t152A_14 ++ (t152A_15 ++ (t152A_16 ++ (t152A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t152B : List Tok := t152B_0 ++ (t152B_1 ++ (t152B_2 ++ (t152B_3 ++ (t152B_4 ++ (t152B_5 ++ (t152B_6 ++ (t152B_7 ++ (t152B_8 ++ (t152B_9 ++ (t152B_10 ++ (t152B_11 ++ (t152B_12 ++ (t152B_13 ++ (t152B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 152：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run152 : (nbRun P nb152 0 kN152 t152A).1 = true ∧ (nbRun P nb152 1 kN152 t152B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s152A_0) (wseg_append (wseg_of s152A_1) (wseg_append (wseg_of s152A_2) (wseg_append (wseg_of s152A_3) (wseg_append (wseg_of s152A_4) (wseg_append (wseg_of s152A_5) (wseg_append (wseg_of s152A_6) (wseg_append (wseg_of s152A_7) (wseg_append (wseg_of s152A_8) (wseg_append (wseg_of s152A_9) (wseg_append (wseg_of s152A_10) (wseg_append (wseg_of s152A_11) (wseg_append (wseg_of s152A_12) (wseg_append (wseg_of s152A_13) (wseg_append (wseg_of s152A_14) (wseg_append (wseg_of s152A_15) (wseg_append (wseg_of s152A_16) (wseg_of s152A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s152B_0) (wseg_append (wseg_of s152B_1) (wseg_append (wseg_of s152B_2) (wseg_append (wseg_of s152B_3) (wseg_append (wseg_of s152B_4) (wseg_append (wseg_of s152B_5) (wseg_append (wseg_of s152B_6) (wseg_append (wseg_of s152B_7) (wseg_append (wseg_of s152B_8) (wseg_append (wseg_of s152B_9) (wseg_append (wseg_of s152B_10) (wseg_append (wseg_of s152B_11) (wseg_append (wseg_of s152B_12) (wseg_append (wseg_of s152B_13) (wseg_of s152B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153A : List Tok := t153A_0 ++ (t153A_1 ++ (t153A_2 ++ (t153A_3 ++ (t153A_4 ++ (t153A_5 ++ (t153A_6 ++ (t153A_7 ++ (t153A_8 ++ (t153A_9 ++ (t153A_10 ++ (t153A_11 ++ (t153A_12 ++ (t153A_13 ++ (t153A_14 ++ (t153A_15 ++ (t153A_16 ++ (t153A_17 ++ (t153A_18 ++ (t153A_19 ++ (t153A_20 ++ (t153A_21 ++ (t153A_22 ++ (t153A_23 ++ (t153A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t153B : List Tok := t153B_0 ++ (t153B_1 ++ (t153B_2 ++ (t153B_3 ++ (t153B_4 ++ (t153B_5 ++ (t153B_6 ++ (t153B_7 ++ (t153B_8 ++ (t153B_9 ++ (t153B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 153：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run153 : (nbRun P nb153 0 kN153 t153A).1 = true ∧ (nbRun P nb153 1 kN153 t153B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s153A_0) (wseg_append (wseg_of s153A_1) (wseg_append (wseg_of s153A_2) (wseg_append (wseg_of s153A_3) (wseg_append (wseg_of s153A_4) (wseg_append (wseg_of s153A_5) (wseg_append (wseg_of s153A_6) (wseg_append (wseg_of s153A_7) (wseg_append (wseg_of s153A_8) (wseg_append (wseg_of s153A_9) (wseg_append (wseg_of s153A_10) (wseg_append (wseg_of s153A_11) (wseg_append (wseg_of s153A_12) (wseg_append (wseg_of s153A_13) (wseg_append (wseg_of s153A_14) (wseg_append (wseg_of s153A_15) (wseg_append (wseg_of s153A_16) (wseg_append (wseg_of s153A_17) (wseg_append (wseg_of s153A_18) (wseg_append (wseg_of s153A_19) (wseg_append (wseg_of s153A_20) (wseg_append (wseg_of s153A_21) (wseg_append (wseg_of s153A_22) (wseg_append (wseg_of s153A_23) (wseg_of s153A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s153B_0) (wseg_append (wseg_of s153B_1) (wseg_append (wseg_of s153B_2) (wseg_append (wseg_of s153B_3) (wseg_append (wseg_of s153B_4) (wseg_append (wseg_of s153B_5) (wseg_append (wseg_of s153B_6) (wseg_append (wseg_of s153B_7) (wseg_append (wseg_of s153B_8) (wseg_append (wseg_of s153B_9) (wseg_of s153B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t154A : List Tok := t154A_0 ++ (t154A_1 ++ (t154A_2 ++ (t154A_3 ++ (t154A_4 ++ (t154A_5 ++ (t154A_6 ++ (t154A_7 ++ (t154A_8 ++ (t154A_9 ++ (t154A_10 ++ (t154A_11 ++ (t154A_12 ++ (t154A_13 ++ (t154A_14 ++ (t154A_15 ++ (t154A_16 ++ (t154A_17 ++ (t154A_18 ++ (t154A_19 ++ (t154A_20 ++ (t154A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t154B : List Tok := t154B_0 ++ (t154B_1 ++ (t154B_2 ++ (t154B_3 ++ (t154B_4 ++ (t154B_5 ++ (t154B_6 ++ (t154B_7 ++ (t154B_8 ++ (t154B_9 ++ (t154B_10 ++ (t154B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 154：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run154 : (nbRun P nb154 0 kN154 t154A).1 = true ∧ (nbRun P nb154 1 kN154 t154B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s154A_0) (wseg_append (wseg_of s154A_1) (wseg_append (wseg_of s154A_2) (wseg_append (wseg_of s154A_3) (wseg_append (wseg_of s154A_4) (wseg_append (wseg_of s154A_5) (wseg_append (wseg_of s154A_6) (wseg_append (wseg_of s154A_7) (wseg_append (wseg_of s154A_8) (wseg_append (wseg_of s154A_9) (wseg_append (wseg_of s154A_10) (wseg_append (wseg_of s154A_11) (wseg_append (wseg_of s154A_12) (wseg_append (wseg_of s154A_13) (wseg_append (wseg_of s154A_14) (wseg_append (wseg_of s154A_15) (wseg_append (wseg_of s154A_16) (wseg_append (wseg_of s154A_17) (wseg_append (wseg_of s154A_18) (wseg_append (wseg_of s154A_19) (wseg_append (wseg_of s154A_20) (wseg_of s154A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s154B_0) (wseg_append (wseg_of s154B_1) (wseg_append (wseg_of s154B_2) (wseg_append (wseg_of s154B_3) (wseg_append (wseg_of s154B_4) (wseg_append (wseg_of s154B_5) (wseg_append (wseg_of s154B_6) (wseg_append (wseg_of s154B_7) (wseg_append (wseg_of s154B_8) (wseg_append (wseg_of s154B_9) (wseg_append (wseg_of s154B_10) (wseg_of s154B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t155A : List Tok := t155A_0 ++ (t155A_1 ++ (t155A_2 ++ (t155A_3 ++ (t155A_4 ++ (t155A_5 ++ (t155A_6 ++ (t155A_7 ++ (t155A_8 ++ (t155A_9 ++ (t155A_10 ++ (t155A_11 ++ (t155A_12 ++ (t155A_13 ++ (t155A_14 ++ (t155A_15 ++ (t155A_16 ++ (t155A_17 ++ (t155A_18 ++ (t155A_19 ++ (t155A_20 ++ (t155A_21 ++ (t155A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t155B : List Tok := t155B_0 ++ (t155B_1 ++ (t155B_2 ++ (t155B_3 ++ (t155B_4 ++ (t155B_5 ++ (t155B_6 ++ (t155B_7 ++ (t155B_8 ++ (t155B_9 ++ (t155B_10 ++ (t155B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 155：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run155 : (nbRun P nb155 0 kN155 t155A).1 = true ∧ (nbRun P nb155 1 kN155 t155B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s155A_0) (wseg_append (wseg_of s155A_1) (wseg_append (wseg_of s155A_2) (wseg_append (wseg_of s155A_3) (wseg_append (wseg_of s155A_4) (wseg_append (wseg_of s155A_5) (wseg_append (wseg_of s155A_6) (wseg_append (wseg_of s155A_7) (wseg_append (wseg_of s155A_8) (wseg_append (wseg_of s155A_9) (wseg_append (wseg_of s155A_10) (wseg_append (wseg_of s155A_11) (wseg_append (wseg_of s155A_12) (wseg_append (wseg_of s155A_13) (wseg_append (wseg_of s155A_14) (wseg_append (wseg_of s155A_15) (wseg_append (wseg_of s155A_16) (wseg_append (wseg_of s155A_17) (wseg_append (wseg_of s155A_18) (wseg_append (wseg_of s155A_19) (wseg_append (wseg_of s155A_20) (wseg_append (wseg_of s155A_21) (wseg_of s155A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s155B_0) (wseg_append (wseg_of s155B_1) (wseg_append (wseg_of s155B_2) (wseg_append (wseg_of s155B_3) (wseg_append (wseg_of s155B_4) (wseg_append (wseg_of s155B_5) (wseg_append (wseg_of s155B_6) (wseg_append (wseg_of s155B_7) (wseg_append (wseg_of s155B_8) (wseg_append (wseg_of s155B_9) (wseg_append (wseg_of s155B_10) (wseg_of s155B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t156A : List Tok := t156A_0 ++ (t156A_1 ++ (t156A_2 ++ (t156A_3 ++ (t156A_4 ++ (t156A_5 ++ (t156A_6 ++ (t156A_7 ++ (t156A_8 ++ (t156A_9 ++ (t156A_10 ++ (t156A_11 ++ (t156A_12 ++ (t156A_13 ++ (t156A_14 ++ (t156A_15 ++ (t156A_16 ++ (t156A_17 ++ (t156A_18 ++ (t156A_19 ++ (t156A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t156B : List Tok := t156B_0 ++ (t156B_1 ++ (t156B_2 ++ (t156B_3 ++ (t156B_4 ++ (t156B_5 ++ (t156B_6 ++ (t156B_7 ++ (t156B_8 ++ (t156B_9 ++ (t156B_10 ++ (t156B_11 ++ (t156B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 156：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run156 : (nbRun P nb156 0 kN156 t156A).1 = true ∧ (nbRun P nb156 1 kN156 t156B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s156A_0) (wseg_append (wseg_of s156A_1) (wseg_append (wseg_of s156A_2) (wseg_append (wseg_of s156A_3) (wseg_append (wseg_of s156A_4) (wseg_append (wseg_of s156A_5) (wseg_append (wseg_of s156A_6) (wseg_append (wseg_of s156A_7) (wseg_append (wseg_of s156A_8) (wseg_append (wseg_of s156A_9) (wseg_append (wseg_of s156A_10) (wseg_append (wseg_of s156A_11) (wseg_append (wseg_of s156A_12) (wseg_append (wseg_of s156A_13) (wseg_append (wseg_of s156A_14) (wseg_append (wseg_of s156A_15) (wseg_append (wseg_of s156A_16) (wseg_append (wseg_of s156A_17) (wseg_append (wseg_of s156A_18) (wseg_append (wseg_of s156A_19) (wseg_of s156A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s156B_0) (wseg_append (wseg_of s156B_1) (wseg_append (wseg_of s156B_2) (wseg_append (wseg_of s156B_3) (wseg_append (wseg_of s156B_4) (wseg_append (wseg_of s156B_5) (wseg_append (wseg_of s156B_6) (wseg_append (wseg_of s156B_7) (wseg_append (wseg_of s156B_8) (wseg_append (wseg_of s156B_9) (wseg_append (wseg_of s156B_10) (wseg_append (wseg_of s156B_11) (wseg_of s156B_12)))))))))))))⟩

end PackLean.D40.Tet
