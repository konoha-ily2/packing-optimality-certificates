-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC30

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC30_0 : List LTok := [.split, .split, .split, .split, (.acc 7), .split, (.acc 25), (.acc 79), .split, (.acc 7), (.acc 25), .split, .split, (.acc 7), (.acc 25), .split, (.acc 7), (.acc 25), .split, .split, .split, (.acc 7), .split, (.acc 25), (.acc 79), .split, (.acc 7), (.acc 25), .split, .split, (.acc 7), (.acc 25), .split, (.acc 7), (.acc 25)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC30_0 : lsegOk P .C fullC30 fdC3 kC30_0 tC30_0 kC30_1 = true := by decide +kernel

end PackLean.D31.Oct
