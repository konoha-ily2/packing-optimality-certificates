-- E3e（2026-11-16）：E3d 案 1 の遠方の 1 歩 wstepR と、それを区間に分けてつなぐ補題（手で書いたもの）。
-- 葉（D・A）を確かめる前に、箱の 6 つの座標と rden を共通の約数 g で割り、S̄ を分母が奇数の sb（≥ S̄）に取り替える。
-- カーネルの覚え書きは数のハッシュに下位 64 ビットしか使わないので、2^64 の倍数ばかりの計算は衝突して 2 乗で伸びる
-- （plan/E3d_kernel_speedup.md 1.3 節）。検査関数（D16.Core の leafOk・acceptOk・discLb）は変えず、呼ぶ前に P を取り替えるだけ。
-- 割る・L の葉は wstep と同じなので、区間の境の状態は wstep のもの（K/FarS）をそのまま使える。
-- 健全性は PackLean.Formal.SandwichR（約分しても同じ回転の集合、S̄ を上げた主張は強い）。
import PackLean.D16.KernelSegW

namespace PackLean.D16.KSegR
open PackLean.D28 (RBox rboxWf split3)
open PackLean.D16 PackLean.D16.KSegW

/-- 箱の 6 つの座標と分母の最大公約数の半分（幅を偶数に保つ）。割り切れるかは redOk で確かめる。 -/
def redG (den : Int) (b : RBox) : Int :=
  let g := Nat.gcd den.natAbs (Nat.gcd b.l0.natAbs (Nat.gcd b.l1.natAbs (Nat.gcd b.l2.natAbs
    (Nat.gcd b.h0.natAbs (Nat.gcd b.h1.natAbs b.h2.natAbs)))))
  if g % 2 == 0 then ((g / 2 : Nat) : Int) else 1

/-- g が正で、分母と座標をすべて割り切る（健全性の証明で gcd の性質を使わずに済むよう、検査する）。 -/
def redOk (g den : Int) (b : RBox) : Bool :=
  decide (0 < g) && den % g == 0 && b.l0 % g == 0 && b.l1 % g == 0 && b.l2 % g == 0 &&
  b.h0 % g == 0 && b.h1 % g == 0 && b.h2 % g == 0

def redBox (g : Int) (b : RBox) : RBox := ⟨b.ch, b.l0 / g, b.l1 / g, b.l2 / g, b.h0 / g, b.h1 / g, b.h2 / g⟩

/-- 葉の検査に使う P：分母を rden/g に、S̄ を sb に。 -/
def redP (P : Prob) (sb : Int × Nat) (g : Int) : Prob := { P with rden := P.rden / g, sbar := sb }

/-- 約分し、S̄ を sb にしてから葉を確かめる（約分した箱も幅が偶数であることを確かめる。box_param に要る）。 -/
def leafOkR (P : Prob) (sb : Int × Nat) (b : RBox) (t : Tok) : Bool :=
  let g := redG P.rden b
  redOk g P.rden b && rboxWf (redBox g b) && leafOk (redP P sb g) (redBox g b) t

/-- wstep と同じ。D・A の葉の検査だけ leafOkR。L の葉は元のまま。 -/
def wstepR (P : Prob) (sb : Int × Nat) (s : WState) (t : Tok) : WState :=
  match s.stack with
  | [] => { s with ok := false }
  | b :: rest =>
    match t with
    | .split =>
      let (c1, c2) := split3 b
      { s with stack := c1 :: c2 :: rest,
               ok := s.ok && rboxWf b && decide (b.h0 - b.l0 > 2 ∨ b.h1 - b.l1 > 2 ∨ b.h2 - b.l2 > 2) }
    | .L => { s with stack := rest, ok := s.ok && rboxWf b && leafOk P b t, nL := s.nL + 1 }
    | .D _ => { s with stack := rest, ok := s.ok && rboxWf b && leafOkR P sb b t, nD := s.nD + 1 }
    | .A .. => { s with stack := rest, ok := s.ok && rboxWf b && leafOkR P sb b t, nA := s.nA + 1 }

/-- sb は S̄ 以上で、分母が正。 -/
def sbOk (P : Prob) (sb : Int × Nat) : Bool :=
  decide (0 < sb.2) && decide (P.sbar.1 * (sb.2 : Int) ≤ sb.1 * (P.sbar.2 : Int))

/-- farRun の wstepR 版（sbOk も確かめる）。 -/
def farRunR (P : Prob) (sb : Int × Nat) (toks : List Tok) : Bool × Nat × Nat × Nat :=
  let s := toks.foldl (wstepR P sb) ⟨rRoots P.rden, true, 0, 0, 0⟩
  (sbOk P sb && s.ok && s.stack.isEmpty, s.nA, s.nD, s.nL)

/-- 状態 s から、並び toks の i 歩目から j 歩目の手前までを wstepR で進める。 -/
def runR (P : Prob) (sb : Int × Nat) (toks : List Tok) (s : WState) (i j : Nat) : WState :=
  ((toks.drop i).take (j - i)).foldl (wstepR P sb) s

/-- 区間 [i, j) の定理から、i 歩目以降を進めた結果 = j 歩目以降を t から進めた結果。 -/
theorem segR {P : Prob} {sb : Int × Nat} {toks : List Tok} {s t : WState} {i j : Nat} (hij : i ≤ j)
    (h : stEq (runR P sb toks s i j) t = true) :
    (toks.drop i).foldl (wstepR P sb) s = (toks.drop j).foldl (wstepR P sb) t := by
  rw [← stEq_eq h, runR, ← List.foldl_append]
  have e : toks.drop j = (toks.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

/-- 並びの終わりより先からは何も進めない。 -/
theorem finR {P : Prob} {sb : Int × Nat} {toks : List Tok} {s : WState} {j : Nat} (h : toks.length ≤ j) :
    (toks.drop j).foldl (wstepR P sb) s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

end PackLean.D16.KSegR
