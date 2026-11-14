-- Generated automatically (lean/tools/export_d30x.py). Do not edit by hand.
import PackLean.D30X.Oct.Test.Sum.Tok000
import PackLean.D30X.Oct.Test.Sum.Tok001
import PackLean.D30X.Oct.Test.Sum.Tok002
import PackLean.D30X.Oct.Test.Sum.Tok003
import PackLean.D30X.Oct.Test.Sum.Tok004
import PackLean.D30X.Oct.Test.Sum.Tok005
import PackLean.D30X.Oct.Test.Sum.Tok006
import PackLean.D30X.Oct.Test.Sum.Tok007
import PackLean.D30X.Oct.Test.Sum.Tok008
import PackLean.D30X.Oct.Test.Sum.Tok009
import PackLean.D30X.Oct.Test.Sum.Tok010
import PackLean.D30X.Oct.Test.Sum.Data

namespace PackLean.D30X.Oct.Test.Sum
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of dodinoct_n02: the trees of the 4 charts close and every leaf passes. Accepted 15250, discarded 727, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 15250, 727, 8) := by native_decide

end PackLean.D30X.Oct.Test.Sum
