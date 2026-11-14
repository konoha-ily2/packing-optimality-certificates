-- Exported automatically (lean/tools/export_d37n05.py). Do not edit by hand.
import PackLean.D37N05.Data

namespace PackLean.D37N05.Tet
open PackLean.D37N05

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- the 11 piece rotations (identity excluded) are distinct signed permutations with det 1 keeping the vertex set;
  the 12 quaternions of the L check give the 12 piece rotations; shape of the constants; the container is the piece at
  s = 1; the local n ranges lie in T with weights n.(b_mf - b_f) >= 0 at their corners, and 2 a_max + 3 r0 <= 2. -/
theorem consts_ok : rotsOk P = true ∧ P.rots.length = 11 ∧ kqsOk P = true ∧ prmOk P = true ∧ shapeOk = true ∧
    regionOk P = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- the 5 centres: sides and kinds; T_C is the identity; R1* and RP2 are rotations; T_S, P1_g021, P1_g102 are images
  g R1* g^-1 and P2 is RP2 (as vertex sets of the piece). -/
theorem centers_ok : P.cens.map (fun c => (c.side, c.tube)) = [(0, true), (0, false), (0, false), (0, false), (1, true)] ∧
    (nth P.cens 4 ⟨[], 0, true⟩).q = [1, 0, 0, 0] ∧ rot3Ok r1star = true ∧ rot3Ok rp2 = true ∧
    imageOk r1star (nth P.cens 0 ⟨[], 0, true⟩).q (nth gmats 0 []) ∧ imageOk r1star (nth P.cens 1 ⟨[], 0, true⟩).q (nth gmats 1 []) ∧ imageOk r1star (nth P.cens 2 ⟨[], 0, true⟩).q (nth gmats 2 []) ∧ imageOk rp2 (nth P.cens 3 ⟨[], 0, true⟩).q (nth gmats 3 []) := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- the kappa coefficients are as defined (a0 = F(n_A(0,0), R1*), a1 = 2 (F(n_A(1/2,0), R1*) - a0)), beta = -7/4. -/
theorem kappa_ok : kappaOk P r1star beta = true := by native_decide

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- s0 = 2 = s_up, and five pieces fit at s_up = 2 (four corner pieces and the inverted piece RP2, separated by the planes
  c.x = 1). -/
theorem upper_ok : req (rR P.s0) ⟨2, 1⟩ = true ∧ req sUp (rR P.s0) = true ∧ upperOk rp2 sUp t5Up = true := by native_decide

end PackLean.D37N05.Tet
