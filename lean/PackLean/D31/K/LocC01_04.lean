-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC01

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC01_24 : List LTok := [.split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, (.acc 3), .split, .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC01_24 : lsegOk P .C fullC01 fdC0 kC01_24 tC01_24 kC01_25 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC01_25 : List LTok := [.split, (.acc 57), (.acc 30), .split, .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), .split, .split, (.acc 57), (.acc 30), .split, (.acc 57), (.acc 30), (.acc 30), .split, .split, .split, .split, (.acc 3), (.acc 30), (.acc 30), .split, .split, (.acc 3), (.acc 30), (.acc 30), .split, .split, .split, (.acc 3), (.acc 30), (.acc 30), .split, .split, (.acc 3), (.acc 30), (.acc 30), .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC01_25 : lsegOk P .C fullC01 fdC0 kC01_25 tC01_25 kC01_26 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC01_26 : List LTok := [(.acc 39), .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), (.acc 39), (.acc 39), .split, .split, (.acc 66), (.acc 39), (.acc 39), .split, .split, .split, .split, .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC01_26 : lsegOk P .C fullC01 fdC0 kC01_26 tC01_26 kC01_27 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC01_27 : List LTok := [(.acc 39), (.acc 39), .split, .split, (.acc 66), (.acc 39), (.acc 39), .split, .split, .split, .split, .split, (.acc 39), (.acc 39), (.acc 39), (.acc 39), .split, .split, .split, (.acc 39), (.acc 39), (.acc 39), (.acc 39), .split, .split, .split, .split, (.acc 39), (.acc 39), (.acc 39), (.acc 39), .split, .split, .split, (.acc 39), (.acc 39), (.acc 39), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC01_27 : lsegOk P .C fullC01 fdC0 kC01_27 tC01_27 kC01_28 = true := by decide +kernel

end PackLean.D31.Oct
