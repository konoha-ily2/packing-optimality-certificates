-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ31

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ31_0 : List LTok := [.split, .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, (.acc 72), (.acc 66), .split, .split, .split, .split, (.acc 72), (.acc 63), (.acc 72), (.acc 66), .split, .split, (.acc 72), (.acc 72), (.acc 66)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ31_0 : lsegOk P .J fullJ31 fdJ3 kJ31_0 tJ31_0 kJ31_1 = true := by decide +kernel

end PackLean.D31.Oct
