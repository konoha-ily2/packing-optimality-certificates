-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS032_0
import PackLean.D40.K.FarS032_1
import PackLean.D40.K.FarS032_2
import PackLean.D40.K.FarS032_3
import PackLean.D40.K.FarS032_4
import PackLean.D40.K.FarS032_5
import PackLean.D40.K.FarS032_6
import PackLean.D40.K.FarS032_7
import PackLean.D40.K.FarS032_8
import PackLean.D40.K.FarS032_9
import PackLean.D40.K.FarS032_10
import PackLean.D40.K.FarS032_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t099A : List Tok := t099A_0 ++ (t099A_1 ++ (t099A_2 ++ (t099A_3 ++ (t099A_4 ++ (t099A_5 ++ (t099A_6 ++ (t099A_7 ++ (t099A_8 ++ (t099A_9 ++ (t099A_10 ++ (t099A_11 ++ (t099A_12 ++ (t099A_13 ++ (t099A_14 ++ (t099A_15 ++ (t099A_16 ++ (t099A_17 ++ (t099A_18 ++ (t099A_19 ++ (t099A_20 ++ (t099A_21 ++ (t099A_22 ++ (t099A_23 ++ (t099A_24 ++ (t099A_25 ++ (t099A_26 ++ (t099A_27 ++ (t099A_28 ++ (t099A_29 ++ (t099A_30 ++ (t099A_31 ++ (t099A_32 ++ (t099A_33 ++ (t099A_34 ++ (t099A_35 ++ (t099A_36 ++ (t099A_37 ++ (t099A_38 ++ (t099A_39 ++ (t099A_40 ++ (t099A_41)))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t099B : List Tok := t099B_0 ++ (t099B_1 ++ (t099B_2 ++ (t099B_3 ++ (t099B_4 ++ (t099B_5 ++ (t099B_6 ++ (t099B_7 ++ (t099B_8 ++ (t099B_9 ++ (t099B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 099：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run099 : (nbRun P nb099 0 kN099 t099A).1 = true ∧ (nbRun P nb099 1 kN099 t099B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s099A_0) (wseg_append (wseg_of s099A_1) (wseg_append (wseg_of s099A_2) (wseg_append (wseg_of s099A_3) (wseg_append (wseg_of s099A_4) (wseg_append (wseg_of s099A_5) (wseg_append (wseg_of s099A_6) (wseg_append (wseg_of s099A_7) (wseg_append (wseg_of s099A_8) (wseg_append (wseg_of s099A_9) (wseg_append (wseg_of s099A_10) (wseg_append (wseg_of s099A_11) (wseg_append (wseg_of s099A_12) (wseg_append (wseg_of s099A_13) (wseg_append (wseg_of s099A_14) (wseg_append (wseg_of s099A_15) (wseg_append (wseg_of s099A_16) (wseg_append (wseg_of s099A_17) (wseg_append (wseg_of s099A_18) (wseg_append (wseg_of s099A_19) (wseg_append (wseg_of s099A_20) (wseg_append (wseg_of s099A_21) (wseg_append (wseg_of s099A_22) (wseg_append (wseg_of s099A_23) (wseg_append (wseg_of s099A_24) (wseg_append (wseg_of s099A_25) (wseg_append (wseg_of s099A_26) (wseg_append (wseg_of s099A_27) (wseg_append (wseg_of s099A_28) (wseg_append (wseg_of s099A_29) (wseg_append (wseg_of s099A_30) (wseg_append (wseg_of s099A_31) (wseg_append (wseg_of s099A_32) (wseg_append (wseg_of s099A_33) (wseg_append (wseg_of s099A_34) (wseg_append (wseg_of s099A_35) (wseg_append (wseg_of s099A_36) (wseg_append (wseg_of s099A_37) (wseg_append (wseg_of s099A_38) (wseg_append (wseg_of s099A_39) (wseg_append (wseg_of s099A_40) (wseg_of s099A_41)))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s099B_0) (wseg_append (wseg_of s099B_1) (wseg_append (wseg_of s099B_2) (wseg_append (wseg_of s099B_3) (wseg_append (wseg_of s099B_4) (wseg_append (wseg_of s099B_5) (wseg_append (wseg_of s099B_6) (wseg_append (wseg_of s099B_7) (wseg_append (wseg_of s099B_8) (wseg_append (wseg_of s099B_9) (wseg_of s099B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t100A : List Tok := t100A_0 ++ (t100A_1 ++ (t100A_2 ++ (t100A_3 ++ (t100A_4 ++ (t100A_5 ++ (t100A_6 ++ (t100A_7 ++ (t100A_8 ++ (t100A_9 ++ (t100A_10 ++ (t100A_11 ++ (t100A_12 ++ (t100A_13 ++ (t100A_14 ++ (t100A_15 ++ (t100A_16 ++ (t100A_17 ++ (t100A_18 ++ (t100A_19 ++ (t100A_20 ++ (t100A_21 ++ (t100A_22 ++ (t100A_23 ++ (t100A_24 ++ (t100A_25 ++ (t100A_26 ++ (t100A_27 ++ (t100A_28 ++ (t100A_29 ++ (t100A_30 ++ (t100A_31 ++ (t100A_32 ++ (t100A_33 ++ (t100A_34 ++ (t100A_35 ++ (t100A_36 ++ (t100A_37 ++ (t100A_38 ++ (t100A_39 ++ (t100A_40 ++ (t100A_41 ++ (t100A_42 ++ (t100A_43 ++ (t100A_44 ++ (t100A_45 ++ (t100A_46))))))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t100B : List Tok := t100B_0 ++ (t100B_1 ++ (t100B_2 ++ (t100B_3 ++ (t100B_4 ++ (t100B_5 ++ (t100B_6 ++ (t100B_7 ++ (t100B_8 ++ (t100B_9 ++ (t100B_10 ++ (t100B_11)))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 100：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run100 : (nbRun P nb100 0 kN100 t100A).1 = true ∧ (nbRun P nb100 1 kN100 t100B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s100A_0) (wseg_append (wseg_of s100A_1) (wseg_append (wseg_of s100A_2) (wseg_append (wseg_of s100A_3) (wseg_append (wseg_of s100A_4) (wseg_append (wseg_of s100A_5) (wseg_append (wseg_of s100A_6) (wseg_append (wseg_of s100A_7) (wseg_append (wseg_of s100A_8) (wseg_append (wseg_of s100A_9) (wseg_append (wseg_of s100A_10) (wseg_append (wseg_of s100A_11) (wseg_append (wseg_of s100A_12) (wseg_append (wseg_of s100A_13) (wseg_append (wseg_of s100A_14) (wseg_append (wseg_of s100A_15) (wseg_append (wseg_of s100A_16) (wseg_append (wseg_of s100A_17) (wseg_append (wseg_of s100A_18) (wseg_append (wseg_of s100A_19) (wseg_append (wseg_of s100A_20) (wseg_append (wseg_of s100A_21) (wseg_append (wseg_of s100A_22) (wseg_append (wseg_of s100A_23) (wseg_append (wseg_of s100A_24) (wseg_append (wseg_of s100A_25) (wseg_append (wseg_of s100A_26) (wseg_append (wseg_of s100A_27) (wseg_append (wseg_of s100A_28) (wseg_append (wseg_of s100A_29) (wseg_append (wseg_of s100A_30) (wseg_append (wseg_of s100A_31) (wseg_append (wseg_of s100A_32) (wseg_append (wseg_of s100A_33) (wseg_append (wseg_of s100A_34) (wseg_append (wseg_of s100A_35) (wseg_append (wseg_of s100A_36) (wseg_append (wseg_of s100A_37) (wseg_append (wseg_of s100A_38) (wseg_append (wseg_of s100A_39) (wseg_append (wseg_of s100A_40) (wseg_append (wseg_of s100A_41) (wseg_append (wseg_of s100A_42) (wseg_append (wseg_of s100A_43) (wseg_append (wseg_of s100A_44) (wseg_append (wseg_of s100A_45) (wseg_of s100A_46))))))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s100B_0) (wseg_append (wseg_of s100B_1) (wseg_append (wseg_of s100B_2) (wseg_append (wseg_of s100B_3) (wseg_append (wseg_of s100B_4) (wseg_append (wseg_of s100B_5) (wseg_append (wseg_of s100B_6) (wseg_append (wseg_of s100B_7) (wseg_append (wseg_of s100B_8) (wseg_append (wseg_of s100B_9) (wseg_append (wseg_of s100B_10) (wseg_of s100B_11))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t101A : List Tok := t101A_0 ++ (t101A_1 ++ (t101A_2 ++ (t101A_3 ++ (t101A_4 ++ (t101A_5 ++ (t101A_6 ++ (t101A_7 ++ (t101A_8 ++ (t101A_9 ++ (t101A_10 ++ (t101A_11 ++ (t101A_12 ++ (t101A_13 ++ (t101A_14 ++ (t101A_15 ++ (t101A_16 ++ (t101A_17 ++ (t101A_18 ++ (t101A_19 ++ (t101A_20 ++ (t101A_21 ++ (t101A_22 ++ (t101A_23 ++ (t101A_24 ++ (t101A_25 ++ (t101A_26 ++ (t101A_27 ++ (t101A_28 ++ (t101A_29 ++ (t101A_30 ++ (t101A_31 ++ (t101A_32 ++ (t101A_33 ++ (t101A_34 ++ (t101A_35 ++ (t101A_36 ++ (t101A_37 ++ (t101A_38 ++ (t101A_39 ++ (t101A_40 ++ (t101A_41 ++ (t101A_42))))))))))))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t101B : List Tok := t101B_0 ++ (t101B_1 ++ (t101B_2 ++ (t101B_3 ++ (t101B_4 ++ (t101B_5 ++ (t101B_6 ++ (t101B_7 ++ (t101B_8 ++ (t101B_9 ++ (t101B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 101：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run101 : (nbRun P nb101 0 kN101 t101A).1 = true ∧ (nbRun P nb101 1 kN101 t101B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s101A_0) (wseg_append (wseg_of s101A_1) (wseg_append (wseg_of s101A_2) (wseg_append (wseg_of s101A_3) (wseg_append (wseg_of s101A_4) (wseg_append (wseg_of s101A_5) (wseg_append (wseg_of s101A_6) (wseg_append (wseg_of s101A_7) (wseg_append (wseg_of s101A_8) (wseg_append (wseg_of s101A_9) (wseg_append (wseg_of s101A_10) (wseg_append (wseg_of s101A_11) (wseg_append (wseg_of s101A_12) (wseg_append (wseg_of s101A_13) (wseg_append (wseg_of s101A_14) (wseg_append (wseg_of s101A_15) (wseg_append (wseg_of s101A_16) (wseg_append (wseg_of s101A_17) (wseg_append (wseg_of s101A_18) (wseg_append (wseg_of s101A_19) (wseg_append (wseg_of s101A_20) (wseg_append (wseg_of s101A_21) (wseg_append (wseg_of s101A_22) (wseg_append (wseg_of s101A_23) (wseg_append (wseg_of s101A_24) (wseg_append (wseg_of s101A_25) (wseg_append (wseg_of s101A_26) (wseg_append (wseg_of s101A_27) (wseg_append (wseg_of s101A_28) (wseg_append (wseg_of s101A_29) (wseg_append (wseg_of s101A_30) (wseg_append (wseg_of s101A_31) (wseg_append (wseg_of s101A_32) (wseg_append (wseg_of s101A_33) (wseg_append (wseg_of s101A_34) (wseg_append (wseg_of s101A_35) (wseg_append (wseg_of s101A_36) (wseg_append (wseg_of s101A_37) (wseg_append (wseg_of s101A_38) (wseg_append (wseg_of s101A_39) (wseg_append (wseg_of s101A_40) (wseg_append (wseg_of s101A_41) (wseg_of s101A_42))))))))))))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s101B_0) (wseg_append (wseg_of s101B_1) (wseg_append (wseg_of s101B_2) (wseg_append (wseg_of s101B_3) (wseg_append (wseg_of s101B_4) (wseg_append (wseg_of s101B_5) (wseg_append (wseg_of s101B_6) (wseg_append (wseg_of s101B_7) (wseg_append (wseg_of s101B_8) (wseg_append (wseg_of s101B_9) (wseg_of s101B_10)))))))))))⟩

end PackLean.D40.Tet
