-- Generated automatically (lean/tools/export_d16e.py). Do not edit by hand.
import PackLean.D16.Test.OctDodLam.Tok000
import PackLean.D16.Test.OctDodLam.Tok001
import PackLean.D16.Test.OctDodLam.Data

namespace PackLean.D16.OctDod
open PackLean.D16

def toks : List Tok := toks000 ++ toks001

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted 1826, discarded 472, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 1826, 472, 8) := by native_decide

end PackLean.D16.OctDod
