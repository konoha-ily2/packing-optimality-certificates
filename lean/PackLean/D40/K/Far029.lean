-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS029_0
import PackLean.D40.K.FarS029_1
import PackLean.D40.K.FarS029_2
import PackLean.D40.K.FarS029_3
import PackLean.D40.K.FarS029_4
import PackLean.D40.K.FarS029_5
import PackLean.D40.K.FarS029_6
import PackLean.D40.K.FarS029_7
import PackLean.D40.K.FarS029_8
import PackLean.D40.K.FarS029_9
import PackLean.D40.K.FarS029_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t090A : List Tok := t090A_0 ++ (t090A_1 ++ (t090A_2 ++ (t090A_3 ++ (t090A_4 ++ (t090A_5 ++ (t090A_6 ++ (t090A_7 ++ (t090A_8 ++ (t090A_9 ++ (t090A_10 ++ (t090A_11 ++ (t090A_12 ++ (t090A_13 ++ (t090A_14 ++ (t090A_15 ++ (t090A_16 ++ (t090A_17 ++ (t090A_18 ++ (t090A_19 ++ (t090A_20 ++ (t090A_21 ++ (t090A_22 ++ (t090A_23 ++ (t090A_24 ++ (t090A_25 ++ (t090A_26 ++ (t090A_27 ++ (t090A_28 ++ (t090A_29 ++ (t090A_30 ++ (t090A_31 ++ (t090A_32 ++ (t090A_33 ++ (t090A_34 ++ (t090A_35 ++ (t090A_36 ++ (t090A_37 ++ (t090A_38 ++ (t090A_39 ++ (t090A_40 ++ (t090A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t090B : List Tok := t090B_0 ++ (t090B_1 ++ (t090B_2 ++ (t090B_3 ++ (t090B_4 ++ (t090B_5 ++ (t090B_6 ++ (t090B_7 ++ (t090B_8 ++ (t090B_9 ++ (t090B_10 ++ (t090B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 090：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run090 : (nbRun P nb090 0 kN090 t090A).1 = true ∧ (nbRun P nb090 1 kN090 t090B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s090A_0) (wseg_append (wseg_of s090A_1) (wseg_append (wseg_of s090A_2) (wseg_append (wseg_of s090A_3) (wseg_append (wseg_of s090A_4) (wseg_append (wseg_of s090A_5) (wseg_append (wseg_of s090A_6) (wseg_append (wseg_of s090A_7) (wseg_append (wseg_of s090A_8) (wseg_append (wseg_of s090A_9) (wseg_append (wseg_of s090A_10) (wseg_append (wseg_of s090A_11) (wseg_append (wseg_of s090A_12) (wseg_append (wseg_of s090A_13) (wseg_append (wseg_of s090A_14) (wseg_append (wseg_of s090A_15) (wseg_append (wseg_of s090A_16) (wseg_append (wseg_of s090A_17) (wseg_append (wseg_of s090A_18) (wseg_append (wseg_of s090A_19) (wseg_append (wseg_of s090A_20) (wseg_append (wseg_of s090A_21) (wseg_append (wseg_of s090A_22) (wseg_append (wseg_of s090A_23) (wseg_append (wseg_of s090A_24) (wseg_append (wseg_of s090A_25) (wseg_append (wseg_of s090A_26) (wseg_append (wseg_of s090A_27) (wseg_append (wseg_of s090A_28) (wseg_append (wseg_of s090A_29) (wseg_append (wseg_of s090A_30) (wseg_append (wseg_of s090A_31) (wseg_append (wseg_of s090A_32) (wseg_append (wseg_of s090A_33) (wseg_append (wseg_of s090A_34) (wseg_append (wseg_of s090A_35) (wseg_append (wseg_of s090A_36) (wseg_append (wseg_of s090A_37) (wseg_append (wseg_of s090A_38) (wseg_append (wseg_of s090A_39) (wseg_append (wseg_of s090A_40) (wseg_of s090A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s090B_0) (wseg_append (wseg_of s090B_1) (wseg_append (wseg_of s090B_2) (wseg_append (wseg_of s090B_3) (wseg_append (wseg_of s090B_4) (wseg_append (wseg_of s090B_5) (wseg_append (wseg_of s090B_6) (wseg_append (wseg_of s090B_7) (wseg_append (wseg_of s090B_8) (wseg_append (wseg_of s090B_9) (wseg_append (wseg_of s090B_10) (wseg_of s090B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t091A : List Tok := t091A_0 ++ (t091A_1 ++ (t091A_2 ++ (t091A_3 ++ (t091A_4 ++ (t091A_5 ++ (t091A_6 ++ (t091A_7 ++ (t091A_8 ++ (t091A_9 ++ (t091A_10 ++ (t091A_11 ++ (t091A_12 ++ (t091A_13 ++ (t091A_14 ++ (t091A_15 ++ (t091A_16 ++ (t091A_17 ++ (t091A_18 ++ (t091A_19 ++ (t091A_20 ++ (t091A_21 ++ (t091A_22 ++ (t091A_23 ++ (t091A_24 ++ (t091A_25 ++ (t091A_26 ++ (t091A_27 ++ (t091A_28 ++ (t091A_29 ++ (t091A_30 ++ (t091A_31 ++ (t091A_32 ++ (t091A_33 ++ (t091A_34 ++ (t091A_35 ++ (t091A_36 ++ (t091A_37 ++ (t091A_38 ++ (t091A_39 ++ (t091A_40 ++ (t091A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t091B : List Tok := t091B_0 ++ (t091B_1 ++ (t091B_2 ++ (t091B_3 ++ (t091B_4 ++ (t091B_5 ++ (t091B_6 ++ (t091B_7 ++ (t091B_8 ++ (t091B_9 ++ (t091B_10 ++ (t091B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 091：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run091 : (nbRun P nb091 0 kN091 t091A).1 = true ∧ (nbRun P nb091 1 kN091 t091B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s091A_0) (wseg_append (wseg_of s091A_1) (wseg_append (wseg_of s091A_2) (wseg_append (wseg_of s091A_3) (wseg_append (wseg_of s091A_4) (wseg_append (wseg_of s091A_5) (wseg_append (wseg_of s091A_6) (wseg_append (wseg_of s091A_7) (wseg_append (wseg_of s091A_8) (wseg_append (wseg_of s091A_9) (wseg_append (wseg_of s091A_10) (wseg_append (wseg_of s091A_11) (wseg_append (wseg_of s091A_12) (wseg_append (wseg_of s091A_13) (wseg_append (wseg_of s091A_14) (wseg_append (wseg_of s091A_15) (wseg_append (wseg_of s091A_16) (wseg_append (wseg_of s091A_17) (wseg_append (wseg_of s091A_18) (wseg_append (wseg_of s091A_19) (wseg_append (wseg_of s091A_20) (wseg_append (wseg_of s091A_21) (wseg_append (wseg_of s091A_22) (wseg_append (wseg_of s091A_23) (wseg_append (wseg_of s091A_24) (wseg_append (wseg_of s091A_25) (wseg_append (wseg_of s091A_26) (wseg_append (wseg_of s091A_27) (wseg_append (wseg_of s091A_28) (wseg_append (wseg_of s091A_29) (wseg_append (wseg_of s091A_30) (wseg_append (wseg_of s091A_31) (wseg_append (wseg_of s091A_32) (wseg_append (wseg_of s091A_33) (wseg_append (wseg_of s091A_34) (wseg_append (wseg_of s091A_35) (wseg_append (wseg_of s091A_36) (wseg_append (wseg_of s091A_37) (wseg_append (wseg_of s091A_38) (wseg_append (wseg_of s091A_39) (wseg_append (wseg_of s091A_40) (wseg_of s091A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s091B_0) (wseg_append (wseg_of s091B_1) (wseg_append (wseg_of s091B_2) (wseg_append (wseg_of s091B_3) (wseg_append (wseg_of s091B_4) (wseg_append (wseg_of s091B_5) (wseg_append (wseg_of s091B_6) (wseg_append (wseg_of s091B_7) (wseg_append (wseg_of s091B_8) (wseg_append (wseg_of s091B_9) (wseg_append (wseg_of s091B_10) (wseg_of s091B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t092A : List Tok := t092A_0 ++ (t092A_1 ++ (t092A_2 ++ (t092A_3 ++ (t092A_4 ++ (t092A_5 ++ (t092A_6 ++ (t092A_7 ++ (t092A_8 ++ (t092A_9 ++ (t092A_10 ++ (t092A_11 ++ (t092A_12 ++ (t092A_13 ++ (t092A_14 ++ (t092A_15 ++ (t092A_16 ++ (t092A_17 ++ (t092A_18 ++ (t092A_19 ++ (t092A_20 ++ (t092A_21 ++ (t092A_22 ++ (t092A_23 ++ (t092A_24 ++ (t092A_25 ++ (t092A_26 ++ (t092A_27 ++ (t092A_28 ++ (t092A_29 ++ (t092A_30 ++ (t092A_31 ++ (t092A_32 ++ (t092A_33 ++ (t092A_34 ++ (t092A_35 ++ (t092A_36 ++ (t092A_37 ++ (t092A_38 ++ (t092A_39 ++ (t092A_40 ++ (t092A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t092B : List Tok := t092B_0 ++ (t092B_1 ++ (t092B_2 ++ (t092B_3 ++ (t092B_4 ++ (t092B_5 ++ (t092B_6 ++ (t092B_7 ++ (t092B_8 ++ (t092B_9 ++ (t092B_10 ++ (t092B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 092：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run092 : (nbRun P nb092 0 kN092 t092A).1 = true ∧ (nbRun P nb092 1 kN092 t092B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s092A_0) (wseg_append (wseg_of s092A_1) (wseg_append (wseg_of s092A_2) (wseg_append (wseg_of s092A_3) (wseg_append (wseg_of s092A_4) (wseg_append (wseg_of s092A_5) (wseg_append (wseg_of s092A_6) (wseg_append (wseg_of s092A_7) (wseg_append (wseg_of s092A_8) (wseg_append (wseg_of s092A_9) (wseg_append (wseg_of s092A_10) (wseg_append (wseg_of s092A_11) (wseg_append (wseg_of s092A_12) (wseg_append (wseg_of s092A_13) (wseg_append (wseg_of s092A_14) (wseg_append (wseg_of s092A_15) (wseg_append (wseg_of s092A_16) (wseg_append (wseg_of s092A_17) (wseg_append (wseg_of s092A_18) (wseg_append (wseg_of s092A_19) (wseg_append (wseg_of s092A_20) (wseg_append (wseg_of s092A_21) (wseg_append (wseg_of s092A_22) (wseg_append (wseg_of s092A_23) (wseg_append (wseg_of s092A_24) (wseg_append (wseg_of s092A_25) (wseg_append (wseg_of s092A_26) (wseg_append (wseg_of s092A_27) (wseg_append (wseg_of s092A_28) (wseg_append (wseg_of s092A_29) (wseg_append (wseg_of s092A_30) (wseg_append (wseg_of s092A_31) (wseg_append (wseg_of s092A_32) (wseg_append (wseg_of s092A_33) (wseg_append (wseg_of s092A_34) (wseg_append (wseg_of s092A_35) (wseg_append (wseg_of s092A_36) (wseg_append (wseg_of s092A_37) (wseg_append (wseg_of s092A_38) (wseg_append (wseg_of s092A_39) (wseg_append (wseg_of s092A_40) (wseg_of s092A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s092B_0) (wseg_append (wseg_of s092B_1) (wseg_append (wseg_of s092B_2) (wseg_append (wseg_of s092B_3) (wseg_append (wseg_of s092B_4) (wseg_append (wseg_of s092B_5) (wseg_append (wseg_of s092B_6) (wseg_append (wseg_of s092B_7) (wseg_append (wseg_of s092B_8) (wseg_append (wseg_of s092B_9) (wseg_append (wseg_of s092B_10) (wseg_of s092B_11))))))))))))⟩

end PackLean.D40.Tet
