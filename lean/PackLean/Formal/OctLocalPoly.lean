import PackLean.Formal.OctCover

/-!
# A9 stage 7d-3 (part 1): the integer polynomials of `D31.Core` in five variables

Design: `plan/A9f_tet_design.md` §9.  The local check of `D31.Core` works with sparse polynomials
with **integer** coefficients in five variables (`D31.Poly`); the definitions (`padd` drops zero
coefficients, `shiftLb` returns an integer, not an `Option`) differ from those of `D28.Core`, so
`PolySem5` is not used.  This file gives their meaning:

* `pv p x` (value at `x : Fin 5 → ℝ`); `padd`, `psmul`, `psub`, `psum` are correct for every list
  (no invariant); `pmul`, `pmulAff` are correct for monomials of length 5 (`WF`);
* `pv_filter`: the split `F = T + D` by a predicate on the monomials;
* `tShape_J`, `tShape_C`: the meaning of `D31.tShape` (`T = k′u(e₀ + e₁u)` and `T = 0`);
* `shiftLb_pos`: `shiftLb du H lo hi > 0` gives `H(y) > 0` at every `y` with `lo ≤ du · y ≤ hi`.
-/

namespace PackLean.Formal.OctLocalPoly

open PackLean.D31 (Mono Poly padd paddF psmul psub psum pconst pvar pmul pmulAff incAt zeroMono
  monoLt mdeg shiftLb nth iabs Kind tShape)

noncomputable section

/-! ## 1. Values -/

/-- The value of a monomial (the first 5 exponents) at `x`. -/
def m5 (m : Mono) (x : Fin 5 → ℝ) : ℝ := ∏ i : Fin 5, x i ^ (m.getD i 0)

/-- The value of a polynomial at `x`. -/
def pv (p : Poly) (x : Fin 5 → ℝ) : ℝ := (p.map fun e => (e.2 : ℝ) * m5 e.1 x).sum

/-- Monomials of length 5. -/
def WF (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 5

theorem len5 {α : Type*} {m : List α} (h : m.length = 5) : ∃ a b c d e, m = [a, b, c, d, e] := by
  match m, h with
  | [a, b, c, d, e], _ => exact ⟨a, b, c, d, e, rfl⟩

theorem m5_five (a b c d e : ℕ) (x : Fin 5 → ℝ) :
    m5 [a, b, c, d, e] x = x 0 ^ a * x 1 ^ b * x 2 ^ c * x 3 ^ d * x 4 ^ e := by
  simp [m5, Fin.prod_univ_five]

theorem m5_zipWith {m n : Mono} (hm : m.length = 5) (hn : n.length = 5) (x : Fin 5 → ℝ) :
    m5 (List.zipWith (· + ·) m n) x = m5 m x * m5 n x := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  obtain ⟨a', b', c', d', e', rfl⟩ := len5 hn
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, m5_five]
  ring

theorem m5_zero (x : Fin 5 → ℝ) : m5 zeroMono x = 1 := by
  simp [zeroMono, m5_five]

variable (x : Fin 5 → ℝ)

@[simp] theorem pv_nil : pv [] x = 0 := rfl

@[simp] theorem pv_cons (e : Mono × ℤ) (p : Poly) : pv (e :: p) x = e.2 * m5 e.1 x + pv p x := by
  simp [pv]

theorem pv_append (p q : Poly) : pv (p ++ q) x = pv p x + pv q x := by
  simp [pv]

/-! ## 2. Sums and scalings (no invariant) -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), pv (paddF f p q) x = pv p x + pv q x
  | 0, p, q => by simp [paddF, pv_append]
  | f + 1, [], q => by simp [paddF]
  | f + 1, (m, a) :: ps, [] => by simp [paddF]
  | f + 1, (m, a) :: ps, (n, b) :: qs => by
    simp only [paddF]
    by_cases h1 : (m == n) = true
    · have e1 : m = n := by simpa using h1
      subst e1
      rw [if_pos h1]
      by_cases h2 : (a + b == 0) = true
      · rw [if_pos h2, paddF_spec f]
        have e2 : ((a : ℤ) : ℝ) + b = 0 := by exact_mod_cast (by simpa using h2 : a + b = 0)
        simp only [pv_cons]
        linear_combination (-(m5 m x)) * e2
      · rw [if_neg h2, pv_cons, paddF_spec f]
        simp only [pv_cons]; push_cast; ring
    · rw [if_neg h1]
      by_cases h3 : monoLt m n = true
      · rw [if_pos h3, pv_cons, paddF_spec f]; simp only [pv_cons]; ring
      · rw [if_neg h3, pv_cons, paddF_spec f]; simp only [pv_cons]; ring

theorem pv_padd (p q : Poly) : pv (padd p q) x = pv p x + pv q x := paddF_spec x _ p q

theorem pv_map_smul (c : ℤ) (p : Poly) :
    pv (p.map (fun e => (e.1, c * e.2))) x = c * pv p x := by
  induction p with
  | nil => simp
  | cons e p ih => simp only [List.map_cons, pv_cons, ih]; push_cast; ring

theorem pv_psmul (c : ℤ) (p : Poly) : pv (psmul c p) x = c * pv p x := by
  unfold psmul
  split_ifs with h
  · have : c = 0 := by simpa using h
    simp [this]
  · exact pv_map_smul x c p

theorem pv_psub (p q : Poly) : pv (psub p q) x = pv p x - pv q x := by
  simp only [psub, pv_padd, pv_psmul]; push_cast; ring

theorem pv_foldl_padd (l : List Poly) : ∀ acc : Poly,
    pv (l.foldl padd acc) x = pv acc x + (l.map (fun p => pv p x)).sum := by
  induction l with
  | nil => intro acc; simp
  | cons p l ih => intro acc; simp only [List.foldl_cons, ih, pv_padd, List.map_cons, List.sum_cons]; ring

theorem pv_psum (l : List Poly) : pv (psum l) x = (l.map (fun p => pv p x)).sum := by
  simp [psum, pv_foldl_padd]

theorem pv_pconst (c : ℤ) : pv (pconst c) x = c := by
  unfold pconst
  split_ifs with h
  · have : c = 0 := by simpa using h
    simp [this]
  · simp [m5_zero]

theorem pv_pvar (i : ℕ) (hi : i < 5) : pv (pvar i) x = x ⟨i, hi⟩ := by
  interval_cases i <;> simp [pvar, incAt, zeroMono, m5_five]

/-! ## 3. The invariant and products -/

theorem paddF_WF : ∀ (f : ℕ) (p q : Poly), WF p → WF q → WF (paddF f p q)
  | 0, p, q, hp, hq => by
    intro e he; rcases List.mem_append.1 he with h | h
    · exact hp e h
    · exact hq e h
  | f + 1, [], q, _, hq => by simpa [paddF] using hq
  | f + 1, (m, a) :: ps, [], hp, _ => by simpa [paddF] using hp
  | f + 1, (m, a) :: ps, (n, b) :: qs, hp, hq => by
    have hm : m.length = 5 := hp (m, a) (by simp)
    have hn : n.length = 5 := hq (n, b) (by simp)
    have hps : WF ps := fun e he => hp e (List.mem_cons_of_mem _ he)
    have hqs : WF qs := fun e he => hq e (List.mem_cons_of_mem _ he)
    simp only [paddF]
    split_ifs
    · exact paddF_WF f ps qs hps hqs
    · intro e he; rcases List.mem_cons.1 he with rfl | he
      · exact hm
      · exact paddF_WF f ps qs hps hqs e he
    · intro e he; rcases List.mem_cons.1 he with rfl | he
      · exact hm
      · exact paddF_WF f ps _ hps hq e he
    · intro e he; rcases List.mem_cons.1 he with rfl | he
      · exact hn
      · exact paddF_WF f _ qs hp hqs e he

theorem padd_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (padd p q) := paddF_WF _ p q hp hq

theorem psmul_WF (c : ℤ) {p : Poly} (hp : WF p) : WF (psmul c p) := by
  unfold psmul
  split_ifs
  · intro e he; simp at he
  · intro e he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    exact hp e' he'

theorem psub_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (psub p q) :=
  padd_WF hp (psmul_WF _ hq)

theorem foldl_padd_WF (l : List Poly) (hl : ∀ p ∈ l, WF p) : ∀ acc : Poly, WF acc →
    WF (l.foldl padd acc) := by
  induction l with
  | nil => intro acc h; simpa using h
  | cons p l ih =>
    intro acc h
    exact ih (fun q hq => hl q (by simp [hq])) _ (padd_WF h (hl p (by simp)))

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WF p) : WF (psum l) :=
  foldl_padd_WF l hl [] (fun e he => by simp at he)

theorem pconst_WF (c : ℤ) : WF (pconst c) := by
  unfold pconst; split_ifs
  · intro e he; simp at he
  · intro e he; simp at he; rw [he]; rfl

theorem incAt_len {m : Mono} (hm : m.length = 5) (i : ℕ) : (incAt m i).length = 5 := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  rcases i with _ | _ | _ | _ | _ | i <;> simp [incAt]

theorem pvar_WF (i : ℕ) : WF (pvar i) := by
  intro e he; simp [pvar] at he; rw [he]; exact incAt_len rfl i

theorem inner_spec (m : Mono) (a : ℤ) (hm : m.length = 5) (q : Poly) (hq : WF q) :
    WF (psum (q.map (fun y => [(List.zipWith (· + ·) m y.1, a * y.2)]))) ∧
    pv (psum (q.map (fun y => [(List.zipWith (· + ·) m y.1, a * y.2)]))) x = a * m5 m x * pv q x := by
  constructor
  · apply psum_WF
    intro p hp
    obtain ⟨y, hy, rfl⟩ := List.mem_map.1 hp
    intro e he
    simp only [List.mem_singleton] at he
    rw [he]
    simp [List.length_zipWith, hm, hq y hy]
  · rw [pv_psum, List.map_map]
    induction q with
    | nil => simp
    | cons y q ih =>
      have hy : y.1.length = 5 := hq y (by simp)
      have hq' : WF q := fun e he => hq e (by simp [he])
      simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons, pv_nil, ih hq',
        m5_zipWith hm hy]
      push_cast; ring

theorem pmul_spec {p q : Poly} (hp : WF p) (hq : WF q) :
    WF (pmul p q) ∧ pv (pmul p q) x = pv p x * pv q x := by
  constructor
  · apply psum_WF
    intro r hr
    obtain ⟨e, he, rfl⟩ := List.mem_map.1 hr
    exact (inner_spec x e.1 e.2 (hp e he) q hq).1
  · unfold pmul
    rw [pv_psum, List.map_map]
    induction p with
    | nil => simp
    | cons e p ih =>
      have he : e.1.length = 5 := hp e (by simp)
      have hp' : WF p := fun e' he' => hp e' (List.mem_cons_of_mem _ he')
      simp only [List.map_cons, List.sum_cons, Function.comp, ih hp',
        (inner_spec x e.1 e.2 he q hq).2, pv_cons]
      ring

theorem pmul_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (pmul p q) := (pmul_spec 0 hp hq).1

theorem pv_pmul {p q : Poly} (hp : WF p) (hq : WF q) : pv (pmul p q) x = pv p x * pv q x :=
  (pmul_spec x hp hq).2

theorem m5_incAt {m : Mono} (hm : m.length = 5) (i : ℕ) (hi : i < 5) :
    m5 (incAt m i) x = x ⟨i, hi⟩ * m5 m x := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  interval_cases i <;> simp only [incAt, m5_five] <;> simp <;> ring

theorem mapInc_spec (i : ℕ) (hi : i < 5) : ∀ p : Poly, WF p →
    WF (p.map (fun e => (incAt e.1 i, e.2))) ∧
    pv (p.map (fun e => (incAt e.1 i, e.2))) x = x ⟨i, hi⟩ * pv p x := by
  intro p
  induction p with
  | nil => intro _; simp [WF]
  | cons e p ih =>
    intro hp
    have he : e.1.length = 5 := hp e (by simp)
    obtain ⟨h1, h2⟩ := ih (fun e' he' => hp e' (List.mem_cons_of_mem _ he'))
    refine ⟨?_, ?_⟩
    · intro e' he'
      rcases List.mem_cons.1 he' with rfl | he'
      · exact incAt_len he i
      · exact h1 e' he'
    · simp only [List.map_cons, pv_cons, h2, m5_incAt x he i hi]; ring

theorem pmulAff_spec {p : Poly} (hp : WF p) (c w : ℤ) (i : ℕ) (hi : i < 5) :
    WF (pmulAff p c w i) ∧ pv (pmulAff p c w i) x = (c + w * x ⟨i, hi⟩) * pv p x := by
  obtain ⟨h1, h2⟩ := mapInc_spec x i hi p hp
  refine ⟨padd_WF (psmul_WF _ hp) (psmul_WF _ h1), ?_⟩
  simp only [pmulAff, pv_padd, pv_psmul, h2]; ring

theorem pmulAff_pow (c w : ℤ) (i : ℕ) (hi : i < 5) : ∀ (n : ℕ) (p : Poly), WF p →
    WF ((List.range n).foldl (fun a _ => pmulAff a c w i) p) ∧
    pv ((List.range n).foldl (fun a _ => pmulAff a c w i) p) x = (c + w * x ⟨i, hi⟩) ^ n * pv p x := by
  intro n
  induction n with
  | zero => intro p hp; simp [hp]
  | succ n ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := pmulAff_spec x h1 c w i hi
    simp only [List.foldl_cons, List.foldl_nil]
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-! ## 4. Filters and `tShape` -/

theorem pv_filter (F : Poly) (P Q : Mono × ℤ → Bool) (hPQ : ∀ e, Q e = !P e) :
    pv F x = pv (F.filter P) x + pv (F.filter Q) x := by
  induction F with
  | nil => simp
  | cons e F ih =>
    rw [List.filter_cons, List.filter_cons, hPQ e]
    cases P e <;> simp [ih] <;> ring

theorem tShape_J_aux : ∀ (T : Poly) (acc : ℤ × ℤ),
    T.all (fun e => e.1 == [0, 1, 1, 0, 0] || e.1 == [0, 1, 2, 0, 0]) = true →
    let r := T.foldl (fun acc e => if e.1 == [0, 1, 1, 0, 0] then (acc.1 + e.2, acc.2)
      else (acc.1, acc.2 + e.2)) acc
    (r.1 : ℝ) * (x 1 * x 2) + r.2 * (x 1 * x 2 ^ 2)
      = acc.1 * (x 1 * x 2) + acc.2 * (x 1 * x 2 ^ 2) + pv T x
  | [], acc, _ => by simp
  | e :: T, acc, h => by
    simp only [List.all_cons, Bool.and_eq_true, Bool.or_eq_true, beq_iff_eq] at h
    obtain ⟨he, hT⟩ := h
    simp only [List.foldl_cons]
    rcases he with he | he
    · rw [if_pos (by simp [he])]
      rw [tShape_J_aux T _ hT]
      simp only [pv_cons, he, m5_five]; push_cast; ring
    · rw [if_neg (by simp [he])]
      rw [tShape_J_aux T _ hT]
      simp only [pv_cons, he, m5_five]; push_cast; ring

/-- **`tShape` on J**: `T = k′ u (e₀ + e₁ u)` (`k′ = x₁`, `u = x₂`). -/
theorem tShape_J {T : Poly} {e : ℤ × ℤ} (h : tShape .J T = some e) :
    pv T x = x 1 * x 2 * (e.1 + e.2 * x 2) := by
  simp only [tShape] at h
  split_ifs at h with hall
  · simp only [Option.some.injEq] at h
    have := tShape_J_aux x T (0, 0) hall
    rw [h] at this
    push_cast at this
    linear_combination -this

/-- **`tShape` on C**: `T = 0`. -/
theorem tShape_C {T : Poly} {e : ℤ × ℤ} (h : tShape .C T = some e) : pv T x = 0 := by
  simp only [tShape] at h
  split_ifs at h with hT
  · simp only [List.isEmpty_iff] at hT
    simp [hT]

/-! ## 5. The box test `shiftLb` -/

theorem getD_mem_or (m : Mono) (i : ℕ) : m.getD i 0 ∈ m ∨ m.getD i 0 = 0 := by
  rw [List.getD_eq_getElem?_getD]
  by_cases h : i < m.length
  · left; rw [List.getElem?_eq_getElem h]; exact List.getElem_mem h
  · right; rw [List.getElem?_eq_none (by omega)]; rfl

theorem m5_abs_le {m : Mono} {s : Fin 5 → ℝ} (hs : ∀ i, |s i| ≤ 1) : |m5 m s| ≤ 1 := by
  unfold m5
  rw [Finset.abs_prod]
  apply Finset.prod_le_one₀ (fun i _ => abs_nonneg _)
  intro i _
  rw [abs_pow]
  exact pow_le_one₀ (abs_nonneg _) (hs i)

theorem term_lb (m : Mono) (c : ℤ) {s : Fin 5 → ℝ} (hs : ∀ i, |s i| ≤ 1) :
    ((if m.all (· == 0) then c else if m.all (· % 2 == 0) then min 0 c else -iabs c : ℤ) : ℝ)
      ≤ c * m5 m s := by
  have hab := m5_abs_le (m := m) hs
  split_ifs with h0 h2
  · have : m5 m s = 1 := by
      unfold m5
      apply Finset.prod_eq_one
      intro i _
      rcases getD_mem_or m i with hm | hm
      · have := List.all_eq_true.1 h0 _ hm
        simp only [beq_iff_eq] at this
        rw [this, pow_zero]
      · rw [hm, pow_zero]
    rw [this]; simp
  · have hnn : 0 ≤ m5 m s := by
      unfold m5
      apply Finset.prod_nonneg
      intro i _
      rcases getD_mem_or m i with hm | hm
      · have := List.all_eq_true.1 h2 _ hm
        simp only [beq_iff_eq] at this
        exact Even.pow_nonneg (Nat.even_iff.2 this) _
      · rw [hm, pow_zero]; norm_num
    have hle : m5 m s ≤ 1 := (abs_le.1 hab).2
    push_cast
    rcases le_total 0 c with hc | hc
    · have hc' : (0 : ℝ) ≤ c := by exact_mod_cast hc
      rw [min_eq_left hc']; exact mul_nonneg hc' hnn
    · have hc' : (c : ℝ) ≤ 0 := by exact_mod_cast hc
      rw [min_eq_right hc']
      nlinarith
  · rw [Int.cast_neg, OctCover.iabs_real]
    have := abs_le.1 hab
    have h3 := neg_abs_le ((c : ℝ) * m5 m s)
    rw [abs_mul] at h3
    nlinarith [abs_nonneg (c : ℝ), abs_nonneg (m5 m s)]

theorem lbFold_le {s : Fin 5 → ℝ} (hs : ∀ i, |s i| ≤ 1) : ∀ (S : Poly) (acc : ℤ),
    ((S.foldl (fun acc e =>
      if e.1.all (· == 0) then acc + e.2
      else if e.1.all (· % 2 == 0) then acc + min 0 e.2
      else acc - iabs e.2) acc : ℤ) : ℝ) ≤ acc + pv S s
  | [], acc => by simp
  | e :: S, acc => by
    simp only [List.foldl_cons]
    have h1 := lbFold_le hs S
    have h2 := term_lb e.1 e.2 hs
    have key : (if e.1.all (· == 0) then acc + e.2
        else if e.1.all (· % 2 == 0) then acc + min 0 e.2 else acc - iabs e.2)
        = acc + (if e.1.all (· == 0) then e.2 else if e.1.all (· % 2 == 0) then min 0 e.2
          else -iabs e.2) := by
      split_ifs <;> ring
    rw [key]
    refine (h1 _).trans ?_
    simp only [pv_cons]; push_cast at h2 ⊢; linarith

theorem mdeg_five (a b c d e : ℕ) : mdeg [a, b, c, d, e] = a + b + c + d + e := by
  simp [mdeg]

theorem foldl_max_ge : ∀ (H : Poly) (acc : ℕ), acc ≤ H.foldl (fun acc x => max acc (mdeg x.1)) acc ∧
    ∀ e ∈ H, mdeg e.1 ≤ H.foldl (fun acc x => max acc (mdeg x.1)) acc
  | [], acc => by simp
  | e :: H, acc => by
    obtain ⟨h1, h2⟩ := foldl_max_ge H (max acc (mdeg e.1))
    simp only [List.foldl_cons, List.mem_cons, forall_eq_or_imp]
    exact ⟨le_trans (le_max_left _ _) h1, le_trans (le_max_right _ _) h1, h2⟩

theorem range5 : List.range 5 = [0, 1, 2, 3, 4] := rfl

/-- One term of `S` in `shiftLb`: `c · du^(Hd − deg) · ∏ (C_i + W_i s_i)^{m_i} = c · du^Hd · m(y)`. -/
theorem shift_term (C W : ℕ → ℤ) (du : ℤ) (hdu : (du : ℝ) ≠ 0) (Hd : ℕ) (m : Mono)
    (hm : m.length = 5) (hdeg : mdeg m ≤ Hd) (c : ℤ) (s : Fin 5 → ℝ) (y : Fin 5 → ℝ)
    (hy : ∀ i : Fin 5, (C i : ℝ) + W i * s i = du * y i) :
    WF ((List.range 5).foldl (fun acc i =>
      (List.range (nth m i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
      [(zeroMono, c * du ^ (Hd - mdeg m))]) ∧
    pv ((List.range 5).foldl (fun acc i =>
      (List.range (nth m i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
      [(zeroMono, c * du ^ (Hd - mdeg m))]) s = c * (du : ℝ) ^ Hd * m5 m y := by
  obtain ⟨a, b, cc, d, e, rfl⟩ := len5 hm
  have hb : WF [(zeroMono, c * du ^ (Hd - mdeg [a, b, cc, d, e]))] := by
    intro e he; simp at he; rw [he]; rfl
  rw [range5]
  simp only [List.foldl_cons, List.foldl_nil]
  obtain ⟨w0, v0⟩ := pmulAff_pow s (C 0) (W 0) 0 (by norm_num) (nth [a, b, cc, d, e] 0 0) _ hb
  obtain ⟨w1, v1⟩ := pmulAff_pow s (C 1) (W 1) 1 (by norm_num) (nth [a, b, cc, d, e] 1 0) _ w0
  obtain ⟨w2, v2⟩ := pmulAff_pow s (C 2) (W 2) 2 (by norm_num) (nth [a, b, cc, d, e] 2 0) _ w1
  obtain ⟨w3, v3⟩ := pmulAff_pow s (C 3) (W 3) 3 (by norm_num) (nth [a, b, cc, d, e] 3 0) _ w2
  obtain ⟨w4, v4⟩ := pmulAff_pow s (C 4) (W 4) 4 (by norm_num) (nth [a, b, cc, d, e] 4 0) _ w3
  refine ⟨w4, ?_⟩
  rw [v4, v3, v2, v1, v0]
  have e0 : (C 0 : ℝ) + W 0 * s 0 = du * y 0 := hy 0
  have e1 : (C 1 : ℝ) + W 1 * s 1 = du * y 1 := hy 1
  have e2 : (C 2 : ℝ) + W 2 * s 2 = du * y 2 := hy 2
  have e3 : (C 3 : ℝ) + W 3 * s 3 = du * y 3 := hy 3
  have e4 : (C 4 : ℝ) + W 4 * s 4 = du * y 4 := hy 4
  simp only [Fin.zero_eta, Fin.mk_one, Fin.reduceFinMk, pv_cons, pv_nil,
    m5_zero, m5_five, nth, List.getD_cons_zero, List.getD_cons_succ]
  rw [e0, e1, e2, e3, e4]
  rw [mdeg_five] at hdeg ⊢
  obtain ⟨t, ht⟩ := Nat.exists_eq_add_of_le hdeg
  rw [ht, Nat.add_sub_cancel_left]
  push_cast
  simp only [mul_pow, pow_add]
  ring

theorem nth_zipWith (f : ℤ → ℤ → ℤ) {l1 l2 : List ℤ} (h1 : l1.length = 5) (h2 : l2.length = 5)
    (i : Fin 5) : nth (List.zipWith f l1 l2) i 0 = f (nth l1 i 0) (nth l2 i 0) := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 h1
  obtain ⟨a', b', c', d', e', rfl⟩ := len5 h2
  fin_cases i <;> rfl

theorem ax_param (l h : ℤ) (zk : ℝ) (hlh : l < h) (he : (h - l) % 2 = 0) (hl : (l : ℝ) ≤ zk)
    (hh : zk ≤ h) :
    ∃ sk : ℝ, |sk| ≤ 1 ∧ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * sk = zk := by
  have hc : (((l + h) / 2 : ℤ) : ℝ) = (l + h) / 2 := by
    have : (l + h) % 2 = 0 := by omega
    rw [Int.cast_div (Int.dvd_of_emod_eq_zero this) (by norm_num)]; push_cast; ring
  have hw : (((h - l) / 2 : ℤ) : ℝ) = (h - l) / 2 := by
    rw [Int.cast_div (Int.dvd_of_emod_eq_zero he) (by norm_num)]; push_cast; ring
  have hpos : (0 : ℝ) < (h - l) / 2 := by
    have : (l : ℝ) < h := by exact_mod_cast hlh
    linarith
  refine ⟨(zk - (l + h) / 2) / ((h - l) / 2), ?_, ?_⟩
  · rw [abs_div, abs_of_pos hpos, div_le_one hpos, abs_le]; constructor <;> linarith
  · have hne : (h : ℝ) - l ≠ 0 := by linarith
    rw [hc, hw]; field_simp; ring

theorem sum_terms (g : Mono × ℤ → Poly) (K : ℝ) (s y : Fin 5 → ℝ) :
    ∀ (L : Poly), (∀ e ∈ L, pv (g e) s = e.2 * K * m5 e.1 y) →
    (L.map ((fun p => pv p s) ∘ g)).sum = K * pv L y
  | [], _ => by simp
  | e :: L, h => by
    simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons]
    rw [h e (by simp), sum_terms g K s y L (fun e' he' => h e' (List.mem_cons_of_mem _ he'))]
    ring

/-- **The box test.** `shiftLb du H lo hi > 0` gives `H(y) > 0` at every `y` with
`lo ≤ du · y ≤ hi` (a box with `lo < hi` and even widths, monomials of length 5). -/
theorem shiftLb_pos {du : ℤ} (hdu : 0 < du) {H : Poly} (hH : WF H) {lo hi : List ℤ}
    (hlo : lo.length = 5) (hhi : hi.length = 5)
    (hw : ∀ i : Fin 5, nth lo i 0 < nth hi i 0 ∧ (nth hi i 0 - nth lo i 0) % 2 = 0)
    (y : Fin 5 → ℝ) (hy : ∀ i : Fin 5, ((nth lo i 0 : ℤ) : ℝ) ≤ du * y i ∧ du * y i ≤ ((nth hi i 0 : ℤ) : ℝ))
    (h : 0 < shiftLb du H lo hi) : 0 < pv H y := by
  have hdu' : (0 : ℝ) < du := by exact_mod_cast hdu
  have hs : ∀ i : Fin 5, ∃ sk : ℝ, |sk| ≤ 1 ∧
      (((nth lo i 0 + nth hi i 0) / 2 : ℤ) : ℝ) + (((nth hi i 0 - nth lo i 0) / 2 : ℤ) : ℝ) * sk
        = du * y i := fun i =>
    ax_param _ _ _ (hw i).1 (hw i).2 (hy i).1 (hy i).2
  choose s hs1 hs2 using hs
  set C : ℕ → ℤ := fun i => nth (List.zipWith (fun l h => (l + h) / 2) lo hi) i 0 with hC
  set W : ℕ → ℤ := fun i => nth (List.zipWith (fun l h => (h - l) / 2) lo hi) i 0 with hW
  have hCW : ∀ i : Fin 5, (C i : ℝ) + W i * s i = du * y i := by
    intro i
    simp only [hC, hW, nth_zipWith _ hlo hhi]
    exact hs2 i
  set Hd := H.foldl (fun acc x => max acc (mdeg x.1)) 0 with hHd
  have hdeg := (foldl_max_ge H 0).2
  have hterm : ∀ e ∈ H, WF ((List.range 5).foldl (fun acc i =>
      (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
      [(zeroMono, e.2 * du ^ (Hd - mdeg e.1))]) ∧
      pv ((List.range 5).foldl (fun acc i =>
      (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
      [(zeroMono, e.2 * du ^ (Hd - mdeg e.1))]) s = e.2 * (du : ℝ) ^ Hd * m5 e.1 y :=
    fun e he => shift_term C W du hdu'.ne' Hd e.1 (hH e he) (hdeg e he) e.2 s y hCW
  have hS : pv (psum (H.map (fun e =>
      (List.range 5).foldl (fun acc i =>
        (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
        [(zeroMono, e.2 * du ^ (Hd - mdeg e.1))]))) s = (du : ℝ) ^ Hd * pv H y := by
    rw [pv_psum, List.map_map]
    exact sum_terms _ _ _ _ _ (fun e he => (hterm e he).2)
  have hlb := lbFold_le (s := s) hs1 (psum (H.map (fun e =>
      (List.range 5).foldl (fun acc i =>
        (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
        [(zeroMono, e.2 * du ^ (Hd - mdeg e.1))]))) 0
  rw [hS] at hlb
  have h' : (0 : ℝ) < shiftLb du H lo hi := by exact_mod_cast h
  have hpow : (0 : ℝ) < (du : ℝ) ^ Hd := pow_pos hdu' _
  have : (0 : ℝ) < (du : ℝ) ^ Hd * pv H y := by
    have := lt_of_lt_of_le h' (by simpa [shiftLb] using hlb)
    simpa using this
  exact pos_of_mul_pos_right this hpow.le

end

end PackLean.Formal.OctLocalPoly
