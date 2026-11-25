import PackLean.Formal.BoxTree
import PackLean.Formal.PolySem5

/-!
# A9n: the sparse polynomials of `D28.Core` in `n` variables

`PolySem5` is the meaning of the sparse polynomials in five variables (the local check of
`D28.Core`).  The local tube of `D45DT` (`lamLb`) works with six variables, so this file states the
same lemmas with the number of variables `n` as an argument.  Nothing of `PolySem5` changes.

* `pEvalN n ps p x`, invariant `WFN n ps p` (`n` exponents, coefficient of length `2 ^ ps.length`);
  the monomial value is `BoxTree.monoN` (A9m);
* `padd`, `psmulZ`, `psum`, `pmul ps`, `psmulF ps`, `pmulAff` and the constant term respect it
  (`monoN_zero` with `List.replicate n 0` in place of `zeroMono`, `monoN_incAt`);
* lower bounds `term_lb`, `lbFold_le` (`getD_memN`);
* **the box test with the step as a parameter**: a step `st : Poly → ℕ → Poly` with
  `StepOk` (`st p i` has the value `g i · p`) is folded over the exponents of each monomial
  (`stepFold`, `shift_termN`); `shiftLbN_spec`: the sum of `monoLb` is a lower bound of
  `K · D^dmax · H(z / D)` on the box `[lo, hi]` (`lo ≤ hi`, `hi − lo` even; an axis with `lo = hi`
  is allowed).  The steps of `D28.shiftLb` (`pmulAff`, `step_pmulAff`) and of `D45DT.lamLb`
  (`psmulZ` when `w = 0`, `step_lam`) both satisfy `StepOk`.

Status (A9n): done (passed, 11/17 2026).  The `n = 6` use for `lamLb` was checked by a short example
outside the repository (`lamLb P D dmax H lo hi = some v ⇒ v ≤ K · D^dmax · H(z/D)` follows from
`shiftLbN_spec` and `step_lam` by `exact`, 29 s).  About 615 lines; `check.py` 33 s, standard axioms
only.  The `n = 5` lemmas of `PolySemN` are not used to restate `PolySem5` (its statements stay).
-/

namespace PackLean.Formal.PolySemN

open PackLean.D28 (FE fadd fsmul fzero fofInt fone fmul loHi monoLb Mono Poly padd paddF psum pmul
  psmulZ psmulF incAt pmulAff nth)
open PackLean.Formal.FieldSem
open PackLean.Formal.PolySemG (BracketG maskOf loHi_spec)
open PackLean.Formal.BoxTree (monoN monoN_zipWith)

/-- Value of a polynomial at `x : Fin n → ℝ` (coefficients in `ℚ(√ps)`). -/
noncomputable def pEvalN (n : ℕ) (ps : List ℕ) (p : Poly) (x : Fin n → ℝ) : ℝ :=
  (p.map fun e => fval ps e.2 * monoN n e.1 x).sum

/-- The invariant: `n` exponents per monomial, `2 ^ ps.length` components per coefficient. -/
def WFN (n : ℕ) (ps : List ℕ) (p : Poly) : Prop := ∀ e ∈ p, e.1.length = n ∧ Len ps e.2

variable {n : ℕ} {ps : List ℕ} (x : Fin n → ℝ)

@[simp] theorem pEvalN_nil : pEvalN n ps [] x = 0 := rfl

@[simp] theorem pEvalN_cons (e : Mono × FE) (p : Poly) :
    pEvalN n ps (e :: p) x = fval ps e.2 * monoN n e.1 x + pEvalN n ps p x := by
  simp [pEvalN]

theorem pEvalN_append (p q : Poly) : pEvalN n ps (p ++ q) x = pEvalN n ps p x + pEvalN n ps q x := by
  simp [pEvalN]

@[simp] theorem WFN_nil : WFN n ps [] := fun _ h => by simp at h

@[simp] theorem WFN_cons {e : Mono × FE} {p : Poly} :
    WFN n ps (e :: p) ↔ (e.1.length = n ∧ Len ps e.2) ∧ WFN n ps p := by
  simp [WFN]

theorem WFN_append {p q : Poly} (hp : WFN n ps p) (hq : WFN n ps q) : WFN n ps (p ++ q) := by
  intro e he
  rcases List.mem_append.1 he with h | h
  · exact hp e h
  · exact hq e h

/-! ## Sums -/

theorem paddF_spec : ∀ (f : ℕ) (p q : Poly), WFN n ps p → WFN n ps q →
    WFN n ps (paddF f p q) ∧ pEvalN n ps (paddF f p q) x = pEvalN n ps p x + pEvalN n ps q x
  | 0, p, q, hp, hq => by
    rw [paddF]; exact ⟨WFN_append hp hq, pEvalN_append x p q⟩
  | f + 1, [], q, _, hq => by
    rw [paddF]; exact ⟨hq, by simp⟩
  | f + 1, e :: p, [], hp, _ => by
    rw [paddF] <;> first | exact ⟨hp, by simp⟩ | simp
  | f + 1, (m, a) :: p, (n', b) :: q, hp, hq => by
    rw [WFN_cons] at hp hq
    rw [paddF]
    split_ifs with h1 h2
    · have hmn : m = n' := beq_iff_eq.1 h1
      subst hmn
      obtain ⟨ih1, ih2⟩ := paddF_spec f p q hp.2 hq.2
      refine ⟨WFN_cons.2 ⟨⟨hp.1.1, len_fadd hp.1.2 hq.1.2⟩, ih1⟩, ?_⟩
      simp only [pEvalN_cons, ih2, fval_fadd hp.1.2 hq.1.2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f p ((n', b) :: q) hp.2 (WFN_cons.2 hq)
      refine ⟨WFN_cons.2 ⟨hp.1, ih1⟩, ?_⟩
      simp only [pEvalN_cons, ih2]
      ring
    · obtain ⟨ih1, ih2⟩ := paddF_spec f ((m, a) :: p) q (WFN_cons.2 hp) hq.2
      refine ⟨WFN_cons.2 ⟨hq.1, ih1⟩, ?_⟩
      simp only [pEvalN_cons] at ih2 ⊢
      rw [ih2]
      ring

theorem padd_WF {p q : Poly} (hp : WFN n ps p) (hq : WFN n ps q) : WFN n ps (padd p q) :=
  (paddF_spec (fun _ => 0) _ p q hp hq).1

theorem pEvalN_padd {p q : Poly} (hp : WFN n ps p) (hq : WFN n ps q) :
    pEvalN n ps (padd p q) x = pEvalN n ps p x + pEvalN n ps q x :=
  (paddF_spec x _ p q hp hq).2

theorem psmulZ_WF (c : ℤ) {p : Poly} (hp : WFN n ps p) : WFN n ps (psmulZ c p) := by
  intro e he
  simp only [PackLean.D28.psmulZ, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fsmul c (hp _ hma).2⟩

theorem pEvalN_psmulZ (c : ℤ) (p : Poly) : pEvalN n ps (psmulZ c p) x = c * pEvalN n ps p x := by
  induction p with
  | nil => simp [PackLean.D28.psmulZ]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    simp only [PackLean.D28.psmulZ, List.map_cons, pEvalN_cons] at ih ⊢
    rw [ih, fval_fsmul]
    ring

theorem foldl_padd_spec (l : List Poly) : ∀ acc : Poly, WFN n ps acc → (∀ p ∈ l, WFN n ps p) →
    WFN n ps (l.foldl padd acc) ∧
      pEvalN n ps (l.foldl padd acc) x = pEvalN n ps acc x + (l.map (pEvalN n ps · x)).sum := by
  induction l with
  | nil => intro acc h _; simp [h]
  | cons p l ih =>
    intro acc hacc hl
    have hp := hl p (by simp)
    obtain ⟨h1, h2⟩ := ih (padd acc p) (padd_WF hacc hp) (fun q hq => hl q (by simp [hq]))
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEvalN_padd x hacc hp, List.map_cons, List.sum_cons]
    ring

theorem psum_WF {l : List Poly} (hl : ∀ p ∈ l, WFN n ps p) : WFN n ps (psum l) :=
  (foldl_padd_spec (fun _ => 0) l [] WFN_nil hl).1

theorem pEvalN_psum {l : List Poly} (hl : ∀ p ∈ l, WFN n ps p) :
    pEvalN n ps (psum l) x = (l.map (pEvalN n ps · x)).sum := by
  rw [psum, (foldl_padd_spec x l [] WFN_nil hl).2]; simp

/-! ## Products -/

theorem inner_spec (m : Mono) (a : FE) (hm : m.length = n) (ha : Len ps a) (q : Poly)
    (hq : WFN n ps q) :
    WFN n ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) ∧
    pEvalN n ps (q.map fun e => (List.zipWith (· + ·) m e.1, fmul ps a e.2)) x
      = fval ps a * monoN n m x * pEvalN n ps q x := by
  induction q with
  | nil => simp
  | cons e q ih =>
    rw [WFN_cons] at hq
    obtain ⟨ih1, ih2⟩ := ih hq.2
    refine ⟨WFN_cons.2 ⟨⟨by simp [hm, hq.1.1], len_fmul ha hq.1.2⟩, ih1⟩, ?_⟩
    rw [List.map_cons, pEvalN_cons, ih2, pEvalN_cons, fval_fmul ha hq.1.2,
      monoN_zipWith (hm.trans hq.1.1.symm) x]
    ring

theorem pmul_spec {p q : Poly} (hp : WFN n ps p) (hq : WFN n ps q) :
    WFN n ps (pmul ps p q) ∧ pEvalN n ps (pmul ps p q) x = pEvalN n ps p x * pEvalN n ps q x := by
  have hall : ∀ r ∈ p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2)),
      WFN n ps r := by
    intro r hr
    simp only [List.mem_map] at hr
    obtain ⟨e, he, rfl⟩ := hr
    exact (inner_spec x e.1 e.2 (hp e he).1 (hp e he).2 q hq).1
  have hpm : pmul ps p q = psum (p.map (fun (e : Mono × FE) =>
      q.map fun (f : Mono × FE) => (List.zipWith (· + ·) e.1 f.1, fmul ps e.2 f.2))) := rfl
  rw [hpm]
  refine ⟨psum_WF hall, ?_⟩
  rw [pEvalN_psum x hall, List.map_map]
  clear hall hpm
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WFN_cons] at hp
    rw [List.map_cons, List.sum_cons, ih hp.2, pEvalN_cons, Function.comp_apply,
      (inner_spec x e.1 e.2 hp.1.1 hp.1.2 q hq).2]
    ring

theorem psmulF_WF {c : FE} (hc : Len ps c) {p : Poly} (hp : WFN n ps p) :
    WFN n ps (psmulF ps c p) := by
  intro e he
  simp only [PackLean.D28.psmulF, List.mem_map] at he
  obtain ⟨⟨m, a⟩, hma, rfl⟩ := he
  exact ⟨(hp _ hma).1, len_fmul hc (hp _ hma).2⟩

theorem pEvalN_psmulF {c : FE} (hc : Len ps c) {p : Poly} (hp : WFN n ps p) :
    pEvalN n ps (psmulF ps c p) x = fval ps c * pEvalN n ps p x := by
  induction p with
  | nil => simp [PackLean.D28.psmulF]
  | cons e p ih =>
    obtain ⟨m, a⟩ := e
    rw [WFN_cons] at hp
    simp only [PackLean.D28.psmulF, List.map_cons, pEvalN_cons] at ih ⊢
    rw [ih hp.2, fval_fmul hc hp.1.2]
    ring

/-! ## The constant term (`List.replicate n 0` is `zeroMono` for `n = 5`) -/

theorem getD_replicate_zero (n i : ℕ) : (List.replicate n 0).getD i 0 = 0 := by
  rw [List.getD_eq_getElem?_getD, List.getElem?_replicate]
  split <;> rfl

theorem monoN_replicate (s : Fin n → ℝ) : monoN n (List.replicate n 0) s = 1 :=
  Finset.prod_eq_one (fun i _ => by rw [getD_replicate_zero, pow_zero])

theorem monoN_zero {m : Mono} (hm : m.length = n) :
    monoN n m 0 = if m == List.replicate n 0 then 1 else 0 := by
  by_cases h : m = List.replicate n 0
  · subst h
    simp [monoN_replicate]
  · have hex : ∃ i : Fin n, m.getD i 0 ≠ 0 := by
      by_contra hc
      simp only [not_exists, ne_eq, not_not] at hc
      apply h
      apply List.ext_getElem (by simp [hm])
      intro i h1 h2
      have := hc ⟨i, hm ▸ h1⟩
      rw [List.getD_eq_getElem _ _ h1] at this
      simp [this]
    obtain ⟨i, hi⟩ := hex
    have hne : (m == List.replicate n 0) = false := by simpa using h
    rw [hne]
    simp only [Bool.false_eq_true, ite_false]
    exact Finset.prod_eq_zero (Finset.mem_univ i) (by rw [Pi.zero_apply, zero_pow hi])

theorem constTerm_spec (p : Poly) (hp : WFN n ps p) : ∀ acc : FE, Len ps acc →
    Len ps (p.foldl (fun acc (x : Mono × FE) =>
      if x.1 == List.replicate n 0 then fadd acc x.2 else acc) acc) ∧
    fval ps (p.foldl (fun acc (x : Mono × FE) =>
      if x.1 == List.replicate n 0 then fadd acc x.2 else acc) acc)
      = fval ps acc + pEvalN n ps p 0 := by
  induction p with
  | nil => intro acc h; simp [h]
  | cons e p ih =>
    intro acc hacc
    rw [WFN_cons] at hp
    rw [List.foldl_cons, pEvalN_cons, monoN_zero hp.1.1]
    split_ifs with h
    · obtain ⟨h1, h2⟩ := ih hp.2 (fadd acc e.2) (len_fadd hacc hp.1.2)
      refine ⟨h1, ?_⟩
      rw [h2, fval_fadd hacc hp.1.2]; ring
    · obtain ⟨h1, h2⟩ := ih hp.2 acc hacc
      refine ⟨h1, ?_⟩
      rw [h2]; ring

/-- The value at `0` is the constant term. -/
theorem pEvalN_zero {p : Poly} (hp : WFN n ps p) :
    pEvalN n ps p 0 = fval ps (p.foldl (fun acc (x : Mono × FE) =>
      if x.1 == List.replicate n 0 then fadd acc x.2 else acc) (fzero (2 ^ ps.length))) := by
  rw [(constTerm_spec p hp (fzero (2 ^ ps.length)) (len_fzero ps)).2, fval_fzero]
  ring

/-! ## `pmulAff` -/

theorem incAt_length : ∀ (m : Mono) (i : ℕ), (incAt m i).length = m.length
  | [], _ => rfl
  | _ :: _, 0 => rfl
  | a :: as, i + 1 => by simp [PackLean.D28.incAt, incAt_length as i]

theorem incAt_getD : ∀ (m : Mono) (i j : ℕ), i < m.length →
    (incAt m i).getD j 0 = m.getD j 0 + if j = i then 1 else 0
  | [], _, _, h => by simp at h
  | a :: as, 0, 0, _ => by simp [PackLean.D28.incAt]
  | a :: as, 0, j + 1, _ => by simp [PackLean.D28.incAt]
  | a :: as, i + 1, 0, _ => by simp [PackLean.D28.incAt]
  | a :: as, i + 1, j + 1, h => by
    simp only [PackLean.D28.incAt, List.getD_cons_succ]
    rw [incAt_getD as i j (by simpa using h)]
    simp

theorem monoN_incAt {m : Mono} (hm : m.length = n) (i : ℕ) (hi : i < n) (s : Fin n → ℝ) :
    monoN n (incAt m i) s = s ⟨i, hi⟩ * monoN n m s := by
  unfold monoN
  have key : ∀ j : Fin n, s j ^ (incAt m i).getD j 0
      = (if j = ⟨i, hi⟩ then s j else 1) * s j ^ m.getD j 0 := by
    intro j
    rw [incAt_getD m i j (hm ▸ hi), pow_add]
    by_cases hj : j = ⟨i, hi⟩
    · subst hj; simp [mul_comm]
    · have : (j : ℕ) ≠ i := fun h => hj (Fin.ext h)
      simp [hj, this]
  rw [Finset.prod_congr rfl (fun j _ => key j), Finset.prod_mul_distrib, Finset.prod_ite_eq']
  simp

theorem mapInc_spec (i : ℕ) (hi : i < n) (s : Fin n → ℝ) :
    ∀ p : Poly, WFN n ps p → WFN n ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) ∧
      pEvalN n ps (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2))) s
        = s ⟨i, hi⟩ * pEvalN n ps p s := by
  intro p hp
  induction p with
  | nil => simp
  | cons e p ih =>
    rw [WFN_cons] at hp
    obtain ⟨h1, h2⟩ := ih hp.2
    refine ⟨WFN_cons.2 ⟨⟨(incAt_length _ i).trans hp.1.1, hp.1.2⟩, h1⟩, ?_⟩
    rw [List.map_cons, pEvalN_cons, h2, pEvalN_cons, monoN_incAt hp.1.1 i hi]
    ring

theorem pmulAff_spec {p : Poly} (hp : WFN n ps p) (c w : ℤ) (i : ℕ) (hi : i < n) (s : Fin n → ℝ) :
    WFN n ps (pmulAff p c w i) ∧
      pEvalN n ps (pmulAff p c w i) s = (c + w * s ⟨i, hi⟩) * pEvalN n ps p s := by
  have hm : pmulAff p c w i =
      padd (psmulZ c p) (psmulZ w (p.map (fun (e : Mono × FE) => (incAt e.1 i, e.2)))) := rfl
  obtain ⟨h1, h2⟩ := mapInc_spec i hi s p hp
  rw [hm]
  refine ⟨padd_WF (psmulZ_WF c hp) (psmulZ_WF w h1), ?_⟩
  rw [pEvalN_padd s (psmulZ_WF c hp) (psmulZ_WF w h1), pEvalN_psmulZ s c, pEvalN_psmulZ s w, h2]
  ring

/-! ## Lower bounds -/

theorem getD_memN {m : Mono} (hm : m.length = n) (i : Fin n) : m.getD i 0 ∈ m := by
  rw [List.getD_eq_getElem _ _ (by rw [hm]; exact i.isLt)]
  exact List.getElem_mem _

theorem term_lb {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) (m : Mono) (a : FE)
    (hm : m.length = n) (ha : Len ps a) (s : Fin n → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((monoLb (if m.all (· == 0) then 0 else if m.all (· % 2 == 0) then 1 else 2)
      (loHi sqb a) : ℤ) : ℝ) ≤ K * (fval ps a * monoN n m s) := by
  obtain ⟨hlo, hhi⟩ := loHi_spec hb ha
  set lo := (loHi sqb a).1
  set hi := (loHi sqb a).2
  set v := K * fval ps a with hv
  rw [← mul_assoc, ← hv]
  have hmono : |monoN n m s| ≤ 1 := by
    rw [monoN, Finset.abs_prod]
    exact Finset.prod_le_one₀ (fun i _ => abs_nonneg _) (fun i _ => by
      rw [abs_pow]; exact pow_le_one₀ (abs_nonneg _) (hs i))
  split_ifs with h0 h1
  · have hall : ∀ i : Fin n, m.getD i 0 = 0 := fun i => by
      have := List.all_eq_true.1 h0 _ (getD_memN hm i)
      simpa using this
    have : monoN n m s = 1 := by
      unfold monoN; exact Finset.prod_eq_one (fun i _ => by rw [hall i, pow_zero])
    simp only [monoLb, this, mul_one]
    exact hlo
  · have hev : ∀ i : Fin n, m.getD i 0 % 2 = 0 := fun i => by
      have := List.all_eq_true.1 h1 _ (getD_memN hm i)
      simpa using this
    have hM0 : 0 ≤ monoN n m s :=
      Finset.prod_nonneg (fun i _ => (Nat.even_iff.2 (hev i)).pow_nonneg _)
    have hM1 : monoN n m s ≤ 1 := le_trans (le_abs_self _) hmono
    simp only [monoLb]
    push_cast
    rcases le_total 0 v with hh | hh
    · have : 0 ≤ v * monoN n m s := mul_nonneg hh hM0
      have : min 0 (lo : ℝ) ≤ 0 := min_le_left _ _
      linarith
    · have : v ≤ v * monoN n m s := by nlinarith
      have : min 0 (lo : ℝ) ≤ lo := min_le_right _ _
      linarith
  · simp only [monoLb]
    push_cast
    have h2 := neg_abs_le (v * monoN n m s)
    rw [abs_mul] at h2
    have h3 : |v| * |monoN n m s| ≤ |v| := mul_le_of_le_one_right (abs_nonneg _) hmono
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
    (hp : WFN n ps p) (s : Fin n → ℝ) (hs : ∀ i, |s i| ≤ 1) :
    ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) 0 : ℤ) : ℝ) ≤ K * pEvalN n ps p s := by
  suffices h : ∀ (acc : ℤ), ((p.foldl (fun acc (e : Mono × FE) =>
      acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
        (loHi sqb e.2)) acc : ℤ) : ℝ) ≤ acc + K * pEvalN n ps p s by
    have h0 := h 0
    rw [Int.cast_zero, zero_add] at h0
    exact h0
  induction p with
  | nil => intro acc; simp
  | cons e p ih =>
    intro acc
    rw [WFN_cons] at hp
    rw [List.foldl_cons]
    refine (ih hp.2 _).trans ?_
    push_cast
    have := term_lb hb e.1 e.2 hp.1.1 hp.1.2 s hs
    rw [pEvalN_cons]
    linarith

/-! ## The box test with the step as a parameter -/

/-- The step `st p i` multiplies the value by `g i` (at the point `s`) and keeps `WFN`. -/
def StepOk (n : ℕ) (ps : List ℕ) (st : Poly → ℕ → Poly) (g : ℕ → ℝ) (s : Fin n → ℝ) : Prop :=
  ∀ p, WFN n ps p → ∀ i < n, WFN n ps (st p i) ∧ pEvalN n ps (st p i) s = g i * pEvalN n ps p s

/-- `s` read at a natural number (`0` outside `Fin n`). -/
noncomputable def sAt (s : Fin n → ℝ) (j : ℕ) : ℝ := if h : j < n then s ⟨j, h⟩ else 0

theorem sAt_fin (s : Fin n → ℝ) (k : Fin n) : sAt s k = s k := by simp [sAt, k.isLt]

theorem sAt_fin' (s : Fin n → ℝ) {j : ℕ} (hj : j < n) : sAt s j = s ⟨j, hj⟩ := by simp [sAt, hj]

/-- The affine factor `C_j + W_j · s_j` of the box `C ± W`. -/
noncomputable def affAt (C W : List ℤ) (s : Fin n → ℝ) (j : ℕ) : ℝ :=
  ((nth C j 0 : ℤ) : ℝ) + ((nth W j 0 : ℤ) : ℝ) * sAt s j

/-- The step of `D28.shiftLb`. -/
theorem step_pmulAff (C W : List ℤ) (s : Fin n → ℝ) :
    StepOk n ps (fun p i => pmulAff p (nth C i 0) (nth W i 0) i) (affAt C W s) s := by
  intro p hp i hi
  obtain ⟨h1, h2⟩ := pmulAff_spec hp (nth C i 0) (nth W i 0) i hi s
  refine ⟨h1, ?_⟩
  rw [h2, affAt, sAt_fin' s hi]

/-- The step of `D45DT.lamLb` (an axis with `w = 0` is a constant factor). -/
theorem step_lam (C W : List ℤ) (s : Fin n → ℝ) :
    StepOk n ps (fun p i => if nth W i 0 == 0 then psmulZ (nth C i 0) p
      else pmulAff p (nth C i 0) (nth W i 0) i) (affAt C W s) s := by
  intro p hp i hi
  by_cases hw : nth W i 0 = 0
  · simp only [hw, beq_self_eq_true, ite_true]
    refine ⟨psmulZ_WF _ hp, ?_⟩
    rw [pEvalN_psmulZ, affAt, hw]
    simp
  · simp only [beq_iff_eq, hw, ite_false]
    exact step_pmulAff C W s p hp i hi

theorem stepPow {st : Poly → ℕ → Poly} {g : ℕ → ℝ} {s : Fin n → ℝ} (h : StepOk n ps st g s)
    (i : ℕ) (hi : i < n) : ∀ (e : ℕ) (p : Poly), WFN n ps p →
    WFN n ps ((List.range e).foldl (fun acc _ => st acc i) p) ∧
    pEvalN n ps ((List.range e).foldl (fun acc _ => st acc i) p) s = g i ^ e * pEvalN n ps p s := by
  intro e
  induction e with
  | zero => intro p hp; simp [hp]
  | succ e ih =>
    intro p hp
    rw [List.range_succ, List.foldl_append, List.foldl_cons, List.foldl_nil]
    obtain ⟨h1, h2⟩ := ih p hp
    obtain ⟨h3, h4⟩ := h _ h1 i hi
    exact ⟨h3, by rw [h4, h2]; ring⟩

/-- The fold over the exponents of one monomial (from the axis `k` on). -/
theorem stepFold {st : Poly → ℕ → Poly} {g : ℕ → ℝ} {s : Fin n → ℝ} (h : StepOk n ps st g s) :
    ∀ (m : Mono) (k : ℕ) (p : Poly), k + m.length ≤ n → WFN n ps p →
    WFN n ps ((List.zip (List.range' k m.length) m).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc) p) ∧
    pEvalN n ps ((List.zip (List.range' k m.length) m).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc) p) s
      = (∏ j ∈ Finset.range m.length, g (k + j) ^ m.getD j 0) * pEvalN n ps p s
  | [], k, p, _, hp => by simp [hp]
  | a :: m, k, p, hk, hp => by
    simp only [List.length_cons, List.range'_succ, List.zip_cons_cons, List.foldl_cons]
    simp only [List.length_cons] at hk
    obtain ⟨h1, h2⟩ := stepPow h k (by omega) a p hp
    obtain ⟨h3, h4⟩ := stepFold h m (k + 1) _ (by omega) h1
    refine ⟨h3, ?_⟩
    rw [h4, h2, Finset.prod_range_succ']
    have hc : ∏ j ∈ Finset.range m.length, g (k + 1 + j) ^ m.getD j 0
        = ∏ j ∈ Finset.range m.length, g (k + (j + 1)) ^ (a :: m).getD (j + 1) 0 :=
      Finset.prod_congr rfl (fun j _ => by
        rw [show k + 1 + j = k + (j + 1) by omega, List.getD_cons_succ])
    rw [hc, List.getD_cons_zero, add_zero]
    ring

theorem foldl_add_getD : ∀ (m : List ℕ) (acc : ℕ),
    m.foldl (· + ·) acc = acc + ∑ j ∈ Finset.range m.length, m.getD j 0
  | [], acc => by simp
  | a :: m, acc => by
    rw [List.foldl_cons, foldl_add_getD m (acc + a), List.length_cons, Finset.sum_range_succ']
    simp only [List.getD_cons_succ, List.getD_cons_zero]
    ring

/-- One monomial of the box test: the fold of the steps is `D^hdeg · a · m(g / D)`. -/
theorem shift_termN {st : Poly → ℕ → Poly} {g : ℕ → ℝ} {s : Fin n → ℝ} (hst : StepOk n ps st g s)
    (D : ℤ) (hdeg : ℕ) (e : Mono × FE) (he : e.1.length = n ∧ Len ps e.2)
    (hd : e.1.foldl (· + ·) 0 ≤ hdeg) (hD : (D : ℝ) ≠ 0) :
    WFN n ps ((List.zip (List.range n) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc)
      ([(List.replicate n 0, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) ∧
    pEvalN n ps ((List.zip (List.range n) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc)
      ([(List.replicate n 0, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) s
      = (D : ℝ) ^ hdeg * (fval ps e.2 * monoN n e.1 (fun k => g k / D)) := by
  obtain ⟨m, a⟩ := e
  simp only at he hd ⊢
  have hr : List.range n = List.range' 0 m.length := by rw [List.range_eq_range', he.1]
  have hbase : WFN n ps ([(List.replicate n 0, fsmul (D ^ (hdeg - m.foldl (· + ·) 0)) a)] : Poly) :=
    WFN_cons.2 ⟨⟨List.length_replicate, len_fsmul _ he.2⟩, WFN_nil⟩
  obtain ⟨h1, h2⟩ := stepFold hst m 0 _ (by omega) hbase
  rw [← hr] at h1 h2
  refine ⟨h1, ?_⟩
  rw [h2]
  rw [foldl_add_getD m 0, zero_add] at hd ⊢
  simp only [he.1, zero_add] at h2 hd ⊢
  set T := ∑ j ∈ Finset.range n, m.getD j 0 with hT
  have hmono : monoN n m (fun k => g k / D)
      = (∏ j ∈ Finset.range n, g j ^ m.getD j 0) / (D : ℝ) ^ T := by
    unfold monoN
    rw [Fin.prod_univ_eq_prod_range (fun j => (g j / D) ^ m.getD j 0) n]
    simp only [div_pow]
    rw [Finset.prod_div_distrib, Finset.prod_pow_eq_pow_sum]
  rw [hmono]
  simp only [pEvalN_cons, pEvalN_nil, add_zero, fval_fsmul, monoN_replicate, mul_one]
  have hDT : (D : ℝ) ^ hdeg = (D : ℝ) ^ (hdeg - T) * (D : ℝ) ^ T := by
    rw [← pow_add]; congr 1; omega
  rw [hDT]
  push_cast
  field_simp

/-- `l ≤ h`, `h − l` even, `l ≤ z ≤ h` ⇒ `z = (l + h)/2 + (h − l)/2 · s` with `|s| ≤ 1`. -/
theorem ax_param_le (l h : ℤ) (zk : ℝ) (hlh : l ≤ h) (he : (h - l) % 2 = 0) (hl : (l : ℝ) ≤ zk)
    (hh : zk ≤ h) :
    ∃ sk : ℝ, |sk| ≤ 1 ∧ (((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * sk = zk := by
  rcases hlh.lt_or_eq with hlt | heq
  · exact PackLean.Formal.PolySem5.ax_param l h zk hlt he hl hh
  · subst heq
    refine ⟨0, by simp, ?_⟩
    have h2 : (l + l) / 2 = l := by omega
    rw [h2]
    simp only [mul_zero, add_zero]
    exact le_antisymm hl hh

theorem nth_zipWith (f : ℤ → ℤ → ℤ) {lo hi : List ℤ} {k : ℕ} (hl : k < lo.length)
    (hh : k < hi.length) : nth (List.zipWith f lo hi) k 0 = f (nth lo k 0) (nth hi k 0) := by
  simp only [nth]
  rw [List.getD_eq_getElem _ _ (by simp; omega), List.getElem_zipWith,
    List.getD_eq_getElem _ _ hl, List.getD_eq_getElem _ _ hh]

/-- The Bool check of the box, read at each axis. -/
theorem all_zipWith {f : ℤ → ℤ → Bool} {lo hi : List ℤ} (hlo : lo.length = n) (hhi : hi.length = n)
    (hz : (List.zipWith f lo hi).all id = true) (k : Fin n) : f (nth lo k 0) (nth hi k 0) = true := by
  have hk1 : (k : ℕ) < lo.length := hlo ▸ k.isLt
  have hk2 : (k : ℕ) < hi.length := hhi ▸ k.isLt
  have hk : (k : ℕ) < (List.zipWith f lo hi).length := by simp; omega
  have := List.all_eq_true.1 hz _ (List.getElem_mem hk)
  simp only [List.getElem_zipWith, id] at this
  simp only [nth]
  rw [List.getD_eq_getElem _ _ hk1, List.getD_eq_getElem _ _ hk2]
  exact this

/-- The degree check of the box test, as a bound on each monomial. -/
theorem deg_of_not_any {H : Poly} {dmax : ℕ}
    (h : ¬ (H.any (fun (e : Mono × FE) => decide (e.1.foldl (· + ·) 0 > dmax))) = true) :
    ∀ e ∈ H, e.1.foldl (· + ·) 0 ≤ dmax := by
  intro e he
  by_contra hc
  exact h (List.any_eq_true.2 ⟨e, he, by simp; omega⟩)

/-- **The box test in `n` variables.**  The sum of `monoLb` over the folded polynomial is a lower
bound of `K · D^dmax · H(z / D)` at every point `z` of the box `[lo, hi]`; the step `st` is any
step with `StepOk` for the affine factors of the box (`step_pmulAff`, `step_lam`). -/
theorem shiftLbN_spec {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K)
    {D : ℤ} (hD : 0 < D) (dmax : ℕ) {H : Poly} (hH : WFN n ps H)
    (hdeg : ∀ e ∈ H, e.1.foldl (· + ·) 0 ≤ dmax) {lo hi : List ℤ} (hlo : lo.length = n)
    (hhi : hi.length = n)
    (hbox : ∀ k : Fin n, nth lo k 0 ≤ nth hi k 0 ∧ (nth hi k 0 - nth lo k 0) % 2 = 0)
    (st : Poly → ℕ → Poly)
    (hst : ∀ s : Fin n → ℝ, StepOk n ps st (affAt (List.zipWith (fun l h => (l + h) / 2) lo hi)
      (List.zipWith (fun l h => (h - l) / 2) lo hi) s) s)
    (z : Fin n → ℝ)
    (hzb : ∀ k : Fin n, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    (((psum (H.map (fun (e : Mono × FE) =>
      (List.zip (List.range n) e.1).foldl (fun acc (y : ℕ × ℕ) =>
        (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc)
        ([(List.replicate n 0, fsmul (D ^ (dmax - e.1.foldl (· + ·) 0)) e.2)] : Poly)))).foldl
      (fun acc (e : Mono × FE) =>
        acc + monoLb (if e.1.all (· == 0) then 0 else if e.1.all (· % 2 == 0) then 1 else 2)
          (loHi sqb e.2)) 0 : ℤ) : ℝ)
      ≤ K * ((D : ℝ) ^ dmax * pEvalN n ps H (fun k => z k / D)) := by
  set Cl := List.zipWith (fun l h => (l + h) / 2) lo hi with hCl
  set Wl := List.zipWith (fun l h => (h - l) / 2) lo hi with hWl
  have hax : ∀ k : Fin n, ∃ sk : ℝ, |sk| ≤ 1 ∧
      ((nth Cl k 0 : ℤ) : ℝ) + ((nth Wl k 0 : ℤ) : ℝ) * sk = z k := by
    intro k
    have hk1 : (k : ℕ) < lo.length := hlo ▸ k.isLt
    have hk2 : (k : ℕ) < hi.length := hhi ▸ k.isLt
    rw [hCl, hWl, nth_zipWith _ hk1 hk2, nth_zipWith _ hk1 hk2]
    exact ax_param_le _ _ (z k) (hbox k).1 (hbox k).2 (hzb k).1 (hzb k).2
  choose s hs hq using hax
  have hCs : ∀ k : Fin n, affAt Cl Wl s k = z k := fun k => by rw [affAt, sAt_fin, hq k]
  have hDr : (D : ℝ) ≠ 0 := by exact_mod_cast hD.ne'
  have hall := fun e (he : e ∈ H) => shift_termN (hst s) D dmax e (hH e he) (hdeg e he) hDr
  have hWF : ∀ q ∈ H.map (fun (e : Mono × FE) =>
      (List.zip (List.range n) e.1).foldl (fun acc (y : ℕ × ℕ) =>
        (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc)
        ([(List.replicate n 0, fsmul (D ^ (dmax - e.1.foldl (· + ·) 0)) e.2)] : Poly)),
      WFN n ps q := by
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨e, he, rfl⟩ := hq
    exact (hall e he).1
  have hlb := lbFold_le hb (psum_WF hWF) s hs
  rw [pEvalN_psum s hWF, List.map_map] at hlb
  have hsum : (H.map ((pEvalN n ps · s) ∘ fun (e : Mono × FE) =>
      (List.zip (List.range n) e.1).foldl (fun acc (y : ℕ × ℕ) =>
        (List.range y.2).foldl (fun acc2 _ => st acc2 y.1) acc)
        ([(List.replicate n 0, fsmul (D ^ (dmax - e.1.foldl (· + ·) 0)) e.2)] : Poly))).sum
      = (D : ℝ) ^ dmax * pEvalN n ps H (fun k => z k / D) := by
    rw [pEvalN, ← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro e he
    simp only [Function.comp_apply]
    rw [(hall e he).2]
    congr 3
    funext k
    rw [hCs k]
  rw [hsum] at hlb
  exact hlb

#assert_std_axioms PackLean.Formal.PolySemN.pmul_spec PackLean.Formal.PolySemN.shiftLbN_spec
  PackLean.Formal.PolySemN.step_lam PackLean.Formal.PolySemN.pEvalN_zero

end PackLean.Formal.PolySemN
