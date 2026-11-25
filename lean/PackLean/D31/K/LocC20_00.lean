-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC20

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC20_0 : List LTok := [(.acc 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC20_0 : lsegOk P .C fullC20 fdC2 kC20_0 tC20_0 kC20_1 = true := by decide +kernel

end PackLean.D31.Oct
