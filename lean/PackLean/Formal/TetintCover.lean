import PackLean.Formal.TetintFar
import PackLean.Formal.OctCover

/-!
# A9 stage 7e (part 2): the trees of `D40.Core` give `TetCert` (tetintet)

Design: `plan/A9f_tet_design.md` §4 and §10.  The far checker of `D40.Core` has two levels of trees:

* the **n tree** (`ntreeRun`): the square `[0, nd]²` of `(H, K) = nd · (h, k′)` (`h = 1 − x`,
  `k′ = x − y`) is split into boxes; a leaf `out` lies in `H + K ≥ nd` (outside the upper half of
  `D_n` but for its edge), a leaf `ok` is matched in order with the list of boxes (`ntree_cover_le`);
* for every listed box `N` (with its constant `k_N`), **two R trees** (`nbRun … 0` for the side `A`,
  the point `p = (x, y, 1)`, and `nbRun … 1` for the side `B`, the point `σp = (x, −y, 1)`) with
  leaves `A` (`TetintFar.accept_FM`, `accept_S`), `D` (`disc_trace`) and `L c` (the seven local
  centres, hypothesis `HLoc`, stage 7e-3).

`far_cert`: with `HLoc`, the far data give `TetReduction.TetCert VD 4 (s̄/2)` with the pair
`κ_A = κ_N(h, k′)`, `κ_B = −κ_N(h, k′)` of the box that contains `(h, k′)`.  The case split
`s₁(R) ≤ s̄` does not appear: the weights of types F and M are valid for every `R`.
-/

namespace PackLean.Formal.TetintCover

open PackLean.D40 (Prm RBox rboxWf rboxQ rotQ split3 nth NBox nboxWf Tok leafOk lOk WState wstep
  rRoots nbRun NTok NState nstep split2 ntreeRun farAccept discLb decCand candOk nInN1 nInP
  overlapsN1 rInCube leR ltR RatI Cen)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open PackLean.Formal.OctCover (InN corners isClosed_InN split2_cover)
open PackLean.D28 (rotIntOk)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The R tree -/

/-- The box `b` of `D40` as a box of `OctFar` (`cvB`). -/
abbrev InB (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) : Prop := OctFar.InBox (cvB b) ch y

theorem split3_cover (b : RBox) (ch : ℕ) (y : Fin 3 → ℝ) (h : InB b ch y) :
    InB (split3 b).1 ch y ∨ InB (split3 b).2 ch y := by
  obtain ⟨hc, hy⟩ := h
  have h0 := hy 0; have h1 := hy 1; have h2 := hy 2
  simp only [QuadSem.bLo, QuadSem.bHi, OctFar.toD28, cvB, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons] at h0 h1 h2
  have key : ∀ (b' : RBox), b'.ch = ch → (b'.l0 : ℝ) ≤ y 0 → y 0 ≤ b'.h0 → (b'.l1 : ℝ) ≤ y 1 →
      y 1 ≤ b'.h1 → (b'.l2 : ℝ) ≤ y 2 → y 2 ≤ b'.h2 → InB b' ch y := by
    intro b' hc' a1 a2 a3 a4 a5 a6
    refine ⟨hc', fun i => ?_⟩
    fin_cases i <;> simp [QuadSem.bLo, QuadSem.bHi, OctFar.toD28, cvB] <;> constructor <;> assumption
  simp only [OctFar.toD28, cvB] at hc
  simp only [split3]
  split_ifs
  · rcases le_total (y 0) (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 hz h1.1 h1.2 h2.1 h2.2
    · right; exact key _ hc hz h0.2 h1.1 h1.2 h2.1 h2.2
  · rcases le_total (y 1) (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 hz h2.1 h2.2
    · right; exact key _ hc h0.1 h0.2 hz h1.2 h2.1 h2.2
  · rcases le_total (y 2) (((b.l2 + b.h2) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact key _ hc h0.1 h0.2 h1.1 h1.2 h2.1 hz
    · right; exact key _ hc h0.1 h0.2 h1.1 h1.2 hz h2.2

/-- What a leaf of the R tree (side `side`, direction box `nb`, constant `kN`) certifies. -/
def Good (P : Prm) (side : ℕ) (nb : NBox) (kN : RatI) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((∃ c, lOk P side nb b c = true) ∨
     (∃ m, m < P.rots.length ∧ discLb (rotQ (rboxQ P.den b)).1 (nth P.rots m []) > 0) ∨
     (∃ code, farAccept P side nb kN (rotQ (rboxQ P.den b)) code = true))

variable (P : Prm) (side : ℕ) (nb : NBox) (kN : RatI)

theorem wstep_ok_false (s : WState) (t : Tok) (h : s.ok = false) :
    (wstep P side nb kN s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstep, hst, h]

theorem foldl_ok_false :
    ∀ (toks : List Tok) (s : WState), s.ok = false →
      (toks.foldl (wstep P side nb kN) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstep_ok_false P side nb kN s t h)

theorem leaf_good (b : RBox) (t : Tok) (ht : t ≠ .split)
    (hw : rboxWf b = true) (hl : leafOk P side nb kN b t = true) : Good P side nb kN b := by
  refine ⟨hw, ?_⟩
  cases t with
  | split => exact absurd rfl ht
  | L c =>
    simp only [leafOk] at hl
    exact Or.inl ⟨c, hl⟩
  | D m =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inl ⟨m, hl.1, hl.2⟩)
  | A code =>
    simp only [leafOk] at hl
    exact Or.inr (Or.inr ⟨code, hl⟩)

/-- **Tree soundness** (as `OctCover.run_cover`). -/
theorem run_cover :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstep P side nb kN) s).ok = true →
      (toks.foldl (wstep P side nb kN) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InB B ch y) → ∃ B, Good P side nb kN B ∧ InB B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstep P side nb kN s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P side nb kN toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstep P side nb kN s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstep, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L c =>
          have : (wstep P side nb kN s (.L c)).ok
              = (s.ok && rboxWf B && leafOk P side nb kN B (.L c)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P side nb kN B (.L c) (by simp) hok'.1.2 hok'.2, hz⟩
        | D m =>
          have : (wstep P side nb kN s (.D m)).ok
              = (s.ok && rboxWf B && leafOk P side nb kN B (.D m)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P side nb kN B (.D m) (by simp) hok'.1.2 hok'.2, hz⟩
        | A code =>
          have : (wstep P side nb kN s (.A code)).ok
              = (s.ok && rboxWf B && leafOk P side nb kN B (.A code)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P side nb kN B (.A code) (by simp) hok'.1.2 hok'.2, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstep P side nb kN s t).stack := by
          intro C hC; cases t <;> simp [wstep, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The R tree of a direction box and a side.** If `nbRun` passes: the precondition (box well
formed, `k_N` with a positive denominator, `side < 2`, `k_N = 0` on boxes meeting `N₁`) and every
point `(ch, y)` with `ch < 4`, `|y i| ≤ den` lies in a good leaf of chart `ch`. -/
theorem rtree_cover (toks : List Tok) (h : (nbRun P nb side kN toks).1 = true) :
    (nboxWf nb = true ∧ 0 < kN.2 ∧ side < 2 ∧ (kN.1 = 0 ∨ overlapsN1 P nb = false)) ∧
    ∀ (ch : ℕ), ch < 4 → ∀ (y : Fin 3 → ℝ), (∀ i, |y i| ≤ (P.den : ℝ)) →
      ∃ B, Good P side nb kN B ∧ InB B ch y := by
  simp only [nbRun, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨h1, h2⟩ := h
  refine ⟨?_, fun ch hch y hy => ?_⟩
  · by_contra hc
    have hpre : (nboxWf nb && decide (kN.2 > 0) && decide (side < 2) &&
        (kN.1 == 0 || !(overlapsN1 P nb))) = false := by
      rw [Bool.eq_false_iff]
      intro he
      simp only [Bool.and_eq_true, decide_eq_true_eq, Bool.or_eq_true, beq_iff_eq,
        Bool.not_eq_true'] at he
      exact hc ⟨he.1.1.1, he.1.1.2, he.1.2, he.2⟩
    rw [foldl_ok_false P side nb kN toks _ hpre] at h1
    exact Bool.false_ne_true h1
  refine run_cover P side nb kN toks _ h1 h2 ch y ⟨⟨ch, -P.den, -P.den, -P.den, P.den, P.den, P.den⟩,
    ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [QuadSem.bLo, QuadSem.bHi, OctFar.toD28, cvB] <;> constructor <;> linarith

/-! ## 2. The n tree (root `[0, nd]²`, `out` in `H + K ≥ nd`) -/

theorem nstep_ok_false (nd : ℤ) (s : NState) (t : NTok) (h : s.ok = false) :
    (nstep nd s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩
  · simp [nstep, hst, h]
  · cases t with
    | split => simp [nstep, hst, h]
    | out => simp [nstep, hst, h]
    | ok => rcases hb : s.boxes with _ | ⟨x, bs⟩ <;> simp [nstep, hst, hb, h]

theorem nfoldl_ok_false (nd : ℤ) : ∀ (toks : List NTok) (s : NState), s.ok = false →
    (toks.foldl (nstep nd) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (nstep_ok_false nd s t h)

/-- The corners of a box of `D40` (as `OctCover.corners`). -/
def cornersD (b : NBox) : ℤ × ℤ × ℤ × ℤ := (b.l0, b.l1, b.h0, b.h1)

def toD31N (b : NBox) : PackLean.D31.NBox := ⟨b.l0, b.l1, b.h0, b.h1⟩

theorem split2_cover' (b : NBox) (H K : ℝ) (h : InN (cornersD b) H K) :
    InN (cornersD (split2 b).1) H K ∨ InN (cornersD (split2 b).2) H K := by
  have := split2_cover (toD31N b) H K h
  have e : PackLean.D31.split2 (toD31N b) = (toD31N (split2 b).1, toD31N (split2 b).2) := by
    by_cases hw : b.h0 - b.l0 ≥ b.h1 - b.l1 <;> simp [PackLean.D31.split2, split2, toD31N, hw]
  rw [e] at this
  exact this

theorem nstep_boxes (nd : ℤ) (s : NState) (t : NTok) :
    ∀ x ∈ (nstep nd s t).boxes, x ∈ s.boxes := by
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

/-- **n tree soundness.** If the run ends with `ok` and an empty stack, every point with
`H + K < nd` of a box on the stack lies in one of the listed boxes. -/
theorem nrun_cover (nd : ℤ) : ∀ (toks : List NTok) (s : NState), (toks.foldl (nstep nd) s).ok = true →
    (toks.foldl (nstep nd) s).stack = [] → ∀ H K : ℝ, H + K < nd →
      (∃ B ∈ s.stack, InN (cornersD B) H K) → ∃ b ∈ s.boxes, InN b H K := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst H K _ ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst H K hHK ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (nstep nd s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [nfoldl_ok_false nd toks _ hc] at hok
      exact Bool.false_ne_true hok
    have hsub : ∀ b ∈ (nstep nd s t).boxes, b ∈ s.boxes := nstep_boxes nd s t
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (nstep nd s .split).stack = (split2 B).1 :: (split2 B).2 :: rest := by
            simp [nstep, hs]
          obtain ⟨b', hb', hin⟩ := ih _ hok hst H K hHK (by
            rw [hs']
            rcases split2_cover' B H K hz with h | h
            · exact ⟨_, by simp, h⟩
            · exact ⟨_, by simp, h⟩)
          exact ⟨b', hsub _ hb', hin⟩
        | out =>
          have : (nstep nd s .out).ok = (s.ok && decide (B.l0 + B.l1 ≥ nd)) := by
            simp [nstep, hs]
          rw [this, Bool.and_eq_true, decide_eq_true_eq] at hok'
          obtain ⟨a1, _, a3, _⟩ := hz
          simp only [cornersD] at a1 a3
          have : ((B.l0 + B.l1 : ℤ) : ℝ) ≥ nd := by exact_mod_cast hok'.2
          push_cast at this
          linarith
        | ok =>
          rcases hb : s.boxes with _ | ⟨x, bs⟩
          · have : (nstep nd s .ok).ok = false := by simp [nstep, hs, hb]
            rw [this] at hok'; exact absurd hok' (by simp)
          · obtain ⟨a0, a1, a2, a3⟩ := x
            have : (nstep nd s .ok).ok
                = (s.ok && a0 == B.l0 && a1 == B.l1 && a2 == B.h0 && a3 == B.h1) := by
              simp [nstep, hs, hb]
            rw [this] at hok'
            simp only [Bool.and_eq_true, beq_iff_eq] at hok'
            obtain ⟨⟨⟨⟨_, e0⟩, e1⟩, e2⟩, e3⟩ := hok'
            refine ⟨(a0, a1, a2, a3), by simp, ?_⟩
            subst e0 e1 e2 e3
            exact hz
      · obtain ⟨b', hb', hin⟩ := ih _ hok hst H K hHK ⟨B, by
          cases t with
          | split => simp [nstep, hs, hBr]
          | out => simp [nstep, hs, hBr]
          | ok => rcases hb : s.boxes with _ | ⟨x, bs⟩ <;> simp [nstep, hs, hb, hBr], hz⟩
        exact ⟨b', hsub _ hb', hin⟩

theorem ntree_cover {nd : ℤ} {toks : List NTok} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : (ntreeRun nd toks boxes).1 = true) {H K : ℝ} (hH0 : 0 ≤ H) (hH1 : H ≤ nd) (hK0 : 0 ≤ K)
    (hK1 : K ≤ nd) (hHK : H + K < nd) : ∃ b ∈ boxes, InN b H K := by
  simp only [ntreeRun, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨⟨h1, h2⟩, _⟩ := h
  exact nrun_cover nd toks _ h1 h2 H K hHK ⟨⟨0, 0, nd, nd⟩, by simp,
    ⟨by simpa [cornersD] using hH0, by simpa [cornersD] using hH1, by simpa [cornersD] using hK0,
      by simpa [cornersD] using hK1⟩⟩

/-- **The n tree** (with the edge `H + K = nd`): the listed boxes are closed and finitely many. -/
theorem ntree_cover_le {nd : ℤ} (hnd : 0 < nd) {toks : List NTok} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : (ntreeRun nd toks boxes).1 = true) {H K : ℝ} (hH0 : 0 ≤ H) (hK0 : 0 ≤ K)
    (hHK : H + K ≤ nd) : ∃ b ∈ boxes, InN b H K := by
  have hndr : (0 : ℝ) < nd := by exact_mod_cast hnd
  let S : Set (ℝ × ℝ) := ⋃ b ∈ boxes.toFinset, {z : ℝ × ℝ | InN b z.1 z.2}
  have hS : IsClosed S := isClosed_biUnion_finset fun b _ => isClosed_InN b
  have hmem : ∀ t : ℝ, 0 < t → t < 1 → (t * H, t * K) ∈ S := by
    intro t ht0 ht1
    obtain ⟨b, hb, hin⟩ := ntree_cover h (H := t * H) (K := t * K) (by positivity)
      (by nlinarith) (by positivity) (by nlinarith) (by nlinarith)
    exact Set.mem_biUnion (List.mem_toFinset.2 hb) hin
  have hlim : Filter.Tendsto (fun t : ℝ => (t * H, t * K)) (nhdsWithin 1 (Set.Iio 1)) (nhds (H, K)) := by
    have hc : Continuous (fun t : ℝ => (t * H, t * K)) :=
      (continuous_id.mul continuous_const).prodMk (continuous_id.mul continuous_const)
    have := (hc.tendsto 1).mono_left (nhdsWithin_le_nhds (s := Set.Iio 1))
    simpa using this
  have hev : ∀ᶠ t in nhdsWithin 1 (Set.Iio 1), (t * H, t * K) ∈ S :=
    Filter.mem_of_superset (Ioo_mem_nhdsLT (by norm_num : (0 : ℝ) < 1))
      fun t ht => hmem t ht.1 ht.2
  have := hS.mem_of_tendsto hlim hev
  simp only [S, Set.mem_iUnion, List.mem_toFinset] at this
  obtain ⟨b, hb, hin⟩ := this
  exact ⟨b, hb, hin⟩

/-! ## 3. The local hypothesis and the constants -/

/-- The local region of the centre `ce` in `(h, k′)`: the upper half of `D_n` and `N₁` (tube) or
`[0, r₀]²` (point). -/
def InLoc (P : Prm) (ce : Cen) (h k : ℝ) : Prop :=
  0 ≤ h ∧ 0 ≤ k ∧ h + k ≤ 1 ∧
    (if ce.tube = true then h * P.hmax.2 ≤ P.hmax.1 ∧ k * P.r0.2 ≤ P.r0.1
     else h * P.r0.2 ≤ P.r0.1 ∧ k * P.r0.2 ≤ P.r0.1)

/-- **The local hypothesis** (stage 7e-3): for every centre `ce` of `P.cens`, every R box inside
its cube (`rInCube`), every rotation of the box and every `(h, k′)` of its region, the bound
`κ̃₁ = kapN P (0, 1)` (with the sign of the side) holds. -/
def HLoc (P : Prm) : Prop :=
  ∀ (c : ℕ) (ce : Cen), P.cens[c]? = some ce → ∀ rb : RBox, rboxWf rb = true → rInCube P rb ce.q = true →
    ∀ R ∈ SO3, MaxRep VD 4 R → ∀ u, Charts.ChartPt R P.den rb.ch u → InB rb rb.ch u →
    ∀ h k, InLoc P ce h k →
      Low VD 4 (cbD P) (pS ce.side h k) R (-(sgn ce.side * kapN P (0, 1) h k))

/-- The constants of the far checks (checked once per case). -/
structure FarConsts (P : Prm) : Prop where
  nd : 0 < P.nd
  den : 0 < P.den
  sd : 0 < P.sbar.2
  kd : 0 < P.kd
  msign : P.msign = 1
  mus : ∀ m ∈ P.mus, 0 < m
  hm : 0 < P.hmax.2
  r0 : 0 < P.r0.2
  r0hm : P.r0.1 * (P.hmax.2 : ℤ) ≤ P.hmax.1 * (P.r0.2 : ℤ)
  rots : ∀ K ∈ P.rots, rotIntOk K = true ∧ vmapT K = true

theorem leR_real {x : ℤ} {r : RatI} {S : ℤ} (h : leR x r S = true) :
    (x : ℝ) * (r.2 : ℝ) ≤ (r.1 : ℝ) * S := by
  simp only [leR, decide_eq_true_eq] at h; exact_mod_cast h

/-- A box inside `N₁` or the point box meets `N₁` (so its `k_N` is `0`). -/
theorem overlaps_of {P : Prm} (hc : FarConsts P) {nb : NBox} (hnw : nboxWf nb = true)
    (h : (nInN1 P nb || nInP P nb) = true) : overlapsN1 P nb = true := by
  simp only [nboxWf, Bool.and_eq_true, decide_eq_true_eq] at hnw
  have hm : (0 : ℤ) < P.hmax.2 := by exact_mod_cast hc.hm
  have hr : (0 : ℤ) < P.r0.2 := by exact_mod_cast hc.r0
  have hnd := hc.nd
  have hrh := hc.r0hm
  simp only [overlapsN1, ltR, Bool.and_eq_true, decide_eq_true_eq]
  simp only [nInN1, nInP, leR, Bool.or_eq_true, Bool.and_eq_true, decide_eq_true_eq] at h
  rcases h with ⟨h1, h2⟩ | ⟨h1, h2⟩
  · exact ⟨by nlinarith, by nlinarith⟩
  · refine ⟨?_, by nlinarith⟩
    have a : nb.l0 * (P.r0.2 : ℤ) < P.r0.1 * P.nd := by nlinarith
    have b : nb.l0 * (P.r0.2 : ℤ) * P.hmax.2 < P.r0.1 * P.nd * P.hmax.2 :=
      mul_lt_mul_of_pos_right a hm
    have c : P.r0.1 * P.nd * (P.hmax.2 : ℤ) ≤ P.hmax.1 * P.r0.2 * P.nd := by nlinarith
    nlinarith

/-- `n` box bounds give the local range: `t · nd ≤ top` and `top ≤ (r) · nd` give `t · r₂ ≤ r₁`. -/
theorem nbound {nd : ℤ} (hnd : (0 : ℝ) < nd) (t : ℝ) (top : ℤ) (r : RatI) (ht : t * nd ≤ top)
    (hl : leR top r nd = true) : t * (r.2 : ℝ) ≤ r.1 := by
  have e := leR_real hl
  have : t * nd * r.2 ≤ top * r.2 := mul_le_mul_of_nonneg_right ht (by positivity)
  have : t * (r.2 : ℝ) * nd ≤ r.1 * nd := by nlinarith
  exact le_of_mul_le_mul_right this hnd

theorem nthD_mem {α : Type*} {L : List α} {i : ℕ} (h : i < L.length) (d : α) : nth L i d ∈ L := by
  unfold nth; rw [List.getD_eq_getElem _ _ h]; exact List.getElem_mem h

theorem kapN_zero {P : Prm} {kN : RatI} (h : kN.1 = 0) (h' k : ℝ) :
    kapN P kN h' k = kapN P (0, 1) h' k := by
  simp [kapN, h]

/-- The left branch at the point of the side (types F and M). -/
theorem low_pS {cb h k κ : ℝ} (hh : 0 ≤ h) (hk : 0 ≤ k) (hhk : h + k ≤ 1) {side : ℕ}
    (hs : side = 0 ∨ side = 1) {R : M3} {code : ℕ} (hmu : 0 ≤ (decCand code).mu)
    (hκ : κ ≤ dualC cb (pS side h k) R (decCand code)) : Low VD 4 cb (pS side h k) R κ := by
  rcases hs with rfl | rfl
  · simp only [pS, if_true] at hκ ⊢
    exact low_of_dual (by linarith) (by linarith) (by linarith) hmu hκ
  · simp only [pS, one_ne_zero, if_false] at hκ ⊢
    exact low_of_dual (by linarith) (by linarith) (by linarith) hmu hκ

/-! ## 4. One side of one direction -/

/-- **One side.** If the R tree of the side passes on a box containing `(h, k′)` (in `nd` units),
then at `pS side h k` and every `R ∈ SO(3)` with `MaxRep` the bound `−sgn · κ_N(h, k′)` holds. -/
theorem side_low {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {nb : NBox} {kN : RatI}
    {toks : List Tok} {side : ℕ} (hrun : (nbRun P nb side kN toks).1 = true)
    {h k : ℝ} (hh : 0 ≤ h) (hk : 0 ≤ k) (hhk : h + k ≤ 1)
    (a1 : (nb.l0 : ℝ) ≤ h * P.nd) (a2 : h * P.nd ≤ nb.h0) (a3 : (nb.l1 : ℝ) ≤ k * P.nd)
    (a4 : k * P.nd ≤ nb.h1) {R : M3} (hR : R ∈ SO3) (hmax : MaxRep VD 4 R) :
    Low VD 4 (cbD P) (pS side h k) R (-(sgn side * kapN P kN h k)) := by
  obtain ⟨⟨hnw, hkd, hside, hkn⟩, hcov⟩ := rtree_cover P side nb kN toks hrun
  have hs : side = 0 ∨ side = 1 := by omega
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hc.nd
  have hden : (0 : ℝ) < P.den := by exact_mod_cast hc.den
  obtain ⟨ch, hch, u, hcu⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := hcov ch hch u (fun i => abs_le.2 ⟨(hcu.1 i).1, (hcu.1 i).2⟩)
  have hBch : B.ch = ch := hin.1
  rw [← hBch] at hcu
  rcases hgood with ⟨c, hl⟩ | ⟨m, hm, hD⟩ | ⟨code, hA⟩
  · -- a local leaf
    simp only [lOk, Bool.and_eq_true] at hl
    obtain ⟨hreg, hm⟩ := hl
    have hk0 : kN.1 = 0 := by
      rcases hkn with e | e
      · exact e
      · rw [overlaps_of hc hnw hreg] at e; exact absurd e (by simp)
    rcases hce : P.cens[c]? with _ | ce
    · rw [hce] at hm; exact absurd hm (by simp)
    rw [hce] at hm
    simp only [Bool.and_eq_true, beq_iff_eq] at hm
    obtain ⟨⟨hsd, hreg'⟩, hcube⟩ := hm
    have hL : InLoc P ce h k := by
      refine ⟨hh, hk, hhk, ?_⟩
      by_cases ht : ce.tube = true
      · rw [ht, if_pos rfl] at hreg'
        simp only [nInN1, Bool.and_eq_true] at hreg'
        rw [if_pos ht]
        exact ⟨nbound hnd h nb.h0 _ a2 hreg'.1, nbound hnd k nb.h1 _ a4 hreg'.2⟩
      · rw [Bool.not_eq_true] at ht
        rw [ht] at hreg'
        simp only [Bool.false_eq_true, if_false, nInP, Bool.and_eq_true] at hreg'
        rw [if_neg (by simp [ht])]
        exact ⟨nbound hnd h nb.h0 _ a2 hreg'.1, nbound hnd k nb.h1 _ a4 hreg'.2⟩
    have := hloc c ce hce B hwB hcube R hR hmax u hcu (hBch ▸ hin) h k hL
    rw [hsd, ← kapN_zero hk0] at this
    exact this
  · -- discarded: a symmetry of larger trace
    exfalso
    have htr := disc_trace hwB hD hcu (hBch ▸ hin)
    obtain ⟨hr1, hr2⟩ := hc.rots _ (nthD_mem hm [])
    have := hmax _ (rot_krot hr1 hr2)
    linarith
  · -- accepted
    have hok : candOk P side code = true := by
      simp only [farAccept, Bool.and_eq_true] at hA; exact hA.1
    by_cases ht : (decCand code).typ = 2
    · exact low_of_S (accept_S hc.sd hwB hA ht hcu (hBch ▸ hin))
    · have hG := accept_FM hc.msign hc.nd hc.sd hc.kd hkd hs hnw hwB hA ht hcu (hBch ▸ hin)
        (H := h * P.nd) (K := k * P.nd) a1 a2 a3 a4
      rw [mul_div_cancel_right₀ _ hnd.ne', mul_div_cancel_right₀ _ hnd.ne'] at hG
      exact low_pS hh hk hhk hs (candOk_mu hc.mus hok) hG

/-! ## 5. The far certificate -/

/-- **The far certificate** of tetintet: with the n tree, the two R trees of every listed box and
the local hypothesis, `TetCert VD 4 (s̄/2)` (the pair `κ_N`, `−κ_N` of the box). -/
theorem far_cert {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {nboxes : List (ℤ × ℤ × ℤ × ℤ)} (hn : (ntreeRun P.nd ntoks nboxes).1 = true)
    (hb : ∀ b ∈ nboxes, ∃ nb kN tA tB, cornersD nb = b ∧ (nbRun P nb 0 kN tA).1 = true ∧
      (nbRun P nb 1 kN tB).1 = true) :
    TetCert VD 4 (cbD P) := by
  intro x y hy hyx hx
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hc.nd
  obtain ⟨bx, hbx, hinN⟩ := ntree_cover_le hc.nd hn (H := (1 - x) * P.nd) (K := (x - y) * P.nd)
    (mul_nonneg (by linarith) hnd.le) (mul_nonneg (by linarith) hnd.le) (by nlinarith)
  obtain ⟨nb, kN, tA, tB, hcor, hA, hB⟩ := hb bx hbx
  subst hcor
  obtain ⟨a1, a2, a3, a4⟩ := hinN
  simp only [cornersD] at a1 a2 a3 a4
  have e0 : pS 0 (1 - x) (x - y) = !₂[x, y, 1] := by
    simp only [pS, if_true]
    rw [show (1 : ℝ) - (1 - x) = x by ring, show x - (x - y) = y by ring]
  have e1 : pS 1 (1 - x) (x - y) = !₂[x, -y, 1] := by
    simp only [pS, one_ne_zero, if_false]
    rw [show (1 : ℝ) - (1 - x) = x by ring, show x - (x - y) = y by ring]
  refine ⟨kapN P kN (1 - x) (x - y), -kapN P kN (1 - x) (x - y), by linarith,
    fun R hR hm => ?_, fun R hR hm => ?_⟩
  · have := side_low hc hloc hA (h := 1 - x) (k := x - y) (by linarith) (by linarith) (by linarith)
      a1 a2 a3 a4 hR hm
    rw [e0] at this
    simpa [sgn] using this
  · have := side_low hc hloc hB (h := 1 - x) (k := x - y) (by linarith) (by linarith) (by linarith)
      a1 a2 a3 a4 hR hm
    rw [e1] at this
    simpa [sgn] using this

end

#assert_std_axioms PackLean.Formal.TetintCover.far_cert PackLean.Formal.TetintCover.side_low
  PackLean.Formal.TetintCover.ntree_cover_le PackLean.Formal.TetintCover.rtree_cover

end PackLean.Formal.TetintCover
