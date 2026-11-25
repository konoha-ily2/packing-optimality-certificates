import PackLean.Formal.Sandwich
import PackLean.Formal.LocalQMain

/-!
# A9d (D45 stage 6b): the sandwich theorem with the local region of Lemma Q

As `Sandwich.d16_sandwich` (stage 6a), for a run of `farRun` **with** `L` leaves: the `L` leaves are
covered by the local region `D44.localQ` (Lemma Q, D44 3.2; `LocalQMain.localQ_main`).

* `sstar_of_consts`・`sstar_eq`: `constsQ` contains `sstarIsSbar`, so `S* = S̄` (`Ss P = Sb P`);
* `lower_LPQ`: `S ≥ S̄` on the LP (`far_main`, then `localQ_main` on the local box);
* **`d44_sandwich`**・**`d44_sandwich_cert`**: `EdgeBetween K C 2 a b` (the upper half is the one of
  `d16_sandwich`, unchanged). The multiplier denominator `qlamL` of the far-shaped local leaves must
  be positive (`hqL`, a number of the case).
-/

namespace PackLean.Formal.SandwichQ

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
open PackLean.D44 (QTok localQ)
open PackLean.Formal.Sandwich (ConstsQ constsQ_of dens_of qv claim_spec fits_mono)
open PackLean.Formal.LocalQMain (localQ_main)

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

/-- `constsQ` contains `sstarIsSbar`. -/
theorem sstar_of_consts {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (h : constsQ P sbarS sup supRat = true) : sstarIsSbar P = true := by
  simp only [constsQ, Bool.and_eq_true, decide_eq_true_eq] at h
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨_, _⟩, _⟩, _⟩, _⟩, h6⟩, _⟩, _⟩, _⟩, _⟩, _⟩, _⟩, _⟩,
    _⟩, _⟩, _⟩, _⟩, _⟩ := h
  exact h6

/-- **`S* = S̄`** from `sstarIsSbar` (the field element `sstar.num` is the rational `sbar`). -/
theorem sstar_eq {P : Prob} (hwf : WF P) (hsb : 0 < P.sbar.2) (hsd : 0 < P.sstar.den)
    (h : sstarIsSbar P = true) : Ss P = Sb P := by
  simp only [sstarIsSbar, Bool.and_eq_true, beq_iff_eq, List.all_eq_true] at h
  obtain ⟨⟨_, hz⟩, heq⟩ := h
  have hv := fval_head P.ps P.sstar.num hwf.sstar (fun x hx => by
    rw [← List.drop_one] at hx; exact hz x hx)
  unfold Ss Sb
  rw [hv]
  have h1 : (0 : ℝ) < P.sstar.den := by exact_mod_cast hsd
  have h2 : (0 : ℝ) < P.sbar.2 := by exact_mod_cast hsb
  rw [div_eq_div_iff h1.ne' h2.ne']
  have : ((P.sstar.num.headD 0 * (P.sbar.2 : ℤ) : ℤ) : ℝ) = ((P.sbar.1 * (P.sstar.den : ℤ) : ℤ) : ℝ) := by
    rw [heq]
  push_cast at this
  linarith

/-- **`S ≥ S̄` on the LP** with the local region of Lemma Q. -/
theorem lower_LPQ {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hc : ConstsQ P sbarS sup supRat) (hwf : WF P) (hmask : P.maskp = maskOf P.ps)
    (hq : 0 < P.qlam) (hSS : Ss P = Sb P) {qlamL : ℕ} (hqL : 0 < qlamL)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
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
  rcases FarG.far_main hb hKb hwf hd hc.dg hc.dk hq htr hc.rden hc.bnd hc.grp hfar hPT hN0 hball
    hQ hQLP hmax with h1 | ⟨u, huc, hu⟩
  · exact h1
  · exact localQ_main hb hKb hwf hd hss hc.rden hqL htr hc.bnd hPT hN0 hball hSS hloc hcw hQ huc hu
      hQLP

/-- **`EdgeBetween` from the checkers of `D16.Core` + `D44.constsQ` + `D44.localQ`** (a run of
`farRun` whose `L` leaves are covered by the local region of Lemma Q).  `σ = C0` is the level of the container normals; `a ≤ s̄`
and `s_up ≤ b` are the rounded ends of the claim. -/
theorem d44_sandwich {P : Prob} {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hwfo : wfOk P = true)
    (hsl : Len P.ps sup.num) (hsp : fpos P.ps sup.num = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
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
      (lower_LPQ hc hwf hmask hq hSS hqL hfar hloc hcw hPT hN0 hball) hs0
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
theorem d44_sandwich_cert {P : Prob} {cK cT : Cert} {hs : List (List (List FE))} {dh : ℕ}
    {sbarS : ℤ × ℕ} {sup : QF} {supRat : ℤ × ℕ}
    (hco : constsQ P sbarS sup supRat = true) (hsl : Len P.ps sup.num)
    (hsp : fpos P.ps sup.num = true)
    {toks : List Tok} (hfar : (farRun P toks).1 = true)
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
  exact d44_sandwich hco hwfo hsl hsp hmask hq hfar hqL hloc hcw hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout hσc ha hb

end

#assert_std_axioms PackLean.Formal.SandwichQ.sstar_eq PackLean.Formal.SandwichQ.lower_LPQ
  PackLean.Formal.SandwichQ.d44_sandwich PackLean.Formal.SandwichQ.d44_sandwich_cert

end PackLean.Formal.SandwichQ
