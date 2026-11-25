-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS059_0
import PackLean.D40.K.FarS059_1
import PackLean.D40.K.FarS059_2
import PackLean.D40.K.FarS059_3
import PackLean.D40.K.FarS059_4
import PackLean.D40.K.FarS059_5
import PackLean.D40.K.FarS059_6
import PackLean.D40.K.FarS059_7
import PackLean.D40.K.FarS059_8
import PackLean.D40.K.FarS059_9
import PackLean.D40.K.FarS059_10
import PackLean.D40.K.FarS059_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t209A : List Tok := t209A_0 ++ (t209A_1 ++ (t209A_2 ++ (t209A_3 ++ (t209A_4 ++ (t209A_5 ++ (t209A_6 ++ (t209A_7 ++ (t209A_8 ++ (t209A_9 ++ (t209A_10 ++ (t209A_11 ++ (t209A_12 ++ (t209A_13 ++ (t209A_14 ++ (t209A_15 ++ (t209A_16 ++ (t209A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t209B : List Tok := t209B_0 ++ (t209B_1 ++ (t209B_2 ++ (t209B_3 ++ (t209B_4 ++ (t209B_5 ++ (t209B_6 ++ (t209B_7 ++ (t209B_8 ++ (t209B_9 ++ (t209B_10 ++ (t209B_11 ++ (t209B_12 ++ (t209B_13 ++ (t209B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 209：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run209 : (nbRun P nb209 0 kN209 t209A).1 = true ∧ (nbRun P nb209 1 kN209 t209B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s209A_0) (wseg_append (wseg_of s209A_1) (wseg_append (wseg_of s209A_2) (wseg_append (wseg_of s209A_3) (wseg_append (wseg_of s209A_4) (wseg_append (wseg_of s209A_5) (wseg_append (wseg_of s209A_6) (wseg_append (wseg_of s209A_7) (wseg_append (wseg_of s209A_8) (wseg_append (wseg_of s209A_9) (wseg_append (wseg_of s209A_10) (wseg_append (wseg_of s209A_11) (wseg_append (wseg_of s209A_12) (wseg_append (wseg_of s209A_13) (wseg_append (wseg_of s209A_14) (wseg_append (wseg_of s209A_15) (wseg_append (wseg_of s209A_16) (wseg_of s209A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s209B_0) (wseg_append (wseg_of s209B_1) (wseg_append (wseg_of s209B_2) (wseg_append (wseg_of s209B_3) (wseg_append (wseg_of s209B_4) (wseg_append (wseg_of s209B_5) (wseg_append (wseg_of s209B_6) (wseg_append (wseg_of s209B_7) (wseg_append (wseg_of s209B_8) (wseg_append (wseg_of s209B_9) (wseg_append (wseg_of s209B_10) (wseg_append (wseg_of s209B_11) (wseg_append (wseg_of s209B_12) (wseg_append (wseg_of s209B_13) (wseg_of s209B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210A : List Tok := t210A_0 ++ (t210A_1 ++ (t210A_2 ++ (t210A_3 ++ (t210A_4 ++ (t210A_5 ++ (t210A_6 ++ (t210A_7 ++ (t210A_8 ++ (t210A_9 ++ (t210A_10 ++ (t210A_11 ++ (t210A_12 ++ (t210A_13 ++ (t210A_14 ++ (t210A_15 ++ (t210A_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t210B : List Tok := t210B_0 ++ (t210B_1 ++ (t210B_2 ++ (t210B_3 ++ (t210B_4 ++ (t210B_5 ++ (t210B_6 ++ (t210B_7 ++ (t210B_8 ++ (t210B_9 ++ (t210B_10 ++ (t210B_11 ++ (t210B_12 ++ (t210B_13 ++ (t210B_14 ++ (t210B_15 ++ (t210B_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 210：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run210 : (nbRun P nb210 0 kN210 t210A).1 = true ∧ (nbRun P nb210 1 kN210 t210B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s210A_0) (wseg_append (wseg_of s210A_1) (wseg_append (wseg_of s210A_2) (wseg_append (wseg_of s210A_3) (wseg_append (wseg_of s210A_4) (wseg_append (wseg_of s210A_5) (wseg_append (wseg_of s210A_6) (wseg_append (wseg_of s210A_7) (wseg_append (wseg_of s210A_8) (wseg_append (wseg_of s210A_9) (wseg_append (wseg_of s210A_10) (wseg_append (wseg_of s210A_11) (wseg_append (wseg_of s210A_12) (wseg_append (wseg_of s210A_13) (wseg_append (wseg_of s210A_14) (wseg_append (wseg_of s210A_15) (wseg_of s210A_16))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s210B_0) (wseg_append (wseg_of s210B_1) (wseg_append (wseg_of s210B_2) (wseg_append (wseg_of s210B_3) (wseg_append (wseg_of s210B_4) (wseg_append (wseg_of s210B_5) (wseg_append (wseg_of s210B_6) (wseg_append (wseg_of s210B_7) (wseg_append (wseg_of s210B_8) (wseg_append (wseg_of s210B_9) (wseg_append (wseg_of s210B_10) (wseg_append (wseg_of s210B_11) (wseg_append (wseg_of s210B_12) (wseg_append (wseg_of s210B_13) (wseg_append (wseg_of s210B_14) (wseg_append (wseg_of s210B_15) (wseg_of s210B_16)))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t211A : List Tok := t211A_0 ++ (t211A_1 ++ (t211A_2 ++ (t211A_3 ++ (t211A_4 ++ (t211A_5 ++ (t211A_6 ++ (t211A_7 ++ (t211A_8 ++ (t211A_9 ++ (t211A_10 ++ (t211A_11 ++ (t211A_12 ++ (t211A_13 ++ (t211A_14 ++ (t211A_15 ++ (t211A_16 ++ (t211A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t211B : List Tok := t211B_0 ++ (t211B_1 ++ (t211B_2 ++ (t211B_3 ++ (t211B_4 ++ (t211B_5 ++ (t211B_6 ++ (t211B_7 ++ (t211B_8 ++ (t211B_9 ++ (t211B_10 ++ (t211B_11 ++ (t211B_12 ++ (t211B_13 ++ (t211B_14 ++ (t211B_15 ++ (t211B_16 ++ (t211B_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 211：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run211 : (nbRun P nb211 0 kN211 t211A).1 = true ∧ (nbRun P nb211 1 kN211 t211B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s211A_0) (wseg_append (wseg_of s211A_1) (wseg_append (wseg_of s211A_2) (wseg_append (wseg_of s211A_3) (wseg_append (wseg_of s211A_4) (wseg_append (wseg_of s211A_5) (wseg_append (wseg_of s211A_6) (wseg_append (wseg_of s211A_7) (wseg_append (wseg_of s211A_8) (wseg_append (wseg_of s211A_9) (wseg_append (wseg_of s211A_10) (wseg_append (wseg_of s211A_11) (wseg_append (wseg_of s211A_12) (wseg_append (wseg_of s211A_13) (wseg_append (wseg_of s211A_14) (wseg_append (wseg_of s211A_15) (wseg_append (wseg_of s211A_16) (wseg_of s211A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s211B_0) (wseg_append (wseg_of s211B_1) (wseg_append (wseg_of s211B_2) (wseg_append (wseg_of s211B_3) (wseg_append (wseg_of s211B_4) (wseg_append (wseg_of s211B_5) (wseg_append (wseg_of s211B_6) (wseg_append (wseg_of s211B_7) (wseg_append (wseg_of s211B_8) (wseg_append (wseg_of s211B_9) (wseg_append (wseg_of s211B_10) (wseg_append (wseg_of s211B_11) (wseg_append (wseg_of s211B_12) (wseg_append (wseg_of s211B_13) (wseg_append (wseg_of s211B_14) (wseg_append (wseg_of s211B_15) (wseg_append (wseg_of s211B_16) (wseg_of s211B_17))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t212A : List Tok := t212A_0 ++ (t212A_1 ++ (t212A_2 ++ (t212A_3 ++ (t212A_4 ++ (t212A_5 ++ (t212A_6 ++ (t212A_7 ++ (t212A_8 ++ (t212A_9 ++ (t212A_10 ++ (t212A_11 ++ (t212A_12 ++ (t212A_13 ++ (t212A_14 ++ (t212A_15 ++ (t212A_16 ++ (t212A_17 ++ (t212A_18 ++ (t212A_19 ++ (t212A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t212B : List Tok := t212B_0 ++ (t212B_1 ++ (t212B_2 ++ (t212B_3 ++ (t212B_4 ++ (t212B_5 ++ (t212B_6 ++ (t212B_7 ++ (t212B_8 ++ (t212B_9 ++ (t212B_10 ++ (t212B_11 ++ (t212B_12 ++ (t212B_13 ++ (t212B_14 ++ (t212B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 212：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run212 : (nbRun P nb212 0 kN212 t212A).1 = true ∧ (nbRun P nb212 1 kN212 t212B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s212A_0) (wseg_append (wseg_of s212A_1) (wseg_append (wseg_of s212A_2) (wseg_append (wseg_of s212A_3) (wseg_append (wseg_of s212A_4) (wseg_append (wseg_of s212A_5) (wseg_append (wseg_of s212A_6) (wseg_append (wseg_of s212A_7) (wseg_append (wseg_of s212A_8) (wseg_append (wseg_of s212A_9) (wseg_append (wseg_of s212A_10) (wseg_append (wseg_of s212A_11) (wseg_append (wseg_of s212A_12) (wseg_append (wseg_of s212A_13) (wseg_append (wseg_of s212A_14) (wseg_append (wseg_of s212A_15) (wseg_append (wseg_of s212A_16) (wseg_append (wseg_of s212A_17) (wseg_append (wseg_of s212A_18) (wseg_append (wseg_of s212A_19) (wseg_of s212A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s212B_0) (wseg_append (wseg_of s212B_1) (wseg_append (wseg_of s212B_2) (wseg_append (wseg_of s212B_3) (wseg_append (wseg_of s212B_4) (wseg_append (wseg_of s212B_5) (wseg_append (wseg_of s212B_6) (wseg_append (wseg_of s212B_7) (wseg_append (wseg_of s212B_8) (wseg_append (wseg_of s212B_9) (wseg_append (wseg_of s212B_10) (wseg_append (wseg_of s212B_11) (wseg_append (wseg_of s212B_12) (wseg_append (wseg_of s212B_13) (wseg_append (wseg_of s212B_14) (wseg_of s212B_15))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t213A : List Tok := t213A_0 ++ (t213A_1 ++ (t213A_2 ++ (t213A_3 ++ (t213A_4 ++ (t213A_5 ++ (t213A_6 ++ (t213A_7 ++ (t213A_8 ++ (t213A_9 ++ (t213A_10 ++ (t213A_11 ++ (t213A_12 ++ (t213A_13 ++ (t213A_14 ++ (t213A_15 ++ (t213A_16 ++ (t213A_17 ++ (t213A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t213B : List Tok := t213B_0 ++ (t213B_1 ++ (t213B_2 ++ (t213B_3 ++ (t213B_4 ++ (t213B_5 ++ (t213B_6 ++ (t213B_7 ++ (t213B_8 ++ (t213B_9 ++ (t213B_10 ++ (t213B_11 ++ (t213B_12 ++ (t213B_13 ++ (t213B_14 ++ (t213B_15 ++ (t213B_16 ++ (t213B_17 ++ (t213B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 213：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run213 : (nbRun P nb213 0 kN213 t213A).1 = true ∧ (nbRun P nb213 1 kN213 t213B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s213A_0) (wseg_append (wseg_of s213A_1) (wseg_append (wseg_of s213A_2) (wseg_append (wseg_of s213A_3) (wseg_append (wseg_of s213A_4) (wseg_append (wseg_of s213A_5) (wseg_append (wseg_of s213A_6) (wseg_append (wseg_of s213A_7) (wseg_append (wseg_of s213A_8) (wseg_append (wseg_of s213A_9) (wseg_append (wseg_of s213A_10) (wseg_append (wseg_of s213A_11) (wseg_append (wseg_of s213A_12) (wseg_append (wseg_of s213A_13) (wseg_append (wseg_of s213A_14) (wseg_append (wseg_of s213A_15) (wseg_append (wseg_of s213A_16) (wseg_append (wseg_of s213A_17) (wseg_of s213A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s213B_0) (wseg_append (wseg_of s213B_1) (wseg_append (wseg_of s213B_2) (wseg_append (wseg_of s213B_3) (wseg_append (wseg_of s213B_4) (wseg_append (wseg_of s213B_5) (wseg_append (wseg_of s213B_6) (wseg_append (wseg_of s213B_7) (wseg_append (wseg_of s213B_8) (wseg_append (wseg_of s213B_9) (wseg_append (wseg_of s213B_10) (wseg_append (wseg_of s213B_11) (wseg_append (wseg_of s213B_12) (wseg_append (wseg_of s213B_13) (wseg_append (wseg_of s213B_14) (wseg_append (wseg_of s213B_15) (wseg_append (wseg_of s213B_16) (wseg_append (wseg_of s213B_17) (wseg_of s213B_18)))))))))))))))))))⟩

end PackLean.D40.Tet
