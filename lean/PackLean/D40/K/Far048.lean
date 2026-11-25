-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS048_0
import PackLean.D40.K.FarS048_1
import PackLean.D40.K.FarS048_2
import PackLean.D40.K.FarS048_3
import PackLean.D40.K.FarS048_4
import PackLean.D40.K.FarS048_5
import PackLean.D40.K.FarS048_6
import PackLean.D40.K.FarS048_7
import PackLean.D40.K.FarS048_8
import PackLean.D40.K.FarS048_9
import PackLean.D40.K.FarS048_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t157A : List Tok := t157A_0 ++ (t157A_1 ++ (t157A_2 ++ (t157A_3 ++ (t157A_4 ++ (t157A_5 ++ (t157A_6 ++ (t157A_7 ++ (t157A_8 ++ (t157A_9 ++ (t157A_10 ++ (t157A_11 ++ (t157A_12 ++ (t157A_13 ++ (t157A_14 ++ (t157A_15 ++ (t157A_16 ++ (t157A_17 ++ (t157A_18 ++ (t157A_19 ++ (t157A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t157B : List Tok := t157B_0 ++ (t157B_1 ++ (t157B_2 ++ (t157B_3 ++ (t157B_4 ++ (t157B_5 ++ (t157B_6 ++ (t157B_7 ++ (t157B_8 ++ (t157B_9 ++ (t157B_10 ++ (t157B_11 ++ (t157B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 157：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run157 : (nbRun P nb157 0 kN157 t157A).1 = true ∧ (nbRun P nb157 1 kN157 t157B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s157A_0) (wseg_append (wseg_of s157A_1) (wseg_append (wseg_of s157A_2) (wseg_append (wseg_of s157A_3) (wseg_append (wseg_of s157A_4) (wseg_append (wseg_of s157A_5) (wseg_append (wseg_of s157A_6) (wseg_append (wseg_of s157A_7) (wseg_append (wseg_of s157A_8) (wseg_append (wseg_of s157A_9) (wseg_append (wseg_of s157A_10) (wseg_append (wseg_of s157A_11) (wseg_append (wseg_of s157A_12) (wseg_append (wseg_of s157A_13) (wseg_append (wseg_of s157A_14) (wseg_append (wseg_of s157A_15) (wseg_append (wseg_of s157A_16) (wseg_append (wseg_of s157A_17) (wseg_append (wseg_of s157A_18) (wseg_append (wseg_of s157A_19) (wseg_of s157A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s157B_0) (wseg_append (wseg_of s157B_1) (wseg_append (wseg_of s157B_2) (wseg_append (wseg_of s157B_3) (wseg_append (wseg_of s157B_4) (wseg_append (wseg_of s157B_5) (wseg_append (wseg_of s157B_6) (wseg_append (wseg_of s157B_7) (wseg_append (wseg_of s157B_8) (wseg_append (wseg_of s157B_9) (wseg_append (wseg_of s157B_10) (wseg_append (wseg_of s157B_11) (wseg_of s157B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t158A : List Tok := t158A_0 ++ (t158A_1 ++ (t158A_2 ++ (t158A_3 ++ (t158A_4 ++ (t158A_5 ++ (t158A_6 ++ (t158A_7 ++ (t158A_8 ++ (t158A_9 ++ (t158A_10 ++ (t158A_11 ++ (t158A_12 ++ (t158A_13 ++ (t158A_14 ++ (t158A_15 ++ (t158A_16 ++ (t158A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t158B : List Tok := t158B_0 ++ (t158B_1 ++ (t158B_2 ++ (t158B_3 ++ (t158B_4 ++ (t158B_5 ++ (t158B_6 ++ (t158B_7 ++ (t158B_8 ++ (t158B_9 ++ (t158B_10 ++ (t158B_11 ++ (t158B_12 ++ (t158B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 158：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run158 : (nbRun P nb158 0 kN158 t158A).1 = true ∧ (nbRun P nb158 1 kN158 t158B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s158A_0) (wseg_append (wseg_of s158A_1) (wseg_append (wseg_of s158A_2) (wseg_append (wseg_of s158A_3) (wseg_append (wseg_of s158A_4) (wseg_append (wseg_of s158A_5) (wseg_append (wseg_of s158A_6) (wseg_append (wseg_of s158A_7) (wseg_append (wseg_of s158A_8) (wseg_append (wseg_of s158A_9) (wseg_append (wseg_of s158A_10) (wseg_append (wseg_of s158A_11) (wseg_append (wseg_of s158A_12) (wseg_append (wseg_of s158A_13) (wseg_append (wseg_of s158A_14) (wseg_append (wseg_of s158A_15) (wseg_append (wseg_of s158A_16) (wseg_of s158A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s158B_0) (wseg_append (wseg_of s158B_1) (wseg_append (wseg_of s158B_2) (wseg_append (wseg_of s158B_3) (wseg_append (wseg_of s158B_4) (wseg_append (wseg_of s158B_5) (wseg_append (wseg_of s158B_6) (wseg_append (wseg_of s158B_7) (wseg_append (wseg_of s158B_8) (wseg_append (wseg_of s158B_9) (wseg_append (wseg_of s158B_10) (wseg_append (wseg_of s158B_11) (wseg_append (wseg_of s158B_12) (wseg_of s158B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t159A : List Tok := t159A_0 ++ (t159A_1 ++ (t159A_2 ++ (t159A_3 ++ (t159A_4 ++ (t159A_5 ++ (t159A_6 ++ (t159A_7 ++ (t159A_8 ++ (t159A_9 ++ (t159A_10 ++ (t159A_11 ++ (t159A_12 ++ (t159A_13 ++ (t159A_14 ++ (t159A_15 ++ (t159A_16 ++ (t159A_17 ++ (t159A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t159B : List Tok := t159B_0 ++ (t159B_1 ++ (t159B_2 ++ (t159B_3 ++ (t159B_4 ++ (t159B_5 ++ (t159B_6 ++ (t159B_7 ++ (t159B_8 ++ (t159B_9 ++ (t159B_10 ++ (t159B_11 ++ (t159B_12 ++ (t159B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 159：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run159 : (nbRun P nb159 0 kN159 t159A).1 = true ∧ (nbRun P nb159 1 kN159 t159B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s159A_0) (wseg_append (wseg_of s159A_1) (wseg_append (wseg_of s159A_2) (wseg_append (wseg_of s159A_3) (wseg_append (wseg_of s159A_4) (wseg_append (wseg_of s159A_5) (wseg_append (wseg_of s159A_6) (wseg_append (wseg_of s159A_7) (wseg_append (wseg_of s159A_8) (wseg_append (wseg_of s159A_9) (wseg_append (wseg_of s159A_10) (wseg_append (wseg_of s159A_11) (wseg_append (wseg_of s159A_12) (wseg_append (wseg_of s159A_13) (wseg_append (wseg_of s159A_14) (wseg_append (wseg_of s159A_15) (wseg_append (wseg_of s159A_16) (wseg_append (wseg_of s159A_17) (wseg_of s159A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s159B_0) (wseg_append (wseg_of s159B_1) (wseg_append (wseg_of s159B_2) (wseg_append (wseg_of s159B_3) (wseg_append (wseg_of s159B_4) (wseg_append (wseg_of s159B_5) (wseg_append (wseg_of s159B_6) (wseg_append (wseg_of s159B_7) (wseg_append (wseg_of s159B_8) (wseg_append (wseg_of s159B_9) (wseg_append (wseg_of s159B_10) (wseg_append (wseg_of s159B_11) (wseg_append (wseg_of s159B_12) (wseg_of s159B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t160A : List Tok := t160A_0 ++ (t160A_1 ++ (t160A_2 ++ (t160A_3 ++ (t160A_4 ++ (t160A_5 ++ (t160A_6 ++ (t160A_7 ++ (t160A_8 ++ (t160A_9 ++ (t160A_10 ++ (t160A_11 ++ (t160A_12 ++ (t160A_13 ++ (t160A_14 ++ (t160A_15 ++ (t160A_16 ++ (t160A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t160B : List Tok := t160B_0 ++ (t160B_1 ++ (t160B_2 ++ (t160B_3 ++ (t160B_4 ++ (t160B_5 ++ (t160B_6 ++ (t160B_7 ++ (t160B_8 ++ (t160B_9 ++ (t160B_10 ++ (t160B_11 ++ (t160B_12 ++ (t160B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 160：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run160 : (nbRun P nb160 0 kN160 t160A).1 = true ∧ (nbRun P nb160 1 kN160 t160B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s160A_0) (wseg_append (wseg_of s160A_1) (wseg_append (wseg_of s160A_2) (wseg_append (wseg_of s160A_3) (wseg_append (wseg_of s160A_4) (wseg_append (wseg_of s160A_5) (wseg_append (wseg_of s160A_6) (wseg_append (wseg_of s160A_7) (wseg_append (wseg_of s160A_8) (wseg_append (wseg_of s160A_9) (wseg_append (wseg_of s160A_10) (wseg_append (wseg_of s160A_11) (wseg_append (wseg_of s160A_12) (wseg_append (wseg_of s160A_13) (wseg_append (wseg_of s160A_14) (wseg_append (wseg_of s160A_15) (wseg_append (wseg_of s160A_16) (wseg_of s160A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s160B_0) (wseg_append (wseg_of s160B_1) (wseg_append (wseg_of s160B_2) (wseg_append (wseg_of s160B_3) (wseg_append (wseg_of s160B_4) (wseg_append (wseg_of s160B_5) (wseg_append (wseg_of s160B_6) (wseg_append (wseg_of s160B_7) (wseg_append (wseg_of s160B_8) (wseg_append (wseg_of s160B_9) (wseg_append (wseg_of s160B_10) (wseg_append (wseg_of s160B_11) (wseg_append (wseg_of s160B_12) (wseg_of s160B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t161A : List Tok := t161A_0 ++ (t161A_1 ++ (t161A_2 ++ (t161A_3 ++ (t161A_4 ++ (t161A_5 ++ (t161A_6 ++ (t161A_7 ++ (t161A_8 ++ (t161A_9 ++ (t161A_10 ++ (t161A_11 ++ (t161A_12 ++ (t161A_13 ++ (t161A_14 ++ (t161A_15 ++ (t161A_16 ++ (t161A_17 ++ (t161A_18 ++ (t161A_19 ++ (t161A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t161B : List Tok := t161B_0 ++ (t161B_1 ++ (t161B_2 ++ (t161B_3 ++ (t161B_4 ++ (t161B_5 ++ (t161B_6 ++ (t161B_7 ++ (t161B_8 ++ (t161B_9 ++ (t161B_10 ++ (t161B_11 ++ (t161B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 161：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run161 : (nbRun P nb161 0 kN161 t161A).1 = true ∧ (nbRun P nb161 1 kN161 t161B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s161A_0) (wseg_append (wseg_of s161A_1) (wseg_append (wseg_of s161A_2) (wseg_append (wseg_of s161A_3) (wseg_append (wseg_of s161A_4) (wseg_append (wseg_of s161A_5) (wseg_append (wseg_of s161A_6) (wseg_append (wseg_of s161A_7) (wseg_append (wseg_of s161A_8) (wseg_append (wseg_of s161A_9) (wseg_append (wseg_of s161A_10) (wseg_append (wseg_of s161A_11) (wseg_append (wseg_of s161A_12) (wseg_append (wseg_of s161A_13) (wseg_append (wseg_of s161A_14) (wseg_append (wseg_of s161A_15) (wseg_append (wseg_of s161A_16) (wseg_append (wseg_of s161A_17) (wseg_append (wseg_of s161A_18) (wseg_append (wseg_of s161A_19) (wseg_of s161A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s161B_0) (wseg_append (wseg_of s161B_1) (wseg_append (wseg_of s161B_2) (wseg_append (wseg_of s161B_3) (wseg_append (wseg_of s161B_4) (wseg_append (wseg_of s161B_5) (wseg_append (wseg_of s161B_6) (wseg_append (wseg_of s161B_7) (wseg_append (wseg_of s161B_8) (wseg_append (wseg_of s161B_9) (wseg_append (wseg_of s161B_10) (wseg_append (wseg_of s161B_11) (wseg_of s161B_12)))))))))))))⟩

end PackLean.D40.Tet
