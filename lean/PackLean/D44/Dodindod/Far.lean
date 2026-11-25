-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Dodindod.Tok000
import PackLean.D44.Dodindod.Tok001
import PackLean.D44.Dodindod.Tok002
import PackLean.D44.Dodindod.Tok003
import PackLean.D44.Dodindod.Tok004
import PackLean.D44.Dodindod.Tok005
import PackLean.D44.Dodindod.Tok006
import PackLean.D44.Dodindod.Tok007
import PackLean.D44.Dodindod.Tok008
import PackLean.D44.Dodindod.Tok009
import PackLean.D44.Dodindod.Tok010
import PackLean.D44.Dodindod.Tok011
import PackLean.D44.Dodindod.Tok012
import PackLean.D44.Dodindod.Tok013
import PackLean.D44.Dodindod.Tok014
import PackLean.D44.Dodindod.Tok015
import PackLean.D44.Dodindod.Tok016
import PackLean.D44.Dodindod.Tok017
import PackLean.D44.Dodindod.Tok018
import PackLean.D44.Dodindod.Tok019
import PackLean.D44.Dodindod.Tok020
import PackLean.D44.Dodindod.Tok021
import PackLean.D44.Dodindod.Tok022
import PackLean.D44.Dodindod.Tok023
import PackLean.D44.Dodindod.Tok024
import PackLean.D44.Dodindod.Tok025
import PackLean.D44.Dodindod.Tok026
import PackLean.D44.Dodindod.Tok027
import PackLean.D44.Dodindod.Tok028
import PackLean.D44.Dodindod.Tok029
import PackLean.D44.Dodindod.Tok030
import PackLean.D44.Dodindod.Tok031
import PackLean.D44.Dodindod.Tok032
import PackLean.D44.Dodindod.Tok033
import PackLean.D44.Dodindod.Tok034
import PackLean.D44.Dodindod.Tok035
import PackLean.D44.Dodindod.Tok036
import PackLean.D44.Dodindod.Data

namespace PackLean.D44.Dodindod
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010 ++ toks011 ++ toks012 ++ toks013 ++ toks014 ++ toks015 ++ toks016 ++ toks017 ++ toks018 ++ toks019 ++ toks020 ++ toks021 ++ toks022 ++ toks023 ++ toks024 ++ toks025 ++ toks026 ++ toks027 ++ toks028 ++ toks029 ++ toks030 ++ toks031 ++ toks032 ++ toks033 ++ toks034 ++ toks035 ++ toks036

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of dodindod_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted 52461, discarded 2866, L 8 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 52461, 2866, 8) := by native_decide

end PackLean.D44.Dodindod
