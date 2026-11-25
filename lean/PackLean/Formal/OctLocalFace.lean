import PackLean.Formal.OctLocalForm

/-!
# A9 stage 7d-3 (part 3): the faces of the local regions

Design: `plan/A9f_tet_design.md` §9.  On a face `(fi, fv)` of the local region the variables `ζ`
(J: `h, p₁, p₂`; C: `h, k′, p₁, p₂`) are `ζ = ρ · r · ζ̂` with `ρ = sn/sd` (`scaleOf`), `r ∈ [0, 1]`
and `ζ̂_fi = fv`; the box variables are `y = (r, ζ̂ without fi, base)` (J: base `k′, u`; C: `u`),
and `xface kd fi fv ρ y` is the point `(h, k′, u, p₁, p₂)`.

* `faceTrans_val`: for the part `D` of degree `≥ 1` in `ζ`,
  `D(xface y) = r · sd^(−Z) · faceTrans(D)(y)` (`Z` the largest degree in `ζ`);
* `face_J`, `face_C`: every point of the region lies on one of the faces of `faceList`
  (the face is where `max_i |ζ_i| / ρ` is attained; at `ζ = 0` any face does).
-/

namespace PackLean.Formal.OctLocalFace

open PackLean.D31 (Mono Poly psum nth Kind zetaIdx baseIdx zdeg faceTrans faceList RatI zlo)
open PackLean.Formal.OctLocalPoly

noncomputable section

/-! ## 1. The point of a face -/

/-- The point `(h, k′, u, p₁, p₂)` of the box point `y` on the face `(fi, fv)` (scale `ρ`). -/
def xface (kd : Kind) (fi : ℕ) (fv ρ : ℝ) (y : Fin 5 → ℝ) : Fin 5 → ℝ :=
  match kd, fi with
  | .J, 0 => ![ρ * y 0 * fv, y 3, y 4, ρ * y 0 * y 1, ρ * y 0 * y 2]
  | .J, 1 => ![ρ * y 0 * y 1, y 3, y 4, ρ * y 0 * fv, ρ * y 0 * y 2]
  | .J, _ => ![ρ * y 0 * y 1, y 3, y 4, ρ * y 0 * y 2, ρ * y 0 * fv]
  | .C, 0 => ![ρ * y 0 * fv, ρ * y 0 * y 1, y 4, ρ * y 0 * y 2, ρ * y 0 * y 3]
  | .C, 1 => ![ρ * y 0 * y 1, ρ * y 0 * fv, y 4, ρ * y 0 * y 2, ρ * y 0 * y 3]
  | .C, 2 => ![ρ * y 0 * y 1, ρ * y 0 * y 2, y 4, ρ * y 0 * fv, ρ * y 0 * y 3]
  | .C, _ => ![ρ * y 0 * y 1, ρ * y 0 * y 2, y 4, ρ * y 0 * y 3, ρ * y 0 * fv]

/-! ## 2. `faceTrans` -/

/-- The largest degree in `ζ` (the `Z` of `faceTrans`). -/
def zmax (kd : Kind) (D : Poly) : ℕ := D.foldl (fun acc x => max acc (zdeg kd x.1)) 0

/-- One term of `faceTrans` (the body of its `map`). -/
def ftm (kd : Kind) (sc : RatI) (fi : ℕ) (fv : ℤ) (Z : ℕ) (x : Mono × ℤ) : Poly :=
  let zs := zetaIdx kd
  let m := x.1
  let z := zdeg kd m
  let ef := nth m (nth zs fi 0) 0
  let others := (List.range zs.length).filterMap (fun jj =>
    if jj == fi then none else some (nth m (nth zs jj 0) 0))
  let bases := (baseIdx kd).map (fun b => nth m b 0)
  [((z - 1) :: others ++ bases, x.2 * sc.1 ^ z * (sc.2 : Int) ^ (Z - z) * fv ^ ef)]

theorem faceTrans_eq (kd : Kind) (sc : RatI) (fi : ℕ) (fv : ℤ) (D : Poly) :
    faceTrans kd sc fi fv D = psum (D.map (ftm kd sc fi fv (zmax kd D))) := rfl

theorem zmax_ge (kd : Kind) : ∀ (D : Poly) (acc : ℕ),
    acc ≤ D.foldl (fun acc x => max acc (zdeg kd x.1)) acc ∧
    ∀ e ∈ D, zdeg kd e.1 ≤ D.foldl (fun acc x => max acc (zdeg kd x.1)) acc
  | [], acc => by simp
  | e :: D, acc => by
    obtain ⟨h1, h2⟩ := zmax_ge kd D (max acc (zdeg kd e.1))
    simp only [List.foldl_cons, List.mem_cons, forall_eq_or_imp]
    exact ⟨le_trans (le_max_left _ _) h1, le_trans (le_max_right _ _) h1, h2⟩

/-- `(ρ r)^z = r · sd^(−Z) · (sn^z sd^(Z−z) r^(z−1))` for `1 ≤ z ≤ Z`. -/
theorem key_pow (sn sd r : ℝ) (hsd : sd ≠ 0) (z Z : ℕ) (h1 : 1 ≤ z) (h2 : z ≤ Z) :
    (sn / sd * r) ^ z = r * (sd ^ Z)⁻¹ * (sn ^ z * sd ^ (Z - z) * r ^ (z - 1)) := by
  obtain ⟨z', rfl⟩ : ∃ z', z = z' + 1 := ⟨z - 1, by omega⟩
  obtain ⟨w, rfl⟩ : ∃ w, Z = z' + 1 + w := ⟨Z - (z' + 1), by omega⟩
  have hsw : sd ^ w * (sd⁻¹) ^ w = 1 := by rw [← mul_pow, mul_inv_cancel₀ hsd, one_pow]
  simp only [Nat.add_sub_cancel, Nat.add_sub_cancel_left, ← inv_pow, div_eq_mul_inv]
  linear_combination (-(sn ^ (z' + 1) * sd⁻¹ ^ (z' + 1) * r ^ (z' + 1))) * hsw

theorem range3 : List.range 3 = [0, 1, 2] := rfl
theorem range4 : List.range 4 = [0, 1, 2, 3] := rfl

theorem ftm_J0 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .J sc 0 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + d + e) - 1) :: [d, e, b, cc], c * sc.1 ^ (0 + a + d + e) * (sc.2 : Int) ^ (Z - (0 + a + d + e)) * fv ^ a)] := rfl

theorem ftm_J1 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .J sc 1 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + d + e) - 1) :: [a, e, b, cc], c * sc.1 ^ (0 + a + d + e) * (sc.2 : Int) ^ (Z - (0 + a + d + e)) * fv ^ d)] := rfl

theorem ftm_J2 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .J sc 2 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + d + e) - 1) :: [a, d, b, cc], c * sc.1 ^ (0 + a + d + e) * (sc.2 : Int) ^ (Z - (0 + a + d + e)) * fv ^ e)] := rfl

theorem ftm_C0 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .C sc 0 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + b + d + e) - 1) :: [b, d, e, cc], c * sc.1 ^ (0 + a + b + d + e) * (sc.2 : Int) ^ (Z - (0 + a + b + d + e)) * fv ^ a)] := rfl

theorem ftm_C1 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .C sc 1 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + b + d + e) - 1) :: [a, d, e, cc], c * sc.1 ^ (0 + a + b + d + e) * (sc.2 : Int) ^ (Z - (0 + a + b + d + e)) * fv ^ b)] := rfl

theorem ftm_C2 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .C sc 2 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + b + d + e) - 1) :: [a, b, e, cc], c * sc.1 ^ (0 + a + b + d + e) * (sc.2 : Int) ^ (Z - (0 + a + b + d + e)) * fv ^ d)] := rfl

theorem ftm_C3 (sc : RatI) (fv : ℤ) (Z a b cc d e : ℕ) (c : ℤ) :
    ftm .C sc 3 fv Z ([a, b, cc, d, e], c)
      = [(((0 + a + b + d + e) - 1) :: [a, b, d, cc], c * sc.1 ^ (0 + a + b + d + e) * (sc.2 : Int) ^ (Z - (0 + a + b + d + e)) * fv ^ e)] := rfl

/-- **One term on a face.** -/
theorem ftm_val (kd : Kind) (fi : ℕ) (hfi : fi < (zetaIdx kd).length) (sc : RatI) (hsd : 0 < sc.2)
    (fv : ℤ) (Z : ℕ) (m : Mono) (c : ℤ) (hm : m.length = 5) (h1 : 1 ≤ zdeg kd m)
    (h2 : zdeg kd m ≤ Z) (y : Fin 5 → ℝ) :
    WF (ftm kd sc fi fv Z (m, c)) ∧
    (c : ℝ) * m5 m (xface kd fi fv ((sc.1 : ℝ) / (sc.2 : ℝ)) y)
      = y 0 * (((sc.2 : ℝ)) ^ Z)⁻¹ * pv (ftm kd sc fi fv Z (m, c)) y := by
  obtain ⟨a, b, cc, d, e, rfl⟩ := len5 hm
  have hsd' : ((sc.2 : ℕ) : ℝ) ≠ 0 := by exact_mod_cast hsd.ne'
  have K := key_pow (sc.1 : ℝ) (sc.2 : ℝ) (y 0) hsd' _ Z h1 h2
  have hwf : ∀ (l : Mono) (q : ℤ), l.length = 5 → WF [(l, q)] := by
    intro l q hl x hx; simp only [List.mem_singleton] at hx; rw [hx]; exact hl
  cases kd with
  | J =>
    have hzd : zdeg .J [a, b, cc, d, e] = 0 + a + d + e := rfl
    rw [hzd] at K
    replace hfi : fi < 3 := hfi
    interval_cases fi
    · rw [ftm_J0]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ a * y 1 ^ d * y 2 ^ e * y 3 ^ b * y 4 ^ cc) * K
    · rw [ftm_J1]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ d * y 1 ^ a * y 2 ^ e * y 3 ^ b * y 4 ^ cc) * K
    · rw [ftm_J2]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ e * y 1 ^ a * y 2 ^ d * y 3 ^ b * y 4 ^ cc) * K
  | C =>
    have hzd : zdeg .C [a, b, cc, d, e] = 0 + a + b + d + e := rfl
    rw [hzd] at K
    replace hfi : fi < 4 := hfi
    interval_cases fi
    · rw [ftm_C0]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ a * y 1 ^ b * y 2 ^ d * y 3 ^ e * y 4 ^ cc) * K
    · rw [ftm_C1]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ b * y 1 ^ a * y 2 ^ d * y 3 ^ e * y 4 ^ cc) * K
    · rw [ftm_C2]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ d * y 1 ^ a * y 2 ^ b * y 3 ^ e * y 4 ^ cc) * K
    · rw [ftm_C3]
      refine ⟨hwf _ _ rfl, ?_⟩
      simp only [pv_cons, pv_nil, add_zero, m5_five, xface, Matrix.cons_val_zero,
        Matrix.cons_val_one, Matrix.cons_val_two, Matrix.cons_val_three, Matrix.cons_val_four,
        Matrix.head_cons, Matrix.tail_cons]
      push_cast
      linear_combination ((c : ℝ) * (fv : ℝ) ^ e * y 1 ^ a * y 2 ^ b * y 3 ^ d * y 4 ^ cc) * K

/-- **`faceTrans`**: `D(xface y) = r · sd^(−Z) · faceTrans(D)(y)` for the part `D` of degree `≥ 1`. -/
theorem faceTrans_val (kd : Kind) (fi : ℕ) (hfi : fi < (zetaIdx kd).length) (sc : RatI)
    (hsd : 0 < sc.2) (fv : ℤ) (D : Poly) (hD : WF D) (hz : ∀ e ∈ D, zdeg kd e.1 ≠ 0)
    (y : Fin 5 → ℝ) :
    WF (faceTrans kd sc fi fv D) ∧
    pv D (xface kd fi fv ((sc.1 : ℝ) / (sc.2 : ℝ)) y)
      = y 0 * (((sc.2 : ℝ)) ^ zmax kd D)⁻¹ * pv (faceTrans kd sc fi fv D) y := by
  have hle := (zmax_ge kd D 0).2
  have ht : ∀ e ∈ D, WF (ftm kd sc fi fv (zmax kd D) e) ∧
      (e.2 : ℝ) * m5 e.1 (xface kd fi fv ((sc.1 : ℝ) / (sc.2 : ℝ)) y)
        = y 0 * (((sc.2 : ℝ)) ^ zmax kd D)⁻¹ * pv (ftm kd sc fi fv (zmax kd D) e) y :=
    fun e he => ftm_val kd fi hfi sc hsd fv _ e.1 e.2 (hD e he)
      (Nat.one_le_iff_ne_zero.2 (hz e he)) (hle e he) y
  rw [faceTrans_eq]
  refine ⟨psum_WF (fun p hp => ?_), ?_⟩
  · obtain ⟨e, he, rfl⟩ := List.mem_map.1 hp
    exact (ht e he).1
  · rw [pv_psum, List.map_map]
    generalize zmax kd D = Z at ht
    clear hle hz hD
    induction D with
    | nil => simp
    | cons e D ih =>
      simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons]
      rw [(ht e (by simp)).2, ih (fun e' he' => ht e' (List.mem_cons_of_mem _ he'))]
      ring

/-! ## 3. Every point lies on a face -/

/-- The faces of J by number (`faceList .J`). -/
def fJ : ℕ → ℕ × ℤ
  | 0 => (0, 1) | 1 => (1, 1) | 2 => (1, -1) | 3 => (2, 1) | _ => (2, -1)

/-- The faces of C by number (`faceList .C`). -/
def fC : ℕ → ℕ × ℤ
  | 0 => (0, 1) | 1 => (1, 1) | 2 => (2, 1) | 3 => (2, -1) | 4 => (3, 1) | _ => (3, -1)

theorem faceList_J : faceList .J = [(0, 1), (1, 1), (1, -1), (2, 1), (2, -1)] := by decide
theorem faceList_C : faceList .C = [(0, 1), (1, 1), (2, 1), (2, -1), (3, 1), (3, -1)] := by decide

theorem abs_div_le {p M : ℝ} (hM : 0 < M) (h : |p| ≤ M) : -1 ≤ p / M ∧ p / M ≤ 1 := by
  rw [div_le_one hM, le_div_iff₀ hM]
  constructor <;> linarith [abs_le.1 h]

theorem nn_div_le {p M : ℝ} (hM : 0 < M) (h0 : 0 ≤ p) (h : p ≤ M) : 0 ≤ p / M ∧ p / M ≤ 1 :=
  ⟨div_nonneg h0 hM.le, (div_le_one hM).2 h⟩

/-- **The faces of J**: `h ∈ [0, ρ]`, `|p₁|, |p₂| ≤ ρ` lie on a face of `faceList .J`. -/
theorem face_J {ρ h p1 p2 : ℝ} (hρ : 0 < ρ) (hh0 : 0 ≤ h) (hh1 : h ≤ ρ) (hp1 : |p1| ≤ ρ)
    (hp2 : |p2| ≤ ρ) :
    ∃ fidx < 5, ∃ r t1 t2 : ℝ, 0 ≤ r ∧ r ≤ 1 ∧ (if fidx = 0 then -1 else 0) ≤ t1 ∧ t1 ≤ 1 ∧
      -1 ≤ t2 ∧ t2 ≤ 1 ∧
      ∀ k u : ℝ, xface .J (fJ fidx).1 (fJ fidx).2 ρ ![r, t1, t2, k, u] = ![h, k, u, p1, p2] := by
  set M := max h (max |p1| |p2|) with hM
  have hhM : h ≤ M := le_max_left _ _
  have h1M : |p1| ≤ M := le_trans (le_max_left _ _) (le_max_right _ _)
  have h2M : |p2| ≤ M := le_trans (le_max_right _ _) (le_max_right _ _)
  have hMρ : M ≤ ρ := max_le hh1 (max_le hp1 hp2)
  have hρ' := hρ.ne'
  rcases (le_trans hh0 hhM).eq_or_lt with h0 | hpos
  · -- ζ = 0
    have eh : h = 0 := by linarith
    have e1 : p1 = 0 := abs_nonpos_iff.1 (by linarith)
    have e2 : p2 = 0 := abs_nonpos_iff.1 (by linarith)
    refine ⟨0, by norm_num, 0, 0, 0, le_rfl, by norm_num, by norm_num, by norm_num, by norm_num,
      by norm_num, fun k u => ?_⟩
    ext i; fin_cases i <;> simp [xface, fJ, eh, e1, e2]
  · have hr : 0 ≤ M / ρ ∧ M / ρ ≤ 1 := nn_div_le hρ hpos.le hMρ
    have hrM : ρ * (M / ρ) = M := by field_simp
    have hMne := hpos.ne'
    rcases max_choice h (max |p1| |p2|) with hm | hm <;> rw [← hM] at hm
    · -- face (0, 1)
      obtain ⟨a1, a2⟩ := abs_div_le hpos h1M
      obtain ⟨b1, b2⟩ := abs_div_le hpos h2M
      refine ⟨0, by norm_num, M / ρ, p1 / M, p2 / M, hr.1, hr.2, by simpa using a1, a2, b1, b2,
        fun k u => ?_⟩
      ext i; fin_cases i <;> simp [xface, fJ] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
    rcases max_choice |p1| |p2| with hm' | hm' <;> rw [hm'] at hm
    · obtain ⟨a1, a2⟩ := nn_div_le hpos hh0 hhM
      obtain ⟨b1, b2⟩ := abs_div_le hpos h2M
      rcases le_total 0 p1 with hs | hs
      · refine ⟨1, by norm_num, M / ρ, h / M, p2 / M, hr.1, hr.2, by simpa using a1, a2, b1, b2,
          fun k u => ?_⟩
        rw [abs_of_nonneg hs] at hm
        ext i; fin_cases i <;> simp [xface, fJ] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
      · refine ⟨2, by norm_num, M / ρ, h / M, p2 / M, hr.1, hr.2, by simpa using a1, a2, b1, b2,
          fun k u => ?_⟩
        rw [abs_of_nonpos hs] at hm
        ext i; fin_cases i <;> simp [xface, fJ] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
    · obtain ⟨a1, a2⟩ := nn_div_le hpos hh0 hhM
      obtain ⟨b1, b2⟩ := abs_div_le hpos h1M
      rcases le_total 0 p2 with hs | hs
      · refine ⟨3, by norm_num, M / ρ, h / M, p1 / M, hr.1, hr.2, by simpa using a1, a2, b1, b2,
          fun k u => ?_⟩
        rw [abs_of_nonneg hs] at hm
        ext i; fin_cases i <;> simp [xface, fJ] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
      · refine ⟨4, by norm_num, M / ρ, h / M, p1 / M, hr.1, hr.2, by simpa using a1, a2, b1, b2,
          fun k u => ?_⟩
        rw [abs_of_nonpos hs] at hm
        ext i; fin_cases i <;> simp [xface, fJ] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)

/-- **The faces of C**: `h, k′ ∈ [0, ρ]`, `|p₁|, |p₂| ≤ ρ` lie on a face of `faceList .C`. -/
theorem face_C {ρ h k p1 p2 : ℝ} (hρ : 0 < ρ) (hh0 : 0 ≤ h) (hh1 : h ≤ ρ) (hk0 : 0 ≤ k)
    (hk1 : k ≤ ρ) (hp1 : |p1| ≤ ρ) (hp2 : |p2| ≤ ρ) :
    ∃ fidx < 6, ∃ r t1 t2 t3 : ℝ, 0 ≤ r ∧ r ≤ 1 ∧ 0 ≤ t1 ∧ t1 ≤ 1 ∧
      (if fidx ≤ 1 then -1 else 0) ≤ t2 ∧ t2 ≤ 1 ∧ -1 ≤ t3 ∧ t3 ≤ 1 ∧
      ∀ u : ℝ, xface .C (fC fidx).1 (fC fidx).2 ρ ![r, t1, t2, t3, u] = ![h, k, u, p1, p2] := by
  set M := max (max h k) (max |p1| |p2|) with hM
  have hhM : h ≤ M := le_trans (le_max_left _ _) (le_max_left _ _)
  have hkM : k ≤ M := le_trans (le_max_right _ _) (le_max_left _ _)
  have h1M : |p1| ≤ M := le_trans (le_max_left _ _) (le_max_right _ _)
  have h2M : |p2| ≤ M := le_trans (le_max_right _ _) (le_max_right _ _)
  have hMρ : M ≤ ρ := max_le (max_le hh1 hk1) (max_le hp1 hp2)
  have hρ' := hρ.ne'
  rcases (le_trans hh0 hhM).eq_or_lt with h0 | hpos
  · have eh : h = 0 := by linarith
    have ek : k = 0 := by linarith
    have e1 : p1 = 0 := abs_nonpos_iff.1 (by linarith)
    have e2 : p2 = 0 := abs_nonpos_iff.1 (by linarith)
    refine ⟨0, by norm_num, 0, 0, 0, 0, le_rfl, by norm_num, le_rfl, by norm_num, by norm_num,
      by norm_num, by norm_num, by norm_num, fun u => ?_⟩
    ext i; fin_cases i <;> simp [xface, fC, eh, ek, e1, e2]
  · have hr : 0 ≤ M / ρ ∧ M / ρ ≤ 1 := nn_div_le hρ hpos.le hMρ
    have hrM : ρ * (M / ρ) = M := by field_simp
    have hMne := hpos.ne'
    obtain ⟨ah1, ah2⟩ := nn_div_le hpos hh0 hhM
    obtain ⟨ak1, ak2⟩ := nn_div_le hpos hk0 hkM
    obtain ⟨a11, a12⟩ := abs_div_le hpos h1M
    obtain ⟨a21, a22⟩ := abs_div_le hpos h2M
    rcases max_choice (max h k) (max |p1| |p2|) with hm | hm <;> rw [← hM] at hm
    · rcases max_choice h k with hm' | hm' <;> rw [hm'] at hm
      · refine ⟨0, by norm_num, M / ρ, k / M, p1 / M, p2 / M, hr.1, hr.2, ak1, ak2,
          by simpa using a11, a12, a21, a22, fun u => ?_⟩
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
      · refine ⟨1, by norm_num, M / ρ, h / M, p1 / M, p2 / M, hr.1, hr.2, ah1, ah2,
          by simpa using a11, a12, a21, a22, fun u => ?_⟩
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
    rcases max_choice |p1| |p2| with hm' | hm' <;> rw [hm'] at hm
    · rcases le_total 0 p1 with hs | hs
      · refine ⟨2, by norm_num, M / ρ, h / M, k / M, p2 / M, hr.1, hr.2, ah1, ah2,
          by simpa using ak1, ak2, a21, a22, fun u => ?_⟩
        rw [abs_of_nonneg hs] at hm
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
      · refine ⟨3, by norm_num, M / ρ, h / M, k / M, p2 / M, hr.1, hr.2, ah1, ah2,
          by simpa using ak1, ak2, a21, a22, fun u => ?_⟩
        rw [abs_of_nonpos hs] at hm
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
    · rcases le_total 0 p2 with hs | hs
      · refine ⟨4, by norm_num, M / ρ, h / M, k / M, p1 / M, hr.1, hr.2, ah1, ah2,
          by simpa using ak1, ak2, a11, a12, fun u => ?_⟩
        rw [abs_of_nonneg hs] at hm
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)
      · refine ⟨5, by norm_num, M / ρ, h / M, k / M, p1 / M, hr.1, hr.2, ah1, ah2,
          by simpa using ak1, ak2, a11, a12, fun u => ?_⟩
        rw [abs_of_nonpos hs] at hm
        ext i; fin_cases i <;> simp [xface, fC] <;> (try rw [hrM]) <;> (try field_simp) <;> (try linarith)

end

end PackLean.Formal.OctLocalFace
