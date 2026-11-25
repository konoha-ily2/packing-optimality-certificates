import PackLean.Formal.DTLocalVal
import PackLean.Formal.DTLocalTree

/-!
# A9k stage 7c-3 (part 4): `tubeRunL` gives the local lemma of a tube (`hlocTube_of`)

Design: `plan/A9k_dodintet_design.md` §3 (7c-3), §7.

`tubeRunL P t cands D faces` true (with `0 < D`, `tubeWfB t`, `weightsOk t`) ⇒ `HLocTube P t`:
a point `(u, w, p)` of the tube lies on one of the eight faces (`face_point`), the face string covers
it by a good leaf (`ltree_cover`), the leaf gives `e0 + r·Λ ≥ 0` (`leaf_pos`), which is the value of
the candidate polynomial (`splitE0_spec`), i.e. `S·|q|²·(dualB − κ) ≥ 0` (`cand_valT`); with the
weights `μ = n·b₂` (`weights_spec`) this is the left branch of `Low`.
-/

namespace PackLean.Formal.DTLocalRun

open PackLean.D28 (FE Poly nth)
open PackLean.D45DT (Prm Tube PS fz Rat2 toD lroots LB LS LCtx splitE0 candPoly locParts tubeRunL faceRunL
  weightsOk kapForm toProb)
open PackLean.Formal PackLean.Formal.PolyLP PackLean.Formal.QuadSem PackLean.Formal.TetFar
open PackLean.Formal.FieldSem (fval Len)
open PackLean.Formal.PolySemN (pEvalN WFN)
open PackLean.Formal.Polytope (dot)
open PackLean.Formal.TetSep (bT)
open PackLean.Formal.TetReduction (Low)
open PackLean.Formal.DTLocalBox (ratR tX tY qcT QRotT HLocTube tubeWfB)
open PackLean.Formal.DTLocalTree (X5 Y6 InLB LGoodT ltree_cover leaf_pos face_point splitE0_spec)
open PackLean.Formal.DTLocalPoly (dtLocOk)
open PackLean.Formal.DTLocalVal (cand_valT cand_WF weights_spec lfOf pE dl_of)
open PackLean.Formal.DTBase (dtExtraOk toProb_wf)
open scoped Matrix

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

theorem toD_val {D : ℤ} {x : Rat2} {k : ℤ} (hx : 0 < x.2) (h : toD D x = some k) :
    (k : ℝ) = D * ratR x := by
  unfold toD at h
  split_ifs at h with hd
  simp only [Option.some.injEq] at h
  subst h
  have hdvd : (x.2 : ℤ) ∣ x.1 * D := Int.dvd_of_emod_eq_zero (beq_iff_eq.1 hd)
  rw [Int.cast_div hdvd (by exact_mod_cast hx.ne')]
  unfold ratR
  push_cast
  ring

theorem mem_zip_of_mem {α β : Type*} {l1 : List α} {l2 : List β} (hlen : l1.length = l2.length) {a : α}
    (ha : a ∈ l1) : ∃ b, (a, b) ∈ List.zip l1 l2 := by
  obtain ⟨i, hi, rfl⟩ := List.getElem_of_mem ha
  refine ⟨l2[i]'(hlen ▸ hi), ?_⟩
  have hz : i < (List.zip l1 l2).length := by simp only [List.length_zip]; omega
  have := List.getElem_mem hz
  simpa [List.getElem_zip] using this

/-- **The local lemma of one tube from its run.** -/
theorem hlocTube_of {P : Prm} (h0 : dtExtraOk P = true) (hL : dtLocOk P = true) (hkd : 0 < P.kd)
    {t : Tube} (ht : tubeWfB t = true) (hwt : weightsOk t = true) {cands : List (List ℕ)} {D : ℤ}
    {faces : List (List Char)} (hD : 0 < D) (hrun : (tubeRunL P t cands D faces).1 = true) :
    HLocTube P t := by
  have hwf := toProb_wf h0
  have ht' := ht
  simp only [tubeWfB, Bool.and_eq_true, decide_eq_true_eq] at ht'
  obtain ⟨⟨⟨⟨⟨hlo2, hhi2⟩, hr02⟩, _⟩, _⟩, _⟩ := ht'
  have hDr : (0 : ℝ) < D := by exact_mod_cast hD
  unfold tubeRunL at hrun
  rcases hu1 : toD D t.ulo with _ | ulo <;> rcases hu2 : toD D t.uhi with _ | uhi <;>
    rcases hr : toD D t.r0 with _ | r0 <;> (try simp only [hu1, hu2, hr] at hrun) <;>
    (try exact absurd hrun Bool.false_ne_true)
  simp only [Bool.and_eq_true, decide_eq_true_eq, beq_iff_eq, List.all_eq_true] at hrun
  obtain ⟨⟨⟨⟨⟨hsp, hcd⟩, _⟩, _⟩, hlen⟩, hres⟩ := hrun
  have eLo := toD_val hlo2 hu1
  have eHi := toD_val hhi2 hu2
  have eR := toD_val hr02 hr
  intro u w hu1' hu2' hw' p1 p2 p3 hp1 hp2 hp3 R _ hQ
  -- the point in units 1/D
  have bU1 : (ulo : ℝ) ≤ D * u := by rw [eLo]; exact mul_le_mul_of_nonneg_left hu1' hDr.le
  have bU2 : D * u ≤ (uhi : ℝ) := by rw [eHi]; exact mul_le_mul_of_nonneg_left hu2' hDr.le
  have bR : ∀ s : ℝ, |s| ≤ ratR t.r0 → D * |s| ≤ (r0 : ℝ) := fun s hs => by
    rw [eR]; exact mul_le_mul_of_nonneg_left hs hDr.le
  obtain ⟨B, hB, r, y, hr0', hX, hBz⟩ := face_point hD bU1 bU2 (bR w hw') (bR p1 hp1) (bR p2 hp2) (bR p3 hp3)
  -- the face string of B
  have hlr : (lroots D ulo uhi r0).length = faces.length := by
    rw [hlen]; rfl
  obtain ⟨toks, hmem⟩ := mem_zip_of_mem hlr hB
  have hface := hres _ (List.mem_map.2 ⟨(B, toks), hmem, rfl⟩)
  simp only [faceRunL, Bool.and_eq_true, Bool.not_eq_true', List.isEmpty_iff] at hface
  obtain ⟨⟨hok, hst⟩, _⟩ := hface
  obtain ⟨B', hgood, hz⟩ := ltree_cover P _ toks _ hok hst _ ⟨B, by simp, hBz⟩
  obtain ⟨ci, e00, e01, lam, hci, hc, hwB, hloB, hhiB, v, hv, hvp⟩ := hgood
  -- the candidate of the leaf
  simp only [List.length_map] at hci
  set cd := cands[ci]'hci with hcd_def
  have hcdm : cd ∈ cands := List.getElem_mem hci
  have hsome := hsp _ (List.mem_map.2 ⟨cd, hcdm, rfl⟩)
  obtain ⟨s, hs⟩ := Option.isSome_iff_exists.1 hsome
  have hcs : s = (e00, e01, lam) := by
    rw [← hc]
    unfold nth
    rw [List.getD_eq_getElem _ _ (by simpa using hci)]
    simp [List.getElem_map, ← hcd_def, hs]
  rw [hcs] at hs
  have hcd4 := hcd cd hcdm
  have hlt : ∀ j < 4, nth cd j 0 < P.verts.length := by
    intro j hj
    unfold nth
    rw [List.getD_eq_getElem _ _ (by omega)]
    exact hcd4.2 _ (List.getElem_mem _)
  have hWF := cand_WF h0 ht hlt
  obtain ⟨h00, h01, hlam, hsplit⟩ := splitE0_spec hWF hs
  -- the leaf: e0 + r·Λ ≥ 0
  have hz1 : (0 : ℝ) ≤ (fun k => (D : ℝ) * Y6 u r y k) 1 := by
    show (0 : ℝ) ≤ (D : ℝ) * r
    exact mul_nonneg hDr.le hr0'
  have hpos := leaf_pos (c := ⟨D, _, _⟩) h0 hL hD (by simpa using hci) hc hwB hloB hhiB hv hvp h00 h01 hlam hz hz1
  have hY : (fun k => (D : ℝ) * Y6 u r y k / D) = Y6 u r y := by
    funext k; field_simp
  simp only [hY] at hpos
  have hY0 : (D : ℝ) * Y6 u r y 0 / D = u := by simp [Y6]; field_simp
  have hY1 : (D : ℝ) * Y6 u r y 1 / D = r := by simp [Y6]; field_simp
  simp only [hY0, hY1] at hpos
  rw [← hsplit, hX] at hpos
  -- the value of the candidate polynomial
  obtain ⟨_, hval⟩ := cand_valT (x := ![u, w, p1, p2, p3]) h0 hkd ht hlt (R := R) (by exact hQ)
  rw [hval] at hpos
  have hdl := dl_of ht
  have hS : (0 : ℝ) < 4 * P.cden * P.kd * t.dl * P.dv *
      ((qcT t p1 p2 p3).1 ^ 2 + (qcT t p1 p2 p3).2.1 ^ 2 + (qcT t p1 p2 p3).2.2.1 ^ 2
        + (qcT t p1 p2 p3).2.2.2 ^ 2) := by
    have := hQ.1
    have h1 : (0 : ℝ) < P.cden := by exact_mod_cast hwf.c0d
    have h2 : (0 : ℝ) < P.kd := by exact_mod_cast hkd
    have h3 : (0 : ℝ) < t.dl := by exact_mod_cast hdl
    have h4 : (0 : ℝ) < P.dv := by exact_mod_cast hwf.dv
    positivity
  have hdual := (mul_nonneg_iff_of_pos_left hS).1 hpos
  -- the left branch of `Low`
  have hl0 : nth cd 0 0 < P.verts.length := hlt 0 (by norm_num)
  have hlf : ∀ f, lfOf cd f < P.verts.length := by
    intro f; fin_cases f
    · exact hlt 1 (by norm_num)
    · exact hlt 2 (by norm_num)
    · exact hlt 1 (by norm_num)
    · exact hlt 3 (by norm_num)
  refine Or.inl ⟨dot !₂[tX t u w, tY t u w, 1] (bT 2), nth cd 0 0, hl0, lfOf cd, hlf,
    fun f => weights_spec hwt ht hu1' hu2' hw' f, ?_⟩
  have := sub_nonneg.1 hdual
  exact this

/-- **Both tubes** (`HLocT P`, the hypothesis of `DTLocalBox.hlocB_of`) from the two runs. -/
theorem hlocT_of {P : Prm} (h0 : dtExtraOk P = true) (hL : dtLocOk P = true) (hkd : 0 < P.kd)
    (ht : DTLocalBox.dtTubeOk P = true) (hwA : weightsOk P.tA = true) (hwB : weightsOk P.tB = true)
    {cA cB : List (List ℕ)} {DA DB : ℤ} {fA fB : List (List Char)} (hDA : 0 < DA) (hDB : 0 < DB)
    (hA : (tubeRunL P P.tA cA DA fA).1 = true) (hB : (tubeRunL P P.tB cB DB fB).1 = true) :
    DTLocalBox.HLocT P := by
  simp only [DTLocalBox.dtTubeOk, Bool.and_eq_true] at ht
  exact ⟨hlocTube_of h0 hL hkd ht.1.1.1 hwA hDA hA, hlocTube_of h0 hL hkd ht.1.1.2 hwB hDB hB⟩

#assert_std_axioms PackLean.Formal.DTLocalRun.hlocTube_of PackLean.Formal.DTLocalRun.hlocT_of

end

end PackLean.Formal.DTLocalRun
