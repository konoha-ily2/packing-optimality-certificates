import PackLean.Formal.PolySem2
import PackLean.Formal.CubinoctNormal

/-!
# D45 stage 3b: the local region `L` of `cubinoct_n02`

`D16C.localOk P faces = (true, _)` certifies, on the local box `L` around the optimum
`(b, γ, τ) = (0, 0, √2 − 1)`, that every feasible `(t, S)` of the LP has `S ≥ S* = 1 + √2/2`.

The mathematics (variables `x = (b, γ, η)`, `τ = √2 − 1 + η`):
* multipliers `λ_σ = Λ_σ / (4m)` on the four rows `σ = (−1, ±1, ±1)` and `μ = (1 + b² + γ²)/m` on the
  face `e₁`, with `m = 1 − b² − γ²`.  Then `Σ λ = 1` and `Σ λ σ + μ R e₁ = 0` (identities), and weak
  duality gives `8mN·(S − S*) ≥ base + Σ_σ Λ_σ Σ_j |P_σj|` (`N = |q|²`, `P_σj = σ·Rq e_j`);
* `|P| ≥ sg·P` with `sg` the sign of `P` at the optimum, and `|P| ≥ ε·P` on the four folds `P(0) = 0`;
* the lift `x = ρθ` to the four faces of `‖θ‖∞ = 1`, and the box test `shiftLbD` of
  `(F + Σ ε Λ P)(ρθ)/ρ > 0` (the constant term of `F` is `0`).
-/

namespace PackLean.Formal.Loc

open PackLean.D28 PackLean.D16C PackLean.D16 PackLean.Formal.PolySem2
open PackLean.Formal.Far (rqList Rmat inD inL)
open PackLean.Formal.PolySem (monoEval monoEval_three)
open Finset

variable (x : Fin 3 → ℝ)

/-! ## Helpers for `WF2` -/

/-- A list of polynomials, all `WF2`. -/
def WFL2 (l : List Poly) : Prop := ∀ p ∈ l, WF2 p

theorem psum_WF2' {l : List Poly} (h : WFL2 l) : WF2 (psum l) := psum_WF2 h

theorem pEval2_psum' {l : List Poly} (h : WFL2 l) (x : Fin 3 → ℝ) :
    pEval2 (psum l) x = (l.map (pEval2 · x)).sum := pEval2_psum x h

theorem map_WFL2 {α : Type} {l : List α} {f : α → Poly} (h : ∀ a, WF2 (f a)) : WFL2 (l.map f) := by
  intro p hp
  simp only [List.mem_map] at hp
  obtain ⟨a, _, rfl⟩ := hp
  exact h a

theorem map_WF2 {α : Type} {l : List α} {f : α → Poly} (h : ∀ a, WF2 (f a)) :
    ∀ p ∈ l.map f, WF2 p := map_WFL2 h

theorem cons_WFL2 {p : Poly} {l : List Poly} (hp : WF2 p) (hl : WFL2 l) : WFL2 (p :: l) := by
  intro q hq
  rcases List.mem_cons.1 hq with rfl | hq
  · exact hp
  · exact hl q hq

theorem nil_WFL2 : WFL2 [] := by intro q hq; simp at hq

theorem nth_WF2 {l : List Poly} (h : ∀ e ∈ l, WF2 e) (k : ℕ) : WF2 (nth l k []) := by
  unfold nth
  rw [List.getD_eq_getElem?_getD]
  cases hk : l[k]? with
  | none => simp
  | some e => simpa using h e (List.mem_of_getElem? hk)

theorem pEval2_nth (l : List Poly) (k : ℕ) :
    pEval2 (nth l k []) x = (l.map (pEval2 · x)).getD k 0 := by
  unfold nth
  rw [List.getD_eq_getElem?_getD, List.getD_eq_getElem?_getD, List.getElem?_map]
  cases l[k]? <;> simp

theorem v2_WF2' (i : ℕ) (hi : i < 3 := by norm_num) : WF2 (v2 i) := v2_WF2 i hi

/-- Discharger for the `WF2` side conditions. -/
macro "wf2" : tactic =>
  `(tactic| repeat (first | assumption | (with_reducible apply map_WFL2; intro _) | with_reducible apply cons_WFL2 | with_reducible apply nil_WFL2 | with_reducible apply psum_WF2' | exact nth_WF2 (by assumption) _ | with_reducible apply padd_WF2 | with_reducible apply psub_WF2 | with_reducible apply pmul_WF2 | with_reducible apply psmulZ_WF2 | with_reducible apply pneg_WF2 | with_reducible apply c2_WF2 | exact v2_WF2' _ | with_reducible apply psum_WF2))

/-! ## The base polynomials `locBase` -/

def bP : Poly := v2 0
def gP : Poly := v2 1
def tauP : Poly := padd (c2 (-1) 1) (v2 2)
def yP : Poly := padd (pneg bP) (pmul [2] gP tauP)
def zP : Poly := padd gP (pmul [2] bP tauP)
def mP : Poly := psub (c2 1 0) (padd (pmul [2] bP bP) (pmul [2] gP gP))
def RqP : List Poly := (rotOf [2] (c2 1 0) tauP yP zP).1
def NP : Poly := (rotOf [2] (c2 1 0) tauP yP zP).2

theorem locBase_eq : locBase = (RqP, NP, mP, tauP) := rfl

theorem bP_WF : WF2 bP := v2_WF2' 0
theorem gP_WF : WF2 gP := v2_WF2' 1
theorem tauP_WF : WF2 tauP := by unfold tauP; wf2
theorem yP_WF : WF2 yP := by
  have := bP_WF; have := gP_WF; have := tauP_WF; unfold yP; wf2
theorem zP_WF : WF2 zP := by
  have := bP_WF; have := gP_WF; have := tauP_WF; unfold zP; wf2
theorem mP_WF : WF2 mP := by
  have := bP_WF; have := gP_WF; unfold mP; wf2

/-- `τ = √2 − 1 + η`. -/
noncomputable def tv : ℝ := √2 - 1 + x 2

theorem ev_b : pEval2 bP x = x 0 := pEval2_v2 x 0 (by norm_num)
theorem ev_g : pEval2 gP x = x 1 := pEval2_v2 x 1 (by norm_num)
theorem ev_tau : pEval2 tauP x = tv x := by
  rw [tauP, pEval2_padd x (c2_WF2 _ _) (v2_WF2' 2), pEval2_c2, pEval2_v2 x 2 (by norm_num), tv]
  push_cast; ring
theorem ev_y : pEval2 yP x = -x 0 + x 1 * tv x := by
  have := bP_WF; have := gP_WF; have := tauP_WF
  rw [yP, pEval2_padd x (pneg_WF2 bP_WF) (pmul_WF2 gP_WF tauP_WF), pEval2_pneg x bP_WF,
    pEval2_pmul x gP_WF tauP_WF, ev_b, ev_g, ev_tau]
theorem ev_z : pEval2 zP x = x 1 + x 0 * tv x := by
  rw [zP, pEval2_padd x gP_WF (pmul_WF2 bP_WF tauP_WF), pEval2_pmul x bP_WF tauP_WF, ev_b, ev_g,
    ev_tau]
theorem ev_m : pEval2 mP x = 1 - x 0 ^ 2 - x 1 ^ 2 := by
  have h1 := pmul_WF2 bP_WF bP_WF
  have h2 := pmul_WF2 gP_WF gP_WF
  rw [mP, pEval2_psub x (c2_WF2 _ _) (padd_WF2 h1 h2), pEval2_c2, pEval2_padd x h1 h2,
    pEval2_pmul x bP_WF bP_WF, pEval2_pmul x gP_WF gP_WF, ev_b, ev_g]
  push_cast; ring

theorem rotOf_WF2 {w a b c : Poly} (hw : WF2 w) (ha : WF2 a) (hb : WF2 b) (hc : WF2 c) :
    (∀ e ∈ (rotOf [2] w a b c).1, WF2 e) ∧ WF2 (rotOf [2] w a b c).2 := by
  constructor
  · intro e he
    simp only [rotOf, List.mem_cons, List.not_mem_nil, or_false] at he
    rcases he with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> wf2
  · simp only [rotOf]; wf2

theorem rotOf_eval2 {w a b c : Poly} (hw : WF2 w) (ha : WF2 a) (hb : WF2 b) (hc : WF2 c) :
    (rotOf [2] w a b c).1.map (pEval2 · x)
      = rqList (pEval2 w x) (pEval2 a x) (pEval2 b x) (pEval2 c x) ∧
    pEval2 (rotOf [2] w a b c).2 x
      = pEval2 w x ^ 2 + pEval2 a x ^ 2 + pEval2 b x ^ 2 + pEval2 c x ^ 2 := by
  constructor
  · simp (disch := wf2) only [rotOf, List.map_cons, List.map_nil, pEval2_padd, pEval2_psub,
      pEval2_pmul, pEval2_psmulZ, rqList, List.cons.injEq, and_true]
    push_cast
    exact ⟨by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring, by ring⟩
  · simp (disch := wf2) only [rotOf, pEval2_padd, pEval2_pmul]
    ring

theorem Rq_WF : ∀ e ∈ RqP, WF2 e :=
  (rotOf_WF2 (c2_WF2 1 0) tauP_WF yP_WF zP_WF).1
theorem NP_WF : WF2 NP := (rotOf_WF2 (c2_WF2 1 0) tauP_WF yP_WF zP_WF).2

/-- The rotation entries: `Rq = rqList (1, τ, −b + γτ, γ + bτ)`. -/
theorem ev_Rq (k : ℕ) :
    pEval2 (nth RqP k []) x = (rqList 1 (tv x) (-x 0 + x 1 * tv x) (x 1 + x 0 * tv x)).getD k 0 := by
  rw [pEval2_nth, RqP, (rotOf_eval2 x (c2_WF2 1 0) tauP_WF yP_WF zP_WF).1, pEval2_c2, ev_tau, ev_y,
    ev_z]
  norm_num

theorem ev_N : pEval2 NP x = 1 + tv x ^ 2 + (-x 0 + x 1 * tv x) ^ 2 + (x 1 + x 0 * tv x) ^ 2 := by
  rw [NP, (rotOf_eval2 x (c2_WF2 1 0) tauP_WF yP_WF zP_WF).2, pEval2_c2, ev_tau, ev_y, ev_z]
  norm_num

/-! ## The multipliers `Λ_σ` -/

/-- Entry `i` of sign vector number `k` of `sig4`. -/
def s4 (k i : ℕ) : ℤ := nth (nth sig4 k []) i 0

/-- The value of `Λ_σ` (`σ = sig4[k]`, `c = ±1`). -/
noncomputable def lamV (c : ℤ) (k : ℕ) (b g : ℝ) : ℝ :=
  (1 - b ^ 2 - g ^ 2) - 2 * s4 k 1 * g - 2 * s4 k 2 * b +
    c * s4 k 1 * s4 k 2 * ((1 - b ^ 2 - g ^ 2) - 2 * g - 2 * b)

theorem lamPoly_eq (c : ℤ) (s : List ℤ) (m : Poly) : lamPoly c s m =
    psum [m, psmulZ (-2 * nth s 1 0) gP, psmulZ (-2 * nth s 2 0) bP,
      psmulZ (c * nth s 1 0 * nth s 2 0) (psub (psub m (psmulZ 2 gP)) (psmulZ 2 bP))] := rfl

theorem lamPoly_WF (c : ℤ) (s : List ℤ) : WF2 (lamPoly c s mP) := by
  have := bP_WF; have := gP_WF; have := mP_WF
  rw [lamPoly_eq]
  wf2

/-- The multipliers of `localOk` / `locF`. -/
def lamL (c : ℤ) : List Poly := sig4.map (fun s => lamPoly c s mP)

theorem lamL_WF (c : ℤ) : ∀ p ∈ lamL c, WF2 p := map_WF2 (fun s => lamPoly_WF c s)

theorem ev_lam (c : ℤ) (k : ℕ) (hk : k < 4) :
    pEval2 (nth (lamL c) k []) x = lamV c k (x 0) (x 1) := by
  have hb := bP_WF; have hg := gP_WF; have hm := mP_WF
  have hn : nth (lamL c) k [] = lamPoly c (nth sig4 k []) mP := by
    interval_cases k <;> rfl
  rw [hn, lamPoly_eq]
  simp (disch := wf2) only [pEval2_psum', List.map_cons, List.map_nil, List.sum_cons, List.sum_nil,
    pEval2_psmulZ, pEval2_psub, ev_m, ev_b, ev_g]
  simp only [lamV, s4]
  push_cast
  ring

/-! ## `locF`: the polynomial `F_c` and the folds -/

/-- `P_{σ j} = Σ_i σ_i Rq_{ij}` (`σ = sig4[si]`). -/
def itemP (si j : ℕ) : Poly :=
  psum ((List.range 3).map (fun i => psmulZ (nth (nth sig4 si []) i 0) (nth RqP (3 * i + j) [])))

/-- The 12 items `(σ, P_{σ j})`. -/
def itemsL : List (ℕ × Poly) :=
  (List.range 4).foldr (fun si acc => (List.range 3).map (fun j => (si, itemP si j)) ++ acc) []

theorem itemsL_eq : itemsL = [(0, itemP 0 0), (0, itemP 0 1), (0, itemP 0 2), (1, itemP 1 0),
    (1, itemP 1 1), (1, itemP 1 2), (2, itemP 2 0), (2, itemP 2 1), (2, itemP 2 2), (3, itemP 3 0),
    (3, itemP 3 1), (3, itemP 3 2)] := rfl

theorem itemP_WF (si j : ℕ) : WF2 (itemP si j) := by
  have := Rq_WF
  unfold itemP; wf2

/-- `r² = 1 + b² + γ²`. -/
def r2P : Poly := padd (c2 1 0) (padd (pmul [2] bP bP) (pmul [2] gP gP))

theorem r2P_WF : WF2 r2P := by have := bP_WF; have := gP_WF; unfold r2P; wf2

/-- `sstd·(4N(1+b²+γ²)) − 8·sst·mN`. -/
def baseP (P : CProb) : Poly :=
  psub (psmulZ (4 * (P.sstd : ℤ)) (pmul [2] NP r2P)) (psmulF [2] (fsmul 8 P.sst) (pmul [2] mP NP))

/-- The sign of an item at the optimum. -/
def sgOf (it : ℕ × Poly) : ℤ := fsign [2] (PackLean.D16.constTerm 2 it.2)

/-- One step of the sum `F`. -/
def fStep (P : CProb) (c : ℤ) (acc : Poly) (it : ℕ × Poly) : Poly :=
  if sgOf it == 0 then acc
  else padd acc (psmulZ (sgOf it * (P.sstd : ℤ)) (pmul [2] (nth (lamL c) it.1 []) it.2))

/-- The fold predicate (`P` vanishes at the optimum). -/
def isFold (it : ℕ × Poly) : Bool := fIsZero (PackLean.D16.constTerm 2 it.2)

theorem locF_eq (P : CProb) (c : ℤ) :
    locF P c = (itemsL.foldl (fStep P c) (baseP P), itemsL.filter isFold) := rfl

theorem baseP_WF (P : CProb) (hs : P.sst.length = 2) : WF2 (baseP P) := by
  unfold baseP
  exact psub_WF2 (psmulZ_WF2 _ (pmul_WF2 NP_WF r2P_WF))
    (psmulF_WF2 (fsmul_len 8 hs) (pmul_WF2 mP_WF NP_WF))

theorem ev_r2 : pEval2 r2P x = 1 + x 0 ^ 2 + x 1 ^ 2 := by
  have h1 := pmul_WF2 bP_WF bP_WF
  have h2 := pmul_WF2 gP_WF gP_WF
  rw [r2P, pEval2_padd x (c2_WF2 _ _) (padd_WF2 h1 h2), pEval2_c2, pEval2_padd x h1 h2,
    pEval2_pmul x bP_WF bP_WF, pEval2_pmul x gP_WF gP_WF, ev_b, ev_g]
  push_cast; ring

theorem ev_base (P : CProb) (hs : P.sst.length = 2) :
    pEval2 (baseP P) x = 4 * P.sstd * pEval2 NP x * pEval2 r2P x
      - 8 * fv2 P.sst * pEval2 mP x * pEval2 NP x := by
  have h1 := pmul_WF2 NP_WF r2P_WF
  have h2 := pmul_WF2 mP_WF NP_WF
  rw [baseP, pEval2_psub x (psmulZ_WF2 _ h1) (psmulF_WF2 (fsmul_len 8 hs) h2),
    pEval2_psmulZ x _ h1, pEval2_psmulF x (fsmul_len 8 hs) h2, fv2_fsmul 8 hs,
    pEval2_pmul x NP_WF r2P_WF, pEval2_pmul x mP_WF NP_WF]
  push_cast; ring

/-- `rq k`: entry `k` of the unnormalised rotation matrix. -/
noncomputable def rqv (k : ℕ) : ℝ := (rqList 1 (tv x) (-x 0 + x 1 * tv x) (x 1 + x 0 * tv x)).getD k 0

theorem ev_item (si j : ℕ) :
    pEval2 (itemP si j) x = s4 si 0 * rqv x j + s4 si 1 * rqv x (3 + j) + s4 si 2 * rqv x (6 + j) := by
  have := Rq_WF
  rw [itemP, pEval2_psum' (by wf2)]
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.map_cons, List.map_nil, List.sum_cons,
    List.sum_nil]
  rw [pEval2_psmulZ x _ (nth_WF2 Rq_WF _), pEval2_psmulZ x _ (nth_WF2 Rq_WF _),
    pEval2_psmulZ x _ (nth_WF2 Rq_WF _), ev_Rq, ev_Rq, ev_Rq]
  simp only [rqv, s4]
  ring_nf

/-! ## The sum `F_c` -/

/-- The value of one step of `F`. -/
noncomputable def gTerm (P : CProb) (c : ℤ) (it : ℕ × Poly) : ℝ :=
  if sgOf it = 0 then 0
  else (sgOf it : ℝ) * P.sstd * pEval2 (nth (lamL c) it.1 []) x * pEval2 it.2 x

theorem foldl_fStep (P : CProb) (c : ℤ) :
    ∀ (l : List (ℕ × Poly)), (∀ it ∈ l, WF2 it.2) → ∀ acc : Poly, WF2 acc →
    WF2 (l.foldl (fStep P c) acc) ∧
    pEval2 (l.foldl (fStep P c) acc) x = pEval2 acc x + (l.map (gTerm x P c)).sum := by
  intro l
  induction l with
  | nil => intro _ acc h; simp [h]
  | cons it l ih =>
    intro hl acc hacc
    have hit := hl it (by simp)
    have hl' : ∀ it ∈ l, WF2 it.2 := fun j hj => hl j (by simp [hj])
    have hlam := nth_WF2 (lamL_WF c) it.1
    rw [List.foldl_cons, List.map_cons, List.sum_cons]
    by_cases h0 : sgOf it = 0
    · have hs : fStep P c acc it = acc := by simp [fStep, h0]
      rw [hs]
      obtain ⟨h1, h2⟩ := ih hl' acc hacc
      refine ⟨h1, ?_⟩
      rw [h2, gTerm, if_pos h0]; ring
    · have hs : fStep P c acc it
          = padd acc (psmulZ (sgOf it * (P.sstd : ℤ)) (pmul [2] (nth (lamL c) it.1 []) it.2)) := by
        simp [fStep, h0]
      rw [hs]
      have hw : WF2 (padd acc (psmulZ (sgOf it * (P.sstd : ℤ)) (pmul [2] (nth (lamL c) it.1 []) it.2))) :=
        padd_WF2 hacc (psmulZ_WF2 _ (pmul_WF2 hlam hit))
      obtain ⟨h1, h2⟩ := ih hl' _ hw
      refine ⟨h1, ?_⟩
      rw [h2, pEval2_padd x hacc (psmulZ_WF2 _ (pmul_WF2 hlam hit)),
        pEval2_psmulZ x _ (pmul_WF2 hlam hit), pEval2_pmul x hlam hit, gTerm, if_neg h0]
      push_cast; ring

theorem items_WF : ∀ it ∈ itemsL, WF2 it.2 := by
  intro it hit
  rw [itemsL_eq] at hit
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hit
  rcases hit with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;>
    exact itemP_WF _ _

/-- The polynomial `F_c` and its value. -/
theorem ev_F (P : CProb) (hs : P.sst.length = 2) (c : ℤ) :
    WF2 (locF P c).1 ∧
    pEval2 (locF P c).1 x = pEval2 (baseP P) x + (itemsL.map (gTerm x P c)).sum := by
  have hF : (locF P c).1 = itemsL.foldl (fStep P c) (baseP P) := rfl
  rw [hF]
  exact foldl_fStep x P c itemsL items_WF _ (baseP_WF P hs)

/-! ## Two list inequalities -/

/-- `Σ G + Σ_{folds} T ≤ Σ T` when `G = 0 ≤ T` on the folds and `G ≤ T` elsewhere. -/
theorem sum_split {α : Type} (p : α → Bool) (G T : α → ℝ) :
    ∀ l : List α, (∀ a ∈ l, p a = true → G a = 0 ∧ 0 ≤ T a) → (∀ a ∈ l, p a = false → G a ≤ T a) →
    (l.map G).sum + ((l.filter p).map T).sum ≤ (l.map T).sum := by
  intro l
  induction l with
  | nil => intro _ _; simp
  | cons a l ih =>
    intro h1 h2
    have ih' := ih (fun b hb => h1 b (by simp [hb])) (fun b hb => h2 b (by simp [hb]))
    rw [List.filter_cons]
    cases hp : p a
    · have := h2 a (by simp) hp
      simp only [List.map_cons, List.sum_cons, Bool.false_eq_true, if_false]
      linarith
    · obtain ⟨g0, t0⟩ := h1 a (by simp) hp
      simp only [List.map_cons, List.sum_cons, if_true, g0]
      linarith

/-- `Σ_{(k, q)} e_k g(q) ≤ Σ_q |g q|` for `|e_k| ≤ 1`. -/
theorem zip_bound {β : Type} (e : ℕ → ℝ) (he : ∀ k, |e k| ≤ 1) (g : β → ℝ) :
    ∀ (L : List β) (ks : List ℕ),
    ((ks.zip L).map (fun y => e y.1 * g y.2)).sum ≤ (L.map (fun q => |g q|)).sum := by
  intro L
  induction L with
  | nil => intro ks; simp
  | cons q L ih =>
    intro ks
    cases ks with
    | nil =>
      simp only [List.zip_nil_left, List.map_nil, List.sum_nil, List.map_cons, List.sum_cons]
      have : 0 ≤ (L.map (fun q => |g q|)).sum := List.sum_nonneg (by simp)
      have := abs_nonneg (g q)
      linarith
    | cons k ks =>
      simp only [List.zip_cons_cons, List.map_cons, List.sum_cons]
      have h1 := ih ks
      have h2 : e k * g q ≤ |g q| := by
        calc e k * g q ≤ |e k * g q| := le_abs_self _
          _ = |e k| * |g q| := abs_mul _ _
          _ ≤ 1 * |g q| := mul_le_mul_of_nonneg_right (he k) (abs_nonneg _)
          _ = |g q| := one_mul _
      linarith

/-! ## The signed sum `A = H + Σ ε_k prods_k` -/

/-- The sign `ε_k = ±1` of fold `k` in the bit mask `e`. -/
def epsZ (e : ℕ) (k : ℕ) : ℤ := if e / 2 ^ k % 2 == 1 then 1 else -1

theorem epsZ_abs (e k : ℕ) : |((epsZ e k : ℤ) : ℝ)| ≤ 1 := by
  unfold epsZ; split_ifs <;> simp

/-- The polynomial of an accepted box. -/
def Aof (e : ℕ) (H : Poly) (prods : List Poly) : Poly :=
  (List.zip (List.range 4) prods).foldl (fun (acc : Poly) (y : ℕ × Poly) =>
    padd acc (psmulZ (if e / 2 ^ y.1 % 2 == 1 then 1 else -1) y.2)) H

theorem foldl_A (e : ℕ) :
    ∀ (l : List (ℕ × Poly)), (∀ y ∈ l, WF2 y.2) → ∀ acc : Poly, WF2 acc →
    WF2 (l.foldl (fun (acc : Poly) (y : ℕ × Poly) =>
      padd acc (psmulZ (if e / 2 ^ y.1 % 2 == 1 then 1 else -1) y.2)) acc) ∧
    pEval2 (l.foldl (fun (acc : Poly) (y : ℕ × Poly) =>
      padd acc (psmulZ (if e / 2 ^ y.1 % 2 == 1 then 1 else -1) y.2)) acc) x
      = pEval2 acc x + (l.map (fun y => (epsZ e y.1 : ℝ) * pEval2 y.2 x)).sum := by
  intro l
  induction l with
  | nil => intro _ acc h; simp [h]
  | cons y l ih =>
    intro hl acc hacc
    have hy := hl y (by simp)
    have hw := padd_WF2 hacc (psmulZ_WF2 (if e / 2 ^ y.1 % 2 == 1 then 1 else -1) hy)
    obtain ⟨h1, h2⟩ := ih (fun z hz => hl z (by simp [hz])) _ hw
    refine ⟨h1, ?_⟩
    rw [List.foldl_cons, h2, pEval2_padd x hacc (psmulZ_WF2 _ hy), pEval2_psmulZ x _ hy,
      List.map_cons, List.sum_cons, epsZ]
    ring

/-! ## The box test `shiftLbD` -/

theorem shift_term (C W : List ℤ) (hC : C.length = 3) (hW : W.length = 3) (D : ℤ) (hdeg : ℕ)
    (s : Fin 3 → ℝ) (e : Mono × FE) (he : e.1.length = 3 ∧ e.2.length = 2)
    (hd : e.1.foldl (· + ·) 0 ≤ hdeg) (hD : (D : ℝ) ≠ 0) :
    WF2 ((List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) ∧
    pEval2 ((List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2 (nth C y.1 0) (nth W y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (hdeg - e.1.foldl (· + ·) 0)) e.2)] : Poly)) s
      = (D : ℝ) ^ hdeg * (fv2 e.2 * monoEval e.1
          (fun k => (((nth C k 0 : ℤ) : ℝ) + ((nth W k 0 : ℤ) : ℝ) * s k) / D)) := by
  obtain ⟨m, a⟩ := e
  simp only at he hd ⊢
  obtain ⟨m0, m1, m2, rfl⟩ := List.length_eq_three.1 he.1
  obtain ⟨c0, c1, c2', rfl⟩ := List.length_eq_three.1 hC
  obtain ⟨w0, w1, w2, rfl⟩ := List.length_eq_three.1 hW
  have hsum : [m0, m1, m2].foldl (· + ·) 0 = m0 + m1 + m2 := by simp
  simp only [hsum] at hd ⊢
  have hbase : WF2 ([(z3, fsmul (D ^ (hdeg - (m0 + m1 + m2))) a)] : Poly) := by
    simp [z3, fsmul_len _ he.2]
  simp only [show List.range 3 = [0, 1, 2] from rfl, List.zip_cons_cons, List.zip_nil_left,
    List.foldl_cons, List.foldl_nil, nth, List.getD_cons_zero, List.getD_cons_succ]
  obtain ⟨a1, a2⟩ := pmulAff_pow c0 w0 0 (by norm_num) s m0 _ hbase
  obtain ⟨b1, b2⟩ := pmulAff_pow c1 w1 1 (by norm_num) s m1 _ a1
  obtain ⟨d1, d2⟩ := pmulAff_pow c2' w2 2 (by norm_num) s m2 _ b1
  refine ⟨d1, ?_⟩
  rw [d2, b2, a2, monoEval_three]
  simp only [pEval2_cons, pEval2_nil, add_zero, fv2_fsmul _ he.2, z3, monoEval_three, pow_zero,
    mul_one]
  have hD12 : (D : ℝ) ^ hdeg = (D : ℝ) ^ (hdeg - (m0 + m1 + m2)) * D ^ m0 * D ^ m1 * D ^ m2 := by
    rw [mul_assoc, mul_assoc, ← pow_add, ← pow_add, ← pow_add]
    congr 1; omega
  rw [hD12, div_pow, div_pow, div_pow]
  push_cast
  field_simp
  simp only [Fin.val_zero, Fin.val_one, Fin.val_two, List.getD_cons_zero, List.getD_cons_succ]
  ring

/-- **The box test.** If `shiftLbD sqb 12 D H lo hi = some v` with `v > 0`, then `H > 0` at every point
`z / D` with `z` in the box `[lo, hi]`. -/
theorem shift_spec {sqb : List (ℤ × ℤ)} {K : ℤ} (hb : Bracket sqb K) (hK : 0 < K) {D : ℤ}
    (hD : 0 < D) {H : Poly} (hH : WF2 H) {lo hi : List ℤ} (hlo : lo.length = 3) (hhi : hi.length = 3)
    (hz : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) lo hi).all id = true)
    {v : ℤ} (hv : shiftLbD sqb 12 D H lo hi = some v) (hv0 : 0 < v) (z : Fin 3 → ℝ)
    (hzb : ∀ k : Fin 3, ((nth lo k 0 : ℤ) : ℝ) ≤ z k ∧ z k ≤ ((nth hi k 0 : ℤ) : ℝ)) :
    0 < pEval2 H (fun k => z k / D) := by
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
  unfold shiftLbD at hv
  simp only at hv
  split_ifs at hv with hdeg
  simp only [Option.some.injEq] at hv
  have hdeg' : ∀ e ∈ H, e.1.foldl (· + ·) 0 ≤ 12 := by
    intro e he
    by_contra hc
    exact hdeg (List.any_eq_true.2 ⟨e, he, by simp; omega⟩)
  have hall := fun e (he : e ∈ H) => shift_term
    (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2])
    (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) (by simp) (by simp) D 12 s e
    (hH e he) (hdeg' e he) hDr
  have hWF : ∀ q ∈ H.map (fun (e : Mono × FE) =>
      (List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2
        (nth (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0)
        (nth (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (12 - e.1.foldl (· + ·) 0)) e.2)] : Poly)), WF2 q := by
    intro q hq
    simp only [List.mem_map] at hq
    obtain ⟨e, he, rfl⟩ := hq
    exact (hall e he).1
  have hlb := lbPoly_le2 hb (psum_WF2 hWF) s hs
  rw [pEval2_psum s hWF, List.map_map] at hlb
  have hsum : (H.map ((pEval2 · s) ∘ fun (e : Mono × FE) =>
      (List.zip (List.range 3) e.1).foldl (fun acc (y : ℕ × ℕ) =>
      (List.range y.2).foldl (fun acc2 _ => pmulAff acc2
        (nth (List.zipWith (fun l h => (l + h) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0)
        (nth (List.zipWith (fun l h => (h - l) / 2) [l0, l1, l2] [h0, h1, h2]) y.1 0) y.1) acc)
      ([(z3, fsmul (D ^ (12 - e.1.foldl (· + ·) 0)) e.2)] : Poly))).sum
      = (D : ℝ) ^ 12 * pEval2 H (fun k => z k / D) := by
    rw [pEval2, ← List.sum_map_mul_left]
    congr 1
    apply List.map_congr_left
    intro e he
    simp only [Function.comp_apply]
    rw [(hall e he).2]
    congr 3
    funext k
    rw [hCs k]
  rw [hsum] at hlb
  have hK' : (0 : ℝ) < K := by exact_mod_cast hK
  have hvle : ((v : ℤ) : ℝ) ≤ (K : ℝ) * ((D : ℝ) ^ 12 * pEval2 H (fun k => z k / D)) :=
    le_trans (le_of_eq (by exact_mod_cast hv.symm)) hlb
  have hv' : (0 : ℝ) < v := by exact_mod_cast hv0
  have hD12 : (0 : ℝ) < (D : ℝ) ^ 12 := by positivity
  by_contra hneg
  push Not at hneg
  have : (K : ℝ) * ((D : ℝ) ^ 12 * pEval2 H (fun k => z k / D)) ≤ 0 :=
    mul_nonpos_of_nonneg_of_nonpos hK'.le (mul_nonpos_of_nonneg_of_nonpos hD12.le hneg)
  linarith

/-! ## Unpacking `localOk` -/

def FsL (P : CProb) : List (ℤ × Poly × List (ℕ × Poly)) := [1, -1].map (fun (c : ℤ) => (c, locF P c))

/-- The products `sstd · Λ_f(ρθ) · Q_f(ρθ)/ρ` of the folds on a face. -/
def prodOf (P : CProb) (i : ℕ) (sg : ℤ) (c : ℤ) (z : ℕ × Poly) : Poly :=
  psmulZ (P.sstd : ℤ) (pmul [2] (faceSub i sg 0 (nth (lamL c) z.1 [])) (faceSub i sg 1 z.2))

def HsOf (P : CProb) (i : ℕ) (sg : ℤ) : FaceP :=
  (FsL P).map (fun y => (y.1, faceSub i sg 1 y.2.1, y.2.2.map (prodOf P i sg y.1)))

def rootOf (P : CProb) (a1r a2r : ℤ × ℤ) : PackLean.D16.LBox :=
  ⟨[0, a1r.1 * P.den, a2r.1 * P.den], [P.den * P.rho0.1 / P.rho0.2, a1r.2 * P.den, a2r.2 * P.den]⟩

def runOf (P : CProb) (x : (ℕ × ℤ × (ℤ × ℤ) × (ℤ × ℤ)) × List D16C.LTok) : D16C.LState :=
  x.2.foldl (D16C.lstep P (HsOf P x.1.1 x.1.2.1)) ⟨[rootOf P x.1.2.2.1 x.1.2.2.2], true, 0⟩

def resOf (P : CProb) (faces : List (List D16C.LTok)) : Bool × ℕ :=
  (List.zip faces4 faces).foldl (fun (acc : Bool × ℕ) x =>
    (acc.1 && (runOf P x).ok && (runOf P x).stack.isEmpty, acc.2 + (runOf P x).nAcc)) (true, 0)

def fOkB (P : CProb) : Bool :=
  (FsL P).all (fun x => fIsZero (PackLean.D16.constTerm 2 x.2.1) && x.2.2.length == 4)

theorem localOk_imp (P : CProb) (faces : List (List D16C.LTok)) (h : (D16C.localOk P faces).1 = true) :
    fOkB P = true ∧ (resOf P faces).1 = true := by
  unfold D16C.localOk at h
  simp only [locBase_eq, Bool.and_eq_true] at h
  exact ⟨h.1.1.1.1.1.1.2, h.2⟩

theorem foldl_and {α : Type} (g h : α → Bool) (n : α → ℕ) :
    ∀ (l : List α) (b : Bool) (k : ℕ),
    (l.foldl (fun (acc : Bool × ℕ) x => (acc.1 && g x && h x, acc.2 + n x)) (b, k)).1 = true →
    b = true ∧ ∀ x ∈ l, g x = true := by
  intro l
  induction l with
  | nil => intro b k hb; exact ⟨hb, by simp⟩
  | cons a l ih =>
    intro b k hb
    rw [List.foldl_cons] at hb
    obtain ⟨h1, h2⟩ := ih _ _ hb
    simp only [Bool.and_eq_true] at h1
    refine ⟨h1.1.1, ?_⟩
    intro x hx
    rcases List.mem_cons.1 hx with rfl | hx
    · exact h1.1.2
    · exact h2 x hx

theorem res_all (P : CProb) (faces : List (List D16C.LTok)) (h : (resOf P faces).1 = true) :
    ∀ x ∈ List.zip faces4 faces, (runOf P x).ok = true :=
  (foldl_and (fun x => (runOf P x).ok) (fun x => (runOf P x).stack.isEmpty) (fun x => (runOf P x).nAcc)
    _ true 0 h).2

/-- What one accepted token certifies. -/
theorem acc_spec (P : CProb) (Hs : FaceP) (B : PackLean.D16.LBox) (n : ℕ) (c : ℤ) (e : ℕ)
    (h : (D16C.lstep P Hs ⟨[B], true, n⟩ (.acc c e)).ok = true) :
    (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) B.lo B.hi).all id = true ∧
    B.lo.length = 3 ∧ B.hi.length = 3 ∧
    ∃ H prods, (c, H, prods) ∈ Hs ∧ ∃ v, shiftLbD P.sqb2 12 P.den (Aof e H prods) B.lo B.hi = some v ∧
      0 < v := by
  simp only [D16C.lstep, Bool.true_and, Bool.and_eq_true] at h
  obtain ⟨⟨⟨⟨_, hl⟩, hh⟩, hz⟩, hr⟩ := h
  refine ⟨hz, beq_iff_eq.1 hl, beq_iff_eq.1 hh, ?_⟩
  revert hr
  cases hf : Hs.find? (fun x => x.1 == c) with
  | none => simp
  | some a =>
    obtain ⟨c', H, prods⟩ := a
    intro hr
    have hmem := List.mem_of_find?_eq_some hf
    have hp := List.find?_some hf
    simp only [beq_iff_eq] at hp
    subst hp
    refine ⟨H, prods, hmem, ?_⟩
    simp only at hr
    split at hr
    · rename_i v hv
      exact ⟨v, hv, by simpa using hr⟩
    · simp at hr

theorem HsOf_eq (P : CProb) (i : ℕ) (sg : ℤ) : HsOf P i sg =
    [(1, faceSub i sg 1 (locF P 1).1, (locF P 1).2.map (prodOf P i sg 1)),
     (-1, faceSub i sg 1 (locF P (-1)).1, (locF P (-1)).2.map (prodOf P i sg (-1)))] := rfl

theorem Hs_mem {P : CProb} {i : ℕ} {sg c : ℤ} {H : Poly} {prods : List Poly}
    (h : (c, H, prods) ∈ HsOf P i sg) :
    (c = 1 ∨ c = -1) ∧ H = faceSub i sg 1 (locF P c).1 ∧ prods = (locF P c).2.map (prodOf P i sg c) := by
  rw [HsOf_eq] at h
  rcases List.mem_cons.1 h with h | h
  · obtain ⟨h1, h2⟩ := Prod.mk.inj h
    obtain ⟨h2, h3⟩ := Prod.mk.inj h2
    subst h1
    exact ⟨Or.inl rfl, h2, h3⟩
  · rcases List.mem_cons.1 h with h | h
    · obtain ⟨h1, h2⟩ := Prod.mk.inj h
      obtain ⟨h2, h3⟩ := Prod.mk.inj h2
      subst h1
      exact ⟨Or.inr rfl, h2, h3⟩
    · exact absurd h List.not_mem_nil

theorem fOkB_eq (P : CProb) : fOkB P =
    ((fIsZero (PackLean.D16.constTerm 2 (locF P 1).1) && (locF P 1).2.length == 4) &&
     ((fIsZero (PackLean.D16.constTerm 2 (locF P (-1)).1) && (locF P (-1)).2.length == 4) && true)) := rfl

theorem fOk_c {P : CProb} (hf : fOkB P = true) {c : ℤ} (hc : c = 1 ∨ c = -1) :
    fIsZero (PackLean.D16.constTerm 2 (locF P c).1) = true := by
  rw [fOkB_eq, Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true, Bool.and_eq_true] at hf
  rcases hc with rfl | rfl
  · exact hf.1.1
  · exact hf.2.1.1

theorem items_idx : ∀ it ∈ itemsL, it.1 < 4 := by
  intro it hit
  rw [itemsL_eq] at hit
  simp only [List.mem_cons, List.not_mem_nil, or_false] at hit
  rcases hit with rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl | rfl <;> norm_num

/-! ## One face: the key inequality -/

theorem runOf_single (P : CProb) (f : ℕ × ℤ × (ℤ × ℤ) × (ℤ × ℤ)) (c : ℤ) (e : ℕ) :
    runOf P (f, [.acc c e]) =
      D16C.lstep P (HsOf P f.1 f.2.1) ⟨[rootOf P f.2.2.1 f.2.2.2], true, 0⟩ (.acc c e) := rfl

/-- `T(it) = sstd · Λ · |P|`. -/
noncomputable def tTerm (P : CProb) (c : ℤ) (it : ℕ × Poly) : ℝ :=
  (P.sstd : ℝ) * pEval2 (nth (lamL c) it.1 []) x * |pEval2 it.2 x|

/-- **One face.** If the token of the face is accepted, then at every point of the root box
the lifted point `X = ρθ` satisfies `0 ≤ base(X) + Σ_items sstd Λ |P|` for some `c = ±1`. -/
theorem face_key (P : CProb) {K : ℤ} (hb : Bracket P.sqb2 K) (hK : 0 < K) (hD : 0 < P.den)
    (hsd : 0 < P.sstd) (hs : P.sst.length = 2) (hf : fOkB P = true)
    (i : ℕ) (hi : i < 3) (sg : ℤ) (a1r a2r : ℤ × ℤ) (c : ℤ) (e : ℕ)
    (hrun : (runOf P ((i, sg, a1r, a2r), [.acc c e])).ok = true)
    (y : Fin 3 → ℝ) (hy0 : 0 ≤ y 0)
    (hy0' : y 0 * P.den ≤ ((P.den * P.rho0.1 / P.rho0.2 : ℤ) : ℝ))
    (hy1 : (a1r.1 : ℝ) ≤ y 1 ∧ y 1 ≤ a1r.2) (hy2 : (a2r.1 : ℝ) ≤ y 2 ∧ y 2 ≤ a2r.2)
    (hlam : ∀ c' : ℤ, (c' = 1 ∨ c' = -1) → ∀ k < 4, 0 ≤ pEval2 (nth (lamL c') k []) (lift i sg y)) :
    ∃ c' : ℤ, (c' = 1 ∨ c' = -1) ∧
      0 ≤ pEval2 (baseP P) (lift i sg y) + (itemsL.map (tTerm (lift i sg y) P c')).sum := by
  set X := lift i sg y with hX
  rw [runOf_single] at hrun
  have hacc := acc_spec P _ _ 0 c e hrun
  obtain ⟨hz, hl, hh, H, prods, hmem, v, hv, hv0⟩ := hacc
  obtain ⟨hc, hH1, hP1⟩ := Hs_mem hmem
  rw [hH1, hP1] at hv
  clear hmem hH1 hP1 H prods
  refine ⟨c, hc, ?_⟩
  have hF0 := fOk_c hf hc
  obtain ⟨hFw, hFv⟩ := ev_F X P hs c
  -- the folds
  have hfold : ∀ z ∈ (locF P c).2, z ∈ itemsL ∧ isFold z = true := by
    intro z hz'
    have : (locF P c).2 = itemsL.filter isFold := rfl
    rw [this, List.mem_filter] at hz'
    exact hz'
  have hfoldW : ∀ z ∈ (locF P c).2, WF2 z.2 := fun z hz' => items_WF z (hfold z hz').1
  have hlamW : ∀ k, WF2 (nth (lamL c) k []) := nth_WF2 (lamL_WF c)
  have hprodW : ∀ z ∈ (locF P c).2, WF2 (prodOf P i sg c z) := by
    intro z hz'
    exact psmulZ_WF2 _ (pmul_WF2 (faceSub0 i hi sg y (hlamW z.1)).1 (faceSub1 i hi sg y (hfoldW z hz')).1)
  have hprod : ∀ z ∈ (locF P c).2, y 0 * pEval2 (prodOf P i sg c z) y
      = (P.sstd : ℝ) * pEval2 (nth (lamL c) z.1 []) X * pEval2 z.2 X := by
    intro z hz'
    have h0 := faceSub0 i hi sg y (hlamW z.1)
    have h1 := faceSub1 i hi sg y (hfoldW z hz')
    rw [prodOf, pEval2_psmulZ y _ (pmul_WF2 h0.1 h1.1), pEval2_pmul y h0.1 h1.1, h0.2]
    have h2 : y 0 * pEval2 (faceSub i sg 1 z.2) y = pEval2 z.2 X := by
      rw [h1.2, fv2_of_isZero (hfold z hz').2]; ring
    push_cast
    linear_combination (P.sstd : ℝ) * pEval2 (nth (lamL c) z.1 []) X * h2
  have hHw := (faceSub1 i hi sg y hFw).1
  have hH : y 0 * pEval2 (faceSub i sg 1 (locF P c).1) y = pEval2 (locF P c).1 X := by
    rw [(faceSub1 i hi sg y hFw).2, fv2_of_isZero hF0]; ring
  -- the polynomial `A`
  have hzipW : ∀ q ∈ List.zip (List.range 4) ((locF P c).2.map (prodOf P i sg c)), WF2 q.2 := by
    intro q hq
    have := List.of_mem_zip hq
    simp only [List.mem_map] at this
    obtain ⟨z, hz', hzq⟩ := this.2
    rw [← hzq]; exact hprodW z hz'
  obtain ⟨hAw, hAv⟩ := foldl_A y e _ hzipW _ hHw
  have hApos : 0 < pEval2 (Aof e (faceSub i sg 1 (locF P c).1) ((locF P c).2.map (prodOf P i sg c))) y := by
    have hDr : (0 : ℝ) < P.den := by exact_mod_cast hD
    have := shift_spec hb hK hD hAw hl hh hz hv hv0 (fun k => y k * P.den) (by
      intro k
      fin_cases k
      · simp only [rootOf, nth, Fin.zero_eta, Fin.val_zero, List.getD_cons_zero, Int.cast_zero]
        exact ⟨mul_nonneg hy0 hDr.le, hy0'⟩
      · simp only [rootOf, nth, Fin.mk_one, Fin.val_one, List.getD_cons_succ, List.getD_cons_zero]
        push_cast
        exact ⟨mul_le_mul_of_nonneg_right hy1.1 hDr.le, mul_le_mul_of_nonneg_right hy1.2 hDr.le⟩
      · simp only [rootOf, nth, Fin.reduceFinMk, Fin.val_two, List.getD_cons_succ,
          List.getD_cons_zero]
        push_cast
        exact ⟨mul_le_mul_of_nonneg_right hy2.1 hDr.le, mul_le_mul_of_nonneg_right hy2.2 hDr.le⟩)
    have hfun : (fun k => y k * (P.den : ℝ) / P.den) = y := by
      funext k; field_simp
    rwa [hfun] at this
  clear hv hv0 hz hl hh hrun
  -- `ρ A ≥ 0` and its value
  have hrhoA : 0 ≤ y 0 * pEval2 (Aof e (faceSub i sg 1 (locF P c).1)
      ((locF P c).2.map (prodOf P i sg c))) y := mul_nonneg hy0 hApos.le
  rw [Aof, hAv, mul_add, hH, hFv] at hrhoA
  -- the folds part
  have hzip : y 0 * ((List.zip (List.range 4) ((locF P c).2.map (prodOf P i sg c))).map
      (fun q => (epsZ e q.1 : ℝ) * pEval2 q.2 y)).sum
      ≤ ((locF P c).2.map (tTerm X P c)).sum := by
    rw [← List.sum_map_mul_left]
    have h1 : ((List.zip (List.range 4) ((locF P c).2.map (prodOf P i sg c))).map
        (fun q => y 0 * ((epsZ e q.1 : ℝ) * pEval2 q.2 y))).sum
        = ((List.zip (List.range 4) ((locF P c).2.map (prodOf P i sg c))).map
        (fun q => (epsZ e q.1 : ℝ) * (y 0 * pEval2 q.2 y))).sum := by
      exact congrArg List.sum (List.map_congr_left (fun q _ => by ring))
    rw [h1]
    refine le_trans (zip_bound (fun k => (epsZ e k : ℝ)) (epsZ_abs e) (fun q => y 0 * pEval2 q y)
      _ _) (le_of_eq ?_)
    rw [List.map_map]
    refine congrArg List.sum (List.map_congr_left (fun z hz' => ?_))
    simp only [Function.comp_apply]
    rw [hprod z hz', tTerm, abs_mul, abs_mul, abs_of_nonneg (by positivity : (0 : ℝ) ≤ P.sstd),
      abs_of_nonneg (hlam c hc z.1 (items_idx z (hfold z hz').1))]
  -- the items part
  have hsplit := sum_split isFold (gTerm X P c) (tTerm X P c) itemsL (by
      intro it hit hp
      have h0 : sgOf it = 0 := fsign_of_isZero hp
      refine ⟨by simp [gTerm, h0], ?_⟩
      unfold tTerm
      have := hlam c hc it.1 (items_idx it hit)
      positivity) (by
      intro it hit _
      unfold gTerm tTerm
      have hl := hlam c hc it.1 (items_idx it hit)
      split_ifs
      · positivity
      · have hsg := fsign_abs_le (PackLean.D16.constTerm 2 it.2)
        have : (sgOf it : ℝ) * pEval2 it.2 X ≤ |pEval2 it.2 X| := by
          calc (sgOf it : ℝ) * pEval2 it.2 X ≤ |(sgOf it : ℝ) * pEval2 it.2 X| := le_abs_self _
            _ = |(sgOf it : ℝ)| * |pEval2 it.2 X| := abs_mul _ _
            _ ≤ 1 * |pEval2 it.2 X| := mul_le_mul_of_nonneg_right hsg (abs_nonneg _)
            _ = |pEval2 it.2 X| := one_mul _
        have hsd' : (0 : ℝ) ≤ P.sstd := by positivity
        calc (sgOf it : ℝ) * P.sstd * pEval2 (nth (lamL c) it.1 []) X * pEval2 it.2 X
            = P.sstd * pEval2 (nth (lamL c) it.1 []) X * ((sgOf it : ℝ) * pEval2 it.2 X) := by ring
          _ ≤ P.sstd * pEval2 (nth (lamL c) it.1 []) X * |pEval2 it.2 X| :=
            mul_le_mul_of_nonneg_left this (mul_nonneg hsd' hl))
  have hfl : (locF P c).2 = itemsL.filter isFold := rfl
  rw [← hfl] at hsplit
  linarith

end PackLean.Formal.Loc
