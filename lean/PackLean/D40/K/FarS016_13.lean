-- 自動で書き出したもの（lean/tools/export_d40_k.py）。手で直さない。
import PackLean.D40.K.FarKey016

namespace PackLean.D40.Tet
open PackLean.D40

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049B_7 : List Tok := [.split, (.D 8), (.A 454), (.D 1), .split, .split, (.D 5), .split, (.A 454), (.D 5), (.D 1), .split, .split, .split, .split, (.D 4), (.A 454), (.D 4), (.D 1), .split, .split, .split, (.A 454), (.D 7), (.D 7), (.D 1), .split, .split, .split, (.D 1), .split, (.D 6), .split, (.D 6), (.A 876), .split, (.D 1)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s049B_7 : wsegOk P 1 nb049 kN049 k049B_7 t049B_7 k049B_8 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049B_8 : List Tok := [.split, (.D 10), .split, (.A 876), (.D 10), .split, .split, (.D 1), .split, .split, (.D 9), (.A 876), (.D 9), .split, (.D 1), .split, .split, (.A 876), (.D 3), (.D 3), .split, .split, .split, .split, .split, (.D 9), .split, (.D 9), (.A 114), (.D 2), .split, .split, (.D 5), .split, (.A 114), (.D 5), (.D 2), .split, .split, .split, .split, (.D 6)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s049B_8 : wsegOk P 1 nb049 kN049 k049B_8 t049B_8 k049B_9 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049B_9 : List Tok := [(.A 114), (.D 6), (.D 2), .split, .split, .split, (.A 114), (.D 7), (.D 7), (.D 2), .split, .split, .split, (.D 2), .split, (.D 4), .split, (.D 4), (.A 909), .split, (.D 2), .split, (.D 10), .split, (.A 909), (.D 10), .split, .split, (.D 2), .split, .split, (.D 8), (.A 909), (.D 8), .split, (.D 2)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s049B_9 : wsegOk P 1 nb049 kN049 k049B_9 t049B_9 k049B_10 = true := by
  decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def t049B_10 : List Tok := [.split, .split, (.A 909), (.D 3), (.D 3)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem s049B_10 : wsegOk P 1 nb049 kN049 k049B_10 t049B_10 [] = true := by
  decide +kernel

end PackLean.D40.Tet
