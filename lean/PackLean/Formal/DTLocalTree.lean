import PackLean.Formal.DTLocalPoly
import PackLean.Formal.BoxTree
import PackLean.AxiomAudit

/-!
# A9k stage 7c-3 (part): `splitE0`, the local tree and its leaves

Design: `plan/A9k_dodintet_design.md` §2 (the rows `splitE0`, local tree), §3 (7c-3).

* **`splitE0_spec`**: `splitE0 p = some (e00, e01, Λ)` (and `p` in five variables `(u, ζ)`) ⇒
  `p(u, r·ŷ) = e00 + e01·u + r·Λ(u, r, ŷ)` for all `u`, `r`, `ŷ` (the monomials of degree `0` in
  `ζ` have `u` degree at most `1`; `ζ^m = r^{|m|} ŷ^m`, one `r` is taken out).
* **`ltree_cover`**: the local tree (`lchar`, one character at a time; the pending argument `'a'`
  keeps the stack, the split `lsplitT` halves one axis) covers the boxes of its start stack with
  good leaves (`LGoodT`: a candidate index, the box widths even, `e0 ≥ 0` at both ends of `u`,
  `lamLb > 0`).
* **`leaf_pos`**: at a point `z` (units `1/D`) of a good leaf with `z₁ ≥ 0`,
  `e00 + e01·u + r·Λ(u, r, ŷ) ≥ 0` at `(u, r, ŷ) = z / D` (`lamLb_spec`).

* **`face_point`**: a point `(u, w, p₁, p₂, p₃)` of the tube (`ulo ≤ D·u ≤ uhi`, `D·|ζ_i| ≤ r0`) is
  `X5 u r ŷ` with `r = max |ζ_i|`, and `D·(u, r, ŷ)` lies in one of the eight root boxes of `lroots`
  (`lroots_eq` is `rfl`).

Not yet here: the value of `candPoly` (`cand_valT`), `weightsOk`, the assembly `hlocT_of`.
-/

namespace PackLean.Formal.DTLocalTree

open PackLean.D28 (FE fadd fsmul Mono Poly psum nth)
open PackLean.D45DT (Prm PS fz fsg splitE0 lamLb LB lsplitT LS LCtx lleaf lchar dval)
open PackLean.Formal.FieldSem (fval Len fval_fadd fval_fsmul len_fadd len_fsmul fsign_spec)
open PackLean.Formal.PolySemN (pEvalN WFN pEvalN_psum psum_WF WFN_cons all_zipWith)
open PackLean.Formal.BoxTree (monoN InList)
open PackLean.Formal.DTLocalPoly (lamLb_spec dtLocOk)
open PackLean.Formal.DTBase (dtExtraOk)

noncomputable section

/-! ## 1. `splitE0` -/

/-- The five variables of the candidate polynomial at `(u, ζ) = (u, r·ŷ)`. -/
def X5 (u r : ℝ) (y : Fin 4 → ℝ) : Fin 5 → ℝ := ![u, r * y 0, r * y 1, r * y 2, r * y 3]

/-- The six variables of `Λ`: `(u, r, ŷ)`. -/
def Y6 (u r : ℝ) (y : Fin 4 → ℝ) : Fin 6 → ℝ := ![u, r, y 0, y 1, y 2, y 3]

/-- The degree in `ζ` of a monomial. -/
def zdeg (m : Mono) : ℕ := nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0

/-- The monomial of `Λ` made from a monomial of positive degree in `ζ`. -/
def lamMono (m : Mono) : Mono := [nth m 0 0, zdeg m - 1, nth m 1 0, nth m 2 0, nth m 3 0, nth m 4 0]

/-- The contribution of one term to `Λ`. -/
def lamE (u r : ℝ) (y : Fin 4 → ℝ) (e : Mono × FE) : ℝ :=
  if zdeg e.1 = 0 then 0 else fval PS e.2 * monoN 6 (lamMono e.1) (Y6 u r y)

theorem len_fz : Len PS fz := by simp [Len, PS, fz]

/-- The fold that adds up the coefficient of one monomial `c`. -/
theorem coef_fold (c : Mono) (f : FE → Mono × FE → FE)
    (hf : ∀ acc m a, f acc (m, a) = if (m == c) = true then fadd acc a else acc) :
    ∀ (p : Poly) (acc : FE), WFN 5 PS p → Len PS acc →
    Len PS (p.foldl f acc) ∧
      fval PS (p.foldl f acc) = fval PS acc + (p.map (fun e => if e.1 = c then fval PS e.2 else 0)).sum
  | [], acc, _, ha => by simp [ha]
  | (m, a) :: p, acc, hp, ha => by
    rw [WFN_cons] at hp
    rw [List.foldl_cons, hf, List.map_cons, List.sum_cons]
    by_cases hc : m = c
    · have hb : (m == c) = true := by simp [hc]
      rw [if_pos hb]
      obtain ⟨h1, h2⟩ := coef_fold c f hf p _ hp.2 (len_fadd ha hp.1.2)
      refine ⟨h1, ?_⟩
      rw [h2, fval_fadd ha hp.1.2]
      simp only [hc, if_true]
      ring
    · have hb : ¬ (m == c) = true := by simpa using hc
      rw [if_neg hb]
      obtain ⟨h1, h2⟩ := coef_fold c f hf p _ hp.2 ha
      refine ⟨h1, ?_⟩
      rw [h2]
      simp [hc]

/-- The filter that makes `Λ`. -/
theorem lam_fold (g : Mono × FE → Option Poly)
    (hg : ∀ m a, g (m, a) = if (zdeg m == 0) = true then none else some [(lamMono m, a)])
    (u r : ℝ) (y : Fin 4 → ℝ) :
    ∀ p : Poly, WFN 5 PS p → (∀ q ∈ p.filterMap g, WFN 6 PS q) ∧
      ((p.filterMap g).map (fun q => pEvalN 6 PS q (Y6 u r y))).sum = (p.map (lamE u r y)).sum
  | [], _ => by simp
  | (m, a) :: p, hp => by
    rw [WFN_cons] at hp
    obtain ⟨ih1, ih2⟩ := lam_fold g hg u r y p hp.2
    rw [List.filterMap_cons, hg, List.map_cons, List.sum_cons]
    by_cases hz : zdeg m = 0
    · have hb : (zdeg m == 0) = true := by simp [hz]
      rw [if_pos hb]
      refine ⟨ih1, ?_⟩
      rw [ih2]
      simp [lamE, hz]
    · have hb : ¬ (zdeg m == 0) = true := by simpa using hz
      rw [if_neg hb]
      refine ⟨?_, ?_⟩
      · intro q hq
        rcases List.mem_cons.1 hq with rfl | hq
        · intro e he
          simp only [List.mem_singleton] at he
          subst he
          exact ⟨by simp [lamMono], hp.1.2⟩
        · exact ih1 q hq
      · rw [List.map_cons, List.sum_cons, ih2]
        simp [lamE, hz, PolySemN.pEvalN]

theorem mono5 (a0 a1 a2 a3 a4 : ℕ) (x : Fin 5 → ℝ) :
    monoN 5 [a0, a1, a2, a3, a4] x = x 0 ^ a0 * x 1 ^ a1 * x 2 ^ a2 * x 3 ^ a3 * x 4 ^ a4 := by
  simp [monoN, Fin.prod_univ_five]

theorem mono6 (a0 a1 a2 a3 a4 a5 : ℕ) (x : Fin 6 → ℝ) :
    monoN 6 [a0, a1, a2, a3, a4, a5] x = x 0 ^ a0 * x 1 ^ a1 * x 2 ^ a2 * x 3 ^ a3 * x 4 ^ a4 * x 5 ^ a5 := by
  simp [monoN, Fin.prod_univ_six]

/-- One term of `p` at `(u, r·ŷ)`, split into the parts of `e00`, `e01` and `r·Λ`. -/
theorem entry_val (m : Mono) (hm : m.length = 5) (a : FE)
    (hok : (zdeg m != 0 || decide (nth m 0 0 ≤ 1)) = true) (u r : ℝ) (y : Fin 4 → ℝ) :
    fval PS a * monoN 5 m (X5 u r y) =
      (if m = [0, 0, 0, 0, 0] then fval PS a else 0) + (if m = [1, 0, 0, 0, 0] then fval PS a else 0) * u
        + r * lamE u r y (m, a) := by
  obtain ⟨a0, a1, a2, a3, a4, rfl⟩ := PackLean.Formal.PolySem5.len5 hm
  simp only [zdeg, nth, List.getD_cons_succ, List.getD_cons_zero] at hok
  by_cases hz : a1 + a2 + a3 + a4 = 0
  · have e1 : a1 = 0 := by omega
    have e2 : a2 = 0 := by omega
    have e3 : a3 = 0 := by omega
    have e4 : a4 = 0 := by omega
    subst e1 e2 e3 e4
    have ha0 : a0 ≤ 1 := by simpa using hok
    interval_cases a0 <;> simp [lamE, zdeg, nth, mono5, X5]
  · have h1 : ¬ ([a0, a1, a2, a3, a4] : Mono) = [0, 0, 0, 0, 0] := by simp; omega
    have h2 : ¬ ([a0, a1, a2, a3, a4] : Mono) = [1, 0, 0, 0, 0] := by simp; omega
    rw [if_neg h1, if_neg h2]
    obtain ⟨k, hk⟩ : ∃ k, a1 + a2 + a3 + a4 = k + 1 := ⟨a1 + a2 + a3 + a4 - 1, by omega⟩
    have hz' : ¬ (a1 + a2 + a3 + a4 = 0) := hz
    simp only [lamE, zdeg, lamMono, nth, List.getD_cons_succ, List.getD_cons_zero, hz', if_false]
    rw [hk, Nat.add_sub_cancel]
    have hr : r ^ a1 * r ^ a2 * r ^ a3 * r ^ a4 = r * r ^ k := by
      rw [← pow_add, ← pow_add, ← pow_add, hk, pow_succ]; ring
    rw [mono5, mono6]
    simp only [X5, Y6, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons,
      Matrix.cons_val_two, Matrix.tail_cons, Matrix.cons_val_three, Matrix.cons_val_four, mul_pow]
    simp only [Matrix.cons_val, Matrix.cons_val_succ]
    linear_combination (fval PS a * u ^ a0 * y 0 ^ a1 * y 1 ^ a2 * y 2 ^ a3 * y 3 ^ a4) * hr

theorem sum3 {α : Type*} (A B L F : α → ℝ) (u r : ℝ) :
    ∀ p : List α, (∀ e ∈ p, F e = A e + B e * u + r * L e) →
      (p.map F).sum = (p.map A).sum + (p.map B).sum * u + r * (p.map L).sum
  | [], _ => by simp
  | e :: p, h => by
    simp only [List.map_cons, List.sum_cons]
    rw [h e (by simp), sum3 A B L F u r p (fun e' he' => h e' (by simp [he']))]
    ring

/-- **The meaning of `splitE0`.** -/
theorem splitE0_spec {p : Poly} (hp : WFN 5 PS p) {e00 e01 : FE} {lam : Poly}
    (h : splitE0 p = some (e00, e01, lam)) :
    Len PS e00 ∧ Len PS e01 ∧ WFN 6 PS lam ∧ ∀ (u r : ℝ) (y : Fin 4 → ℝ),
      pEvalN 5 PS p (X5 u r y) = fval PS e00 + fval PS e01 * u + r * pEvalN 6 PS lam (Y6 u r y) := by
  unfold splitE0 at h
  dsimp only at h
  split_ifs at h with hok
  simp only [Option.some.injEq, Prod.mk.injEq] at h
  obtain ⟨rfl, rfl, rfl⟩ := h
  have hok' : ∀ e ∈ p, (zdeg e.1 != 0 || decide (nth e.1 0 0 ≤ 1)) = true := by
    intro e he
    obtain ⟨m, a⟩ := e
    have h1 := (by simpa using hok : ∀ (x : Mono) (x_1 : FE), (x, x_1) ∈ p → nth x 1 0 = 0 →
      nth x 2 0 = 0 → nth x 3 0 = 0 → nth x 4 0 = 0 → nth x 0 0 ≤ 1) m a he
    simp only [zdeg, bne_iff_ne, ne_eq, Bool.or_eq_true, decide_eq_true_eq]
    by_cases h : nth m 1 0 + nth m 2 0 + nth m 3 0 + nth m 4 0 = 0
    · right; exact h1 (by omega) (by omega) (by omega) (by omega)
    · left; exact h
  refine ⟨(coef_fold [0, 0, 0, 0, 0] _ ?f0 p fz hp len_fz).1, (coef_fold [1, 0, 0, 0, 0] _ ?f1 p fz hp len_fz).1,
    psum_WF (lam_fold _ ?g0 0 0 0 p hp).1, ?_⟩
  case f0 => intro _ _ _; rfl
  case f1 => intro _ _ _; rfl
  case g0 => intro _ _; rfl
  · intro u r y
    rw [(coef_fold [0, 0, 0, 0, 0] _ ?f2 p fz hp len_fz).2, (coef_fold [1, 0, 0, 0, 0] _ ?f3 p fz hp len_fz).2,
      pEvalN_psum _ (lam_fold _ ?g1 u r y p hp).1, (lam_fold _ ?g1 u r y p hp).2]
    case f2 => intro _ _ _; rfl
    case f3 => intro _ _ _; rfl
    case g1 => intro _ _; rfl
    have hfz : fval PS fz = 0 := by simp [fz, PS, PackLean.Formal.FieldSem.fval]
    rw [hfz, zero_add, zero_add]
    have := sum3 (fun e : Mono × FE => if e.1 = [0, 0, 0, 0, 0] then fval PS e.2 else 0)
      (fun e => if e.1 = [1, 0, 0, 0, 0] then fval PS e.2 else 0) (lamE u r y)
      (fun e => fval PS e.2 * monoN 5 e.1 (X5 u r y)) u r p
      (fun e he => entry_val e.1 (hp e he).1 e.2 (hok' e he) u r y)
    exact this

/-! ## 2. The local tree -/

/-- The point `z` (units `1/D`, six axes) lies in the box. -/
def InLB (b : LB) (z : Fin 6 → ℝ) : Prop := b.lo.length = 6 ∧ b.hi.length = 6 ∧ InList 6 b.lo b.hi z

/-- What a leaf of the local tree certifies. -/
def LGoodT (P : Prm) (c : LCtx) (b : LB) : Prop :=
  ∃ ci e00 e01 lam, ci < c.cands.length ∧ nth c.cands ci (fz, fz, []) = (e00, e01, lam) ∧
    (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) b.lo b.hi).all id = true ∧
    fsg (fadd (fsmul c.D e00) (fsmul (nth b.lo 0 0) e01)) ≥ 0 ∧
    fsg (fadd (fsmul c.D e00) (fsmul (nth b.hi 0 0) e01)) ≥ 0 ∧
    ∃ v, lamLb P c.D 6 lam b.lo b.hi = some v ∧ 0 < v

theorem lleaf_ok_false (P : Prm) (c : LCtx) (s : LS) (ci : ℕ) (h : s.ok = false) :
    (lleaf P c s ci).ok = false := by
  unfold lleaf
  split
  · rfl
  · simp [h]

theorem lchar_ok_false (P : Prm) (c : LCtx) (s : LS) (ch : Char) (h : s.ok = false) :
    (lchar P c s ch).ok = false := by
  unfold lchar
  split_ifs
  · split
    · rfl
    · exact lleaf_ok_false P c _ _ h
  · split
    · rfl
    · split
      · rfl
      · exact h
  · exact h
  · rfl

/-- A leaf: the stack loses its top box, which is good. -/
theorem lleaf_spec (P : Prm) (c : LCtx) (s : LS) (ci : ℕ) {b : LB} {rest : List LB}
    (hs : s.stack = b :: rest) (hok : (lleaf P c s ci).ok = true) :
    (lleaf P c s ci).stack = rest ∧ LGoodT P c b := by
  unfold lleaf at hok ⊢
  rw [hs] at hok ⊢
  simp only at hok ⊢
  rcases hc : nth c.cands ci (fz, fz, []) with ⟨e00, e01, lam⟩
  simp only [hc] at hok ⊢
  refine ⟨by trivial, ?_⟩
  rcases hl : lamLb P c.D 6 lam b.lo b.hi with _ | v
  · simp [hl] at hok
  · simp only [hl, Bool.and_eq_true, decide_eq_true_eq] at hok
    obtain ⟨⟨⟨⟨⟨_, hw⟩, hci⟩, hlo⟩, hhi⟩, hv⟩ := hok
    exact ⟨ci, e00, e01, lam, hci, hc, hw, hlo, hhi, v, hl, hv⟩

theorem lsplit_cover {U : List ℤ} {b b1 b2 : LB} (h : lsplitT U b = some (b1, b2)) (z : Fin 6 → ℝ)
    (hz : InLB b z) : InLB b1 z ∨ InLB b2 z := by
  unfold lsplitT at h
  dsimp only at h
  split_ifs at h
  simp only [Option.some.injEq, Prod.mk.injEq] at h
  obtain ⟨rfl, rfl⟩ := h
  obtain ⟨h1, h2, h3⟩ := hz
  rcases BoxTree.set_cover _ _ h3 with h | h
  · left; exact ⟨h1, by simp [h2], h⟩
  · right; exact ⟨by simp [h1], h2, h⟩

/-- **The one-step rule of `lchar`.** -/
theorem lchar_spec (P : Prm) (c : LCtx) :
    BoxTree.StepSpec (lchar P c) LS.stack (fun s => s.ok = true) InLB (LGoodT P c) := by
  intro s ch b rest hs hok
  unfold lchar at hok ⊢
  split_ifs at hok ⊢ with hp hdot ha
  · rcases hv : dval ch with _ | v
    · simp [hv] at hok
    · rw [hv] at hok
      exact Or.inl (lleaf_spec P c _ _ (by simpa using hs) hok)
  · rw [hs] at hok ⊢
    simp only at hok ⊢
    rcases hsp : lsplitT c.U b with _ | ⟨b1, b2⟩ <;> simp only [hsp] at hok ⊢
    · exact absurd hok (by simp)
    · exact BoxTree.spec_split2 rfl (fun z hz => lsplit_cover hsp z hz)
  · exact Or.inr ⟨[b], by simpa using hs, fun z hz => ⟨b, by simp, hz⟩⟩

/-- **The local tree.** If the run from `s0` stays alive and ends with an empty stack, every point of
a box of the start stack lies in a good leaf. -/
theorem ltree_cover (P : Prm) (c : LCtx) (toks : List Char) (s0 : LS)
    (h1 : (toks.foldl (lchar P c) s0).ok = true) (h2 : (toks.foldl (lchar P c) s0).stack = []) :
    ∀ z, (∃ B ∈ s0.stack, InLB B z) → ∃ B, LGoodT P c B ∧ InLB B z := by
  have hA := BoxTree.alive_of_ok (lchar P c) LS.ok (fun s t hs => lchar_ok_false P c s t hs)
  exact BoxTree.run_cover (lchar P c) LS.stack (fun s => s.ok = true) InLB (LGoodT P c) hA
    (lchar_spec P c) toks s0 h1 h2

/-! ## 3. A good leaf -/

theorem sgn_nonneg' {r : ℝ} (h : 0 ≤ FieldSem.sgn r) : 0 ≤ r := by
  unfold FieldSem.sgn at h
  split_ifs at h with h1 h2
  · exact h1.le
  · norm_num at h
  · linarith

theorem fsg_nonneg {a : FE} (ha : Len PS a) (h : fsg a ≥ 0) : 0 ≤ fval PS a := by
  have e : fsg a = FieldSem.sgn (fval PS a) := fsign_spec PS (by simp [PS]) a ha
  rw [e] at h
  exact sgn_nonneg' h

/-- **A good leaf.** At a point `z` of the leaf (units `1/D`) with `z₁ ≥ 0`, the split value
`e00 + e01·u + r·Λ` at `z / D` is nonnegative (`Λ > 0`, `e0 ≥ 0`). -/
theorem leaf_pos {P : Prm} (h0 : dtExtraOk P = true) (hL : dtLocOk P = true) {c : LCtx} (hD : 0 < c.D)
    {b : LB} {ci : ℕ} {e00 e01 : FE} {lam : Poly} (hci : ci < c.cands.length)
    (hc : nth c.cands ci (fz, fz, []) = (e00, e01, lam))
    (hw : (List.zipWith (fun l h => decide (l ≤ h) && (h - l) % 2 == 0) b.lo b.hi).all id = true)
    (hlo0 : fsg (fadd (fsmul c.D e00) (fsmul (nth b.lo 0 0) e01)) ≥ 0)
    (hhi0 : fsg (fadd (fsmul c.D e00) (fsmul (nth b.hi 0 0) e01)) ≥ 0)
    {v : ℤ} (hv : lamLb P c.D 6 lam b.lo b.hi = some v) (hvp : 0 < v)
    (h00 : Len PS e00) (h01 : Len PS e01) (hlam : WFN 6 PS lam)
    {z : Fin 6 → ℝ} (hz : InLB b z) (hz1 : 0 ≤ z 1) :
    0 ≤ fval PS e00 + fval PS e01 * (z 0 / c.D) +
      (z 1 / c.D) * pEvalN 6 PS lam (fun k => z k / c.D) := by
  obtain ⟨hl6, hh6, hin⟩ := hz
  have hDr : (0 : ℝ) < c.D := by exact_mod_cast hD
  -- Λ > 0
  have hbox : ∀ k : Fin 6, nth b.lo k 0 ≤ nth b.hi k 0 ∧ (nth b.hi k 0 - nth b.lo k 0) % 2 = 0 := by
    intro k
    have := all_zipWith hl6 hh6 hw k
    simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at this
    exact this
  have hlb := lamLb_spec h0 hL hD hlam hl6 hh6 hbox hv z (fun k => hin k)
  have hlam_pos : 0 < pEvalN 6 PS lam (fun k => z k / c.D) := by
    by_contra hn
    push_neg at hn
    have hK : (0 : ℝ) < (2 : ℝ) ^ P.sqkL * (c.D : ℝ) ^ 6 := by positivity
    have : (2 : ℝ) ^ P.sqkL * ((c.D : ℝ) ^ 6 * pEvalN 6 PS lam (fun k => z k / c.D)) ≤ 0 := by
      rw [← mul_assoc]; exact mul_nonpos_of_nonneg_of_nonpos hK.le hn
    have hv' : (0 : ℝ) < v := by exact_mod_cast hvp
    linarith
  -- e0 ≥ 0 on [lo₀, hi₀]
  have elo := fsg_nonneg (len_fadd (len_fsmul _ h00) (len_fsmul _ h01)) hlo0
  have ehi := fsg_nonneg (len_fadd (len_fsmul _ h00) (len_fsmul _ h01)) hhi0
  rw [fval_fadd (len_fsmul _ h00) (len_fsmul _ h01), fval_fsmul, fval_fsmul] at elo ehi
  have hz0 := hin 0
  simp only [Fin.val_zero] at hz0
  have hl0 : ((nth b.lo 0 0 : ℤ) : ℝ) ≤ z 0 := hz0.1
  have hh0 : z 0 ≤ ((nth b.hi 0 0 : ℤ) : ℝ) := hz0.2
  have he0 : 0 ≤ (c.D : ℝ) * fval PS e00 + z 0 * fval PS e01 := by
    rcases le_total 0 (fval PS e01) with hs | hs
    · nlinarith
    · nlinarith
  have he0' : 0 ≤ fval PS e00 + fval PS e01 * (z 0 / c.D) := by
    have : fval PS e00 + fval PS e01 * (z 0 / c.D) = ((c.D : ℝ) * fval PS e00 + z 0 * fval PS e01) / c.D := by
      field_simp
    rw [this]; exact div_nonneg he0 hDr.le
  have hr : 0 ≤ z 1 / c.D := div_nonneg hz1 hDr.le
  exact add_nonneg he0' (mul_nonneg hr hlam_pos.le)

/-! ## 4. The eight faces of a tube -/

/-- The root box of the face `ŷ_ax = sg` (units `1/D`). -/
def rootB (D ulo uhi r0 : ℤ) (ax : ℕ) (sg : ℤ) : LB :=
  ⟨([ulo, 0, -D, -D, -D, -D] : List ℤ).set (2 + ax) (sg * D), ([uhi, r0, D, D, D, D] : List ℤ).set (2 + ax) (sg * D)⟩

theorem lroots_eq (D ulo uhi r0 : ℤ) : PackLean.D45DT.lroots D ulo uhi r0 =
    [rootB D ulo uhi r0 0 1, rootB D ulo uhi r0 0 (-1), rootB D ulo uhi r0 1 1, rootB D ulo uhi r0 1 (-1),
     rootB D ulo uhi r0 2 1, rootB D ulo uhi r0 2 (-1), rootB D ulo uhi r0 3 1, rootB D ulo uhi r0 3 (-1)] := rfl

/-- The point `D·(u, r, ŷ)` lies in the root box of the face `ŷ_ax = sg`. -/
theorem root_in {D ulo uhi r0 : ℤ} (hD : 0 < D) {u r : ℝ} {y : Fin 4 → ℝ} (ax : Fin 4) (sg : ℤ)
    (hu1 : (ulo : ℝ) ≤ D * u) (hu2 : D * u ≤ uhi) (hr1 : 0 ≤ r) (hr2 : D * r ≤ r0)
    (hy : ∀ j, |y j| ≤ 1) (hax : y ax = sg) :
    InLB (rootB D ulo uhi r0 ax sg) (fun k => D * Y6 u r y k) := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  have hb : ∀ j, -(D : ℝ) ≤ D * y j ∧ D * y j ≤ D := by
    intro j
    obtain ⟨a, b⟩ := abs_le.1 (hy j)
    constructor <;> nlinarith
  obtain ⟨b0l, b0u⟩ := hb 0
  obtain ⟨b1l, b1u⟩ := hb 1
  obtain ⟨b2l, b2u⟩ := hb 2
  obtain ⟨b3l, b3u⟩ := hb 3
  have hrD : 0 ≤ (D : ℝ) * r := mul_nonneg hDr.le hr1
  have hax' : (D : ℝ) * y ax = sg * D := by rw [hax]; ring
  refine ⟨by simp [rootB], by simp [rootB], fun k => ?_⟩
  fin_cases ax <;> fin_cases k <;> simp at hax' <;>
    simp [rootB, Y6] <;> (try push_cast) <;> (try constructor) <;> linarith

/-- **A point of the tube lies on one of the eight faces.** With `r = max |ζ_i|` and `ζ = r·ŷ`. -/
theorem face_point {D ulo uhi r0 : ℤ} (hD : 0 < D) {u w p1 p2 p3 : ℝ}
    (hu1 : (ulo : ℝ) ≤ D * u) (hu2 : D * u ≤ uhi) (hw : D * |w| ≤ r0) (h1 : D * |p1| ≤ r0)
    (h2 : D * |p2| ≤ r0) (h3 : D * |p3| ≤ r0) :
    ∃ B ∈ PackLean.D45DT.lroots D ulo uhi r0, ∃ (r : ℝ) (y : Fin 4 → ℝ), 0 ≤ r ∧
      X5 u r y = ![u, w, p1, p2, p3] ∧ InLB B (fun k => D * Y6 u r y k) := by
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  set ζ : Fin 4 → ℝ := ![w, p1, p2, p3] with hζ
  set r := max (max |w| |p1|) (max |p2| |p3|) with hr
  have hle : ∀ j, |ζ j| ≤ r := by
    intro j; fin_cases j <;> simp [ζ, r]
  have hr1 : 0 ≤ r := (abs_nonneg _).trans (hle 0)
  have hr2 : D * r ≤ r0 := by
    rcases max_choice (max |w| |p1|) (max |p2| |p3|) with e | e <;> rw [hr, e]
    · rcases max_choice |w| |p1| with e' | e' <;> rw [e'] <;> assumption
    · rcases max_choice |p2| |p3| with e' | e' <;> rw [e'] <;> assumption
  have hmem : ∀ (ax : Fin 4) (sg : ℤ), (sg = 1 ∨ sg = -1) →
      rootB D ulo uhi r0 ax sg ∈ PackLean.D45DT.lroots D ulo uhi r0 := by
    intro ax sg hsg
    rw [lroots_eq]
    rcases hsg with rfl | rfl <;> fin_cases ax <;> simp
  by_cases h0 : r = 0
  · have hz : ∀ j, ζ j = 0 := fun j => abs_nonpos_iff.1 (h0 ▸ hle j)
    refine ⟨_, hmem 0 1 (Or.inl rfl), 0, ![1, 0, 0, 0], le_rfl, ?_, ?_⟩
    · have e0 : w = 0 := hz 0
      have e1 : p1 = 0 := hz 1
      have e2 : p2 = 0 := hz 2
      have e3 : p3 = 0 := hz 3
      ext k; fin_cases k <;> simp [X5, hz, e1, e2, e3]
    · refine root_in hD 0 1 hu1 hu2 le_rfl (by rw [← h0]; exact hr2) ?_ (by simp)
      intro j; fin_cases j <;> simp
  · have hrp : 0 < r := lt_of_le_of_ne hr1 (Ne.symm h0)
    have hax : ∃ ax : Fin 4, |ζ ax| = r := by
      rcases max_choice (max |w| |p1|) (max |p2| |p3|) with e | e
      · rcases max_choice |w| |p1| with e' | e'
        · exact ⟨0, by show |w| = r; rw [hr, e, e']⟩
        · exact ⟨1, by show |p1| = r; rw [hr, e, e']⟩
      · rcases max_choice |p2| |p3| with e' | e'
        · exact ⟨2, by show |p2| = r; rw [hr, e, e']⟩
        · exact ⟨3, by show |p3| = r; rw [hr, e, e']⟩
    obtain ⟨ax, hax⟩ := hax
    let y : Fin 4 → ℝ := fun j => ζ j / r
    have hy : ∀ j, |y j| ≤ 1 := by
      intro j
      simp only [y, abs_div, abs_of_pos hrp]
      exact (div_le_one hrp).2 (hle j)
    have hsg : ∃ sg : ℤ, (sg = 1 ∨ sg = -1) ∧ y ax = sg := by
      rcases le_total 0 (ζ ax) with hs | hs
      · refine ⟨1, Or.inl rfl, ?_⟩
        simp only [y]; rw [abs_of_nonneg hs] at hax; rw [hax, div_self (ne_of_gt hrp)]; simp
      · refine ⟨-1, Or.inr rfl, ?_⟩
        simp only [y]; rw [abs_of_nonpos hs] at hax
        have : ζ ax = -r := by linarith
        rw [this, neg_div, div_self (ne_of_gt hrp)]; simp
    obtain ⟨sg, hsg1, hsg2⟩ := hsg
    refine ⟨_, hmem ax sg hsg1, r, y, hr1, ?_, root_in hD ax sg hu1 hu2 hr1 hr2 hy hsg2⟩
    ext k
    fin_cases k <;> simp [X5, y, ζ] <;> field_simp

#assert_std_axioms PackLean.Formal.DTLocalTree.splitE0_spec PackLean.Formal.DTLocalTree.ltree_cover
  PackLean.Formal.DTLocalTree.leaf_pos PackLean.Formal.DTLocalTree.face_point

end

end PackLean.Formal.DTLocalTree
