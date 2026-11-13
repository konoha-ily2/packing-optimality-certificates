-- Generated automatically (lean/tools/export_d16.py). Do not edit by hand.
import PackLean.D16.Test.DodIcoDrop.Tok000
import PackLean.D16.Test.DodIcoDrop.Tok001
import PackLean.D16.Test.DodIcoDrop.Tok002
import PackLean.D16.Test.DodIcoDrop.Tok003
import PackLean.D16.Test.DodIcoDrop.Tok004
import PackLean.D16.Test.DodIcoDrop.Data

namespace PackLean.D16.DodIco
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region: the trees of the 4 charts close and every leaf passes. Accepted 5558, discarded 1118, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 5558, 1118, 8) := by native_decide

end PackLean.D16.DodIco
