import PackLean.Formal.Sandwich
import PackLean.D16.KernelSegR

/-!
# E3e: the sandwich theorem for the reduced far run `farRunR` (E3d plan 1)

`PackLean.D16.KSegR.wstepR` is `wstep` except at the `D` and `A` leaves: before the leaf test it
divides the six box coordinates and `rden` by a common factor `g` (`redG`, checked by `redOk`) and
replaces `S̄` by a rational `sb ≥ S̄` with an odd denominator (`redP`).  This keeps the kernel's
cache from colliding (`plan/E3d_kernel_speedup.md` §1.3).  The leaf checkers (`leafOk`, `acceptOk`,
`discLb` of `D16.Core`) are unchanged.

Soundness needs two facts:

* **the same rotations** (`chartPt_div`, `inBox_red`): a chart point `u` of denominator `den` in a
  box `B` is the chart point `u / g` of denominator `den / g` in the box `B / g`;
* **a stronger claim** (`sb_le`): accepting with `sb ≥ S̄` gives `S ≥ sb ≥ S̄`.

Then `far_mainR`, `lower_LPR`, `d16_sandwichR`, `d16_sandwich_certR` are `far_main_noL`,
`lower_LP_noL`, `d16_sandwich`, `d16_sandwich_cert` of `Sandwich` for `farRunR`.
-/

namespace PackLean.Formal.SandwichR

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet RBox rboxWf QF split3)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn fpos vsmul sqbOk pieceOk containerOk groupOk
  boundsOk upperOk leafOk WState rRoots insideL discLb acceptOk termsOk)
open PackLean.D16.KSegR (redG redOk redBox redP leafOkR wstepR sbOk farRunR)
open PackLean.D44 (constsQ claimOk sstarIsSbar)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.QuadSem (bLo bHi box_param chq rqList)
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts hsubv_of_ok interior_of_ok getD_mem)
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.FarG (box_entries disc_trace group_pair gM kM exists_nth)
open PackLean.Formal.CoverTreeG (InBox split3_cover)
open PackLean.Formal.UpperG (upper_main)
open PackLean.Formal.PolySemG (BracketG maskOf bracket_of_sqbOk)
open PackLean.Formal.D16Bridge (bridgeOk Vs_eq N_eq lenV_nrm hPT_of D_one hball_of horb_of
  pos_of_fpos)
open PackLean.Formal.Sandwich (ConstsQ constsQ_of dens_of claim_spec fits_mono qv)
open scoped Matrix Pointwise

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-! ## 1. Dividing the chart and the box by `g` -/

/-- **A chart point scaled by `1/g`**: the quaternion is scaled by `1/g`, so `Rq` and `N` by `1/g²`. -/
theorem chartPt_div {R : M3} {den g : ℝ} (hg : 0 < g) {ch : ℕ} {u : Fin 3 → ℝ}
    (hc : Charts.ChartPt R den ch u) : Charts.ChartPt R (den / g) ch (fun i => u i / g) := by
  obtain ⟨hb, hN, hl⟩ := hc
  set q := chq ch den (u 0) (u 1) (u 2) with hq
  set k := 1 / g with hk
  have hu : ∀ a : ℝ, a / g = k * a := fun a => by rw [hk]; ring
  have hQ : ∀ t, (chq ch (den / g) (u 0 / g) (u 1 / g) (u 2 / g)).getD t 0 = k * q.getD t 0 := by
    intro t
    rw [hq]
    rcases ch with _ | _ | _ | c <;>
      (rcases t with _ | _ | _ | _ | t <;> simp [chq, hu])
  have hk0 : 0 < k := by rw [hk]; positivity
  refine ⟨fun i => ?_, ?_, ?_⟩
  · obtain ⟨h1, h2⟩ := hb i
    show -(den / g) ≤ u i / g ∧ u i / g ≤ den / g
    rw [← neg_div]
    exact ⟨div_le_div_of_nonneg_right h1 hg.le, div_le_div_of_nonneg_right h2 hg.le⟩
  · simp only [hQ]
    have : (k * q.getD 0 0) ^ 2 + (k * q.getD 1 0) ^ 2 + (k * q.getD 2 0) ^ 2 + (k * q.getD 3 0) ^ 2
        = k ^ 2 * (q.getD 0 0 ^ 2 + q.getD 1 0 ^ 2 + q.getD 2 0 ^ 2 + q.getD 3 0 ^ 2) := by ring
    rw [this]; positivity
  · simp only [hQ]
    rw [Charts.rqList_smul, hl]
    simp only [List.map_cons, List.map_nil, List.cons.injEq, and_true]
    refine ⟨?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_, ?_⟩ <;> ring

theorem cast_div_of_dvd {a g : ℤ} (hg : (g : ℝ) ≠ 0) (h : g ∣ a) : ((a / g : ℤ) : ℝ) = (a : ℝ) / g :=
  Int.cast_div h hg

/-- The `Prop` form of `redOk`. -/
theorem redOk_spec {g den : ℤ} {b : RBox} (h : redOk g den b = true) :
    0 < g ∧ g ∣ den ∧ g ∣ b.l0 ∧ g ∣ b.l1 ∧ g ∣ b.l2 ∧ g ∣ b.h0 ∧ g ∣ b.h1 ∧ g ∣ b.h2 := by
  simp only [redOk, Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨h0, h1⟩, h2⟩, h3⟩, h4⟩, h5⟩, h6⟩, h7⟩ := h
  exact ⟨h0, Int.dvd_of_emod_eq_zero h1, Int.dvd_of_emod_eq_zero h2, Int.dvd_of_emod_eq_zero h3,
    Int.dvd_of_emod_eq_zero h4, Int.dvd_of_emod_eq_zero h5, Int.dvd_of_emod_eq_zero h6,
    Int.dvd_of_emod_eq_zero h7⟩

/-- **A point of the box scaled by `1/g`** lies in the box `B / g`. -/
theorem inBox_red {g : ℤ} {B : RBox} (hg : 0 < g) (h0 : g ∣ B.l0) (h1 : g ∣ B.l1) (h2 : g ∣ B.l2)
    (h3 : g ∣ B.h0) (h4 : g ∣ B.h1) (h5 : g ∣ B.h2) {ch : ℕ} {u : Fin 3 → ℝ} (h : InBox B ch u) :
    InBox (redBox g B) ch (fun i => u i / g) := by
  have hgr : (0 : ℝ) < g := by exact_mod_cast hg
  have hlo : ∀ i, ((bLo (redBox g B) i : ℤ) : ℝ) = (bLo B i : ℝ) / g := by
    intro i
    fin_cases i
    · exact cast_div_of_dvd hgr.ne' h0
    · exact cast_div_of_dvd hgr.ne' h1
    · exact cast_div_of_dvd hgr.ne' h2
  have hhi : ∀ i, ((bHi (redBox g B) i : ℤ) : ℝ) = (bHi B i : ℝ) / g := by
    intro i
    fin_cases i
    · exact cast_div_of_dvd hgr.ne' h3
    · exact cast_div_of_dvd hgr.ne' h4
    · exact cast_div_of_dvd hgr.ne' h5
  refine ⟨h.1, fun i => ?_⟩
  obtain ⟨a1, a2⟩ := h.2 i
  rw [hlo, hhi]
  exact ⟨div_le_div_of_nonneg_right a1 hgr.le, div_le_div_of_nonneg_right a2 hgr.le⟩

/-! ## 2. The box tree of `wstepR` without `L` leaves -/

/-- A leaf of `wstepR` without `L`: well formed, and, after dividing by `g = redG`, discarded or
accepted for `redP P sb g`. -/
def GoodR (P : Prob) (sb : ℤ × ℕ) (b : RBox) : Prop :=
  rboxWf b = true ∧ redOk (redG P.rden b) P.rden b = true ∧
    rboxWf (redBox (redG P.rden b) b) = true ∧
    ((∃ m, m < P.pairs.length ∧ discLb (redP P sb (redG P.rden b)) (redBox (redG P.rden b) b) m > 0) ∨
      (∃ mu ts, acceptOk (redP P sb (redG P.rden b)) (redBox (redG P.rden b) b) mu ts = true))

theorem wstepR_nL (P : Prob) (sb : ℤ × ℕ) (s : WState) (t : Tok) : s.nL ≤ (wstepR P sb s t).nL := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstepR, hst]

theorem foldlR_nL (P : Prob) (sb : ℤ × ℕ) :
    ∀ (toks : List Tok) (s : WState), s.nL ≤ (toks.foldl (wstepR P sb) s).nL := by
  intro toks
  induction toks with
  | nil => intro s; simp
  | cons t toks ih => intro s; exact (wstepR_nL P sb s t).trans (ih _)

theorem wstepR_ok_false (P : Prob) (sb : ℤ × ℕ) (s : WState) (t : Tok) (h : s.ok = false) :
    (wstepR P sb s t).ok = false := by
  rcases hst : s.stack with _ | ⟨b, rest⟩ <;> cases t <;> simp [wstepR, hst, h]

theorem foldlR_ok_false (P : Prob) (sb : ℤ × ℕ) :
    ∀ (toks : List Tok) (s : WState), s.ok = false → (toks.foldl (wstepR P sb) s).ok = false := by
  intro toks
  induction toks with
  | nil => intro s h; simpa using h
  | cons t toks ih => intro s h; exact ih _ (wstepR_ok_false P sb s t h)

/-- **Tree soundness of `wstepR` without `L`** (as `Sandwich.run_cover_noL`). -/
theorem run_coverR (P : Prob) (sb : ℤ × ℕ) :
    ∀ (toks : List Tok) (s : WState), (toks.foldl (wstepR P sb) s).ok = true →
      (toks.foldl (wstepR P sb) s).stack = [] → (toks.foldl (wstepR P sb) s).nL = s.nL →
      ∀ ch y, (∃ B ∈ s.stack, InBox B ch y) → ∃ B, GoodR P sb B ∧ InBox B ch y := by
  intro toks
  induction toks with
  | nil =>
    intro s _ hst _ ch y ⟨B, hB, _⟩
    simp only [List.foldl_nil] at hst
    rw [hst] at hB; simp at hB
  | cons t toks ih =>
    intro s hok hst hnl ch y ⟨B, hB, hz⟩
    rw [List.foldl_cons] at hok hst hnl
    have hok' : (wstepR P sb s t).ok = true := by
      by_contra hc
      rw [Bool.not_eq_true] at hc
      rw [foldlR_ok_false P sb toks _ hc] at hok
      exact Bool.false_ne_true hok
    have hnl' : (toks.foldl (wstepR P sb) (wstepR P sb s t)).nL = (wstepR P sb s t).nL :=
      le_antisymm (hnl ▸ wstepR_nL P sb s t) (foldlR_nL P sb toks _)
    rcases hs : s.stack with _ | ⟨b, rest⟩
    · rw [hs] at hB; simp at hB
    · rw [hs] at hB
      rcases List.mem_cons.1 hB with rfl | hBr
      · cases t with
        | split =>
          have hs' : (wstepR P sb s .split).stack = (split3 B).1 :: (split3 B).2 :: rest := by
            simp [wstepR, hs]
          refine ih _ hok hst hnl' ch y ?_
          rw [hs']
          rcases split3_cover B ch y hz with h | h
          · exact ⟨_, by simp, h⟩
          · exact ⟨_, by simp, h⟩
        | L =>
          exfalso
          have h1 : (wstepR P sb s .L).nL = s.nL + 1 := by simp [wstepR, hs]
          have := foldlR_nL P sb toks (wstepR P sb s .L)
          omega
        | D m =>
          have : (wstepR P sb s (.D m)).ok = (s.ok && rboxWf B && leafOkR P sb B (.D m)) := by
            simp [wstepR, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          have hl := hok'.2
          simp only [leafOkR, leafOk, Bool.and_eq_true] at hl
          obtain ⟨⟨hr, hw⟩, hm, hD⟩ := hl
          exact ⟨B, ⟨hok'.1.2, hr, hw, Or.inl ⟨m, of_decide_eq_true hm, of_decide_eq_true hD⟩⟩, hz⟩
        | A mu ts =>
          have : (wstepR P sb s (.A mu ts)).ok = (s.ok && rboxWf B && leafOkR P sb B (.A mu ts)) := by
            simp [wstepR, hs]
          rw [this, Bool.and_eq_true, Bool.and_eq_true] at hok'
          have hl := hok'.2
          simp only [leafOkR, leafOk, Bool.and_eq_true] at hl
          obtain ⟨⟨hr, hw⟩, hA⟩ := hl
          exact ⟨B, ⟨hok'.1.2, hr, hw, Or.inr ⟨mu, ts, hA⟩⟩, hz⟩
      · have hsub : ∀ C ∈ rest, C ∈ (wstepR P sb s t).stack := by
          intro C hC; cases t <;> simp [wstepR, hs, hC]
        exact ih _ hok hst hnl' ch y ⟨B, hsub B hBr, hz⟩

/-- **The four chart cubes** for `farRunR` with `0` leaves in `L`. -/
theorem farRunR_cover (P : Prob) (sb : ℤ × ℕ) (toks : List Tok) (h : (farRunR P sb toks).1 = true)
    (h0 : (farRunR P sb toks).2.2.2 = 0)
    (ch : ℕ) (hch : ch < 4) (y : Fin 3 → ℝ) (hy : ∀ i, |y i| ≤ (P.rden : ℝ)) :
    ∃ B, GoodR P sb B ∧ InBox B ch y := by
  simp only [farRunR, Bool.and_eq_true, List.isEmpty_iff] at h h0
  refine run_coverR P sb toks _ h.1.2 h.2 h0 ch y ⟨⟨ch, -P.rden, -P.rden, -P.rden, P.rden, P.rden,
    P.rden⟩, ?_, ?_⟩
  · simp only [rRoots, List.mem_map, List.mem_range]; exact ⟨ch, hch, rfl⟩
  · refine ⟨rfl, fun i => ?_⟩
    have h0 := abs_le.1 (hy 0); have h1 := abs_le.1 (hy 1); have h2 := abs_le.1 (hy 2)
    fin_cases i <;> simp [bLo, bHi] <;> constructor <;> linarith

/-- `sbOk`: `S̄ ≤ sb` and `sb` has a positive denominator. -/
theorem sb_le {P : Prob} {sb : ℤ × ℕ} (hd : Dens P) (h : sbOk P sb = true) :
    0 < sb.2 ∧ ∀ g, Sb P ≤ Sb (redP P sb g) := by
  simp only [sbOk, Bool.and_eq_true, decide_eq_true_eq] at h
  refine ⟨h.1, fun g => ?_⟩
  have h1 : (0 : ℝ) < P.sbar.2 := by exact_mod_cast hd.sd
  have h2 : (0 : ℝ) < sb.2 := by exact_mod_cast h.1
  have h3 : ((P.sbar.1 * (sb.2 : ℤ) : ℤ) : ℝ) ≤ ((sb.1 * (P.sbar.2 : ℤ) : ℤ) : ℝ) := by
    exact_mod_cast h.2
  push_cast at h3
  show (P.sbar.1 : ℝ) / P.sbar.2 ≤ (sb.1 : ℝ) / sb.2
  rw [div_le_div_iff₀ h1 h2]
  linarith

/-! ## 3. The far region alone gives `S ≥ S̄` -/

/-- `Sandwich.far_main_noL` for `farRunR`. -/
theorem far_mainR {P : Prob} {sb : ℤ × ℕ} {Kb : ℝ} (hb : BracketG P.sqb (maskOf P.ps) Kb)
    (hKb : 0 < Kb)
    (hwf : WF P) (hd : Dens P) (hdg : 0 < P.dg) (hdk : 0 < P.dk) (hq : 0 < P.qlam)
    (hTr : 0 < Tr P) (hrden : 0 < P.rden) (hbo : boundsOk P = true) (hgrp : groupOk P = true)
    {toks : List Tok} (hfar : (farRunR P sb toks).1 = true) (hL : (farRunR P sb toks).2.2.2 = 0)
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
  have hsb : sbOk P sb = true := by
    simp only [farRunR, Bool.and_eq_true] at hfar; exact hfar.1.1
  obtain ⟨hsb2, hsbl⟩ := sb_le hd hsb
  by_cases hout : ∃ j < P.normals.length, Tr P < dot (NCv P j) t
  · obtain ⟨j, hj, hjt⟩ := hout
    have hRo : Rᵀ * R = 1 := by
      rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
      exact (Matrix.mem_orthogonalGroup_iff' (Fin 3) ℝ).1 hR.1
    exact outside_bound hwf hd hbo hRo hN0 hball hLP hj hjt
  push Not at hout
  have hden : (0 : ℝ) < P.rden := by exact_mod_cast hrden
  obtain ⟨ch, hch, u, hc⟩ := Charts.charts_cover hR hden
  obtain ⟨B, ⟨_, hr, hwB, hgood⟩, hin⟩ := farRunR_cover P sb toks hfar hL ch hch u
    (fun i => abs_le.2 ⟨(hc.1 i).1, (hc.1 i).2⟩)
  set g := redG P.rden B with hgdef
  obtain ⟨hg, hgd, h0, h1, h2, h3, h4, h5⟩ := redOk_spec hr
  have hgr : (0 : ℝ) < g := by exact_mod_cast hg
  set P' := redP P sb g with hP'
  -- the reduced chart point and box
  have hc' : Charts.ChartPt R (P'.rden : ℝ) ch (fun i => u i / g) := by
    have e : ((P'.rden : ℤ) : ℝ) = (P.rden : ℝ) / g := cast_div_of_dvd hgr.ne' hgd
    rw [e]; exact chartPt_div hgr hc
  have hin' := inBox_red hg h0 h1 h2 h3 h4 h5 hin
  obtain ⟨s, hs, hsu⟩ := box_param hwB _ hin'.2
  obtain ⟨Nv, hNv, hN, hent⟩ := box_entries (P := P') hc' hin'.1 hsu
  -- `P'` differs from `P` only in `rden` and `sbar`
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

/-- **`S ≥ S̄` on the LP, far region only** (`Sandwich.lower_LP_noL` for `farRunR`). -/
theorem lower_LPR {P : Prob} {sb : ℤ × ℕ} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hc : ConstsQ P sbarS sup supRat) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) {toks : List Tok} (hfar : (farRunR P sb toks).1 = true)
    (hL : (farRunR P sb toks).2.2.2 = 0)
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
  exact far_mainR hb hKb hwf hd hc.dg hc.dk hq htr hc.rden hc.bnd hc.grp hfar hL hPT hN0 hball
    hQ hQLP hmax

/-! ## 4. The sandwich -/

/-- `Sandwich.d16_sandwich` for `farRunR`. -/
theorem d16_sandwichR {P : Prob} {sb : ℤ × ℕ} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hwfo : wfOk P = true)
    (hsl : Len P.ps sup.num) (hsp : fpos P.ps sup.num = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam)
    {toks : List Tok} (hfar : (farRunR P sb toks).1 = true) (hL : (farRunR P sb toks).2.2.2 = 0)
    (hPT : ∀ x : E3, (∀ j < P.normals.length, dot (NCv P j) x ≤ 1) →
      x ∈ convexHull ℝ (Wv P '' {w | w ∈ P.pv}))
    (hN0 : 0 < dot (N0v P) (N0v P))
    (hball : ∀ u : E3, ∃ l < P.verts.length, 0 ≤ dot u (Vv P l) ∧
      D0r P ^ 2 * dot u u ≤ dot (N0v P) (N0v P) * dot u (Vv P l) ^ 2)
    {NK : ℕ → E3} {mk : ℕ}
    (hint : ∀ y : E3, (∀ f < mk, dot (NK f) y < D0r P) →
      y ∈ interior (convexHull ℝ (Vv P '' {l | l < P.verts.length})))
    (horb : ∀ f < mk, ∃ h ∈ SO3, (∀ l < P.verts.length, ∃ l' < P.verts.length,
      mv h (Vv P l) = Vv P l') ∧ mv h (N0v P) = NK f)
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C)
    (hσc : σ = qv P.ps P.c0)
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
      (lower_LPR hc hwf hmask hq hfar hL hPT hN0 hball) hs0
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

/-- `Sandwich.d16_sandwich_cert` for `farRunR`. -/
theorem d16_sandwich_certR {P : Prob} {sb : ℤ × ℕ} {cK cT : Cert} {hs : List (List (List FE))}
    {dh : ℕ} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hsl : Len P.ps sup.num)
    (hsp : fpos P.ps sup.num = true)
    {toks : List Tok} (hfar : (farRunR P sb toks).1 = true) (hL : (farRunR P sb toks).2.2.2 = 0)
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
  exact d16_sandwichR hco hwfo hsl hsp hmask hq hfar hL hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout hσc ha hb

end

#assert_std_axioms PackLean.Formal.SandwichR.chartPt_div PackLean.Formal.SandwichR.inBox_red
  PackLean.Formal.SandwichR.run_coverR PackLean.Formal.SandwichR.farRunR_cover
  PackLean.Formal.SandwichR.far_mainR PackLean.Formal.SandwichR.lower_LPR
  PackLean.Formal.SandwichR.d16_sandwichR PackLean.Formal.SandwichR.d16_sandwich_certR

end PackLean.Formal.SandwichR
