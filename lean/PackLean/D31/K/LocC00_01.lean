-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC00

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC00_6 : List LTok := [.split, .split, .split, (.acc 7), .split, (.acc 16), .split, .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), .split, .split, .split, (.acc 7), (.acc 16), (.acc 43), (.acc 16), (.acc 43), .split, .split, (.acc 7), (.acc 16), (.acc 43), .split, (.acc 70), (.acc 70), .split, .split, .split, (.acc 7), .split, .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, .split, (.acc 7), (.acc 7), .split, (.acc 7), (.acc 7), .split, (.acc 25), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), .split, .split, (.acc 16)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC00_6 : lsegOk P .C fullC00 fdC0 kC00_6 tC00_6 kC00_7 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC00_7 : List LTok := [(.acc 16), .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC00_7 : lsegOk P .C fullC00 fdC0 kC00_7 tC00_7 kC00_8 = true := by decide +kernel

end PackLean.D31.Oct
