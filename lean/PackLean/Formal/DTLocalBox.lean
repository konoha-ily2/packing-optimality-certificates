import PackLean.Formal.DTCover
import PackLean.Formal.TetintLocalCube

/-!
# A9k stage 7c-2 (part 2): the local hypothesis of the tubes gives the box-level `HLocB`

Design: `plan/A9k_dodintet_design.md` §2 (the row "L の葉"), §3 (7c-2).

* `HLocTube P t`: **the local lemma of one tube** in real terms (stage 7c-3 proves it from
  `tubeRun`): at every point `n` of the parallelogram `dl·n = p0 + u·d + w·ŵ`
  (`ulo ≤ u ≤ uhi`, `|w| ≤ r0`) and every rotation `R` of the quaternion `q_c ⊗ (1, p)`
  (`|p_i| ≤ r0`), the bound `Low … κ_t(n)` with κ the tube form `kapForm P t.side 0`.
* `inside_spec`: the n box passes `inside` ⇒ each of its points is a point of the parallelogram
  (the four corners, the conditions are linear in the point).
* `cube_spec`: the R box passes `rInCube` ⇒ each rotation of the box is the rotation of
  `q_c ⊗ (1, p)` with `|p_i| ≤ r0` (`w = q̄_c ⊗ q` is linear in `q`, so the eight corners give the
  cone at the points of the box; `p = (w₁, w₂, w₃)/w₀`; the integer version is
  `TetintLocalCube.cube_point`, here with field elements of `ℚ(√5)`).
* **`hlocB_of`**: `dtExtraOk P`, the case Bool `dtTubeOk P` (positive denominators, the lengths of
  the centre quaternions, `tA.side = 0`, `tB.side = 1`) and `HLocT P` give `HLocB P`.
  At `sig = 1` the point is `p = σn`, and `kapForm P form 1` at `(x, y)` is `kapForm P form 0` at
  `(x, −y)` (`kap_sig`).
-/

namespace PackLean.Formal.DTLocalBox

open PackLean.D28 (FE RBox rboxWf nth fadd fsub fneg fsmul fmul fsign)
open PackLean.D45DT (Prm NB Tube Rat2 tubeOf kapForm inside rInCube geR leR qmulF fm fsg fz fI PS nbWf toProb)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.TetReduction (Low)
open PackLean.Formal.CoverTreeG (InBox)
open PackLean.Formal.FieldSem (fval Len fval_fadd fval_fsub fval_fmul fval_fneg fval_fsmul len_fadd len_fsub
  len_fmul len_fneg len_fsmul fsign_spec)
open PackLean.Formal.DTFar (kapV nx ny)
open PackLean.Formal.DTCover (HLocB)
open PackLean.Formal.DTBase (dtExtraOk toProb_wf)
open PackLean.Formal.TetintLocalCube (Lf insQ insQ_four)
open PackLean.Formal.TetintLocalForm (qmulR)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The statement of the local lemma of a tube -/

/-- A rational `(num, den)` as a real number. -/
def ratR (x : Rat2) : ℝ := (x.1 : ℝ) / (x.2 : ℝ)

/-- The point of the tube in the chart: `dl·(X, Y) = p0 + u·d + w·ŵ`. -/
def tX (t : Tube) (u w : ℝ) : ℝ :=
  (((nth t.p0 0 0 : ℤ) : ℝ) + u * ((nth t.d 0 0 : ℤ) : ℝ) + w * ((nth t.w 0 0 : ℤ) : ℝ)) / t.dl
def tY (t : Tube) (u w : ℝ) : ℝ :=
  (((nth t.p0 1 0 : ℤ) : ℝ) + u * ((nth t.d 1 0 : ℤ) : ℝ) + w * ((nth t.w 1 0 : ℤ) : ℝ)) / t.dl

/-- The real components of the centre quaternion. -/
def qa (t : Tube) (i : ℕ) : ℝ := fval PS (nth t.q i fz)

/-- `q_c ⊗ (1, p)`. -/
def qcT (t : Tube) (p1 p2 p3 : ℝ) : ℝ × ℝ × ℝ × ℝ := qmulR (qa t 0) (qa t 1) (qa t 2) (qa t 3) 1 p1 p2 p3

/-- `R` is the rotation of the quaternion `q`: `Rq(q) = |q|²·R` with `|q|² > 0`. -/
def QRotT (R : M3) (q : ℝ × ℝ × ℝ × ℝ) : Prop :=
  0 < q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2 ∧
  ∀ k < 9, nth (QuadSem.rqList q.1 q.2.1 q.2.2.1 q.2.2.2) k 0
    = (q.1 ^ 2 + q.2.1 ^ 2 + q.2.2.1 ^ 2 + q.2.2.2 ^ 2) * OctFar.rN R (k / 3) (k % 3)

/-- **The local lemma of one tube** (stage 7c-3): at the points of the parallelogram and the
rotations of the cube of the centre, the bound of the tube form. -/
def HLocTube (P : Prm) (t : Tube) : Prop :=
  ∀ u w : ℝ, ratR t.ulo ≤ u → u ≤ ratR t.uhi → |w| ≤ ratR t.r0 →
  ∀ p1 p2 p3 : ℝ, |p1| ≤ ratR t.r0 → |p2| ≤ ratR t.r0 → |p3| ≤ ratR t.r0 →
  ∀ R ∈ SO3, QRotT R (qcT t p1 p2 p3) →
    Low (VV (toProb P)) P.verts.length (c0r (toProb P)) !₂[tX t u w, tY t u w, 1] R
      (kapV P (nth (kapForm P t.side 0) 0 0) (nth (kapForm P t.side 0) 1 0)
        (nth (kapForm P t.side 0) 2 0) (tX t u w) (tY t u w))

/-- The local lemma of both tubes. -/
def HLocT (P : Prm) : Prop := HLocTube P P.tA ∧ HLocTube P P.tB

/-- The conditions of a tube that `inside`, `rInCube` and `tubeRun` do not check. -/
def tubeWfB (t : Tube) : Bool :=
  decide (0 < t.ulo.2) && decide (0 < t.uhi.2) && decide (0 < t.r0.2) && decide (0 < t.dl) &&
    t.q.length == 4 && t.q.all (fun a => a.length == 2)

/-- The Bool of the case for the tubes. -/
def dtTubeOk (P : Prm) : Bool := tubeWfB P.tA && tubeWfB P.tB && P.tA.side == 0 && P.tB.side == 1

theorem tube_facts {P : Prm} (ht : dtTubeOk P = true) (hl : HLocT P) {form : ℕ} (hf : form ≤ 1) :
    tubeWfB (tubeOf P form) = true ∧ (tubeOf P form).side = form ∧ HLocTube P (tubeOf P form) := by
  simp only [dtTubeOk, Bool.and_eq_true, beq_iff_eq] at ht
  obtain ⟨⟨⟨hA, hB⟩, sA⟩, sB⟩ := ht
  interval_cases form
  · exact ⟨hA, sA, hl.1⟩
  · exact ⟨hB, sB, hl.2⟩

/-! ## 2. The n box in the parallelogram -/

theorem geR_spec {lo : Rat2} {num den : ℤ} (hl : 0 < lo.2) (hd : den ≠ 0) (h : geR lo num den = true) :
    ratR lo ≤ (num : ℝ) / den := by
  unfold geR at h
  have hl' : (0 : ℝ) < lo.2 := by exact_mod_cast hl
  unfold ratR
  split_ifs at h with hpos
  · have h' : (lo.1 : ℝ) * den ≤ num * lo.2 := by exact_mod_cast (of_decide_eq_true h)
    have hd' : (0 : ℝ) < den := by exact_mod_cast hpos
    rw [div_le_div_iff₀ hl' hd']; linarith
  · have h' : (lo.1 : ℝ) * den ≥ num * lo.2 := by exact_mod_cast (of_decide_eq_true h)
    have hd' : (den : ℝ) < 0 := by exact_mod_cast lt_of_le_of_ne (not_lt.1 hpos) hd
    rw [← neg_div_neg_eq (num : ℝ), div_le_div_iff₀ hl' (neg_pos.2 hd')]; linarith

theorem leR_spec {hi : Rat2} {num den : ℤ} (hl : 0 < hi.2) (hd : den ≠ 0) (h : leR hi num den = true) :
    (num : ℝ) / den ≤ ratR hi := by
  unfold leR at h
  have hl' : (0 : ℝ) < hi.2 := by exact_mod_cast hl
  unfold ratR
  split_ifs at h with hpos
  · have h' : (num : ℝ) * hi.2 ≤ hi.1 * den := by exact_mod_cast (of_decide_eq_true h)
    have hd' : (0 : ℝ) < den := by exact_mod_cast hpos
    rw [div_le_div_iff₀ hd' hl']; linarith
  · have h' : (num : ℝ) * hi.2 ≥ hi.1 * den := by exact_mod_cast (of_decide_eq_true h)
    have hd' : (den : ℝ) < 0 := by exact_mod_cast lt_of_le_of_ne (not_lt.1 hpos) hd
    rw [← neg_div_neg_eq (num : ℝ), div_le_div_iff₀ (neg_pos.2 hd') hl']; linarith

/-- An affine function that is `≥ 0` at the four corners of a box is `≥ 0` on the box. -/
theorem aff2 (F : ℝ → ℝ → ℝ) (hF : ∀ X Y, F X Y = F 0 0 + (F 1 0 - F 0 0) * X + (F 0 1 - F 0 0) * Y)
    {x0 x1 y0 y1 X Y : ℝ} (hX : x0 ≤ X ∧ X ≤ x1) (hY : y0 ≤ Y ∧ Y ≤ y1)
    (hc : ∀ a b, (a = x0 ∨ a = x1) → (b = y0 ∨ b = y1) → 0 ≤ F a b) : 0 ≤ F X Y := by
  set α := F 1 0 - F 0 0
  set β := F 0 1 - F 0 0
  obtain ⟨a, ha, hxa⟩ : ∃ a, (a = x0 ∨ a = x1) ∧ α * a ≤ α * X := by
    rcases le_total 0 α with h | h
    · exact ⟨x0, Or.inl rfl, mul_le_mul_of_nonneg_left hX.1 h⟩
    · exact ⟨x1, Or.inr rfl, mul_le_mul_of_nonpos_left hX.2 h⟩
  obtain ⟨b, hb, hyb⟩ : ∃ b, (b = y0 ∨ b = y1) ∧ β * b ≤ β * Y := by
    rcases le_total 0 β with h | h
    · exact ⟨y0, Or.inl rfl, mul_le_mul_of_nonneg_left hY.1 h⟩
    · exact ⟨y1, Or.inr rfl, mul_le_mul_of_nonpos_left hY.2 h⟩
  have := hc a b ha hb
  rw [hF] at this ⊢
  linarith

/-- The determinant of the tube's directions. -/
def detT (t : Tube) : ℤ := nth t.d 0 0 * nth t.w 1 0 - nth t.w 0 0 * nth t.d 1 0

/-- The test of `inside` at one corner (NDEN units). -/
def cornerOk (P : Prm) (t : Tube) (px py : ℤ) : Bool :=
  let dl : ℤ := t.dl
  let rx := px * dl - nth t.p0 0 0 * P.nd
  let ry := py * dl - nth t.p0 1 0 * P.nd
  let un := rx * nth t.w 1 0 - nth t.w 0 0 * ry
  let wn := nth t.d 0 0 * ry - nth t.d 1 0 * rx
  let dd := detT t * P.nd
  geR t.ulo un dd && leR t.uhi un dd && geR (-t.r0.1, t.r0.2) wn dd && leR t.r0 wn dd

theorem inside_eq (P : Prm) (t : Tube) (x0 x1 y0 y1 : ℤ) :
    inside P t [x0, x1] [y0, y1] =
      (decide (detT t ≠ 0) && [x0, x1].all (fun px => [y0, y1].all (fun py => cornerOk P t px py))) :=
  rfl

/-- The coordinate `u` of the point `(X, Y)` (NDEN units). -/
def Uf (P : Prm) (t : Tube) (X Y : ℝ) : ℝ :=
  ((X * t.dl - nth t.p0 0 0 * P.nd) * nth t.w 1 0 - nth t.w 0 0 * (Y * t.dl - nth t.p0 1 0 * P.nd)) /
    (detT t * P.nd)

/-- The coordinate `w` of the point `(X, Y)` (NDEN units). -/
def Wf (P : Prm) (t : Tube) (X Y : ℝ) : ℝ :=
  (nth t.d 0 0 * (Y * t.dl - nth t.p0 1 0 * P.nd) - nth t.d 1 0 * (X * t.dl - nth t.p0 0 0 * P.nd)) /
    (detT t * P.nd)

theorem ratR_neg (a : ℤ) (b : ℕ) : ratR (-a, b) = -ratR (a, b) := by
  simp [ratR, neg_div]

theorem corner_spec {P : Prm} {t : Tube} (hw : tubeWfB t = true) (hnd : 0 < P.nd) (hdet : detT t ≠ 0)
    {px py : ℤ} (h : cornerOk P t px py = true) :
    ratR t.ulo ≤ Uf P t px py ∧ Uf P t px py ≤ ratR t.uhi ∧
      -ratR t.r0 ≤ Wf P t px py ∧ Wf P t px py ≤ ratR t.r0 := by
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq] at hw
  obtain ⟨⟨⟨⟨⟨hlo, hhi⟩, hr0⟩, _⟩, _⟩, _⟩ := hw
  simp only [cornerOk, Bool.and_eq_true] at h
  obtain ⟨⟨⟨a, b⟩, c⟩, d⟩ := h
  have hdd : detT t * P.nd ≠ 0 := mul_ne_zero hdet hnd.ne'
  have e1 := geR_spec hlo hdd a
  have e2 := leR_spec hhi hdd b
  have e3 := geR_spec (lo := (-t.r0.1, t.r0.2)) hr0 hdd c
  have e4 := leR_spec hr0 hdd d
  rw [ratR_neg] at e3
  have eU : Uf P t px py = (((px * (t.dl : ℤ) - nth t.p0 0 0 * P.nd) * nth t.w 1 0 -
      nth t.w 0 0 * (py * (t.dl : ℤ) - nth t.p0 1 0 * P.nd) : ℤ) : ℝ) / ((detT t * P.nd : ℤ) : ℝ) := by
    simp only [Uf]; push_cast; ring
  have eW : Wf P t px py = ((nth t.d 0 0 * (py * (t.dl : ℤ) - nth t.p0 1 0 * P.nd) -
      nth t.d 1 0 * (px * (t.dl : ℤ) - nth t.p0 0 0 * P.nd) : ℤ) : ℝ) / ((detT t * P.nd : ℤ) : ℝ) := by
    simp only [Wf]; push_cast; ring
  rw [eU, eW]
  exact ⟨e1, e2, e3, e4⟩

/-- **The n box in the parallelogram.** If the box `[x0, x1] × [y0, y1]` (NDEN units) passes `inside`,
every point of it is a point of the tube's parallelogram. -/
theorem inside_spec {P : Prm} {t : Tube} (hw : tubeWfB t = true) (hnd : 0 < P.nd) {x0 x1 y0 y1 : ℤ}
    (h : inside P t [x0, x1] [y0, y1] = true) {X Y : ℝ} (hX : (x0 : ℝ) ≤ X ∧ X ≤ x1)
    (hY : (y0 : ℝ) ≤ Y ∧ Y ≤ y1) :
    ∃ u w : ℝ, ratR t.ulo ≤ u ∧ u ≤ ratR t.uhi ∧ |w| ≤ ratR t.r0 ∧
      X / P.nd = tX t u w ∧ Y / P.nd = tY t u w := by
  rw [inside_eq] at h
  simp only [Bool.and_eq_true, decide_eq_true_eq, List.all_cons, List.all_nil, Bool.and_true] at h
  obtain ⟨hdet, ⟨c00, c01⟩, c10, c11⟩ := h
  have hdl : (0 : ℝ) < t.dl := by
    simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq] at hw
    exact_mod_cast hw.1.1.2
  have hnd' : (0 : ℝ) < P.nd := by exact_mod_cast hnd
  have hdet' : ((nth t.d 0 0 : ℤ) : ℝ) * nth t.w 1 0 - nth t.w 0 0 * nth t.d 1 0 ≠ 0 := by
    have : ((detT t : ℤ) : ℝ) ≠ 0 := by exact_mod_cast hdet
    simpa [detT] using this
  have cs : ∀ a b : ℝ, (a = x0 ∨ a = x1) → (b = y0 ∨ b = y1) →
      ratR t.ulo ≤ Uf P t a b ∧ Uf P t a b ≤ ratR t.uhi ∧ -ratR t.r0 ≤ Wf P t a b ∧ Wf P t a b ≤ ratR t.r0 := by
    intro a b ha hb
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl
    · exact corner_spec hw hnd hdet c00
    · exact corner_spec hw hnd hdet c01
    · exact corner_spec hw hnd hdet c10
    · exact corner_spec hw hnd hdet c11
  have affU : ∀ (s c : ℝ), ∀ X Y, (s * Uf P t X Y + c) = (s * Uf P t 0 0 + c) +
      ((s * Uf P t 1 0 + c) - (s * Uf P t 0 0 + c)) * X + ((s * Uf P t 0 1 + c) - (s * Uf P t 0 0 + c)) * Y := by
    intro s c X Y; simp only [Uf]; ring
  have affW : ∀ (s c : ℝ), ∀ X Y, (s * Wf P t X Y + c) = (s * Wf P t 0 0 + c) +
      ((s * Wf P t 1 0 + c) - (s * Wf P t 0 0 + c)) * X + ((s * Wf P t 0 1 + c) - (s * Wf P t 0 0 + c)) * Y := by
    intro s c X Y; simp only [Wf]; ring
  have g1 := aff2 (fun X Y => 1 * Uf P t X Y + -ratR t.ulo) (affU 1 _) hX hY
    fun a b ha hb => by have := (cs a b ha hb).1; linarith
  have g2 := aff2 (fun X Y => -1 * Uf P t X Y + ratR t.uhi) (affU (-1) _) hX hY
    fun a b ha hb => by have := (cs a b ha hb).2.1; linarith
  have g3 := aff2 (fun X Y => 1 * Wf P t X Y + ratR t.r0) (affW 1 _) hX hY
    fun a b ha hb => by have := (cs a b ha hb).2.2.1; linarith
  have g4 := aff2 (fun X Y => -1 * Wf P t X Y + ratR t.r0) (affW (-1) _) hX hY
    fun a b ha hb => by have := (cs a b ha hb).2.2.2; linarith
  obtain ⟨D, hDdef⟩ : ∃ D : ℝ, D = ((nth t.d 0 0 : ℤ) : ℝ) * nth t.w 1 0 - nth t.w 0 0 * nth t.d 1 0 := ⟨_, rfl⟩
  have hD : D ≠ 0 := hDdef ▸ hdet'
  have eU : Uf P t X Y = ((X * t.dl - nth t.p0 0 0 * P.nd) * nth t.w 1 0 -
      nth t.w 0 0 * (Y * t.dl - nth t.p0 1 0 * P.nd)) / (D * P.nd) := by
    simp only [Uf, detT, hDdef]; push_cast; ring
  have eW : Wf P t X Y = (nth t.d 0 0 * (Y * t.dl - nth t.p0 1 0 * P.nd) -
      nth t.d 1 0 * (X * t.dl - nth t.p0 0 0 * P.nd)) / (D * P.nd) := by
    simp only [Wf, detT, hDdef]; push_cast; ring
  refine ⟨Uf P t X Y, Wf P t X Y, by linarith, by linarith, abs_le.2 ⟨by linarith, by linarith⟩, ?_, ?_⟩
  · rw [eU, eW]; simp only [tX]
    field_simp
    rw [hDdef]; ring
  · rw [eU, eW]; simp only [tY]
    field_simp
    rw [hDdef]; ring

/-! ## 3. The R box in the cube of the centre -/

theorem fvalI (c : ℤ) : fval PS (fI c) = c := (DTFar.fval_fI c).2
theorem lenI (c : ℤ) : Len PS (fI c) := (DTFar.fval_fI c).1

/-- The components of `q̄_c ⊗ v` (field elements) as linear forms of the integer quaternion `v`. -/
theorem qmulF_val {q0 q1 q2 q3 : FE} (h0 : Len PS q0) (h1 : Len PS q1) (h2 : Len PS q2) (h3 : Len PS q3)
    (v0 v1 v2 v3 : ℤ) :
    let w := qmulF [q0, fneg q1, fneg q2, fneg q3] [fI v0, fI v1, fI v2, fI v3]
    let a0 := fval PS q0; let a1 := fval PS q1; let a2 := fval PS q2; let a3 := fval PS q3
    let v : List ℝ := [v0, v1, v2, v3]
    (Len PS (nth w 0 fz) ∧ Len PS (nth w 1 fz) ∧ Len PS (nth w 2 fz) ∧ Len PS (nth w 3 fz)) ∧
    fval PS (nth w 0 fz) = Lf a0 a1 a2 a3 v ∧ fval PS (nth w 1 fz) = Lf (-a1) a0 a3 (-a2) v ∧
    fval PS (nth w 2 fz) = Lf (-a2) (-a3) a0 a1 v ∧ fval PS (nth w 3 fz) = Lf (-a3) a2 (-a1) a0 v := by
  simp only [qmulF, nth, List.getD_cons_zero, List.getD_cons_succ, fm]
  have l0 := lenI v0; have l1 := lenI v1; have l2 := lenI v2; have l3 := lenI v3
  have n1 := len_fneg h1; have n2 := len_fneg h2; have n3 := len_fneg h3
  refine ⟨⟨?_, ?_, ?_, ?_⟩, ?_, ?_, ?_, ?_⟩
  · exact (len_fsub (len_fsub (len_fsub (len_fmul h0 l0) (len_fmul n1 l1)) (len_fmul n2 l2)) (len_fmul n3 l3))
  · exact (len_fsub (len_fadd (len_fadd (len_fmul h0 l1) (len_fmul n1 l0)) (len_fmul n2 l3)) (len_fmul n3 l2))
  · exact (len_fadd (len_fadd (len_fsub (len_fmul h0 l2) (len_fmul n1 l3)) (len_fmul n2 l0)) (len_fmul n3 l1))
  · exact (len_fadd (len_fsub (len_fadd (len_fmul h0 l3) (len_fmul n1 l2)) (len_fmul n2 l1)) (len_fmul n3 l0))
  · rw [fval_fsub (len_fsub (len_fsub (len_fmul h0 l0) (len_fmul n1 l1)) (len_fmul n2 l2)) (len_fmul n3 l3),
      fval_fsub (len_fsub (len_fmul h0 l0) (len_fmul n1 l1)) (len_fmul n2 l2),
      fval_fsub (len_fmul h0 l0) (len_fmul n1 l1),
      fval_fmul h0 l0, fval_fmul n1 l1, fval_fmul n2 l2, fval_fmul n3 l3]
    simp only [fval_fneg, fvalI, Lf, List.getD_cons_zero, List.getD_cons_succ]; ring
  · rw [fval_fsub (len_fadd (len_fadd (len_fmul h0 l1) (len_fmul n1 l0)) (len_fmul n2 l3)) (len_fmul n3 l2),
      fval_fadd (len_fadd (len_fmul h0 l1) (len_fmul n1 l0)) (len_fmul n2 l3),
      fval_fadd (len_fmul h0 l1) (len_fmul n1 l0),
      fval_fmul h0 l1, fval_fmul n1 l0, fval_fmul n2 l3, fval_fmul n3 l2]
    simp only [fval_fneg, fvalI, Lf, List.getD_cons_zero, List.getD_cons_succ]; ring
  · rw [fval_fadd (len_fadd (len_fsub (len_fmul h0 l2) (len_fmul n1 l3)) (len_fmul n2 l0)) (len_fmul n3 l1),
      fval_fadd (len_fsub (len_fmul h0 l2) (len_fmul n1 l3)) (len_fmul n2 l0),
      fval_fsub (len_fmul h0 l2) (len_fmul n1 l3),
      fval_fmul h0 l2, fval_fmul n1 l3, fval_fmul n2 l0, fval_fmul n3 l1]
    simp only [fval_fneg, fvalI, Lf, List.getD_cons_zero, List.getD_cons_succ]; ring
  · rw [fval_fadd (len_fsub (len_fadd (len_fmul h0 l3) (len_fmul n1 l2)) (len_fmul n2 l1)) (len_fmul n3 l0),
      fval_fsub (len_fadd (len_fmul h0 l3) (len_fmul n1 l2)) (len_fmul n2 l1),
      fval_fadd (len_fmul h0 l3) (len_fmul n1 l2),
      fval_fmul h0 l3, fval_fmul n1 l2, fval_fmul n2 l1, fval_fmul n3 l0]
    simp only [fval_fneg, fvalI, Lf, List.getD_cons_zero, List.getD_cons_succ]; ring

theorem sgn_pos' {r : ℝ} (h : 0 < FieldSem.sgn r) : 0 < r := by
  unfold FieldSem.sgn at h
  split_ifs at h with h1 h2
  · exact h1
  · norm_num at h
  · norm_num at h

theorem sgn_nonneg' {r : ℝ} (h : 0 ≤ FieldSem.sgn r) : 0 ≤ r := by
  unfold FieldSem.sgn at h
  split_ifs at h with h1 h2
  · exact h1.le
  · norm_num at h
  · linarith [not_lt.1 h1]

theorem fsg_spec {a : FE} (h : Len PS a) : fsg a = FieldSem.sgn (fval PS a) :=
  fsign_spec PS (by simp [PS]) a h

/-- The eight corners of an R box as integer quaternions. -/
def cornersT (d : ℤ) (rb : RBox) : List (List ℤ) :=
  [rb.l0, rb.h0].foldr (fun a acc => [rb.l1, rb.h1].foldr (fun b acc2 => [rb.l2, rb.h2].foldr
    (fun c acc3 => insQ rb.ch d (a, b, c) :: acc3) acc2) acc) []

/-- The test of `rInCube` at one corner (`w = q̄_c ⊗ q`). -/
def cubeCond (t : Tube) (sg : ℤ) (w : List FE) : Bool :=
  let w0 := fsmul sg (nth w 0 fz)
  decide (fsg w0 > 0) && [1, 2, 3].all (fun i =>
    let wi := fsmul (t.r0.2 : ℤ) (nth w i fz)
    decide (fsg (fsub (fsmul t.r0.1 w0) wi) ≥ 0) && decide (fsg (fadd (fsmul t.r0.1 w0) wi) ≥ 0))

/-- `q̄_c`. -/
def qbT (t : Tube) : List FE := [nth t.q 0 fz, fneg (nth t.q 1 fz), fneg (nth t.q 2 fz), fneg (nth t.q 3 fz)]

theorem rInCube_eq (P : Prm) (t : Tube) (rb : RBox) :
    rInCube P t rb = [1, -1].any (fun (sg : ℤ) =>
      ((cornersT P.den rb).map (fun q => qmulF (qbT t) (q.map fI))).all (cubeCond t sg)) := by
  obtain ⟨ch, l0, l1, l2, h0, h1, h2⟩ := rb
  rcases ch with _ | _ | _ | n <;> rfl

theorem mem_cornersT (d : ℤ) (rb : RBox) {a b c : ℤ} (ha : a = rb.l0 ∨ a = rb.h0) (hb : b = rb.l1 ∨ b = rb.h1)
    (hc : c = rb.l2 ∨ c = rb.h2) : insQ rb.ch d (a, b, c) ∈ cornersT d rb := by
  rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;> rcases hc with rfl | rfl <;>
    simp [cornersT]

/-- A linear constraint at the corners holds at the points of the box. -/
theorem box_linT {rb : RBox} {den : ℤ} {u : Fin 3 → ℝ} (hin : InBox rb rb.ch u) (c0 c1 c2 c3 C : ℝ)
    (hv : ∀ a b c : ℤ, (a = rb.l0 ∨ a = rb.h0) → (b = rb.l1 ∨ b = rb.h1) → (c = rb.l2 ∨ c = rb.h2) →
      Lf c0 c1 c2 c3 ((insQ rb.ch den (a, b, c)).map Int.cast) ≤ C) :
    Lf c0 c1 c2 c3 (QuadSem.chq rb.ch den (u 0) (u 1) (u 2)) ≤ C := by
  obtain ⟨_, hy⟩ := hin
  have e0 := hy 0; have e1 := hy 1; have e2 := hy 2
  simp only [QuadSem.bLo, QuadSem.bHi, Matrix.cons_val_zero, Matrix.cons_val_one,
    Matrix.cons_val_two, Matrix.head_cons, Matrix.tail_cons] at e0 e1 e2
  have hv' : ∀ a b c : ℝ, (a = rb.l0 ∨ a = rb.h0) → (b = rb.l1 ∨ b = rb.h1) → (c = rb.l2 ∨ c = rb.h2) →
      ∃ a' b' c' : ℤ, (a' = rb.l0 ∨ a' = rb.h0) ∧ (b' = rb.l1 ∨ b' = rb.h1) ∧ (c' = rb.l2 ∨ c' = rb.h2) ∧
        a = a' ∧ b = b' ∧ c = c' := by
    intro a b c ha hb hc
    rcases ha with rfl | rfl <;> rcases hb with rfl | rfl <;> rcases hc with rfl | rfl <;>
      exact ⟨_, _, _, by simp, by simp, by simp, rfl, rfl, rfl⟩
  rcases hch : rb.ch with _ | _ | _ | n
  · have := OctCover.aff_le_of_verts (α := c0 * den) (β := c1) (γ := c2) (δ := c3) (C := C) e0 e1 e2
      fun a b c ha hb hc => by
        obtain ⟨a', b', c', ha', hb', hc', rfl, rfl, rfl⟩ := hv' a b c ha hb hc
        have := hv a' b' c' ha' hb' hc'; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith
  · have := OctCover.aff_le_of_verts (α := c1 * den) (β := c0) (γ := c2) (δ := c3) (C := C) e0 e1 e2
      fun a b c ha hb hc => by
        obtain ⟨a', b', c', ha', hb', hc', rfl, rfl, rfl⟩ := hv' a b c ha hb hc
        have := hv a' b' c' ha' hb' hc'; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith
  · have := OctCover.aff_le_of_verts (α := c2 * den) (β := c0) (γ := c1) (δ := c3) (C := C) e0 e1 e2
      fun a b c ha hb hc => by
        obtain ⟨a', b', c', ha', hb', hc', rfl, rfl, rfl⟩ := hv' a b c ha hb hc
        have := hv a' b' c' ha' hb' hc'; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith
  · have := OctCover.aff_le_of_verts (α := c3 * den) (β := c0) (γ := c1) (δ := c2) (C := C) e0 e1 e2
      fun a b c ha hb hc => by
        obtain ⟨a', b', c', ha', hb', hc', rfl, rfl, rfl⟩ := hv' a b c ha hb hc
        have := hv a' b' c' ha' hb' hc'; simp [Lf, insQ, hch] at this; linarith
    simp [Lf, QuadSem.chq]; linarith

set_option maxHeartbeats 2000000 in
/-- **The R box in the cube of the centre.**  At a rotation `R` of a box with `rInCube`, there is
`p` with `|p_i| ≤ r₀` such that `R` is the rotation of `q_c ⊗ (1, p)`. -/
theorem cube_spec {P : Prm} {t : Tube} (hw : tubeWfB t = true) {rb : RBox}
    (hcube : rInCube P t rb = true) {R : M3} {u : Fin 3 → ℝ}
    (hcu : Charts.ChartPt R P.den rb.ch u) (hin : InBox rb rb.ch u) :
    ∃ p1 p2 p3 : ℝ, |p1| ≤ ratR t.r0 ∧ |p2| ≤ ratR t.r0 ∧ |p3| ≤ ratR t.r0 ∧
      QRotT R (qcT t p1 p2 p3) := by
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true] at hw
  obtain ⟨⟨⟨⟨⟨_, _⟩, hr0⟩, _⟩, hq4⟩, hql⟩ := hw
  obtain ⟨q0, q1, q2, q3, hq⟩ : ∃ q0 q1 q2 q3 : FE, t.q = [q0, q1, q2, q3] := by
    match hm : t.q, hq4 with
    | [q0, q1, q2, q3], _ => exact ⟨q0, q1, q2, q3, rfl⟩
  have hL : ∀ a ∈ t.q, Len PS a := fun a ha => by
    have := hql a ha; simpa [Len, PS] using this
  rw [hq] at hL
  have h0 := hL q0 (by simp); have h1 := hL q1 (by simp)
  have h2 := hL q2 (by simp); have h3 := hL q3 (by simp)
  have qa_eq : qa t 0 = fval PS q0 ∧ qa t 1 = fval PS q1 ∧ qa t 2 = fval PS q2 ∧ qa t 3 = fval PS q3 := by
    simp [qa, hq, nth]
  set a0 := fval PS q0 with ha0
  set a1 := fval PS q1 with ha1
  set a2 := fval PS q2 with ha2
  set a3 := fval PS q3 with ha3
  -- the corner conditions
  rw [rInCube_eq] at hcube
  simp only [List.any_cons, List.any_nil, Bool.or_false, Bool.or_eq_true, List.all_eq_true,
    List.mem_map, forall_exists_index, and_imp, forall_apply_eq_imp_iff₂] at hcube
  obtain ⟨sg, hsg, hall⟩ : ∃ sg : ℤ, (sg = 1 ∨ sg = -1) ∧
      ∀ v ∈ cornersT P.den rb, cubeCond t sg (qmulF (qbT t) (v.map fI)) = true := by
    rcases hcube with h | h
    · exact ⟨1, Or.inl rfl, h⟩
    · exact ⟨-1, Or.inr rfl, h⟩
  set r1 : ℝ := ((t.r0.1 : ℤ) : ℝ) with hr1
  set r2 : ℝ := ((t.r0.2 : ℕ) : ℝ) with hr2
  have hr2p : 0 < r2 := by rw [hr2]; exact_mod_cast hr0
  set sgr : ℝ := (sg : ℝ) with hsgr
  have hvert : ∀ a b c : ℤ, (a = rb.l0 ∨ a = rb.h0) → (b = rb.l1 ∨ b = rb.h1) → (c = rb.l2 ∨ c = rb.h2) →
      let v := (insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ)
      0 < sgr * Lf a0 a1 a2 a3 v ∧
      |Lf (-a1) a0 a3 (-a2) v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) ∧
      |Lf (-a2) (-a3) a0 a1 v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) ∧
      |Lf (-a3) a2 (-a1) a0 v| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 v) := by
    intro a b c ha hb hc v
    have hc' := hall _ (mem_cornersT P.den rb ha hb hc)
    obtain ⟨v0, v1, v2, v3, hv⟩ := insQ_four rb.ch P.den (a, b, c)
    have hvv : v = [(v0 : ℝ), v1, v2, v3] := by simp [v, hv]
    rw [hvv]
    rw [hv] at hc'
    obtain ⟨⟨k0, k1, k2, k3⟩, w0, w1, w2, w3⟩ := qmulF_val h0 h1 h2 h3 v0 v1 v2 v3
    simp only [← ha0, ← ha1, ← ha2, ← ha3] at w0 w1 w2 w3
    simp only [qbT, hq, nth, List.getD_cons_zero, List.getD_cons_succ, List.map_cons, List.map_nil] at hc'
    simp only [cubeCond, Bool.and_eq_true, decide_eq_true_eq, List.all_cons, List.all_nil,
      Bool.and_true] at hc'
    obtain ⟨d0, ⟨d1, d1'⟩, ⟨d2, d2'⟩, d3, d3'⟩ := hc'
    rw [fsg_spec (len_fsmul _ k0), fval_fsmul, w0] at d0
    have e0 := sgn_pos' d0
    have side : ∀ (W : ℝ) (wi : FE), Len PS wi → fval PS wi = W →
        fsg (fsub (fsmul t.r0.1 (fsmul sg (nth (qmulF [q0, fneg q1, fneg q2, fneg q3]
          [fI v0, fI v1, fI v2, fI v3]) 0 fz))) (fsmul (t.r0.2 : ℤ) wi)) ≥ 0 →
        fsg (fadd (fsmul t.r0.1 (fsmul sg (nth (qmulF [q0, fneg q1, fneg q2, fneg q3]
          [fI v0, fI v1, fI v2, fI v3]) 0 fz))) (fsmul (t.r0.2 : ℤ) wi)) ≥ 0 →
        |W| * r2 ≤ r1 * (sgr * Lf a0 a1 a2 a3 [(v0 : ℝ), v1, v2, v3]) := by
      intro W wi hl hW s1 s2
      rw [fsg_spec (len_fsub (len_fsmul _ (len_fsmul _ k0)) (len_fsmul _ hl)),
        fval_fsub (len_fsmul _ (len_fsmul _ k0)) (len_fsmul _ hl), fval_fsmul, fval_fsmul, fval_fsmul,
        w0, hW] at s1
      rw [fsg_spec (len_fadd (len_fsmul _ (len_fsmul _ k0)) (len_fsmul _ hl)),
        fval_fadd (len_fsmul _ (len_fsmul _ k0)) (len_fsmul _ hl), fval_fsmul, fval_fsmul, fval_fsmul,
        w0, hW] at s2
      have t1 := sgn_nonneg' s1
      have t2 := sgn_nonneg' s2
      rw [hr1, hr2, hsgr]
      push_cast at t1 t2 ⊢
      rcases abs_cases W with ⟨e, _⟩ | ⟨e, _⟩ <;> rw [e] <;> nlinarith
    exact ⟨by rw [hsgr]; exact e0, side _ _ k1 w1 d1 d1', side _ _ k2 w2 d2 d2', side _ _ k3 w3 d3 d3'⟩
  -- the same conditions at the point `q` of the box
  have Lf_lin : ∀ (c0 c1 c2 c3 d0 d1 d2 d3 α β : ℝ) (v : List ℝ),
      α * Lf c0 c1 c2 c3 v + β * Lf d0 d1 d2 d3 v
        = Lf (α * c0 + β * d0) (α * c1 + β * d1) (α * c2 + β * d2) (α * c3 + β * d3) v := by
    intro c0 c1 c2 c3 d0 d1 d2 d3 α β v; simp only [Lf]; ring
  set qq := QuadSem.chq rb.ch P.den (u 0) (u 1) (u 2) with hqq
  have pt_le : ∀ (c0 c1 c2 c3 d0 d1 d2 d3 α β : ℝ),
      (∀ a b c : ℤ, (a = rb.l0 ∨ a = rb.h0) → (b = rb.l1 ∨ b = rb.h1) → (c = rb.l2 ∨ c = rb.h2) →
        α * Lf c0 c1 c2 c3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ))
          + β * Lf d0 d1 d2 d3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ)) ≤ 0) →
      α * Lf c0 c1 c2 c3 qq + β * Lf d0 d1 d2 d3 qq ≤ 0 := by
    intro c0 c1 c2 c3 d0 d1 d2 d3 α β h
    rw [Lf_lin]
    exact box_linT hin _ _ _ _ 0 fun a b c ha hb hc => by rw [← Lf_lin]; exact h a b c ha hb hc
  set W0 := Lf a0 a1 a2 a3 qq with hW0
  set W1 := Lf (-a1) a0 a3 (-a2) qq with hW1
  set W2 := Lf (-a2) (-a3) a0 a1 qq with hW2
  set W3 := Lf (-a3) a2 (-a1) a0 qq with hW3
  have g0 : 0 ≤ sgr * W0 := by
    have := pt_le a0 a1 a2 a3 0 0 0 0 (-sgr) 0 fun a b c ha hb hc => by
      have := (hvert a b c ha hb hc).1; simp only [zero_mul, add_zero]; linarith
    simp only [zero_mul, add_zero] at this; linarith
  have gi : ∀ (c0 c1 c2 c3 : ℝ),
      (∀ a b c : ℤ, (a = rb.l0 ∨ a = rb.h0) → (b = rb.l1 ∨ b = rb.h1) → (c = rb.l2 ∨ c = rb.h2) →
        |Lf c0 c1 c2 c3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ))| * r2
          ≤ r1 * (sgr * Lf a0 a1 a2 a3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ)))) →
      |Lf c0 c1 c2 c3 qq| * r2 ≤ r1 * (sgr * W0) := by
    intro c0 c1 c2 c3 h
    have up := pt_le c0 c1 c2 c3 a0 a1 a2 a3 r2 (-(r1 * sgr)) fun a b c ha hb hc => by
      have := h a b c ha hb hc
      have := le_abs_self (Lf c0 c1 c2 c3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ)))
      nlinarith
    have lo := pt_le c0 c1 c2 c3 a0 a1 a2 a3 (-r2) (-(r1 * sgr)) fun a b c ha hb hc => by
      have := h a b c ha hb hc
      have := neg_abs_le (Lf c0 c1 c2 c3 ((insQ rb.ch P.den (a, b, c)).map (Int.cast : ℤ → ℝ)))
      nlinarith
    rcases abs_cases (Lf c0 c1 c2 c3 qq) with ⟨e, _⟩ | ⟨e, _⟩ <;> rw [e] <;> nlinarith
  have g1 := gi _ _ _ _ fun a b c ha hb hc => (hvert a b c ha hb hc).2.1
  have g2 := gi _ _ _ _ fun a b c ha hb hc => (hvert a b c ha hb hc).2.2.1
  have g3 := gi _ _ _ _ fun a b c ha hb hc => (hvert a b c ha hb hc).2.2.2
  -- the chart point
  obtain ⟨_, hN, hl⟩ := hcu
  set Q0 := qq.getD 0 0 with hQ0
  set Q1 := qq.getD 1 0 with hQ1
  set Q2 := qq.getD 2 0 with hQ2
  set Q3 := qq.getD 3 0 with hQ3
  have hsq : sgr * sgr = 1 := by rcases hsg with h | h <;> simp [hsgr, h]
  have hnorm : W0 ^ 2 + W1 ^ 2 + W2 ^ 2 + W3 ^ 2
      = (a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2) * (Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2) := by
    simp only [hW0, hW1, hW2, hW3, Lf, hQ0, hQ1, hQ2, hQ3]; ring
  have hNpos : 0 < Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2 := hN
  -- `q_c ≠ 0`: at one corner `w₀ ≠ 0`
  have hA : 0 < a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2 := by
    rcases lt_or_eq_of_le (show 0 ≤ a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2 by positivity) with h | h
    · exact h
    · exfalso
      have z0 : a0 = 0 := by nlinarith [sq_nonneg a0, sq_nonneg a1, sq_nonneg a2, sq_nonneg a3]
      have z1 : a1 = 0 := by nlinarith [sq_nonneg a0, sq_nonneg a1, sq_nonneg a2, sq_nonneg a3]
      have z2 : a2 = 0 := by nlinarith [sq_nonneg a0, sq_nonneg a1, sq_nonneg a2, sq_nonneg a3]
      have z3 : a3 = 0 := by nlinarith [sq_nonneg a0, sq_nonneg a1, sq_nonneg a2, sq_nonneg a3]
      have := (hvert rb.l0 rb.l1 rb.l2 (Or.inl rfl) (Or.inl rfl) (Or.inl rfl)).1
      simp only [Lf, z0, z1, z2, z3, zero_mul, add_zero, mul_zero, lt_irrefl] at this
  have hpos : 0 < sgr * W0 := by
    rcases lt_or_eq_of_le g0 with h | h
    · exact h
    · exfalso
      have z1 : W1 = 0 := by
        have : |W1| * r2 ≤ 0 := by rw [← h] at g1; simpa using g1
        exact abs_eq_zero.1 (le_antisymm (by nlinarith [abs_nonneg W1]) (abs_nonneg _))
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
  have hpb : ∀ Wi : ℝ, |Wi| * r2 ≤ r1 * (sgr * W0) → |Wi / W0| ≤ ratR t.r0 := by
    intro Wi h
    rw [abs_div, habs0, div_le_iff₀ hpos]
    unfold ratR
    rw [← hr1, ← hr2, div_mul_eq_mul_div, le_div_iff₀ hr2p]
    linarith
  refine ⟨W1 / W0, W2 / W0, W3 / W0, hpb W1 g1, hpb W2 g2, hpb W3 g3, ?_⟩
  set lam := (a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2) / W0 with hlam
  have hqv : qcT t (W1 / W0) (W2 / W0) (W3 / W0) = (lam * Q0, lam * Q1, lam * Q2, lam * Q3) := by
    set A := a0 ^ 2 + a1 ^ 2 + a2 ^ 2 + a3 ^ 2 with hAdef
    have i0 : a0 * W0 - a1 * W1 - a2 * W2 - a3 * W3 = A * Q0 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i1 : a0 * W1 + a1 * W0 + a2 * W3 - a3 * W2 = A * Q1 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i2 : a0 * W2 - a1 * W3 + a2 * W0 + a3 * W1 = A * Q2 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    have i3 : a0 * W3 + a1 * W2 - a2 * W1 + a3 * W0 = A * Q3 := by
      simp only [hW0, hW1, hW2, hW3, Lf, hAdef, hQ0, hQ1, hQ2, hQ3]; ring
    simp only [qcT, qa_eq.1, qa_eq.2.1, qa_eq.2.2.1, qa_eq.2.2.2, qmulR, hlam]
    refine Prod.ext ?_ (Prod.ext ?_ (Prod.ext ?_ ?_))
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i0]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i1]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i2]; field_simp
    · simp only; rw [div_mul_eq_mul_div, eq_div_iff hW0ne, ← i3]; field_simp
  have hlam0 : lam ≠ 0 := div_ne_zero hA.ne' hW0ne
  rw [hqv]
  refine ⟨?_, fun k hk => ?_⟩
  · have e : (lam * Q0) ^ 2 + (lam * Q1) ^ 2 + (lam * Q2) ^ 2 + (lam * Q3) ^ 2
        = lam ^ 2 * (Q0 ^ 2 + Q1 ^ 2 + Q2 ^ 2 + Q3 ^ 2) := by ring
    simp only
    rw [e]
    exact mul_pos (lt_of_le_of_ne (sq_nonneg _) (Ne.symm (pow_ne_zero 2 hlam0))) hNpos
  simp only [QuadSem.rqList, List.cons.injEq] at hl
  obtain ⟨l0, l1, l2, l3, l4, l5, l6, l7, l8, _⟩ := hl
  interval_cases k <;> simp only [nth, QuadSem.rqList, List.getD_cons_zero, List.getD_cons_succ,
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

/-! ## 4. `HLocT ⇒ HLocB` -/

/-- At `sig = 1` the form at `(x, y)` is the form of `sig = 0` at `(x, −y)`. -/
theorem kap_sig (P : Prm) (form : ℕ) {sig : ℕ} (hsig : sig ≤ 1) (x y : ℝ) :
    kapV P (nth (kapForm P form sig) 0 0) (nth (kapForm P form sig) 1 0) (nth (kapForm P form sig) 2 0) x y =
      kapV P (nth (kapForm P form 0) 0 0) (nth (kapForm P form 0) 1 0) (nth (kapForm P form 0) 2 0) x
        (DTFar.sgn sig * y) := by
  interval_cases sig
  · simp [DTFar.sgn]
  · unfold kapForm
    by_cases hf : form = 1
    · subst hf; simp [kapV, DTFar.sgn, nth]
    · have : (form == 1) = false := by simpa using hf
      simp [kapV, DTFar.sgn, nth, this]

/-- The point of a well-formed n box: `l ≤ nx ≤ h`. -/
theorem half_mem {l h : ℤ} (hlh : l < h) (he : (h - l) % 2 = 0) {s : ℝ} (hs : |s| ≤ 1) :
    (l : ℝ) ≤ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * s ∧
      (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * s ≤ h := by
  obtain ⟨k, hk⟩ : ∃ k, h - l = 2 * k := ⟨(h - l) / 2, by omega⟩
  have e1 : (l + h) / 2 = l + k := by omega
  have e2 : (h - l) / 2 = k := by omega
  have hk0 : (0 : ℝ) ≤ k := by exact_mod_cast (show 0 ≤ k by omega)
  have hh : (h : ℝ) = l + 2 * k := by exact_mod_cast (show h = l + 2 * k by omega)
  rw [e1, e2]; push_cast
  obtain ⟨s1, s2⟩ := abs_le.1 hs
  constructor <;> nlinarith

/-- **`HLocT ⇒ HLocB`.** -/
theorem hlocB_of {P : Prm} (h : dtExtraOk P = true) (ht : dtTubeOk P = true) (hl : HLocT P) :
    HLocB P := by
  intro form sig hform hsig nb hnw hins rb hrw hrin sx sy hsx hsy R hR u hcu hin
  obtain ⟨hw, hside, hloc⟩ := tube_facts ht hl hform
  have hnd : 0 < P.nd := (toProb_wf h).nden
  simp only [nbWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hnw
  obtain ⟨⟨⟨⟨h0, h1⟩, e0⟩, e1⟩, _⟩ := hnw
  have bx := half_mem h0 e0 hsx
  have bY := half_mem h1 e1 hsy
  -- the n box in the parallelogram (the point `(x, sgn·y)`)
  obtain ⟨uu, ww, hu1, hu2, hww, ex, ey⟩ : ∃ uu ww : ℝ, ratR (tubeOf P form).ulo ≤ uu ∧
      uu ≤ ratR (tubeOf P form).uhi ∧ |ww| ≤ ratR (tubeOf P form).r0 ∧
      nx nb sx / P.nd = tX (tubeOf P form) uu ww ∧
      DTFar.sgn sig * (ny nb sy / P.nd) = tY (tubeOf P form) uu ww := by
    interval_cases sig
    · simp only [ite_true] at hins
      have := inside_spec hw hnd hins (X := nx nb sx) (Y := ny nb sy) bx bY
      simpa [DTFar.sgn] using this
    · simp only [show (1 : ℕ) ≠ 0 from by norm_num, ite_false] at hins
      have := inside_spec hw hnd hins (X := nx nb sx) (Y := -ny nb sy)
        bx ⟨by simp only [DTFar.ny]; push_cast; linarith [bY.2], by simp only [DTFar.ny]; push_cast; linarith [bY.1]⟩
      obtain ⟨uu, ww, a1, a2, a3, a4, a5⟩ := this
      exact ⟨uu, ww, a1, a2, a3, a4, by rw [← a5]; simp [DTFar.sgn]; ring⟩
  -- the R box in the cube of the centre
  obtain ⟨p1, p2, p3, hp1, hp2, hp3, hq⟩ := cube_spec hw hrin hcu hin
  have hL := hloc uu ww hu1 hu2 hww p1 p2 p3 hp1 hp2 hp3 R hR hq
  rw [kap_sig P form hsig, ex, ey]
  rw [hside] at hL
  exact hL

#assert_std_axioms PackLean.Formal.DTLocalBox.hlocB_of PackLean.Formal.DTLocalBox.cube_spec
  PackLean.Formal.DTLocalBox.inside_spec

end

end PackLean.Formal.DTLocalBox
