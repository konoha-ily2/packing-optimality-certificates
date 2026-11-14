-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.
import PackLean.D30X.Cub.Tok000
import PackLean.D30X.Cub.Tok001
import PackLean.D30X.Cub.Tok002
import PackLean.D30X.Cub.Data

namespace PackLean.D30X.Cub
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of dodincub_n02: the trees of the 4 charts close and every leaf passes. Accepted 3347, discarded 449, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 3347, 449, 8) := by native_decide

end PackLean.D30X.Cub
