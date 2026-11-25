-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS057_0
import PackLean.D40.K.FarS057_1
import PackLean.D40.K.FarS057_2
import PackLean.D40.K.FarS057_3
import PackLean.D40.K.FarS057_4
import PackLean.D40.K.FarS057_5
import PackLean.D40.K.FarS057_6
import PackLean.D40.K.FarS057_7
import PackLean.D40.K.FarS057_8
import PackLean.D40.K.FarS057_9
import PackLean.D40.K.FarS057_10
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t200A : List Tok := t200A_0 ++ (t200A_1 ++ (t200A_2 ++ (t200A_3 ++ (t200A_4 ++ (t200A_5 ++ (t200A_6 ++ (t200A_7 ++ (t200A_8 ++ (t200A_9 ++ (t200A_10 ++ (t200A_11 ++ (t200A_12 ++ (t200A_13 ++ (t200A_14 ++ (t200A_15 ++ (t200A_16 ++ (t200A_17 ++ (t200A_18 ++ (t200A_19 ++ (t200A_20 ++ (t200A_21 ++ (t200A_22 ++ (t200A_23 ++ (t200A_24 ++ (t200A_25 ++ (t200A_26 ++ (t200A_27 ++ (t200A_28))))))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t200B : List Tok := t200B_0 ++ (t200B_1 ++ (t200B_2 ++ (t200B_3 ++ (t200B_4 ++ (t200B_5 ++ (t200B_6 ++ (t200B_7 ++ (t200B_8 ++ (t200B_9 ++ (t200B_10 ++ (t200B_11 ++ (t200B_12 ++ (t200B_13 ++ (t200B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 200：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run200 : (nbRun P nb200 0 kN200 t200A).1 = true ∧ (nbRun P nb200 1 kN200 t200B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s200A_0) (wseg_append (wseg_of s200A_1) (wseg_append (wseg_of s200A_2) (wseg_append (wseg_of s200A_3) (wseg_append (wseg_of s200A_4) (wseg_append (wseg_of s200A_5) (wseg_append (wseg_of s200A_6) (wseg_append (wseg_of s200A_7) (wseg_append (wseg_of s200A_8) (wseg_append (wseg_of s200A_9) (wseg_append (wseg_of s200A_10) (wseg_append (wseg_of s200A_11) (wseg_append (wseg_of s200A_12) (wseg_append (wseg_of s200A_13) (wseg_append (wseg_of s200A_14) (wseg_append (wseg_of s200A_15) (wseg_append (wseg_of s200A_16) (wseg_append (wseg_of s200A_17) (wseg_append (wseg_of s200A_18) (wseg_append (wseg_of s200A_19) (wseg_append (wseg_of s200A_20) (wseg_append (wseg_of s200A_21) (wseg_append (wseg_of s200A_22) (wseg_append (wseg_of s200A_23) (wseg_append (wseg_of s200A_24) (wseg_append (wseg_of s200A_25) (wseg_append (wseg_of s200A_26) (wseg_append (wseg_of s200A_27) (wseg_of s200A_28))))))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s200B_0) (wseg_append (wseg_of s200B_1) (wseg_append (wseg_of s200B_2) (wseg_append (wseg_of s200B_3) (wseg_append (wseg_of s200B_4) (wseg_append (wseg_of s200B_5) (wseg_append (wseg_of s200B_6) (wseg_append (wseg_of s200B_7) (wseg_append (wseg_of s200B_8) (wseg_append (wseg_of s200B_9) (wseg_append (wseg_of s200B_10) (wseg_append (wseg_of s200B_11) (wseg_append (wseg_of s200B_12) (wseg_append (wseg_of s200B_13) (wseg_of s200B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t201A : List Tok := t201A_0 ++ (t201A_1 ++ (t201A_2 ++ (t201A_3 ++ (t201A_4 ++ (t201A_5 ++ (t201A_6 ++ (t201A_7 ++ (t201A_8 ++ (t201A_9 ++ (t201A_10 ++ (t201A_11 ++ (t201A_12 ++ (t201A_13 ++ (t201A_14 ++ (t201A_15 ++ (t201A_16 ++ (t201A_17 ++ (t201A_18 ++ (t201A_19 ++ (t201A_20 ++ (t201A_21 ++ (t201A_22 ++ (t201A_23 ++ (t201A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t201B : List Tok := t201B_0 ++ (t201B_1 ++ (t201B_2 ++ (t201B_3 ++ (t201B_4 ++ (t201B_5 ++ (t201B_6 ++ (t201B_7 ++ (t201B_8 ++ (t201B_9 ++ (t201B_10 ++ (t201B_11 ++ (t201B_12 ++ (t201B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 201：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run201 : (nbRun P nb201 0 kN201 t201A).1 = true ∧ (nbRun P nb201 1 kN201 t201B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s201A_0) (wseg_append (wseg_of s201A_1) (wseg_append (wseg_of s201A_2) (wseg_append (wseg_of s201A_3) (wseg_append (wseg_of s201A_4) (wseg_append (wseg_of s201A_5) (wseg_append (wseg_of s201A_6) (wseg_append (wseg_of s201A_7) (wseg_append (wseg_of s201A_8) (wseg_append (wseg_of s201A_9) (wseg_append (wseg_of s201A_10) (wseg_append (wseg_of s201A_11) (wseg_append (wseg_of s201A_12) (wseg_append (wseg_of s201A_13) (wseg_append (wseg_of s201A_14) (wseg_append (wseg_of s201A_15) (wseg_append (wseg_of s201A_16) (wseg_append (wseg_of s201A_17) (wseg_append (wseg_of s201A_18) (wseg_append (wseg_of s201A_19) (wseg_append (wseg_of s201A_20) (wseg_append (wseg_of s201A_21) (wseg_append (wseg_of s201A_22) (wseg_append (wseg_of s201A_23) (wseg_of s201A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s201B_0) (wseg_append (wseg_of s201B_1) (wseg_append (wseg_of s201B_2) (wseg_append (wseg_of s201B_3) (wseg_append (wseg_of s201B_4) (wseg_append (wseg_of s201B_5) (wseg_append (wseg_of s201B_6) (wseg_append (wseg_of s201B_7) (wseg_append (wseg_of s201B_8) (wseg_append (wseg_of s201B_9) (wseg_append (wseg_of s201B_10) (wseg_append (wseg_of s201B_11) (wseg_append (wseg_of s201B_12) (wseg_of s201B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t202A : List Tok := t202A_0 ++ (t202A_1 ++ (t202A_2 ++ (t202A_3 ++ (t202A_4 ++ (t202A_5 ++ (t202A_6 ++ (t202A_7 ++ (t202A_8 ++ (t202A_9 ++ (t202A_10 ++ (t202A_11 ++ (t202A_12 ++ (t202A_13 ++ (t202A_14 ++ (t202A_15 ++ (t202A_16 ++ (t202A_17 ++ (t202A_18 ++ (t202A_19 ++ (t202A_20 ++ (t202A_21 ++ (t202A_22))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t202B : List Tok := t202B_0 ++ (t202B_1 ++ (t202B_2 ++ (t202B_3 ++ (t202B_4 ++ (t202B_5 ++ (t202B_6 ++ (t202B_7 ++ (t202B_8 ++ (t202B_9 ++ (t202B_10 ++ (t202B_11 ++ (t202B_12 ++ (t202B_13 ++ (t202B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 202：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run202 : (nbRun P nb202 0 kN202 t202A).1 = true ∧ (nbRun P nb202 1 kN202 t202B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s202A_0) (wseg_append (wseg_of s202A_1) (wseg_append (wseg_of s202A_2) (wseg_append (wseg_of s202A_3) (wseg_append (wseg_of s202A_4) (wseg_append (wseg_of s202A_5) (wseg_append (wseg_of s202A_6) (wseg_append (wseg_of s202A_7) (wseg_append (wseg_of s202A_8) (wseg_append (wseg_of s202A_9) (wseg_append (wseg_of s202A_10) (wseg_append (wseg_of s202A_11) (wseg_append (wseg_of s202A_12) (wseg_append (wseg_of s202A_13) (wseg_append (wseg_of s202A_14) (wseg_append (wseg_of s202A_15) (wseg_append (wseg_of s202A_16) (wseg_append (wseg_of s202A_17) (wseg_append (wseg_of s202A_18) (wseg_append (wseg_of s202A_19) (wseg_append (wseg_of s202A_20) (wseg_append (wseg_of s202A_21) (wseg_of s202A_22))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s202B_0) (wseg_append (wseg_of s202B_1) (wseg_append (wseg_of s202B_2) (wseg_append (wseg_of s202B_3) (wseg_append (wseg_of s202B_4) (wseg_append (wseg_of s202B_5) (wseg_append (wseg_of s202B_6) (wseg_append (wseg_of s202B_7) (wseg_append (wseg_of s202B_8) (wseg_append (wseg_of s202B_9) (wseg_append (wseg_of s202B_10) (wseg_append (wseg_of s202B_11) (wseg_append (wseg_of s202B_12) (wseg_append (wseg_of s202B_13) (wseg_of s202B_14)))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t203A : List Tok := t203A_0 ++ (t203A_1 ++ (t203A_2 ++ (t203A_3 ++ (t203A_4 ++ (t203A_5 ++ (t203A_6 ++ (t203A_7 ++ (t203A_8 ++ (t203A_9 ++ (t203A_10 ++ (t203A_11 ++ (t203A_12 ++ (t203A_13 ++ (t203A_14 ++ (t203A_15 ++ (t203A_16 ++ (t203A_17 ++ (t203A_18 ++ (t203A_19 ++ (t203A_20 ++ (t203A_21 ++ (t203A_22 ++ (t203A_23 ++ (t203A_24))))))))))))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t203B : List Tok := t203B_0 ++ (t203B_1 ++ (t203B_2 ++ (t203B_3 ++ (t203B_4 ++ (t203B_5 ++ (t203B_6 ++ (t203B_7 ++ (t203B_8 ++ (t203B_9 ++ (t203B_10 ++ (t203B_11 ++ (t203B_12 ++ (t203B_13 ++ (t203B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 203：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run203 : (nbRun P nb203 0 kN203 t203A).1 = true ∧ (nbRun P nb203 1 kN203 t203B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s203A_0) (wseg_append (wseg_of s203A_1) (wseg_append (wseg_of s203A_2) (wseg_append (wseg_of s203A_3) (wseg_append (wseg_of s203A_4) (wseg_append (wseg_of s203A_5) (wseg_append (wseg_of s203A_6) (wseg_append (wseg_of s203A_7) (wseg_append (wseg_of s203A_8) (wseg_append (wseg_of s203A_9) (wseg_append (wseg_of s203A_10) (wseg_append (wseg_of s203A_11) (wseg_append (wseg_of s203A_12) (wseg_append (wseg_of s203A_13) (wseg_append (wseg_of s203A_14) (wseg_append (wseg_of s203A_15) (wseg_append (wseg_of s203A_16) (wseg_append (wseg_of s203A_17) (wseg_append (wseg_of s203A_18) (wseg_append (wseg_of s203A_19) (wseg_append (wseg_of s203A_20) (wseg_append (wseg_of s203A_21) (wseg_append (wseg_of s203A_22) (wseg_append (wseg_of s203A_23) (wseg_of s203A_24))))))))))))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s203B_0) (wseg_append (wseg_of s203B_1) (wseg_append (wseg_of s203B_2) (wseg_append (wseg_of s203B_3) (wseg_append (wseg_of s203B_4) (wseg_append (wseg_of s203B_5) (wseg_append (wseg_of s203B_6) (wseg_append (wseg_of s203B_7) (wseg_append (wseg_of s203B_8) (wseg_append (wseg_of s203B_9) (wseg_append (wseg_of s203B_10) (wseg_append (wseg_of s203B_11) (wseg_append (wseg_of s203B_12) (wseg_append (wseg_of s203B_13) (wseg_of s203B_14)))))))))))))))⟩

end PackLean.D40.Tet
