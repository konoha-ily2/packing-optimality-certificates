-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS013_0
import PackLean.D40.K.FarS013_1
import PackLean.D40.K.FarS013_2
import PackLean.D40.K.FarS013_3
import PackLean.D40.K.FarS013_4
import PackLean.D40.K.FarS013_5
import PackLean.D40.K.FarS013_6
import PackLean.D40.K.FarS013_7
import PackLean.D40.K.FarS013_8
import PackLean.D40.K.FarS013_9
import PackLean.D40.K.FarS013_10
import PackLean.D40.K.FarS013_11
import PackLean.D40.K.FarS013_12
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t037A : List Tok := t037A_0 ++ (t037A_1 ++ (t037A_2 ++ (t037A_3 ++ (t037A_4 ++ (t037A_5 ++ (t037A_6 ++ (t037A_7 ++ (t037A_8 ++ (t037A_9 ++ (t037A_10 ++ (t037A_11 ++ (t037A_12 ++ (t037A_13 ++ (t037A_14 ++ (t037A_15 ++ (t037A_16 ++ (t037A_17 ++ (t037A_18 ++ (t037A_19 ++ (t037A_20 ++ (t037A_21 ++ (t037A_22 ++ (t037A_23 ++ (t037A_24 ++ (t037A_25 ++ (t037A_26 ++ (t037A_27 ++ (t037A_28 ++ (t037A_29 ++ (t037A_30 ++ (t037A_31 ++ (t037A_32 ++ (t037A_33 ++ (t037A_34 ++ (t037A_35 ++ (t037A_36 ++ (t037A_37 ++ (t037A_38 ++ (t037A_39 ++ (t037A_40 ++ (t037A_41 ++ (t037A_42 ++ (t037A_43 ++ (t037A_44 ++ (t037A_45 ++ (t037A_46 ++ (t037A_47 ++ (t037A_48 ++ (t037A_49 ++ (t037A_50))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t037B : List Tok := t037B_0 ++ (t037B_1 ++ (t037B_2 ++ (t037B_3 ++ (t037B_4 ++ (t037B_5 ++ (t037B_6 ++ (t037B_7 ++ (t037B_8 ++ (t037B_9 ++ (t037B_10 ++ (t037B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 037：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run037 : (nbRun P nb037 0 kN037 t037A).1 = true ∧ (nbRun P nb037 1 kN037 t037B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s037A_0) (wseg_append (wseg_of s037A_1) (wseg_append (wseg_of s037A_2) (wseg_append (wseg_of s037A_3) (wseg_append (wseg_of s037A_4) (wseg_append (wseg_of s037A_5) (wseg_append (wseg_of s037A_6) (wseg_append (wseg_of s037A_7) (wseg_append (wseg_of s037A_8) (wseg_append (wseg_of s037A_9) (wseg_append (wseg_of s037A_10) (wseg_append (wseg_of s037A_11) (wseg_append (wseg_of s037A_12) (wseg_append (wseg_of s037A_13) (wseg_append (wseg_of s037A_14) (wseg_append (wseg_of s037A_15) (wseg_append (wseg_of s037A_16) (wseg_append (wseg_of s037A_17) (wseg_append (wseg_of s037A_18) (wseg_append (wseg_of s037A_19) (wseg_append (wseg_of s037A_20) (wseg_append (wseg_of s037A_21) (wseg_append (wseg_of s037A_22) (wseg_append (wseg_of s037A_23) (wseg_append (wseg_of s037A_24) (wseg_append (wseg_of s037A_25) (wseg_append (wseg_of s037A_26) (wseg_append (wseg_of s037A_27) (wseg_append (wseg_of s037A_28) (wseg_append (wseg_of s037A_29) (wseg_append (wseg_of s037A_30) (wseg_append (wseg_of s037A_31) (wseg_append (wseg_of s037A_32) (wseg_append (wseg_of s037A_33) (wseg_append (wseg_of s037A_34) (wseg_append (wseg_of s037A_35) (wseg_append (wseg_of s037A_36) (wseg_append (wseg_of s037A_37) (wseg_append (wseg_of s037A_38) (wseg_append (wseg_of s037A_39) (wseg_append (wseg_of s037A_40) (wseg_append (wseg_of s037A_41) (wseg_append (wseg_of s037A_42) (wseg_append (wseg_of s037A_43) (wseg_append (wseg_of s037A_44) (wseg_append (wseg_of s037A_45) (wseg_append (wseg_of s037A_46) (wseg_append (wseg_of s037A_47) (wseg_append (wseg_of s037A_48) (wseg_append (wseg_of s037A_49) (wseg_of s037A_50))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s037B_0) (wseg_append (wseg_of s037B_1) (wseg_append (wseg_of s037B_2) (wseg_append (wseg_of s037B_3) (wseg_append (wseg_of s037B_4) (wseg_append (wseg_of s037B_5) (wseg_append (wseg_of s037B_6) (wseg_append (wseg_of s037B_7) (wseg_append (wseg_of s037B_8) (wseg_append (wseg_of s037B_9) (wseg_append (wseg_of s037B_10) (wseg_of s037B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t038A : List Tok := t038A_0 ++ (t038A_1 ++ (t038A_2 ++ (t038A_3 ++ (t038A_4 ++ (t038A_5 ++ (t038A_6 ++ (t038A_7 ++ (t038A_8 ++ (t038A_9 ++ (t038A_10 ++ (t038A_11 ++ (t038A_12 ++ (t038A_13 ++ (t038A_14 ++ (t038A_15 ++ (t038A_16 ++ (t038A_17 ++ (t038A_18 ++ (t038A_19 ++ (t038A_20 ++ (t038A_21 ++ (t038A_22 ++ (t038A_23 ++ (t038A_24 ++ (t038A_25 ++ (t038A_26 ++ (t038A_27 ++ (t038A_28 ++ (t038A_29 ++ (t038A_30 ++ (t038A_31 ++ (t038A_32 ++ (t038A_33 ++ (t038A_34 ++ (t038A_35 ++ (t038A_36 ++ (t038A_37 ++ (t038A_38 ++ (t038A_39 ++ (t038A_40 ++ (t038A_41 ++ (t038A_42 ++ (t038A_43 ++ (t038A_44 ++ (t038A_45 ++ (t038A_46 ++ (t038A_47 ++ (t038A_48 ++ (t038A_49 ++ (t038A_50 ++ (t038A_51 ++ (t038A_52))))))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t038B : List Tok := t038B_0 ++ (t038B_1 ++ (t038B_2 ++ (t038B_3 ++ (t038B_4 ++ (t038B_5 ++ (t038B_6 ++ (t038B_7 ++ (t038B_8 ++ (t038B_9 ++ (t038B_10 ++ (t038B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 038：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run038 : (nbRun P nb038 0 kN038 t038A).1 = true ∧ (nbRun P nb038 1 kN038 t038B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s038A_0) (wseg_append (wseg_of s038A_1) (wseg_append (wseg_of s038A_2) (wseg_append (wseg_of s038A_3) (wseg_append (wseg_of s038A_4) (wseg_append (wseg_of s038A_5) (wseg_append (wseg_of s038A_6) (wseg_append (wseg_of s038A_7) (wseg_append (wseg_of s038A_8) (wseg_append (wseg_of s038A_9) (wseg_append (wseg_of s038A_10) (wseg_append (wseg_of s038A_11) (wseg_append (wseg_of s038A_12) (wseg_append (wseg_of s038A_13) (wseg_append (wseg_of s038A_14) (wseg_append (wseg_of s038A_15) (wseg_append (wseg_of s038A_16) (wseg_append (wseg_of s038A_17) (wseg_append (wseg_of s038A_18) (wseg_append (wseg_of s038A_19) (wseg_append (wseg_of s038A_20) (wseg_append (wseg_of s038A_21) (wseg_append (wseg_of s038A_22) (wseg_append (wseg_of s038A_23) (wseg_append (wseg_of s038A_24) (wseg_append (wseg_of s038A_25) (wseg_append (wseg_of s038A_26) (wseg_append (wseg_of s038A_27) (wseg_append (wseg_of s038A_28) (wseg_append (wseg_of s038A_29) (wseg_append (wseg_of s038A_30) (wseg_append (wseg_of s038A_31) (wseg_append (wseg_of s038A_32) (wseg_append (wseg_of s038A_33) (wseg_append (wseg_of s038A_34) (wseg_append (wseg_of s038A_35) (wseg_append (wseg_of s038A_36) (wseg_append (wseg_of s038A_37) (wseg_append (wseg_of s038A_38) (wseg_append (wseg_of s038A_39) (wseg_append (wseg_of s038A_40) (wseg_append (wseg_of s038A_41) (wseg_append (wseg_of s038A_42) (wseg_append (wseg_of s038A_43) (wseg_append (wseg_of s038A_44) (wseg_append (wseg_of s038A_45) (wseg_append (wseg_of s038A_46) (wseg_append (wseg_of s038A_47) (wseg_append (wseg_of s038A_48) (wseg_append (wseg_of s038A_49) (wseg_append (wseg_of s038A_50) (wseg_append (wseg_of s038A_51) (wseg_of s038A_52))))))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s038B_0) (wseg_append (wseg_of s038B_1) (wseg_append (wseg_of s038B_2) (wseg_append (wseg_of s038B_3) (wseg_append (wseg_of s038B_4) (wseg_append (wseg_of s038B_5) (wseg_append (wseg_of s038B_6) (wseg_append (wseg_of s038B_7) (wseg_append (wseg_of s038B_8) (wseg_append (wseg_of s038B_9) (wseg_append (wseg_of s038B_10) (wseg_of s038B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t039A : List Tok := t039A_0 ++ (t039A_1 ++ (t039A_2 ++ (t039A_3 ++ (t039A_4 ++ (t039A_5 ++ (t039A_6 ++ (t039A_7 ++ (t039A_8 ++ (t039A_9 ++ (t039A_10 ++ (t039A_11 ++ (t039A_12 ++ (t039A_13 ++ (t039A_14 ++ (t039A_15 ++ (t039A_16 ++ (t039A_17 ++ (t039A_18 ++ (t039A_19 ++ (t039A_20 ++ (t039A_21 ++ (t039A_22 ++ (t039A_23 ++ (t039A_24 ++ (t039A_25 ++ (t039A_26 ++ (t039A_27 ++ (t039A_28 ++ (t039A_29 ++ (t039A_30 ++ (t039A_31 ++ (t039A_32 ++ (t039A_33 ++ (t039A_34 ++ (t039A_35 ++ (t039A_36 ++ (t039A_37 ++ (t039A_38 ++ (t039A_39 ++ (t039A_40 ++ (t039A_41 ++ (t039A_42 ++ (t039A_43 ++ (t039A_44 ++ (t039A_45 ++ (t039A_46 ++ (t039A_47 ++ (t039A_48 ++ (t039A_49)))))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t039B : List Tok := t039B_0 ++ (t039B_1 ++ (t039B_2 ++ (t039B_3 ++ (t039B_4 ++ (t039B_5 ++ (t039B_6 ++ (t039B_7 ++ (t039B_8 ++ (t039B_9 ++ (t039B_10 ++ (t039B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 039：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run039 : (nbRun P nb039 0 kN039 t039A).1 = true ∧ (nbRun P nb039 1 kN039 t039B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s039A_0) (wseg_append (wseg_of s039A_1) (wseg_append (wseg_of s039A_2) (wseg_append (wseg_of s039A_3) (wseg_append (wseg_of s039A_4) (wseg_append (wseg_of s039A_5) (wseg_append (wseg_of s039A_6) (wseg_append (wseg_of s039A_7) (wseg_append (wseg_of s039A_8) (wseg_append (wseg_of s039A_9) (wseg_append (wseg_of s039A_10) (wseg_append (wseg_of s039A_11) (wseg_append (wseg_of s039A_12) (wseg_append (wseg_of s039A_13) (wseg_append (wseg_of s039A_14) (wseg_append (wseg_of s039A_15) (wseg_append (wseg_of s039A_16) (wseg_append (wseg_of s039A_17) (wseg_append (wseg_of s039A_18) (wseg_append (wseg_of s039A_19) (wseg_append (wseg_of s039A_20) (wseg_append (wseg_of s039A_21) (wseg_append (wseg_of s039A_22) (wseg_append (wseg_of s039A_23) (wseg_append (wseg_of s039A_24) (wseg_append (wseg_of s039A_25) (wseg_append (wseg_of s039A_26) (wseg_append (wseg_of s039A_27) (wseg_append (wseg_of s039A_28) (wseg_append (wseg_of s039A_29) (wseg_append (wseg_of s039A_30) (wseg_append (wseg_of s039A_31) (wseg_append (wseg_of s039A_32) (wseg_append (wseg_of s039A_33) (wseg_append (wseg_of s039A_34) (wseg_append (wseg_of s039A_35) (wseg_append (wseg_of s039A_36) (wseg_append (wseg_of s039A_37) (wseg_append (wseg_of s039A_38) (wseg_append (wseg_of s039A_39) (wseg_append (wseg_of s039A_40) (wseg_append (wseg_of s039A_41) (wseg_append (wseg_of s039A_42) (wseg_append (wseg_of s039A_43) (wseg_append (wseg_of s039A_44) (wseg_append (wseg_of s039A_45) (wseg_append (wseg_of s039A_46) (wseg_append (wseg_of s039A_47) (wseg_append (wseg_of s039A_48) (wseg_of s039A_49)))))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s039B_0) (wseg_append (wseg_of s039B_1) (wseg_append (wseg_of s039B_2) (wseg_append (wseg_of s039B_3) (wseg_append (wseg_of s039B_4) (wseg_append (wseg_of s039B_5) (wseg_append (wseg_of s039B_6) (wseg_append (wseg_of s039B_7) (wseg_append (wseg_of s039B_8) (wseg_append (wseg_of s039B_9) (wseg_append (wseg_of s039B_10) (wseg_of s039B_11))))))))))))⟩

end PackLean.D40.Tet
