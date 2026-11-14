-- Kernel (decide +kernel) trial (written by hand, A8). Only the local edge y2 = +1 (4 single leaves, no weighted leaf).
-- The content of localOkT (candidate polynomials, substitution on the tube edge, division by ρ, tree walk) written out for one edge.
-- Stopped on 2026-11-14 after 2 min at 10.7 GB of memory (no conclusion); see Local1.lean and Local2.lean.
import PackLean.D30S3.Local

namespace PackLean.D30S3
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem kloc_y2p : (let RN := rotPoly P.ps P.nb
    let D := P.rden
    let r0 := X.rho0.1 * D / (X.rho0.2 : Int)
    let c : FCtx := ⟨RN.1, RN.2, faceX P.nb X 1 1, kScale X⟩
    let s := (faces.getD 2 []).foldl (lstepT P X D cands c) ⟨[⟨[0, -D, -D], [r0, D, D]⟩], true, 0, 0, 0⟩
    (s.ok, s.stack.isEmpty, s.nS, s.nM)) = (true, true, 4, 0) := by decide +kernel

end PackLean.D30S3
