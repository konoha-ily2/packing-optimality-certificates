import PackLean.Formal.LocalTubeMix
import PackLean.Formal.LocalTubeDeg

/-!
# D45 stage 5b (part 5): the mixed leaf, assembled over the faces of `act`

`mix_real`: the real form of one mixed leaf of `D30S3.mixOk` (Lemma W (i)(ii)). The weighted
candidates `x ∈ ws` (faces `J x`, multipliers `A x j`) and the lifts `c_f` give, after regrouping the rows
by the faces `f ∈ act` (`LocalTubeMix.regroup3`), the multipliers `a_f = μ_f + ρ c_f dm dn0` and
`b_f = ρ c_f dm dn0` of the rows `(f, α f)` and `(−f, −α f)`; `LocalTubeMix.mix_core` then gives
`S ≥ S*` from `Σ w F + ρ Σ c L ≥ 0`.
-/

namespace PackLean.Formal.LocalTubeMixLeaf

open PackLean.D28 (nth)
open PackLean.D30S3 (idxOf)
open PackLean.Formal.LocalTubeMix (mix_core regroup3 sum_map_add)

noncomputable section

theorem sum_map_smul {ι : Type*} (l : List ι) (c : ℝ) (f : ι → ℝ) :
    (l.map (fun i => c * f i)).sum = c * (l.map f).sum := by
  induction l with
  | nil => simp
  | cons a l ih => simp only [List.map_cons, List.sum_cons, ih]; ring

theorem sum_comm' {ι κ : Type*} (l1 : List ι) (l2 : List κ) (h : ι → κ → ℝ) :
    (l1.map (fun x => (l2.map (fun f => h x f)).sum)).sum =
      (l2.map (fun f => (l1.map (fun x => h x f)).sum)).sum := by
  induction l1 with
  | nil => simp
  | cons a l ih =>
    simp only [List.map_cons, List.sum_cons, ih]
    rw [← sum_map_add]

theorem sum_congr' {ι : Type*} (l : List ι) {f g : ι → ℝ} (h : ∀ i ∈ l, f i = g i) :
    (l.map f).sum = (l.map g).sum := by
  rw [List.map_congr_left h]

/-- **The mixed leaf, in reals.** -/
theorem mix_real {ι : Type*} (ws : List ι) (w : ι → ℝ) (hw : ∀ x ∈ ws, 0 < w x) (hne : ws ≠ [])
    (act : List ℕ) (hact : act.Nodup)
    (J : ι → List ℕ) (hJ : ∀ x ∈ ws, (J x).length = 3)
    (hJd : ∀ x ∈ ws, nth (J x) 0 0 ≠ nth (J x) 1 0 ∧ nth (J x) 0 0 ≠ nth (J x) 2 0 ∧
      nth (J x) 1 0 ≠ nth (J x) 2 0)
    (hJa : ∀ x ∈ ws, ∀ j < 3, nth (J x) j 0 ∈ act)
    (A : ι → ℕ → ℝ) (FV : ι → ℝ) (Xf Yf cf L : ℕ → ℝ)
    {Dd dm dn0 dn dv D0 Nv Ss S Z ρ : ℝ}
    (hDd : 0 < Dd) (hdm : 0 < dm) (hdn0 : 0 < dn0) (hdn : 0 < dn) (hdv : 0 < dv) (hD0 : 0 < D0)
    (hNv : 0 < Nv) (hρ : 0 ≤ ρ)
    (hF : ∀ x ∈ ws, FV x = Dd * (dm * dn0 * dn * dv * D0 * Nv ^ 2 +
      (A x 0 * (Nv * dn * dv * (Xf (nth (J x) 0 0) - Ss)) +
       A x 1 * (Nv * dn * dv * (Xf (nth (J x) 1 0) - Ss)) +
       A x 2 * (Nv * dn * dv * (Xf (nth (J x) 2 0) - Ss)))))
    (hC : ∀ x ∈ ws, A x 0 * Yf (nth (J x) 0 0) + A x 1 * Yf (nth (J x) 1 0) +
      A x 2 * Yf (nth (J x) 2 0) = -(dm * Nv * dn0) * Z)
    (hL : ∀ f ∈ act, L f = 2 * Dd * dm * dn0 * (Nv * dn * dv * (Xf f - Ss)))
    (hcf : ∀ f ∈ act, 0 ≤ cf f)
    (hr1 : ∀ f ∈ act, Xf f + Yf f ≤ S) (hr2 : ∀ f ∈ act, Xf f - Yf f ≤ S) (hZ : Z ≤ -D0)
    (ha : ∀ f ∈ act, 0 ≤ (ws.map (fun x => w x * (if (J x).contains f then A x (idxOf (J x) f)
      else 0))).sum + cf f * ρ * dm * dn0)
    (hΦ : 0 ≤ (ws.map (fun x => w x * FV x)).sum + ρ * (act.map (fun f => cf f * L f)).sum) :
    Ss ≤ S := by
  -- the combined multipliers
  set μ : ℕ → ℝ := fun f => (ws.map (fun x => w x * (if (J x).contains f then A x (idxOf (J x) f)
      else 0))).sum with hμ
  set a : ℕ → ℝ := fun f => μ f + cf f * ρ * dm * dn0 with hadef
  set b : ℕ → ℝ := fun f => cf f * ρ * dm * dn0 with hbdef
  set W : ℝ := (ws.map w).sum with hW
  have hWpos : 0 < W := by
    obtain ⟨x0, hx0⟩ := List.exists_mem_of_ne_nil ws hne
    have := List.single_le_sum (fun y hy => by
      obtain ⟨z, hz, rfl⟩ := List.mem_map.1 hy; exact (hw z hz).le) _ (List.mem_map_of_mem hx0)
    linarith [hw x0 hx0]
  -- regroup a function of the faces of each candidate
  have hreg : ∀ g : ℕ → ℝ, (ws.map (fun x => w x * (A x 0 * g (nth (J x) 0 0) +
      A x 1 * g (nth (J x) 1 0) + A x 2 * g (nth (J x) 2 0)))).sum =
      (act.map (fun f => μ f * g f)).sum := by
    intro g
    have h1 : ∀ x ∈ ws, w x * (A x 0 * g (nth (J x) 0 0) + A x 1 * g (nth (J x) 1 0) +
        A x 2 * g (nth (J x) 2 0)) = (act.map (fun f => w x * ((if (J x).contains f then
          A x (idxOf (J x) f) else 0) * g f))).sum := by
      intro x hx
      rw [regroup3 hact (hJ x hx) (hJd x hx) (hJa x hx) (A x) g, ← sum_map_smul]
    rw [sum_congr' ws h1, sum_comm']
    apply sum_congr'
    intro f _
    simp only [hμ]
    rw [← List.sum_map_mul_right]
    apply sum_congr'
    intro x _
    ring
  -- the cancellation, combined
  have hcanc : (act.map (fun f => (a f - b f) * Yf f)).sum = -(W * dm * Nv * dn0) * Z := by
    have e1 : (act.map (fun f => (a f - b f) * Yf f)).sum = (act.map (fun f => μ f * Yf f)).sum := by
      apply sum_congr'; intro f _; simp only [hadef, hbdef]; ring
    rw [e1, ← hreg Yf, sum_congr' ws (fun x hx => by rw [hC x hx])]
    rw [List.sum_map_mul_right, hW]; ring
  have hκ : 0 < W * dm * Nv * dn0 := by positivity
  obtain ⟨hcore, hsum⟩ := mix_core act a b Xf Yf
    (fun f hf => ha f hf) (fun f hf => by have := hcf f hf; simp only [hbdef]; positivity)
    hr1 hr2 hcanc hκ hZ hD0
  -- the value of `Σ w F + ρ Σ c L`
  have hFsum : (ws.map (fun x => w x * FV x)).sum =
      Dd * (W * (dm * dn0 * dn * dv * D0 * Nv ^ 2) +
        (act.map (fun f => μ f * (Nv * dn * dv * (Xf f - Ss)))).sum) := by
    rw [← hreg (fun f => Nv * dn * dv * (Xf f - Ss))]
    rw [sum_congr' ws (fun x hx => by rw [hF x hx])]
    rw [hW, ← List.sum_map_mul_right, ← sum_map_add, ← sum_map_smul]
    apply sum_congr'; intro x _; ring
  have hLsum : ρ * (act.map (fun f => cf f * L f)).sum =
      Dd * (act.map (fun f => 2 * b f * (Nv * dn * dv * (Xf f - Ss)))).sum := by
    rw [← sum_map_smul, ← sum_map_smul]
    apply sum_congr'; intro f hf; rw [hL f hf]; simp only [hbdef]; ring
  have htot : (ws.map (fun x => w x * FV x)).sum + ρ * (act.map (fun f => cf f * L f)).sum =
      Dd * (W * dm * dn0 * dn * dv * D0 * Nv ^ 2 +
        Nv * dn * dv * ((act.map (fun f => (a f + b f) * Xf f)).sum -
          (act.map (fun f => a f + b f)).sum * Ss)) := by
    rw [hFsum, hLsum]
    have e2 : (act.map (fun f => μ f * (Nv * dn * dv * (Xf f - Ss)))).sum +
        (act.map (fun f => 2 * b f * (Nv * dn * dv * (Xf f - Ss)))).sum =
        Nv * dn * dv * ((act.map (fun f => (a f + b f) * Xf f)).sum -
          (act.map (fun f => a f + b f)).sum * Ss) := by
      rw [← sum_map_add, ← List.sum_map_mul_right]
      have : ∀ l : List ℕ, (l.map (fun f => (a f + b f) * Xf f)).sum -
          (l.map (fun f => (a f + b f) * Ss)).sum =
          (l.map (fun f => (a f + b f) * Xf f - (a f + b f) * Ss)).sum := by
        intro l
        induction l with
        | nil => simp
        | cons y l ih => simp only [List.map_cons, List.sum_cons]; rw [← ih]; ring
      rw [this, ← sum_map_smul]
      apply sum_congr'; intro f _; simp only [hadef, hbdef]; ring
    rw [mul_add, mul_add, ← e2]; ring
  rw [htot] at hΦ
  -- `0 ≤ Dd · N dn dv · Σ(a+b) · (S − S*)`
  have hk : 0 < Nv * dn * dv := by positivity
  have hb2 : W * dm * dn0 * dn * dv * D0 * Nv ^ 2 + Nv * dn * dv *
      ((act.map (fun f => (a f + b f) * Xf f)).sum - (act.map (fun f => a f + b f)).sum * Ss) ≤
      Nv * dn * dv * ((act.map (fun f => a f + b f)).sum * (S - Ss)) := by
    have := mul_le_mul_of_nonneg_left hcore hk.le
    nlinarith
  have h0 : 0 ≤ Nv * dn * dv * ((act.map (fun f => a f + b f)).sum * (S - Ss)) := by
    have := mul_nonneg_iff_of_pos_left hDd |>.1 hΦ
    linarith
  have h1 : 0 ≤ (act.map (fun f => a f + b f)).sum * (S - Ss) :=
    (mul_nonneg_iff_of_pos_left hk).1 h0
  have h2 : 0 ≤ S - Ss := (mul_nonneg_iff_of_pos_left hsum).1 h1
  linarith

end

#assert_std_axioms PackLean.Formal.LocalTubeMixLeaf.mix_real

end PackLean.Formal.LocalTubeMixLeaf
