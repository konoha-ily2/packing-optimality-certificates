-- Exported automatically (lean/tools/export_d40.py). Do not edit by hand.
import PackLean.D40.Data

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The 11 piece rotations (identity excluded) are signed permutations with det = 1, keep the vertex set of the piece, and are distinct. Shape of the constants.
  Shapes of container and piece (at s = 1 the container is the piece); on D_n the weights n·(b₂ − b_f) ≥ 0. -/
theorem consts_ok : rotsOk P = true ∧ P.rots.length = 11 ∧ prmOk P = true ∧ shapeOk = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The 7 centres: sides and kinds (A, tube)×2, (A, point)×4, (B, tube); T_C is the identity; the other 6 are images under the elements g of the stabiliser of n_B of R̂
  (as vertex sets of the piece). -/
theorem centers_ok : P.cens.map (fun c => (c.side, c.tube)) = [(0, true), (0, true), (0, false), (0, false), (0, false), (0, false), (1, true)] ∧
    (nth P.cens 6 ⟨[], 0, true⟩).q = [P.qd, 0, 0, 0] ∧ imageOk qhat (nth P.cens 0 ⟨[], 0, true⟩).q (nth gmats 0 []) ∧ imageOk qhat (nth P.cens 1 ⟨[], 0, true⟩).q (nth gmats 1 []) ∧ imageOk qhat (nth P.cens 2 ⟨[], 0, true⟩).q (nth gmats 2 []) ∧ imageOk qhat (nth P.cens 3 ⟨[], 0, true⟩).q (nth gmats 3 []) ∧ imageOk qhat (nth P.cens 4 ⟨[], 0, true⟩).q (nth gmats 4 []) ∧ imageOk qhat (nth P.cens 5 ⟨[], 0, true⟩).q (nth gmats 5 []) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The κ̃₁ coefficients follow the definition ((L̂₁ − L̂₂)/2 at h = 0, 1/10 on the arc), β = −25/32. -/
theorem kappa_ok : kappaOk P (nth P.cens 0 ⟨[], 0, true⟩).q kcA0 kcA1 kcB0 kcB1 beta = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- s̄ = 1953564244/10⁹. Upper bound: the placement of R̂ and τ fits in the container s_up and is separated by the plane. Bracketing: s̄ < s_up < s̄ + 10⁻⁹,
  and the signs of the minimal polynomial at s̄ and s_up are opposite. -/
theorem upper_ok : req (rR P.sbar) ⟨1953564244, 1000000000⟩ = true ∧ upperOk qhat sUp nUp t1Up t2Up = true ∧
    bracketOk (rR P.sbar) sUp minpoly = true := by native_decide

end PackLean.D40.Tet
