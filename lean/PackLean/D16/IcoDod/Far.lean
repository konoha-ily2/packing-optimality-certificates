-- Generated automatically (lean/tools/export_d16e.py). Do not edit by hand.
import PackLean.D16.IcoDod.Tok000
import PackLean.D16.IcoDod.Data

namespace PackLean.D16.IcoDod
open PackLean.D16

def toks : List Tok := toks000

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted 892, discarded 208, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 892, 208, 8) := by native_decide

end PackLean.D16.IcoDod
