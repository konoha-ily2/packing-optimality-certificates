import PackLean.Formal.DTFar
import PackLean.Formal.TetCover
import PackLean.Formal.BoxTree
import PackLean.Formal.PolySemN

/-!
# A9k stage 7c-2 (part 1): the trees of `D45DT` give `TetCert` (with a local hypothesis on the L leaves)

Design: `plan/A9k_dodintet_design.md` §2 (the rows `rtreeT`, `ntreeRun`, the pair types), §3 (7c-2).
The soundness is written for the `List Char` checks of `D45DT/CoreL.lean` (`rtreeL`, `boxRunL`,
`ntreeRunL`); the `String` records are read through the bridges of 7c-0.

* `rtree_coverL`: the R tree (one character at a time, `rchar`; a pending argument keeps the stack, so
  it is the split with the one child `[b]` of `BoxTree.StepSpec`) covers the four charts with good
  leaves (`GoodT`: L with `allowL` and `rInCube`, D with `discLbT > 0`, A with `farLbT ≥ 0`).
* `ntree_coverL`: the n tree (`nchar`, `BoxTree.run_coverQ`) covers `0 ≤ Y ≤ X ≤ nd` with the boxes of
  the records, in order.
* `box_lowT`: one tree; at `n = (x, y)` of the box and `p = (x, sgn·y, 1)`, every `R ∈ SO(3)` with
  `MaxRep` has `Low … p R κ(n)` (κ the linear form of the tree), given what the L leaves need.
* **`far_certT`**: the n tree, all the pair boxes and the box-level local hypothesis `HLocB` give
  `TetCert (VV (toProb P)) nv c̄`.  The pair sum `κ_U + κ_L ≥ 0` is the sum test at the four corners
  (a linear form in `n`), the L trees have `off ≤ 0`, so their κ is at most the κ of the tube form
  (`low_mono`).

`HLocB` is stated on the boxes of the leaves (the n box passes `inside`, the R box passes
`rInCube`).  The step from these Bool tests to the parallelogram of the tube and the cone of the
centre quaternion (the rest of 7c-2) and the local lemma itself (7c-3) give `HLocB`.
-/

namespace PackLean.Formal.DTCover

open PackLean.D28 (FE RBox rboxWf rboxQ rotQ split3 nth rRoots)
open PackLean.D45DT (Prm NB TreeCtx RS rleaf rchar rtreeL FBoxL boxRunL NS nchar nsplit ntreeRunL nbWf
  treeKap kapForm tubeOf inside rInCube farLbT discLbT dval toProb Tube)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.FarG (mat)
open PackLean.Formal.DTBase (dtExtraOk toProb_wf toProb_bracket toProb_krot disc_traceT)
open PackLean.Formal.DTFar (accept_lowT kapV sgn nx ny)
open PackLean.Formal.TetCover (InN mu_max box_entries)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The R tree -/

/-- What a leaf of an R tree certifies. -/
def GoodT (P : Prm) (c : TreeCtx) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((c.allowL = true ∧ rInCube P c.tube b = true) ∨
     (∃ m, m < P.rots.length ∧ discLbT P b m > 0) ∨
     (∃ v0 f0 f1 f3, v0 < P.verts.length ∧ f0 < P.verts.length ∧ f1 < P.verts.length ∧
        f3 < P.verts.length ∧ farLbT P c.sig c.nb c.kap b v0 [f0, f1, 0, f3] ≥ 0))

theorem rleaf_ok_false (P : Prm) (c : TreeCtx) (s : RS) (k : ℕ) (a : List ℕ) (h : s.ok = false) :
    (rleaf P c s k a).ok = false := by
  unfold rleaf
  split
  · rfl
  · split_ifs <;> simp [h]

theorem rchar_ok_false (P : Prm) (c : TreeCtx) (s : RS) (ch : Char) (h : s.ok = false) :
    (rchar P c s ch).ok = false := by
  unfold rchar
  split_ifs
  · split
    · rfl
    · exact rleaf_ok_false P c _ _ _ h
  · split
    · rfl
    · exact h
  · split
    · rfl
    · simp [h]
  · exact rleaf_ok_false P c _ _ _ h
  · exact h
  · exact h
  · rfl

/-- A leaf: the stack loses its top box, which is good. -/
theorem rleaf_spec (P : Prm) (c : TreeCtx) (s : RS) (k : ℕ) (a : List ℕ) {b : RBox} {rest : List RBox}
    (hs : s.stack = b :: rest) (hok : (rleaf P c s k a).ok = true) :
    (rleaf P c s k a).stack = rest ∧ GoodT P c b := by
  unfold rleaf at hok ⊢
  rw [hs] at hok ⊢
  simp only at hok ⊢
  split_ifs at hok ⊢ with h0 h1
  · simp only [Bool.and_eq_true] at hok
    exact ⟨rfl, hok.1.1.2, Or.inl ⟨hok.1.2, hok.2⟩⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
    exact ⟨rfl, hok.1.1.2, Or.inr (Or.inl ⟨_, hok.1.2, hok.2⟩)⟩
  · simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨⟨⟨⟨⟨_, hw⟩, h0⟩, h1⟩, h2⟩, h3⟩, hA⟩ := hok
    exact ⟨rfl, hw, Or.inr (Or.inr ⟨_, _, _, _, h0, h1, h2, h3, hA⟩)⟩

/-- The point `z = (ch, y)` lies in the R box. -/
def InR (B : RBox) (z : ℕ × (Fin 3 → ℝ)) : Prop := InBox B z.1 z.2

theorem keep_spec {L rest : List RBox} {b : RBox} {Good : RBox → Prop} (e : L = b :: rest) :
    (L = rest ∧ Good b) ∨ (∃ kids, L = kids ++ rest ∧ ∀ z, InR b z → ∃ c ∈ kids, InR c z) :=
  Or.inr ⟨[b], e, fun z hz => ⟨b, by simp, hz⟩⟩

/-- **The one-step rule of `rchar`.** -/
theorem rchar_spec (P : Prm) (c : TreeCtx) :
    BoxTree.StepSpec (rchar P c) RS.stack (fun s => s.ok = true) InR (GoodT P c) := by
  intro s ch b rest hs hok
  unfold rchar at hok ⊢
  split_ifs at hok ⊢ with hp h1 hdot hL hD hA
  · rcases hv : dval ch with _ | v <;> rw [hv] at hok
    · exact absurd hok (by simp)
    · exact Or.inl (rleaf_spec P c _ _ _ (by simpa using hs) hok)
  · rcases hv : dval ch with _ | v <;> rw [hv] at hok
    · exact absurd hok (by simp)
    · exact keep_spec (by simpa using hs)
  · rw [hs] at hok ⊢
    simp only at hok ⊢
    exact BoxTree.spec_split2 rfl (fun z hz => split3_cover b z.1 z.2 hz)
  · exact Or.inl (rleaf_spec P c _ _ _ hs hok)
  · exact keep_spec (by simpa using hs)
  · exact keep_spec (by simpa using hs)

/-- **The R tree of one tree context.** If `rtreeL` passes, every point `(ch, y)` with `ch < 4`,
`|y i| ≤ den` lies in a good leaf of chart `ch`. -/
theorem rtree_coverL (P : Prm) (c : TreeCtx) (toks : List Char) (h : (rtreeL P c toks).1 = true) :
    ∀ ch, ch < 4 → ∀ y : Fin 3 → ℝ, (∀ i, |y i| ≤ (P.den : ℝ)) → ∃ B, GoodT P c B ∧ InBox B ch y := by
  intro ch hch y hy
  simp only [rtreeL, Bool.and_eq_true, List.isEmpty_iff, beq_iff_eq] at h
  obtain ⟨⟨h1, h2⟩, _⟩ := h
  have hA := BoxTree.alive_of_ok (rchar P c) RS.ok (fun s t hs => rchar_ok_false P c s t hs)
  refine BoxTree.run_cover (rchar P c) RS.stack (fun s => s.ok = true) InR (GoodT P c) hA
    (rchar_spec P c) toks _ h1 h2 (ch, y) ⟨⟨ch, -P.den, -P.den, -P.den, P.den, P.den, P.den⟩, ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-! ## 2. The n tree -/

def cornersN (b : NB) : ℤ × ℤ × ℤ × ℤ := (b.l0, b.l1, b.h0, b.h1)

/-- The point `z = (X, Y)` with `Y ≤ X` lies in the n box. -/
def InNB (b : NB) (z : ℝ × ℝ) : Prop := InN (cornersN b) z.1 z.2 ∧ z.2 ≤ z.1

theorem nchar_ok_false (s : NS) (ch : Char) (h : s.ok = false) : (nchar s ch).ok = false := by
  unfold nchar
  rcases s.stack with _ | ⟨b, rest⟩
  · rfl
  · simp only
    split_ifs
    · simp [h]
    · simp [h]
    · rcases s.boxes with _ | ⟨⟨a0, a1, a2, a3⟩, bs⟩ <;> simp [h]
    · rfl

theorem nchar_boxes (s : NS) (ch : Char) : ∀ x ∈ (nchar s ch).boxes, x ∈ s.boxes := by
  intro x hx
  unfold nchar at hx
  rcases hst : s.stack with _ | ⟨b, rest⟩
  · rw [hst] at hx; exact hx
  · rw [hst] at hx
    simp only at hx
    split_ifs at hx
    · exact hx
    · exact hx
    · rcases hb : s.boxes with _ | ⟨y, bs⟩
      · rw [hb] at hx; simp at hx
      · rw [hb] at hx; simp only at hx; exact List.mem_cons_of_mem _ hx
    · exact hx

theorem nsplit_cover (b : NB) (z : ℝ × ℝ) (h : InNB b z) : InNB (nsplit b).1 z ∨ InNB (nsplit b).2 z := by
  obtain ⟨⟨a1, a2, a3, a4⟩, hyx⟩ := h
  simp only [cornersN] at a1 a2 a3 a4
  simp only [nsplit]
  split_ifs
  · rcases le_total z.1 (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨⟨a1, hz, a3, a4⟩, hyx⟩
    · right; exact ⟨⟨hz, a2, a3, a4⟩, hyx⟩
  · rcases le_total z.2 (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨⟨a1, a2, a3, hz⟩, hyx⟩
    · right; exact ⟨⟨a1, a2, hz, a4⟩, hyx⟩

/-- **The one-step rule of `nchar`.** -/
theorem nchar_stepOk :
    BoxTree.StepOk nchar NS.stack (fun s => s.ok = true) InNB
      (fun s z => ∃ x ∈ s.boxes, InN x z.1 z.2) := by
  intro s ch b rest hs hok
  unfold nchar at hok ⊢
  rw [hs] at hok ⊢
  simp only at hok ⊢
  split_ifs at hok ⊢ with h1 h2 h3
  · refine ⟨fun C hC => by simp [hC], fun z hz => Or.inr ?_⟩
    rcases nsplit_cover b z hz with h | h
    · exact ⟨_, by simp, h⟩
    · exact ⟨_, by simp, h⟩
  · refine ⟨fun C hC => hC, fun z hz => ?_⟩
    simp only [Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨_, a2, a3, _⟩, hyx⟩ := hz
    simp only [cornersN] at a2 a3
    have : ((b.h0 : ℤ) : ℝ) < b.l1 := by exact_mod_cast hok.2
    exact absurd hyx (by linarith)
  · rcases hb : s.boxes with _ | ⟨⟨a0, a1, a2, a3⟩, bs⟩
    · rw [hb] at hok; exact absurd hok (by simp)
    · rw [hb] at hok
      simp only [Bool.and_eq_true, beq_iff_eq] at hok
      obtain ⟨⟨⟨⟨_, e0⟩, e1⟩, e2⟩, e3⟩ := hok
      refine ⟨fun C hC => hC, fun z hz => Or.inl ⟨(a0, a1, a2, a3), by simp, ?_⟩⟩
      subst e0 e1 e2 e3
      exact hz.1

/-- **The n tree.** If `ntreeRunL` passes, every point of `[0, nd]²` with `0 ≤ Y ≤ X` lies in a listed
box. -/
theorem ntree_coverL {nd : ℤ} {toks : List Char} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : (ntreeRunL nd toks boxes).1 = true) {X Y : ℝ} (hY0 : 0 ≤ Y) (hYX : Y ≤ X) (hX : X ≤ nd) :
    ∃ b ∈ boxes, InN b X Y := by
  simp only [ntreeRunL, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨⟨h1, h2⟩, _⟩ := h
  have hA := BoxTree.alive_of_ok nchar NS.ok (fun s t hs => nchar_ok_false s t hs)
  exact BoxTree.run_coverQ nchar NS.stack (fun s => s.ok = true) InNB _ hA
    (fun s t z ⟨x, hx, hz⟩ => ⟨x, nchar_boxes s t x hx, hz⟩) nchar_stepOk toks _ h1 h2 (X, Y)
    ⟨⟨0, 0, nd, nd⟩, by simp, ⟨by simp [cornersN]; linarith, by simpa [cornersN] using hX,
      by simpa [cornersN] using hY0, by simp [cornersN]; linarith⟩, hYX⟩

/-- Every point of a well-formed n box is `(nx sx, ny sy)` with `|sx|, |sy| ≤ 1`. -/
theorem nb_param {nb : NB} (hw : nbWf nb = true) {X Y : ℝ} (h : InN (cornersN nb) X Y) :
    ∃ sx sy : ℝ, |sx| ≤ 1 ∧ |sy| ≤ 1 ∧ nx nb sx = X ∧ ny nb sy = Y := by
  simp only [nbWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hw
  obtain ⟨⟨⟨⟨h0, h1⟩, e0⟩, e1⟩, _⟩ := hw
  obtain ⟨a1, a2, a3, a4⟩ := h
  simp only [cornersN] at a1 a2 a3 a4
  obtain ⟨sx, hsx, hx⟩ := PolySemN.ax_param_le _ _ X h0.le e0 a1 a2
  obtain ⟨sy, hsy, hy⟩ := PolySemN.ax_param_le _ _ Y h1.le e1 a3 a4
  exact ⟨sx, sy, hsx, hsy, hx, hy⟩

/-! ## 3. One tree -/

/-- `Low` is monotone in `κ`. -/
theorem low_mono {V : ℕ → E3} {nv : ℕ} {cb : ℝ} {p : E3} {R : M3} {κ κ' : ℝ} (hk : κ' ≤ κ)
    (h : Low V nv cb p R κ) : Low V nv cb p R κ' := by
  rcases h with ⟨μ, l0, hl0, lf, hlf, hμ, hκ⟩ | h
  · exact Or.inl ⟨μ, l0, hl0, lf, hlf, hμ, le_trans hk hκ⟩
  · exact Or.inr h

/-- What the L leaves of one tree need: at every point of the n box and every rotation of an R box
that passes `rInCube`, the bound `κ(n)` of the tree. -/
def LeafLoc (P : Prm) (c : TreeCtx) (k0 k1 k2 : ℤ) : Prop :=
  c.allowL = true → ∀ rb : RBox, rboxWf rb = true → rInCube P c.tube rb = true →
    ∀ sx sy : ℝ, |sx| ≤ 1 → |sy| ≤ 1 → ∀ R ∈ SO3, ∀ u, Charts.ChartPt R P.den rb.ch u →
      InBox rb rb.ch u →
        Low (VV (toProb P)) P.verts.length (c0r (toProb P))
          !₂[nx c.nb sx / P.nd, sgn c.sig * (ny c.nb sy / P.nd), 1] R
          (kapV P k0 k1 k2 (nx c.nb sx / P.nd) (ny c.nb sy / P.nd))

/-- **One tree.** If the R tree of the context `c` (κ = `[k₀, k₁, k₂]`) passes, then at every point
`n = (x, y)` of the box with `p = (x, sgn·y, 1)`, `|sgn·y| ≤ x ≤ 1`, and every `R ∈ SO(3)` with
`MaxRep`, the bound `κ(n)` holds. -/
theorem box_lowT {P : Prm} (h : dtExtraOk P = true) (hkd : 0 < P.kd) {c : TreeCtx} {k0 k1 k2 : ℤ}
    (hk : c.kap = [k0, k1, k2]) (hloc : LeafLoc P c k0 k1 k2) {toks : List Char}
    (hrun : (rtreeL P c toks).1 = true) {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hxy1 : -(nx c.nb sx / P.nd) ≤ sgn c.sig * (ny c.nb sy / P.nd))
    (hxy2 : sgn c.sig * (ny c.nb sy / P.nd) ≤ nx c.nb sx / P.nd)
    (hx1 : nx c.nb sx / P.nd ≤ 1) {R : M3} (hR : R ∈ SO3)
    (hmax : MaxRep (VV (toProb P)) P.verts.length R) :
    Low (VV (toProb P)) P.verts.length (c0r (toProb P))
      !₂[nx c.nb sx / P.nd, sgn c.sig * (ny c.nb sy / P.nd), 1] R
      (kapV P k0 k1 k2 (nx c.nb sx / P.nd) (ny c.nb sy / P.nd)) := by
  have hwf := toProb_wf h
  have hb := toProb_bracket h
  have hK : (0 : ℝ) < 2 ^ P.sqk := by positivity
  have hden : (0 : ℝ) < P.den := by exact_mod_cast hwf.rden
  obtain ⟨ch, hch, u, hcu⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := rtree_coverL P c toks hrun ch hch u
    (fun i => abs_le.2 ⟨(hcu.1 i).1, (hcu.1 i).2⟩)
  obtain ⟨s, hs, hsu⟩ := box_param hwB u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hcu hin.1 hsu
  rcases hgood with ⟨hL, hrin⟩ | ⟨m, hm, hD⟩ | ⟨v0, f0, f1, f3, h0, h1, h3, h4, hA⟩
  · exact hloc hL B hwB hrin sx sy hsx hsy R hR u (hin.1 ▸ hcu) (hin.1 ▸ hin)
  · exfalso
    have htr := disc_traceT h hD hs hNv hent
    obtain ⟨ho, hd, hv⟩ := toProb_krot h hm
    have := hmax _ ⟨ho, hd, hv⟩
    linarith
  · left
    rw [hk] at hA
    refine ⟨dot !₂[nx c.nb sx / P.nd, sgn c.sig * (ny c.nb sy / P.nd), 1] (bT 2), v0, h0,
      ![f0, f1, 0, f3], fun f => ?_, fun f => mu_max hxy1 hxy2 hx1 f, ?_⟩
    · fin_cases f <;> simp [h1, h3, h4]; exact lt_of_le_of_lt (Nat.zero_le _) h0
    · have := accept_lowT c.sig c.nb hwf hb hK hA hs hsx hsy hkd hNv hent hN
      simpa [dualB] using this

/-! ## 4. The pair sum and the far certificate -/

/-- A linear form that is `≥ 0` at the four corners of a box is `≥ 0` on the box. -/
theorem lin_box {a b c l0 h0 l1 h1 : ℤ} (c1 : a * l0 + b * l1 + c ≥ 0) (c2 : a * l0 + b * h1 + c ≥ 0)
    (c3 : a * h0 + b * l1 + c ≥ 0) (c4 : a * h0 + b * h1 + c ≥ 0) {X Y : ℝ}
    (hX : (l0 : ℝ) ≤ X ∧ X ≤ h0) (hY : (l1 : ℝ) ≤ Y ∧ Y ≤ h1) : 0 ≤ (a : ℝ) * X + b * Y + c := by
  have c1' : (0 : ℝ) ≤ (a : ℝ) * l0 + b * l1 + c := by exact_mod_cast c1
  have c2' : (0 : ℝ) ≤ (a : ℝ) * l0 + b * h1 + c := by exact_mod_cast c2
  have c3' : (0 : ℝ) ≤ (a : ℝ) * h0 + b * l1 + c := by exact_mod_cast c3
  have c4' : (0 : ℝ) ≤ (a : ℝ) * h0 + b * h1 + c := by exact_mod_cast c4
  rcases le_total (0 : ℝ) a with ha | ha <;> rcases le_total (0 : ℝ) b with hb | hb
  · nlinarith [mul_le_mul_of_nonneg_left hX.1 ha, mul_le_mul_of_nonneg_left hY.1 hb]
  · nlinarith [mul_le_mul_of_nonneg_left hX.1 ha, mul_le_mul_of_nonpos_left hY.2 hb]
  · nlinarith [mul_le_mul_of_nonpos_left hX.2 ha, mul_le_mul_of_nonneg_left hY.1 hb]
  · nlinarith [mul_le_mul_of_nonpos_left hX.2 ha, mul_le_mul_of_nonpos_left hY.2 hb]

/-- **The local hypothesis on the boxes of the leaves** (form `0 = A`, `1 = B`; the tree of the
point `p = σ^sig n`): if the n box passes `inside` for the tube of the form and the R box passes
`rInCube`, the bound of the tube form `kapForm P form sig` holds there. -/
def HLocB (P : Prm) : Prop :=
  ∀ (form sig : ℕ), form ≤ 1 → sig ≤ 1 → ∀ nb : NB, nbWf nb = true →
    inside P (tubeOf P form) [nb.l0, nb.h0]
      (if sig = 0 then [nb.l1, nb.h1] else [-nb.h1, -nb.l1]) = true →
    ∀ rb : RBox, rboxWf rb = true → rInCube P (tubeOf P form) rb = true →
    ∀ sx sy : ℝ, |sx| ≤ 1 → |sy| ≤ 1 → ∀ R ∈ SO3, ∀ u, Charts.ChartPt R P.den rb.ch u →
      InBox rb rb.ch u →
        Low (VV (toProb P)) P.verts.length (c0r (toProb P))
          !₂[nx nb sx / P.nd, sgn sig * (ny nb sy / P.nd), 1] R
          (kapV P (nth (kapForm P form sig) 0 0) (nth (kapForm P form sig) 1 0)
            (nth (kapForm P form sig) 2 0) (nx nb sx / P.nd) (ny nb sy / P.nd))

theorem treeKap_eq (P : Prm) (form sig : ℕ) (off : ℤ) :
    treeKap P form sig off = [nth (kapForm P form sig) 0 0, nth (kapForm P form sig) 1 0,
      nth (kapForm P form sig) 2 0 + off * ((P.kd / P.koff : ℕ) : ℤ)] := rfl

/-- The L leaves of a tree of `boxRunL` (offset `off ≤ 0`) from `HLocB`. -/
theorem leafLoc_of {P : Prm} (hloc : HLocB P) (hkd : 0 < P.kd) {form sig : ℕ} (hform : form ≤ 1) (hsig : sig ≤ 1)
    {nb : NB} (hnw : nbWf nb = true) {off : ℤ} {tube : Tube} (ht : tube = tubeOf P form)
    (allowL : Bool)
    (hal : allowL = true → inside P (tubeOf P form) [nb.l0, nb.h0]
      (if sig = 0 then [nb.l1, nb.h1] else [-nb.h1, -nb.l1]) = true ∧ off ≤ 0) :
    LeafLoc P ⟨sig, nb, treeKap P form sig off, allowL, tube⟩ (nth (kapForm P form sig) 0 0)
      (nth (kapForm P form sig) 1 0) (nth (kapForm P form sig) 2 0 + off * ((P.kd / P.koff : ℕ) : ℤ)) := by
  intro hL rb hrw hrin sx sy hsx hsy R hR u hcu hin
  obtain ⟨hins, hoff⟩ := hal hL
  subst ht
  have h := hloc form sig hform hsig nb hnw hins rb hrw hrin sx sy hsx hsy R hR u hcu hin
  refine low_mono ?_ h
  have hkd' : (0 : ℝ) < P.kd := by exact_mod_cast hkd
  have : ((off * ((P.kd / P.koff : ℕ) : ℤ) : ℤ) : ℝ) ≤ 0 := by
    have : off * ((P.kd / P.koff : ℕ) : ℤ) ≤ 0 :=
      Int.mul_nonpos_of_nonpos_of_nonneg hoff (by positivity)
    exact_mod_cast this
  simp only [kapV]
  apply div_le_div_of_nonneg_right _ hkd'.le
  push_cast at this ⊢
  linarith

/-- **The far certificate.** With the n tree, all the pair boxes and the local hypothesis `HLocB`,
the far data of `D45DT` give `TetCert (VV (toProb P)) nv c̄`. -/
theorem far_certT {P : Prm} (h : dtExtraOk P = true) (hkd : 0 < P.kd) (hloc : HLocB P)
    {ntoks : List Char} {recs : List FBoxL}
    (hn : (ntreeRunL P.nd ntoks (recs.map fun r => cornersN r.nb)).1 = true)
    (hb : ∀ r ∈ recs, (boxRunL P r).1 = true) :
    TetCert (VV (toProb P)) P.verts.length (c0r (toProb P)) := by
  have hwf := toProb_wf h
  intro x y hy hyx hx
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hwf.nden
  obtain ⟨bk, hbk, hin⟩ := ntree_coverL hn (X := x * P.nd) (Y := y * P.nd)
    (by positivity) (by nlinarith) (by nlinarith)
  obtain ⟨r, hrm, rfl⟩ := List.mem_map.1 hbk
  have hro := hb r hrm
  unfold boxRunL at hro
  simp only [Bool.and_eq_true, decide_eq_true_eq] at hro
  obtain ⟨⟨⟨⟨⟨hnw, hmode⟩, hsum⟩, _⟩, hrU⟩, hrL⟩ := hro
  obtain ⟨sx, sy, hsx, hsy, hx', hy'⟩ := nb_param hnw hin
  have ex : nx r.nb sx / P.nd = x := by rw [hx']; field_simp
  have ey : ny r.nb sy / P.nd = y := by rw [hy']; field_simp
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
  · have hl := box_lowT (c := ⟨0, r.nb, treeKap P fU 0 r.offU, _, tubeOf P fU⟩) h hkd
      (treeKap_eq P fU 0 r.offU)
      (leafLoc_of hloc hkd (by rw [hfU]; split <;> norm_num) (by norm_num) hnw rfl _ (fun hal => by
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hal; simpa using hal)) hrU hsx hsy
      (by simp only [sgn]; rw [ex, ey]; simp; linarith) (by simp only [sgn]; rw [ex, ey]; simp; linarith)
      (by rw [ex]; exact hx) hR hmax
    simp only [sgn, ex, ey] at hl
    simpa [kapV] using hl
  · have hl := box_lowT (c := ⟨1, r.nb, treeKap P fL 1 r.offL, _, tubeOf P fL⟩) h hkd
      (treeKap_eq P fL 1 r.offL)
      (leafLoc_of hloc hkd (by rw [hfL]; split <;> norm_num) (by norm_num) hnw rfl _ (fun hal => by
        simp only [Bool.and_eq_true, decide_eq_true_eq] at hal; simpa using hal)) hrL hsx hsy
      (by simp only [sgn]; rw [ex, ey]; simp; linarith) (by simp only [sgn]; rw [ex, ey]; simp; linarith)
      (by rw [ex]; exact hx) hR hmax
    simp only [sgn, ex, ey] at hl
    simpa [kapV] using hl

end

#assert_std_axioms PackLean.Formal.DTCover.far_certT PackLean.Formal.DTCover.rtree_coverL
  PackLean.Formal.DTCover.ntree_coverL

end PackLean.Formal.DTCover
