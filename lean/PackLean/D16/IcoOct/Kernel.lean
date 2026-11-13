-- Kernel (decide +kernel) trial (hand-written). The first 40 tokens of the icoinoct far sequence (2 accepted, 16 discarded).
-- The first 200 tokens (66 accepted, 30 discarded) did not finish within 12 minutes and were stopped (2026-11-12).
import PackLean.D16.IcoOct.Far

namespace PackLean.D16.IcoOct
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Walking the first 40 tokens of the sequence, all leaves so far pass (2 accepted, 16 discarded). -/
theorem kfar40 : (let s := (toks.take 40).foldl (wstep P) ⟨rRoots P.rden, true, 0, 0, 0⟩; (s.ok, s.nA, s.nD))
    = (true, 2, 16) := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The first 100 tokens of the sequence (19 accepted, 28 discarded). -/
theorem kfar100 : (let s := (toks.take 100).foldl (wstep P) ⟨rRoots P.rden, true, 0, 0, 0⟩; (s.ok, s.nA, s.nD))
    = (true, 19, 28) := by decide +kernel

end PackLean.D16.IcoOct
