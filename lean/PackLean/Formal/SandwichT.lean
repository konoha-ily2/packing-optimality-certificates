import PackLean.Formal.LocalTubeMixMain
import PackLean.Formal.D16Bridge

/-!
# D45 stage 5b (part 7): the main theorem of octinico from the checkers of `D30S3`

The copies of `D16Main.d16_main` and `D16Bridge.d16_cert` with the far tree `farRunT` and the local
check of the tube `localOkT` (`LocalTubeMixMain.lower_LPT`) in place of `farRun` and `localOk`. The
upper bound, the bridge of the piece (`R*`) and of `P_T` are those of `D16.Core` unchanged.
-/

namespace PackLean.Formal.SandwichT

open PackLean.D28 (FE fadd fsub fsmul fzero fofInt fmul fsign nth vecGet)
open PackLean.D16 (Prob Tok Cand LTok fdot fnn fpos vsmul matVec orthOk det3 constsOk sqbOk pieceOk
  containerOk groupOk boundsOk upperOk)
open PackLean.D30S3 (S3 farRunT localOkT LTokT)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts hsubv_of_ok interior_of_ok getD_mem)
open PackLean.Formal.LocalG (Ss)
open PackLean.Formal.FarG (mat orth_of_ok mv_of_matVec det3_spec det_mat exists_nth mem_nth fval_congr)
open PackLean.Formal.UpperG (dot_self_eq dot_isLinear upper_main)
open PackLean.Formal.D16Main
open PackLean.Formal.D16Bridge
open PackLean.Formal.PolySemG (maskOf)
open Finset
open scoped Matrix Pointwise RealInnerProductSpace

noncomputable section

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

theorem d30s3_main {P : Prob} (hco : constsOk P = true) (hwfo : wfOk P = true)
    (hmask : P.maskp = maskOf P.ps) (hq : 0 < P.qlam) (hD0 : 0 < D0r P) (hS : 0 < Ss P)
    {X : S3} (hact : X.act.Nodup) (hactn : ∀ f ∈ X.act, f < P.normals.length)
    {toks : List Tok} (hfar : (farRunT P X toks).1 = true)
    {cands : List Cand} {faces : List (List LTokT)} (hloc : (localOkT P X cands faces).1 = true)
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
    (LocalTubeMixMain.lower_LPT hc hwf hmask hq hD0 hact hactn hfar hloc hcw hPT hN0 hball) hs0
    (fits_rot hK hA hAV hVA hfit)
  rw [div_le_iff₀ hσ]
  linarith


theorem d30s3_cert {P : Prob} {cK cT : Cert} {hs : List (List (List FE))} {dh : ℕ}
    (hco : constsOk P = true) {X : S3} (hact : X.act.Nodup)
    (hactn : ∀ f ∈ X.act, f < P.normals.length) {toks : List Tok} (hfar : (farRunT P X toks).1 = true)
    {cands : List Cand} {faces : List (List LTokT)} (hloc : (localOkT P X cands faces).1 = true)
    (hbr : bridgeOk P cK cT hs dh cands = true)
    {K C KV : Set E3} (hK : K = convexHull ℝ KV) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = Vv P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (Vv P l) ∈ KV)
    {σ : ℝ} (hσ : 0 < σ)
    (hCin : ∀ y ∈ C, ∀ j < P.normals.length, dot (NCv P j) y ≤ σ)
    (hCout : ∀ y : E3, (∀ j < P.normals.length, dot (NCv P j) y ≤ σ) → y ∈ C) :
    IsMinEdge K C 2 (Ss P / σ) := by
  simp only [bridgeOk, Bool.and_eq_true, beq_iff_eq, decide_eq_true_eq, List.all_eq_true] at hbr
  obtain ⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨⟨hwfo, hmask⟩, hq⟩, hd0p⟩, hssp⟩, hn0p⟩, hcwo⟩, hcK⟩, hKps⟩, hKv⟩, hKdv⟩, hKoff⟩, hKdoff⟩, hKball⟩, horbo⟩, hcT⟩, hTps⟩, hTv⟩, hTdv⟩, hTn⟩, hTdn⟩, hToff⟩ :=
    hbr
  have hc := D16Main.consts_of hco
  have hwf := wf_of_ok hwfo
  have hd := D16Main.dens_of hc
  have HK := okParts hcK
  -- small facts
  have hD0 : 0 < D0r P := by
    unfold D0r
    have := pos_of_fpos hwf.pos hwf.d0 hd0p
    have : (0 : ℝ) < P.d0.den := by exact_mod_cast hd.d0
    positivity
  have hS : 0 < Ss P := by
    unfold Ss
    have := pos_of_fpos hwf.pos hwf.sstar hssp
    obtain ⟨_, _, _, hss⟩ := D16Main.bnd_parts hc.bnd
    have : (0 : ℝ) < P.sstar.den := by exact_mod_cast hss
    positivity
  have hnn := fval_fdot hwf.nb hwf.n0 hwf.n0
  have hN0 : 0 < dot (N0v P) (N0v P) := by
    have := pos_of_fpos hwf.pos hnn.1 hn0p
    rw [N0v, dot_vec, ← hnn.2]
    have : (0 : ℝ) < P.dn0 := by exact_mod_cast hd.dn0
    positivity
  have hcw : ∀ c ∈ cands, ∀ v ∈ c.minv, LenV P.ps v := fun c hc v hv => lenV_of_ok (hcwo c hc v hv)
  -- the rotated piece
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
  -- `P_T`
  have hPT := hPT_of hcT hTps hTv hTdv hTn hTdn (D_one hcT hToff)
  exact d30s3_main hco hwfo hmask hq hD0 hS hact hactn hfar hloc hcw hPT hN0 hball hint horb hK hA hAV hVA hσ
    hCin hCout

end

#assert_std_axioms PackLean.Formal.SandwichT.d30s3_main PackLean.Formal.SandwichT.d30s3_cert

end PackLean.Formal.SandwichT
