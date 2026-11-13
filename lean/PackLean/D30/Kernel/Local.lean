-- Kernel (decide +kernel) trial (hand-written, Q58). Only the cubinico local face x = +1 (4 leaves).
-- The content of localOk (candidate polynomials, substitution into the face, walking the tree) written out for one face.
import PackLean.D30.Local

namespace PackLean.D30
open PackLean.D16
open PackLean.D28 (Poly fIsZero)

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The tree of face x = +1 closes and all 4 leaves pass. -/
theorem kloc_xp : (let k := P.nb
    let RN := rotPoly P.ps k
    let polys := cands.map (candPolys P RN.1 RN.2)
    let D := P.rden
    let Hs : FacePolys := polys.map (fun (y : Poly × List Poly) =>
      (faceSub 0 1 1 y.1, y.2.map (fun a =>
        let z := fIsZero (constTerm k a)
        (z, faceSub 0 1 (if z then 1 else 0) a))))
    let s := (faces.headD []).foldl (lstep P D Hs) ⟨[⟨[0, -D, -D], [P.r0, D, D]⟩], true, 0⟩
    (s.ok, s.stack.isEmpty, s.nAcc)) = (true, true, 4) := by decide +kernel

end PackLean.D30
