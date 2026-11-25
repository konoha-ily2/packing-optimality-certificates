-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarS051_0
import PackLean.D40.K.FarS051_1
import PackLean.D40.K.FarS051_2
import PackLean.D40.K.FarS051_3
import PackLean.D40.K.FarS051_4
import PackLean.D40.K.FarS051_5
import PackLean.D40.K.FarS051_6
import PackLean.D40.K.FarS051_7
import PackLean.D40.K.FarS051_8
import PackLean.D40.K.FarS051_9
import PackLean.D40.K.FarS051_10
import PackLean.D40.K.FarS051_11
import PackLean.Formal.TetintFarKD

namespace PackLean.D40.Tet
open PackLean.D40
open PackLean.Formal.TetintFarKD (nbRun_of wseg_of wseg_append)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t173A : List Tok := t173A_0 ++ (t173A_1 ++ (t173A_2 ++ (t173A_3 ++ (t173A_4 ++ (t173A_5 ++ (t173A_6 ++ (t173A_7 ++ (t173A_8 ++ (t173A_9 ++ (t173A_10 ++ (t173A_11 ++ (t173A_12 ++ (t173A_13 ++ (t173A_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t173B : List Tok := t173B_0 ++ (t173B_1 ++ (t173B_2 ++ (t173B_3 ++ (t173B_4 ++ (t173B_5 ++ (t173B_6 ++ (t173B_7 ++ (t173B_8 ++ (t173B_9 ++ (t173B_10 ++ (t173B_11 ++ (t173B_12 ++ (t173B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 173：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run173 : (nbRun P nb173 0 kN173 t173A).1 = true ∧ (nbRun P nb173 1 kN173 t173B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s173A_0) (wseg_append (wseg_of s173A_1) (wseg_append (wseg_of s173A_2) (wseg_append (wseg_of s173A_3) (wseg_append (wseg_of s173A_4) (wseg_append (wseg_of s173A_5) (wseg_append (wseg_of s173A_6) (wseg_append (wseg_of s173A_7) (wseg_append (wseg_of s173A_8) (wseg_append (wseg_of s173A_9) (wseg_append (wseg_of s173A_10) (wseg_append (wseg_of s173A_11) (wseg_append (wseg_of s173A_12) (wseg_append (wseg_of s173A_13) (wseg_of s173A_14))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s173B_0) (wseg_append (wseg_of s173B_1) (wseg_append (wseg_of s173B_2) (wseg_append (wseg_of s173B_3) (wseg_append (wseg_of s173B_4) (wseg_append (wseg_of s173B_5) (wseg_append (wseg_of s173B_6) (wseg_append (wseg_of s173B_7) (wseg_append (wseg_of s173B_8) (wseg_append (wseg_of s173B_9) (wseg_append (wseg_of s173B_10) (wseg_append (wseg_of s173B_11) (wseg_append (wseg_of s173B_12) (wseg_of s173B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t174A : List Tok := t174A_0 ++ (t174A_1 ++ (t174A_2 ++ (t174A_3 ++ (t174A_4 ++ (t174A_5 ++ (t174A_6 ++ (t174A_7 ++ (t174A_8 ++ (t174A_9 ++ (t174A_10 ++ (t174A_11 ++ (t174A_12 ++ (t174A_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t174B : List Tok := t174B_0 ++ (t174B_1 ++ (t174B_2 ++ (t174B_3 ++ (t174B_4 ++ (t174B_5 ++ (t174B_6 ++ (t174B_7 ++ (t174B_8 ++ (t174B_9 ++ (t174B_10 ++ (t174B_11 ++ (t174B_12 ++ (t174B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 174：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run174 : (nbRun P nb174 0 kN174 t174A).1 = true ∧ (nbRun P nb174 1 kN174 t174B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s174A_0) (wseg_append (wseg_of s174A_1) (wseg_append (wseg_of s174A_2) (wseg_append (wseg_of s174A_3) (wseg_append (wseg_of s174A_4) (wseg_append (wseg_of s174A_5) (wseg_append (wseg_of s174A_6) (wseg_append (wseg_of s174A_7) (wseg_append (wseg_of s174A_8) (wseg_append (wseg_of s174A_9) (wseg_append (wseg_of s174A_10) (wseg_append (wseg_of s174A_11) (wseg_append (wseg_of s174A_12) (wseg_of s174A_13)))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s174B_0) (wseg_append (wseg_of s174B_1) (wseg_append (wseg_of s174B_2) (wseg_append (wseg_of s174B_3) (wseg_append (wseg_of s174B_4) (wseg_append (wseg_of s174B_5) (wseg_append (wseg_of s174B_6) (wseg_append (wseg_of s174B_7) (wseg_append (wseg_of s174B_8) (wseg_append (wseg_of s174B_9) (wseg_append (wseg_of s174B_10) (wseg_append (wseg_of s174B_11) (wseg_append (wseg_of s174B_12) (wseg_of s174B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t175A : List Tok := t175A_0 ++ (t175A_1 ++ (t175A_2 ++ (t175A_3 ++ (t175A_4 ++ (t175A_5 ++ (t175A_6 ++ (t175A_7 ++ (t175A_8 ++ (t175A_9 ++ (t175A_10 ++ (t175A_11 ++ (t175A_12 ++ (t175A_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t175B : List Tok := t175B_0 ++ (t175B_1 ++ (t175B_2 ++ (t175B_3 ++ (t175B_4 ++ (t175B_5 ++ (t175B_6 ++ (t175B_7 ++ (t175B_8 ++ (t175B_9 ++ (t175B_10 ++ (t175B_11 ++ (t175B_12 ++ (t175B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 175：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run175 : (nbRun P nb175 0 kN175 t175A).1 = true ∧ (nbRun P nb175 1 kN175 t175B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s175A_0) (wseg_append (wseg_of s175A_1) (wseg_append (wseg_of s175A_2) (wseg_append (wseg_of s175A_3) (wseg_append (wseg_of s175A_4) (wseg_append (wseg_of s175A_5) (wseg_append (wseg_of s175A_6) (wseg_append (wseg_of s175A_7) (wseg_append (wseg_of s175A_8) (wseg_append (wseg_of s175A_9) (wseg_append (wseg_of s175A_10) (wseg_append (wseg_of s175A_11) (wseg_append (wseg_of s175A_12) (wseg_of s175A_13)))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s175B_0) (wseg_append (wseg_of s175B_1) (wseg_append (wseg_of s175B_2) (wseg_append (wseg_of s175B_3) (wseg_append (wseg_of s175B_4) (wseg_append (wseg_of s175B_5) (wseg_append (wseg_of s175B_6) (wseg_append (wseg_of s175B_7) (wseg_append (wseg_of s175B_8) (wseg_append (wseg_of s175B_9) (wseg_append (wseg_of s175B_10) (wseg_append (wseg_of s175B_11) (wseg_append (wseg_of s175B_12) (wseg_of s175B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t176A : List Tok := t176A_0 ++ (t176A_1 ++ (t176A_2 ++ (t176A_3 ++ (t176A_4 ++ (t176A_5 ++ (t176A_6 ++ (t176A_7 ++ (t176A_8 ++ (t176A_9 ++ (t176A_10 ++ (t176A_11 ++ (t176A_12 ++ (t176A_13 ++ (t176A_14 ++ (t176A_15)))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t176B : List Tok := t176B_0 ++ (t176B_1 ++ (t176B_2 ++ (t176B_3 ++ (t176B_4 ++ (t176B_5 ++ (t176B_6 ++ (t176B_7 ++ (t176B_8 ++ (t176B_9 ++ (t176B_10 ++ (t176B_11 ++ (t176B_12 ++ (t176B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 176：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run176 : (nbRun P nb176 0 kN176 t176A).1 = true ∧ (nbRun P nb176 1 kN176 t176B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s176A_0) (wseg_append (wseg_of s176A_1) (wseg_append (wseg_of s176A_2) (wseg_append (wseg_of s176A_3) (wseg_append (wseg_of s176A_4) (wseg_append (wseg_of s176A_5) (wseg_append (wseg_of s176A_6) (wseg_append (wseg_of s176A_7) (wseg_append (wseg_of s176A_8) (wseg_append (wseg_of s176A_9) (wseg_append (wseg_of s176A_10) (wseg_append (wseg_of s176A_11) (wseg_append (wseg_of s176A_12) (wseg_append (wseg_of s176A_13) (wseg_append (wseg_of s176A_14) (wseg_of s176A_15)))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s176B_0) (wseg_append (wseg_of s176B_1) (wseg_append (wseg_of s176B_2) (wseg_append (wseg_of s176B_3) (wseg_append (wseg_of s176B_4) (wseg_append (wseg_of s176B_5) (wseg_append (wseg_of s176B_6) (wseg_append (wseg_of s176B_7) (wseg_append (wseg_of s176B_8) (wseg_append (wseg_of s176B_9) (wseg_append (wseg_of s176B_10) (wseg_append (wseg_of s176B_11) (wseg_append (wseg_of s176B_12) (wseg_of s176B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t177A : List Tok := t177A_0 ++ (t177A_1 ++ (t177A_2 ++ (t177A_3 ++ (t177A_4 ++ (t177A_5 ++ (t177A_6 ++ (t177A_7 ++ (t177A_8 ++ (t177A_9 ++ (t177A_10 ++ (t177A_11 ++ (t177A_12 ++ (t177A_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t177B : List Tok := t177B_0 ++ (t177B_1 ++ (t177B_2 ++ (t177B_3 ++ (t177B_4 ++ (t177B_5 ++ (t177B_6 ++ (t177B_7 ++ (t177B_8 ++ (t177B_9 ++ (t177B_10 ++ (t177B_11 ++ (t177B_12 ++ (t177B_13)))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 177：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run177 : (nbRun P nb177 0 kN177 t177A).1 = true ∧ (nbRun P nb177 1 kN177 t177B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s177A_0) (wseg_append (wseg_of s177A_1) (wseg_append (wseg_of s177A_2) (wseg_append (wseg_of s177A_3) (wseg_append (wseg_of s177A_4) (wseg_append (wseg_of s177A_5) (wseg_append (wseg_of s177A_6) (wseg_append (wseg_of s177A_7) (wseg_append (wseg_of s177A_8) (wseg_append (wseg_of s177A_9) (wseg_append (wseg_of s177A_10) (wseg_append (wseg_of s177A_11) (wseg_append (wseg_of s177A_12) (wseg_of s177A_13)))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s177B_0) (wseg_append (wseg_of s177B_1) (wseg_append (wseg_of s177B_2) (wseg_append (wseg_of s177B_3) (wseg_append (wseg_of s177B_4) (wseg_append (wseg_of s177B_5) (wseg_append (wseg_of s177B_6) (wseg_append (wseg_of s177B_7) (wseg_append (wseg_of s177B_8) (wseg_append (wseg_of s177B_9) (wseg_append (wseg_of s177B_10) (wseg_append (wseg_of s177B_11) (wseg_append (wseg_of s177B_12) (wseg_of s177B_13))))))))))))))⟩

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t178A : List Tok := t178A_0 ++ (t178A_1 ++ (t178A_2 ++ (t178A_3 ++ (t178A_4 ++ (t178A_5 ++ (t178A_6 ++ (t178A_7 ++ (t178A_8 ++ (t178A_9 ++ (t178A_10 ++ (t178A_11 ++ (t178A_12 ++ (t178A_13 ++ (t178A_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t178B : List Tok := t178B_0 ++ (t178B_1 ++ (t178B_2 ++ (t178B_3 ++ (t178B_4 ++ (t178B_5 ++ (t178B_6 ++ (t178B_7 ++ (t178B_8 ++ (t178B_9 ++ (t178B_10 ++ (t178B_11 ++ (t178B_12 ++ (t178B_13 ++ (t178B_14))))))))))))))

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- 遠方の n の箱 178：片側 A・B の R の木がカーネルだけで通る。 -/
theorem run178 : (nbRun P nb178 0 kN178 t178A).1 = true ∧ (nbRun P nb178 1 kN178 t178B).1 = true :=
  ⟨nbRun_of (by decide +kernel) (wseg_append (wseg_of s178A_0) (wseg_append (wseg_of s178A_1) (wseg_append (wseg_of s178A_2) (wseg_append (wseg_of s178A_3) (wseg_append (wseg_of s178A_4) (wseg_append (wseg_of s178A_5) (wseg_append (wseg_of s178A_6) (wseg_append (wseg_of s178A_7) (wseg_append (wseg_of s178A_8) (wseg_append (wseg_of s178A_9) (wseg_append (wseg_of s178A_10) (wseg_append (wseg_of s178A_11) (wseg_append (wseg_of s178A_12) (wseg_append (wseg_of s178A_13) (wseg_of s178A_14))))))))))))))),
   nbRun_of (by decide +kernel) (wseg_append (wseg_of s178B_0) (wseg_append (wseg_of s178B_1) (wseg_append (wseg_of s178B_2) (wseg_append (wseg_of s178B_3) (wseg_append (wseg_of s178B_4) (wseg_append (wseg_of s178B_5) (wseg_append (wseg_of s178B_6) (wseg_append (wseg_of s178B_7) (wseg_append (wseg_of s178B_8) (wseg_append (wseg_of s178B_9) (wseg_append (wseg_of s178B_10) (wseg_append (wseg_of s178B_11) (wseg_append (wseg_of s178B_12) (wseg_append (wseg_of s178B_13) (wseg_of s178B_14)))))))))))))))⟩

end PackLean.D40.Tet
