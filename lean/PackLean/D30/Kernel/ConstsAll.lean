-- Kernel (decide +kernel) trial (hand-written, Q58). All of the constant checks (including the 480 symmetry pairs).
-- Run at 11:51–11:53 (2026-11-13) and stopped after 1 minute when lean.exe exceeded 11 GB. Not passed (no conclusion).
import PackLean.D30.Data

namespace PackLean.D30
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The same proposition as `consts_ok`, by the kernel only. -/
theorem kconsts_ok : constsOk P = true := by decide +kernel

end PackLean.D30
