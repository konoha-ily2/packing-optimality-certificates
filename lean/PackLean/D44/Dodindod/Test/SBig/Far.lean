-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Dodindod.Test.SBig.Tok000
import PackLean.D44.Dodindod.Test.SBig.Tok001
import PackLean.D44.Dodindod.Test.SBig.Tok002
import PackLean.D44.Dodindod.Test.SBig.Tok003
import PackLean.D44.Dodindod.Test.SBig.Tok004
import PackLean.D44.Dodindod.Test.SBig.Tok005
import PackLean.D44.Dodindod.Test.SBig.Tok006
import PackLean.D44.Dodindod.Test.SBig.Tok007
import PackLean.D44.Dodindod.Test.SBig.Tok008
import PackLean.D44.Dodindod.Test.SBig.Tok009
import PackLean.D44.Dodindod.Test.SBig.Tok010
import PackLean.D44.Dodindod.Test.SBig.Tok011
import PackLean.D44.Dodindod.Test.SBig.Tok012
import PackLean.D44.Dodindod.Test.SBig.Tok013
import PackLean.D44.Dodindod.Test.SBig.Tok014
import PackLean.D44.Dodindod.Test.SBig.Tok015
import PackLean.D44.Dodindod.Test.SBig.Tok016
import PackLean.D44.Dodindod.Test.SBig.Tok017
import PackLean.D44.Dodindod.Test.SBig.Tok018
import PackLean.D44.Dodindod.Test.SBig.Tok019
import PackLean.D44.Dodindod.Test.SBig.Tok020
import PackLean.D44.Dodindod.Test.SBig.Tok021
import PackLean.D44.Dodindod.Test.SBig.Tok022
import PackLean.D44.Dodindod.Test.SBig.Tok023
import PackLean.D44.Dodindod.Test.SBig.Tok024
import PackLean.D44.Dodindod.Test.SBig.Tok025
import PackLean.D44.Dodindod.Test.SBig.Tok026
import PackLean.D44.Dodindod.Test.SBig.Tok027
import PackLean.D44.Dodindod.Test.SBig.Tok028
import PackLean.D44.Dodindod.Test.SBig.Tok029
import PackLean.D44.Dodindod.Test.SBig.Tok030
import PackLean.D44.Dodindod.Test.SBig.Tok031
import PackLean.D44.Dodindod.Test.SBig.Tok032
import PackLean.D44.Dodindod.Test.SBig.Tok033
import PackLean.D44.Dodindod.Test.SBig.Tok034
import PackLean.D44.Dodindod.Test.SBig.Tok035
import PackLean.D44.Dodindod.Test.SBig.Tok036
import PackLean.D44.Dodindod.Test.SBig.Data

namespace PackLean.D44.Dodindod.Test.SBig
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010 ++ toks011 ++ toks012 ++ toks013 ++ toks014 ++ toks015 ++ toks016 ++ toks017 ++ toks018 ++ toks019 ++ toks020 ++ toks021 ++ toks022 ++ toks023 ++ toks024 ++ toks025 ++ toks026 ++ toks027 ++ toks028 ++ toks029 ++ toks030 ++ toks031 ++ toks032 ++ toks033 ++ toks034 ++ toks035 ++ toks036

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of dodindod_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted 52461, discarded 2866, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 52461, 2866, 8) := by native_decide

end PackLean.D44.Dodindod.Test.SBig
