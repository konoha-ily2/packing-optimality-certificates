-- Kernel (decide +kernel) trial (written by hand, A8). The first 40 items of the far sequence (7 accepted, 11 discarded), and
-- insideTube for 3 tube leaves (L boxes of the record).
import PackLean.D30S3.Far

namespace PackLean.D30S3
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem kfar40 : (let s := (toks.take 40).foldl (wstepT P X) ⟨PackLean.D16.rRoots P.rden, true, 0, 0, 0⟩
    (s.ok, s.nA, s.nD, s.nL)) = (true, 7, 11, 0) := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem ktube : (insideTube P X ⟨0, -274877906944, -274877906944, -274877906944, 0, 0, 0⟩ &&
    insideTube P X ⟨0, -274877906944, 0, -274877906944, 0, 274877906944, 0⟩ &&
    insideTube P X ⟨0, -377957122048, -171798691840, -274877906944, -343597383680, -137438953472, -206158430208⟩ &&
    !insideTube P X ⟨0, -549755813888, -274877906944, -274877906944, 0, 0, 0⟩) = true := by decide +kernel

end PackLean.D30S3
