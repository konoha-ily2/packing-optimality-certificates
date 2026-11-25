import PackLean.Formal.PolySem

/-!
# D45 stage 3a: meaning of the sparse polynomials over `ℚ(√2)` (local region of `cubinoct_n02`)

In the local region the checker `D16C.localOk` works over `ℚ(√2)` (`ps = [2]`): a coefficient is a
two-component list `[a, b]` of integers, the number `a + b√2`.  This file gives the polynomials a value
in `ℝ` and proves that the operations used by the local checker respect it:
`padd`, `psmulZ`, `psum`, `pmul [2]`, `psmulF [2]`, `constTerm`, `faceSub` (the lift `x = ρθ` to a face
of the cube `‖θ‖∞ = 1`), `pmulAff`, and that `shiftLbD` (with `lbPoly` and the bracket of `√2`) gives a
lower bound on a box.

Invariant `WF2`: every monomial has 3 exponents and every coefficient has 2 components.
-/

namespace PackLean.Formal.PolySem2

open PackLean.D28 PackLean.D16C PackLean.D16
open PackLean.Formal.PolySem (monoEval monoEval_three monoEval_zipWith)

/-- Value of a coefficient `[a, b]`: `a + b√2`. -/
noncomputable def fv2 (a : FE) : ℝ := ((a.getD 0 0 : ℤ) : ℝ) + ((a.getD 1 0 : ℤ) : ℝ) * √2

/-- Value of a polynomial at `x`. -/
noncomputable def pEval2 (p : Poly) (x : Fin 3 → ℝ) : ℝ := (p.map fun e => fv2 e.2 * monoEval e.1 x).sum

/-- The invariant: 3 exponents per monomial, 2 components per coefficient. -/
def WF2 (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 3 ∧ e.2.length = 2

variable (x : Fin 3 → ℝ)

@[simp] theorem pEval2_nil : pEval2 [] x = 0 := rfl

@[simp] theorem pEval2_cons (e : Mono × FE) (p : Poly) :
    pEval2 (e :: p) x = fv2 e.2 * monoEval e.1 x + pEval2 p x := by
  simp [pEval2]

theorem pEval2_append (p q : Poly) : pEval2 (p ++ q) x = pEval2 p x + pEval2 q x := by
  simp [pEval2]

@[simp] theorem WF2_nil : WF2 [] := fun _ h => by simp at h

@[simp] theorem WF2_cons {e : Mono × FE} {p : Poly} :
    WF2 (e :: p) ↔ (e.1.length = 3 ∧ e.2.length = 2) ∧ WF2 p := by
  simp [WF2]

theorem WF2_append {p q : Poly} (hp : WF2 p) (hq : WF2 q) : WF2 (p ++ q) := by
  intro e he
  rcases List.mem_append.1 he with h | h
  · exact hp e h
  · exact hq e h

theorem fv2_two (a b : ℤ) : fv2 [a, b] = a + b * √2 := by simp [fv2]

theorem len2 {a : FE} (h : a.length = 2) : ∃ a0 a1, a = [a0, a1] := by
  match a, h with
  | [a0, a1], _ => exact ⟨a0, a1, rfl⟩

/-! ## Coefficients -/

theorem fadd_two (a0 a1 b0 b1 : ℤ) : fadd [a0, a1] [b0, b1] = [a0 + b0, a1 + b1] := rfl

theorem fv2_fadd {a b : FE} (ha : a.length = 2) (hb : b.length = 2) :
    fv2 (fadd a b) = fv2 a + fv2 b := by
  obtain ⟨a0, a1, rfl⟩ := len2 ha
  obtain ⟨b0, b1, rfl⟩ := len2 hb
  rw [fadd_two, fv2_two, fv2_two, fv2_two]; push_cast; ring

theorem fadd_len {a b : FE} (ha : a.length = 2) (hb : b.length = 2) : (fadd a b).length = 2 := by
  obtain ⟨a0, a1, rfl⟩ := len2 ha
  obtain ⟨b0, b1, rfl⟩ := len2 hb
  rfl

theorem fv2_fsmul (c : ℤ) {a : FE} (ha : a.length = 2) : fv2 (fsmul c a) = c * fv2 a := by
  obtain ⟨a0, a1, rfl⟩ := len2 ha
  simp only [fsmul, List.map_cons, List.map_nil, fv2_two]; push_cast; ring

theorem fsmul_len (c : ℤ) {a : FE} (ha : a.length = 2) : (fsmul c a).length = 2 := by
  simpa [fsmul] using ha

theorem fmul_two (a0 a1 b0 b1 : ℤ) :
    fmul [2] [a0, a1] [b0, b1] = [a0 * b0 + 2 * (a1 * b1), a0 * b1 + a1 * b0] := by
  simp [fmul, fadd, fsmul]

theorem fv2_fmul {a b : FE} (ha : a.length = 2) (hb : b.length = 2) :
    fv2 (fmul [2] a b) = fv2 a * fv2 b := by
  obtain ⟨a0, a1, rfl⟩ := len2 ha
  obtain ⟨b0, b1, rfl⟩ := len2 hb
  rw [fmul_two, fv2_two, fv2_two, fv2_two]
  push_cast
  have h2 : √2 * √2 = 2 := Real.mul_self_sqrt (by norm_num)
  linear_combination (-(a1 : ℝ) * b1) * h2

theorem fmul_len {a b : FE} (ha : a.length = 2) (hb : b.length = 2) : (fmul [2] a b).length = 2 := by
  obtain ⟨a0, a1, rfl⟩ := len2 ha
  obtain ⟨b0, b1, rfl⟩ := len2 hb
  rfl

/-- An all-zero coefficient has value `0`. -/
theorem fv2_of_isZero {a : FE} (h : fIsZero a = true) : fv2 a = 0 := by
  have hz : ∀ v ∈ a, v = 0 := by
    intro v hv
    have := List.all_eq_true.1 h v hv
    simpa using this
  have g : ∀ k, a.getD k 0 = 0 := by
    intro k
    rw [List.getD_eq_getElem?_getD]
    cases hk : a[k]? with
    | none => rfl
    | some v => exact hz v (List.mem_of_getElem? hk)
  rw [fv2, g 0, g 1]; simp

theorem fsign0_of_zero : ∀ l : FE, (∀ v ∈ l, v = 0) → fsign [] l = 0
  | [], _ => rfl
  | v :: l, h => by simp [fsign, h v (by simp)]

theorem fsign0_cases (l : FE) : fsign [] l = -1 ∨ fsign [] l = 0 ∨ fsign [] l = 1 := by
  simp only [fsign]
  rcases Int.sign_trichotomy (l.headD 0) with h | h | h <;> rw [h] <;> simp

/-- The sign of an all-zero coefficient is `0`. -/
theorem fsign_of_isZero {a : FE} (h : fIsZero a = true) : fsign [2] a = 0 := by
  have hz : ∀ v ∈ a, v = 0 := by
    intro v hv
    have := List.all_eq_true.1 h v hv
    simpa using this
  rw [fsign]
  dsimp only
  rw [fsign0_of_zero _ (fun v hv => hz v (List.mem_of_mem_take hv)),
    fsign0_of_zero _ (fun v hv => hz v (List.mem_of_mem_drop hv))]
  rfl

/-- The sign is `-1`, `0` or `1`. -/
theorem fsign_abs_le (a : FE) : |((fsign [2] a : ℤ) : ℝ)| ≤ 1 := by
  have key : fsign [2] a = -1 ∨ fsign [2] a = 0 ∨ fsign [2] a = 1 := by
    rw [fsign]
    dsimp only
    split_ifs <;> first | exact fsign0_cases _ | simp
  rcases key with h | h | h <;> rw [h] <;> norm_num

/-! ## Sums -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), WF2 p → WF2 q →
    WF2 (paddF f p q) ∧ pEval2 (paddF f p q) x = pEval2 p x + pEval2 q x
  | 0, p, q, hp, hq => by
    rw [paddF]; exact ⟨WF2_append hp hq, pEval2_append x p q⟩
  | f + 1, [], q, _, hq => by
    rw [paddF]; exact ⟨hq, by simp⟩
  | f + 1, e :: p, [], hp, _ => by
    rw [paddF] <;> first | exact ⟨hp, by simp⟩ | simp
  | f + 1, (m, a) :: p, (n, b) :: q, hp, hq => by
    rw [WF2_cons] at hp hq
    rw [paddF]
    split_ifs with h1 h2
    · have hmn : m = n := beq_iff_eq.1 h1
      subst hmn
      obtain ⟨ih1, ih2⟩ := paddF_spec f p q hp.2 hq.2
      refine ⟨WF2_cons.2 ⟨⟨hp.1.1, fadd_len hp.1.2 hq.1.2⟩, ih1⟩, ?_⟩
      simp only [pEval2_cons, ih2, fv2_fadd hp.1.2 hq.1.2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f p ((n, b) :: q) hp.2 (WF2_cons.2 hq)
      refine ⟨WF2_cons.2 ⟨hp.1, ih1⟩, ?_⟩
      simp only [pEval2_cons, ih2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f ((m, a) :: p) q (WF2_cons.2 hp) hq.2
      refine ⟨WF2_cons.2 ⟨hq.1, ih1⟩, ?_⟩
      simp only [pEval2_cons] at ih2 ⊢
      rw [ih2]
      ring

theorem padd_WF2 {p q : Poly} (hp : WF2 p) (hq : WF2 q) : WF2 (padd p q) :=
  (paddF_spec (fun _ => 0) _ p q hp hq).1

theorem pEval2_padd {p q : Poly} (hp : WF2 p) (hq : WF2 q) :
    pEval2 (padd p q) x = pEval2 p x + pEval2 q x :=
  (paddF_spec x _ p q hp hq).2

theorem psmulZ_WF2 (c : ℤ) {p : Poly} (hp : WF2 p) : WF2 (psmulZ c p) := by
  intro e he
  simp only [psmulZ, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, fsmul_len c (hp _ hma).2⟩

theorem pEval2_psmulZ (c : ℤ) {p : Poly} (hp : WF2 p) : pEval2 (psmulZ c p) x = c * pEval2 p x := by
  induction p with
  | nil => simp [psmulZ]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    rw [WF2_cons] at hp
    simp only [psmulZ, List.map_cons, pEval2_cons] at ih ⊢
    rw [ih hp.2, fv2_fsmul c hp.1.2]
    ring

theorem foldl_padd_spec (l : List Poly) : ∀ acc : Poly, WF2 acc → (∀ p ∈ l, WF2 p) →
    WF2 (l.foldl padd acc) ∧ pEval2 (l.foldl padd acc) x = pEval2 acc x + (l.map (pEval2 · x)).sum := by
  induction l with
  | nil => intro acc h _; simp [h]
  | cons p l ih =>
    intro acc hacc hl
    have hp := hl p (by simp)
    obtain ⟨h1, h2⟩ := ih (padd acc p) (padd_WF2 hacc hp) (fun q hq => hl q (by simp [hq]))
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEval2_padd x hacc hp, List.map_cons, List.sum_cons]
    ring

theorem psum_WF2 {l : List Poly} (hl : ∀ p ∈ l, WF2 p) : WF2 (psum l) :=
  (foldl_padd_spec (fun _ => 0) l [] WF2_nil hl).1

theorem pEval2_psum {l : List Poly} (hl : ∀ p ∈ l, WF2 p) :
    pEval2 (psum l) x = (l.map (pEval2 · x)).sum := by
  rw [psum, (foldl_padd_spec x l [] WF2_nil hl).2]; simp

/-! ## Products over `ℚ(√2)` -/

theorem inner_spec (m : Mono) (a : FE) (hm : m.length = 3) (ha : a.length = 2) (q : Poly)
    (hq : WF2 q) :
    WF2 (q.map fun e => (List.zipWith (· + ·) m e.1, fmul [2] a e.2)) ∧
    pEval2 (q.map fun e => (List.zipWith (· + ·) m e.1, fmul [2] a e.2)) x
      = fv2 a * monoEval m x * pEval2 q x := by
  induction q with
  | nil => simp
  | cons e q ih =>
    rw [WF2_cons] at hq
    obtain ⟨ih1, ih2⟩ := ih hq.2
    refine ⟨WF2_cons.2 ⟨⟨by simp [hm, hq.1.1], fmul_len ha hq.1.2⟩, ih1⟩, ?_⟩
    rw [List.map_cons, pEval2_cons, ih2, pEval2_cons, fv2_fmul ha hq.1.2,
      monoEval_zipWith x hm hq.1.1]
    ring

theorem pmul_spec {p q : Poly} (hp : WF2 p) (hq : WF2 q) :
    WF2 (pmul [2] p q) ∧ pEval2 (pmul [2] p q) x = pEval2 p x * pEval2 q x := by
  have hall : ∀ r ∈ p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul [2] e.2 f.2)), WF2 r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (inner_spec x e.1 e.2 (hp e he).1 (hp e he).2 q hq).1
  have hpm : pmul [2] p q = psum (p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul [2] e.2 f.2))) := rfl
  rw [hpm]
  refine ⟨psum_WF2 hall, ?_⟩
  rw [pEval2_psum x hall, List.map_map]
  clear hall hpm
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF2_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, pEval2_cons, Function.comp_apply,
      (inner_spec x e.1 e.2 hp.1.1 hp.1.2 q hq).2]
    ring

theorem pmul_WF2 {p q : Poly} (hp : WF2 p) (hq : WF2 q) : WF2 (pmul [2] p q) :=
  (pmul_spec (fun _ => 0) hp hq).1

theorem pEval2_pmul {p q : Poly} (hp : WF2 p) (hq : WF2 q) :
    pEval2 (pmul [2] p q) x = pEval2 p x * pEval2 q x := (pmul_spec x hp hq).2

theorem psmulF_WF2 {c : FE} (hc : c.length = 2) {p : Poly} (hp : WF2 p) : WF2 (psmulF [2] c p) := by
  intro e he
  simp only [psmulF, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, fmul_len hc (hp _ hma).2⟩

theorem pEval2_psmulF {c : FE} (hc : c.length = 2) {p : Poly} (hp : WF2 p) :
    pEval2 (psmulF [2] c p) x = fv2 c * pEval2 p x := by
  induction p with
  | nil => simp [psmulF]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    rw [WF2_cons] at hp
    simp only [psmulF, List.map_cons, pEval2_cons] at ih ⊢
    rw [ih hp.2, fv2_fmul hc hp.1.2]
    ring

/-! ## Constants, variables, differences -/

theorem pneg_WF2 {p : Poly} (hp : WF2 p) : WF2 (pneg p) := psmulZ_WF2 _ hp

theorem pEval2_pneg {p : Poly} (hp : WF2 p) : pEval2 (pneg p) x = -pEval2 p x := by
  simp [pneg, pEval2_psmulZ x _ hp]

theorem psub_WF2 {p q : Poly} (hp : WF2 p) (hq : WF2 q) : WF2 (psub p q) :=
  padd_WF2 hp (pneg_WF2 hq)

theorem pEval2_psub {p q : Poly} (hp : WF2 p) (hq : WF2 q) :
    pEval2 (psub p q) x = pEval2 p x - pEval2 q x := by
  rw [psub, pEval2_padd x hp (pneg_WF2 hq), pEval2_pneg x hq]; ring

theorem c2_WF2 (a b : ℤ) : WF2 (c2 a b) := by simp [c2, z3]

theorem pEval2_c2 (a b : ℤ) : pEval2 (c2 a b) x = a + b * √2 := by
  simp [c2, z3, fv2, monoEval_three]

theorem v2_WF2 (i : ℕ) (hi : i < 3) : WF2 (v2 i) := by
  interval_cases i <;> simp [v2, pvar, z3, incAt, fofInt]

theorem pEval2_v2 (i : ℕ) (hi : i < 3) : pEval2 (v2 i) x = x ⟨i, hi⟩ := by
  interval_cases i <;> simp [v2, pvar, z3, incAt, fofInt, fv2, monoEval_three]

/-! ## The constant term -/

theorem monoEval_zero {m : Mono} (hm : m.length = 3) :
    monoEval m 0 = if m == z3 then 1 else 0 := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  rw [monoEval_three]
  simp only [Pi.zero_apply, z3]
  by_cases ha : a = 0 <;> by_cases hb : b = 0 <;> by_cases hc : c = 0 <;> simp [ha, hb, hc]

theorem constTerm_spec (p : Poly) (hp : WF2 p) : ∀ acc : FE, acc.length = 2 →
    (p.foldl (fun acc (x : Mono × FE) => if x.1 == z3 then fadd acc x.2 else acc) acc).length = 2 ∧
    fv2 (p.foldl (fun acc (x : Mono × FE) => if x.1 == z3 then fadd acc x.2 else acc) acc)
      = fv2 acc + pEval2 p 0 := by
  induction p with
  | nil => intro acc h; simp [h]
  | cons e p ih =>
    intro acc hacc
    rw [WF2_cons] at hp
    rw [List.foldl_cons, pEval2_cons, monoEval_zero hp.1.1]
    split_ifs with h
    · obtain ⟨h1, h2⟩ := ih hp.2 (fadd acc e.2) (fadd_len hacc hp.1.2)
      refine ⟨h1, ?_⟩
      rw [h2, fv2_fadd hacc hp.1.2]; ring
    · obtain ⟨h1, h2⟩ := ih hp.2 acc hacc
      refine ⟨h1, ?_⟩
      rw [h2]; ring

/-- The value at `0` is the constant term. -/
theorem pEval2_zero {p : Poly} (hp : WF2 p) : pEval2 p 0 = fv2 (PackLean.D16.constTerm 2 p) := by
  have := (constTerm_spec p hp (fzero 2) rfl).2
  rw [PackLean.D16.constTerm, this]
  simp [fzero, fv2]

/-! ## The lift to a face: `faceSub` -/

/-- The point `x = ρθ` on the face `θ_i = sg` (the other two coordinates `ρ a₁`, `ρ a₂` in order),
from `y = (ρ, a₁, a₂)`. -/
noncomputable def lift (i : ℕ) (sg : ℤ) (y : Fin 3 → ℝ) : Fin 3 → ℝ :=
  match i with
  | 0 => ![sg * y 0, y 0 * y 1, y 0 * y 2]
  | 1 => ![y 0 * y 1, sg * y 0, y 0 * y 2]
  | _ => ![y 0 * y 1, y 0 * y 2, sg * y 0]

theorem faceSub_eq (i : ℕ) (sg : ℤ) (drop : ℕ) (p : Poly) :
    faceSub i sg drop p = psum (p.filterMap (fun (x : Mono × FE) =>
      if x.1.foldl (· + ·) 0 < drop then none else
      some [((x.1.foldl (· + ·) 0 - drop) ::
        (List.zip (List.range 3) x.1).filterMap (fun (y : ℕ × ℕ) => if y.1 == i then none else some y.2),
        fsmul (sg ^ (nth x.1 i 0)) x.2)])) := rfl

/-- One monomial of `faceSub`: value times `ρ^drop` is the value of the monomial at the lifted point. -/
theorem face_term (i : ℕ) (hi : i < 3) (sg : ℤ) (drop : ℕ) (m : Mono) (hm : m.length = 3)
    (hd : drop ≤ m.foldl (· + ·) 0) (y : Fin 3 → ℝ) :
    (((m.foldl (· + ·) 0 - drop) ::
        (List.zip (List.range 3) m).filterMap (fun (z : ℕ × ℕ) => if z.1 == i then none else some z.2)).length = 3) ∧
    y 0 ^ drop * ((sg ^ (nth m i 0) : ℤ) : ℝ) * monoEval ((m.foldl (· + ·) 0 - drop) ::
        (List.zip (List.range 3) m).filterMap (fun (z : ℕ × ℕ) => if z.1 == i then none else some z.2)) y
      = monoEval m (lift i sg y) := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  have hsum : [a, b, c].foldl (· + ·) 0 = a + b + c := by simp
  rw [hsum] at hd ⊢
  have hpow : y 0 ^ drop * y 0 ^ (a + b + c - drop) = y 0 ^ a * y 0 ^ b * y 0 ^ c := by
    rw [← pow_add, Nat.add_sub_cancel' hd, pow_add, pow_add]
  have hr : List.range 3 = [0, 1, 2] := rfl
  interval_cases i
  · refine ⟨by simp [hr], ?_⟩
    simp only [hr, List.zip_cons_cons, List.zip_nil_left, List.filterMap_cons, List.filterMap_nil]
    simp only [monoEval_three, lift, nth]
    simp
    rw [monoEval_three, mul_pow, mul_pow]
    linear_combination (↑sg ^ a * y 1 ^ b * y 2 ^ c) * hpow
  · refine ⟨by simp [hr], ?_⟩
    simp only [hr, List.zip_cons_cons, List.zip_nil_left, List.filterMap_cons, List.filterMap_nil]
    simp only [monoEval_three, lift, nth]
    simp
    rw [monoEval_three, mul_pow, mul_pow]
    linear_combination (↑sg ^ b * y 1 ^ a * y 2 ^ c) * hpow
  · refine ⟨by simp [hr], ?_⟩
    simp only [hr, List.zip_cons_cons, List.zip_nil_left, List.filterMap_cons, List.filterMap_nil]
    simp only [monoEval_three, lift, nth]
    simp
    rw [monoEval_three, mul_pow, mul_pow]
    linear_combination (↑sg ^ c * y 1 ^ a * y 2 ^ b) * hpow

/-- `faceSub` with `drop`: `ρ^drop · value = value at the lifted point − (dropped monomials)`.
The dropped monomials are those of total degree `< drop`. -/
theorem faceSub_spec (i : ℕ) (hi : i < 3) (sg : ℤ) (drop : ℕ) (y : Fin 3 → ℝ) :
    ∀ p : Poly, WF2 p →
    WF2 (faceSub i sg drop p) ∧
    y 0 ^ drop * pEval2 (faceSub i sg drop p) y
      = pEval2 p (lift i sg y) -
        ((p.filter (fun e => e.1.foldl (· + ·) 0 < drop)).map
          (fun e => fv2 e.2 * monoEval e.1 (lift i sg y))).sum := by
  intro p hp
  rw [faceSub_eq]
  have hall : ∀ q ∈ p.filterMap (fun (x : Mono × FE) =>
      if x.1.foldl (· + ·) 0 < drop then none else
      some [((x.1.foldl (· + ·) 0 - drop) ::
        (List.zip (List.range 3) x.1).filterMap (fun (y : ℕ × ℕ) => if y.1 == i then none else some y.2),
        fsmul (sg ^ (nth x.1 i 0)) x.2)]), WF2 q := by
    intro q hq
    rw [List.mem_filterMap] at hq
    obtain ⟨e, he, hq⟩ := hq
    split_ifs at hq with h
    simp only [Option.some.injEq] at hq
    subst hq
    have := hp e he
    rw [WF2_cons]
    exact ⟨⟨(face_term i hi sg drop e.1 this.1 (by omega) y).1, fsmul_len _ this.2⟩, WF2_nil⟩
  refine ⟨psum_WF2 hall, ?_⟩
  rw [pEval2_psum y hall]
  clear hall
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF2_cons] at hp
    rw [List.filterMap_cons, pEval2_cons, List.filter_cons]
    by_cases h : e.1.foldl (· + ·) 0 < drop
    · simp only [h, if_true, decide_true, List.map_cons, List.sum_cons]
      rw [ih hp.2]; ring
    · simp only [h, if_false, decide_false, Bool.false_eq_true, List.map_cons, List.sum_cons]
      rw [mul_add, ih hp.2, pEval2_cons, pEval2_nil, add_zero, fv2_fsmul _ hp.1.2]
      have ht := (face_term i hi sg drop e.1 hp.1.1 (by omega) y).2
      rw [← ht]; ring

/-- `faceSub … 0`: the value at the lifted point. -/
theorem faceSub0 (i : ℕ) (hi : i < 3) (sg : ℤ) (y : Fin 3 → ℝ) {p : Poly} (hp : WF2 p) :
    WF2 (faceSub i sg 0 p) ∧ pEval2 (faceSub i sg 0 p) y = pEval2 p (lift i sg y) := by
  obtain ⟨h1, h2⟩ := faceSub_spec i hi sg 0 y p hp
  refine ⟨h1, ?_⟩
  rw [pow_zero, one_mul] at h2
  rw [h2]
  simp

/-- `faceSub … 1`: `ρ · value = value at the lifted point − value at 0`. -/
theorem faceSub1 (i : ℕ) (hi : i < 3) (sg : ℤ) (y : Fin 3 → ℝ) {p : Poly} (hp : WF2 p) :
    WF2 (faceSub i sg 1 p) ∧
    y 0 * pEval2 (faceSub i sg 1 p) y = pEval2 p (lift i sg y) - fv2 (PackLean.D16.constTerm 2 p) := by
  obtain ⟨h1, h2⟩ := faceSub_spec i hi sg 1 y p hp
  refine ⟨h1, ?_⟩
  rw [pow_one] at h2
  rw [h2, ← pEval2_zero hp]
  congr 1
  clear h1 h2
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF2_cons] at hp
    rw [List.filter_cons, pEval2_cons, monoEval_zero hp.1.1, ← ih hp.2]
    obtain ⟨a, b, c, he⟩ := List.length_eq_three.1 hp.1.1
    have hs : e.1.foldl (· + ·) 0 = a + b + c := by rw [he]; simp
    by_cases h0 : a + b + c = 0
    · have ha : a = 0 := by omega
      have hb : b = 0 := by omega
      have hc : c = 0 := by omega
      have hz : e.1 = z3 := by rw [he, ha, hb, hc]; rfl
      have hlt : e.1.foldl (· + ·) 0 < 1 := by omega
      simp only [hlt, decide_true, if_true, List.map_cons, List.sum_cons, hz, beq_self_eq_true]
      simp only [show decide (List.foldl (· + ·) 0 z3 < 1) = true from rfl, if_true, List.map_cons,
        List.sum_cons]
      rw [hz, z3, monoEval_three]
      simp
    · have hlt : ¬ e.1.foldl (· + ·) 0 < 1 := by omega
      have hne : (e.1 == z3) = false := by
        rw [beq_eq_false_iff_ne, he, z3]
        intro h
        simp only [List.cons.injEq] at h
        omega
      simp [hlt, hne]

/-! ## `pmulAff` and `shiftLbD` -/

theorem incAt_len {m : Mono} (hm : m.length = 3) (i : ℕ) : (incAt m i).length = 3 := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  rcases i with _ | _ | _ | i <;> simp [incAt]

theorem monoEval_incAt {m : Mono} (hm : m.length = 3) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    monoEval (incAt m i) s = s ⟨i, hi⟩ * monoEval m s := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  interval_cases i <;> simp only [incAt, monoEval_three] <;> simp <;> ring

theorem mapInc_spec (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    ∀ p : Poly, WF2 p → WF2 (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) ∧
      pEval2 (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) s = s ⟨i, hi⟩ * pEval2 p s := by
  intro p hp
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF2_cons] at hp
    obtain ⟨h1, h2⟩ := ih hp.2
    refine ⟨WF2_cons.2 ⟨⟨incAt_len hp.1.1 i, hp.1.2⟩, h1⟩, ?_⟩
    rw [List.map_cons, pEval2_cons, h2, pEval2_cons, monoEval_incAt hp.1.1 i hi]
    ring

theorem pmulAff_spec {p : Poly} (hp : WF2 p) (c w : ℤ) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    WF2 (pmulAff p c w i) ∧ pEval2 (pmulAff p c w i) s = (c + w * s ⟨i, hi⟩) * pEval2 p s := by
  have hm : pmulAff p c w i = padd (psmulZ c p) (psmulZ w (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2)))) := rfl
  obtain ⟨h1, h2⟩ := mapInc_spec i hi s p hp
  rw [hm]
  refine ⟨padd_WF2 (psmulZ_WF2 c hp) (psmulZ_WF2 w h1), ?_⟩
  rw [pEval2_padd s (psmulZ_WF2 c hp) (psmulZ_WF2 w h1), pEval2_psmulZ s c hp,
    pEval2_psmulZ s w h1, h2]
  ring

theorem pmulAff_pow (c w : ℤ) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    ∀ (n : ℕ) (p : Poly), WF2 p →
    WF2 ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) ∧
    pEval2 ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) s
      = (c + w * s ⟨i, hi⟩) ^ n * pEval2 p s := by
  intro n
  induction n with
  | zero => intro p hp; simp [hp]
  | succ n ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := pmulAff_spec h1 c w i hi s
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-! ## The lower bound `lbPoly` with the bracket of `√2` -/

/-- The bracket `[(K, K), (a, b)]` with `a ≤ K√2 ≤ b`. -/
def Bracket (sqb : List (ℤ × ℤ)) (K : ℤ) : Prop :=
  ∃ a b : ℤ, sqb = [(K, K), (a, b)] ∧ (a : ℝ) ≤ K * √2 ∧ (K : ℝ) * √2 ≤ b

/-- One step of the fold in `loHi`. -/
def loStep : ℤ × ℤ → ℤ × (ℤ × ℤ) → ℤ × ℤ := fun acc x =>
  let (cm, (a, b)) := x
  if cm > 0 then (acc.1 + cm * a, acc.2 + cm * b)
  else if cm < 0 then (acc.1 + cm * b, acc.2 + cm * a)
  else acc

theorem loHi_eq (sqb : List (ℤ × ℤ)) (c : FE) : loHi sqb c = (List.zip c sqb).foldl loStep (0, 0) := rfl

theorem loStep_bd (acc : ℤ × ℤ) (X v : ℝ) (cm a b : ℤ) (h1 : (acc.1 : ℝ) ≤ X) (h2 : X ≤ acc.2)
    (hav : (a : ℝ) ≤ v) (hvb : v ≤ b) :
    ((loStep acc (cm, (a, b))).1 : ℝ) ≤ X + cm * v ∧ X + cm * v ≤ (loStep acc (cm, (a, b))).2 := by
  rcases lt_trichotomy cm 0 with h | h | h
  · have hn : ¬ cm > 0 := by omega
    have hc : (cm : ℝ) < 0 := by exact_mod_cast h
    simp only [loStep, hn, h, if_false, if_true]
    push_cast
    constructor <;> nlinarith
  · subst h
    simp [loStep, h1, h2]
  · have hc : (0 : ℝ) < cm := by exact_mod_cast h
    simp only [loStep, gt_iff_lt, h, if_true]
    push_cast
    constructor <;> nlinarith

theorem loHi_spec {sqb : List (ℤ × ℤ)} {K : ℤ} (hb : Bracket sqb K) {c : FE} (hc : c.length = 2) :
    ((loHi sqb c).1 : ℝ) ≤ K * fv2 c ∧ (K : ℝ) * fv2 c ≤ (loHi sqb c).2 := by
  obtain ⟨a, b, rfl, hab1, hab2⟩ := hb
  obtain ⟨c0, c1, rfl⟩ := len2 hc
  rw [loHi_eq]
  simp only [List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil, fv2_two]
  have s1 := loStep_bd (0, 0) 0 K c0 K K (by simp) (by simp) le_rfl le_rfl
  have s2 := loStep_bd _ _ (K * √2) c1 a b s1.1 s1.2 hab1 hab2
  have e : (K : ℝ) * (c0 + c1 * √2) = 0 + c0 * K + c1 * (K * √2) := by ring
  rw [e]
  exact s2

theorem term_lb2 {sqb : List (ℤ × ℤ)} {K : ℤ} (hb : Bracket sqb K) (m : Mono) (a : FE)
    (hm : m.length = 3) (ha : a.length = 2) (s : Fin 3 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((monoLb (if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2)
      (loHi sqb a) : ℤ) : ℝ) ≤ K * (fv2 a * monoEval m s) := by
  obtain ⟨hlo, hhi⟩ := loHi_spec hb ha
  obtain ⟨p, q, r, rfl⟩ := List.length_eq_three.1 hm
  rw [monoEval_three]
  set lo := (loHi sqb a).1
  set hi := (loHi sqb a).2
  set v := K * fv2 a with hv
  rw [← mul_assoc, ← hv]
  have hbd : ∀ (i : Fin 3) (k : ℕ), |s i ^ k| ≤ 1 := fun i k => by
    rw [abs_pow]; exact pow_le_one₀ (abs_nonneg _) (hs i)
  have hmono : |s 0 ^ p * s 1 ^ q * s 2 ^ r| ≤ 1 := by
    rw [abs_mul, abs_mul]
    calc |s 0 ^ p| * |s 1 ^ q| * |s 2 ^ r| ≤ 1 * 1 * 1 :=
          mul_le_mul (mul_le_mul (hbd 0 p) (hbd 1 q) (abs_nonneg _) zero_le_one) (hbd 2 r)
            (abs_nonneg _) (by norm_num)
      _ = 1 := by norm_num
  split_ifs with h0 h1
  · simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true, beq_iff_eq] at h0
    obtain ⟨rfl, rfl, rfl⟩ := h0
    simp only [monoLb, pow_zero, mul_one]
    exact hlo
  · simp only [List.all_cons, List.all_nil, Bool.and_true, Bool.and_eq_true, beq_iff_eq] at h1
    obtain ⟨hp, hq, hr⟩ := h1
    have ev : ∀ (i : Fin 3) (k : ℕ), k % 2 = 0 → 0 ≤ s i ^ k ∧ s i ^ k ≤ 1 := fun i k hk => by
      have he : Even k := Nat.even_iff.2 hk
      refine ⟨he.pow_nonneg _, ?_⟩
      rw [← he.pow_abs]; exact pow_le_one₀ (abs_nonneg _) (hs i)
    obtain ⟨a0, a1⟩ := ev 0 p hp
    obtain ⟨b0, b1⟩ := ev 1 q hq
    obtain ⟨c0, c1⟩ := ev 2 r hr
    have hM0 : 0 ≤ s 0 ^ p * s 1 ^ q * s 2 ^ r := by positivity
    have hM1 : s 0 ^ p * s 1 ^ q * s 2 ^ r ≤ 1 := by
      calc s 0 ^ p * s 1 ^ q * s 2 ^ r ≤ 1 * 1 * 1 :=
            mul_le_mul (mul_le_mul a1 b1 b0 zero_le_one) c1 c0 (by norm_num)
        _ = 1 := by norm_num
    simp only [monoLb]
    push_cast
    rcases le_total 0 v with hh | hh
    · have : 0 ≤ v * (s 0 ^ p * s 1 ^ q * s 2 ^ r) := mul_nonneg hh hM0
      have : min 0 (lo : ℝ) ≤ 0 := min_le_left _ _
      linarith
    · have : v ≤ v * (s 0 ^ p * s 1 ^ q * s 2 ^ r) := by nlinarith
      have : min 0 (lo : ℝ) ≤ lo := min_le_right _ _
      linarith
  · simp only [monoLb]
    push_cast
    have h2 := neg_abs_le (v * (s 0 ^ p * s 1 ^ q * s 2 ^ r))
    rw [abs_mul] at h2
    have h3 : |v| * |s 0 ^ p * s 1 ^ q * s 2 ^ r| ≤ |v| :=
      mul_le_of_le_one_right (abs_nonneg _) hmono
    have h4 : |v| ≤ max |(lo : ℝ)| |(hi : ℝ)| := by
      rcases le_total 0 v with hh | hh
      · rw [abs_of_nonneg hh]
        exact le_max_of_le_right (le_trans hhi (le_abs_self _))
      · rw [abs_of_nonpos hh]
        exact le_max_of_le_left (by
          have := neg_abs_le (lo : ℝ)
          linarith)
    have h5 : ((max lo.natAbs hi.natAbs : ℕ) : ℝ) = max |(lo : ℝ)| |(hi : ℝ)| := by
      rw [Nat.cast_max]
      simp only [Nat.cast_natAbs, Int.cast_abs]
    change -max |(lo : ℝ)| |(hi : ℝ)| ≤ _
    linarith

/-- **`lbPoly sqb` is a lower bound on `[-1, 1]³`** (scaled by `K`). -/
theorem lbPoly_le2 {sqb : List (ℤ × ℤ)} {K : ℤ} (hb : Bracket sqb K) {p : Poly} (hp : WF2 p)
    (s : Fin 3 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((lbPoly sqb p : ℤ) : ℝ) ≤ K * pEval2 p s := by
  suffices h : ∀ (acc : ℤ), ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) acc : ℤ) : ℝ) ≤ acc + K * pEval2 p s by
    have h0 := h 0
    rw [Int.cast_zero, zero_add] at h0
    exact h0
  induction p with
  | nil => intro acc; simp
  | cons e p ih =>
    intro acc
    rw [WF2_cons] at hp
    rw [List.foldl_cons]
    refine (ih hp.2 _).trans ?_
    push_cast
    have := term_lb2 hb e.1 e.2 hp.1.1 hp.1.2 s hs
    rw [pEval2_cons]
    linarith

end PackLean.Formal.PolySem2
