-- E3h（2026-11-17）：D45DT（dodintet）の遠方をカーネルで区間に分けて測るための定義（下見、健全性なし）。
-- D45DT.Core の rchar・rleaf・farLbT・discLbT は変えない。区間の検査 `segT`（約分なし）と、
-- 葉の前に箱を約分する `segTR`（E3e の wstepR の形）。`P2` は葉の検査だけに渡す定数
-- （V1：P のまま、V2：nd・kd・sqb を奇数の尺度に取り替えたもの）。L の葉は元のまま。
import PackLean.D45DT.Data
import PackLean.D28.FarSeg

namespace PackLean.E3h
open PackLean.D28 (RBox rboxWf split3 nth)
open PackLean.D45DT

/-- boxRun と同じ木の文脈（side 0 = U の木、1 = L の木） -/
def ctxOf (P : Prm) (b : NB) (mode : Nat) (offU offL : Int) (side : Nat) : TreeCtx :=
  let fU : Nat := if mode == 2 then 0 else 1
  let fL : Nat := if mode == 1 then 0 else 1
  if side == 0 then
    ⟨0, b, treeKap P fU 0 offU, inside P (tubeOf P fU) [b.l0, b.h0] [b.l1, b.h1] && decide (offU ≤ 0), tubeOf P fU⟩
  else
    ⟨1, b, treeKap P fL 1 offL, inside P (tubeOf P fL) [b.l0, b.h0] [-b.h1, -b.l1] && decide (offL ≤ 0), tubeOf P fL⟩

def rsInit (k : List RBox) : RS := ⟨k, true, 0, 0, 0, 0, 0, []⟩

/-- 約分なしの区間：スタック k0 から並び toks を rchar で進め、引数待ちなしでスタック k1 に着く -/
def segT (P : Prm) (c : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  let s := toks.foldl (rchar P c) (rsInit k0)
  s.ok && s.pend == 0 && decide (s.stack = k1)

/-! ## 約分あり（E3e の KernelSegR と同じ形） -/

def redG (den : Int) (b : RBox) : Int :=
  let g := Nat.gcd den.natAbs (Nat.gcd b.l0.natAbs (Nat.gcd b.l1.natAbs (Nat.gcd b.l2.natAbs
    (Nat.gcd b.h0.natAbs (Nat.gcd b.h1.natAbs b.h2.natAbs)))))
  if g % 2 == 0 then ((g / 2 : Nat) : Int) else 1

def redOk (g den : Int) (b : RBox) : Bool :=
  decide (0 < g) && den % g == 0 && b.l0 % g == 0 && b.l1 % g == 0 && b.l2 % g == 0 &&
  b.h0 % g == 0 && b.h1 % g == 0 && b.h2 % g == 0

def redBox (g : Int) (b : RBox) : RBox := ⟨b.ch, b.l0 / g, b.l1 / g, b.l2 / g, b.h0 / g, b.h1 / g, b.h2 / g⟩

/-- rleaf と同じ。D・A の葉だけ、箱を g で割り、分母 P.den/g・定数 P2 で確かめる。c2 は葉の検査の文脈。 -/
def rleafR (P P2 : Prm) (c c2 : TreeCtx) (s : RS) (kind : Nat) (args : List Nat) : RS :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    let wf := rboxWf b
    if kind == 0 then { s with stack := rest, ok := s.ok && wf && c.allowL && rInCube P c.tube b, nL := s.nL + 1 }
    else
      let g := redG P.den b
      let rb := redBox g b
      let Q : Prm := { P2 with den := P.den / g }
      let wr := wf && redOk g P.den b && rboxWf rb
      if kind == 1 then
        let m := nth args 0 0
        { s with stack := rest, nD := s.nD + 1,
                 ok := s.ok && wr && decide (m < P.rots.length) && decide (discLbT Q rb m > 0) }
      else
        let v0 := nth args 0 0; let f0 := nth args 1 0; let f1 := nth args 2 0; let f3 := nth args 3 0
        let nv := P.verts.length
        { s with stack := rest, nA := s.nA + 1,
                 ok := s.ok && wr && decide (v0 < nv) && decide (f0 < nv) && decide (f1 < nv) && decide (f3 < nv) &&
                   decide (farLbT Q c2.sig c2.nb c2.kap rb v0 [f0, f1, 0, f3] ≥ 0) }

def rcharR (P P2 : Prm) (c c2 : TreeCtx) (s : RS) (ch : Char) : RS :=
  if s.pend > 0 then
    match dval ch with
    | none => { s with ok := false }
    | some v =>
      let acc := s.acc ++ [v]
      if s.pend == 1 then rleafR P P2 c c2 { s with pend := 0, acc := [] } s.kind acc
      else { s with pend := s.pend - 1, acc := acc }
  else if ch == '.' then
    match s.stack with
    | [] => { s with ok := false }
    | b :: rest =>
      let (c1, c2') := split3 b
      { s with stack := c1 :: c2' :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
  else if ch == 'L' then rleafR P P2 c c2 s 0 []
  else if ch == 'D' then { s with pend := 1, kind := 1, acc := [] }
  else if ch == 'A' then { s with pend := 4, kind := 2, acc := [] }
  else { s with ok := false }

def segTR (P P2 : Prm) (c c2 : TreeCtx) (k0 : List RBox) (toks : List Char) (k1 : List RBox) : Bool :=
  let s := toks.foldl (rcharR P P2 c c2) (rsInit k0)
  s.ok && s.pend == 0 && decide (s.stack = k1)

end PackLean.E3h
