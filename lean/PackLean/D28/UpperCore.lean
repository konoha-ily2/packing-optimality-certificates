import PackLean.D28.Core

/-! D28 の上界（icointet_n02・cubintet_n02）の算術を Lean で検算する部品（2026-11-15、A9 段 7b-4）。

Python（`pp/global_opt/d28_step0.py` の「正確な代入」）と同じ配置を、体の元の整数で確かめる。
Mathlib は使わない（Bool の検査を `decide +kernel` で評価する）。意味づけは `Formal/TetUpper.lean`。

* 配置：駒 i（`P.verts`、分母 dv）を整数の行列 A_i で回し、t_i（分母 dt）だけずらす。
  置いた頂点 x = A_i v / dv + t_i / dt の分子 dt·(A_i v) + dv·t_i（分母 D = dv·dt）で比べる。
* 判定：A_i は 3×3 の整数で AᵀA = I・det A = 1、全頂点 × 容器の 4 行で b·x ≤ c*、
  平面 n·x = h（n は体の元、h は有理の体の元 QF）で駒 1 は下、駒 2 は上、n ≠ 0、c* > 0。
-/

namespace PackLean.D28

/-- 上界の配置のデータ。 -/
structure Upper where
  A1 : List (List Int)
  A2 : List (List Int)
  t1 : List FE        -- 分母 dt
  t2 : List FE
  dt : Nat
  n : List FE         -- 平面の法線（整数の体の元）
  h : QF              -- 平面の高さ

/-- 整数の行列を体の元のベクトルに掛ける。 -/
def imv (nb : Nat) (A : List (List Int)) (v : List FE) : List FE :=
  A.map (fun row => (List.zip row v).foldl (fun acc (x : Int × FE) => fadd acc (fsmul x.1 x.2)) (fzero nb))

/-- 整数のベクトルと体の元のベクトルの内積。 -/
def idot (nb : Nat) (b : List Int) (x : List FE) : FE :=
  (List.zip b x).foldl (fun acc (y : Int × FE) => fadd acc (fsmul y.1 y.2)) (fzero nb)

/-- 体の元のベクトルの内積。 -/
def fdot3 (ps : List Nat) (nb : Nat) (u v : List FE) : FE :=
  (List.zip u v).foldl (fun acc (x : FE × FE) => fadd acc (fmul ps x.1 x.2)) (fzero nb)

def igt (A : List (List Int)) (i j : Nat) : Int := nth (nth A i []) j 0

/-- 3×3 の整数の行列で、AᵀA = I・det A = 1。 -/
def rotIntOk (A : List (List Int)) : Bool :=
  A.length == 3 && A.all (fun r => r.length == 3) &&
  (List.range 9).all (fun t =>
    let i := t / 3; let j := t % 3
    igt A 0 i * igt A 0 j + igt A 1 i * igt A 1 j + igt A 2 i * igt A 2 j == (if i == j then 1 else 0)) &&
  igt A 0 0 * (igt A 1 1 * igt A 2 2 - igt A 1 2 * igt A 2 1)
    - igt A 0 1 * (igt A 1 0 * igt A 2 2 - igt A 1 2 * igt A 2 0)
    + igt A 0 2 * (igt A 1 0 * igt A 2 1 - igt A 1 1 * igt A 2 0) == 1

/-- 長さ（3 成分、各成分 2^|ps|）。 -/
def lenV3 (ps : List Nat) (v : List FE) : Bool := v.length == 3 && v.all (fun a => a.length == 2 ^ ps.length)

/-- 置いた頂点の分子：dt·(A v) + dv·t（分母 dv·dt）。 -/
def placeN (P : Prob) (U : Upper) (A : List (List Int)) (t : List FE) (v : List FE) : List FE :=
  List.zipWith (fun a b => fadd (fsmul U.dt a) (fsmul P.dv b)) (imv P.nb A v) t

/-- **上界の判定。** -/
def upperOk (P : Prob) (U : Upper) : Bool :=
  let ps := P.ps; let k := P.nb
  let D : Int := (P.dv : Int) * U.dt
  let inRows (A : List (List Int)) (t : List FE) : Bool :=
    P.verts.all (fun v => P.bvec.all (fun b =>
      decide (fsign ps (fsub (fsmul D P.c0.num) (fsmul P.c0.den (idot k b (placeN P U A t v)))) ≥ 0)))
  let below : Bool := P.verts.all (fun v =>
    decide (fsign ps (fsub (fsmul D U.h.num) (fsmul U.h.den (fdot3 ps k U.n (placeN P U U.A1 U.t1 v)))) ≥ 0))
  let above : Bool := P.verts.all (fun v =>
    decide (fsign ps (fsub (fsmul U.h.den (fdot3 ps k U.n (placeN P U U.A2 U.t2 v))) (fsmul D U.h.num)) ≥ 0))
  rotIntOk U.A1 && rotIntOk U.A2 && lenV3 ps U.t1 && lenV3 ps U.t2 && lenV3 ps U.n &&
  U.h.num.length == 2 ^ ps.length && decide (0 < U.dt) && decide (0 < U.h.den) &&
  U.n.any (fun a => decide (fsign ps a ≠ 0)) && P.bvec.all (fun b => b.length == 3) &&
  decide (fsign ps P.c0.num > 0) &&
  inRows U.A1 U.t1 && inRows U.A2 U.t2 && below && above

end PackLean.D28
