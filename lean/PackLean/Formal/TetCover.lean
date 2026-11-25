import PackLean.Formal.TetFar
import PackLean.Formal.TetReduction
import PackLean.Formal.CoverTreeG
import PackLean.Formal.Charts

/-!
# A9 stage 7b (part 2): the trees of `D28.Core` give `TetCert`

Design: `plan/A9f_tet_design.md` §4, §8 (7b-2).  The far checker of `D28.Core` has two levels of
box trees:

* the **n tree** (`ntreeOk`): the square `[0, nden]²` of directions `(X, Y) = nden · (x, y)` is split
  into boxes; a leaf `out` lies above the diagonal (`l1 > h0`, no point with `y ≤ x`), a leaf `ok` is
  matched in order with the list of boxes of the pairs (`ntree_cover`);
* for every pair `(N, σN)` (`pairOk`), the **R tree** of `N` and of its mirror `σN` (the four
  quaternion charts, `rtree_cover`), with leaves `A` (accepted, `TetFar.accept_low`), `D`
  (discarded, `TetFar.disc_trace`) and `L` (local; the hypothesis `HLoc`).

`far_cert`: with `HLoc` (the local region, stage 7b-3), the far data give
`TetReduction.TetCert (VV P) nv (c0r P)`: at `p = (x, y, 1)` the bound is `κ_A = k + β y` (the box
`N` that contains `(x, y)`), at `σp = (x, -y, 1)` it is `κ_B = k' - β y` (the mirror box), and
`k + k' = 0`.
-/

namespace PackLean.Formal.TetCover

open PackLean.D28 (FE RBox rboxWf rboxQ rotQ split3 nth Prob NBox nboxWf Tok leafOk WState wstep rRoots
  rtreeRun Pair mirror pairRuns pairOk NTok NState nstep split2 ntreeOk farLb discLb nInsideL rInsideL
  rotsOk)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.FarG (mat)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The R tree -/

/-- What a leaf of the R tree of the direction box `nb` certifies. -/
def Good (P : Prob) (nb : NBox) (inL : Bool) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((inL = true ∧ nb.knum = 0 ∧ rInsideL P b = true) ∨
     (∃ m, m < P.rots.length ∧ discLb P b m > 0) ∨
     (∃ v0 f0 f1 f2 f3, v0 < P.verts.length ∧ f0 < P.verts.length ∧ f1 < P.verts.length ∧
        f2 < P.verts.length ∧ f3 < P.verts.length ∧ farLb P nb b v0 [f0, f1, f2, f3] ≥ 0))

theorem wstep_ok_false (P : Prob) (nb : NBox) (inL : Bool) (s : WState) (t : Tok)
    (h : s.ok = false) : (wstep P nb inL s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstep, hst, h]

theorem foldl_ok_false (P : Prob) (nb : NBox) (inL : Bool) :
    ∀ (toks : List Tok) (s : WState), s.ok = false →
      (toks.foldl (wstep P nb inL) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstep_ok_false P nb inL s t h)

theorem leaf_good (P : Prob) (nb : NBox) (inL : Bool) (b : RBox) (t : Tok) (ht : t ≠ .split)
    (hw : rboxWf b = true) (hl : leafOk P nb inL b t = true) : Good P nb inL b := by
  refine ⟨hw, ?_⟩
  cases t with
  | split => exact absurd rfl ht
  | L =>
    simp only [leafOk, Bool.and_eq_true, beq_iff_eq] at hl
    exact Or.inl ⟨hl.1.1, hl.1.2, hl.2⟩
  | D m =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inl ⟨m, hl.1, hl.2⟩)
  | A v0 f0 f1 f2 f3 =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    obtain ⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩, h5⟩ := hl
    exact Or.inr (Or.inr ⟨v0, f0, f1, f2, f3, h0, h1, h2, h3, h4, h5⟩)

/-- **Tree soundness** (as `CoverTreeG.run_cover`). -/
theorem run_cover (P : Prob) (nb : NBox) (inL : Bool) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstep P nb inL) s).ok = true →
      (toks.foldl (wstep P nb inL) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, Good P nb inL B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstep P nb inL s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P nb inL toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstep P nb inL s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstep, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          have : (wstep P nb inL s .L).ok = (s.ok && rboxWf B && leafOk P nb inL B .L) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb inL B .L (by simp) hok'.1.2 hok'.2, hz⟩
        | D m =>
          have : (wstep P nb inL s (.D m)).ok = (s.ok && rboxWf B && leafOk P nb inL B (.D m)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb inL B (.D m) (by simp) hok'.1.2 hok'.2, hz⟩
        | A v0 f0 f1 f2 f3 =>
          have : (wstep P nb inL s (.A v0 f0 f1 f2 f3)).ok
              = (s.ok && rboxWf B && leafOk P nb inL B (.A v0 f0 f1 f2 f3)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb inL B (.A v0 f0 f1 f2 f3) (by simp) hok'.1.2 hok'.2, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstep P nb inL s t).stack := by
          intro C hC; cases t <;> simp [wstep, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The R tree of a direction box.** If `rtreeRun` passes, the box `nb` is well formed and every
point `(ch, y)` with `ch < 4`, `|y i| ≤ rden` lies in a good leaf of chart `ch`. -/
theorem rtree_cover (P : Prob) (nb : NBox) (toks : List Tok) (h : (rtreeRun P nb toks).ok = true) :
    nboxWf nb = true ∧ ∀ (ch : ℕ), ch < 4 → ∀ (y : Fin 3 → ℝ), (∀ i, |y i| ≤ (P.rden : ℝ)) →
      ∃ B, Good P nb (nInsideL P nb) B ∧ InBox B ch y := by
  simp only [rtreeRun, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨h1, h2⟩ := h
  refine ⟨?_, fun ch hch y hy => ?_⟩
  · by_contra hc
    rw [Bool.not_eq_true] at hc
    rw [foldl_ok_false P nb _ toks _ hc] at h1
    exact Bool.false_ne_true h1
  refine run_cover P nb _ toks _ h1 h2 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden, P.rden⟩,
    ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-! ## 2. The n tree -/

/-- The point `(X, Y)` (in `nden` units) lies in the box with corners `(l0, l1)`, `(h0, h1)`. -/
def InN (b : ℤ × ℤ × ℤ × ℤ) (X Y : ℝ) : Prop :=
  (b.1 : ℝ) ≤ X ∧ X ≤ b.2.2.1 ∧ (b.2.1 : ℝ) ≤ Y ∧ Y ≤ b.2.2.2

def corners (b : NBox) : ℤ × ℤ × ℤ × ℤ := (b.l0, b.l1, b.h0, b.h1)

theorem nstep_ok_false (s : NState) (t : NTok) (h : s.ok = false) : (nstep s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩
  · simp [nstep, hst, h]
  · cases t with
    | split => simp [nstep, hst, h]
    | out => simp [nstep, hst, h]
    | ok => rcases hb : s.boxes with _ | ⟨x, bs⟩ <;> simp [nstep, hst, hb, h]

theorem nfoldl_ok_false : ∀ (toks : List NTok) (s : NState), s.ok = false →
    (toks.foldl nstep s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (nstep_ok_false s t h)

theorem split2_cover (b : NBox) (X Y : ℝ) (h : InN (corners b) X Y) :
    InN (corners (split2 b).1) X Y ∨ InN (corners (split2 b).2) X Y := by
  obtain ⟨a1, a2, a3, a4⟩ := h
  simp only [corners] at a1 a2 a3 a4
  simp only [split2]
  split_ifs
  · rcases le_total X (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, hz, a3, a4⟩
    · right; exact ⟨hz, a2, a3, a4⟩
  · rcases le_total Y (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, a2, a3, hz⟩
    · right; exact ⟨a1, a2, hz, a4⟩

/-- Every remaining list of boxes is a tail of the first. -/
theorem nstep_boxes (s : NState) (t : NTok) : ∀ x ∈ (nstep s t).boxes, x ∈ s.boxes := by
  intro x hx
  rcases hst : s.stack with _ | ⟨b, rest⟩
  · simp [nstep, hst] at hx; exact hx
  · cases t with
    | split => simp [nstep, hst] at hx; exact hx
    | out => simp [nstep, hst] at hx; exact hx
    | ok =>
      rcases hb : s.boxes with _ | ⟨y, bs⟩
      · simp [nstep, hst, hb] at hx
      · simp [nstep, hst, hb] at hx; exact List.mem_cons_of_mem _ hx

theorem nfoldl_boxes : ∀ (toks : List NTok) (s : NState), ∀ x ∈ (toks.foldl nstep s).boxes,
    x ∈ s.boxes := by
  intro toks
  induction toks with
  | nil => intro s x hx; simpa using hx
  | cons t toks ih => intro s x hx; exact nstep_boxes s t x (ih _ x hx)

/-- **n tree soundness.** If the run ends with `ok` and an empty stack, every point `(X, Y)` with
`Y ≤ X` of a box on the stack lies in one of the listed boxes. -/
theorem nrun_cover : ∀ (toks : List NTok) (s : NState), (toks.foldl nstep s).ok = true →
    (toks.foldl nstep s).stack = [] → ∀ X Y : ℝ, Y ≤ X →
      (∃ B ∈ s.stack, InN (corners B) X Y) → ∃ b ∈ s.boxes, InN b X Y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst X Y _ ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst X Y hYX ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (nstep s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [nfoldl_ok_false toks _ hc] at hok
      exact Bool.false_ne_true hok
    have hsub : ∀ b ∈ (nstep s t).boxes, b ∈ s.boxes := nstep_boxes s t
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (nstep s .split).stack = (split2 B).1 :: (split2 B).2 :: rest := by
            simp [nstep, hs]
          obtain ⟨b', hb', hin⟩ := ih _ hok hst X Y hYX (by
            rw [hs']
            rcases split2_cover B X Y hz with h | h
            · exact ⟨_, by simp, h⟩
            · exact ⟨_, by simp, h⟩)
          exact ⟨b', hsub _ hb', hin⟩
        | out =>
          have : (nstep s .out).ok = (s.ok && decide (B.l1 > B.h0)) := by simp [nstep, hs]
          rw [this, Bool.and_eq_true, decide_eq_true_eq] at hok'
          obtain ⟨_, a2, a3, _⟩ := hz
          simp only [corners] at a2 a3
          have : ((B.h0 : ℤ) : ℝ) < B.l1 := by exact_mod_cast hok'.2
          linarith
        | ok =>
          rcases hb : s.boxes with _ | ⟨x, bs⟩
          · have : (nstep s .ok).ok = false := by simp [nstep, hs, hb]
            rw [this] at hok'; exact absurd hok' (by simp)
          · obtain ⟨a0, a1, a2, a3⟩ := x
            have : (nstep s .ok).ok = (s.ok && a0 == B.l0 && a1 == B.l1 && a2 == B.h0 && a3 == B.h1) := by
              simp [nstep, hs, hb]
            rw [this] at hok'
            simp only [Bool.and_eq_true, beq_iff_eq] at hok'
            obtain ⟨⟨⟨⟨_, e0⟩, e1⟩, e2⟩, e3⟩ := hok'
            refine ⟨(a0, a1, a2, a3), by simp, ?_⟩
            subst e0 e1 e2 e3
            exact hz
      · obtain ⟨b', hb', hin⟩ := ih _ hok hst X Y hYX ⟨B, by
          cases t with
          | split => simp [nstep, hs, hBr]
          | out => simp [nstep, hs, hBr]
          | ok => rcases hb : s.boxes with _ | ⟨x, bs⟩ <;> simp [nstep, hs, hb, hBr], hz⟩
        exact ⟨b', hsub _ hb', hin⟩

/-- **The n tree.** If `ntreeOk` passes, every point of `[0, nden]²` with `Y ≤ X` lies in a listed
box. -/
theorem ntree_cover {nden : ℤ} {toks : List NTok} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : ntreeOk nden toks boxes = true) {X Y : ℝ} (hX0 : 0 ≤ Y) (hYX : Y ≤ X) (hX : X ≤ nden) :
    ∃ b ∈ boxes, InN b X Y := by
  simp only [ntreeOk, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨⟨h1, h2⟩, _⟩ := h
  exact nrun_cover toks _ h1 h2 X Y hYX ⟨⟨0, 0, nden, nden, 0, 1⟩, by simp,
    ⟨by simp [corners]; linarith, by simpa [corners] using hX, by simpa [corners] using hX0,
      by simp [corners]; linarith⟩⟩

/-! ## 3. Points of the boxes -/

/-- Every point of a well-formed direction box is `(nx sx, ny sy)` with `|sx|, |sy| ≤ 1`. -/
theorem nbox_param {nb : NBox} (hw : nboxWf nb = true) {X Y : ℝ} (h : InN (corners nb) X Y) :
    ∃ sx sy : ℝ, |sx| ≤ 1 ∧ |sy| ≤ 1 ∧ nx nb sx = X ∧ ny nb sy = Y := by
  simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hw
  obtain ⟨⟨⟨⟨h0, h1⟩, e0⟩, e1⟩, _⟩ := hw
  obtain ⟨a1, a2, a3, a4⟩ := h
  simp only [corners] at a1 a2 a3 a4
  have key : ∀ l h : ℤ, l < h → (h - l) % 2 = 0 → ∀ Z : ℝ, (l : ℝ) ≤ Z → Z ≤ h →
      ∃ σ : ℝ, |σ| ≤ 1 ∧ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * σ = Z := by
    intro l h hlh he Z hl hh
    obtain ⟨k, hk⟩ : ∃ k, h - l = 2 * k := ⟨(h - l) / 2, by omega⟩
    have e1 : (l + h) / 2 = l + k := by omega
    have e2 : (h - l) / 2 = k := by omega
    have hkp : (0 : ℝ) < k := by have : 0 < k := by omega
                                 exact_mod_cast this
    have hk' : (h : ℝ) = l + 2 * k := by
      have : h = l + 2 * k := by omega
      rw [this]; push_cast; ring
    refine ⟨(Z - (l + k)) / k, ?_, ?_⟩
    · rw [abs_le]; constructor
      · rw [le_div_iff₀ hkp]; linarith
      · rw [div_le_iff₀ hkp]; linarith
    · rw [e1, e2]; push_cast; field_simp; ring
  obtain ⟨sx, hsx, hx⟩ := key _ _ h0 e0 X a1 a2
  obtain ⟨sy, hsy, hy⟩ := key _ _ h1 e1 Y a3 a4
  exact ⟨sx, sy, hsx, hsy, hx, hy⟩

/-- The rotation of a chart point, entry by entry in the box coordinate `s` (`FarG.box_entries` for
the `D28` data). -/
theorem box_entries {den : ℤ} {R : M3} {ch : ℕ} {u : Fin 3 → ℝ} (hc : Charts.ChartPt R den ch u)
    {B : RBox} (hB : B.ch = ch) {s : Fin 3 → ℝ} (hsu : ∀ i, bu B s i = u i) :
    ∃ Nv : ℝ, 0 < Nv ∧ qEval (rotQ (rboxQ den B)).2 s = Nv ∧
      ∀ i j : Fin 3, qEval (nth (rotQ (rboxQ den B)).1 (3 * i.val + j.val) []) s = Nv * R i j := by
  obtain ⟨_, hN, hlist⟩ := hc
  obtain ⟨h1, h2⟩ := rotQ_rboxQ s den B
  simp only [hB, hsu] at h1 h2
  refine ⟨_, hN, h2, fun i j => ?_⟩
  obtain ⟨wq, xq, yq, zq, hq⟩ := rboxQ_four den B
  have hl := (rotQ_length wq xq yq zq).1
  rw [← hq] at hl
  rw [FarG.map_nth h1 (by rw [hl]; omega), hlist]
  fin_cases i <;> fin_cases j <;> rfl

/-! ## 4. The local hypothesis and the far certificate -/

/-- **The local region** (stage 7b-3): at every direction of a direction box inside the local range
`LN` and every rotation of an R box inside a local box, the dual bound is at least `β y`. -/
def HLoc (P : Prob) : Prop :=
  ∀ nb : NBox, nboxWf nb = true → nInsideL P nb = true →
  ∀ rb : RBox, rboxWf rb = true → rInsideL P rb = true →
  ∀ sx sy : ℝ, |sx| ≤ 1 → |sy| ≤ 1 → ∀ R ∈ SO3, ∀ u, Charts.ChartPt R P.rden rb.ch u →
    InBox rb rb.ch u →
      Low (VV P) P.verts.length (c0r P) !₂[nx nb sx / P.nden, ny nb sy / P.nden, 1] R
        (betar P * (ny nb sy / P.nden))

/-- The constants of the far checks (checked once per case). -/
structure FarConsts (P : Prob) : Prop where
  wf : WF P
  sqb : PackLean.D28.sqbOk P = true
  rots : rotsOk P = true

theorem dot_bT (x y : ℝ) (f : Fin 4) :
    dot !₂[x, y, 1] (bT f) = match f with
      | 0 => -x - y - 1 | 1 => -x + y + 1 | 2 => x - y + 1 | 3 => x + y - 1 := by
  fin_cases f <;> simp [dot, bT, Fin.sum_univ_three] <;> ring

/-- At a direction `p = (x, y, 1)` with `|y| ≤ x ≤ 1`, the weight `μ = p · b₂` is the largest. -/
theorem mu_max {x y : ℝ} (h1 : -x ≤ y) (h2 : y ≤ x) (h3 : x ≤ 1) (f : Fin 4) :
    dot !₂[x, y, 1] (bT f) ≤ dot !₂[x, y, 1] (bT 2) := by
  rw [dot_bT, dot_bT]
  fin_cases f <;> simp <;> linarith

/-- **One direction box.** If the R tree of the box `nb` passes, then at every direction
`p = (x, y, 1)` of the box with `|y| ≤ x ≤ 1` and every `R ∈ SO(3)` with `MaxRep`, the bound
`k + β y` holds (with the local hypothesis). -/
theorem box_low {P : Prob} (hc : FarConsts P) (hloc : HLoc P) {nb : NBox} {toks : List Tok}
    (hrun : (rtreeRun P nb toks).ok = true) {sx sy : ℝ} (hsx : |sx| ≤ 1) (hsy : |sy| ≤ 1)
    (hxy1 : -(nx nb sx / P.nden) ≤ ny nb sy / P.nden) (hxy2 : ny nb sy / P.nden ≤ nx nb sx / P.nden)
    (hx1 : nx nb sx / P.nden ≤ 1) {R : M3} (hR : R ∈ SO3)
    (hmax : MaxRep (VV P) P.verts.length R) :
    Low (VV P) P.verts.length (c0r P) !₂[nx nb sx / P.nden, ny nb sy / P.nden, 1] R
      ((nb.knum : ℝ) / nb.kden + betar P * (ny nb sy / P.nden)) := by
  have hwf := hc.wf
  have hb := bracket_of_sqbOk hwf hc.sqb
  have hK : (0 : ℝ) < 2 ^ P.sqk := by positivity
  obtain ⟨hnw, hcov⟩ := rtree_cover P nb toks hrun
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hwf.rden
  obtain ⟨ch, hch, u, hcu⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := hcov ch hch u (fun i => abs_le.2 ⟨(hcu.1 i).1, (hcu.1 i).2⟩)
  obtain ⟨s, hs, hsu⟩ := box_param hwB u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hcu hin.1 hsu
  have hkd : 0 < nb.kden := by
    simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq] at hnw; exact hnw.2
  rcases hgood with ⟨hL, hk0, hrin⟩ | ⟨m, hm, hD⟩ | ⟨v0, f0, f1, f2, f3, h0, h1, h2, h3, h4, hA⟩
  · have hl := hloc nb hnw hL B hwB hrin sx sy hsx hsy R hR u (hin.1 ▸ hcu) (hin.1 ▸ hin)
    rw [hk0]
    simpa using hl
  · exfalso
    have htr := disc_trace hwf hb hK hD hs hNv hent
    obtain ⟨ho, hd, hv⟩ := rots_krot hwf hc.rots hm
    have := hmax _ ⟨ho, hd, hv⟩
    linarith
  · left
    refine ⟨dot !₂[nx nb sx / P.nden, ny nb sy / P.nden, 1] (bT 2), v0, h0, ![f0, f1, f2, f3],
      fun f => ?_, fun f => mu_max hxy1 hxy2 hx1 f, ?_⟩
    · fin_cases f <;> simpa
    · have := accept_low nb hwf hb hK hA hs hsx hsy hkd hNv hent hN
      simpa [dualB] using this

/-- **The far certificate.** With the n tree, the pairs and the local hypothesis, the far data give
`TetCert (VV P) nv (c0r P)`. -/
theorem far_cert {P : Prob} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {pairs : List Pair} (hn : ntreeOk P.nden ntoks (pairs.map fun p => corners p.nb) = true)
    (hp : ∀ p ∈ pairs, pairOk P p = true) :
    TetCert (VV P) P.verts.length (c0r P) := by
  have hwf := hc.wf
  intro x y hy hyx hx
  have hnd : (0 : ℝ) < P.nden := by exact_mod_cast hwf.nden
  obtain ⟨b, hb, hin⟩ := ntree_cover hn (X := x * P.nden) (Y := y * P.nden)
    (by positivity) (by nlinarith) (by nlinarith)
  obtain ⟨p, hpm, rfl⟩ := List.mem_map.1 hb
  have hpo := hp p hpm
  simp only [pairOk, pairRuns, Bool.and_eq_true, decide_eq_true_eq] at hpo
  obtain ⟨⟨⟨hkm, hsum⟩, hrA⟩, hrB⟩ := hpo
  obtain ⟨hnwA, _⟩ := rtree_cover P _ _ hrA
  obtain ⟨hnwB, _⟩ := rtree_cover P _ _ hrB
  obtain ⟨sx, sy, hsx, hsy, hx', hy'⟩ := nbox_param hnwA hin
  -- the mirror box contains `(x, -y)`
  have hinB : InN (corners (mirror p.nb p.kmNum p.kmDen)) (x * P.nden) (-(y * P.nden)) := by
    obtain ⟨a1, a2, a3, a4⟩ := hin
    simp only [corners, mirror] at a1 a2 a3 a4 ⊢
    refine ⟨a1, a2, ?_, ?_⟩ <;> push_cast <;> linarith
  obtain ⟨sx', sy', hsx', hsy', hx'', hy''⟩ := nbox_param hnwB hinB
  have ex : nx p.nb sx / P.nden = x := by rw [hx']; field_simp
  have ey : ny p.nb sy / P.nden = y := by rw [hy']; field_simp
  have ex' : nx (mirror p.nb p.kmNum p.kmDen) sx' / P.nden = x := by rw [hx'']; field_simp
  have ey' : ny (mirror p.nb p.kmNum p.kmDen) sy' / P.nden = -y := by rw [hy'']; field_simp
  have hkA : (0 : ℝ) < p.nb.kden := by
    simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq] at hnwA; exact_mod_cast hnwA.2
  have hkB : (0 : ℝ) < p.kmDen := by exact_mod_cast hkm
  refine ⟨(p.nb.knum : ℝ) / p.nb.kden + betar P * y, (p.kmNum : ℝ) / p.kmDen + betar P * (-y),
    ?_, fun R hR hmax => ?_, fun R hR hmax => ?_⟩
  · have hs' : ((p.nb.knum * p.kmDen + p.kmNum * p.nb.kden : ℤ) : ℝ) = 0 := by exact_mod_cast hsum
    push_cast at hs'
    have : (p.nb.knum : ℝ) / p.nb.kden + p.kmNum / p.kmDen = 0 := by
      field_simp; linarith
    linarith
  · have := box_low hc hloc hrA hsx hsy (by rw [ex, ey]; linarith) (by rw [ex, ey]; linarith)
      (by rw [ex]; linarith) hR hmax
    rw [ex, ey] at this
    exact this
  · have := box_low hc hloc hrB hsx' hsy' (by rw [ex', ey']; linarith) (by rw [ex', ey']; linarith)
      (by rw [ex']; linarith) hR hmax
    rw [ex', ey'] at this
    simpa [mirror] using this

end

#assert_std_axioms PackLean.Formal.TetCover.far_cert PackLean.Formal.TetCover.ntree_cover
  PackLean.Formal.TetCover.rtree_cover

end PackLean.Formal.TetCover
