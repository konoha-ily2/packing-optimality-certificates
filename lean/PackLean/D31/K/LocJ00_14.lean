-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyJ00

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ00_84 : List LTok := [(.acc 17), .split, .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), (.acc 17), .split, .split, (.acc 8), .split, .split, .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), .split, .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), .split, .split, (.acc 61), (.acc 17), .split, (.acc 61), (.acc 17), (.acc 17), (.acc 17), .split, .split, .split, .split, (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ00_84 : lsegOk P .J fullJ00 fdJ0 kJ00_84 tJ00_84 kJ00_85 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tJ00_85 : List LTok := [(.acc 70), .split, (.acc 70), (.acc 70), .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 70), (.acc 70), .split, .split, .split, (.acc 70), (.acc 70), (.acc 70), (.acc 70), .split, .split, .split, (.acc 70), (.acc 70), .split, (.acc 70), (.acc 70), .split, .split, .split, (.acc 70), (.acc 70), (.acc 70), .split, .split, (.acc 70), (.acc 70), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sJ00_85 : lsegOk P .J fullJ00 fdJ0 kJ00_85 tJ00_85 kJ00_86 = true := by decide +kernel

end PackLean.D31.Oct
