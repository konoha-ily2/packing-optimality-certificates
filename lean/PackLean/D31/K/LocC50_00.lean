-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC50

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC50_0 : List LTok := [.split, .split, .split, .split, (.acc 7), .split, (.acc 16), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 16), .split, (.acc 7), (.acc 7), .split, .split, .split, (.acc 7), .split, (.acc 16), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 16), .split, (.acc 7), (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC50_0 : lsegOk P .C fullC50 fdC5 kC50_0 tC50_0 kC50_1 = true := by decide +kernel

end PackLean.D31.Oct
