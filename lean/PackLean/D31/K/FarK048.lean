-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.K.FarKeyF019

namespace PackLean.D31.Oct
open PackLean.D31

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF019_6 : List Tok := [(.A 552), .split, (.A 912), .split, (.A 48), .split, .split, (.A 912), (.A 48), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), .split, (.A 1056), .split, (.A 1056), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, .split, (.A 480), .split, (.A 552), .split, .split, (.A 480), .split, (.A 552), (.A 984), .split, (.A 480), (.A 552), .split, (.A 480), (.A 552), .split, .split, (.A 557), (.A 48), .split, (.A 552), .split, .split, (.A 480), (.A 552), (.D 3), .split, .split, (.A 48), .split, .split, .split, (.A 48), .split, .split, (.A 912), .split, (.A 48), (.A 912), (.A 48), (.A 48), (.A 48), (.A 48), .split, .split, .split, .split, (.A 552), .split, .split, .split, (.A 552), .split, (.A 984), (.A 552), (.A 552), (.A 552), (.A 552), (.A 552), .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), (.A 984), .split, (.A 480), (.A 552), (.A 912), .split, (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984), .split, (.A 1056), (.A 912), .split, (.A 984), (.A 1056), .split, .split, (.A 480), .split, .split, (.A 48), (.D 11), (.D 11), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF019_6 : wsegOk P nbF019 kF019_6 tF019_6 kF019_7 = true := by decide +kernel

end PackLean.D31.Oct
