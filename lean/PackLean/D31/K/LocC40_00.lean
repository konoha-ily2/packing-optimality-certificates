-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC40

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC40_0 : List LTok := [(.acc 79)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC40_0 : lsegOk P .C fullC40 fdC4 kC40_0 tC40_0 kC40_1 = true := by decide +kernel

end PackLean.D31.Oct
