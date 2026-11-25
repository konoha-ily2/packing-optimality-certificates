-- 自動で書き出したもの（lean/tools/export_d31.py --kfar）。手で直さない。
import PackLean.D31.Data
import PackLean.D31.FarSeg

namespace PackLean.D31.Oct
open PackLean.D31

/-- 遠方：n の箱 61（受理 144・捨てた 32・L 0）、区間 2。 -/
def nbF061 : NBox := ⟨335544320, 134217728, 402653184, 201326592⟩

def kF061_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF061_1 : List RBox := [⟨0, 134217728, -134217728, 0, 268435456, 0, 268435456⟩, ⟨0, 0, -268435456, 268435456, 268435456, 0, 536870912⟩, ⟨0, 268435456, -536870912, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF061_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF061_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 1070), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 1070), (.A 62), (.A 1070), .split, .split, .split, (.A 134), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, .split, .split, .split, .split, (.A 926), (.A 62), (.A 1070), (.A 998), (.A 62), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), .split, .split, (.A 926), .split, (.A 62), (.A 926), (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, .split, (.A 60), (.A 924), .split, (.A 60), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 917), (.A 53), .split, (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF061_0 : wsegOk P nbF061 kF061_0 tF061_0 kF061_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF061_1 : List Tok := [.split, .split, .split, (.A 53), .split, (.A 989), (.A 53), .split, (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, .split, (.A 485), (.A 557), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, (.A 980), .split, (.A 551), (.A 546), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, (.A 984), .split, .split, (.A 557), .split, (.A 917), (.A 557), (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), .split, .split, (.A 48), (.A 912), .split, (.A 48), (.A 480), .split, (.A 552), .split, (.A 984), .split, (.A 480), (.A 552), .split, .split, (.A 557), (.A 480), (.A 552), .split, (.A 912), .split, (.A 48), .split, (.A 480), (.A 48), .split, .split, (.A 552), (.A 552), .split, .split, (.A 912), (.A 1056), .split, (.A 480), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF061_1 : wsegOk P nbF061 kF061_1 tF061_1 kF061_2 = true := by decide +kernel

/-- 遠方：n の箱 62（受理 130・捨てた 32・L 0）、区間 2。 -/
def nbF062 : NBox := ⟨335544320, 201326592, 402653184, 268435456⟩

def kF062_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF062_1 : List RBox := [⟨0, 268435456, -268435456, 0, 536870912, 0, 536870912⟩, ⟨0, 0, -536870912, 536870912, 536870912, 0, 1073741824⟩, ⟨0, 536870912, -1073741824, 0, 1073741824, 0, 1073741824⟩, ⟨0, 0, 0, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF062_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF062_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), (.A 206), .split, (.A 134), .split, .split, (.A 1070), (.A 998), .split, (.A 206), (.A 134), (.A 62), .split, (.A 1070), .split, .split, (.A 62), (.A 1070), .split, .split, (.A 206), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, .split, .split, .split, (.A 62), (.A 1070), (.A 998), (.A 62), (.A 1070), .split, .split, (.A 134), .split, (.A 62), .split, (.A 65), .split, (.A 134), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), .split, .split, .split, (.A 62), (.A 926), .split, (.A 62), (.A 924), .split, .split, (.A 60), (.A 708), .split, (.A 60), (.A 924), .split, (.A 65), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), .split, .split, (.A 1052), (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, .split, (.A 1056), (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), (.A 137), .split, (.A 551), .split, .split, (.A 137), .split, (.A 983), .split, (.A 1001), (.A 989), .split, (.A 557), .split, (.A 551), (.A 557), .split, (.A 557), (.A 551), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 917), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), (.A 125), (.A 53), (.A 53), .split, (.A 53)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF062_0 : wsegOk P nbF062 kF062_0 tF062_0 kF062_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF062_1 : List Tok := [.split, .split, .split, (.A 53), .split, (.A 125), (.A 53), .split, (.A 53), .split, (.A 557), (.A 53), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 980), .split, (.A 980), .split, .split, (.A 551), .split, (.A 983), (.A 551), (.A 978), (.A 980), .split, (.A 551), (.A 546), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, (.A 984), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, .split, (.A 557), .split, (.A 912), .split, (.A 48), (.A 480), .split, (.A 552), (.A 984), .split, .split, (.A 557), (.A 480), (.A 552), .split, (.A 912), .split, (.A 48), (.A 912), .split, .split, (.A 552), (.A 552), .split, .split, (.A 912), (.A 1056), .split, .split, (.A 480), (.A 912), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF062_1 : wsegOk P nbF062 kF062_1 tF062_1 kF062_2 = true := by decide +kernel

/-- 遠方：n の箱 63（受理 123・捨てた 33・L 0）、区間 2。 -/
def nbF063 : NBox := ⟨402653184, 0, 469762048, 67108864⟩

def kF063_0 : List RBox := rRoots P.den

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF063_1 : List RBox := [⟨0, 0, 268435456, -536870912, 268435456, 536870912, 0⟩, ⟨0, 268435456, 0, -536870912, 536870912, 536870912, 0⟩, ⟨0, 0, 536870912, -1073741824, 536870912, 1073741824, 0⟩, ⟨0, 536870912, 0, -1073741824, 1073741824, 1073741824, 0⟩, ⟨0, 0, 0, 0, 1073741824, 1073741824, 1073741824⟩, ⟨1, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨2, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩, ⟨3, -1073741824, -1073741824, -1073741824, 1073741824, 1073741824, 1073741824⟩]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def kF063_2 : List RBox := []

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF063_0 : List Tok := [.split, .split, .split, .split, (.D 4), .split, (.D 19), .split, (.D 9), .split, .split, .split, .split, .split, .split, (.D 15), (.A 62), .split, (.A 1070), .split, (.D 4), .split, (.A 62), (.A 1070), .split, (.A 134), .split, .split, (.A 1070), (.A 998), .split, (.A 206), (.A 998), (.A 62), .split, (.A 1070), .split, .split, (.A 926), (.A 1070), .split, (.A 926), (.A 1070), .split, .split, .split, .split, (.A 134), (.A 998), (.A 566), .split, .split, (.A 62), .split, .split, (.A 62), (.A 134), (.A 62), .split, .split, (.A 134), (.A 65), (.A 134), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), .split, .split, (.A 62), (.A 926), .split, (.A 65), .split, (.A 998), (.A 65), .split, (.A 998), .split, .split, (.A 926), (.A 1070), .split, .split, (.A 998), (.A 926), (.A 998), .split, (.D 4), .split, (.D 19), .split, .split, .split, (.A 62), (.A 924), .split, (.A 65), .split, .split, (.A 926), .split, (.A 65), (.A 924), (.A 60), (.D 8), .split, .split, (.D 4), .split, .split, (.D 9), .split, (.A 1052), (.A 1052), (.D 21), .split, (.D 4), .split, .split, .split, (.A 1068), .split, (.A 1056), (.A 1056), (.D 8), (.D 21), .split, .split, .split, .split, (.D 19), .split, (.D 9), .split, .split, .split, (.A 569), .split, (.A 137), (.A 557), .split, (.A 551), .split, .split, .split, (.A 569), (.A 137), (.A 983), (.A 557), (.A 557), (.D 3), .split, .split, (.D 19), .split, .split, .split, (.A 53), .split, .split, .split, (.A 53), (.A 917), .split, (.A 53), .split, (.A 485), (.A 53), (.A 53), .split, (.A 53), .split, .split, .split, (.A 53), .split, (.A 557), (.A 53), .split, (.A 53), (.A 485), (.A 53), (.D 8), (.D 3), .split, .split, .split, .split, (.D 9), .split, .split, .split, (.A 548), .split, (.A 980), .split, (.A 551), (.A 546)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF063_0 : wsegOk P nbF063 kF063_0 tF063_0 kF063_1 = true := by decide +kernel

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
def tF063_1 : List Tok := [(.A 980), (.A 551), (.D 21), (.D 3), .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, .split, (.A 912), (.A 1056), (.A 984), (.A 912), (.A 1056), .split, .split, .split, .split, .split, (.A 989), (.A 912), (.A 984), .split, .split, (.A 557), (.A 485), (.A 552), (.A 912), (.A 984), (.A 912), .split, .split, (.A 1056), (.A 984), (.A 1056), .split, .split, .split, .split, (.A 480), .split, (.A 552), .split, .split, (.A 480), (.A 552), (.A 552), .split, .split, (.A 557), (.A 480), (.A 552), .split, (.A 912), .split, (.A 48), .split, (.A 480), (.A 48), .split, (.A 552), .split, .split, .split, .split, .split, (.A 912), (.A 1056), .split, (.A 480), .split, (.A 552), (.A 912), .split, (.A 1056), (.A 912), .split, .split, (.A 1056), (.A 552), (.A 1056), .split, (.A 480), .split, (.A 552), (.D 11), (.D 8), (.D 21), (.D 3), .split, (.D 4), (.D 3), .split, (.D 19), (.D 21), .split, (.D 9), (.D 8)]

set_option maxRecDepth 100000 in
set_option maxHeartbeats 0 in
theorem sF063_1 : wsegOk P nbF063 kF063_1 tF063_1 kF063_2 = true := by decide +kernel

end PackLean.D31.Oct
