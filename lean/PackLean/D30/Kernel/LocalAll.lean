-- Kernel (decide +kernel) trial (hand-written, Q58). The whole local region (6 faces, 74 leaves, including the zero-order identities of the 8 candidates).
-- Run at 11:43–11:51 (2026-11-13) and stopped after 8 minutes when lean.exe reached 14 GB (2.7 GB of memory free). Not passed (no conclusion).
import PackLean.D30.Local

namespace PackLean.D30
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The same proposition as `local_ok`, by the kernel only. -/
theorem klocal_ok : localOk P cands faces = (true, 74) := by decide +kernel

end PackLean.D30
