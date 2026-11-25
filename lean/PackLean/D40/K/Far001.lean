-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS001_0
import PackLean.D40.K.FarS001_1
import PackLean.D40.K.FarS001_2
import PackLean.D40.K.FarS001_3
import PackLean.D40.K.FarS001_4
import PackLean.D40.K.FarS001_5
import PackLean.D40.K.FarS001_6
import PackLean.D40.K.FarS001_7
import PackLean.D40.K.FarS001_8
import PackLean.D40.K.FarS001_9
import PackLean.D40.K.FarS001_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t002A : List Tok := t002A_0 ++ (t002A_1 ++ (t002A_2 ++ (t002A_3 ++ (t002A_4 ++ (t002A_5 ++ (t002A_6 ++ (t002A_7 ++ (t002A_8 ++ (t002A_9 ++ (t002A_10 ++ (t002A_11 ++ (t002A_12 ++ (t002A_13 ++ (t002A_14 ++ (t002A_15 ++ (t002A_16 ++ (t002A_17 ++ (t002A_18 ++ (t002A_19 ++ (t002A_20 ++ (t002A_21 ++ (t002A_22 ++ (t002A_23 ++ (t002A_24 ++ (t002A_25 ++ (t002A_26 ++ (t002A_27 ++ (t002A_28 ++ (t002A_29 ++ (t002A_30 ++ (t002A_31 ++ (t002A_32 ++ (t002A_33 ++ (t002A_34 ++ (t002A_35 ++ (t002A_36 ++ (t002A_37 ++ (t002A_38 ++ (t002A_39 ++ (t002A_40 ++ (t002A_41 ++ (t002A_42 ++ (t002A_43 ++ (t002A_44 ++ (t002A_45 ++ (t002A_46 ++ (t002A_47 ++ (t002A_48 ++ (t002A_49 ++ (t002A_50 ++ (t002A_51 ++ (t002A_52 ++ (t002A_53 ++ (t002A_54 ++ (t002A_55 ++ (t002A_56 ++ (t002A_57 ++ (t002A_58 ++ (t002A_59 ++ (t002A_60 ++ (t002A_61 ++ (t002A_62 ++ (t002A_63 ++ (t002A_64 ++ (t002A_65 ++ (t002A_66 ++ (t002A_67 ++ (t002A_68 ++ (t002A_69 ++ (t002A_70))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t002B : List Tok := t002B_0 ++ (t002B_1 ++ (t002B_2 ++ (t002B_3 ++ (t002B_4 ++ (t002B_5 ++ (t002B_6 ++ (t002B_7 ++ (t002B_8 ++ (t002B_9 ++ (t002B_10 ++ (t002B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 002：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run002 : (nbRun P nb002 0 kN002 t002A).1 = true ∧ (nbRun P nb002 1 kN002 t002B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s002A_0) (wseg_append (wseg_of s002A_1) (wseg_append (wseg_of s002A_2) (wseg_append (wseg_of s002A_3) (wseg_append (wseg_of s002A_4) (wseg_append (wseg_of s002A_5) (wseg_append (wseg_of s002A_6) (wseg_append (wseg_of s002A_7) (wseg_append (wseg_of s002A_8) (wseg_append (wseg_of s002A_9) (wseg_append (wseg_of s002A_10) (wseg_append (wseg_of s002A_11) (wseg_append (wseg_of s002A_12) (wseg_append (wseg_of s002A_13) (wseg_append (wseg_of s002A_14) (wseg_append (wseg_of s002A_15) (wseg_append (wseg_of s002A_16) (wseg_append (wseg_of s002A_17) (wseg_append (wseg_of s002A_18) (wseg_append (wseg_of s002A_19) (wseg_append (wseg_of s002A_20) (wseg_append (wseg_of s002A_21) (wseg_append (wseg_of s002A_22) (wseg_append (wseg_of s002A_23) (wseg_append (wseg_of s002A_24) (wseg_append (wseg_of s002A_25) (wseg_append (wseg_of s002A_26) (wseg_append (wseg_of s002A_27) (wseg_append (wseg_of s002A_28) (wseg_append (wseg_of s002A_29) (wseg_append (wseg_of s002A_30) (wseg_append (wseg_of s002A_31) (wseg_append (wseg_of s002A_32) (wseg_append (wseg_of s002A_33) (wseg_append (wseg_of s002A_34) (wseg_append (wseg_of s002A_35) (wseg_append (wseg_of s002A_36) (wseg_append (wseg_of s002A_37) (wseg_append (wseg_of s002A_38) (wseg_append (wseg_of s002A_39) (wseg_append (wseg_of s002A_40) (wseg_append (wseg_of s002A_41) (wseg_append (wseg_of s002A_42) (wseg_append (wseg_of s002A_43) (wseg_append (wseg_of s002A_44) (wseg_append (wseg_of s002A_45) (wseg_append (wseg_of s002A_46) (wseg_append (wseg_of s002A_47) (wseg_append (wseg_of s002A_48) (wseg_append (wseg_of s002A_49) (wseg_append (wseg_of s002A_50) (wseg_append (wseg_of s002A_51) (wseg_append (wseg_of s002A_52) (wseg_append (wseg_of s002A_53) (wseg_append (wseg_of s002A_54) (wseg_append (wseg_of s002A_55) (wseg_append (wseg_of s002A_56) (wseg_append (wseg_of s002A_57) (wseg_append (wseg_of s002A_58) (wseg_append (wseg_of s002A_59) (wseg_append (wseg_of s002A_60) (wseg_append (wseg_of s002A_61) (wseg_append (wseg_of s002A_62) (wseg_append (wseg_of s002A_63) (wseg_append (wseg_of s002A_64) (wseg_append (wseg_of s002A_65) (wseg_append (wseg_of s002A_66) (wseg_append (wseg_of s002A_67) (wseg_append (wseg_of s002A_68) (wseg_append (wseg_of s002A_69) (wseg_of s002A_70))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s002B_0) (wseg_append (wseg_of s002B_1) (wseg_append (wseg_of s002B_2) (wseg_append (wseg_of s002B_3) (wseg_append (wseg_of s002B_4) (wseg_append (wseg_of s002B_5) (wseg_append (wseg_of s002B_6) (wseg_append (wseg_of s002B_7) (wseg_append (wseg_of s002B_8) (wseg_append (wseg_of s002B_9) (wseg_append (wseg_of s002B_10) (wseg_of s002B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t003A : List Tok := t003A_0 ++ (t003A_1 ++ (t003A_2 ++ (t003A_3 ++ (t003A_4 ++ (t003A_5 ++ (t003A_6 ++ (t003A_7 ++ (t003A_8 ++ (t003A_9 ++ (t003A_10 ++ (t003A_11 ++ (t003A_12 ++ (t003A_13 ++ (t003A_14 ++ (t003A_15 ++ (t003A_16 ++ (t003A_17 ++ (t003A_18 ++ (t003A_19 ++ (t003A_20 ++ (t003A_21 ++ (t003A_22 ++ (t003A_23 ++ (t003A_24 ++ (t003A_25 ++ (t003A_26 ++ (t003A_27 ++ (t003A_28 ++ (t003A_29 ++ (t003A_30 ++ (t003A_31 ++ (t003A_32 ++ (t003A_33 ++ (t003A_34 ++ (t003A_35 ++ (t003A_36 ++ (t003A_37 ++ (t003A_38 ++ (t003A_39 ++ (t003A_40 ++ (t003A_41 ++ (t003A_42 ++ (t003A_43 ++ (t003A_44 ++ (t003A_45 ++ (t003A_46 ++ (t003A_47 ++ (t003A_48 ++ (t003A_49 ++ (t003A_50 ++ (t003A_51 ++ (t003A_52 ++ (t003A_53 ++ (t003A_54 ++ (t003A_55 ++ (t003A_56 ++ (t003A_57 ++ (t003A_58 ++ (t003A_59 ++ (t003A_60 ++ (t003A_61 ++ (t003A_62))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t003B : List Tok := t003B_0 ++ (t003B_1 ++ (t003B_2 ++ (t003B_3 ++ (t003B_4 ++ (t003B_5 ++ (t003B_6 ++ (t003B_7 ++ (t003B_8 ++ (t003B_9 ++ (t003B_10 ++ (t003B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 003：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run003 : (nbRun P nb003 0 kN003 t003A).1 = true ∧ (nbRun P nb003 1 kN003 t003B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s003A_0) (wseg_append (wseg_of s003A_1) (wseg_append (wseg_of s003A_2) (wseg_append (wseg_of s003A_3) (wseg_append (wseg_of s003A_4) (wseg_append (wseg_of s003A_5) (wseg_append (wseg_of s003A_6) (wseg_append (wseg_of s003A_7) (wseg_append (wseg_of s003A_8) (wseg_append (wseg_of s003A_9) (wseg_append (wseg_of s003A_10) (wseg_append (wseg_of s003A_11) (wseg_append (wseg_of s003A_12) (wseg_append (wseg_of s003A_13) (wseg_append (wseg_of s003A_14) (wseg_append (wseg_of s003A_15) (wseg_append (wseg_of s003A_16) (wseg_append (wseg_of s003A_17) (wseg_append (wseg_of s003A_18) (wseg_append (wseg_of s003A_19) (wseg_append (wseg_of s003A_20) (wseg_append (wseg_of s003A_21) (wseg_append (wseg_of s003A_22) (wseg_append (wseg_of s003A_23) (wseg_append (wseg_of s003A_24) (wseg_append (wseg_of s003A_25) (wseg_append (wseg_of s003A_26) (wseg_append (wseg_of s003A_27) (wseg_append (wseg_of s003A_28) (wseg_append (wseg_of s003A_29) (wseg_append (wseg_of s003A_30) (wseg_append (wseg_of s003A_31) (wseg_append (wseg_of s003A_32) (wseg_append (wseg_of s003A_33) (wseg_append (wseg_of s003A_34) (wseg_append (wseg_of s003A_35) (wseg_append (wseg_of s003A_36) (wseg_append (wseg_of s003A_37) (wseg_append (wseg_of s003A_38) (wseg_append (wseg_of s003A_39) (wseg_append (wseg_of s003A_40) (wseg_append (wseg_of s003A_41) (wseg_append (wseg_of s003A_42) (wseg_append (wseg_of s003A_43) (wseg_append (wseg_of s003A_44) (wseg_append (wseg_of s003A_45) (wseg_append (wseg_of s003A_46) (wseg_append (wseg_of s003A_47) (wseg_append (wseg_of s003A_48) (wseg_append (wseg_of s003A_49) (wseg_append (wseg_of s003A_50) (wseg_append (wseg_of s003A_51) (wseg_append (wseg_of s003A_52) (wseg_append (wseg_of s003A_53) (wseg_append (wseg_of s003A_54) (wseg_append (wseg_of s003A_55) (wseg_append (wseg_of s003A_56) (wseg_append (wseg_of s003A_57) (wseg_append (wseg_of s003A_58) (wseg_append (wseg_of s003A_59) (wseg_append (wseg_of s003A_60) (wseg_append (wseg_of s003A_61) (wseg_of s003A_62))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s003B_0) (wseg_append (wseg_of s003B_1) (wseg_append (wseg_of s003B_2) (wseg_append (wseg_of s003B_3) (wseg_append (wseg_of s003B_4) (wseg_append (wseg_of s003B_5) (wseg_append (wseg_of s003B_6) (wseg_append (wseg_of s003B_7) (wseg_append (wseg_of s003B_8) (wseg_append (wseg_of s003B_9) (wseg_append (wseg_of s003B_10) (wseg_of s003B_11))))))))))))⟩

end PackLean.D40.Tet
