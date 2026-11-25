import PackLean.Formal.CaseBridge
import PackLean.D44.Core

/-!
# A9c (D45 stage 6a): the sandwich theorem `d16_sandwich` (`EdgeBetween` from the D44 checkers)

The four `n = 2` cases without a closed form (cubindod, icoinico, dodindod, octinoct; D44) are
checked by the `D16.Core` checkers with `sstar := S̄` and the extra constants `constsQ`
(`PackLean.D44.Core`).  This file turns them into the claim `EdgeBetween K C 2 a b`
(`plan/D45_s4_design.md` §8.3, stage 6a):

* **lower**: every fit at `s ≥ 0` gives a feasible `(R, t, S)` of the LP with `S = σ s`
  (`poly_lower_of_LP`), and `S ≥ S̄` on the LP.  For a run of `farRun` with **no `L` leaves**
  (`farRun_cover_noL`) the far region alone gives `S ≥ S̄` (`far_main_noL`, `lower_LP_noL`;
  `localOk` is not needed).  Then `S̄ ≥ C0 · s̄` (`claimOk`) and `σ = C0` give `s ≥ s̄`.
* **upper**: `upper_main` for the problem `{P with sstar := S_up}` (`upperOk` of `constsQ`) gives a
  fit at `S_up / σ`; `S_up ≤ C0 · s_up` (`claimOk`), and a fit at `s` gives a fit at every `s' ≥ s`
  (`fits_mono`, the container `C` contains `0` and `y ∈ C` is cut out by the normals).

The cases with local leaves (`localQ`, Lemma Q) are stage 6b.
-/

namespace PackLean.Formal.Sandwich

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet RBox rboxWf QF)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn fpos vsmul sqbOk pieceOk containerOk groupOk
  boundsOk upperOk farRun leafOk WState wstep rRoots insideL discLb acceptOk termsOk)
open PackLean.D44 (constsQ claimOk sstarIsSbar)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.QuadSem (bLo bHi box_param)
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts hsubv_of_ok interior_of_ok getD_mem)
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.FarG (box_entries disc_trace group_pair gM kM exists_nth)
open PackLean.Formal.CoverTreeG (InBox split3_cover foldl_ok_false)
open PackLean.Formal.UpperG (upper_main)
open PackLean.Formal.PolySemG (BracketG maskOf bracket_of_sqbOk)
open PackLean.Formal.D16Bridge (bridgeOk Vs_eq N_eq lenV_nrm hPT_of D_one hball_of horb_of
  pos_of_fpos)
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## 1. The box tree without `L` leaves -/

/-- A leaf without `L`: well formed, and discarded or accepted. -/
def GoodNoL (P : Prob) (b : RBox) : Prop :=
  rboxWf b = true ∧
    ((∃ m, m < P.pairs.length ∧ discLb P b m > 0) ∨ (∃ mu ts, acceptOk P b mu ts = true))

theorem wstep_nL (P : Prob) (s : WState) (t : Tok) : s.nL ≤ (wstep P s t).nL := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstep, hst]

theorem foldl_nL (P : Prob) :
    ∀ (toks : List Tok) (s : WState), s.nL ≤ (toks.foldl (wstep P) s).nL := by
  intro toks
  induction toks with
  | nil => intro s; simp
  | cons t toks ih => intro s; exact (wstep_nL P s t).trans (ih _)

/-- **Tree soundness without `L`.** As `CoverTreeG.run_cover`, when the run adds no `L` leaf. -/
theorem run_cover_noL (P : Prob) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstep P) s).ok = true →
      (toks.foldl (wstep P) s).stack = [] → (toks.foldl (wstep P) s).nL = s.nL →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, GoodNoL P B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst _ ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst hnl ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst hnl
    have hok' : (wstep P s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldl_ok_false P toks _ hc] at hok
      exact Bool.false_ne_true hok
    have hnl' : (toks.foldl (wstep P) (wstep P s t)).nL = (wstep P s t).nL :=
      le_antisymm (hnl ▸ wstep_nL P s t) (foldl_nL P toks _)
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstep P s .split).stack = (PackLean.D28.split3 B).1 ::
              (PackLean.D28.split3 B).2 :: rest := by
            simp [wstep, hs]
          refine ih _ hok hst hnl' ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          exfalso
          have h1 : (wstep P s .L).nL = s.nL + 1 := by simp [wstep, hs]
          have := foldl_nL P toks (wstep P s .L)
          omega
        | D m =>
          have : (wstep P s (.D m)).ok = (s.ok && rboxWf B && leafOk P B (.D m)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          have hl := hok'.2
          simp only [leafOk, Bool.and_eq_true, decide_eq_true_eq] at hl
          exact ⟨B, ⟨hok'.1.2, Or.inl ⟨m, hl.1, hl.2⟩⟩, hz⟩
        | A mu ts =>
          have : (wstep P s (.A mu ts)).ok = (s.ok && rboxWf B && leafOk P B (.A mu ts)) := by
            simp [wstep, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          exact ⟨B, ⟨hok'.1.2, Or.inr ⟨mu, ts, hok'.2⟩⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstep P s t).stack := by
          intro C hC; cases t <;> simp [wstep, hs, hC]
        exact ih _ hok hst hnl' ch y ⟨B, hsub B hBr, hz⟩

/-- **The four chart cubes, no `L`.** If `farRun` passes with `0` leaves in `L`, every point of
the four chart cubes lies in a discarded or accepted leaf box. -/
theorem farRun_cover_noL (P : Prob) (toks : List Tok) (h : (farRun P toks).1 = true)
    (h0 : (farRun P toks).2.2.2 = 0)
    (ch : ℕ) (hch : ch < 4) (y : Fin 3 → ℝ) (hy : ∀ i, |y i| ≤ (P.rden : ℝ)) :
    ∃ B, GoodNoL P B ∧ InBox B ch y := by
  simp only [farRun, Bool.and_eq_true, List.isEmpty_iff] at h h0
  refine run_cover_noL P toks _ h.1 h.2 h0 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden,
    P.rden⟩, ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-! ## 2. The far region alone gives `S ≥ S̄` -/

/-- `FarG.far_main` for a run without `L` leaves: no local box is left. -/
theorem far_main_noL {P : Prob} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb) (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P) (hrden : 0 < P.rden) (hbo : boundsOk P = true) (hgrp : groupOk P = true)
    {toks : List Tok} (hfar : (farRun P toks).1 = true) (hL : (farRun P toks).2.2.2 = 0)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {R : M3} (hR : R ∈ SO3) {t : E3} {S : ℝ}
    (hLP : polyLP (Vv P) P.verts.length (NCv P) P.normals.length (N0v P) (D0r P) R t S)
    (hmax : ∀ g ∈ Orbit.Gset (NCv P) P.normals.length, ∀ k ∈ Orbit.Kset (Vv P) P.verts.length (N0v P),
      g.det * k.det = 1 → (g * R * k).trace ≤ R.trace) :
    Sb P ≤ S := by
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  obtain ⟨ch, hch, u, hc⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨hwB, hgood⟩, hin⟩ := farRun_cover_noL P toks hfar hL ch hch u
    (fun i => abs_le.2 ⟨(hc.1 i).1, (hc.1 i).2⟩)
  obtain ⟨s, hs, hsu⟩ := box_param hwB u hin.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries hc hin.1 hsu
  rcases hgood with ⟨m, hm, hD⟩ | ⟨mu, ts, hA⟩
  · exfalso
    have htr := disc_trace hb hKb hwf hdg hdk hD hs hNv hent
    obtain ⟨hg, hk, hdet⟩ := group_pair hwf hd hdg hdk hgrp hm
    have := hmax _ hg _ hk hdet
    unfold gM kM at this
    linarith
  · have hG := accept_G hb hKb hwf hd hA hs hNv hent hN
    have hts : termsOk P ts = true := by
      simp only [acceptOk, Bool.and_eq_true] at hA; exact hA.1
    exact accept_bound hG hts hq hTr hPT hLP hout

/-! ## 3. The constants of `constsQ` -/

/-- The parts of `constsQ`. -/
structure ConstsQ (P : Prob) (sbarS : ℤ × ℕ) (sup : QF) (supRat : ℤ × ℕ) : Prop where
  sqb : sqbOk P = true
  piece : pieceOk P = true
  cont : containerOk P = true
  grp : groupOk P = true
  bnd : boundsOk P = true
  up : upperOk { P with sstar := sup } = true
  claim : claimOk P sbarS sup supRat = true
  dv : 0 < P.dv
  dn : 0 < P.dn
  dn0 : 0 < P.dn0
  dp : 0 < P.dp
  dg : 0 < P.dg
  dk : 0 < P.dk
  dt : 0 < P.dt
  rden : 0 < P.rden

theorem constsQ_of {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (h : constsQ P sbarS sup supRat = true) : ConstsQ P sbarS sup supRat := by
  simp only [constsQ, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨h1, h2⟩, h3⟩, h4⟩, h5⟩, _⟩, h7⟩, h8⟩, h9⟩, h10⟩, h11⟩, h12⟩, h13⟩,
    h14⟩, h15⟩, _⟩, h17⟩, _⟩ := h
  exact ⟨h1, h2, h3, h4, h5, h7, h8, h9, h10, h11, h12, h13, h14, h15, h17⟩

theorem dens_of {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hc : ConstsQ P sbarS sup supRat) : Dens P := by
  obtain ⟨hsd, htd, _, _⟩ := D16Main.bnd_parts hc.bnd
  exact ⟨hc.dn, hc.dv, hc.dn0, hc.dp, D16Main.d0den_of hc.piece, hsd, htd⟩

/-- The real value of `a : QF`. -/
def qv (ps : List ℕ) (a : QF) : ℝ := fval ps a.num / a.den

/-- `QF.le` means `≤` of the values. -/
theorem qf_le {ps : List ℕ} (hpos : ∀ p ∈ ps, 0 < p) {a b : QF} (ha : Len ps a.num)
    (hb : Len ps b.num) (had : 0 < a.den) (hbd : 0 < b.den) (h : QF.le ps a b = true) :
    qv ps a ≤ qv ps b := by
  simp only [QF.le, QF.sign, QF.sub, ge_iff_le, decide_eq_true_eq] at h
  have hl := len_fsub (len_fsmul (a.den : ℤ) hb) (len_fsmul (b.den : ℤ) ha)
  have h0 := nonneg_of_fnn hpos hl (by simpa [fnn] using h)
  rw [fval_fsub (len_fsmul _ hb) (len_fsmul _ ha), fval_fsmul, fval_fsmul] at h0
  unfold qv
  have : (0 : ℝ) < a.den := by exact_mod_cast had
  have : (0 : ℝ) < b.den := by exact_mod_cast hbd
  rw [div_le_div_iff₀ (by assumption) (by assumption)]
  push_cast at h0
  linarith

theorem qv_ofRat (ps : List ℕ) (n : ℤ) (d : ℕ) :
    qv ps (QF.ofRat (2 ^ ps.length) n d) = (n : ℝ) / d := by
  simp only [qv, QF.ofRat, fval_fofInt]

theorem qv_mul {ps : List ℕ} {a b : QF} (ha : Len ps a.num) (hb : Len ps b.num) :
    qv ps (QF.mul ps a b) = qv ps a * qv ps b := by
  simp only [qv, QF.mul, fval_fmul ha hb]
  push_cast
  rw [mul_div_mul_comm]

/-- The meaning of `claimOk`: `S̄ ≥ C0 · s̄`, `S_up ≤ C0 · s_up`, `C0 > 0`, `den S_up > 0`. -/
theorem claim_spec {P : Prob} (hwf : WF P) (hsb : 0 < P.sbar.2) {sbarS : ℤ × ℕ} {sup : QF}
    {supRat : ℤ × ℕ} (hsl : Len P.ps sup.num) (h : claimOk P sbarS sup supRat = true) :
    qv P.ps P.c0 * ((sbarS.1 : ℝ) / sbarS.2) ≤ Sb P ∧
      qv P.ps sup ≤ qv P.ps P.c0 * ((supRat.1 : ℝ) / supRat.2) ∧
      0 < qv P.ps P.c0 ∧ 0 < sup.den := by
  simp only [claimOk, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨hsd, hud⟩, hcd⟩, hpd⟩, _⟩, _⟩, hle1⟩, hle2⟩, _⟩, hc0⟩ := h
  have hnb := hwf.nb
  have hlr : ∀ (n : ℤ) (d : ℕ), Len P.ps (QF.ofRat P.nb n d).num := fun n d => by
    simp only [QF.ofRat]; rw [hnb]; exact len_fofInt _ _
  have hqr : ∀ (n : ℤ) (d : ℕ), qv P.ps (QF.ofRat P.nb n d) = (n : ℝ) / d := fun n d => by
    rw [hnb]; exact qv_ofRat _ _ _
  have hcl := hwf.c0
  have hm1 := qf_le hwf.pos (len_fmul hcl (hlr _ _)) (hlr _ _)
    (by simp only [QF.mul, QF.ofRat]; positivity) (by simpa only [QF.ofRat] using hsb) hle1
  have hm2 := qf_le hwf.pos hsl (len_fmul hcl (hlr _ _)) hpd
    (by simp only [QF.mul, QF.ofRat]; positivity) hle2
  rw [qv_mul hcl (hlr _ _), hqr, hqr] at hm1
  rw [qv_mul hcl (hlr _ _), hqr] at hm2
  refine ⟨by simpa [Sb] using hm1, hm2, ?_, hpd⟩
  unfold qv
  have := pos_of_fpos hwf.pos hcl hc0
  have : (0 : ℝ) < P.c0.den := by exact_mod_cast hcd
  positivity

/-! ## 4. The lower bound on the LP, monotonicity, and the sandwich -/

/-- **`S ≥ S̄` on the LP, far region only** (a run of `farRun` without `L` leaves). -/
theorem lower_LP_noL {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hc : ConstsQ P sbarS sup supRat) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) {toks : List Tok} (hfar : (farRun P toks).1 = true)
    (hL : (farRun P toks).2.2.2 = 0)
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
  have htr : 0 < Tr P := by
    obtain ⟨_, htd, htn, _⟩ := D16Main.bnd_parts hc.bnd
    unfold Tr
    have : (0 : ℝ) < P.tt.1 := by exact_mod_cast htn
    have : (0 : ℝ) < P.tt.2 := by exact_mod_cast htd
    positivity
  obtain ⟨Q, hQ, ⟨t', hQLP⟩, hmax⟩ := Orbit.max_rep hR h
  exact far_main_noL hb hKb hwf hd hc.dg hc.dk hq htr hc.rden hc.bnd hc.grp hfar hL hPT hN0 hball
    hQ hQLP hmax

theorem dot_smul_right (n : E3) (a : ℝ) (x : E3) : dot n (a • x) = a * dot n x := by
  simp only [dot, PiLp.smul_apply, smul_eq_mul, Finset.mul_sum]
  exact Finset.sum_congr rfl fun i _ => by ring

/-- **A larger container holds what a smaller one holds**, for a container cut out by the normals
`NC j` at level `σ > 0` (it contains `0` and is star-shaped about it). -/
theorem fits_mono {K C : Set E3} {NC : ℕ → E3} {mc : ℕ} {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < mc, dot (NC j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < mc, dot (NC j) y ≤ σ) → y ∈ C)
    {s s' : ℝ} (hs : 0 < s) (hss : s ≤ s') (h : Fits K C 2 s) : Fits K C 2 s' := by
  obtain ⟨g, hg, hin, hdis⟩ := h
  refine ⟨g, hg, fun i => ?_, hdis⟩
  have hs' : 0 < s' := hs.trans_le hss
  have hsub : s • C ⊆ s' • C := by
    rintro _ ⟨c, hc, rfl⟩
    refine ⟨(s / s') • c, hCout _ fun j hj => ?_, ?_⟩
    · rw [dot_smul_right]
      have h1 := hCin c hc j hj
      have hr0 : 0 ≤ s / s' := (div_pos hs hs').le
      have hr1 : s / s' ≤ 1 := (div_le_one hs').2 hss
      rcases le_total 0 (dot (NC j) c) with h0 | h0
      · nlinarith
      · nlinarith
    · simp only [smul_smul]
      congr 1
      field_simp
  exact (hin i).trans hsub

/-- **`EdgeBetween` from the checkers of `D16.Core` + `D44.constsQ`** (a run of `farRun` without
`L` leaves, so no local certificate).  `σ = C0` is the level of the container normals; `a ≤ s̄`
and `s_up ≤ b` are the rounded ends of the claim. -/
theorem d16_sandwich {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hwfo : wfOk P = true)
    (hsl : Len P.ps sup.num) (hsp : fpos P.ps sup.num = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam)
    {toks : List Tok} (hfar : (farRun P toks).1 = true) (hL : (farRun P toks).2.2.2 = 0)
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
  rw [← hσc] at hcl1 hcl2
  refine ⟨fun s hs0 hfit => ?_, ?_⟩
  · -- lower
    have hlow := poly_lower_of_LP (K := convexHull ℝ (Vv P '' {l | l < P.verts.length}))
      (fun l hl => subset_convexHull ℝ _ ⟨l, hl, rfl⟩) hint hCin horb
      (lower_LP_noL hc hwf hmask hq hfar hL hPT hN0 hball) hs0
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

/-- **`EdgeBetween` from the checkers and the Boolean bridges** (as `D16Bridge.d16_cert`, with no
local candidates). -/
theorem d16_sandwich_cert {P : Prob} {cK cT : Cert} {hs : List (List (List FE))} {dh : ℕ}
    {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hsl : Len P.ps sup.num)
    (hsp : fpos P.ps sup.num = true)
    {toks : List Tok} (hfar : (farRun P toks).1 = true) (hL : (farRun P toks).2.2.2 = 0)
    (hbr : bridgeOk P cK cT hs dh [] = true)
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
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hwfo, hmask⟩, hq⟩, hd0p⟩, _⟩, hn0p⟩, _⟩, hcK⟩, hKps⟩, hKv⟩, hKdv⟩,
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
  exact d16_sandwich hco hwfo hsl hsp hmask hq hfar hL hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout hσc ha hb

end

#assert_std_axioms PackLean.Formal.Sandwich.farRun_cover_noL PackLean.Formal.Sandwich.far_main_noL
  PackLean.Formal.Sandwich.lower_LP_noL PackLean.Formal.Sandwich.fits_mono
  PackLean.Formal.Sandwich.claim_spec PackLean.Formal.Sandwich.d16_sandwich
  PackLean.Formal.Sandwich.d16_sandwich_cert

end PackLean.Formal.Sandwich
