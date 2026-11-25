import PackLean.Formal.TetintLocalForm

/-!
# A9 stage 7e-3 (part 3): the R boxes inside the cube of a centre (`rInCube`)

Design: `plan/A9f_tet_design.md` §10.  `D40.rInCube P b q_c` checks at the eight vertices `v` of the
R box (integer quaternions) that `w = q̄_c ⊗ v` has `sg · w₀ > 0` and `|w_i| ≤ r₀ · sg · w₀`.  These
are linear in `v`, so they hold at every point `q` of the box (`box_lin`).  With `p = w/w₀` the
quaternion `q_c ⊗ (1, p) = (|q_c|²/w₀) q` has the same rotation (`cube_point`).
-/

namespace PackLean.Formal.TetintLocalCube

open PackLean.D40 (Prm Cen RBox rVerts rInCube qmulI nth iabs)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar PackLean.Formal.TetintCover
  PackLean.Formal.TetintLocalForm
open scoped Matrix

noncomputable section

/-- The integer quaternion of the box point `t` of the chart `ch` (`den` at the chart position). -/
def insQ (ch : ℕ) (d : ℤ) (t : ℤ × ℤ × ℤ) : List ℤ :=
  match ch with
  | 0 => [d, t.1, t.2.1, t.2.2]
  | 1 => [t.1, d, t.2.1, t.2.2]
  | 2 => [t.1, t.2.1, d, t.2.2]
  | _ => [t.1, t.2.1, t.2.2, d]

theorem rVerts_eq (den : ℤ) (b : RBox) :
    rVerts den b = (PackLean.D31.rVerts (cvB b)).map (insQ b.ch den) := by
  obtain ⟨ch, l0, l1, l2, h0, h1, h2⟩ := b
  rcases ch with _ | _ | _ | n <;> rfl

/-- A linear form of a 4-list. -/
def Lf (c0 c1 c2 c3 : ℝ) (v : List ℝ) : ℝ :=
  c0 * v.getD 0 0 + c1 * v.getD 1 0 + c2 * v.getD 2 0 + c3 * v.getD 3 0

/-- **A linear constraint at the vertices holds at the points of the box.** -/
theorem box_lin {b : RBox} {den : ℤ} {u : Fin 3 → ℝ} (hin : InB b b.ch u) (c0 c1 c2 c3 C : ℝ)
    (hv : ∀ t ∈ PackLean.D31.rVerts (cvB b), Lf c0 c1 c2 c3 ((insQ b.ch den t).map (Int.cast)) ≤ C) :
    Lf c0 c1 c2 c3 (QuadSem.chq b.ch den (u 0) (u 1) (u 2)) ≤ C := by
  rcases hch : b.ch with _ | _ | _ | n
  · have := OctCover.box_le hin (α := c0 * den) (β := c1) (γ := c2) (δ := c3) (C := C)
      fun t ht => by have := hv t ht; simpa [Lf, insQ, hch] using this
    simpa [Lf, QuadSem.chq] using this
  · have := OctCover.box_le hin (α := c1 * den) (β := c0) (γ := c2) (δ := c3) (C := C)
      fun t ht => by have := hv t ht; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith
  · have := OctCover.box_le hin (α := c2 * den) (β := c0) (γ := c1) (δ := c3) (C := C)
      fun t ht => by have := hv t ht; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith
  · have := OctCover.box_le hin (α := c3 * den) (β := c0) (γ := c1) (δ := c2) (C := C)
      fun t ht => by
        have := hv t ht
        simp only [insQ, hch] at this
        simp [Lf] at this; linarith
    simp [Lf, QuadSem.chq]; linarith

/-- The point `(h, k′, p₁, p₂, p₃)` as a function. -/
def xpt (h k p1 p2 p3 : ℝ) : ℕ → ℝ := fun i => [h, k, p1, p2, p3].getD i 0

theorem insQ_four (ch : ℕ) (d : ℤ) (t : ℤ × ℤ × ℤ) :
    ∃ v0 v1 v2 v3 : ℤ, insQ ch d t = [v0, v1, v2, v3] := by
  unfold insQ; split <;> exact ⟨_, _, _, _, rfl⟩

/-- The components of `q̄_c ⊗ v` as linear forms of `v`. -/
theorem qmulI_real (a0 a1 a2 a3 : ℤ) (v : List ℤ) (hv : ∃ v0 v1 v2 v3 : ℤ, v = [v0, v1, v2, v3]) :
    ((nth (qmulI [a0, -a1, -a2, -a3] v) 0 0 : ℤ) : ℝ) = Lf a0 a1 a2 a3 (v.map Int.cast) ∧
    ((nth (qmulI [a0, -a1, -a2, -a3] v) 1 0 : ℤ) : ℝ) = Lf (-a1) a0 a3 (-a2) (v.map Int.cast) ∧
    ((nth (qmulI [a0, -a1, -a2, -a3] v) 2 0 : ℤ) : ℝ) = Lf (-a2) (-a3) a0 a1 (v.map Int.cast) ∧
    ((nth (qmulI [a0, -a1, -a2, -a3] v) 3 0 : ℤ) : ℝ) = Lf (-a3) a2 (-a1) a0 (v.map Int.cast) := by
  obtain ⟨v0, v1, v2, v3, rfl⟩ := hv
  simp only [qmulI, nth, List.getD_cons_zero, List.getD_cons_succ, Lf, List.map_cons, List.map_nil]
  push_cast
  refine ⟨by ring, by ring, by ring, by ring⟩

set_option maxHeartbeats 2000000 in
/-- **A box inside the cube of a centre.**  At a rotation `R` of a box with `rInCube`, there is
`p` with `|p_i| ≤ r₀` such that for every `(h, k′)` the quaternion `q_c ⊗ (1, p)` has the rotation
entries `Qv · R` (`Qv = |q_c ⊗ (1, p)|² > 0`). -/
theorem cube_point {P : Prm} (hr0 : 0 < P.r0.2) {ce : Cen} {a0 a1 a2 a3 : ℤ}
    (hq : ce.q = [a0, a1, a2, a3]) (hqn : 0 < a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2) {rb : RBox}
    (hcube : rInCube P rb ce.q = true) {R : M3} {u : Fin 3 → ℝ}
    (hcu : Charts.ChartPt R P.den rb.ch u) (hin : InB rb rb.ch u) :
    ∃ p1 p2 p3 : ℝ, |p1| * P.r0.2 ≤ P.r0.1 ∧ |p2| * P.r0.2 ≤ P.r0.1 ∧ |p3| * P.r0.2 ≤ P.r0.1 ∧
      ∀ h k : ℝ, ∃ Qv : ℝ, 0 < Qv ∧
        (let q := qcx ce.q (xpt h k p1 p2 p3)
         (∀ t < 9, nth (QuadSem.rqList q.1 q.2.1 q.2.2.1 q.2.2.2) t 0
            = Qv * OctFar.rN R (t / 3) (t % 3)) ∧
         q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2 = Qv) := by
  -- the vertex conditions
  simp only [rInCube, hq, nth, List.getD_cons_zero, List.getD_cons_succ, List.any_cons,
    List.any_nil, Bool.or_false, Bool.or_eq_true, List.all_eq_true, Bool.and_eq_true,
    decide_eq_true_eq, List.mem_cons, List.mem_nil_iff, or_false, forall_eq_or_imp,
    forall_eq] at hcube
  rw [rVerts_eq] at hcube
  obtain ⟨sg, hsg, hall⟩ : ∃ sg : ℤ, (sg = 1 ∨ sg = -1) ∧
      ∀ x ∈ List.map (insQ rb.ch P.den) (PackLean.D31.rVerts (cvB rb)),
        sg * (qmulI [a0, -a1, -a2, -a3] x).getD 0 0 > 0 ∧
        iabs ((qmulI [a0, -a1, -a2, -a3] x).getD 1 0) * ↑P.r0.2 ≤
            P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] x).getD 0 0) ∧
        iabs ((qmulI [a0, -a1, -a2, -a3] x).getD 2 0) * ↑P.r0.2 ≤
            P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] x).getD 0 0) ∧
        iabs ((qmulI [a0, -a1, -a2, -a3] x).getD 3 0) * ↑P.r0.2 ≤
            P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] x).getD 0 0) := by
    rcases hcube with h | h
    · exact ⟨1, Or.inl rfl, h⟩
    · exact ⟨-1, Or.inr rfl, h⟩
  have hiabs : ∀ z : ℤ, ((iabs z : ℤ) : ℝ) = |(z : ℝ)| := fun z => by
    simp only [iabs, Int.natCast_natAbs, Int.cast_abs]
  set r1 : ℝ := ((P.r0.1 : ℤ) : ℝ) with hr1
  set r2 : ℝ := (P.r0.2 : ℝ) with hr2
  have hr2p : 0 < r2 := by rw [hr2]; exact_mod_cast hr0
  set sgr : ℝ := (sg : ℝ) with hsgr
  -- the real conditions at the vertices
  have hvert : ∀ t ∈ PackLean.D31.rVerts (cvB rb),
      let v := (insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ)
      0 < sgr * Lf a0 a1 a2 a3 v ∧
      |Lf (-a1) a0 a3 (-a2) v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) ∧
      |Lf (-a2) (-a3) a0 a1 v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) ∧
      |Lf (-a3) a2 (-a1) a0 v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) := by
    intro t ht v
    obtain ⟨c1, c2, c3, c4⟩ := hall _ (List.mem_map.2 ⟨t, ht, rfl⟩)
    obtain ⟨e0, e1, e2, e3⟩ := qmulI_real a0 a1 a2 a3 _ (insQ_four rb.ch P.den t)
    simp only [nth] at e0 e1 e2 e3
    have d1 : (0 : ℝ) < (sg : ℝ) * ((qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 0 0 : ℤ) := by
      exact_mod_cast c1
    have d2 := (show ((iabs ((qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 1 0) * P.r0.2 : ℤ) : ℝ)
      ≤ ((P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 0 0) : ℤ) : ℝ)
      by exact_mod_cast c2)
    have d3 := (show ((iabs ((qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 2 0) * P.r0.2 : ℤ) : ℝ)
      ≤ ((P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 0 0) : ℤ) : ℝ)
      by exact_mod_cast c3)
    have d4 := (show ((iabs ((qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 3 0) * P.r0.2 : ℤ) : ℝ)
      ≤ ((P.r0.1 * (sg * (qmulI [a0, -a1, -a2, -a3] (insQ rb.ch P.den t)).getD 0 0) : ℤ) : ℝ)
      by exact_mod_cast c4)
    push_cast [hiabs] at d1 d2 d3 d4
    rw [e0] at d1 d2 d3 d4
    rw [e1] at d2; rw [e2] at d3; rw [e3] at d4
    exact ⟨d1, d2, d3, d4⟩
  -- the same conditions at the point `q` of the box
  have Lf_lin : ∀ (c0 c1 c2 c3 d0 d1 d2 d3 α β : ℝ) (v : List ℝ),
      α * Lf c0 c1 c2 c3 v + β * Lf d0 d1 d2 d3 v
        = Lf (α * c0 + β * d0) (α * c1 + β * d1) (α * c2 + β * d2) (α * c3 + β * d3) v := by
    intro c0 c1 c2 c3 d0 d1 d2 d3 α β v; simp only [Lf]; ring
  set qq := QuadSem.chq rb.ch P.den (u 0) (u 1) (u 2) with hqq
  have pt_le : ∀ (c0 c1 c2 c3 d0 d1 d2 d3 α β : ℝ),
      (∀ t ∈ PackLean.D31.rVerts (cvB rb),
        α * Lf c0 c1 c2 c3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ))
          + β * Lf d0 d1 d2 d3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ)) ≤ 0) →
      α * Lf c0 c1 c2 c3 qq + β * Lf d0 d1 d2 d3 qq ≤ 0 := by
    intro c0 c1 c2 c3 d0 d1 d2 d3 α β h
    rw [Lf_lin]
    exact box_lin hin _ _ _ _ 0 fun t ht => by rw [← Lf_lin]; exact h t ht
  set W0 := Lf a0 a1 a2 a3 qq with hW0
  set W1 := Lf (-a1) a0 a3 (-a2) qq with hW1
  set W2 := Lf (-a2) (-a3) a0 a1 qq with hW2
  set W3 := Lf (-a3) a2 (-a1) a0 qq with hW3
  have g0 : 0 ≤ sgr * W0 := by
    have := pt_le a0 a1 a2 a3 0 0 0 0 (-sgr) 0 fun t ht => by
      have := (hvert t ht).1; simp only [zero_mul, add_zero]; linarith
    simp only [zero_mul, add_zero] at this; linarith
  have gi : ∀ (c0 c1 c2 c3 : ℝ),
      (∀ t ∈ PackLean.D31.rVerts (cvB rb),
        |Lf c0 c1 c2 c3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ))| * r2
          ≤ r1 * (sgr * Lf a0 a1 a2 a3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ)))) →
      |Lf c0 c1 c2 c3 qq| * r2 ≤ r1 * (sgr * W0) := by
    intro c0 c1 c2 c3 h
    have up := pt_le c0 c1 c2 c3 a0 a1 a2 a3 r2 (-(r1 * sgr)) fun t ht => by
      have := h t ht; have := le_abs_self (Lf c0 c1 c2 c3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ)))
      nlinarith
    have lo := pt_le c0 c1 c2 c3 a0 a1 a2 a3 (-r2) (-(r1 * sgr)) fun t ht => by
      have := h t ht; have := neg_abs_le (Lf c0 c1 c2 c3 ((insQ rb.ch P.den t).map (Int.cast : ℤ → ℝ)))
      nlinarith
    rcases abs_cases (Lf c0 c1 c2 c3 qq) with ⟨e, _⟩ | ⟨e, _⟩ <;> rw [e] <;> nlinarith
  have g1 := gi _ _ _ _ fun t ht => (hvert t ht).2.1
  have g2 := gi _ _ _ _ fun t ht => (hvert t ht).2.2.1
  have g3 := gi _ _ _ _ fun t ht => (hvert t ht).2.2.2
  -- the chart point
  obtain ⟨_, hN, hl⟩ := hcu
  set Q0 := qq.getD 0 0 with hQ0
  set Q1 := qq.getD 1 0 with hQ1
  set Q2 := qq.getD 2 0 with hQ2
  set Q3 := qq.getD 3 0 with hQ3
  have hsq : sgr * sgr = 1 := by rcases hsg with h | h <;> simp [hsgr, h]
  have hA : (0 : ℝ) < (a0 : ℝ) ^ 2 + (a1 : ℝ) ^ 2 + (a2 : ℝ) ^ 2 + (a3 : ℝ) ^ 2 := by
    exact_mod_cast hqn
  have hnorm : W0 ^ 2 + W1 ^ 2 + W2 ^ 2 + W3 ^ 2
      = ((a0 : ℝ) ^ 2 + (a1 : ℝ) ^ 2 + (a2 : ℝ) ^ 2 + (a3 : ℝ) ^ 2) * (Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2) := by
    simp only [hW0, hW1, hW2, hW3, Lf, hQ0, hQ1, hQ2, hQ3]; ring
  have hNpos : 0 < Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2 := hN
  have hpos : 0 < sgr * W0 := by
    rcases lt_or_eq_of_le g0 with h | h
    · exact h
    · exfalso
      have z1 : W1 = 0 := by
        have : |W1| * r2 ≤ 0 := by rw [← h] at g1; simpa using g1
        have := abs_nonneg W1
        exact abs_eq_zero.1 (le_antisymm (by nlinarith) (abs_nonneg _))
      have z2 : W2 = 0 := by
        have : |W2| * r2 ≤ 0 := by rw [← h] at g2; simpa using g2
        exact abs_eq_zero.1 (le_antisymm (by nlinarith [abs_nonneg W2]) (abs_nonneg _))
      have z3 : W3 = 0 := by
        have : |W3| * r2 ≤ 0 := by rw [← h] at g3; simpa using g3
        exact abs_eq_zero.1 (le_antisymm (by nlinarith [abs_nonneg W3]) (abs_nonneg _))
      have z0 : W0 = 0 := by
        have : sgr * (sgr * W0) = 0 := by rw [← h]; ring
        rw [← mul_assoc, hsq, one_mul] at this; exact this
      have := mul_pos hA hNpos
      rw [← hnorm, z0, z1, z2, z3] at this
      norm_num at this
  have hW0ne : W0 ≠ 0 := by intro h0; rw [h0, mul_zero] at hpos; exact lt_irrefl _ hpos
  have habs0 : |W0| = sgr * W0 := by
    rcases hsg with h | h
    · have : sgr = 1 := by simp [hsgr, h]
      rw [this, one_mul] at hpos ⊢; exact abs_of_pos hpos
    · have : sgr = -1 := by simp [hsgr, h]
      rw [this] at hpos ⊢; rw [abs_of_neg (by linarith)]; ring
  have hpb : ∀ Wi : ℝ, |Wi| * r2 ≤ r1 * (sgr * W0) → |Wi / W0| * r2 ≤ r1 := by
    intro Wi h
    rw [abs_div, habs0, div_mul_eq_mul_div, div_le_iff₀ hpos]
    linarith
  refine ⟨W1 / W0, W2 / W0, W3 / W0, hpb W1 g1, hpb W2 g2, hpb W3 g3, fun h k => ?_⟩
  set lam := ((a0 : ℝ) ^ 2 + (a1 : ℝ) ^ 2 + (a2 : ℝ) ^ 2 + (a3 : ℝ) ^ 2) / W0 with hlam
  have hlam0 : lam ≠ 0 := div_ne_zero hA.ne' hW0ne
  have hqv : qcx ce.q (xpt h k (W1 / W0) (W2 / W0) (W3 / W0))
      = (lam * Q0, lam * Q1, lam * Q2, lam * Q3) := by
    set A := (a0 : ℝ) ^ 2 + (a1 : ℝ) ^ 2 + (a2 : ℝ) ^ 2 + (a3 : ℝ) ^ 2 with hAdef
    have i0 : (a0 : ℝ) * W0 - a1 * W1 - a2 * W2 - a3 * W3 = A * Q0 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i1 : (a0 : ℝ) * W1 + a1 * W0 + a2 * W3 - a3 * W2 = A * Q1 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i2 : (a0 : ℝ) * W2 - a1 * W3 + a2 * W0 + a3 * W1 = A * Q2 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i3 : (a0 : ℝ) * W3 + a1 * W2 - a2 * W1 + a3 * W0 = A * Q3 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    simp only [qcx, hq, xpt, nth, List.getD_cons_zero, List.getD_cons_succ, qmulR, hlam]
    refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_))
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i0]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i1]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i2]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i3]; field_simp
  refine ⟨lam ^ 2 * (Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2), by positivity, ?_⟩
  simp only [hqv]
  refine ⟨fun t ht => ?_, by ring⟩
  simp only [QuadSem.rqList, List.cons.injEq] at hl
  obtain ⟨l0, l1, l2, l3, l4, l5, l6, l7, l8, _⟩ := hl
  interval_cases t <;> simp only [nth, QuadSem.rqList, List.getD_cons_zero, List.getD_cons_succ,
    OctFar.rN] <;> norm_num
  · linear_combination lam ^ 2 * l0
  · linear_combination lam ^ 2 * l1
  · linear_combination lam ^ 2 * l2
  · linear_combination lam ^ 2 * l3
  · linear_combination lam ^ 2 * l4
  · linear_combination lam ^ 2 * l5
  · linear_combination lam ^ 2 * l6
  · linear_combination lam ^ 2 * l7
  · linear_combination lam ^ 2 * l8

end

end PackLean.Formal.TetintLocalCube
