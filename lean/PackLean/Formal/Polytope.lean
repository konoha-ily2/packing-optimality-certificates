import Mathlib
import PackLean.Formal.FieldSem
import PackLean.Formal.Spec
import PackLean.AxiomAudit

/-!
# D45 stage 4f: "face inequalities ⇒ convex hull of the vertices" (H ⊆ V) by a certificate

For a polytope with vertices `V`, face normals `n_f` (`f < m`) and one offset `D > 0`, we show
`n_f · x ≤ D` for all `f` ⇒ `x ∈ convexHull ℝ V`, from a certificate that only contains identities
(`plan/D45_s4_design.md` §4):

* for each face `f` a list of *cells* `(g, terms)`, one per edge of `f` (`g` the neighbouring face);
* a term is `(α, a, b, p)` with `α ≥ 0` and a point `p` of the hull; its weight at `x` is
  `α · (n_a − n_b) · x`;
* per cell: `Σ α (n_a − n_b) pᵀ = I` (so `x = Σ weight · p`) and `Σ α (n_a − n_b) = n_f / D`
  (so `Σ weight = n_f · x / D ≤ 1`);
* a term is *admissible* when `a = f` (and `b` is any face) or `a = g` and `b` is the neighbour of
  another cell of `f`.

Take `f` with `n_f · x` maximal and then the cell of `f` whose `g` has `n_g · x` maximal among the
neighbours: all weights are `≥ 0` and their sum is `≤ 1`, so `x` is a convex combination of the
points and `0` (which is in the hull).  No geometric fact about the cells is used.

Sections:
1. the real statement (`mem_hull_of_cells`, the open version `interior_of_cells`);
2. the checker `certOk` on the number-field elements of the checkers (`FE`, any `ps`), and its
   soundness `hsubv_of_ok`, `interior_of_ok`, `hull_eq_of_ok` (with the easy direction `V ⊆ H`);
3. (in `PolytopeSolids.lean`) the four solids of the six cases in the coordinates of `Spec`.
-/

namespace PackLean.Formal.Polytope

open PackLean.D28 (FE fadd fsub fmul fsign fsmul fofInt fzero)
open PackLean.Formal.FieldSem
open Finset

noncomputable section

/-! ## 1. The real statement -/

/-- The dot product on `E3`. -/
def dot (u x : E3) : ℝ := ∑ i, u i * x i

/-- A term of a cell: weight `α · (n_a − n_b) · x` on the point `p`. -/
structure RT where
  α : ℝ
  a : ℕ
  b : ℕ
  p : E3

/-- The weight of a term at `x`. -/
def wt (N : ℕ → E3) (x : E3) (t : RT) : ℝ := t.α * (dot (N t.a) x - dot (N t.b) x)

/-- The two identities of a cell of the face `f`. -/
structure CellOK (N : ℕ → E3) (D : ℝ) (f : ℕ) (ts : List RT) : Prop where
  mat : ∀ i j : Fin 3,
    (ts.map (fun t => t.α * (N t.a j - N t.b j) * t.p i)).sum = if i = j then 1 else 0
  sum : ∀ j : Fin 3, (ts.map (fun t => t.α * (N t.a j - N t.b j))).sum = N f j / D

theorem list_sum_apply (L : List E3) (i : Fin 3) : L.sum i = (L.map (fun v => v i)).sum := by
  induction L with
  | nil => simp
  | cons v L ih => simp [List.sum_cons, ih]

theorem list_sum_fsum {β : Type*} (L : List β) (g : β → Fin 3 → ℝ) :
    (L.map (fun t => ∑ j, g t j)).sum = ∑ j, (L.map (fun t => g t j)).sum := by
  induction L with
  | nil => simp
  | cons t L ih => simp [List.sum_cons, ih, Finset.sum_add_distrib]

theorem list_sum_mul_left {β : Type*} (L : List β) (c : ℝ) (g : β → ℝ) :
    (L.map (fun t => c * g t)).sum = c * (L.map g).sum := by
  induction L with
  | nil => simp
  | cons t L ih => simp [List.sum_cons, ih, mul_add]

theorem dot_sub (u v x : E3) : dot u x - dot v x = ∑ j, x j * (u j - v j) := by
  unfold dot
  rw [← Finset.sum_sub_distrib]
  exact Finset.sum_congr rfl fun j _ => by ring

/-- A cell writes `x` as `Σ weight · p`, with `Σ weight = n_f · x / D`. -/
theorem cell_decomp {N : ℕ → E3} {D : ℝ} {f : ℕ} {ts : List RT} (h : CellOK N D f ts) (x : E3) :
    (ts.map (fun t => wt N x t • t.p)).sum = x ∧ (ts.map (wt N x)).sum = dot (N f) x / D := by
  constructor
  · ext i
    rw [list_sum_apply, List.map_map]
    have : ∀ t : RT, ((fun v : E3 => v i) ∘ fun t => wt N x t • t.p) t
        = ∑ j, x j * (t.α * (N t.a j - N t.b j) * t.p i) := by
      intro t
      simp only [Function.comp, PiLp.smul_apply, smul_eq_mul, wt, dot_sub, Finset.mul_sum,
        Finset.sum_mul]
      exact Finset.sum_congr rfl fun j _ => by ring
    rw [List.map_congr_left (fun t _ => this t), list_sum_fsum]
    simp_rw [list_sum_mul_left, h.mat i]
    simp
  · have : ∀ t : RT, wt N x t = ∑ j, x j * (t.α * (N t.a j - N t.b j)) := by
      intro t
      simp only [wt, dot_sub, Finset.mul_sum]
      exact Finset.sum_congr rfl fun j _ => by ring
    rw [List.map_congr_left (fun t _ => this t), list_sum_fsum]
    simp_rw [list_sum_mul_left, h.sum]
    unfold dot
    rw [Finset.sum_div]
    exact Finset.sum_congr rfl fun j _ => by ring

/-- A nonempty list of weighted points of a convex set: the sum is `(Σ w) • z` for a `z` in the set. -/
theorem exists_combo {S : Set E3} (hS : Convex ℝ S) :
    ∀ L : List (ℝ × E3), L ≠ [] → (∀ q ∈ L, 0 ≤ q.1 ∧ q.2 ∈ S) →
      ∃ z ∈ S, (L.map (fun q => q.1 • q.2)).sum = (L.map Prod.fst).sum • z
  | [], h, _ => absurd rfl h
  | [q], _, hq => ⟨q.2, (hq q (by simp)).2, by simp⟩
  | q :: q' :: L, _, hq => by
    obtain ⟨z', hz', he⟩ := exists_combo hS (q' :: L) (by simp) fun r hr =>
      hq r (List.mem_cons_of_mem _ hr)
    have hq0 := hq q (by simp)
    set W := ((q' :: L).map Prod.fst).sum with hW
    have hW0 : 0 ≤ W := List.sum_nonneg fun w hw => by
      obtain ⟨r, hr, rfl⟩ := List.mem_map.1 hw
      exact (hq r (List.mem_cons_of_mem _ hr)).1
    rw [List.map_cons, List.sum_cons, he, List.map_cons, List.sum_cons, ← hW]
    by_cases h0 : q.1 + W = 0
    · have h1 : q.1 = 0 := by linarith [hq0.1]
      have h2 : W = 0 := by linarith [hq0.1]
      exact ⟨q.2, hq0.2, by rw [h1, h2]; simp⟩
    · have hpos : 0 < q.1 + W := lt_of_le_of_ne (by linarith [hq0.1]) (Ne.symm h0)
      refine ⟨(q.1 / (q.1 + W)) • q.2 + (W / (q.1 + W)) • z', hS hq0.2 hz'
        (div_nonneg hq0.1 hpos.le) (div_nonneg hW0 hpos.le) (by field_simp), ?_⟩
      rw [smul_add, smul_smul, smul_smul, mul_div_cancel₀ _ h0, mul_div_cancel₀ _ h0]

/-- Weighted points of a convex set containing `0`, with total weight `≤ 1`. -/
theorem sum_smul_mem {S : Set E3} (hS : Convex ℝ S) (h0 : (0 : E3) ∈ S) (L : List (ℝ × E3))
    (hq : ∀ q ∈ L, 0 ≤ q.1 ∧ q.2 ∈ S) (h1 : (L.map Prod.fst).sum ≤ 1) :
    (L.map (fun q => q.1 • q.2)).sum ∈ S := by
  rcases eq_or_ne L [] with rfl | hL
  · simpa using h0
  obtain ⟨z, hz, he⟩ := exists_combo hS L hL hq
  rw [he]
  have hW0 : 0 ≤ (L.map Prod.fst).sum := List.sum_nonneg fun w hw => by
    obtain ⟨r, hr, rfl⟩ := List.mem_map.1 hw
    exact (hq r hr).1
  exact hS.smul_mem_of_zero_mem h0 hz ⟨hW0, h1⟩

/-- The hypotheses on the cells of all faces. -/
def CellsOK (V : Set E3) (N : ℕ → E3) (D : ℝ) (m : ℕ) (cells : ℕ → List (ℕ × List RT)) : Prop :=
  ∀ f < m, cells f ≠ [] ∧ ∀ c ∈ cells f, CellOK N D f c.2 ∧ ∀ t ∈ c.2,
    0 ≤ t.α ∧ t.p ∈ convexHull ℝ V ∧
      ((t.a = f ∧ t.b < m) ∨ (t.a = c.1 ∧ t.b ∈ (cells f).map Prod.fst))

/-- **H ⊆ V.** The face inequalities imply membership in the convex hull of the vertices. -/
theorem mem_hull_of_cells {V : Set E3} {N : ℕ → E3} {D : ℝ} (hD : 0 < D) {m : ℕ} (hm : 0 < m)
    {cells : ℕ → List (ℕ × List RT)} (hc : CellsOK V N D m cells) (h0 : (0 : E3) ∈ convexHull ℝ V)
    {x : E3} (hx : ∀ f < m, dot (N f) x ≤ D) : x ∈ convexHull ℝ V := by
  obtain ⟨f, hf, hfmax⟩ := (Finset.range m).exists_max_image (fun f => dot (N f) x)
    ⟨0, Finset.mem_range.2 hm⟩
  have hf' : f < m := Finset.mem_range.1 hf
  obtain ⟨hne, hcell⟩ := hc f hf'
  set G := ((cells f).map Prod.fst).toFinset
  have hG : G.Nonempty := by
    obtain ⟨c, hc⟩ := List.exists_mem_of_ne_nil _ hne
    exact ⟨c.1, List.mem_toFinset.2 (List.mem_map_of_mem hc)⟩
  obtain ⟨g, hg, hgmax⟩ := G.exists_max_image (fun g => dot (N g) x) hG
  obtain ⟨c, hcm, rfl⟩ := List.mem_map.1 (List.mem_toFinset.1 hg)
  obtain ⟨hok, hterm⟩ := hcell c hcm
  obtain ⟨hdec, hsum⟩ := cell_decomp hok x
  rw [← hdec]
  have := sum_smul_mem (convex_convexHull ℝ V) h0 (c.2.map fun t => (wt N x t, t.p)) ?_ ?_
  · simpa [List.map_map, Function.comp_def] using this
  · intro q hq
    obtain ⟨t, ht, rfl⟩ := List.mem_map.1 hq
    obtain ⟨hα, hp, hadm⟩ := hterm t ht
    refine ⟨mul_nonneg hα ?_, hp⟩
    rcases hadm with ⟨ha, hb⟩ | ⟨ha, hb⟩
    · rw [ha]; linarith [hfmax t.b (Finset.mem_range.2 hb)]
    · rw [ha]; linarith [hgmax t.b (List.mem_toFinset.2 hb)]
  · rw [List.map_map]
    have : (Prod.fst ∘ fun t => (wt N x t, t.p)) = wt N x := rfl
    rw [this, hsum, div_le_one hD]
    exact hx f hf'

theorem continuous_dot (u : E3) : Continuous (dot u) := by
  unfold dot
  fun_prop

/-- The open version: strict face inequalities give an interior point. -/
theorem interior_of_cells {V : Set E3} {N : ℕ → E3} {D : ℝ} (hD : 0 < D) {m : ℕ} (hm : 0 < m)
    {cells : ℕ → List (ℕ × List RT)} (hc : CellsOK V N D m cells) (h0 : (0 : E3) ∈ convexHull ℝ V)
    {x : E3} (hx : ∀ f < m, dot (N f) x < D) : x ∈ interior (convexHull ℝ V) := by
  have hU : IsOpen {y : E3 | ∀ f ∈ Finset.range m, dot (N f) y < D} := by
    have : {y : E3 | ∀ f ∈ Finset.range m, dot (N f) y < D}
        = ⋂ f ∈ Finset.range m, {y | dot (N f) y < D} := by ext y; simp
    rw [this]
    exact isOpen_biInter_finset fun f _ => isOpen_lt (continuous_dot _) continuous_const
  refine interior_maximal (fun y hy => mem_hull_of_cells hD hm hc h0 fun f hf => ?_) hU
    fun f hf => hx f (Finset.mem_range.1 hf)
  exact (hy f (Finset.mem_range.2 hf)).le

/-- The easy direction `V ⊆ H` gives the hull inside the face inequalities. -/
theorem hull_sub_of_verts {V : Set E3} {N : ℕ → E3} {D : ℝ} {m : ℕ}
    (hv : ∀ v ∈ V, ∀ f < m, dot (N f) v ≤ D) :
    convexHull ℝ V ⊆ {x | ∀ f < m, dot (N f) x ≤ D} := by
  refine convexHull_min (fun v hv' => hv v hv') ?_
  have : {x : E3 | ∀ f < m, dot (N f) x ≤ D} = ⋂ f ∈ Finset.range m, {x | dot (N f) x ≤ D} := by
    ext x; simp
  rw [this]
  refine convex_iInter₂ fun f _ => ?_
  have hl : IsLinearMap ℝ (dot (N f)) := by
    constructor
    · intro x y; simp [dot, Finset.sum_add_distrib, mul_add]
    · intro c x; simp [dot, Finset.mul_sum]; exact Finset.sum_congr rfl fun i _ => by ring
  exact convex_halfSpace_le hl D

/-! ## 2. The checker on `FE` and its soundness -/

/-- A certificate: vertices `verts / dv`, normals `normals / dn`, offset `off / doff`, points
`pts / dq` (each the average of the listed vertices), and per face the cells
`(g, [(α, a, b, point)])` with `α / da`. -/
structure Cert where
  ps : List ℕ
  verts : List (List FE)
  dv : ℕ
  normals : List (List FE)
  dn : ℕ
  off : FE
  doff : ℕ
  pts : List (List FE × List ℕ)
  dq : ℕ
  cells : List (List (ℕ × List (FE × ℕ × ℕ × ℕ)))
  da : ℕ

/-- The component `i` of a vector of field elements. -/
def ent (v : List FE) (i : ℕ) : FE := v.getD i []

/-- The sum of a list of field elements. -/
def fsumL (nb : ℕ) (L : List FE) : FE := L.foldr fadd (fzero nb)

/-- A vector: three field elements of length `nb`. -/
def vecOk (nb : ℕ) (v : List FE) : Bool := v.length == 3 && v.all (fun a => a.length == nb)

/-- The three indices. -/
def I3 : List ℕ := [0, 1, 2]

namespace Cert

def nb (c : Cert) : ℕ := 2 ^ c.ps.length
def vert (c : Cert) (l : ℕ) : List FE := c.verts.getD l []
def nrm (c : Cert) (f : ℕ) : List FE := c.normals.getD f []
def pt (c : Cert) (j : ℕ) : List FE := (c.pts.getD j ([], [])).1
def delta (c : Cert) (a b j : ℕ) : FE := fsub (ent (c.nrm a) j) (ent (c.nrm b) j)
def dot3 (c : Cert) (u v : List FE) : FE := fsumL c.nb (I3.map fun i => fmul c.ps (ent u i) (ent v i))

/-- A point is the average of its listed vertices. -/
def ptOk (c : Cert) (q : List FE × List ℕ) : Bool :=
  vecOk c.nb q.1 && (!q.2.isEmpty && (q.2.all (· < c.verts.length) &&
    I3.all fun i => fsmul ((q.2.length * c.dv : ℕ) : ℤ) (ent q.1 i) ==
      fsmul (c.dq : ℤ) (fsumL c.nb (q.2.map fun l => ent (c.vert l) i))))

/-- The vertices sum to `0`. -/
def zeroOk (c : Cert) : Bool :=
  I3.all fun i => fsumL c.nb (c.verts.map fun v => ent v i) == fzero c.nb

/-- A term `(α, a, b, j)` of a cell `(g, _)` of the face `f` (`gs` the neighbours of `f`). -/
def termOk (c : Cert) (f g : ℕ) (gs : List ℕ) (t : FE × ℕ × ℕ × ℕ) : Bool :=
  t.1.length == c.nb && (fsign c.ps t.1 != -1 && (decide (t.2.1 < c.normals.length) &&
    (decide (t.2.2.1 < c.normals.length) && (decide (t.2.2.2 < c.pts.length) &&
      (t.2.1 == f || (t.2.1 == g && gs.contains t.2.2.1))))))

/-- `Σ α (n_a − n_b) pᵀ = I` (times `da · dn · dq`). -/
def matOk (c : Cert) (ts : List (FE × ℕ × ℕ × ℕ)) : Bool :=
  I3.all fun i => I3.all fun j =>
    fsumL c.nb (ts.map fun t => fmul c.ps (fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j)) (ent (c.pt t.2.2.2) i))
      == fofInt c.nb (if i = j then ((c.da * c.dn * c.dq : ℕ) : ℤ) else 0)

/-- `Σ α (n_a − n_b) = n_f / D` (times `da · dn · off`). -/
def sumOk (c : Cert) (f : ℕ) (ts : List (FE × ℕ × ℕ × ℕ)) : Bool :=
  I3.all fun j =>
    fmul c.ps (fsumL c.nb (ts.map fun t => fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j))) c.off
      == fsmul ((c.da * c.doff : ℕ) : ℤ) (ent (c.nrm f) j)

/-- The cells of the face `f`. -/
def faceOk (c : Cert) (f : ℕ) : Bool :=
  !(c.cells.getD f []).isEmpty && (c.cells.getD f []).all fun gt =>
    gt.2.all (c.termOk f gt.1 ((c.cells.getD f []).map Prod.fst)) && (c.matOk gt.2 && c.sumOk f gt.2)

/-- `V ⊆ H`: every vertex satisfies every face inequality. -/
def vhOk (c : Cert) : Bool :=
  c.normals.all fun n => c.verts.all fun v =>
    fsign c.ps (fsub (fsmul ((c.dn * c.dv : ℕ) : ℤ) c.off) (fsmul (c.doff : ℤ) (c.dot3 n v))) != -1

end Cert

/-- **The checker.** -/
def certOk (c : Cert) : Bool :=
  c.ps.all (0 < ·) && (decide (0 < c.dv) && (decide (0 < c.dn) && (decide (0 < c.dq) &&
  (decide (0 < c.da) && (decide (0 < c.doff) && (c.off.length == c.nb && (fsign c.ps c.off == 1 &&
  (c.verts.all (vecOk c.nb) && (c.normals.all (vecOk c.nb) && (decide (0 < c.normals.length) &&
  (decide (0 < c.verts.length) && (c.pts.all c.ptOk && (c.zeroOk &&
  ((List.range c.normals.length).all c.faceOk && c.vhOk))))))))))))))

/-! ### Values -/

/-- The real vector of three field elements over `d`. -/
def vec (ps : List ℕ) (v : List FE) (d : ℕ) : E3 :=
  WithLp.toLp 2 (fun i : Fin 3 => fval ps (ent v i) / d)

theorem vec_apply (ps : List ℕ) (v : List FE) (d : ℕ) (i : Fin 3) :
    vec ps v d i = fval ps (ent v i) / d := rfl

namespace Cert

/-- The vertex `l`. -/
def V (c : Cert) (l : ℕ) : E3 := vec c.ps (c.vert l) c.dv
/-- The set of vertices. -/
def Vs (c : Cert) : Set E3 := {y | ∃ l < c.verts.length, y = c.V l}
/-- The normal of the face `f`. -/
def N (c : Cert) (f : ℕ) : E3 := vec c.ps (c.nrm f) c.dn
/-- The offset. -/
def D (c : Cert) : ℝ := fval c.ps c.off / c.doff
/-- The point `j`. -/
def Q (c : Cert) (j : ℕ) : E3 := vec c.ps (c.pt j) c.dq
/-- A term as a real term. -/
def rt (c : Cert) (t : FE × ℕ × ℕ × ℕ) : RT := ⟨fval c.ps t.1 / c.da, t.2.1, t.2.2.1, c.Q t.2.2.2⟩
/-- The cells of the face `f` as real cells. -/
def cellsR (c : Cert) (f : ℕ) : List (ℕ × List RT) :=
  (c.cells.getD f []).map fun gt => (gt.1, gt.2.map c.rt)

end Cert

/-! ### Small lemmas -/

theorem getD_mem {α : Type*} {L : List α} {l : ℕ} (d : α) (hl : l < L.length) : L.getD l d ∈ L := by
  rw [List.getD_eq_getElem _ _ hl]; exact List.getElem_mem hl

theorem len_ent' {ps : List ℕ} {v : List FE} (h : vecOk (2 ^ ps.length) v = true) {i : ℕ}
    (hi : i < 3) : Len ps (ent v i) := by
  simp only [vecOk, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  exact h.2 _ (getD_mem _ (by rw [h.1]; exact hi))

theorem len_ent {ps : List ℕ} {v : List FE} (h : vecOk (2 ^ ps.length) v = true) (i : Fin 3) :
    Len ps (ent v i) := len_ent' h i.2

theorem I3_all {p : ℕ → Bool} (h : I3.all p = true) (i : Fin 3) : p i = true :=
  List.all_eq_true.1 h i (by fin_cases i <;> simp [I3])

theorem fsumL_spec (ps : List ℕ) : ∀ L : List FE, (∀ a ∈ L, Len ps a) →
    Len ps (fsumL (2 ^ ps.length) L) ∧ fval ps (fsumL (2 ^ ps.length) L) = (L.map (fval ps)).sum
  | [], _ => ⟨len_fzero ps, by simp [fsumL, fval_fzero]⟩
  | a :: L, h => by
    obtain ⟨h1, h2⟩ := fsumL_spec ps L fun b hb => h b (List.mem_cons_of_mem _ hb)
    have ha := h a (List.mem_cons_self ..)
    refine ⟨len_fadd ha h1, ?_⟩
    show fval ps (fadd a (fsumL _ L)) = _
    rw [fval_fadd ha h1, h2]; simp

/-- The values of a mapped list, summed. -/
theorem sum_fval_map {ps : List ℕ} {β : Type*} (L : List β) (g : β → FE)
    (hg : ∀ t ∈ L, Len ps (g t)) :
    (L.map fun t => fval ps (g t)).sum = fval ps (fsumL (2 ^ ps.length) (L.map g)) := by
  have := (fsumL_spec ps (L.map g) fun a ha => by
    obtain ⟨t, ht, rfl⟩ := List.mem_map.1 ha; exact hg t ht).2
  rw [this, List.map_map]; rfl

theorem nonneg_of_fsign {ps : List ℕ} (hps : ∀ p ∈ ps, 0 < p) {a : FE} (ha : Len ps a)
    (h : fsign ps a ≠ -1) : 0 ≤ fval ps a := by
  rw [fsign_spec ps hps a ha] at h
  by_contra hn
  exact h (sgn_neg (not_le.1 hn))

theorem pos_of_fsign {ps : List ℕ} (hps : ∀ p ∈ ps, 0 < p) {a : FE} (ha : Len ps a)
    (h : fsign ps a = 1) : 0 < fval ps a := by
  rw [fsign_spec ps hps a ha] at h
  by_contra hn
  rcases (not_lt.1 hn).lt_or_eq with h1 | h1
  · rw [sgn_neg h1] at h; norm_num at h
  · rw [h1, sgn_zero] at h; norm_num at h

theorem list_smul_sum (c : ℝ) (L : List E3) : (L.map fun v => c • v).sum = c • L.sum := by
  induction L with
  | nil => simp
  | cons v L ih => simp [List.sum_cons, ih, smul_add]

/-- Averages of points of a convex set are in it. -/
theorem avg_mem {S : Set E3} (hS : Convex ℝ S) {L : List E3} (hL : L ≠ []) (hm : ∀ v ∈ L, v ∈ S) :
    ((1 : ℝ) / L.length) • L.sum ∈ S := by
  obtain ⟨z, hz, he⟩ := exists_combo hS (L.map fun v => ((1 : ℝ) / L.length, v)) (by simpa using hL)
    (fun q hq => by
      obtain ⟨v, hv, rfl⟩ := List.mem_map.1 hq
      exact ⟨by positivity, hm v hv⟩)
  have hn : (L.length : ℝ) ≠ 0 := by
    have := List.length_pos_of_ne_nil hL; positivity
  have e1 : ((L.map fun v => ((1 : ℝ) / L.length, v)).map Prod.fst).sum = 1 := by
    simp [List.map_map, Function.comp_def, List.sum_replicate, hn]
  have e2 : ((L.map fun v => ((1 : ℝ) / L.length, v)).map fun q => q.1 • q.2).sum
      = ((1 : ℝ) / L.length) • L.sum := by
    rw [List.map_map, ← list_smul_sum]; rfl
  rw [e2, e1, one_smul] at he
  rw [he]; exact hz


/-! ### Soundness -/

theorem V_mem' {c : Cert} {l : ℕ} (hl : l < c.verts.length) : c.V l ∈ c.Vs := ⟨l, hl, rfl⟩

/-- The parts of `certOk`. -/
structure OkParts (c : Cert) : Prop where
  ps : ∀ p ∈ c.ps, 0 < p
  dv : 0 < c.dv
  dn : 0 < c.dn
  dq : 0 < c.dq
  da : 0 < c.da
  doff : 0 < c.doff
  offLen : c.off.length = c.nb
  offPos : fsign c.ps c.off = 1
  verts : ∀ v ∈ c.verts, vecOk c.nb v = true
  normals : ∀ n ∈ c.normals, vecOk c.nb n = true
  m : 0 < c.normals.length
  nv : 0 < c.verts.length
  pts : ∀ q ∈ c.pts, c.ptOk q = true
  zero : c.zeroOk = true
  faces : ∀ f < c.normals.length, c.faceOk f = true
  vh : c.vhOk = true

theorem okParts {c : Cert} (h : certOk c = true) : OkParts c := by
  simp only [certOk, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true,
    List.mem_range] at h
  obtain ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16⟩ := h
  exact ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h14, h15, h16⟩

section

variable {c : Cert} (H : OkParts c)
include H

theorem nrm_ent {f : ℕ} (hf : f < c.normals.length) {i : ℕ} (hi : i < 3) :
    Len c.ps (ent (c.nrm f) i) :=
  len_ent' (H.normals _ (getD_mem _ hf)) hi

theorem pt_ent {j : ℕ} (hj : j < c.pts.length) {i : ℕ} (hi : i < 3) : Len c.ps (ent (c.pt j) i) := by
  have hq := H.pts _ (getD_mem ([], []) hj)
  simp only [Cert.ptOk, Bool.and_eq_true] at hq
  exact len_ent' hq.1 hi

omit H in
theorem vec_mem_Vs {v : List FE} (hv : v ∈ c.verts) : vec c.ps v c.dv ∈ c.Vs := by
  obtain ⟨l, hl, rfl⟩ := List.mem_iff_getElem.1 hv
  exact ⟨l, hl, by rw [Cert.V, Cert.vert, List.getD_eq_getElem _ _ hl]⟩

/-- `0` is in the hull (the vertices sum to `0`). -/
theorem zero_mem : (0 : E3) ∈ convexHull ℝ c.Vs := by
  have hne : c.verts.map (fun v => vec c.ps v c.dv) ≠ [] := by
    have := H.nv
    intro h
    rw [List.map_eq_nil_iff] at h
    simp [h] at this
  have hm := avg_mem (convex_convexHull ℝ c.Vs) hne fun y hy => by
    obtain ⟨v, hv, rfl⟩ := List.mem_map.1 hy
    exact subset_convexHull ℝ _ (vec_mem_Vs hv)
  have hs : (c.verts.map (fun v => vec c.ps v c.dv)).sum = 0 := by
    ext i
    rw [list_sum_apply, List.map_map]
    have hz := I3_all H.zero i
    simp only [Cert.nb, beq_iff_eq] at hz
    have e := sum_fval_map (ps := c.ps) c.verts (fun v => ent v i) fun v hv => len_ent (H.verts v hv) i
    rw [hz, fval_fzero] at e
    have : ((fun v : E3 => v i) ∘ fun v => vec c.ps v c.dv)
        = fun v => (1 / (c.dv : ℝ)) * fval c.ps (ent v i) := by
      funext v; simp only [Function.comp, vec_apply]; ring
    rw [this, list_sum_mul_left, e]; simp
  rw [hs, smul_zero] at hm
  exact hm

/-- The points are in the hull (averages of vertices). -/
theorem pt_mem {j : ℕ} (hj : j < c.pts.length) : c.Q j ∈ convexHull ℝ c.Vs := by
  have hq := H.pts _ (getD_mem ([], []) hj)
  set q := c.pts.getD j ([], [])
  simp only [Cert.ptOk, Bool.and_eq_true, List.all_eq_true, decide_eq_true_eq] at hq
  obtain ⟨_, hne, hidx, hid⟩ := hq
  have hne' : q.2 ≠ [] := by intro h; simp [h] at hne
  have hL : q.2.map c.V ≠ [] := by simpa using hne'
  have hm := avg_mem (convex_convexHull ℝ c.Vs) hL fun y hy => by
    obtain ⟨l, hl, rfl⟩ := List.mem_map.1 hy
    exact subset_convexHull ℝ _ (V_mem' (hidx l hl))
  convert hm using 1
  ext i
  have h1 := hid i (by fin_cases i <;> simp [I3])
  simp only [Cert.nb, beq_iff_eq] at h1
  have h2 := congrArg (fval c.ps) h1
  rw [fval_fsmul, fval_fsmul] at h2
  rw [← sum_fval_map (ps := c.ps) q.2 (fun l => ent (c.vert l) i) fun l hl =>
    len_ent (H.verts _ (getD_mem _ (hidx l hl))) i] at h2
  rw [PiLp.smul_apply, smul_eq_mul, list_sum_apply, List.map_map, List.length_map]
  have : ((fun v : E3 => v i) ∘ c.V) = fun l => (1 / (c.dv : ℝ)) * fval c.ps (ent (c.vert l) i) := by
    funext l; simp only [Function.comp, Cert.V, vec_apply]; ring
  rw [this, list_sum_mul_left]
  simp only [Cert.Q, Cert.pt, vec_apply]
  have hdv : (0 : ℝ) < c.dv := by exact_mod_cast H.dv
  have hdq : (0 : ℝ) < c.dq := by exact_mod_cast H.dq
  have hn : (0 : ℝ) < q.2.length := by exact_mod_cast List.length_pos_of_ne_nil hne'
  push_cast at h2
  field_simp
  linear_combination h2

end


section

variable {c : Cert} (H : OkParts c)
include H

theorem D_pos : 0 < c.D := by
  unfold Cert.D
  have := pos_of_fsign H.ps H.offLen H.offPos
  have : (0 : ℝ) < c.doff := by exact_mod_cast H.doff
  positivity

omit H in
theorem term_parts {f g : ℕ} {gs : List ℕ} {t : FE × ℕ × ℕ × ℕ} (ht : c.termOk f g gs t = true) :
    Len c.ps t.1 ∧ fsign c.ps t.1 ≠ -1 ∧ t.2.1 < c.normals.length ∧ t.2.2.1 < c.normals.length ∧
      t.2.2.2 < c.pts.length ∧ (t.2.1 = f ∨ (t.2.1 = g ∧ t.2.2.1 ∈ gs)) := by
  simpa [Cert.termOk, Len, Cert.nb] using ht

theorem cells_ok : CellsOK c.Vs c.N c.D c.normals.length c.cellsR := by
  intro f hf
  have hF := H.faces f hf
  simp only [Cert.faceOk, Bool.and_eq_true, List.all_eq_true] at hF
  obtain ⟨hne, hall⟩ := hF
  have hmapfst : (c.cellsR f).map Prod.fst = (c.cells.getD f []).map Prod.fst := by
    simp [Cert.cellsR, List.map_map, Function.comp_def]
  refine ⟨fun h => by simp [Cert.cellsR] at h; simp [h] at hne, ?_⟩
  intro cR hcR
  obtain ⟨gt, hgt, rfl⟩ := List.mem_map.1 hcR
  obtain ⟨hterms, hmat, hsum⟩ := hall gt hgt
  have hT := fun t (ht : t ∈ gt.2) => term_parts (hterms t ht)
  have hdl : ∀ t ∈ gt.2, ∀ j : Fin 3, Len c.ps (c.delta t.2.1 t.2.2.1 j) := fun t ht j => by
    obtain ⟨-, -, ha, hb, -, -⟩ := hT t ht
    exact len_fsub (nrm_ent H ha j.2) (nrm_ent H hb j.2)
  have hdv : ∀ t ∈ gt.2, ∀ j : Fin 3, fval c.ps (c.delta t.2.1 t.2.2.1 j) / c.dn
      = c.N t.2.1 j - c.N t.2.2.1 j := fun t ht j => by
    obtain ⟨-, -, ha, hb, -, -⟩ := hT t ht
    simp only [Cert.delta, Cert.N, vec_apply]
    rw [fval_fsub (nrm_ent H ha j.2) (nrm_ent H hb j.2), sub_div]
  have hdn : (0 : ℝ) < c.dn := by exact_mod_cast H.dn
  have hda : (0 : ℝ) < c.da := by exact_mod_cast H.da
  have hdq : (0 : ℝ) < c.dq := by exact_mod_cast H.dq
  refine ⟨⟨?_, ?_⟩, ?_⟩
  · intro i j
    have hm := I3_all (I3_all hmat i) j
    simp only [Cert.nb, beq_iff_eq] at hm
    have hlen : ∀ t ∈ gt.2, Len c.ps
        (fmul c.ps (fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j)) (ent (c.pt t.2.2.2) i)) := by
      intro t ht
      obtain ⟨h1, -, -, -, hp, -⟩ := hT t ht
      exact len_fmul (len_fmul h1 (hdl t ht j)) (pt_ent H hp i.2)
    have e := sum_fval_map (ps := c.ps) gt.2 _ hlen
    rw [hm, fval_fofInt] at e
    rw [List.map_map]
    have : ∀ t ∈ gt.2, ((fun t : RT => t.α * (c.N t.a j - c.N t.b j) * t.p i) ∘ c.rt) t
        = (1 / ((c.da * c.dn * c.dq : ℕ) : ℝ)) *
          fval c.ps (fmul c.ps (fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j)) (ent (c.pt t.2.2.2) i)) := by
      intro t ht
      obtain ⟨h1, -, -, -, hp, -⟩ := hT t ht
      simp only [Function.comp, Cert.rt]
      rw [fval_fmul (len_fmul h1 (hdl t ht j)) (pt_ent H hp i.2), fval_fmul h1 (hdl t ht j),
        ← hdv t ht j]
      simp only [Cert.Q, vec_apply, Cert.pt]
      push_cast
      field_simp
    rw [List.map_congr_left this, list_sum_mul_left, e]
    by_cases hij : i = j
    · subst hij; simp; field_simp
    · have : (i : ℕ) ≠ j := fun h => hij (Fin.ext h)
      simp [hij, this]
  · intro j
    have hs := I3_all hsum j
    simp only [Cert.nb, beq_iff_eq] at hs
    have hlen : ∀ t ∈ gt.2, Len c.ps (fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j)) := by
      intro t ht
      obtain ⟨h1, -, -, -, -, -⟩ := hT t ht
      exact len_fmul h1 (hdl t ht j)
    have hSlen := (fsumL_spec c.ps (gt.2.map fun t => fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j))
      fun a ha => by obtain ⟨t, ht, rfl⟩ := List.mem_map.1 ha; exact hlen t ht).1
    have h2 := congrArg (fval c.ps) hs
    rw [fval_fmul hSlen H.offLen, fval_fsmul, ← sum_fval_map (ps := c.ps) gt.2 _ hlen] at h2
    rw [List.map_map]
    have : ∀ t ∈ gt.2, ((fun t : RT => t.α * (c.N t.a j - c.N t.b j)) ∘ c.rt) t
        = (1 / ((c.da * c.dn : ℕ) : ℝ)) * fval c.ps (fmul c.ps t.1 (c.delta t.2.1 t.2.2.1 j)) := by
      intro t ht
      obtain ⟨h1, -, -, -, -, -⟩ := hT t ht
      simp only [Function.comp, Cert.rt]
      rw [fval_fmul h1 (hdl t ht j), ← hdv t ht j]
      push_cast
      field_simp
    rw [List.map_congr_left this, list_sum_mul_left]
    have hoff := pos_of_fsign H.ps H.offLen H.offPos
    have hdoff : (0 : ℝ) < c.doff := by exact_mod_cast H.doff
    simp only [Cert.D, Cert.N, vec_apply]
    push_cast at h2 ⊢
    field_simp
    linear_combination h2
  · intro t ht
    obtain ⟨t0, ht0, rfl⟩ := List.mem_map.1 ht
    obtain ⟨h1, h2, -, hb, hp, hadm⟩ := hT t0 ht0
    refine ⟨div_nonneg (nonneg_of_fsign H.ps h1 h2) (Nat.cast_nonneg _), pt_mem H hp, ?_⟩
    simp only [Cert.rt]
    rw [hmapfst]
    rcases hadm with h | ⟨h, h'⟩
    · exact Or.inl ⟨h, hb⟩
    · exact Or.inr ⟨h, h'⟩

/-- `V ⊆ H`. -/
theorem verts_le : ∀ v ∈ c.Vs, ∀ f < c.normals.length, dot (c.N f) v ≤ c.D := by
  rintro _ ⟨l, hl, rfl⟩ f hf
  have hv := H.vh
  simp only [Cert.vhOk, List.all_eq_true] at hv
  have h := hv _ (getD_mem [] hf) _ (getD_mem [] hl)
  simp only [bne_iff_ne, ne_eq] at h
  have hn : ∀ i < 3, Len c.ps (ent (c.normals.getD f []) i) := fun i hi => nrm_ent H hf hi
  have hw : ∀ i < 3, Len c.ps (ent (c.verts.getD l []) i) := fun i hi =>
    len_ent' (H.verts _ (getD_mem [] hl)) hi
  have hlen : ∀ i ∈ I3, Len c.ps (fmul c.ps (ent (c.normals.getD f []) i) (ent (c.verts.getD l []) i)) :=
    fun i hi => by
      have : i < 3 := by simp [I3] at hi; omega
      exact len_fmul (hn i this) (hw i this)
  have hd3 := fsumL_spec c.ps _ fun a ha => by obtain ⟨i, hi, rfl⟩ := List.mem_map.1 ha; exact hlen i hi
  have hval := sum_fval_map (ps := c.ps) I3 _ hlen
  have h0 := nonneg_of_fsign H.ps (len_fsub (len_fsmul _ H.offLen) (len_fsmul _ hd3.1)) h
  rw [fval_fsub (len_fsmul _ H.offLen) (len_fsmul _ hd3.1), fval_fsmul, fval_fsmul, ← hval] at h0
  simp only [I3, List.map_cons, List.map_nil, List.sum_cons, List.sum_nil] at h0
  rw [fval_fmul (hn 0 (by norm_num)) (hw 0 (by norm_num)), fval_fmul (hn 1 (by norm_num))
    (hw 1 (by norm_num)), fval_fmul (hn 2 (by norm_num)) (hw 2 (by norm_num))] at h0
  unfold dot Cert.D
  simp only [Fin.sum_univ_three, Cert.N, Cert.V, Cert.nrm, Cert.vert, vec_apply]
  have hdn : (0 : ℝ) < c.dn := by exact_mod_cast H.dn
  have hdv : (0 : ℝ) < c.dv := by exact_mod_cast H.dv
  have hdoff : (0 : ℝ) < c.doff := by exact_mod_cast H.doff
  push_cast at h0
  set a0 := fval c.ps (ent (c.normals.getD f []) 0)
  set a1 := fval c.ps (ent (c.normals.getD f []) 1)
  set a2 := fval c.ps (ent (c.normals.getD f []) 2)
  set b0 := fval c.ps (ent (c.verts.getD l []) 0)
  set b1 := fval c.ps (ent (c.verts.getD l []) 1)
  set b2 := fval c.ps (ent (c.verts.getD l []) 2)
  have key : a0 / c.dn * (b0 / c.dv) + a1 / c.dn * (b1 / c.dv) + a2 / c.dn * (b2 / c.dv)
      = (a0 * b0 + a1 * b1 + a2 * b2) / (c.dn * c.dv) := by field_simp
  change a0 / (c.dn : ℝ) * (b0 / (c.dv : ℝ)) + a1 / (c.dn : ℝ) * (b1 / (c.dv : ℝ))
    + a2 / (c.dn : ℝ) * (b2 / (c.dv : ℝ)) ≤ fval c.ps c.off / c.doff
  rw [key, div_le_div_iff₀ (by positivity) hdoff]
  linarith

end

/-! ### The results -/

/-- **H ⊆ V** for a checked certificate. -/
theorem hsubv_of_ok {c : Cert} (h : certOk c = true) {x : E3}
    (hx : ∀ f < c.normals.length, dot (c.N f) x ≤ c.D) : x ∈ convexHull ℝ c.Vs :=
  mem_hull_of_cells (D_pos (okParts h)) (okParts h).m (cells_ok (okParts h)) (zero_mem (okParts h)) hx

/-- Strict face inequalities give an interior point. -/
theorem interior_of_ok {c : Cert} (h : certOk c = true) {x : E3}
    (hx : ∀ f < c.normals.length, dot (c.N f) x < c.D) : x ∈ interior (convexHull ℝ c.Vs) :=
  interior_of_cells (D_pos (okParts h)) (okParts h).m (cells_ok (okParts h)) (zero_mem (okParts h)) hx

/-- **The hull is the intersection of the face half-spaces.** -/
theorem hull_eq_of_ok {c : Cert} (h : certOk c = true) :
    convexHull ℝ c.Vs = {x | ∀ f < c.normals.length, dot (c.N f) x ≤ c.D} :=
  Set.Subset.antisymm (hull_sub_of_verts (verts_le (okParts h))) fun _ hx => hsubv_of_ok h hx


end

#assert_std_axioms PackLean.Formal.Polytope.hsubv_of_ok PackLean.Formal.Polytope.interior_of_ok
  PackLean.Formal.Polytope.hull_eq_of_ok PackLean.Formal.Polytope.mem_hull_of_cells

end PackLean.Formal.Polytope
