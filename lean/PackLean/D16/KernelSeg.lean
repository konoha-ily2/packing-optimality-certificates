-- E3a′（11/14）：遠方の並び（D16C.cstep の foldl）を区間に分けて `decide +kernel` で確かめ、つなぐための補題（手で書いたもの）。
-- 区間の定理は「状態 s から i 歩目〜j 歩目の手前を進めると状態 t（書き出した境の状態）になる」を Bool の stEq で言う。
-- stEq = true ⇒ 状態が等しい（stEq_eq）と、List.foldl_append で区間をつなぐ（seg）。どちらも標準の公理だけ。
import PackLean.D16.CoverCore

namespace PackLean.D16.KSeg
open PackLean.D28 PackLean.D16C

/-- 箱の比較（Bool、カーネルで簡約できる形）。 -/
def boxEq (a b : RBox) : Bool :=
  a.ch == b.ch && a.l0 == b.l0 && a.l1 == b.l1 && a.l2 == b.l2 && a.h0 == b.h0 && a.h1 == b.h1 && a.h2 == b.h2

/-- 状態の比較（Bool）。スタックは長さと 1 つずつの箱で。 -/
def stEq (a b : CState) : Bool :=
  a.ok == b.ok && a.nA == b.nA && a.nL == b.nL && a.nOut == b.nOut &&
  a.stack.length == b.stack.length && (a.stack.zip b.stack).all (fun p => boxEq p.1 p.2)

/-- 状態 s から、並び toks の i 歩目から j 歩目の手前までを進める。 -/
def run (P : CProb) (toks : List CTok) (s : CState) (i j : Nat) : CState :=
  ((toks.drop i).take (j - i)).foldl (cstep P) s

theorem boxEq_eq {a b : RBox} (h : boxEq a b = true) : a = b := by
  cases a; cases b
  simp only [boxEq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  subst h1 h2 h3 h4 h5 h6 h7; rfl

theorem listEq : ∀ {l₁ l₂ : List RBox}, l₁.length = l₂.length →
    (l₁.zip l₂).all (fun p => boxEq p.1 p.2) = true → l₁ = l₂
  | [], [], _, _ => rfl
  | [], _ :: _, h, _ => by simp at h
  | _ :: _, [], h, _ => by simp at h
  | a :: as, b :: bs, h, hz => by
    simp only [List.zip_cons_cons, List.all_cons, Bool.and_eq_true] at hz
    simp only [List.length_cons, Nat.add_right_cancel_iff] at h
    rw [boxEq_eq hz.1, listEq h hz.2]

theorem stEq_eq {a b : CState} (h : stEq a b = true) : a = b := by
  cases a; cases b
  simp only [stEq, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩ := h
  rw [listEq h5 h6]; subst h1 h2 h3 h4; rfl

/-- 区間 [i, j) の定理から、i 歩目以降を進めた結果 = j 歩目以降を t から進めた結果。 -/
theorem seg {P : CProb} {toks : List CTok} {s t : CState} {i j : Nat} (hij : i ≤ j)
    (h : stEq (run P toks s i j) t = true) :
    (toks.drop i).foldl (cstep P) s = (toks.drop j).foldl (cstep P) t := by
  rw [← stEq_eq h, run, ← List.foldl_append]
  have e : toks.drop j = (toks.drop i).drop (j - i) := by
    rw [List.drop_drop]; congr 1; omega
  rw [e, List.take_append_drop]

/-- 並びの終わりより先からは何も進めない。 -/
theorem fin {P : CProb} {toks : List CTok} {s : CState} {j : Nat} (h : toks.length ≤ j) :
    (toks.drop j).foldl (cstep P) s = s := by
  rw [List.drop_eq_nil_of_le h]; rfl

end PackLean.D16.KSeg
