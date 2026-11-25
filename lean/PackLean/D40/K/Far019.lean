-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS019_0
import PackLean.D40.K.FarS019_1
import PackLean.D40.K.FarS019_2
import PackLean.D40.K.FarS019_3
import PackLean.D40.K.FarS019_4
import PackLean.D40.K.FarS019_5
import PackLean.D40.K.FarS019_6
import PackLean.D40.K.FarS019_7
import PackLean.D40.K.FarS019_8
import PackLean.D40.K.FarS019_9
import PackLean.D40.K.FarS019_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t058A : List Tok := t058A_0 ++ (t058A_1 ++ (t058A_2 ++ (t058A_3 ++ (t058A_4 ++ (t058A_5 ++ (t058A_6 ++ (t058A_7 ++ (t058A_8 ++ (t058A_9 ++ (t058A_10 ++ (t058A_11 ++ (t058A_12 ++ (t058A_13 ++ (t058A_14 ++ (t058A_15 ++ (t058A_16 ++ (t058A_17 ++ (t058A_18 ++ (t058A_19 ++ (t058A_20 ++ (t058A_21 ++ (t058A_22 ++ (t058A_23 ++ (t058A_24 ++ (t058A_25 ++ (t058A_26 ++ (t058A_27 ++ (t058A_28 ++ (t058A_29)))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t058B : List Tok := t058B_0 ++ (t058B_1 ++ (t058B_2 ++ (t058B_3 ++ (t058B_4 ++ (t058B_5 ++ (t058B_6 ++ (t058B_7 ++ (t058B_8 ++ (t058B_9 ++ (t058B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 058：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run058 : (nbRun P nb058 0 kN058 t058A).1 = true ∧ (nbRun P nb058 1 kN058 t058B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s058A_0) (wseg_append (wseg_of s058A_1) (wseg_append (wseg_of s058A_2) (wseg_append (wseg_of s058A_3) (wseg_append (wseg_of s058A_4) (wseg_append (wseg_of s058A_5) (wseg_append (wseg_of s058A_6) (wseg_append (wseg_of s058A_7) (wseg_append (wseg_of s058A_8) (wseg_append (wseg_of s058A_9) (wseg_append (wseg_of s058A_10) (wseg_append (wseg_of s058A_11) (wseg_append (wseg_of s058A_12) (wseg_append (wseg_of s058A_13) (wseg_append (wseg_of s058A_14) (wseg_append (wseg_of s058A_15) (wseg_append (wseg_of s058A_16) (wseg_append (wseg_of s058A_17) (wseg_append (wseg_of s058A_18) (wseg_append (wseg_of s058A_19) (wseg_append (wseg_of s058A_20) (wseg_append (wseg_of s058A_21) (wseg_append (wseg_of s058A_22) (wseg_append (wseg_of s058A_23) (wseg_append (wseg_of s058A_24) (wseg_append (wseg_of s058A_25) (wseg_append (wseg_of s058A_26) (wseg_append (wseg_of s058A_27) (wseg_append (wseg_of s058A_28) (wseg_of s058A_29)))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s058B_0) (wseg_append (wseg_of s058B_1) (wseg_append (wseg_of s058B_2) (wseg_append (wseg_of s058B_3) (wseg_append (wseg_of s058B_4) (wseg_append (wseg_of s058B_5) (wseg_append (wseg_of s058B_6) (wseg_append (wseg_of s058B_7) (wseg_append (wseg_of s058B_8) (wseg_append (wseg_of s058B_9) (wseg_of s058B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t059A : List Tok := t059A_0 ++ (t059A_1 ++ (t059A_2 ++ (t059A_3 ++ (t059A_4 ++ (t059A_5 ++ (t059A_6 ++ (t059A_7 ++ (t059A_8 ++ (t059A_9 ++ (t059A_10 ++ (t059A_11 ++ (t059A_12 ++ (t059A_13 ++ (t059A_14 ++ (t059A_15 ++ (t059A_16 ++ (t059A_17 ++ (t059A_18 ++ (t059A_19 ++ (t059A_20 ++ (t059A_21 ++ (t059A_22 ++ (t059A_23 ++ (t059A_24 ++ (t059A_25 ++ (t059A_26 ++ (t059A_27 ++ (t059A_28 ++ (t059A_29 ++ (t059A_30))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t059B : List Tok := t059B_0 ++ (t059B_1 ++ (t059B_2 ++ (t059B_3 ++ (t059B_4 ++ (t059B_5 ++ (t059B_6 ++ (t059B_7 ++ (t059B_8 ++ (t059B_9 ++ (t059B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 059：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run059 : (nbRun P nb059 0 kN059 t059A).1 = true ∧ (nbRun P nb059 1 kN059 t059B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s059A_0) (wseg_append (wseg_of s059A_1) (wseg_append (wseg_of s059A_2) (wseg_append (wseg_of s059A_3) (wseg_append (wseg_of s059A_4) (wseg_append (wseg_of s059A_5) (wseg_append (wseg_of s059A_6) (wseg_append (wseg_of s059A_7) (wseg_append (wseg_of s059A_8) (wseg_append (wseg_of s059A_9) (wseg_append (wseg_of s059A_10) (wseg_append (wseg_of s059A_11) (wseg_append (wseg_of s059A_12) (wseg_append (wseg_of s059A_13) (wseg_append (wseg_of s059A_14) (wseg_append (wseg_of s059A_15) (wseg_append (wseg_of s059A_16) (wseg_append (wseg_of s059A_17) (wseg_append (wseg_of s059A_18) (wseg_append (wseg_of s059A_19) (wseg_append (wseg_of s059A_20) (wseg_append (wseg_of s059A_21) (wseg_append (wseg_of s059A_22) (wseg_append (wseg_of s059A_23) (wseg_append (wseg_of s059A_24) (wseg_append (wseg_of s059A_25) (wseg_append (wseg_of s059A_26) (wseg_append (wseg_of s059A_27) (wseg_append (wseg_of s059A_28) (wseg_append (wseg_of s059A_29) (wseg_of s059A_30))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s059B_0) (wseg_append (wseg_of s059B_1) (wseg_append (wseg_of s059B_2) (wseg_append (wseg_of s059B_3) (wseg_append (wseg_of s059B_4) (wseg_append (wseg_of s059B_5) (wseg_append (wseg_of s059B_6) (wseg_append (wseg_of s059B_7) (wseg_append (wseg_of s059B_8) (wseg_append (wseg_of s059B_9) (wseg_of s059B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060A : List Tok := t060A_0 ++ (t060A_1 ++ (t060A_2 ++ (t060A_3 ++ (t060A_4 ++ (t060A_5 ++ (t060A_6 ++ (t060A_7 ++ (t060A_8 ++ (t060A_9 ++ (t060A_10 ++ (t060A_11 ++ (t060A_12 ++ (t060A_13 ++ (t060A_14 ++ (t060A_15 ++ (t060A_16 ++ (t060A_17 ++ (t060A_18 ++ (t060A_19 ++ (t060A_20 ++ (t060A_21 ++ (t060A_22 ++ (t060A_23 ++ (t060A_24 ++ (t060A_25 ++ (t060A_26 ++ (t060A_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t060B : List Tok := t060B_0 ++ (t060B_1 ++ (t060B_2 ++ (t060B_3 ++ (t060B_4 ++ (t060B_5 ++ (t060B_6 ++ (t060B_7 ++ (t060B_8 ++ (t060B_9 ++ (t060B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 060：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run060 : (nbRun P nb060 0 kN060 t060A).1 = true ∧ (nbRun P nb060 1 kN060 t060B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s060A_0) (wseg_append (wseg_of s060A_1) (wseg_append (wseg_of s060A_2) (wseg_append (wseg_of s060A_3) (wseg_append (wseg_of s060A_4) (wseg_append (wseg_of s060A_5) (wseg_append (wseg_of s060A_6) (wseg_append (wseg_of s060A_7) (wseg_append (wseg_of s060A_8) (wseg_append (wseg_of s060A_9) (wseg_append (wseg_of s060A_10) (wseg_append (wseg_of s060A_11) (wseg_append (wseg_of s060A_12) (wseg_append (wseg_of s060A_13) (wseg_append (wseg_of s060A_14) (wseg_append (wseg_of s060A_15) (wseg_append (wseg_of s060A_16) (wseg_append (wseg_of s060A_17) (wseg_append (wseg_of s060A_18) (wseg_append (wseg_of s060A_19) (wseg_append (wseg_of s060A_20) (wseg_append (wseg_of s060A_21) (wseg_append (wseg_of s060A_22) (wseg_append (wseg_of s060A_23) (wseg_append (wseg_of s060A_24) (wseg_append (wseg_of s060A_25) (wseg_append (wseg_of s060A_26) (wseg_of s060A_27)))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s060B_0) (wseg_append (wseg_of s060B_1) (wseg_append (wseg_of s060B_2) (wseg_append (wseg_of s060B_3) (wseg_append (wseg_of s060B_4) (wseg_append (wseg_of s060B_5) (wseg_append (wseg_of s060B_6) (wseg_append (wseg_of s060B_7) (wseg_append (wseg_of s060B_8) (wseg_append (wseg_of s060B_9) (wseg_of s060B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061A : List Tok := t061A_0 ++ (t061A_1 ++ (t061A_2 ++ (t061A_3 ++ (t061A_4 ++ (t061A_5 ++ (t061A_6 ++ (t061A_7 ++ (t061A_8 ++ (t061A_9 ++ (t061A_10 ++ (t061A_11 ++ (t061A_12 ++ (t061A_13 ++ (t061A_14 ++ (t061A_15 ++ (t061A_16 ++ (t061A_17 ++ (t061A_18 ++ (t061A_19 ++ (t061A_20 ++ (t061A_21 ++ (t061A_22 ++ (t061A_23 ++ (t061A_24 ++ (t061A_25 ++ (t061A_26))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t061B : List Tok := t061B_0 ++ (t061B_1 ++ (t061B_2 ++ (t061B_3 ++ (t061B_4 ++ (t061B_5 ++ (t061B_6 ++ (t061B_7 ++ (t061B_8 ++ (t061B_9 ++ (t061B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 061：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run061 : (nbRun P nb061 0 kN061 t061A).1 = true ∧ (nbRun P nb061 1 kN061 t061B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s061A_0) (wseg_append (wseg_of s061A_1) (wseg_append (wseg_of s061A_2) (wseg_append (wseg_of s061A_3) (wseg_append (wseg_of s061A_4) (wseg_append (wseg_of s061A_5) (wseg_append (wseg_of s061A_6) (wseg_append (wseg_of s061A_7) (wseg_append (wseg_of s061A_8) (wseg_append (wseg_of s061A_9) (wseg_append (wseg_of s061A_10) (wseg_append (wseg_of s061A_11) (wseg_append (wseg_of s061A_12) (wseg_append (wseg_of s061A_13) (wseg_append (wseg_of s061A_14) (wseg_append (wseg_of s061A_15) (wseg_append (wseg_of s061A_16) (wseg_append (wseg_of s061A_17) (wseg_append (wseg_of s061A_18) (wseg_append (wseg_of s061A_19) (wseg_append (wseg_of s061A_20) (wseg_append (wseg_of s061A_21) (wseg_append (wseg_of s061A_22) (wseg_append (wseg_of s061A_23) (wseg_append (wseg_of s061A_24) (wseg_append (wseg_of s061A_25) (wseg_of s061A_26))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s061B_0) (wseg_append (wseg_of s061B_1) (wseg_append (wseg_of s061B_2) (wseg_append (wseg_of s061B_3) (wseg_append (wseg_of s061B_4) (wseg_append (wseg_of s061B_5) (wseg_append (wseg_of s061B_6) (wseg_append (wseg_of s061B_7) (wseg_append (wseg_of s061B_8) (wseg_append (wseg_of s061B_9) (wseg_of s061B_10)))))))))))⟩

end PackLean.D40.Tet
