-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS037_0
import PackLean.D40.K.FarS037_1
import PackLean.D40.K.FarS037_2
import PackLean.D40.K.FarS037_3
import PackLean.D40.K.FarS037_4
import PackLean.D40.K.FarS037_5
import PackLean.D40.K.FarS037_6
import PackLean.D40.K.FarS037_7
import PackLean.D40.K.FarS037_8
import PackLean.D40.K.FarS037_9
import PackLean.D40.K.FarS037_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t114A : List Tok := t114A_0 ++ (t114A_1 ++ (t114A_2 ++ (t114A_3 ++ (t114A_4 ++ (t114A_5 ++ (t114A_6 ++ (t114A_7 ++ (t114A_8 ++ (t114A_9 ++ (t114A_10 ++ (t114A_11 ++ (t114A_12 ++ (t114A_13 ++ (t114A_14 ++ (t114A_15 ++ (t114A_16 ++ (t114A_17 ++ (t114A_18 ++ (t114A_19 ++ (t114A_20 ++ (t114A_21 ++ (t114A_22 ++ (t114A_23 ++ (t114A_24 ++ (t114A_25 ++ (t114A_26 ++ (t114A_27 ++ (t114A_28 ++ (t114A_29 ++ (t114A_30 ++ (t114A_31 ++ (t114A_32 ++ (t114A_33 ++ (t114A_34 ++ (t114A_35 ++ (t114A_36 ++ (t114A_37 ++ (t114A_38 ++ (t114A_39 ++ (t114A_40 ++ (t114A_41 ++ (t114A_42 ++ (t114A_43 ++ (t114A_44 ++ (t114A_45)))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t114B : List Tok := t114B_0 ++ (t114B_1 ++ (t114B_2 ++ (t114B_3 ++ (t114B_4 ++ (t114B_5 ++ (t114B_6 ++ (t114B_7 ++ (t114B_8 ++ (t114B_9 ++ (t114B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 114：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run114 : (nbRun P nb114 0 kN114 t114A).1 = true ∧ (nbRun P nb114 1 kN114 t114B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s114A_0) (wseg_append (wseg_of s114A_1) (wseg_append (wseg_of s114A_2) (wseg_append (wseg_of s114A_3) (wseg_append (wseg_of s114A_4) (wseg_append (wseg_of s114A_5) (wseg_append (wseg_of s114A_6) (wseg_append (wseg_of s114A_7) (wseg_append (wseg_of s114A_8) (wseg_append (wseg_of s114A_9) (wseg_append (wseg_of s114A_10) (wseg_append (wseg_of s114A_11) (wseg_append (wseg_of s114A_12) (wseg_append (wseg_of s114A_13) (wseg_append (wseg_of s114A_14) (wseg_append (wseg_of s114A_15) (wseg_append (wseg_of s114A_16) (wseg_append (wseg_of s114A_17) (wseg_append (wseg_of s114A_18) (wseg_append (wseg_of s114A_19) (wseg_append (wseg_of s114A_20) (wseg_append (wseg_of s114A_21) (wseg_append (wseg_of s114A_22) (wseg_append (wseg_of s114A_23) (wseg_append (wseg_of s114A_24) (wseg_append (wseg_of s114A_25) (wseg_append (wseg_of s114A_26) (wseg_append (wseg_of s114A_27) (wseg_append (wseg_of s114A_28) (wseg_append (wseg_of s114A_29) (wseg_append (wseg_of s114A_30) (wseg_append (wseg_of s114A_31) (wseg_append (wseg_of s114A_32) (wseg_append (wseg_of s114A_33) (wseg_append (wseg_of s114A_34) (wseg_append (wseg_of s114A_35) (wseg_append (wseg_of s114A_36) (wseg_append (wseg_of s114A_37) (wseg_append (wseg_of s114A_38) (wseg_append (wseg_of s114A_39) (wseg_append (wseg_of s114A_40) (wseg_append (wseg_of s114A_41) (wseg_append (wseg_of s114A_42) (wseg_append (wseg_of s114A_43) (wseg_append (wseg_of s114A_44) (wseg_of s114A_45)))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s114B_0) (wseg_append (wseg_of s114B_1) (wseg_append (wseg_of s114B_2) (wseg_append (wseg_of s114B_3) (wseg_append (wseg_of s114B_4) (wseg_append (wseg_of s114B_5) (wseg_append (wseg_of s114B_6) (wseg_append (wseg_of s114B_7) (wseg_append (wseg_of s114B_8) (wseg_append (wseg_of s114B_9) (wseg_of s114B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t115A : List Tok := t115A_0 ++ (t115A_1 ++ (t115A_2 ++ (t115A_3 ++ (t115A_4 ++ (t115A_5 ++ (t115A_6 ++ (t115A_7 ++ (t115A_8 ++ (t115A_9 ++ (t115A_10 ++ (t115A_11 ++ (t115A_12 ++ (t115A_13 ++ (t115A_14 ++ (t115A_15 ++ (t115A_16 ++ (t115A_17 ++ (t115A_18 ++ (t115A_19 ++ (t115A_20 ++ (t115A_21 ++ (t115A_22 ++ (t115A_23 ++ (t115A_24 ++ (t115A_25 ++ (t115A_26 ++ (t115A_27 ++ (t115A_28 ++ (t115A_29 ++ (t115A_30 ++ (t115A_31 ++ (t115A_32 ++ (t115A_33 ++ (t115A_34 ++ (t115A_35 ++ (t115A_36 ++ (t115A_37 ++ (t115A_38 ++ (t115A_39 ++ (t115A_40 ++ (t115A_41 ++ (t115A_42 ++ (t115A_43 ++ (t115A_44))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t115B : List Tok := t115B_0 ++ (t115B_1 ++ (t115B_2 ++ (t115B_3 ++ (t115B_4 ++ (t115B_5 ++ (t115B_6 ++ (t115B_7 ++ (t115B_8 ++ (t115B_9 ++ (t115B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 115：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run115 : (nbRun P nb115 0 kN115 t115A).1 = true ∧ (nbRun P nb115 1 kN115 t115B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s115A_0) (wseg_append (wseg_of s115A_1) (wseg_append (wseg_of s115A_2) (wseg_append (wseg_of s115A_3) (wseg_append (wseg_of s115A_4) (wseg_append (wseg_of s115A_5) (wseg_append (wseg_of s115A_6) (wseg_append (wseg_of s115A_7) (wseg_append (wseg_of s115A_8) (wseg_append (wseg_of s115A_9) (wseg_append (wseg_of s115A_10) (wseg_append (wseg_of s115A_11) (wseg_append (wseg_of s115A_12) (wseg_append (wseg_of s115A_13) (wseg_append (wseg_of s115A_14) (wseg_append (wseg_of s115A_15) (wseg_append (wseg_of s115A_16) (wseg_append (wseg_of s115A_17) (wseg_append (wseg_of s115A_18) (wseg_append (wseg_of s115A_19) (wseg_append (wseg_of s115A_20) (wseg_append (wseg_of s115A_21) (wseg_append (wseg_of s115A_22) (wseg_append (wseg_of s115A_23) (wseg_append (wseg_of s115A_24) (wseg_append (wseg_of s115A_25) (wseg_append (wseg_of s115A_26) (wseg_append (wseg_of s115A_27) (wseg_append (wseg_of s115A_28) (wseg_append (wseg_of s115A_29) (wseg_append (wseg_of s115A_30) (wseg_append (wseg_of s115A_31) (wseg_append (wseg_of s115A_32) (wseg_append (wseg_of s115A_33) (wseg_append (wseg_of s115A_34) (wseg_append (wseg_of s115A_35) (wseg_append (wseg_of s115A_36) (wseg_append (wseg_of s115A_37) (wseg_append (wseg_of s115A_38) (wseg_append (wseg_of s115A_39) (wseg_append (wseg_of s115A_40) (wseg_append (wseg_of s115A_41) (wseg_append (wseg_of s115A_42) (wseg_append (wseg_of s115A_43) (wseg_of s115A_44))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s115B_0) (wseg_append (wseg_of s115B_1) (wseg_append (wseg_of s115B_2) (wseg_append (wseg_of s115B_3) (wseg_append (wseg_of s115B_4) (wseg_append (wseg_of s115B_5) (wseg_append (wseg_of s115B_6) (wseg_append (wseg_of s115B_7) (wseg_append (wseg_of s115B_8) (wseg_append (wseg_of s115B_9) (wseg_of s115B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t116A : List Tok := t116A_0 ++ (t116A_1 ++ (t116A_2 ++ (t116A_3 ++ (t116A_4 ++ (t116A_5 ++ (t116A_6 ++ (t116A_7 ++ (t116A_8 ++ (t116A_9 ++ (t116A_10 ++ (t116A_11 ++ (t116A_12 ++ (t116A_13 ++ (t116A_14 ++ (t116A_15 ++ (t116A_16 ++ (t116A_17 ++ (t116A_18 ++ (t116A_19 ++ (t116A_20 ++ (t116A_21 ++ (t116A_22 ++ (t116A_23 ++ (t116A_24 ++ (t116A_25 ++ (t116A_26 ++ (t116A_27 ++ (t116A_28 ++ (t116A_29 ++ (t116A_30 ++ (t116A_31 ++ (t116A_32 ++ (t116A_33 ++ (t116A_34 ++ (t116A_35 ++ (t116A_36 ++ (t116A_37 ++ (t116A_38 ++ (t116A_39)))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t116B : List Tok := t116B_0 ++ (t116B_1 ++ (t116B_2 ++ (t116B_3 ++ (t116B_4 ++ (t116B_5 ++ (t116B_6 ++ (t116B_7 ++ (t116B_8 ++ (t116B_9 ++ (t116B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 116：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run116 : (nbRun P nb116 0 kN116 t116A).1 = true ∧ (nbRun P nb116 1 kN116 t116B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s116A_0) (wseg_append (wseg_of s116A_1) (wseg_append (wseg_of s116A_2) (wseg_append (wseg_of s116A_3) (wseg_append (wseg_of s116A_4) (wseg_append (wseg_of s116A_5) (wseg_append (wseg_of s116A_6) (wseg_append (wseg_of s116A_7) (wseg_append (wseg_of s116A_8) (wseg_append (wseg_of s116A_9) (wseg_append (wseg_of s116A_10) (wseg_append (wseg_of s116A_11) (wseg_append (wseg_of s116A_12) (wseg_append (wseg_of s116A_13) (wseg_append (wseg_of s116A_14) (wseg_append (wseg_of s116A_15) (wseg_append (wseg_of s116A_16) (wseg_append (wseg_of s116A_17) (wseg_append (wseg_of s116A_18) (wseg_append (wseg_of s116A_19) (wseg_append (wseg_of s116A_20) (wseg_append (wseg_of s116A_21) (wseg_append (wseg_of s116A_22) (wseg_append (wseg_of s116A_23) (wseg_append (wseg_of s116A_24) (wseg_append (wseg_of s116A_25) (wseg_append (wseg_of s116A_26) (wseg_append (wseg_of s116A_27) (wseg_append (wseg_of s116A_28) (wseg_append (wseg_of s116A_29) (wseg_append (wseg_of s116A_30) (wseg_append (wseg_of s116A_31) (wseg_append (wseg_of s116A_32) (wseg_append (wseg_of s116A_33) (wseg_append (wseg_of s116A_34) (wseg_append (wseg_of s116A_35) (wseg_append (wseg_of s116A_36) (wseg_append (wseg_of s116A_37) (wseg_append (wseg_of s116A_38) (wseg_of s116A_39)))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s116B_0) (wseg_append (wseg_of s116B_1) (wseg_append (wseg_of s116B_2) (wseg_append (wseg_of s116B_3) (wseg_append (wseg_of s116B_4) (wseg_append (wseg_of s116B_5) (wseg_append (wseg_of s116B_6) (wseg_append (wseg_of s116B_7) (wseg_append (wseg_of s116B_8) (wseg_append (wseg_of s116B_9) (wseg_of s116B_10)))))))))))⟩

end PackLean.D40.Tet
