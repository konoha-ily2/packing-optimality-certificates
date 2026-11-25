-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS018_0
import PackLean.D40.K.FarS018_1
import PackLean.D40.K.FarS018_2
import PackLean.D40.K.FarS018_3
import PackLean.D40.K.FarS018_4
import PackLean.D40.K.FarS018_5
import PackLean.D40.K.FarS018_6
import PackLean.D40.K.FarS018_7
import PackLean.D40.K.FarS018_8
import PackLean.D40.K.FarS018_9
import PackLean.D40.K.FarS018_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t054A : List Tok := t054A_0 ++ (t054A_1 ++ (t054A_2 ++ (t054A_3 ++ (t054A_4 ++ (t054A_5 ++ (t054A_6 ++ (t054A_7 ++ (t054A_8 ++ (t054A_9 ++ (t054A_10 ++ (t054A_11 ++ (t054A_12 ++ (t054A_13 ++ (t054A_14 ++ (t054A_15 ++ (t054A_16 ++ (t054A_17 ++ (t054A_18 ++ (t054A_19 ++ (t054A_20 ++ (t054A_21 ++ (t054A_22 ++ (t054A_23 ++ (t054A_24 ++ (t054A_25 ++ (t054A_26 ++ (t054A_27)))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t054B : List Tok := t054B_0 ++ (t054B_1 ++ (t054B_2 ++ (t054B_3 ++ (t054B_4 ++ (t054B_5 ++ (t054B_6 ++ (t054B_7 ++ (t054B_8 ++ (t054B_9 ++ (t054B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 054：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run054 : (nbRun P nb054 0 kN054 t054A).1 = true ∧ (nbRun P nb054 1 kN054 t054B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s054A_0) (wseg_append (wseg_of s054A_1) (wseg_append (wseg_of s054A_2) (wseg_append (wseg_of s054A_3) (wseg_append (wseg_of s054A_4) (wseg_append (wseg_of s054A_5) (wseg_append (wseg_of s054A_6) (wseg_append (wseg_of s054A_7) (wseg_append (wseg_of s054A_8) (wseg_append (wseg_of s054A_9) (wseg_append (wseg_of s054A_10) (wseg_append (wseg_of s054A_11) (wseg_append (wseg_of s054A_12) (wseg_append (wseg_of s054A_13) (wseg_append (wseg_of s054A_14) (wseg_append (wseg_of s054A_15) (wseg_append (wseg_of s054A_16) (wseg_append (wseg_of s054A_17) (wseg_append (wseg_of s054A_18) (wseg_append (wseg_of s054A_19) (wseg_append (wseg_of s054A_20) (wseg_append (wseg_of s054A_21) (wseg_append (wseg_of s054A_22) (wseg_append (wseg_of s054A_23) (wseg_append (wseg_of s054A_24) (wseg_append (wseg_of s054A_25) (wseg_append (wseg_of s054A_26) (wseg_of s054A_27)))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s054B_0) (wseg_append (wseg_of s054B_1) (wseg_append (wseg_of s054B_2) (wseg_append (wseg_of s054B_3) (wseg_append (wseg_of s054B_4) (wseg_append (wseg_of s054B_5) (wseg_append (wseg_of s054B_6) (wseg_append (wseg_of s054B_7) (wseg_append (wseg_of s054B_8) (wseg_append (wseg_of s054B_9) (wseg_of s054B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t055A : List Tok := t055A_0 ++ (t055A_1 ++ (t055A_2 ++ (t055A_3 ++ (t055A_4 ++ (t055A_5 ++ (t055A_6 ++ (t055A_7 ++ (t055A_8 ++ (t055A_9 ++ (t055A_10 ++ (t055A_11 ++ (t055A_12 ++ (t055A_13 ++ (t055A_14 ++ (t055A_15 ++ (t055A_16 ++ (t055A_17 ++ (t055A_18 ++ (t055A_19 ++ (t055A_20 ++ (t055A_21 ++ (t055A_22 ++ (t055A_23 ++ (t055A_24 ++ (t055A_25 ++ (t055A_26 ++ (t055A_27 ++ (t055A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t055B : List Tok := t055B_0 ++ (t055B_1 ++ (t055B_2 ++ (t055B_3 ++ (t055B_4 ++ (t055B_5 ++ (t055B_6 ++ (t055B_7 ++ (t055B_8 ++ (t055B_9 ++ (t055B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 055：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run055 : (nbRun P nb055 0 kN055 t055A).1 = true ∧ (nbRun P nb055 1 kN055 t055B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s055A_0) (wseg_append (wseg_of s055A_1) (wseg_append (wseg_of s055A_2) (wseg_append (wseg_of s055A_3) (wseg_append (wseg_of s055A_4) (wseg_append (wseg_of s055A_5) (wseg_append (wseg_of s055A_6) (wseg_append (wseg_of s055A_7) (wseg_append (wseg_of s055A_8) (wseg_append (wseg_of s055A_9) (wseg_append (wseg_of s055A_10) (wseg_append (wseg_of s055A_11) (wseg_append (wseg_of s055A_12) (wseg_append (wseg_of s055A_13) (wseg_append (wseg_of s055A_14) (wseg_append (wseg_of s055A_15) (wseg_append (wseg_of s055A_16) (wseg_append (wseg_of s055A_17) (wseg_append (wseg_of s055A_18) (wseg_append (wseg_of s055A_19) (wseg_append (wseg_of s055A_20) (wseg_append (wseg_of s055A_21) (wseg_append (wseg_of s055A_22) (wseg_append (wseg_of s055A_23) (wseg_append (wseg_of s055A_24) (wseg_append (wseg_of s055A_25) (wseg_append (wseg_of s055A_26) (wseg_append (wseg_of s055A_27) (wseg_of s055A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s055B_0) (wseg_append (wseg_of s055B_1) (wseg_append (wseg_of s055B_2) (wseg_append (wseg_of s055B_3) (wseg_append (wseg_of s055B_4) (wseg_append (wseg_of s055B_5) (wseg_append (wseg_of s055B_6) (wseg_append (wseg_of s055B_7) (wseg_append (wseg_of s055B_8) (wseg_append (wseg_of s055B_9) (wseg_of s055B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t056A : List Tok := t056A_0 ++ (t056A_1 ++ (t056A_2 ++ (t056A_3 ++ (t056A_4 ++ (t056A_5 ++ (t056A_6 ++ (t056A_7 ++ (t056A_8 ++ (t056A_9 ++ (t056A_10 ++ (t056A_11 ++ (t056A_12 ++ (t056A_13 ++ (t056A_14 ++ (t056A_15 ++ (t056A_16 ++ (t056A_17 ++ (t056A_18 ++ (t056A_19 ++ (t056A_20 ++ (t056A_21 ++ (t056A_22 ++ (t056A_23 ++ (t056A_24 ++ (t056A_25)))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t056B : List Tok := t056B_0 ++ (t056B_1 ++ (t056B_2 ++ (t056B_3 ++ (t056B_4 ++ (t056B_5 ++ (t056B_6 ++ (t056B_7 ++ (t056B_8 ++ (t056B_9 ++ (t056B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 056：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run056 : (nbRun P nb056 0 kN056 t056A).1 = true ∧ (nbRun P nb056 1 kN056 t056B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s056A_0) (wseg_append (wseg_of s056A_1) (wseg_append (wseg_of s056A_2) (wseg_append (wseg_of s056A_3) (wseg_append (wseg_of s056A_4) (wseg_append (wseg_of s056A_5) (wseg_append (wseg_of s056A_6) (wseg_append (wseg_of s056A_7) (wseg_append (wseg_of s056A_8) (wseg_append (wseg_of s056A_9) (wseg_append (wseg_of s056A_10) (wseg_append (wseg_of s056A_11) (wseg_append (wseg_of s056A_12) (wseg_append (wseg_of s056A_13) (wseg_append (wseg_of s056A_14) (wseg_append (wseg_of s056A_15) (wseg_append (wseg_of s056A_16) (wseg_append (wseg_of s056A_17) (wseg_append (wseg_of s056A_18) (wseg_append (wseg_of s056A_19) (wseg_append (wseg_of s056A_20) (wseg_append (wseg_of s056A_21) (wseg_append (wseg_of s056A_22) (wseg_append (wseg_of s056A_23) (wseg_append (wseg_of s056A_24) (wseg_of s056A_25)))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s056B_0) (wseg_append (wseg_of s056B_1) (wseg_append (wseg_of s056B_2) (wseg_append (wseg_of s056B_3) (wseg_append (wseg_of s056B_4) (wseg_append (wseg_of s056B_5) (wseg_append (wseg_of s056B_6) (wseg_append (wseg_of s056B_7) (wseg_append (wseg_of s056B_8) (wseg_append (wseg_of s056B_9) (wseg_of s056B_10)))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t057A : List Tok := t057A_0 ++ (t057A_1 ++ (t057A_2 ++ (t057A_3 ++ (t057A_4 ++ (t057A_5 ++ (t057A_6 ++ (t057A_7 ++ (t057A_8 ++ (t057A_9 ++ (t057A_10 ++ (t057A_11 ++ (t057A_12 ++ (t057A_13 ++ (t057A_14 ++ (t057A_15 ++ (t057A_16 ++ (t057A_17 ++ (t057A_18 ++ (t057A_19 ++ (t057A_20 ++ (t057A_21 ++ (t057A_22 ++ (t057A_23 ++ (t057A_24 ++ (t057A_25 ++ (t057A_26 ++ (t057A_27 ++ (t057A_28 ++ (t057A_29 ++ (t057A_30 ++ (t057A_31 ++ (t057A_32 ++ (t057A_33)))))))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t057B : List Tok := t057B_0 ++ (t057B_1 ++ (t057B_2 ++ (t057B_3 ++ (t057B_4 ++ (t057B_5 ++ (t057B_6 ++ (t057B_7 ++ (t057B_8 ++ (t057B_9 ++ (t057B_10))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 057：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run057 : (nbRun P nb057 0 kN057 t057A).1 = true ∧ (nbRun P nb057 1 kN057 t057B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s057A_0) (wseg_append (wseg_of s057A_1) (wseg_append (wseg_of s057A_2) (wseg_append (wseg_of s057A_3) (wseg_append (wseg_of s057A_4) (wseg_append (wseg_of s057A_5) (wseg_append (wseg_of s057A_6) (wseg_append (wseg_of s057A_7) (wseg_append (wseg_of s057A_8) (wseg_append (wseg_of s057A_9) (wseg_append (wseg_of s057A_10) (wseg_append (wseg_of s057A_11) (wseg_append (wseg_of s057A_12) (wseg_append (wseg_of s057A_13) (wseg_append (wseg_of s057A_14) (wseg_append (wseg_of s057A_15) (wseg_append (wseg_of s057A_16) (wseg_append (wseg_of s057A_17) (wseg_append (wseg_of s057A_18) (wseg_append (wseg_of s057A_19) (wseg_append (wseg_of s057A_20) (wseg_append (wseg_of s057A_21) (wseg_append (wseg_of s057A_22) (wseg_append (wseg_of s057A_23) (wseg_append (wseg_of s057A_24) (wseg_append (wseg_of s057A_25) (wseg_append (wseg_of s057A_26) (wseg_append (wseg_of s057A_27) (wseg_append (wseg_of s057A_28) (wseg_append (wseg_of s057A_29) (wseg_append (wseg_of s057A_30) (wseg_append (wseg_of s057A_31) (wseg_append (wseg_of s057A_32) (wseg_of s057A_33)))))))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s057B_0) (wseg_append (wseg_of s057B_1) (wseg_append (wseg_of s057B_2) (wseg_append (wseg_of s057B_3) (wseg_append (wseg_of s057B_4) (wseg_append (wseg_of s057B_5) (wseg_append (wseg_of s057B_6) (wseg_append (wseg_of s057B_7) (wseg_append (wseg_of s057B_8) (wseg_append (wseg_of s057B_9) (wseg_of s057B_10)))))))))))⟩

end PackLean.D40.Tet
