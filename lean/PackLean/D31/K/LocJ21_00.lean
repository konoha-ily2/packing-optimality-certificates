-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ21

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ21_0 : List LTok := [.split, .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78), .split, .split, (.acc 60), (.acc 78), .split, (.acc 60), (.acc 78)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ21_0 : lsegOk P .J fullJ21 fdJ2 kJ21_0 tJ21_0 kJ21_1 = true := by decide +kernel

end PackLean.D31.Oct
