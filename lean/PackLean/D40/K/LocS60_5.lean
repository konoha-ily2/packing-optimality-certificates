-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey60

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_75 : List LTok := [(.acc 2), (.acc 0), (.acc 1), .split, .split, .split, (.acc 4), .split, (.acc 2), (.acc 1), (.acc 0), (.acc 1), .split, .split, .split, .split, .split, (.acc 8), (.acc 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_75 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_75 t60_75 k60_76 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_76 : List LTok := [(.acc 17), (.acc 13), .split, .split, .split, (.acc 8), (.acc 20), (.acc 17), (.acc 13), .split, .split, .split, (.acc 8), (.acc 17), (.acc 13), .split, .split, (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_76 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_76 t60_76 k60_77 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_77 : List LTok := [(.acc 17), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_77 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_77 t60_77 [] = true := by
  decide +kernel

end PackLean.D40.Tet
