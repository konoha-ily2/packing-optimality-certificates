import PackLean.Formal.LocalTubeMixLeaf

/-!
# D45 stage 5b (part 6): the mixed leaf of `mixOk`, from the polynomials to `mix_real`

* `mixOk_eq`: `mixOk` in named parts (`partOf`, `GOf`, `aOkF`), by `rfl`;
* `alOf_mem`, `bsum_eq`, `cf_first_le`, `lift_regroup`: the small facts the bridge needs;
* `mix_leaf`: a mixed leaf that passed gives `S ≥ S*` (the statement `LocalTubeMain.MixSound`).
-/

namespace PackLean.Formal.LocalTubeMixMain

open PackLean.D28 (FE fadd fsub fneg fsmul fzero fofInt fIsZero fmul fsign Mono Poly padd psum pmul
  psmulZ psmulF nth vecGet)
open PackLean.D16 (Prob Cand LBox lbPos candOk candPolys rotPoly constTerm z3 containerOk pieceOk)
open PackLean.D30S3 (S3 tubeOk idot subst homScale divRho degLe FCtx mixOk faceX tubeFaces kScale sub
  candsOk defCand alOf idxOf liftPoly)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.LocalG (Ss InL)
open PackLean.Formal.PolySemG (pEval BracketG maskOf)
open PackLean.Formal.PolySem (monoEval monoEval_three)
open PackLean.Formal.LocalTube
open PackLean.Formal.LocalTubeMain

noncomputable section

/-! ## `mixOk` in named parts -/

/-- The candidate `ci` with the vertices of the box. -/
def cdOf (cands : List Cand) (X : S3) (al : List ℕ) (ci : ℕ) : Cand :=
  { nth cands ci defCand with al := (nth cands ci defCand).J.map (alOf X al) }

def partOf (P : Prob) (X : S3) (cands : List Cand) (c : FCtx) (al : List ℕ) (x : ℕ × ℕ) :
    ℕ × Option Poly × List ℕ × List Poly :=
  (x.2, divRho (sub P c (LocalG.FP P (cdOf cands X al x.1) c.Rq c.N)), (nth cands x.1 defCand).J,
    LocalG.AIL P (cdOf cands X al x.1) c.Rq)

def GOf (P : Prob) (X : S3) (cands : List Cand) (c : FCtx) (al : List ℕ) (ws cs : List (ℕ × ℕ)) :
    Poly :=
  padd (psum ((ws.map (partOf P X cands c al)).map (fun (x : ℕ × Option Poly × List ℕ × List Poly) =>
      psmulZ (x.1 : Int) (x.2.1.getD []))))
    (psum (cs.map (fun (x : ℕ × ℕ) =>
      psmulZ (x.2 : Int) (sub P c (liftPoly P c.Rq c.N (nth cands 0 defCand).dm x.1 (alOf X al x.1))))))

def aOkF (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) (b : LBox) (al : List ℕ)
    (ws cs : List (ℕ × ℕ)) (f : ℕ) : Bool :=
  let k := P.nb
  let dm := (nth cands 0 defCand).dm
  let parts := ws.map (partOf P X cands c al)
  let unit : Int := c.K ^ 4 * dm * P.dn0
  let terms := parts.filterMap (fun (x : ℕ × Option Poly × List ℕ × List Poly) =>
    if x.2.2.1.contains f then some (x.1, nth x.2.2.2 (idxOf x.2.2.1 f) []) else none)
  let cf : Int := ((cs.find? (fun (y : ℕ × ℕ) => y.1 == f)).map (·.2)).getD 0
  if terms.isEmpty && cf == 0 then true else
  let pos0 := terms.any (fun (y : ℕ × Poly) => !fIsZero (constTerm k y.2))
  if pos0 then
    let ap := padd (psum (terms.map (fun (y : ℕ × Poly) => psmulZ (y.1 : Int) (sub P c y.2))))
      [([1, 0, 0], fofInt k (cf * unit))]
    lbPos P D ap b false
  else
    let hs := terms.map (fun (y : ℕ × Poly) => (divRho (sub P c y.2)).map (psmulZ (y.1 : Int)))
    hs.all (·.isSome) &&
    lbPos P D (padd (psum (hs.map (·.getD []))) [(z3, fofInt k (cf * unit))]) b false

def shapeOf (P : Prob) (X : S3) (cands : List Cand) (al : List ℕ) (ws cs : List (ℕ × ℕ)) : Bool :=
  al.length == X.act.length && al.all (fun v => decide (v < P.verts.length)) &&
    !ws.isEmpty && ws.all (fun (x : Nat × Nat) => decide (0 < x.2) && decide (x.1 < cands.length)) &&
    cs.all (fun (x : Nat × Nat) => decide (0 < x.2) && X.act.contains x.1) &&
    (ws.map (·.1)).eraseDups.length == ws.length && (cs.map (·.1)).eraseDups.length == cs.length

theorem mixOk_eq (P : Prob) (X : S3) (D : ℤ) (cands : List Cand) (c : FCtx) (b : LBox) (al : List ℕ)
    (ws cs : List (ℕ × ℕ)) :
    mixOk P X D cands c b al ws cs =
      (shapeOf P X cands al ws cs &&
        (ws.map (partOf P X cands c al)).all
          (fun (x : ℕ × Option Poly × List ℕ × List Poly) => x.2.1.isSome) &&
        lbPos P D (GOf P X cands c al ws cs) b true && X.act.all (aOkF P X D cands c b al ws cs)) := rfl

/-! ## Small facts -/

theorem find_zip_mem : ∀ (l1 l2 : List ℕ) (f : ℕ), f ∈ l1 → l1.length = l2.length →
    (match (List.zip l1 l2).find? (fun (x : ℕ × ℕ) => x.1 == f) with
     | some x => x.2
     | none => 0) ∈ l2 := by
  intro l1
  induction l1 with
  | nil => intro l2 f hf; simp at hf
  | cons a l ih =>
    intro l2 f hf hlen
    rcases l2 with _ | ⟨b, l2⟩
    · simp at hlen
    · simp only [List.zip_cons_cons, List.find?_cons]
      by_cases haf : a = f
      · simp [haf]
      · have hb : (a == f) = false := beq_eq_false_iff_ne.2 haf
        rw [hb]
        simp only
        have hf' : f ∈ l := (List.mem_cons.1 hf).resolve_left (Ne.symm haf)
        exact List.mem_cons_of_mem _ (ih l2 f hf' (by simpa using hlen))

theorem alOf_mem {X : S3} {al : List ℕ} (hlen : al.length = X.act.length) {f : ℕ} (hf : f ∈ X.act) :
    alOf X al f ∈ al := by
  unfold alOf
  exact find_zip_mem X.act al f hf hlen.symm

/-- The first `c` of the face `f` in `cs` (as `mixOk` reads it). -/
def cfirst (cs : List (ℕ × ℕ)) (f : ℕ) : ℕ := ((cs.find? (fun (y : ℕ × ℕ) => y.1 == f)).map (·.2)).getD 0

/-- All the `c` of the face `f` in `cs`. -/
def ctot (cs : List (ℕ × ℕ)) (f : ℕ) : ℝ := (cs.map (fun y => if y.1 = f then (y.2 : ℝ) else 0)).sum

theorem cfirst_le (cs : List (ℕ × ℕ)) (f : ℕ) : (cfirst cs f : ℝ) ≤ ctot cs f := by
  induction cs with
  | nil => simp [cfirst, ctot]
  | cons y cs ih =>
    have hnn : 0 ≤ ctot cs f := List.sum_nonneg (fun z hz => by
      obtain ⟨u, _, rfl⟩ := List.mem_map.1 hz; split_ifs <;> positivity)
    by_cases h : y.1 = f
    · have : cfirst (y :: cs) f = y.2 := by simp [cfirst, List.find?_cons, h]
      rw [this]
      simp only [ctot, List.map_cons, List.sum_cons, if_pos h]
      unfold ctot at hnn; linarith
    · have hb : (y.1 == f) = false := beq_eq_false_iff_ne.2 h
      have : cfirst (y :: cs) f = cfirst cs f := by simp [cfirst, List.find?_cons, hb]
      rw [this]
      simp only [ctot, List.map_cons, List.sum_cons, if_neg h, zero_add]
      exact ih

theorem ctot_nonneg (cs : List (ℕ × ℕ)) (f : ℕ) : 0 ≤ ctot cs f :=
  List.sum_nonneg (fun z hz => by obtain ⟨u, _, rfl⟩ := List.mem_map.1 hz; split_ifs <;> positivity)

/-- `Σ_{y ∈ cs} c_y h(f_y) = Σ_{f ∈ act} ctot f · h f` (the faces of `cs` are in `act`, no repeats in
`act`). -/
theorem lift_regroup {act : List ℕ} (hact : act.Nodup) {cs : List (ℕ × ℕ)} (hcs : ∀ y ∈ cs, y.1 ∈ act)
    (h : ℕ → ℝ) :
    (cs.map (fun y => (y.2 : ℝ) * h y.1)).sum = (act.map (fun f => ctot cs f * h f)).sum := by
  have e1 : ∀ f ∈ act, ctot cs f * h f = (cs.map (fun y => if f = y.1 then (y.2 : ℝ) * h f else 0)).sum := by
    intro f _
    unfold ctot
    rw [← List.sum_map_mul_right]
    apply LocalTubeMixLeaf.sum_congr'
    intro y _
    by_cases hy : y.1 = f
    · rw [if_pos hy, if_pos hy.symm]
    · rw [if_neg hy, if_neg (fun e => hy e.symm)]; ring
  rw [LocalTubeMixLeaf.sum_congr' act e1, ← LocalTubeMixLeaf.sum_comm']
  apply LocalTubeMixLeaf.sum_congr'
  intro y hy
  rw [LocalTubeMix.sum_ite_single hact (hcs y hy) (fun f => (y.2 : ℝ) * h f)]

theorem idxOf_lt {J : List ℕ} {f : ℕ} (h : J.contains f = true) : idxOf J f < J.length := by
  unfold idxOf
  have hex : ∃ i ∈ List.range J.length, (nth J i 0 == f) = true := by
    obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem (List.elem_iff.1 h)
    exact ⟨i, List.mem_range.2 hi, by unfold nth; rw [List.getD_eq_getElem _ _ hi]; simp⟩
  obtain ⟨i, hi⟩ := Option.isSome_iff_exists.1 (List.find?_isSome.2 hex)
  rw [hi]
  simp only [Option.getD_some]
  exact List.mem_range.1 (List.mem_of_find?_eq_some hi)

/-- `Σ_t n_f[t/3] v[t%3] e_t = N dn dv · n_f·R v` at a point with `e(3a+b) = N R a b`. -/
theorem bsum_eq {P : Prob} {e : ℕ → ℝ} {Nv : ℝ} {R : M3}
    (he : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b) (hd : Dens P) (f v : ℕ) :
    ((List.range 9).map (fun t => ent P.ps P.nb (nth P.normals f []) (t / 3) *
        ent P.ps P.nb (nth P.verts v []) (t % 3) * e t)).sum =
      Nv * P.dn * P.dv * dot (NCv P f) (mv R (Vv P v)) := by
  have hr9 : List.range 9 = [0, 1, 2, 3, 4, 5, 6, 7, 8] := rfl
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hn : ∀ (i : Fin 3), NCv P f i = ent P.ps P.nb (nth P.normals f []) i.val / P.dn := fun _ => rfl
  have hv : ∀ (i : Fin 3), Vv P v i = ent P.ps P.nb (nth P.verts v []) i.val / P.dv := fun _ => rfl
  have E0 : e 0 = Nv * R 0 0 := he 0 0
  have E1 : e 1 = Nv * R 0 1 := he 0 1
  have E2 : e 2 = Nv * R 0 2 := he 0 2
  have E3 : e 3 = Nv * R 1 0 := he 1 0
  have E4 : e 4 = Nv * R 1 1 := he 1 1
  have E5 : e 5 = Nv * R 1 2 := he 1 2
  have E6 : e 6 = Nv * R 2 0 := he 2 0
  have E7 : e 7 = Nv * R 2 1 := he 2 1
  have E8 : e 8 = Nv * R 2 2 := he 2 2
  rw [hr9]
  simp only [List.map_cons, List.map_nil, List.sum_cons, List.sum_nil, Nat.reduceDiv, Nat.reduceMod]
  rw [E0, E1, E2, E3, E4, E5, E6, E7, E8]
  simp only [dot, mv_apply, Fin.sum_univ_three, hn, hv, Fin.val_zero, Fin.val_one, Fin.val_two]
  field_simp
  ring

/-! ## The multipliers of `mixOk` (`aOk`) -/

section Terms

variable {ps : List ℕ}

theorem eval_wsum (T : List (ℕ × Poly)) (sb : Poly → Poly) (hT : ∀ y ∈ T, PolySemG.WF ps (sb y.2))
    (w : Fin 3 → ℝ) :
    PolySemG.WF ps (psum (T.map (fun (y : ℕ × Poly) => psmulZ (y.1 : Int) (sb y.2)))) ∧
    pEval ps (psum (T.map (fun (y : ℕ × Poly) => psmulZ (y.1 : Int) (sb y.2)))) w =
      (T.map (fun y => (y.1 : ℝ) * pEval ps (sb y.2) w)).sum := by
  have hall : ∀ p ∈ T.map (fun (y : ℕ × Poly) => psmulZ (y.1 : Int) (sb y.2)), PolySemG.WF ps p := by
    intro p hp
    obtain ⟨y, hy, rfl⟩ := List.mem_map.1 hp
    exact PolySemG.psmulZ_WF _ (hT y hy)
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum w hall, List.map_map]
  apply LocalTubeMixLeaf.sum_congr'
  intro y _
  simp only [Function.comp_apply, PolySemG.pEval_psmulZ]
  push_cast; ring

theorem eval_hsum (T : List (ℕ × Poly)) (sb : Poly → Poly) (hT : ∀ y ∈ T, PolySemG.WF ps (sb y.2))
    (hs : (T.map (fun (y : ℕ × Poly) => (divRho (sb y.2)).map (psmulZ (y.1 : Int)))).all
      (·.isSome) = true) (w : Fin 3 → ℝ) :
    PolySemG.WF ps (psum ((T.map (fun (y : ℕ × Poly) => (divRho (sb y.2)).map (psmulZ (y.1 : Int)))).map
      (·.getD []))) ∧
    w 0 * pEval ps (psum ((T.map (fun (y : ℕ × Poly) => (divRho (sb y.2)).map (psmulZ (y.1 : Int)))).map
      (·.getD []))) w = (T.map (fun y => (y.1 : ℝ) * pEval ps (sb y.2) w)).sum := by
  simp only [List.all_eq_true, List.mem_map] at hs
  have hsome : ∀ y ∈ T, ∃ H, divRho (sb y.2) = some H := by
    intro y hy
    have := hs _ ⟨y, hy, rfl⟩
    rcases hd : divRho (sb y.2) with _ | H
    · rw [hd] at this; simp at this
    · exact ⟨H, rfl⟩
  have hall : ∀ p ∈ (T.map (fun (y : ℕ × Poly) => (divRho (sb y.2)).map (psmulZ (y.1 : Int)))).map
      (·.getD []), PolySemG.WF ps p := by
    intro p hp
    simp only [List.map_map, List.mem_map, Function.comp_apply] at hp
    obtain ⟨y, hy, rfl⟩ := hp
    obtain ⟨H, hH⟩ := hsome y hy
    rw [hH]
    exact PolySemG.psmulZ_WF _ (LocalTube.divRho_spec w _ H (hT y hy) hH).1
  refine ⟨PolySemG.psum_WF hall, ?_⟩
  rw [PolySemG.pEval_psum w hall, List.map_map, List.map_map, ← LocalTubeMixLeaf.sum_map_smul]
  apply LocalTubeMixLeaf.sum_congr'
  intro y hy
  obtain ⟨H, hH⟩ := hsome y hy
  obtain ⟨_, hv⟩ := LocalTube.divRho_spec w _ H (hT y hy) hH
  simp only [Function.comp_apply, hH, Option.map_some, Option.getD_some, PolySemG.pEval_psmulZ, hv]
  push_cast; ring

end Terms

/-- The `terms` of `aOk` summed: `Σ_{x ∈ ws} w_x · [f ∈ J_x] · v(A^x_{idx f})`. -/
theorem terms_sum (P : Prob) (X : S3) (cands : List Cand) (c : FCtx) (al : List ℕ)
    (ws : List (ℕ × ℕ)) (f : ℕ) (v : Poly → ℝ) :
    (((ws.map (partOf P X cands c al)).filterMap (fun (x : ℕ × Option Poly × List ℕ × List Poly) =>
      if x.2.2.1.contains f then some (x.1, nth x.2.2.2 (idxOf x.2.2.1 f) []) else none)).map
        (fun (y : ℕ × Poly) => (y.1 : ℝ) * v y.2)).sum =
      (ws.map (fun x => (x.2 : ℝ) * (if (nth cands x.1 defCand).J.contains f then
        v (nth (LocalG.AIL P (cdOf cands X al x.1) c.Rq) (idxOf (nth cands x.1 defCand).J f) [])
        else 0))).sum := by
  induction ws with
  | nil => simp
  | cons x ws ih =>
    have e1 : (partOf P X cands c al x).2.2.1 = (nth cands x.1 defCand).J := rfl
    have e2 : (partOf P X cands c al x).2.2.2 = LocalG.AIL P (cdOf cands X al x.1) c.Rq := rfl
    have e3 : (partOf P X cands c al x).1 = x.2 := rfl
    rw [List.map_cons, List.filterMap_cons, e1, e2, e3, List.map_cons, List.sum_cons, ← ih]
    by_cases hc : (nth cands x.1 defCand).J.contains f = true
    · simp only [hc, if_true, List.map_cons, List.sum_cons]
    · simp only [hc, Bool.false_eq_true, if_false, mul_zero, zero_add]

theorem terms_mem (P : Prob) (X : S3) (cands : List Cand) (c : FCtx) (al : List ℕ)
    (ws : List (ℕ × ℕ)) (f : ℕ) (y : ℕ × Poly)
    (hy : y ∈ (ws.map (partOf P X cands c al)).filterMap (fun (x : ℕ × Option Poly × List ℕ × List Poly) =>
      if x.2.2.1.contains f then some (x.1, nth x.2.2.2 (idxOf x.2.2.1 f) []) else none)) :
    ∃ x ∈ ws, (nth cands x.1 defCand).J.contains f = true ∧
      y.2 = nth (LocalG.AIL P (cdOf cands X al x.1) c.Rq) (idxOf (nth cands x.1 defCand).J f) [] := by
  rw [List.mem_filterMap] at hy
  obtain ⟨z, hz, hzy⟩ := hy
  obtain ⟨x, hx, rfl⟩ := List.mem_map.1 hz
  have e1 : (partOf P X cands c al x).2.2.1 = (nth cands x.1 defCand).J := rfl
  have e2 : (partOf P X cands c al x).2.2.2 = LocalG.AIL P (cdOf cands X al x.1) c.Rq := rfl
  have e3 : (partOf P X cands c al x).1 = x.2 := rfl
  rw [e1, e2, e3] at hzy
  split_ifs at hzy with hc
  · simp only [Option.some.injEq] at hzy
    exact ⟨x, hx, hc, by rw [← hzy]⟩

/-- **The checked multipliers.** If `aOk` passed for the face `f` and every polynomial `q` of the
candidates' `A` has `sub q = K⁴ v(q)` at `w` (`ρ = w 0 ≥ 0`), then
`Σ_x w_x [f ∈ J_x] v(A^x_{idx f}) + c_f ρ dm dn0 ≥ 0` (`c_f` the first `c` of `f`). -/
theorem aOk_spec {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hrden : 0 < P.rden) {X : S3} (hX : tubeOk X = true) {cands : List Cand}
    {j : ℕ} {sg : ℤ} {b : LBox} {al : List ℕ} {ws cs : List (ℕ × ℕ)} {f : ℕ}
    (hl : b.lo.length = 3) (hh : b.hi.length = 3)
    (hzw : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true)
    (hJ3 : ∀ x ∈ ws, (nth cands x.1 defCand).J.length = 3)
    (h : aOkF P X P.rden cands (ctx P X j sg) b al ws cs f = true)
    {w : Fin 3 → ℝ} (hzb : InL b (fun k => (P.rden : ℝ) * w k)) (hw0 : 0 ≤ w 0) (v : Poly → ℝ)
    (hq : ∀ x ∈ ws, ∀ q ∈ LocalG.AIL P (cdOf cands X al x.1) (ctx P X j sg).Rq,
      PolySemG.WF P.ps (sub P (ctx P X j sg) q) ∧
      pEval P.ps (sub P (ctx P X j sg) q) w = (kScale X : ℝ) ^ 4 * v q) :
    0 ≤ (ws.map (fun x => (x.2 : ℝ) * (if (nth cands x.1 defCand).J.contains f then
        v (nth (LocalG.AIL P (cdOf cands X al x.1) (ctx P X j sg).Rq) (idxOf (nth cands x.1 defCand).J f) [])
        else 0))).sum + (cfirst cs f : ℝ) * w 0 * (nth cands 0 defCand).dm * P.dn0 := by
  have hK := kScale_pos hX
  have h4 : (0 : ℝ) < (kScale X : ℝ) ^ 4 := by positivity
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  have hzy : (fun k => (fun k => (P.rden : ℝ) * w k) k / (P.rden : ℝ)) = w := by
    funext k; field_simp
  set c := ctx P X j sg with hc
  set T := (ws.map (partOf P X cands c al)).filterMap (fun (x : ℕ × Option Poly × List ℕ × List Poly) =>
      if x.2.2.1.contains f then some (x.1, nth x.2.2.2 (idxOf x.2.2.1 f) []) else none) with hT
  have hTq : ∀ y ∈ T, PolySemG.WF P.ps (sub P c y.2) ∧ pEval P.ps (sub P c y.2) w = (kScale X : ℝ) ^ 4 * v y.2 := by
    intro y hy
    obtain ⟨x, hx, hcon, hy2⟩ := terms_mem P X cands c al ws f y hy
    have hlt := idxOf_lt hcon
    rw [hy2]
    apply hq x hx
    have h3 : idxOf (nth cands x.1 defCand).J f < (LocalG.AIL P (cdOf cands X al x.1) c.Rq).length := by
      simp only [LocalG.AIL, List.length_map, List.length_range]
      rw [← hJ3 x hx]; exact hlt
    exact FarG.mem_nth h3 []
  have hsum := terms_sum P X cands c al ws f v
  rw [← hT] at hsum
  rw [← hsum]
  have hval : (T.map (fun (y : ℕ × Poly) => (y.1 : ℝ) * pEval P.ps (sub P c y.2) w)).sum =
      (kScale X : ℝ) ^ 4 * (T.map (fun (y : ℕ × Poly) => (y.1 : ℝ) * v y.2)).sum := by
    rw [← LocalTubeMixLeaf.sum_map_smul]
    apply LocalTubeMixLeaf.sum_congr'
    intro y hy; rw [(hTq y hy).2]; ring
  have hcf : (((cs.find? (fun (y : ℕ × ℕ) => y.1 == f)).map (fun y => (y.2 : ℤ))).getD 0 : ℤ) =
      (cfirst cs f : ℤ) := by
    unfold cfirst; cases cs.find? (fun (y : ℕ × ℕ) => y.1 == f) <;> rfl
  have hunit : (((kScale X ^ 4 * ((nth cands 0 defCand).dm : ℤ) * (P.dn0 : ℤ)) : ℤ) : ℝ) =
      (kScale X : ℝ) ^ 4 * (nth cands 0 defCand).dm * P.dn0 := by push_cast; ring
  unfold aOkF at h
  simp only [← hT] at h
  have hKc : c.K = kScale X := rfl
  rw [hcf, hKc, hwf.nb] at h
  have hgoal : ∀ r : ℝ, 0 ≤ (kScale X : ℝ) ^ 4 * r → 0 ≤ r := fun r hr => LocalTubeMain.pos_of_mul_K h4 hr
  apply hgoal
  rw [mul_add, ← hval]
  obtain ⟨hWw, hWv⟩ := eval_wsum T (sub P c) (fun y hy => (hTq y hy).1) w
  split_ifs at h with hE hpos
  · simp only [Bool.and_eq_true, List.isEmpty_iff, beq_iff_eq] at hE
    obtain ⟨hT0, hc0⟩ := hE
    have : cfirst cs f = 0 := by exact_mod_cast hc0
    rw [hT0, this]; simp
  · have hsing : PolySemG.WF P.ps [(([1, 0, 0] : Mono), fofInt (2 ^ P.ps.length)
        ((cfirst cs f : ℤ) * (kScale X ^ 4 * ((nth cands 0 defCand).dm : ℤ) * (P.dn0 : ℤ))))] := by
      intro e he; simp at he; subst he; exact ⟨rfl, len_fofInt _ _⟩
    have hap := LocalG.lbPos_nonneg hb hKb hrden (PolySemG.padd_WF hWw hsing) hl hh hzw h hzb
    rw [hzy, PolySemG.pEval_padd w hWw hsing, hWv] at hap
    simp only [PolySemG.pEval_cons, PolySemG.pEval_nil, fval_fofInt, monoEval_three] at hap
    push_cast at hap ⊢
    nlinarith
  · rw [Bool.and_eq_true] at h
    obtain ⟨hs, hlb⟩ := h
    obtain ⟨hHw, hHv⟩ := eval_hsum T (sub P c) (fun y hy => (hTq y hy).1) hs w
    have hsing : PolySemG.WF P.ps [(z3, fofInt (2 ^ P.ps.length)
        ((cfirst cs f : ℤ) * (kScale X ^ 4 * ((nth cands 0 defCand).dm : ℤ) * (P.dn0 : ℤ))))] := by
      intro e he; simp at he; subst he; exact ⟨rfl, len_fofInt _ _⟩
    have hap := LocalG.lbPos_nonneg hb hKb hrden (PolySemG.padd_WF hHw hsing) hl hh hzw hlb hzb
    rw [hzy, PolySemG.pEval_padd w hHw hsing] at hap
    simp only [PolySemG.pEval_cons, PolySemG.pEval_nil, fval_fofInt, z3, monoEval_three] at hap
    have := mul_nonneg hw0 hap
    rw [mul_add, hHv] at this
    push_cast at this ⊢
    nlinarith

/-! ## The mixed leaf -/

theorem candsOk_more {P : Prob} {X : S3} {cands : List Cand} (h : candsOk P X cands = true) :
    ∀ cd ∈ cands, cd.dm = (nth cands 0 defCand).dm ∧ ∀ f ∈ cd.J, f ∈ X.act := by
  intro cd hcd
  unfold candsOk at h
  simp only [Bool.and_eq_true, List.all_eq_true] at h
  have := h.2 cd hcd
  simp only [LocalG.candPolys_eq, Bool.and_eq_true, List.all_eq_true, beq_iff_eq] at this
  refine ⟨this.1.1.1.1.1.1.2, fun f hf => ?_⟩
  have := this.1.1.1.1.1.2 f hf
  simpa using this

theorem nth_map_alOf {X : S3} {al J : List ℕ} {jj : ℕ} (hjj : jj < J.length) :
    nth (J.map (alOf X al)) jj 0 = alOf X al (nth J jj 0) := by
  unfold nth
  rw [List.getD_eq_getElem _ _ (by simpa using hjj), List.getD_eq_getElem _ _ hjj]
  simp

/-- **A mixed leaf.** At a point `w` of an accepted mixed leaf on the face `(j, sg)`
(`ρ = w 0 ≥ 0`), with `faceX(w) = K·x` and `R` the rotation at `x`, every feasible `(R, t, S)` has
`S ≥ S*` (container and piece centrally symmetric, the faces `act` distinct and in range). -/
theorem mix_leaf {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hD0 : 0 < D0r P) (hrden : 0 < P.rden)
    (hco : containerOk P = true) (hpo : pieceOk P = true)
    {X : S3} (hX : tubeOk X = true) (hact : X.act.Nodup) (hactn : ∀ f ∈ X.act, f < P.normals.length)
    {cands : List Cand} (hcands : candsOk P X cands = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v) {j : ℕ} {sg : ℤ} {b : LBox} {al : List ℕ}
    {ws cs : List (ℕ × ℕ)}
    (hl : b.lo.length = 3) (hh : b.hi.length = 3)
    (hzw : (List.zipWith (fun l h => decide (l < h) && (h - l) % 2 == 0) b.lo b.hi).all id = true)
    (hm : mixOk P X P.rden cands (ctx P X j sg) b al ws cs = true)
    {w : Fin 3 → ℝ} (hzb : InL b (fun k => (P.rden : ℝ) * w k)) (hw0 : 0 ≤ w 0)
    {x : Fin 3 → ℝ} (hx : ∀ i : Fin 3, fxv X j sg i.val w = (kScale X : ℝ) * x i)
    {R : M3} (hNv : 0 < pEval P.ps (rotPoly P.ps P.nb).2 x)
    (he : ∀ a b : Fin 3, pEval P.ps (nth (rotPoly P.ps P.nb).1 (3 * a.val + b.val) []) x =
      pEval P.ps (rotPoly P.ps P.nb).2 x * R a b)
    {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S) :
    Ss P ≤ S := by
  rw [mixOk_eq] at hm
  simp only [Bool.and_eq_true] at hm
  obtain ⟨⟨⟨hshape, hgOk⟩, hG⟩, haOk⟩ := hm
  unfold shapeOf at hshape
  simp only [Bool.and_eq_true, beq_iff_eq, List.all_eq_true, decide_eq_true_eq] at hshape
  obtain ⟨⟨⟨⟨⟨⟨hallen, halv⟩, hwsne⟩, hws⟩, hcs⟩, _⟩, _⟩ := hshape
  have hne : ws ≠ [] := by intro h0; rw [h0] at hwsne; simp at hwsne
  have hcs' : ∀ y ∈ cs, 0 < y.2 ∧ y.1 ∈ X.act := by
    intro y hy; have := hcs y hy
    exact ⟨this.1, by simpa using this.2⟩
  have hws' : ∀ y ∈ ws, 0 < y.2 ∧ y.1 < cands.length := by
    intro y hy; have := hws y hy; simpa using this
  have hK := kScale_pos hX
  have h4 : (0 : ℝ) < (kScale X : ℝ) ^ 4 := by positivity
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  have hzy : (fun k => (fun k => (P.rden : ℝ) * w k) k / (P.rden : ℝ)) = w := by
    funext k; field_simp
  obtain ⟨hRqW, hNW, -, -⟩ := LocalG.rotPoly_spec P.ps x
  rw [← hwf.nb] at hRqW hNW
  obtain ⟨hRqD, hND⟩ := LocalTubeDeg.rotPoly_DM P.ps P.nb
  have hcR : (ctx P X j sg).Rq = (rotPoly P.ps P.nb).1 := rfl
  have hcN : (ctx P X j sg).N = (rotPoly P.ps P.nb).2 := rfl
  set Rq := (rotPoly P.ps P.nb).1 with hRq
  set N := (rotPoly P.ps P.nb).2 with hN
  set e : ℕ → ℝ := fun t => pEval P.ps (nth Rq t []) x with hedef
  set Nv := pEval P.ps N x with hNvdef
  set dm0 := (nth cands 0 defCand).dm with hdm0
  -- the candidates
  have hcx : ∀ y ∈ ws, nth cands y.1 defCand ∈ cands := fun y hy => FarG.mem_nth (hws' y hy).2 defCand
  have hcok : ∀ y ∈ ws, candOk P (nth cands y.1 defCand) = true :=
    fun y hy => (LocalTubeMain.candsOk_spec hcands _ (hcx y hy)).1
  have hmore := candsOk_more hcands
  have hJl : ∀ y ∈ ws, (nth cands y.1 defCand).J.length = 3 :=
    fun y hy => (LocalG.cand_ident hwf (hcw _ (hcx y hy)) (hcok y hy)).1
  have hcd'ok : ∀ y ∈ ws, candOk P (cdOf cands X al y.1) = true := by
    intro y hy
    apply LocalTubeMix.candOk_al (hcok y hy)
    · simp [hJl y hy]
    · intro v hv
      obtain ⟨f, hf, rfl⟩ := List.mem_map.1 hv
      exact halv _ (alOf_mem hallen ((hmore _ (hcx y hy)).2 f hf))
  have hcw' : ∀ y ∈ ws, ∀ v ∈ (cdOf cands X al y.1).minv, LenV P.ps v :=
    fun y hy => hcw (nth cands y.1 defCand) (hcx y hy)
  have hJin : ∀ y ∈ ws, ∀ jj < 3, nth (nth cands y.1 defCand).J jj 0 ∈ X.act := by
    intro y hy jj hjj
    exact (hmore _ (hcx y hy)).2 _ (FarG.mem_nth (by rw [hJl y hy]; exact hjj) 0)
  have hdmr : ∀ y ∈ ws, ((cdOf cands X al y.1).dm : ℝ) = dm0 := by
    intro y hy; simp only [cdOf]; exact_mod_cast (hmore _ (hcx y hy)).1
  have hXV : ∀ y ∈ ws, ∀ jj < 3, LocalTubeMix.XV P (cdOf cands X al y.1) R jj =
      dot (NCv P (nth (nth cands y.1 defCand).J jj 0))
        (mv R (Vv P (alOf X al (nth (nth cands y.1 defCand).J jj 0)))) := by
    intro y hy jj hjj
    unfold LocalTubeMix.XV
    simp only [cdOf]
    rw [nth_map_alOf (by rw [hJl y hy]; exact hjj)]
  have hdn : (0 : ℝ) < P.dn := by exact_mod_cast hd.dn
  have hdv : (0 : ℝ) < P.dv := by exact_mod_cast hd.dv
  have hdn0 : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
  have hd0d : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
  have hssd : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  have hdm0 : (0 : ℝ) < dm0 := by
    obtain ⟨y0, hy0⟩ := List.exists_mem_of_ne_nil ws hne
    rw [← hdmr y0 hy0]
    exact_mod_cast (LocalG.cand_ident hwf (hcw' y0 hy0) (hcd'ok y0 hy0)).2.2.1
  have hssn : fval P.ps P.sstar.num = Ss P * P.sstar.den := by unfold Ss; field_simp
  have hev := fun y (hy : y ∈ ws) => LocalG.cand_eval hwf (hcw' y hy) hRqW hNW x
  -- `F` of the candidates on the face
  have hFsub : ∀ y ∈ ws, PolySemG.WF P.ps (sub P (ctx P X j sg) (LocalG.FP P (cdOf cands X al y.1) Rq N)) ∧
      pEval P.ps (sub P (ctx P X j sg) (LocalG.FP P (cdOf cands X al y.1) Rq N)) w =
        (kScale X : ℝ) ^ 4 * LocalG.FV P (cdOf cands X al y.1) e Nv := by
    intro y hy
    obtain ⟨hs1, hs2⟩ := sub_spec hwf hX j sg (hev y hy).1.1
      (LocalTubeDeg.degLe_of_DM (LocalTubeDeg.FP_DM P _ hRqD hND)) w hx
    exact ⟨hs1, by rw [hs2, (hev y hy).1.2]⟩
  have hFsub' : ∀ y ∈ ws, PolySemG.WF P.ps (sub P (ctx P X j sg)
      (LocalG.FP P (cdOf cands X al y.1) (ctx P X j sg).Rq (ctx P X j sg).N)) ∧
      pEval P.ps (sub P (ctx P X j sg) (LocalG.FP P (cdOf cands X al y.1) (ctx P X j sg).Rq
        (ctx P X j sg).N)) w = (kScale X : ℝ) ^ 4 * LocalG.FV P (cdOf cands X al y.1) e Nv := by
    intro y hy; rw [hcR, hcN]; exact hFsub y hy
  have hpart : ∀ y ∈ ws, ∃ Gy, divRho (sub P (ctx P X j sg)
      (LocalG.FP P (cdOf cands X al y.1) (ctx P X j sg).Rq (ctx P X j sg).N)) = some Gy := by
    intro y hy
    simp only [List.all_eq_true, List.mem_map] at hgOk
    have := hgOk _ ⟨y, hy, rfl⟩
    simp only [partOf] at this
    rcases hdv : divRho (sub P (ctx P X j sg) (LocalG.FP P (cdOf cands X al y.1) (ctx P X j sg).Rq
        (ctx P X j sg).N)) with _ | Gy
    · rw [hdv] at this; simp at this
    · exact ⟨Gy, rfl⟩
  -- the two halves of `G`
  set GA := psum ((ws.map (partOf P X cands (ctx P X j sg) al)).map
    (fun (x : ℕ × Option Poly × List ℕ × List Poly) => psmulZ (x.1 : Int) (x.2.1.getD []))) with hGA
  set GB := psum (cs.map (fun (y : ℕ × ℕ) => psmulZ (y.2 : Int) (sub P (ctx P X j sg)
    (liftPoly P (ctx P X j sg).Rq (ctx P X j sg).N dm0 y.1 (alOf X al y.1))))) with hGB
  have hAall : ∀ p ∈ (ws.map (partOf P X cands (ctx P X j sg) al)).map
      (fun (x : ℕ × Option Poly × List ℕ × List Poly) => psmulZ (x.1 : Int) (x.2.1.getD [])),
      PolySemG.WF P.ps p := by
    intro p hp
    simp only [List.map_map, List.mem_map, Function.comp_apply] at hp
    obtain ⟨y, hy, rfl⟩ := hp
    obtain ⟨Gy, hGy⟩ := hpart y hy
    simp only [partOf]
    rw [hGy]
    exact PolySemG.psmulZ_WF _ (LocalTube.divRho_spec w _ Gy (hFsub' y hy).1 hGy).1
  have hAval : w 0 * pEval P.ps GA w = (kScale X : ℝ) ^ 4 *
      (ws.map (fun y => (y.2 : ℝ) * LocalG.FV P (cdOf cands X al y.1) e Nv)).sum := by
    rw [hGA, PolySemG.pEval_psum w hAall, List.map_map, ← LocalTubeMixLeaf.sum_map_smul,
      ← LocalTubeMixLeaf.sum_map_smul, List.map_map]
    apply LocalTubeMixLeaf.sum_congr'
    intro y hy
    obtain ⟨Gy, hGy⟩ := hpart y hy
    obtain ⟨_, hv⟩ := LocalTube.divRho_spec w _ Gy (hFsub' y hy).1 hGy
    have h2 : w 0 * pEval P.ps Gy w = (kScale X : ℝ) ^ 4 * LocalG.FV P (cdOf cands X al y.1) e Nv := by
      rw [← hv, (hFsub' y hy).2]
    simp only [Function.comp_apply, partOf]
    rw [hGy, Option.getD_some, PolySemG.pEval_psmulZ]
    push_cast
    linear_combination (y.2 : ℝ) * h2
  -- the lift
  set L : ℕ → ℝ := fun f => pEval P.ps (liftPoly P Rq N dm0 f (alOf X al f)) x with hLdef
  have hlift : ∀ f ∈ X.act, PolySemG.WF P.ps (sub P (ctx P X j sg)
      (liftPoly P (ctx P X j sg).Rq (ctx P X j sg).N dm0 f (alOf X al f))) ∧
      pEval P.ps (sub P (ctx P X j sg) (liftPoly P (ctx P X j sg).Rq (ctx P X j sg).N dm0 f
        (alOf X al f))) w = (kScale X : ℝ) ^ 4 * L f := by
    intro f hf
    obtain ⟨hw1, _⟩ := LocalTubeMix.lift_value hwf hRqW hNW dm0 f (alOf X al f) (hactn f hf)
      (halv _ (alOf_mem hallen hf)) x
    exact sub_spec hwf hX j sg hw1
      (LocalTubeDeg.degLe_of_DM ((LocalTubeDeg.lift_DM P hRqD hND dm0 f _).mono (by norm_num))) w hx
  have hBall : ∀ p ∈ cs.map (fun (y : ℕ × ℕ) => psmulZ (y.2 : Int) (sub P (ctx P X j sg)
      (liftPoly P (ctx P X j sg).Rq (ctx P X j sg).N dm0 y.1 (alOf X al y.1)))), PolySemG.WF P.ps p := by
    intro p hp
    obtain ⟨y, hy, rfl⟩ := List.mem_map.1 hp
    exact PolySemG.psmulZ_WF _ (hlift y.1 (hcs' y hy).2).1
  have hBval : pEval P.ps GB w = (kScale X : ℝ) ^ 4 * (cs.map (fun y => (y.2 : ℝ) * L y.1)).sum := by
    rw [hGB, PolySemG.pEval_psum w hBall, List.map_map, ← LocalTubeMixLeaf.sum_map_smul]
    apply LocalTubeMixLeaf.sum_congr'
    intro y hy
    simp only [Function.comp_apply, PolySemG.pEval_psmulZ, (hlift y.1 (hcs' y hy).2).2]
    push_cast; ring
  -- `G ≥ 0`
  have hGW : PolySemG.WF P.ps (GOf P X cands (ctx P X j sg) al ws cs) :=
    PolySemG.padd_WF (PolySemG.psum_WF hAall) (PolySemG.psum_WF hBall)
  have hG0 := LocalG.lbPos_nonneg hb hKb hrden hGW hl hh hzw hG hzb
  rw [hzy] at hG0
  have hGv : pEval P.ps (GOf P X cands (ctx P X j sg) al ws cs) w = pEval P.ps GA w + pEval P.ps GB w :=
    PolySemG.pEval_padd w (PolySemG.psum_WF hAall) (PolySemG.psum_WF hBall)
  rw [hGv] at hG0
  have hΦ : 0 ≤ (ws.map (fun y => (y.2 : ℝ) * LocalG.FV P (cdOf cands X al y.1) e Nv)).sum +
      w 0 * (X.act.map (fun f => ctot cs f * L f)).sum := by
    have h1 := mul_nonneg hw0 hG0
    rw [mul_add, hAval, hBval, lift_regroup hact (fun y hy => (hcs' y hy).2) L] at h1
    apply LocalTubeMain.pos_of_mul_K h4
    nlinarith
  -- the checked multipliers
  have ha : ∀ f ∈ X.act, 0 ≤ (ws.map (fun y => (y.2 : ℝ) *
      (if (nth cands y.1 defCand).J.contains f then
        LocalG.AV P (cdOf cands X al y.1) e (idxOf (nth cands y.1 defCand).J f) else 0))).sum +
      ctot cs f * w 0 * dm0 * P.dn0 := by
    intro f hf
    have hq : ∀ y ∈ ws, ∀ q ∈ LocalG.AIL P (cdOf cands X al y.1) (ctx P X j sg).Rq,
        PolySemG.WF P.ps (sub P (ctx P X j sg) q) ∧
        pEval P.ps (sub P (ctx P X j sg) q) w = (kScale X : ℝ) ^ 4 * pEval P.ps q x := by
      intro y hy q hq
      have hqW : PolySemG.WF P.ps q := by
        unfold LocalG.AIL at hq
        simp only [List.mem_map, List.mem_range] at hq
        obtain ⟨jj, _, rfl⟩ := hq
        exact ((hev y hy).2 jj).1
      have hqd : degLe 4 q = true := (LocalTubeMain.candsOk_spec hcands _ (hcx y hy)).2.2 q hq
      exact sub_spec hwf hX j sg hqW hqd w hx
    have hA := aOk_spec hb hKb hwf hrden hX hl hh hzw hJl (List.all_eq_true.1 haOk f hf) hzb hw0
      (fun q => pEval P.ps q x) hq
    have hsum : (ws.map (fun y => (y.2 : ℝ) * (if (nth cands y.1 defCand).J.contains f then
        pEval P.ps (nth (LocalG.AIL P (cdOf cands X al y.1) (ctx P X j sg).Rq)
          (idxOf (nth cands y.1 defCand).J f) []) x else 0))).sum =
        (ws.map (fun y => (y.2 : ℝ) * (if (nth cands y.1 defCand).J.contains f then
          LocalG.AV P (cdOf cands X al y.1) e (idxOf (nth cands y.1 defCand).J f) else 0))).sum := by
      apply LocalTubeMixLeaf.sum_congr'
      intro y hy
      by_cases hc : (nth cands y.1 defCand).J.contains f = true
      · rw [if_pos hc, if_pos hc]
        have hlt : idxOf (nth cands y.1 defCand).J f < 3 := by rw [← hJl y hy]; exact idxOf_lt hc
        unfold LocalG.AIL
        rw [hcR, LocalG.nth_range _ hlt, ((hev y hy).2 _).2]
      · rw [if_neg hc, if_neg hc]
    rw [hsum] at hA
    have hle := cfirst_le cs f
    have : (cfirst cs f : ℝ) * w 0 * dm0 * P.dn0 ≤ ctot cs f * w 0 * dm0 * P.dn0 := by
      have : 0 ≤ w 0 * dm0 * P.dn0 := by positivity
      nlinarith
    linarith
  have heE : ∀ a b : Fin 3, e (3 * a.val + b.val) = Nv * R a b := he
  -- everything together
  refine LocalTubeMixLeaf.mix_real ws (fun y => (y.2 : ℝ)) (fun y hy => by exact_mod_cast (hws' y hy).1)
    hne X.act hact (fun y => (nth cands y.1 defCand).J) hJl
    (fun y hy => LocalTubeMix.J_distinct hwf hd (hcw _ (hcx y hy)) (hcok y hy)) hJin
    (fun y jj => LocalG.AV P (cdOf cands X al y.1) e jj) (fun y => LocalG.FV P (cdOf cands X al y.1) e Nv)
    (fun f => dot (NCv P f) (mv R (Vv P (alOf X al f)))) (fun f => dot (NCv P f) t) (ctot cs) L
    (Dd := (P.d0.den : ℝ) * P.sstar.den) (dm := dm0) (dn0 := P.dn0) (dn := P.dn) (dv := P.dv)
    (D0 := D0r P) (Nv := Nv) (Z := dot (mv R (N0v P)) t) (ρ := w 0)
    (by positivity) hdm0 hdn0 hdn hdv hD0 hNv hw0 ?_ ?_ ?_ (fun f _ => ctot_nonneg cs f) ?_ ?_ hLP.2 ha hΦ
  · intro y hy
    obtain ⟨cp1, _⟩ := LocalTubeMix.cand_parts hwf hd hsd (hcd'ok y hy) (hcw' y hy) heE t
    rw [cp1, hdmr y hy, hXV y hy 0 (by norm_num), hXV y hy 1 (by norm_num), hXV y hy 2 (by norm_num)]
    ring
  · intro y hy
    obtain ⟨_, cp2⟩ := LocalTubeMix.cand_parts hwf hd hsd (hcd'ok y hy) (hcw' y hy) heE t
    rw [hdmr y hy] at cp2
    exact cp2
  · intro f hf
    obtain ⟨_, hv⟩ := LocalTubeMix.lift_value hwf hRqW hNW dm0 f (alOf X al f) (hactn f hf)
      (halv _ (alOf_mem hallen hf)) x
    simp only [hLdef]
    rw [hv, bsum_eq heE hd, hssn]
    ring
  · intro f hf
    exact hLP.1 f (hactn f hf) _ (halv _ (alOf_mem hallen hf))
  · intro f hf
    exact LocalTubeMix.opp_row hwf hco hpo hLP (hactn f hf) (halv _ (alOf_mem hallen hf))

/-- **The mixed leaves are sound** (`LocalTubeMain.MixSound`). -/
theorem mixSound {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hsd : 0 < P.sstar.den) (hD0 : 0 < D0r P) (hrden : 0 < P.rden)
    (hco : containerOk P = true) (hpo : pieceOk P = true)
    {X : S3} (hX : tubeOk X = true) (hact : X.act.Nodup) (hactn : ∀ f ∈ X.act, f < P.normals.length)
    {cands : List Cand} (hcands : candsOk P X cands = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v) : MixSound P X cands :=
  fun _ _ _ _ _ _ hl hh hzw hm _ _ hzb hw0 hx _ hNv he _ _ hLP =>
    mix_leaf hb hKb hwf hd hsd hD0 hrden hco hpo hX hact hactn hcands hcw hl hh hzw hm hzb hw0 hx hNv
      he hLP

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- **`S ≥ S*` on the LP for octinico** (`D16Main.lower_LP` with the far tree `farRunT` and the
local check of the tube `localOkT`). -/
theorem lower_LPT {P : Prob} (hc : D16Main.Consts P) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) (hD0 : 0 < D0r P) {X : S3} (hact : X.act.Nodup)
    (hactn : ∀ f ∈ X.act, f < P.normals.length)
    {toks : List PackLean.D16.Tok} (hfar : (PackLean.D30S3.farRunT P X toks).1 = true)
    {cands : List Cand} {faces : List (List PackLean.D30S3.LTokT)}
    (hloc : (PackLean.D30S3.localOkT P X cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2) :
    ∀ R ∈ SO3, ∀ (t : E3) (S : ℝ),
      polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S → Ss P ≤ S := by
  intro R hR t S h
  have hd := D16Main.dens_of hc
  have hb : BracketG P.sqb (maskOf P.ps) ((2 : ℝ) ^ P.sqk) := by
    have := PolySemG.bracket_of_sqbOk hc.sqb; rwa [hmask] at this
  have hKb : (0 : ℝ) < 2 ^ P.sqk := by positivity
  obtain ⟨_, _, _, hss⟩ := D16Main.bnd_parts hc.bnd
  obtain ⟨hcands, hX, -, -, -⟩ := localOkT_unpack hloc
  obtain ⟨Q, hQ, ⟨t', hQLP⟩, hmax⟩ := Orbit.max_rep hR h
  rcases far_mainT hb hKb hwf hd hc.dg hc.dk hq (D16Main.tr_pos hc) hc.rden hc.bnd hc.grp hX hfar hPT
    hN0 hball hQ hQLP hmax with h1 | ⟨u, huc, hu⟩
  · exact (D16Main.ss_le_sb hwf hc.bnd).trans h1
  · exact local_mainT hb hKb hwf hd hss hD0 hc.rden hloc
      (mixSound hb hKb hwf hd hss hD0 hc.rden hc.cont hc.piece hX hact hactn hcands hcw) hcw huc hu hQLP

end

#assert_std_axioms PackLean.Formal.LocalTubeMixMain.lower_LPT PackLean.Formal.LocalTubeMixMain.mix_leaf

end PackLean.Formal.LocalTubeMixMain
