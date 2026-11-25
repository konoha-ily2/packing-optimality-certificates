-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ10

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ10_0 : List LTok := [.split, .split, .split, .split, .split, .split, (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 13), (.acc 11), (.acc 17), (.acc 70), .split, .split, (.acc 10), (.acc 17), (.acc 70), .split, .split, .split, .split, .split, .split, .split, (.acc 17), (.acc 70), (.acc 16), .split, .split, (.acc 17), (.acc 70), (.acc 16), (.acc 11), (.acc 17), (.acc 70), .split, .split, .split, (.acc 10), (.acc 11), (.acc 17), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ10_0 : lsegOk P .J fullJ10 fdJ1 kJ10_0 tJ10_0 kJ10_1 = true := by decide +kernel

end PackLean.D31.Oct
