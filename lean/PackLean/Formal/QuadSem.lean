import PackLean.Formal.PolySemG

/-!
# D45 stage 4c: meaning of the far-field quadratics of `D16.Core`

The far test of `D16.Core` (`acceptOk`, `discLb`) works with quadratics in the box coordinates
`s ∈ [-1, 1]³` with integer coefficients (`Quad`, 10 coefficients in the order
`[1, s₀, s₁, s₂, s₀², s₀s₁, s₀s₂, s₁², s₁s₂, s₂²]`), and combines them with coefficients in
`ℚ(√ps)` (`combine`) before taking a lower bound (`lbQuad`).  This file gives all of that a meaning:

* `qEval q s` (value of a `Quad`), `affEval` (value of an `Aff`), `affMul`, `qadd`, `qsub`, `qsmul`;
* `rboxQ`: the four quaternion components on the box, `den` in the slot of the chart `ch`, the other
  three `uᵢ = (lᵢ + hᵢ)/2 + (hᵢ − lᵢ)/2 · sᵢ` (`rboxQ_eval`); every point of the box is such a `u`
  (`box_param`) and every `u` with `|s| ≤ 1` lies in the box (`box_mem`);
* `rotQ`: the unnormalised rotation matrix `Rq(q)` (row by row) and `N = |q|²` (`rotQ_eval`);
* `combine`: the value is `Σ_t fval(c_t) · qEval(q_t)` (`gEval_combine`);
* `lbQuad`: a lower bound of `K · value` on `[-1, 1]³` (`lbQuad_le`), and the two together
  (`lbQuad_combine`), which is what `farLbW` and `discLb` compute.
-/

namespace PackLean.Formal.QuadSem

open PackLean.D28 (FE fadd fsmul fzero Quad Aff affMul qadd qsub qsmul quadKind RBox rboxQ rboxWf rotQ
  combine monoLb loHi Mono)
open PackLean.Formal.FieldSem
open PackLean.Formal.PolySem (monoEval monoEval_three)
open PackLean.Formal.PolySemG (BracketG maskOf term_lb)

/-! ## Values -/

/-- The 10 monomials of a `Quad`. -/
noncomputable def qmono (s : Fin 3 → ℝ) : List ℝ :=
  [1, s 0, s 1, s 2, s 0 ^ 2, s 0 * s 1, s 0 * s 2, s 1 ^ 2, s 1 * s 2, s 2 ^ 2]

/-- Value of an integer quadratic. -/
noncomputable def qEval (q : Quad) (s : Fin 3 → ℝ) : ℝ :=
  (List.zipWith (fun (c : ℤ) (m : ℝ) => (c : ℝ) * m) q (qmono s)).sum

/-- Value of a quadratic with coefficients in `ℚ(√ps)` (10 coefficients). -/
noncomputable def gEval (ps : List ℕ) (G : List FE) (s : Fin 3 → ℝ) : ℝ :=
  (List.zipWith (fun (c : FE) (m : ℝ) => fval ps c * m) G (qmono s)).sum

/-- Value of an affine form `c + w₁s₀ + w₂s₁ + w₃s₂`. -/
noncomputable def affEval (a : Aff) (s : Fin 3 → ℝ) : ℝ :=
  a.c + a.w1 * s 0 + a.w2 * s 1 + a.w3 * s 2

variable (s : Fin 3 → ℝ) {ps : List ℕ}

theorem qEval_affMul (a b : Aff) : qEval (affMul a b) s = affEval a s * affEval b s := by
  simp only [qEval, affMul, qmono, affEval, List.zipWith_cons_cons, List.zipWith_nil_left,
    List.sum_cons, List.sum_nil]
  push_cast
  ring

theorem affMul_length (a b : Aff) : (affMul a b).length = 10 := rfl

theorem zw_add (f : ℤ → ℤ → ℤ) (α β : ℝ) (hf : ∀ x y, ((f x y : ℤ) : ℝ) = α * x + β * y) :
    ∀ (a b : List ℤ) (m : List ℝ), a.length = b.length →
      (List.zipWith (fun (c : ℤ) (x : ℝ) => (c : ℝ) * x) (List.zipWith f a b) m).sum
        = α * (List.zipWith (fun (c : ℤ) (x : ℝ) => (c : ℝ) * x) a m).sum
          + β * (List.zipWith (fun (c : ℤ) (x : ℝ) => (c : ℝ) * x) b m).sum
  | [], [], m, _ => by simp
  | [], _ :: _, _, h => by simp at h
  | _ :: _, [], _, h => by simp at h
  | _ :: _, _ :: _, [], _ => by simp
  | x :: a, y :: b, z :: m, h => by
    simp only [List.zipWith_cons_cons, List.sum_cons]
    rw [zw_add f α β hf a b m (by simpa using h), hf]
    ring

theorem qEval_qadd {a b : Quad} (h : a.length = b.length) :
    qEval (qadd a b) s = qEval a s + qEval b s := by
  have := zw_add (· + ·) 1 1 (fun x y => by push_cast; ring) a b (qmono s) h
  simpa [qEval, qadd] using this

theorem qEval_qsub {a b : Quad} (h : a.length = b.length) :
    qEval (qsub a b) s = qEval a s - qEval b s := by
  have := zw_add (· - ·) 1 (-1) (fun x y => by push_cast; ring) a b (qmono s) h
  simp only [qEval, qsub]
  rw [this]
  ring

theorem zw_smul (c : ℤ) : ∀ (a : List ℤ) (m : List ℝ),
    (List.zipWith (fun (d : ℤ) (x : ℝ) => (d : ℝ) * x) (a.map (fun x => c * x)) m).sum
      = c * (List.zipWith (fun (d : ℤ) (x : ℝ) => (d : ℝ) * x) a m).sum
  | [], m => by simp
  | _ :: _, [] => by simp
  | x :: a, z :: m => by
    simp only [List.map_cons, List.zipWith_cons_cons, List.sum_cons]
    rw [zw_smul c a m]
    push_cast
    ring

theorem qEval_qsmul (c : ℤ) (a : Quad) : qEval (qsmul c a) s = c * qEval a s :=
  zw_smul c a (qmono s)

theorem qadd_length (a b : Quad) : (qadd a b).length = min a.length b.length := by
  simp [qadd]

theorem qsub_length (a b : Quad) : (qsub a b).length = min a.length b.length := by
  simp [qsub]

theorem qsmul_length (c : ℤ) (a : Quad) : (qsmul c a).length = a.length := by
  simp [qsmul]

/-! ## The rotation of a quaternion -/

/-- The unnormalised rotation matrix of the quaternion `(w, x, y, z)`, row by row (as `rotQ`). -/
def rqList (w x y z : ℝ) : List ℝ :=
  [w ^ 2 + x ^ 2 - y ^ 2 - z ^ 2, 2 * (x * y - w * z), 2 * (x * z + w * y),
   2 * (x * y + w * z), w ^ 2 + y ^ 2 - x ^ 2 - z ^ 2, 2 * (y * z - w * x),
   2 * (x * z - w * y), 2 * (y * z + w * x), w ^ 2 + z ^ 2 - x ^ 2 - y ^ 2]

/-- **`rotQ`**: the 9 entries are `Rq(q)` and the last one is `|q|²`, at every point `s`. -/
theorem rotQ_eval (w x y z : Aff) :
    (rotQ [w, x, y, z]).1.map (qEval · s)
        = rqList (affEval w s) (affEval x s) (affEval y s) (affEval z s) ∧
      qEval (rotQ [w, x, y, z]).2 s
        = affEval w s ^ 2 + affEval x s ^ 2 + affEval y s ^ 2 + affEval z s ^ 2 := by
  have L := affMul_length
  constructor
  · simp only [rotQ, List.map_cons, List.map_nil, rqList, List.cons.injEq, and_true]
    simp only [qEval_qsmul, qEval_qsub, qEval_qadd, qadd_length, qsub_length, L, qEval_affMul,
      min_self]
    push_cast
    exact ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring⟩
  · simp only [rotQ, qEval_qadd, qadd_length, L, qEval_affMul, min_self]
    ring

theorem rotQ_length (w x y z : Aff) :
    (rotQ [w, x, y, z]).1.length = 9 ∧ (∀ e ∈ (rotQ [w, x, y, z]).1, e.length = 10) ∧
      (rotQ [w, x, y, z]).2.length = 10 := by
  refine ⟨rfl, ?_, ?_⟩
  · intro e he
    simp only [rotQ, List.mem_cons, List.not_mem_nil, or_false] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
      simp [qadd_length, qsub_length, qsmul_length, affMul_length]
  · simp [rotQ, qadd_length, affMul_length]

/-! ## The box of the quaternion charts -/

/-- The quaternion of chart `ch` with `d` in the slot `ch` and `u₀, u₁, u₂` in the others. -/
def chq (ch : ℕ) (d u0 u1 u2 : ℝ) : List ℝ :=
  match ch with
  | 0 => [d, u0, u1, u2]
  | 1 => [u0, d, u1, u2]
  | 2 => [u0, u1, d, u2]
  | _ => [u0, u1, u2, d]

/-- The low and high corner of the box, by coordinate. -/
def bLo (b : RBox) : Fin 3 → ℤ := ![b.l0, b.l1, b.l2]
def bHi (b : RBox) : Fin 3 → ℤ := ![b.h0, b.h1, b.h2]

/-- The point of the box at the box coordinate `s` (in `den` units): `uᵢ = (lᵢ + hᵢ)/2 + (hᵢ − lᵢ)/2 · sᵢ`
(integer halves, as in `rboxQ`). -/
noncomputable def bu (b : RBox) (s : Fin 3 → ℝ) (i : Fin 3) : ℝ :=
  (((bLo b i + bHi b i) / 2 : ℤ) : ℝ) + (((bHi b i - bLo b i) / 2 : ℤ) : ℝ) * s i

theorem rboxQ_length (den : ℤ) (b : RBox) : (rboxQ den b).length = 4 := by
  unfold rboxQ; split <;> rfl

/-- **`rboxQ`**: the four quaternion components at the box coordinate `s`. -/
theorem rboxQ_eval (den : ℤ) (b : RBox) :
    (rboxQ den b).map (affEval · s) = chq b.ch den (bu b s 0) (bu b s 1) (bu b s 2) := by
  obtain ⟨ch, l0, l1, l2, h0, h1, h2⟩ := b
  rcases ch with _ | _ | _ | n <;> simp [rboxQ, chq, affEval, bu, bLo, bHi]

/-- `rboxQ` is a list of four `Aff`s. -/
theorem rboxQ_four (den : ℤ) (b : RBox) : ∃ w x y z, rboxQ den b = [w, x, y, z] := by
  unfold rboxQ; split <;> exact ⟨_, _, _, _, rfl⟩

/-- The rotation entries and `N` of a box, at the point `s`, through the quaternion `chq`. -/
theorem rotQ_rboxQ (den : ℤ) (b : RBox) :
    let q := chq b.ch den (bu b s 0) (bu b s 1) (bu b s 2)
    (rotQ (rboxQ den b)).1.map (qEval · s)
        = rqList (q.getD 0 0) (q.getD 1 0) (q.getD 2 0) (q.getD 3 0) ∧
      qEval (rotQ (rboxQ den b)).2 s
        = q.getD 0 0 ^ 2 + q.getD 1 0 ^ 2 + q.getD 2 0 ^ 2 + q.getD 3 0 ^ 2 := by
  intro q
  obtain ⟨w, x, y, z, hq⟩ := rboxQ_four den b
  have he := rboxQ_eval s den b
  rw [hq] at he ⊢
  simp only [List.map_cons, List.map_nil] at he
  have hq' : q = [affEval w s, affEval x s, affEval y s, affEval z s] := he.symm
  rw [hq']
  exact rotQ_eval s w x y z

/-- Under `rboxWf` the integer halves are exact. -/
theorem bu_exact {b : RBox} (hb : rboxWf b = true) (i : Fin 3) :
    bu b s i = ((bLo b i : ℝ) + bHi b i) / 2 + ((bHi b i : ℝ) - bLo b i) / 2 * s i ∧
      (bLo b i : ℝ) < bHi b i := by
  simp only [rboxWf, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at hb
  obtain ⟨⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, e0⟩, e1⟩, e2⟩, _⟩ := hb
  have key : ∀ l h : ℤ, l < h → (h - l) % 2 = 0 →
      ((((l + h) / 2 : ℤ) : ℝ) + (((h - l) / 2 : ℤ) : ℝ) * s i
          = ((l : ℝ) + h) / 2 + ((h : ℝ) - l) / 2 * s i) ∧ (l : ℝ) < h := by
    intro l h hlh he
    obtain ⟨k, hk⟩ : ∃ k, h - l = 2 * k := ⟨(h - l) / 2, by omega⟩
    have e1 : (l + h) / 2 = l + k := by omega
    have e2 : (h - l) / 2 = k := by omega
    have hk' : (h : ℝ) = l + 2 * k := by
      have : h = l + 2 * k := by omega
      rw [this]; push_cast; ring
    refine ⟨?_, by exact_mod_cast hlh⟩
    rw [e1, e2, hk']
    push_cast
    ring
  unfold bu
  fin_cases i
  · exact key _ _ h0 e0
  · exact key _ _ h1 e1
  · exact key _ _ h2 e2

/-- Every `u` with `|s| ≤ 1` lies in the box. -/
theorem box_mem {b : RBox} (hb : rboxWf b = true) (hs : ∀ i, |s i| ≤ 1) (i : Fin 3) :
    (bLo b i : ℝ) ≤ bu b s i ∧ bu b s i ≤ bHi b i := by
  obtain ⟨he, hlt⟩ := bu_exact s hb i
  rw [he]
  have := abs_le.1 (hs i)
  constructor <;> nlinarith

/-- **Every point of the box is a `u`** with `|s| ≤ 1`. -/
theorem box_param {b : RBox} (hb : rboxWf b = true) (y : Fin 3 → ℝ)
    (hy : ∀ i, (bLo b i : ℝ) ≤ y i ∧ y i ≤ bHi b i) :
    ∃ s : Fin 3 → ℝ, (∀ i, |s i| ≤ 1) ∧ ∀ i, bu b s i = y i := by
  let s : Fin 3 → ℝ := fun i =>
    (2 * y i - ((bLo b i : ℝ) + bHi b i)) / ((bHi b i : ℝ) - bLo b i)
  refine ⟨s, fun i => ?_, fun i => ?_⟩
  · obtain ⟨_, hlt⟩ := bu_exact s hb i
    have hp : (0 : ℝ) < (bHi b i : ℝ) - bLo b i := by linarith
    obtain ⟨h1, h2⟩ := hy i
    rw [abs_le]
    constructor
    · rw [le_div_iff₀ hp]; linarith
    · rw [div_le_iff₀ hp]; linarith
  · obtain ⟨he, hlt⟩ := bu_exact s hb i
    have hp : (bHi b i : ℝ) - bLo b i ≠ 0 := by linarith
    rw [he]
    simp only [s]
    field_simp
    ring

/-! ## `combine` -/

theorem zw_comb (c : FE) (hc : Len ps c) : ∀ (acc : List FE) (r : List ℤ) (m : List ℝ),
    (∀ a ∈ acc, Len ps a) → acc.length = r.length →
      (List.zipWith (fun (e : FE) (x : ℝ) => fval ps e * x)
          (List.zipWith (fun a r => fadd a (fsmul r c)) acc r) m).sum
        = (List.zipWith (fun (e : FE) (x : ℝ) => fval ps e * x) acc m).sum
          + fval ps c * (List.zipWith (fun (d : ℤ) (x : ℝ) => (d : ℝ) * x) r m).sum
  | [], [], m, _, _ => by simp
  | [], _ :: _, _, _, h => by simp at h
  | _ :: _, [], _, _, h => by simp at h
  | _ :: _, _ :: _, [], _, _ => by simp
  | a :: acc, d :: r, x :: m, ha, h => by
    simp only [List.zipWith_cons_cons, List.sum_cons]
    have ha0 : Len ps a := ha a (List.mem_cons_self ..)
    rw [zw_comb c hc acc r m (fun e he => ha e (List.mem_cons_of_mem _ he)) (by simpa using h),
      fval_fadd ha0 (len_fsmul d hc), fval_fsmul]
    ring

/-- The invariant of `combine`'s accumulator. -/
def AccOk (ps : List ℕ) (acc : List FE) : Prop := acc.length = 10 ∧ ∀ a ∈ acc, Len ps a

/-- The hypotheses on the terms: coefficients of the right length, quadratics with 10 entries. -/
def TermsOk (ps : List ℕ) (terms : List (FE × Quad)) : Prop :=
  ∀ t ∈ terms, Len ps t.1 ∧ t.2.length = 10

theorem len_zw (c : FE) (hc : Len ps c) : ∀ (acc : List FE) (r : List ℤ), (∀ a ∈ acc, Len ps a) →
    ∀ e ∈ List.zipWith (fun a r => fadd a (fsmul r c)) acc r, Len ps e
  | [], _, _, e, he => by simp at he
  | _ :: _, [], _, e, he => by simp at he
  | a :: acc, d :: r, ha, e, he => by
    simp only [List.zipWith_cons_cons, List.mem_cons] at he
    rcases he with rfl | he
    · exact len_fadd (ha a (List.mem_cons_self ..)) (len_fsmul d hc)
    · exact len_zw c hc acc r (fun x hx => ha x (List.mem_cons_of_mem _ hx)) e he

theorem comb_step {acc : List FE} (hacc : AccOk ps acc) {t : FE × Quad} (ht : Len ps t.1 ∧ t.2.length = 10) :
    AccOk ps (List.zipWith (fun a r => fadd a (fsmul r t.1)) acc t.2) ∧
      gEval ps (List.zipWith (fun a r => fadd a (fsmul r t.1)) acc t.2) s
        = gEval ps acc s + fval ps t.1 * qEval t.2 s := by
  obtain ⟨hl, ha⟩ := hacc
  refine ⟨⟨by simp [hl, ht.2], fun e he => ?_⟩, ?_⟩
  · exact len_zw t.1 ht.1 acc t.2 ha e he
  · exact zw_comb t.1 ht.1 acc t.2 (qmono s) ha (by rw [hl, ht.2])

theorem comb_fold : ∀ (terms : List (FE × Quad)) (acc : List FE), AccOk ps acc → TermsOk ps terms →
    AccOk ps (terms.foldl (fun acc (t : FE × Quad) =>
        List.zipWith (fun a r => fadd a (fsmul r t.1)) acc t.2) acc) ∧
      gEval ps (terms.foldl (fun acc (t : FE × Quad) =>
        List.zipWith (fun a r => fadd a (fsmul r t.1)) acc t.2) acc) s
        = gEval ps acc s + (terms.map (fun t => fval ps t.1 * qEval t.2 s)).sum
  | [], acc, h, _ => by simp [h]
  | t :: terms, acc, h, ht => by
    obtain ⟨h1, h2⟩ := comb_step s h (ht t (List.mem_cons_self ..))
    obtain ⟨h3, h4⟩ := comb_fold terms _ h1 (fun u hu => ht u (List.mem_cons_of_mem _ hu))
    refine ⟨h3, ?_⟩
    simp only [List.foldl_cons, List.map_cons, List.sum_cons]
    rw [h4, h2]
    ring

theorem gEval_zero (ps : List ℕ) :
    gEval ps (List.replicate 10 (fzero (2 ^ ps.length))) s = 0 := by
  simp [gEval, qmono, List.replicate, fval_fzero]

theorem accOk_zero (ps : List ℕ) : AccOk ps (List.replicate 10 (fzero (2 ^ ps.length))) := by
  refine ⟨by simp, fun a ha => ?_⟩
  rw [List.eq_of_mem_replicate ha]
  exact len_fzero ps

/-- **`combine`**: 10 coefficients of the right length, the value `Σ_t fval(c_t) · qEval(q_t)`. -/
theorem gEval_combine {terms : List (FE × Quad)} (ht : TermsOk ps terms) :
    AccOk ps (combine (2 ^ ps.length) terms) ∧
      gEval ps (combine (2 ^ ps.length) terms) s
        = (terms.map (fun t => fval ps t.1 * qEval t.2 s)).sum := by
  obtain ⟨h1, h2⟩ := comb_fold s terms _ (accOk_zero ps) ht
  refine ⟨h1, ?_⟩
  unfold combine
  rw [h2, gEval_zero, zero_add]

/-! ## `lbQuad` -/

/-- The exponents of the 10 monomials. -/
def qExp : List Mono :=
  [[0, 0, 0], [1, 0, 0], [0, 1, 0], [0, 0, 1], [2, 0, 0], [1, 1, 0], [1, 0, 1], [0, 2, 0], [0, 1, 1],
   [0, 0, 2]]

theorem qterm_lb {sqb : List (ℤ × ℤ)} {K : ℝ} (hb : BracketG sqb (maskOf ps) K) (hs : ∀ i, |s i| ≤ 1)
    (i : ℕ) (hi : i < 10) (g : FE) (hg : Len ps g) :
    ((monoLb (quadKind 0 i) (loHi sqb g) : ℤ) : ℝ) ≤ K * (fval ps g * (qmono s).getD i 0) := by
  have h := term_lb hb (qExp.getD i []) g (by interval_cases i <;> rfl) hg s hs
  interval_cases i <;> simpa [qExp, quadKind, qmono, monoEval_three, pow_two] using h

/-- **`lbQuad`** is a lower bound of `K · value` on `[-1, 1]³`. -/
theorem lbQuad_le {P : PackLean.D16.Prob} {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K)
    (hs : ∀ i, |s i| ≤ 1) {G : List FE} (hG : AccOk P.ps G) :
    (PackLean.D16.lbQuad P G : ℝ) ≤ K * gEval P.ps G s := by
  obtain ⟨hl, ha⟩ := hG
  match G, hl, ha with
  | [g0, g1, g2, g3, g4, g5, g6, g7, g8, g9], _, ha =>
    have t := fun i hi g hg => qterm_lb s hb hs i hi g hg
    have h0 := t 0 (by norm_num) g0 (ha _ (by simp))
    have h1 := t 1 (by norm_num) g1 (ha _ (by simp))
    have h2 := t 2 (by norm_num) g2 (ha _ (by simp))
    have h3 := t 3 (by norm_num) g3 (ha _ (by simp))
    have h4 := t 4 (by norm_num) g4 (ha _ (by simp))
    have h5 := t 5 (by norm_num) g5 (ha _ (by simp))
    have h6 := t 6 (by norm_num) g6 (ha _ (by simp))
    have h7 := t 7 (by norm_num) g7 (ha _ (by simp))
    have h8 := t 8 (by norm_num) g8 (ha _ (by simp))
    have h9 := t 9 (by norm_num) g9 (ha _ (by simp))
    simp only [qmono, List.getD_cons_zero, List.getD_cons_succ] at h0 h1 h2 h3 h4 h5 h6 h7 h8 h9
    simp only [PackLean.D16.lbQuad, show List.range 10 = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9] from rfl,
      List.zip_cons_cons, List.zip_nil_left, List.foldl_cons, List.foldl_nil, gEval, qmono,
      List.zipWith_cons_cons, List.zipWith_nil_left, List.sum_cons, List.sum_nil]
    push_cast
    linarith

/-- **`lbQuad ∘ combine`** (what `farLbW` and `discLb` compute): a lower bound of
`K · Σ_t fval(c_t) · qEval(q_t)` on `[-1, 1]³`. -/
theorem lbQuad_combine {P : PackLean.D16.Prob} {K : ℝ} (hb : BracketG P.sqb (maskOf P.ps) K)
    (hnb : P.nb = 2 ^ P.ps.length) (hs : ∀ i, |s i| ≤ 1) {terms : List (FE × Quad)}
    (ht : TermsOk P.ps terms) :
    (PackLean.D16.lbQuad P (combine P.nb terms) : ℝ)
      ≤ K * (terms.map (fun t => fval P.ps t.1 * qEval t.2 s)).sum := by
  obtain ⟨h1, h2⟩ := gEval_combine s ht
  rw [hnb, ← h2]
  exact lbQuad_le s hb hs h1

#assert_std_axioms PackLean.Formal.QuadSem.rotQ_rboxQ PackLean.Formal.QuadSem.box_param
  PackLean.Formal.QuadSem.box_mem PackLean.Formal.QuadSem.lbQuad_combine

end PackLean.Formal.QuadSem
