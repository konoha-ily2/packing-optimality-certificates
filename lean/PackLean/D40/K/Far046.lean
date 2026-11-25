-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS046_0
import PackLean.D40.K.FarS046_1
import PackLean.D40.K.FarS046_2
import PackLean.D40.K.FarS046_3
import PackLean.D40.K.FarS046_4
import PackLean.D40.K.FarS046_5
import PackLean.D40.K.FarS046_6
import PackLean.D40.K.FarS046_7
import PackLean.D40.K.FarS046_8
import PackLean.D40.K.FarS046_9
import PackLean.D40.K.FarS046_10
import PackLean.D40.K.FarS046_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t147A : List Tok := t147A_0 ++ (t147A_1 ++ (t147A_2 ++ (t147A_3 ++ (t147A_4 ++ (t147A_5 ++ (t147A_6 ++ (t147A_7 ++ (t147A_8 ++ (t147A_9 ++ (t147A_10 ++ (t147A_11 ++ (t147A_12 ++ (t147A_13 ++ (t147A_14 ++ (t147A_15 ++ (t147A_16 ++ (t147A_17 ++ (t147A_18 ++ (t147A_19 ++ (t147A_20 ++ (t147A_21 ++ (t147A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t147B : List Tok := t147B_0 ++ (t147B_1 ++ (t147B_2 ++ (t147B_3 ++ (t147B_4 ++ (t147B_5 ++ (t147B_6 ++ (t147B_7 ++ (t147B_8 ++ (t147B_9 ++ (t147B_10 ++ (t147B_11 ++ (t147B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 147：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run147 : (nbRun P nb147 0 kN147 t147A).1 = true ∧ (nbRun P nb147 1 kN147 t147B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s147A_0) (wseg_append (wseg_of s147A_1) (wseg_append (wseg_of s147A_2) (wseg_append (wseg_of s147A_3) (wseg_append (wseg_of s147A_4) (wseg_append (wseg_of s147A_5) (wseg_append (wseg_of s147A_6) (wseg_append (wseg_of s147A_7) (wseg_append (wseg_of s147A_8) (wseg_append (wseg_of s147A_9) (wseg_append (wseg_of s147A_10) (wseg_append (wseg_of s147A_11) (wseg_append (wseg_of s147A_12) (wseg_append (wseg_of s147A_13) (wseg_append (wseg_of s147A_14) (wseg_append (wseg_of s147A_15) (wseg_append (wseg_of s147A_16) (wseg_append (wseg_of s147A_17) (wseg_append (wseg_of s147A_18) (wseg_append (wseg_of s147A_19) (wseg_append (wseg_of s147A_20) (wseg_append (wseg_of s147A_21) (wseg_of s147A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s147B_0) (wseg_append (wseg_of s147B_1) (wseg_append (wseg_of s147B_2) (wseg_append (wseg_of s147B_3) (wseg_append (wseg_of s147B_4) (wseg_append (wseg_of s147B_5) (wseg_append (wseg_of s147B_6) (wseg_append (wseg_of s147B_7) (wseg_append (wseg_of s147B_8) (wseg_append (wseg_of s147B_9) (wseg_append (wseg_of s147B_10) (wseg_append (wseg_of s147B_11) (wseg_of s147B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t148A : List Tok := t148A_0 ++ (t148A_1 ++ (t148A_2 ++ (t148A_3 ++ (t148A_4 ++ (t148A_5 ++ (t148A_6 ++ (t148A_7 ++ (t148A_8 ++ (t148A_9 ++ (t148A_10 ++ (t148A_11 ++ (t148A_12 ++ (t148A_13 ++ (t148A_14 ++ (t148A_15 ++ (t148A_16 ++ (t148A_17 ++ (t148A_18 ++ (t148A_19 ++ (t148A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t148B : List Tok := t148B_0 ++ (t148B_1 ++ (t148B_2 ++ (t148B_3 ++ (t148B_4 ++ (t148B_5 ++ (t148B_6 ++ (t148B_7 ++ (t148B_8 ++ (t148B_9 ++ (t148B_10 ++ (t148B_11 ++ (t148B_12 ++ (t148B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 148：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run148 : (nbRun P nb148 0 kN148 t148A).1 = true ∧ (nbRun P nb148 1 kN148 t148B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s148A_0) (wseg_append (wseg_of s148A_1) (wseg_append (wseg_of s148A_2) (wseg_append (wseg_of s148A_3) (wseg_append (wseg_of s148A_4) (wseg_append (wseg_of s148A_5) (wseg_append (wseg_of s148A_6) (wseg_append (wseg_of s148A_7) (wseg_append (wseg_of s148A_8) (wseg_append (wseg_of s148A_9) (wseg_append (wseg_of s148A_10) (wseg_append (wseg_of s148A_11) (wseg_append (wseg_of s148A_12) (wseg_append (wseg_of s148A_13) (wseg_append (wseg_of s148A_14) (wseg_append (wseg_of s148A_15) (wseg_append (wseg_of s148A_16) (wseg_append (wseg_of s148A_17) (wseg_append (wseg_of s148A_18) (wseg_append (wseg_of s148A_19) (wseg_of s148A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s148B_0) (wseg_append (wseg_of s148B_1) (wseg_append (wseg_of s148B_2) (wseg_append (wseg_of s148B_3) (wseg_append (wseg_of s148B_4) (wseg_append (wseg_of s148B_5) (wseg_append (wseg_of s148B_6) (wseg_append (wseg_of s148B_7) (wseg_append (wseg_of s148B_8) (wseg_append (wseg_of s148B_9) (wseg_append (wseg_of s148B_10) (wseg_append (wseg_of s148B_11) (wseg_append (wseg_of s148B_12) (wseg_of s148B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t149A : List Tok := t149A_0 ++ (t149A_1 ++ (t149A_2 ++ (t149A_3 ++ (t149A_4 ++ (t149A_5 ++ (t149A_6 ++ (t149A_7 ++ (t149A_8 ++ (t149A_9 ++ (t149A_10 ++ (t149A_11 ++ (t149A_12 ++ (t149A_13 ++ (t149A_14 ++ (t149A_15 ++ (t149A_16 ++ (t149A_17 ++ (t149A_18 ++ (t149A_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t149B : List Tok := t149B_0 ++ (t149B_1 ++ (t149B_2 ++ (t149B_3 ++ (t149B_4 ++ (t149B_5 ++ (t149B_6 ++ (t149B_7 ++ (t149B_8 ++ (t149B_9 ++ (t149B_10 ++ (t149B_11 ++ (t149B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 149：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run149 : (nbRun P nb149 0 kN149 t149A).1 = true ∧ (nbRun P nb149 1 kN149 t149B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s149A_0) (wseg_append (wseg_of s149A_1) (wseg_append (wseg_of s149A_2) (wseg_append (wseg_of s149A_3) (wseg_append (wseg_of s149A_4) (wseg_append (wseg_of s149A_5) (wseg_append (wseg_of s149A_6) (wseg_append (wseg_of s149A_7) (wseg_append (wseg_of s149A_8) (wseg_append (wseg_of s149A_9) (wseg_append (wseg_of s149A_10) (wseg_append (wseg_of s149A_11) (wseg_append (wseg_of s149A_12) (wseg_append (wseg_of s149A_13) (wseg_append (wseg_of s149A_14) (wseg_append (wseg_of s149A_15) (wseg_append (wseg_of s149A_16) (wseg_append (wseg_of s149A_17) (wseg_append (wseg_of s149A_18) (wseg_of s149A_19)))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s149B_0) (wseg_append (wseg_of s149B_1) (wseg_append (wseg_of s149B_2) (wseg_append (wseg_of s149B_3) (wseg_append (wseg_of s149B_4) (wseg_append (wseg_of s149B_5) (wseg_append (wseg_of s149B_6) (wseg_append (wseg_of s149B_7) (wseg_append (wseg_of s149B_8) (wseg_append (wseg_of s149B_9) (wseg_append (wseg_of s149B_10) (wseg_append (wseg_of s149B_11) (wseg_of s149B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t150A : List Tok := t150A_0 ++ (t150A_1 ++ (t150A_2 ++ (t150A_3 ++ (t150A_4 ++ (t150A_5 ++ (t150A_6 ++ (t150A_7 ++ (t150A_8 ++ (t150A_9 ++ (t150A_10 ++ (t150A_11 ++ (t150A_12 ++ (t150A_13 ++ (t150A_14 ++ (t150A_15 ++ (t150A_16 ++ (t150A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t150B : List Tok := t150B_0 ++ (t150B_1 ++ (t150B_2 ++ (t150B_3 ++ (t150B_4 ++ (t150B_5 ++ (t150B_6 ++ (t150B_7 ++ (t150B_8 ++ (t150B_9 ++ (t150B_10 ++ (t150B_11 ++ (t150B_12 ++ (t150B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 150：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run150 : (nbRun P nb150 0 kN150 t150A).1 = true ∧ (nbRun P nb150 1 kN150 t150B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s150A_0) (wseg_append (wseg_of s150A_1) (wseg_append (wseg_of s150A_2) (wseg_append (wseg_of s150A_3) (wseg_append (wseg_of s150A_4) (wseg_append (wseg_of s150A_5) (wseg_append (wseg_of s150A_6) (wseg_append (wseg_of s150A_7) (wseg_append (wseg_of s150A_8) (wseg_append (wseg_of s150A_9) (wseg_append (wseg_of s150A_10) (wseg_append (wseg_of s150A_11) (wseg_append (wseg_of s150A_12) (wseg_append (wseg_of s150A_13) (wseg_append (wseg_of s150A_14) (wseg_append (wseg_of s150A_15) (wseg_append (wseg_of s150A_16) (wseg_of s150A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s150B_0) (wseg_append (wseg_of s150B_1) (wseg_append (wseg_of s150B_2) (wseg_append (wseg_of s150B_3) (wseg_append (wseg_of s150B_4) (wseg_append (wseg_of s150B_5) (wseg_append (wseg_of s150B_6) (wseg_append (wseg_of s150B_7) (wseg_append (wseg_of s150B_8) (wseg_append (wseg_of s150B_9) (wseg_append (wseg_of s150B_10) (wseg_append (wseg_of s150B_11) (wseg_append (wseg_of s150B_12) (wseg_of s150B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t151A : List Tok := t151A_0 ++ (t151A_1 ++ (t151A_2 ++ (t151A_3 ++ (t151A_4 ++ (t151A_5 ++ (t151A_6 ++ (t151A_7 ++ (t151A_8 ++ (t151A_9 ++ (t151A_10 ++ (t151A_11 ++ (t151A_12 ++ (t151A_13 ++ (t151A_14 ++ (t151A_15 ++ (t151A_16 ++ (t151A_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t151B : List Tok := t151B_0 ++ (t151B_1 ++ (t151B_2 ++ (t151B_3 ++ (t151B_4 ++ (t151B_5 ++ (t151B_6 ++ (t151B_7 ++ (t151B_8 ++ (t151B_9 ++ (t151B_10 ++ (t151B_11 ++ (t151B_12 ++ (t151B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 151：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run151 : (nbRun P nb151 0 kN151 t151A).1 = true ∧ (nbRun P nb151 1 kN151 t151B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s151A_0) (wseg_append (wseg_of s151A_1) (wseg_append (wseg_of s151A_2) (wseg_append (wseg_of s151A_3) (wseg_append (wseg_of s151A_4) (wseg_append (wseg_of s151A_5) (wseg_append (wseg_of s151A_6) (wseg_append (wseg_of s151A_7) (wseg_append (wseg_of s151A_8) (wseg_append (wseg_of s151A_9) (wseg_append (wseg_of s151A_10) (wseg_append (wseg_of s151A_11) (wseg_append (wseg_of s151A_12) (wseg_append (wseg_of s151A_13) (wseg_append (wseg_of s151A_14) (wseg_append (wseg_of s151A_15) (wseg_append (wseg_of s151A_16) (wseg_of s151A_17)))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s151B_0) (wseg_append (wseg_of s151B_1) (wseg_append (wseg_of s151B_2) (wseg_append (wseg_of s151B_3) (wseg_append (wseg_of s151B_4) (wseg_append (wseg_of s151B_5) (wseg_append (wseg_of s151B_6) (wseg_append (wseg_of s151B_7) (wseg_append (wseg_of s151B_8) (wseg_append (wseg_of s151B_9) (wseg_append (wseg_of s151B_10) (wseg_append (wseg_of s151B_11) (wseg_append (wseg_of s151B_12) (wseg_of s151B_13))))))))))))))⟩

end PackLean.D40.Tet
