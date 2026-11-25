import PackLean.Formal.TetintLocalTree

/-!
# A9 stage 7e-3 (part 5): the local hypothesis `TetintCover.HLoc` from the centre trees of `D40`

Design: `plan/A9f_tet_design.md` §10.  `hloc_of`: with the constants (`LocConsts`), the centres
(integer quaternions `q_c ≠ 0`) and, for every centre and every face, a passed `faceRun` whose
candidate table has no type S, the local hypothesis `HLoc P` holds.

The point `(h, k′)` of the region and the rotation `R` of an R box in the cube of the centre give
`x = (h, k′, p)` (`TetintLocalCube.cube_point`); the transverse coordinate `ζ` (tube `(k′, p)`, point
`(h, k′, p)`) is `r ζ̂` with `r = max |ζ_i|` and `ζ̂` on a face of the cube; the leaf of that face
that contains `(h, r, ζ̂)` (tube) or `(r, ζ̂)` (point) gives `e₀ ≥ 0` and `Λ > 0`, so
`P_c = e₀ + r Λ ≥ 0`, and `P_c` is `8 s_d KD |q|² (dualC + sgn κ̃₁)` (`locP_val`).
-/

namespace PackLean.Formal.TetintLocal

open PackLean.D40 (Prm Cen Cand Poly Mono LBox LTok faceRun faceList rootBox candItems candOkLoc
  candOk e0Ok splitP zdeg shiftLb nth ratToD zlo decCand locP centerMQ RBox rInCube rboxWf)
open PackLean.Formal.TetintPoly
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.TetintFar PackLean.Formal.TetintCover
  PackLean.Formal.TetintLocalForm PackLean.Formal.TetintLocalCube PackLean.Formal.TetintLocalTree
open PackLean.Formal.TetReduction (Low MaxRep)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. Constants and root boxes -/

theorem ratToD_val {D v : ℤ} {x : PackLean.D40.RatI} (h : ratToD D x = some v) :
    (v : ℝ) * x.2 = x.1 * D := by
  unfold ratToD at h
  split_ifs at h with hc
  simp only [Option.some.injEq] at h
  subst h
  simp only [Bool.and_eq_true, bne_iff_ne, ne_eq, beq_iff_eq] at hc
  have hd : (x.2 : ℤ) ∣ x.1 * D := Int.dvd_of_emod_eq_zero hc.2
  have e : x.1 * D / (x.2 : ℤ) * x.2 = x.1 * D := Int.ediv_mul_cancel hd
  have e' : ((x.1 * D / (x.2 : ℤ) * x.2 : ℤ) : ℝ) = ((x.1 * D : ℤ) : ℝ) := by rw [e]
  push_cast at e'
  exact e'

theorem faceList_true :
    faceList true = [(0, 1), (1, 1), (1, -1), (2, 1), (2, -1), (3, 1), (3, -1)] := by decide

theorem faceList_false :
    faceList false = [(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] := by
  decide

/-- One transverse coordinate of a root box. -/
theorem coord_ok {du : ℤ} (hdu : (0 : ℝ) < du) {b : Bool} {fv zl : ℤ} {y : ℝ}
    (e : b = true → y = fv) (l : (zl : ℝ) ≤ y) (u : y ≤ 1) :
    (((if b = true then fv * du else zl * du : ℤ)) : ℝ) ≤ du * y ∧
      (du : ℝ) * y ≤ (((if b = true then fv * du else du : ℤ)) : ℝ) := by
  by_cases hb : b = true
  · rw [if_pos hb, if_pos hb, e hb]; push_cast; constructor <;> linarith [mul_comm (fv : ℝ) du]
  · rw [if_neg hb, if_neg hb]; push_cast; constructor <;> nlinarith

/-- The root box of a tube face contains the leaf point `(h, r, ζ̂)`. -/
theorem rootBox_tube {P : Prm} (hdu : 0 < P.du) {hmD rD : ℤ} (hh : ratToD P.du P.hmax = some hmD)
    (hr : ratToD P.du P.r0 = some rD) {fi : ℕ} {fv : ℤ} {lo hi : List ℤ}
    (hrb : rootBox P true fi fv = some (lo, hi)) (y : ℕ → ℝ)
    (h0 : 0 ≤ (P.du : ℝ) * y 0) (h0' : (P.du : ℝ) * y 0 ≤ hmD)
    (h1 : 0 ≤ (P.du : ℝ) * y 1) (h1' : (P.du : ℝ) * y 1 ≤ rD)
    (hz : ∀ j < 4, (j = fi → y (2 + j) = fv) ∧ ((nth (zlo true) j 0 : ℤ) : ℝ) ≤ y (2 + j) ∧
      y (2 + j) ≤ 1) :
    InL P.du ⟨lo, hi⟩ y := by
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hdu
  simp only [rootBox, hh, hr, if_true, Option.some.injEq, Prod.mk.injEq] at hrb
  obtain ⟨rfl, rfl⟩ := hrb
  have c : ∀ j < 4, _ := fun j hj =>
    coord_ok (b := (j == fi)) (fv := fv) (zl := nth (zlo true) j 0) hdu'
      (fun hb => (hz j hj).1 (by simpa using hb)) (hz j hj).2.1 (hz j hj).2.2
  intro k hk
  interval_cases k
  · simpa [nth] using ⟨h0, h0'⟩
  · simpa [nth] using ⟨h1, h1'⟩
  · simpa [nth, zlo, List.range, List.range.loop] using c 0 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 1 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 2 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 3 (by norm_num)

/-- The root box of a point face contains the leaf point `(r, ζ̂)`. -/
theorem rootBox_point {P : Prm} (hdu : 0 < P.du) {hmD rD : ℤ} (hh : ratToD P.du P.hmax = some hmD)
    (hr : ratToD P.du P.r0 = some rD) {fi : ℕ} {fv : ℤ} {lo hi : List ℤ}
    (hrb : rootBox P false fi fv = some (lo, hi)) (y : ℕ → ℝ)
    (h0 : 0 ≤ (P.du : ℝ) * y 0) (h0' : (P.du : ℝ) * y 0 ≤ rD)
    (hz : ∀ j < 5, (j = fi → y (1 + j) = fv) ∧ ((nth (zlo false) j 0 : ℤ) : ℝ) ≤ y (1 + j) ∧
      y (1 + j) ≤ 1) :
    InL P.du ⟨lo, hi⟩ y := by
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hdu
  simp only [rootBox, hh, hr, Bool.false_eq_true, if_false, Option.some.injEq,
    Prod.mk.injEq] at hrb
  obtain ⟨rfl, rfl⟩ := hrb
  have c : ∀ j < 5, _ := fun j hj =>
    coord_ok (b := (j == fi)) (fv := fv) (zl := nth (zlo false) j 0) hdu'
      (fun hb => (hz j hj).1 (by simpa using hb)) (hz j hj).2.1 (hz j hj).2.2
  intro k hk
  interval_cases k
  · simpa [nth] using ⟨h0, h0'⟩
  · simpa [nth, zlo, List.range, List.range.loop] using c 0 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 1 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 2 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 3 (by norm_num)
  · simpa [nth, zlo, List.range, List.range.loop] using c 4 (by norm_num)

/-! ## 2. The faces -/

theorem unit_of {a r : ℝ} (hr : 0 < r) (ha : |a| = r) : a / r = 1 ∨ a / r = -1 := by
  rcases abs_choice a with h | h
  · left; rw [← h, ha, div_self hr.ne']
  · right; have : a = -r := by linarith
    rw [this, neg_div, div_self hr.ne']

theorem div_le_one_abs {a r : ℝ} (hr : 0 < r) (ha : |a| ≤ r) : -1 ≤ a / r ∧ a / r ≤ 1 := by
  rw [← abs_le, abs_div, abs_of_pos hr, div_le_one hr]; exact ha

/-- **The tube faces.** `ζ = (k′, p)` with `k′ ≥ 0` is `r ζ̂` with `r = max |ζ_i|` and `ζ̂` on a
face `(fi, fv)` of `faceList true`. -/
theorem face_tube (k p1 p2 p3 : ℝ) (hk : 0 ≤ k) :
    ∃ r z0 z1 z2 z3 : ℝ, ∃ (fidx fi : ℕ) (fv : ℤ), (faceList true)[fidx]? = some (fi, fv) ∧ 0 ≤ r ∧
      r ≤ max (max k |p1|) (max |p2| |p3|) ∧
      k = r * z0 ∧ p1 = r * z1 ∧ p2 = r * z2 ∧ p3 = r * z3 ∧
      ∀ j < 4, (j = fi → [z0, z1, z2, z3].getD j 0 = (fv : ℝ)) ∧
        ((nth (zlo true) j 0 : ℤ) : ℝ) ≤ [z0, z1, z2, z3].getD j 0 ∧ [z0, z1, z2, z3].getD j 0 ≤ 1 := by
  set r := max (max k |p1|) (max |p2| |p3|) with hr
  have hkr : k ≤ r := le_trans (le_max_left _ _) (le_max_left _ _)
  have h1r : |p1| ≤ r := le_trans (le_max_right _ _) (le_max_left _ _)
  have h2r : |p2| ≤ r := le_trans (le_max_left _ _) (le_max_right _ _)
  have h3r : |p3| ≤ r := le_trans (le_max_right _ _) (le_max_right _ _)
  rw [faceList_true]
  rcases eq_or_lt_of_le (le_trans hk hkr) with h0 | hpos
  · -- r = 0
    have ek : k = 0 := by linarith
    have e1 : p1 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    have e2 : p2 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    have e3 : p3 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    refine ⟨r, 1, 0, 0, 0, 0, 0, 1, rfl, le_of_eq h0, le_rfl, by rw [← h0]; simp [ek],
      by rw [← h0]; simp [e1], by rw [← h0]; simp [e2], by rw [← h0]; simp [e3], fun j hj => ?_⟩
    interval_cases j <;> simp [zlo, nth]
  have bz : ∀ a : ℝ, |a| ≤ r → -1 ≤ a / r ∧ a / r ≤ 1 := fun a ha => div_le_one_abs hpos ha
  have e : ∀ a : ℝ, a = r * (a / r) := fun a => by field_simp
  have bk : 0 ≤ k / r ∧ k / r ≤ 1 := ⟨div_nonneg hk hpos.le, (div_le_one hpos).2 hkr⟩
  have base : ∀ j < 4, ((nth (zlo true) j 0 : ℤ) : ℝ) ≤ [k / r, p1 / r, p2 / r, p3 / r].getD j 0 ∧
      [k / r, p1 / r, p2 / r, p3 / r].getD j 0 ≤ 1 := by
    intro j hj
    interval_cases j <;> simp [zlo, nth]
    · exact bk
    · exact bz p1 h1r
    · exact bz p2 h2r
    · exact bz p3 h3r
  -- which coordinate is the largest
  have hmax : k = r ∨ |p1| = r ∨ |p2| = r ∨ |p3| = r := by
    rcases max_choice (max k |p1|) (max |p2| |p3|) with h | h <;> rw [h] at hr
    · rcases max_choice k |p1| with h' | h' <;> rw [h'] at hr
      · exact Or.inl hr.symm
      · exact Or.inr (Or.inl hr.symm)
    · rcases max_choice |p2| |p3| with h' | h' <;> rw [h'] at hr
      · exact Or.inr (Or.inr (Or.inl hr.symm))
      · exact Or.inr (Or.inr (Or.inr hr.symm))
  rcases hmax with hm | hm | hm | hm
  · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 0, 0, 1, rfl, hpos.le, le_rfl, e k, e p1, e p2, e p3,
      fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
    subst hj0; simp [hm, div_self hpos.ne']
  · rcases unit_of hpos hm with hs | hs
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 1, 1, 1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 2, 1, -1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]
  · rcases unit_of hpos hm with hs | hs
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 3, 2, 1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 4, 2, -1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]
  · rcases unit_of hpos hm with hs | hs
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 5, 3, 1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]
    · refine ⟨r, k / r, p1 / r, p2 / r, p3 / r, 6, 3, -1, rfl, hpos.le, le_rfl, e k, e p1, e p2,
        e p3, fun j hj => ⟨fun hj0 => ?_, base j hj⟩⟩
      subst hj0; simp [hs]

/-- **The point faces.** `ζ = (h, k′, p)` with `h, k′ ≥ 0`. -/
theorem face_point (h k p1 p2 p3 : ℝ) (hh : 0 ≤ h) (hk : 0 ≤ k) :
    ∃ r z0 z1 z2 z3 z4 : ℝ, ∃ (fidx fi : ℕ) (fv : ℤ), (faceList false)[fidx]? = some (fi, fv) ∧ 0 ≤ r ∧
      r ≤ max (max h k) (max |p1| (max |p2| |p3|)) ∧
      h = r * z0 ∧ k = r * z1 ∧ p1 = r * z2 ∧ p2 = r * z3 ∧ p3 = r * z4 ∧
      ∀ j < 5, (j = fi → [z0, z1, z2, z3, z4].getD j 0 = (fv : ℝ)) ∧
        ((nth (zlo false) j 0 : ℤ) : ℝ) ≤ [z0, z1, z2, z3, z4].getD j 0 ∧
        [z0, z1, z2, z3, z4].getD j 0 ≤ 1 := by
  set r := max (max h k) (max |p1| (max |p2| |p3|)) with hr
  have hhr : h ≤ r := le_trans (le_max_left _ _) (le_max_left _ _)
  have hkr : k ≤ r := le_trans (le_max_right _ _) (le_max_left _ _)
  have h1r : |p1| ≤ r := le_trans (le_max_left _ _) (le_max_right _ _)
  have h2r : |p2| ≤ r := le_trans (le_trans (le_max_left _ _) (le_max_right _ _)) (le_max_right _ _)
  have h3r : |p3| ≤ r := le_trans (le_trans (le_max_right _ _) (le_max_right _ _)) (le_max_right _ _)
  rw [faceList_false]
  rcases eq_or_lt_of_le (le_trans hh hhr) with h0 | hpos
  · have eh : h = 0 := by linarith
    have ek : k = 0 := by linarith
    have e1 : p1 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    have e2 : p2 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    have e3 : p3 = 0 := abs_eq_zero.1 (le_antisymm (by linarith) (abs_nonneg _))
    refine ⟨r, 1, 0, 0, 0, 0, 0, 0, 1, rfl, le_of_eq h0, le_rfl, by rw [← h0]; simp [eh],
      by rw [← h0]; simp [ek], by rw [← h0]; simp [e1], by rw [← h0]; simp [e2],
      by rw [← h0]; simp [e3], fun j hj => ?_⟩
    interval_cases j <;> simp [zlo, nth]
  have bz : ∀ a : ℝ, |a| ≤ r → -1 ≤ a / r ∧ a / r ≤ 1 := fun a ha => div_le_one_abs hpos ha
  have e : ∀ a : ℝ, a = r * (a / r) := fun a => by field_simp
  have bh : 0 ≤ h / r ∧ h / r ≤ 1 := ⟨div_nonneg hh hpos.le, (div_le_one hpos).2 hhr⟩
  have bk : 0 ≤ k / r ∧ k / r ≤ 1 := ⟨div_nonneg hk hpos.le, (div_le_one hpos).2 hkr⟩
  have base : ∀ j < 5, ((nth (zlo false) j 0 : ℤ) : ℝ) ≤ [h / r, k / r, p1 / r, p2 / r, p3 / r].getD j 0 ∧
      [h / r, k / r, p1 / r, p2 / r, p3 / r].getD j 0 ≤ 1 := by
    intro j hj
    interval_cases j <;> simp [zlo, nth]
    · exact bh
    · exact bk
    · exact bz p1 h1r
    · exact bz p2 h2r
    · exact bz p3 h3r
  have hmax : h = r ∨ k = r ∨ |p1| = r ∨ |p2| = r ∨ |p3| = r := by
    rcases max_choice (max h k) (max |p1| (max |p2| |p3|)) with hc | hc <;> rw [hc] at hr
    · rcases max_choice h k with h' | h' <;> rw [h'] at hr
      · exact Or.inl hr.symm
      · exact Or.inr (Or.inl hr.symm)
    · rcases max_choice |p1| (max |p2| |p3|) with h' | h' <;> rw [h'] at hr
      · exact Or.inr (Or.inr (Or.inl hr.symm))
      · rcases max_choice |p2| |p3| with h'' | h'' <;> rw [h''] at hr
        · exact Or.inr (Or.inr (Or.inr (Or.inl hr.symm)))
        · exact Or.inr (Or.inr (Or.inr (Or.inr hr.symm)))
  have mk : ∀ (fidx fi : ℕ) (fv : ℤ), ([(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] :
      List (ℕ × ℤ))[fidx]? = some (fi, fv) →
      (([h / r, k / r, p1 / r, p2 / r, p3 / r] : List ℝ).getD fi 0 = (fv : ℝ)) →
      ∃ r' z0 z1 z2 z3 z4 : ℝ, ∃ (fidx fi : ℕ) (fv : ℤ),
        ([(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1), (4, 1), (4, -1)] :
          List (ℕ × ℤ))[fidx]? = some (fi, fv) ∧ 0 ≤ r' ∧ r' ≤ r ∧
        h = r' * z0 ∧ k = r' * z1 ∧ p1 = r' * z2 ∧ p2 = r' * z3 ∧ p3 = r' * z4 ∧
        ∀ j < 5, (j = fi → [z0, z1, z2, z3, z4].getD j 0 = (fv : ℝ)) ∧
          ((nth (zlo false) j 0 : ℤ) : ℝ) ≤ [z0, z1, z2, z3, z4].getD j 0 ∧
          [z0, z1, z2, z3, z4].getD j 0 ≤ 1 := by
    intro fidx fi fv hf hv
    exact ⟨r, h / r, k / r, p1 / r, p2 / r, p3 / r, fidx, fi, fv, hf, hpos.le, le_rfl, e h, e k,
      e p1, e p2, e p3, fun j hj => ⟨fun hj0 => by subst hj0; exact hv, base j hj⟩⟩
  rcases hmax with hm | hm | hm | hm | hm
  · exact mk 0 0 1 rfl (by simp [hm, div_self hpos.ne'])
  · exact mk 1 1 1 rfl (by simp [hm, div_self hpos.ne'])
  · rcases unit_of hpos hm with hs | hs
    · exact mk 2 2 1 rfl (by simp [hs])
    · exact mk 3 2 (-1) rfl (by simp [hs])
  · rcases unit_of hpos hm with hs | hs
    · exact mk 4 3 1 rfl (by simp [hs])
    · exact mk 5 3 (-1) rfl (by simp [hs])
  · rcases unit_of hpos hm with hs | hs
    · exact mk 6 4 1 rfl (by simp [hs])
    · exact mk 7 4 (-1) rfl (by simp [hs])

/-! ## 3. The leaves -/

theorem wf_of {lo hi : List ℤ} (hl : lo.length = 6) (hh : hi.length = 6)
    (h : (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) lo hi).all id = true) :
    ∀ i < lo.length, nth lo i 0 ≤ nth hi i 0 ∧ (nth hi i 0 - nth lo i 0) % 2 = 0 := by
  intro i hi'
  have hz : i < (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) lo hi).length := by
    simp [List.length_zipWith]; omega
  have := List.all_eq_true.1 h _ (List.getElem_mem hz)
  rw [List.getElem_zipWith] at this
  simp only [id, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at this
  simp only [nth]
  rw [List.getD_eq_getElem _ _ hi', List.getD_eq_getElem _ _ (by omega)]
  exact this

theorem lam_WF (tube : Bool) (p : Poly) : WF 6 (splitP tube p).2 := by
  rw [splitP_eq]
  apply psum_WF
  intro q hq
  obtain ⟨e, _, rfl⟩ := List.mem_map.1 hq
  intro e' he'
  simp only [List.mem_singleton] at he'
  rw [he']
  unfold keyOf; split <;> rfl

theorem item_code {P : Prm} {ce : Cen} {tab : List ℕ} {it : Bool × Poly × Poly}
    (h : it ∈ candItems P ce tab) : ∃ code ∈ tab,
      it = (candOkLoc P ce.side code, (splitP ce.tube (locP P ce.side (centerMQ ce) (decCand code))).1,
        (splitP ce.tube (locP P ce.side (centerMQ ce) (decCand code))).2) := by
  simp only [candItems, List.mem_map] at h
  obtain ⟨code, hc, rfl⟩ := h
  exact ⟨code, hc, rfl⟩

/-! ## 4. The local hypothesis -/

/-- The data of the local checks (checked once per case). -/
structure LocData (P : Prm) : Prop where
  du : 0 < P.du
  sd : 0 < P.sbar.2
  kd : 0 < P.kd
  msign : P.msign = 1
  mus : ∀ m ∈ P.mus, 0 < m
  hm : 0 < P.hmax.2
  r0 : 0 < P.r0.2
  hmD : ∃ v, ratToD P.du P.hmax = some v
  rD : ∃ v, ratToD P.du P.r0 = some v
  cens : ∀ (c : ℕ) (ce : Cen), P.cens[c]? = some ce → (ce.side = 0 ∨ ce.side = 1) ∧
    ∃ a0 a1 a2 a3 : ℤ, ce.q = [a0, a1, a2, a3] ∧ 0 < a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2
  runs : ∀ (c : ℕ) (ce : Cen), P.cens[c]? = some ce → ∀ fidx < (faceList ce.tube).length,
    ∃ tab toks, (faceRun P c fidx tab toks).1 = true ∧ ∀ code ∈ tab, (decCand code).typ ≠ 2

/-- A centre polynomial `≥ 0` at the point gives `Low`. -/
theorem low_of_P {P : Prm} (hd : LocData P) {ce : Cen} (hside : ce.side = 0 ∨ ce.side = 1)
    {x : ℕ → ℝ} {Qv : ℝ} (hQv : 0 < Qv) {R : M3}
    (hM : ∀ t < 9, PV x (nth (centerMQ ce).1 t []) (Qv * OctFar.rN R (t / 3) (t % 3)))
    (hQ : PV x (centerMQ ce).2 Qv) {code : ℕ} (ht : (decCand code).typ ≠ 2)
    (hok : candOkLoc P ce.side code = true)
    (hP : 0 ≤ pv (locP P ce.side (centerMQ ce) (decCand code)) x)
    (h0 : 0 ≤ x 0) (h1 : 0 ≤ x 1) (h01 : x 0 + x 1 ≤ 1) :
    Low VD 4 (cbD P) (pS ce.side (x 0) (x 1)) R (-(sgn ce.side * kapN P (0, 1) (x 0) (x 1))) := by
  have hv := locP_val (x := x) hd.msign hd.sd hd.kd hside ht hM hQ
  rw [hv.2] at hP
  have hc : 0 < 8 * ((P.sbar.2 : ℕ) : ℝ) * (P.kd : ℝ) * Qv := by
    have : (0 : ℝ) < (P.sbar.2 : ℕ) := by exact_mod_cast hd.sd
    have : (0 : ℝ) < P.kd := by exact_mod_cast hd.kd
    positivity
  have := (mul_nonneg_iff_of_pos_left hc).1 hP
  have hok' : candOk P ce.side code = true := by
    simp only [candOkLoc, Bool.and_eq_true] at hok; exact hok.1
  exact low_pS h0 h1 h01 hside (candOk_mu hd.mus hok') (by linarith)

theorem opt_some {α : Type*} {a b : α} (h : some a = some b) : a = b := Option.some.inj h

/-- **The local hypothesis** from the centre trees. -/
theorem hloc_of {P : Prm} (hd : LocData P) : HLoc P := by
  intro c ce hce rb hwf hcube R hR hmax u hcu hin h k hL
  obtain ⟨hside, a0, a1, a2, a3, hq, hqn⟩ := hd.cens c ce hce
  obtain ⟨p1, p2, p3, hp1, hp2, hp3, hpt⟩ := cube_point hd.r0 hq hqn hcube hcu hin
  obtain ⟨Qv, hQv, hrq, hN⟩ := hpt h k
  obtain ⟨hmD, hhm⟩ := hd.hmD
  obtain ⟨rD, hrD⟩ := hd.rD
  have hdu' : (0 : ℝ) < P.du := by exact_mod_cast hd.du
  have hm2 : (0 : ℝ) < (P.hmax.2 : ℝ) := by exact_mod_cast hd.hm
  have hr2 : (0 : ℝ) < (P.r0.2 : ℝ) := by exact_mod_cast hd.r0
  have ehm := ratToD_val hhm
  have erD := ratToD_val hrD
  -- `t · r₂ ≤ r₁` gives `du · t ≤ rD`
  have toD : ∀ t : ℝ, t * (P.r0.2 : ℝ) ≤ P.r0.1 → (P.du : ℝ) * t ≤ rD := by
    intro t ht
    have : (P.du : ℝ) * t * P.r0.2 ≤ rD * P.r0.2 := by rw [erD]; nlinarith
    exact le_of_mul_le_mul_right this hr2
  have toDh : ∀ t : ℝ, t * (P.hmax.2 : ℝ) ≤ P.hmax.1 → (P.du : ℝ) * t ≤ hmD := by
    intro t ht
    have : (P.du : ℝ) * t * P.hmax.2 ≤ hmD * P.hmax.2 := by rw [ehm]; nlinarith
    exact le_of_mul_le_mul_right this hm2
  obtain ⟨hh0, hk0, hhk, hreg⟩ := hL
  -- a leaf of a face gives `P ≥ 0` at `x`
  set x := xpt h k p1 p2 p3 with hx
  have hMQ := centerMQ_PV (x := x) hq
  have hM : ∀ t < 9, PV x (nth (centerMQ ce).1 t []) (Qv * OctFar.rN R (t / 3) (t % 3)) :=
    fun t ht => (hMQ.1 t ht).congr (hrq t ht)
  have hQ : PV x (centerMQ ce).2 Qv := hMQ.2.congr hN
  have fin : ∀ code, (decCand code).typ ≠ 2 → candOkLoc P ce.side code = true →
      0 ≤ pv (locP P ce.side (centerMQ ce) (decCand code)) x →
      Low VD 4 (cbD P) (pS ce.side h k) R (-(sgn ce.side * kapN P (0, 1) h k)) := by
    intro code ht hok hP
    exact low_of_P hd hside hQv hM hQ ht hok hP hh0 hk0 hhk
  -- the run of the face `fidx`
  have leaf : ∀ fidx < (faceList ce.tube).length, ∀ fi fv, (faceList ce.tube)[fidx]? = some (fi, fv) →
      ∃ tab, (∀ code ∈ tab, (decCand code).typ ≠ 2) ∧ ∃ lo hi, rootBox P ce.tube fi fv = some (lo, hi) ∧
        ∀ y, InL P.du ⟨lo, hi⟩ y → ∃ B, LGood P ce.tube (candItems P ce tab) B ∧ InL P.du B y := by
    intro fidx hfidx fi fv hf
    obtain ⟨tab, toks, hrun, htab⟩ := hd.runs c ce hce fidx hfidx
    obtain ⟨ce', fi', fv', lo, hi, hce', hf', hrb, hcov⟩ := faceRun_spec hrun
    rw [hce] at hce'
    have e1 := opt_some hce'
    subst e1
    rw [hf] at hf'
    obtain ⟨rfl, rfl⟩ := Prod.mk.injEq _ _ _ _ ▸ opt_some hf'
    exact ⟨tab, htab, lo, hi, hrb, hcov⟩
  by_cases htube : ce.tube = true
  · -- a tube
    rw [htube, if_pos rfl] at hreg
    obtain ⟨hhm', hkr⟩ := hreg
    obtain ⟨r, z0, z1, z2, z3, fidx, fi, fv, hf, hr0, hrle, ek, e1, e2, e3, hz⟩ :=
      face_tube k p1 p2 p3 hk0
    have hfidx : fidx < (faceList ce.tube).length := by
      rw [htube]; exact (List.getElem?_eq_some_iff.1 hf).1
    obtain ⟨tab, htab, lo, hi, hrb, hcov⟩ := leaf fidx hfidx fi fv (by rw [htube]; exact hf)
    rw [htube] at hrb hcov
    have hrr : (P.du : ℝ) * r ≤ rD := by
      apply toD
      have : r * (P.r0.2 : ℝ) ≤ max (max k |p1|) (max |p2| |p3|) * P.r0.2 :=
        mul_le_mul_of_nonneg_right hrle hr2.le
      refine le_trans this ?_
      rcases max_choice (max k |p1|) (max |p2| |p3|) with hc | hc <;> rw [hc]
      · rcases max_choice k |p1| with hc' | hc' <;> rw [hc'] <;> assumption
      · rcases max_choice |p2| |p3| with hc' | hc' <;> rw [hc'] <;> assumption
    set y := y6 h r z0 z1 z2 z3 with hy
    have hyin : InL P.du ⟨lo, hi⟩ y := by
      refine rootBox_tube hd.du hhm hrD hrb y (by simp [hy, y6]; positivity)
        (by simpa [hy, y6] using toDh h hhm') (by simp [hy, y6]; positivity) (by simpa [hy, y6] using hrr)
        fun j hj => ?_
      simpa [hy, y6, Nat.add_comm 2 j] using hz j hj
    obtain ⟨B, ⟨hl1, hl2, hw, it, hit, hit1, he0, hsh⟩, hB⟩ := hcov y hyin
    obtain ⟨code, hcode, rfl⟩ := item_code hit
    simp only at hit1 he0 hsh
    rw [htube] at he0 hsh
    have hWF := (locP_val (x := x) hd.msign hd.sd hd.kd hside (htab code hcode) hM hQ).1
    refine fin code (htab code hcode) hit1 ?_
    have hsplit := splitP_tube hWF h r z0 z1 z2 z3
    have hxe : x = xpt h (r * z0) (r * z1) (r * z2) (r * z3) := by rw [hx, ek, e1, e2, e3]
    rw [hxe, hsplit]
    have hE : 0 ≤ pv (splitP true (locP P ce.side (centerMQ ce) (decCand code))).1
        (xpt h (r * z0) (r * z1) (r * z2) (r * z3)) :=
      e0Ok_tube hd.du hWF he0 (by simpa [hy, y6] using (hB 0 (by norm_num)).1)
        (by simpa [hy, y6] using (hB 0 (by norm_num)).2) _ _ _ _
    have hLam : 0 < pv (splitP true (locP P ce.side (centerMQ ce) (decCand code))).2 y :=
      shiftLb_pos hd.du (by rw [hl1]; exact lam_WF _ _) (by rw [hl1, hl2]) (wf_of hl1 hl2 hw) y
        (fun i hi => hB i (by rw [hl1] at hi; exact hi)) hsh
    nlinarith
  · -- a point
    have htf : ce.tube = false := by simpa using htube
    rw [if_neg htube] at hreg
    obtain ⟨hhr, hkr⟩ := hreg
    obtain ⟨r, z0, z1, z2, z3, z4, fidx, fi, fv, hf, hr0, hrle, eh, ek, e1, e2, e3, hz⟩ :=
      face_point h k p1 p2 p3 hh0 hk0
    have hfidx : fidx < (faceList ce.tube).length := by
      rw [htf]; exact (List.getElem?_eq_some_iff.1 hf).1
    obtain ⟨tab, htab, lo, hi, hrb, hcov⟩ := leaf fidx hfidx fi fv (by rw [htf]; exact hf)
    rw [htf] at hrb hcov
    have hrr : (P.du : ℝ) * r ≤ rD := by
      apply toD
      have : r * (P.r0.2 : ℝ) ≤ max (max h k) (max |p1| (max |p2| |p3|)) * P.r0.2 :=
        mul_le_mul_of_nonneg_right hrle hr2.le
      refine le_trans this ?_
      rcases max_choice (max h k) (max |p1| (max |p2| |p3|)) with hc | hc <;> rw [hc]
      · rcases max_choice h k with hc' | hc' <;> rw [hc'] <;> assumption
      · rcases max_choice |p1| (max |p2| |p3|) with hc' | hc' <;> rw [hc']
        · assumption
        · rcases max_choice |p2| |p3| with hc'' | hc'' <;> rw [hc''] <;> assumption
    set y := y6 r z0 z1 z2 z3 z4 with hy
    have hyin : InL P.du ⟨lo, hi⟩ y := by
      refine rootBox_point hd.du hhm hrD hrb y (by simp [hy, y6]; positivity)
        (by simpa [hy, y6] using hrr) fun j hj => ?_
      simpa [hy, y6, Nat.add_comm 1 j] using hz j hj
    obtain ⟨B, ⟨hl1, hl2, hw, it, hit, hit1, he0, hsh⟩, hB⟩ := hcov y hyin
    obtain ⟨code, hcode, rfl⟩ := item_code hit
    simp only at hit1 he0 hsh
    rw [htf] at he0 hsh
    have hWF := (locP_val (x := x) hd.msign hd.sd hd.kd hside (htab code hcode) hM hQ).1
    refine fin code (htab code hcode) hit1 ?_
    have hsplit := splitP_point hWF r z0 z1 z2 z3 z4
    have hxe : x = xpt (r * z0) (r * z1) (r * z2) (r * z3) (r * z4) := by
      rw [hx, eh, ek, e1, e2, e3]
    rw [hxe, hsplit]
    have hE := e0Ok_point he0 (xpt (r * z0) (r * z1) (r * z2) (r * z3) (r * z4))
    have hLam : 0 < pv (splitP false (locP P ce.side (centerMQ ce) (decCand code))).2 y :=
      shiftLb_pos hd.du (by rw [hl1]; exact lam_WF _ _) (by rw [hl1, hl2]) (wf_of hl1 hl2 hw) y
        (fun i hi => hB i (by rw [hl1] at hi; exact hi)) hsh
    nlinarith

end

#assert_std_axioms PackLean.Formal.TetintLocal.hloc_of

end PackLean.Formal.TetintLocal
