import PackLean.D31.Core
import PackLean.D28.UpperCore

/-! D31 の上界（octintet_n02、s* = 3）の算術を Lean で検算する部品（2026-11-16、A9 段 7d-4）。

配置は `pp/global_opt/d28_oct_step0.py` の「上界の代入」（`exact_part`）と同じ。単位辺の正八面体
（頂点 ±(√2/2)e_k）、容器 c* = 3√2/4、平行移動 t₁ = (√2/4)(−1, 1, −1)・t₂ = (√2/4)(1, 1, 1)、
平面 n_A·x = −√2/4（n_A = (1, −1, 1)）は、どれも β = √2/4 の整数倍。β で割ると整数だけになる：
頂点 ±2e_k（`octW`）、c = 3、t・h は整数。Mathlib は使わない（Bool の検査を `decide +kernel` で評価する）。
意味づけは `Formal/OctUpper.lean`。

* 判定：A_i は 3×3 の整数で AᵀA = I・det A = 1（`D28.rotIntOk`）、全頂点 × 容器の 4 行で
  b·(A w + t) ≤ c、平面 n·x = h で駒 1 は下・駒 2 は上、n ≠ 0、c > 0。
-/

namespace PackLean.D31

open PackLean.D28 (rotIntOk igt)

/-- 駒の頂点（単位の八面体を 1/β = 4/√2 倍：±2e_k、l = 2k + (0 が + | 1 が −)）。 -/
def octW : List (List Int) := [[2, 0, 0], [-2, 0, 0], [0, 2, 0], [0, -2, 0], [0, 0, 2], [0, 0, -2]]

/-- 上界の配置のデータ（長さは β = √2/4 を単位に）。 -/
structure Upper where
  A1 : List (List Int)
  A2 : List (List Int)
  t1 : List Int
  t2 : List Int
  n : List Int        -- 平面の法線
  h : Int             -- 平面の高さ
  c : Int             -- 容器の 4 行の右辺（s* = c）

/-- 整数の 3 成分の内積（足りない成分は 0）。 -/
def dot3 (u v : List Int) : Int := nth u 0 0 * nth v 0 0 + nth u 1 0 * nth v 1 0 + nth u 2 0 * nth v 2 0

/-- 置いた頂点 A w + t の成分。 -/
def plc (A : List (List Int)) (t w : List Int) (i : Nat) : Int :=
  igt A i 0 * nth w 0 0 + igt A i 1 * nth w 1 0 + igt A i 2 * nth w 2 0 + nth t i 0

/-- 置いた頂点 A w + t。 -/
def place (A : List (List Int)) (t w : List Int) : List Int := [plc A t w 0, plc A t w 1, plc A t w 2]

/-- **上界の判定。** -/
def upperOk (U : Upper) : Bool :=
  let inRows (A : List (List Int)) (t : List Int) : Bool :=
    octW.all (fun w => bvec.all (fun b => decide (dot3 b (place A t w) ≤ U.c)))
  let below : Bool := octW.all (fun w => decide (dot3 U.n (place U.A1 U.t1 w) ≤ U.h))
  let above : Bool := octW.all (fun w => decide (U.h ≤ dot3 U.n (place U.A2 U.t2 w)))
  rotIntOk U.A1 && rotIntOk U.A2 && decide (0 < U.c) &&
  (nth U.n 0 0 != 0 || nth U.n 1 0 != 0 || nth U.n 2 0 != 0) &&
  inRows U.A1 U.t1 && inRows U.A2 U.t2 && below && above

end PackLean.D31
