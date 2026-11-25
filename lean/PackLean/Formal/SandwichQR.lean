import PackLean.Formal.SandwichR
import PackLean.Formal.SandwichQ

/-!
# E3g4: the sandwich theorem of Lemma Q for the reduced far run `farRunR`

`SandwichR` (E3e) proves the sandwich for `farRunR` (`wstepR`: the `D` and `A` leaves are tested
after dividing the box and `rden` by `g` and raising `S̄` to `sb`) only for runs **without** `L`
leaves.  The three D44 cases with a local region of Lemma Q (dodindod, icoinico, octinoct) have `L`
leaves, which `wstepR` tests as `wstep` does (`insideL`, unchanged `P`).

* `GoodRL`・`run_coverRL`・`farRunRL_cover`: the box tree of `wstepR` with `L` leaves;
* `far_mainRL`: `S ≥ S̄`, or `R` is a point of chart 0 in the local box (`FarG.far_main` for
  `farRunR`);
* `lower_LPQR`・**`d44_sandwichR`**・**`d44_sandwich_certR`**: `SandwichQ.lower_LPQ`,
  `d44_sandwich`, `d44_sandwich_cert` with `farRunR` in place of `farRun` (copied, the far part
  replaced by `far_mainRL`).
-/

namespace PackLean.Formal.SandwichQR

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet RBox rboxWf QF split3)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn fpos vsmul sqbOk pieceOk containerOk groupOk
  boundsOk upperOk leafOk WState rRoots insideL discLb acceptOk termsOk)
open PackLean.D16.KSegR (redG redOk redBox redP leafOkR wstepR sbOk farRunR)
open PackLean.D44 (constsQ claimOk sstarIsSbar QTok localQ)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.QuadSem (bLo bHi box_param)
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts hsubv_of_ok interior_of_ok getD_mem)
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.FarG (box_entries disc_trace group_pair gM kM exists_nth insideL_spec)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.UpperG (upper_main)
open PackLean.Formal.PolySemG (BracketG maskOf bracket_of_sqbOk)
open PackLean.Formal.D16Bridge (bridgeOk Vs_eq N_eq lenV_nrm hPT_of D_one hball_of horb_of
  pos_of_fpos)
open PackLean.Formal.Sandwich (ConstsQ constsQ_of dens_of claim_spec fits_mono qv)
open PackLean.Formal.SandwichR (GoodR chartPt_div cast_div_of_dvd redOk_spec inBox_red sb_le
  foldlR_ok_false)
open PackLean.Formal.SandwichQ (sstar_of_consts sstar_eq)
open PackLean.Formal.LocalQMain (localQ_main)
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## 1. The box tree of `wstepR` with `L` leaves -/

/-- A leaf of `wstepR`: an `L` leaf (well formed, in the local box) or a reduced `D`/`A` leaf. -/
def GoodRL (P : Prob) (sb : ℤ × ℕ) (b : RBox) : Prop :=
  (rboxWf b = true ∧ insideL P b = true) ∨ GoodR P sb b

/-- **Tree soundness of `wstepR`** (as `CoverTreeG.run_cover`). -/
theorem run_coverRL (P : Prob) (sb : ℤ × ℕ) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstepR P sb) s).ok = true →
      (toks.foldl (wstepR P sb) s).stack = [] →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, GoodRL P sb B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst
    have hok' : (wstepR P sb s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldlR_ok_false P sb toks _ hc] at hok
      exact Bool.false_ne_true hok
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstepR P sb s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstepR, hs]
          refine ih _ hok hst ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          have : (wstepR P sb s .L).ok = (s.ok && rboxWf B && leafOk P B .L) := by
            simp [wstepR, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, Or.inl ⟨hok'.1.2, hok'.2⟩, hz⟩
        | D m =>
          have : (wstepR P sb s (.D m)).ok = (s.ok && rboxWf B && leafOkR P sb B (.D m)) := by
            simp [wstepR, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          have hl := hok'.2
          simp only [leafOkR, leafOk, Bool.and_eq_true] at hl
          obtain ⟨⟨hr, hw⟩, hm, hD⟩ := hl
          exact ⟨B, Or.inr ⟨hok'.1.2, hr, hw, Or.inl ⟨m, of_decide_eq_true hm, of_decide_eq_true hD⟩⟩,
            hz⟩
        | A mu ts =>
          have : (wstepR P sb s (.A mu ts)).ok = (s.ok && rboxWf B && leafOkR P sb B (.A mu ts)) := by
            simp [wstepR, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          have hl := hok'.2
          simp only [leafOkR, leafOk, Bool.and_eq_true] at hl
          obtain ⟨⟨hr, hw⟩, hA⟩ := hl
          exact ⟨B, Or.inr ⟨hok'.1.2, hr, hw, Or.inr ⟨mu, ts, hA⟩⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstepR P sb s t).stack := by
          intro C hC; cases t <;> simp [wstepR, hs, hC]
        exact ih _ hok hst ch y ⟨B, hsub B hBr, hz⟩

/-- **The four chart cubes** for `farRunR` (with `L` leaves). -/
theorem farRunRL_cover (P : Prob) (sb : ℤ × ℕ) (toks : List Tok) (h : (farRunR P sb toks).1 = true)
    (ch : ℕ) (hch : ch < 4) (y : Fin 3 → ℝ) (hy : ∀ i, |y i| ≤ (P.rden : ℝ)) :
    ∃ B, GoodRL P sb B ∧ InBox B ch y := by
  simp only [farRunR, Bool.and_eq_true, List.isEmpty_iff] at h
  refine run_coverRL P sb toks _ h.1.2 h.2 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden,
    P.rden⟩, ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-! ## 2. The far region: `S ≥ S̄` or the local box -/

/-- `FarG.far_main` for `farRunR`. -/
theorem far_mainRL {P : Prob} {sb : ℤ × ℕ} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb)
    (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P) (hrden : 0 < P.rden) (hbo : boundsOk P = true) (hgrp : groupOk P = true)
    {toks : List Tok} (hfar : (farRunR P sb toks).1 = true)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hmax : ∀ g ∈ Orbit.Gset (NCv P) P.normals.length, ∀ k ∈ Orbit.Kset (Vv P) P.verts.length (N0v P),
      g.det * k.det = 1 → (g * R * k).trace ≤ R.trace) :
    Sb P ≤ S ∨ ∃ u, Charts.ChartPt R P.rden 0 u ∧ ∀ i, |u i| ≤ P.r0 := by
  have hsb : sbOk P sb = true := by
    simp only [farRunR, Bool.and_eq_true] at hfar; exact hfar.1.1
  obtain ⟨hsb2, hsbl⟩ := sb_le hd hsb
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact Or.inl (outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt)
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  obtain ⟨ch, hch, u, hc⟩ := Charts.charts_cover hR hden
  obtain ⟨B, hG, hin⟩ := farRunRL_cover P sb toks hfar ch hch u
    (fun i => abs_le.2 ⟨(hc.1 i).1, (hc.1 i).2⟩)
  rcases hG with ⟨_, hL⟩ | ⟨_, hr, hwB, hgood⟩
  · obtain ⟨rfl, hu⟩ := insideL_spec hL hin
    exact Or.inr ⟨u, hc, hu⟩
  left
  set g := redG P.rden B with hgdef
  obtain ⟨hg, hgd, h0, h1, h2, h3, h4, h5⟩ := redOk_spec hr
  have hgr : (0 : ℝ) < g := by exact_mod_cast hg
  set P' := redP P sb g with hP'
  have hc' : Charts.ChartPt R (P'.rden : ℝ) ch (fun i => u i / g) := by
    have e : ((P'.rden : ℤ) : ℝ) = (P.rden : ℝ) / g := cast_div_of_dvd hgr.ne' hgd
    rw [e]; exact chartPt_div hgr hc
  have hin' := inBox_red hg h0 h1 h2 h3 h4 h5 hin
  obtain ⟨s, hs, hsu⟩ := box_param hwB _ hin'.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries (P := P') hc' hin'.1 hsu
  have hwf' : WF P' :=
    ⟨hwf.pos, hwf.nb, hwf.verts, hwf.normals, hwf.n0, hwf.pv, hwf.cverts, hwf.tstar, hwf.gs,
      hwf.ks, hwf.d0, hwf.sstar, hwf.c0⟩
  have hd' : Dens P' := ⟨hd.dn, hd.dv, hd.dn0, hd.dp, hd.d0, hsb2, hd.td⟩
  rcases hgood with ⟨m, hm, hD⟩ | ⟨mu, ts, hA⟩
  · exfalso
    have htr := disc_trace (P := P') hb hKb hwf' hdg hdk hD hs hNv hent
    obtain ⟨hg', hk', hdet⟩ := group_pair hwf hd hdg hdk hgrp hm
    have := hmax _ hg' _ hk' hdet
    unfold gM kM at this
    simp only [hP', redP] at htr
    linarith
  · have hG := accept_G (P := P') hb hKb hwf' hd' hA hs hNv hent hN
    have hts : termsOk P' ts = true := by
      simp only [acceptOk, Bool.and_eq_true] at hA; exact hA.1
    have hS' : Sb P' ≤ S := accept_bound (P := P') hG hts hq hTr hPT hLP hout
    exact (hsbl g).trans hS'

/-! ## 3. The sandwich (`SandwichQ` with `farRunR`) -/

/-- **`S ≥ S̄` on the LP** with the local region of Lemma Q (`SandwichQ.lower_LPQ` for `farRunR`). -/
theorem lower_LPQR {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hc : ConstsQ P sbarS sup supRat) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) (hSS : Ss P = Sb P) {qlamL : ℕ} (hqL : 0 < qlamL)
    {sb : ℤ × ℕ} {toks : List Tok} (hfar : (farRunR P sb toks).1 = true)
    {cands : List Cand} {faces : List (List QTok)} (hloc : (localQ P qlamL cands faces).1 = true)
    (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2) :
    ∀ R ∈ SO3, ∀ (t : E3) (S : ℝ),
      polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S → Sb P ≤ S := by
  intro R hR t S h
  have hd := dens_of hc
  have hb : BracketG P.sqb (maskOf P.ps) ((2 : ℝ) ^ P.sqk) := by
    have := bracket_of_sqbOk hc.sqb; rwa [hmask] at this
  have hKb : (0 : ℝ) < 2 ^ P.sqk := by positivity
  obtain ⟨_, htd, htn, hss⟩ := D16Main.bnd_parts hc.bnd
  have htr : 0 < Tr P := by
    unfold Tr
    have : (0 : ℝ) < P.tt.1 := by exact_mod_cast htn
    have : (0 : ℝ) < P.tt.2 := by exact_mod_cast htd
    positivity
  obtain ⟨Q, hQ, ⟨t', hQLP⟩, hmax⟩ := Orbit.max_rep hR h
  rcases far_mainRL hb hKb hwf hd hc.dg hc.dk hq htr hc.rden hc.bnd hc.grp hfar hPT hN0 hball
    hQ hQLP hmax with h1 | ⟨u, huc, hu⟩
  · exact h1
  · exact localQ_main hb hKb hwf hd hss hc.rden hqL htr hc.bnd hPT hN0 hball hSS hloc hcw hQ huc hu
      hQLP

/-- **`EdgeBetween` from the checkers of `D16.Core` + `D44.constsQ` + `D44.localQ`** (a run of
`farRun` whose `L` leaves are covered by the local region of Lemma Q).  `σ = C0` is the level of the container normals; `a ≤ s̄`
and `s_up ≤ b` are the rounded ends of the claim. -/
theorem d44_sandwichR {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hwfo : wfOk P = true)
    (hsl : Len P.ps sup.num) (hsp : fpos P.ps sup.num = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam)
    {sb : ℤ × ℕ} {toks : List Tok} (hfar : (farRunR P sb toks).1 = true)
    {qlamL : ℕ} (hqL : 0 < qlamL) {cands : List Cand} {faces : List (List QTok)}
    (hloc : (localQ P qlamL cands faces).1 = true) (hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v)
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
    -- the piece of the claim and the rotation `A`
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    -- the container
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C)
    (hσc : σ = qv P.ps P.c0)
    -- the rounded ends
    {a b : ℝ} (ha : a ≤ (sbarS.1 : ℝ) / sbarS.2) (hb : (supRat.1 : ℝ) / supRat.2 ≤ b) :
    EdgeBetween K C 2 a b := by
  have hc := constsQ_of hco
  have hwf := wf_of_ok hwfo
  have hd := dens_of hc
  obtain ⟨hsb, _, _, _⟩ := D16Main.bnd_parts hc.bnd
  obtain ⟨hcl1, hcl2, _, hsd⟩ := claim_spec hwf (by exact_mod_cast hsb) hsl hc.claim
  have hSS := sstar_eq hwf hsb (D16Main.bnd_parts hc.bnd).2.2.2 (sstar_of_consts hco)
  rw [← hσc] at hcl1 hcl2
  refine ⟨fun s hs0 hfit => ?_, ?_⟩
  · -- lower
    have hlow := poly_lower_of_LP (K := convexHull ℝ (Vv P '' {l | l < P.verts.length}))
      (fun l hl => subset_convexHull ℝ _ ⟨l, hl, rfl⟩) hint hCin horb
      (lower_LPQR hc hwf hmask hq hSS hqL hfar hloc hcw hPT hN0 hball) hs0
      (D16Main.fits_rot hK hA hAV hVA hfit)
    have : σ * a ≤ σ * s := by nlinarith
    exact le_of_mul_le_mul_left this hσ
  · -- upper
    have hwf' : WF { P with sstar := sup } :=
      ⟨hwf.pos, hwf.nb, hwf.verts, hwf.normals, hwf.n0, hwf.pv, hwf.cverts, hwf.tstar, hwf.gs,
        hwf.ks, hwf.d0, hsl, hwf.c0⟩
    have hd' : Dens { P with sstar := sup } := ⟨hd.dn, hd.dv, hd.dn0, hd.dp, hd.d0, hd.sd, hd.td⟩
    have hS' : 0 < Ss { P with sstar := sup } := by
      unfold Ss
      have h1 := pos_of_fpos hwf.pos hsl hsp
      have h2 : (0 : ℝ) < sup.den := by exact_mod_cast hsd
      exact div_pos h1 h2
    have hup := upper_main hwf' hd' hc.dt hsd hc.up hK hA hAV (D16Main.hsym_of (P := { P with sstar := sup }) hwf' hc.piece) hσ hS'
      hCout hN0
    refine fits_mono hσ hCin hCout (div_pos hS' hσ) ?_ hup
    have : Ss { P with sstar := sup } = qv P.ps sup := rfl
    rw [this, div_le_iff₀ hσ]
    nlinarith

/-- **`EdgeBetween` from the checkers and the Boolean bridges** (as `D16Bridge.d16_cert`, with the
local candidates of `localQ`). -/
theorem d44_sandwich_certR {P : Prob} {cK cT : Cert} {hs : List (List (List FE))} {dh : ℕ}
    {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hsl : Len P.ps sup.num)
    (hsp : fpos P.ps sup.num = true)
    {sb : ℤ × ℕ} {toks : List Tok} (hfar : (farRunR P sb toks).1 = true)
    {qlamL : ℕ} (hqL : 0 < qlamL) {cands : List Cand} {faces : List (List QTok)}
    (hloc : (localQ P qlamL cands faces).1 = true)
    (hbr : bridgeOk P cK cT hs dh cands = true)
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C)
    (hσc : σ = qv P.ps P.c0)
    {a b : ℝ} (ha : a ≤ (sbarS.1 : ℝ) / sbarS.2) (hb : (supRat.1 : ℝ) / supRat.2 ≤ b) :
    EdgeBetween K C 2 a b := by
  simp only [bridgeOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true] at hbr
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hwfo, hmask⟩, hq⟩, hd0p⟩, _⟩, hn0p⟩, hcwo⟩, hcK⟩, hKps⟩, hKv⟩, hKdv⟩,
    hKoff⟩, hKdoff⟩, hKball⟩, horbo⟩, hcT⟩, hTps⟩, hTv⟩, hTdv⟩, hTn⟩, hTdn⟩, hToff⟩ := hbr
  have hc := constsQ_of hco
  have hwf := wf_of_ok hwfo
  have hd := dens_of hc
  have HK := okParts hcK
  have hD0 : 0 < D0r P := by
    unfold D0r
    have := pos_of_fpos hwf.pos hwf.d0 hd0p
    have : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
    positivity
  have hnn := fval_fdot hwf.nb hwf.n0 hwf.n0
  have hN0 : 0 < dot (N0v P) (N0v P) := by
    have := pos_of_fpos hwf.pos hnn.1 hn0p
    rw [N0v, dot_vec, ← hnn.2]
    have : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
    positivity
  have hKVs : cK.Vs = Vv P '' {l | l < P.verts.length} := by
    rw [Vs_eq HK P.nb]
    ext y
    simp only [Set.mem_image, Set.mem_ofPred_eq, hKv, Vv, hKps, hKdv]
  have hKD : cK.D = D0r P := by rw [Cert.D, D0r, hKps, hKoff, hKdoff]
  have hint : ∀ y : E3, (∀ f < cK.normals.length, dot (cK.N f) y < D0r P) →
      y ∈ interior (convexHull ℝ (Vv P '' {l | l < P.verts.length})) := fun y hy => by
    rw [← hKVs]; exact interior_of_ok hcK fun f hf => by rw [hKD]; exact hy f hf
  have hnv : 0 < P.verts.length := by rw [← hKv]; exact HK.nv
  have hball := hball_of (V := Vv P) hnv (NK := cK.N) (mk := cK.normals.length) hD0.le hN0
    (fun x hx => by rw [← hKVs]; exact hsubv_of_ok hcK fun f hf => by rw [hKD]; exact hx f hf)
    (fun f hf => by
      have hn := lenV_nrm HK hf
      rw [hKps] at hn
      have hm := fval_fdot hwf.nb hn hn
      have h0 := nonneg_of_fnn hwf.pos (len_fsub (len_fsmul _ hnn.1) (len_fsmul _ hm.1))
        (hKball _ (getD_mem [] hf))
      rw [fval_fsub (len_fsmul _ hnn.1) (len_fsmul _ hm.1), fval_fsmul, fval_fsmul] at h0
      rw [N_eq HK P.nb hf, hKps, N0v, dot_vec, dot_vec, ← hm.2, ← hnn.2]
      have : (0 : ℝ) < cK.dn := by exact_mod_cast HK.dn
      have : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
      rw [div_le_div_iff₀ (by positivity) (by positivity)]
      push_cast at h0
      linarith)
  have horb := horb_of hwf hd HK hKps horbo
  have hPT := hPT_of hcT hTps hTv hTdv hTn hTdn (D_one hcT hToff)
  have hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v := fun c hc v hv => lenV_of_ok (hcwo c hc v hv)
  exact d44_sandwichR hco hwfo hsl hsp hmask hq hfar hqL hloc hcw hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout hσc ha hb

end

#assert_std_axioms PackLean.Formal.SandwichQR.run_coverRL PackLean.Formal.SandwichQR.farRunRL_cover
  PackLean.Formal.SandwichQR.far_mainRL PackLean.Formal.SandwichQR.lower_LPQR
  PackLean.Formal.SandwichQR.d44_sandwichR PackLean.Formal.SandwichQR.d44_sandwich_certR

end PackLean.Formal.SandwichQR
