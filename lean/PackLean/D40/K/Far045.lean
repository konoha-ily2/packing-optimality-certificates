-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS045_0
import PackLean.D40.K.FarS045_1
import PackLean.D40.K.FarS045_2
import PackLean.D40.K.FarS045_3
import PackLean.D40.K.FarS045_4
import PackLean.D40.K.FarS045_5
import PackLean.D40.K.FarS045_6
import PackLean.D40.K.FarS045_7
import PackLean.D40.K.FarS045_8
import PackLean.D40.K.FarS045_9
import PackLean.D40.K.FarS045_10
import PackLean.D40.K.FarS045_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t142A : List Tok := t142A_0 ++ (t142A_1 ++ (t142A_2 ++ (t142A_3 ++ (t142A_4 ++ (t142A_5 ++ (t142A_6 ++ (t142A_7 ++ (t142A_8 ++ (t142A_9 ++ (t142A_10 ++ (t142A_11 ++ (t142A_12 ++ (t142A_13 ++ (t142A_14 ++ (t142A_15 ++ (t142A_16 ++ (t142A_17 ++ (t142A_18 ++ (t142A_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t142B : List Tok := t142B_0 ++ (t142B_1 ++ (t142B_2 ++ (t142B_3 ++ (t142B_4 ++ (t142B_5 ++ (t142B_6 ++ (t142B_7 ++ (t142B_8 ++ (t142B_9 ++ (t142B_10 ++ (t142B_11 ++ (t142B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 142：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run142 : (nbRun P nb142 0 kN142 t142A).1 = true ∧ (nbRun P nb142 1 kN142 t142B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s142A_0) (wseg_append (wseg_of s142A_1) (wseg_append (wseg_of s142A_2) (wseg_append (wseg_of s142A_3) (wseg_append (wseg_of s142A_4) (wseg_append (wseg_of s142A_5) (wseg_append (wseg_of s142A_6) (wseg_append (wseg_of s142A_7) (wseg_append (wseg_of s142A_8) (wseg_append (wseg_of s142A_9) (wseg_append (wseg_of s142A_10) (wseg_append (wseg_of s142A_11) (wseg_append (wseg_of s142A_12) (wseg_append (wseg_of s142A_13) (wseg_append (wseg_of s142A_14) (wseg_append (wseg_of s142A_15) (wseg_append (wseg_of s142A_16) (wseg_append (wseg_of s142A_17) (wseg_append (wseg_of s142A_18) (wseg_of s142A_19)))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s142B_0) (wseg_append (wseg_of s142B_1) (wseg_append (wseg_of s142B_2) (wseg_append (wseg_of s142B_3) (wseg_append (wseg_of s142B_4) (wseg_append (wseg_of s142B_5) (wseg_append (wseg_of s142B_6) (wseg_append (wseg_of s142B_7) (wseg_append (wseg_of s142B_8) (wseg_append (wseg_of s142B_9) (wseg_append (wseg_of s142B_10) (wseg_append (wseg_of s142B_11) (wseg_of s142B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t143A : List Tok := t143A_0 ++ (t143A_1 ++ (t143A_2 ++ (t143A_3 ++ (t143A_4 ++ (t143A_5 ++ (t143A_6 ++ (t143A_7 ++ (t143A_8 ++ (t143A_9 ++ (t143A_10 ++ (t143A_11 ++ (t143A_12 ++ (t143A_13 ++ (t143A_14 ++ (t143A_15 ++ (t143A_16 ++ (t143A_17 ++ (t143A_18 ++ (t143A_19 ++ (t143A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t143B : List Tok := t143B_0 ++ (t143B_1 ++ (t143B_2 ++ (t143B_3 ++ (t143B_4 ++ (t143B_5 ++ (t143B_6 ++ (t143B_7 ++ (t143B_8 ++ (t143B_9 ++ (t143B_10 ++ (t143B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 143：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run143 : (nbRun P nb143 0 kN143 t143A).1 = true ∧ (nbRun P nb143 1 kN143 t143B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s143A_0) (wseg_append (wseg_of s143A_1) (wseg_append (wseg_of s143A_2) (wseg_append (wseg_of s143A_3) (wseg_append (wseg_of s143A_4) (wseg_append (wseg_of s143A_5) (wseg_append (wseg_of s143A_6) (wseg_append (wseg_of s143A_7) (wseg_append (wseg_of s143A_8) (wseg_append (wseg_of s143A_9) (wseg_append (wseg_of s143A_10) (wseg_append (wseg_of s143A_11) (wseg_append (wseg_of s143A_12) (wseg_append (wseg_of s143A_13) (wseg_append (wseg_of s143A_14) (wseg_append (wseg_of s143A_15) (wseg_append (wseg_of s143A_16) (wseg_append (wseg_of s143A_17) (wseg_append (wseg_of s143A_18) (wseg_append (wseg_of s143A_19) (wseg_of s143A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s143B_0) (wseg_append (wseg_of s143B_1) (wseg_append (wseg_of s143B_2) (wseg_append (wseg_of s143B_3) (wseg_append (wseg_of s143B_4) (wseg_append (wseg_of s143B_5) (wseg_append (wseg_of s143B_6) (wseg_append (wseg_of s143B_7) (wseg_append (wseg_of s143B_8) (wseg_append (wseg_of s143B_9) (wseg_append (wseg_of s143B_10) (wseg_of s143B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t144A : List Tok := t144A_0 ++ (t144A_1 ++ (t144A_2 ++ (t144A_3 ++ (t144A_4 ++ (t144A_5 ++ (t144A_6 ++ (t144A_7 ++ (t144A_8 ++ (t144A_9 ++ (t144A_10 ++ (t144A_11 ++ (t144A_12 ++ (t144A_13 ++ (t144A_14 ++ (t144A_15 ++ (t144A_16 ++ (t144A_17 ++ (t144A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t144B : List Tok := t144B_0 ++ (t144B_1 ++ (t144B_2 ++ (t144B_3 ++ (t144B_4 ++ (t144B_5 ++ (t144B_6 ++ (t144B_7 ++ (t144B_8 ++ (t144B_9 ++ (t144B_10 ++ (t144B_11 ++ (t144B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 144：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run144 : (nbRun P nb144 0 kN144 t144A).1 = true ∧ (nbRun P nb144 1 kN144 t144B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s144A_0) (wseg_append (wseg_of s144A_1) (wseg_append (wseg_of s144A_2) (wseg_append (wseg_of s144A_3) (wseg_append (wseg_of s144A_4) (wseg_append (wseg_of s144A_5) (wseg_append (wseg_of s144A_6) (wseg_append (wseg_of s144A_7) (wseg_append (wseg_of s144A_8) (wseg_append (wseg_of s144A_9) (wseg_append (wseg_of s144A_10) (wseg_append (wseg_of s144A_11) (wseg_append (wseg_of s144A_12) (wseg_append (wseg_of s144A_13) (wseg_append (wseg_of s144A_14) (wseg_append (wseg_of s144A_15) (wseg_append (wseg_of s144A_16) (wseg_append (wseg_of s144A_17) (wseg_of s144A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s144B_0) (wseg_append (wseg_of s144B_1) (wseg_append (wseg_of s144B_2) (wseg_append (wseg_of s144B_3) (wseg_append (wseg_of s144B_4) (wseg_append (wseg_of s144B_5) (wseg_append (wseg_of s144B_6) (wseg_append (wseg_of s144B_7) (wseg_append (wseg_of s144B_8) (wseg_append (wseg_of s144B_9) (wseg_append (wseg_of s144B_10) (wseg_append (wseg_of s144B_11) (wseg_of s144B_12)))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145A : List Tok := t145A_0 ++ (t145A_1 ++ (t145A_2 ++ (t145A_3 ++ (t145A_4 ++ (t145A_5 ++ (t145A_6 ++ (t145A_7 ++ (t145A_8 ++ (t145A_9 ++ (t145A_10 ++ (t145A_11 ++ (t145A_12 ++ (t145A_13 ++ (t145A_14 ++ (t145A_15 ++ (t145A_16 ++ (t145A_17 ++ (t145A_18 ++ (t145A_19 ++ (t145A_20 ++ (t145A_21 ++ (t145A_22 ++ (t145A_23 ++ (t145A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t145B : List Tok := t145B_0 ++ (t145B_1 ++ (t145B_2 ++ (t145B_3 ++ (t145B_4 ++ (t145B_5 ++ (t145B_6 ++ (t145B_7 ++ (t145B_8 ++ (t145B_9 ++ (t145B_10 ++ (t145B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 145：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run145 : (nbRun P nb145 0 kN145 t145A).1 = true ∧ (nbRun P nb145 1 kN145 t145B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s145A_0) (wseg_append (wseg_of s145A_1) (wseg_append (wseg_of s145A_2) (wseg_append (wseg_of s145A_3) (wseg_append (wseg_of s145A_4) (wseg_append (wseg_of s145A_5) (wseg_append (wseg_of s145A_6) (wseg_append (wseg_of s145A_7) (wseg_append (wseg_of s145A_8) (wseg_append (wseg_of s145A_9) (wseg_append (wseg_of s145A_10) (wseg_append (wseg_of s145A_11) (wseg_append (wseg_of s145A_12) (wseg_append (wseg_of s145A_13) (wseg_append (wseg_of s145A_14) (wseg_append (wseg_of s145A_15) (wseg_append (wseg_of s145A_16) (wseg_append (wseg_of s145A_17) (wseg_append (wseg_of s145A_18) (wseg_append (wseg_of s145A_19) (wseg_append (wseg_of s145A_20) (wseg_append (wseg_of s145A_21) (wseg_append (wseg_of s145A_22) (wseg_append (wseg_of s145A_23) (wseg_of s145A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s145B_0) (wseg_append (wseg_of s145B_1) (wseg_append (wseg_of s145B_2) (wseg_append (wseg_of s145B_3) (wseg_append (wseg_of s145B_4) (wseg_append (wseg_of s145B_5) (wseg_append (wseg_of s145B_6) (wseg_append (wseg_of s145B_7) (wseg_append (wseg_of s145B_8) (wseg_append (wseg_of s145B_9) (wseg_append (wseg_of s145B_10) (wseg_of s145B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t146A : List Tok := t146A_0 ++ (t146A_1 ++ (t146A_2 ++ (t146A_3 ++ (t146A_4 ++ (t146A_5 ++ (t146A_6 ++ (t146A_7 ++ (t146A_8 ++ (t146A_9 ++ (t146A_10 ++ (t146A_11 ++ (t146A_12 ++ (t146A_13 ++ (t146A_14 ++ (t146A_15 ++ (t146A_16 ++ (t146A_17 ++ (t146A_18 ++ (t146A_19 ++ (t146A_20 ++ (t146A_21 ++ (t146A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t146B : List Tok := t146B_0 ++ (t146B_1 ++ (t146B_2 ++ (t146B_3 ++ (t146B_4 ++ (t146B_5 ++ (t146B_6 ++ (t146B_7 ++ (t146B_8 ++ (t146B_9 ++ (t146B_10 ++ (t146B_11 ++ (t146B_12))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 146：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run146 : (nbRun P nb146 0 kN146 t146A).1 = true ∧ (nbRun P nb146 1 kN146 t146B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s146A_0) (wseg_append (wseg_of s146A_1) (wseg_append (wseg_of s146A_2) (wseg_append (wseg_of s146A_3) (wseg_append (wseg_of s146A_4) (wseg_append (wseg_of s146A_5) (wseg_append (wseg_of s146A_6) (wseg_append (wseg_of s146A_7) (wseg_append (wseg_of s146A_8) (wseg_append (wseg_of s146A_9) (wseg_append (wseg_of s146A_10) (wseg_append (wseg_of s146A_11) (wseg_append (wseg_of s146A_12) (wseg_append (wseg_of s146A_13) (wseg_append (wseg_of s146A_14) (wseg_append (wseg_of s146A_15) (wseg_append (wseg_of s146A_16) (wseg_append (wseg_of s146A_17) (wseg_append (wseg_of s146A_18) (wseg_append (wseg_of s146A_19) (wseg_append (wseg_of s146A_20) (wseg_append (wseg_of s146A_21) (wseg_of s146A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s146B_0) (wseg_append (wseg_of s146B_1) (wseg_append (wseg_of s146B_2) (wseg_append (wseg_of s146B_3) (wseg_append (wseg_of s146B_4) (wseg_append (wseg_of s146B_5) (wseg_append (wseg_of s146B_6) (wseg_append (wseg_of s146B_7) (wseg_append (wseg_of s146B_8) (wseg_append (wseg_of s146B_9) (wseg_append (wseg_of s146B_10) (wseg_append (wseg_of s146B_11) (wseg_of s146B_12)))))))))))))⟩

end PackLean.D40.Tet
