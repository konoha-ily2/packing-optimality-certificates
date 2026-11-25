import Mathlib
import PackLean.D16.CoverCore

/-!
# D45 stage 2a: meaning of the sparse polynomials of the certificate checkers (rational case)

The checkers in `PackLean.D28.Core` / `PackLean.D16.CoverCore` compute with sparse polynomials
`Poly = List (Mono × FE)` (no Mathlib).  In the far region of `cubinoct_n02` the field is `ℚ`
(`ps = []`): every coefficient is a one-component list of integers.  This file gives the polynomials a
value in `ℝ` and proves that the operations used by the far checker respect it, and that `lbPoly`
is a lower bound on `[-1, 1]³`.

Invariant `WF`: every monomial has 3 exponents and every coefficient is a nonempty list.
-/

namespace PackLean.Formal.PolySem

open PackLean.D28 PackLean.D16C PackLean.D16

/-- Value of a coefficient (rational case: the first component). -/
def fv (a : FE) : ℝ := ((a.headD 0 : ℤ) : ℝ)

/-- Value of a monomial at `x`. -/
def monoEval (m : Mono) (x : Fin 3 → ℝ) : ℝ := ∏ i : Fin 3, x i ^ (m.getD i 0)

/-- Value of a polynomial at `x`. -/
def pEval (p : Poly) (x : Fin 3 → ℝ) : ℝ := (p.map fun e => fv e.2 * monoEval e.1 x).sum

/-- The invariant: 3 exponents per monomial, nonempty coefficients. -/
def WF (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 3 ∧ e.2 ≠ []

variable (x : Fin 3 → ℝ)

@[simp] theorem pEval_nil : pEval [] x = 0 := rfl

@[simp] theorem pEval_cons (e : Mono × FE) (p : Poly) :
    pEval (e :: p) x = fv e.2 * monoEval e.1 x + pEval p x := by
  simp [pEval]

theorem pEval_append (p q : Poly) : pEval (p ++ q) x = pEval p x + pEval q x := by
  simp [pEval]

@[simp] theorem WF_nil : WF [] := fun _ h => by simp at h

@[simp] theorem WF_cons {e : Mono × FE} {p : Poly} :
    WF (e :: p) ↔ (e.1.length = 3 ∧ e.2 ≠ []) ∧ WF p := by
  simp [WF]

theorem WF_append {p q : Poly} (hp : WF p) (hq : WF q) : WF (p ++ q) := by
  intro e he
  rcases List.mem_append.1 he with h | h
  · exact hp e h
  · exact hq e h

theorem monoEval_three (a b c : ℕ) : monoEval [a, b, c] x = x 0 ^ a * x 1 ^ b * x 2 ^ c := by
  simp [monoEval, Fin.prod_univ_three]

/-! ## Coefficients -/

theorem fv_fadd {a b : FE} (ha : a ≠ []) (hb : b ≠ []) : fv (fadd a b) = fv a + fv b := by
  obtain ⟨a0, as, rfl⟩ := List.exists_cons_of_ne_nil ha
  obtain ⟨b0, bs, rfl⟩ := List.exists_cons_of_ne_nil hb
  simp [fv, fadd]

theorem fadd_ne_nil {a b : FE} (ha : a ≠ []) (hb : b ≠ []) : fadd a b ≠ [] := by
  obtain ⟨a0, as, rfl⟩ := List.exists_cons_of_ne_nil ha
  obtain ⟨b0, bs, rfl⟩ := List.exists_cons_of_ne_nil hb
  simp [fadd]

theorem fv_fsmul (c : ℤ) (a : FE) : fv (fsmul c a) = c * fv a := by
  cases a <;> simp [fv, fsmul]

theorem fsmul_ne_nil (c : ℤ) {a : FE} (ha : a ≠ []) : fsmul c a ≠ [] := by
  simpa [fsmul] using ha

theorem fv_fmul_nil (a b : FE) : fv (fmul [] a b) = fv a * fv b := by
  simp [fv, fmul]

/-! ## Sums -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), WF p → WF q →
    WF (paddF f p q) ∧ pEval (paddF f p q) x = pEval p x + pEval q x
  | 0, p, q, hp, hq => by
    rw [paddF]; exact ⟨WF_append hp hq, pEval_append x p q⟩
  | f + 1, [], q, _, hq => by
    rw [paddF]; exact ⟨hq, by simp⟩
  | f + 1, e :: p, [], hp, _ => by
    rw [paddF] <;> first | exact ⟨hp, by simp⟩ | simp
  | f + 1, (m, a) :: p, (n, b) :: q, hp, hq => by
    rw [WF_cons] at hp hq
    rw [paddF]
    split_ifs with h1 h2
    · have hmn : m = n := beq_iff_eq.1 h1
      subst hmn
      obtain ⟨ih1, ih2⟩ := paddF_spec f p q hp.2 hq.2
      refine ⟨WF_cons.2 ⟨⟨hp.1.1, fadd_ne_nil hp.1.2 hq.1.2⟩, ih1⟩, ?_⟩
      simp only [pEval_cons, ih2, fv_fadd hp.1.2 hq.1.2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f p ((n, b) :: q) hp.2 (WF_cons.2 hq)
      refine ⟨WF_cons.2 ⟨hp.1, ih1⟩, ?_⟩
      simp only [pEval_cons, ih2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f ((m, a) :: p) q (WF_cons.2 hp) hq.2
      refine ⟨WF_cons.2 ⟨hq.1, ih1⟩, ?_⟩
      simp only [pEval_cons] at ih2 ⊢
      rw [ih2]
      ring

theorem padd_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (padd p q) :=
  (paddF_spec (fun _ => 0) _ p q hp hq).1

/-- `padd` adds values. -/
theorem pEval_padd {p q : Poly} (hp : WF p) (hq : WF q) :
    pEval (padd p q) x = pEval p x + pEval q x :=
  (paddF_spec x _ p q hp hq).2

theorem psmulZ_WF (c : ℤ) {p : Poly} (hp : WF p) : WF (psmulZ c p) := by
  intro e he
  simp only [psmulZ, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, fsmul_ne_nil c (hp _ hma).2⟩

/-- `psmulZ` scales values. -/
theorem pEval_psmulZ (c : ℤ) (p : Poly) : pEval (psmulZ c p) x = c * pEval p x := by
  induction p with
  | nil => simp [psmulZ]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    simp only [psmulZ, List.map_cons, pEval_cons] at ih ⊢
    rw [ih, fv_fsmul]
    ring

theorem foldl_padd_spec (l : List Poly) : ∀ acc : Poly, WF acc → (∀ p ∈ l, WF p) →
    WF (l.foldl padd acc) ∧ pEval (l.foldl padd acc) x = pEval acc x + (l.map (pEval · x)).sum := by
  induction l with
  | nil => intro acc h _; simp [h]
  | cons p l ih =>
    intro acc hacc hl
    have hp := hl p (by simp)
    obtain ⟨h1, h2⟩ := ih (padd acc p) (padd_WF hacc hp) (fun q hq => hl q (by simp [hq]))
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEval_padd x hacc hp, List.map_cons, List.sum_cons]
    ring

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WF p) : WF (psum l) :=
  (foldl_padd_spec (fun _ => 0) l [] WF_nil hl).1

/-- `psum` adds values. -/
theorem pEval_psum {l : List Poly} (hl : ∀ p ∈ l, WF p) :
    pEval (psum l) x = (l.map (pEval · x)).sum := by
  rw [psum, (foldl_padd_spec x l [] WF_nil hl).2]; simp

/-! ## Products (rational case `ps = []`) -/

theorem monoEval_zipWith {m n : Mono} (hm : m.length = 3) (hn : n.length = 3) :
    monoEval (List.zipWith (· + ·) m n) x = monoEval m x * monoEval n x := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  obtain ⟨d, e, f, rfl⟩ := List.length_eq_three.1 hn
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, monoEval_three]
  ring

theorem inner_spec (m : Mono) (a : FE) (hm : m.length = 3) (q : Poly) (hq : WF q) :
    WF (q.map fun e => (List.zipWith (· + ·) m e.1, fmul [] a e.2)) ∧
    pEval (q.map fun e => (List.zipWith (· + ·) m e.1, fmul [] a e.2)) x
      = fv a * monoEval m x * pEval q x := by
  induction q with
  | nil => simp
  | cons e q ih =>
    rw [WF_cons] at hq
    obtain ⟨ih1, ih2⟩ := ih hq.2
    refine ⟨WF_cons.2 ⟨⟨by simp [hm, hq.1.1], by simp [fmul]⟩, ih1⟩, ?_⟩
    rw [List.map_cons, pEval_cons, ih2, pEval_cons, fv_fmul_nil, monoEval_zipWith x hm hq.1.1]
    ring

theorem pmul_spec {p q : Poly} (hp : WF p) (hq : WF q) :
    WF (pmul [] p q) ∧ pEval (pmul [] p q) x = pEval p x * pEval q x := by
  have hall : ∀ r ∈ p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul [] e.2 f.2)), WF r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (inner_spec x e.1 e.2 (hp e he).1 q hq).1
  have hpm : pmul [] p q = psum (p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul [] e.2 f.2))) := rfl
  rw [hpm]
  refine ⟨psum_WF hall, ?_⟩
  rw [pEval_psum x hall, List.map_map]
  clear hall hpm
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, pEval_cons, Function.comp_apply,
      (inner_spec x e.1 e.2 hp.1.1 q hq).2]
    ring

theorem pmul_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (pmul [] p q) := (pmul_spec (fun _ => 0) hp hq).1

/-- `pmul []` multiplies values. -/
theorem pEval_pmul {p q : Poly} (hp : WF p) (hq : WF q) :
    pEval (pmul [] p q) x = pEval p x * pEval q x := (pmul_spec x hp hq).2

/-! ## Constants, variables, differences -/

theorem pneg_WF {p : Poly} (hp : WF p) : WF (pneg p) := psmulZ_WF _ hp

theorem pEval_pneg (p : Poly) : pEval (pneg p) x = -pEval p x := by
  simp [pneg, pEval_psmulZ]

theorem psub_WF {p q : Poly} (hp : WF p) (hq : WF q) : WF (psub p q) :=
  padd_WF hp (pneg_WF hq)

theorem pEval_psub {p q : Poly} (hp : WF p) (hq : WF q) :
    pEval (psub p q) x = pEval p x - pEval q x := by
  rw [psub, pEval_padd x hp (pneg_WF hq), pEval_pneg]; ring

theorem const_WF (c : ℤ) : WF [(z3, q1 c)] := by simp [z3, q1]

theorem pEval_const (c : ℤ) : pEval [(z3, q1 c)] x = c := by
  simp [z3, q1, fv, monoEval_three]

theorem var_WF (c : ℤ) (i : Fin 3) : WF [(incAt z3 i, q1 c)] := by
  fin_cases i <;> simp [z3, q1, incAt]

theorem pEval_var (c : ℤ) (i : Fin 3) : pEval [(incAt z3 i, q1 c)] x = c * x i := by
  fin_cases i <;> simp [z3, q1, incAt, fv, monoEval_three]

theorem affP_WF (c w : ℤ) (i : Fin 3) : WF (affP c w i) :=
  padd_WF (const_WF c) (var_WF w i)

/-- `affP c w i` is `c + w·x i`. -/
theorem pEval_affP (c w : ℤ) (i : Fin 3) : pEval (affP c w i) x = c + w * x i := by
  rw [affP, pEval_padd x (const_WF c) (var_WF w i), pEval_const, pEval_var]

/-! ## The lower bound `lbPoly [(1, 1)]` on `[-1, 1]³` -/

theorem loHi_one (a : FE) : loHi [(1, 1)] a = (a.headD 0, a.headD 0) := by
  cases a with
  | nil => simp [loHi]
  | cons c rest =>
    simp only [loHi, List.zip_cons_cons, List.zip_nil_right, List.foldl_cons, List.foldl_nil,
      List.headD_cons]
    split_ifs with h1 h2
    · simp
    · simp
    · have : c = 0 := by omega
      simp [this]

theorem term_lb (m : Mono) (a : FE) (hm : m.length = 3) (hx : ∀ i, |x i| ≤ 1) :
    ((monoLb (if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2)
      (loHi [(1, 1)] a) : ℤ) : ℝ) ≤ fv a * monoEval m x := by
  obtain ⟨p, q, r, rfl⟩ := List.length_eq_three.1 hm
  rw [loHi_one, monoEval_three]
  set h : ℤ := a.headD 0
  have hfv : fv a = h := rfl
  rw [hfv]
  have hb : ∀ (i : Fin 3) (k : ℕ), |x i ^ k| ≤ 1 := fun i k => by
    rw [abs_pow]; exact pow_le_one₀ (abs_nonneg _) (hx i)
  have hmono : |x 0 ^ p * x 1 ^ q * x 2 ^ r| ≤ 1 := by
    rw [abs_mul, abs_mul]
    calc |x 0 ^ p| * |x 1 ^ q| * |x 2 ^ r| ≤ 1 * 1 * 1 :=
          mul_le_mul (mul_le_mul (hb 0 p) (hb 1 q) (abs_nonneg _) zero_le_one) (hb 2 r)
            (abs_nonneg _) (by norm_num)
      _ = 1 := by norm_num
  split_ifs with h0 h1
  · simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true, beq_iff_eq] at h0
    obtain ⟨rfl, rfl, rfl⟩ := h0
    simp [monoLb]
  · simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true, beq_iff_eq] at h1
    obtain ⟨hp, hq, hr⟩ := h1
    have ev : ∀ (i : Fin 3) (k : ℕ), k % 2 = 0 → 0 ≤ x i ^ k ∧ x i ^ k ≤ 1 := fun i k hk => by
      have he : Even k := Nat.even_iff.2 hk
      refine ⟨he.pow_nonneg _, ?_⟩
      rw [← he.pow_abs]; exact pow_le_one₀ (abs_nonneg _) (hx i)
    obtain ⟨a0, a1⟩ := ev 0 p hp
    obtain ⟨b0, b1⟩ := ev 1 q hq
    obtain ⟨c0, c1⟩ := ev 2 r hr
    have hM0 : 0 ≤ x 0 ^ p * x 1 ^ q * x 2 ^ r := by positivity
    have hM1 : x 0 ^ p * x 1 ^ q * x 2 ^ r ≤ 1 := by
      calc x 0 ^ p * x 1 ^ q * x 2 ^ r ≤ 1 * 1 * 1 :=
            mul_le_mul (mul_le_mul a1 b1 b0 zero_le_one) c1 c0 (by norm_num)
        _ = 1 := by norm_num
    simp only [monoLb]
    push_cast
    rcases le_total 0 (h : ℝ) with hh | hh
    · rw [min_eq_left hh]; positivity
    · rw [min_eq_right hh]; nlinarith
  · simp only [monoLb]
    push_cast
    have h2 := neg_abs_le ((h : ℝ) * (x 0 ^ p * x 1 ^ q * x 2 ^ r))
    rw [abs_mul] at h2
    have h3 : |(h : ℝ)| * |x 0 ^ p * x 1 ^ q * x 2 ^ r| ≤ |(h : ℝ)| :=
      mul_le_of_le_one_right (abs_nonneg _) hmono
    rw [max_self]
    linarith

/-- **`lbPoly [(1,1)]` is a lower bound on `[-1, 1]³`.** -/
theorem lbPoly_le {p : Poly} (hp : WF p) (hx : ∀ i, |x i| ≤ 1) :
    ((lbPoly [(1, 1)] p : ℤ) : ℝ) ≤ pEval p x := by
  suffices h : ∀ (acc : ℤ), ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi [(1, 1)] e.2)) acc : ℤ) : ℝ) ≤ acc + pEval p x by
    have h0 := h 0
    rw [Int.cast_zero, zero_add] at h0
    exact h0
  induction p with
  | nil => intro acc; simp
  | cons e p ih =>
    intro acc
    rw [WF_cons] at hp
    rw [List.foldl_cons]
    refine (ih hp.2 _).trans ?_
    push_cast
    have := term_lb x e.1 e.2 hp.1.1 hx
    rw [pEval_cons]
    linarith

end PackLean.Formal.PolySem
