-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS041_0
import PackLean.D40.K.FarS041_1
import PackLean.D40.K.FarS041_2
import PackLean.D40.K.FarS041_3
import PackLean.D40.K.FarS041_4
import PackLean.D40.K.FarS041_5
import PackLean.D40.K.FarS041_6
import PackLean.D40.K.FarS041_7
import PackLean.D40.K.FarS041_8
import PackLean.D40.K.FarS041_9
import PackLean.D40.K.FarS041_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t127A : List Tok := t127A_0 ++ (t127A_1 ++ (t127A_2 ++ (t127A_3 ++ (t127A_4 ++ (t127A_5 ++ (t127A_6 ++ (t127A_7 ++ (t127A_8 ++ (t127A_9 ++ (t127A_10 ++ (t127A_11 ++ (t127A_12 ++ (t127A_13 ++ (t127A_14 ++ (t127A_15 ++ (t127A_16 ++ (t127A_17 ++ (t127A_18 ++ (t127A_19 ++ (t127A_20 ++ (t127A_21 ++ (t127A_22 ++ (t127A_23 ++ (t127A_24 ++ (t127A_25 ++ (t127A_26 ++ (t127A_27 ++ (t127A_28 ++ (t127A_29 ++ (t127A_30 ++ (t127A_31 ++ (t127A_32 ++ (t127A_33 ++ (t127A_34 ++ (t127A_35 ++ (t127A_36 ++ (t127A_37 ++ (t127A_38 ++ (t127A_39 ++ (t127A_40 ++ (t127A_41 ++ (t127A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t127B : List Tok := t127B_0 ++ (t127B_1 ++ (t127B_2 ++ (t127B_3 ++ (t127B_4 ++ (t127B_5 ++ (t127B_6 ++ (t127B_7 ++ (t127B_8 ++ (t127B_9 ++ (t127B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 127：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run127 : (nbRun P nb127 0 kN127 t127A).1 = true ∧ (nbRun P nb127 1 kN127 t127B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s127A_0) (wseg_append (wseg_of s127A_1) (wseg_append (wseg_of s127A_2) (wseg_append (wseg_of s127A_3) (wseg_append (wseg_of s127A_4) (wseg_append (wseg_of s127A_5) (wseg_append (wseg_of s127A_6) (wseg_append (wseg_of s127A_7) (wseg_append (wseg_of s127A_8) (wseg_append (wseg_of s127A_9) (wseg_append (wseg_of s127A_10) (wseg_append (wseg_of s127A_11) (wseg_append (wseg_of s127A_12) (wseg_append (wseg_of s127A_13) (wseg_append (wseg_of s127A_14) (wseg_append (wseg_of s127A_15) (wseg_append (wseg_of s127A_16) (wseg_append (wseg_of s127A_17) (wseg_append (wseg_of s127A_18) (wseg_append (wseg_of s127A_19) (wseg_append (wseg_of s127A_20) (wseg_append (wseg_of s127A_21) (wseg_append (wseg_of s127A_22) (wseg_append (wseg_of s127A_23) (wseg_append (wseg_of s127A_24) (wseg_append (wseg_of s127A_25) (wseg_append (wseg_of s127A_26) (wseg_append (wseg_of s127A_27) (wseg_append (wseg_of s127A_28) (wseg_append (wseg_of s127A_29) (wseg_append (wseg_of s127A_30) (wseg_append (wseg_of s127A_31) (wseg_append (wseg_of s127A_32) (wseg_append (wseg_of s127A_33) (wseg_append (wseg_of s127A_34) (wseg_append (wseg_of s127A_35) (wseg_append (wseg_of s127A_36) (wseg_append (wseg_of s127A_37) (wseg_append (wseg_of s127A_38) (wseg_append (wseg_of s127A_39) (wseg_append (wseg_of s127A_40) (wseg_append (wseg_of s127A_41) (wseg_of s127A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s127B_0) (wseg_append (wseg_of s127B_1) (wseg_append (wseg_of s127B_2) (wseg_append (wseg_of s127B_3) (wseg_append (wseg_of s127B_4) (wseg_append (wseg_of s127B_5) (wseg_append (wseg_of s127B_6) (wseg_append (wseg_of s127B_7) (wseg_append (wseg_of s127B_8) (wseg_append (wseg_of s127B_9) (wseg_of s127B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128A : List Tok := t128A_0 ++ (t128A_1 ++ (t128A_2 ++ (t128A_3 ++ (t128A_4 ++ (t128A_5 ++ (t128A_6 ++ (t128A_7 ++ (t128A_8 ++ (t128A_9 ++ (t128A_10 ++ (t128A_11 ++ (t128A_12 ++ (t128A_13 ++ (t128A_14 ++ (t128A_15 ++ (t128A_16 ++ (t128A_17 ++ (t128A_18 ++ (t128A_19 ++ (t128A_20 ++ (t128A_21 ++ (t128A_22 ++ (t128A_23 ++ (t128A_24 ++ (t128A_25 ++ (t128A_26 ++ (t128A_27 ++ (t128A_28 ++ (t128A_29 ++ (t128A_30 ++ (t128A_31 ++ (t128A_32 ++ (t128A_33 ++ (t128A_34 ++ (t128A_35 ++ (t128A_36 ++ (t128A_37 ++ (t128A_38 ++ (t128A_39)))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t128B : List Tok := t128B_0 ++ (t128B_1 ++ (t128B_2 ++ (t128B_3 ++ (t128B_4 ++ (t128B_5 ++ (t128B_6 ++ (t128B_7 ++ (t128B_8 ++ (t128B_9 ++ (t128B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 128：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run128 : (nbRun P nb128 0 kN128 t128A).1 = true ∧ (nbRun P nb128 1 kN128 t128B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s128A_0) (wseg_append (wseg_of s128A_1) (wseg_append (wseg_of s128A_2) (wseg_append (wseg_of s128A_3) (wseg_append (wseg_of s128A_4) (wseg_append (wseg_of s128A_5) (wseg_append (wseg_of s128A_6) (wseg_append (wseg_of s128A_7) (wseg_append (wseg_of s128A_8) (wseg_append (wseg_of s128A_9) (wseg_append (wseg_of s128A_10) (wseg_append (wseg_of s128A_11) (wseg_append (wseg_of s128A_12) (wseg_append (wseg_of s128A_13) (wseg_append (wseg_of s128A_14) (wseg_append (wseg_of s128A_15) (wseg_append (wseg_of s128A_16) (wseg_append (wseg_of s128A_17) (wseg_append (wseg_of s128A_18) (wseg_append (wseg_of s128A_19) (wseg_append (wseg_of s128A_20) (wseg_append (wseg_of s128A_21) (wseg_append (wseg_of s128A_22) (wseg_append (wseg_of s128A_23) (wseg_append (wseg_of s128A_24) (wseg_append (wseg_of s128A_25) (wseg_append (wseg_of s128A_26) (wseg_append (wseg_of s128A_27) (wseg_append (wseg_of s128A_28) (wseg_append (wseg_of s128A_29) (wseg_append (wseg_of s128A_30) (wseg_append (wseg_of s128A_31) (wseg_append (wseg_of s128A_32) (wseg_append (wseg_of s128A_33) (wseg_append (wseg_of s128A_34) (wseg_append (wseg_of s128A_35) (wseg_append (wseg_of s128A_36) (wseg_append (wseg_of s128A_37) (wseg_append (wseg_of s128A_38) (wseg_of s128A_39)))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s128B_0) (wseg_append (wseg_of s128B_1) (wseg_append (wseg_of s128B_2) (wseg_append (wseg_of s128B_3) (wseg_append (wseg_of s128B_4) (wseg_append (wseg_of s128B_5) (wseg_append (wseg_of s128B_6) (wseg_append (wseg_of s128B_7) (wseg_append (wseg_of s128B_8) (wseg_append (wseg_of s128B_9) (wseg_of s128B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t129A : List Tok := t129A_0 ++ (t129A_1 ++ (t129A_2 ++ (t129A_3 ++ (t129A_4 ++ (t129A_5 ++ (t129A_6 ++ (t129A_7 ++ (t129A_8 ++ (t129A_9 ++ (t129A_10 ++ (t129A_11 ++ (t129A_12 ++ (t129A_13 ++ (t129A_14 ++ (t129A_15 ++ (t129A_16 ++ (t129A_17 ++ (t129A_18 ++ (t129A_19 ++ (t129A_20 ++ (t129A_21 ++ (t129A_22 ++ (t129A_23 ++ (t129A_24 ++ (t129A_25 ++ (t129A_26 ++ (t129A_27 ++ (t129A_28 ++ (t129A_29 ++ (t129A_30 ++ (t129A_31 ++ (t129A_32 ++ (t129A_33 ++ (t129A_34 ++ (t129A_35 ++ (t129A_36 ++ (t129A_37)))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t129B : List Tok := t129B_0 ++ (t129B_1 ++ (t129B_2 ++ (t129B_3 ++ (t129B_4 ++ (t129B_5 ++ (t129B_6 ++ (t129B_7 ++ (t129B_8 ++ (t129B_9 ++ (t129B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 129：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run129 : (nbRun P nb129 0 kN129 t129A).1 = true ∧ (nbRun P nb129 1 kN129 t129B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s129A_0) (wseg_append (wseg_of s129A_1) (wseg_append (wseg_of s129A_2) (wseg_append (wseg_of s129A_3) (wseg_append (wseg_of s129A_4) (wseg_append (wseg_of s129A_5) (wseg_append (wseg_of s129A_6) (wseg_append (wseg_of s129A_7) (wseg_append (wseg_of s129A_8) (wseg_append (wseg_of s129A_9) (wseg_append (wseg_of s129A_10) (wseg_append (wseg_of s129A_11) (wseg_append (wseg_of s129A_12) (wseg_append (wseg_of s129A_13) (wseg_append (wseg_of s129A_14) (wseg_append (wseg_of s129A_15) (wseg_append (wseg_of s129A_16) (wseg_append (wseg_of s129A_17) (wseg_append (wseg_of s129A_18) (wseg_append (wseg_of s129A_19) (wseg_append (wseg_of s129A_20) (wseg_append (wseg_of s129A_21) (wseg_append (wseg_of s129A_22) (wseg_append (wseg_of s129A_23) (wseg_append (wseg_of s129A_24) (wseg_append (wseg_of s129A_25) (wseg_append (wseg_of s129A_26) (wseg_append (wseg_of s129A_27) (wseg_append (wseg_of s129A_28) (wseg_append (wseg_of s129A_29) (wseg_append (wseg_of s129A_30) (wseg_append (wseg_of s129A_31) (wseg_append (wseg_of s129A_32) (wseg_append (wseg_of s129A_33) (wseg_append (wseg_of s129A_34) (wseg_append (wseg_of s129A_35) (wseg_append (wseg_of s129A_36) (wseg_of s129A_37)))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s129B_0) (wseg_append (wseg_of s129B_1) (wseg_append (wseg_of s129B_2) (wseg_append (wseg_of s129B_3) (wseg_append (wseg_of s129B_4) (wseg_append (wseg_of s129B_5) (wseg_append (wseg_of s129B_6) (wseg_append (wseg_of s129B_7) (wseg_append (wseg_of s129B_8) (wseg_append (wseg_of s129B_9) (wseg_of s129B_10)))))))))))⟩

end PackLean.D40.Tet
