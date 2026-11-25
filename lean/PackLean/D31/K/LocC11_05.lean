-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC11

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC11_30 : List LTok := [.split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 57), (.acc 30)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC11_30 : lsegOk P .C fullC11 fdC1 kC11_30 tC11_30 kC11_31 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC11_31 : List LTok := [(.acc 30), .split, .split, (.acc 57), (.acc 30), (.acc 30), (.acc 30), (.acc 30), .split, .split, (.acc 3), .split, (.acc 30), (.acc 30), (.acc 30), .split, .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, (.acc 57), (.acc 30), (.acc 30), (.acc 30), (.acc 30), .split, .split, (.acc 3), .split, (.acc 30), (.acc 30), (.acc 30), .split, .split, .split, .split, .split, .split, (.acc 66), .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC11_31 : lsegOk P .C fullC11 fdC1 kC11_31 tC11_31 kC11_32 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC11_32 : List LTok := [.split, (.acc 66), (.acc 39), (.acc 39), (.acc 39), .split, .split, (.acc 66), (.acc 39), (.acc 39), .split, .split, .split, .split, (.acc 66), .split, .split, .split, (.acc 66), (.acc 39), (.acc 66), .split, .split, (.acc 66), (.acc 39), (.acc 66), (.acc 39), (.acc 39), .split, .split, (.acc 66), (.acc 39), (.acc 39), .split, .split, .split, .split, .split, .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), (.acc 39), (.acc 39), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC11_32 : lsegOk P .C fullC11 fdC1 kC11_32 tC11_32 kC11_33 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC11_33 : List LTok := [.split, .split, (.acc 66), (.acc 39), (.acc 39), .split, .split, .split, .split, .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), (.acc 39), (.acc 39), (.acc 39), .split, .split, (.acc 66), (.acc 39), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC11_33 : lsegOk P .C fullC11 fdC1 kC11_33 tC11_33 kC11_34 = true := by decide +kernel

end PackLean.D31.Oct
