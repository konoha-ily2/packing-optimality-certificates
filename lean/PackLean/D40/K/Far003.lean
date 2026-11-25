-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS003_0
import PackLean.D40.K.FarS003_1
import PackLean.D40.K.FarS003_2
import PackLean.D40.K.FarS003_3
import PackLean.D40.K.FarS003_4
import PackLean.D40.K.FarS003_5
import PackLean.D40.K.FarS003_6
import PackLean.D40.K.FarS003_7
import PackLean.D40.K.FarS003_8
import PackLean.D40.K.FarS003_9
import PackLean.D40.K.FarS003_10
import PackLean.D40.K.FarS003_11
import PackLean.D40.K.FarS003_12
import PackLean.D40.K.FarS003_13
import PackLean.D40.K.FarS003_14
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t007A : List Tok := t007A_0 ++ (t007A_1 ++ (t007A_2 ++ (t007A_3 ++ (t007A_4 ++ (t007A_5 ++ (t007A_6 ++ (t007A_7 ++ (t007A_8 ++ (t007A_9 ++ (t007A_10 ++ (t007A_11 ++ (t007A_12 ++ (t007A_13 ++ (t007A_14 ++ (t007A_15 ++ (t007A_16 ++ (t007A_17 ++ (t007A_18 ++ (t007A_19 ++ (t007A_20 ++ (t007A_21 ++ (t007A_22 ++ (t007A_23 ++ (t007A_24 ++ (t007A_25 ++ (t007A_26 ++ (t007A_27 ++ (t007A_28 ++ (t007A_29 ++ (t007A_30 ++ (t007A_31 ++ (t007A_32 ++ (t007A_33 ++ (t007A_34 ++ (t007A_35 ++ (t007A_36 ++ (t007A_37 ++ (t007A_38 ++ (t007A_39 ++ (t007A_40 ++ (t007A_41 ++ (t007A_42 ++ (t007A_43 ++ (t007A_44 ++ (t007A_45 ++ (t007A_46 ++ (t007A_47 ++ (t007A_48 ++ (t007A_49 ++ (t007A_50 ++ (t007A_51 ++ (t007A_52 ++ (t007A_53 ++ (t007A_54 ++ (t007A_55)))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t007B : List Tok := t007B_0 ++ (t007B_1 ++ (t007B_2 ++ (t007B_3 ++ (t007B_4 ++ (t007B_5 ++ (t007B_6 ++ (t007B_7 ++ (t007B_8 ++ (t007B_9 ++ (t007B_10 ++ (t007B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 007：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run007 : (nbRun P nb007 0 kN007 t007A).1 = true ∧ (nbRun P nb007 1 kN007 t007B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s007A_0) (wseg_append (wseg_of s007A_1) (wseg_append (wseg_of s007A_2) (wseg_append (wseg_of s007A_3) (wseg_append (wseg_of s007A_4) (wseg_append (wseg_of s007A_5) (wseg_append (wseg_of s007A_6) (wseg_append (wseg_of s007A_7) (wseg_append (wseg_of s007A_8) (wseg_append (wseg_of s007A_9) (wseg_append (wseg_of s007A_10) (wseg_append (wseg_of s007A_11) (wseg_append (wseg_of s007A_12) (wseg_append (wseg_of s007A_13) (wseg_append (wseg_of s007A_14) (wseg_append (wseg_of s007A_15) (wseg_append (wseg_of s007A_16) (wseg_append (wseg_of s007A_17) (wseg_append (wseg_of s007A_18) (wseg_append (wseg_of s007A_19) (wseg_append (wseg_of s007A_20) (wseg_append (wseg_of s007A_21) (wseg_append (wseg_of s007A_22) (wseg_append (wseg_of s007A_23) (wseg_append (wseg_of s007A_24) (wseg_append (wseg_of s007A_25) (wseg_append (wseg_of s007A_26) (wseg_append (wseg_of s007A_27) (wseg_append (wseg_of s007A_28) (wseg_append (wseg_of s007A_29) (wseg_append (wseg_of s007A_30) (wseg_append (wseg_of s007A_31) (wseg_append (wseg_of s007A_32) (wseg_append (wseg_of s007A_33) (wseg_append (wseg_of s007A_34) (wseg_append (wseg_of s007A_35) (wseg_append (wseg_of s007A_36) (wseg_append (wseg_of s007A_37) (wseg_append (wseg_of s007A_38) (wseg_append (wseg_of s007A_39) (wseg_append (wseg_of s007A_40) (wseg_append (wseg_of s007A_41) (wseg_append (wseg_of s007A_42) (wseg_append (wseg_of s007A_43) (wseg_append (wseg_of s007A_44) (wseg_append (wseg_of s007A_45) (wseg_append (wseg_of s007A_46) (wseg_append (wseg_of s007A_47) (wseg_append (wseg_of s007A_48) (wseg_append (wseg_of s007A_49) (wseg_append (wseg_of s007A_50) (wseg_append (wseg_of s007A_51) (wseg_append (wseg_of s007A_52) (wseg_append (wseg_of s007A_53) (wseg_append (wseg_of s007A_54) (wseg_of s007A_55)))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s007B_0) (wseg_append (wseg_of s007B_1) (wseg_append (wseg_of s007B_2) (wseg_append (wseg_of s007B_3) (wseg_append (wseg_of s007B_4) (wseg_append (wseg_of s007B_5) (wseg_append (wseg_of s007B_6) (wseg_append (wseg_of s007B_7) (wseg_append (wseg_of s007B_8) (wseg_append (wseg_of s007B_9) (wseg_append (wseg_of s007B_10) (wseg_of s007B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t008A : List Tok := t008A_0 ++ (t008A_1 ++ (t008A_2 ++ (t008A_3 ++ (t008A_4 ++ (t008A_5 ++ (t008A_6 ++ (t008A_7 ++ (t008A_8 ++ (t008A_9 ++ (t008A_10 ++ (t008A_11 ++ (t008A_12 ++ (t008A_13 ++ (t008A_14 ++ (t008A_15 ++ (t008A_16 ++ (t008A_17 ++ (t008A_18 ++ (t008A_19 ++ (t008A_20 ++ (t008A_21 ++ (t008A_22 ++ (t008A_23 ++ (t008A_24 ++ (t008A_25 ++ (t008A_26 ++ (t008A_27 ++ (t008A_28 ++ (t008A_29 ++ (t008A_30 ++ (t008A_31 ++ (t008A_32 ++ (t008A_33 ++ (t008A_34 ++ (t008A_35 ++ (t008A_36 ++ (t008A_37 ++ (t008A_38 ++ (t008A_39 ++ (t008A_40 ++ (t008A_41 ++ (t008A_42 ++ (t008A_43 ++ (t008A_44 ++ (t008A_45 ++ (t008A_46 ++ (t008A_47 ++ (t008A_48 ++ (t008A_49 ++ (t008A_50 ++ (t008A_51 ++ (t008A_52 ++ (t008A_53 ++ (t008A_54 ++ (t008A_55 ++ (t008A_56 ++ (t008A_57 ++ (t008A_58 ++ (t008A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t008B : List Tok := t008B_0 ++ (t008B_1 ++ (t008B_2 ++ (t008B_3 ++ (t008B_4 ++ (t008B_5 ++ (t008B_6 ++ (t008B_7 ++ (t008B_8 ++ (t008B_9 ++ (t008B_10 ++ (t008B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 008：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run008 : (nbRun P nb008 0 kN008 t008A).1 = true ∧ (nbRun P nb008 1 kN008 t008B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s008A_0) (wseg_append (wseg_of s008A_1) (wseg_append (wseg_of s008A_2) (wseg_append (wseg_of s008A_3) (wseg_append (wseg_of s008A_4) (wseg_append (wseg_of s008A_5) (wseg_append (wseg_of s008A_6) (wseg_append (wseg_of s008A_7) (wseg_append (wseg_of s008A_8) (wseg_append (wseg_of s008A_9) (wseg_append (wseg_of s008A_10) (wseg_append (wseg_of s008A_11) (wseg_append (wseg_of s008A_12) (wseg_append (wseg_of s008A_13) (wseg_append (wseg_of s008A_14) (wseg_append (wseg_of s008A_15) (wseg_append (wseg_of s008A_16) (wseg_append (wseg_of s008A_17) (wseg_append (wseg_of s008A_18) (wseg_append (wseg_of s008A_19) (wseg_append (wseg_of s008A_20) (wseg_append (wseg_of s008A_21) (wseg_append (wseg_of s008A_22) (wseg_append (wseg_of s008A_23) (wseg_append (wseg_of s008A_24) (wseg_append (wseg_of s008A_25) (wseg_append (wseg_of s008A_26) (wseg_append (wseg_of s008A_27) (wseg_append (wseg_of s008A_28) (wseg_append (wseg_of s008A_29) (wseg_append (wseg_of s008A_30) (wseg_append (wseg_of s008A_31) (wseg_append (wseg_of s008A_32) (wseg_append (wseg_of s008A_33) (wseg_append (wseg_of s008A_34) (wseg_append (wseg_of s008A_35) (wseg_append (wseg_of s008A_36) (wseg_append (wseg_of s008A_37) (wseg_append (wseg_of s008A_38) (wseg_append (wseg_of s008A_39) (wseg_append (wseg_of s008A_40) (wseg_append (wseg_of s008A_41) (wseg_append (wseg_of s008A_42) (wseg_append (wseg_of s008A_43) (wseg_append (wseg_of s008A_44) (wseg_append (wseg_of s008A_45) (wseg_append (wseg_of s008A_46) (wseg_append (wseg_of s008A_47) (wseg_append (wseg_of s008A_48) (wseg_append (wseg_of s008A_49) (wseg_append (wseg_of s008A_50) (wseg_append (wseg_of s008A_51) (wseg_append (wseg_of s008A_52) (wseg_append (wseg_of s008A_53) (wseg_append (wseg_of s008A_54) (wseg_append (wseg_of s008A_55) (wseg_append (wseg_of s008A_56) (wseg_append (wseg_of s008A_57) (wseg_append (wseg_of s008A_58) (wseg_of s008A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s008B_0) (wseg_append (wseg_of s008B_1) (wseg_append (wseg_of s008B_2) (wseg_append (wseg_of s008B_3) (wseg_append (wseg_of s008B_4) (wseg_append (wseg_of s008B_5) (wseg_append (wseg_of s008B_6) (wseg_append (wseg_of s008B_7) (wseg_append (wseg_of s008B_8) (wseg_append (wseg_of s008B_9) (wseg_append (wseg_of s008B_10) (wseg_of s008B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t009A : List Tok := t009A_0 ++ (t009A_1 ++ (t009A_2 ++ (t009A_3 ++ (t009A_4 ++ (t009A_5 ++ (t009A_6 ++ (t009A_7 ++ (t009A_8 ++ (t009A_9 ++ (t009A_10 ++ (t009A_11 ++ (t009A_12 ++ (t009A_13 ++ (t009A_14 ++ (t009A_15 ++ (t009A_16 ++ (t009A_17 ++ (t009A_18 ++ (t009A_19 ++ (t009A_20 ++ (t009A_21 ++ (t009A_22 ++ (t009A_23 ++ (t009A_24 ++ (t009A_25 ++ (t009A_26 ++ (t009A_27 ++ (t009A_28 ++ (t009A_29 ++ (t009A_30 ++ (t009A_31 ++ (t009A_32 ++ (t009A_33 ++ (t009A_34 ++ (t009A_35 ++ (t009A_36 ++ (t009A_37 ++ (t009A_38 ++ (t009A_39 ++ (t009A_40 ++ (t009A_41 ++ (t009A_42 ++ (t009A_43 ++ (t009A_44 ++ (t009A_45 ++ (t009A_46 ++ (t009A_47 ++ (t009A_48 ++ (t009A_49 ++ (t009A_50 ++ (t009A_51 ++ (t009A_52 ++ (t009A_53 ++ (t009A_54 ++ (t009A_55 ++ (t009A_56 ++ (t009A_57 ++ (t009A_58 ++ (t009A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t009B : List Tok := t009B_0 ++ (t009B_1 ++ (t009B_2 ++ (t009B_3 ++ (t009B_4 ++ (t009B_5 ++ (t009B_6 ++ (t009B_7 ++ (t009B_8 ++ (t009B_9 ++ (t009B_10 ++ (t009B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 009：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run009 : (nbRun P nb009 0 kN009 t009A).1 = true ∧ (nbRun P nb009 1 kN009 t009B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s009A_0) (wseg_append (wseg_of s009A_1) (wseg_append (wseg_of s009A_2) (wseg_append (wseg_of s009A_3) (wseg_append (wseg_of s009A_4) (wseg_append (wseg_of s009A_5) (wseg_append (wseg_of s009A_6) (wseg_append (wseg_of s009A_7) (wseg_append (wseg_of s009A_8) (wseg_append (wseg_of s009A_9) (wseg_append (wseg_of s009A_10) (wseg_append (wseg_of s009A_11) (wseg_append (wseg_of s009A_12) (wseg_append (wseg_of s009A_13) (wseg_append (wseg_of s009A_14) (wseg_append (wseg_of s009A_15) (wseg_append (wseg_of s009A_16) (wseg_append (wseg_of s009A_17) (wseg_append (wseg_of s009A_18) (wseg_append (wseg_of s009A_19) (wseg_append (wseg_of s009A_20) (wseg_append (wseg_of s009A_21) (wseg_append (wseg_of s009A_22) (wseg_append (wseg_of s009A_23) (wseg_append (wseg_of s009A_24) (wseg_append (wseg_of s009A_25) (wseg_append (wseg_of s009A_26) (wseg_append (wseg_of s009A_27) (wseg_append (wseg_of s009A_28) (wseg_append (wseg_of s009A_29) (wseg_append (wseg_of s009A_30) (wseg_append (wseg_of s009A_31) (wseg_append (wseg_of s009A_32) (wseg_append (wseg_of s009A_33) (wseg_append (wseg_of s009A_34) (wseg_append (wseg_of s009A_35) (wseg_append (wseg_of s009A_36) (wseg_append (wseg_of s009A_37) (wseg_append (wseg_of s009A_38) (wseg_append (wseg_of s009A_39) (wseg_append (wseg_of s009A_40) (wseg_append (wseg_of s009A_41) (wseg_append (wseg_of s009A_42) (wseg_append (wseg_of s009A_43) (wseg_append (wseg_of s009A_44) (wseg_append (wseg_of s009A_45) (wseg_append (wseg_of s009A_46) (wseg_append (wseg_of s009A_47) (wseg_append (wseg_of s009A_48) (wseg_append (wseg_of s009A_49) (wseg_append (wseg_of s009A_50) (wseg_append (wseg_of s009A_51) (wseg_append (wseg_of s009A_52) (wseg_append (wseg_of s009A_53) (wseg_append (wseg_of s009A_54) (wseg_append (wseg_of s009A_55) (wseg_append (wseg_of s009A_56) (wseg_append (wseg_of s009A_57) (wseg_append (wseg_of s009A_58) (wseg_of s009A_59)))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s009B_0) (wseg_append (wseg_of s009B_1) (wseg_append (wseg_of s009B_2) (wseg_append (wseg_of s009B_3) (wseg_append (wseg_of s009B_4) (wseg_append (wseg_of s009B_5) (wseg_append (wseg_of s009B_6) (wseg_append (wseg_of s009B_7) (wseg_append (wseg_of s009B_8) (wseg_append (wseg_of s009B_9) (wseg_append (wseg_of s009B_10) (wseg_of s009B_11))))))))))))⟩

end PackLean.D40.Tet
