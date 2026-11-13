-- Kernel (decide +kernel) trial (hand-written, Q58). Only the beginning of the cubinico far sequence.
import PackLean.D30.Far

namespace PackLean.D30
open PackLean.D16

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Following the first 40 tokens of the sequence, all leaves so far pass (2 accepted, 15 discarded). -/
theorem kfar40 : (let s := (toks.take 40).foldl (wstep P) ⟨rRoots P.rden, true, 0, 0, 0⟩; (s.ok, s.nA, s.nD))
    = (true, 2, 15) := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- The first 100 tokens of the sequence (21 accepted, 27 discarded). -/
theorem kfar100 : (let s := (toks.take 100).foldl (wstep P) ⟨rRoots P.rden, true, 0, 0, 0⟩; (s.ok, s.nA, s.nD))
    = (true, 21, 27) := by decide +kernel

end PackLean.D30
