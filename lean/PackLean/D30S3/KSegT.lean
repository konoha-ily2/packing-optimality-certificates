-- E3c（11/20）：D30S3 の遠方の並び（wstepT の foldl）を区間に分けて `decide +kernel` で確かめ、つなぐための補題（手で書いたもの）。
-- D16.KernelSegW の run・seg・fin と同じ形で、歩みを wstepT P X に替えたもの。状態の比較は KernelSegW.stEq を使う。どれも標準の公理だけ。
import PackLean.D16.KernelSegW
import PackLean.D30S3.Core

namespace PackLean.D30S3.KSegT
open PackLean.D16 PackLean.D16.KSegW PackLean.D30S3

/-- 状態 s から、並び toks の i 歩目から j 歩目の手前までを wstepT で進める。 -/
def runT (P : Prob) (X : S3) (toks : List Tok) (s : WState) (i j : Nat) : WState :=
  ((toks.drop i).take (j - i)).foldl (wstepT P X) s

/-- 区間 [i, j) の定理から、i 歩目以降を進めた結果 = j 歩目以降を t から進めた結果。 -/
theorem segT {P : Prob} {X : S3} {toks : List Tok} {s t : WState} {i j : Nat} (hij : i ≤ j)
    (h : stEq (runT P X toks s i j) t = true) :
    (toks.drop i).foldl (wstepT P X) s = (toks.drop j).foldl (wstepT P X) t := by
  rw [← stEq_eq h, runT, ← List.foldl_append]
  have e : toks.drop j = (toks.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

/-- 並びの終わりより先からは何も進めない。 -/
theorem finT {P : Prob} {X : S3} {toks : List Tok} {s : WState} {j : Nat} (h : toks.length ≤ j) :
    (toks.drop j).foldl (wstepT P X) s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

end PackLean.D30S3.KSegT
