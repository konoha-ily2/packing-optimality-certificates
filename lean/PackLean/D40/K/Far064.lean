-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS064_0
import PackLean.D40.K.FarS064_1
import PackLean.D40.K.FarS064_2
import PackLean.D40.K.FarS064_3
import PackLean.D40.K.FarS064_4
import PackLean.D40.K.FarS064_5
import PackLean.D40.K.FarS064_6
import PackLean.D40.K.FarS064_7
import PackLean.D40.K.FarS064_8
import PackLean.D40.K.FarS064_9
import PackLean.D40.K.FarS064_10
import PackLean.D40.K.FarS064_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t230A : List Tok := t230A_0 ++ (t230A_1 ++ (t230A_2 ++ (t230A_3 ++ (t230A_4 ++ (t230A_5 ++ (t230A_6 ++ (t230A_7 ++ (t230A_8 ++ (t230A_9 ++ (t230A_10 ++ (t230A_11 ++ (t230A_12 ++ (t230A_13 ++ (t230A_14 ++ (t230A_15 ++ (t230A_16 ++ (t230A_17 ++ (t230A_18 ++ (t230A_19 ++ (t230A_20 ++ (t230A_21 ++ (t230A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t230B : List Tok := t230B_0 ++ (t230B_1 ++ (t230B_2 ++ (t230B_3 ++ (t230B_4 ++ (t230B_5 ++ (t230B_6 ++ (t230B_7 ++ (t230B_8 ++ (t230B_9 ++ (t230B_10 ++ (t230B_11 ++ (t230B_12 ++ (t230B_13 ++ (t230B_14 ++ (t230B_15 ++ (t230B_16 ++ (t230B_17 ++ (t230B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 230：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run230 : (nbRun P nb230 0 kN230 t230A).1 = true ∧ (nbRun P nb230 1 kN230 t230B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s230A_0) (wseg_append (wseg_of s230A_1) (wseg_append (wseg_of s230A_2) (wseg_append (wseg_of s230A_3) (wseg_append (wseg_of s230A_4) (wseg_append (wseg_of s230A_5) (wseg_append (wseg_of s230A_6) (wseg_append (wseg_of s230A_7) (wseg_append (wseg_of s230A_8) (wseg_append (wseg_of s230A_9) (wseg_append (wseg_of s230A_10) (wseg_append (wseg_of s230A_11) (wseg_append (wseg_of s230A_12) (wseg_append (wseg_of s230A_13) (wseg_append (wseg_of s230A_14) (wseg_append (wseg_of s230A_15) (wseg_append (wseg_of s230A_16) (wseg_append (wseg_of s230A_17) (wseg_append (wseg_of s230A_18) (wseg_append (wseg_of s230A_19) (wseg_append (wseg_of s230A_20) (wseg_append (wseg_of s230A_21) (wseg_of s230A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s230B_0) (wseg_append (wseg_of s230B_1) (wseg_append (wseg_of s230B_2) (wseg_append (wseg_of s230B_3) (wseg_append (wseg_of s230B_4) (wseg_append (wseg_of s230B_5) (wseg_append (wseg_of s230B_6) (wseg_append (wseg_of s230B_7) (wseg_append (wseg_of s230B_8) (wseg_append (wseg_of s230B_9) (wseg_append (wseg_of s230B_10) (wseg_append (wseg_of s230B_11) (wseg_append (wseg_of s230B_12) (wseg_append (wseg_of s230B_13) (wseg_append (wseg_of s230B_14) (wseg_append (wseg_of s230B_15) (wseg_append (wseg_of s230B_16) (wseg_append (wseg_of s230B_17) (wseg_of s230B_18)))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t231A : List Tok := t231A_0 ++ (t231A_1 ++ (t231A_2 ++ (t231A_3 ++ (t231A_4 ++ (t231A_5 ++ (t231A_6 ++ (t231A_7 ++ (t231A_8 ++ (t231A_9 ++ (t231A_10 ++ (t231A_11 ++ (t231A_12 ++ (t231A_13 ++ (t231A_14 ++ (t231A_15 ++ (t231A_16 ++ (t231A_17 ++ (t231A_18 ++ (t231A_19 ++ (t231A_20 ++ (t231A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t231B : List Tok := t231B_0 ++ (t231B_1 ++ (t231B_2 ++ (t231B_3 ++ (t231B_4 ++ (t231B_5 ++ (t231B_6 ++ (t231B_7 ++ (t231B_8 ++ (t231B_9 ++ (t231B_10 ++ (t231B_11 ++ (t231B_12 ++ (t231B_13 ++ (t231B_14 ++ (t231B_15 ++ (t231B_16 ++ (t231B_17 ++ (t231B_18 ++ (t231B_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 231：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run231 : (nbRun P nb231 0 kN231 t231A).1 = true ∧ (nbRun P nb231 1 kN231 t231B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s231A_0) (wseg_append (wseg_of s231A_1) (wseg_append (wseg_of s231A_2) (wseg_append (wseg_of s231A_3) (wseg_append (wseg_of s231A_4) (wseg_append (wseg_of s231A_5) (wseg_append (wseg_of s231A_6) (wseg_append (wseg_of s231A_7) (wseg_append (wseg_of s231A_8) (wseg_append (wseg_of s231A_9) (wseg_append (wseg_of s231A_10) (wseg_append (wseg_of s231A_11) (wseg_append (wseg_of s231A_12) (wseg_append (wseg_of s231A_13) (wseg_append (wseg_of s231A_14) (wseg_append (wseg_of s231A_15) (wseg_append (wseg_of s231A_16) (wseg_append (wseg_of s231A_17) (wseg_append (wseg_of s231A_18) (wseg_append (wseg_of s231A_19) (wseg_append (wseg_of s231A_20) (wseg_of s231A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s231B_0) (wseg_append (wseg_of s231B_1) (wseg_append (wseg_of s231B_2) (wseg_append (wseg_of s231B_3) (wseg_append (wseg_of s231B_4) (wseg_append (wseg_of s231B_5) (wseg_append (wseg_of s231B_6) (wseg_append (wseg_of s231B_7) (wseg_append (wseg_of s231B_8) (wseg_append (wseg_of s231B_9) (wseg_append (wseg_of s231B_10) (wseg_append (wseg_of s231B_11) (wseg_append (wseg_of s231B_12) (wseg_append (wseg_of s231B_13) (wseg_append (wseg_of s231B_14) (wseg_append (wseg_of s231B_15) (wseg_append (wseg_of s231B_16) (wseg_append (wseg_of s231B_17) (wseg_append (wseg_of s231B_18) (wseg_of s231B_19))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t232A : List Tok := t232A_0 ++ (t232A_1 ++ (t232A_2 ++ (t232A_3 ++ (t232A_4 ++ (t232A_5 ++ (t232A_6 ++ (t232A_7 ++ (t232A_8 ++ (t232A_9 ++ (t232A_10 ++ (t232A_11 ++ (t232A_12 ++ (t232A_13 ++ (t232A_14 ++ (t232A_15 ++ (t232A_16 ++ (t232A_17 ++ (t232A_18 ++ (t232A_19 ++ (t232A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t232B : List Tok := t232B_0 ++ (t232B_1 ++ (t232B_2 ++ (t232B_3 ++ (t232B_4 ++ (t232B_5 ++ (t232B_6 ++ (t232B_7 ++ (t232B_8 ++ (t232B_9 ++ (t232B_10 ++ (t232B_11 ++ (t232B_12 ++ (t232B_13 ++ (t232B_14 ++ (t232B_15 ++ (t232B_16 ++ (t232B_17 ++ (t232B_18 ++ (t232B_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 232：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run232 : (nbRun P nb232 0 kN232 t232A).1 = true ∧ (nbRun P nb232 1 kN232 t232B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s232A_0) (wseg_append (wseg_of s232A_1) (wseg_append (wseg_of s232A_2) (wseg_append (wseg_of s232A_3) (wseg_append (wseg_of s232A_4) (wseg_append (wseg_of s232A_5) (wseg_append (wseg_of s232A_6) (wseg_append (wseg_of s232A_7) (wseg_append (wseg_of s232A_8) (wseg_append (wseg_of s232A_9) (wseg_append (wseg_of s232A_10) (wseg_append (wseg_of s232A_11) (wseg_append (wseg_of s232A_12) (wseg_append (wseg_of s232A_13) (wseg_append (wseg_of s232A_14) (wseg_append (wseg_of s232A_15) (wseg_append (wseg_of s232A_16) (wseg_append (wseg_of s232A_17) (wseg_append (wseg_of s232A_18) (wseg_append (wseg_of s232A_19) (wseg_of s232A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s232B_0) (wseg_append (wseg_of s232B_1) (wseg_append (wseg_of s232B_2) (wseg_append (wseg_of s232B_3) (wseg_append (wseg_of s232B_4) (wseg_append (wseg_of s232B_5) (wseg_append (wseg_of s232B_6) (wseg_append (wseg_of s232B_7) (wseg_append (wseg_of s232B_8) (wseg_append (wseg_of s232B_9) (wseg_append (wseg_of s232B_10) (wseg_append (wseg_of s232B_11) (wseg_append (wseg_of s232B_12) (wseg_append (wseg_of s232B_13) (wseg_append (wseg_of s232B_14) (wseg_append (wseg_of s232B_15) (wseg_append (wseg_of s232B_16) (wseg_append (wseg_of s232B_17) (wseg_append (wseg_of s232B_18) (wseg_of s232B_19))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t233A : List Tok := t233A_0 ++ (t233A_1 ++ (t233A_2 ++ (t233A_3 ++ (t233A_4 ++ (t233A_5 ++ (t233A_6 ++ (t233A_7 ++ (t233A_8 ++ (t233A_9 ++ (t233A_10 ++ (t233A_11 ++ (t233A_12 ++ (t233A_13 ++ (t233A_14 ++ (t233A_15 ++ (t233A_16 ++ (t233A_17 ++ (t233A_18 ++ (t233A_19 ++ (t233A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t233B : List Tok := t233B_0 ++ (t233B_1 ++ (t233B_2 ++ (t233B_3 ++ (t233B_4 ++ (t233B_5 ++ (t233B_6 ++ (t233B_7 ++ (t233B_8 ++ (t233B_9 ++ (t233B_10 ++ (t233B_11 ++ (t233B_12 ++ (t233B_13 ++ (t233B_14 ++ (t233B_15 ++ (t233B_16 ++ (t233B_17 ++ (t233B_18 ++ (t233B_19 ++ (t233B_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 233：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run233 : (nbRun P nb233 0 kN233 t233A).1 = true ∧ (nbRun P nb233 1 kN233 t233B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s233A_0) (wseg_append (wseg_of s233A_1) (wseg_append (wseg_of s233A_2) (wseg_append (wseg_of s233A_3) (wseg_append (wseg_of s233A_4) (wseg_append (wseg_of s233A_5) (wseg_append (wseg_of s233A_6) (wseg_append (wseg_of s233A_7) (wseg_append (wseg_of s233A_8) (wseg_append (wseg_of s233A_9) (wseg_append (wseg_of s233A_10) (wseg_append (wseg_of s233A_11) (wseg_append (wseg_of s233A_12) (wseg_append (wseg_of s233A_13) (wseg_append (wseg_of s233A_14) (wseg_append (wseg_of s233A_15) (wseg_append (wseg_of s233A_16) (wseg_append (wseg_of s233A_17) (wseg_append (wseg_of s233A_18) (wseg_append (wseg_of s233A_19) (wseg_of s233A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s233B_0) (wseg_append (wseg_of s233B_1) (wseg_append (wseg_of s233B_2) (wseg_append (wseg_of s233B_3) (wseg_append (wseg_of s233B_4) (wseg_append (wseg_of s233B_5) (wseg_append (wseg_of s233B_6) (wseg_append (wseg_of s233B_7) (wseg_append (wseg_of s233B_8) (wseg_append (wseg_of s233B_9) (wseg_append (wseg_of s233B_10) (wseg_append (wseg_of s233B_11) (wseg_append (wseg_of s233B_12) (wseg_append (wseg_of s233B_13) (wseg_append (wseg_of s233B_14) (wseg_append (wseg_of s233B_15) (wseg_append (wseg_of s233B_16) (wseg_append (wseg_of s233B_17) (wseg_append (wseg_of s233B_18) (wseg_append (wseg_of s233B_19) (wseg_of s233B_20)))))))))))))))))))))⟩

end PackLean.D40.Tet
