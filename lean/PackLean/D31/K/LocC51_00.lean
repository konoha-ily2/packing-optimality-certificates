-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC51

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC51_0 : List LTok := [(.acc 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC51_0 : lsegOk P .C fullC51 fdC5 kC51_0 tC51_0 kC51_1 = true := by decide +kernel

end PackLean.D31.Oct
