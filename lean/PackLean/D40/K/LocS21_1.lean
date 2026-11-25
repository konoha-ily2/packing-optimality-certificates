-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.LocKey21

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_15 : List LTok := [.split, (.acc 11), .split, .split, .split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), .split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), (.acc 13), .split, .split, (.acc 11), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_15 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_15 t21_15 k21_16 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_16 : List LTok := [.split, (.acc 11), (.acc 13), (.acc 13), .split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), (.acc 9), (.acc 13), .split, .split, .split, .split, (.acc 11), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_16 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_16 t21_16 k21_17 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_17 : List LTok := [.split, (.acc 11), .split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), (.acc 13), .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), (.acc 13), (.acc 13)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_17 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_17 t21_17 k21_18 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_18 : List LTok := [.split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), (.acc 9), (.acc 13), (.acc 13), .split, .split, .split, (.acc 11), (.acc 13), .split, (.acc 11), .split, .split, .split, (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_18 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_18 t21_18 k21_19 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_19 : List LTok := [(.acc 13), .split, (.acc 11), (.acc 13), .split, .split, (.acc 7), (.acc 13), .split, (.acc 11), (.acc 13), (.acc 13), (.acc 13), .split, (.acc 10)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_19 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_19 t21_19 k21_20 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t21_20 : List LTok := [(.acc 12)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s21_20 : lsegOk P ce2.tube (fullW P ce2.tube) it2 k21_20 t21_20 [] = true := by
  decide +kernel

end PackLean.D40.Tet
