import PackLean.Formal.Spec

/-!
# D45 stage 1, step 3: proper placements are `x ↦ R x + t` with `R ∈ SO(3)`

`Spec.lean` defines a proper placement as an isometry of `E3` whose linear part has determinant 1.
The certificates speak of a rotation matrix `R` and a translation `t`.  This file is the bridge:

* `isProper_iff`: `IsProper g ↔ ∃ R ∈ SO(3), ∃ t, ∀ x i, g x i = ∑ j, R i j * x j + t i`.
-/

namespace PackLean.Formal

open scoped Pointwise

noncomputable section

/-- The standard orthonormal basis of `E3`. -/
abbrev stdB : OrthonormalBasis (Fin 3) ℝ E3 := EuclideanSpace.basisFun (Fin 3) ℝ

/-- The linear part of a placement, as a linear map. -/
abbrev linPart (g : Motion) : E3 →ₗ[ℝ] E3 :=
  (g.linearIsometryEquiv.toLinearEquiv : E3 →ₗ[ℝ] E3)

/-- The matrix (in the standard basis) of the linear part of a placement. -/
def rotMat (g : Motion) : Matrix (Fin 3) (Fin 3) ℝ :=
  LinearMap.toMatrix stdB.toBasis stdB.toBasis (linPart g)

/-- Coordinates of a linear map applied to a vector, via its matrix. -/
theorem linMap_apply_coord (L : E3 →ₗ[ℝ] E3) (x : E3) (i : Fin 3) :
    L x i = ∑ j, LinearMap.toMatrix stdB.toBasis stdB.toBasis L i j * x j := by
  have h := congrFun (LinearMap.toMatrix_mulVec_repr stdB.toBasis stdB.toBasis L x) i
  simp only [OrthonormalBasis.coe_toBasis_repr_apply, EuclideanSpace.basisFun_repr] at h
  rw [← h]
  simp [Matrix.mulVec, dotProduct]

/-- A placement is its linear part followed by the translation by `g 0`. -/
theorem motion_apply (g : Motion) (x : E3) : g x = linPart g x + g 0 := by
  have h := g.map_vsub x 0
  simp only [vsub_eq_sub, sub_zero] at h
  change g.linearIsometryEquiv x = _ at h
  change g x = g.linearIsometryEquiv x + g 0
  rw [h, sub_add_cancel]

/-- Coordinates of a placed point. -/
theorem motion_apply_coord (g : Motion) (x : E3) (i : Fin 3) :
    g x i = ∑ j, rotMat g i j * x j + g 0 i := by
  rw [motion_apply g x, PiLp.add_apply, linMap_apply_coord]
  rfl

/-- The matrix of the linear part of any placement is orthogonal. -/
theorem rotMat_mem_orthogonal (g : Motion) : rotMat g ∈ Matrix.orthogonalGroup (Fin 3) ℝ :=
  LinearIsometryEquiv.toMatrix_mem_unitaryGroup g.linearIsometryEquiv stdB stdB

/-- `IsProper` is `det (rotMat g) = 1`. -/
theorem isProper_iff_det (g : Motion) : IsProper g ↔ (rotMat g).det = 1 := by
  rw [IsProper, rotMat, LinearMap.det_toMatrix]

/-- **Bridge.** A placement is proper iff it is `x ↦ R x + t` with `R ∈ SO(3)`. -/
theorem isProper_iff (g : Motion) :
    IsProper g ↔ ∃ R ∈ Matrix.specialOrthogonalGroup (Fin 3) ℝ, ∃ t : E3,
      ∀ x i, g x i = ∑ j, R i j * x j + t i := by
  constructor
  · intro hg
    refine ⟨rotMat g, ?_, g 0, motion_apply_coord g⟩
    rw [Matrix.mem_specialOrthogonalGroup_iff]
    exact ⟨rotMat_mem_orthogonal g, (isProper_iff_det g).1 hg⟩
  · rintro ⟨R, hR, t, hgt⟩
    rw [Matrix.mem_specialOrthogonalGroup_iff] at hR
    have h0 : ∀ i, g 0 i = t i := fun i => by simp [hgt]
    have hM : rotMat g = R := by
      ext i j
      have h1 := hgt (EuclideanSpace.single j 1) i
      rw [motion_apply_coord, h0] at h1
      have h2 : ∀ M : Matrix (Fin 3) (Fin 3) ℝ,
          ∑ k, M i k * (EuclideanSpace.single j (1 : ℝ) : E3) k = M i j := fun M => by
        simp [PiLp.single_apply]
      rw [h2, h2] at h1
      linarith
    rw [isProper_iff_det, hM]
    exact hR.2

end

end PackLean.Formal
