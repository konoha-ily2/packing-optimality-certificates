-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS065_0
import PackLean.D40.K.FarS065_1
import PackLean.D40.K.FarS065_2
import PackLean.D40.K.FarS065_3
import PackLean.D40.K.FarS065_4
import PackLean.D40.K.FarS065_5
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t234A : List Tok := t234A_0 ++ (t234A_1 ++ (t234A_2 ++ (t234A_3 ++ (t234A_4 ++ (t234A_5 ++ (t234A_6 ++ (t234A_7 ++ (t234A_8 ++ (t234A_9 ++ (t234A_10 ++ (t234A_11 ++ (t234A_12 ++ (t234A_13 ++ (t234A_14 ++ (t234A_15 ++ (t234A_16 ++ (t234A_17 ++ (t234A_18 ++ (t234A_19 ++ (t234A_20 ++ (t234A_21)))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t234B : List Tok := t234B_0 ++ (t234B_1 ++ (t234B_2 ++ (t234B_3 ++ (t234B_4 ++ (t234B_5 ++ (t234B_6 ++ (t234B_7 ++ (t234B_8 ++ (t234B_9 ++ (t234B_10 ++ (t234B_11 ++ (t234B_12 ++ (t234B_13 ++ (t234B_14 ++ (t234B_15 ++ (t234B_16 ++ (t234B_17 ++ (t234B_18 ++ (t234B_19 ++ (t234B_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 234：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run234 : (nbRun P nb234 0 kN234 t234A).1 = true ∧ (nbRun P nb234 1 kN234 t234B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s234A_0) (wseg_append (wseg_of s234A_1) (wseg_append (wseg_of s234A_2) (wseg_append (wseg_of s234A_3) (wseg_append (wseg_of s234A_4) (wseg_append (wseg_of s234A_5) (wseg_append (wseg_of s234A_6) (wseg_append (wseg_of s234A_7) (wseg_append (wseg_of s234A_8) (wseg_append (wseg_of s234A_9) (wseg_append (wseg_of s234A_10) (wseg_append (wseg_of s234A_11) (wseg_append (wseg_of s234A_12) (wseg_append (wseg_of s234A_13) (wseg_append (wseg_of s234A_14) (wseg_append (wseg_of s234A_15) (wseg_append (wseg_of s234A_16) (wseg_append (wseg_of s234A_17) (wseg_append (wseg_of s234A_18) (wseg_append (wseg_of s234A_19) (wseg_append (wseg_of s234A_20) (wseg_of s234A_21)))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s234B_0) (wseg_append (wseg_of s234B_1) (wseg_append (wseg_of s234B_2) (wseg_append (wseg_of s234B_3) (wseg_append (wseg_of s234B_4) (wseg_append (wseg_of s234B_5) (wseg_append (wseg_of s234B_6) (wseg_append (wseg_of s234B_7) (wseg_append (wseg_of s234B_8) (wseg_append (wseg_of s234B_9) (wseg_append (wseg_of s234B_10) (wseg_append (wseg_of s234B_11) (wseg_append (wseg_of s234B_12) (wseg_append (wseg_of s234B_13) (wseg_append (wseg_of s234B_14) (wseg_append (wseg_of s234B_15) (wseg_append (wseg_of s234B_16) (wseg_append (wseg_of s234B_17) (wseg_append (wseg_of s234B_18) (wseg_append (wseg_of s234B_19) (wseg_of s234B_20)))))))))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t235A : List Tok := t235A_0 ++ (t235A_1 ++ (t235A_2 ++ (t235A_3 ++ (t235A_4 ++ (t235A_5 ++ (t235A_6 ++ (t235A_7 ++ (t235A_8 ++ (t235A_9 ++ (t235A_10 ++ (t235A_11 ++ (t235A_12 ++ (t235A_13 ++ (t235A_14 ++ (t235A_15 ++ (t235A_16 ++ (t235A_17 ++ (t235A_18 ++ (t235A_19 ++ (t235A_20))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t235B : List Tok := t235B_0 ++ (t235B_1 ++ (t235B_2 ++ (t235B_3 ++ (t235B_4 ++ (t235B_5 ++ (t235B_6 ++ (t235B_7 ++ (t235B_8 ++ (t235B_9 ++ (t235B_10 ++ (t235B_11 ++ (t235B_12 ++ (t235B_13 ++ (t235B_14 ++ (t235B_15 ++ (t235B_16 ++ (t235B_17 ++ (t235B_18))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 235：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run235 : (nbRun P nb235 0 kN235 t235A).1 = true ∧ (nbRun P nb235 1 kN235 t235B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s235A_0) (wseg_append (wseg_of s235A_1) (wseg_append (wseg_of s235A_2) (wseg_append (wseg_of s235A_3) (wseg_append (wseg_of s235A_4) (wseg_append (wseg_of s235A_5) (wseg_append (wseg_of s235A_6) (wseg_append (wseg_of s235A_7) (wseg_append (wseg_of s235A_8) (wseg_append (wseg_of s235A_9) (wseg_append (wseg_of s235A_10) (wseg_append (wseg_of s235A_11) (wseg_append (wseg_of s235A_12) (wseg_append (wseg_of s235A_13) (wseg_append (wseg_of s235A_14) (wseg_append (wseg_of s235A_15) (wseg_append (wseg_of s235A_16) (wseg_append (wseg_of s235A_17) (wseg_append (wseg_of s235A_18) (wseg_append (wseg_of s235A_19) (wseg_of s235A_20))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s235B_0) (wseg_append (wseg_of s235B_1) (wseg_append (wseg_of s235B_2) (wseg_append (wseg_of s235B_3) (wseg_append (wseg_of s235B_4) (wseg_append (wseg_of s235B_5) (wseg_append (wseg_of s235B_6) (wseg_append (wseg_of s235B_7) (wseg_append (wseg_of s235B_8) (wseg_append (wseg_of s235B_9) (wseg_append (wseg_of s235B_10) (wseg_append (wseg_of s235B_11) (wseg_append (wseg_of s235B_12) (wseg_append (wseg_of s235B_13) (wseg_append (wseg_of s235B_14) (wseg_append (wseg_of s235B_15) (wseg_append (wseg_of s235B_16) (wseg_append (wseg_of s235B_17) (wseg_of s235B_18)))))))))))))))))))⟩

end PackLean.D40.Tet
