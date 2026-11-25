-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ40

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ40_0 : List LTok := [.split, .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 4), (.acc 8), (.acc 8), .split, .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8), .split, (.acc 6), .split, .split, (.acc 17), (.acc 8), (.acc 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ40_0 : lsegOk P .J fullJ40 fdJ4 kJ40_0 tJ40_0 kJ40_1 = true := by decide +kernel

end PackLean.D31.Oct
