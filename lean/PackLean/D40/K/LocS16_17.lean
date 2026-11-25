-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey16

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_255 : List LTok := [.split, .split, .split, .split, (.acc 15), (.acc 13), (.acc 15), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, .split, (.acc 15), (.acc 13), (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_255 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_255 t16_255 k16_256 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_256 : List LTok := [.split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, (.acc 15), .split, (.acc 15), (.acc 15), .split, .split, .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_256 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_256 t16_256 k16_257 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_257 : List LTok := [.split, (.acc 15), (.acc 15), (.acc 15), .split, .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13), (.acc 15), .split, .split, (.acc 15), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_257 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_257 t16_257 k16_258 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_258 : List LTok := [.split, (.acc 15), (.acc 13), (.acc 17), .split, (.acc 15), .split, (.acc 15), (.acc 15), (.acc 17), .split, (.acc 15), .split, (.acc 15), (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_258 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_258 t16_258 k16_259 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_259 : List LTok := [.split, .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, (.acc 15), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_259 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_259 t16_259 k16_260 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_260 : List LTok := [.split, (.acc 15), (.acc 13), .split, (.acc 17), .split, .split, (.acc 17), (.acc 13), (.acc 17), .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_260 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_260 t16_260 k16_261 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_261 : List LTok := [(.acc 15), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), (.acc 17), .split, .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_261 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_261 t16_261 k16_262 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_262 : List LTok := [.split, (.acc 15), (.acc 13), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, .split, (.acc 17), (.acc 13), (.acc 17), .split, .split, (.acc 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_262 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_262 t16_262 k16_263 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_263 : List LTok := [(.acc 13), (.acc 17), .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, (.acc 15), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_263 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_263 t16_263 k16_264 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_264 : List LTok := [.split, (.acc 15), (.acc 13), (.acc 17), .split, .split, .split, (.acc 17), .split, (.acc 15), .split, (.acc 17), (.acc 17), (.acc 17), .split, .split, (.acc 17), .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_264 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_264 t16_264 k16_265 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_265 : List LTok := [.split, .split, .split, .split, (.acc 17), (.acc 13), (.acc 17), .split, .split, (.acc 17), (.acc 13), (.acc 17), .split, .split, .split, (.acc 17), (.acc 13), (.acc 17), .split, .split, (.acc 17)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_265 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_265 t16_265 k16_266 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_266 : List LTok := [(.acc 13), (.acc 17), (.acc 17), .split, (.acc 15), .split, (.acc 15), .split, .split, .split, .split, (.acc 15), .split, (.acc 15), (.acc 15), (.acc 15), .split, .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_266 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_266 t16_266 k16_267 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_267 : List LTok := [.split, (.acc 15), .split, .split, .split, .split, (.acc 15), (.acc 13), (.acc 15), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), (.acc 17), .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_267 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_267 t16_267 k16_268 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_268 : List LTok := [.split, (.acc 15), (.acc 15), (.acc 17), .split, .split, .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_268 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_268 t16_268 k16_269 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t16_269 : List LTok := [(.acc 13), .split, .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, (.acc 15), (.acc 13), .split, (.acc 15), (.acc 13), .split, .split, .split, .split, .split, .split, (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s16_269 : lsegOk P ce1.tube (fullW P ce1.tube) it1 k16_269 t16_269 k16_270 = true := by
  decide +kernel

end PackLean.D40.Tet
