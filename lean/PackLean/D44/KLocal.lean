import PackLean.D16.Core

/-! E3g2（2026-11-17）：D44 の局所（補題 Q、`D44/Core.lean` の `localQ`）をカーネルだけで確かめるための部品。
Mathlib なし。`D30S3/KLocal.lean` の `cpT` の部分の写し（D30S3 の名前空間と D30S3.Core に依らないように、
共有部品は変えずに写した）。

`localQ` で重いのは候補の多項式 `cands.map (candPolys P Rq N)`。辺への代入は `faceSub`（単項式の付け替え）で軽いので
表にしない。

* `cpT P t`：表を引き、無ければ元の計算に戻る（表の漏れは正しさに関係しない、遅くなるだけ）。表の各行が正しければ
  `cpT P t = candPolys P`（`cpT_eq`、関数として等しい）。
* 表の行の正しさ（`candPolys … = 値`）は行ごとの小さい定理で（`decide +kernel`）、`cpOk_cons` でつなぐ。
* 件の側では `delta localQ` で開き、`rw [← cpT_eq …]` で `candPolys P` を表引きに置き換えてから `decide +kernel`。
-/

namespace PackLean.D44.KL
open PackLean.D28 (Poly)
open PackLean.D16

deriving instance DecidableEq for PackLean.D16.Cand

/-- 候補の多項式の表：(Rq, N, [(候補, candPolys の値)])。 -/
abbrev CPTab := List Poly × Poly × List (Cand × (Poly × List Poly))

def cpT (P : Prob) (t : CPTab) (Rq : List Poly) (N : Poly) (cd : Cand) : Poly × List Poly :=
  if Rq = t.1 ∧ N = t.2.1 then
    match t.2.2.find? (fun e => decide (e.1 = cd)) with
    | some e => e.2
    | none => candPolys P Rq N cd
  else candPolys P Rq N cd

def CPOk (P : Prob) (Rq : List Poly) (N : Poly) (l : List (Cand × (Poly × List Poly))) : Prop :=
  ∀ e ∈ l, candPolys P Rq N e.1 = e.2

theorem cpOk_nil (P : Prob) (Rq : List Poly) (N : Poly) : CPOk P Rq N [] := by
  intro e he; cases he

theorem cpOk_cons {P : Prob} {Rq : List Poly} {N : Poly} {e : Cand × (Poly × List Poly)}
    {l : List (Cand × (Poly × List Poly))} (h : candPolys P Rq N e.1 = e.2) (hl : CPOk P Rq N l) :
    CPOk P Rq N (e :: l) := by
  intro x hx
  rcases List.mem_cons.mp hx with rfl | hx
  · exact h
  · exact hl x hx

theorem cpT_eq (P : Prob) (t : CPTab) (h : CPOk P t.1 t.2.1 t.2.2) : cpT P t = candPolys P := by
  funext Rq N cd
  unfold cpT
  split
  · rename_i hh
    obtain ⟨h1, h2⟩ := hh
    split
    · rename_i e he
      have hm := List.mem_of_find?_eq_some he
      have hc := List.find?_some he
      have hc' : e.1 = cd := of_decide_eq_true hc
      subst h1; subst h2; subst hc'
      exact (h e hm).symm
    · rfl
  · rfl

end PackLean.D44.KL
