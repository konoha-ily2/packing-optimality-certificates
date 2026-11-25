-- 自動で書き出したもの（lean/tools/export_d31.py --kseg）。手で直さない。
import PackLean.D31.K.KeyC10

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC10_6 : List LTok := [.split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), .split, .split, .split, .split, .split, .split, .split, (.acc 25), (.acc 43), (.acc 25), .split, .split, (.acc 25), (.acc 43)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC10_6 : lsegOk P .C fullC10 fdC1 kC10_6 tC10_6 kC10_7 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC10_7 : List LTok := [(.acc 25), .split, .split, .split, (.acc 25), (.acc 43), (.acc 70), .split, .split, (.acc 25), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, .split, (.acc 25), (.acc 79), (.acc 43), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, .split, (.acc 70), (.acc 70), (.acc 79), (.acc 43), .split, (.acc 70), (.acc 43), .split, .split, .split, (.acc 7)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC10_7 : lsegOk P .C fullC10 fdC1 kC10_7 tC10_7 kC10_8 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tC10_8 : List LTok := [.split, (.acc 7), (.acc 7), .split, (.acc 25), .split, .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, (.acc 79), .split, (.acc 79), (.acc 79), .split, .split, (.acc 16), (.acc 16), .split, (.acc 70), (.acc 70)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sC10_8 : lsegOk P .C fullC10 fdC1 kC10_8 tC10_8 kC10_9 = true := by decide +kernel

end PackLean.D31.Oct
