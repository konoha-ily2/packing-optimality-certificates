-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Icoinico.Tok000
import PackLean.D44.Icoinico.Tok001
import PackLean.D44.Icoinico.Tok002
import PackLean.D44.Icoinico.Tok003
import PackLean.D44.Icoinico.Tok004
import PackLean.D44.Icoinico.Tok005
import PackLean.D44.Icoinico.Tok006
import PackLean.D44.Icoinico.Tok007
import PackLean.D44.Icoinico.Tok008
import PackLean.D44.Icoinico.Tok009
import PackLean.D44.Icoinico.Tok010
import PackLean.D44.Icoinico.Tok011
import PackLean.D44.Icoinico.Tok012
import PackLean.D44.Icoinico.Tok013
import PackLean.D44.Icoinico.Tok014
import PackLean.D44.Icoinico.Tok015
import PackLean.D44.Icoinico.Tok016
import PackLean.D44.Icoinico.Tok017
import PackLean.D44.Icoinico.Tok018
import PackLean.D44.Icoinico.Tok019
import PackLean.D44.Icoinico.Tok020
import PackLean.D44.Icoinico.Tok021
import PackLean.D44.Icoinico.Tok022
import PackLean.D44.Icoinico.Data

namespace PackLean.D44.Icoinico
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010 ++ toks011 ++ toks012 ++ toks013 ++ toks014 ++ toks015 ++ toks016 ++ toks017 ++ toks018 ++ toks019 ++ toks020 ++ toks021 ++ toks022

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of icoinico_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted 33221, discarded 740, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 33221, 740, 8) := by native_decide

end PackLean.D44.Icoinico
