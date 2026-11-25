import PackLean.Formal.DTCover
import PackLean.Formal.E3fSeg
import PackLean.E3i.Consts

/-!
# E3i: the far R trees of D45DT checked by segments with the reduced box (`E3h.rcharR`)

Design: `plan/A9k_dodintet_design.md` §5.1 (var 2), `plan/E3f_nat_leaf.md` §7.4.  The kernel checks the far R
trees in segments (`E3h.segTR P P2 c c2 k0 toks k1`, through `E3fSeg.segN_eq` from the Nat-pair walk `segN`).
A D or A leaf first divides the box and `den` by `g = redG den b` and is checked with the constants `P2`
(var 2: `nd`, `kd = 3^50`, `sqb` at the scale `3^76`) and the context `c2` (the n box divided by a common
factor, κ rounded up to the denominator `3^50`).  This file gives what the far certificate needs from that.

* `bracket2`: the bracket `SQB2` of `√1, √5` at `K = 3^76` (the bracket lemma of E3i).
* `chartPt_div`, `inBox_red`: a chart point of the box `b` (denominator `den`) divided by `g` is a chart
  point of the reduced box (denominator `den / g`), for the same rotation (the same set).
* `seg_cover`, `seg_coverN`: one segment — every point of a box of `k0` lies in a good leaf
  (`GoodR`) or in a box of `k1`.  Chained over the segments of a tree from `rRoots den` to `[]`
  (`Covers`), every chart point lies in a good leaf.
* `box_lowR`: `DTCover.box_lowT` for such a tree (with `κ″ ≥ κ` on `x, y ≥ 0`, and the n box divided by a
  common factor giving the same point `n`).
-/

namespace PackLean.Formal.E3iFar

open PackLean.D28 (FE RBox rboxWf rboxQ rotQ split3 nth rRoots)
open PackLean.D45DT (Prm NB TreeCtx RS rchar dval nbWf farLbT discLbT inside rInCube toProb tubeOf PS)
open PackLean.E3h (rleafR rcharR segTR redG redOk redBox rsInit)
open PackLean.E3i (KD2 SQB2)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low MaxRep)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.FarG (mat)
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.DTBase (dtExtraOk toProb_wf toProb_krot maskOf_PS)
open PackLean.Formal.DTFar (accept_lowT kapV sgn)
open PackLean.Formal.DTCover (InR keep_spec LeafLoc low_mono)
open PackLean.Formal.TetCover (mu_max box_entries)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The constants of the leaves -/

/-- The leaf constants of var 2 (as `E3i.P2of`, for any `P`). -/
def P2g (P : Prm) (nd : ℤ) : Prm := { P with nd := nd, kd := KD2, sqb := SQB2 }

theorem P2of_eq (nd : ℤ) : PackLean.E3i.P2of nd = P2g PackLean.D45DT.P nd := rfl

/-- **The bracket of E3i**: `SQB2` brackets `3^76 · √1` and `3^76 · √5`. -/
theorem bracket2 : BracketG SQB2 (maskOf PS) ((3 : ℝ) ^ 76) := by
  rw [maskOf_PS]
  refine ⟨rfl, ?_⟩
  intro x hx
  simp only [SQB2, List.zip_cons_cons, List.zip_nil_left, List.mem_cons, List.not_mem_nil, or_false] at hx
  rcases hx with rfl | rfl
  · simp only [Nat.cast_one, Real.sqrt_one, mul_one]; norm_num
  · have h5 : (3 : ℝ) ^ 76 * √((5 : ℕ) : ℝ) = √(5 * ((3 : ℝ) ^ 76) ^ 2) := by
      rw [Real.sqrt_mul (by norm_num), Real.sqrt_sq (by positivity)]; push_cast; ring
    simp only
    rw [h5]
    constructor
    · apply Real.le_sqrt_of_sq_le; norm_num
    · rw [Real.sqrt_le_iff]; constructor <;> norm_num

/-- The data of `toProb` that the far checks read do not see `nd`, `den`, `kd`, `sqb` (but `WF` asks
`0 < nd`, `0 < den`). -/
theorem wf_change {P : Prm} (h : WF (toProb P)) {nd den : ℤ} {kd : ℕ} {sqb : List (ℤ × ℤ)} (hnd : 0 < nd)
    (hden : 0 < den) : WF (toProb { P with nd := nd, den := den, kd := kd, sqb := sqb }) :=
  ⟨h.pos, h.nb, h.verts, h.rots, h.c0, h.beta, h.bvec, h.btop, h.dv, h.dk, h.c0d, h.bd, hnd, hden, h.mask⟩

/-! ## 2. Dividing the box by `g` (the same set) -/

theorem cast_div_of {a g : ℤ} (hg : 0 < g) (h : a % g = 0) : ((a / g : ℤ) : ℝ) = (a : ℝ) / g := by
  have hd : g ∣ a := Int.dvd_of_emod_eq_zero h
  rw [Int.cast_div hd (by exact_mod_cast hg.ne')]

theorem chq_div (ch : ℕ) (d u0 u1 u2 g : ℝ) (i : ℕ) :
    (chq ch (d / g) (u0 / g) (u1 / g) (u2 / g)).getD i 0 = (chq ch d u0 u1 u2).getD i 0 / g := by
  rcases ch with _ | _ | _ | ch <;> rcases i with _ | _ | _ | _ | i <;> simp [chq]

theorem rqList_div (w x y z g : ℝ) (hg : g ≠ 0) :
    rqList (w / g) (x / g) (y / g) (z / g) = (rqList w x y z).map (fun e => e / g ^ 2) := by
  simp only [rqList, List.map_cons, List.map_nil, List.cons.injEq, and_true]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> field_simp

/-- A chart point divided by `g > 0` is a chart point with the denominator divided by `g`. -/
theorem chartPt_div {R : M3} {den g : ℝ} (hg : 0 < g) {ch : ℕ} {u : Fin 3 → ℝ}
    (h : Charts.ChartPt R den ch u) : Charts.ChartPt R (den / g) ch (fun i => u i / g) := by
  obtain ⟨hb, hN, hl⟩ := h
  have hg0 : g ≠ 0 := hg.ne'
  refine ⟨fun i => ?_, ?_, ?_⟩
  · obtain ⟨h1, h2⟩ := hb i
    constructor
    · rw [neg_div', div_le_div_iff_of_pos_right hg]; linarith
    · exact div_le_div_of_nonneg_right h2 hg.le
  · simp only [chq_div]
    have : 0 < (g ^ 2)⁻¹ := by positivity
    have e : ∀ a b c d : ℝ, (a / g) ^ 2 + (b / g) ^ 2 + (c / g) ^ 2 + (d / g) ^ 2
        = (g ^ 2)⁻¹ * (a ^ 2 + b ^ 2 + c ^ 2 + d ^ 2) := by intro a b c d; field_simp
    rw [e]; exact mul_pos this hN
  · simp only [chq_div]
    rw [rqList_div _ _ _ _ _ hg0, hl]
    simp only [List.map_cons, List.map_nil, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> field_simp

/-- The reduced box holds the point divided by `g`. -/
theorem inBox_red {g den : ℤ} {B : RBox} (hr : redOk g den B = true) {ch : ℕ} {u : Fin 3 → ℝ}
    (h : InBox B ch u) : InBox (redBox g B) ch (fun i => u i / g) := by
  simp only [redOk, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hr
  obtain ⟨⟨⟨⟨⟨⟨⟨hg, _⟩, e0⟩, e1⟩, e2⟩, f0⟩, f1⟩, f2⟩ := hr
  obtain ⟨hch, hb⟩ := h
  have hgr : (0 : ℝ) < g := by exact_mod_cast hg
  refine ⟨hch, fun i => ?_⟩
  obtain ⟨h1, h2⟩ := hb i
  fin_cases i <;>
    simp only [bLo, bHi, redBox, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
      Matrix.vecHead, Matrix.vecTail, Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, Function.comp_apply,
      Fin.succ_zero_eq_one] at h1 h2 ⊢ <;>
    first
    | (rw [cast_div_of hg e0, cast_div_of hg f0]; exact ⟨div_le_div_of_nonneg_right h1 hgr.le,
        div_le_div_of_nonneg_right h2 hgr.le⟩)
    | (rw [cast_div_of hg e1, cast_div_of hg f1]; exact ⟨div_le_div_of_nonneg_right h1 hgr.le,
        div_le_div_of_nonneg_right h2 hgr.le⟩)
    | (rw [cast_div_of hg e2, cast_div_of hg f2]; exact ⟨div_le_div_of_nonneg_right h1 hgr.le,
        div_le_div_of_nonneg_right h2 hgr.le⟩)

theorem redG_pos {den : ℤ} {b : RBox} (hr : redOk (redG den b) den b = true) : 0 < redG den b := by
  simp only [redOk, Bool.and_eq_true, decide_eq_true_eq] at hr; tauto

theorem redOk_den {den : ℤ} {b : RBox} (hr : redOk (redG den b) den b = true) : den % redG den b = 0 := by
  simp only [redOk, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hr; tauto

/-! ## 3. One segment of the walk `rcharR` -/

/-- What a leaf of the walk `rcharR` certifies (the A and D tests on the reduced box with `P2`, `c2`). -/
def GoodR (P P2 : Prm) (c c2 : TreeCtx) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((c.allowL = true ∧ rInCube P c.tube b = true) ∨
     (redOk (redG P.den b) P.den b = true ∧ rboxWf (redBox (redG P.den b) b) = true ∧
      ((∃ m, m < P.rots.length ∧
          discLbT { P2 with den := P.den / redG P.den b } (redBox (redG P.den b) b) m > 0) ∨
       (∃ v0 f0 f1 f3, v0 < P.verts.length ∧ f0 < P.verts.length ∧ f1 < P.verts.length ∧
          f3 < P.verts.length ∧
          farLbT { P2 with den := P.den / redG P.den b } c2.sig c2.nb c2.kap (redBox (redG P.den b) b) v0
            [f0, f1, 0, f3] ≥ 0))))

section Walk

variable (P P2 : Prm) (c c2 : TreeCtx)

theorem rleafR_ok_false (s : RS) (k : ℕ) (a : List ℕ) (h : s.ok = false) :
    (rleafR P P2 c c2 s k a).ok = false := by
  unfold rleafR
  split
  · rfl
  · split_ifs <;> simp [h]

theorem rcharR_ok_false (s : RS) (ch : Char) (h : s.ok = false) : (rcharR P P2 c c2 s ch).ok = false := by
  unfold rcharR
  split_ifs
  · split
    · rfl
    · exact rleafR_ok_false P P2 c c2 _ _ _ h
  · split
    · rfl
    · exact h
  · split
    · rfl
    · simp [h]
  · exact rleafR_ok_false P P2 c c2 _ _ _ h
  · exact h
  · exact h
  · rfl

theorem rleafR_spec (s : RS) (k : ℕ) (a : List ℕ) {b : RBox} {rest : List RBox} (hs : s.stack = b :: rest)
    (hok : (rleafR P P2 c c2 s k a).ok = true) :
    (rleafR P P2 c c2 s k a).stack = rest ∧ GoodR P P2 c c2 b := by
  unfold rleafR at hok ⊢
  rw [hs] at hok ⊢
  simp only at hok ⊢
  split_ifs at hok ⊢ with h0 h1
  · simp only [Bool.and_eq_true] at hok
    exact ⟨rfl, hok.1.1.2, Or.inl ⟨hok.1.2, hok.2⟩⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨⟨_, ⟨hw, hr⟩, hrw⟩, hm⟩, hD⟩ := hok
    exact ⟨rfl, hw, Or.inr ⟨hr, hrw, Or.inl ⟨_, hm, hD⟩⟩⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨⟨⟨⟨⟨_, ⟨hw, hr⟩, hrw⟩, h0⟩, h1⟩, h2⟩, h3⟩, hA⟩ := hok
    exact ⟨rfl, hw, Or.inr ⟨hr, hrw, Or.inr ⟨_, _, _, _, h0, h1, h2, h3, hA⟩⟩⟩

/-- **The one-step rule of `rcharR`.** -/
theorem rcharR_spec :
    BoxTree.StepSpec (rcharR P P2 c c2) RS.stack (fun s => s.ok = true) InR (GoodR P P2 c c2) := by
  intro s ch b rest hs hok
  unfold rcharR at hok ⊢
  split_ifs at hok ⊢ with hp h1 hdot hL hD hA
  · rcases hv : dval ch with _ | v <;> rw [hv] at hok
    · exact absurd hok (by simp)
    · exact Or.inl (rleafR_spec P P2 c c2 _ _ _ (by simpa using hs) hok)
  · rcases hv : dval ch with _ | v <;> rw [hv] at hok
    · exact absurd hok (by simp)
    · exact keep_spec (by simpa using hs)
  · rw [hs] at hok ⊢
    simp only at hok ⊢
    exact BoxTree.spec_split2 rfl (fun z hz => split3_cover b z.1 z.2 hz)
  · exact Or.inl (rleafR_spec P P2 c c2 _ _ _ hs hok)
  · exact keep_spec (by simpa using hs)
  · exact keep_spec (by simpa using hs)

/-- Every point of a box of `k` lies in a good leaf. -/
def Covers (k : List RBox) : Prop := ∀ z, (∃ B ∈ k, InR B z) → ∃ B, GoodR P P2 c c2 B ∧ InR B z

theorem covers_nil : Covers P P2 c c2 [] := fun _ ⟨_, hB, _⟩ => by simp at hB

end Walk

/-- A run that need not end with the empty stack: every point of the first stack lies in a good leaf
or in a box of the last stack. -/
theorem run_coverK {σ τ β π : Type*} (step : σ → τ → σ) (stack : σ → List β) (Alive : σ → Prop)
    (In : β → π → Prop) (Good : β → Prop) (hA : ∀ s t, Alive (step s t) → Alive s)
    (hS : BoxTree.StepSpec step stack Alive In Good) :
    ∀ (toks : List τ) (s : σ), Alive (toks.foldl step s) → ∀ z, (∃ B ∈ stack s, In B z) →
      (∃ B, Good B ∧ In B z) ∨ ∃ B ∈ stack (toks.foldl step s), In B z := by
  intro toks
  induction toks with
  | nil => intro s _ z hz; exact Or.inr (by simpa using hz)
  | cons t toks ih =>
    intro s hok z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok ⊢
    have ha := BoxTree.alive_foldl step Alive hA toks _ hok
    rcases hs : stack s with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases hS s t b rest hs ha with ⟨e, hg⟩ | ⟨kids, e, hk⟩
      · rcases List.mem_cons.1 hB with rfl | hBr
        · exact Or.inl ⟨B, hg, hz⟩
        · exact ih _ hok z ⟨B, by rw [e]; exact hBr, hz⟩
      · rcases List.mem_cons.1 hB with rfl | hBr
        · obtain ⟨c', hc', hcz⟩ := hk z hz
          exact ih _ hok z ⟨c', by rw [e]; exact List.mem_append_left _ hc', hcz⟩
        · exact ih _ hok z ⟨B, by rw [e]; exact List.mem_append_right _ hBr, hz⟩

/-- **One segment** checked by `segTR` carries `Covers` from its last stack to its first. -/
theorem seg_step {P P2 : Prm} {c c2 : TreeCtx} {k0 k1 : List RBox} {toks : List Char}
    (h : segTR P P2 c c2 k0 toks k1 = true) (hk : Covers P P2 c c2 k1) : Covers P P2 c c2 k0 := by
  unfold segTR at h
  simp only [Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨hok, _⟩, hst⟩ := h
  intro z hz
  have hA := BoxTree.alive_of_ok (rcharR P P2 c c2) RS.ok (fun s t hs => rcharR_ok_false P P2 c c2 s t hs)
  rcases run_coverK (rcharR P P2 c c2) RS.stack (fun s => s.ok = true) InR (GoodR P P2 c c2) hA
    (rcharR_spec P P2 c c2) toks (rsInit k0) hok z hz with h1 | ⟨B, hB, hzB⟩
  · exact h1
  · rw [hst] at hB; exact hk z ⟨B, hB, hzB⟩

/-- **One segment** checked by the Nat-pair walk `segN` (through `E3fSeg.segN_eq`). -/
theorem seg_stepN {P P2 : Prm} {c c2 : TreeCtx} (hwf : WF (toProb P2))
    (hsq : PackLean.Kernel.NatLeaf.sqOk P2.sqb = true) (hden : 0 ≤ P.den)
    {a0 a1 a2 : ℤ} (hk2 : c2.kap = [a0, a1, a2]) {k0 k1 : List RBox} {toks : List Char}
    (h : PackLean.E3f.segN P P2 (PackLean.D45DT.LN.ctxN P2 c2.sig c2.nb c2.kap) c k0 toks k1 = true)
    (hk : Covers P P2 c c2 k1) : Covers P P2 c c2 k0 :=
  seg_step (by rwa [← PackLean.Formal.E3fSeg.segN_eq hwf hsq hden hk2]) hk

theorem sqOk_SQB2 : PackLean.Kernel.NatLeaf.sqOk SQB2 = true := by decide

theorem wf_P2g {P : Prm} (h : WF (toProb P)) {nd : ℤ} (hnd : 0 < nd) : WF (toProb (P2g P nd)) :=
  wf_change (den := P.den) h hnd h.rden

/-! ## 4. The same n, and `κ″ ≥ κ` -/

theorem half_cast {l h : ℤ} (he : (h - l) % 2 = 0) :
    (((l + h) / 2 : ℤ) : ℝ) = ((l : ℝ) + h) / 2 ∧ (((h - l) / 2 : ℤ) : ℝ) = ((h : ℝ) - l) / 2 := by
  have h1 : (2 : ℤ) ∣ h - l := Int.dvd_of_emod_eq_zero he
  have h2 : (2 : ℤ) ∣ l + h := by
    have : l + h = (h - l) + 2 * l := by ring
    rw [this]; exact dvd_add h1 (dvd_mul_right 2 l)
  constructor
  · rw [Int.cast_div h2 (by norm_num)]; push_cast; ring
  · rw [Int.cast_div h1 (by norm_num)]; push_cast; ring

/-- The n box divided by a common factor gives the same `x`. -/
theorem nx_red {nd nd2 : ℤ} (hnd : 0 < nd) (hnd2 : 0 < nd2) {nb nb2 : NB} (hw : nbWf nb = true)
    (hw2 : nbWf nb2 = true) (e0 : nd * nb2.l0 = nd2 * nb.l0) (e1 : nd * nb2.h0 = nd2 * nb.h0) (sx : ℝ) :
    DTFar.nx nb2 sx / nd2 = DTFar.nx nb sx / nd := by
  simp only [nbWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hw hw2
  obtain ⟨a1, a2⟩ := half_cast hw.1.1.2
  obtain ⟨b1, b2⟩ := half_cast hw2.1.1.2
  have r0 : (nd : ℝ) * nb2.l0 = nd2 * nb.l0 := by exact_mod_cast e0
  have r1 : (nd : ℝ) * nb2.h0 = nd2 * nb.h0 := by exact_mod_cast e1
  have p1 : (0 : ℝ) < nd := by exact_mod_cast hnd
  have p2 : (0 : ℝ) < nd2 := by exact_mod_cast hnd2
  simp only [DTFar.nx, a1, a2, b1, b2]
  rw [div_eq_div_iff p2.ne' p1.ne']
  linear_combination (1 / 2 : ℝ) * (r0 + r1) + (sx / 2) * (r1 - r0)

/-- The n box divided by a common factor gives the same `y`. -/
theorem ny_red {nd nd2 : ℤ} (hnd : 0 < nd) (hnd2 : 0 < nd2) {nb nb2 : NB} (hw : nbWf nb = true)
    (hw2 : nbWf nb2 = true) (e0 : nd * nb2.l1 = nd2 * nb.l1) (e1 : nd * nb2.h1 = nd2 * nb.h1) (sy : ℝ) :
    DTFar.ny nb2 sy / nd2 = DTFar.ny nb sy / nd := by
  simp only [nbWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hw hw2
  obtain ⟨a1, a2⟩ := half_cast hw.1.2
  obtain ⟨b1, b2⟩ := half_cast hw2.1.2
  have r0 : (nd : ℝ) * nb2.l1 = nd2 * nb.l1 := by exact_mod_cast e0
  have r1 : (nd : ℝ) * nb2.h1 = nd2 * nb.h1 := by exact_mod_cast e1
  have p1 : (0 : ℝ) < nd := by exact_mod_cast hnd
  have p2 : (0 : ℝ) < nd2 := by exact_mod_cast hnd2
  simp only [DTFar.ny, a1, a2, b1, b2]
  rw [div_eq_div_iff p2.ne' p1.ne']
  linear_combination (1 / 2 : ℝ) * (r0 + r1) + (sy / 2) * (r1 - r0)

theorem ny_nonneg {nd : ℤ} (hnd : 0 < nd) {nb : NB} (hw : nbWf nb = true) {sy : ℝ} (hsy : |sy| ≤ 1) :
    0 ≤ DTFar.ny nb sy / nd := by
  simp only [nbWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hw
  obtain ⟨a1, a2⟩ := half_cast hw.1.2
  have hl : (0 : ℝ) ≤ nb.l1 := by exact_mod_cast hw.2
  have hlh : (nb.l1 : ℝ) < nb.h1 := by exact_mod_cast hw.1.1.1.2
  have p1 : (0 : ℝ) < nd := by exact_mod_cast hnd
  obtain ⟨s1, _⟩ := abs_le.1 hsy
  apply div_nonneg _ p1.le
  simp only [DTFar.ny, a1, a2]
  nlinarith

/-- **κ″ ≥ κ** at `x, y ≥ 0` when every coefficient is rounded up (`kᵢ / kd ≤ aᵢ / KD2`). -/
theorem kap_le {P Q : Prm} (hkd : 0 < P.kd) (hQ : Q.kd = KD2) {k0 k1 k2 a0 a1 a2 : ℤ}
    (h0 : k0 * KD2 ≤ a0 * P.kd) (h1 : k1 * KD2 ≤ a1 * P.kd) (h2 : k2 * KD2 ≤ a2 * P.kd)
    {x y : ℝ} (hx : 0 ≤ x) (hy : 0 ≤ y) : kapV P k0 k1 k2 x y ≤ kapV Q a0 a1 a2 x y := by
  simp only [kapV, hQ]
  have pk : (0 : ℝ) < P.kd := by exact_mod_cast hkd
  have pK : (0 : ℝ) < (KD2 : ℕ) := by norm_num [KD2]
  have r0 : (k0 : ℝ) * (KD2 : ℕ) ≤ a0 * P.kd := by exact_mod_cast h0
  have r1 : (k1 : ℝ) * (KD2 : ℕ) ≤ a1 * P.kd := by exact_mod_cast h1
  have r2 : (k2 : ℝ) * (KD2 : ℕ) ≤ a2 * P.kd := by exact_mod_cast h2
  rw [div_le_div_iff₀ pk pK]
  nlinarith [mul_le_mul_of_nonneg_right r0 hx, mul_le_mul_of_nonneg_right r1 hy]

/-! ## 5. One tree -/

theorem root_mem {den : ℤ} {ch : ℕ} (hch : ch < 4) {u : Fin 3 → ℝ}
    (hu : ∀ i, -(den : ℝ) ≤ u i ∧ u i ≤ den) : ∃ B ∈ rRoots den, InR B (ch, u) := by
  refine ⟨⟨ch, -den, -den, -den, den, den, den⟩, ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := hu 0; have h1 := hu 1; have h2 := hu 2
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-- **One tree** (`DTCover.box_lowT` for a tree checked by segments of `rcharR`): the A and D leaves are
checked on the reduced box with `P2 = P2g P nd2` and the context `c2` (the same sign, the n box divided by a
common factor, κ″ with every coefficient rounded up). -/
theorem box_lowR {P : Prm} (h : dtExtraOk P = true) (hkd : 0 < P.kd) {nd2 : ℤ} (hnd2 : 0 < nd2)
    {c c2 : TreeCtx} {k0 k1 k2 a0 a1 a2 : ℤ}
    (hk2 : c2.kap = [a0, a1, a2])
    (hka0 : k0 * KD2 ≤ a0 * P.kd) (hka1 : k1 * KD2 ≤ a1 * P.kd) (hka2 : k2 * KD2 ≤ a2 * P.kd)
    (hsig : c2.sig = c.sig) (hnw : nbWf c.nb = true) (hnw2 : nbWf c2.nb = true)
    (ex0 : P.nd * c2.nb.l0 = nd2 * c.nb.l0) (ex1 : P.nd * c2.nb.h0 = nd2 * c.nb.h0)
    (ey0 : P.nd * c2.nb.l1 = nd2 * c.nb.l1) (ey1 : P.nd * c2.nb.h1 = nd2 * c.nb.h1)
    (hloc : LeafLoc P c k0 k1 k2) (hcov : Covers P (P2g P nd2) c c2 (rRoots P.den))
    {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hxy1 : -(DTFar.nx c.nb sx / P.nd) ≤ sgn c.sig * (DTFar.ny c.nb sy / P.nd))
    (hxy2 : sgn c.sig * (DTFar.ny c.nb sy / P.nd) ≤ DTFar.nx c.nb sx / P.nd)
    (hx1 : DTFar.nx c.nb sx / P.nd ≤ 1) {R : M3} (hR : R ∈ SO3)
    (hmax : MaxRep (VV (toProb P)) P.verts.length R) :
    Low (VV (toProb P)) P.verts.length (c0r (toProb P))
      !₂[DTFar.nx c.nb sx / P.nd, sgn c.sig * (DTFar.ny c.nb sy / P.nd), 1] R
      (kapV P k0 k1 k2 (DTFar.nx c.nb sx / P.nd) (DTFar.ny c.nb sy / P.nd)) := by
  have hwf := toProb_wf h
  have hden0 : 0 < P.den := hwf.rden
  have hden : (0 : ℝ) < P.den := by exact_mod_cast hden0
  obtain ⟨ch, hch, u, hcu⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := hcov (ch, u) (root_mem hch hcu.1)
  rcases hgood with ⟨hL, hrin⟩ | ⟨hr, hrw, hDA⟩
  · exact hloc hL B hwB hrin sx sy hsx hsy R hR u (hin.1 ▸ hcu) (hin.1 ▸ hin)
  have hg : 0 < redG P.den B := redG_pos hr
  have hgr : (0 : ℝ) < redG P.den B := by exact_mod_cast hg
  have hdv : P.den % redG P.den B = 0 := redOk_den hr
  have hQden : 0 < P.den / redG P.den B :=
    Int.ediv_pos_of_pos_of_dvd hden0 hg.le (Int.dvd_of_emod_eq_zero hdv)
  have hQwf : WF (toProb { P2g P nd2 with den := P.den / redG P.den B }) := wf_change hwf hnd2 hQden
  have hcQ : Charts.ChartPt R (((P.den / redG P.den B : ℤ)) : ℝ) ch (fun i => u i / redG P.den B) := by
    rw [cast_div_of hg hdv]; exact chartPt_div hgr hcu
  have hinQ : InBox (redBox (redG P.den B) B) ch (fun i => u i / redG P.den B) := inBox_red hr hin
  obtain ⟨s, hs, hsu⟩ := box_param hrw _ hinQ.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hcQ hinQ.1 hsu
  rcases hDA with ⟨m, hm, hD⟩ | ⟨v0, f0, f1, f3, h0, h1, h3, h4, hA⟩
  · exfalso
    have htr : R.trace < (R * mat PS 2 P.dk (nth P.rots m [])).trace :=
      TetFar.disc_trace (P := toProb { P2g P nd2 with den := P.den / redG P.den B }) hQwf bracket2
        (by positivity) hD hs hNv hent
    obtain ⟨ho, hd, hv⟩ := toProb_krot h hm
    have := hmax _ ⟨ho, hd, hv⟩
    linarith
  · left
    rw [hk2] at hA
    have hacc := accept_lowT (P := { P2g P nd2 with den := P.den / redG P.den B }) c2.sig c2.nb hQwf bracket2
      (by positivity) hA hs hsx hsy (by norm_num [P2g, KD2]) hNv hent hN
    have ex : DTFar.nx c2.nb sx / ((nd2 : ℤ) : ℝ) = DTFar.nx c.nb sx / P.nd :=
      nx_red hwf.nden hnd2 hnw hnw2 ex0 ex1 sx
    have ey : DTFar.ny c2.nb sy / ((nd2 : ℤ) : ℝ) = DTFar.ny c.nb sy / P.nd :=
      ny_red hwf.nden hnd2 hnw hnw2 ey0 ey1 sy
    have hacc' : kapV (P2g P nd2) a0 a1 a2 (DTFar.nx c.nb sx / P.nd) (DTFar.ny c.nb sy / P.nd)
        ≤ dualB (toProb P) !₂[DTFar.nx c.nb sx / P.nd, sgn c.sig * (DTFar.ny c.nb sy / P.nd), 1] R v0
            ![f0, f1, 0, f3] := by
      have e1 := hacc
      simp only [P2g] at e1
      rw [ex, ey, hsig] at e1
      exact e1
    have hx0 : 0 ≤ DTFar.nx c.nb sx / P.nd := by
      have := abs_le.2 ⟨hxy1, hxy2⟩
      linarith [abs_nonneg (sgn c.sig * (DTFar.ny c.nb sy / P.nd))]
    have hy0 : 0 ≤ DTFar.ny c.nb sy / P.nd := ny_nonneg hwf.nden hnw hsy
    have hkk := kap_le (Q := P2g P nd2) hkd rfl hka0 hka1 hka2 hx0 hy0
    refine ⟨dot !₂[DTFar.nx c.nb sx / P.nd, sgn c.sig * (DTFar.ny c.nb sy / P.nd), 1] (bT 2), v0, h0,
      ![f0, f1, 0, f3], fun f => ?_, fun f => mu_max hxy1 hxy2 hx1 f, ?_⟩
    · fin_cases f <;> simp [h1, h3, h4]; exact lt_of_le_of_lt (Nat.zero_le _) h0
    · have hfin := le_trans hkk hacc'
      simpa [dualB] using hfin

/-! ## 6. The far certificate with the trees checked by segments -/

open PackLean.D45DT (FBoxL ntreeRunL treeKap kapForm)
open PackLean.Formal.DTCover (HLocB cornersN ntree_coverL nb_param lin_box treeKap_eq leafLoc_of)
open PackLean.Formal.TetReduction (TetCert)

/-- The checks of `boxRunL` other than the two R trees. -/
def headOk (P : Prm) (r : FBoxL) : Bool :=
  let b := r.nb
  let fU : Nat := if r.mode == 2 then 0 else 1
  let fL : Nat := if r.mode == 1 then 0 else 1
  let modeOk := decide (1 ≤ r.mode ∧ r.mode ≤ 3) && (r.mode == 3 || r.offU + r.offL == 0)
  let kU := treeKap P fU 0 r.offU
  let kL := treeKap P fL 1 r.offL
  let S := List.zipWith (· + ·) kU kL
  let sumOk := [b.l0, b.h0].all (fun x => [b.l1, b.h1].all (fun y =>
    decide (nth S 0 0 * x + nth S 1 0 * y + nth S 2 0 * P.nd ≥ 0)))
  nbWf b && modeOk && sumOk && decide (P.kd % P.koff = 0)

/-- An R tree of the context `c`, checked by segments of `rcharR` with the leaf constants `P2g P nd2` and
the leaf context `c2` (what one tree of the bundle shows). -/
def TreeR (P : Prm) (c : TreeCtx) : Prop :=
  ∃ (nd2 : ℤ) (c2 : TreeCtx) (a0 a1 a2 : ℤ), 0 < nd2 ∧ c2.kap = [a0, a1, a2] ∧
    nth c.kap 0 0 * KD2 ≤ a0 * P.kd ∧ nth c.kap 1 0 * KD2 ≤ a1 * P.kd ∧ nth c.kap 2 0 * KD2 ≤ a2 * P.kd ∧
    c2.sig = c.sig ∧ nbWf c2.nb = true ∧
    P.nd * c2.nb.l0 = nd2 * c.nb.l0 ∧ P.nd * c2.nb.h0 = nd2 * c.nb.h0 ∧
    P.nd * c2.nb.l1 = nd2 * c.nb.l1 ∧ P.nd * c2.nb.h1 = nd2 * c.nb.h1 ∧
    Covers P (P2g P nd2) c c2 (rRoots P.den)

/-- The U and L trees of a record. -/
def TreesR (P : Prm) (r : FBoxL) : Prop :=
  let fU : Nat := if r.mode == 2 then 0 else 1
  let fL : Nat := if r.mode == 1 then 0 else 1
  TreeR P ⟨0, r.nb, treeKap P fU 0 r.offU,
      inside P (tubeOf P fU) [r.nb.l0, r.nb.h0] [r.nb.l1, r.nb.h1] && decide (r.offU ≤ 0), tubeOf P fU⟩ ∧
    TreeR P ⟨1, r.nb, treeKap P fL 1 r.offL,
      inside P (tubeOf P fL) [r.nb.l0, r.nb.h0] [-r.nb.h1, -r.nb.l1] && decide (r.offL ≤ 0), tubeOf P fL⟩

/-- `box_lowR` with the tree given as `TreeR` and κ as `treeKap`. -/
theorem box_lowTR {P : Prm} (h : dtExtraOk P = true) (hkd : 0 < P.kd) (hloc : HLocB P) {form sig : ℕ}
    (hform : form ≤ 1) (hsig : sig ≤ 1) {nb : NB} (hnw : nbWf nb = true) {off : ℤ} (allowL : Bool)
    (hal : allowL = true → inside P (tubeOf P form) [nb.l0, nb.h0]
      (if sig = 0 then [nb.l1, nb.h1] else [-nb.h1, -nb.l1]) = true ∧ off ≤ 0)
    (ht : TreeR P ⟨sig, nb, treeKap P form sig off, allowL, tubeOf P form⟩)
    {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hxy1 : -(DTFar.nx nb sx / P.nd) ≤ sgn sig * (DTFar.ny nb sy / P.nd))
    (hxy2 : sgn sig * (DTFar.ny nb sy / P.nd) ≤ DTFar.nx nb sx / P.nd)
    (hx1 : DTFar.nx nb sx / P.nd ≤ 1) {R : M3} (hR : R ∈ SO3)
    (hmax : MaxRep (VV (toProb P)) P.verts.length R) :
    Low (VV (toProb P)) P.verts.length (c0r (toProb P))
      !₂[DTFar.nx nb sx / P.nd, sgn sig * (DTFar.ny nb sy / P.nd), 1] R
      (kapV P (nth (kapForm P form sig) 0 0) (nth (kapForm P form sig) 1 0)
        (nth (kapForm P form sig) 2 0 + off * ((P.kd / P.koff : ℕ) : ℤ))
        (DTFar.nx nb sx / P.nd) (DTFar.ny nb sy / P.nd)) := by
  obtain ⟨nd2, c2, a0, a1, a2, hnd2, hk2, hka0, hka1, hka2, hsg, hnw2, ex0, ex1, ey0, ey1, hcov⟩ := ht
  simp only [treeKap_eq, nth, List.getD_cons_zero, List.getD_cons_succ] at hka0 hka1 hka2
  exact box_lowR (c := ⟨sig, nb, treeKap P form sig off, allowL, tubeOf P form⟩) h hkd hnd2 hk2
    (by simpa [nth] using hka0) (by simpa [nth] using hka1) (by simpa [nth] using hka2) hsg hnw hnw2
    ex0 ex1 ey0 ey1 (leafLoc_of hloc hkd hform hsig hnw rfl allowL hal) hcov hsx hsy hxy1 hxy2 hx1 hR hmax

/-- **The far certificate** (`DTCover.far_certT` with the two R trees of every record checked by segments
of `rcharR`, `TreesR`, in place of `rtreeL`). -/
theorem far_certR {P : Prm} (h : dtExtraOk P = true) (hkd : 0 < P.kd) (hloc : HLocB P)
    {ntoks : List Char} {recs : List FBoxL}
    (hn : (ntreeRunL P.nd ntoks (recs.map fun r => cornersN r.nb)).1 = true)
    (hb : ∀ r ∈ recs, headOk P r = true ∧ TreesR P r) :
    TetCert (VV (toProb P)) P.verts.length (c0r (toProb P)) := by
  have hwf := toProb_wf h
  intro x y hy hyx hx
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hwf.nden
  obtain ⟨bk, hbk, hin⟩ := ntree_coverL hn (X := x * P.nd) (Y := y * P.nd)
    (by positivity) (by nlinarith) (by nlinarith)
  obtain ⟨r, hrm, rfl⟩ := List.mem_map.1 hbk
  obtain ⟨hro, hrU, hrL⟩ := hb r hrm
  unfold headOk at hro
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hro
  obtain ⟨⟨⟨hnw, hmode⟩, hsum⟩, _⟩ := hro
  obtain ⟨sx, sy, hsx, hsy, hx', hy'⟩ := nb_param hnw hin
  have ex : DTFar.nx r.nb sx / P.nd = x := by rw [hx']; field_simp
  have ey : DTFar.ny r.nb sy / P.nd = y := by rw [hy']; field_simp
  set fU : ℕ := if r.mode == 2 then 0 else 1 with hfU
  set fL : ℕ := if r.mode == 1 then 0 else 1 with hfL
  have hkd' : (0 : ℝ) < P.kd := by exact_mod_cast hkd
  refine ⟨kapV P (nth (kapForm P fU 0) 0 0) (nth (kapForm P fU 0) 1 0)
      (nth (kapForm P fU 0) 2 0 + r.offU * ((P.kd / P.koff : ℕ) : ℤ)) x y,
    kapV P (nth (kapForm P fL 1) 0 0) (nth (kapForm P fL 1) 1 0)
      (nth (kapForm P fL 1) 2 0 + r.offL * ((P.kd / P.koff : ℕ) : ℤ)) x y,
    ?_, fun R hR hmax => ?_, fun R hR hmax => ?_⟩
  · -- the pair sum at the four corners
    simp only [treeKap_eq, List.zipWith_cons_cons, List.zipWith_nil_left, nth, List.getD_cons_zero,
      List.getD_cons_succ, List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true,
      decide_eq_true_eq] at hsum
    obtain ⟨⟨c1, c2⟩, c3, c4⟩ := hsum
    obtain ⟨a1, a2, a3, a4⟩ := hin
    simp only [cornersN] at a1 a2 a3 a4
    have hl := lin_box c1 c2 c3 c4 ⟨a1, a2⟩ ⟨a3, a4⟩
    simp only [kapV, nth]
    rw [← add_div]
    apply div_nonneg _ hkd'.le
    push_cast at hl ⊢
    nlinarith
  · have hl := box_lowTR h hkd hloc (by rw [hfU]; split <;> norm_num) (by norm_num) hnw _
      (fun hal => by simp only [Bool.and_eq_true, decide_eq_true_eq] at hal; simpa using hal) hrU hsx hsy
      (by simp only [sgn]; rw [ex, ey]; simp; linarith) (by simp only [sgn]; rw [ex, ey]; simp; linarith)
      (by rw [ex]; exact hx) hR hmax
    simp only [sgn, ex, ey] at hl
    simpa [kapV] using hl
  · have hl := box_lowTR h hkd hloc (by rw [hfL]; split <;> norm_num) (by norm_num) hnw _
      (fun hal => by simp only [Bool.and_eq_true, decide_eq_true_eq] at hal; simpa using hal) hrL hsx hsy
      (by simp only [sgn]; rw [ex, ey]; simp; linarith) (by simp only [sgn]; rw [ex, ey]; simp; linarith)
      (by rw [ex]; exact hx) hR hmax
    simp only [sgn, ex, ey] at hl
    simpa [kapV] using hl

end

#assert_std_axioms PackLean.Formal.E3iFar.box_lowR PackLean.Formal.E3iFar.seg_stepN
  PackLean.Formal.E3iFar.bracket2 PackLean.Formal.E3iFar.far_certR

end PackLean.Formal.E3iFar
