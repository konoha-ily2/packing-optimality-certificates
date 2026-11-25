import PackLean.Formal.PolySem
import PackLean.Formal.CoverTree
import PackLean.Formal.CubinoctLP

/-!
# D45 stage 2c: an accepted far box of `cubinoct_n02` has `S ≥ S̄`

`D16C.farAccept P b lam mu eps = true` means: six polynomials in `s ∈ [-1,1]³` have a nonnegative
`lbPoly`.  We evaluate them (`PolySem`) and turn the result into the real inequality used with weak
duality.
-/

namespace PackLean.Formal.Far

open PackLean.D28 PackLean.D16C PackLean.D16 PackLean.Formal.PolySem
open Finset

variable (x : Fin 3 → ℝ)

/-- A list of polynomials, all `WF`. -/
def WFL (l : List Poly) : Prop := ∀ p ∈ l, WF p

theorem psum_WF' {l : List Poly} (h : WFL l) : WF (psum l) := psum_WF h
theorem pEval_psum' {l : List Poly} (h : WFL l) : pEval (psum l) x = (l.map (pEval · x)).sum :=
  pEval_psum x h
theorem map_WFL {α : Type} {l : List α} {f : α → Poly} (h : ∀ a, WF (f a)) : WFL (l.map f) := by
  intro p hp
  simp only [List.mem_map] at hp
  obtain ⟨a, _, rfl⟩ := hp
  exact h a
theorem cons_WFL {p : Poly} {l : List Poly} (hp : WF p) (hl : WFL l) : WFL (p :: l) := by
  intro q hq
  rcases List.mem_cons.1 hq with rfl | hq
  · exact hp
  · exact hl q hq
theorem nil_WFL : WFL [] := by intro q hq; simp at hq

theorem nth_WF {Rq : List Poly} (h : ∀ e ∈ Rq, WF e) (k : ℕ) : WF (nth Rq k []) := by
  unfold nth
  rw [List.getD_eq_getElem?_getD]
  cases hk : Rq[k]? with
  | none => simp
  | some e => simpa using h e (List.mem_of_getElem? hk)

/-- Discharger for the `WF` side conditions. -/
macro "wf_tac" : tactic =>
  `(tactic| repeat (first | assumption | (with_reducible apply map_WFL; intro _) | with_reducible apply cons_WFL | with_reducible apply nil_WFL | with_reducible apply psum_WF' | exact nth_WF (by assumption) _ | with_reducible apply padd_WF | with_reducible apply psub_WF | with_reducible apply pmul_WF | with_reducible apply psmulZ_WF | with_reducible apply pneg_WF | with_reducible apply const_WF | with_reducible apply var_WF | with_reducible apply affP_WF | with_reducible apply psum_WF))

/-- The unnormalised rotation matrix of the quaternion `(w, a, b, c)`, row by row (as `rotOf`). -/
def rqList (w a b c : ℝ) : List ℝ :=
  [w ^ 2 + a ^ 2 - b ^ 2 - c ^ 2, 2 * (a * b - w * c), 2 * (a * c + w * b),
   2 * (a * b + w * c), w ^ 2 + b ^ 2 - a ^ 2 - c ^ 2, 2 * (b * c - w * a),
   2 * (a * c - w * b), 2 * (b * c + w * a), w ^ 2 + c ^ 2 - a ^ 2 - b ^ 2]

theorem rotOf_WF {w a b c : Poly} (hw : WF w) (ha : WF a) (hb : WF b) (hc : WF c) :
    (∀ e ∈ (rotOf [] w a b c).1, WF e) ∧ WF (rotOf [] w a b c).2 := by
  constructor
  · intro e he
    simp only [rotOf, List.mem_cons, List.not_mem_nil, or_false] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> wf_tac
  · simp only [rotOf]; wf_tac

theorem rotOf_eval {w a b c : Poly} (hw : WF w) (ha : WF a) (hb : WF b) (hc : WF c) :
    (rotOf [] w a b c).1.map (pEval · x) = rqList (pEval w x) (pEval a x) (pEval b x) (pEval c x) ∧
    pEval (rotOf [] w a b c).2 x
      = pEval w x ^ 2 + pEval a x ^ 2 + pEval b x ^ 2 + pEval c x ^ 2 := by
  constructor
  · simp (disch := wf_tac) only [rotOf, List.map_cons, List.map_nil, pEval_padd, pEval_psub,
      pEval_pmul, pEval_psmulZ, rqList, List.cons.injEq, and_true]
    push_cast
    exact ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring⟩
  · simp (disch := wf_tac) only [rotOf, pEval_padd, pEval_pmul]
    ring

/-- The sum built by `foldr` with skipped indices. -/
theorem foldr_skip (L : List ℕ) (c : ℕ → Prop) [DecidablePred c] (g : ℕ → List Poly)
    (hg : ∀ si, ∀ p ∈ g si, WF p) :
    (∀ p ∈ L.foldr (fun si acc => if c si then acc else g si ++ acc) [], WF p) ∧
    ((L.foldr (fun si acc => if c si then acc else g si ++ acc) []).map (pEval · x)).sum
      = (L.map fun si => if c si then 0 else ((g si).map (pEval · x)).sum).sum := by
  induction L with
  | nil => simp
  | cons si L ih =>
    obtain ⟨ih1, ih2⟩ := ih
    by_cases h : c si
    · simp only [List.foldr_cons, h, ite_true, List.map_cons, List.sum_cons, zero_add]
      exact ⟨ih1, ih2⟩
    · simp only [List.foldr_cons, h, ite_false, List.map_cons, List.sum_cons, List.map_append,
        List.sum_append]
      refine ⟨fun p hp => ?_, by rw [ih2]⟩
      rcases List.mem_append.1 hp with hp | hp
      · exact hg si p hp
      · exact ih1 p hp


theorem map_WF {α : Type} {l : List α} {f : α → Poly} (h : ∀ a, WF (f a)) : ∀ p ∈ l.map f, WF p := by
  intro p hp
  simp only [List.mem_map] at hp
  obtain ⟨a, _, rfl⟩ := hp
  exact h a

/-- `foldr_skip` without the `if`, when skipped indices contribute `0` anyway. -/
theorem foldr_skip' (L : List ℕ) (c : ℕ → Prop) [DecidablePred c] (g : ℕ → List Poly)
    (hg : ∀ si, ∀ p ∈ g si, WF p) (hz : ∀ si, c si → ((g si).map (pEval · x)).sum = 0) :
    (∀ p ∈ L.foldr (fun si acc => if c si then acc else g si ++ acc) [], WF p) ∧
    ((L.foldr (fun si acc => if c si then acc else g si ++ acc) []).map (pEval · x)).sum
      = (L.map fun si => ((g si).map (pEval · x)).sum).sum := by
  obtain ⟨h1, h2⟩ := foldr_skip x L c g hg
  refine ⟨h1, h2.trans ?_⟩
  congr 1
  refine List.map_congr_left fun si _ => ?_
  split_ifs with h
  · exact (hz si h).symm
  · rfl

theorem range8 : List.range 8 = [0, 1, 2, 3, 4, 5, 6, 7] := rfl
theorem range3 : List.range 3 = [0, 1, 2] := rfl

/-- Values of the far polynomials: coefficient `l k`, sign `ε k j`, sign vector `σ k i`. -/
def lv (lam : List ℕ) (k : ℕ) : ℝ := (nth lam k 0 : ℕ)
def ev (eps : ℕ) (k j : ℕ) : ℝ := (epsAt eps k j : ℤ)
def sgv (k i : ℕ) : ℝ := (nth (nth sigmas k []) i 0 : ℤ)

/-- **An accepted far box gives six real inequalities** at each point `x ∈ [-1,1]³` of the box
(`rq k`, `n`: values of the 9 entries of `Rq` and of `N`). -/
theorem accept_vals (P : CProb) (b : RBox) (lam : List ℕ) (mu eps : ℕ)
    (h : farAccept P b lam mu eps = true) (Rq : List Poly) (N : Poly) (hb : boxRot P b = (Rq, N))
    (hRq : ∀ e ∈ Rq, WF e) (hN : WF N) (hx : ∀ i, |x i| ≤ 1) :
    lam.length = 8 ∧ lam.foldl (· + ·) 0 = P.qlam ∧
    ∀ i : ℕ, i < 3 → ∀ sg : ℤ, (sg = 1 ∨ sg = -1) →
      let rq := fun k => pEval (nth Rq k []) x
      let n := pEval N x
      0 ≤ ((mu : ℝ) * P.sbar.2 * P.t1.2 - 2 * P.qlam * P.sbar.1 * P.t1.2) * n
        + ∑ k ∈ range 8, ∑ j ∈ range 3,
            lv lam k * ev eps k j * P.sbar.2 * P.t1.2 * ∑ i' ∈ range 3, sgv k i' * rq (3 * i' + j)
        - sg * (2 * P.t1.1 * P.sbar.2) * ((∑ k ∈ range 8, lv lam k * sgv k i) * n + mu * rq (3 * i)) := by
  simp only [farAccept, hb, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨⟨hlen, hsum⟩, _⟩, hall⟩ := h
  refine ⟨hlen, hsum, fun i hi sg hsg => ?_⟩
  have h1 := hall i (List.mem_range.2 hi) sg (by rcases hsg with rfl | rfl <;> simp)
  have hn := nth_WF hRq
  have hg : ∀ si, ∀ p ∈ (List.map (fun j => psmulZ (↑(nth lam si 0) * epsAt eps si j * ↑P.sbar.2 * ↑P.t1.2)
      (psum (List.map (fun i => psmulZ (nth (nth sigmas si []) i 0) (nth Rq (3 * i + j) [])) (List.range 3))))
      (List.range 3)), WF p := fun si =>
    map_WF (fun j => psmulZ_WF _ (psum_WF (map_WF (fun i => psmulZ_WF _ (hn _)))))
  have hz : ∀ si, ((nth lam si 0 : ℕ) : ℤ) = 0 → ((List.map (fun j => psmulZ (↑(nth lam si 0) * epsAt eps si j * ↑P.sbar.2 * ↑P.t1.2)
      (psum (List.map (fun i => psmulZ (nth (nth sigmas si []) i 0) (nth Rq (3 * i + j) [])) (List.range 3))))
      (List.range 3)).map (pEval · x)).sum = 0 := by
    intro si hs
    simp [pEval_psmulZ, hs, Function.comp_def]
  obtain ⟨hF1, hF2⟩ := foldr_skip' x (List.range 8) (fun si => ((nth lam si 0 : ℕ) : ℤ) = 0) _ hg hz
  have hall2 : ∀ p ∈ [psmulZ (↑mu * ↑P.sbar.2 * ↑P.t1.2 - 2 * ↑P.qlam * P.sbar.1 * ↑P.t1.2) N] ++
      List.foldr (fun si acc => if ((nth lam si 0 : ℕ) : ℤ) = 0 then acc else
        List.map (fun j => psmulZ (↑(nth lam si 0) * epsAt eps si j * ↑P.sbar.2 * ↑P.t1.2)
          (psum (List.map (fun i => psmulZ (nth (nth sigmas si []) i 0) (nth Rq (3 * i + j) []))
            (List.range 3)))) (List.range 3) ++ acc) [] (List.range 8), WF p := by
    intro p hp
    rcases List.mem_append.1 hp with hp | hp
    · simp only [List.mem_singleton] at hp; subst hp; exact psmulZ_WF _ hN
    · exact hF1 p hp
  have h3 := fun hw => le_trans (Int.cast_nonneg (R := ℝ) h1) (lbPoly_le x hw hx)
  specialize h3 (padd_WF (psum_WF hall2) (by wf_tac))
  rw [pEval_padd x (psum_WF hall2) (by wf_tac), pEval_psum x hall2, List.map_append,
    List.sum_append, hF2] at h3
  simp (disch := wf_tac) only [pEval_psmulZ, pEval_padd, pEval_psum', List.map_cons, List.map_nil,
    List.sum_cons, List.sum_nil, List.map_map, Function.comp_def] at h3
  simp only [range8, range3, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    List.foldl_cons, List.foldl_nil] at h3
  dsimp only
  simp only [sum_range_succ, sum_range_zero, lv, ev, sgv]
  push_cast at h3 ⊢
  linarith

/-- **The real inequality behind an accepted far box.**  `rq k / n` are the entries of `R`
(row-major), `l` the multipliers (`∑ l = Q`), `M` the face multiplier, `ε` the signs of the absolute
values, `σ` the sign vectors, `t` the translation with `‖t‖₁ ≤ T1 = tn/td`.  If the six inequalities
of `accept_vals` hold, every feasible `(t, S)` has `S ≥ S̄ = sn/sd`. -/
theorem far_core (n Q M sd td sn tn S : ℝ) (l : ℕ → ℝ) (ε σ : ℕ → ℕ → ℝ) (rq t : ℕ → ℝ)
    (hn : 0 < n) (hsd : 0 < sd) (htd : 0 < td) (htn : 0 < tn) (hQ0 : 0 < Q)
    (hl : ∀ k, 0 ≤ l k) (hQ : ∑ k ∈ range 8, l k = Q) (hM : 0 ≤ M)
    (hε : ∀ k j, ε k j = 1 ∨ ε k j = -1)
    (hacc : ∀ i, i < 3 → ∀ sg : ℝ, (sg = 1 ∨ sg = -1) →
      0 ≤ (M * sd * td - 2 * Q * sn * td) * n
        + ∑ k ∈ range 8, ∑ j ∈ range 3, l k * ε k j * sd * td * ∑ i' ∈ range 3, σ k i' * rq (3 * i' + j)
        - sg * (2 * tn * sd) * ((∑ k ∈ range 8, l k * σ k i) * n + M * rq (3 * i)))
    (hrow : ∀ k, k < 8 → ∑ i ∈ range 3, σ k i * t i
        + 1 / 2 * ∑ j ∈ range 3, |∑ i ∈ range 3, σ k i * (rq (3 * i + j) / n)| ≤ S)
    (hface : ∑ i ∈ range 3, rq (3 * i) / n * t i ≤ -(1 / 2))
    (ht : ∑ i ∈ range 3, |t i| ≤ tn / td) :
    sn / sd ≤ S := by
  set T := tn / td with hT
  set Sb := sn / sd with hSb
  have hT0 : 0 < T := div_pos htn htd
  -- unnormalised quantities
  set P : ℕ → ℕ → ℝ := fun k j => ∑ i' ∈ range 3, σ k i' * rq (3 * i' + j) with hP
  set E : ℕ → ℝ := fun i => (∑ k ∈ range 8, l k * σ k i) * n + M * rq (3 * i) with hE
  set Lt := ∑ k ∈ range 8, l k * ∑ i ∈ range 3, σ k i * t i with hLt
  set Pabs := ∑ k ∈ range 8, l k * ∑ j ∈ range 3, |P k j| with hPabs
  set Peps := ∑ k ∈ range 8, l k * ∑ j ∈ range 3, ε k j * P k j with hPeps
  set Ft := ∑ i ∈ range 3, rq (3 * i) * t i with hFt
  set B := (M - 2 * Q * Sb) * n + Peps with hB
  -- rows times n
  have hrow' : ∀ k ∈ range 8, n * ∑ i ∈ range 3, σ k i * t i + 1 / 2 * ∑ j ∈ range 3, |P k j|
      ≤ S * n := by
    intro k hk
    have h := hrow k (mem_range.1 hk)
    have hPn : ∀ j, |∑ i ∈ range 3, σ k i * (rq (3 * i + j) / n)| = |P k j| / n := fun j => by
      rw [hP]; simp only
      rw [← abs_of_pos hn, ← abs_div, abs_of_pos hn, sum_div]
      congr 1; exact sum_congr rfl fun i _ => by ring
    simp only [hPn, ← sum_div] at h
    have := mul_le_mul_of_nonneg_left h hn.le
    rw [mul_add, mul_comm n (1 / 2 * _), mul_assoc, div_mul_cancel₀ _ hn.ne'] at this
    linarith
  have h1 : n * Lt + 1 / 2 * Pabs ≤ Q * S * n := by
    have := sum_le_sum fun k hk => mul_le_mul_of_nonneg_left (hrow' k hk) (hl k)
    simp only [mul_add, sum_add_distrib] at this
    rw [← sum_mul, hQ] at this
    rw [hLt, hPabs, mul_sum, mul_sum]
    calc ∑ k ∈ range 8, n * (l k * ∑ i ∈ range 3, σ k i * t i)
          + ∑ k ∈ range 8, 1 / 2 * (l k * ∑ j ∈ range 3, |P k j|)
        = ∑ k ∈ range 8, l k * (n * ∑ i ∈ range 3, σ k i * t i)
          + ∑ k ∈ range 8, l k * (1 / 2 * ∑ j ∈ range 3, |P k j|) := by
            congr 1 <;> exact sum_congr rfl fun k _ => by ring
      _ ≤ Q * (S * n) := this
      _ = Q * S * n := by ring
  have h2 : Peps ≤ Pabs := by
    refine sum_le_sum fun k _ => mul_le_mul_of_nonneg_left (sum_le_sum fun j _ => ?_) (hl k)
    rcases hε k j with h | h <;> rw [h]
    · rw [one_mul]; exact le_abs_self _
    · rw [neg_one_mul]; exact neg_le_abs _
  have h3 : M * Ft ≤ -(M * n / 2) := by
    have h := mul_le_mul_of_nonneg_left hface (mul_nonneg hM hn.le)
    rw [mul_sum] at h
    rw [hFt, mul_sum]
    have : ∀ i ∈ range 3, M * n * (rq (3 * i) / n * t i) = M * (rq (3 * i) * t i) := fun i _ => by
      field_simp
    rw [sum_congr rfl this] at h
    linarith
  have hEsum : ∑ i ∈ range 3, E i * t i = n * Lt + M * Ft := by
    rw [hE, hLt, hFt]
    simp only [add_mul, sum_add_distrib, mul_sum, sum_mul]
    congr 1
    · rw [sum_comm]; exact sum_congr rfl fun k _ => sum_congr rfl fun i _ => by ring
    · exact sum_congr rfl fun i _ => by ring
  have hval : ∀ i, i < 3 → ∀ sg : ℝ, (sg = 1 ∨ sg = -1) → sg * (2 * T * E i) ≤ B := by
    intro i hi sg hsg
    have h := hacc i hi sg hsg
    have hsdtd : 0 < sd * td := mul_pos hsd htd
    have e1 : ∑ k ∈ range 8, ∑ j ∈ range 3, l k * ε k j * sd * td * ∑ i' ∈ range 3, σ k i' * rq (3 * i' + j)
        = sd * td * Peps := by
      rw [hPeps, mul_sum]
      refine sum_congr rfl fun k _ => ?_
      rw [mul_sum, mul_sum]
      exact sum_congr rfl fun j _ => by rw [hP]; ring
    rw [e1] at h
    have e2 : (M * sd * td - 2 * Q * sn * td) * n + sd * td * Peps
        - sg * (2 * tn * sd) * ((∑ k ∈ range 8, l k * σ k i) * n + M * rq (3 * i))
        = sd * td * (B - sg * (2 * T * E i)) := by
      rw [hB, hSb, hT, hE]; field_simp
    rw [e2] at h
    have := (mul_nonneg_iff_of_pos_left hsdtd).1 h
    linarith
  have hB0 : 0 ≤ B := by
    have a := hval 0 (by norm_num) 1 (Or.inl rfl)
    have b := hval 0 (by norm_num) (-1) (Or.inr rfl)
    nlinarith
  have hEt : -B ≤ 2 * ∑ i ∈ range 3, E i * t i := by
    have habs : ∀ i ∈ range 3, T * (2 * |E i| * |t i|) ≤ B * |t i| := by
      intro i hi
      have a := hval i (mem_range.1 hi) 1 (Or.inl rfl)
      have b := hval i (mem_range.1 hi) (-1) (Or.inr rfl)
      have : 2 * T * |E i| ≤ B := by
        rcases abs_cases (E i) with ⟨h, _⟩ | ⟨h, _⟩ <;> rw [h] <;> linarith
      nlinarith [abs_nonneg (t i)]
    have hs := sum_le_sum habs
    rw [← mul_sum, ← mul_sum] at hs
    have hs2 : T * ∑ i ∈ range 3, 2 * |E i| * |t i| ≤ B * T :=
      hs.trans (mul_le_mul_of_nonneg_left ht hB0)
    have hs3 : ∑ i ∈ range 3, 2 * |E i| * |t i| ≤ B := by
      have := hs2; rw [mul_comm B T] at this
      exact le_of_mul_le_mul_left this hT0
    have hs4 : -(∑ i ∈ range 3, 2 * |E i| * |t i|) ≤ 2 * ∑ i ∈ range 3, E i * t i := by
      rw [mul_sum, ← sum_neg_distrib]
      refine sum_le_sum fun i _ => ?_
      have := neg_abs_le (E i * t i)
      rw [abs_mul] at this
      linarith
    linarith
  have hfin : 2 * Q * Sb * n ≤ 2 * Q * S * n := by
    rw [hEsum, hB] at *
    nlinarith
  have hQn : 0 < 2 * Q * n := by positivity
  nlinarith

/-! ## From the box to the rotation matrix -/

theorem pEval_nth (Rq : List Poly) (k : ℕ) :
    pEval (nth Rq k []) x = (Rq.map (pEval · x)).getD k 0 := by
  unfold nth
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_map]
  cases Rq[k]? <;> simp

theorem affP_WF' (c w : ℤ) (i : ℕ) (hi : i < 3) : WF (affP c w i) := affP_WF c w ⟨i, hi⟩
theorem pEval_affP' (c w : ℤ) (i : ℕ) (hi : i < 3) :
    pEval (affP c w i) x = c + w * x ⟨i, hi⟩ := pEval_affP x c w ⟨i, hi⟩

/-- Values of the polynomials of `boxRot` at `s`: the quaternion is `D²·(1, τ, −b+γτ, γ+bτ)` with
`(b, γ, τ)·D = (B, G, T)`, the affine values of the box at `s`. -/
theorem boxRot_spec (P : CProb) (b : RBox) :
    let B := (((b.l0 + b.h0) / 2 : ℤ) : ℝ) + (((b.h0 - b.l0) / 2 : ℤ) : ℝ) * x 0
    let G := (((b.l1 + b.h1) / 2 : ℤ) : ℝ) + (((b.h1 - b.l1) / 2 : ℤ) : ℝ) * x 1
    let T := (((b.l2 + b.h2) / 2 : ℤ) : ℝ) + (((b.h2 - b.l2) / 2 : ℤ) : ℝ) * x 2
    let D : ℝ := (P.den : ℝ)
    (∀ e ∈ (boxRot P b).1, WF e) ∧ WF (boxRot P b).2 ∧
    (boxRot P b).1.map (pEval · x) = rqList (D * D) (T * D) (-(B * D) + G * T) (G * D + B * T) ∧
    pEval (boxRot P b).2 x
      = (D * D) ^ 2 + (T * D) ^ 2 + (-(B * D) + G * T) ^ 2 + (G * D + B * T) ^ 2 := by
  intro B G T D
  have hd : WF ([(z3, q1 P.den)] : Poly) := const_WF _
  have hb := affP_WF' ((b.l0 + b.h0) / 2) ((b.h0 - b.l0) / 2) 0 (by norm_num)
  have hg := affP_WF' ((b.l1 + b.h1) / 2) ((b.h1 - b.l1) / 2) 1 (by norm_num)
  have ht := affP_WF' ((b.l2 + b.h2) / 2) ((b.h2 - b.l2) / 2) 2 (by norm_num)
  have hW := rotOf_WF (pmul_WF hd hd) (pmul_WF ht hd)
    (padd_WF (pneg_WF (pmul_WF hb hd)) (pmul_WF hg ht)) (padd_WF (pmul_WF hg hd) (pmul_WF hb ht))
  have hE := rotOf_eval x (pmul_WF hd hd) (pmul_WF ht hd)
    (padd_WF (pneg_WF (pmul_WF hb hd)) (pmul_WF hg ht)) (padd_WF (pmul_WF hg hd) (pmul_WF hb ht))
  simp only [boxRot]
  refine ⟨hW.1, hW.2, ?_, ?_⟩
  · rw [hE.1]
    simp (disch := wf_tac) only [pEval_pmul, pEval_padd, pEval_pneg, pEval_const,
      pEval_affP' x _ _ 0 (by norm_num), pEval_affP' x _ _ 1 (by norm_num),
      pEval_affP' x _ _ 2 (by norm_num)]
    rfl
  · rw [hE.2]
    simp (disch := wf_tac) only [pEval_pmul, pEval_padd, pEval_pneg, pEval_const,
      pEval_affP' x _ _ 0 (by norm_num), pEval_affP' x _ _ 1 (by norm_num),
      pEval_affP' x _ _ 2 (by norm_num)]
    rfl

/-! ## The rotation of the normal form `(b, γ, τ)` -/

/-- `R(q)/|q|²` for `q = (1, τ, −b + γτ, γ + bτ)`. -/
noncomputable def Rmat (b γ τ : ℝ) : Matrix (Fin 3) (Fin 3) ℝ := fun i j =>
  (rqList 1 τ (-b + γ * τ) (γ + b * τ)).getD (3 * i.val + j.val) 0 /
    (1 + τ ^ 2 + (-b + γ * τ) ^ 2 + (γ + b * τ) ^ 2)

theorem rqList_smul (c w a b d : ℝ) :
    rqList (c * w) (c * a) (c * b) (c * d) = (rqList w a b d).map (fun v => c ^ 2 * v) := by
  simp only [rqList, List.map_cons, List.map_nil, List.cons.injEq, and_true]
  exact ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring⟩

theorem getD_map_mul (l : List ℝ) (c : ℝ) (k : ℕ) :
    (l.map (fun v => c * v)).getD k 0 = c * l.getD k 0 := by
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_map]
  cases l[k]? <;> simp

/-- The sign vector number `k` of `sigmas`, as an element of `Sgn`. -/
def sgnOf (k : ℕ) : Sgn := fun i => decide (nth (nth sigmas k []) i 0 = -1)

theorem sv_sgnOf (k : ℕ) (hk : k < 8) (i : Fin 3) : sv (sgnOf k) i = sgv k i := by
  interval_cases k <;> fin_cases i <;> simp [sv, sgnOf, sgv, sigmas, nth]

theorem sum3 (f : ℕ → ℝ) : ∑ i : Fin 3, f i.val = ∑ k ∈ range 3, f k := by
  simp [Fin.sum_univ_three, sum_range_succ]

/-- A vector of `E3` as a function on `ℕ` (zero from index 3 on). -/
def tN (t : E3) (k : ℕ) : ℝ := if h : k < 3 then t ⟨k, h⟩ else 0

theorem tN_val (t : E3) (i : Fin 3) : tN t i.val = t i := by simp [tN, i.isLt]

theorem sum8 (lam : List ℕ) (h : lam.length = 8) :
    (lam.foldl (· + ·) 0 : ℕ) = ∑ k ∈ range 8, nth lam k 0 := by
  match lam, h with
  | [a0, a1, a2, a3, a4, a5, a6, a7], _ => simp [nth, sum_range_succ]

/-- **An accepted far box.**  At every point `z` of the box (units of `den`), with
`R = Rmat (z/den)`: a feasible `(t, S)` of the LP with `‖t‖₁ ≤ T1` has `S ≥ S̄`. -/
theorem accept_box (P : CProb) (b : RBox) (lam : List ℕ) (mu eps : ℕ)
    (hacc : farAccept P b lam mu eps = true) (hwf : rboxWf b = true)
    (hden : 0 < P.den) (hsd : 0 < P.sbar.2) (htd : 0 < P.t1.2) (htn : 0 < P.t1.1)
    (hq : 0 < P.qlam) (z : Fin 3 → ℝ) (hz : CoverTree.inBox b z) (t : E3) (S : ℝ)
    (hlp : cubeLP (Rmat (z 0 / P.den) (z 1 / P.den) (z 2 / P.den)) t S)
    (ht : ∑ i, |t i| ≤ (P.t1.1 : ℝ) / P.t1.2) :
    (P.sbar.1 : ℝ) / P.sbar.2 ≤ S := by
  simp only [rboxWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hwf
  obtain ⟨⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, e0⟩, e1⟩, e2⟩, _⟩ := hwf
  obtain ⟨a1, a2, a3, a4, a5, a6⟩ := hz
  -- centre and half-width of each axis
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
  obtain ⟨s0, hs0, hz0⟩ := ax b.l0 b.h0 (z 0) h0 e0 a1 a2
  obtain ⟨s1, hs1, hz1⟩ := ax b.l1 b.h1 (z 1) h1 e1 a3 a4
  obtain ⟨s2, hs2, hz2⟩ := ax b.l2 b.h2 (z 2) h2 e2 a5 a6
  set x : Fin 3 → ℝ := ![s0, s1, s2] with hxdef
  have hx : ∀ i, |x i| ≤ 1 := fun i => by fin_cases i <;> simpa [hxdef]
  obtain ⟨hW1, hW2, hmap, hNv⟩ := boxRot_spec x P b
  rcases hb : boxRot P b with ⟨Rq, N⟩
  rw [hb] at hW1 hW2 hmap hNv
  simp only at hW1 hW2 hmap hNv
  obtain ⟨hlen, hsum, hvals⟩ := accept_vals x P b lam mu eps hacc Rq N hb hW1 hW2 hx
  -- the affine values are the coordinates
  have hB : (((b.l0 + b.h0) / 2 : ℤ) : ℝ) + (((b.h0 - b.l0) / 2 : ℤ) : ℝ) * x 0 = z 0 := by
    simpa [hxdef] using hz0
  have hG : (((b.l1 + b.h1) / 2 : ℤ) : ℝ) + (((b.h1 - b.l1) / 2 : ℤ) : ℝ) * x 1 = z 1 := by
    simpa [hxdef] using hz1
  have hT : (((b.l2 + b.h2) / 2 : ℤ) : ℝ) + (((b.h2 - b.l2) / 2 : ℤ) : ℝ) * x 2 = z 2 := by
    simpa [hxdef] using hz2
  rw [hB, hG, hT] at hmap hNv
  set D : ℝ := (P.den : ℝ) with hD
  have hD0 : 0 < D := by rw [hD]; exact_mod_cast hden
  set bb := z 0 / D
  set gg := z 1 / D
  set tt := z 2 / D
  set qn := 1 + tt ^ 2 + (-bb + gg * tt) ^ 2 + (gg + bb * tt) ^ 2 with hqn
  have hqn0 : 0 < qn := by positivity
  have hargs : rqList (D * D) (z 2 * D) (-(z 0 * D) + z 1 * z 2) (z 1 * D + z 0 * z 2)
      = rqList (D ^ 2 * 1) (D ^ 2 * tt) (D ^ 2 * (-bb + gg * tt)) (D ^ 2 * (gg + bb * tt)) := by
    simp only [bb, gg, tt]; congr 1 <;> field_simp <;> ring
  rw [hargs, rqList_smul] at hmap
  have hrq : ∀ k, pEval (nth Rq k []) x = (D ^ 2) ^ 2 * (rqList 1 tt (-bb + gg * tt) (gg + bb * tt)).getD k 0 := by
    intro k; rw [pEval_nth, hmap, getD_map_mul]
  have hn : pEval N x = (D ^ 2) ^ 2 * qn := by
    rw [hNv, hqn]; simp only [bb, gg, tt]; field_simp
  have hR : ∀ i j : Fin 3, Rmat bb gg tt i j = pEval (nth Rq (3 * i.val + j.val) []) x / pEval N x := by
    intro i j
    rw [hrq, hn, Rmat, ← hqn, mul_div_mul_left _ _ (by positivity)]
  have hn0 : 0 < pEval N x := by rw [hn]; positivity
  -- apply the real inequality
  refine far_core (pEval N x) (P.qlam : ℝ) (mu : ℝ) (P.sbar.2 : ℝ) (P.t1.2 : ℝ) (P.sbar.1 : ℝ)
    (P.t1.1 : ℝ) S (lv lam) (ev eps) sgv (fun k => pEval (nth Rq k []) x) (tN t) hn0
    (by exact_mod_cast hsd) (by exact_mod_cast htd) (by exact_mod_cast htn) (by exact_mod_cast hq)
    (fun k => by simp [lv]) ?_ (by positivity) ?_ ?_ ?_ ?_ ?_
  · -- ∑ l = Q
    have := sum8 lam hlen
    rw [hsum] at this
    simp only [lv]
    exact_mod_cast this.symm
  · intro k j
    simp only [ev, epsAt]
    split_ifs <;> simp
  · intro i hi sg hsg
    rcases hsg with rfl | rfl
    · have := hvals i hi 1 (Or.inl rfl); push_cast at this; simpa using this
    · have := hvals i hi (-1) (Or.inr rfl); push_cast at this; simpa using this
  · intro k hk
    have hrow := hlp.1 (sgnOf k)
    simp only [gSup, hR, sv_sgnOf k hk, ← tN_val t] at hrow
    simp only [Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two] at hrow
    simp only [sum_range_succ, sum_range_zero, zero_add]
    convert hrow using 2 <;> norm_num
  · have hface := hlp.2
    simp only [hR, ← tN_val t, Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two] at hface
    simp only [sum_range_succ, sum_range_zero, zero_add]
    convert hface using 2 <;> norm_num
  · simp only [← tN_val t, Fin.sum_univ_three, Fin.val_zero, Fin.val_one, Fin.val_two] at ht
    simp only [sum_range_succ, sum_range_zero, zero_add]
    exact ht

end PackLean.Formal.Far
