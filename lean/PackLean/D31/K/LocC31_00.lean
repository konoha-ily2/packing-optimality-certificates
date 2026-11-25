-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC31

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC31_0 : List LTok := [(.acc 75)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC31_0 : lsegOk P .C fullC31 fdC3 kC31_0 tC31_0 kC31_1 = true := by decide +kernel

end PackLean.D31.Oct
