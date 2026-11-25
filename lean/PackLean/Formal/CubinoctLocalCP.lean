import PackLean.Formal.CubinoctLocal
import PackLean.D16.CubOct.K.Local

/-!
# D45 stage 3c: the local region of `cubinoct_n02` from the certificate run, and the lower bound

* `lp_core`: the real inequality (weak duality with the multipliers `Λ_σ/(4m)`, `μ = r²/m`);
* `cubinoct_hloc`: the hypothesis `hloc` of `cubinoct_lower_of_local`, from `cover_local_ok`
  (`native_decide`, the run of `D16C.localOk CP lfaces`);
* `cubinoct_lower`: `0 ≤ s` and two cubes fit in the octahedron of edge `s` ⇒ `1 + √2 ≤ s`.
-/

namespace PackLean.Formal.Loc

open PackLean.D28 PackLean.D16C PackLean.D16 PackLean.D16.CubOct PackLean.Formal.PolySem2
open PackLean.Formal.Far (rqList Rmat inD inL)
open Finset

/-! ## The real inequality -/

theorem abs3_div (a b c s0 s1 s2 N : ℝ) (hN : 0 < N) :
    |s0 * (a / N) + s1 * (b / N) + s2 * (c / N)| = |s0 * a + s1 * b + s2 * c| / N := by
  rw [show s0 * (a / N) + s1 * (b / N) + s2 * (c / N) = (s0 * a + s1 * b + s2 * c) / N by ring,
    abs_div, abs_of_pos hN]

/-- **The LP bound in the local region.** -/
theorem lp_core (N r2 m sd sst S t0 t1 t2 : ℝ) (L : ℕ → ℝ) (σ : ℕ → ℕ → ℝ) (rq : ℕ → ℝ)
    (hN : 0 < N) (hm : 0 < m) (hr : 0 < r2) (hsd : 0 < sd) (hL : ∀ k, k < 4 → 0 ≤ L k)
    (hrow : ∀ k, k < 4 → σ k 0 * t0 + σ k 1 * t1 + σ k 2 * t2 + 1 / 2 *
      (|σ k 0 * (rq 0 / N) + σ k 1 * (rq 3 / N) + σ k 2 * (rq 6 / N)| +
       |σ k 0 * (rq 1 / N) + σ k 1 * (rq 4 / N) + σ k 2 * (rq 7 / N)| +
       |σ k 0 * (rq 2 / N) + σ k 1 * (rq 5 / N) + σ k 2 * (rq 8 / N)|) ≤ S)
    (hface : rq 0 / N * t0 + rq 3 / N * t1 + rq 6 / N * t2 ≤ -(1 / 2))
    (hsum : L 0 + L 1 + L 2 + L 3 = 4 * m)
    (hid0 : (L 0 * σ 0 0 + L 1 * σ 1 0 + L 2 * σ 2 0 + L 3 * σ 3 0) * N = -4 * r2 * rq 0)
    (hid1 : (L 0 * σ 0 1 + L 1 * σ 1 1 + L 2 * σ 2 1 + L 3 * σ 3 1) * N = -4 * r2 * rq 3)
    (hid2 : (L 0 * σ 0 2 + L 1 * σ 1 2 + L 2 * σ 2 2 + L 3 * σ 3 2) * N = -4 * r2 * rq 6)
    (hkey : 0 ≤ 4 * sd * N * r2 - 8 * sst * m * N + sd * ((L 0 *
      (|σ 0 0 * rq 0 + σ 0 1 * rq 3 + σ 0 2 * rq 6| + |σ 0 0 * rq 1 + σ 0 1 * rq 4 + σ 0 2 * rq 7| +
        |σ 0 0 * rq 2 + σ 0 1 * rq 5 + σ 0 2 * rq 8|)) + (L 1 *
      (|σ 1 0 * rq 0 + σ 1 1 * rq 3 + σ 1 2 * rq 6| + |σ 1 0 * rq 1 + σ 1 1 * rq 4 + σ 1 2 * rq 7| +
        |σ 1 0 * rq 2 + σ 1 1 * rq 5 + σ 1 2 * rq 8|)) + (L 2 *
      (|σ 2 0 * rq 0 + σ 2 1 * rq 3 + σ 2 2 * rq 6| + |σ 2 0 * rq 1 + σ 2 1 * rq 4 + σ 2 2 * rq 7| +
        |σ 2 0 * rq 2 + σ 2 1 * rq 5 + σ 2 2 * rq 8|)) + (L 3 *
      (|σ 3 0 * rq 0 + σ 3 1 * rq 3 + σ 3 2 * rq 6| + |σ 3 0 * rq 1 + σ 3 1 * rq 4 + σ 3 2 * rq 7| +
        |σ 3 0 * rq 2 + σ 3 1 * rq 5 + σ 3 2 * rq 8|)))) :
    sst ≤ sd * S := by
  set A : ℕ → ℝ := fun k =>
    |σ k 0 * rq 0 + σ k 1 * rq 3 + σ k 2 * rq 6| + |σ k 0 * rq 1 + σ k 1 * rq 4 + σ k 2 * rq 7| +
      |σ k 0 * rq 2 + σ k 1 * rq 5 + σ k 2 * rq 8| with hA
  have hrow' : ∀ k, k < 4 → σ k 0 * t0 + σ k 1 * t1 + σ k 2 * t2 + A k / (2 * N) ≤ S := by
    intro k hk
    have := hrow k hk
    rw [abs3_div _ _ _ _ _ _ _ hN, abs3_div _ _ _ _ _ _ _ hN, abs3_div _ _ _ _ _ _ _ hN] at this
    have e : 1 / 2 * (|σ k 0 * rq 0 + σ k 1 * rq 3 + σ k 2 * rq 6| / N +
        |σ k 0 * rq 1 + σ k 1 * rq 4 + σ k 2 * rq 7| / N +
        |σ k 0 * rq 2 + σ k 1 * rq 5 + σ k 2 * rq 8| / N) = A k / (2 * N) := by
      simp only [hA]; field_simp
    linarith
  have hw : ∀ k, k < 4 → L k * (σ k 0 * t0 + σ k 1 * t1 + σ k 2 * t2) + L k * (A k / (2 * N))
      ≤ L k * S := by
    intro k hk
    have := mul_le_mul_of_nonneg_left (hrow' k hk) (hL k hk)
    linarith
  have w0 := hw 0 (by norm_num)
  have w1 := hw 1 (by norm_num)
  have w2 := hw 2 (by norm_num)
  have w3 := hw 3 (by norm_num)
  have hf4 := mul_le_mul_of_nonneg_left hface (by positivity : (0 : ℝ) ≤ 4 * r2)
  have e0 : (L 0 * σ 0 0 + L 1 * σ 1 0 + L 2 * σ 2 0 + L 3 * σ 3 0) = -4 * r2 * (rq 0 / N) := by
    field_simp; linarith
  have e1 : (L 0 * σ 0 1 + L 1 * σ 1 1 + L 2 * σ 2 1 + L 3 * σ 3 1) = -4 * r2 * (rq 3 / N) := by
    field_simp; linarith
  have e2 : (L 0 * σ 0 2 + L 1 * σ 1 2 + L 2 * σ 2 2 + L 3 * σ 3 2) = -4 * r2 * (rq 6 / N) := by
    field_simp; linarith
  -- the `t` terms cancel
  have hB : 2 * r2 + (L 0 * A 0 + L 1 * A 1 + L 2 * A 2 + L 3 * A 3) / (2 * N) ≤ 4 * m * S := by
    have ht : L 0 * (σ 0 0 * t0 + σ 0 1 * t1 + σ 0 2 * t2) + L 1 * (σ 1 0 * t0 + σ 1 1 * t1 + σ 1 2 * t2)
        + L 2 * (σ 2 0 * t0 + σ 2 1 * t1 + σ 2 2 * t2) + L 3 * (σ 3 0 * t0 + σ 3 1 * t1 + σ 3 2 * t2)
        = -(4 * r2 * (rq 0 / N * t0 + rq 3 / N * t1 + rq 6 / N * t2)) := by
      linear_combination t0 * e0 + t1 * e1 + t2 * e2
    have hS : L 0 * S + L 1 * S + L 2 * S + L 3 * S = 4 * m * S := by
      linear_combination S * hsum
    have hdiv : (L 0 * A 0 + L 1 * A 1 + L 2 * A 2 + L 3 * A 3) / (2 * N)
        = L 0 * (A 0 / (2 * N)) + L 1 * (A 1 / (2 * N)) + L 2 * (A 2 / (2 * N))
          + L 3 * (A 3 / (2 * N)) := by ring
    linarith
  set B := L 0 * A 0 + L 1 * A 1 + L 2 * A 2 + L 3 * A 3 with hBdef
  have hB2 : 4 * N * r2 + B ≤ 8 * m * N * S := by
    have := mul_le_mul_of_nonneg_left hB (by positivity : (0 : ℝ) ≤ 2 * N)
    have e : 2 * N * (2 * r2 + B / (2 * N)) = 4 * N * r2 + B := by field_simp; ring
    linarith
  have hB3 := mul_le_mul_of_nonneg_left hB2 hsd.le
  have hkey' : 8 * sst * m * N ≤ sd * (4 * N * r2 + B) := by
    simp only [hBdef, hA] at hkey ⊢
    linarith
  have h8 : 0 < 8 * m * N := by positivity
  have : sst * (8 * m * N) ≤ (sd * S) * (8 * m * N) := by linarith
  exact le_of_mul_le_mul_right this h8

/-! ## Values at the point `x = (b, γ, τ − τ*)` -/

/-- The sign vector `sig4[k]` as an element of `Sgn`. -/
def sg4 (k : ℕ) : Sgn := fun i => decide (s4 k i.val = -1)

theorem sv_sg4 (k : ℕ) (hk : k < 4) (i : Fin 3) : sv (sg4 k) i = s4 k i.val := by
  interval_cases k <;> fin_cases i <;> simp [sv, sg4, s4, sig4, nth]

theorem lamV_nonneg (c : ℤ) (hc : c = 1 ∨ c = -1) (k : ℕ) (hk : k < 4) {b g : ℝ}
    (hb0 : 0 ≤ b) (hb1 : b ≤ 1 / 16) (hg0 : 0 ≤ g) (hg1 : g ≤ 1 / 16) : 0 ≤ lamV c k b g := by
  have hb2 : b ^ 2 ≤ 1 / 256 := by nlinarith
  have hg2 : g ^ 2 ≤ 1 / 256 := by nlinarith
  rcases hc with rfl | rfl <;> interval_cases k <;>
    simp only [lamV, s4, sig4, nth, List.getD_cons_zero, List.getD_cons_succ] <;> push_cast <;>
    nlinarith

theorem s4_vals : s4 0 0 = -1 ∧ s4 0 1 = 1 ∧ s4 0 2 = 1 ∧ s4 1 0 = -1 ∧ s4 1 1 = 1 ∧ s4 1 2 = -1 ∧
    s4 2 0 = -1 ∧ s4 2 1 = -1 ∧ s4 2 2 = 1 ∧ s4 3 0 = -1 ∧ s4 3 1 = -1 ∧ s4 3 2 = -1 := by
  simp [s4, sig4, nth]

/-! ## The constants of `CP` -/

theorem CP_bracket : Bracket CP.sqb2 1329227995784915872903807060280344576 := by
  refine ⟨1879812259125035246445576347481445757, 1879812259125035246445576347481445758, rfl, ?_, ?_⟩
  · have h2 : (0 : ℝ) ≤ 1329227995784915872903807060280344576 * √2 := by positivity
    have : ((1879812259125035246445576347481445757 : ℤ) : ℝ) ^ 2
        ≤ (((1329227995784915872903807060280344576 : ℤ) : ℝ) * √2) ^ 2 := by
      rw [mul_pow, Real.sq_sqrt (by norm_num)]; norm_num
    push_cast at this ⊢
    exact (pow_le_pow_iff_left₀ (by norm_num) h2 (by norm_num)).1 this
  · have h2 : (0 : ℝ) ≤ 1329227995784915872903807060280344576 * √2 := by positivity
    have : (((1329227995784915872903807060280344576 : ℤ) : ℝ) * √2) ^ 2
        ≤ ((1879812259125035246445576347481445758 : ℤ) : ℝ) ^ 2 := by
      rw [mul_pow, Real.sq_sqrt (by norm_num)]; norm_num
    push_cast at this ⊢
    exact (pow_le_pow_iff_left₀ h2 (by norm_num) (by norm_num)).1 this

theorem CP_den' : CP.den = 17592186044416 := rfl
theorem CP_sst : CP.sst = [2, 1] := rfl
theorem CP_sstd : CP.sstd = 2 := rfl
theorem CP_r0 : ((CP.den * CP.rho0.1 / CP.rho0.2 : ℤ) : ℝ) = 17592186044416 / 16 := by
  rw [show CP.den * CP.rho0.1 / CP.rho0.2 = 1099511627776 from rfl]; norm_num

theorem CP_runs : fOkB CP = true ∧
    ∀ x ∈ List.zip faces4 lfaces, (runOf CP x).ok = true := by
  have h : (localOk CP lfaces).1 = true := by rw [PackLean.D16.CubOct.K.cover_local_ok]
  obtain ⟨h1, h2⟩ := localOk_imp CP lfaces h
  exact ⟨h1, res_all CP lfaces h2⟩

theorem zip_faces : List.zip faces4 lfaces =
    [((1, 1, (0, 1), (-1, 1)), [.acc (-1) 6]), ((0, 1, (0, 1), (-1, 1)), [.acc (-1) 15]),
     ((2, 1, (0, 1), (0, 1)), [.acc 1 12]), ((2, -1, (0, 1), (0, 1)), [.acc 1 3])] := rfl

/-! ## The key inequality at a point of `L` -/

theorem key_at (b g η : ℝ) (hb0 : 0 ≤ b) (hbg : b ≤ g) (hg1 : g ≤ 1 / 16) (hη : |η| < 1 / 16) :
    ∃ c : ℤ, (c = 1 ∨ c = -1) ∧
      0 ≤ pEval2 (baseP CP) ![b, g, η] + (itemsL.map (tTerm ![b, g, η] CP c)).sum := by
  obtain ⟨hf, hruns⟩ := CP_runs
  have hK : (0 : ℤ) < 1329227995784915872903807060280344576 := by norm_num
  have hD : 0 < CP.den := by rw [CP_den']; norm_num
  have hsd : 0 < CP.sstd := by rw [CP_sstd]; norm_num
  have hs : CP.sst.length = 2 := by rw [CP_sst]; rfl
  have hDr : (CP.den : ℝ) = 17592186044416 := by rw [CP_den']; norm_num
  have hlamx : ∀ c' : ℤ, (c' = 1 ∨ c' = -1) → ∀ k < 4, 0 ≤ pEval2 (nth (lamL c') k []) ![b, g, η] := by
    intro c' hc k hk
    rw [ev_lam _ c' k hk]
    simp only [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons]
    exact lamV_nonneg c' hc k hk hb0 (by linarith) (by linarith) hg1
  have hη' := abs_lt.1 hη
  by_cases h1 : |η| ≤ g
  · -- face `γ = ρ`
    have hrun := hruns _ (by rw [zip_faces]; exact List.mem_cons_self)
    rcases eq_or_lt_of_le (le_trans (abs_nonneg η) h1) with hg0 | hg0
    · -- the optimum itself
      have hb : b = 0 := by linarith
      have hη0 : η = 0 := abs_eq_zero.1 (le_antisymm (hg0 ▸ h1) (abs_nonneg η))
      have hx : lift 1 1 ![0, 0, 0] = ![b, g, η] := by
        funext k; fin_cases k <;> simp [lift, hb, hη0, ← hg0]
      have := face_key CP CP_bracket hK hD hsd hs hf 1 (by norm_num) 1 (0, 1) (-1, 1) (-1) 6 hrun
        ![0, 0, 0] (by simp) (by rw [CP_r0]; norm_num) (by simp) (by simp) (by rw [hx]; exact hlamx)
      rwa [hx] at this
    · have hx : lift 1 1 ![g, b / g, η / g] = ![b, g, η] := by
        funext k; fin_cases k <;> simp [lift] <;> field_simp
      have := face_key CP CP_bracket hK hD hsd hs hf 1 (by norm_num) 1 (0, 1) (-1, 1) (-1) 6 hrun
        ![g, b / g, η / g] (by simp; linarith) (by rw [CP_r0, hDr]; simp; linarith)
        (by
          simp only [Matrix.cons_val_one, Matrix.head_cons]
          push_cast
          exact ⟨div_nonneg hb0 hg0.le, (div_le_one hg0).2 hbg⟩)
        (by
          simp only [Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons]
          push_cast
          have := abs_le.1 h1
          exact ⟨(le_div_iff₀ hg0).2 (by linarith), (div_le_one hg0).2 this.2⟩)
        (by rw [hx]; exact hlamx)
      rwa [hx] at this
  · push Not at h1
    rcases le_or_gt 0 η with hη0 | hη0
    · -- face `η = ρ`
      have hpos : 0 < η := by
        rw [abs_of_nonneg hη0] at h1; linarith
      rw [abs_of_nonneg hη0] at h1
      have hrun := hruns _ (by
        rw [zip_faces]
        exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ List.mem_cons_self))
      have hx : lift 2 1 ![η, b / η, g / η] = ![b, g, η] := by
        funext k; fin_cases k <;> simp [lift] <;> field_simp
      have := face_key CP CP_bracket hK hD hsd hs hf 2 (by norm_num) 1 (0, 1) (0, 1) 1 12 hrun
        ![η, b / η, g / η] (by simp; linarith) (by rw [CP_r0, hDr]; simp; linarith)
        (by
          simp only [Matrix.cons_val_one, Matrix.head_cons]
          push_cast
          exact ⟨div_nonneg hb0 hpos.le, (div_le_one hpos).2 (by linarith)⟩)
        (by
          simp only [Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons]
          push_cast
          exact ⟨div_nonneg (by linarith) hpos.le, (div_le_one hpos).2 h1.le⟩)
        (by rw [hx]; exact hlamx)
      rwa [hx] at this
    · -- face `η = −ρ`
      rw [abs_of_neg hη0] at h1
      have hpos : 0 < -η := by linarith
      have hrun := hruns _ (by
        rw [zip_faces]
        exact List.mem_cons_of_mem _ (List.mem_cons_of_mem _ (List.mem_cons_of_mem _
          List.mem_cons_self)))
      have hne : η ≠ 0 := hη0.ne
      have hx : lift 2 (-1) ![-η, b / -η, g / -η] = ![b, g, η] := by
        funext k; fin_cases k <;> simp [lift] <;> field_simp
      have := face_key CP CP_bracket hK hD hsd hs hf 2 (by norm_num) (-1) (0, 1) (0, 1) 1 3 hrun
        ![-η, b / -η, g / -η] (by simp; linarith) (by rw [CP_r0, hDr]; simp; linarith)
        (by
          simp only [Matrix.cons_val_one, Matrix.head_cons]
          push_cast
          exact ⟨div_nonneg hb0 hpos.le, (div_le_one hpos).2 (by linarith)⟩)
        (by
          simp only [Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons]
          push_cast
          exact ⟨div_nonneg (by linarith) hpos.le, (div_le_one hpos).2 h1.le⟩)
        (by rw [hx]; exact hlamx)
      rwa [hx] at this

/-! ## The local statement `hloc` and the lower bound -/

/-- **The local region of `cubinoct_n02`** (the hypothesis `hloc` of `cubinoct_lower_of_local`). -/
theorem cubinoct_hloc : ∀ b γ τ : ℝ, inD b γ τ → inL b γ τ → ∀ (t : E3) (S : ℝ),
    cubeLP (Rmat b γ τ) t S → 1 + √2 / 2 ≤ S := by
  intro b γ τ hD hL t S hlp
  obtain ⟨hb0, hbg, _, _, _⟩ := hD
  obtain ⟨_, hg1, hτl, hτh⟩ := hL
  have hsl : (1.4142 : ℝ) < √2 := by rw [Real.lt_sqrt] <;> norm_num
  have hsu : √2 < 1.4143 := by rw [Real.sqrt_lt'] <;> norm_num
  have hη : |τ - (√2 - 1)| < 1 / 16 := by rw [abs_lt]; constructor <;> linarith
  obtain ⟨c, hc, hkey⟩ := key_at b γ (τ - (√2 - 1)) hb0 hbg hg1 hη
  set x : Fin 3 → ℝ := ![b, γ, τ - (√2 - 1)] with hxdef
  have hx0 : x 0 = b := rfl
  have hx1 : x 1 = γ := rfl
  have htv : tv x = τ := by
    simp only [tv, hxdef, Matrix.cons_val_two, Matrix.tail_cons, Matrix.head_cons]
    ring
  have hs : CP.sst.length = 2 := by rw [CP_sst]; rfl
  set N : ℝ := 1 + τ ^ 2 + (-b + γ * τ) ^ 2 + (γ + b * τ) ^ 2 with hNdef
  have hN : 0 < N := by positivity
  have hR : ∀ i j : Fin 3, Rmat b γ τ i j = rqv x (3 * i.val + j.val) / N := by
    intro i j
    simp only [Rmat, rqv, htv, hx0, hx1, hNdef]
  -- the key inequality, evaluated
  rw [ev_base x CP hs, ev_N, ev_r2, ev_m, CP_sst, fv2_two, CP_sstd, itemsL_eq] at hkey
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, tTerm, CP_sstd] at hkey
  simp (disch := norm_num) only [ev_lam, ev_item] at hkey
  rw [htv, hx0, hx1] at hkey
  have hmain := lp_core N (1 + b ^ 2 + γ ^ 2) (1 - b ^ 2 - γ ^ 2) 2 (2 + 1 * √2) S (t 0) (t 1) (t 2)
    (fun k => lamV c k b γ) (fun k i => (s4 k i : ℝ)) (rqv x) hN (by nlinarith) (by positivity)
    (by norm_num)
    (fun k hk => lamV_nonneg c hc k hk hb0 (by linarith) (by linarith) hg1)
    (by
      intro k hk
      have := hlp.1 (sg4 k)
      simp only [gSup, Fin.sum_univ_three, sv_sg4 k hk, hR, Fin.val_zero, Fin.val_one, Fin.val_two,
        mul_zero, mul_one, zero_add, add_zero, Nat.reduceMul, Nat.reduceAdd] at this
      exact this)
    (by
      have := hlp.2
      simp only [hR, Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two, mul_zero, mul_one,
        zero_add, add_zero, Nat.reduceMul, Nat.reduceAdd] at this
      exact this)
    (by simp only [lamV, s4, sig4, nth, List.getD_cons_zero, List.getD_cons_succ]; push_cast; ring)
    (by
      simp only [lamV, s4, sig4, nth, List.getD_cons_zero, List.getD_cons_succ, rqv, rqList, htv,
        hx0, hx1, hNdef]
      push_cast; ring)
    (by
      simp only [lamV, s4, sig4, nth, List.getD_cons_zero, List.getD_cons_succ, rqv, rqList, htv,
        hx0, hx1, hNdef]
      push_cast; ring)
    (by
      simp only [lamV, s4, sig4, nth, List.getD_cons_zero, List.getD_cons_succ, rqv, rqList, htv,
        hx0, hx1, hNdef]
      push_cast; ring)
    (by
      convert hkey using 1
      simp only [Nat.reduceAdd]
      push_cast
      ring)
  linarith

#print axioms cubinoct_hloc

/-- **Lower bound of `cubinoct_n02`.** If two cubes of edge 1 fit (rotations and translations) in the
regular octahedron of edge `s ≥ 0`, then `s ≥ 1 + √2`. -/
theorem cubinoct_lower {s : ℝ} (hs : 0 ≤ s) (h : Fits cube oct 2 s) : 1 + √2 ≤ s :=
  PackLean.Formal.Dom.cubinoct_lower_of_local cubinoct_hloc hs h

#print axioms cubinoct_lower

end PackLean.Formal.Loc
