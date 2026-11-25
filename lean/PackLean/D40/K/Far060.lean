-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS060_0
import PackLean.D40.K.FarS060_1
import PackLean.D40.K.FarS060_2
import PackLean.D40.K.FarS060_3
import PackLean.D40.K.FarS060_4
import PackLean.D40.K.FarS060_5
import PackLean.D40.K.FarS060_6
import PackLean.D40.K.FarS060_7
import PackLean.D40.K.FarS060_8
import PackLean.D40.K.FarS060_9
import PackLean.D40.K.FarS060_10
import PackLean.D40.K.FarS060_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t214A : List Tok := t214A_0 ++ (t214A_1 ++ (t214A_2 ++ (t214A_3 ++ (t214A_4 ++ (t214A_5 ++ (t214A_6 ++ (t214A_7 ++ (t214A_8 ++ (t214A_9 ++ (t214A_10 ++ (t214A_11 ++ (t214A_12 ++ (t214A_13 ++ (t214A_14 ++ (t214A_15 ++ (t214A_16 ++ (t214A_17 ++ (t214A_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t214B : List Tok := t214B_0 ++ (t214B_1 ++ (t214B_2 ++ (t214B_3 ++ (t214B_4 ++ (t214B_5 ++ (t214B_6 ++ (t214B_7 ++ (t214B_8 ++ (t214B_9 ++ (t214B_10 ++ (t214B_11 ++ (t214B_12 ++ (t214B_13 ++ (t214B_14 ++ (t214B_15 ++ (t214B_16 ++ (t214B_17 ++ (t214B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 214：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run214 : (nbRun P nb214 0 kN214 t214A).1 = true ∧ (nbRun P nb214 1 kN214 t214B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s214A_0) (wseg_append (wseg_of s214A_1) (wseg_append (wseg_of s214A_2) (wseg_append (wseg_of s214A_3) (wseg_append (wseg_of s214A_4) (wseg_append (wseg_of s214A_5) (wseg_append (wseg_of s214A_6) (wseg_append (wseg_of s214A_7) (wseg_append (wseg_of s214A_8) (wseg_append (wseg_of s214A_9) (wseg_append (wseg_of s214A_10) (wseg_append (wseg_of s214A_11) (wseg_append (wseg_of s214A_12) (wseg_append (wseg_of s214A_13) (wseg_append (wseg_of s214A_14) (wseg_append (wseg_of s214A_15) (wseg_append (wseg_of s214A_16) (wseg_append (wseg_of s214A_17) (wseg_of s214A_18))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s214B_0) (wseg_append (wseg_of s214B_1) (wseg_append (wseg_of s214B_2) (wseg_append (wseg_of s214B_3) (wseg_append (wseg_of s214B_4) (wseg_append (wseg_of s214B_5) (wseg_append (wseg_of s214B_6) (wseg_append (wseg_of s214B_7) (wseg_append (wseg_of s214B_8) (wseg_append (wseg_of s214B_9) (wseg_append (wseg_of s214B_10) (wseg_append (wseg_of s214B_11) (wseg_append (wseg_of s214B_12) (wseg_append (wseg_of s214B_13) (wseg_append (wseg_of s214B_14) (wseg_append (wseg_of s214B_15) (wseg_append (wseg_of s214B_16) (wseg_append (wseg_of s214B_17) (wseg_of s214B_18)))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t215A : List Tok := t215A_0 ++ (t215A_1 ++ (t215A_2 ++ (t215A_3 ++ (t215A_4 ++ (t215A_5 ++ (t215A_6 ++ (t215A_7 ++ (t215A_8 ++ (t215A_9 ++ (t215A_10 ++ (t215A_11 ++ (t215A_12 ++ (t215A_13 ++ (t215A_14 ++ (t215A_15 ++ (t215A_16 ++ (t215A_17 ++ (t215A_18 ++ (t215A_19 ++ (t215A_20 ++ (t215A_21 ++ (t215A_22 ++ (t215A_23 ++ (t215A_24 ++ (t215A_25 ++ (t215A_26 ++ (t215A_27 ++ (t215A_28 ++ (t215A_29 ++ (t215A_30 ++ (t215A_31 ++ (t215A_32))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t215B : List Tok := t215B_0 ++ (t215B_1 ++ (t215B_2 ++ (t215B_3 ++ (t215B_4 ++ (t215B_5 ++ (t215B_6 ++ (t215B_7 ++ (t215B_8 ++ (t215B_9 ++ (t215B_10 ++ (t215B_11 ++ (t215B_12 ++ (t215B_13 ++ (t215B_14 ++ (t215B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 215：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run215 : (nbRun P nb215 0 kN215 t215A).1 = true ∧ (nbRun P nb215 1 kN215 t215B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s215A_0) (wseg_append (wseg_of s215A_1) (wseg_append (wseg_of s215A_2) (wseg_append (wseg_of s215A_3) (wseg_append (wseg_of s215A_4) (wseg_append (wseg_of s215A_5) (wseg_append (wseg_of s215A_6) (wseg_append (wseg_of s215A_7) (wseg_append (wseg_of s215A_8) (wseg_append (wseg_of s215A_9) (wseg_append (wseg_of s215A_10) (wseg_append (wseg_of s215A_11) (wseg_append (wseg_of s215A_12) (wseg_append (wseg_of s215A_13) (wseg_append (wseg_of s215A_14) (wseg_append (wseg_of s215A_15) (wseg_append (wseg_of s215A_16) (wseg_append (wseg_of s215A_17) (wseg_append (wseg_of s215A_18) (wseg_append (wseg_of s215A_19) (wseg_append (wseg_of s215A_20) (wseg_append (wseg_of s215A_21) (wseg_append (wseg_of s215A_22) (wseg_append (wseg_of s215A_23) (wseg_append (wseg_of s215A_24) (wseg_append (wseg_of s215A_25) (wseg_append (wseg_of s215A_26) (wseg_append (wseg_of s215A_27) (wseg_append (wseg_of s215A_28) (wseg_append (wseg_of s215A_29) (wseg_append (wseg_of s215A_30) (wseg_append (wseg_of s215A_31) (wseg_of s215A_32))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s215B_0) (wseg_append (wseg_of s215B_1) (wseg_append (wseg_of s215B_2) (wseg_append (wseg_of s215B_3) (wseg_append (wseg_of s215B_4) (wseg_append (wseg_of s215B_5) (wseg_append (wseg_of s215B_6) (wseg_append (wseg_of s215B_7) (wseg_append (wseg_of s215B_8) (wseg_append (wseg_of s215B_9) (wseg_append (wseg_of s215B_10) (wseg_append (wseg_of s215B_11) (wseg_append (wseg_of s215B_12) (wseg_append (wseg_of s215B_13) (wseg_append (wseg_of s215B_14) (wseg_of s215B_15))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t216A : List Tok := t216A_0 ++ (t216A_1 ++ (t216A_2 ++ (t216A_3 ++ (t216A_4 ++ (t216A_5 ++ (t216A_6 ++ (t216A_7 ++ (t216A_8 ++ (t216A_9 ++ (t216A_10 ++ (t216A_11 ++ (t216A_12 ++ (t216A_13 ++ (t216A_14 ++ (t216A_15 ++ (t216A_16 ++ (t216A_17 ++ (t216A_18 ++ (t216A_19 ++ (t216A_20 ++ (t216A_21 ++ (t216A_22 ++ (t216A_23 ++ (t216A_24 ++ (t216A_25 ++ (t216A_26 ++ (t216A_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t216B : List Tok := t216B_0 ++ (t216B_1 ++ (t216B_2 ++ (t216B_3 ++ (t216B_4 ++ (t216B_5 ++ (t216B_6 ++ (t216B_7 ++ (t216B_8 ++ (t216B_9 ++ (t216B_10 ++ (t216B_11 ++ (t216B_12 ++ (t216B_13 ++ (t216B_14 ++ (t216B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 216：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run216 : (nbRun P nb216 0 kN216 t216A).1 = true ∧ (nbRun P nb216 1 kN216 t216B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s216A_0) (wseg_append (wseg_of s216A_1) (wseg_append (wseg_of s216A_2) (wseg_append (wseg_of s216A_3) (wseg_append (wseg_of s216A_4) (wseg_append (wseg_of s216A_5) (wseg_append (wseg_of s216A_6) (wseg_append (wseg_of s216A_7) (wseg_append (wseg_of s216A_8) (wseg_append (wseg_of s216A_9) (wseg_append (wseg_of s216A_10) (wseg_append (wseg_of s216A_11) (wseg_append (wseg_of s216A_12) (wseg_append (wseg_of s216A_13) (wseg_append (wseg_of s216A_14) (wseg_append (wseg_of s216A_15) (wseg_append (wseg_of s216A_16) (wseg_append (wseg_of s216A_17) (wseg_append (wseg_of s216A_18) (wseg_append (wseg_of s216A_19) (wseg_append (wseg_of s216A_20) (wseg_append (wseg_of s216A_21) (wseg_append (wseg_of s216A_22) (wseg_append (wseg_of s216A_23) (wseg_append (wseg_of s216A_24) (wseg_append (wseg_of s216A_25) (wseg_append (wseg_of s216A_26) (wseg_of s216A_27)))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s216B_0) (wseg_append (wseg_of s216B_1) (wseg_append (wseg_of s216B_2) (wseg_append (wseg_of s216B_3) (wseg_append (wseg_of s216B_4) (wseg_append (wseg_of s216B_5) (wseg_append (wseg_of s216B_6) (wseg_append (wseg_of s216B_7) (wseg_append (wseg_of s216B_8) (wseg_append (wseg_of s216B_9) (wseg_append (wseg_of s216B_10) (wseg_append (wseg_of s216B_11) (wseg_append (wseg_of s216B_12) (wseg_append (wseg_of s216B_13) (wseg_append (wseg_of s216B_14) (wseg_of s216B_15))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t217A : List Tok := t217A_0 ++ (t217A_1 ++ (t217A_2 ++ (t217A_3 ++ (t217A_4 ++ (t217A_5 ++ (t217A_6 ++ (t217A_7 ++ (t217A_8 ++ (t217A_9 ++ (t217A_10 ++ (t217A_11 ++ (t217A_12 ++ (t217A_13 ++ (t217A_14 ++ (t217A_15 ++ (t217A_16 ++ (t217A_17 ++ (t217A_18 ++ (t217A_19 ++ (t217A_20 ++ (t217A_21 ++ (t217A_22 ++ (t217A_23 ++ (t217A_24 ++ (t217A_25 ++ (t217A_26 ++ (t217A_27 ++ (t217A_28 ++ (t217A_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t217B : List Tok := t217B_0 ++ (t217B_1 ++ (t217B_2 ++ (t217B_3 ++ (t217B_4 ++ (t217B_5 ++ (t217B_6 ++ (t217B_7 ++ (t217B_8 ++ (t217B_9 ++ (t217B_10 ++ (t217B_11 ++ (t217B_12 ++ (t217B_13 ++ (t217B_14 ++ (t217B_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 217：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run217 : (nbRun P nb217 0 kN217 t217A).1 = true ∧ (nbRun P nb217 1 kN217 t217B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s217A_0) (wseg_append (wseg_of s217A_1) (wseg_append (wseg_of s217A_2) (wseg_append (wseg_of s217A_3) (wseg_append (wseg_of s217A_4) (wseg_append (wseg_of s217A_5) (wseg_append (wseg_of s217A_6) (wseg_append (wseg_of s217A_7) (wseg_append (wseg_of s217A_8) (wseg_append (wseg_of s217A_9) (wseg_append (wseg_of s217A_10) (wseg_append (wseg_of s217A_11) (wseg_append (wseg_of s217A_12) (wseg_append (wseg_of s217A_13) (wseg_append (wseg_of s217A_14) (wseg_append (wseg_of s217A_15) (wseg_append (wseg_of s217A_16) (wseg_append (wseg_of s217A_17) (wseg_append (wseg_of s217A_18) (wseg_append (wseg_of s217A_19) (wseg_append (wseg_of s217A_20) (wseg_append (wseg_of s217A_21) (wseg_append (wseg_of s217A_22) (wseg_append (wseg_of s217A_23) (wseg_append (wseg_of s217A_24) (wseg_append (wseg_of s217A_25) (wseg_append (wseg_of s217A_26) (wseg_append (wseg_of s217A_27) (wseg_append (wseg_of s217A_28) (wseg_of s217A_29)))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s217B_0) (wseg_append (wseg_of s217B_1) (wseg_append (wseg_of s217B_2) (wseg_append (wseg_of s217B_3) (wseg_append (wseg_of s217B_4) (wseg_append (wseg_of s217B_5) (wseg_append (wseg_of s217B_6) (wseg_append (wseg_of s217B_7) (wseg_append (wseg_of s217B_8) (wseg_append (wseg_of s217B_9) (wseg_append (wseg_of s217B_10) (wseg_append (wseg_of s217B_11) (wseg_append (wseg_of s217B_12) (wseg_append (wseg_of s217B_13) (wseg_append (wseg_of s217B_14) (wseg_of s217B_15))))))))))))))))⟩

end PackLean.D40.Tet
