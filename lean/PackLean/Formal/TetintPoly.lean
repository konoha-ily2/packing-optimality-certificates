import PackLean.Formal.OctLocalPoly
import PackLean.D40.Core

/-!
# A9 stage 7e-3 (part 1): the integer polynomials of `D40.Core`, any number of variables

Design: `plan/A9f_tet_design.md` §10.  The local check of `D40.Core` uses the sparse polynomials of
`D31` (the same `padd`, `psmul`, `pmul`, `pmulAff`) in **five** variables `(h, k′, p₁, p₂, p₃)` for
the candidate form `P_c` and in **six** variables for its part `Λ_c` (`splitP`), and `shiftLb` reads
the number of variables from the box (`lo.length`).  So the values are given here for monomials of
any length:

* `mval m x` (recursive over the exponent list, `x : ℕ → ℝ`), `pv p x`;
* `padd`, `psmul`, `psub`, `psum`, `pconst` for every list; `pmul`, `pmulAff` for monomials of one
  length `n` (`WF n`);
* `shiftLb_pos`: `shiftLb du H lo hi > 0` gives `H(y) > 0` at every `y` with `lo ≤ du · y ≤ hi`
  (`n = lo.length` variables).
-/

namespace PackLean.Formal.TetintPoly

open PackLean.D40 (Mono Poly padd paddF psmul psub psum pconst pvar pmul pmulAff incAt zm5 monoLt
  mdeg shiftLb nth iabs)

noncomputable section

/-! ## 1. Values -/

/-- The value of a monomial (exponent list) at `x`. -/
def mval : Mono → (ℕ → ℝ) → ℝ
  | [], _ => 1
  | a :: m, x => x 0 ^ a * mval m (fun i => x (i + 1))

/-- The value of a polynomial at `x`. -/
def pv (p : Poly) (x : ℕ → ℝ) : ℝ := (p.map fun e => (e.2 : ℝ) * mval e.1 x).sum

/-- Monomials of length `n`. -/
def WF (n : ℕ) (p : Poly) : Prop := ∀ e ∈ p, e.1.length = n

theorem mval_zipWith : ∀ (m k : Mono), m.length = k.length → ∀ x : ℕ → ℝ,
    mval (List.zipWith (· + ·) m k) x = mval m x * mval k x
  | [], [], _, x => by simp [mval]
  | a :: m, b :: k, h, x => by
    simp only [List.zipWith_cons_cons, mval]
    rw [mval_zipWith m k (by simpa using h), pow_add]
    ring
  | [], _ :: _, h, _ => by simp at h
  | _ :: _, [], h, _ => by simp at h

theorem mval_replicate (n : ℕ) : ∀ x : ℕ → ℝ, mval (List.replicate n 0) x = 1 := by
  induction n with
  | zero => intro x; rfl
  | succ n ih => intro x; simp [List.replicate_succ, mval, ih]

theorem mval_incAt : ∀ (m : Mono) (i : ℕ), i < m.length → ∀ x : ℕ → ℝ,
    mval (incAt m i) x = x i * mval m x
  | a :: m, 0, _, x => by simp only [incAt, mval, pow_succ]; ring
  | a :: m, i + 1, h, x => by
    simp only [incAt, mval]
    rw [mval_incAt m i (by simpa using h)]
    ring
  | [], _, h, _ => by simp at h

theorem incAt_length : ∀ (m : Mono) (i : ℕ), (incAt m i).length = m.length
  | [], _ => rfl
  | a :: m, 0 => rfl
  | a :: m, i + 1 => by simp [incAt, incAt_length m i]

variable (x : ℕ → ℝ)

@[simp] theorem pv_nil : pv [] x = 0 := rfl

@[simp] theorem pv_cons (e : Mono × ℤ) (p : Poly) : pv (e :: p) x = e.2 * mval e.1 x + pv p x := by
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
        linear_combination (-(mval m x)) * e2
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
  · simp [zm5, mval]

theorem pv_pvar (i : ℕ) (hi : i < 5) : pv (pvar i) x = x i := by
  simp only [pvar, pv_cons, pv_nil, add_zero, Int.cast_one, one_mul]
  rw [mval_incAt zm5 i (by simpa [zm5] using hi)]
  simp [zm5, mval]

theorem pv_filter (F : Poly) (P Q : Mono × ℤ → Bool) (hPQ : ∀ e, Q e = !P e) :
    pv F x = pv (F.filter P) x + pv (F.filter Q) x := by
  induction F with
  | nil => simp
  | cons e F ih =>
    rw [List.filter_cons, List.filter_cons, hPQ e]
    cases P e <;> simp [ih] <;> ring

/-! ## 3. The invariant and products -/

variable {n : ℕ}

theorem paddF_WF : ∀ (f : ℕ) (p q : Poly), WF n p → WF n q → WF n (paddF f p q)
  | 0, p, q, hp, hq => by
    intro e he; rcases List.mem_append.1 he with h | h
    · exact hp e h
    · exact hq e h
  | f + 1, [], q, _, hq => by simpa [paddF] using hq
  | f + 1, (m, a) :: ps, [], hp, _ => by simpa [paddF] using hp
  | f + 1, (m, a) :: ps, (k, b) :: qs, hp, hq => by
    have hm : m.length = n := hp (m, a) (by simp)
    have hn : k.length = n := hq (k, b) (by simp)
    have hps : WF n ps := fun e he => hp e (List.mem_cons_of_mem _ he)
    have hqs : WF n qs := fun e he => hq e (List.mem_cons_of_mem _ he)
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

theorem padd_WF {p q : Poly} (hp : WF n p) (hq : WF n q) : WF n (padd p q) :=
  paddF_WF _ p q hp hq

theorem psmul_WF (c : ℤ) {p : Poly} (hp : WF n p) : WF n (psmul c p) := by
  unfold psmul
  split_ifs
  · intro e he; simp at he
  · intro e he
    obtain ⟨e', he', rfl⟩ := List.mem_map.1 he
    exact hp e' he'

theorem psub_WF {p q : Poly} (hp : WF n p) (hq : WF n q) : WF n (psub p q) :=
  padd_WF hp (psmul_WF _ hq)

theorem foldl_padd_WF (l : List Poly) (hl : ∀ p ∈ l, WF n p) : ∀ acc : Poly, WF n acc →
    WF n (l.foldl padd acc) := by
  induction l with
  | nil => intro acc h; simpa using h
  | cons p l ih =>
    intro acc h
    exact ih (fun q hq => hl q (by simp [hq])) _ (padd_WF h (hl p (by simp)))

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WF n p) : WF n (psum l) :=
  foldl_padd_WF l hl [] (fun e he => by simp at he)

theorem pconst_WF (c : ℤ) : WF 5 (pconst c) := by
  unfold pconst; split_ifs
  · intro e he; simp at he
  · intro e he; simp at he; rw [he]; rfl

theorem pvar_WF (i : ℕ) : WF 5 (pvar i) := by
  intro e he; simp [pvar] at he; rw [he, incAt_length]; rfl

theorem inner_spec (m : Mono) (a : ℤ) (hm : m.length = n) (q : Poly) (hq : WF n q) :
    WF n (psum (q.map (fun y => [(List.zipWith (· + ·) m y.1, a * y.2)]))) ∧
    pv (psum (q.map (fun y => [(List.zipWith (· + ·) m y.1, a * y.2)]))) x
      = a * mval m x * pv q x := by
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
      have hy : y.1.length = n := hq y (by simp)
      have hq' : WF n q := fun e he => hq e (by simp [he])
      simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons, pv_nil, ih hq',
        mval_zipWith m y.1 (by rw [hm, hy])]
      push_cast; ring

theorem pmul_spec {p q : Poly} (hp : WF n p) (hq : WF n q) :
    WF n (pmul p q) ∧ pv (pmul p q) x = pv p x * pv q x := by
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
      have he : e.1.length = n := hp e (by simp)
      have hp' : WF n p := fun e' he' => hp e' (List.mem_cons_of_mem _ he')
      simp only [List.map_cons, List.sum_cons, Function.comp, ih hp',
        (inner_spec x e.1 e.2 he q hq).2, pv_cons]
      ring

theorem pmul_WF {p q : Poly} (hp : WF n p) (hq : WF n q) : WF n (pmul p q) :=
  (pmul_spec (fun _ => 0) hp hq).1

theorem pv_pmul {p q : Poly} (hp : WF n p) (hq : WF n q) : pv (pmul p q) x = pv p x * pv q x :=
  (pmul_spec x hp hq).2

theorem mapInc_spec (i : ℕ) (hi : i < n) : ∀ p : Poly, WF n p →
    WF n (p.map (fun e => (incAt e.1 i, e.2))) ∧
    pv (p.map (fun e => (incAt e.1 i, e.2))) x = x i * pv p x := by
  intro p
  induction p with
  | nil => intro _; simp [WF]
  | cons e p ih =>
    intro hp
    have he : e.1.length = n := hp e (by simp)
    obtain ⟨h1, h2⟩ := ih (fun e' he' => hp e' (List.mem_cons_of_mem _ he'))
    refine ⟨?_, ?_⟩
    · intro e' he'
      rcases List.mem_cons.1 he' with rfl | he'
      · rw [incAt_length]; exact he
      · exact h1 e' he'
    · simp only [List.map_cons, pv_cons, h2, mval_incAt e.1 i (by rw [he]; exact hi) x]; ring

theorem pmulAff_spec {p : Poly} (hp : WF n p) (c w : ℤ) (i : ℕ) (hi : i < n) :
    WF n (pmulAff p c w i) ∧ pv (pmulAff p c w i) x = (c + w * x i) * pv p x := by
  obtain ⟨h1, h2⟩ := mapInc_spec x i hi p hp
  refine ⟨padd_WF (psmul_WF _ hp) (psmul_WF _ h1), ?_⟩
  simp only [pmulAff, pv_padd, pv_psmul, h2]; ring

theorem pmulAff_pow (c w : ℤ) (i : ℕ) (hi : i < n) : ∀ (k : ℕ) (p : Poly), WF n p →
    WF n ((List.range k).foldl (fun a _ => pmulAff a c w i) p) ∧
    pv ((List.range k).foldl (fun a _ => pmulAff a c w i) p) x = (c + w * x i) ^ k * pv p x := by
  intro k
  induction k with
  | zero => intro p hp; simp [hp]
  | succ k ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := pmulAff_spec x h1 c w i hi
    simp only [List.foldl_cons, List.foldl_nil]
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-! ## 4. The box test `shiftLb` (any number of variables) -/

theorem mval_abs_le : ∀ (m : Mono) {s : ℕ → ℝ}, (∀ i, |s i| ≤ 1) → |mval m s| ≤ 1
  | [], _, _ => by simp [mval]
  | a :: m, s, hs => by
    simp only [mval]
    rw [abs_mul, abs_pow]
    exact mul_le_one₀ (pow_le_one₀ (abs_nonneg _) (hs 0)) (abs_nonneg _)
      (mval_abs_le m (fun i => hs (i + 1)))

theorem mval_one : ∀ (m : Mono) (s : ℕ → ℝ), m.all (· == 0) = true → mval m s = 1
  | [], _, _ => rfl
  | a :: m, s, h => by
    simp only [List.all_cons, Bool.and_eq_true, beq_iff_eq] at h
    simp only [mval, h.1, pow_zero, one_mul]
    exact mval_one m _ (by simpa using h.2)

theorem mval_nonneg : ∀ (m : Mono) (s : ℕ → ℝ), m.all (· % 2 == 0) = true → 0 ≤ mval m s
  | [], _, _ => by simp [mval]
  | a :: m, s, h => by
    simp only [List.all_cons, Bool.and_eq_true, beq_iff_eq] at h
    simp only [mval]
    exact mul_nonneg (Even.pow_nonneg (Nat.even_iff.2 h.1) _) (mval_nonneg m _ (by simpa using h.2))

theorem term_lb (m : Mono) (c : ℤ) {s : ℕ → ℝ} (hs : ∀ i, |s i| ≤ 1) :
    ((if m.all (· == 0) then c else if m.all (· % 2 == 0) then min 0 c else -iabs c : ℤ) : ℝ)
      ≤ c * mval m s := by
  have hab := mval_abs_le m hs
  split_ifs with h0 h2
  · rw [mval_one m s h0]; simp
  · have hnn := mval_nonneg m s h2
    have hle : mval m s ≤ 1 := (abs_le.1 hab).2
    push_cast
    rcases le_total 0 c with hc | hc
    · have hc' : (0 : ℝ) ≤ c := by exact_mod_cast hc
      rw [min_eq_left hc']; exact mul_nonneg hc' hnn
    · have hc' : (c : ℝ) ≤ 0 := by exact_mod_cast hc
      rw [min_eq_right hc']
      nlinarith
  · have e : ((iabs c : ℤ) : ℝ) = |(c : ℝ)| := by
      simp only [iabs, Int.natCast_natAbs, Int.cast_abs]
    rw [Int.cast_neg, e]
    have := abs_le.1 hab
    have h3 := neg_abs_le ((c : ℝ) * mval m s)
    rw [abs_mul] at h3
    nlinarith [abs_nonneg (c : ℝ), abs_nonneg (mval m s)]

theorem lbFold_le {s : ℕ → ℝ} (hs : ∀ i, |s i| ≤ 1) : ∀ (S : Poly) (acc : ℤ),
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

theorem foldl_max_ge : ∀ (H : Poly) (acc : ℕ), acc ≤ H.foldl (fun acc x => max acc (mdeg x.1)) acc ∧
    ∀ e ∈ H, mdeg e.1 ≤ H.foldl (fun acc x => max acc (mdeg x.1)) acc
  | [], acc => by simp
  | e :: H, acc => by
    obtain ⟨h1, h2⟩ := foldl_max_ge H (max acc (mdeg e.1))
    simp only [List.foldl_cons, List.mem_cons, forall_eq_or_imp]
    exact ⟨le_trans (le_max_left _ _) h1, le_trans (le_max_right _ _) h1, h2⟩

theorem foldl_add_nat : ∀ (m : List ℕ) (acc : ℕ), m.foldl (· + ·) acc = acc + m.sum
  | [], acc => by simp
  | a :: m, acc => by simp only [List.foldl_cons, List.sum_cons, foldl_add_nat m]; ring

theorem mdeg_eq (m : Mono) : mdeg m = m.sum := by
  simp [mdeg, foldl_add_nat]

/-- The value of a monomial as a product over its indices. -/
theorem mval_prod : ∀ (m : Mono) (y : ℕ → ℝ),
    mval m y = ∏ i ∈ Finset.range m.length, y i ^ (nth m i 0)
  | [], y => by simp [mval]
  | a :: m, y => by
    simp only [mval, List.length_cons]
    rw [Finset.prod_range_succ', mval_prod m]
    simp [nth, mul_comm]

/-- The product over the indices of `(du · y_i)^{m_i}` is `du^{deg m} · m(y)`. -/
theorem prod_shift : ∀ (m : Mono) (du : ℝ) (y : ℕ → ℝ),
    ∏ i ∈ Finset.range m.length, (du * y i) ^ (nth m i 0) = du ^ mdeg m * mval m y
  | [], du, y => by simp [mval, mdeg]
  | a :: m, du, y => by
    simp only [List.length_cons]
    rw [Finset.prod_range_succ']
    have ih := prod_shift m du (fun i => y (i + 1))
    simp only [nth, List.getD_cons_succ, List.getD_cons_zero] at ih ⊢
    rw [ih]
    simp only [mdeg_eq, List.sum_cons, mval, pow_add, mul_pow]
    ring

theorem fold_shift (C W : ℕ → ℤ) (s : ℕ → ℝ) (m : Mono) {nv : ℕ} :
    ∀ k, k ≤ nv → ∀ base : Poly, WF nv base →
    WF nv ((List.range k).foldl (fun acc i =>
      (List.range (nth m i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc) base) ∧
    pv ((List.range k).foldl (fun acc i =>
      (List.range (nth m i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc) base) s
      = (∏ i ∈ Finset.range k, ((C i : ℝ) + W i * s i) ^ (nth m i 0)) * pv base s := by
  intro k
  induction k with
  | zero => intro _ base hb; simp [hb]
  | succ k ih =>
    intro hk base hb
    rw [List.range_succ, List.foldl_append]
    obtain ⟨h1, h2⟩ := ih (by omega) base hb
    obtain ⟨h3, h4⟩ := pmulAff_pow s (C k) (W k) k (by omega) (nth m k 0) _ h1
    simp only [List.foldl_cons, List.foldl_nil]
    refine ⟨h3, ?_⟩
    rw [h4, h2, Finset.prod_range_succ]
    ring

theorem ax_param' (l h : ℤ) (zk : ℝ) (hlh : l ≤ h) (he : (h - l) % 2 = 0) (hl : (l : ℝ) ≤ zk)
    (hh : zk ≤ h) :
    ∃ sk : ℝ, |sk| ≤ 1 ∧ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * sk = zk := by
  rcases lt_or_eq_of_le hlh with hlt | heq
  · exact OctLocalPoly.ax_param l h zk hlt he hl hh
  · subst heq
    refine ⟨0, by simp, ?_⟩
    have : zk = l := le_antisymm hh hl
    rw [this]
    have e : (l + l) / 2 = l := by omega
    simp [e]

theorem nth_zipWith' (f : ℤ → ℤ → ℤ) {l1 l2 : List ℤ} {i : ℕ} (h1 : i < l1.length)
    (h2 : i < l2.length) : nth (List.zipWith f l1 l2) i 0 = f (nth l1 i 0) (nth l2 i 0) := by
  have h3 : i < (List.zipWith f l1 l2).length := by simp [List.length_zipWith]; omega
  simp only [nth]
  rw [List.getD_eq_getElem _ _ h3, List.getD_eq_getElem _ _ h1, List.getD_eq_getElem _ _ h2,
    List.getElem_zipWith]

theorem sum_terms (g : Mono × ℤ → Poly) (K : ℝ) (s y : ℕ → ℝ) :
    ∀ (L : Poly), (∀ e ∈ L, pv (g e) s = e.2 * K * mval e.1 y) →
    (L.map ((fun p => pv p s) ∘ g)).sum = K * pv L y
  | [], _ => by simp
  | e :: L, h => by
    simp only [List.map_cons, List.sum_cons, Function.comp, pv_cons]
    rw [h e (by simp), sum_terms g K s y L (fun e' he' => h e' (List.mem_cons_of_mem _ he'))]
    ring

/-- **The box test** (any number of variables `lo.length`). `shiftLb du H lo hi > 0` gives
`H(y) > 0` at every `y` with `lo ≤ du · y ≤ hi` (`lo ≤ hi` with even widths). -/
theorem shiftLb_pos {du : ℤ} (hdu : 0 < du) {lo hi : List ℤ} {H : Poly} (hH : WF lo.length H)
    (hhi : hi.length = lo.length)
    (hw : ∀ i < lo.length, nth lo i 0 ≤ nth hi i 0 ∧ (nth hi i 0 - nth lo i 0) % 2 = 0)
    (y : ℕ → ℝ) (hy : ∀ i < lo.length,
      ((nth lo i 0 : ℤ) : ℝ) ≤ du * y i ∧ du * y i ≤ ((nth hi i 0 : ℤ) : ℝ))
    (h : 0 < shiftLb du H lo hi) : 0 < pv H y := by
  have hdu' : (0 : ℝ) < du := by exact_mod_cast hdu
  set nv := lo.length with hnv
  have hs : ∀ i, ∃ sk : ℝ, |sk| ≤ 1 ∧ (i < nv →
      (((nth lo i 0 + nth hi i 0) / 2 : ℤ) : ℝ) + (((nth hi i 0 - nth lo i 0) / 2 : ℤ) : ℝ) * sk
        = du * y i) := by
    intro i
    by_cases hi : i < nv
    · obtain ⟨sk, h1, h2⟩ := ax_param' _ _ _ (hw i hi).1 (hw i hi).2 (hy i hi).1 (hy i hi).2
      exact ⟨sk, h1, fun _ => h2⟩
    · exact ⟨0, by simp, fun h' => absurd h' hi⟩
  choose s hs1 hs2 using hs
  set C : ℕ → ℤ := fun i => nth (List.zipWith (fun l h => (l + h) / 2) lo hi) i 0 with hC
  set W : ℕ → ℤ := fun i => nth (List.zipWith (fun l h => (h - l) / 2) lo hi) i 0 with hW
  have hCW : ∀ i < nv, (C i : ℝ) + W i * s i = du * y i := by
    intro i hi
    simp only [hC, hW, nth_zipWith' _ hi (by rw [hhi]; exact hi)]
    exact hs2 i hi
  set Hd := H.foldl (fun acc x => max acc (mdeg x.1)) 0 with hHd
  have hdeg := (foldl_max_ge H 0).2
  have hterm : ∀ e ∈ H, pv ((List.range nv).foldl (fun acc i =>
      (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
      [(List.replicate nv 0, e.2 * du ^ (Hd - mdeg e.1))]) s = e.2 * (du : ℝ) ^ Hd * mval e.1 y := by
    intro e he
    have hb : WF nv [(List.replicate nv 0, e.2 * du ^ (Hd - mdeg e.1))] := by
      intro e' he'; simp at he'; rw [he']; simp
    rw [(fold_shift C W s e.1 nv le_rfl _ hb).2]
    have hlen : e.1.length = nv := hH e he
    have hprod : ∏ i ∈ Finset.range nv, ((C i : ℝ) + W i * s i) ^ (nth e.1 i 0)
        = ∏ i ∈ Finset.range e.1.length, ((du : ℝ) * y i) ^ (nth e.1 i 0) := by
      rw [hlen]
      exact Finset.prod_congr rfl fun i hi => by rw [hCW i (Finset.mem_range.1 hi)]
    rw [hprod, prod_shift]
    simp only [pv_cons, pv_nil, add_zero, mval_replicate]
    obtain ⟨t, ht⟩ := Nat.exists_eq_add_of_le (show mdeg e.1 ≤ Hd from hdeg e he)
    rw [ht, Nat.add_sub_cancel_left]
    push_cast
    rw [pow_add]
    ring
  have hS : pv (psum (H.map (fun e =>
      (List.range nv).foldl (fun acc i =>
        (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
        [(List.replicate nv 0, e.2 * du ^ (Hd - mdeg e.1))]))) s = (du : ℝ) ^ Hd * pv H y := by
    rw [pv_psum, List.map_map]
    exact sum_terms _ _ _ _ _ hterm
  have hlb := lbFold_le (s := s) hs1 (psum (H.map (fun e =>
      (List.range nv).foldl (fun acc i =>
        (List.range (nth e.1 i 0)).foldl (fun acc2 _ => pmulAff acc2 (C i) (W i) i) acc)
        [(List.replicate nv 0, e.2 * du ^ (Hd - mdeg e.1))]))) 0
  rw [hS] at hlb
  have h' : (0 : ℝ) < shiftLb du H lo hi := by exact_mod_cast h
  have hpow : (0 : ℝ) < (du : ℝ) ^ Hd := pow_pos hdu' _
  have : (0 : ℝ) < (du : ℝ) ^ Hd * pv H y := by
    have := lt_of_lt_of_le h' (by simpa [shiftLb] using hlb)
    simpa using this
  exact pos_of_mul_pos_right this hpow.le

end

end PackLean.Formal.TetintPoly
