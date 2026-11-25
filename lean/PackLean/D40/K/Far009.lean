-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS009_0
import PackLean.D40.K.FarS009_1
import PackLean.D40.K.FarS009_2
import PackLean.D40.K.FarS009_3
import PackLean.D40.K.FarS009_4
import PackLean.D40.K.FarS009_5
import PackLean.D40.K.FarS009_6
import PackLean.D40.K.FarS009_7
import PackLean.D40.K.FarS009_8
import PackLean.D40.K.FarS009_9
import PackLean.D40.K.FarS009_10
import PackLean.D40.K.FarS009_11
import PackLean.D40.K.FarS009_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t025A : List Tok := t025A_0 ++ (t025A_1 ++ (t025A_2 ++ (t025A_3 ++ (t025A_4 ++ (t025A_5 ++ (t025A_6 ++ (t025A_7 ++ (t025A_8 ++ (t025A_9 ++ (t025A_10 ++ (t025A_11 ++ (t025A_12 ++ (t025A_13 ++ (t025A_14 ++ (t025A_15 ++ (t025A_16 ++ (t025A_17 ++ (t025A_18 ++ (t025A_19 ++ (t025A_20 ++ (t025A_21 ++ (t025A_22 ++ (t025A_23 ++ (t025A_24 ++ (t025A_25 ++ (t025A_26 ++ (t025A_27 ++ (t025A_28 ++ (t025A_29 ++ (t025A_30 ++ (t025A_31 ++ (t025A_32 ++ (t025A_33 ++ (t025A_34 ++ (t025A_35 ++ (t025A_36 ++ (t025A_37 ++ (t025A_38 ++ (t025A_39 ++ (t025A_40 ++ (t025A_41 ++ (t025A_42 ++ (t025A_43 ++ (t025A_44 ++ (t025A_45 ++ (t025A_46 ++ (t025A_47 ++ (t025A_48 ++ (t025A_49 ++ (t025A_50 ++ (t025A_51 ++ (t025A_52 ++ (t025A_53 ++ (t025A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t025B : List Tok := t025B_0 ++ (t025B_1 ++ (t025B_2 ++ (t025B_3 ++ (t025B_4 ++ (t025B_5 ++ (t025B_6 ++ (t025B_7 ++ (t025B_8 ++ (t025B_9 ++ (t025B_10 ++ (t025B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 025：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run025 : (nbRun P nb025 0 kN025 t025A).1 = true ∧ (nbRun P nb025 1 kN025 t025B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s025A_0) (wseg_append (wseg_of s025A_1) (wseg_append (wseg_of s025A_2) (wseg_append (wseg_of s025A_3) (wseg_append (wseg_of s025A_4) (wseg_append (wseg_of s025A_5) (wseg_append (wseg_of s025A_6) (wseg_append (wseg_of s025A_7) (wseg_append (wseg_of s025A_8) (wseg_append (wseg_of s025A_9) (wseg_append (wseg_of s025A_10) (wseg_append (wseg_of s025A_11) (wseg_append (wseg_of s025A_12) (wseg_append (wseg_of s025A_13) (wseg_append (wseg_of s025A_14) (wseg_append (wseg_of s025A_15) (wseg_append (wseg_of s025A_16) (wseg_append (wseg_of s025A_17) (wseg_append (wseg_of s025A_18) (wseg_append (wseg_of s025A_19) (wseg_append (wseg_of s025A_20) (wseg_append (wseg_of s025A_21) (wseg_append (wseg_of s025A_22) (wseg_append (wseg_of s025A_23) (wseg_append (wseg_of s025A_24) (wseg_append (wseg_of s025A_25) (wseg_append (wseg_of s025A_26) (wseg_append (wseg_of s025A_27) (wseg_append (wseg_of s025A_28) (wseg_append (wseg_of s025A_29) (wseg_append (wseg_of s025A_30) (wseg_append (wseg_of s025A_31) (wseg_append (wseg_of s025A_32) (wseg_append (wseg_of s025A_33) (wseg_append (wseg_of s025A_34) (wseg_append (wseg_of s025A_35) (wseg_append (wseg_of s025A_36) (wseg_append (wseg_of s025A_37) (wseg_append (wseg_of s025A_38) (wseg_append (wseg_of s025A_39) (wseg_append (wseg_of s025A_40) (wseg_append (wseg_of s025A_41) (wseg_append (wseg_of s025A_42) (wseg_append (wseg_of s025A_43) (wseg_append (wseg_of s025A_44) (wseg_append (wseg_of s025A_45) (wseg_append (wseg_of s025A_46) (wseg_append (wseg_of s025A_47) (wseg_append (wseg_of s025A_48) (wseg_append (wseg_of s025A_49) (wseg_append (wseg_of s025A_50) (wseg_append (wseg_of s025A_51) (wseg_append (wseg_of s025A_52) (wseg_append (wseg_of s025A_53) (wseg_of s025A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s025B_0) (wseg_append (wseg_of s025B_1) (wseg_append (wseg_of s025B_2) (wseg_append (wseg_of s025B_3) (wseg_append (wseg_of s025B_4) (wseg_append (wseg_of s025B_5) (wseg_append (wseg_of s025B_6) (wseg_append (wseg_of s025B_7) (wseg_append (wseg_of s025B_8) (wseg_append (wseg_of s025B_9) (wseg_append (wseg_of s025B_10) (wseg_of s025B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t026A : List Tok := t026A_0 ++ (t026A_1 ++ (t026A_2 ++ (t026A_3 ++ (t026A_4 ++ (t026A_5 ++ (t026A_6 ++ (t026A_7 ++ (t026A_8 ++ (t026A_9 ++ (t026A_10 ++ (t026A_11 ++ (t026A_12 ++ (t026A_13 ++ (t026A_14 ++ (t026A_15 ++ (t026A_16 ++ (t026A_17 ++ (t026A_18 ++ (t026A_19 ++ (t026A_20 ++ (t026A_21 ++ (t026A_22 ++ (t026A_23 ++ (t026A_24 ++ (t026A_25 ++ (t026A_26 ++ (t026A_27 ++ (t026A_28 ++ (t026A_29 ++ (t026A_30 ++ (t026A_31 ++ (t026A_32 ++ (t026A_33 ++ (t026A_34 ++ (t026A_35 ++ (t026A_36 ++ (t026A_37 ++ (t026A_38 ++ (t026A_39 ++ (t026A_40 ++ (t026A_41 ++ (t026A_42 ++ (t026A_43 ++ (t026A_44 ++ (t026A_45 ++ (t026A_46 ++ (t026A_47 ++ (t026A_48 ++ (t026A_49 ++ (t026A_50 ++ (t026A_51 ++ (t026A_52 ++ (t026A_53 ++ (t026A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t026B : List Tok := t026B_0 ++ (t026B_1 ++ (t026B_2 ++ (t026B_3 ++ (t026B_4 ++ (t026B_5 ++ (t026B_6 ++ (t026B_7 ++ (t026B_8 ++ (t026B_9 ++ (t026B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 026：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run026 : (nbRun P nb026 0 kN026 t026A).1 = true ∧ (nbRun P nb026 1 kN026 t026B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s026A_0) (wseg_append (wseg_of s026A_1) (wseg_append (wseg_of s026A_2) (wseg_append (wseg_of s026A_3) (wseg_append (wseg_of s026A_4) (wseg_append (wseg_of s026A_5) (wseg_append (wseg_of s026A_6) (wseg_append (wseg_of s026A_7) (wseg_append (wseg_of s026A_8) (wseg_append (wseg_of s026A_9) (wseg_append (wseg_of s026A_10) (wseg_append (wseg_of s026A_11) (wseg_append (wseg_of s026A_12) (wseg_append (wseg_of s026A_13) (wseg_append (wseg_of s026A_14) (wseg_append (wseg_of s026A_15) (wseg_append (wseg_of s026A_16) (wseg_append (wseg_of s026A_17) (wseg_append (wseg_of s026A_18) (wseg_append (wseg_of s026A_19) (wseg_append (wseg_of s026A_20) (wseg_append (wseg_of s026A_21) (wseg_append (wseg_of s026A_22) (wseg_append (wseg_of s026A_23) (wseg_append (wseg_of s026A_24) (wseg_append (wseg_of s026A_25) (wseg_append (wseg_of s026A_26) (wseg_append (wseg_of s026A_27) (wseg_append (wseg_of s026A_28) (wseg_append (wseg_of s026A_29) (wseg_append (wseg_of s026A_30) (wseg_append (wseg_of s026A_31) (wseg_append (wseg_of s026A_32) (wseg_append (wseg_of s026A_33) (wseg_append (wseg_of s026A_34) (wseg_append (wseg_of s026A_35) (wseg_append (wseg_of s026A_36) (wseg_append (wseg_of s026A_37) (wseg_append (wseg_of s026A_38) (wseg_append (wseg_of s026A_39) (wseg_append (wseg_of s026A_40) (wseg_append (wseg_of s026A_41) (wseg_append (wseg_of s026A_42) (wseg_append (wseg_of s026A_43) (wseg_append (wseg_of s026A_44) (wseg_append (wseg_of s026A_45) (wseg_append (wseg_of s026A_46) (wseg_append (wseg_of s026A_47) (wseg_append (wseg_of s026A_48) (wseg_append (wseg_of s026A_49) (wseg_append (wseg_of s026A_50) (wseg_append (wseg_of s026A_51) (wseg_append (wseg_of s026A_52) (wseg_append (wseg_of s026A_53) (wseg_of s026A_54))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s026B_0) (wseg_append (wseg_of s026B_1) (wseg_append (wseg_of s026B_2) (wseg_append (wseg_of s026B_3) (wseg_append (wseg_of s026B_4) (wseg_append (wseg_of s026B_5) (wseg_append (wseg_of s026B_6) (wseg_append (wseg_of s026B_7) (wseg_append (wseg_of s026B_8) (wseg_append (wseg_of s026B_9) (wseg_of s026B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t027A : List Tok := t027A_0 ++ (t027A_1 ++ (t027A_2 ++ (t027A_3 ++ (t027A_4 ++ (t027A_5 ++ (t027A_6 ++ (t027A_7 ++ (t027A_8 ++ (t027A_9 ++ (t027A_10 ++ (t027A_11 ++ (t027A_12 ++ (t027A_13 ++ (t027A_14 ++ (t027A_15 ++ (t027A_16 ++ (t027A_17 ++ (t027A_18 ++ (t027A_19 ++ (t027A_20 ++ (t027A_21 ++ (t027A_22 ++ (t027A_23 ++ (t027A_24 ++ (t027A_25 ++ (t027A_26 ++ (t027A_27 ++ (t027A_28 ++ (t027A_29 ++ (t027A_30 ++ (t027A_31 ++ (t027A_32 ++ (t027A_33 ++ (t027A_34 ++ (t027A_35 ++ (t027A_36 ++ (t027A_37 ++ (t027A_38 ++ (t027A_39 ++ (t027A_40 ++ (t027A_41 ++ (t027A_42 ++ (t027A_43 ++ (t027A_44 ++ (t027A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t027B : List Tok := t027B_0 ++ (t027B_1 ++ (t027B_2 ++ (t027B_3 ++ (t027B_4 ++ (t027B_5 ++ (t027B_6 ++ (t027B_7 ++ (t027B_8 ++ (t027B_9 ++ (t027B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 027：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run027 : (nbRun P nb027 0 kN027 t027A).1 = true ∧ (nbRun P nb027 1 kN027 t027B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s027A_0) (wseg_append (wseg_of s027A_1) (wseg_append (wseg_of s027A_2) (wseg_append (wseg_of s027A_3) (wseg_append (wseg_of s027A_4) (wseg_append (wseg_of s027A_5) (wseg_append (wseg_of s027A_6) (wseg_append (wseg_of s027A_7) (wseg_append (wseg_of s027A_8) (wseg_append (wseg_of s027A_9) (wseg_append (wseg_of s027A_10) (wseg_append (wseg_of s027A_11) (wseg_append (wseg_of s027A_12) (wseg_append (wseg_of s027A_13) (wseg_append (wseg_of s027A_14) (wseg_append (wseg_of s027A_15) (wseg_append (wseg_of s027A_16) (wseg_append (wseg_of s027A_17) (wseg_append (wseg_of s027A_18) (wseg_append (wseg_of s027A_19) (wseg_append (wseg_of s027A_20) (wseg_append (wseg_of s027A_21) (wseg_append (wseg_of s027A_22) (wseg_append (wseg_of s027A_23) (wseg_append (wseg_of s027A_24) (wseg_append (wseg_of s027A_25) (wseg_append (wseg_of s027A_26) (wseg_append (wseg_of s027A_27) (wseg_append (wseg_of s027A_28) (wseg_append (wseg_of s027A_29) (wseg_append (wseg_of s027A_30) (wseg_append (wseg_of s027A_31) (wseg_append (wseg_of s027A_32) (wseg_append (wseg_of s027A_33) (wseg_append (wseg_of s027A_34) (wseg_append (wseg_of s027A_35) (wseg_append (wseg_of s027A_36) (wseg_append (wseg_of s027A_37) (wseg_append (wseg_of s027A_38) (wseg_append (wseg_of s027A_39) (wseg_append (wseg_of s027A_40) (wseg_append (wseg_of s027A_41) (wseg_append (wseg_of s027A_42) (wseg_append (wseg_of s027A_43) (wseg_append (wseg_of s027A_44) (wseg_of s027A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s027B_0) (wseg_append (wseg_of s027B_1) (wseg_append (wseg_of s027B_2) (wseg_append (wseg_of s027B_3) (wseg_append (wseg_of s027B_4) (wseg_append (wseg_of s027B_5) (wseg_append (wseg_of s027B_6) (wseg_append (wseg_of s027B_7) (wseg_append (wseg_of s027B_8) (wseg_append (wseg_of s027B_9) (wseg_of s027B_10)))))))))))⟩

end PackLean.D40.Tet
