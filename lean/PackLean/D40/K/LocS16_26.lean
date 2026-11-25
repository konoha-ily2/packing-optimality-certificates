-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey16

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_390 : List LTok := [(.acc 13), (.acc 6), (.acc 1), (.acc 1), .split, .split, .split, (.acc 3), .split, .split, .split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_390 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_390 t16_390 k16_391 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_391 : List LTok := [(.acc 6), .split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, .split, (.acc 3), (.acc 13), (.acc 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_391 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_391 t16_391 k16_392 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_392 : List LTok := [.split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), (.acc 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_392 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_392 t16_392 k16_393 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_393 : List LTok := [(.acc 1), .split, .split, .split, .split, (.acc 3), .split, .split, .split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, (.acc 3), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_393 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_393 t16_393 k16_394 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_394 : List LTok := [(.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_394 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_394 t16_394 k16_395 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_395 : List LTok := [.split, .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), (.acc 1), (.acc 1), .split, .split, .split, (.acc 3), .split, .split, .split, .split, .split, (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_395 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_395 t16_395 k16_396 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_396 : List LTok := [(.acc 13), (.acc 6), .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, (.acc 3), (.acc 13), .split, (.acc 1), (.acc 13), .split, .split, (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_396 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_396 t16_396 k16_397 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_397 : List LTok := [(.acc 13), (.acc 6), .split, .split, .split, .split, (.acc 3), (.acc 13), .split, (.acc 1), (.acc 13), .split, .split, (.acc 3), (.acc 13), (.acc 6), .split, .split, .split, (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_397 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_397 t16_397 k16_398 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_398 : List LTok := [(.acc 13), .split, (.acc 1), (.acc 13), .split, .split, (.acc 3), (.acc 13), (.acc 6), (.acc 1), (.acc 1), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_398 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_398 t16_398 [] = true := by
  decide +kernel

end PackLean.D40.Tet
