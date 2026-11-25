-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ20

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ20_0 : List LTok := [.split, .split, .split, (.acc 6), (.acc 24), .split, (.acc 6), (.acc 24), .split, .split, (.acc 6), (.acc 24), .split, (.acc 6), (.acc 24)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ20_0 : lsegOk P .J fullJ20 fdJ2 kJ20_0 tJ20_0 kJ20_1 = true := by decide +kernel

end PackLean.D31.Oct
