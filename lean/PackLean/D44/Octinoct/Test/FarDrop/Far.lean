-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Octinoct.Test.FarDrop.Tok000
import PackLean.D44.Octinoct.Test.FarDrop.Tok001
import PackLean.D44.Octinoct.Test.FarDrop.Tok002
import PackLean.D44.Octinoct.Test.FarDrop.Tok003
import PackLean.D44.Octinoct.Test.FarDrop.Tok004
import PackLean.D44.Octinoct.Test.FarDrop.Tok005
import PackLean.D44.Octinoct.Test.FarDrop.Tok006
import PackLean.D44.Octinoct.Test.FarDrop.Tok007
import PackLean.D44.Octinoct.Test.FarDrop.Tok008
import PackLean.D44.Octinoct.Test.FarDrop.Tok009
import PackLean.D44.Octinoct.Test.FarDrop.Tok010
import PackLean.D44.Octinoct.Test.FarDrop.Tok011
import PackLean.D44.Octinoct.Test.FarDrop.Data

namespace PackLean.D44.Octinoct.Test.FarDrop
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010 ++ toks011

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of octinoct_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted 16050, discarded 673, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 16050, 673, 8) := by native_decide

end PackLean.D44.Octinoct.Test.FarDrop
