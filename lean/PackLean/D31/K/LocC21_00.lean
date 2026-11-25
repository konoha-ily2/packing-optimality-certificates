-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC21

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC21_0 : List LTok := [.split, .split, .split, .split, .split, (.acc 39), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, .split, .split, (.acc 39), (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39), .split, .split, (.acc 30), (.acc 39), .split, (.acc 30), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC21_0 : lsegOk P .C fullC21 fdC2 kC21_0 tC21_0 kC21_1 = true := by decide +kernel

end PackLean.D31.Oct
