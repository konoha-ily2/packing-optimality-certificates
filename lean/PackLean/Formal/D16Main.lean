import PackLean.Formal.UpperG

/-!
# D45 stage 4l: the main theorem of `D16.Core` (`IsMinEdge` from the checkers)

`plan/D45_s4_design.md` §2, steps 1–10 put together, for any `P : Prob`:

* `Consts`: the parts of `constsOk P` (`consts_of`), `dens_of` (the positive denominators);
* `ss_le_sb`: `S* ≤ S̄` (`boundsOk`); `hsym_of`: the vertices of the data are point-symmetric
  (`pieceOk`);
* `lower_LP`: **every feasible `(R, t, S)` of the LP in the checkers' coordinates has `S ≥ S*`**
  (the representative of largest trace `Orbit.max_rep`, then `far_main`, and `local_main` on `L`);
* `fits_rot`: two copies of `K = conv KV` fit ⇒ two copies of the rotated piece
  `conv {Vv P l}` fit (`A` maps `KV` onto the vertices of the data);
* **`d16_main`**: `IsMinEdge K C 2 (S* / σ)`, from the checkers (`constsOk`, `farRun`, `localOk`),
  the lengths (`wfOk`, `maskp = maskOf ps`, the rows of the candidates) and the geometric bridges
  (the piece: interior and face orbit in the checkers' coordinates, `hPT`, `hball`, `|n0| > 0`;
  the rotation `A = R*`; the container: `NCv P j · y ≤ σ` on `C` and its converse).
  The Boolean certificates for the bridges of the piece and of `P_T` are in `D16Bridge.lean`.
-/

namespace PackLean.Formal.D16Main

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn vsmul constsOk sqbOk pieceOk containerOk groupOk
  boundsOk upperOk farRun localOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.LocalG (Ss local_main)
open PackLean.Formal.FarG (far_main exists_nth)
open PackLean.Formal.UpperG (place place_apply orth_of_SO rotLE neg_spec upper_main)
open PackLean.Formal.PolySemG (BracketG maskOf bracket_of_sqbOk)
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## The constants -/

/-- The parts of `constsOk`. -/
structure Consts (P : Prob) : Prop where
  sqb : sqbOk P = true
  piece : pieceOk P = true
  cont : containerOk P = true
  grp : groupOk P = true
  bnd : boundsOk P = true
  up : upperOk P = true
  dv : 0 < P.dv
  dn : 0 < P.dn
  dn0 : 0 < P.dn0
  dp : 0 < P.dp
  dg : 0 < P.dg
  dk : 0 < P.dk
  dt : 0 < P.dt
  rden : 0 < P.rden

theorem consts_of {P : Prob} (h : constsOk P = true) : Consts P := by
  simp only [constsOk, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩, h12⟩, h13⟩, _⟩,
    h15⟩, _⟩ := h
  exact ⟨h1, h2, h3, h4, h5, h6, h7, h8, h9, h10, h11, h12, h13, h15⟩

theorem d0den_of {P : Prob} (h : pieceOk P = true) : 0 < P.d0.den := by
  simp only [pieceOk, Bool.and_eq_true, decide_eq_true_eq] at h
  exact h.1.1.1.1.1.1.2

theorem bnd_parts {P : Prob} (h : boundsOk P = true) :
    0 < P.sbar.2 ∧ 0 < P.tt.2 ∧ 0 < P.tt.1 ∧ 0 < P.sstar.den := by
  simp only [boundsOk, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨hsd, htd⟩, htn⟩, _⟩, _⟩, hss⟩ := h
  exact ⟨by exact_mod_cast hsd, by exact_mod_cast htd, htn, hss⟩

theorem dens_of {P : Prob} (hc : Consts P) : Dens P := by
  obtain ⟨hsd, htd, _, _⟩ := bnd_parts hc.bnd
  exact ⟨hc.dn, hc.dv, hc.dn0, hc.dp, d0den_of hc.piece, hsd, htd⟩

theorem tr_pos {P : Prob} (hc : Consts P) : 0 < Tr P := by
  obtain ⟨_, htd, htn, _⟩ := bnd_parts hc.bnd
  unfold Tr
  have : (0 : ℝ) < P.tt.1 := by exact_mod_cast htn
  have : (0 : ℝ) < P.tt.2 := by exact_mod_cast htd
  positivity

/-- `S* ≤ S̄` (`boundsOk`). -/
theorem ss_le_sb {P : Prob} (hwf : WF P) (h : boundsOk P = true) : Ss P ≤ Sb P := by
  obtain ⟨hsd, _, _, hss⟩ := bnd_parts h
  simp only [boundsOk, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨_, hsb⟩, _⟩, _⟩ := h
  have hl : Len P.ps (fofInt P.nb (P.sbar.1 * P.sstar.den)) := by rw [hwf.nb]; exact len_fofInt _ _
  have h0 := nonneg_of_fnn hwf.pos (len_fsub hl (len_fsmul _ hwf.sstar)) hsb
  rw [fval_fsub hl (len_fsmul _ hwf.sstar), fval_fsmul, hwf.nb, fval_fofInt] at h0
  unfold Ss Sb
  have hss' : (0 : ℝ) < P.sstar.den := by exact_mod_cast hss
  have hsd' : (0 : ℝ) < P.sbar.2 := by exact_mod_cast hsd
  rw [div_le_div_iff₀ hss' hsd']
  push_cast at h0
  linarith

/-- The vertices of the data are point-symmetric (`pieceOk`). -/
theorem hsym_of {P : Prob} (hwf : WF P) (h : pieceOk P = true) :
    ∀ l < P.verts.length, ∃ l' < P.verts.length, Vv P l' = -Vv P l := by
  simp only [pieceOk, Bool.and_eq_true, decide_eq_true_eq] at h
  have hs := h.1.1.1.1.1.2
  simp only [List.all_eq_true, List.any_eq_true, beq_iff_eq] at hs
  intro l hl
  have hv : nth P.verts l [] ∈ P.verts := by
    unfold nth; rw [List.getD_eq_getElem _ _ hl]; exact List.getElem_mem hl
  obtain ⟨w, hw, hwe⟩ := hs _ hv
  obtain ⟨l', hl', he⟩ := exists_nth hw []
  refine ⟨l', hl', ?_⟩
  obtain ⟨_, hne⟩ := neg_spec (nb := P.nb) (lenV_nth hwf.verts hl)
  ext i
  rw [PiLp.neg_apply, Vv, Vv, vec_apply, vec_apply, he, hwe]
  rw [hne, neg_div]

/-! ## The lower bound in the checkers' coordinates -/

/-- **`S ≥ S*` on the LP.** Every feasible `(R, t, S)` with `R ∈ SO(3)` of the LP of the rotated
piece (the checkers' coordinates) has `S ≥ S*`. -/
theorem lower_LP {P : Prob} (hc : Consts P) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) (hD0 : 0 < D0r P)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
    {cands : List Cand} {faces : List (List LTok)} (hloc : (localOk P cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2) :
    ∀ R ∈ SO3, ∀ (t : E3) (S : ℝ),
      polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S → Ss P ≤ S := by
  intro R hR t S h
  have hd := dens_of hc
  have hb : BracketG P.sqb (maskOf P.ps) ((2 : ℝ) ^ P.sqk) := by
    have := bracket_of_sqbOk hc.sqb; rwa [hmask] at this
  have hKb : (0 : ℝ) < 2 ^ P.sqk := by positivity
  obtain ⟨_, _, _, hss⟩ := bnd_parts hc.bnd
  obtain ⟨Q, hQ, ⟨t', hQLP⟩, hmax⟩ := Orbit.max_rep hR h
  rcases far_main hb hKb hwf hd hc.dg hc.dk hq (tr_pos hc) hc.rden hc.bnd hc.grp hfar hPT hN0 hball
    hQ hQLP hmax with h1 | ⟨u, huc, hu⟩
  · exact (ss_le_sb hwf hc.bnd).trans h1
  · exact local_main hb hKb hwf hd hss hD0 hc.rden hloc hcw huc hu hQLP

/-! ## From the piece to the rotated piece -/

/-- Two copies of `K = conv KV` fit ⇒ two copies of `conv {V l}` fit, when `A ∈ SO(3)` maps `KV`
onto the points `V l` (`l < nv`). -/
theorem fits_rot {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    {V : ℕ → E3} {nv : ℕ} (hAV : ∀ x ∈ KV, ∃ l < nv, mv A x = V l)
    (hVA : ∀ l < nv, mv Aᵀ (V l) ∈ KV) {s : ℝ} (h : Fits K C 2 s) :
    Fits (convexHull ℝ (V '' {l | l < nv})) C 2 s := by
  have hAo := orth_of_SO hA
  have hAt : Aᵀᵀ * Aᵀ = 1 := by rw [Matrix.transpose_transpose]; exact mul_transpose_of hAo
  set e := place Aᵀ hAt 0 with he
  have happ : ∀ x, e x = mv Aᵀ x := fun x => by rw [he, place_apply, add_zero]
  -- `e` maps the rotated piece onto `K`
  have himg : e '' convexHull ℝ (V '' {l | l < nv}) = K := by
    have hlin : ∀ S : Set E3, e '' S = (rotLE Aᵀ hAt).toLinearMap '' S := fun S => by
      ext y; simp only [Set.mem_image, happ]; rfl
    rw [hlin, LinearMap.image_convexHull, ← hlin, hK]
    congr 1
    ext x
    simp only [Set.mem_image, Set.mem_ofPred_eq]
    constructor
    · rintro ⟨_, ⟨l, hl, rfl⟩, rfl⟩
      rw [happ]; exact hVA l hl
    · intro hx
      obtain ⟨l, hl, hAx⟩ := hAV x hx
      refine ⟨V l, ⟨l, hl, rfl⟩, ?_⟩
      rw [happ, ← hAx, ← mv_mul, hAo, mv_one]
  obtain ⟨g, hg, hin, hdis⟩ := h
  have himg2 : ∀ i, (e.trans (g i)) '' convexHull ℝ (V '' {l | l < nv}) = g i '' K := fun i => by
    rw [AffineIsometryEquiv.coe_trans, Set.image_comp, himg]
  refine ⟨fun i => e.trans (g i), fun i => ?_, fun i => ?_, fun i j hij => ?_⟩
  · refine (isProper_iff _).2 ⟨rotMat (g i) * Aᵀ, mul_transpose_mem_SO (rotMat_mem_SO (hg i)) hA,
      g i 0, fun x k => ?_⟩
    rw [AffineIsometryEquiv.coe_trans, Function.comp_apply, motion_eq_mv, happ, ← mv_mul,
      PiLp.add_apply, mv_apply]
  · simp only [himg2]; exact hin i
  · simp only [himg2]; exact hdis i j hij

/-! ## The main theorem -/

/-- **`IsMinEdge` from the checkers of `D16.Core`.** -/
theorem d16_main {P : Prob} (hco : constsOk P = true) (hwfo : wfOk P = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam) (hD0 : 0 < D0r P) (hS : 0 < Ss P)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
    {cands : List Cand} {faces : List (List LTok)} (hloc : (localOk P cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    -- `P_T` and the insphere
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    -- the rotated piece: interior and face orbit
    {NK : ℕ → E3} {mk : ℕ}
    (hint : ∀ y : E3, (∀ f < mk, dot (NK f) y < D0r P) →
      y ∈ interior (convexHull ℝ (Vv P '' {l | l < P.verts.length})))
    (horb : ∀ f < mk, ∃ h ∈ SO3, (∀ l < P.verts.length, ∃ l' < P.verts.length,
      mv h (Vv P l) = Vv P l') ∧ mv h (N0v P) = NK f)
    -- the piece of the claim and the rotation `R*`
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    -- the container
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C) :
    IsMinEdge K C 2 (Ss P / σ) := by
  have hc := consts_of hco
  have hwf := wf_of_ok hwfo
  have hd := dens_of hc
  obtain ⟨_, _, _, hss⟩ := bnd_parts hc.bnd
  refine ⟨⟨(div_pos hS hσ).le, upper_main hwf hd hc.dt hss hc.up hK hA hAV (hsym_of hwf hc.piece)
    hσ hS hCout hN0⟩, fun s hs => ?_⟩
  obtain ⟨hs0, hfit⟩ := hs
  have hlow := poly_lower_of_LP (K := convexHull ℝ (Vv P '' {l | l < P.verts.length}))
    (fun l hl => subset_convexHull ℝ _ ⟨l, hl, rfl⟩) hint hCin horb
    (lower_LP hc hwf hmask hq hD0 hfar hloc hcw hPT hN0 hball) hs0
    (fits_rot hK hA hAV hVA hfit)
  rw [div_le_iff₀ hσ]
  linarith

end

#assert_std_axioms PackLean.Formal.D16Main.lower_LP PackLean.Formal.D16Main.fits_rot
  PackLean.Formal.D16Main.d16_main

end PackLean.Formal.D16Main
