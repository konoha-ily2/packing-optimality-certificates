import PackLean.Formal.PolySem
import PackLean.Formal.FieldSem

/-!
# D45 stage 4b: meaning of the sparse polynomials over `ℚ(√ps)` for any `ps`

The general form of `PolySem2` (which was `ps = [2]` only), for the six cases of `D16.Core`
(`ps = [5]`, `ps = [5, 2]`).  A coefficient `a : FE` has the value `FieldSem.fval ps a`.

* `pEval ps p x`, invariant `WF ps p` (3 exponents, coefficient of length `2 ^ ps.length`);
* `padd`, `psmulZ`, `psum`, `pmul ps`, `psmulF ps`, `pneg`, `psub`, `pconst`, `pvar`, `constTerm`,
  `faceSub` (the lift `x = ρθ` to a face of the cube), `pmulAff` respect it;
* **the decomposition along `maskp`**: `fval ps a = Σ_m a_m √(maskOf ps)_m` (`fval_mask`), where
  `maskOf ps` is the list of the square-free products in the order of the recursion of `fmul`
  (`maskOf [5, 2] = [1, 2, 5, 10]`);
* the bracket of the square roots from `sqbOk` (`bracket_of_sqbOk`), the bounds `loHi`, `monoLb` and
  the box test `shiftLb3` (`shiftLb3_spec`: `v ≤ K · D^8 · H(z / D)` on the box).
-/

namespace PackLean.Formal.PolySemG

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul loHi monoLb Mono Poly padd paddF
  psum pmul psmulZ psmulF incAt pmulAff monoLt nth)
open PackLean.D16 (z3 pconst pvar pneg psub constTerm faceSub shiftLb3)
open PackLean.Formal.PolySem (monoEval monoEval_three monoEval_zipWith)
open PackLean.Formal.FieldSem

/-- Value of a polynomial at `x` (coefficients in `ℚ(√ps)`). -/
noncomputable def pEval (ps : List ℕ) (p : Poly) (x : Fin 3 → ℝ) : ℝ :=
  (p.map fun e => fval ps e.2 * monoEval e.1 x).sum

/-- The invariant: 3 exponents per monomial, `2 ^ ps.length` components per coefficient. -/
def WF (ps : List ℕ) (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 3 ∧ Len ps e.2

variable {ps : List ℕ} (x : Fin 3 → ℝ)

@[simp] theorem pEval_nil : pEval ps [] x = 0 := rfl

@[simp] theorem pEval_cons (e : Mono × FE) (p : Poly) :
    pEval ps (e :: p) x = fval ps e.2 * monoEval e.1 x + pEval ps p x := by
  simp [pEval]

theorem pEval_append (p q : Poly) : pEval ps (p ++ q) x = pEval ps p x + pEval ps q x := by
  simp [pEval]

@[simp] theorem WF_nil : WF ps [] := fun _ h => by simp at h

@[simp] theorem WF_cons {e : Mono × FE} {p : Poly} :
    WF ps (e :: p) ↔ (e.1.length = 3 ∧ Len ps e.2) ∧ WF ps p := by
  simp [WF]

theorem WF_append {p q : Poly} (hp : WF ps p) (hq : WF ps q) : WF ps (p ++ q) := by
  intro e he
  rcases List.mem_append.1 he with h | h
  · exact hp e h
  · exact hq e h

/-! ## Sums -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), WF ps p → WF ps q →
    WF ps (paddF f p q) ∧ pEval ps (paddF f p q) x = pEval ps p x + pEval ps q x
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
      refine ⟨WF_cons.2 ⟨⟨hp.1.1, len_fadd hp.1.2 hq.1.2⟩, ih1⟩, ?_⟩
      simp only [pEval_cons, ih2, fval_fadd hp.1.2 hq.1.2]
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

theorem padd_WF {p q : Poly} (hp : WF ps p) (hq : WF ps q) : WF ps (padd p q) :=
  (paddF_spec (fun _ => 0) _ p q hp hq).1

theorem pEval_padd {p q : Poly} (hp : WF ps p) (hq : WF ps q) :
    pEval ps (padd p q) x = pEval ps p x + pEval ps q x :=
  (paddF_spec x _ p q hp hq).2

theorem psmulZ_WF (c : ℤ) {p : Poly} (hp : WF ps p) : WF ps (psmulZ c p) := by
  intro e he
  simp only [psmulZ, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fsmul c (hp _ hma).2⟩

theorem pEval_psmulZ (c : ℤ) (p : Poly) : pEval ps (psmulZ c p) x = c * pEval ps p x := by
  induction p with
  | nil => simp [psmulZ]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    simp only [psmulZ, List.map_cons, pEval_cons] at ih ⊢
    rw [ih, fval_fsmul]
    ring

theorem foldl_padd_spec (l : List Poly) : ∀ acc : Poly, WF ps acc → (∀ p ∈ l, WF ps p) →
    WF ps (l.foldl padd acc) ∧
      pEval ps (l.foldl padd acc) x = pEval ps acc x + (l.map (pEval ps · x)).sum := by
  induction l with
  | nil => intro acc h _; simp [h]
  | cons p l ih =>
    intro acc hacc hl
    have hp := hl p (by simp)
    obtain ⟨h1, h2⟩ := ih (padd acc p) (padd_WF hacc hp) (fun q hq => hl q (by simp [hq]))
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEval_padd x hacc hp, List.map_cons, List.sum_cons]
    ring

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WF ps p) : WF ps (psum l) :=
  (foldl_padd_spec (fun _ => 0) l [] WF_nil hl).1

theorem pEval_psum {l : List Poly} (hl : ∀ p ∈ l, WF ps p) :
    pEval ps (psum l) x = (l.map (pEval ps · x)).sum := by
  rw [psum, (foldl_padd_spec x l [] WF_nil hl).2]; simp

/-! ## Products -/

theorem inner_spec (m : Mono) (a : FE) (hm : m.length = 3) (ha : Len ps a) (q : Poly)
    (hq : WF ps q) :
    WF ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) ∧
    pEval ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) x
      = fval ps a * monoEval m x * pEval ps q x := by
  induction q with
  | nil => simp
  | cons e q ih =>
    rw [WF_cons] at hq
    obtain ⟨ih1, ih2⟩ := ih hq.2
    refine ⟨WF_cons.2 ⟨⟨by simp [hm, hq.1.1], len_fmul ha hq.1.2⟩, ih1⟩, ?_⟩
    rw [List.map_cons, pEval_cons, ih2, pEval_cons, fval_fmul ha hq.1.2,
      monoEval_zipWith x hm hq.1.1]
    ring

theorem pmul_spec {p q : Poly} (hp : WF ps p) (hq : WF ps q) :
    WF ps (pmul ps p q) ∧ pEval ps (pmul ps p q) x = pEval ps p x * pEval ps q x := by
  have hall : ∀ r ∈ p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2)), WF ps r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (inner_spec x e.1 e.2 (hp e he).1 (hp e he).2 q hq).1
  have hpm : pmul ps p q = psum (p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2))) := rfl
  rw [hpm]
  refine ⟨psum_WF hall, ?_⟩
  rw [pEval_psum x hall, List.map_map]
  clear hall hpm
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, pEval_cons, Function.comp_apply,
      (inner_spec x e.1 e.2 hp.1.1 hp.1.2 q hq).2]
    ring

theorem pmul_WF {p q : Poly} (hp : WF ps p) (hq : WF ps q) : WF ps (pmul ps p q) :=
  (pmul_spec (fun _ => 0) hp hq).1

theorem pEval_pmul {p q : Poly} (hp : WF ps p) (hq : WF ps q) :
    pEval ps (pmul ps p q) x = pEval ps p x * pEval ps q x := (pmul_spec x hp hq).2

theorem psmulF_WF {c : FE} (hc : Len ps c) {p : Poly} (hp : WF ps p) : WF ps (psmulF ps c p) := by
  intro e he
  simp only [psmulF, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fmul hc (hp _ hma).2⟩

theorem pEval_psmulF {c : FE} (hc : Len ps c) {p : Poly} (hp : WF ps p) :
    pEval ps (psmulF ps c p) x = fval ps c * pEval ps p x := by
  induction p with
  | nil => simp [psmulF]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    rw [WF_cons] at hp
    simp only [psmulF, List.map_cons, pEval_cons] at ih ⊢
    rw [ih hp.2, fval_fmul hc hp.1.2]
    ring

/-! ## Constants, variables, differences -/

theorem pneg_WF {p : Poly} (hp : WF ps p) : WF ps (pneg p) := psmulZ_WF _ hp

theorem pEval_pneg (p : Poly) : pEval ps (pneg p) x = -pEval ps p x := by
  simp [pneg, pEval_psmulZ x]

theorem psub_WF {p q : Poly} (hp : WF ps p) (hq : WF ps q) : WF ps (psub p q) :=
  padd_WF hp (pneg_WF hq)

theorem pEval_psub {p q : Poly} (hp : WF ps p) (hq : WF ps q) :
    pEval ps (psub p q) x = pEval ps p x - pEval ps q x := by
  rw [psub, pEval_padd x hp (pneg_WF hq), pEval_pneg x]; ring

theorem pconst_WF {c : FE} (hc : Len ps c) : WF ps (pconst c) := by simp [pconst, z3, hc]

theorem pEval_pconst (c : FE) : pEval ps (pconst c) x = fval ps c := by
  simp [pconst, z3, monoEval_three]

theorem pvar_WF (i : ℕ) (hi : i < 3) : WF ps (pvar (2 ^ ps.length) i) := by
  interval_cases i <;> simp [pvar, z3, incAt, len_fofInt]

theorem pEval_pvar (i : ℕ) (hi : i < 3) : pEval ps (pvar (2 ^ ps.length) i) x = x ⟨i, hi⟩ := by
  interval_cases i <;> simp [pvar, z3, incAt, fval_fofInt, monoEval_three]

/-! ## The constant term -/

theorem monoEval_zero {m : Mono} (hm : m.length = 3) :
    monoEval m 0 = if m == z3 then 1 else 0 := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  rw [monoEval_three]
  simp only [Pi.zero_apply, z3]
  by_cases ha : a = 0 <;> by_cases hb : b = 0 <;> by_cases hc : c = 0 <;> simp [ha, hb, hc]

theorem constTerm_spec (p : Poly) (hp : WF ps p) : ∀ acc : FE, Len ps acc →
    Len ps (p.foldl (fun acc (x : Mono × FE) => if x.1 == z3 then fadd acc x.2 else acc) acc) ∧
    fval ps (p.foldl (fun acc (x : Mono × FE) => if x.1 == z3 then fadd acc x.2 else acc) acc)
      = fval ps acc + pEval ps p 0 := by
  induction p with
  | nil => intro acc h; simp [h]
  | cons e p ih =>
    intro acc hacc
    rw [WF_cons] at hp
    rw [List.foldl_cons, pEval_cons, monoEval_zero hp.1.1]
    split_ifs with h
    · obtain ⟨h1, h2⟩ := ih hp.2 (fadd acc e.2) (len_fadd hacc hp.1.2)
      refine ⟨h1, ?_⟩
      rw [h2, fval_fadd hacc hp.1.2]; ring
    · obtain ⟨h1, h2⟩ := ih hp.2 acc hacc
      refine ⟨h1, ?_⟩
      rw [h2]; ring

theorem constTerm_len {p : Poly} (hp : WF ps p) : Len ps (constTerm (2 ^ ps.length) p) :=
  (constTerm_spec p hp (fzero (2 ^ ps.length)) (len_fzero ps)).1

/-- The value at `0` is the constant term. -/
theorem pEval_zero {p : Poly} (hp : WF ps p) :
    pEval ps p 0 = fval ps (constTerm (2 ^ ps.length) p) := by
  have := (constTerm_spec p hp (fzero (2 ^ ps.length)) (len_fzero ps)).2
  rw [constTerm, this, fval_fzero]
  ring

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

/-- `faceSub` with `drop`: `ρ^drop · value = value at the lifted point − (dropped monomials)`. -/
theorem faceSub_spec (i : ℕ) (hi : i < 3) (sg : ℤ) (drop : ℕ) (y : Fin 3 → ℝ) :
    ∀ p : Poly, WF ps p →
    WF ps (faceSub i sg drop p) ∧
    y 0 ^ drop * pEval ps (faceSub i sg drop p) y
      = pEval ps p (lift i sg y) -
        ((p.filter (fun e => e.1.foldl (· + ·) 0 < drop)).map
          (fun e => fval ps e.2 * monoEval e.1 (lift i sg y))).sum := by
  intro p hp
  rw [faceSub_eq]
  have hall : ∀ q ∈ p.filterMap (fun (x : Mono × FE) =>
      if x.1.foldl (· + ·) 0 < drop then none else
      some [((x.1.foldl (· + ·) 0 - drop) ::
        (List.zip (List.range 3) x.1).filterMap (fun (y : ℕ × ℕ) => if y.1 == i then none else some y.2),
        fsmul (sg ^ (nth x.1 i 0)) x.2)]), WF ps q := by
    intro q hq
    rw [List.mem_filterMap] at hq
    obtain ⟨e, he, hq⟩ := hq
    split_ifs at hq with h
    simp only [Option.some.injEq] at hq
    subst hq
    have := hp e he
    rw [WF_cons]
    exact ⟨⟨(face_term i hi sg drop e.1 this.1 (by omega) y).1, len_fsmul _ this.2⟩, WF_nil⟩
  refine ⟨psum_WF hall, ?_⟩
  rw [pEval_psum y hall]
  clear hall
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF_cons] at hp
    rw [List.filterMap_cons, pEval_cons, List.filter_cons]
    by_cases h : e.1.foldl (· + ·) 0 < drop
    · simp only [h, ite_true, decide_true, List.map_cons, List.sum_cons]
      rw [ih hp.2]; ring
    · simp only [h, ite_false, decide_false, Bool.false_eq_true, List.map_cons, List.sum_cons]
      rw [mul_add, ih hp.2, pEval_cons, pEval_nil, add_zero, fval_fsmul]
      have ht := (face_term i hi sg drop e.1 hp.1.1 (by omega) y).2
      rw [← ht]; ring

/-- `faceSub … 0`: the value at the lifted point. -/
theorem faceSub0 (i : ℕ) (hi : i < 3) (sg : ℤ) (y : Fin 3 → ℝ) {p : Poly} (hp : WF ps p) :
    WF ps (faceSub i sg 0 p) ∧ pEval ps (faceSub i sg 0 p) y = pEval ps p (lift i sg y) := by
  obtain ⟨h1, h2⟩ := faceSub_spec i hi sg 0 y p hp
  refine ⟨h1, ?_⟩
  rw [pow_zero, one_mul] at h2
  rw [h2]
  simp

/-- `faceSub … 1`: `ρ · value = value at the lifted point − value at 0`. -/
theorem faceSub1 (i : ℕ) (hi : i < 3) (sg : ℤ) (y : Fin 3 → ℝ) {p : Poly} (hp : WF ps p) :
    WF ps (faceSub i sg 1 p) ∧
    y 0 * pEval ps (faceSub i sg 1 p) y
      = pEval ps p (lift i sg y) - fval ps (constTerm (2 ^ ps.length) p) := by
  obtain ⟨h1, h2⟩ := faceSub_spec i hi sg 1 y p hp
  refine ⟨h1, ?_⟩
  rw [pow_one] at h2
  rw [h2, ← pEval_zero hp]
  congr 1
  clear h1 h2
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF_cons] at hp
    rw [List.filter_cons, pEval_cons, monoEval_zero hp.1.1, ← ih hp.2]
    obtain ⟨a, b, c, he⟩ := List.length_eq_three.1 hp.1.1
    have hs : e.1.foldl (· + ·) 0 = a + b + c := by rw [he]; simp
    by_cases h0 : a + b + c = 0
    · have ha : a = 0 := by omega
      have hb : b = 0 := by omega
      have hc : c = 0 := by omega
      have hz : e.1 = z3 := by rw [he, ha, hb, hc]; rfl
      have hlt : e.1.foldl (· + ·) 0 < 1 := by omega
      simp only [ite_true, hz, beq_self_eq_true]
      simp only [show decide (List.foldl (· + ·) 0 z3 < 1) = true from rfl, ite_true, List.map_cons,
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

/-! ## `pmulAff` -/

theorem incAt_len {m : Mono} (hm : m.length = 3) (i : ℕ) : (incAt m i).length = 3 := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  rcases i with _ | _ | _ | i <;> simp [incAt]

theorem monoEval_incAt {m : Mono} (hm : m.length = 3) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    monoEval (incAt m i) s = s ⟨i, hi⟩ * monoEval m s := by
  obtain ⟨a, b, c, rfl⟩ := List.length_eq_three.1 hm
  interval_cases i <;> simp only [incAt, monoEval_three] <;> simp <;> ring

theorem mapInc_spec (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    ∀ p : Poly, WF ps p → WF ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) ∧
      pEval ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) s = s ⟨i, hi⟩ * pEval ps p s := by
  intro p hp
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF_cons] at hp
    obtain ⟨h1, h2⟩ := ih hp.2
    refine ⟨WF_cons.2 ⟨⟨incAt_len hp.1.1 i, hp.1.2⟩, h1⟩, ?_⟩
    rw [List.map_cons, pEval_cons, h2, pEval_cons, monoEval_incAt hp.1.1 i hi]
    ring

theorem pmulAff_spec {p : Poly} (hp : WF ps p) (c w : ℤ) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    WF ps (pmulAff p c w i) ∧ pEval ps (pmulAff p c w i) s = (c + w * s ⟨i, hi⟩) * pEval ps p s := by
  have hm : pmulAff p c w i =
      padd (psmulZ c p) (psmulZ w (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2)))) := rfl
  obtain ⟨h1, h2⟩ := mapInc_spec i hi s p hp
  rw [hm]
  refine ⟨padd_WF (psmulZ_WF c hp) (psmulZ_WF w h1), ?_⟩
  rw [pEval_padd s (psmulZ_WF c hp) (psmulZ_WF w h1), pEval_psmulZ s c, pEval_psmulZ s w, h2]
  ring

theorem pmulAff_pow (c w : ℤ) (i : ℕ) (hi : i < 3) (s : Fin 3 → ℝ) :
    ∀ (n : ℕ) (p : Poly), WF ps p →
    WF ps ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) ∧
    pEval ps ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) s
      = (c + w * s ⟨i, hi⟩) ^ n * pEval ps p s := by
  intro n
  induction n with
  | zero => intro p hp; simp [hp]
  | succ n ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := pmulAff_spec h1 c w i hi s
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-! ## The decomposition along `maskp` -/

/-- The square-free products in the order of the recursion of `fmul` / `fval`. -/
def maskOf : List ℕ → List ℕ
  | [] => [1]
  | p :: ps => maskOf ps ++ (maskOf ps).map (p * ·)

theorem maskOf_length : ∀ ps : List ℕ, (maskOf ps).length = 2 ^ ps.length
  | [] => rfl
  | p :: ps => by
    rw [maskOf, List.length_append, List.length_map, maskOf_length ps, List.length_cons, Nat.pow_succ]
    ring

example : maskOf [5, 2] = [1, 2, 5, 10] := rfl

/-- `Σ_m a_m √(mask_m)`. -/
noncomputable def cval (mask : List ℕ) (a : FE) : ℝ :=
  ((List.zip a mask).map fun x => ((x.1 : ℤ) : ℝ) * √((x.2 : ℕ) : ℝ)).sum

@[simp] theorem cval_nil (a : FE) : cval [] a = 0 := by simp [cval]

@[simp] theorem cval_cons (m : ℕ) (ms : List ℕ) (c : ℤ) (a : FE) :
    cval (m :: ms) (c :: a) = c * √(m : ℝ) + cval ms a := by
  simp [cval]

theorem cval_append {a b : FE} {m n : List ℕ} (h : a.length = m.length) :
    cval (m ++ n) (a ++ b) = cval m a + cval n b := by
  simp [cval, List.zip_append h]

theorem cval_map_mul (p : ℕ) (m : List ℕ) (a : FE) :
    cval (m.map (p * ·)) a = √(p : ℝ) * cval m a := by
  rw [cval, cval, List.zip_map_right, List.map_map, ← List.sum_map_mul_left]
  congr 1
  apply List.map_congr_left
  intro x _
  simp only [Function.comp_apply, Prod.map_fst, Prod.map_snd, id]
  push_cast
  rw [Real.sqrt_mul (Nat.cast_nonneg p)]
  ring

/-- **The value is the sum along `maskOf ps`.** -/
theorem fval_mask : ∀ (ps : List ℕ) (a : FE), Len ps a → fval ps a = cval (maskOf ps) a
  | [], a, ha => by
    obtain ⟨x, rfl⟩ := len_one ha
    simp [fval, maskOf]
  | p :: ps, a, ha => by
    have h0 := len_take ha
    have h1 := len_drop ha
    rw [fval_cons, fval_mask ps _ h0, fval_mask ps _ h1, maskOf]
    conv_rhs => rw [← List.take_append_drop (a.length / 2) a]
    rw [cval_append (by rw [h0, maskOf_length]), cval_map_mul]

/-! ## The bracket of the square roots -/

/-- `sqb` brackets `K √mask_m` componentwise. -/
def BracketG (sqb : List (ℤ × ℤ)) (mask : List ℕ) (K : ℝ) : Prop :=
  sqb.length = mask.length ∧
    ∀ x ∈ List.zip sqb mask, (x.1.1 : ℝ) ≤ K * √(x.2 : ℝ) ∧ K * √(x.2 : ℝ) ≤ x.1.2

/-- One step of the fold in `loHi`. -/
def loStep : ℤ × ℤ → ℤ × (ℤ × ℤ) → ℤ × ℤ := fun acc x =>
  let (cm, (a, b)) := x
  if cm > 0 then (acc.1 + cm * a, acc.2 + cm * b)
  else if cm < 0 then (acc.1 + cm * b, acc.2 + cm * a)
  else acc

theorem loHi_eq (sqb : List (ℤ × ℤ)) (c : FE) :
    loHi sqb c = (List.zip c sqb).foldl loStep (0, 0) := rfl

theorem loStep_bd (acc : ℤ × ℤ) (X v : ℝ) (cm a b : ℤ) (h1 : (acc.1 : ℝ) ≤ X) (h2 : X ≤ acc.2)
    (hav : (a : ℝ) ≤ v) (hvb : v ≤ b) :
    ((loStep acc (cm, (a, b))).1 : ℝ) ≤ X + cm * v ∧ X + cm * v ≤ (loStep acc (cm, (a, b))).2 := by
  rcases lt_trichotomy cm 0 with h | h | h
  · have hn : ¬ cm > 0 := by omega
    have hc : (cm : ℝ) < 0 := by exact_mod_cast h
    simp only [loStep, hn, h, ite_false, ite_true]
    push_cast
    constructor <;> nlinarith
  · subst h
    simp [loStep, h1, h2]
  · have hc : (0 : ℝ) < cm := by exact_mod_cast h
    simp only [loStep, gt_iff_lt, h, ite_true]
    push_cast
    constructor <;> nlinarith

theorem loFold_bd (K : ℝ) : ∀ (c : FE) (sqb : List (ℤ × ℤ)) (mask : List ℕ), BracketG sqb mask K →
    c.length = mask.length → ∀ (acc : ℤ × ℤ) (X : ℝ), (acc.1 : ℝ) ≤ X → X ≤ acc.2 →
    (((List.zip c sqb).foldl loStep acc).1 : ℝ) ≤ X + K * cval mask c ∧
      X + K * cval mask c ≤ ((List.zip c sqb).foldl loStep acc).2
  | [], sqb, mask, _, hc, acc, X, h1, h2 => by
    simp only [List.zip_nil_left, List.foldl_nil]
    simp [cval, h1, h2]
  | cm :: c, sqb, mask, hb, hc, acc, X, h1, h2 => by
    obtain ⟨hl, hx⟩ := hb
    match sqb, mask, hl, hx, hc with
    | (a, b) :: sqb, m :: mask, hl, hx, hc =>
      have hm := hx ((a, b), m) (by simp)
      have hb' : BracketG sqb mask K :=
        ⟨by simpa using hl, fun y hy => hx y (List.mem_cons_of_mem _ hy)⟩
      obtain ⟨s1, s2⟩ := loStep_bd acc X (K * √(m : ℝ)) cm a b h1 h2 hm.1 hm.2
      have ih := loFold_bd K c sqb mask hb' (by simpa using hc) _ _ s1 s2
      rw [List.zip_cons_cons, List.foldl_cons, cval_cons]
      have e : X + cm * (K * √(m : ℝ)) + K * cval mask c = X + K * (cm * √(m : ℝ) + cval mask c) := by
        ring
      rw [← e]
      exact ih
    | _, [], _, _, hc => simp at hc
    | [], _ :: _, hl, _, _ => simp at hl

/-- **`loHi` brackets `K · value`.** -/
theorem loHi_spec {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) {c : FE}
    (hc : Len ps c) :
    ((loHi sqb c).1 : ℝ) ≤ K * fval ps c ∧ K * fval ps c ≤ (loHi sqb c).2 := by
  have h := loFold_bd K c sqb (maskOf ps) hb (by rw [hc, maskOf_length]) (0, 0) 0 (by simp) (by simp)
  rw [loHi_eq, fval_mask ps c hc]
  simpa using h

/-- `sqbOk` gives the bracket with `K = 2 ^ sqk` (when `maskp = maskOf ps`). -/
theorem bracket_of_sqbOk {P : PackLean.D16.Prob} (h : PackLean.D16.sqbOk P = true) :
    BracketG P.sqb P.maskp ((2 : ℝ) ^ P.sqk) := by
  simp only [PackLean.D16.sqbOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨⟨h1, h2⟩, _⟩, h4⟩ := h
  refine ⟨by rw [h1, h2], ?_⟩
  intro x hx
  obtain ⟨⟨a, b⟩, p⟩ := x
  have hx' := h4 _ hx
  simp only at hx' ⊢
  have hK : (0 : ℝ) ≤ 2 ^ P.sqk := by positivity
  have hsq : (2 : ℝ) ^ P.sqk * √(p : ℝ) = √((p : ℝ) * 4 ^ P.sqk) := by
    rw [Real.sqrt_mul (Nat.cast_nonneg p), show (4 : ℝ) ^ P.sqk = ((2 : ℝ) ^ P.sqk) ^ 2 by
      rw [← pow_mul, mul_comm, pow_mul]; norm_num, Real.sqrt_sq hK]
    ring
  split_ifs at hx' with hp1
  · have hp : (p : ℤ) = 1 := hp1
    simp only [Bool.and_eq_true, beq_iff_eq] at hx'
    obtain ⟨rfl, rfl⟩ := hx'
    have : (p : ℝ) = 1 := by exact_mod_cast hp
    rw [this, Real.sqrt_one]
    push_cast
    simp
  · simp only [Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq] at hx'
    obtain ⟨⟨⟨ha0, rfl⟩, hlo⟩, hhi⟩ := hx'
    have hlo' : (a : ℝ) * a ≤ (p : ℝ) * 4 ^ P.sqk := by exact_mod_cast hlo
    have hhi' : (p : ℝ) * 4 ^ P.sqk < ((a + 1 : ℤ) : ℝ) * ((a + 1 : ℤ) : ℝ) := by exact_mod_cast hhi
    have ha0' : (0 : ℝ) ≤ a := by exact_mod_cast ha0
    rw [hsq]
    constructor
    · exact Real.le_sqrt_of_sq_le (by nlinarith)
    · rw [Real.sqrt_le_left]
      · nlinarith
      · push_cast; linarith

/-! ## Lower bounds -/

theorem term_lb {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) (m : Mono) (a : FE)
    (hm : m.length = 3) (ha : Len ps a) (s : Fin 3 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((monoLb (if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2)
      (loHi sqb a) : ℤ) : ℝ) ≤ K * (fval ps a * monoEval m s) := by
  obtain ⟨hlo, hhi⟩ := loHi_spec hb ha
  obtain ⟨p, q, r, rfl⟩ := List.length_eq_three.1 hm
  rw [monoEval_three]
  set lo := (loHi sqb a).1
  set hi := (loHi sqb a).2
  set v := K * fval ps a with hv
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

/-- The fold of `monoLb` (the last step of `shiftLb3`, `lbPoly`) is a lower bound on `[-1, 1]³`. -/
theorem lbFold_le {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) {p : Poly}
    (hp : WF ps p) (s : Fin 3 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) 0 : ℤ) : ℝ) ≤ K * pEval ps p s := by
  suffices h : ∀ (acc : ℤ), ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) acc : ℤ) : ℝ) ≤ acc + K * pEval ps p s by
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
    have := term_lb hb e.1 e.2 hp.1.1 hp.1.2 s hs
    rw [pEval_cons]
    linarith

/-! ## The box test `shiftLb3` -/

theorem shift_term (C W : List ℤ) (hC : C.length = 3) (hW : W.length = 3) (D : ℤ) (hdeg : ℕ)
    (s : Fin 3 → ℝ) (e : Mono × FE) (he : e.1.length = 3 ∧ Len ps e.2)
    (hd : e.1.foldl (· + ·) 0 ≤ hdeg) (hD : (D : ℝ) ≠ 0) :
    WF ps ((List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) ∧
    pEval ps ((List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) s
      = (D : ℝ) ^ hdeg * (fval ps e.2 * monoEval e.1
          (fun k => (((nth C k 0 : ℤ) : ℝ) + ((nth W k 0 : ℤ) : ℝ) * s k) / D)) := by
  obtain ⟨m, a⟩ := e
  simp only at he hd ⊢
  obtain ⟨m0, m1, m2, rfl⟩ := List.length_eq_three.1 he.1
  obtain ⟨c0, c1, c2', rfl⟩ := List.length_eq_three.1 hC
  obtain ⟨w0, w1, w2, rfl⟩ := List.length_eq_three.1 hW
  have hsum : [m0, m1, m2].foldl (· + ·) 0 = m0 + m1 + m2 := by simp
  simp only [hsum] at hd ⊢
  have hbase : WF ps ([(z3, fsmul (D ^ (hdeg - (m0 + m1 + m2))) a)] : Poly) := by
    simp [z3, len_fsmul _ he.2]
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil, nth, List.getD_cons_zero, List.getD_cons_succ]
  obtain ⟨a1, a2⟩ := pmulAff_pow c0 w0 0 (by norm_num) s m0 _ hbase
  obtain ⟨b1, b2⟩ := pmulAff_pow c1 w1 1 (by norm_num) s m1 _ a1
  obtain ⟨d1, d2⟩ := pmulAff_pow c2' w2 2 (by norm_num) s m2 _ b1
  refine ⟨d1, ?_⟩
  rw [d2, b2, a2, monoEval_three]
  simp only [pEval_cons, pEval_nil, add_zero, fval_fsmul, z3, monoEval_three, pow_zero, mul_one]
  have hD12 : (D : ℝ) ^ hdeg = (D : ℝ) ^ (hdeg - (m0 + m1 + m2)) * D ^ m0 * D ^ m1 * D ^ m2 := by
    rw [mul_assoc, mul_assoc, ← pow_add, ← pow_add, ← pow_add]
    congr 1; omega
  rw [hD12, div_pow, div_pow, div_pow]
  push_cast
  field_simp
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, List.getD_cons_zero, List.getD_cons_succ]
  ring

/-- **The box test.** If `shiftLb3 P D H lo hi = some v`, then `v ≤ K · D^8 · H(z / D)` at every point
`z` of the box `[lo, hi]` (with the bracket of `P.sqb`). -/
theorem shiftLb3_spec {P : PackLean.D16.Prob} {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : WF P.ps H) {lo hi : List ℤ} (hlo : lo.length = 3)
    (hhi : hi.length = 3)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLb3 P D H lo hi = some v) (z : Fin 3 → ℝ)
    (hzb : ∀ k : Fin 3, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    (v : ℝ) ≤ K * ((D : ℝ) ^ 8 * pEval P.ps H (fun k => z k / D)) := by
  obtain ⟨l0, l1, l2, rfl⟩ := List.length_eq_three.1 hlo
  obtain ⟨h0, h1, h2, rfl⟩ := List.length_eq_three.1 hhi
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, List.all_cons, List.all_nil,
    Bool.and_true, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, id] at hz
  obtain ⟨⟨e0, f0⟩, ⟨e1, f1⟩, ⟨e2, f2⟩⟩ := hz
  have ax : ∀ (l h : ℤ) (zk : ℝ), l < h → (h - l) % 2 = 0 → (l : ℝ) ≤ zk → zk ≤ h →
      ∃ sk : ℝ, |sk| ≤ 1 ∧ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * sk = zk := by
    intro l h zk hlh he hl hh
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
  have hz0 := hzb 0
  have hz1 := hzb 1
  have hz2 := hzb 2
  simp only [nth, Fin.isValue, Fin.val_zero, Fin.val_one, Fin.val_two, List.getD_cons_zero,
    List.getD_cons_succ] at hz0 hz1 hz2
  obtain ⟨s0, hs0, hq0⟩ := ax l0 h0 (z 0) e0 f0 hz0.1 hz0.2
  obtain ⟨s1, hs1, hq1⟩ := ax l1 h1 (z 1) e1 f1 hz1.1 hz1.2
  obtain ⟨s2, hs2, hq2⟩ := ax l2 h2 (z 2) e2 f2 hz2.1 hz2.2
  set s : Fin 3 → ℝ := ![s0, s1, s2] with hsdef
  have hs : ∀ i, |s i| ≤ 1 := fun i => by fin_cases i <;> simpa [hsdef]
  have hCs : ∀ k : Fin 3,
      ((nth (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2]) k 0 : ℤ) : ℝ) +
      ((nth (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) k 0 : ℤ) : ℝ) * s k
        = z k := by
    intro k
    fin_cases k
    · simpa [hsdef, nth] using hq0
    · simpa [hsdef, nth] using hq1
    · simpa [hsdef, nth] using hq2
  have hDr : (D : ℝ) ≠ 0 := by exact_mod_cast hD.ne'
  unfold shiftLb3 at hv
  simp only at hv
  split_ifs at hv with hdeg
  simp only [Option.some.injEq] at hv
  have hdeg' : ∀ e ∈ H, e.1.foldl (· + ·) 0 ≤ 8 := by
    intro e he
    by_contra hc
    exact hdeg (List.any_eq_true.2 ⟨e, he, by simp; omega⟩)
  have hall := fun e (he : e ∈ H) => shift_term
    (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2])
    (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) (by simp) (by simp) D 8 s e
    (hH e he) (hdeg' e he) hDr
  have hWF : ∀ q ∈ H.map (fun (e : Mono × FE) =>
      (List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2
        (nth (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0)
        (nth (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (8 - e.1.foldl (· + ·) 0)) e.2)] : Poly)), WF P.ps q := by
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨e, he, rfl⟩ := hq
    exact (hall e he).1
  have hlb := lbFold_le hb (psum_WF hWF) s hs
  rw [pEval_psum s hWF, List.map_map] at hlb
  have hsum : (H.map ((pEval P.ps · s) ∘ fun (e : Mono × FE) =>
      (List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2
        (nth (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0)
        (nth (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (8 - e.1.foldl (· + ·) 0)) e.2)] : Poly))).sum
      = (D : ℝ) ^ 8 * pEval P.ps H (fun k => z k / D) := by
    rw [pEval, ← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro e he
    simp only [Function.comp_apply]
    rw [(hall e he).2]
    congr 3
    funext k
    rw [hCs k]
  rw [hsum] at hlb
  rw [← hv]
  exact hlb

/-- The strict form (`lbPos … true`): `v > 0` ⇒ `H > 0` on the box. -/
theorem shiftLb3_pos {P : PackLean.D16.Prob} {K : ℝ} (hK : 0 < K) (hb : BracketG P.sqb (maskOf P.ps) K)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : WF P.ps H) {lo hi : List ℤ} (hlo : lo.length = 3)
    (hhi : hi.length = 3)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLb3 P D H lo hi = some v) (hv0 : 0 < v) (z : Fin 3 → ℝ)
    (hzb : ∀ k : Fin 3, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    0 < pEval P.ps H (fun k => z k / D) := by
  have h := shiftLb3_spec hb hD hH hlo hhi hz hv z hzb
  have hv' : (0 : ℝ) < v := by exact_mod_cast hv0
  have hD8 : (0 : ℝ) < (D : ℝ) ^ 8 := by positivity
  by_contra hneg
  push Not at hneg
  have : K * ((D : ℝ) ^ 8 * pEval P.ps H (fun k => z k / D)) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hK.le (mul_nonpos_of_nonneg_of_nonpos hD8.le hneg)
  linarith

/-- The weak form (`lbPos … false`): `v ≥ 0` ⇒ `H ≥ 0` on the box. -/
theorem shiftLb3_nonneg {P : PackLean.D16.Prob} {K : ℝ} (hK : 0 < K)
    (hb : BracketG P.sqb (maskOf P.ps) K)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : WF P.ps H) {lo hi : List ℤ} (hlo : lo.length = 3)
    (hhi : hi.length = 3)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLb3 P D H lo hi = some v) (hv0 : 0 ≤ v) (z : Fin 3 → ℝ)
    (hzb : ∀ k : Fin 3, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    0 ≤ pEval P.ps H (fun k => z k / D) := by
  have h := shiftLb3_spec hb hD hH hlo hhi hz hv z hzb
  have hv' : (0 : ℝ) ≤ v := by exact_mod_cast hv0
  have hD8 : (0 : ℝ) < (D : ℝ) ^ 8 := by positivity
  by_contra hneg
  push Not at hneg
  have : K * ((D : ℝ) ^ 8 * pEval P.ps H (fun k => z k / D)) < 0 :=
    mul_neg_of_pos_of_neg hK (mul_neg_of_pos_of_neg hD8 hneg)
  linarith

#assert_std_axioms PackLean.Formal.PolySemG.pmul_spec PackLean.Formal.PolySemG.faceSub1
  PackLean.Formal.PolySemG.fval_mask PackLean.Formal.PolySemG.bracket_of_sqbOk
  PackLean.Formal.PolySemG.shiftLb3_pos PackLean.Formal.PolySemG.shiftLb3_nonneg

end PackLean.Formal.PolySemG
