-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS061_0
import PackLean.D40.K.FarS061_1
import PackLean.D40.K.FarS061_2
import PackLean.D40.K.FarS061_3
import PackLean.D40.K.FarS061_4
import PackLean.D40.K.FarS061_5
import PackLean.D40.K.FarS061_6
import PackLean.D40.K.FarS061_7
import PackLean.D40.K.FarS061_8
import PackLean.D40.K.FarS061_9
import PackLean.D40.K.FarS061_10
import PackLean.D40.K.FarS061_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t218A : List Tok := t218A_0 ++ (t218A_1 ++ (t218A_2 ++ (t218A_3 ++ (t218A_4 ++ (t218A_5 ++ (t218A_6 ++ (t218A_7 ++ (t218A_8 ++ (t218A_9 ++ (t218A_10 ++ (t218A_11 ++ (t218A_12 ++ (t218A_13 ++ (t218A_14 ++ (t218A_15 ++ (t218A_16 ++ (t218A_17 ++ (t218A_18 ++ (t218A_19 ++ (t218A_20 ++ (t218A_21 ++ (t218A_22 ++ (t218A_23 ++ (t218A_24 ++ (t218A_25 ++ (t218A_26 ++ (t218A_27 ++ (t218A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t218B : List Tok := t218B_0 ++ (t218B_1 ++ (t218B_2 ++ (t218B_3 ++ (t218B_4 ++ (t218B_5 ++ (t218B_6 ++ (t218B_7 ++ (t218B_8 ++ (t218B_9 ++ (t218B_10 ++ (t218B_11 ++ (t218B_12 ++ (t218B_13 ++ (t218B_14 ++ (t218B_15 ++ (t218B_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 218：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run218 : (nbRun P nb218 0 kN218 t218A).1 = true ∧ (nbRun P nb218 1 kN218 t218B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s218A_0) (wseg_append (wseg_of s218A_1) (wseg_append (wseg_of s218A_2) (wseg_append (wseg_of s218A_3) (wseg_append (wseg_of s218A_4) (wseg_append (wseg_of s218A_5) (wseg_append (wseg_of s218A_6) (wseg_append (wseg_of s218A_7) (wseg_append (wseg_of s218A_8) (wseg_append (wseg_of s218A_9) (wseg_append (wseg_of s218A_10) (wseg_append (wseg_of s218A_11) (wseg_append (wseg_of s218A_12) (wseg_append (wseg_of s218A_13) (wseg_append (wseg_of s218A_14) (wseg_append (wseg_of s218A_15) (wseg_append (wseg_of s218A_16) (wseg_append (wseg_of s218A_17) (wseg_append (wseg_of s218A_18) (wseg_append (wseg_of s218A_19) (wseg_append (wseg_of s218A_20) (wseg_append (wseg_of s218A_21) (wseg_append (wseg_of s218A_22) (wseg_append (wseg_of s218A_23) (wseg_append (wseg_of s218A_24) (wseg_append (wseg_of s218A_25) (wseg_append (wseg_of s218A_26) (wseg_append (wseg_of s218A_27) (wseg_of s218A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s218B_0) (wseg_append (wseg_of s218B_1) (wseg_append (wseg_of s218B_2) (wseg_append (wseg_of s218B_3) (wseg_append (wseg_of s218B_4) (wseg_append (wseg_of s218B_5) (wseg_append (wseg_of s218B_6) (wseg_append (wseg_of s218B_7) (wseg_append (wseg_of s218B_8) (wseg_append (wseg_of s218B_9) (wseg_append (wseg_of s218B_10) (wseg_append (wseg_of s218B_11) (wseg_append (wseg_of s218B_12) (wseg_append (wseg_of s218B_13) (wseg_append (wseg_of s218B_14) (wseg_append (wseg_of s218B_15) (wseg_of s218B_16)))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t219A : List Tok := t219A_0 ++ (t219A_1 ++ (t219A_2 ++ (t219A_3 ++ (t219A_4 ++ (t219A_5 ++ (t219A_6 ++ (t219A_7 ++ (t219A_8 ++ (t219A_9 ++ (t219A_10 ++ (t219A_11 ++ (t219A_12 ++ (t219A_13 ++ (t219A_14 ++ (t219A_15 ++ (t219A_16 ++ (t219A_17 ++ (t219A_18 ++ (t219A_19 ++ (t219A_20 ++ (t219A_21 ++ (t219A_22 ++ (t219A_23 ++ (t219A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t219B : List Tok := t219B_0 ++ (t219B_1 ++ (t219B_2 ++ (t219B_3 ++ (t219B_4 ++ (t219B_5 ++ (t219B_6 ++ (t219B_7 ++ (t219B_8 ++ (t219B_9 ++ (t219B_10 ++ (t219B_11 ++ (t219B_12 ++ (t219B_13 ++ (t219B_14 ++ (t219B_15 ++ (t219B_16))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 219：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run219 : (nbRun P nb219 0 kN219 t219A).1 = true ∧ (nbRun P nb219 1 kN219 t219B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s219A_0) (wseg_append (wseg_of s219A_1) (wseg_append (wseg_of s219A_2) (wseg_append (wseg_of s219A_3) (wseg_append (wseg_of s219A_4) (wseg_append (wseg_of s219A_5) (wseg_append (wseg_of s219A_6) (wseg_append (wseg_of s219A_7) (wseg_append (wseg_of s219A_8) (wseg_append (wseg_of s219A_9) (wseg_append (wseg_of s219A_10) (wseg_append (wseg_of s219A_11) (wseg_append (wseg_of s219A_12) (wseg_append (wseg_of s219A_13) (wseg_append (wseg_of s219A_14) (wseg_append (wseg_of s219A_15) (wseg_append (wseg_of s219A_16) (wseg_append (wseg_of s219A_17) (wseg_append (wseg_of s219A_18) (wseg_append (wseg_of s219A_19) (wseg_append (wseg_of s219A_20) (wseg_append (wseg_of s219A_21) (wseg_append (wseg_of s219A_22) (wseg_append (wseg_of s219A_23) (wseg_of s219A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s219B_0) (wseg_append (wseg_of s219B_1) (wseg_append (wseg_of s219B_2) (wseg_append (wseg_of s219B_3) (wseg_append (wseg_of s219B_4) (wseg_append (wseg_of s219B_5) (wseg_append (wseg_of s219B_6) (wseg_append (wseg_of s219B_7) (wseg_append (wseg_of s219B_8) (wseg_append (wseg_of s219B_9) (wseg_append (wseg_of s219B_10) (wseg_append (wseg_of s219B_11) (wseg_append (wseg_of s219B_12) (wseg_append (wseg_of s219B_13) (wseg_append (wseg_of s219B_14) (wseg_append (wseg_of s219B_15) (wseg_of s219B_16)))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t220A : List Tok := t220A_0 ++ (t220A_1 ++ (t220A_2 ++ (t220A_3 ++ (t220A_4 ++ (t220A_5 ++ (t220A_6 ++ (t220A_7 ++ (t220A_8 ++ (t220A_9 ++ (t220A_10 ++ (t220A_11 ++ (t220A_12 ++ (t220A_13 ++ (t220A_14 ++ (t220A_15 ++ (t220A_16 ++ (t220A_17 ++ (t220A_18 ++ (t220A_19 ++ (t220A_20 ++ (t220A_21 ++ (t220A_22 ++ (t220A_23 ++ (t220A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t220B : List Tok := t220B_0 ++ (t220B_1 ++ (t220B_2 ++ (t220B_3 ++ (t220B_4 ++ (t220B_5 ++ (t220B_6 ++ (t220B_7 ++ (t220B_8 ++ (t220B_9 ++ (t220B_10 ++ (t220B_11 ++ (t220B_12 ++ (t220B_13 ++ (t220B_14 ++ (t220B_15 ++ (t220B_16 ++ (t220B_17 ++ (t220B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 220：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run220 : (nbRun P nb220 0 kN220 t220A).1 = true ∧ (nbRun P nb220 1 kN220 t220B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s220A_0) (wseg_append (wseg_of s220A_1) (wseg_append (wseg_of s220A_2) (wseg_append (wseg_of s220A_3) (wseg_append (wseg_of s220A_4) (wseg_append (wseg_of s220A_5) (wseg_append (wseg_of s220A_6) (wseg_append (wseg_of s220A_7) (wseg_append (wseg_of s220A_8) (wseg_append (wseg_of s220A_9) (wseg_append (wseg_of s220A_10) (wseg_append (wseg_of s220A_11) (wseg_append (wseg_of s220A_12) (wseg_append (wseg_of s220A_13) (wseg_append (wseg_of s220A_14) (wseg_append (wseg_of s220A_15) (wseg_append (wseg_of s220A_16) (wseg_append (wseg_of s220A_17) (wseg_append (wseg_of s220A_18) (wseg_append (wseg_of s220A_19) (wseg_append (wseg_of s220A_20) (wseg_append (wseg_of s220A_21) (wseg_append (wseg_of s220A_22) (wseg_append (wseg_of s220A_23) (wseg_of s220A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s220B_0) (wseg_append (wseg_of s220B_1) (wseg_append (wseg_of s220B_2) (wseg_append (wseg_of s220B_3) (wseg_append (wseg_of s220B_4) (wseg_append (wseg_of s220B_5) (wseg_append (wseg_of s220B_6) (wseg_append (wseg_of s220B_7) (wseg_append (wseg_of s220B_8) (wseg_append (wseg_of s220B_9) (wseg_append (wseg_of s220B_10) (wseg_append (wseg_of s220B_11) (wseg_append (wseg_of s220B_12) (wseg_append (wseg_of s220B_13) (wseg_append (wseg_of s220B_14) (wseg_append (wseg_of s220B_15) (wseg_append (wseg_of s220B_16) (wseg_append (wseg_of s220B_17) (wseg_of s220B_18)))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t221A : List Tok := t221A_0 ++ (t221A_1 ++ (t221A_2 ++ (t221A_3 ++ (t221A_4 ++ (t221A_5 ++ (t221A_6 ++ (t221A_7 ++ (t221A_8 ++ (t221A_9 ++ (t221A_10 ++ (t221A_11 ++ (t221A_12 ++ (t221A_13 ++ (t221A_14 ++ (t221A_15 ++ (t221A_16 ++ (t221A_17 ++ (t221A_18 ++ (t221A_19 ++ (t221A_20 ++ (t221A_21 ++ (t221A_22 ++ (t221A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t221B : List Tok := t221B_0 ++ (t221B_1 ++ (t221B_2 ++ (t221B_3 ++ (t221B_4 ++ (t221B_5 ++ (t221B_6 ++ (t221B_7 ++ (t221B_8 ++ (t221B_9 ++ (t221B_10 ++ (t221B_11 ++ (t221B_12 ++ (t221B_13 ++ (t221B_14 ++ (t221B_15 ++ (t221B_16 ++ (t221B_17)))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 221：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run221 : (nbRun P nb221 0 kN221 t221A).1 = true ∧ (nbRun P nb221 1 kN221 t221B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s221A_0) (wseg_append (wseg_of s221A_1) (wseg_append (wseg_of s221A_2) (wseg_append (wseg_of s221A_3) (wseg_append (wseg_of s221A_4) (wseg_append (wseg_of s221A_5) (wseg_append (wseg_of s221A_6) (wseg_append (wseg_of s221A_7) (wseg_append (wseg_of s221A_8) (wseg_append (wseg_of s221A_9) (wseg_append (wseg_of s221A_10) (wseg_append (wseg_of s221A_11) (wseg_append (wseg_of s221A_12) (wseg_append (wseg_of s221A_13) (wseg_append (wseg_of s221A_14) (wseg_append (wseg_of s221A_15) (wseg_append (wseg_of s221A_16) (wseg_append (wseg_of s221A_17) (wseg_append (wseg_of s221A_18) (wseg_append (wseg_of s221A_19) (wseg_append (wseg_of s221A_20) (wseg_append (wseg_of s221A_21) (wseg_append (wseg_of s221A_22) (wseg_of s221A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s221B_0) (wseg_append (wseg_of s221B_1) (wseg_append (wseg_of s221B_2) (wseg_append (wseg_of s221B_3) (wseg_append (wseg_of s221B_4) (wseg_append (wseg_of s221B_5) (wseg_append (wseg_of s221B_6) (wseg_append (wseg_of s221B_7) (wseg_append (wseg_of s221B_8) (wseg_append (wseg_of s221B_9) (wseg_append (wseg_of s221B_10) (wseg_append (wseg_of s221B_11) (wseg_append (wseg_of s221B_12) (wseg_append (wseg_of s221B_13) (wseg_append (wseg_of s221B_14) (wseg_append (wseg_of s221B_15) (wseg_append (wseg_of s221B_16) (wseg_of s221B_17))))))))))))))))))⟩

end PackLean.D40.Tet
