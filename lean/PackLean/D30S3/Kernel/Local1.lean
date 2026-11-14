-- Kernel (decide +kernel) trial (written by hand, A8). A small local part: the shape and degree-0 identities of one candidate (number 0)
-- (F(R*) = 0, F(t·n) ≡ 0, A_j(R*) ≥ 0). One edge (4 leaves) reached 10.7 GB after 2 min and was stopped on 2026-11-14 (Local.lean).
import PackLean.D30S3.Local

namespace PackLean.D30S3
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem kcand0 : candsOk P X (cands.take 1) = true := by decide +kernel

end PackLean.D30S3
