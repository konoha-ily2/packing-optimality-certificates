-- Generated automatically (lean/tools/export_d44.py). Do not edit by hand.
import PackLean.D44.Cubindod.Tok000
import PackLean.D44.Cubindod.Tok001
import PackLean.D44.Cubindod.Tok002
import PackLean.D44.Cubindod.Tok003
import PackLean.D44.Cubindod.Tok004
import PackLean.D44.Cubindod.Tok005
import PackLean.D44.Cubindod.Tok006
import PackLean.D44.Cubindod.Tok007
import PackLean.D44.Cubindod.Tok008
import PackLean.D44.Cubindod.Tok009
import PackLean.D44.Cubindod.Tok010
import PackLean.D44.Cubindod.Tok011
import PackLean.D44.Cubindod.Tok012
import PackLean.D44.Cubindod.Tok013
import PackLean.D44.Cubindod.Tok014
import PackLean.D44.Cubindod.Tok015
import PackLean.D44.Cubindod.Tok016
import PackLean.D44.Cubindod.Tok017
import PackLean.D44.Cubindod.Tok018
import PackLean.D44.Cubindod.Tok019
import PackLean.D44.Cubindod.Tok020
import PackLean.D44.Cubindod.Tok021
import PackLean.D44.Cubindod.Tok022
import PackLean.D44.Cubindod.Tok023
import PackLean.D44.Cubindod.Tok024
import PackLean.D44.Cubindod.Tok025
import PackLean.D44.Cubindod.Tok026
import PackLean.D44.Cubindod.Tok027
import PackLean.D44.Cubindod.Tok028
import PackLean.D44.Cubindod.Tok029
import PackLean.D44.Cubindod.Tok030
import PackLean.D44.Cubindod.Tok031
import PackLean.D44.Cubindod.Data

namespace PackLean.D44.Cubindod
open PackLean.D16

def toks : List Tok := toks000 ++ toks001 ++ toks002 ++ toks003 ++ toks004 ++ toks005 ++ toks006 ++ toks007 ++ toks008 ++ toks009 ++ toks010 ++ toks011 ++ toks012 ++ toks013 ++ toks014 ++ toks015 ++ toks016 ++ toks017 ++ toks018 ++ toks019 ++ toks020 ++ toks021 ++ toks022 ++ toks023 ++ toks024 ++ toks025 ++ toks026 ++ toks027 ++ toks028 ++ toks029 ++ toks030 ++ toks031

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
/-- Whole far region of cubindod_n02 (target S̄): the trees of the 4 charts close and every leaf passes.
  Accepted 46658, discarded 524, L 0 (same counts as the Python record). -/
theorem far_ok : farRun P toks = (true, 46658, 524, 0) := by native_decide

end PackLean.D44.Cubindod
