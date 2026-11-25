-- E3f（2026-11-17）：D45DT の遠方の木のたどり（E3h の rleafR・rcharR と同じ形で、葉の判定を引数にしたもの）と
-- 測定用の区間 segN・segO・segChk。葉の判定器は D45DT/LeafN.lean（共通部品は Kernel/NatLeaf.lean）に分けた（段 1）。
-- 設計は plan/E3f_nat_leaf.md。
import PackLean.E3h.Seg
import PackLean.D45DT.LeafN

namespace PackLean.E3f
open PackLean.D28 (RBox rboxWf split3 nth FE vecGet)
open PackLean.D45DT
open PackLean.D45DT.LN
open PackLean.Kernel.NatLeaf
open PackLean.E3h (redG redOk redBox rsInit)

/-! ## 木のたどり（E3h の rleafR・rcharR と同じ。葉の判定だけ引数にした） -/

def rleafG (P : Prm) (fa : Nat → RBox → Nat → Nat → Nat → Nat → Bool) (fd : Nat → RBox → Nat → Bool)
    (c : TreeCtx) (s : RS) (kind : Nat) (args : List Nat) : RS :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    let wf := rboxWf b
    if kind == 0 then { s with stack := rest, ok := s.ok && wf && c.allowL && rInCube P c.tube b, nL := s.nL + 1 }
    else
      let g := redG P.den b
      let rb := redBox g b
      let dn := Int.toNat (P.den / g)
      let wr := wf && redOk g P.den b && rboxWf rb
      if kind == 1 then
        let m := nth args 0 0
        { s with stack := rest, nD := s.nD + 1,
                 ok := s.ok && wr && decide (m < P.rots.length) && fd dn rb m }
      else
        let v0 := nth args 0 0; let f0 := nth args 1 0; let f1 := nth args 2 0; let f3 := nth args 3 0
        let nv := P.verts.length
        { s with stack := rest, nA := s.nA + 1,
                 ok := s.ok && wr && decide (v0 < nv) && decide (f0 < nv) && decide (f1 < nv) && decide (f3 < nv) &&
                   fa dn rb v0 f0 f1 f3 }

def rcharG (P : Prm) (fa : Nat → RBox → Nat → Nat → Nat → Nat → Bool) (fd : Nat → RBox → Nat → Bool)
    (c : TreeCtx) (s : RS) (ch : Char) : RS :=
  if s.pend > 0 then
    match dval ch with
    | none => { s with ok := false }
    | some v =>
      let acc := s.acc ++ [v]
      if s.pend == 1 then rleafG P fa fd c { s with pend := 0, acc := [] } s.kind acc
      else { s with pend := s.pend - 1, acc := acc }
  else if ch == '.' then
    match s.stack with
    | [] => { s with ok := false }
    | b :: rest =>
      let (c1, c2') := split3 b
      { s with stack := c1 :: c2' :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
  else if ch == 'L' then rleafG P fa fd c s 0 []
  else if ch == 'D' then { s with pend := 1, kind := 1, acc := [] }
  else if ch == 'A' then { s with pend := 4, kind := 2, acc := [] }
  else { s with ok := false }

def segG (P : Prm) (fa : Nat → RBox → Nat → Nat → Nat → Nat → Bool) (fd : Nat → RBox → Nat → Bool)
    (c : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  let s := toks.foldl (rcharG P fa fd c) (rsInit k0)
  s.ok && s.pend == 0 && decide (s.stack = k1)

/-- Nat の組の判定器の受理の葉（P2 は葉の定数、K = ctxN P2 c2.sig c2.nb c2.kap） -/
def leafAN (P2 : Prm) (K : CtxN) (dn : Nat) (rb : RBox) (v0 f0 f1 f3 : Nat) : Bool :=
  let r := farValN K dn rb (vtx P2 v0) (vtx P2 f0) (vtx P2 f1) (vtx P2 f3)
  Nat.ble r.n r.p

/-- Nat の組の判定器の捨てる葉 -/
def leafDN (P2 : Prm) (K : CtxN) (dn : Nat) (rb : RBox) (m : Nat) : Bool :=
  let r := discValN K.sq P2.dk (nth P2.rots m []) dn rb
  Nat.ble (Nat.succ r.n) r.p

/-- Nat の組の判定器での区間。E3h の segTR P P2 c c2 と同じ値（Formal/E3fSeg.lean の segN_eq） -/
def segN (P P2 : Prm) (K : CtxN) (c : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  segG P (leafAN P2 K) (leafDN P2 K) c k0 toks k1

/-- 元の判定器（farLbT・discLbT、var 2 の形）での区間。E3h の segTR と同じ。 -/
def segO (P P2 : Prm) (c c2 : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  segG P
    (fun dn rb v0 f0 f1 f3 =>
      decide (farLbT { P2 with den := (dn : Int) } c2.sig c2.nb c2.kap rb v0 [f0, f1, 0, f3] ≥ 0))
    (fun dn rb m => decide (discLbT { P2 with den := (dn : Int) } rb m > 0))
    c k0 toks k1

/-- 値がちょうど同じかの下見（#eval 用、証明ではない） -/
def segChk (P P2 : Prm) (K : CtxN) (c c2 : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  segG P
    (fun dn rb v0 f0 f1 f3 =>
      (farValN K dn rb (vtx P2 v0) (vtx P2 f0) (vtx P2 f1) (vtx P2 f3)).toInt
        == farLbT { P2 with den := (dn : Int) } c2.sig c2.nb c2.kap rb v0 [f0, f1, 0, f3])
    (fun dn rb m =>
      (discValN K.sq P2.dk (nth P2.rots m []) dn rb).toInt == discLbT { P2 with den := (dn : Int) } rb m)
    c k0 toks k1

end PackLean.E3f
