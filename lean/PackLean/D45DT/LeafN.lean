-- E3f 段 1（2026-11-17）：D45DT の遠方の葉を Nat の組で確かめる判定器（件ごとの部分、Mathlib なし）。
-- 共通部品は Kernel/NatLeaf.lean。farValN・discValN は D45DT.Core の farLbT・discLbT とちょうど同じ値
-- （Formal/DTLeafN.lean の farValN_eq・discValN_eq）。設計は plan/E3f_nat_leaf.md。
import PackLean.Kernel.NatLeaf
import PackLean.D45DT.Core

namespace PackLean.D45DT.LN
open PackLean.D28 (RBox nth FE vecGet)
open PackLean.D45DT (Prm NB)
open PackLean.Kernel.NatLeaf

/-- 木ごとの定数（e = 1, sx, sy の 1 つぶん）：u_i = 4L·p_i、w_f = L·(b_top − b_f)·p、cn = coN -/
structure CE where
  u0 : Z
  u1 : Z
  u2 : Z
  w0 : Z
  w1 : Z
  w3 : Z
  cn : Z

structure CtxN where
  e0 : CE
  e1 : CE
  e2 : CE
  sq : Sq

/-- 頂点の第 j 成分から C_0j, C_1j, C_2j（farLbT の coE）。b_0 = (−,−,−)、b_1 = (−,+,+)、b_3 = (+,+,−)。 -/
def col (E : CE) (b v0 v1 v3 : F) : C3 :=
  let a0 := F.smul E.w0 v0
  let a1 := F.smul E.w1 v1
  let a3 := F.smul E.w3 v3
  let t := a1.sub a0
  ⟨((F.smul E.u0 b).sub a0).sub (a1.sub a3),
   ((F.smul E.u1 b).add t).add a3,
   ((F.smul E.u2 b).add t).sub a3⟩

/-- farLbT と同じ値（d = den、箱は rb） -/
def farValN (K : CtxN) (d : Nat) (rb : RBox) (V0 Vf0 Vf1 Vf3 : V3) : Z :=
  let c1 := Z.ofInt ((rb.l0 + rb.h0) / 2)
  let c2 := Z.ofInt ((rb.l1 + rb.h1) / 2)
  let c3 := Z.ofInt ((rb.l2 + rb.h2) / 2)
  let w1 := Int.toNat ((rb.h0 - rb.l0) / 2)
  let w2 := Int.toNat ((rb.h1 - rb.l1) / 2)
  let w3 := Int.toNat ((rb.h2 - rb.l2) / 2)
  let part (E : CE) : G10 :=
    quadF (permS rb.ch (symOf (col E V0.x Vf0.x Vf1.x Vf3.x) (col E V0.y Vf0.y Vf1.y Vf3.y)
      (col E V0.z Vf0.z Vf1.z Vf3.z) (F.ofZ E.cn))) d c1 c2 c3 w1 w2 w3
  lbE K.sq (lbE K.sq (lbE0 K.sq ⟨0, 0⟩ (part K.e0)) (part K.e1)) (part K.e2)

/-- discLbT と同じ値。Kr = 回転（dk 倍）。C_ij = K_ji − dk·δ_ij -/
def discValN (q : Sq) (dk : Nat) (Kr : List (List FE)) (d : Nat) (rb : RBox) : Z :=
  let c1 := Z.ofInt ((rb.l0 + rb.h0) / 2)
  let c2 := Z.ofInt ((rb.l1 + rb.h1) / 2)
  let c3 := Z.ofInt ((rb.l2 + rb.h2) / 2)
  let w1 := Int.toNat ((rb.h0 - rb.l0) / 2)
  let w2 := Int.toNat ((rb.h1 - rb.l1) / 2)
  let w3 := Int.toNat ((rb.h2 - rb.l2) / 2)
  let k (j i : Nat) : F := F.ofFE (vecGet (nth Kr j []) i 2)
  let dkF : F := ⟨⟨dk, 0⟩, ⟨0, 0⟩⟩
  let X : C3 := ⟨(k 0 0).sub dkF, k 0 1, k 0 2⟩
  let Y : C3 := ⟨k 1 0, (k 1 1).sub dkF, k 1 2⟩
  let W : C3 := ⟨k 2 0, k 2 1, (k 2 2).sub dkF⟩
  lbE0 q ⟨0, 0⟩ (quadF (permS rb.ch (symOf X Y W ⟨⟨0, 0⟩, ⟨0, 0⟩⟩)) d c1 c2 c3 w1 w2 w3)

/-! ## 木ごとの定数（Int で 1 回だけ計算。区間の中では覚え書きが効く） -/

def ceOf (P : Prm) (sig : Nat) (nb : NB) (kap : List Int) (e : Nat) : CE :=
  let Xc := (nb.l0 + nb.h0) / 2; let Xw := (nb.h0 - nb.l0) / 2
  let Yc := (nb.l1 + nb.h1) / 2; let Yw := (nb.h1 - nb.l1) / 2
  let s : Int := if sig == 0 then 1 else -1
  let p0 := nth [Xc, Xw, 0] e 0
  let p1 := nth [s * Yc, 0, s * Yw] e 0
  let p2 := nth [P.nd, 0, 0] e 0
  let n1 := nth [Yc, 0, Yw] e 0
  let L : Int := (P.cden : Int) * P.kd
  let k0 := nth kap 0 0; let k1 := nth kap 1 0; let k2 := nth kap 2 0
  ⟨Z.ofInt (L * (4 * p0)), Z.ofInt (L * (4 * p1)), Z.ofInt (L * (4 * p2)),
   Z.ofInt (L * (2 * p0 + 2 * p2)), Z.ofInt (L * (2 * p0 - 2 * p1)), Z.ofInt (L * (-2 * p1 + 2 * p2)),
   Z.ofInt (-(4 * (P.dv : Int)) * ((P.kd : Int) * P.cnum * (p0 - p1 + p2)
     + (P.cden : Int) * (k0 * p0 + k1 * n1 + k2 * p2)))⟩

def ctxN (P : Prm) (sig : Nat) (nb : NB) (kap : List Int) : CtxN :=
  ⟨ceOf P sig nb kap 0, ceOf P sig nb kap 1, ceOf P sig nb kap 2, sqOf P.sqb⟩

def vtx (P : Prm) (l : Nat) : V3 :=
  let v := nth P.verts l []
  ⟨F.ofFE (vecGet v 0 2), F.ofFE (vecGet v 1 2), F.ofFE (vecGet v 2 2)⟩

end PackLean.D45DT.LN
