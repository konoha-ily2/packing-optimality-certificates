-- E3f 段 1（2026-11-17）：Nat の組で整数を持つ葉の判定器の共通部品（Mathlib なし、試作 E3f/LeafN.lean から分けた）。
-- 設計は plan/E3f_nat_leaf.md。Z（p − n）・F（a + b√p）・S4（4×4 の対称行列）・quadF（qᵀ M q の 10 係数）・
-- √ の括弧での下界（loZ・hiZ・k0・k1・k2・lbE0・lbE）。どの件にも共通で、件ごとの係数（col など）は別ファイル。
-- 元の判定器（D28.Core の rotQ・combine・loHi・monoLb）と同じ値になることは Formal/NatLeafEq.lean。
import PackLean.D28.Core

namespace PackLean.Kernel.NatLeaf
open PackLean.D28 (FE nth)

/-- 整数 p − n -/
structure Z where
  p : Nat
  n : Nat
  deriving Inhabited

namespace Z
def add (a b : Z) : Z := ⟨Nat.add a.p b.p, Nat.add a.n b.n⟩
def sub (a b : Z) : Z := ⟨Nat.add a.p b.n, Nat.add a.n b.p⟩
def mul (a b : Z) : Z :=
  ⟨Nat.add (Nat.mul a.p b.p) (Nat.mul a.n b.n), Nat.add (Nat.mul a.p b.n) (Nat.mul a.n b.p)⟩
def mulN (c : Nat) (a : Z) : Z := ⟨Nat.mul c a.p, Nat.mul c a.n⟩
def norm (a : Z) : Z := cond (Nat.ble a.n a.p) ⟨Nat.sub a.p a.n, 0⟩ ⟨0, Nat.sub a.n a.p⟩
def abs (a : Z) : Nat := cond (Nat.ble a.n a.p) (Nat.sub a.p a.n) (Nat.sub a.n a.p)
def ofInt : Int → Z
  | Int.ofNat k => ⟨k, 0⟩
  | Int.negSucc k => ⟨0, Nat.succ k⟩
def toInt (a : Z) : Int := (a.p : Int) - (a.n : Int)
end Z

/-- 体 Q(√5) の元 a + b√5 -/
structure F where
  a : Z
  b : Z
  deriving Inhabited

namespace F
def add (x y : F) : F := ⟨x.a.add y.a, x.b.add y.b⟩
def sub (x y : F) : F := ⟨x.a.sub y.a, x.b.sub y.b⟩
def smul (c : Z) (x : F) : F := ⟨c.mul x.a, c.mul x.b⟩
def mulN (c : Nat) (x : F) : F := ⟨Z.mulN c x.a, Z.mulN c x.b⟩
def norm (x : F) : F := ⟨x.a.norm, x.b.norm⟩
def ofFE (l : FE) : F := ⟨Z.ofInt (nth l 0 0), Z.ofInt (nth l 1 0)⟩
def ofZ (c : Z) : F := ⟨c, ⟨0, 0⟩⟩
end F

structure Sq where
  a0 : Nat
  b0 : Nat
  a1 : Nat
  b1 : Nat

/-- 4×4 の対称行列（上三角 10 個）。qᵀ M q = Σ M_aa q_a² + 2 Σ_{a<b} M_ab q_a q_b -/
structure S4 where
  m00 : F
  m01 : F
  m02 : F
  m03 : F
  m11 : F
  m12 : F
  m13 : F
  m22 : F
  m23 : F
  m33 : F

structure C3 where
  c0 : F
  c1 : F
  c2 : F

structure V3 where
  x : F
  y : F
  z : F

/-- Σ C_ij R_ij(q) + cn·|q|² = qᵀ M q の M（q = (w, x, y, z)、rotQ と同じ R）。X・Y・W は j = 0, 1, 2 の列。 -/
def symOf (X Y W : C3) (cn : F) : S4 :=
  let c00 := X.c0
  let c11 := Y.c1
  let c22 := W.c2
  ⟨(((c00.add c11).add c22).add cn).norm,
   (Y.c2.sub W.c1).norm,
   (W.c0.sub X.c2).norm,
   (X.c1.sub Y.c0).norm,
   (((c00.add cn).sub c11).sub c22).norm,
   (Y.c0.add X.c1).norm,
   (W.c0.add X.c2).norm,
   (((c11.add cn).sub c00).sub c22).norm,
   (W.c1.add Y.c2).norm,
   (((c22.add cn).sub c00).sub c11).norm⟩

/-- 地図 ch の成分（= den）を先頭に並べ替える -/
def permS (ch : Nat) (M : S4) : S4 :=
  match ch with
  | 0 => M
  | 1 => ⟨M.m11, M.m01, M.m12, M.m13, M.m00, M.m02, M.m03, M.m22, M.m23, M.m33⟩
  | 2 => ⟨M.m22, M.m02, M.m12, M.m23, M.m00, M.m01, M.m03, M.m11, M.m13, M.m33⟩
  | _ => ⟨M.m33, M.m03, M.m13, M.m23, M.m00, M.m01, M.m02, M.m11, M.m12, M.m22⟩

/-- 2 次式の係数 [1, s1, s2, s3, s1², s1s2, s1s3, s2², s2s3, s3²] -/
structure G10 where
  g0 : F
  g1 : F
  g2 : F
  g3 : F
  g4 : F
  g5 : F
  g6 : F
  g7 : F
  g8 : F
  g9 : F

/-- q = (d, c1 + w1 s1, c2 + w2 s2, c3 + w3 s3) での qᵀ M q -/
def quadF (M : S4) (d : Nat) (c1 c2 c3 : Z) (w1 w2 w3 : Nat) : G10 :=
  let v0 := ((F.mulN d M.m00).add (F.smul c1 M.m01)).add ((F.smul c2 M.m02).add (F.smul c3 M.m03))
  let v1 := ((F.mulN d M.m01).add (F.smul c1 M.m11)).add ((F.smul c2 M.m12).add (F.smul c3 M.m13))
  let v2 := ((F.mulN d M.m02).add (F.smul c1 M.m12)).add ((F.smul c2 M.m22).add (F.smul c3 M.m23))
  let v3 := ((F.mulN d M.m03).add (F.smul c1 M.m13)).add ((F.smul c2 M.m23).add (F.smul c3 M.m33))
  ⟨((F.mulN d v0).add (F.smul c1 v1)).add ((F.smul c2 v2).add (F.smul c3 v3)),
   F.mulN (Nat.mul 2 w1) v1, F.mulN (Nat.mul 2 w2) v2, F.mulN (Nat.mul 2 w3) v3,
   F.mulN (Nat.mul w1 w1) M.m11, F.mulN (Nat.mul 2 (Nat.mul w1 w2)) M.m12, F.mulN (Nat.mul 2 (Nat.mul w1 w3)) M.m13,
   F.mulN (Nat.mul w2 w2) M.m22, F.mulN (Nat.mul 2 (Nat.mul w2 w3)) M.m23, F.mulN (Nat.mul w3 w3) M.m33⟩

/-! ## 下界（loHi・monoLb と同じ値） -/

def loZ (q : Sq) (x : F) : Z :=
  let a := x.a.norm
  let b := x.b.norm
  ⟨Nat.add (Nat.mul a.p q.a0) (Nat.mul b.p q.a1), Nat.add (Nat.mul a.n q.b0) (Nat.mul b.n q.b1)⟩

def hiZ (q : Sq) (x : F) : Z :=
  let a := x.a.norm
  let b := x.b.norm
  ⟨Nat.add (Nat.mul a.p q.b0) (Nat.mul b.p q.b1), Nat.add (Nat.mul a.n q.a0) (Nat.mul b.n q.a1)⟩

def natMax (x y : Nat) : Nat := cond (Nat.ble x y) y x

def k0 (q : Sq) (acc : Z) (x : F) : Z := acc.add (loZ q x)
def k1 (q : Sq) (acc : Z) (x : F) : Z :=
  let l := loZ q x
  cond (Nat.ble l.n l.p) acc ⟨acc.p, Nat.add acc.n (Nat.sub l.n l.p)⟩
def k2 (q : Sq) (acc : Z) (x : F) : Z :=
  ⟨acc.p, Nat.add acc.n (natMax (loZ q x).abs (hiZ q x).abs)⟩

/-- e = 0（定数・平方・その他） -/
def lbE0 (q : Sq) (acc : Z) (G : G10) : Z :=
  let a := k0 q acc G.g0
  let a := k2 q a G.g1
  let a := k2 q a G.g2
  let a := k2 q a G.g3
  let a := k1 q a G.g4
  let a := k2 q a G.g5
  let a := k2 q a G.g6
  let a := k1 q a G.g7
  let a := k2 q a G.g8
  k1 q a G.g9

/-- e = sx, sy（すべて「その他」） -/
def lbE (q : Sq) (acc : Z) (G : G10) : Z :=
  let a := k2 q acc G.g0
  let a := k2 q a G.g1
  let a := k2 q a G.g2
  let a := k2 q a G.g3
  let a := k2 q a G.g4
  let a := k2 q a G.g5
  let a := k2 q a G.g6
  let a := k2 q a G.g7
  let a := k2 q a G.g8
  k2 q a G.g9

def sqOf (sqb : List (Int × Int)) : Sq :=
  let x0 := nth sqb 0 (0, 0)
  let x1 := nth sqb 1 (0, 0)
  ⟨x0.1.toNat, x0.2.toNat, x1.1.toNat, x1.2.toNat⟩

/-- sqOf で読む括弧が 2 つで、どれも 0 以上（Int.toNat で落とさないため） -/
def sqOk (sqb : List (Int × Int)) : Bool :=
  match sqb with
  | [(a0, b0), (a1, b1)] => decide (0 ≤ a0) && decide (0 ≤ b0) && decide (0 ≤ a1) && decide (0 ≤ b1)
  | _ => false

/-! 誤りの版：括弧が負・数が違うと落ちる -/
example : sqOk [(-1, 2), (3, 4)] = false := by decide
example : sqOk [(1, 2), (3, -4)] = false := by decide
example : sqOk [(1, 2)] = false := by decide
example : sqOk [(1, 2), (3, 4), (5, 6)] = false := by decide
example : sqOk [(1, 2), (3, 4)] = true := by decide

end PackLean.Kernel.NatLeaf
