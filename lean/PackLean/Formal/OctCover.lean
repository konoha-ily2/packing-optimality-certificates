import PackLean.Formal.OctFar

/-!
# A9 stage 7d (part 2): the trees of `D31.Core` give `TetCert` (octintet)

Design: `plan/A9f_tet_design.md` §4, §9.  The far checker of `D31.Core` has two levels of trees:

* the **n tree** (`ntreeRun`): the rectangle `[0, nd] × [0, 2nd]` of `(H, K) = nd · (h, k′)`
  (`h = 1 − x`, `k′ = x − y`) is split into boxes; a leaf `out` lies in `2H + K ≥ 2nd` (outside
  `D_n` but for its corner), a leaf `ok` is matched in order with the list of boxes.  Every point
  with `2H + K < 2nd` lies in a listed box (`ntree_cover`), and since the listed boxes are closed and
  finitely many, so does every point with `2H + K ≤ 2nd` (`ntree_cover_le`);
* for every listed box, the **R tree** (`nbRun`, the four quaternion charts) with leaves `A`
  (`OctFar.accept_G`), `D` (`OctFar.disc_trace`), `LJ` and `LC` (the local regions, hypothesis
  `HLoc`, stage 7d-3).

`far_cert`: with `HLoc`, the far data give `TetReduction.TetCert VV 6 (3√2/4)`; the bound at
`p = (x, y, 1) ∈ D_n` is `κ = (√2/4) y` everywhere, so the pair is `(√2/4) y` and `−(√2/4) y`.
-/

namespace PackLean.Formal.OctCover

open PackLean.D31 (Prm RBox rboxWf rboxQ rotQ split3 nth NBox nboxWf Tok leafOk WState wstep rRoots
  nbRun NTok NState nstep split2 ntreeRun farLb discLb decCand nInJ nInC rInJ rInC leR geR rVerts iabs
  RatI)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.OctFar
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low TetCert MaxRep Krot)
open PackLean.D28 (rotIntOk)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The R tree -/

/-- What a leaf of the R tree of the direction box `nb` certifies. -/
def Good (P : Prm) (nb : NBox) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((nInJ P nb = true ∧ rInJ P b = true) ∨ (nInC P nb = true ∧ rInC P b = true) ∨
     (∃ m, m < P.rots.length ∧ discLb P b (nth P.rots m []) > 0) ∨
     (∃ code, farLb P nb b (decCand code) ≥ 0))

theorem wstep_ok_false (P : Prm) (nb : NBox) (s : WState) (t : Tok) (h : s.ok = false) :
    (wstep P nb s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstep, hst, h]

theorem foldl_ok_false (P : Prm) (nb : NBox) :
    ∀ (toks : List Tok) (s : WState), s.ok = false → (toks.foldl (wstep P nb) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstep_ok_false P nb s t h)

theorem leaf_good (P : Prm) (nb : NBox) (b : RBox) (t : Tok) (ht : t ≠ .split)
    (hw : rboxWf b = true) (hl : leafOk P nb b t = true) : Good P nb b := by
  refine ⟨hw, ?_⟩
  cases t with
  | split => exact absurd rfl ht
  | LJ =>
    simp only [leafOk, Bool.and_eq_true] at hl
    exact Or.inl hl
  | LC =>
    simp only [leafOk, Bool.and_eq_true] at hl
    exact Or.inr (Or.inl hl)
  | D m =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inr (Or.inl ⟨m, hl.1, hl.2⟩))
  | A code =>
    simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
    exact Or.inr (Or.inr (Or.inr ⟨code, hl.2⟩))

/-- **Tree soundness** (as `CoverTreeG.run_cover`). -/
theorem run_cover (P : Prm) (nb : NBox) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstep P nb) s).ok = true →
      (toks.foldl (wstep P nb) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, Good P nb B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstep P nb s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P nb toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstep P nb s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstep, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | LJ =>
          have : (wstep P nb s .LJ).ok = (s.ok && rboxWf B && leafOk P nb B .LJ) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb B .LJ (by simp) hok'.1.2 hok'.2, hz⟩
        | LC =>
          have : (wstep P nb s .LC).ok = (s.ok && rboxWf B && leafOk P nb B .LC) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb B .LC (by simp) hok'.1.2 hok'.2, hz⟩
        | D m =>
          have : (wstep P nb s (.D m)).ok = (s.ok && rboxWf B && leafOk P nb B (.D m)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb B (.D m) (by simp) hok'.1.2 hok'.2, hz⟩
        | A code =>
          have : (wstep P nb s (.A code)).ok = (s.ok && rboxWf B && leafOk P nb B (.A code)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, leaf_good P nb B (.A code) (by simp) hok'.1.2 hok'.2, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstep P nb s t).stack := by
          intro C hC; cases t <;> simp [wstep, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The R tree of a direction box.** If `nbRun` passes, the box `nb` is well formed and every
point `(ch, y)` with `ch < 4`, `|y i| ≤ den` lies in a good leaf of chart `ch`. -/
theorem rtree_cover (P : Prm) (nb : NBox) (toks : List Tok) (h : (nbRun P nb toks).1 = true) :
    nboxWf nb = true ∧ ∀ (ch : ℕ), ch < 4 → ∀ (y : Fin 3 → ℝ), (∀ i, |y i| ≤ (P.den : ℝ)) →
      ∃ B, Good P nb B ∧ InBox B ch y := by
  simp only [nbRun, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨h1, h2⟩ := h
  refine ⟨?_, fun ch hch y hy => ?_⟩
  · by_contra hc
    rw [Bool.not_eq_true] at hc
    rw [foldl_ok_false P nb toks _ hc] at h1
    exact Bool.false_ne_true h1
  refine run_cover P nb toks _ h1 h2 ch y ⟨⟨ch, -P.den, -P.den, -P.den, P.den, P.den, P.den⟩,
    ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [QuadSem.bLo, QuadSem.bHi, toD28] <;> constructor <;> linarith

/-! ## 2. The n tree -/

/-- The point `(H, K)` (in `nd` units) lies in the box with corners `(l0, l1)`, `(h0, h1)`. -/
def InN (b : ℤ × ℤ × ℤ × ℤ) (H K : ℝ) : Prop :=
  (b.1 : ℝ) ≤ H ∧ H ≤ b.2.2.1 ∧ (b.2.1 : ℝ) ≤ K ∧ K ≤ b.2.2.2

def corners (b : NBox) : ℤ × ℤ × ℤ × ℤ := (b.l0, b.l1, b.h0, b.h1)

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

theorem split2_cover (b : NBox) (H K : ℝ) (h : InN (corners b) H K) :
    InN (corners (split2 b).1) H K ∨ InN (corners (split2 b).2) H K := by
  obtain ⟨a1, a2, a3, a4⟩ := h
  simp only [corners] at a1 a2 a3 a4
  simp only [split2]
  split_ifs
  · rcases le_total H (((b.l0 + b.h0) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, hz, a3, a4⟩
    · right; exact ⟨hz, a2, a3, a4⟩
  · rcases le_total K (((b.l1 + b.h1) / 2 : ℤ) : ℝ) with hz | hz
    · left; exact ⟨a1, a2, a3, hz⟩
    · right; exact ⟨a1, a2, hz, a4⟩

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
`2H + K < 2nd` of a box on the stack lies in one of the listed boxes. -/
theorem nrun_cover (nd : ℤ) : ∀ (toks : List NTok) (s : NState), (toks.foldl (nstep nd) s).ok = true →
    (toks.foldl (nstep nd) s).stack = [] → ∀ H K : ℝ, 2 * H + K < 2 * nd →
      (∃ B ∈ s.stack, InN (corners B) H K) → ∃ b ∈ s.boxes, InN b H K := by
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
            rcases split2_cover B H K hz with h | h
            · exact ⟨_, by simp, h⟩
            · exact ⟨_, by simp, h⟩)
          exact ⟨b', hsub _ hb', hin⟩
        | out =>
          have : (nstep nd s .out).ok = (s.ok && decide (2 * B.l0 + B.l1 ≥ 2 * nd)) := by
            simp [nstep, hs]
          rw [this, Bool.and_eq_true, decide_eq_true_eq] at hok'
          obtain ⟨a1, _, a3, _⟩ := hz
          simp only [corners] at a1 a3
          have : ((2 * B.l0 + B.l1 : ℤ) : ℝ) ≥ 2 * nd := by exact_mod_cast hok'.2
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

/-- **The n tree** (open part): every point of the root with `2H + K < 2nd` lies in a listed box. -/
theorem ntree_cover {nd : ℤ} {toks : List NTok} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : (ntreeRun nd toks boxes).1 = true) {H K : ℝ} (hH0 : 0 ≤ H) (hH1 : H ≤ nd) (hK0 : 0 ≤ K)
    (hK1 : K ≤ 2 * nd) (hHK : 2 * H + K < 2 * nd) : ∃ b ∈ boxes, InN b H K := by
  simp only [ntreeRun, Bool.and_eq_true, List.isEmpty_iff] at h
  obtain ⟨⟨h1, h2⟩, _⟩ := h
  exact nrun_cover nd toks _ h1 h2 H K hHK ⟨⟨0, 0, nd, 2 * nd⟩, by simp,
    ⟨by simpa [corners] using hH0, by simpa [corners] using hH1, by simpa [corners] using hK0,
      by simpa [corners] using hK1⟩⟩

theorem isClosed_InN (b : ℤ × ℤ × ℤ × ℤ) : IsClosed {z : ℝ × ℝ | InN b z.1 z.2} := by
  simp only [InN, Set.setOf_and]
  exact (isClosed_le continuous_const continuous_fst).inter
    ((isClosed_le continuous_fst continuous_const).inter
    ((isClosed_le continuous_const continuous_snd).inter (isClosed_le continuous_snd continuous_const)))

/-- **The n tree** (with the boundary `2H + K = 2nd`): the listed boxes are closed and finitely many. -/
theorem ntree_cover_le {nd : ℤ} (hnd : 0 < nd) {toks : List NTok} {boxes : List (ℤ × ℤ × ℤ × ℤ)}
    (h : (ntreeRun nd toks boxes).1 = true) {H K : ℝ} (hH0 : 0 ≤ H) (hK0 : 0 ≤ K)
    (hHK : 2 * H + K ≤ 2 * nd) : ∃ b ∈ boxes, InN b H K := by
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

/-! ## 3. The local regions -/

/-- The rotation `R` of the quaternion `(1, a, b, c)`. -/
def QRot (R : M3) (a b c : ℝ) : Prop :=
  QuadSem.rqList 1 a b c = (fun e => (1 + a ^ 2 + b ^ 2 + c ^ 2) * e) <$>
    [R 0 0, R 0 1, R 0 2, R 1 0, R 1 1, R 1 2, R 2 0, R 2 1, R 2 2]

/-- **The J region** (stage 7d-3): `h ≤ r_J`, `k′ ≤ k_J`, `|u| ≤ u_J`, `|p₁|, |p₂| ≤ r_J` with
`u = (a + b + c)/3`, `p₁ = (2a − b − c)/3`, `p₂ = (2b − a − c)/3`; some candidate has `G_c ≥ 0`. -/
def LocJ (P : Prm) : Prop :=
  ∀ h k : ℝ, 0 ≤ h → 0 ≤ k → 2 * h + k ≤ 2 → h * P.rJ.2 ≤ P.rJ.1 → k * P.kJ.2 ≤ P.kJ.1 →
  ∀ a b c : ℝ, |a + b + c| * P.uJ.2 ≤ 3 * P.uJ.1 → |2 * a - b - c| * P.rJ.2 ≤ 3 * P.rJ.1 →
    |2 * b - a - c| * P.rJ.2 ≤ 3 * P.rJ.1 →
  ∀ R : M3, R ∈ SO3 → QRot R a b c → ∃ cd, CandOk cd ∧ 0 ≤ Gc h k R cd

/-- **The C region** (the tube around the circle): `h, k′ ≤ r_C`, `u₁ ≤ ±u ≤ u_C`, `|p_i| ≤ r_C`. -/
def LocC (P : Prm) : Prop :=
  ∀ h k : ℝ, 0 ≤ h → 0 ≤ k → 2 * h + k ≤ 2 → h * P.rC.2 ≤ P.rC.1 → k * P.rC.2 ≤ P.rC.1 →
  ∀ sg : ℝ, (sg = 1 ∨ sg = -1) →
  ∀ a b c : ℝ, 3 * P.u1.1 ≤ sg * (a + b + c) * P.u1.2 → sg * (a + b + c) * P.uC.2 ≤ 3 * P.uC.1 →
    |2 * a - b - c| * P.rC.2 ≤ 3 * P.rC.1 → |2 * b - a - c| * P.rC.2 ≤ 3 * P.rC.1 →
  ∀ R : M3, R ∈ SO3 → QRot R a b c → ∃ cd, CandOk cd ∧ 0 ≤ Gc h k R cd

def HLoc (P : Prm) : Prop := LocJ P ∧ LocC P

/-- An affine function `≤ C` at the eight vertices of a box is `≤ C` on the box. -/
theorem aff_le_of_verts {α β γ δ C x y z l0 h0 l1 h1 l2 h2 : ℝ}
    (hx : l0 ≤ x ∧ x ≤ h0) (hy : l1 ≤ y ∧ y ≤ h1) (hz : l2 ≤ z ∧ z ≤ h2)
    (hv : ∀ a b c : ℝ, (a = l0 ∨ a = h0) → (b = l1 ∨ b = h1) → (c = l2 ∨ c = h2) →
      α + β * a + γ * b + δ * c ≤ C) : α + β * x + γ * y + δ * z ≤ C := by
  have pick : ∀ (w v lo hi : ℝ), lo ≤ v → v ≤ hi → ∃ a, (a = lo ∨ a = hi) ∧ w * v ≤ w * a := by
    intro w v lo hi h1 h2
    rcases le_total 0 w with hw | hw
    · exact ⟨hi, Or.inr rfl, by nlinarith⟩
    · exact ⟨lo, Or.inl rfl, by nlinarith⟩
  obtain ⟨a, ha, ea⟩ := pick β x l0 h0 hx.1 hx.2
  obtain ⟨b, hb, eb⟩ := pick γ y l1 h1 hy.1 hy.2
  obtain ⟨c, hc, ec⟩ := pick δ z l2 h2 hz.1 hz.2
  linarith [hv a b c ha hb hc]

/-- The eight vertices of `rVerts`. -/
theorem mem_rVerts (b : RBox) {a bb c : ℤ} (ha : a = b.l0 ∨ a = b.h0) (hb : bb = b.l1 ∨ bb = b.h1)
    (hc : c = b.l2 ∨ c = b.h2) : (a, bb, c) ∈ rVerts b := by
  rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;> rcases hc with rfl | rfl <;>
    simp [rVerts]

/-- The point of a box, coordinate by coordinate. -/
theorem inBox_coords {b : RBox} {ch : ℕ} {u : Fin 3 → ℝ} (h : InBox b ch u) :
    ((b.l0 : ℝ) ≤ u 0 ∧ u 0 ≤ b.h0) ∧ ((b.l1 : ℝ) ≤ u 1 ∧ u 1 ≤ b.h1) ∧
      ((b.l2 : ℝ) ≤ u 2 ∧ u 2 ≤ b.h2) := by
  obtain ⟨_, hy⟩ := h
  have h0 := hy 0; have h1 := hy 1; have h2 := hy 2
  simp only [QuadSem.bLo, QuadSem.bHi, toD28, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons] at h0 h1 h2
  exact ⟨h0, h1, h2⟩

/-- A constraint `f ≤ C` (an integer affine `f`) at the vertices of the box holds at its points. -/
theorem box_le {b : RBox} {ch : ℕ} {u : Fin 3 → ℝ} (hin : InBox b ch u) {α β γ δ C : ℝ}
    (hv : ∀ v ∈ rVerts b, α + β * v.1 + γ * v.2.1 + δ * v.2.2 ≤ C) :
    α + β * u 0 + γ * u 1 + δ * u 2 ≤ C := by
  obtain ⟨h0, h1, h2⟩ := inBox_coords hin
  have hv2 : ∀ (a bb c : ℤ), (a = b.l0 ∨ a = b.h0) → (bb = b.l1 ∨ bb = b.h1) → (c = b.l2 ∨ c = b.h2) →
      α + β * a + γ * bb + δ * c ≤ C := fun a bb c ha hb hc => hv (a, bb, c) (mem_rVerts b ha hb hc)
  refine aff_le_of_verts h0 h1 h2 fun a bb c ha hb hc => ?_
  rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;> rcases hc with rfl | rfl <;>
    exact hv2 _ _ _ (by simp) (by simp) (by simp)

/-- `|f| ≤ C` at the vertices holds at the points. -/
theorem box_abs_le {b : RBox} {ch : ℕ} {u : Fin 3 → ℝ} (hin : InBox b ch u) {β γ δ C : ℝ}
    (hv : ∀ v ∈ rVerts b, |β * v.1 + γ * v.2.1 + δ * v.2.2| ≤ C) :
    |β * u 0 + γ * u 1 + δ * u 2| ≤ C := by
  rw [abs_le]
  constructor
  · have := box_le hin (α := 0) (β := -β) (γ := -γ) (δ := -δ) (C := C) fun v hv' => by
      have := (abs_le.1 (hv v hv')).1; linarith
    linarith
  · have := box_le hin (α := 0) (β := β) (γ := γ) (δ := δ) (C := C) fun v hv' => by
      have := (abs_le.1 (hv v hv')).2; linarith
    linarith

/-- The chart-0 point `u` (in `den` units) is the quaternion `(1, a, b, c)`, `a = u₀ / den`. -/
theorem qrot_of_chart {R : M3} {den : ℝ} (hden : 0 < den) {u : Fin 3 → ℝ}
    (hc : Charts.ChartPt R den 0 u) : QRot R (u 0 / den) (u 1 / den) (u 2 / den) := by
  obtain ⟨_, hN, hl⟩ := hc
  simp only [QuadSem.chq, List.getD_cons_zero, List.getD_cons_succ] at hN hl
  have hs := Charts.rqList_smul (1 / den) den (u 0) (u 1) (u 2)
  rw [hl] at hs
  have e1 : 1 / den * den = 1 := by field_simp
  rw [e1] at hs
  unfold QRot
  rw [show 1 / den * u 0 = u 0 / den by ring, show 1 / den * u 1 = u 1 / den by ring,
    show 1 / den * u 2 = u 2 / den by ring] at hs
  rw [hs]
  have eN : (1 / den) ^ 2 * (den ^ 2 + u 0 ^ 2 + u 1 ^ 2 + u 2 ^ 2)
      = 1 + (u 0 / den) ^ 2 + (u 1 / den) ^ 2 + (u 2 / den) ^ 2 := by field_simp
  simp only [List.map_cons, List.map_nil, List.map_eq_map, Functor.map]
  simp only [List.cons.injEq, and_true]
  refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> rw [← eN] <;> ring

theorem leR_real {x : ℤ} {r : RatI} {S : ℤ} (h : leR x r S = true) :
    (x : ℝ) * (r.2 : ℝ) ≤ (r.1 : ℝ) * S := by
  simp only [leR, decide_eq_true_eq] at h; exact_mod_cast h

theorem geR_real {x : ℤ} {r : RatI} {S : ℤ} (h : geR x r S = true) :
    (r.1 : ℝ) * S ≤ (x : ℝ) * (r.2 : ℝ) := by
  simp only [geR, decide_eq_true_eq] at h; exact_mod_cast h

theorem iabs_real (x : ℤ) : ((iabs x : ℤ) : ℝ) = |(x : ℝ)| := by
  simp only [iabs, Int.natCast_natAbs, Int.cast_abs]

/-! ## 4. From the leaves to the regions -/

/-- `|f| · d ≤ C` at the vertices holds at the points. -/
theorem box_abs_le_mul {b : RBox} {ch : ℕ} {u : Fin 3 → ℝ} (hin : InBox b ch u) {d : ℝ} (hd : 0 ≤ d)
    {β γ δ C : ℝ} (hv : ∀ v ∈ rVerts b, |β * v.1 + γ * v.2.1 + δ * v.2.2| * d ≤ C) :
    |β * u 0 + γ * u 1 + δ * u 2| * d ≤ C := by
  have key : ∀ p q r : ℝ, |β * d * p + γ * d * q + δ * d * r| = |β * p + γ * q + δ * r| * d := by
    intro p q r
    rw [show β * d * p + γ * d * q + δ * d * r = (β * p + γ * q + δ * r) * d by ring, abs_mul,
      abs_of_nonneg hd]
  have := box_abs_le hin (β := β * d) (γ := γ * d) (δ := δ * d) (C := C) fun v hv' => by
    rw [key]; exact hv v hv'
  rwa [key] at this

/-- The vertex checks of `rInJ`, as real inequalities at the vertices. -/
theorem rInJ_verts {P : Prm} {b : RBox} (h : rInJ P b = true) :
    b.ch = 0 ∧ ∀ v ∈ rVerts b,
      |(1 : ℝ) * v.1 + 1 * v.2.1 + 1 * v.2.2| * (P.uJ.2 : ℝ) ≤ P.uJ.1 * (3 * P.den) ∧
      |(2 : ℝ) * v.1 + (-1) * v.2.1 + (-1) * v.2.2| * (P.rJ.2 : ℝ) ≤ P.rJ.1 * (3 * P.den) ∧
      |(-1 : ℝ) * v.1 + 2 * v.2.1 + (-1) * v.2.2| * (P.rJ.2 : ℝ) ≤ P.rJ.1 * (3 * P.den) := by
  simp only [rInJ, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  refine ⟨h.1, fun v hv => ?_⟩
  obtain ⟨⟨h1, h2⟩, h3⟩ := h.2 v hv
  obtain ⟨a, bb, c⟩ := v
  have e1 := leR_real h1; have e2 := leR_real h2; have e3 := leR_real h3
  simp only [iabs_real] at e1 e2 e3
  push_cast at e1 e2 e3
  refine ⟨?_, ?_, ?_⟩
  · simpa using e1
  · convert e2 using 3; ring
  · convert e3 using 3; ring

/-- The vertex checks of `rInC`. -/
theorem rInC_verts {P : Prm} {b : RBox} (h : rInC P b = true) :
    b.ch = 0 ∧ ∃ sg : ℝ, (sg = 1 ∨ sg = -1) ∧ ∀ v ∈ rVerts b,
      (P.u1.1 : ℝ) * (3 * P.den) ≤ sg * (v.1 + v.2.1 + v.2.2) * P.u1.2 ∧
      sg * (v.1 + v.2.1 + v.2.2) * P.uC.2 ≤ P.uC.1 * (3 * P.den) ∧
      |(2 : ℝ) * v.1 + (-1) * v.2.1 + (-1) * v.2.2| * (P.rC.2 : ℝ) ≤ P.rC.1 * (3 * P.den) ∧
      |(-1 : ℝ) * v.1 + 2 * v.2.1 + (-1) * v.2.2| * (P.rC.2 : ℝ) ≤ P.rC.1 * (3 * P.den) := by
  simp only [rInC, Bool.and_eq_true, beq_iff_eq, List.any_eq_true, List.mem_cons, List.mem_nil_iff,
    or_false, List.all_eq_true] at h
  obtain ⟨hch, sg, hsg, hall⟩ := h
  refine ⟨hch, sg, ?_, fun v hv => ?_⟩
  · rcases hsg with rfl | rfl <;> simp
  obtain ⟨⟨⟨h1, h2⟩, h3⟩, h4⟩ := hall v hv
  obtain ⟨a, bb, c⟩ := v
  have e1 := geR_real h1; have e2 := leR_real h2; have e3 := leR_real h3; have e4 := leR_real h4
  simp only [iabs_real] at e3 e4
  push_cast at e1 e2 e3 e4
  refine ⟨by linarith, by linarith, ?_, ?_⟩
  · convert e3 using 3; ring
  · convert e4 using 3; ring

theorem div_abs_le {f d N den : ℝ} (hden : 0 < den) (h : |f| * d ≤ N * (3 * den)) :
    |f / den| * d ≤ 3 * N := by
  rw [abs_div, abs_of_pos hden, div_mul_eq_mul_div, div_le_iff₀ hden]; linarith

/-- The constants of the far checks (checked once per case). -/
structure FarConsts (P : Prm) : Prop where
  nd : 0 < P.nd
  den : 0 < P.den
  rots : ∀ K ∈ P.rots, rotIntOk K = true ∧ vmapOk K = true

theorem nth_mem {α : Type*} {L : List α} {i : ℕ} (h : i < L.length) (d : α) : nth L i d ∈ L := by
  unfold nth; rw [List.getD_eq_getElem _ _ h]; exact List.getElem_mem h

/-- **One direction.** At every `p = (x, y, 1) ∈ D_n` and every `R ∈ SO(3)` with `MaxRep`, the bound
`(√2/4) y` holds. -/
theorem point_low {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {nboxes : List (ℤ × ℤ × ℤ × ℤ)} (hn : (ntreeRun P.nd ntoks nboxes).1 = true)
    (hb : ∀ b ∈ nboxes, ∃ nb toks, corners nb = b ∧ (nbRun P nb toks).1 = true)
    {x y : ℝ} (h1 : -x ≤ y) (h2 : y ≤ x) (h3 : x ≤ 1) {R : M3} (hR : R ∈ SO3)
    (hmax : MaxRep VV 6 R) : Low VV 6 cbO !₂[x, y, 1] R (√2 / 4 * y) := by
  set h := 1 - x with eh
  set k := x - y with ek
  have hh : 0 ≤ h := by linarith
  have hk : 0 ≤ k := by linarith
  have hhk : 2 * h + k ≤ 2 := by linarith
  have ex : x = 1 - h := by linarith
  have ey : y = 1 - h - k := by linarith
  rw [ex, ey]
  have hnd : (0 : ℝ) < P.nd := by exact_mod_cast hc.nd
  have hden : (0 : ℝ) < P.den := by exact_mod_cast hc.den
  obtain ⟨bx, hbx, hinN⟩ := ntree_cover_le hc.nd hn (H := h * P.nd) (K := k * P.nd)
    (by positivity) (by positivity) (by nlinarith)
  obtain ⟨nb, toks, hcor, hrun⟩ := hb bx hbx
  subst hcor
  obtain ⟨hnw, hcov⟩ := rtree_cover P nb toks hrun
  obtain ⟨ch, hch, u, hcu⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := hcov ch hch u (fun i => abs_le.2 ⟨(hcu.1 i).1, (hcu.1 i).2⟩)
  obtain ⟨a1, a2, a3, a4⟩ := hinN
  simp only [corners] at a1 a2 a3 a4
  have hBch : B.ch = ch := hin.1
  -- the n box inside a local range: `h * d ≤ N` from `h0 * d ≤ N * nd`
  have nbound : ∀ (t : ℝ) (top : ℤ) (r : RatI), t * P.nd ≤ top → leR top r P.nd = true →
      t * (r.2 : ℝ) ≤ r.1 := by
    intro t top r ht hl
    have e := leR_real hl
    have : t * P.nd * r.2 ≤ top * r.2 := mul_le_mul_of_nonneg_right ht (by positivity)
    have : t * (r.2 : ℝ) * P.nd ≤ r.1 * P.nd := by nlinarith
    exact le_of_mul_le_mul_right this hnd
  rcases hgood with ⟨hnJ, hrJ⟩ | ⟨hnC, hrC⟩ | ⟨m, hm, hD⟩ | ⟨code, hA⟩
  · -- the J region
    simp only [nInJ, Bool.and_eq_true] at hnJ
    obtain ⟨hch0, hv⟩ := rInJ_verts hrJ
    have hc0 : ch = 0 := by rw [← hBch, hch0]
    subst hc0
    have hq := qrot_of_chart hden hcu
    have b1 := box_abs_le_mul hin (by positivity) fun v hv' => (hv v hv').1
    have b2 := box_abs_le_mul hin (by positivity) fun v hv' => (hv v hv').2.1
    have b3 := box_abs_le_mul hin (by positivity) fun v hv' => (hv v hv').2.2
    obtain ⟨cd, hok, hG⟩ := hloc.1 h k hh hk hhk (nbound h nb.h0 P.rJ a2 hnJ.1)
      (nbound k nb.h1 P.kJ a4 hnJ.2) (u 0 / P.den) (u 1 / P.den) (u 2 / P.den)
      (by have := div_abs_le hden b1; convert this using 3; field_simp)
      (by have := div_abs_le hden b2; convert this using 3; field_simp; ring)
      (by have := div_abs_le hden b3; convert this using 3; field_simp; ring) R hR hq
    exact low_of_G hh hk hhk hok hG
  · -- the C region
    simp only [nInC, Bool.and_eq_true] at hnC
    obtain ⟨hch0, sg, hsg, hv⟩ := rInC_verts hrC
    have hc0 : ch = 0 := by rw [← hBch, hch0]
    subst hc0
    have hq := qrot_of_chart hden hcu
    have l1 := box_le hin (α := 0) (β := -sg * P.u1.2) (γ := -sg * P.u1.2) (δ := -sg * P.u1.2)
      (C := -(P.u1.1 * (3 * P.den))) fun v hv' => by have := (hv v hv').1; linarith
    have l2 := box_le hin (α := 0) (β := sg * P.uC.2) (γ := sg * P.uC.2) (δ := sg * P.uC.2)
      (C := P.uC.1 * (3 * P.den)) fun v hv' => by have := (hv v hv').2.1; linarith
    have b3 := box_abs_le_mul hin (by positivity) fun v hv' => (hv v hv').2.2.1
    have b4 := box_abs_le_mul hin (by positivity) fun v hv' => (hv v hv').2.2.2
    obtain ⟨cd, hok, hG⟩ := hloc.2 h k hh hk hhk (nbound h nb.h0 P.rC a2 hnC.1)
      (nbound k nb.h1 P.rC a4 hnC.2) sg hsg (u 0 / P.den) (u 1 / P.den) (u 2 / P.den)
      (by
        have e : sg * (u 0 / P.den + u 1 / P.den + u 2 / P.den) * P.u1.2
            = (sg * (u 0 + u 1 + u 2) * P.u1.2) / P.den := by field_simp
        rw [e, le_div_iff₀ hden]; linarith)
      (by
        have e : sg * (u 0 / P.den + u 1 / P.den + u 2 / P.den) * P.uC.2
            = (sg * (u 0 + u 1 + u 2) * P.uC.2) / P.den := by field_simp
        rw [e, div_le_iff₀ hden]; linarith)
      (by have := div_abs_le hden b3; convert this using 3; field_simp; ring)
      (by have := div_abs_le hden b4; convert this using 3; field_simp; ring) R hR hq
    exact low_of_G hh hk hhk hok hG
  · -- discarded: a symmetry of larger trace
    exfalso
    rw [← hBch] at hcu
    have htr := disc_trace hwB hD hcu (hBch ▸ hin)
    obtain ⟨hr1, hr2⟩ := hc.rots _ (nth_mem hm [])
    have := hmax _ (rot_krot hr1 hr2)
    linarith
  · -- accepted
    rw [← hBch] at hcu
    have hG := accept_G hc.nd hnw hwB hA hcu (hBch ▸ hin) (H := h * P.nd) (K := k * P.nd) a1 a2 a3 a4
    rw [mul_div_cancel_right₀ _ hnd.ne', mul_div_cancel_right₀ _ hnd.ne'] at hG
    exact low_of_G hh hk hhk (decCand_ok code) hG

/-- **The far certificate** of octintet: with the n tree, the R trees of the listed boxes and the
local hypothesis, `TetCert VV 6 (3√2/4)` (the pair `(√2/4) y`, `−(√2/4) y`). -/
theorem far_cert {P : Prm} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {nboxes : List (ℤ × ℤ × ℤ × ℤ)} (hn : (ntreeRun P.nd ntoks nboxes).1 = true)
    (hb : ∀ b ∈ nboxes, ∃ nb toks, corners nb = b ∧ (nbRun P nb toks).1 = true) :
    TetCert VV 6 cbO := by
  intro x y hy hyx hx
  refine ⟨√2 / 4 * y, √2 / 4 * (-y), by ring_nf; exact le_refl _, fun R hR hm => ?_,
    fun R hR hm => ?_⟩
  · exact point_low hc hloc hn hb (by linarith) hyx hx hR hm
  · exact point_low hc hloc hn hb (by linarith) (by linarith) hx hR hm

end

#assert_std_axioms PackLean.Formal.OctCover.far_cert PackLean.Formal.OctCover.ntree_cover_le
  PackLean.Formal.OctCover.rtree_cover

end PackLean.Formal.OctCover
