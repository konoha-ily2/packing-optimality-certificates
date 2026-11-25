import PackLean.Formal.PolySemG
import PackLean.D28.Core

/-!
# A9 stage 7b-3 (part 1): the sparse polynomials of `D28.Core` in five variables

`PolySemG` is the meaning of the sparse polynomials of `D16.Core` (three variables).  The local
check of `D28.Core` (`localParts`, `faceH`, `shiftLb`) works with five variables
`z = (ξ, y, p₁, p₂, p₃)` and with the pairs `PQ` (numerator polynomial, common denominator).  This
file is the copy of `PolySemG` for five variables (the proofs are the same with `3` replaced by `5`).

* `pEval5 ps p x`, invariant `WF5 ps p` (5 exponents, coefficient of length `2 ^ ps.length`);
* `padd`, `psmulZ`, `psum`, `pmul ps`, `psmulF ps`, `pmulAff`, `constTerm` respect it;
* `PQv ps x A v`: the pair `A` is well formed with value `v` at `x` (`pEval5 A.p x = A.d · v`,
  `A.d > 0`), and `PQ.add`, `PQ.mul`, `PQ.scale`, `PQ.const`, `PQ.var` respect it;
* `shiftLb_spec`: the box test `shiftLb` of `D28.Core` is a lower bound of `K · D⁶ · H(z / D)` on
  its box (`shiftLb_pos`: `v > 0 ⇒ H > 0`).
-/

namespace PackLean.Formal.PolySem5

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fone fIsZero fmul loHi monoLb Mono Poly padd
  paddF psum pmul psmulZ psmulF incAt pmulAff monoLt nth zeroMono constTerm shiftLb PQ QF)
open PackLean.Formal.FieldSem
open PackLean.Formal.PolySemG (BracketG maskOf loHi_spec)

/-- The value of a monomial (5 exponents) at `x`. -/
noncomputable def m5 (m : Mono) (x : Fin 5 → ℝ) : ℝ := ∏ i : Fin 5, x i ^ (m.getD i 0)

/-- Value of a polynomial at `x` (coefficients in `ℚ(√ps)`). -/
noncomputable def pEval5 (ps : List ℕ) (p : Poly) (x : Fin 5 → ℝ) : ℝ :=
  (p.map fun e => fval ps e.2 * m5 e.1 x).sum

/-- The invariant: 5 exponents per monomial, `2 ^ ps.length` components per coefficient. -/
def WF5 (ps : List ℕ) (p : Poly) : Prop := ∀ e ∈ p, e.1.length = 5 ∧ Len ps e.2

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

variable {ps : List ℕ} (x : Fin 5 → ℝ)

@[simp] theorem pEval5_nil : pEval5 ps [] x = 0 := rfl

@[simp] theorem pEval5_cons (e : Mono × FE) (p : Poly) :
    pEval5 ps (e :: p) x = fval ps e.2 * m5 e.1 x + pEval5 ps p x := by
  simp [pEval5]

theorem pEval5_append (p q : Poly) : pEval5 ps (p ++ q) x = pEval5 ps p x + pEval5 ps q x := by
  simp [pEval5]

@[simp] theorem WF5_nil : WF5 ps [] := fun _ h => by simp at h

@[simp] theorem WF5_cons {e : Mono × FE} {p : Poly} :
    WF5 ps (e :: p) ↔ (e.1.length = 5 ∧ Len ps e.2) ∧ WF5 ps p := by
  simp [WF5]

theorem WF5_append {p q : Poly} (hp : WF5 ps p) (hq : WF5 ps q) : WF5 ps (p ++ q) := by
  intro e he
  rcases List.mem_append.1 he with h | h
  · exact hp e h
  · exact hq e h

/-! ## Sums -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), WF5 ps p → WF5 ps q →
    WF5 ps (paddF f p q) ∧ pEval5 ps (paddF f p q) x = pEval5 ps p x + pEval5 ps q x
  | 0, p, q, hp, hq => by
    rw [paddF]; exact ⟨WF5_append hp hq, pEval5_append x p q⟩
  | f + 1, [], q, _, hq => by
    rw [paddF]; exact ⟨hq, by simp⟩
  | f + 1, e :: p, [], hp, _ => by
    rw [paddF] <;> first | exact ⟨hp, by simp⟩ | simp
  | f + 1, (m, a) :: p, (n, b) :: q, hp, hq => by
    rw [WF5_cons] at hp hq
    rw [paddF]
    split_ifs with h1 h2
    · have hmn : m = n := beq_iff_eq.1 h1
      subst hmn
      obtain ⟨ih1, ih2⟩ := paddF_spec f p q hp.2 hq.2
      refine ⟨WF5_cons.2 ⟨⟨hp.1.1, len_fadd hp.1.2 hq.1.2⟩, ih1⟩, ?_⟩
      simp only [pEval5_cons, ih2, fval_fadd hp.1.2 hq.1.2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f p ((n, b) :: q) hp.2 (WF5_cons.2 hq)
      refine ⟨WF5_cons.2 ⟨hp.1, ih1⟩, ?_⟩
      simp only [pEval5_cons, ih2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f ((m, a) :: p) q (WF5_cons.2 hp) hq.2
      refine ⟨WF5_cons.2 ⟨hq.1, ih1⟩, ?_⟩
      simp only [pEval5_cons] at ih2 ⊢
      rw [ih2]
      ring

theorem padd_WF {p q : Poly} (hp : WF5 ps p) (hq : WF5 ps q) : WF5 ps (padd p q) :=
  (paddF_spec (fun _ => 0) _ p q hp hq).1

theorem pEval5_padd {p q : Poly} (hp : WF5 ps p) (hq : WF5 ps q) :
    pEval5 ps (padd p q) x = pEval5 ps p x + pEval5 ps q x :=
  (paddF_spec x _ p q hp hq).2

theorem psmulZ_WF (c : ℤ) {p : Poly} (hp : WF5 ps p) : WF5 ps (psmulZ c p) := by
  intro e he
  simp only [psmulZ, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fsmul c (hp _ hma).2⟩

theorem pEval5_psmulZ (c : ℤ) (p : Poly) : pEval5 ps (psmulZ c p) x = c * pEval5 ps p x := by
  induction p with
  | nil => simp [psmulZ]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    simp only [psmulZ, List.map_cons, pEval5_cons] at ih ⊢
    rw [ih, fval_fsmul]
    ring

theorem foldl_padd_spec (l : List Poly) : ∀ acc : Poly, WF5 ps acc → (∀ p ∈ l, WF5 ps p) →
    WF5 ps (l.foldl padd acc) ∧
      pEval5 ps (l.foldl padd acc) x = pEval5 ps acc x + (l.map (pEval5 ps · x)).sum := by
  induction l with
  | nil => intro acc h _; simp [h]
  | cons p l ih =>
    intro acc hacc hl
    have hp := hl p (by simp)
    obtain ⟨h1, h2⟩ := ih (padd acc p) (padd_WF hacc hp) (fun q hq => hl q (by simp [hq]))
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEval5_padd x hacc hp, List.map_cons, List.sum_cons]
    ring

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WF5 ps p) : WF5 ps (psum l) :=
  (foldl_padd_spec (fun _ => 0) l [] WF5_nil hl).1

theorem pEval5_psum {l : List Poly} (hl : ∀ p ∈ l, WF5 ps p) :
    pEval5 ps (psum l) x = (l.map (pEval5 ps · x)).sum := by
  rw [psum, (foldl_padd_spec x l [] WF5_nil hl).2]; simp

/-! ## Products -/

theorem inner_spec (m : Mono) (a : FE) (hm : m.length = 5) (ha : Len ps a) (q : Poly)
    (hq : WF5 ps q) :
    WF5 ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) ∧
    pEval5 ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) x
      = fval ps a * m5 m x * pEval5 ps q x := by
  induction q with
  | nil => simp
  | cons e q ih =>
    rw [WF5_cons] at hq
    obtain ⟨ih1, ih2⟩ := ih hq.2
    refine ⟨WF5_cons.2 ⟨⟨by simp [hm, hq.1.1], len_fmul ha hq.1.2⟩, ih1⟩, ?_⟩
    rw [List.map_cons, pEval5_cons, ih2, pEval5_cons, fval_fmul ha hq.1.2,
      m5_zipWith hm hq.1.1 x]
    ring

theorem pmul_spec {p q : Poly} (hp : WF5 ps p) (hq : WF5 ps q) :
    WF5 ps (pmul ps p q) ∧ pEval5 ps (pmul ps p q) x = pEval5 ps p x * pEval5 ps q x := by
  have hall : ∀ r ∈ p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2)), WF5 ps r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (inner_spec x e.1 e.2 (hp e he).1 (hp e he).2 q hq).1
  have hpm : pmul ps p q = psum (p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2))) := rfl
  rw [hpm]
  refine ⟨psum_WF hall, ?_⟩
  rw [pEval5_psum x hall, List.map_map]
  clear hall hpm
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF5_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, pEval5_cons, Function.comp_apply,
      (inner_spec x e.1 e.2 hp.1.1 hp.1.2 q hq).2]
    ring

theorem psmulF_WF {c : FE} (hc : Len ps c) {p : Poly} (hp : WF5 ps p) : WF5 ps (psmulF ps c p) := by
  intro e he
  simp only [psmulF, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fmul hc (hp _ hma).2⟩

theorem pEval5_psmulF {c : FE} (hc : Len ps c) {p : Poly} (hp : WF5 ps p) :
    pEval5 ps (psmulF ps c p) x = fval ps c * pEval5 ps p x := by
  induction p with
  | nil => simp [psmulF]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    rw [WF5_cons] at hp
    simp only [psmulF, List.map_cons, pEval5_cons] at ih ⊢
    rw [ih hp.2, fval_fmul hc hp.1.2]
    ring

/-! ## The constant term -/

theorem m5_zero {m : Mono} (hm : m.length = 5) :
    m5 m 0 = if m == zeroMono then 1 else 0 := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  rw [m5_five]
  simp only [Pi.zero_apply, zeroMono]
  by_cases ha : a = 0 <;> by_cases hb : b = 0 <;> by_cases hc : c = 0 <;> by_cases hd : d = 0 <;>
    by_cases he : e = 0 <;> simp [ha, hb, hc, hd, he]

theorem constTerm_spec (p : Poly) (hp : WF5 ps p) : ∀ acc : FE, Len ps acc →
    Len ps (p.foldl (fun acc (x : Mono × FE) => if x.1 == zeroMono then fadd acc x.2 else acc) acc) ∧
    fval ps (p.foldl (fun acc (x : Mono × FE) => if x.1 == zeroMono then fadd acc x.2 else acc) acc)
      = fval ps acc + pEval5 ps p 0 := by
  induction p with
  | nil => intro acc h; simp [h]
  | cons e p ih =>
    intro acc hacc
    rw [WF5_cons] at hp
    rw [List.foldl_cons, pEval5_cons, m5_zero hp.1.1]
    split_ifs with h
    · obtain ⟨h1, h2⟩ := ih hp.2 (fadd acc e.2) (len_fadd hacc hp.1.2)
      refine ⟨h1, ?_⟩
      rw [h2, fval_fadd hacc hp.1.2]; ring
    · obtain ⟨h1, h2⟩ := ih hp.2 acc hacc
      refine ⟨h1, ?_⟩
      rw [h2]; ring

/-- The value at `0` is the constant term. -/
theorem pEval5_zero {p : Poly} (hp : WF5 ps p) :
    pEval5 ps p 0 = fval ps (constTerm (2 ^ ps.length) p) := by
  have := (constTerm_spec p hp (fzero (2 ^ ps.length)) (len_fzero ps)).2
  rw [constTerm, this, fval_fzero]
  ring

/-! ## `pmulAff` -/

theorem incAt_len {m : Mono} (hm : m.length = 5) (i : ℕ) : (incAt m i).length = 5 := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  rcases i with _ | _ | _ | _ | _ | i <;> simp [incAt]

theorem m5_incAt {m : Mono} (hm : m.length = 5) (i : ℕ) (hi : i < 5) (s : Fin 5 → ℝ) :
    m5 (incAt m i) s = s ⟨i, hi⟩ * m5 m s := by
  obtain ⟨a, b, c, d, e, rfl⟩ := len5 hm
  interval_cases i <;> simp only [incAt, m5_five] <;> simp <;> ring

theorem mapInc_spec (i : ℕ) (hi : i < 5) (s : Fin 5 → ℝ) :
    ∀ p : Poly, WF5 ps p → WF5 ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) ∧
      pEval5 ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) s = s ⟨i, hi⟩ * pEval5 ps p s := by
  intro p hp
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WF5_cons] at hp
    obtain ⟨h1, h2⟩ := ih hp.2
    refine ⟨WF5_cons.2 ⟨⟨incAt_len hp.1.1 i, hp.1.2⟩, h1⟩, ?_⟩
    rw [List.map_cons, pEval5_cons, h2, pEval5_cons, m5_incAt hp.1.1 i hi]
    ring

theorem pmulAff_spec {p : Poly} (hp : WF5 ps p) (c w : ℤ) (i : ℕ) (hi : i < 5) (s : Fin 5 → ℝ) :
    WF5 ps (pmulAff p c w i) ∧
      pEval5 ps (pmulAff p c w i) s = (c + w * s ⟨i, hi⟩) * pEval5 ps p s := by
  have hm : pmulAff p c w i =
      padd (psmulZ c p) (psmulZ w (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2)))) := rfl
  obtain ⟨h1, h2⟩ := mapInc_spec i hi s p hp
  rw [hm]
  refine ⟨padd_WF (psmulZ_WF c hp) (psmulZ_WF w h1), ?_⟩
  rw [pEval5_padd s (psmulZ_WF c hp) (psmulZ_WF w h1), pEval5_psmulZ s c, pEval5_psmulZ s w, h2]
  ring

theorem pmulAff_pow (c w : ℤ) (i : ℕ) (hi : i < 5) (s : Fin 5 → ℝ) :
    ∀ (n : ℕ) (p : Poly), WF5 ps p →
    WF5 ps ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) ∧
    pEval5 ps ((List.range n).foldl (fun acc _ => pmulAff acc c w i) p) s
      = (c + w * s ⟨i, hi⟩) ^ n * pEval5 ps p s := by
  intro n
  induction n with
  | zero => intro p hp; simp [hp]
  | succ n ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := pmulAff_spec h1 c w i hi s
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-! ## Pairs `PQ` (numerator, common denominator) -/

/-- The value of `a : QF`. -/
noncomputable def qv (ps : List ℕ) (a : QF) : ℝ := fval ps a.num / a.den

/-- The pair `A` is well formed and has the value `v` at `x`. -/
def PQv (ps : List ℕ) (x : Fin 5 → ℝ) (A : PQ) (v : ℝ) : Prop :=
  WF5 ps A.p ∧ 0 < A.d ∧ pEval5 ps A.p x = A.d * v

theorem pqv_zero : PQv ps x ⟨[], 1⟩ 0 := ⟨WF5_nil, by norm_num, by simp⟩

theorem pqv_add {A B : PQ} {a b : ℝ} (hA : PQv ps x A a) (hB : PQv ps x B b) :
    PQv ps x (PQ.add A B) (a + b) := by
  obtain ⟨w1, d1, e1⟩ := hA
  obtain ⟨w2, d2, e2⟩ := hB
  refine ⟨padd_WF (psmulZ_WF _ w1) (psmulZ_WF _ w2), Nat.mul_pos d1 d2, ?_⟩
  simp only [PQ.add]
  rw [pEval5_padd x (psmulZ_WF _ w1) (psmulZ_WF _ w2), pEval5_psmulZ, pEval5_psmulZ, e1, e2]
  push_cast; ring

theorem pqv_mul {A B : PQ} {a b : ℝ} (hA : PQv ps x A a) (hB : PQv ps x B b) :
    PQv ps x (PQ.mul ps A B) (a * b) := by
  obtain ⟨w1, d1, e1⟩ := hA
  obtain ⟨w2, d2, e2⟩ := hB
  refine ⟨(pmul_spec x w1 w2).1, Nat.mul_pos d1 d2, ?_⟩
  simp only [PQ.mul]
  rw [(pmul_spec x w1 w2).2, e1, e2]
  push_cast; ring

theorem pqv_scale {c : QF} (hc : Len ps c.num) (hcd : 0 < c.den) {A : PQ} {a : ℝ}
    (hA : PQv ps x A a) : PQv ps x (PQ.scale ps c A) (qv ps c * a) := by
  obtain ⟨w1, d1, e1⟩ := hA
  refine ⟨psmulF_WF hc w1, Nat.mul_pos hcd d1, ?_⟩
  simp only [PQ.scale]
  rw [pEval5_psmulF x hc w1, e1, qv]
  have : (0 : ℝ) < c.den := by exact_mod_cast hcd
  push_cast
  field_simp

theorem pqv_const (nb : ℕ) {c : QF} (hc : Len ps c.num) (hcd : 0 < c.den) :
    PQv ps x (PQ.const nb c) (qv ps c) := by
  refine ⟨by simp [PQ.const, hc], hcd, ?_⟩
  simp only [PQ.const, pEval5_cons, pEval5_nil, m5_five, pow_zero, mul_one, add_zero, qv]
  have : (0 : ℝ) < c.den := by exact_mod_cast hcd
  field_simp

theorem pqv_var (i : ℕ) (hi : i < 5) : PQv ps x (PQ.var (2 ^ ps.length) i) (x ⟨i, hi⟩) := by
  have hl : (incAt [0, 0, 0, 0, 0] i).length = 5 := incAt_len (by rfl) i
  have h1 : fone (2 ^ ps.length) = fofInt (2 ^ ps.length) 1 := rfl
  refine ⟨by simp [PQ.var, hl, h1, len_fofInt], by simp [PQ.var], ?_⟩
  simp only [PQ.var, pEval5_cons, pEval5_nil, add_zero, h1, fval_fofInt]
  rw [m5_incAt (by rfl) i hi]
  simp [m5_five]

/-! ## Lower bounds -/

theorem getD_mem5 {m : Mono} (hm : m.length = 5) (i : Fin 5) : m.getD i 0 ∈ m := by
  rw [List.getD_eq_getElem _ _ (by rw [hm]; exact i.isLt)]
  exact List.getElem_mem _

theorem term_lb {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) (m : Mono) (a : FE)
    (hm : m.length = 5) (ha : Len ps a) (s : Fin 5 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((monoLb (if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2)
      (loHi sqb a) : ℤ) : ℝ) ≤ K * (fval ps a * m5 m s) := by
  obtain ⟨hlo, hhi⟩ := loHi_spec hb ha
  set lo := (loHi sqb a).1
  set hi := (loHi sqb a).2
  set v := K * fval ps a with hv
  rw [← mul_assoc, ← hv]
  have hmono : |m5 m s| ≤ 1 := by
    rw [m5, Finset.abs_prod]
    exact Finset.prod_le_one₀ (fun i _ => abs_nonneg _) (fun i _ => by
      rw [abs_pow]; exact pow_le_one₀ (abs_nonneg _) (hs i))
  split_ifs with h0 h1
  · have hall : ∀ i : Fin 5, m.getD i 0 = 0 := fun i => by
      have := List.all_eq_true.1 h0 _ (getD_mem5 hm i)
      simpa using this
    have : m5 m s = 1 := by
      unfold m5; exact Finset.prod_eq_one (fun i _ => by rw [hall i, pow_zero])
    simp only [monoLb, this, mul_one]
    exact hlo
  · have hev : ∀ i : Fin 5, m.getD i 0 % 2 = 0 := fun i => by
      have := List.all_eq_true.1 h1 _ (getD_mem5 hm i)
      simpa using this
    have hM0 : 0 ≤ m5 m s := Finset.prod_nonneg (fun i _ => (Nat.even_iff.2 (hev i)).pow_nonneg _)
    have hM1 : m5 m s ≤ 1 := le_trans (le_abs_self _) hmono
    simp only [monoLb]
    push_cast
    rcases le_total 0 v with hh | hh
    · have : 0 ≤ v * m5 m s := mul_nonneg hh hM0
      have : min 0 (lo : ℝ) ≤ 0 := min_le_left _ _
      linarith
    · have : v ≤ v * m5 m s := by nlinarith
      have : min 0 (lo : ℝ) ≤ lo := min_le_right _ _
      linarith
  · simp only [monoLb]
    push_cast
    have h2 := neg_abs_le (v * m5 m s)
    rw [abs_mul] at h2
    have h3 : |v| * |m5 m s| ≤ |v| := mul_le_of_le_one_right (abs_nonneg _) hmono
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

theorem lbFold_le {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) {p : Poly}
    (hp : WF5 ps p) (s : Fin 5 → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) 0 : ℤ) : ℝ) ≤ K * pEval5 ps p s := by
  suffices h : ∀ (acc : ℤ), ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) acc : ℤ) : ℝ) ≤ acc + K * pEval5 ps p s by
    have h0 := h 0
    rw [Int.cast_zero, zero_add] at h0
    exact h0
  induction p with
  | nil => intro acc; simp
  | cons e p ih =>
    intro acc
    rw [WF5_cons] at hp
    rw [List.foldl_cons]
    refine (ih hp.2 _).trans ?_
    push_cast
    have := term_lb hb e.1 e.2 hp.1.1 hp.1.2 s hs
    rw [pEval5_cons]
    linarith

/-! ## The box test `shiftLb` -/

theorem shift_term (C W : List ℤ) (hC : C.length = 5) (hW : W.length = 5) (D : ℤ) (hdeg : ℕ)
    (s : Fin 5 → ℝ) (e : Mono × FE) (he : e.1.length = 5 ∧ Len ps e.2)
    (hd : e.1.foldl (· + ·) 0 ≤ hdeg) (hD : (D : ℝ) ≠ 0) :
    WF5 ps ((List.zip (List.range 5) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(zeroMono, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) ∧
    pEval5 ps ((List.zip (List.range 5) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(zeroMono, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) s
      = (D : ℝ) ^ hdeg * (fval ps e.2 * m5 e.1
          (fun k => (((nth C k 0 : ℤ) : ℝ) + ((nth W k 0 : ℤ) : ℝ) * s k) / D)) := by
  obtain ⟨m, a⟩ := e
  simp only at he hd ⊢
  obtain ⟨m0, m1, m2, m3, m4, rfl⟩ := len5 he.1
  obtain ⟨c0, c1, c2, c3, c4, rfl⟩ := len5 hC
  obtain ⟨w0, w1, w2, w3, w4, rfl⟩ := len5 hW
  have hsum : [m0, m1, m2, m3, m4].foldl (· + ·) 0 = m0 + m1 + m2 + m3 + m4 := by simp
  simp only [hsum] at hd ⊢
  have hbase : WF5 ps ([(zeroMono, fsmul (D ^ (hdeg - (m0 + m1 + m2 + m3 + m4))) a)] : Poly) := by
    simp [zeroMono, len_fsmul _ he.2]
  simp only [show List.range 5 = [0, 1, 2, 3, 4] from rfl, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil, nth, List.getD_cons_zero, List.getD_cons_succ]
  obtain ⟨a1, a2⟩ := pmulAff_pow c0 w0 0 (by norm_num) s m0 _ hbase
  obtain ⟨b1, b2⟩ := pmulAff_pow c1 w1 1 (by norm_num) s m1 _ a1
  obtain ⟨d1, d2⟩ := pmulAff_pow c2 w2 2 (by norm_num) s m2 _ b1
  obtain ⟨f1, f2⟩ := pmulAff_pow c3 w3 3 (by norm_num) s m3 _ d1
  obtain ⟨g1, g2⟩ := pmulAff_pow c4 w4 4 (by norm_num) s m4 _ f1
  refine ⟨g1, ?_⟩
  rw [g2, f2, d2, b2, a2, m5_five]
  simp only [pEval5_cons, pEval5_nil, add_zero, fval_fsmul, zeroMono, m5_five, pow_zero, mul_one]
  have hD12 : (D : ℝ) ^ hdeg = (D : ℝ) ^ (hdeg - (m0 + m1 + m2 + m3 + m4)) * D ^ m0 * D ^ m1 *
      D ^ m2 * D ^ m3 * D ^ m4 := by
    rw [mul_assoc, mul_assoc, mul_assoc, mul_assoc, ← pow_add, ← pow_add, ← pow_add, ← pow_add,
      ← pow_add]
    congr 1; omega
  rw [hD12, div_pow, div_pow, div_pow, div_pow, div_pow]
  push_cast
  field_simp
  have e3 : ((3 : Fin 5) : ℕ) = 3 := rfl
  have e4 : ((4 : Fin 5) : ℕ) = 4 := rfl
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, e3, e4, List.getD_cons_zero,
    List.getD_cons_succ]
  ring

/-- `l < h`, `h − l` even, `l ≤ z ≤ h` ⇒ `z = (l + h)/2 + (h − l)/2 · s` with `|s| ≤ 1`. -/
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

/-- **The box test.** If `shiftLb P D H lo hi = some v`, then `v ≤ K · D⁶ · H(z / D)` at every point
`z` of the box `[lo, hi]` (with the bracket of `P.sqb`). -/
theorem shiftLb_spec {P : PackLean.D28.Prob} {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : WF5 P.ps H) {lo hi : List ℤ} (hlo : lo.length = 5)
    (hhi : hi.length = 5)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLb P D H lo hi = some v) (z : Fin 5 → ℝ)
    (hzb : ∀ k : Fin 5, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    (v : ℝ) ≤ K * ((D : ℝ) ^ 6 * pEval5 P.ps H (fun k => z k / D)) := by
  obtain ⟨l0, l1, l2, l3, l4, rfl⟩ := len5 hlo
  obtain ⟨h0, h1, h2, h3, h4, rfl⟩ := len5 hhi
  simp only [List.zipWith_cons_cons, List.zipWith_nil_left, List.all_cons, List.all_nil,
    Bool.and_true, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, id] at hz
  obtain ⟨⟨e0, f0⟩, ⟨e1, f1⟩, ⟨e2, f2⟩, ⟨e3, f3⟩, ⟨e4, f4⟩⟩ := hz
  have hz0 := hzb 0
  have hz1 := hzb 1
  have hz2 := hzb 2
  have hz3 := hzb 3
  have hz4 := hzb 4
  have v3 : ((3 : Fin 5) : ℕ) = 3 := rfl
  have v4 : ((4 : Fin 5) : ℕ) = 4 := rfl
  simp only [nth, Fin.isValue, Fin.val_zero, Fin.val_one, Fin.val_two, v3, v4, List.getD_cons_zero,
    List.getD_cons_succ] at hz0 hz1 hz2 hz3 hz4
  obtain ⟨s0, hs0, hq0⟩ := ax_param l0 h0 (z 0) e0 f0 hz0.1 hz0.2
  obtain ⟨s1, hs1, hq1⟩ := ax_param l1 h1 (z 1) e1 f1 hz1.1 hz1.2
  obtain ⟨s2, hs2, hq2⟩ := ax_param l2 h2 (z 2) e2 f2 hz2.1 hz2.2
  obtain ⟨s3, hs3, hq3⟩ := ax_param l3 h3 (z 3) e3 f3 hz3.1 hz3.2
  obtain ⟨s4, hs4, hq4⟩ := ax_param l4 h4 (z 4) e4 f4 hz4.1 hz4.2
  set s : Fin 5 → ℝ := ![s0, s1, s2, s3, s4] with hsdef
  have hs : ∀ i, |s i| ≤ 1 := fun i => by fin_cases i <;> simpa [hsdef]
  set Cl := List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2, l3, l4] [h0, h1, h2, h3, h4] with hCl
  set Wl := List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2, l3, l4] [h0, h1, h2, h3, h4] with hWl
  have hCs : ∀ k : Fin 5, ((nth Cl k 0 : ℤ) : ℝ) + ((nth Wl k 0 : ℤ) : ℝ) * s k = z k := by
    intro k
    fin_cases k
    · simpa [hsdef, nth, hCl, hWl] using hq0
    · simpa [hsdef, nth, hCl, hWl] using hq1
    · simpa [hsdef, nth, hCl, hWl] using hq2
    · simpa [hsdef, nth, hCl, hWl] using hq3
    · simpa [hsdef, nth, hCl, hWl] using hq4
  have hDr : (D : ℝ) ≠ 0 := by exact_mod_cast hD.ne'
  unfold shiftLb at hv
  simp only at hv
  split_ifs at hv with hdeg
  simp only [Option.some.injEq] at hv
  have hdeg' : ∀ e ∈ H, e.1.foldl (· + ·) 0 ≤ 6 := by
    intro e he
    by_contra hc
    exact hdeg (List.any_eq_true.2 ⟨e, he, by simp; omega⟩)
  have hall := fun e (he : e ∈ H) => shift_term Cl Wl (by simp [hCl]) (by simp [hWl]) D 6 s e
    (hH e he) (hdeg' e he) hDr
  have hWF : ∀ q ∈ H.map (fun (e : Mono × FE) =>
      (List.zip (List.range 5) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth Cl y.1 0) (nth Wl y.1 0) y.1) acc)
      ([(zeroMono, fsmul (D ^ (6 - e.1.foldl (· + ·) 0)) e.2)] : Poly)), WF5 P.ps q := by
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨e, he, rfl⟩ := hq
    exact (hall e he).1
  have hlb := lbFold_le hb (psum_WF hWF) s hs
  rw [pEval5_psum s hWF, List.map_map] at hlb
  have hsum : (H.map ((pEval5 P.ps · s) ∘ fun (e : Mono × FE) =>
      (List.zip (List.range 5) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth Cl y.1 0) (nth Wl y.1 0) y.1) acc)
      ([(zeroMono, fsmul (D ^ (6 - e.1.foldl (· + ·) 0)) e.2)] : Poly))).sum
      = (D : ℝ) ^ 6 * pEval5 P.ps H (fun k => z k / D) := by
    rw [pEval5, ← List.sum_map_mul_left]
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

/-- The strict form: `v > 0` ⇒ `H > 0` on the box. -/
theorem shiftLb_pos {P : PackLean.D28.Prob} {K : ℝ} (hK : 0 < K) (hb : BracketG P.sqb (maskOf P.ps) K)
    {D : ℤ} (hD : 0 < D) {H : Poly} (hH : WF5 P.ps H) {lo hi : List ℤ} (hlo : lo.length = 5)
    (hhi : hi.length = 5)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLb P D H lo hi = some v) (hv0 : 0 < v) (z : Fin 5 → ℝ)
    (hzb : ∀ k : Fin 5, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    0 < pEval5 P.ps H (fun k => z k / D) := by
  have h := shiftLb_spec hb hD hH hlo hhi hz hv z hzb
  have hv' : (0 : ℝ) < v := by exact_mod_cast hv0
  have hD6 : (0 : ℝ) < (D : ℝ) ^ 6 := by positivity
  by_contra hneg
  push Not at hneg
  have : K * ((D : ℝ) ^ 6 * pEval5 P.ps H (fun k => z k / D)) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hK.le (mul_nonpos_of_nonneg_of_nonpos hD6.le hneg)
  linarith

#assert_std_axioms PackLean.Formal.PolySem5.pmul_spec PackLean.Formal.PolySem5.shiftLb_pos
  PackLean.Formal.PolySem5.pqv_var PackLean.Formal.PolySem5.pEval5_zero

end PackLean.Formal.PolySem5
