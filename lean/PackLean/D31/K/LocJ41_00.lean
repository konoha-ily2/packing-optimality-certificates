-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ41

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ41_0 : List LTok := [.split, (.acc 3), .split, (.acc 3), .split, (.acc 3), (.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ41_0 : lsegOk P .J fullJ41 fdJ4 kJ41_0 tJ41_0 kJ41_1 = true := by decide +kernel

end PackLean.D31.Oct
