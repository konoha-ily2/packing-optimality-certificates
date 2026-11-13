-- Generated automatically (lean/tools/export_d30.py). Do not edit by hand.
import PackLean.D30.Test.Disc.Tok000
import PackLean.D30.Test.Disc.Tok001
import PackLean.D30.Test.Disc.Tok002
import PackLean.D30.Test.Disc.Tok003
import PackLean.D30.Test.Disc.Data

namespace PackLean.D30.Test.Disc
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted 4194, discarded 789, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 4194, 789, 8) := by native_decide

end PackLean.D30.Test.Disc
