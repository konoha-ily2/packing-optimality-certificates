import PackLean.Formal.PolySem5

/-!
# A9 stage 7b-3 (part 2): the faces and the box trees of the local check of `D28.Core`

`localRegionOk` (the local check of icointet・cubintet) covers the box of `z = (ξ, y, p₁, p₂, p₃)`
by the faces of the normalized cube: on the face `(i, sg)`, `ζ_i = sg · r` and `ζ_j = r · t_j`
(`j ≠ i`), where `ζ_j = z_j / scl_j`.  `faceH` turns the polynomial `G(z)` into `H(r, t)` with
`r · H(r, t) = (Π_j sd_j³) · (G(z) − G(0))`, and the box tree of the face checks `H > 0`.

* `faceH_spec`: the identity above (`zf` is the point `z` of the face);
* `lrun_cover`: the box tree of one face covers its root box (as `LocalG.lrun_cover`, 5 dimensions);
* `face_point`: every point of the normalized box (ends in `{0, ±1}`) other than `0` lies on a face of
  `faceListOf` with `0 < r ≤ 1` and `t` in the ranges of the other coordinates;
* `region_pos`: `localRegionOk` (and the extra checks `extraOk`) gives, at every point of the box, a
  candidate `c` with `G_c(z) ≥ 0`.
-/

namespace PackLean.Formal.TetLocalPoly

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fone fIsZero fmul loHi monoLb Mono Poly padd
  paddF psum pmul psmulZ psmulF incAt pmulAff monoLt nth zeroMono constTerm shiftLb PQ QF Prob
  faceH LTok LBox LState lstep lsplit ratToD ratLe LocalParts localParts candPQ identOk Region
  localRegionOk)
open PackLean.Formal.FieldSem
open PackLean.Formal.PolySemG (BracketG maskOf)
open PackLean.Formal.PolySem5

noncomputable section

/-! ## 1. `faceH` -/

/-- The value `sn / sd` of the scale `j`. -/
def sclv (scl : List (ℤ × ℕ)) (j : ℕ) : ℝ := ((nth scl j (0, 1)).1 : ℝ) / ((nth scl j (0, 1)).2 : ℝ)

/-- The direction on the face `(i, sg)` at `y = (r, t₀, …, t₃)`: `sg` at `i`, the `t` elsewhere. -/
def wv (i : ℕ) (sg : ℤ) (y : Fin 5 → ℝ) : Fin 5 → ℝ :=
  match i with
  | 0 => ![(sg : ℝ), y 1, y 2, y 3, y 4]
  | 1 => ![y 1, (sg : ℝ), y 2, y 3, y 4]
  | 2 => ![y 1, y 2, (sg : ℝ), y 3, y 4]
  | 3 => ![y 1, y 2, y 3, (sg : ℝ), y 4]
  | _ => ![y 1, y 2, y 3, y 4, (sg : ℝ)]

/-- The point of the face `(i, sg)` at `y = (r, t₀, …, t₃)`, divided by `r`. -/
def zf1 (scl : List (ℤ × ℕ)) (i : ℕ) (sg : ℤ) (y : Fin 5 → ℝ) : Fin 5 → ℝ := fun j =>
  sclv scl j * wv i sg y j

/-- The point of the face `(i, sg)` at `y = (r, t₀, …, t₃)`: `z_i = scl_i sg r`, `z_j = scl_j r t`. -/
def zf (scl : List (ℤ × ℕ)) (i : ℕ) (sg : ℤ) (y : Fin 5 → ℝ) : Fin 5 → ℝ :=
  fun j => y 0 * zf1 scl i sg y j

/-- `Π_j sd_j³`. -/
def sclS (scl : List (ℤ × ℕ)) : ℝ := ∏ j : Fin 5, ((nth scl j (0, 1)).2 : ℝ) ^ 3

/-- One term of `faceH` (copied from `D28.faceH`). -/
def fTerm (scl : List (ℤ × ℕ)) (i : ℕ) (sg : ℤ) : Mono × FE → Option (Mono × FE × Bool) :=
  fun (m, a) =>
    if m == zeroMono then none else
    let tot := m.foldl (· + ·) 0
    let f : Int := (List.zip (List.range 5) (List.zip m scl)).foldl (fun acc (x : Nat × (Nat × (Int × Nat))) =>
      let (j, (e, (sn, sd))) := x
      acc * sn ^ e * (sd : Int) ^ (3 - e) * (if j == i then sg ^ e else 1)) 1
    let others := (List.zip (List.range 5) m).filterMap (fun (x : Nat × Nat) => if x.1 == i then none else some x.2)
    some ((tot - 1) :: others, fsmul f a, decide (m.all (· ≤ 3)))

theorem faceH_eq (scl : List (ℤ × ℕ)) (i : ℕ) (sg : ℤ) (p : Poly) :
    faceH scl i sg p =
      if (p.filterMap (fTerm scl i sg)).all (fun t => t.2.2) then
        some (psum ((p.filterMap (fTerm scl i sg)).map (fun t => [(t.1, t.2.1)])))
      else none := rfl

theorem m5_smul (m : Mono) (r : ℝ) (u : Fin 5 → ℝ) :
    m5 m (fun j => r * u j) = r ^ (∑ j : Fin 5, m.getD j 0) * m5 m u := by
  simp only [m5, mul_pow, Finset.prod_mul_distrib, Finset.prod_pow_eq_pow_sum]

theorem sum_getD {m : Mono} (hm : m.length = 5) : ∑ j : Fin 5, m.getD j 0 = m.foldl (· + ·) 0 := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  simp [Fin.sum_univ_five]
  try omega

theorem m5_head (h : ℕ) {o : List ℕ} (ho : o.length = 4) (y : Fin 5 → ℝ) :
    m5 (h :: o) y = y 0 ^ h * m5 (0 :: o) y := by
  match o, ho with
  | [a, b, c, d], _ => simp [m5_five]; ring

/-- The scale identity `sd³ (sn/sd)^e = sn^e sd^(3−e)`. -/
theorem sc_id (sn : ℤ) (sd : ℕ) (hsd : sd ≠ 0) (e : ℕ) (he : e ≤ 3) :
    ((sn : ℝ) / sd) ^ e = (sn : ℝ) ^ e * (sd : ℝ) ^ (3 - e) / (sd : ℝ) ^ 3 := by
  have hs : (sd : ℝ) ≠ 0 := by exact_mod_cast hsd
  obtain ⟨k, hk⟩ : ∃ k, 3 = e + k := ⟨3 - e, by omega⟩
  rw [show 3 - e = k by omega, hk, div_pow, pow_add]
  field_simp

/-- **The core identity of one term** (no `r`). -/
theorem core_id (scl : List (ℤ × ℕ)) (hscl : scl.length = 5) (hsd : ∀ x ∈ scl, x.2 ≠ 0)
    (i : ℕ) (hi : i < 5) (sg : ℤ) (m : Mono) (hm : m.length = 5) (h3 : m.all (· ≤ 3) = true)
    (y : Fin 5 → ℝ) :
    (((List.zip (List.range 5) (List.zip m scl)).foldl (fun acc (x : Nat × (Nat × (Int × Nat))) =>
      let (j, (e, (sn, sd))) := x
      acc * sn ^ e * (sd : Int) ^ (3 - e) * (if j == i then sg ^ e else 1)) 1 : ℤ) : ℝ) *
      m5 (0 :: (List.zip (List.range 5) m).filterMap
        (fun (x : Nat × Nat) => if x.1 == i then none else some x.2)) y
      = sclS scl * m5 m (zf1 scl i sg y) := by
  obtain ⟨m0, m1, m2, m3, m4, rfl⟩ := len5 hm
  obtain ⟨⟨n0, d0⟩, ⟨n1, d1⟩, ⟨n2, d2⟩, ⟨n3, d3⟩, ⟨n4, d4⟩, rfl⟩ := len5 hscl
  simp only [List.mem_cons, List.not_mem_nil, or_false, forall_eq_or_imp, forall_eq] at hsd
  obtain ⟨s0, s1, s2, s3, s4⟩ := hsd
  simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true, decide_eq_true_eq] at h3
  obtain ⟨e0, e1, e2, e3, e4⟩ := h3
  have v3 : ((3 : Fin 5) : ℕ) = 3 := rfl
  have v4 : ((4 : Fin 5) : ℕ) = 4 := rfl
  have hS : sclS [(n0, d0), (n1, d1), (n2, d2), (n3, d3), (n4, d4)] =
      (d0 : ℝ) ^ 3 * (d1 : ℝ) ^ 3 * (d2 : ℝ) ^ 3 * (d3 : ℝ) ^ 3 * (d4 : ℝ) ^ 3 := by
    simp [sclS, Fin.prod_univ_five, nth, v3, v4]
  have t0 : (d0 : ℝ) ≠ 0 := by exact_mod_cast s0
  have t1 : (d1 : ℝ) ≠ 0 := by exact_mod_cast s1
  have t2 : (d2 : ℝ) ≠ 0 := by exact_mod_cast s2
  have t3 : (d3 : ℝ) ≠ 0 := by exact_mod_cast s3
  have t4 : (d4 : ℝ) ≠ 0 := by exact_mod_cast s4
  obtain ⟨k0, hk0⟩ : ∃ k, 3 = m0 + k := ⟨3 - m0, by omega⟩
  obtain ⟨k1, hk1⟩ : ∃ k, 3 = m1 + k := ⟨3 - m1, by omega⟩
  obtain ⟨k2, hk2⟩ : ∃ k, 3 = m2 + k := ⟨3 - m2, by omega⟩
  obtain ⟨k3, hk3⟩ : ∃ k, 3 = m3 + k := ⟨3 - m3, by omega⟩
  obtain ⟨k4, hk4⟩ : ∃ k, 3 = m4 + k := ⟨3 - m4, by omega⟩
  have hS' : sclS [(n0, d0), (n1, d1), (n2, d2), (n3, d3), (n4, d4)] =
      (d0 : ℝ) ^ (m0 + k0) * (d1 : ℝ) ^ (m1 + k1) * (d2 : ℝ) ^ (m2 + k2) * (d3 : ℝ) ^ (m3 + k3) *
        (d4 : ℝ) ^ (m4 + k4) := by
    rw [hS, ← hk0, ← hk1, ← hk2, ← hk3, ← hk4]
  rw [hS']
  interval_cases i <;>
  · simp only [show List.range 5 = [0, 1, 2, 3, 4] from rfl, List.zip_cons_cons, List.zip_nil_left,
      List.foldl_cons, List.foldl_nil, List.filterMap_cons, List.filterMap_nil, beq_iff_eq,
      m5_five, zf1, wv, sclv, nth, List.getD_cons_zero, List.getD_cons_succ, v3, v4,
      Fin.isValue, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.cons_val_two,
      Matrix.cons_val_three, Matrix.cons_val_four, ite_true, ite_false, Option.some.injEq]
    simp only [m5, Fin.prod_univ_five, Fin.val_zero, Fin.val_one, Fin.val_two, v3, v4,
      List.getD_cons_zero, List.getD_cons_succ, Fin.isValue, Matrix.cons_val_zero, Matrix.cons_val_one,
      Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four, Matrix.vecHead,
      Matrix.vecTail, Function.comp_apply, Fin.succ_zero_eq_one, Fin.succ_one_eq_two, pow_zero,
      one_mul]
    simp only [List.getD_eq_getElem?_getD, List.length_cons, List.length_nil, Nat.reduceAdd,
      List.getElem?_cons_zero, Option.getD_some, List.getElem?_cons_succ]
    norm_num
    push_cast
    set A0 := (n0 : ℝ) / (d0 : ℝ) with hA0
    set A1 := (n1 : ℝ) / (d1 : ℝ) with hA1
    set A2 := (n2 : ℝ) / (d2 : ℝ) with hA2
    set A3 := (n3 : ℝ) / (d3 : ℝ) with hA3
    set A4 := (n4 : ℝ) / (d4 : ℝ) with hA4
    have hn0 : (n0 : ℝ) = A0 * d0 := by rw [hA0]; field_simp
    have hn1 : (n1 : ℝ) = A1 * d1 := by rw [hA1]; field_simp
    have hn2 : (n2 : ℝ) = A2 * d2 := by rw [hA2]; field_simp
    have hn3 : (n3 : ℝ) = A3 * d3 := by rw [hA3]; field_simp
    have hn4 : (n4 : ℝ) = A4 * d4 := by rw [hA4]; field_simp
    rw [show 3 - m0 = k0 by omega, show 3 - m1 = k1 by omega, show 3 - m2 = k2 by omega,
      show 3 - m3 = k3 by omega, show 3 - m4 = k4 by omega, hn0, hn1, hn2, hn3, hn4]
    ring

/-- **One term of `faceH`.** -/
theorem fTerm_spec (scl : List (ℤ × ℕ)) (hscl : scl.length = 5) (hsd : ∀ x ∈ scl, x.2 ≠ 0)
    (i : ℕ) (hi : i < 5) (sg : ℤ) {ps : List ℕ} (e : Mono × FE) (he : e.1.length = 5 ∧ Len ps e.2)
    {t : Mono × FE × Bool} (ht : fTerm scl i sg e = some t) (h3 : t.2.2 = true) (y : Fin 5 → ℝ) :
    (t.1.length = 5 ∧ Len ps t.2.1) ∧
    y 0 * (fval ps t.2.1 * m5 t.1 y) = sclS scl * (fval ps e.2 * m5 e.1 (zf scl i sg y)
      - fval ps e.2 * m5 e.1 0) := by
  obtain ⟨m, a⟩ := e
  simp only at he ⊢
  unfold fTerm at ht
  simp only at ht
  split_ifs at ht with hz
  simp only [Option.some.injEq] at ht
  subst ht
  simp only [decide_eq_true_eq] at h3
  have hm0 : m5 m 0 = 0 := by rw [m5_zero he.1]; simp [hz]
  have hoth : ((List.zip (List.range 5) m).filterMap
      (fun (x : Nat × Nat) => if x.1 == i then none else some x.2)).length = 4 := by
    obtain ⟨m0, m1, m2, m3, m4, rfl⟩ := len5 he.1
    interval_cases i <;> rfl
  refine ⟨⟨by simp only [List.length_cons, hoth], len_fsmul _ he.2⟩, ?_⟩
  have htot : 1 ≤ m.foldl (· + ·) 0 := by
    obtain ⟨m0, m1, m2, m3, m4, rfl⟩ := len5 he.1
    simp only [zeroMono, beq_iff_eq, List.cons.injEq, and_true, not_and] at hz
    simp only [List.foldl_cons, List.foldl_nil]
    by_contra hc
    exact hz (by omega) (by omega) (by omega) (by omega) (by omega)
  have hzf : m5 m (zf scl i sg y) = y 0 ^ (m.foldl (· + ·) 0) * m5 m (zf1 scl i sg y) := by
    unfold zf; rw [m5_smul, sum_getD he.1]
  rw [hm0, mul_zero, sub_zero, hzf, m5_head _ hoth, fval_fsmul]
  have hc := core_id scl hscl hsd i hi sg m he.1 (by simpa using h3) y
  have hp : y 0 ^ (m.foldl (· + ·) 0) = y 0 * y 0 ^ (m.foldl (· + ·) 0 - 1) := by
    rw [← pow_succ']; congr 1; omega
  rw [hp]
  linear_combination (y 0 * y 0 ^ (m.foldl (· + ·) 0 - 1) * fval ps a) * hc

theorem psum_single {ps : List ℕ} (l : List (Mono × FE × Bool)) (hl : ∀ t ∈ l, t.1.length = 5 ∧ Len ps t.2.1)
    (y : Fin 5 → ℝ) :
    WF5 ps (psum (l.map (fun t => [(t.1, t.2.1)]))) ∧
    pEval5 ps (psum (l.map (fun t => [(t.1, t.2.1)]))) y = (l.map (fun t => fval ps t.2.1 * m5 t.1 y)).sum := by
  have hw : ∀ q ∈ l.map (fun t => ([(t.1, t.2.1)] : Poly)), WF5 ps q := by
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨t, ht, rfl⟩ := hq
    simpa using hl t ht
  refine ⟨psum_WF hw, ?_⟩
  rw [pEval5_psum y hw, List.map_map]
  congr 1
  apply List.map_congr_left
  intro t _
  simp

/-- **`faceH`**: `r · H(r, t) = (Π sd³) · (G(z) − G(0))` on the face. -/
theorem faceH_spec (scl : List (ℤ × ℕ)) (hscl : scl.length = 5) (hsd : ∀ x ∈ scl, x.2 ≠ 0)
    (i : ℕ) (hi : i < 5) (sg : ℤ) {ps : List ℕ} {p H : Poly} (hp : WF5 ps p)
    (hH : faceH scl i sg p = some H) :
    WF5 ps H ∧ ∀ y : Fin 5 → ℝ,
      y 0 * pEval5 ps H y = sclS scl * (pEval5 ps p (zf scl i sg y) - pEval5 ps p 0) := by
  rw [faceH_eq] at hH
  split_ifs at hH with hall
  simp only [Option.some.injEq] at hH
  subst hH
  have hmem : ∀ t ∈ p.filterMap (fTerm scl i sg), ∃ e ∈ p, fTerm scl i sg e = some t := by
    intro t ht
    exact List.mem_filterMap.1 ht
  have hl : ∀ t ∈ p.filterMap (fTerm scl i sg), t.1.length = 5 ∧ Len ps t.2.1 := by
    intro t ht
    obtain ⟨e, he, het⟩ := hmem t ht
    exact (fTerm_spec scl hscl hsd i hi sg e (hp e he) het (List.all_eq_true.1 hall t ht) 0).1
  refine ⟨(psum_single _ hl 0).1, fun y => ?_⟩
  rw [(psum_single _ hl y).2]
  clear hmem hl
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF5_cons] at hp
    have hall' : (p.filterMap (fTerm scl i sg)).all (fun t => t.2.2) = true := by
      rw [List.filterMap_cons] at hall
      split at hall
      · exact hall
      · simp only [List.all_cons, Bool.and_eq_true] at hall; exact hall.2
    rw [List.filterMap_cons, pEval5_cons, pEval5_cons]
    rcases hft : fTerm scl i sg e with _ | t
    · simp only
      rw [ih hp.2 hall']
      have hz : e.1 = zeroMono := by
        unfold fTerm at hft
        simp only at hft
        split_ifs at hft with h
        exact beq_iff_eq.1 h
      have h1 : m5 e.1 (zf scl i sg y) = 1 := by rw [hz]; simp [zeroMono, m5_five]
      have h2 : m5 e.1 0 = 1 := by rw [hz]; simp [zeroMono, m5_five]
      rw [h1, h2]; ring
    · simp only [List.map_cons, List.sum_cons]
      have h3 : t.2.2 = true := by
        rw [List.filterMap_cons, hft] at hall
        simp only [List.all_cons, Bool.and_eq_true] at hall; exact hall.1
      rw [mul_add, ih hp.2 hall', (fTerm_spec scl hscl hsd i hi sg e hp.1 hft h3 y).2]
      ring


/-! ## 2. The box tree of one face (5 dimensions) -/

/-- The point `z` lies in the closed box `b` (in units of `D`). -/
def InL (b : LBox) (z : Fin 5 → ℝ) : Prop :=
  ∀ k : Fin 5, ((nth b.lo k.val 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth b.hi k.val 0 : ℤ) : ℝ)

/-- Five coordinates on each side. -/
def Len5 (b : LBox) : Prop := b.lo.length = 5 ∧ b.hi.length = 5

/-- What an accepted leaf certifies. -/
def LGood (P : Prob) (D : ℤ) (Hs : List Poly) (b : LBox) : Prop :=
  Len5 b ∧ (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
  ∃ c < Hs.length, ∃ v : ℤ, shiftLb P D (nth Hs c []) b.lo b.hi = some v ∧ 0 < v

theorem lstep_ok_false (P : Prob) (D : ℤ) (Hs : List Poly) (s : LState) (t : LTok)
    (h : s.ok = false) : (lstep P D Hs s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [lstep, hst, h]

theorem foldl_ok_false (P : Prob) (D : ℤ) (Hs : List Poly) :
    ∀ (toks : List LTok) (s : LState), s.ok = false → (toks.foldl (lstep P D Hs) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (lstep_ok_false P D Hs s t h)

theorem getD_set (l : List ℤ) (a k : ℕ) (m d : ℤ) :
    (l.set a m).getD k d = l.getD k d ∨ (k = a ∧ (l.set a m).getD k d = m) := by
  simp only [List.getD_eq_getElem?_getD, List.getElem?_set]
  by_cases h : a = k
  · subst h
    by_cases h2 : a < l.length
    · right; simp [h2]
    · left; simp [h2]
  · left; simp [h]

theorem lsplit_len (b : LBox) (h : Len5 b) : Len5 (lsplit b).1 ∧ Len5 (lsplit b).2 := by
  unfold lsplit Len5
  simp only [List.length_set]
  exact ⟨⟨h.1, h.2⟩, ⟨h.1, h.2⟩⟩

theorem lsplit_cover (b : LBox) (z : Fin 5 → ℝ) (h : InL b z) :
    InL (lsplit b).1 z ∨ InL (lsplit b).2 z := by
  unfold lsplit
  simp only
  generalize ((List.range 5).find? _).getD 0 = ax
  generalize (nth b.lo ax 0 + nth b.hi ax 0) / 2 = mid
  rcases le_total (z ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩) (mid : ℝ) with hz | hz
  · left
    intro k
    refine ⟨(h k).1, ?_⟩
    unfold nth
    rcases getD_set b.hi ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).2
    · rw [e2]
      have : k = ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz
  · right
    intro k
    refine ⟨?_, (h k).2⟩
    unfold nth
    rcases getD_set b.lo ax k.val mid 0 with e | ⟨e1, e2⟩
    · rw [e]; exact (h k).1
    · rw [e2]
      have : k = ⟨ax % 5, Nat.mod_lt _ (by norm_num)⟩ := by
        ext; simp only; rw [← e1, Nat.mod_eq_of_lt k.isLt]
      rw [this]; exact hz

/-- **Tree soundness** of one face (as `LocalG.lrun_cover`). -/
theorem lrun_cover (P : Prob) (D : ℤ) (Hs : List Poly) :
    ∀ (toks : List LTok) (s : LState), (∀ B ∈ s.stack, Len5 B) →
      (toks.foldl (lstep P D Hs) s).ok = true →
      (toks.foldl (lstep P D Hs) s).stack = [] →
      ∀ z, (∃ B ∈ s.stack, InL B z) → ∃ B, LGood P D Hs B ∧ InL B z := by
  intro toks
  induction toks with
  | nil =>
    intro s _ _ hst z ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hlen hok hst z ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (lstep P D Hs s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P D Hs toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB hlen
      have hrest : ∀ C ∈ rest, Len5 C := fun C hC => hlen C (List.mem_cons_of_mem _ hC)
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (lstep P D Hs s .split).stack = (lsplit B).1 :: (lsplit B).2 :: rest := by
            simp [lstep, hs]
          have hl2 := lsplit_len B (hlen B (by simp))
          refine ih _ ?_ hok hst z ?_
          · rw [hs']
            intro C hC
            rcases List.mem_cons.1 hC with rfl | hC
            · exact hl2.1
            rcases List.mem_cons.1 hC with rfl | hC
            · exact hl2.2
            · exact hrest C hC
          rw [hs']
          rcases lsplit_cover B z hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | acc c =>
          simp only [lstep, hs, Bool.and_eq_true, decide_eq_true_eq] at hok'
          obtain ⟨⟨⟨_, hc⟩, hw⟩, hr⟩ := hok'
          refine ⟨B, ⟨hlen B (by simp), hw, c, hc, ?_⟩, hz⟩
          revert hr
          rcases hv : shiftLb P D (nth Hs c []) B.lo B.hi with _ | v
          · simp
          · intro hr; exact ⟨v, rfl, by simpa using hr⟩
      · have hsub : ∀ C ∈ rest, C ∈ (lstep P D Hs s t).stack := by
          intro C hC; cases t <;> simp [lstep, hs, hC]
        have hlen' : ∀ C ∈ (lstep P D Hs s t).stack, Len5 C := by
          intro C hC
          cases t with
          | split =>
            have hl2 := lsplit_len b (hlen b (by simp))
            simp only [lstep, hs, List.mem_cons] at hC
            rcases hC with rfl | rfl | hC
            · exact hl2.1
            · exact hl2.2
            · exact hrest C hC
          | acc c =>
            simp only [lstep, hs] at hC
            exact hrest C hC
        exact ih _ hlen' hok hst z ⟨B, hsub B hBr, hz⟩


/-! ## 3. Unpacking `localRegionOk` -/

/-- The scale of `ξ` (copied from `localRegionOk`). -/
def rxOf (P : Prob) : Int × Nat :=
  if -P.xi0.1 * P.xi1.2 ≥ P.xi1.1 * P.xi0.2 then (-P.xi0.1, P.xi0.2) else P.xi1

def divR (a : Int × Nat) (b : Int × Nat) : Int × Nat :=
  (a.1 * b.2 * (if b.1 > 0 then 1 else -1), (a.2 * b.1.natAbs))

def qr (q : QF) : Int × Nat := (q.num.headD 0, q.den)
def ratOk (q : QF) : Bool := (q.num.drop 1).all (· == 0)

/-- The normalized ranges of `ζ` (copied). -/
def zrOf (P : Prob) (rg : Region) : List ((Int × Nat) × (Int × Nat)) :=
  [(divR P.xi0 (rxOf P), divR P.xi1 (rxOf P)), ((-1, 1), (1, 1))] ++
    (List.zip rg.rlo rg.rhi).map (fun (a, b) => (qr a, qr b))

/-- The scales `z = scl · ζ` (copied). -/
def sclOf (P : Prob) (rg : Region) : List (Int × Nat) := [rxOf P, P.lny, qr rg.rho, qr rg.rho, qr rg.rho]

def rngOkOf (P : Prob) (rg : Region) : Bool :=
  rg.rlo.all ratOk && rg.rhi.all ratOk && ratOk rg.rho && decide (0 < (rxOf P).1) &&
    (zrOf P rg).all (fun (a, b) => ratLe (-1) 1 a.1 a.2 && ratLe a.1 a.2 0 1 && ratLe 0 1 b.1 b.2 &&
      ratLe b.1 b.2 1 1)

def isOne (x : Int × Nat) : Bool := x.1 == (x.2 : Int)
def isMOne (x : Int × Nat) : Bool := x.1 == -(x.2 : Int)

def faceListOf (P : Prob) (rg : Region) : List (Nat × Int) :=
  (List.range 5).foldl (fun acc i =>
    let (a, b) := nth (zrOf P rg) i ((0, 1), (0, 1))
    acc ++ (if isOne b then [(i, 1)] else []) ++ (if isMOne a then [(i, -1)] else [])) []

/-- The ranges of the other coordinates of the face `i`. -/
def trOf (zr : List ((Int × Nat) × (Int × Nat))) (i : Nat) : List ((Int × Nat) × (Int × Nat)) :=
  (List.zip (List.range 5) zr).filterMap
    (fun (y : Nat × ((Int × Nat) × (Int × Nat))) => if y.1 == i then none else some y.2)

def rootOf (D : Int) (tr : List ((Int × Nat) × (Int × Nat))) : LBox :=
  ⟨0 :: tr.map (fun (a, _) => (ratToD D a).getD 1), D :: tr.map (fun (_, b) => (ratToD D b).getD 0)⟩

def trOkOf (D : Int) (tr : List ((Int × Nat) × (Int × Nat))) : Bool :=
  tr.all (fun (a, b) => (ratToD D a).isSome && (ratToD D b).isSome)

def HsOf (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (i : Nat) (sg : Int) :
    List (Option Poly) :=
  cands.map (fun cd => faceH (sclOf P rg) i sg (candPQ (localParts P rg) fs cd).p)

def runOf (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int)
    (i : Nat) (sg : Int) (toks : List LTok) : LState :=
  toks.foldl (lstep P D ((HsOf P rg fs cands i sg).map (fun h => h.getD [])))
    ⟨[rootOf D (trOf (zrOf P rg) i)], true, 0⟩

/-- One step of the fold over the faces (as in `localRegionOk`). -/
def stepF (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int) :
    Bool × Nat → (Nat × Int) × List LTok → Bool × Nat :=
  fun (acc : Bool × Nat) (x : (Nat × Int) × List LTok) =>
    let ((i, sg), toks) := x
    let s := runOf P rg fs cands D i sg toks
    (acc.1 && trOkOf D (trOf (zrOf P rg) i) && (HsOf P rg fs cands i sg).all Option.isSome && s.ok &&
      s.stack.isEmpty, acc.2 + s.nAcc)

theorem localRegionOk_eq (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat))
    (faces : List (List LTok)) (D : Int) :
    (localRegionOk P rg fs cands faces D).1 =
      (identOk P (localParts P rg) fs cands && rngOkOf P rg &&
        (faceListOf P rg).length == faces.length &&
        ((List.zip (faceListOf P rg) faces).foldl (stepF P rg fs cands D) (true, 0)).1) := rfl


theorem stepF_false (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int) :
    ∀ (l : List ((Nat × Int) × List LTok)) (k : ℕ), (l.foldl (stepF P rg fs cands D) (false, k)).1 = false := by
  intro l
  induction l with
  | nil => intro k; rfl
  | cons x l ih =>
    intro k
    rw [List.foldl_cons]
    obtain ⟨⟨i, sg⟩, toks⟩ := x
    simp only [stepF, Bool.false_and]
    exact ih _

/-- The fold over the faces passed ⇒ every face passed. -/
theorem stepF_all (P : Prob) (rg : Region) (fs : List Nat) (cands : List (List Nat)) (D : Int) :
    ∀ (l : List ((Nat × Int) × List LTok)) (b : Bool) (k : ℕ),
    (l.foldl (stepF P rg fs cands D) (b, k)).1 = true → ∀ i sg toks, ((i, sg), toks) ∈ l →
      trOkOf D (trOf (zrOf P rg) i) = true ∧ (HsOf P rg fs cands i sg).all Option.isSome = true ∧
      (runOf P rg fs cands D i sg toks).ok = true ∧ (runOf P rg fs cands D i sg toks).stack = [] := by
  intro l
  induction l with
  | nil => intro b k _ i sg toks h; simp at h
  | cons x l ih =>
    intro b k hb i sg toks hx
    rw [List.foldl_cons] at hb
    obtain ⟨⟨i', sg'⟩, toks'⟩ := x
    have h1 : (stepF P rg fs cands D (b, k) ((i', sg'), toks')).1 = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      have : stepF P rg fs cands D (b, k) ((i', sg'), toks') =
          (false, (stepF P rg fs cands D (b, k) ((i', sg'), toks')).2) := by
        rw [← hc]
      rw [this, stepF_false] at hb
      exact Bool.false_ne_true hb
    rcases List.mem_cons.1 hx with he | hx
    · simp only [Prod.mk.injEq] at he
      obtain ⟨⟨rfl, rfl⟩, rfl⟩ := he
      simp only [stepF, Bool.and_eq_true] at h1
      exact ⟨h1.1.1.1.2, h1.1.1.2, h1.1.2, List.isEmpty_iff.1 h1.2⟩
    · exact ih _ _ hb i sg toks hx

/-! ## 4. The points of the normalized box on the faces -/

/-- The value of a rational `(n, d)`. -/
def ratv (x : ℤ × ℕ) : ℝ := (x.1 : ℝ) / (x.2 : ℝ)

/-- The ends of the ranges are `0` or `±1`, with positive denominators (checked by `endsOk`). -/
def endsOk (zr : List ((Int × Nat) × (Int × Nat))) : Bool :=
  zr.all (fun (x : (Int × Nat) × (Int × Nat)) => (x.1.1 == -(x.1.2 : Int) || x.1.1 == 0) &&
    (x.2.1 == (x.2.2 : Int) || x.2.1 == 0) && decide (0 < x.1.2) && decide (0 < x.2.2))

def EndP (x : (Int × Nat) × (Int × Nat)) : Prop :=
  ((ratv x.1 = -1 ∧ isMOne x.1 = true) ∨ ratv x.1 = 0) ∧ ((ratv x.2 = 1 ∧ isOne x.2 = true) ∨ ratv x.2 = 0)
    ∧ 0 < x.1.2 ∧ 0 < x.2.2

theorem endP_of {x : (Int × Nat) × (Int × Nat)}
    (h : ((x.1.1 == -(x.1.2 : Int) || x.1.1 == 0) && (x.2.1 == (x.2.2 : Int) || x.2.1 == 0) &&
      decide (0 < x.1.2) && decide (0 < x.2.2)) = true) : EndP x := by
  obtain ⟨⟨a, ad⟩, ⟨b, bd⟩⟩ := x
  simp only [Bool.and_eq_true, Bool.or_eq_true, beq_iff_eq, decide_eq_true_eq] at h
  obtain ⟨⟨⟨ha, hb⟩, had⟩, hbd⟩ := h
  have had' : (ad : ℝ) ≠ 0 := by exact_mod_cast had.ne'
  have hbd' : (bd : ℝ) ≠ 0 := by exact_mod_cast hbd.ne'
  refine ⟨?_, ?_, had, hbd⟩
  · rcases ha with ha | ha
    · left; refine ⟨?_, by simp [isMOne, ha]⟩
      simp only [ratv, ha]; push_cast; field_simp
    · right; simp [ratv, ha]
  · rcases hb with hb | hb
    · left; refine ⟨?_, by simp [isOne, hb]⟩
      simp only [ratv, hb]; push_cast; field_simp
    · right; simp [ratv, hb]

theorem tb {lo hi z r : ℝ} (hr : 0 < r) (hz : |z| ≤ r) (hlo : lo = -1 ∨ lo = 0) (hhi : hi = 1 ∨ hi = 0)
    (h1 : lo ≤ z) (h2 : z ≤ hi) : lo ≤ z / r ∧ z / r ≤ hi := by
  rw [abs_le] at hz
  constructor
  · rw [le_div_iff₀ hr]; rcases hlo with rfl | rfl <;> nlinarith
  · rw [div_le_iff₀ hr]; rcases hhi with rfl | rfl <;> nlinarith

/-- The point `y = (r, ζ_others / r)` of the face `i`. -/
def yOf (i : ℕ) (r : ℝ) (ζ : Fin 5 → ℝ) : Fin 5 → ℝ :=
  match i with
  | 0 => ![r, ζ 1 / r, ζ 2 / r, ζ 3 / r, ζ 4 / r]
  | 1 => ![r, ζ 0 / r, ζ 2 / r, ζ 3 / r, ζ 4 / r]
  | 2 => ![r, ζ 0 / r, ζ 1 / r, ζ 3 / r, ζ 4 / r]
  | 3 => ![r, ζ 0 / r, ζ 1 / r, ζ 2 / r, ζ 4 / r]
  | _ => ![r, ζ 0 / r, ζ 1 / r, ζ 2 / r, ζ 3 / r]

abbrev d00 : (Int × Nat) × (Int × Nat) := ((0, 1), (0, 1))

/-- **Every point of the normalized box other than `0` lies on a face.** -/
theorem face_point (zr : List ((Int × Nat) × (Int × Nat))) (hlen : zr.length = 5)
    (hends : endsOk zr = true) (ζ : Fin 5 → ℝ)
    (hζ : ∀ j : Fin 5, ratv (nth zr j d00).1 ≤ ζ j ∧ ζ j ≤ ratv (nth zr j d00).2)
    (hne : ∃ j, ζ j ≠ 0) :
    ∃ i < 5, ∃ sg : ℤ, ((isOne (nth zr i d00).2 = true ∧ sg = 1) ∨
        (isMOne (nth zr i d00).1 = true ∧ sg = -1)) ∧
      ∃ y : Fin 5 → ℝ, 0 < y 0 ∧ y 0 ≤ 1 ∧
        (∀ k : Fin 4, ratv (nth (trOf zr i) k d00).1 ≤ y k.succ ∧
          y k.succ ≤ ratv (nth (trOf zr i) k d00).2) ∧
        ∀ j, ζ j = y 0 * wv i sg y j := by
  have hE : ∀ j : Fin 5, EndP (nth zr j d00) := by
    intro j
    apply endP_of
    have hm : nth zr j d00 ∈ zr := by
      unfold nth; rw [List.getD_eq_getElem _ _ (by rw [hlen]; exact j.isLt)]; exact List.getElem_mem _
    exact List.all_eq_true.1 hends _ hm
  have hab : ∀ j : Fin 5, |ζ j| ≤ 1 := by
    intro j
    obtain ⟨hl, hh, _⟩ := hE j
    obtain ⟨h1, h2⟩ := hζ j
    rw [abs_le]
    constructor
    · rcases hl with ⟨e, _⟩ | e <;> rw [e] at h1 <;> linarith
    · rcases hh with ⟨e, _⟩ | e <;> rw [e] at h2 <;> linarith
  obtain ⟨i, -, hmax⟩ := Finset.exists_max_image Finset.univ (fun j => |ζ j|) Finset.univ_nonempty
  have hmax' : ∀ j, |ζ j| ≤ |ζ i| := fun j => hmax j (Finset.mem_univ _)
  have hr : 0 < |ζ i| := by
    obtain ⟨j, hj⟩ := hne
    exact lt_of_lt_of_le (abs_pos.2 hj) (hmax' j)
  have hr1 : |ζ i| ≤ 1 := hab i
  obtain ⟨sg, hsg, hsr⟩ : ∃ sg : ℤ, ((isOne (nth zr i d00).2 = true ∧ sg = 1) ∨
      (isMOne (nth zr i d00).1 = true ∧ sg = -1)) ∧ (sg : ℝ) * |ζ i| = ζ i := by
    obtain ⟨hl, hh, _⟩ := hE i
    obtain ⟨h1, h2⟩ := hζ i
    rcases lt_or_gt_of_ne (abs_pos.1 hr) with hn | hp
    · refine ⟨-1, Or.inr ⟨?_, rfl⟩, by rw [abs_of_neg hn]; push_cast; ring⟩
      rcases hl with ⟨_, e⟩ | e
      · exact e
      · rw [e] at h1; linarith
    · refine ⟨1, Or.inl ⟨?_, rfl⟩, by rw [abs_of_pos hp]; push_cast; ring⟩
      rcases hh with ⟨_, e⟩ | e
      · exact e
      · rw [e] at h2; linarith
  refine ⟨i.val, i.isLt, sg, hsg, yOf i.val |ζ i| ζ, ?_⟩
  have tb' : ∀ j : Fin 5, ratv (nth zr j d00).1 ≤ ζ j / |ζ i| ∧
      ζ j / |ζ i| ≤ ratv (nth zr j d00).2 := by
    intro j
    obtain ⟨hl, hh, _⟩ := hE j
    exact tb hr (hmax' j) (by rcases hl with ⟨e, _⟩ | e <;> simp [e])
      (by rcases hh with ⟨e, _⟩ | e <;> simp [e]) (hζ j).1 (hζ j).2
  obtain ⟨z0, z1, z2, z3, z4, rfl⟩ := len5 hlen
  have hne0 : |ζ i| ≠ 0 := hr.ne'
  fin_cases i <;> beta_reduce at hsr hne0 <;>
    refine ⟨by simpa [yOf] using hr, by simpa [yOf] using hr1, fun k => ?_, fun j => ?_⟩
  all_goals first
    | (fin_cases k <;> first | exact tb' 0 | exact tb' 1 | exact tb' 2 | exact tb' 3 | exact tb' 4)
    | (fin_cases j <;> simp [yOf, wv] <;>
        first | exact (mul_div_cancel₀ _ hne0).symm | exact (hsr.symm.trans (mul_comm _ _)))


/-! ## 5. The root box of a face -/

theorem ratToD_spec {D : ℤ} {x : ℤ × ℕ} {v : ℤ} (h : ratToD D x = some v) (hx : 0 < x.2) :
    (v : ℝ) = D * ratv x := by
  unfold ratToD at h
  split_ifs at h with hd
  simp only [Option.some.injEq] at h
  subst h
  have hd' : (x.2 : ℤ) ∣ x.1 * D := Int.dvd_of_emod_eq_zero (by simpa using hd)
  have hx' : ((x.2 : ℤ) : ℝ) ≠ 0 := by exact_mod_cast hx.ne'
  rw [Int.cast_div hd' hx', ratv]
  push_cast
  field_simp

theorem getD_of_some {x : Option ℤ} {d : ℤ} (h : x.isSome = true) : ∃ v, x = some v ∧ x.getD d = v := by
  rcases x with _ | v
  · simp at h
  · exact ⟨v, rfl, rfl⟩

/-- The point `D · y` lies in the root box of the face. -/
theorem root_mem {D : ℤ} (hD : 0 < D) {tr : List ((Int × Nat) × (Int × Nat))} (htr : tr.length = 4)
    (hok : trOkOf D tr = true) (hpos : ∀ x ∈ tr, 0 < x.1.2 ∧ 0 < x.2.2) {y : Fin 5 → ℝ}
    (hy0 : 0 ≤ y 0) (hy1 : y 0 ≤ 1)
    (hk : ∀ k : Fin 4, ratv (nth tr k d00).1 ≤ y k.succ ∧ y k.succ ≤ ratv (nth tr k d00).2) :
    Len5 (rootOf D tr) ∧ InL (rootOf D tr) (fun k => (D : ℝ) * y k) := by
  match tr, htr with
  | [t0, t1, t2, t3], _ =>
  refine ⟨⟨by simp [rootOf], by simp [rootOf]⟩, ?_⟩
  simp only [trOkOf, List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true] at hok
  obtain ⟨⟨a0, b0⟩, ⟨a1, b1⟩, ⟨a2, b2⟩, ⟨a3, b3⟩⟩ := hok
  simp only [List.mem_cons, List.not_mem_nil, or_false, forall_eq_or_imp, forall_eq] at hpos
  obtain ⟨p0, p1, p2, p3⟩ := hpos
  obtain ⟨u0, hu0, gu0⟩ := getD_of_some (d := 1) a0
  obtain ⟨u1, hu1, gu1⟩ := getD_of_some (d := 1) a1
  obtain ⟨u2, hu2, gu2⟩ := getD_of_some (d := 1) a2
  obtain ⟨u3, hu3, gu3⟩ := getD_of_some (d := 1) a3
  obtain ⟨w0, hw0, gw0⟩ := getD_of_some (d := 0) b0
  obtain ⟨w1, hw1, gw1⟩ := getD_of_some (d := 0) b1
  obtain ⟨w2, hw2, gw2⟩ := getD_of_some (d := 0) b2
  obtain ⟨w3, hw3, gw3⟩ := getD_of_some (d := 0) b3
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have k0 := hk 0
  have k1 := hk 1
  have k2 := hk 2
  have k3 := hk 3
  simp only [nth, List.getD_cons_zero, List.getD_cons_succ, Fin.isValue, Fin.val_zero, Fin.val_one,
    Fin.val_two, Fin.succ_zero_eq_one, Fin.succ_one_eq_two] at k0 k1 k2 k3
  have e3 : ((3 : Fin 4) : ℕ) = 3 := rfl
  have s4 : (3 : Fin 4).succ = 4 := rfl
  have s2 : (2 : Fin 4).succ = 3 := rfl
  intro k
  fin_cases k
  · simp only [rootOf, nth, List.getD_cons_zero]
    push_cast
    constructor <;> nlinarith
  · simp only [rootOf, nth, List.map_cons, List.getD_cons_succ, List.getD_cons_zero, gu0, gw0]
    rw [ratToD_spec hu0 p0.1, ratToD_spec hw0 p0.2]
    exact ⟨by simpa using mul_le_mul_of_nonneg_left k0.1 hDr.le,
      by simpa using mul_le_mul_of_nonneg_left k0.2 hDr.le⟩
  · simp only [rootOf, nth, List.map_cons, List.getD_cons_succ, List.getD_cons_zero, gu1, gw1]
    rw [ratToD_spec hu1 p1.1, ratToD_spec hw1 p1.2]
    exact ⟨by simpa using mul_le_mul_of_nonneg_left k1.1 hDr.le,
      by simpa using mul_le_mul_of_nonneg_left k1.2 hDr.le⟩
  · simp only [rootOf, nth, List.map_cons, List.getD_cons_succ, List.getD_cons_zero, gu2, gw2]
    rw [ratToD_spec hu2 p2.1, ratToD_spec hw2 p2.2]
    exact ⟨by simpa [s2] using mul_le_mul_of_nonneg_left k2.1 hDr.le,
      by simpa [s2] using mul_le_mul_of_nonneg_left k2.2 hDr.le⟩
  · simp only [rootOf, nth, List.map_cons, List.getD_cons_succ, List.getD_cons_zero, gu3, gw3]
    rw [ratToD_spec hu3 p3.1, ratToD_spec hw3 p3.2]
    exact ⟨by simpa [e3, s4] using mul_le_mul_of_nonneg_left k3.1 hDr.le,
      by simpa [e3, s4] using mul_le_mul_of_nonneg_left k3.2 hDr.le⟩

theorem trOf_len {zr : List ((Int × Nat) × (Int × Nat))} (h : zr.length = 5) {i : ℕ} (hi : i < 5) :
    (trOf zr i).length = 4 := by
  obtain ⟨z0, z1, z2, z3, z4, rfl⟩ := len5 h
  interval_cases i <;> rfl

theorem trOf_sub {zr : List ((Int × Nat) × (Int × Nat))} {i : ℕ} : ∀ x ∈ trOf zr i, x ∈ zr := by
  intro x hx
  unfold trOf at hx
  obtain ⟨y, hy, hyx⟩ := List.mem_filterMap.1 hx
  split_ifs at hyx
  simp only [Option.some.injEq] at hyx
  subst hyx
  exact (List.of_mem_zip hy).2

theorem mem_faceList {P : Prob} {rg : Region} {i : ℕ} (hi : i < 5) {sg : ℤ}
    (h : (isOne (nth (zrOf P rg) i d00).2 = true ∧ sg = 1) ∨
      (isMOne (nth (zrOf P rg) i d00).1 = true ∧ sg = -1)) : (i, sg) ∈ faceListOf P rg := by
  unfold faceListOf
  generalize zrOf P rg = zr at h
  simp only [show List.range 5 = [0, 1, 2, 3, 4] from rfl, List.foldl_cons, List.foldl_nil,
    List.nil_append]
  interval_cases i <;> rcases h with ⟨h1, rfl⟩ | ⟨h1, rfl⟩ <;> simp [h1]

theorem nth_map_lt {α β : Type*} (f : α → β) {l : List α} {c : ℕ} (hc : c < l.length) (d : β) :
    nth (l.map f) c d = f (l[c]'hc) := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hc)]
  simp

theorem zip_mem {α β : Type} {l1 : List α} {l2 : List β} (hlen : l1.length = l2.length) {a : α}
    (ha : a ∈ l1) : ∃ b, (a, b) ∈ List.zip l1 l2 := by
  obtain ⟨n, hn, rfl⟩ := List.getElem_of_mem ha
  have hn2 : n < l2.length := hlen ▸ hn
  refine ⟨l2[n], ?_⟩
  have hz : n < (List.zip l1 l2).length := by simp [hn, hn2]
  have : (List.zip l1 l2)[n] = (l1[n], l2[n]) := by simp
  rw [← this]; exact List.getElem_mem hz

/-! ## 6. The local region: a candidate with `G ≥ 0` at every point -/

/-- **One local region.** If `localRegionOk` passed (and the ends of the ranges are `0`, `±1`), then
at every point `z = scl · ζ` of the region some candidate `cd` has `G_cd(z) ≥ 0`. -/
theorem region_pos {P : Prob} {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K) (hK : 0 < K)
    (hnb : P.nb = 2 ^ P.ps.length) {rg : Region} {fs : List ℕ} {cands : List (List ℕ)}
    {faces : List (List LTok)} {D : ℤ} (hD : 0 < D) (hok : (localRegionOk P rg fs cands faces D).1 = true)
    (hends : endsOk (zrOf P rg) = true) (hzl : (zrOf P rg).length = 5)
    (hscl : ∀ x ∈ sclOf P rg, x.2 ≠ 0) (hne : cands ≠ [])
    (hG : ∀ cd ∈ cands, WF5 P.ps (candPQ (localParts P rg) fs cd).p) (ζ : Fin 5 → ℝ)
    (hζ : ∀ j : Fin 5, ratv (nth (zrOf P rg) j d00).1 ≤ ζ j ∧ ζ j ≤ ratv (nth (zrOf P rg) j d00).2) :
    ∃ cd ∈ cands, 0 ≤ pEval5 P.ps (candPQ (localParts P rg) fs cd).p
      (fun j : Fin 5 => sclv (sclOf P rg) j * ζ j) := by
  rw [localRegionOk_eq] at hok
  simp only [Bool.and_eq_true, beq_iff_eq] at hok
  obtain ⟨⟨⟨hident, _⟩, hflen⟩, hres⟩ := hok
  have hz0 : ∀ cd ∈ cands, pEval5 P.ps (candPQ (localParts P rg) fs cd).p 0 = 0 := by
    intro cd hcd
    have hi := List.all_eq_true.1 hident cd hcd
    rw [pEval5_zero (hG cd hcd), ← hnb]
    exact fval_of_isZero _ hi
  by_cases hall0 : ∀ j, ζ j = 0
  · obtain ⟨cd, hcd⟩ := List.exists_mem_of_ne_nil cands hne
    refine ⟨cd, hcd, ?_⟩
    have : (fun j : Fin 5 => sclv (sclOf P rg) j * ζ j) = 0 := by funext j; simp [hall0 j]
    rw [this, hz0 cd hcd]
  push Not at hall0
  obtain ⟨i, hi, sg, hsg, y, hy0, hy1, hk, hζy⟩ := face_point _ hzl hends ζ hζ hall0
  obtain ⟨toks, htoks⟩ := zip_mem hflen (mem_faceList hi hsg)
  obtain ⟨htr, hHs, hrun, hst⟩ := stepF_all P rg fs cands D _ true 0 hres i sg toks htoks
  have hpos : ∀ x ∈ trOf (zrOf P rg) i, 0 < x.1.2 ∧ 0 < x.2.2 := by
    intro x hx
    have := List.all_eq_true.1 hends x (trOf_sub x hx)
    simp only [Bool.and_eq_true, decide_eq_true_eq] at this
    exact ⟨this.1.2, this.2⟩
  obtain ⟨hlen0, hin0⟩ := root_mem hD (trOf_len hzl hi) htr hpos hy0.le hy1 hk
  set Hs' := (HsOf P rg fs cands i sg).map (fun h => h.getD []) with hHs'
  obtain ⟨B, ⟨hL5, hw, c, hc, v, hv, hv0⟩, hinB⟩ := lrun_cover P D Hs' toks _
    (fun C hC => by simp at hC; rw [hC]; exact hlen0) hrun hst _ ⟨_, by simp, hin0⟩
  have hcl : c < cands.length := by simpa [hHs', HsOf] using hc
  set cd := cands[c]'hcl with hcd
  have hcdm : cd ∈ cands := List.getElem_mem hcl
  obtain ⟨H, hH⟩ : ∃ H, faceH (sclOf P rg) i sg (candPQ (localParts P rg) fs cd).p = some H := by
    have := List.all_eq_true.1 hHs _ (List.getElem_mem (by simpa [HsOf] using hcl))
    simp only [HsOf, List.getElem_map] at this
    exact Option.isSome_iff_exists.1 this
  have hnth : nth Hs' c [] = H := by
    rw [hHs', nth_map_lt _ (by simpa [HsOf] using hcl)]
    simp only [HsOf, List.getElem_map]
    rw [← hcd, hH]; rfl
  rw [hnth] at hv
  obtain ⟨hHw, hid⟩ := faceH_spec (sclOf P rg) rfl hscl i hi sg (hG cd hcdm) hH
  have hlenB : B.lo.length = 5 ∧ B.hi.length = 5 := hL5
  have hHpos := shiftLb_pos hK hb hD hHw hlenB.1 hlenB.2 hw hv hv0 _ hinB
  have hDr : (D : ℝ) ≠ 0 := by exact_mod_cast hD.ne'
  have hyy : (fun k => (D : ℝ) * y k / D) = y := by funext k; field_simp
  rw [hyy] at hHpos
  have hS : 0 < sclS (sclOf P rg) := by
    unfold sclS
    refine Finset.prod_pos (fun j _ => pow_pos ?_ 3)
    have hm : nth (sclOf P rg) j (0, 1) ∈ sclOf P rg := by
      unfold nth; rw [List.getD_eq_getElem _ _ (by simp [sclOf])]; exact List.getElem_mem _
    exact_mod_cast Nat.pos_of_ne_zero (hscl _ hm)
  have hzf : zf (sclOf P rg) i sg y = fun j : Fin 5 => sclv (sclOf P rg) j * ζ j := by
    funext j; rw [hζy j]; simp only [zf, zf1]; ring
  have key := hid y
  rw [hzf, hz0 cd hcdm, sub_zero] at key
  refine ⟨cd, hcdm, ?_⟩
  have : 0 < y 0 * pEval5 P.ps H y := mul_pos hy0 hHpos
  rw [key] at this
  exact (pos_of_mul_pos_right this hS.le).le

end

#assert_std_axioms PackLean.Formal.TetLocalPoly.faceH_spec PackLean.Formal.TetLocalPoly.lrun_cover
  PackLean.Formal.TetLocalPoly.region_pos

end PackLean.Formal.TetLocalPoly
