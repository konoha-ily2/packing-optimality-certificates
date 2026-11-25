-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC41

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC41_0 : List LTok := [.split, .split, .split, .split, .split, (.acc 75), (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39), .split, .split, .split, .split, (.acc 75), (.acc 66), (.acc 39), .split, (.acc 66), (.acc 39), .split, .split, (.acc 66), (.acc 39), .split, (.acc 75), (.acc 39)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC41_0 : lsegOk P .C fullC41 fdC4 kC41_0 tC41_0 kC41_1 = true := by decide +kernel

end PackLean.D31.Oct
