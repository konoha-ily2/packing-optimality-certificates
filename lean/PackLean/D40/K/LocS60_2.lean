-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey60

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_30 : List LTok := [.split, .split, (.acc 5), (.acc 20), (.acc 22), .split, (.acc 23), .split, .split, (.acc 7), (.acc 20), (.acc 22), .split, .split, (.acc 23), .split, .split, (.acc 5), (.acc 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_30 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_30 t60_30 k60_31 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_31 : List LTok := [(.acc 22), .split, (.acc 23), .split, .split, (.acc 7), (.acc 20), (.acc 22), (.acc 20), (.acc 22), .split, (.acc 23), .split, .split, .split, .split, .split, (.acc 23), .split, .split, (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_31 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_31 t60_31 k60_32 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_32 : List LTok := [(.acc 20), (.acc 22), .split, (.acc 23), .split, .split, (.acc 5), (.acc 20), (.acc 22), .split, .split, (.acc 23), .split, .split, (.acc 7), (.acc 20), (.acc 22)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_32 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_32 t60_32 k60_33 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_33 : List LTok := [.split, (.acc 23), .split, .split, (.acc 7), (.acc 20), (.acc 22), (.acc 20), (.acc 22), .split, .split, .split, .split, .split, .split, (.acc 12), .split, (.acc 4), (.acc 15), (.acc 14)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_33 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_33 t60_33 k60_34 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_34 : List LTok := [.split, .split, (.acc 12), .split, (.acc 4), (.acc 15), (.acc 14), .split, .split, .split, (.acc 12), .split, (.acc 4), (.acc 15), (.acc 14), .split, .split, (.acc 12), .split, (.acc 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_34 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_34 t60_34 k60_35 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_35 : List LTok := [(.acc 14), (.acc 14), .split, .split, .split, .split, (.acc 11), (.acc 11), (.acc 11), .split, .split, (.acc 11), (.acc 11), (.acc 11), .split, .split, .split, (.acc 11), (.acc 11)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_35 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_35 t60_35 k60_36 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_36 : List LTok := [(.acc 11), .split, .split, (.acc 11), (.acc 11), (.acc 11), .split, .split, .split, .split, .split, .split, (.acc 4), .split, (.acc 2), (.acc 2), (.acc 0), (.acc 1), .split, .split, .split, (.acc 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_36 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_36 t60_36 k60_37 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_37 : List LTok := [.split, (.acc 1), (.acc 2), (.acc 0), (.acc 1), .split, .split, .split, .split, (.acc 4), .split, (.acc 2), (.acc 1), (.acc 0), (.acc 1), .split, .split, .split, (.acc 4)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_37 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_37 t60_37 k60_38 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_38 : List LTok := [.split, (.acc 1), (.acc 2), (.acc 0), (.acc 1), .split, .split, .split, .split, .split, (.acc 8), (.acc 20), (.acc 17), (.acc 25), .split, .split, .split, (.acc 8), (.acc 20)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_38 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_38 t60_38 k60_39 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_39 : List LTok := [(.acc 17), (.acc 25), .split, .split, .split, .split, (.acc 8), (.acc 20), (.acc 17), (.acc 25), .split, .split, .split, (.acc 8), (.acc 20), (.acc 17), (.acc 25)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_39 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_39 t60_39 k60_40 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_40 : List LTok := [.split, .split, .split, .split, .split, .split, .split, (.acc 10), .split, (.acc 15), .split, (.acc 4), (.acc 10), .split, (.acc 10), .split, (.acc 15), .split, (.acc 4), (.acc 10), .split, .split, (.acc 10), .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_40 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_40 t60_40 k60_41 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_41 : List LTok := [.split, (.acc 4), (.acc 10), .split, (.acc 10), .split, (.acc 15), .split, (.acc 4), (.acc 10), .split, .split, .split, .split, (.acc 21), .split, (.acc 9), (.acc 19), .split, (.acc 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_41 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_41 t60_41 k60_42 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_42 : List LTok := [.split, (.acc 5), (.acc 20), .split, .split, (.acc 21), .split, (.acc 9), (.acc 19), .split, (.acc 6), .split, (.acc 5), (.acc 20), .split, .split, .split, (.acc 21), .split, (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_42 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_42 t60_42 k60_43 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_43 : List LTok := [(.acc 19), (.acc 6), .split, .split, (.acc 21), .split, (.acc 9), (.acc 19), (.acc 6), .split, .split, .split, .split, (.acc 3), .split, .split, (.acc 4), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_43 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_43 t60_43 k60_44 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t60_44 : List LTok := [(.acc 3), .split, (.acc 3), .split, .split, (.acc 4), .split, (.acc 3), (.acc 3), (.acc 3), .split, .split, (.acc 18), .split, .split, (.acc 4), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s60_44 : lsegOk P ce6.tube (fullW P ce6.tube) it6 k60_44 t60_44 k60_45 = true := by
  decide +kernel

end PackLean.D40.Tet
