import PackLean.Formal.TetLocal
import PackLean.Formal.TetUpper
import PackLean.Formal.CaseBridge
import PackLean.Formal.D16Main

/-!
# A9 stage 7b (part 5): from the checkers of `D28` to `IsMinEdge` (icointet, cubintet)

Design: `plan/A9f_tet_design.md` §8 (7b-5).  The three meanings of the earlier parts are put
together:

* `TetCover.far_cert` (the far trees, with the local hypothesis `HLoc`) gives `TetCert (VV P) nv c*`;
* `TetLocal.hloc_of` (the local regions) gives `HLoc`;
* `TetUpper.upper_fits` (the placement) gives two copies of `conv (VV P)` at `c* / (√2/4)`.

The piece of the data `VV P` is the solid of the claim rotated by `A ∈ SO(3)` (`pieceOkT`, the same
check as `CaseBridge.pieceOk` for the problems of `D28`); `D16Main.fits_rot` moves the fitting
between the two in both directions.  The mirror of the piece is `-1` (`negOkT`: the vertices are
invariant under `x ↦ -x`).

* `image_hull`, `interior_rot`: the rotated hull and its interior;
* `piece_ofT`, `neg_ofT`: the Boolean bridges;
* **`tet_case`**: the checks ⇒ `IsMinEdge K tet 2 (c* / (√2/4))`.
-/

namespace PackLean.Formal.TetCase

open PackLean.D28 (FE fofInt nth Prob Pair NTok ntreeOk pairOk Upper upperOk)
open PackLean.Formal PackLean.Formal.FieldSem PackLean.Formal.PolyLP PackLean.Formal.FarAccept
  PackLean.Formal.TetFar PackLean.Formal.TetReduction
open PackLean.Formal.Polytope (dot Cert certOk okParts OkParts getD_mem)
open PackLean.Formal.UpperG (place place_apply orth_of_SO rotLE)
open PackLean.Formal.CaseBridge (mapOk mapOk_spec rotOk rot_of_ok diagR mv_diag insPsL liftV
  nth_map_lift vec_liftV)
open PackLean.Formal.D16Bridge (pvec_eq lenV_of_vecOk)
open PackLean.Formal.FarG (mat)
open PackLean.Formal.TetCover (corners FarConsts HLoc far_cert)
open scoped Matrix Pointwise

local notation "SO3" => Matrix.specialOrthogonalGroup (Fin 3) ℝ

noncomputable section

/-! ## 1. The rotated hull -/

theorem image_hull {KV : Set E3} {A : M3} (hA : A ∈ SO3) {V : ℕ → E3} {nv : ℕ}
    (hAV : ∀ x ∈ KV, ∃ l < nv, mv A x = V l) (hVA : ∀ l < nv, mv Aᵀ (V l) ∈ KV) :
    place A (orth_of_SO hA) 0 '' convexHull ℝ KV = convexHull ℝ (V '' {l | l < nv}) := by
  have hAo := orth_of_SO hA
  have happ : ∀ x, place A hAo 0 x = mv A x := fun x => by rw [place_apply, add_zero]
  have hlin : ∀ S : Set E3, place A hAo 0 '' S = (rotLE A hAo).toLinearMap '' S := fun S => by
    ext y; simp only [Set.mem_image, happ]; rfl
  rw [hlin, LinearMap.image_convexHull, ← hlin]
  congr 1
  ext y
  simp only [Set.mem_image, Set.mem_setOf_eq, happ]
  constructor
  · rintro ⟨x, hx, rfl⟩
    obtain ⟨l, hl, e⟩ := hAV x hx
    exact ⟨l, hl, e.symm⟩
  · rintro ⟨l, hl, rfl⟩
    refine ⟨mv Aᵀ (V l), hVA l hl, ?_⟩
    rw [← mv_mul, mul_transpose_of hAo, mv_one]

theorem interior_rot {KV : Set E3} (hKi : (interior (convexHull ℝ KV)).Nonempty) {A : M3}
    (hA : A ∈ SO3) {V : ℕ → E3} {nv : ℕ}
    (hAV : ∀ x ∈ KV, ∃ l < nv, mv A x = V l) (hVA : ∀ l < nv, mv Aᵀ (V l) ∈ KV) :
    (interior (convexHull ℝ (V '' {l | l < nv}))).Nonempty := by
  have h := (place A (orth_of_SO hA) 0).toHomeomorph.image_interior (convexHull ℝ KV)
  simp only [AffineIsometryEquiv.coe_toHomeomorph] at h
  rw [← image_hull hA hAV hVA, ← h]
  exact hKi.image _

theorem mv_neg_one (x : E3) : mv (-1) x = -x := by
  ext i
  fin_cases i <;> simp [mv_apply, Fin.sum_univ_three, Matrix.one_apply]

/-! ## 2. The Boolean bridges -/

/-- The piece of the claim (certificate `c`, embedded by `es`) is mapped by `A / dA ∈ SO(3)` onto the
vertices of `P` (the check `CaseBridge.pieceOk` for the problems of `D28`). -/
def pieceOkT (P : Prob) (c : Cert) (es : List (ℕ × ℕ)) (A : List (List FE)) (dA : ℕ) (π : List ℕ) :
    Bool :=
  insPsL es c.ps == P.ps && rotOk P.ps P.nb A dA &&
  mapOk P.ps P.nb A dA (c.verts.map (liftV es c.ps)) c.dv P.verts P.dv π

/-- The vertex list of `P` is invariant under `x ↦ -x` (`π` the matching). -/
def negOkT (P : Prob) (π : List ℕ) : Bool :=
  mapOk P.ps P.nb (diagR P.nb (fofInt P.nb (-1))) 1 P.verts P.dv P.verts P.dv π

theorem cV_eqT {P : Prob} {c : Cert} (H : OkParts c) {es : List (ℕ × ℕ)} (hes : insPsL es c.ps = P.ps)
    {l : ℕ} (hl : l < c.verts.length) :
    c.V l = vec P.ps P.nb c.dv (nth (c.verts.map (liftV es c.ps)) l []) := by
  have hv := lenV_of_vecOk (H.verts _ (getD_mem [] hl))
  rw [nth_map_lift hl, Cert.V, Cert.vert, pvec_eq P.nb hv.1, ← hes]
  exact (vec_liftV hv _ _ _).symm

/-- **The bridge of the piece.** -/
theorem piece_ofT {P : Prob} (hwf : WF P) {c : Cert} (hc : certOk c = true) {es : List (ℕ × ℕ)}
    {A : List (List FE)} {dA : ℕ} {π : List ℕ} (h : pieceOkT P c es A dA π = true) :
    mat P.ps P.nb dA A ∈ SO3 ∧
    (∀ x ∈ c.Vs, ∃ l < P.verts.length, mv (mat P.ps P.nb dA A) x = VV P l) ∧
    (∀ l < P.verts.length, mv (mat P.ps P.nb dA A)ᵀ (VV P l) ∈ c.Vs) := by
  simp only [pieceOkT, Bool.and_eq_true, beq_iff_eq] at h
  obtain ⟨⟨hes, hrot⟩, hmap⟩ := h
  have H := okParts hc
  have hA := rot_of_ok hwf.nb hrot
  obtain ⟨hfw, honto⟩ := mapOk_spec hwf.nb hmap
  simp only [List.length_map] at hfw honto
  refine ⟨hA, ?_, fun l hl => ?_⟩
  · rintro x ⟨l, hl, rfl⟩
    obtain ⟨hπ, e⟩ := hfw l hl
    exact ⟨_, hπ, by rw [cV_eqT H hes hl, e]; rfl⟩
  · obtain ⟨l0, hl0, rfl⟩ := honto l hl
    obtain ⟨_, e⟩ := hfw l0 hl0
    have hAA := orth_of_SO hA
    have : VV P (nth π l0 0) = mv (mat P.ps P.nb dA A) (c.V l0) := by
      rw [cV_eqT H hes hl0, e]; rfl
    rw [this, ← mv_mul, hAA, mv_one]
    exact ⟨l0, hl0, rfl⟩

/-- **The bridge of the mirror.** -/
theorem neg_ofT {P : Prob} (hwf : WF P) {π : List ℕ} (h : negOkT P π = true) :
    ∀ l < P.verts.length, ∃ l' < P.verts.length, mv (-1) (VV P l) = VV P l' := by
  obtain ⟨hfw, _⟩ := mapOk_spec hwf.nb h
  intro l hl
  obtain ⟨hπ, e⟩ := hfw l hl
  refine ⟨_, hπ, ?_⟩
  have e' : VV P (nth π l 0) = mv (mat P.ps P.nb 1 (diagR P.nb (fofInt P.nb (-1)))) (VV P l) :=
    e.symm
  rw [e', mv_diag, hwf.nb, fval_fofInt, mv_neg_one]
  simp

/-! ## 3. The case theorem -/

/-- **From the checks of `D28` to `IsMinEdge`.** The far trees (`hn`, `hp`), the local hypothesis
(`hloc`, from `TetLocal.hloc_of`), the placement (`hU`), the mirror (`hneg`), and the piece of the
claim `K = conv (W '' {l < m})` rotated by `A` onto the vertices of `P`. -/
theorem tet_case {P : Prob} (hc : FarConsts P) (hloc : HLoc P) {ntoks : List NTok}
    {pairs : List Pair} (hn : ntreeOk P.nden ntoks (pairs.map fun p => corners p.nb) = true)
    (hp : ∀ p ∈ pairs, pairOk P p = true) {U : Upper} (hU : upperOk P U = true)
    (hc0 : 0 ≤ c0r P)
    (hneg : ∀ l < P.verts.length, ∃ l' < P.verts.length, mv (-1) (VV P l) = VV P l')
    {K KV : Set E3} {W : ℕ → E3} {m : ℕ} (hK : K = convexHull ℝ KV) (hKV : KV = W '' {l | l < m})
    (hKi : (interior K).Nonempty) {A : M3} (hA : A ∈ SO3)
    (hAV : ∀ x ∈ KV, ∃ l < P.verts.length, mv A x = VV P l)
    (hVA : ∀ l < P.verts.length, mv Aᵀ (VV P l) ∈ KV) :
    IsMinEdge K tet 2 (c0r P / (√2 / 4)) := by
  have hwf := hc.wf
  have hcert := far_cert hc hloc hn hp
  have hq : (0 : ℝ) < √2 / 4 := by positivity
  have hKPi : (interior (convexHull ℝ (VV P '' {l | l < P.verts.length}))).Nonempty := by
    subst hK; exact interior_rot hKi hA hAV hVA
  have hkm : (-1 : M3)ᵀ * (-1) = 1 := by simp
  have hkd : (-1 : M3).det = -1 := by simp [Matrix.det_neg]; norm_num
  refine (isMinEdge_iff _ _ _ _).2 ⟨⟨div_nonneg hc0 hq.le, ?_⟩, fun s hs hf => ?_⟩
  · have hup := TetUpper.upper_fits hwf hU
    have hAt : Aᵀ ∈ SO3 := by simpa using mul_transpose_mem_SO (Submonoid.one_mem _) hA
    have h := D16Main.fits_rot (K := convexHull ℝ (VV P '' {l | l < P.verts.length}))
      (KV := VV P '' {l | l < P.verts.length}) rfl hAt (V := W) (nv := m) ?_ ?_ hup
    · rwa [← hKV, ← hK] at h
    · rintro x ⟨l, hl, rfl⟩
      have := hVA l hl
      rw [hKV] at this
      obtain ⟨l', hl', e⟩ := this
      exact ⟨l', hl', e.symm⟩
    · intro l hl
      rw [Matrix.transpose_transpose]
      obtain ⟨l', hl', e⟩ := hAV (W l) (by rw [hKV]; exact ⟨l, hl, rfl⟩)
      exact ⟨l', hl', e.symm⟩
  · have hf' := D16Main.fits_rot hK hA hAV hVA hf
    have h := tet_lower_hull (K := convexHull ℝ (VV P '' {l | l < P.verts.length})) rfl hKPi
      (fun l hl => ⟨l, hl, rfl⟩) hkm hkd hneg hcert hs hf'
    rw [div_le_iff₀ hq]
    linarith

end

#assert_std_axioms PackLean.Formal.TetCase.tet_case PackLean.Formal.TetCase.piece_ofT
  PackLean.Formal.TetCase.neg_ofT

end PackLean.Formal.TetCase
