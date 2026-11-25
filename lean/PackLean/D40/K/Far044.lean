-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS044_0
import PackLean.D40.K.FarS044_1
import PackLean.D40.K.FarS044_2
import PackLean.D40.K.FarS044_3
import PackLean.D40.K.FarS044_4
import PackLean.D40.K.FarS044_5
import PackLean.D40.K.FarS044_6
import PackLean.D40.K.FarS044_7
import PackLean.D40.K.FarS044_8
import PackLean.D40.K.FarS044_9
import PackLean.D40.K.FarS044_10
import PackLean.D40.K.FarS044_11
import PackLean.D40.K.FarS044_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t137A : List Tok := t137A_0 ++ (t137A_1 ++ (t137A_2 ++ (t137A_3 ++ (t137A_4 ++ (t137A_5 ++ (t137A_6 ++ (t137A_7 ++ (t137A_8 ++ (t137A_9 ++ (t137A_10 ++ (t137A_11 ++ (t137A_12 ++ (t137A_13 ++ (t137A_14 ++ (t137A_15 ++ (t137A_16 ++ (t137A_17 ++ (t137A_18 ++ (t137A_19 ++ (t137A_20 ++ (t137A_21 ++ (t137A_22 ++ (t137A_23 ++ (t137A_24 ++ (t137A_25 ++ (t137A_26 ++ (t137A_27 ++ (t137A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t137B : List Tok := t137B_0 ++ (t137B_1 ++ (t137B_2 ++ (t137B_3 ++ (t137B_4 ++ (t137B_5 ++ (t137B_6 ++ (t137B_7 ++ (t137B_8 ++ (t137B_9 ++ (t137B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 137：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run137 : (nbRun P nb137 0 kN137 t137A).1 = true ∧ (nbRun P nb137 1 kN137 t137B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s137A_0) (wseg_append (wseg_of s137A_1) (wseg_append (wseg_of s137A_2) (wseg_append (wseg_of s137A_3) (wseg_append (wseg_of s137A_4) (wseg_append (wseg_of s137A_5) (wseg_append (wseg_of s137A_6) (wseg_append (wseg_of s137A_7) (wseg_append (wseg_of s137A_8) (wseg_append (wseg_of s137A_9) (wseg_append (wseg_of s137A_10) (wseg_append (wseg_of s137A_11) (wseg_append (wseg_of s137A_12) (wseg_append (wseg_of s137A_13) (wseg_append (wseg_of s137A_14) (wseg_append (wseg_of s137A_15) (wseg_append (wseg_of s137A_16) (wseg_append (wseg_of s137A_17) (wseg_append (wseg_of s137A_18) (wseg_append (wseg_of s137A_19) (wseg_append (wseg_of s137A_20) (wseg_append (wseg_of s137A_21) (wseg_append (wseg_of s137A_22) (wseg_append (wseg_of s137A_23) (wseg_append (wseg_of s137A_24) (wseg_append (wseg_of s137A_25) (wseg_append (wseg_of s137A_26) (wseg_append (wseg_of s137A_27) (wseg_of s137A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s137B_0) (wseg_append (wseg_of s137B_1) (wseg_append (wseg_of s137B_2) (wseg_append (wseg_of s137B_3) (wseg_append (wseg_of s137B_4) (wseg_append (wseg_of s137B_5) (wseg_append (wseg_of s137B_6) (wseg_append (wseg_of s137B_7) (wseg_append (wseg_of s137B_8) (wseg_append (wseg_of s137B_9) (wseg_of s137B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t138A : List Tok := t138A_0 ++ (t138A_1 ++ (t138A_2 ++ (t138A_3 ++ (t138A_4 ++ (t138A_5 ++ (t138A_6 ++ (t138A_7 ++ (t138A_8 ++ (t138A_9 ++ (t138A_10 ++ (t138A_11 ++ (t138A_12 ++ (t138A_13 ++ (t138A_14 ++ (t138A_15 ++ (t138A_16 ++ (t138A_17 ++ (t138A_18 ++ (t138A_19 ++ (t138A_20 ++ (t138A_21 ++ (t138A_22 ++ (t138A_23 ++ (t138A_24 ++ (t138A_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t138B : List Tok := t138B_0 ++ (t138B_1 ++ (t138B_2 ++ (t138B_3 ++ (t138B_4 ++ (t138B_5 ++ (t138B_6 ++ (t138B_7 ++ (t138B_8 ++ (t138B_9 ++ (t138B_10 ++ (t138B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 138：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run138 : (nbRun P nb138 0 kN138 t138A).1 = true ∧ (nbRun P nb138 1 kN138 t138B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s138A_0) (wseg_append (wseg_of s138A_1) (wseg_append (wseg_of s138A_2) (wseg_append (wseg_of s138A_3) (wseg_append (wseg_of s138A_4) (wseg_append (wseg_of s138A_5) (wseg_append (wseg_of s138A_6) (wseg_append (wseg_of s138A_7) (wseg_append (wseg_of s138A_8) (wseg_append (wseg_of s138A_9) (wseg_append (wseg_of s138A_10) (wseg_append (wseg_of s138A_11) (wseg_append (wseg_of s138A_12) (wseg_append (wseg_of s138A_13) (wseg_append (wseg_of s138A_14) (wseg_append (wseg_of s138A_15) (wseg_append (wseg_of s138A_16) (wseg_append (wseg_of s138A_17) (wseg_append (wseg_of s138A_18) (wseg_append (wseg_of s138A_19) (wseg_append (wseg_of s138A_20) (wseg_append (wseg_of s138A_21) (wseg_append (wseg_of s138A_22) (wseg_append (wseg_of s138A_23) (wseg_append (wseg_of s138A_24) (wseg_of s138A_25)))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s138B_0) (wseg_append (wseg_of s138B_1) (wseg_append (wseg_of s138B_2) (wseg_append (wseg_of s138B_3) (wseg_append (wseg_of s138B_4) (wseg_append (wseg_of s138B_5) (wseg_append (wseg_of s138B_6) (wseg_append (wseg_of s138B_7) (wseg_append (wseg_of s138B_8) (wseg_append (wseg_of s138B_9) (wseg_append (wseg_of s138B_10) (wseg_of s138B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t139A : List Tok := t139A_0 ++ (t139A_1 ++ (t139A_2 ++ (t139A_3 ++ (t139A_4 ++ (t139A_5 ++ (t139A_6 ++ (t139A_7 ++ (t139A_8 ++ (t139A_9 ++ (t139A_10 ++ (t139A_11 ++ (t139A_12 ++ (t139A_13 ++ (t139A_14 ++ (t139A_15 ++ (t139A_16 ++ (t139A_17 ++ (t139A_18 ++ (t139A_19 ++ (t139A_20 ++ (t139A_21 ++ (t139A_22 ++ (t139A_23 ++ (t139A_24 ++ (t139A_25 ++ (t139A_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t139B : List Tok := t139B_0 ++ (t139B_1 ++ (t139B_2 ++ (t139B_3 ++ (t139B_4 ++ (t139B_5 ++ (t139B_6 ++ (t139B_7 ++ (t139B_8 ++ (t139B_9 ++ (t139B_10 ++ (t139B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 139：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run139 : (nbRun P nb139 0 kN139 t139A).1 = true ∧ (nbRun P nb139 1 kN139 t139B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s139A_0) (wseg_append (wseg_of s139A_1) (wseg_append (wseg_of s139A_2) (wseg_append (wseg_of s139A_3) (wseg_append (wseg_of s139A_4) (wseg_append (wseg_of s139A_5) (wseg_append (wseg_of s139A_6) (wseg_append (wseg_of s139A_7) (wseg_append (wseg_of s139A_8) (wseg_append (wseg_of s139A_9) (wseg_append (wseg_of s139A_10) (wseg_append (wseg_of s139A_11) (wseg_append (wseg_of s139A_12) (wseg_append (wseg_of s139A_13) (wseg_append (wseg_of s139A_14) (wseg_append (wseg_of s139A_15) (wseg_append (wseg_of s139A_16) (wseg_append (wseg_of s139A_17) (wseg_append (wseg_of s139A_18) (wseg_append (wseg_of s139A_19) (wseg_append (wseg_of s139A_20) (wseg_append (wseg_of s139A_21) (wseg_append (wseg_of s139A_22) (wseg_append (wseg_of s139A_23) (wseg_append (wseg_of s139A_24) (wseg_append (wseg_of s139A_25) (wseg_of s139A_26))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s139B_0) (wseg_append (wseg_of s139B_1) (wseg_append (wseg_of s139B_2) (wseg_append (wseg_of s139B_3) (wseg_append (wseg_of s139B_4) (wseg_append (wseg_of s139B_5) (wseg_append (wseg_of s139B_6) (wseg_append (wseg_of s139B_7) (wseg_append (wseg_of s139B_8) (wseg_append (wseg_of s139B_9) (wseg_append (wseg_of s139B_10) (wseg_of s139B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t140A : List Tok := t140A_0 ++ (t140A_1 ++ (t140A_2 ++ (t140A_3 ++ (t140A_4 ++ (t140A_5 ++ (t140A_6 ++ (t140A_7 ++ (t140A_8 ++ (t140A_9 ++ (t140A_10 ++ (t140A_11 ++ (t140A_12 ++ (t140A_13 ++ (t140A_14 ++ (t140A_15 ++ (t140A_16 ++ (t140A_17 ++ (t140A_18 ++ (t140A_19 ++ (t140A_20 ++ (t140A_21 ++ (t140A_22 ++ (t140A_23)))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t140B : List Tok := t140B_0 ++ (t140B_1 ++ (t140B_2 ++ (t140B_3 ++ (t140B_4 ++ (t140B_5 ++ (t140B_6 ++ (t140B_7 ++ (t140B_8 ++ (t140B_9 ++ (t140B_10 ++ (t140B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 140：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run140 : (nbRun P nb140 0 kN140 t140A).1 = true ∧ (nbRun P nb140 1 kN140 t140B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s140A_0) (wseg_append (wseg_of s140A_1) (wseg_append (wseg_of s140A_2) (wseg_append (wseg_of s140A_3) (wseg_append (wseg_of s140A_4) (wseg_append (wseg_of s140A_5) (wseg_append (wseg_of s140A_6) (wseg_append (wseg_of s140A_7) (wseg_append (wseg_of s140A_8) (wseg_append (wseg_of s140A_9) (wseg_append (wseg_of s140A_10) (wseg_append (wseg_of s140A_11) (wseg_append (wseg_of s140A_12) (wseg_append (wseg_of s140A_13) (wseg_append (wseg_of s140A_14) (wseg_append (wseg_of s140A_15) (wseg_append (wseg_of s140A_16) (wseg_append (wseg_of s140A_17) (wseg_append (wseg_of s140A_18) (wseg_append (wseg_of s140A_19) (wseg_append (wseg_of s140A_20) (wseg_append (wseg_of s140A_21) (wseg_append (wseg_of s140A_22) (wseg_of s140A_23)))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s140B_0) (wseg_append (wseg_of s140B_1) (wseg_append (wseg_of s140B_2) (wseg_append (wseg_of s140B_3) (wseg_append (wseg_of s140B_4) (wseg_append (wseg_of s140B_5) (wseg_append (wseg_of s140B_6) (wseg_append (wseg_of s140B_7) (wseg_append (wseg_of s140B_8) (wseg_append (wseg_of s140B_9) (wseg_append (wseg_of s140B_10) (wseg_of s140B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t141A : List Tok := t141A_0 ++ (t141A_1 ++ (t141A_2 ++ (t141A_3 ++ (t141A_4 ++ (t141A_5 ++ (t141A_6 ++ (t141A_7 ++ (t141A_8 ++ (t141A_9 ++ (t141A_10 ++ (t141A_11 ++ (t141A_12 ++ (t141A_13 ++ (t141A_14 ++ (t141A_15 ++ (t141A_16 ++ (t141A_17 ++ (t141A_18 ++ (t141A_19 ++ (t141A_20 ++ (t141A_21 ++ (t141A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t141B : List Tok := t141B_0 ++ (t141B_1 ++ (t141B_2 ++ (t141B_3 ++ (t141B_4 ++ (t141B_5 ++ (t141B_6 ++ (t141B_7 ++ (t141B_8 ++ (t141B_9 ++ (t141B_10 ++ (t141B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 141：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run141 : (nbRun P nb141 0 kN141 t141A).1 = true ∧ (nbRun P nb141 1 kN141 t141B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s141A_0) (wseg_append (wseg_of s141A_1) (wseg_append (wseg_of s141A_2) (wseg_append (wseg_of s141A_3) (wseg_append (wseg_of s141A_4) (wseg_append (wseg_of s141A_5) (wseg_append (wseg_of s141A_6) (wseg_append (wseg_of s141A_7) (wseg_append (wseg_of s141A_8) (wseg_append (wseg_of s141A_9) (wseg_append (wseg_of s141A_10) (wseg_append (wseg_of s141A_11) (wseg_append (wseg_of s141A_12) (wseg_append (wseg_of s141A_13) (wseg_append (wseg_of s141A_14) (wseg_append (wseg_of s141A_15) (wseg_append (wseg_of s141A_16) (wseg_append (wseg_of s141A_17) (wseg_append (wseg_of s141A_18) (wseg_append (wseg_of s141A_19) (wseg_append (wseg_of s141A_20) (wseg_append (wseg_of s141A_21) (wseg_of s141A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s141B_0) (wseg_append (wseg_of s141B_1) (wseg_append (wseg_of s141B_2) (wseg_append (wseg_of s141B_3) (wseg_append (wseg_of s141B_4) (wseg_append (wseg_of s141B_5) (wseg_append (wseg_of s141B_6) (wseg_append (wseg_of s141B_7) (wseg_append (wseg_of s141B_8) (wseg_append (wseg_of s141B_9) (wseg_append (wseg_of s141B_10) (wseg_of s141B_11))))))))))))⟩

end PackLean.D40.Tet
