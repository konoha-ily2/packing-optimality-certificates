-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey10

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_975 : List LTok := [(.acc 8), (.acc 5), .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 2), .split, (.acc 2), .split, .split, .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_975 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_975 t10_975 k10_976 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_976 : List LTok := [(.acc 8), .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12), (.acc 8), (.acc 8), .split, (.acc 2), .split, (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_976 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_976 t10_976 k10_977 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_977 : List LTok := [.split, .split, .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_977 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_977 t10_977 k10_978 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_978 : List LTok := [(.acc 12), (.acc 8), (.acc 8), .split, .split, (.acc 2), .split, (.acc 2), .split, .split, .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_978 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_978 t10_978 k10_979 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_979 : List LTok := [(.acc 8), .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12), (.acc 8), (.acc 8), .split, (.acc 2), .split, (.acc 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_979 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_979 t10_979 k10_980 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_980 : List LTok := [.split, .split, .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, .split, (.acc 0), (.acc 12), (.acc 8), .split, .split, (.acc 0)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_980 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_980 t10_980 k10_981 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_981 : List LTok := [(.acc 12), (.acc 8), (.acc 8), (.acc 14), (.acc 0), .split, .split, .split, .split, .split, (.acc 9), (.acc 12), (.acc 13), .split, .split, (.acc 9), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_981 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_981 t10_981 k10_982 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_982 : List LTok := [(.acc 13), .split, .split, .split, (.acc 9), (.acc 12), (.acc 13), .split, .split, (.acc 9), (.acc 12), (.acc 13), .split, .split, .split, (.acc 8), (.acc 12), .split, .split, (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_982 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_982 t10_982 k10_983 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t10_983 : List LTok := [(.acc 12), (.acc 12), .split, .split, (.acc 8), (.acc 12), .split, .split, (.acc 8), (.acc 12), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s10_983 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k10_983 t10_983 [] = true := by
  decide +kernel

end PackLean.D40.Tet
