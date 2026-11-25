-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS058_0
import PackLean.D40.K.FarS058_1
import PackLean.D40.K.FarS058_2
import PackLean.D40.K.FarS058_3
import PackLean.D40.K.FarS058_4
import PackLean.D40.K.FarS058_5
import PackLean.D40.K.FarS058_6
import PackLean.D40.K.FarS058_7
import PackLean.D40.K.FarS058_8
import PackLean.D40.K.FarS058_9
import PackLean.D40.K.FarS058_10
import PackLean.D40.K.FarS058_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t204A : List Tok := t204A_0 ++ (t204A_1 ++ (t204A_2 ++ (t204A_3 ++ (t204A_4 ++ (t204A_5 ++ (t204A_6 ++ (t204A_7 ++ (t204A_8 ++ (t204A_9 ++ (t204A_10 ++ (t204A_11 ++ (t204A_12 ++ (t204A_13 ++ (t204A_14 ++ (t204A_15 ++ (t204A_16 ++ (t204A_17 ++ (t204A_18 ++ (t204A_19 ++ (t204A_20 ++ (t204A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t204B : List Tok := t204B_0 ++ (t204B_1 ++ (t204B_2 ++ (t204B_3 ++ (t204B_4 ++ (t204B_5 ++ (t204B_6 ++ (t204B_7 ++ (t204B_8 ++ (t204B_9 ++ (t204B_10 ++ (t204B_11 ++ (t204B_12 ++ (t204B_13 ++ (t204B_14 ++ (t204B_15 ++ (t204B_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 204：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run204 : (nbRun P nb204 0 kN204 t204A).1 = true ∧ (nbRun P nb204 1 kN204 t204B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s204A_0) (wseg_append (wseg_of s204A_1) (wseg_append (wseg_of s204A_2) (wseg_append (wseg_of s204A_3) (wseg_append (wseg_of s204A_4) (wseg_append (wseg_of s204A_5) (wseg_append (wseg_of s204A_6) (wseg_append (wseg_of s204A_7) (wseg_append (wseg_of s204A_8) (wseg_append (wseg_of s204A_9) (wseg_append (wseg_of s204A_10) (wseg_append (wseg_of s204A_11) (wseg_append (wseg_of s204A_12) (wseg_append (wseg_of s204A_13) (wseg_append (wseg_of s204A_14) (wseg_append (wseg_of s204A_15) (wseg_append (wseg_of s204A_16) (wseg_append (wseg_of s204A_17) (wseg_append (wseg_of s204A_18) (wseg_append (wseg_of s204A_19) (wseg_append (wseg_of s204A_20) (wseg_of s204A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s204B_0) (wseg_append (wseg_of s204B_1) (wseg_append (wseg_of s204B_2) (wseg_append (wseg_of s204B_3) (wseg_append (wseg_of s204B_4) (wseg_append (wseg_of s204B_5) (wseg_append (wseg_of s204B_6) (wseg_append (wseg_of s204B_7) (wseg_append (wseg_of s204B_8) (wseg_append (wseg_of s204B_9) (wseg_append (wseg_of s204B_10) (wseg_append (wseg_of s204B_11) (wseg_append (wseg_of s204B_12) (wseg_append (wseg_of s204B_13) (wseg_append (wseg_of s204B_14) (wseg_append (wseg_of s204B_15) (wseg_of s204B_16)))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t205A : List Tok := t205A_0 ++ (t205A_1 ++ (t205A_2 ++ (t205A_3 ++ (t205A_4 ++ (t205A_5 ++ (t205A_6 ++ (t205A_7 ++ (t205A_8 ++ (t205A_9 ++ (t205A_10 ++ (t205A_11 ++ (t205A_12 ++ (t205A_13 ++ (t205A_14 ++ (t205A_15 ++ (t205A_16 ++ (t205A_17 ++ (t205A_18 ++ (t205A_19 ++ (t205A_20 ++ (t205A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t205B : List Tok := t205B_0 ++ (t205B_1 ++ (t205B_2 ++ (t205B_3 ++ (t205B_4 ++ (t205B_5 ++ (t205B_6 ++ (t205B_7 ++ (t205B_8 ++ (t205B_9 ++ (t205B_10 ++ (t205B_11 ++ (t205B_12 ++ (t205B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 205：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run205 : (nbRun P nb205 0 kN205 t205A).1 = true ∧ (nbRun P nb205 1 kN205 t205B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s205A_0) (wseg_append (wseg_of s205A_1) (wseg_append (wseg_of s205A_2) (wseg_append (wseg_of s205A_3) (wseg_append (wseg_of s205A_4) (wseg_append (wseg_of s205A_5) (wseg_append (wseg_of s205A_6) (wseg_append (wseg_of s205A_7) (wseg_append (wseg_of s205A_8) (wseg_append (wseg_of s205A_9) (wseg_append (wseg_of s205A_10) (wseg_append (wseg_of s205A_11) (wseg_append (wseg_of s205A_12) (wseg_append (wseg_of s205A_13) (wseg_append (wseg_of s205A_14) (wseg_append (wseg_of s205A_15) (wseg_append (wseg_of s205A_16) (wseg_append (wseg_of s205A_17) (wseg_append (wseg_of s205A_18) (wseg_append (wseg_of s205A_19) (wseg_append (wseg_of s205A_20) (wseg_of s205A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s205B_0) (wseg_append (wseg_of s205B_1) (wseg_append (wseg_of s205B_2) (wseg_append (wseg_of s205B_3) (wseg_append (wseg_of s205B_4) (wseg_append (wseg_of s205B_5) (wseg_append (wseg_of s205B_6) (wseg_append (wseg_of s205B_7) (wseg_append (wseg_of s205B_8) (wseg_append (wseg_of s205B_9) (wseg_append (wseg_of s205B_10) (wseg_append (wseg_of s205B_11) (wseg_append (wseg_of s205B_12) (wseg_of s205B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206A : List Tok := t206A_0 ++ (t206A_1 ++ (t206A_2 ++ (t206A_3 ++ (t206A_4 ++ (t206A_5 ++ (t206A_6 ++ (t206A_7 ++ (t206A_8 ++ (t206A_9 ++ (t206A_10 ++ (t206A_11 ++ (t206A_12 ++ (t206A_13 ++ (t206A_14 ++ (t206A_15 ++ (t206A_16 ++ (t206A_17 ++ (t206A_18 ++ (t206A_19)))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t206B : List Tok := t206B_0 ++ (t206B_1 ++ (t206B_2 ++ (t206B_3 ++ (t206B_4 ++ (t206B_5 ++ (t206B_6 ++ (t206B_7 ++ (t206B_8 ++ (t206B_9 ++ (t206B_10 ++ (t206B_11 ++ (t206B_12 ++ (t206B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 206：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run206 : (nbRun P nb206 0 kN206 t206A).1 = true ∧ (nbRun P nb206 1 kN206 t206B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s206A_0) (wseg_append (wseg_of s206A_1) (wseg_append (wseg_of s206A_2) (wseg_append (wseg_of s206A_3) (wseg_append (wseg_of s206A_4) (wseg_append (wseg_of s206A_5) (wseg_append (wseg_of s206A_6) (wseg_append (wseg_of s206A_7) (wseg_append (wseg_of s206A_8) (wseg_append (wseg_of s206A_9) (wseg_append (wseg_of s206A_10) (wseg_append (wseg_of s206A_11) (wseg_append (wseg_of s206A_12) (wseg_append (wseg_of s206A_13) (wseg_append (wseg_of s206A_14) (wseg_append (wseg_of s206A_15) (wseg_append (wseg_of s206A_16) (wseg_append (wseg_of s206A_17) (wseg_append (wseg_of s206A_18) (wseg_of s206A_19)))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s206B_0) (wseg_append (wseg_of s206B_1) (wseg_append (wseg_of s206B_2) (wseg_append (wseg_of s206B_3) (wseg_append (wseg_of s206B_4) (wseg_append (wseg_of s206B_5) (wseg_append (wseg_of s206B_6) (wseg_append (wseg_of s206B_7) (wseg_append (wseg_of s206B_8) (wseg_append (wseg_of s206B_9) (wseg_append (wseg_of s206B_10) (wseg_append (wseg_of s206B_11) (wseg_append (wseg_of s206B_12) (wseg_of s206B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207A : List Tok := t207A_0 ++ (t207A_1 ++ (t207A_2 ++ (t207A_3 ++ (t207A_4 ++ (t207A_5 ++ (t207A_6 ++ (t207A_7 ++ (t207A_8 ++ (t207A_9 ++ (t207A_10 ++ (t207A_11 ++ (t207A_12 ++ (t207A_13 ++ (t207A_14 ++ (t207A_15 ++ (t207A_16 ++ (t207A_17 ++ (t207A_18 ++ (t207A_19 ++ (t207A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t207B : List Tok := t207B_0 ++ (t207B_1 ++ (t207B_2 ++ (t207B_3 ++ (t207B_4 ++ (t207B_5 ++ (t207B_6 ++ (t207B_7 ++ (t207B_8 ++ (t207B_9 ++ (t207B_10 ++ (t207B_11 ++ (t207B_12 ++ (t207B_13 ++ (t207B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 207：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run207 : (nbRun P nb207 0 kN207 t207A).1 = true ∧ (nbRun P nb207 1 kN207 t207B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s207A_0) (wseg_append (wseg_of s207A_1) (wseg_append (wseg_of s207A_2) (wseg_append (wseg_of s207A_3) (wseg_append (wseg_of s207A_4) (wseg_append (wseg_of s207A_5) (wseg_append (wseg_of s207A_6) (wseg_append (wseg_of s207A_7) (wseg_append (wseg_of s207A_8) (wseg_append (wseg_of s207A_9) (wseg_append (wseg_of s207A_10) (wseg_append (wseg_of s207A_11) (wseg_append (wseg_of s207A_12) (wseg_append (wseg_of s207A_13) (wseg_append (wseg_of s207A_14) (wseg_append (wseg_of s207A_15) (wseg_append (wseg_of s207A_16) (wseg_append (wseg_of s207A_17) (wseg_append (wseg_of s207A_18) (wseg_append (wseg_of s207A_19) (wseg_of s207A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s207B_0) (wseg_append (wseg_of s207B_1) (wseg_append (wseg_of s207B_2) (wseg_append (wseg_of s207B_3) (wseg_append (wseg_of s207B_4) (wseg_append (wseg_of s207B_5) (wseg_append (wseg_of s207B_6) (wseg_append (wseg_of s207B_7) (wseg_append (wseg_of s207B_8) (wseg_append (wseg_of s207B_9) (wseg_append (wseg_of s207B_10) (wseg_append (wseg_of s207B_11) (wseg_append (wseg_of s207B_12) (wseg_append (wseg_of s207B_13) (wseg_of s207B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t208A : List Tok := t208A_0 ++ (t208A_1 ++ (t208A_2 ++ (t208A_3 ++ (t208A_4 ++ (t208A_5 ++ (t208A_6 ++ (t208A_7 ++ (t208A_8 ++ (t208A_9 ++ (t208A_10 ++ (t208A_11 ++ (t208A_12 ++ (t208A_13 ++ (t208A_14 ++ (t208A_15 ++ (t208A_16 ++ (t208A_17 ++ (t208A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t208B : List Tok := t208B_0 ++ (t208B_1 ++ (t208B_2 ++ (t208B_3 ++ (t208B_4 ++ (t208B_5 ++ (t208B_6 ++ (t208B_7 ++ (t208B_8 ++ (t208B_9 ++ (t208B_10 ++ (t208B_11 ++ (t208B_12 ++ (t208B_13 ++ (t208B_14 ++ (t208B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 208：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run208 : (nbRun P nb208 0 kN208 t208A).1 = true ∧ (nbRun P nb208 1 kN208 t208B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s208A_0) (wseg_append (wseg_of s208A_1) (wseg_append (wseg_of s208A_2) (wseg_append (wseg_of s208A_3) (wseg_append (wseg_of s208A_4) (wseg_append (wseg_of s208A_5) (wseg_append (wseg_of s208A_6) (wseg_append (wseg_of s208A_7) (wseg_append (wseg_of s208A_8) (wseg_append (wseg_of s208A_9) (wseg_append (wseg_of s208A_10) (wseg_append (wseg_of s208A_11) (wseg_append (wseg_of s208A_12) (wseg_append (wseg_of s208A_13) (wseg_append (wseg_of s208A_14) (wseg_append (wseg_of s208A_15) (wseg_append (wseg_of s208A_16) (wseg_append (wseg_of s208A_17) (wseg_of s208A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s208B_0) (wseg_append (wseg_of s208B_1) (wseg_append (wseg_of s208B_2) (wseg_append (wseg_of s208B_3) (wseg_append (wseg_of s208B_4) (wseg_append (wseg_of s208B_5) (wseg_append (wseg_of s208B_6) (wseg_append (wseg_of s208B_7) (wseg_append (wseg_of s208B_8) (wseg_append (wseg_of s208B_9) (wseg_append (wseg_of s208B_10) (wseg_append (wseg_of s208B_11) (wseg_append (wseg_of s208B_12) (wseg_append (wseg_of s208B_13) (wseg_append (wseg_of s208B_14) (wseg_of s208B_15))))))))))))))))⟩

end PackLean.D40.Tet
