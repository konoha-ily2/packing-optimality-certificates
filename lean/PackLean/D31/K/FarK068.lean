-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 44（受理 177・捨てた 32・L 0）、区間 3。 -/
def nbF044 : NBox := ⟨33554432, 469762048, 67108864, 536870912⟩

def kF044_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF044_1 : List RBox := [⟨0, 0, -16777216, -8388608, 8388608, -8388608, 0⟩, ⟨0, 0, -8388608, -16777216, 8388608, 0, 0⟩, ⟨0, 8388608, -16777216, -16777216, 16777216, 0, 0⟩, ⟨0, 16777216, -33554432, -33554432, 33554432, 0, 0⟩, ⟨0, 33554432, -67108864, -67108864, 67108864, 0, 0⟩, ⟨0, 67108864, -134217728, -134217728, 134217728, 0, 0⟩, ⟨0, 134217728, -268435456, -268435456, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF044_2 : List RBox := [⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF044_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF044_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), (.A 134), (.A 62), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, (.A 62), .split, .split, (.A 60), (.A 708), (.A 60), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, (.A 62), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 926), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, .split, .split, (.A 566), (.A 137), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, .split, (.A 1001)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF044_0 : wsegOk P nbF044 kF044_0 tF044_0 kF044_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF044_1 : List Tok := [.split, (.A 929), .split, (.A 137), (.A 1001), (.A 983), (.A 989), (.A 125), (.A 125), (.A 125), .split, (.A 125), .split, (.A 551), (.A 125), .split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), (.A 978), (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 546), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 48), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 120), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 125), (.A 48), (.A 984), .split, (.A 120), .split, (.A 552), .split, (.A 120), (.D 3), .split, .split, (.A 48), (.A 912), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF044_1 : wsegOk P nbF044 kF044_1 tF044_1 kF044_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF044_2 : List Tok := [(.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF044_2 : wsegOk P nbF044 kF044_2 tF044_2 kF044_3 = true := by decide +kernel

/-- 遠方：n の箱 45（受理 177・捨てた 32・L 0）、区間 3。 -/
def nbF045 : NBox := ⟨67108864, 402653184, 134217728, 469762048⟩

def kF045_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF045_1 : List RBox := [⟨0, 134217728, -268435456, -268435456, 268435456, 0, 0⟩, ⟨0, 268435456, -536870912, -536870912, 536870912, 0, 0⟩, ⟨0, 536870912, -1073741824, -1073741824, 1073741824, 0, 0⟩, ⟨0, 0, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF045_2 : List RBox := [⟨0, 0, 0, 536870912, 536870912, 536870912, 1073741824⟩, ⟨0, 0, 536870912, 0, 536870912, 1073741824, 1073741824⟩, ⟨0, 536870912, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF045_3 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF045_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), (.A 134), (.A 62), .split, .split, (.A 1070), (.A 1070), (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, (.A 206), .split, (.A 134), .split, (.A 998), .split, .split, .split, (.A 926), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, (.A 62), (.A 62), .split, .split, (.A 60), (.A 708), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 62), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), .split, (.A 926), (.A 60), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.A 60), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, .split, (.A 1068), (.A 1050), .split, .split, .split, (.A 1068), .split, .split, (.A 1050), (.A 1056), (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, .split, .split, .split, (.A 566), (.A 137), (.A 980), (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, .split, (.A 137), .split, (.A 983), .split, .split, .split, (.A 1001), .split, (.A 929), (.A 1001), (.A 983), (.A 989), (.A 125), (.A 125)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF045_0 : wsegOk P nbF045 kF045_0 tF045_0 kF045_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF045_1 : List Tok := [.split, .split, (.A 551), (.A 125), .split, (.A 551), (.A 125), .split, .split, (.A 551), .split, (.A 125), (.A 557), .split, (.A 551), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 125), (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, (.A 53), (.A 53), (.A 53), .split, (.A 53), .split, .split, (.A 53), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, .split, .split, (.A 980), (.A 978), (.A 980), .split, .split, (.A 551), .split, .split, .split, (.A 551), (.A 989), (.A 983), (.A 551), (.A 546), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 125), (.A 48), (.A 984), (.A 120), .split, (.A 912), (.A 48), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, .split, (.A 120), (.A 557), (.A 48), .split, (.A 552), .split, (.A 984), (.A 984), .split, (.A 120), .split, (.A 552), .split, .split, .split, (.A 552), (.A 48), (.A 552), (.D 3), .split, .split, (.A 48), (.A 912), (.A 48), .split, .split, (.A 984), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 912), (.A 984)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF045_1 : wsegOk P nbF045 kF045_1 tF045_1 kF045_2 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF045_2 : List Tok := [(.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF045_2 : wsegOk P nbF045 kF045_2 tF045_2 kF045_3 = true := by decide +kernel

end PackLean.D31.Oct
