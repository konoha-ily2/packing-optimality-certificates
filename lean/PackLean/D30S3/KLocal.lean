import PackLean.D30S3.Core

/-! E3g（2026-11-17）：D30S3 の局所の検査を「代入の結果のデータ」でカーネルに通すための部品。Mathlib なし。

`Core.lean` の局所の検査（`localOkT`）で重いのは、候補の多項式 `candPolys` と管の辺への代入 `sub`
（35 項の 4 次式に 1 次式 3 本を入れて展開、1 回 約 22 秒）で、木のたどり（`shiftLb3`、葉 1 つ 約 1 秒）ではない
（E3d 7 節）。ここでは

* `cpT P t`・`sbT P t`：表を引き、無ければ元の計算に戻る（表に無いものも正しく計算するので、表の漏れは
  正しさに関係しない。遅くなるだけ）。表の各行が正しければ `cpT P t = candPolys P`・`sbT P t = sub P`
  （`cpT_eq`・`sbT_eq`、関数として等しい）。
* 表の行の正しさ（`candPolys … = 値`・`subst … = 値`）は、行ごとの小さい定理でカーネルに確かめさせ
  （`decide +kernel`）、`cpOk_cons`・`sbOk1_cons`・`sbOk_cons` でつなぐ。
* 件の側では `localOkT` を `delta` で開き、`rw [← cpT_eq …, ← sbT_eq …]` で `candPolys P`・`sub P` を表引きに
  置き換えてから `decide +kernel`（`D30S3/KL/Local.lean`）。`localOkT` の写しは作らない
  （写しと元が定義どおり等しいことは、照合の match が別物になるためエラボレータで確かめきれなかった）。

`Core.lean`（と D16・D28 の Core）は変えない。
-/

namespace PackLean.D30S3.KL
open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign QF nth vecGet
  Mono Poly padd psum pmul psmulZ psmulF incAt)
open PackLean.D16 PackLean.D30S3

deriving instance DecidableEq for PackLean.D16.Cand

/-! ## 表 -/

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

/-- 代入の表：辺ごとに (K·p の 3 本, K, [(多項式, 代入の値)])。 -/
abbrev SBTab := List (List Poly × Int × List (Poly × Poly))

def sbT (P : Prob) (t : SBTab) (c : FCtx) (p : Poly) : Poly :=
  match t.find? (fun e => decide (e.1 = c.X ∧ e.2.1 = c.K)) with
  | some e =>
    match e.2.2.find? (fun x => decide (x.1 = p)) with
    | some x => x.2
    | none => sub P c p
  | none => sub P c p

def SBOk1 (P : Prob) (Xs : List Poly) (K : Int) (l : List (Poly × Poly)) : Prop :=
  ∀ x ∈ l, subst P.ps Xs (homScale K 4 x.1) = x.2

def SBOk (P : Prob) (t : SBTab) : Prop := ∀ e ∈ t, SBOk1 P e.1 e.2.1 e.2.2

theorem sbOk1_nil (P : Prob) (Xs : List Poly) (K : Int) : SBOk1 P Xs K [] := by
  intro x hx; cases hx

theorem sbOk1_cons {P : Prob} {Xs : List Poly} {K : Int} {x : Poly × Poly} {l : List (Poly × Poly)}
    (h : subst P.ps Xs (homScale K 4 x.1) = x.2) (hl : SBOk1 P Xs K l) : SBOk1 P Xs K (x :: l) := by
  intro y hy
  rcases List.mem_cons.mp hy with rfl | hy
  · exact h
  · exact hl y hy

theorem sbOk_nil (P : Prob) : SBOk P [] := by
  intro e he; cases he

theorem sbOk_cons {P : Prob} {e : List Poly × Int × List (Poly × Poly)} {t : SBTab}
    (h : SBOk1 P e.1 e.2.1 e.2.2) (ht : SBOk P t) : SBOk P (e :: t) := by
  intro y hy
  rcases List.mem_cons.mp hy with rfl | hy
  · exact h
  · exact ht y hy

theorem sbT_eq (P : Prob) (t : SBTab) (h : SBOk P t) : sbT P t = sub P := by
  funext c p
  unfold sbT
  split
  · rename_i e he
    have hm := List.mem_of_find?_eq_some he
    have hc : e.1 = c.X ∧ e.2.1 = c.K :=
      of_decide_eq_true (List.find?_some (p := fun (e : List Poly × Int × List (Poly × Poly)) => decide (e.1 = c.X ∧ e.2.1 = c.K)) he)
    split
    · rename_i x hx
      have hm2 := List.mem_of_find?_eq_some hx
      have hc2 : x.1 = p := of_decide_eq_true (List.find?_some (p := fun (x : Poly × Poly) => decide (x.1 = p)) hx)
      have := h e hm x hm2
      rw [hc.1, hc.2, hc2] at this
      exact this.symm
    · rfl
  · rfl

end PackLean.D30S3.KL
