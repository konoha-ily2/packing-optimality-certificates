-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey05

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_285 : List LTok := [.split, (.acc 13), (.acc 9), .split, .split, (.acc 13), (.acc 9), .split, (.acc 13), (.acc 9), (.acc 12), (.acc 9), .split, .split, .split, .split, (.acc 12), .split, .split, (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_285 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_285 t05_285 k05_286 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_286 : List LTok := [(.acc 9), (.acc 12), .split, (.acc 12), .split, .split, (.acc 13), (.acc 12), (.acc 12), (.acc 12), (.acc 9), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_286 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_286 t05_286 k05_287 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_287 : List LTok := [.split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), (.acc 12), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_287 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_287 t05_287 k05_288 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_288 : List LTok := [(.acc 9), .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), (.acc 9), .split, .split, (.acc 11), (.acc 9), (.acc 9), (.acc 12), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_288 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_288 t05_288 k05_289 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_289 : List LTok := [.split, .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), (.acc 12), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_289 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_289 t05_289 k05_290 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_290 : List LTok := [(.acc 9), .split, .split, .split, .split, .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), .split, .split, (.acc 11), (.acc 9), .split, (.acc 11), (.acc 9), (.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_290 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_290 t05_290 k05_291 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t05_291 : List LTok := [(.acc 9), (.acc 9), (.acc 12), (.acc 9), (.acc 9)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s05_291 : lsegOk P ce0.tube (fullW P ce0.tube) it0 k05_291 t05_291 [] = true := by
  decide +kernel

end PackLean.D40.Tet
