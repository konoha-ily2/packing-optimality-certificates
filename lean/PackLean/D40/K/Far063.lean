-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS063_0
import PackLean.D40.K.FarS063_1
import PackLean.D40.K.FarS063_2
import PackLean.D40.K.FarS063_3
import PackLean.D40.K.FarS063_4
import PackLean.D40.K.FarS063_5
import PackLean.D40.K.FarS063_6
import PackLean.D40.K.FarS063_7
import PackLean.D40.K.FarS063_8
import PackLean.D40.K.FarS063_9
import PackLean.D40.K.FarS063_10
import PackLean.D40.K.FarS063_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t226A : List Tok := t226A_0 ++ (t226A_1 ++ (t226A_2 ++ (t226A_3 ++ (t226A_4 ++ (t226A_5 ++ (t226A_6 ++ (t226A_7 ++ (t226A_8 ++ (t226A_9 ++ (t226A_10 ++ (t226A_11 ++ (t226A_12 ++ (t226A_13 ++ (t226A_14 ++ (t226A_15 ++ (t226A_16 ++ (t226A_17 ++ (t226A_18 ++ (t226A_19 ++ (t226A_20 ++ (t226A_21 ++ (t226A_22 ++ (t226A_23 ++ (t226A_24 ++ (t226A_25 ++ (t226A_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t226B : List Tok := t226B_0 ++ (t226B_1 ++ (t226B_2 ++ (t226B_3 ++ (t226B_4 ++ (t226B_5 ++ (t226B_6 ++ (t226B_7 ++ (t226B_8 ++ (t226B_9 ++ (t226B_10 ++ (t226B_11 ++ (t226B_12 ++ (t226B_13 ++ (t226B_14 ++ (t226B_15 ++ (t226B_16 ++ (t226B_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 226：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run226 : (nbRun P nb226 0 kN226 t226A).1 = true ∧ (nbRun P nb226 1 kN226 t226B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s226A_0) (wseg_append (wseg_of s226A_1) (wseg_append (wseg_of s226A_2) (wseg_append (wseg_of s226A_3) (wseg_append (wseg_of s226A_4) (wseg_append (wseg_of s226A_5) (wseg_append (wseg_of s226A_6) (wseg_append (wseg_of s226A_7) (wseg_append (wseg_of s226A_8) (wseg_append (wseg_of s226A_9) (wseg_append (wseg_of s226A_10) (wseg_append (wseg_of s226A_11) (wseg_append (wseg_of s226A_12) (wseg_append (wseg_of s226A_13) (wseg_append (wseg_of s226A_14) (wseg_append (wseg_of s226A_15) (wseg_append (wseg_of s226A_16) (wseg_append (wseg_of s226A_17) (wseg_append (wseg_of s226A_18) (wseg_append (wseg_of s226A_19) (wseg_append (wseg_of s226A_20) (wseg_append (wseg_of s226A_21) (wseg_append (wseg_of s226A_22) (wseg_append (wseg_of s226A_23) (wseg_append (wseg_of s226A_24) (wseg_append (wseg_of s226A_25) (wseg_of s226A_26))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s226B_0) (wseg_append (wseg_of s226B_1) (wseg_append (wseg_of s226B_2) (wseg_append (wseg_of s226B_3) (wseg_append (wseg_of s226B_4) (wseg_append (wseg_of s226B_5) (wseg_append (wseg_of s226B_6) (wseg_append (wseg_of s226B_7) (wseg_append (wseg_of s226B_8) (wseg_append (wseg_of s226B_9) (wseg_append (wseg_of s226B_10) (wseg_append (wseg_of s226B_11) (wseg_append (wseg_of s226B_12) (wseg_append (wseg_of s226B_13) (wseg_append (wseg_of s226B_14) (wseg_append (wseg_of s226B_15) (wseg_append (wseg_of s226B_16) (wseg_of s226B_17))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t227A : List Tok := t227A_0 ++ (t227A_1 ++ (t227A_2 ++ (t227A_3 ++ (t227A_4 ++ (t227A_5 ++ (t227A_6 ++ (t227A_7 ++ (t227A_8 ++ (t227A_9 ++ (t227A_10 ++ (t227A_11 ++ (t227A_12 ++ (t227A_13 ++ (t227A_14 ++ (t227A_15 ++ (t227A_16 ++ (t227A_17 ++ (t227A_18 ++ (t227A_19 ++ (t227A_20 ++ (t227A_21 ++ (t227A_22 ++ (t227A_23 ++ (t227A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t227B : List Tok := t227B_0 ++ (t227B_1 ++ (t227B_2 ++ (t227B_3 ++ (t227B_4 ++ (t227B_5 ++ (t227B_6 ++ (t227B_7 ++ (t227B_8 ++ (t227B_9 ++ (t227B_10 ++ (t227B_11 ++ (t227B_12 ++ (t227B_13 ++ (t227B_14 ++ (t227B_15 ++ (t227B_16 ++ (t227B_17 ++ (t227B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 227：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run227 : (nbRun P nb227 0 kN227 t227A).1 = true ∧ (nbRun P nb227 1 kN227 t227B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s227A_0) (wseg_append (wseg_of s227A_1) (wseg_append (wseg_of s227A_2) (wseg_append (wseg_of s227A_3) (wseg_append (wseg_of s227A_4) (wseg_append (wseg_of s227A_5) (wseg_append (wseg_of s227A_6) (wseg_append (wseg_of s227A_7) (wseg_append (wseg_of s227A_8) (wseg_append (wseg_of s227A_9) (wseg_append (wseg_of s227A_10) (wseg_append (wseg_of s227A_11) (wseg_append (wseg_of s227A_12) (wseg_append (wseg_of s227A_13) (wseg_append (wseg_of s227A_14) (wseg_append (wseg_of s227A_15) (wseg_append (wseg_of s227A_16) (wseg_append (wseg_of s227A_17) (wseg_append (wseg_of s227A_18) (wseg_append (wseg_of s227A_19) (wseg_append (wseg_of s227A_20) (wseg_append (wseg_of s227A_21) (wseg_append (wseg_of s227A_22) (wseg_append (wseg_of s227A_23) (wseg_of s227A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s227B_0) (wseg_append (wseg_of s227B_1) (wseg_append (wseg_of s227B_2) (wseg_append (wseg_of s227B_3) (wseg_append (wseg_of s227B_4) (wseg_append (wseg_of s227B_5) (wseg_append (wseg_of s227B_6) (wseg_append (wseg_of s227B_7) (wseg_append (wseg_of s227B_8) (wseg_append (wseg_of s227B_9) (wseg_append (wseg_of s227B_10) (wseg_append (wseg_of s227B_11) (wseg_append (wseg_of s227B_12) (wseg_append (wseg_of s227B_13) (wseg_append (wseg_of s227B_14) (wseg_append (wseg_of s227B_15) (wseg_append (wseg_of s227B_16) (wseg_append (wseg_of s227B_17) (wseg_of s227B_18)))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t228A : List Tok := t228A_0 ++ (t228A_1 ++ (t228A_2 ++ (t228A_3 ++ (t228A_4 ++ (t228A_5 ++ (t228A_6 ++ (t228A_7 ++ (t228A_8 ++ (t228A_9 ++ (t228A_10 ++ (t228A_11 ++ (t228A_12 ++ (t228A_13 ++ (t228A_14 ++ (t228A_15 ++ (t228A_16 ++ (t228A_17 ++ (t228A_18 ++ (t228A_19 ++ (t228A_20 ++ (t228A_21 ++ (t228A_22 ++ (t228A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t228B : List Tok := t228B_0 ++ (t228B_1 ++ (t228B_2 ++ (t228B_3 ++ (t228B_4 ++ (t228B_5 ++ (t228B_6 ++ (t228B_7 ++ (t228B_8 ++ (t228B_9 ++ (t228B_10 ++ (t228B_11 ++ (t228B_12 ++ (t228B_13 ++ (t228B_14 ++ (t228B_15 ++ (t228B_16 ++ (t228B_17 ++ (t228B_18 ++ (t228B_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 228：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run228 : (nbRun P nb228 0 kN228 t228A).1 = true ∧ (nbRun P nb228 1 kN228 t228B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s228A_0) (wseg_append (wseg_of s228A_1) (wseg_append (wseg_of s228A_2) (wseg_append (wseg_of s228A_3) (wseg_append (wseg_of s228A_4) (wseg_append (wseg_of s228A_5) (wseg_append (wseg_of s228A_6) (wseg_append (wseg_of s228A_7) (wseg_append (wseg_of s228A_8) (wseg_append (wseg_of s228A_9) (wseg_append (wseg_of s228A_10) (wseg_append (wseg_of s228A_11) (wseg_append (wseg_of s228A_12) (wseg_append (wseg_of s228A_13) (wseg_append (wseg_of s228A_14) (wseg_append (wseg_of s228A_15) (wseg_append (wseg_of s228A_16) (wseg_append (wseg_of s228A_17) (wseg_append (wseg_of s228A_18) (wseg_append (wseg_of s228A_19) (wseg_append (wseg_of s228A_20) (wseg_append (wseg_of s228A_21) (wseg_append (wseg_of s228A_22) (wseg_of s228A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s228B_0) (wseg_append (wseg_of s228B_1) (wseg_append (wseg_of s228B_2) (wseg_append (wseg_of s228B_3) (wseg_append (wseg_of s228B_4) (wseg_append (wseg_of s228B_5) (wseg_append (wseg_of s228B_6) (wseg_append (wseg_of s228B_7) (wseg_append (wseg_of s228B_8) (wseg_append (wseg_of s228B_9) (wseg_append (wseg_of s228B_10) (wseg_append (wseg_of s228B_11) (wseg_append (wseg_of s228B_12) (wseg_append (wseg_of s228B_13) (wseg_append (wseg_of s228B_14) (wseg_append (wseg_of s228B_15) (wseg_append (wseg_of s228B_16) (wseg_append (wseg_of s228B_17) (wseg_append (wseg_of s228B_18) (wseg_of s228B_19))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t229A : List Tok := t229A_0 ++ (t229A_1 ++ (t229A_2 ++ (t229A_3 ++ (t229A_4 ++ (t229A_5 ++ (t229A_6 ++ (t229A_7 ++ (t229A_8 ++ (t229A_9 ++ (t229A_10 ++ (t229A_11 ++ (t229A_12 ++ (t229A_13 ++ (t229A_14 ++ (t229A_15 ++ (t229A_16 ++ (t229A_17 ++ (t229A_18 ++ (t229A_19 ++ (t229A_20 ++ (t229A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t229B : List Tok := t229B_0 ++ (t229B_1 ++ (t229B_2 ++ (t229B_3 ++ (t229B_4 ++ (t229B_5 ++ (t229B_6 ++ (t229B_7 ++ (t229B_8 ++ (t229B_9 ++ (t229B_10 ++ (t229B_11 ++ (t229B_12 ++ (t229B_13 ++ (t229B_14 ++ (t229B_15 ++ (t229B_16 ++ (t229B_17 ++ (t229B_18 ++ (t229B_19 ++ (t229B_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 229：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run229 : (nbRun P nb229 0 kN229 t229A).1 = true ∧ (nbRun P nb229 1 kN229 t229B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s229A_0) (wseg_append (wseg_of s229A_1) (wseg_append (wseg_of s229A_2) (wseg_append (wseg_of s229A_3) (wseg_append (wseg_of s229A_4) (wseg_append (wseg_of s229A_5) (wseg_append (wseg_of s229A_6) (wseg_append (wseg_of s229A_7) (wseg_append (wseg_of s229A_8) (wseg_append (wseg_of s229A_9) (wseg_append (wseg_of s229A_10) (wseg_append (wseg_of s229A_11) (wseg_append (wseg_of s229A_12) (wseg_append (wseg_of s229A_13) (wseg_append (wseg_of s229A_14) (wseg_append (wseg_of s229A_15) (wseg_append (wseg_of s229A_16) (wseg_append (wseg_of s229A_17) (wseg_append (wseg_of s229A_18) (wseg_append (wseg_of s229A_19) (wseg_append (wseg_of s229A_20) (wseg_of s229A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s229B_0) (wseg_append (wseg_of s229B_1) (wseg_append (wseg_of s229B_2) (wseg_append (wseg_of s229B_3) (wseg_append (wseg_of s229B_4) (wseg_append (wseg_of s229B_5) (wseg_append (wseg_of s229B_6) (wseg_append (wseg_of s229B_7) (wseg_append (wseg_of s229B_8) (wseg_append (wseg_of s229B_9) (wseg_append (wseg_of s229B_10) (wseg_append (wseg_of s229B_11) (wseg_append (wseg_of s229B_12) (wseg_append (wseg_of s229B_13) (wseg_append (wseg_of s229B_14) (wseg_append (wseg_of s229B_15) (wseg_append (wseg_of s229B_16) (wseg_append (wseg_of s229B_17) (wseg_append (wseg_of s229B_18) (wseg_append (wseg_of s229B_19) (wseg_of s229B_20)))))))))))))))))))))⟩

end PackLean.D40.Tet
