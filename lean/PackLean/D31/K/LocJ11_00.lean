-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ11

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ11_0 : List LTok := [.split, .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), (.acc 66), (.acc 63), .split, .split, (.acc 12), .split, .split, (.acc 65), (.acc 12), (.acc 63), .split, (.acc 12), .split, .split, (.acc 65), .split, (.acc 66), .split, .split, (.acc 12), (.acc 63), (.acc 66), (.acc 63)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ11_0 : lsegOk P .J fullJ11 fdJ1 kJ11_0 tJ11_0 kJ11_1 = true := by decide +kernel

end PackLean.D31.Oct
