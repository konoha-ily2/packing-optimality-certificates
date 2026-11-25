-- E3c（11/15）：D16.Core の遠方の並び（wstep の foldl）を区間に分けて `decide +kernel` で確かめ、つなぐための補題（手で書いたもの）。
-- KernelSeg（D16C.cstep 用、E3a′）と同じ形。箱の比較 boxEq・listEq は KernelSeg のものを使う。どれも標準の公理だけ。
-- 定数の確かめ（constsOk）の List.all を区間に分けるための all_split も置く。
import PackLean.D16.KernelSeg
import PackLean.D16.Core

namespace PackLean.D16.KSegW
open PackLean.D28 PackLean.D16 PackLean.D16.KSeg

/-- 状態の比較（Bool）。スタックは長さと 1 つずつの箱で。 -/
def stEq (a b : WState) : Bool :=
  a.ok == b.ok && a.nA == b.nA && a.nD == b.nD && a.nL == b.nL &&
  a.stack.length == b.stack.length && (a.stack.zip b.stack).all (fun p => boxEq p.1 p.2)

/-- 状態 s から、並び toks の i 歩目から j 歩目の手前までを進める。 -/
def run (P : Prob) (toks : List Tok) (s : WState) (i j : Nat) : WState :=
  ((toks.drop i).take (j - i)).foldl (wstep P) s

theorem stEq_eq {a b : WState} (h : stEq a b = true) : a = b := by
  cases a; cases b
  simp only [stEq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
  rw [listEq h5 h6]; subst h1 h2 h3 h4; rfl

/-- 区間 [i, j) の定理から、i 歩目以降を進めた結果 = j 歩目以降を t から進めた結果。 -/
theorem seg {P : Prob} {toks : List Tok} {s t : WState} {i j : Nat} (hij : i ≤ j)
    (h : stEq (run P toks s i j) t = true) :
    (toks.drop i).foldl (wstep P) s = (toks.drop j).foldl (wstep P) t := by
  rw [← stEq_eq h, run, ← List.foldl_append]
  have e : toks.drop j = (toks.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

/-- 並びの終わりより先からは何も進めない。 -/
theorem fin {P : Prob} {toks : List Tok} {s : WState} {j : Nat} (h : toks.length ≤ j) :
    (toks.drop j).foldl (wstep P) s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

/-- List.all を i 番目から j 番目の手前までに限ったもの。 -/
def allSeg {α : Type} (f : α → Bool) (l : List α) (i j : Nat) : Bool := ((l.drop i).take (j - i)).all f

/-- 区間 [i, j) の all と j 以降の all から、i 以降の all。 -/
theorem allSeg_trans {α : Type} {f : α → Bool} {l : List α} {i j : Nat} (hij : i ≤ j)
    (h : allSeg f l i j = true) (h2 : (l.drop j).all f = true) : (l.drop i).all f = true := by
  have e : l.drop j = (l.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e] at h2
  unfold allSeg at h
  rw [← List.take_append_drop (j - i) (l.drop i), List.all_append, h, h2]; rfl

theorem all_fin {α : Type} {f : α → Bool} {l : List α} {j : Nat} (h : l.length ≤ j) :
    (l.drop j).all f = true := by
  rw [List.drop_eq_nil_of_le h]; rfl

end PackLean.D16.KSegW
